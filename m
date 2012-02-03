Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RtElI-0000tT-Lq
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Feb 2012 09:44:53 +0100
Received: by daln34 with SMTP id n34so83755dal.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Feb 2012 00:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=fXL1AxTH9P8YC8Cai2ahIWyNDdkeRFrxEoKysH8ECwg=;
	b=Xenc0x4yq/gvuV89HHx4UkALEnYqHZeWqNQ4dp6px/QuIewMcdKrjccEUN9oA5sn5l
	BWed4jI/AcfA+LSEp/VtZ2tjnP/0J/4vKS6dKinv1fvo2BPBFpSDcdaRNlawqtaGOQTH
	pzloiJQAqnsNCfW1EAHCFm/Ex44h/bbkNnZyk=
Received: by 10.68.222.103 with SMTP id ql7mr16133877pbc.53.1328258214708;
	Fri, 03 Feb 2012 00:36:54 -0800 (PST)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id p9sm11463851pbb.9.2012.02.03.00.36.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 03 Feb 2012 00:36:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Feb 2012 00:36:00 -0800
Message-Id: <cover.1328257913.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH 00/14] uclibc upgrade, initial kmod and thumb tune
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
X-List-Received-Date: Fri, 03 Feb 2012 08:44:53 -0000

Some of these patches are resent with this request.
kmod changes are experimental. I am looking for folks to try it out
uclibc,zlib upgrade and other uclibc related changes are well tested

The following changes since commit 70e1226e8c10bf07d6c7b1e13d745ad603f2ec73:

  meta-yocto/local.conf.sample.extended: add LICENSE_FLAGS_WHITELIST section (2012-02-02 22:04:54 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib kraj/misc
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/misc

Khem Raj (14):
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

 meta/classes/image.bbclass                         |    2 +-
 meta/classes/kernel.bbclass                        |    9 +-
 .../conf/distro/include/distro_tracking_fields.inc |   26 +-
 meta/conf/distro/include/tcmode-default.inc        |    2 +-
 .../conf/machine/include/arm/feature-arm-thumb.inc |   20 +-
 meta/conf/machine/include/tune-strongarm1100.inc   |    4 +-
 meta/conf/machine/include/tune-thumb.inc           |   32 --
 meta/conf/multilib.conf                            |    4 +-
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
 ...0001-stat-Use-stat64-syscall-if-available.patch |   95 ++++
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
 .../uclibc/{uclibc_0.9.32.bb => uclibc_0.9.33.bb}  |   25 +-
 meta/recipes-core/zlib/files/Makefile.am           |    9 -
 meta/recipes-core/zlib/files/configure.ac          |   48 --
 .../zlib/zlib-1.2.5/fix.inverted.LFS.logic.patch   |   20 -
 meta/recipes-core/zlib/zlib_1.2.5.bb               |   41 --
 meta/recipes-core/zlib/zlib_1.2.6.bb               |   26 ++
 meta/recipes-devtools/pseudo/pseudo/opendir.patch  |   92 ++++
 meta/recipes-devtools/pseudo/pseudo/renameat.patch |  227 ++++++++++
 meta/recipes-devtools/pseudo/pseudo_1.2.bb         |    6 +-
 meta/recipes-gnome/gnome/gconf_3.2.3.bb            |    9 +-
 meta/recipes-kernel/kmod/kmod-native_git.bb        |   16 +
 meta/recipes-kernel/kmod/kmod.inc                  |   35 ++
 ...001-depmod-Dont-use-errno-unconditionally.patch |  101 +++++
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
 .../recipes-support/consolekit/consolekit_0.4.5.bb |   11 +-
 scripts/runqemu-internal                           |   13 +-
 71 files changed, 1010 insertions(+), 2059 deletions(-)
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
 create mode 100644 meta/recipes-core/uclibc/uclibc-0.9.33/0001-stat-Use-stat64-syscall-if-available.patch
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
 create mode 100644 meta/recipes-kernel/kmod/kmod-native_git.bb
 create mode 100644 meta/recipes-kernel/kmod/kmod.inc
 create mode 100644 meta/recipes-kernel/kmod/kmod/0001-depmod-Dont-use-errno-unconditionally.patch
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



