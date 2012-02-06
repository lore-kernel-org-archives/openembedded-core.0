Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RuIOB-0004BP-VD
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Feb 2012 07:49:24 +0100
Received: by pbbb4 with SMTP id b4so4117399pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Feb 2012 22:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=g+LRa5WL58gQtL09sWOOOFJTeSh0dN8ZVXpgFfwMgFw=;
	b=vrgRIw+zdmkPg2cuevng4++GSjWuX+wvO9f8f5+7fSN0fX4/zFXrVSP1Hzy+33uiC9
	gUbOfFSU2G8+jwqPZ0mwi3KX/4elYd68lpnGCgBq489f47stsE6QePvAxrBWblED9lCj
	IH/JY5PPsS61nctluP/buoIF+IPHlG7RbPwXc=
Received: by 10.68.209.6 with SMTP id mi6mr44618831pbc.87.1328510482361;
	Sun, 05 Feb 2012 22:41:22 -0800 (PST)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id z5sm37031634pbc.5.2012.02.05.22.41.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 05 Feb 2012 22:41:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  5 Feb 2012 22:40:20 -0800
Message-Id: <cover.1328510187.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH V2 00/20] uclibc upgrade, initial kmod and thumb tune
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Feb 2012 06:49:24 -0000

I have added few more patches on top

Renaming POKY to CORE-IMAGE
Adding yp.org as fallback mirror for oe-core 
build fixes needed to get going on ubuntu 12.04

All qemu core-image-sato builds (from scratch) and boots on both eglibc/uclibc
with this set

The following changes since commit 18d9fcfc4bc4b01f73e89f3b988c9d3d543c7705:

  libzypp: add missing runtime dependences on gzip and gnupg (2012-02-03 17:23:28 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib kraj/misc
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/misc

Khem Raj (20):
  task-core-tools: Divide it into 3 recipes
  Enable options needed for ltp to compile
  arm/tune: Correct the logic which added thumb-interwork to OVERRIDES
  tunearch/arm: Differentiate between thumb code generation and thumb
    capability
  tune-thumb.inc: Delete
  uclibc: Get the thumb features from tune flags
  kmod: Add recipes
  module-init-tools: Delete
  image.bbclass,kernel.bbclass: Use kmod-native instead of
    module-init-tools-cross
  pseudo: Wrap renameat and opendir
  uclibc: Upgrade recipes from 0.9.32 -> 0.9.33
  zlib: Upgrade 1.2.5 -> 1.2.6
  runqemu-internal: qemuarm can handle 256M
  gconf,consolekit: Avoid polkit when compiling with uclibc
  python: Fix build failure of python-elementtree on x86_64
  libdrm: Fix build failure unearthed by uclibc
  classes,recipes: Replace POKY_* with CORE_IMAGE_*
  libx11: Backport _XGetRequest API
  gcc-cross-testing: Fix evaluation of user and target name
  mirrors.bbclass: Add yp.org and oe.org to fallback mirrors

 meta/classes/core-image.bbclass                    |    8 +-
 meta/classes/image.bbclass                         |    2 +-
 meta/classes/kernel.bbclass                        |    9 +-
 meta/classes/mirrors.bbclass                       |   21 +-
 .../conf/distro/include/distro_tracking_fields.inc |   26 +-
 meta/conf/distro/include/tcmode-default.inc        |    2 +-
 .../conf/machine/include/arm/feature-arm-thumb.inc |   20 +-
 meta/conf/machine/include/tune-strongarm1100.inc   |    4 +-
 meta/conf/machine/include/tune-thumb.inc           |   32 --
 meta/conf/multilib.conf                            |    4 +-
 meta/recipes-core/images/core-image-minimal.bb     |    2 +-
 meta/recipes-core/images/self-hosted-image.bb      |    2 +-
 meta/recipes-core/tasks/task-core-tools-debug.bb   |   26 ++
 ...sk-core-tools.bb => task-core-tools-profile.bb} |   81 +---
 .../recipes-core/tasks/task-core-tools-testapps.bb |   46 ++
 ...rch-Free-UCLIBC_HAS_FPU-setting-from-depe.patch |   29 --
 ...fd.h-SFD_NONBLOCK-for-mips-is-0200-unlike.patch |   33 --
 .../uclibc-0.9.32/detect-bx-availibility.patch     |   75 ----
 .../uclibc/uclibc-0.9.32/epoll-asm-fix.patch       |   25 --
 .../uclibc/uclibc-0.9.32/include-arm-asm.h.patch   |   65 ---
 .../uclibc/uclibc-0.9.32/mount.h-update.patch      |   85 ----
 .../uclibc-0.9.32/remove-eabi-oabi-selection.patch |   91 ----
 .../uclibc-0.9.32/remove-sub-arch-variants.patch   |  215 ---------
 .../uclibc/uclibc-0.9.32/rtld_no.patch             |  215 ---------
 .../uclibc/uclibc-0.9.32/select-force-thumb.patch  |  172 --------
 .../uclibc/uclibc-0.9.32/sync_file_range2.patch    |   47 --
 .../uclibc-0.9.32/transform-eabi-oabi-choice.patch |   71 ---
 .../uclibc-0.9.32/uclibc-arm-ftruncate64.patch     |   13 -
 .../uclibc-0.9.32/uclibc_scheduler_update.patch    |  455 --------------------
 ...rr-and-pass-it-to-INTERNAL_SYSCALL_NCS-so.patch |   32 ++
 ...fstat-Use-64bit-version-of-syscall-if-ava.patch |  177 ++++++++
 .../argp-headers.patch                             |    2 +
 .../argp-support.patch                             |    3 +
 .../compile-arm-fork-with-O2.patch                 |    2 +-
 .../uclibc-0.9.33/define-MSG_CMSG_CLOEXEC.patch    |   25 ++
 meta/recipes-core/uclibc/uclibc-0.9.33/dup3.patch  |   37 ++
 ...so_use_arm_dl_linux_resolve_in_thumb_mode.patch |    6 +
 .../libc_symbols_include_bits_uclibc_config.patch  |   19 +
 .../mips/uClibc.machine                            |    0
 .../orign_path.patch                               |   94 ++--
 .../powerpc_copysignl.patch                        |    6 +
 .../remove_attribute_optimize_Os.patch             |   17 +-
 .../{uclibc-0.9.32 => uclibc-0.9.33}/uClibc.distro |    8 +-
 .../uClibc.machine                                 |    0
 .../uclibc-execvpe.patch                           |    3 +
 .../uclibc_enable_log2_test.patch                  |    5 +
 meta/recipes-core/uclibc/uclibc-config.inc         |    4 +-
 meta/recipes-core/uclibc/uclibc-git/uClibc.distro  |    5 +
 ...-initial_0.9.32.bb => uclibc-initial_0.9.33.bb} |    0
 meta/recipes-core/uclibc/uclibc.inc                |    1 -
 .../uclibc/{uclibc_0.9.32.bb => uclibc_0.9.33.bb}  |   26 +-
 meta/recipes-core/zlib/files/Makefile.am           |    9 -
 meta/recipes-core/zlib/files/configure.ac          |   48 --
 .../zlib/zlib-1.2.5/fix.inverted.LFS.logic.patch   |   20 -
 meta/recipes-core/zlib/zlib_1.2.5.bb               |   41 --
 meta/recipes-core/zlib/zlib_1.2.6.bb               |   26 ++
 meta/recipes-devtools/gcc/gcc-cross.inc            |    6 +-
 meta/recipes-devtools/pseudo/pseudo/opendir.patch  |   92 ++++
 meta/recipes-devtools/pseudo/pseudo/renameat.patch |  227 ++++++++++
 meta/recipes-devtools/pseudo/pseudo_1.2.bb         |    6 +-
 .../python/python/host_include_contamination.patch |   27 ++
 meta/recipes-devtools/python/python_2.7.2.bb       |    3 +-
 meta/recipes-extended/images/core-image-basic.bb   |    2 +-
 meta/recipes-extended/images/core-image-lsb-dev.bb |    2 +-
 meta/recipes-extended/images/core-image-lsb-sdk.bb |    2 +-
 meta/recipes-extended/images/core-image-lsb.bb     |    2 +-
 meta/recipes-gnome/gnome/gconf_3.2.3.bb            |    9 +-
 .../drm/libdrm/GNU_SOURCE_definition.patch         |   30 ++
 meta/recipes-graphics/drm/libdrm_2.4.30.bb         |    6 +-
 meta/recipes-graphics/images/core-image-clutter.bb |    2 +-
 .../images/core-image-gtk-directfb.bb              |    2 +-
 ...quest-as-substitute-for-GetReq-GetReqExtr.patch |  137 ++++++
 meta/recipes-graphics/xorg-lib/libx11_1.4.4.bb     |    3 +
 meta/recipes-kernel/kmod/kmod-native_git.bb        |   14 +
 meta/recipes-kernel/kmod/kmod.inc                  |   31 ++
 meta/recipes-kernel/kmod/kmod/depmod-search.conf   |    6 +
 meta/recipes-kernel/kmod/kmod_git.bb               |   62 +++
 .../module-init-tools/files/disable_man.patch      |   25 --
 .../files/grab_module_memset.patch                 |   21 -
 .../files/modutils_extension.patch                 |   25 --
 .../module-init-tools-cross_3.16.bb                |   10 -
 .../module-init-tools/module-init-tools.inc        |   24 -
 .../module-init-tools/module-init-tools_3.16.bb    |   42 --
 .../files/PD.patch                                 |    0
 .../files/modutils.sh                              |    0
 .../modutils-initscripts.bb                        |    0
 meta/recipes-qt/images/qt4e-demo-image.bb          |    2 +-
 .../recipes-support/consolekit/consolekit_0.4.5.bb |   11 +-
 scripts/runqemu-internal                           |   13 +-
 89 files changed, 1257 insertions(+), 2079 deletions(-)
 delete mode 100644 meta/conf/machine/include/tune-thumb.inc
 create mode 100644 meta/recipes-core/tasks/task-core-tools-debug.bb
 rename meta/recipes-core/tasks/{task-core-tools.bb => task-core-tools-profile.bb} (48%)
 create mode 100644 meta/recipes-core/tasks/task-core-tools-testapps.bb
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/0001-Config.in.arch-Free-UCLIBC_HAS_FPU-setting-from-depe.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/0001-mips-signalfd.h-SFD_NONBLOCK-for-mips-is-0200-unlike.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/detect-bx-availibility.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/epoll-asm-fix.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/include-arm-asm.h.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/mount.h-update.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/remove-eabi-oabi-selection.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/remove-sub-arch-variants.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/rtld_no.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/select-force-thumb.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/sync_file_range2.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/transform-eabi-oabi-choice.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/uclibc-arm-ftruncate64.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/uclibc_scheduler_update.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-0.9.33/0001-Declare-__err-and-pass-it-to-INTERNAL_SYSCALL_NCS-so.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-0.9.33/0001-lstat-stat-fstat-Use-64bit-version-of-syscall-if-ava.patch
 rename meta/recipes-core/uclibc/{uclibc-0.9.32 => uclibc-0.9.33}/argp-headers.patch (99%)
 rename meta/recipes-core/uclibc/{uclibc-0.9.32 => uclibc-0.9.33}/argp-support.patch (99%)
 rename meta/recipes-core/uclibc/{uclibc-0.9.32 => uclibc-0.9.33}/compile-arm-fork-with-O2.patch (97%)
 create mode 100644 meta/recipes-core/uclibc/uclibc-0.9.33/define-MSG_CMSG_CLOEXEC.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-0.9.33/dup3.patch
 rename meta/recipes-core/uclibc/{uclibc-0.9.32 => uclibc-0.9.33}/ldso_use_arm_dl_linux_resolve_in_thumb_mode.patch (86%)
 create mode 100644 meta/recipes-core/uclibc/uclibc-0.9.33/libc_symbols_include_bits_uclibc_config.patch
 rename meta/recipes-core/uclibc/{uclibc-0.9.32 => uclibc-0.9.33}/mips/uClibc.machine (100%)
 rename meta/recipes-core/uclibc/{uclibc-0.9.32 => uclibc-0.9.33}/orign_path.patch (64%)
 rename meta/recipes-core/uclibc/{uclibc-0.9.32 => uclibc-0.9.33}/powerpc_copysignl.patch (96%)
 rename meta/recipes-core/uclibc/{uclibc-0.9.32 => uclibc-0.9.33}/remove_attribute_optimize_Os.patch (93%)
 rename meta/recipes-core/uclibc/{uclibc-0.9.32 => uclibc-0.9.33}/uClibc.distro (96%)
 rename meta/recipes-core/uclibc/{uclibc-0.9.32 => uclibc-0.9.33}/uClibc.machine (100%)
 rename meta/recipes-core/uclibc/{uclibc-0.9.32 => uclibc-0.9.33}/uclibc-execvpe.patch (99%)
 rename meta/recipes-core/uclibc/{uclibc-0.9.32 => uclibc-0.9.33}/uclibc_enable_log2_test.patch (81%)
 rename meta/recipes-core/uclibc/{uclibc-initial_0.9.32.bb => uclibc-initial_0.9.33.bb} (100%)
 rename meta/recipes-core/uclibc/{uclibc_0.9.32.bb => uclibc_0.9.33.bb} (45%)
 delete mode 100644 meta/recipes-core/zlib/files/Makefile.am
 delete mode 100644 meta/recipes-core/zlib/files/configure.ac
 delete mode 100644 meta/recipes-core/zlib/zlib-1.2.5/fix.inverted.LFS.logic.patch
 delete mode 100644 meta/recipes-core/zlib/zlib_1.2.5.bb
 create mode 100644 meta/recipes-core/zlib/zlib_1.2.6.bb
 create mode 100644 meta/recipes-devtools/pseudo/pseudo/opendir.patch
 create mode 100644 meta/recipes-devtools/pseudo/pseudo/renameat.patch
 create mode 100644 meta/recipes-devtools/python/python/host_include_contamination.patch
 create mode 100644 meta/recipes-graphics/drm/libdrm/GNU_SOURCE_definition.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11-1.4.4/0001-Add-_XGetRequest-as-substitute-for-GetReq-GetReqExtr.patch
 create mode 100644 meta/recipes-kernel/kmod/kmod-native_git.bb
 create mode 100644 meta/recipes-kernel/kmod/kmod.inc
 create mode 100644 meta/recipes-kernel/kmod/kmod/depmod-search.conf
 create mode 100644 meta/recipes-kernel/kmod/kmod_git.bb
 delete mode 100644 meta/recipes-kernel/module-init-tools/files/disable_man.patch
 delete mode 100644 meta/recipes-kernel/module-init-tools/files/grab_module_memset.patch
 delete mode 100644 meta/recipes-kernel/module-init-tools/files/modutils_extension.patch
 delete mode 100644 meta/recipes-kernel/module-init-tools/module-init-tools-cross_3.16.bb
 delete mode 100644 meta/recipes-kernel/module-init-tools/module-init-tools.inc
 delete mode 100644 meta/recipes-kernel/module-init-tools/module-init-tools_3.16.bb
 rename meta/recipes-kernel/{module-init-tools => modutils-initscripts}/files/PD.patch (100%)
 rename meta/recipes-kernel/{module-init-tools => modutils-initscripts}/files/modutils.sh (100%)
 rename meta/recipes-kernel/{module-init-tools => modutils-initscripts}/modutils-initscripts.bb (100%)

-- 
1.7.5.4



