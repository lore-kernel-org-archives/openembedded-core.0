Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD986C77B7C
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 16:12:27 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.54082.1683216745715182433
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 May 2023 09:12:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=V4vZCW6a;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-30771c68a9eso260961f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 09:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1683216744; x=1685808744;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=oTulIq4EvFan+mfkiRWvwCNEnCslbQIx26ZmyCWRG8U=;
        b=V4vZCW6aVOGkUZO8FshEDZ4znT+ccu30dFxbKJVRFcuv7Dk3c+M3t+GfKCbekaKcOs
         RT9XTzeRc2QsVCCgZjBCpNb7o3WtTJJazwe8IZrmAfTRI6Ik9sMnC5V9VdLvxA8BKhpI
         oWJ4M7CbFM2zyHfVlgaoi06wm/lSjmDIZLn5Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683216744; x=1685808744;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oTulIq4EvFan+mfkiRWvwCNEnCslbQIx26ZmyCWRG8U=;
        b=l5ZLw9aZMoAq3eyEJRpyVIwnHhAXKUPWow26DDqiGk/crx5EDmvyhXZFD2Uf9I6a83
         yZhvopHi6UxBoQqL3Xfbt0SRW3ifkKZEV9KzS3BbTdPxUSpmpr2/JvnT3gWRxsy4jwkY
         rrGzLAbwXlhvqOqSUNnJfDTyZfm05Ea66uDAKAZ5Tfj7C38qPc1+/BrKVcGBT9erTokr
         NM5YNZSIWqBqfdVtsLqehC7Ccit5ZtHuGIKMjnKKHq2zMzF4fd0OwtQoWw3ISkSHNnQQ
         uDAsA7ftoNK1yoGy6rTq7LQZlOPoYvo79tkBm8V8J/C3W0NyxADuSUrCx4yXRAG1hGg0
         KG0g==
X-Gm-Message-State: AC+VfDynaZhHzVPYj4BWsVjXc3CP+JxMXH3DaW4TTKAy/S8D7AdrDWYP
	r1pyg8QUzwFshvNqTT7ErsR00XaS35HLJRzxrTVcCQ==
X-Google-Smtp-Source: ACHHUZ7GZwEVWyayH4cjYZ/Zp7wBMLp0650lgo+FH7pCoYJJDNLRl1WdYrIywPcrIPr5sZyOmbXZHw==
X-Received: by 2002:a5d:65c4:0:b0:306:36ee:3c17 with SMTP id e4-20020a5d65c4000000b0030636ee3c17mr2946998wrw.71.1683216743169;
        Thu, 04 May 2023 09:12:23 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:6749:5fda:5dc0:e535])
        by smtp.gmail.com with ESMTPSA id d9-20020a5d6dc9000000b00304adbeeabbsm20545105wrz.99.2023.05.04.09.12.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 09:12:22 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] recipes: Default to https git protocol where possible
Date: Thu,  4 May 2023 17:12:21 +0100
Message-Id: <20230504161221.3069209-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 16:12:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180881

The recommendation from server maintainers is that the https protocol
is both faster and more reliable than the dedicated git protocol at this point.
Switch to it where possible.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/recipetool.py                | 8 ++++----
 meta/recipes-connectivity/neard/neard_0.18.bb             | 2 +-
 meta/recipes-core/dbus-wait/dbus-wait_git.bb              | 2 +-
 meta/recipes-core/glibc/glibc-version.inc                 | 2 +-
 meta/recipes-core/images/build-appliance-image_15.0.0.bb  | 2 +-
 meta/recipes-core/musl/libc-test_git.bb                   | 2 +-
 meta/recipes-core/musl/musl_git.bb                        | 2 +-
 meta/recipes-core/psplash/psplash_git.bb                  | 2 +-
 meta/recipes-core/update-rc.d/update-rc.d_0.8.bb          | 2 +-
 meta/recipes-devtools/binutils/binutils-2.40.inc          | 2 +-
 meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb    | 2 +-
 meta/recipes-devtools/e2fsprogs/e2fsprogs.inc             | 2 +-
 meta/recipes-devtools/erofs-utils/erofs-utils_1.5.bb      | 2 +-
 meta/recipes-devtools/mmc/mmc-utils_git.bb                | 2 +-
 meta/recipes-devtools/pseudo/pseudo_git.bb                | 2 +-
 meta/recipes-extended/bzip2/bzip2_1.0.8.bb                | 2 +-
 meta/recipes-graphics/libfakekey/libfakekey_git.bb        | 2 +-
 meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb     | 2 +-
 meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.3.bb    | 2 +-
 .../xcursor-transparent-theme_git.bb                      | 2 +-
 meta/recipes-kernel/blktrace/blktrace_git.bb              | 2 +-
 meta/recipes-kernel/dtc/dtc_1.7.0.bb                      | 2 +-
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb   | 2 +-
 meta/recipes-kernel/kmod/kmod_30.bb                       | 2 +-
 meta/recipes-kernel/linux/linux-yocto-dev.bb              | 4 ++--
 meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb          | 4 ++--
 meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb           | 4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb        | 4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb         | 4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.15.bb             | 4 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb              | 4 ++--
 meta/recipes-kernel/lttng/babeltrace2_2.0.4.bb            | 2 +-
 meta/recipes-kernel/lttng/babeltrace_1.5.11.bb            | 2 +-
 meta/recipes-kernel/lttng/lttng-modules_2.13.9.bb         | 2 +-
 meta/recipes-kernel/systemtap/systemtap_git.inc           | 2 +-
 meta/recipes-rt/rt-tests/rt-tests.inc                     | 2 +-
 .../matchbox-config-gtk/matchbox-config-gtk_0.2.bb        | 2 +-
 .../recipes-sato/matchbox-desktop/matchbox-desktop_2.3.bb | 2 +-
 .../matchbox-keyboard/matchbox-keyboard_0.1.1.bb          | 2 +-
 .../matchbox-panel-2/matchbox-panel-2_2.12.bb             | 2 +-
 .../matchbox-terminal/matchbox-terminal_0.2.bb            | 2 +-
 .../matchbox-theme-sato/matchbox-theme-sato_0.2.bb        | 2 +-
 meta/recipes-sato/puzzles/puzzles_git.bb                  | 2 +-
 meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb  | 2 +-
 .../recipes-sato/settings-daemon/settings-daemon_0.0.2.bb | 2 +-
 meta/recipes-support/dos2unix/dos2unix_7.4.4.bb           | 2 +-
 .../gnome-desktop-testing/gnome-desktop-testing_2021.1.bb | 2 +-
 meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb   | 2 +-
 48 files changed, 58 insertions(+), 58 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index b193f0f5c83..a5c0f7164a3 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -361,7 +361,7 @@ class RecipetoolCreateTests(RecipetoolBase):
         tempsrc = os.path.join(self.tempdir, 'srctree')
         os.makedirs(tempsrc)
         recipefile = os.path.join(self.tempdir, 'libmatchbox.bb')
-        srcuri = 'git://git.yoctoproject.org/libmatchbox'
+        srcuri = 'git://git.yoctoproject.org/libmatchbox;protocol=https'
         result = runCmd(['recipetool', 'create', '-o', recipefile, srcuri + ";rev=9f7cf8895ae2d39c465c04cc78e918c157420269", '-x', tempsrc])
         self.assertTrue(os.path.isfile(recipefile), 'recipetool did not create recipe file; output:\n%s' % result.output)
         checkvars = {}
@@ -511,13 +511,13 @@ class RecipetoolCreateTests(RecipetoolBase):
         self._test_recipetool_create_git('http://git.yoctoproject.org/git/matchbox-keyboard')
 
     def test_recipetool_create_git_srcuri_master(self):
-        self._test_recipetool_create_git('git://git.yoctoproject.org/matchbox-keyboard;branch=master')
+        self._test_recipetool_create_git('git://git.yoctoproject.org/matchbox-keyboard;branch=master;protocol=https')
 
     def test_recipetool_create_git_srcuri_branch(self):
-        self._test_recipetool_create_git('git://git.yoctoproject.org/matchbox-keyboard;branch=matchbox-keyboard-0-1')
+        self._test_recipetool_create_git('git://git.yoctoproject.org/matchbox-keyboard;branch=matchbox-keyboard-0-1;protocol=https')
 
     def test_recipetool_create_git_srcbranch(self):
-        self._test_recipetool_create_git('git://git.yoctoproject.org/matchbox-keyboard', 'matchbox-keyboard-0-1')
+        self._test_recipetool_create_git('git://git.yoctoproject.org/matchbox-keyboard;protocol=https', 'matchbox-keyboard-0-1')
 
 
 class RecipetoolTests(RecipetoolBase):
diff --git a/meta/recipes-connectivity/neard/neard_0.18.bb b/meta/recipes-connectivity/neard/neard_0.18.bb
index 23e999acc4a..dbd6e3841a1 100644
--- a/meta/recipes-connectivity/neard/neard_0.18.bb
+++ b/meta/recipes-connectivity/neard/neard_0.18.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
 
 DEPENDS = "dbus glib-2.0 libnl"
 
-SRC_URI = "git://git.kernel.org/pub/scm/network/nfc/neard.git;protocol=git;branch=master \
+SRC_URI = "git://git.kernel.org/pub/scm/network/nfc/neard.git;protocol=https;branch=master \
            file://neard.in \
            file://Makefile.am-fix-parallel-issue.patch \
            file://Makefile.am-do-not-ship-version.h.patch \
diff --git a/meta/recipes-core/dbus-wait/dbus-wait_git.bb b/meta/recipes-core/dbus-wait/dbus-wait_git.bb
index f2eb8b1874e..bc846de2169 100644
--- a/meta/recipes-core/dbus-wait/dbus-wait_git.bb
+++ b/meta/recipes-core/dbus-wait/dbus-wait_git.bb
@@ -11,7 +11,7 @@ SRCREV = "6cc6077a36fe2648a5f993fe7c16c9632f946517"
 PV = "0.1+git${SRCPV}"
 PR = "r2"
 
-SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master"
+SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master;protocol=https"
 UPSTREAM_CHECK_COMMITS = "1"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 1b8665a9d87..37bb9fd34fb 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -3,6 +3,6 @@ PV = "2.37"
 SRCREV_glibc ?= "d8e1a7590d375159fb5aac07ad8111ab4699e994" 
 SRCREV_localedef ?= "794da69788cbf9bf57b59a852f9f11307663fa87"
 
-GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
+GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.(?!90)\d+)*)"
diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
index 8f54d22321e..c68a57e1db0 100644
--- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
@@ -27,7 +27,7 @@ inherit core-image setuptools3 features_check
 REQUIRED_DISTRO_FEATURES += "xattr"
 
 SRCREV ?= "311c76c8e8cf39fa41456561148cebe2b8b3c057"
-SRC_URI = "git://git.yoctoproject.org/poky;branch=master \
+SRC_URI = "git://git.yoctoproject.org/poky;branch=master;protocol=https \
            file://Yocto_Build_Appliance.vmx \
            file://Yocto_Build_Appliance.vmxf \
            file://README_VirtualBox_Guest_Additions.txt \
diff --git a/meta/recipes-core/musl/libc-test_git.bb b/meta/recipes-core/musl/libc-test_git.bb
index b5bfc6e34cd..6d64592f0c6 100644
--- a/meta/recipes-core/musl/libc-test_git.bb
+++ b/meta/recipes-core/musl/libc-test_git.bb
@@ -11,7 +11,7 @@ inherit ptest
 
 SRCREV = "18e28496adee3d84fefdda6efcb9c5b8996a2398"
 SRC_URI = " \
-    git://repo.or.cz/libc-test;branch=master \
+    git://repo.or.cz/libc-test;branch=master;protocol=https \
     file://run-ptest \
 "
 
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 036ac948b2f..7c9a9cd6718 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -12,7 +12,7 @@ PV = "${BASEVER}+git${SRCPV}"
 
 # mirror is at git://github.com/kraj/musl.git
 
-SRC_URI = "git://git.musl-libc.org/musl;branch=master \
+SRC_URI = "git://git.musl-libc.org/musl;branch=master;protocol=https \
            file://0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch \
            file://0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch \
           "
diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index 9532ed1534a..aecbd2ce467 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -9,7 +9,7 @@ DEPENDS = "gdk-pixbuf-native"
 SRCREV = "44afb7506d43cca15582b4c5b90ba5580344d75d"
 PV = "0.1+git${SRCPV}"
 
-SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master \
+SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master;protocol=https \
            file://psplash-init \
            file://psplash-start.service \
            file://psplash-systemd.service \
diff --git a/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb b/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb
index ee491984293..043cb3f13ea 100644
--- a/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb
+++ b/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://update-rc.d;beginline=5;endline=15;md5=d40a07c27f535425934bb5001f2037d9"
 
-SRC_URI = "git://git.yoctoproject.org/update-rc.d;branch=master"
+SRC_URI = "git://git.yoctoproject.org/update-rc.d;branch=master;protocol=https"
 SRCREV = "8636cf478d426b568c1be11dbd9346f67e03adac"
 
 UPSTREAM_CHECK_COMMITS = "1"
diff --git a/meta/recipes-devtools/binutils/binutils-2.40.inc b/meta/recipes-devtools/binutils/binutils-2.40.inc
index 93631ca3d7f..46de8e3ea9d 100644
--- a/meta/recipes-devtools/binutils/binutils-2.40.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.40.inc
@@ -19,7 +19,7 @@ SRCBRANCH ?= "binutils-2_40-branch"
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
 SRCREV ?= "ffb83e32fc11f36b7b82b876c14888f82cd983b3"
-BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=git"
+BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
      file://0004-Point-scripts-location-to-libdir.patch \
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb
index b4dfc5b3f3e..05e84defba5 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = " \
 SECTION = "base"
 DEPENDS = "util-linux zlib"
 
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git;branch=master \
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git;branch=master;protocol=https \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            file://0001-Use-pread-pwrite-ftruncate-stat-instead-of-64bit-equ.patch \
            "
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
index f41a5d0b4ea..d345b914722 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
@@ -19,7 +19,7 @@ LIC_FILES_CHKSUM = "file://NOTICE;md5=d50be0580c0b0a7fbc7a4830bbe6c12b \
 SECTION = "base"
 DEPENDS = "util-linux attr autoconf-archive"
 
-SRC_URI = "git://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git;branch=master"
+SRC_URI = "git://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git;branch=master;protocol=https"
 S = "${WORKDIR}/git"
 
 inherit autotools gettext texinfo pkgconfig multilib_header update-alternatives ptest
diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils_1.5.bb b/meta/recipes-devtools/erofs-utils/erofs-utils_1.5.bb
index 6ce5843570b..2b5861882db 100644
--- a/meta/recipes-devtools/erofs-utils/erofs-utils_1.5.bb
+++ b/meta/recipes-devtools/erofs-utils/erofs-utils_1.5.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=73001d804ea1e3d84365f652242cca20"
 HOMEPAGE = "https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/tree/README"
 
 SRCREV = "a2821a66b42aee5430bccee82c280e38d1e9ab29"
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git;branch=master \
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git;branch=master;protocol=https \
            file://0001-configure-use-AC_SYS_LARGEFILE.patch \
            file://0002-erofs-replace-l-stat64-by-equivalent-l-stat.patch \
            file://0003-internal.h-Make-LFS-mandatory-for-all-usecases.patch \
diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index 8c41b77fe13..1e2e17bfd3e 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -9,7 +9,7 @@ SRCREV = "d4c2910981ff99b983734426dfa99632fb81ac6b"
 
 PV = "0.1+git${SRCPV}"
 
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git;branch=${SRCBRANCH}"
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git;branch=${SRCBRANCH};protocol=https"
 UPSTREAM_CHECK_COMMITS = "1"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 7c3231186ca..c3c4bb0ed92 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -1,6 +1,6 @@
 require pseudo.inc
 
-SRC_URI = "git://git.yoctoproject.org/pseudo;branch=master \
+SRC_URI = "git://git.yoctoproject.org/pseudo;branch=master;protocol=https \
            file://0001-configure-Prune-PIE-flags.patch \
            file://fallback-passwd \
            file://fallback-group \
diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
index 78138d15434..4e3a06f2408 100644
--- a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
+++ b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
@@ -22,7 +22,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;beginline=4;endline=37;md5=600af43c50f1fcb82e
 "
 
 SRC_URI = "https://sourceware.org/pub/${BPN}/${BPN}-${PV}.tar.gz \
-           git://sourceware.org/git/bzip2-tests.git;name=bzip2-tests;branch=master \
+           git://sourceware.org/git/bzip2-tests.git;name=bzip2-tests;branch=master;protocol=https \
            file://configure.ac;subdir=${BP} \
            file://Makefile.am;subdir=${BP} \
            file://run-ptest \
diff --git a/meta/recipes-graphics/libfakekey/libfakekey_git.bb b/meta/recipes-graphics/libfakekey/libfakekey_git.bb
index 5d94be52b4f..c9c828a8c42 100644
--- a/meta/recipes-graphics/libfakekey/libfakekey_git.bb
+++ b/meta/recipes-graphics/libfakekey/libfakekey_git.bb
@@ -13,7 +13,7 @@ SECTION = "x11/wm"
 SRCREV = "7ad885912efb2131e80914e964d5e635b0d07b40"
 PV = "0.3+git${SRCPV}"
 
-SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master"
+SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb b/meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb
index b01b332a55b..bf3f5c005d9 100644
--- a/meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb
+++ b/meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb
@@ -17,7 +17,7 @@ DEPENDS = "virtual/libx11 libxext"
 
 #SRCREV for 1.12
 SRCREV = "e846ee434f8e23d9db38af13c523f791495e0e87"
-SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master"
+SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.3.bb b/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.3.bb
index 8e9de0914e8..880d4ed6664 100644
--- a/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.3.bb
+++ b/meta/recipes-graphics/matchbox-wm/matchbox-wm_1.2.3.bb
@@ -11,7 +11,7 @@ SECTION = "x11/wm"
 DEPENDS = "libmatchbox virtual/libx11 libxext libxrender startup-notification expat gconf libxcursor libxfixes"
 
 SRCREV = "ce8c1053270d960a7235ab5c3435f707541810a4"
-SRC_URI = "git://git.yoctoproject.org/matchbox-window-manager;branch=master \
+SRC_URI = "git://git.yoctoproject.org/matchbox-window-manager;branch=master;protocol=https \
            file://kbdconfig"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_git.bb b/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_git.bb
index 09fbc9b7983..b65a3bea562 100644
--- a/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_git.bb
+++ b/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_git.bb
@@ -10,7 +10,7 @@ SECTION = "x11/base"
 SRCREV = "23c8af5ba4a1b7efbaf0bbca59a65ff7e10a1a06"
 PV = "0.1.1+git${SRCPV}"
 
-SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master"
+SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master;protocol=https"
 UPSTREAM_CHECK_COMMITS = "1"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-kernel/blktrace/blktrace_git.bb b/meta/recipes-kernel/blktrace/blktrace_git.bb
index bba5e045047..d0eeba32088 100644
--- a/meta/recipes-kernel/blktrace/blktrace_git.bb
+++ b/meta/recipes-kernel/blktrace/blktrace_git.bb
@@ -14,7 +14,7 @@ SRCREV = "366d30b9cdb20345c5d064af850d686da79b89eb"
 
 PV = "1.3.0+git${SRCPV}"
 
-SRC_URI = "git://git.kernel.dk/blktrace.git;branch=master"
+SRC_URI = "git://git.kernel.dk/blktrace.git;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-kernel/dtc/dtc_1.7.0.bb b/meta/recipes-kernel/dtc/dtc_1.7.0.bb
index 4ab8451c60f..1a78a0c0792 100644
--- a/meta/recipes-kernel/dtc/dtc_1.7.0.bb
+++ b/meta/recipes-kernel/dtc/dtc_1.7.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://BSD-2-Clause;md5=5d6306d1b08f8df623178dfd81880927 \
                     file://README.license;md5=a1eb22e37f09df5b5511b8a278992d0e"
 
-SRC_URI = "git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=main" 
+SRC_URI = "git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=main;protocol=https" 
 SRCREV = "039a99414e778332d8f9c04cbd3072e1dcc62798"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 12f1cf516ee..388d8feebce 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -16,7 +16,7 @@ PV = "0.3+git${SRCPV}"
 
 inherit native
 
-SRC_URI = "git://git.yoctoproject.org/yocto-kernel-tools.git;branch=master"
+SRC_URI = "git://git.yoctoproject.org/yocto-kernel-tools.git;branch=master;protocol=https"
 S = "${WORKDIR}/git"
 
 do_configure() {
diff --git a/meta/recipes-kernel/kmod/kmod_30.bb b/meta/recipes-kernel/kmod/kmod_30.bb
index ff6e20554b5..6fc9da9c824 100644
--- a/meta/recipes-kernel/kmod/kmod_30.bb
+++ b/meta/recipes-kernel/kmod/kmod_30.bb
@@ -17,7 +17,7 @@ inherit autotools bash-completion gtk-doc pkgconfig manpages update-alternatives
 
 SRCREV = "5d46434a63ae0160150a0efdde1914873697e273"
 
-SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git;branch=master \
+SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git;branch=master;protocol=https \
            file://depmod-search.conf \
            file://avoid_parallel_tests.patch \
            "
diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index 52cd6f5f28f..3a1595521e4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -17,8 +17,8 @@ include recipes-kernel/linux/linux-yocto-dev-revisions.inc
 KBRANCH = "v6.3/standard/base"
 KMETA = "kernel-meta"
 
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name=machine \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=master;destsuffix=${KMETA}"
+SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name=machine;protocol=https \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=master;destsuffix=${KMETA};protocol=https"
 
 # Set default SRCREVs. Both the machine and meta SRCREVs are statically set
 # to the korg v3.7 tag, and hence prevent network access during parsing. If
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 29379791f47..475fe34066d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -14,8 +14,8 @@ python () {
 SRCREV_machine ?= "8e0611e36c848a07f9cdd778903c9e51bb90b319"
 SRCREV_meta ?= "e4b95ec17228274acb38bf10061448224df3a312"
 
-SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA};protocol=https"
 
 LINUX_VERSION ?= "5.15.108"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index 4aaa371d97e..20d27293710 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -17,8 +17,8 @@ python () {
 SRCREV_machine ?= "f974a72071f8b481fc4e38517219bc5c503e14f6"
 SRCREV_meta ?= "36901b5b298e601fe73dd79aaff8b615a7762013"
 
-SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA}"
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
 LINUX_VERSION ?= "6.1.25"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index c19c289b97c..365d01db781 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -19,8 +19,8 @@ SRCREV_meta ?= "e4b95ec17228274acb38bf10061448224df3a312"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA};protocol=https"
 
 COMPATIBLE_MACHINE = "^(qemux86|qemux86-64|qemuarm64|qemuarm|qemuarmv5)$"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index 5046759061e..47d77404d04 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -22,8 +22,8 @@ SRCREV_meta ?= "36901b5b298e601fe73dd79aaff8b615a7762013"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA}"
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
 COMPATIBLE_MACHINE = "^(qemux86|qemux86-64|qemuarm64|qemuarm|qemuarmv5)$"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 785944c3cf7..54c8e126449 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -34,8 +34,8 @@ SRCREV_machine:class-devupstream ?= "3299fb36854fdc288bddc2c4d265f8a2e5105944"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
-SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH};protocol=https \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 LINUX_VERSION ?= "5.15.108"
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index c2b0e66fb84..36f7ed8791f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -39,8 +39,8 @@ SRCREV_machine:class-devupstream ?= "f17b0ab65d17988d5e6d6fe22f708ef3721080bf"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.1/base"
 
-SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
-           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA}"
+SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH};protocol=https \
+           git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 LINUX_VERSION ?= "6.1.25"
diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.0.4.bb b/meta/recipes-kernel/lttng/babeltrace2_2.0.4.bb
index 04c2a279041..16d8b945a40 100644
--- a/meta/recipes-kernel/lttng/babeltrace2_2.0.4.bb
+++ b/meta/recipes-kernel/lttng/babeltrace2_2.0.4.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a6a458c13f18385b7bc5069a6d7b176e"
 
 DEPENDS = "glib-2.0 util-linux popt bison-native flex-native"
 
-SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-2.0 \
+SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-2.0;protocol=https \
            file://run-ptest \
            file://0001-tests-do-not-run-test-applications-from-.libs.patch \
            file://0001-Make-manpages-multilib-identical.patch \
diff --git a/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb b/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb
index 194a773a245..f4d9b5e42a8 100644
--- a/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb
+++ b/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=76ba15dd76a248e1dd526bca0e2125fa"
 
 DEPENDS = "glib-2.0 util-linux popt bison-native flex-native"
 
-SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-1.5 \
+SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-1.5;protocol=https \
 	   file://run-ptest \
 	  "
 SRCREV = "91c00f70884887ff5c4849a8e3d47e311a22ba9d"
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.9.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.9.bb
index 5197bf578f0..8500f168ffd 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.9.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.9.bb
@@ -41,6 +41,6 @@ python do_package:prepend() {
 }
 
 BBCLASSEXTEND = "devupstream:target"
-SRC_URI:class-devupstream = "git://git.lttng.org/lttng-modules;branch=stable-2.13"
+SRC_URI:class-devupstream = "git://git.lttng.org/lttng-modules;branch=stable-2.13;protocol=https"
 SRCREV:class-devupstream = "7584cfc04914cb0842a986e9808686858b9c8630"
 SRCREV_FORMAT ?= "lttng_git"
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index d309a89496c..afeb3ce2d27 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -3,7 +3,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRCREV = "b176afb2e49119ef844d193d27b0752a6d84fe8f"
 PV = "4.8"
 
-SRC_URI = "git://sourceware.org/git/systemtap.git;branch=master \
+SRC_URI = "git://sourceware.org/git/systemtap.git;branch=master;protocol=https \
            file://0001-Do-not-let-configure-write-a-python-location-into-th.patch \
            file://0001-Install-python-modules-to-correct-library-dir.patch \
            file://0001-staprun-stapbpf-don-t-support-installing-a-non-root.patch \
diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-tests/rt-tests.inc
index 0481bf60280..527e14ad546 100644
--- a/meta/recipes-rt/rt-tests/rt-tests.inc
+++ b/meta/recipes-rt/rt-tests/rt-tests.inc
@@ -2,6 +2,6 @@ SRCREV = "4579b9a6d85ae528f76e92421eb5e7b33cd26b17"
 PV = "2.5"
 PE = "1"
 
-SRC_URI = "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branch=main"
+SRC_URI = "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branch=main;protocol=https"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb b/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb
index d870ab211b0..490bd582b25 100644
--- a/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb
+++ b/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_0.2.bb
@@ -10,7 +10,7 @@ DEPENDS = "gconf gtk+3"
 RDEPENDS:${PN} = "settings-daemon"
 
 SRCREV = "7182e603357250952aa24d90f6d89345f93da7ce"
-SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master \
+SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master;protocol=https \
            file://no-handed.patch"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 PV = "0.2+git${SRCPV}"
diff --git a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.3.bb b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.3.bb
index 9d3a2eca33b..3777f05b5a9 100644
--- a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.3.bb
+++ b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.3.bb
@@ -12,7 +12,7 @@ DEPENDS = "gtk+3 startup-notification dbus"
 SECTION = "x11/wm"
 
 SRCREV = "0fd6a0c3f3b7bbf4f4b46190d71f7aef35d6bbfd"
-SRC_URI = "git://git.yoctoproject.org/${BPN}-2;branch=master \
+SRC_URI = "git://git.yoctoproject.org/${BPN}-2;branch=master;protocol=https \
            file://vfolders/ \
            "
 
diff --git a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_0.1.1.bb b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_0.1.1.bb
index b1724675bab..6b70948f16d 100644
--- a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_0.1.1.bb
+++ b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_0.1.1.bb
@@ -13,7 +13,7 @@ DEPENDS = "libfakekey expat libxft"
 
 #SRCREV for 0.1.1
 SRCREV = "630d89068dc0a1e9199306d405cb32f892dfa4d3"
-SRC_URI = "git://git.yoctoproject.org/${BPN};branch=matchbox-keyboard-0-1 \
+SRC_URI = "git://git.yoctoproject.org/${BPN};branch=matchbox-keyboard-0-1;protocol=https \
            file://0001-desktop-file-Hide-the-keyboard-from-app-list.patch \
            file://80matchboxkeyboard.sh"
 
diff --git a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.12.bb b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.12.bb
index 29a1a36e129..b71d1e5cd95 100644
--- a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.12.bb
+++ b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_2.12.bb
@@ -22,7 +22,7 @@ RPROVIDES:${PN} = "matchbox-panel"
 RREPLACES:${PN} = "matchbox-panel"
 RCONFLICTS:${PN} = "matchbox-panel"
 
-SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master \
+SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=https;branch=master \
            file://0001-applets-systray-Allow-icons-to-be-smaller.patch \
            "
 
diff --git a/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb b/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb
index c45c2d170e4..a1f236b40ff 100644
--- a/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb
+++ b/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.2.bb
@@ -10,7 +10,7 @@ DEPENDS = "gtk+3 vte"
 SECTION = "x11/utils"
 
 SRCREV = "99e6eb7db1b5fef110973d96194eec992a2515a2"
-SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master"
+SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 PV = "0.2+git${SRCPV}"
 
diff --git a/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_0.2.bb b/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_0.2.bb
index bc4024736f4..c60a11c3c0f 100644
--- a/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_0.2.bb
+++ b/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_0.2.bb
@@ -2,7 +2,7 @@ require matchbox-theme-sato.inc
 
 # SRCREV tagged 0.2
 SRCREV = "df085ba9cdaeaf2956890b0e29d7ea1779bf6c78"
-SRC_URI = "git://git.yoctoproject.org/matchbox-sato;branch=master"
+SRC_URI = "git://git.yoctoproject.org/matchbox-sato;branch=master;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 87b6fac0246..4b045886826 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=92d2b7a2fc96b5f7f17101df7db1fefa"
 # gtk support includes a bunch of x11 headers
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI = "git://git.tartarus.org/simon/puzzles.git;branch=main"
+SRC_URI = "git://git.tartarus.org/simon/puzzles.git;branch=main;protocol=https"
 
 UPSTREAM_CHECK_COMMITS = "1"
 SRCREV = "5a491c5ad333ef34c1e7713f920f51cbb205af60"
diff --git a/meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb b/meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb
index eea7025c8d4..de4ab824848 100644
--- a/meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb
+++ b/meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb
@@ -11,7 +11,7 @@ DEPENDS = "matchbox-panel-2 gtk+3"
 
 # SRCREV tagged 0.3
 SRCREV = "9250fa5a012d84ff45984e8c4345ee7635227756"
-SRC_URI = "git://git.yoctoproject.org/screenshot;branch=master"
+SRC_URI = "git://git.yoctoproject.org/screenshot;branch=master;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb b/meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb
index 4356930da0d..4bdbefcb757 100644
--- a/meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb
+++ b/meta/recipes-sato/settings-daemon/settings-daemon_0.0.2.bb
@@ -9,7 +9,7 @@ SECTION = "x11"
 
 # SRCREV tagged 0.0.2
 SRCREV = "b2e5da502f8c5ff75e9e6da771372ef8e40fd9a2"
-SRC_URI = "git://git.yoctoproject.org/xsettings-daemon;branch=master \
+SRC_URI = "git://git.yoctoproject.org/xsettings-daemon;branch=master;protocol=https \
            file://addsoundkeys.patch \
            file://70settings-daemon.sh \
            "
diff --git a/meta/recipes-support/dos2unix/dos2unix_7.4.4.bb b/meta/recipes-support/dos2unix/dos2unix_7.4.4.bb
index d8ebeb64026..506faf5a6d4 100644
--- a/meta/recipes-support/dos2unix/dos2unix_7.4.4.bb
+++ b/meta/recipes-support/dos2unix/dos2unix_7.4.4.bb
@@ -8,7 +8,7 @@ SECTION = "support"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=37f72246ce2aa2fce9482c10b1f2b502"
 
-SRC_URI = "git://git.code.sf.net/p/dos2unix/dos2unix;branch=master"
+SRC_URI = "git://git.code.sf.net/p/dos2unix/dos2unix;branch=master;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "dos2unix-(?P<pver>(\d+(\.\d+)+))"
 
 SRCREV = "b56a58584d3fef0720425ae154c2a4d80e6af6c5"
diff --git a/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb b/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb
index 0cc7cd7b67c..1173dd4af35 100644
--- a/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb
+++ b/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb
@@ -9,7 +9,7 @@ LICENSE = "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
                     file://src/gnome-desktop-testing-runner.c;beginline=1;endline=20;md5=7ef3ad9da2ffcf7707dc11151fe007f4"
 
-SRC_URI = "git://gitlab.gnome.org/GNOME/gnome-desktop-testing.git;protocol=http;branch=master \
+SRC_URI = "git://gitlab.gnome.org/GNOME/gnome-desktop-testing.git;protocol=https;branch=master \
            file://0001-fix-non-literal-format-string-issue-with-clang.patch \
           "
 SRCREV = "e346cd4ed2e2102c9b195b614f3c642d23f5f6e7"
diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
index ee13e28c7df..ff5629c6f9b 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 SRCREV = "bcb82804daa8f725b6add259dcef2067e61a75aa"
 PV .= "+git${SRCPV}"
 
-SRC_URI = "git://git.yoctoproject.org/ptest-runner2;branch=master \
+SRC_URI = "git://git.yoctoproject.org/ptest-runner2;branch=master;protocol=https \
 "
 
 S = "${WORKDIR}/git"
-- 
2.39.2


