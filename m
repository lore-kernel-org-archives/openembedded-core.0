Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1Tw4bY-0000Rd-Ni
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Jan 2013 06:35:15 +0100
Received: from yow-bashfiel-d3.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0I5JaTB006246;
	Thu, 17 Jan 2013 21:19:37 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Fri, 18 Jan 2013 00:19:25 -0500
Message-Id: <cover.1358485481.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
Cc: linux-yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: [PATCH 0/7] kernel-yocto/tools: consolidated pull request
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
X-List-Received-Date: Fri, 18 Jan 2013 05:35:16 -0000

Richard/Saul,

Here's a collection of bug fixes and changes that I was able to get ready
and be comfortable with for 1.4 M3. The series contains some minor tweaks,
some configuration updates, minor tools updates and the introduction of
LTSI 3.4 content to the linux-yocto-3.4 tree (and BSPs).

Here's the breakdown of the changes:

[PATCH 1/7] kernel-yocto: remove unnecessary non-bare warning

  In the past working from a non-bare clone would cause problems,
  due to branches not existing in the WORKDIR clone. This hasn't
  been true for some time, since the routines which convert remotes
  into local branches have been functioning without problems.

  So we no longer need the warning and it can be removed.

  This cleans up the output and removes a potentially alarming warning ..
  that shouldn't be alarming anymore.

[PATCH 2/7] linux-yocto: normalize repository naming and SRC_URI options

  linux-yocto-tiny and linux-yocto had minor differences from the rest
  of the linux-yocto recipes. After this commit, all the recipes are
  using bareclone=1 and repository names that end with .git.

[PATCH 3/7] kernel-yocto: add KBUILD_OUTPUT to OE_TERMINAL_EXPORTS

  Since linux-yocto based recipes have a split build and source directory,
  we should export KBUILD=${B} to the devshell. This allows the kernel to
  be incrementally build within the shell and not dirty the source
  directory (which breaks subsequent full builds).

  This was discussed on the mailing lists in December and has been working
  locally for me ever since.

[PATCH 4/7] linux-yocto/meta: update include statements to explicit .scc format

  The kernel tooling can support a "shorthand" method of including other features
  that doesn't require the full filename ending in .scc. This format is confusing
  when compared to the source tree, and is inconsitently use. This commit updates
  all shorthand includes to a full "include <foo>.scc" format.

  This addresses [YOCTO #3418].

[PATCH 5/7] linux-yocto/routerstationpro: enable GPIO_SYSFS

  We had a request to enable GPIO_SYSFS to allow easy use of the available
  GPIOs in the board out of the box. This is a simple / contained config item
  to enable, so there's no reason not to.

  This addresses [YOCTO #3519]

[PATCH 6/7] linux-yocto/3.4: integrate LTSI-3.4

  Updating the linux-yocto-3.4 SRCREVS to activate the merge of the 3.4.25-ltsi
  tree:

     http://git.linuxfoundation.org/?p=ltsi-kernel.git;a=tag;h=refs/tags/v3.4.25-ltsi

  The pristine patch queue can be seen on the "ltsi" branch in the repository.
  This branch has been merged into the standard/base branch of linux-yocto-3.4
  and to all BSP branches in the tree.

  LTSI based BSPs or features are not activated as part of this commit, they
  are controlled by the meta branch of the kernel repository and are activated
  in separate patches.

  This addresses [YOCTO #2396]. 

  Notes:

    - I've built and booted standard and preempt-rt qemu BSPs for all archs
    - I've built the hardware reference BSPs
    - I've built selected meta-intel BSPs
    
    - There may be some fallout from this, but the changes look good and are
      largely orthogonal to the rest of the changes in the tree. This makes
      the significant source changes for M3, and I'll follow up shortly with
      a ltsi feature fragment and kernel type for pure-ltsi based testing.

[PATCH 7/7] guilt: add git 1.8.x support

  Updating guilt to allow git 1.8.x as a supported version. This version has
  no impact on other functionality within the scripts, so no other adjustments
  are necessary.

  This addresses [YOCTO #3275]

Cheers,

Bruce


The following changes since commit 3db277b18b8923daca545aa53bcfbbe9d43d3baa:

  update-rc.d: fix failure on target (2013-01-17 20:16:46 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (7):
  kernel-yocto: remove unnecessary non-bare warning
  linux-yocto: normalize repository naming and SRC_URI options
  kernel-yocto: add KBUILD_OUTPUT to OE_TERMINAL_EXPORTS
  linux-yocto/meta: update include statements to explicit .scc format
  linux-yocto/routerstationpro: enable GPIO_SYSFS
  linux-yocto/3.4: integrate LTSI-3.4
  guilt: add git 1.8.x support

 meta/classes/kernel-yocto.bbclass                  |    9 +++----
 ...lt-update-supported-git-versions-to-1.8.x.patch |   28 ++++++++++++++++++++
 meta/recipes-devtools/guilt/guilt-native_0.33.bb   |    3 ++-
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb    |    6 ++---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb  |    6 ++---
 meta/recipes-kernel/linux/linux-yocto_3.4.bb       |   18 ++++++-------
 6 files changed, 48 insertions(+), 22 deletions(-)
 create mode 100644 meta/recipes-devtools/guilt/files/guilt-update-supported-git-versions-to-1.8.x.patch

-- 
1.7.10.4



