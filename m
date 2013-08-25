Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail7.windriver.com (mail7.windriver.com [128.224.252.3])
	by mail.openembedded.org (Postfix) with ESMTP id 3632561AA9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Aug 2013 05:16:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail7.windriver.com (8.14.5/8.14.3) with ESMTP id r7P5Gkq5008545
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 25 Aug 2013 01:16:47 -0400 (EDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Sat, 24 Aug 2013 22:16:46 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sun, 25 Aug 2013 01:16:32 -0400
Message-ID: <cover.1377405083.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [v2 PATCH 0/7] linux-yocto: consolidated pull request
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 25 Aug 2013 05:16:52 -0000
Content-Type: text/plain

Richard/Saul,

I managed to find enough time to turn around some fixes ..

This series completely replaces the one that I had sent before. It fixes
the two issues that Saul reported: a patch issue with the 3.8 arm BSPs
and the ptrace.h related build failures from the 3.10 libc-headers

Changes since v1:

  - Fixed the strace build issue with eglibc's ptrace and the kernel's
    ptrace conflicting
  - Remove the linux-yocto-3.8 recipes, since the routerstation pro is
    now bumped to 3.10.
  - updated kern tools commit to fix the 3.8 patching issues

Take a special look at the eglibc patch. It does work, and passed a full
build here. It also protects anyone using a new kernel, and not just 
linux-yocto users. I don't normally patch c libraries .. but I made an
exception this time :)

Cheers,

Bruce

The original email follows:

-------------   

Here's my consolidated set of changes that represent the biggest chunk
of work for the Yocto 1.5 release. The obvious change is that the 3.10
kernel is now the latest linux-yocto kernel (and linux-yocto-dev will
mark on). I've built and booted core-image-sato for all the oe-core
qemu machines.

3.10 also the latest LTSI and will be updated with that content when it
becomes available.

Other features of the 3.10 kernel include:

  - refreshed -rt support
  - refreshed yaffs2, aufs3
  - cryptodev
  - bfs, edf, and OCF staged features
  - scrubbed and updated meta data for v3.10
  - improved tools support for meta data updates and queue maintenance
  - patch carry forward from all previous linux-yocto kernels and
    configuration.

I've also tested linux-yocto-rt and linux-yocto-tiny for the new, shiny tree.

I've also bumped the linux-libc-headers to 3.10 and have fixed gst-plugins-good
to adapt to a changed #define in the exported headers.

Other parts of this update include an uprev of guilt, and in fact, a 
restoration of "normal" guil operations, since the kernel tree is now
manipulated and maintained via a smaller, more contained script. This
was necessary for both usability reasons and the fact that all of guilts
protections were being removed for the kernel's use .. which makes you
ask the quesetion "why use it". It was time for a change.

The patches are pretty self explanitory and all contain detailed long
logs .. but the summary is:

   [PATCH 1/5] kern-tools: usability, bug fixes and no guilt  
   [PATCH 2/5] guilt: update to latest git version
   [PATCH 3/5] linux-libc-headers: update to v3.10
   [PATCH 4/5] gst-plugins-good: fix 3.10 libc-headers build failure
   [PATCH 5/5] linux-yocto: introduce v3.10

** There is one pending activity. As part of thsi update to 3.10, we want
to move to the 3.4 and 3.10 kernel, dropping 3.8 support. But the 
routerstationpro BSP is still using it as its preferred version. I'm
a one man show on this update, and I wasn't able to get the 100+ patches
ported to 3.10 AND get this update out before the M4 cutoff.

** I'm still attempting to udpate all the reference boards, and
once done, I'll send a follow up patch.

** Please test, I've done my best, but things can slip through. We'll
work issues in the stabilization period.

Cheers,

Bruce

The following changes since commit b467b99a5d25efe5eadfb07dbecba608575256ac:

  linux-yocto: switch genericx86 to use common-pc (2013-08-24 09:37:49 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (7):
  kern-tools: usability, bug fixes and no guilt
  guilt: update to latest git version
  linux-libc-headers: update to v3.10
  eglibc: ptrace: protect ptrace_peeksiginfo_args from redefintion
  gst-plugins-good: fix 3.10 libc-headers build failure
  linux-yocto: introduce v3.10
  linux-yocto: remove 3.8 recipes

 meta/classes/kernel-yocto.bbclass                  |    2 +
 meta/conf/distro/include/tcmode-default.inc        |    2 +-
 ...ect-ptrace_peeksiginfo_args-from-redefint.patch |   55 ++++
 meta/recipes-core/eglibc/eglibc_2.18.bb            |    1 +
 .../guilt/files/guilt-import-commit.patch          |   96 ------
 meta/recipes-devtools/guilt/files/guilt-init.patch |   25 --
 meta/recipes-devtools/guilt/files/guilt-pop.patch  |   73 -----
 .../guilt/files/guilt-push-no-series.patch         |   29 --
 meta/recipes-devtools/guilt/files/guilt-push.patch |   42 ---
 .../guilt/files/guilt-set-git_exec_path.patch      |   29 --
 ...lt-update-supported-git-versions-to-1.8.x.patch |   28 --
 meta/recipes-devtools/guilt/files/guilt.patch      |  319 --------------------
 .../guilt/files/improve_auto_header_gen.patch      |   71 -----
 .../files/make_git_commands_conditional.patch      |   48 ---
 .../guilt/files/optional_head_check.patch          |   60 ----
 .../guilt/files/uninstall_force.patch              |   14 -
 .../{guilt-native_0.33.bb => guilt-native_git.bb}  |   21 +-
 .../kern-tools/kern-tools-native_git.bb            |    6 +-
 .../linux-libc-headers/linux-libc-headers_3.10.bb  |    7 +
 .../linux-libc-headers/linux-libc-headers_3.8.bb   |    8 -
 ...inux-yocto-rt_3.8.bb => linux-yocto-rt_3.10.bb} |   16 +-
 ...-yocto-tiny_3.8.bb => linux-yocto-tiny_3.10.bb} |    9 +-
 .../{linux-yocto_3.8.bb => linux-yocto_3.10.bb}    |   21 +-
 ...define-V4L2_CID_HCENTER-and-V4L2_CID_VCEN.patch |   45 +++
 .../gstreamer/gst-plugins-good_0.10.31.bb          |    1 +
 25 files changed, 143 insertions(+), 885 deletions(-)
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.18/0001-ptrace-protect-ptrace_peeksiginfo_args-from-redefint.patch
 delete mode 100644 meta/recipes-devtools/guilt/files/guilt-import-commit.patch
 delete mode 100644 meta/recipes-devtools/guilt/files/guilt-init.patch
 delete mode 100644 meta/recipes-devtools/guilt/files/guilt-pop.patch
 delete mode 100644 meta/recipes-devtools/guilt/files/guilt-push-no-series.patch
 delete mode 100644 meta/recipes-devtools/guilt/files/guilt-push.patch
 delete mode 100644 meta/recipes-devtools/guilt/files/guilt-set-git_exec_path.patch
 delete mode 100644 meta/recipes-devtools/guilt/files/guilt-update-supported-git-versions-to-1.8.x.patch
 delete mode 100644 meta/recipes-devtools/guilt/files/guilt.patch
 delete mode 100644 meta/recipes-devtools/guilt/files/improve_auto_header_gen.patch
 delete mode 100644 meta/recipes-devtools/guilt/files/make_git_commands_conditional.patch
 delete mode 100644 meta/recipes-devtools/guilt/files/optional_head_check.patch
 delete mode 100644 meta/recipes-devtools/guilt/files/uninstall_force.patch
 rename meta/recipes-devtools/guilt/{guilt-native_0.33.bb => guilt-native_git.bb} (45%)
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.10.bb
 delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.8.bb
 rename meta/recipes-kernel/linux/{linux-yocto-rt_3.8.bb => linux-yocto-rt_3.10.bb} (68%)
 rename meta/recipes-kernel/linux/{linux-yocto-tiny_3.8.bb => linux-yocto-tiny_3.10.bb} (56%)
 rename meta/recipes-kernel/linux/{linux-yocto_3.8.bb => linux-yocto_3.10.bb} (45%)
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-plugins-good-0.10.31/0001-v4l2_calls-define-V4L2_CID_HCENTER-and-V4L2_CID_VCEN.patch

-- 
1.7.10.4


