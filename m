Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1UAZTt-0000Sy-20
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 06:23:10 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1R56f7E025892
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 26 Feb 2013 21:06:41 -0800 (PST)
Received: from yow-bashfiel-d3.corp.ad.wrs.com (128.224.145.220) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.328.9; Tue, 26 Feb 2013 21:06:41 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 27 Feb 2013 00:06:32 -0500
Message-ID: <cover.1361940628.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Cc: linux-yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: [PATCH 0/8] kernel-yocto: consolidated pull request (v3.8 and more)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Feb 2013 05:23:26 -0000
Content-Type: text/plain

Richard/Saul,

Here's the queue of patches that I've been testing for quite some time, with the
introduction of the 3.8 kernel recipe being the "newest" at about a week old. I
mention the age of the commits, just to point out that I've been building and
working with them in my tree for a while, with no major issues.

The 3.8 kernel tree has been build and boot tested with the core-image-sato for
all qemu machines. Many hours were spent over the past two days nailing down
a late 3.8-rc breakage in the arm versatile (qemuarm), but that is solved now
and tested. The changes will eventually make it upstream, but I'm carrying the
fixes on the BSP branch for now.

That being said, I'd want to see this go through a bit of testing before it
appears in any other branches .. since there really is only so much testing 
that I can do myself. If certain boards have issues, we'll simply hold them
back at the 3.4 kernel (which is where the hardware refernce BSPs will stay
for now, until they can be checked).

 - patches 1-3 are bugs and workflow updates
 - patches 4-8 are required for the v3.8 kernel introduction

Without further rambling, here are the patch descriptions and commentary:

[PATCH 1/8] kernel-yocto: respect SRC_URI modified branch selection

    Although the setting of KBRANCH is the suggested/primary way to interact with
    the yocto kern-tools and the fetcher, some users may be more comfortable
    modifying the SRC_URI branch parameter directly.

    If they do, the tools will not force their branch and build output will be
    different then they expect, in non obvious ways.

    It's easy enough to detect this scenario, but checking the SRC_URI in the
    same way that the git fetcher checks for the branch (and SRCREV). If we take
    the value from the SRC_URI and use it directly in the patch/validate/update
    routines, we'll stay consistent with KBRANCH if it is used, and also
    automatically adapt to a manually changed branch parameter on the SRC_URI.

    For all other users, there are no visible or behavioural changes as a result
    of this change

    Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>

[PATCH 2/8] kernel-yocto: allow building from fetcher source dir

    The linux-yocto recipes themselves always set S="${WORKDIR}/linux" and
    arrange for the fetcher default of ${WORKDIR}/git to be renamed before
    building.

    Part of this rename involves an assumption that the directory used by
    the fetcher can be removed as part of the renaming process, or in fact
    that renaming is required.

    If a derived recipe uses S="${WORKDIR}/git", the checkout phase fails
    since the kernel source is removed as part of the processing.

    To fix this the code now detects this situation and does not clean the
    source directory before renaming the fetcher default (and in fact does
    not rename it at all).

    Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>

[PATCH 3/8] linux-yocto/3.4: remove cedartrail machine

    The cedartrail BSP is no longer support from yocto 1.4, so we remove
    it from the tree.

    Signed-off-by: Kishore Bodke <kishore.k.bodke@intel.com>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>


[PATCH 4/8] v86d: compile against userspace safe kernel headers

    v86d was building directly against the staged kernel in the target
    sysroot. This has been fine in the past, but with recent (3.7) changes
    to user headers into the "uapi" include structure, there are no longer

    Without the preprocesor protection, v86d fails to build against any
    kernel with uapi header files.

    v86d doesn't actually need the whole kernel tree, the exported headers
    are enough to build a working binary. This change sets the v86d variable
    to ${STAGING_DIR_HOST}/usr, and once the v86d build adds "include" to the
    end of KDIR, we have a valid include path to the target sysroot headers.

    This also works for pre-uapi kernel headers, so the change is safe for
    most (if not all) kernel's with properly exported headers.

    Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>

[PATCH 5/8] kern-tools: import configuration, controls and audit updates

    Updating the kern-tools SRCREV to import the following fixes:

      commit 7f91d198d32fc90260e52724ef4aac0b997c1e8b

	kconf_check: fix new Kconfig detection

	One of the functions of the kernel configuration audit is to notify
	the user if Kconfig* files have been removed from the kernel, and
	also to notify of new Kconfig files.

	New Kconfig files should be classified as hardware or non-hardware to
	allow BSP audits to notify if boards are setting values that they
	shouldn't, hence why notifying about new "buckets" is important.

      commit c4f26a3296e0e1c3dbdd5ec8e2947d5443a9ffc2

	updateme/scc: allow config fragment exclusion

	It is common to need the features (patches, git operations) of a
	branch, but not want the kernel configuration fragments of a given
	branch. To allow this, we provide a new include flag "nocfg".

	When this flag is used, all of the configuration fragments included
	by the targetted feature will not be applied to the current build,
	with one exception, a base/critical fragment can force it's config
	values, since without them, the system would not be functional.

	Example:

	   include ktypes/standard/standard.scc nocfg

      commit c7ec19d55aca6c4b17073c5362fce5be61a89d82

	scc: wrap git merge

	To allow for parameter validation and sanity checking, wrap "git merge"
	as a dedicated "merge" command instead of using the raw git fallback.

	This also makes it consistent with existing top level commands such
	as  'tag', 'branch', 'patch', etc.

	There are no changes to arguments, and existing 'git merge' commands
	continue to work with this change.

    [YOCTO #3419]
    [YOCTO #3421]

[PATCH 6/8] linux-yocto: remove 3.0 linux-yocto recipes

    With the introduction of the 3.8 linux-yocto recipes, we remove
    the 3.0 variant.

    Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>

[PATCH 7/8] linux-libc-headers: update to v3.8

    Now that the 3.8 kernel has been released we can bump the libc-headers
    to that version and remove the 3.7 variant. Userspace compatibility is
    maintained through kernel versions, we also make the single 3.8 version
    the toolchain default.

    Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>

[PATCH 8/8] linux-yocto: introduce 3.8 kernel recipe

    Introducing the linux-yocto 3.8 kernel recipe. The tools and branch structure
    of this tree are the same as the previous linux-yocto recipes, while the meta
    data and content have been updated for the 3.8 kernel.

    build and boot tested for qemu*.

    Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>

Cheers,

Bruce

The following changes since commit d7b248e715d99766bf8602ff9f038f8b0afa5e78:

  augeas: change SRC_URI (2013-02-26 08:02:29 -0800)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (8):
  kernel-yocto: respect SRC_URI modified branch selection
  kernel-yocto: allow building from fetcher source dir
  linux-yocto/3.4: remove cedartrail machine
  v86d: compile against userspace safe kernel headers
  kern-tools: import configuration, controls and audit updates
  linux-yocto: remove 3.0 linux-yocto recipes
  linux-libc-headers: update to v3.8
  linux-yocto: introduce 3.8 kernel recipe

 meta/classes/kernel-yocto.bbclass                  |  109 +++++++++++---------
 meta/conf/distro/include/tcmode-default.inc        |    2 +-
 meta/recipes-bsp/v86d/v86d_0.1.10.bb               |    2 +-
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 ...bc-headers_3.7.bb => linux-libc-headers_3.8.bb} |    6 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb    |   28 -----
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb    |    2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb  |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.0.bb       |   33 ------
 meta/recipes-kernel/linux/linux-yocto_3.4.bb       |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.8.bb       |   30 ++++++
 11 files changed, 99 insertions(+), 119 deletions(-)
 rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_3.7.bb => linux-libc-headers_3.8.bb} (42%)
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto_3.0.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto_3.8.bb

-- 
1.7.10.4



