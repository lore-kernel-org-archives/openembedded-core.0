Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8B54C77B78
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 22:13:05 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.4571.1683065576377191174
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 May 2023 15:12:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=clWfVEwM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-2fe3fb8e25fso2816581f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 15:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1683065574; x=1685657574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yuk6dCCQQC5DNPpzrHVU7LU2D6aAgDEIO6oB59UUlw0=;
        b=clWfVEwM+4vQjTDnKZ53Z7c6EK5hUWq0QO3X3nZASTVxfeaX8saXkqlw7nlJSDu8r8
         pfOMfezFsMHXIm5CmdwHXaUgGlWiTRhoXOnjX3MEpsLyD8sBRSQHpxynjY2UyC/SJuON
         Q9srYjFXcWFyN8IsJuqzPd0LC0hYIq0ogmMfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683065574; x=1685657574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yuk6dCCQQC5DNPpzrHVU7LU2D6aAgDEIO6oB59UUlw0=;
        b=Om3bPp8syQ7nEYXEBWoGx2YYRq/u4wGHWiuKeSGY61i+AQJ1wnqb0Quy6J8PvN4WHi
         nBnrCWUfuqjz2OYzhyK3wyLdI9Bb7nrULXVyI+T7NpKXnH3e+YzY0m3sa2+vfkuMPFH+
         aFwLOD1JHetqCqKdXVRiWziNLols1vfjnqFJpOpk9HkUAhcE5JiovUH7DWmRDBz6VINl
         Ziy2dGVetzYzajJBkH1RQr2JyR9KNAS0Gx5AdsxZnTQlb4wdIlMsBZQAm1xMa2OfEZcU
         XGcjQSoHtmmY9Q22ufZm8XO+EfsqpCRSG2ltT04XL8W+lqwpt/ryQYO9zyMa0ERNAnw3
         ucNA==
X-Gm-Message-State: AC+VfDzq8WcdZo3SFBn/gaEvQIFKUkF0MqeMRCY57sc3ozsj5jMXL0Wi
	6+pIWQGxzwF77lbarDwSO5KC6j+QJeYq/RfmDL5F6w==
X-Google-Smtp-Source: ACHHUZ5jI+P77+oScsR7IK8sUOLScCh10AXZBetzj7y0aLFFtoT+Qs7bBnwtlF7jpk7coq2NM6xDLQ==
X-Received: by 2002:adf:f48b:0:b0:306:37ac:ef8c with SMTP id l11-20020adff48b000000b0030637acef8cmr2794286wro.39.1683065573820;
        Tue, 02 May 2023 15:12:53 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:7d60:21e0:c1e5:ef4b])
        by smtp.gmail.com with ESMTPSA id e18-20020adffc52000000b002efacde3fc7sm31863178wrs.35.2023.05.02.15.12.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 15:12:53 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] qemu: Upgrade 7.2.0 -> 8.0.0
Date: Tue,  2 May 2023 23:12:52 +0100
Message-Id: <20230502221252.2931006-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230502221252.2931006-1-richard.purdie@linuxfoundation.org>
References: <20230502221252.2931006-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 22:13:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180775

Drop backported/merged patches:

  Revert-linux-user-add-more-compat-ioctl-definitions.patch
  configure-Fix-check-tcg-not-executing-any-tests.patch
  contrib-vhost-user-blk-Replace-lseek64-with-lseek.patch
  Revert-linux-user-fix-compat-with-glibc-2.36-sys-mou.patch

Drop socket chardev patch with conflicts:

  chardev-connect-socket-to-a-spawned-command.patch

This last patch was added in support of swtpm however it isn't clear if anyone
is still using that workflow. The patch uses API calls such as as qemu_fork()
which were removed in 8.0.0 and replaced with gspawn calls. If anyone needs the
patch, it will be better for them to forward port it, test it and reinstate it,
preferably with a discussion with upstream about it too.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/tcmode-default.inc   |   2 +-
 ...u-native_7.2.0.bb => qemu-native_8.0.0.bb} |   2 +-
 ...e_7.2.0.bb => qemu-system-native_8.0.0.bb} |   0
 meta/recipes-devtools/qemu/qemu.inc           |   7 +-
 ...er-add-more-compat-ioctl-definitions.patch |  69 -----
 ...ix-check-tcg-not-executing-any-tests.patch |  56 ----
 ...-user-blk-Replace-lseek64-with-lseek.patch |  37 ---
 ...n-environment-space-to-boot-loader-q.patch |  13 +-
 ...lative-paths-for-line-preprocessor-d.patch |  33 ++-
 ...r-fix-compat-with-glibc-2.36-sys-mou.patch |  78 ------
 ...-connect-socket-to-a-spawned-command.patch | 246 ------------------
 ...ce-use-of-lfs64-related-functions-an.patch |  57 ++--
 .../0003-apic-fixup-fallthrough-to-PIC.patch  |  13 +-
 ...dd-pkg-config-handling-for-libgcrypt.patch |  13 +-
 ...mu-Do-not-include-file-if-not-exists.patch |  13 +-
 ...er-space-mmap-tweaks-to-address-musl.patch |  13 +-
 .../qemu/0007-qemu-Determinism-fixes.patch    |  11 +-
 ...d-use-relative-path-to-refer-to-file.patch |  29 ++-
 ...and-MAP_SHARED_VALIDATE-on-needed-li.patch |  11 +-
 ...t-against-buggy-or-malicious-guest-d.patch |  17 +-
 meta/recipes-devtools/qemu/qemu/cross.patch   |  12 +-
 .../qemu/{qemu_7.2.0.bb => qemu_8.0.0.bb}     |   0
 22 files changed, 107 insertions(+), 625 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu-native_7.2.0.bb => qemu-native_8.0.0.bb} (72%)
 rename meta/recipes-devtools/qemu/{qemu-system-native_7.2.0.bb => qemu-system-native_8.0.0.bb} (100%)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-Revert-linux-user-add-more-compat-ioctl-definitions.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-configure-Fix-check-tcg-not-executing-any-tests.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-contrib-vhost-user-blk-Replace-lseek64-with-lseek.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0002-Revert-linux-user-fix-compat-with-glibc-2.36-sys-mou.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0002-chardev-connect-socket-to-a-spawned-command.patch
 rename meta/recipes-devtools/qemu/{qemu_7.2.0.bb => qemu_8.0.0.bb} (100%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 7c6399da458..3a78e20145a 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -22,7 +22,7 @@ BINUVERSION ?= "2.40%"
 GDBVERSION ?= "13.%"
 GLIBCVERSION ?= "2.37"
 LINUXLIBCVERSION ?= "6.1%"
-QEMUVERSION ?= "7.2%"
+QEMUVERSION ?= "8.0%"
 GOVERSION ?= "1.20%"
 LLVMVERSION ?= "15.%"
 RUSTVERSION ?= "1.68%"
diff --git a/meta/recipes-devtools/qemu/qemu-native_7.2.0.bb b/meta/recipes-devtools/qemu/qemu-native_8.0.0.bb
similarity index 72%
rename from meta/recipes-devtools/qemu/qemu-native_7.2.0.bb
rename to meta/recipes-devtools/qemu/qemu-native_8.0.0.bb
index a94dc0b61eb..73a0f63f2b2 100644
--- a/meta/recipes-devtools/qemu/qemu-native_7.2.0.bb
+++ b/meta/recipes-devtools/qemu/qemu-native_8.0.0.bb
@@ -4,6 +4,6 @@ DEPENDS = "glib-2.0-native zlib-native ninja-native meson-native"
 
 require qemu-native.inc
 
-EXTRA_OECONF:append = " --target-list=${@get_qemu_usermode_target_list(d)} --disable-tools --disable-blobs --disable-guest-agent"
+EXTRA_OECONF:append = " --target-list=${@get_qemu_usermode_target_list(d)} --disable-tools --disable-install-blobs --disable-guest-agent"
 
 PACKAGECONFIG ??= "pie"
diff --git a/meta/recipes-devtools/qemu/qemu-system-native_7.2.0.bb b/meta/recipes-devtools/qemu/qemu-system-native_8.0.0.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-system-native_7.2.0.bb
rename to meta/recipes-devtools/qemu/qemu-system-native_8.0.0.bb
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index e2453dd8bcd..a373c9e5774 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -18,7 +18,6 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://powerpc_rom.bin \
            file://run-ptest \
            file://0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch \
-           file://0002-chardev-connect-socket-to-a-spawned-command.patch \
            file://0003-apic-fixup-fallthrough-to-PIC.patch \
            file://0004-configure-Add-pkg-config-handling-for-libgcrypt.patch \
            file://0005-qemu-Do-not-include-file-if-not-exists.patch \
@@ -27,18 +26,14 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0008-tests-meson.build-use-relative-path-to-refer-to-file.patch \
            file://0009-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch \
            file://0010-hw-pvrdma-Protect-against-buggy-or-malicious-guest-d.patch \
-           file://0001-contrib-vhost-user-blk-Replace-lseek64-with-lseek.patch \
            file://0002-linux-user-Replace-use-of-lfs64-related-functions-an.patch \
-           file://0001-configure-Fix-check-tcg-not-executing-any-tests.patch \
-           file://0001-Revert-linux-user-add-more-compat-ioctl-definitions.patch \
-           file://0002-Revert-linux-user-fix-compat-with-glibc-2.36-sys-mou.patch \
            file://0001-tracetool-use-relative-paths-for-line-preprocessor-d.patch \
            file://qemu-guest-agent.init \
            file://qemu-guest-agent.udev \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
-SRC_URI[sha256sum] = "5b49ce2687744dad494ae90a898c52204a3406e84d072482a1e1be854eeb2157"
+SRC_URI[sha256sum] = "bb60f0341531181d6cc3969dd19a013d0427a87f918193970d9adb91131e56d0"
 
 SRC_URI:append:class-target = " file://cross.patch"
 SRC_URI:append:class-nativesdk = " file://cross.patch"
diff --git a/meta/recipes-devtools/qemu/qemu/0001-Revert-linux-user-add-more-compat-ioctl-definitions.patch b/meta/recipes-devtools/qemu/qemu/0001-Revert-linux-user-add-more-compat-ioctl-definitions.patch
deleted file mode 100644
index cd8121fed14..00000000000
--- a/meta/recipes-devtools/qemu/qemu/0001-Revert-linux-user-add-more-compat-ioctl-definitions.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From afa96c55f2c270405de8984e2466067bbb44c0e4 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
-Date: Tue, 10 Jan 2023 12:49:00 -0500
-Subject: [PATCH] Revert "linux-user: add more compat ioctl definitions"
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-This reverts commit c5495f4ecb0cdaaf2e9dddeb48f1689cdb520ca0.
-
-glibc has fixed (in 2.36.9000-40-g774058d729) the problem
-that caused a clash when both sys/mount.h annd linux/mount.h
-are included, and backported this to the 2.36 stable release
-too:
-
-  https://sourceware.org/glibc/wiki/Release/2.36#Usage_of_.3Clinux.2Fmount.h.3E_and_.3Csys.2Fmount.h.3E
-
-It is saner for QEMU to remove the workaround it applied for
-glibc 2.36 and expect distros to ship the 2.36 maint release
-with the fix. This avoids needing to add a further workaround
-to QEMU to deal with the fact that linux/brtfs.h now also pulls
-in linux/mount.h via linux/fs.h since Linux 6.1
-
-Upstream-Status: Backport from v8.0 (master)
-
-Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
-Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
-Link: https://lore.kernel.org/r/20230110174901.2580297-2-berrange@redhat.com
-Signed-off-by: Joel Stanley <joel@jms.id.au>
----
- linux-user/syscall.c | 25 -------------------------
- 1 file changed, 25 deletions(-)
-
-diff --git a/linux-user/syscall.c b/linux-user/syscall.c
-index f95a6161e..510de8edc 100644
---- a/linux-user/syscall.c
-+++ b/linux-user/syscall.c
-@@ -111,31 +111,6 @@
- #define FS_IOC32_SETFLAGS              _IOW('f', 2, int)
- #define FS_IOC32_GETVERSION            _IOR('v', 1, int)
- #define FS_IOC32_SETVERSION            _IOW('v', 2, int)
--
--#define BLKGETSIZE64 _IOR(0x12,114,size_t)
--#define BLKDISCARD _IO(0x12,119)
--#define BLKIOMIN _IO(0x12,120)
--#define BLKIOOPT _IO(0x12,121)
--#define BLKALIGNOFF _IO(0x12,122)
--#define BLKPBSZGET _IO(0x12,123)
--#define BLKDISCARDZEROES _IO(0x12,124)
--#define BLKSECDISCARD _IO(0x12,125)
--#define BLKROTATIONAL _IO(0x12,126)
--#define BLKZEROOUT _IO(0x12,127)
--
--#define FIBMAP     _IO(0x00,1)
--#define FIGETBSZ   _IO(0x00,2)
--
--struct file_clone_range {
--        __s64 src_fd;
--        __u64 src_offset;
--        __u64 src_length;
--        __u64 dest_offset;
--};
--
--#define FICLONE         _IOW(0x94, 9, int)
--#define FICLONERANGE    _IOW(0x94, 13, struct file_clone_range)
--
- #else
- #include <linux/fs.h>
- #endif
diff --git a/meta/recipes-devtools/qemu/qemu/0001-configure-Fix-check-tcg-not-executing-any-tests.patch b/meta/recipes-devtools/qemu/qemu/0001-configure-Fix-check-tcg-not-executing-any-tests.patch
deleted file mode 100644
index 66ae4deae13..00000000000
--- a/meta/recipes-devtools/qemu/qemu/0001-configure-Fix-check-tcg-not-executing-any-tests.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From f295491361ed7fbe729ef6f029d83f68b8e2bee3 Mon Sep 17 00:00:00 2001
-From: Mukilan Thiyagarajan <quic_mthiyaga@quicinc.com>
-Date: Wed, 21 Dec 2022 09:04:06 +0000
-Subject: [PATCH] configure: Fix check-tcg not executing any tests
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-After configuring with --target-list=hexagon-linux-user
-running `make check-tcg` just prints the following:
-
-```
-make: Nothing to be done for 'check-tcg'
-```
-
-In the probe_target_compiler function, the 'break'
-command is used incorrectly. There are no lexically
-enclosing loops associated with that break command which
-is an unspecfied behaviour in the POSIX standard.
-
-The dash shell implementation aborts the currently executing
-loop, in this case, causing the rest of the logic for the loop
-in line 2490 to be skipped, which means no Makefiles are
-generated for the tcg target tests.
-
-Fixes: c3b570b5a9a24d25 (configure: don't enable
-cross compilers unless in target_list)
-
-Signed-off-by: Mukilan Thiyagarajan <quic_mthiyaga@quicinc.com>
-Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
-Link: https://patchew.org/QEMU/20221207082309.9966-1-quic._5Fmthiyaga@quicinc.com/
-Message-Id: <20221207082309.9966-1-quic_mthiyaga@quicinc.com>
-Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
-Message-Id: <20221221090411.1995037-2-alex.bennee@linaro.org>
-
-Upstream-Status: Backport [https://github.com/qemu/qemu/commit/73acb87be536d23e42db73a306104d8fd316ff20]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- configure | 4 +---
- 1 file changed, 1 insertion(+), 3 deletions(-)
-
-diff --git a/configure b/configure
-index 0c1db72b8..6b4589273 100755
---- a/configure
-+++ b/configure
-@@ -1881,9 +1881,7 @@ probe_target_compiler() {
-   # We shall skip configuring the target compiler if the user didn't
-   # bother enabling an appropriate guest. This avoids building
-   # extraneous firmware images and tests.
--  if test "${target_list#*$1}" != "$1"; then
--      break;
--  else
-+  if test "${target_list#*$1}" = "$1"; then
-       return 1
-   fi
- 
diff --git a/meta/recipes-devtools/qemu/qemu/0001-contrib-vhost-user-blk-Replace-lseek64-with-lseek.patch b/meta/recipes-devtools/qemu/qemu/0001-contrib-vhost-user-blk-Replace-lseek64-with-lseek.patch
deleted file mode 100644
index 1838c88f0e7..00000000000
--- a/meta/recipes-devtools/qemu/qemu/0001-contrib-vhost-user-blk-Replace-lseek64-with-lseek.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 38f5c88bf296dbbc04dcd57f36d64695055a2d3f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 16 Dec 2022 20:19:49 -0800
-Subject: [PATCH 1/2] contrib/vhost-user-blk: Replace lseek64 with lseek
-
-64bit off_t is already in use since build uses _FILE_OFFSET_BITS=64
-already. Using lseek/off_t also makes it work with latest must without
-using _LARGEFILE64_SOURCE macro. This macro is implied with _GNU_SOURCE
-when using glibc but not with musl.
-
-Upstream-Status: Submitted [https://lists.gnu.org/archive/html/qemu-devel/2022-12/msg02840.html]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Cc: Michael S. Tsirkin <mst@redhat.com>
-CC: Raphael Norwitz <raphael.norwitz@nutanix.com>
----
- contrib/vhost-user-blk/vhost-user-blk.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/contrib/vhost-user-blk/vhost-user-blk.c b/contrib/vhost-user-blk/vhost-user-blk.c
-index aa99877fcd..7941694e53 100644
---- a/contrib/vhost-user-blk/vhost-user-blk.c
-+++ b/contrib/vhost-user-blk/vhost-user-blk.c
-@@ -532,9 +532,9 @@ vub_get_blocksize(int fd)
- static void
- vub_initialize_config(int fd, struct virtio_blk_config *config)
- {
--    off64_t capacity;
-+    off_t capacity;
- 
--    capacity = lseek64(fd, 0, SEEK_END);
-+    capacity = lseek(fd, 0, SEEK_END);
-     config->capacity = capacity >> 9;
-     config->blk_size = vub_get_blocksize(fd);
-     config->size_max = 65536;
--- 
-2.39.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
index 6fb160e6d3d..c65508017d2 100644
--- a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
+++ b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
@@ -18,11 +18,11 @@ Signed-off-by: Roy Li <rongqing.li@windriver.com>
  hw/mips/malta.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/hw/mips/malta.c b/hw/mips/malta.c
-index 628851172..12d37f35d 100644
---- a/hw/mips/malta.c
-+++ b/hw/mips/malta.c
-@@ -61,7 +61,7 @@
+Index: qemu-8.0.0/hw/mips/malta.c
+===================================================================
+--- qemu-8.0.0.orig/hw/mips/malta.c
++++ qemu-8.0.0/hw/mips/malta.c
+@@ -64,7 +64,7 @@
  #define ENVP_PADDR          0x2000
  #define ENVP_VADDR          cpu_mips_phys_to_kseg0(NULL, ENVP_PADDR)
  #define ENVP_NB_ENTRIES     16
@@ -31,6 +31,3 @@ index 628851172..12d37f35d 100644
  
  /* Hardware addresses */
  #define FLASH_ADDRESS       0x1e000000ULL
--- 
-2.30.2
-
diff --git a/meta/recipes-devtools/qemu/qemu/0001-tracetool-use-relative-paths-for-line-preprocessor-d.patch b/meta/recipes-devtools/qemu/qemu/0001-tracetool-use-relative-paths-for-line-preprocessor-d.patch
index 5ef1184e3cc..a32ee57f8a4 100644
--- a/meta/recipes-devtools/qemu/qemu/0001-tracetool-use-relative-paths-for-line-preprocessor-d.patch
+++ b/meta/recipes-devtools/qemu/qemu/0001-tracetool-use-relative-paths-for-line-preprocessor-d.patch
@@ -16,11 +16,11 @@ Upstream-Status: Pending
  scripts/tracetool/backend/syslog.py | 4 +++-
  3 files changed, 9 insertions(+), 3 deletions(-)
 
-diff --git a/scripts/tracetool/backend/ftrace.py b/scripts/tracetool/backend/ftrace.py
-index 5fa30ccc08..baed2ae61c 100644
---- a/scripts/tracetool/backend/ftrace.py
-+++ b/scripts/tracetool/backend/ftrace.py
-@@ -12,6 +12,8 @@
+Index: qemu-8.0.0/scripts/tracetool/backend/ftrace.py
+===================================================================
+--- qemu-8.0.0.orig/scripts/tracetool/backend/ftrace.py
++++ qemu-8.0.0/scripts/tracetool/backend/ftrace.py
+@@ -12,6 +12,8 @@ __maintainer__ = "Stefan Hajnoczi"
  __email__      = "stefanha@redhat.com"
  
  
@@ -38,11 +38,11 @@ index 5fa30ccc08..baed2ae61c 100644
          fmt=event.fmt.rstrip("\n"),
          argnames=argnames)
  
-diff --git a/scripts/tracetool/backend/log.py b/scripts/tracetool/backend/log.py
-index 17ba1cd90e..de27b7e62e 100644
---- a/scripts/tracetool/backend/log.py
-+++ b/scripts/tracetool/backend/log.py
-@@ -12,6 +12,8 @@
+Index: qemu-8.0.0/scripts/tracetool/backend/log.py
+===================================================================
+--- qemu-8.0.0.orig/scripts/tracetool/backend/log.py
++++ qemu-8.0.0/scripts/tracetool/backend/log.py
+@@ -12,6 +12,8 @@ __maintainer__ = "Stefan Hajnoczi"
  __email__      = "stefanha@redhat.com"
  
  
@@ -60,11 +60,11 @@ index 17ba1cd90e..de27b7e62e 100644
          name=event.name,
          fmt=event.fmt.rstrip("\n"),
          argnames=argnames)
-diff --git a/scripts/tracetool/backend/syslog.py b/scripts/tracetool/backend/syslog.py
-index 5a3a00fe31..012970f6cc 100644
---- a/scripts/tracetool/backend/syslog.py
-+++ b/scripts/tracetool/backend/syslog.py
-@@ -12,6 +12,8 @@
+Index: qemu-8.0.0/scripts/tracetool/backend/syslog.py
+===================================================================
+--- qemu-8.0.0.orig/scripts/tracetool/backend/syslog.py
++++ qemu-8.0.0/scripts/tracetool/backend/syslog.py
+@@ -12,6 +12,8 @@ __maintainer__ = "Stefan Hajnoczi"
  __email__      = "stefanha@redhat.com"
  
  
@@ -82,6 +82,3 @@ index 5a3a00fe31..012970f6cc 100644
          name=event.name,
          fmt=event.fmt.rstrip("\n"),
          argnames=argnames)
--- 
-2.39.2
-
diff --git a/meta/recipes-devtools/qemu/qemu/0002-Revert-linux-user-fix-compat-with-glibc-2.36-sys-mou.patch b/meta/recipes-devtools/qemu/qemu/0002-Revert-linux-user-fix-compat-with-glibc-2.36-sys-mou.patch
deleted file mode 100644
index d754f21ad4d..00000000000
--- a/meta/recipes-devtools/qemu/qemu/0002-Revert-linux-user-fix-compat-with-glibc-2.36-sys-mou.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From e95c0a42940ca1cf763ca3374b36a9be030039d7 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
-Date: Tue, 10 Jan 2023 12:49:01 -0500
-Subject: [PATCH] Revert "linux-user: fix compat with glibc >= 2.36
- sys/mount.h"
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-This reverts commit 3cd3df2a9584e6f753bb62a0028bd67124ab5532.
-
-glibc has fixed (in 2.36.9000-40-g774058d729) the problem
-that caused a clash when both sys/mount.h annd linux/mount.h
-are included, and backported this to the 2.36 stable release
-too:
-
-  https://sourceware.org/glibc/wiki/Release/2.36#Usage_of_.3Clinux.2Fmount.h.3E_and_.3Csys.2Fmount.h.3E
-
-It is saner for QEMU to remove the workaround it applied for
-glibc 2.36 and expect distros to ship the 2.36 maint release
-with the fix. This avoids needing to add a further workaround
-to QEMU to deal with the fact that linux/brtfs.h now also pulls
-in linux/mount.h via linux/fs.h since Linux 6.1
-
-Upstream-Status: Backport from v8.0 (master)
-
-Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
-Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
-Link: https://lore.kernel.org/r/20230110174901.2580297-3-berrange@redhat.com
-Signed-off-by: Joel Stanley <joel@jms.id.au>
----
- linux-user/syscall.c | 18 ------------------
- meson.build          |  2 --
- 2 files changed, 20 deletions(-)
-
-diff --git a/linux-user/syscall.c b/linux-user/syscall.c
-index 510de8edc..13a67b84b 100644
---- a/linux-user/syscall.c
-+++ b/linux-user/syscall.c
-@@ -95,25 +95,7 @@
- #include <linux/soundcard.h>
- #include <linux/kd.h>
- #include <linux/mtio.h>
--
--#ifdef HAVE_SYS_MOUNT_FSCONFIG
--/*
-- * glibc >= 2.36 linux/mount.h conflicts with sys/mount.h,
-- * which in turn prevents use of linux/fs.h. So we have to
-- * define the constants ourselves for now.
-- */
--#define FS_IOC_GETFLAGS                _IOR('f', 1, long)
--#define FS_IOC_SETFLAGS                _IOW('f', 2, long)
--#define FS_IOC_GETVERSION              _IOR('v', 1, long)
--#define FS_IOC_SETVERSION              _IOW('v', 2, long)
--#define FS_IOC_FIEMAP                  _IOWR('f', 11, struct fiemap)
--#define FS_IOC32_GETFLAGS              _IOR('f', 1, int)
--#define FS_IOC32_SETFLAGS              _IOW('f', 2, int)
--#define FS_IOC32_GETVERSION            _IOR('v', 1, int)
--#define FS_IOC32_SETVERSION            _IOW('v', 2, int)
--#else
- #include <linux/fs.h>
--#endif
- #include <linux/fd.h>
- #if defined(CONFIG_FIEMAP)
- #include <linux/fiemap.h>
-diff --git a/meson.build b/meson.build
-index e44432370..f37ba4114 100644
---- a/meson.build
-+++ b/meson.build
-@@ -2032,8 +2032,6 @@ config_host_data.set('HAVE_OPTRESET',
-                      cc.has_header_symbol('getopt.h', 'optreset'))
- config_host_data.set('HAVE_IPPROTO_MPTCP',
-                      cc.has_header_symbol('netinet/in.h', 'IPPROTO_MPTCP'))
--config_host_data.set('HAVE_SYS_MOUNT_FSCONFIG',
--                     cc.has_header_symbol('sys/mount.h', 'FSCONFIG_SET_FLAG'))
- 
- # has_member
- config_host_data.set('HAVE_SIGEV_NOTIFY_THREAD_ID',
diff --git a/meta/recipes-devtools/qemu/qemu/0002-chardev-connect-socket-to-a-spawned-command.patch b/meta/recipes-devtools/qemu/qemu/0002-chardev-connect-socket-to-a-spawned-command.patch
deleted file mode 100644
index 63a99c96205..00000000000
--- a/meta/recipes-devtools/qemu/qemu/0002-chardev-connect-socket-to-a-spawned-command.patch
+++ /dev/null
@@ -1,246 +0,0 @@
-From 14cd62607c9de232edf0a9b8503bd02783e03411 Mon Sep 17 00:00:00 2001
-From: Alistair Francis <alistair.francis@xilinx.com>
-Date: Thu, 21 Dec 2017 11:35:16 -0800
-Subject: [PATCH 02/12] chardev: connect socket to a spawned command
-
-The command is started in a shell (sh -c) with stdin connect to QEMU
-via a Unix domain stream socket. QEMU then exchanges data via its own
-end of the socket, just like it normally does.
-
-"-chardev socket" supports some ways of connecting via protocols like
-telnet, but that is only a subset of the functionality supported by
-tools socat. To use socat instead, for example to connect via a socks
-proxy, use:
-
-  -chardev 'socket,id=socat,cmd=exec socat FD:0 SOCKS4A:socks-proxy.localdomain:example.com:9999,,socksuser=nobody' \
-  -device usb-serial,chardev=socat
-
-Beware that commas in the command must be escaped as double commas.
-
-Or interactively in the console:
-   (qemu) chardev-add socket,id=cat,cmd=cat
-   (qemu) device_add usb-serial,chardev=cat
-   ^ac
-   # cat >/dev/ttyUSB0
-   hello
-   hello
-
-Another usage is starting swtpm from inside QEMU. swtpm will
-automatically shut down once it looses the connection to the parent
-QEMU, so there is no risk of lingering processes:
-
-  -chardev 'socket,id=chrtpm0,cmd=exec swtpm socket --terminate --ctrl type=unixio,,clientfd=0 --tpmstate dir=... --log file=swtpm.log' \
-  -tpmdev emulator,id=tpm0,chardev=chrtpm0 \
-  -device tpm-tis,tpmdev=tpm0
-
-The patch was discussed upstream, but QEMU developers believe that the
-code calling QEMU should be responsible for managing additional
-processes. In OE-core, that would imply enhancing runqemu and
-oeqa. This patch is a simpler solution.
-
-Because it is not going upstream, the patch was written so that it is
-as simple as possible.
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
-
----
- chardev/char-socket.c | 100 ++++++++++++++++++++++++++++++++++++++++++
- chardev/char.c        |   3 ++
- qapi/char.json        |   5 +++
- 3 files changed, 108 insertions(+)
-
-diff --git a/chardev/char-socket.c b/chardev/char-socket.c
-index fab2d791d..c79641f24 100644
---- a/chardev/char-socket.c
-+++ b/chardev/char-socket.c
-@@ -1315,6 +1315,67 @@ static bool qmp_chardev_validate_socket(ChardevSocket *sock,
-     return true;
- }
- 
-+#ifndef _WIN32
-+static void chardev_open_socket_cmd(Chardev *chr,
-+                                    const char *cmd,
-+                                    Error **errp)
-+{
-+    int fds[2] = { -1, -1 };
-+    QIOChannelSocket *sioc = NULL;
-+    pid_t pid = -1;
-+    const char *argv[] = { "/bin/sh", "-c", cmd, NULL };
-+
-+    /*
-+     * We need a Unix domain socket for commands like swtpm and a single
-+     * connection, therefore we cannot use qio_channel_command_new_spawn()
-+     * without patching it first. Duplicating the functionality is easier.
-+     */
-+    if (socketpair(AF_UNIX, SOCK_STREAM|SOCK_CLOEXEC, 0, fds)) {
-+        error_setg_errno(errp, errno, "Error creating socketpair(AF_UNIX, SOCK_STREAM|SOCK_CLOEXEC)");
-+        goto error;
-+    }
-+
-+    pid = qemu_fork(errp);
-+    if (pid < 0) {
-+        goto error;
-+    }
-+
-+    if (!pid) {
-+        /* child */
-+        dup2(fds[1], STDIN_FILENO);
-+        execv(argv[0], (char * const *)argv);
-+        _exit(1);
-+    }
-+
-+    /*
-+     * Hand over our end of the socket pair to the qio channel.
-+     *
-+     * We don't reap the child because it is expected to keep
-+     * running. We also don't support the "reconnect" option for the
-+     * same reason.
-+     */
-+    sioc = qio_channel_socket_new_fd(fds[0], errp);
-+    if (!sioc) {
-+        goto error;
-+    }
-+    fds[0] = -1;
-+
-+    g_free(chr->filename);
-+    chr->filename = g_strdup_printf("cmd:%s", cmd);
-+    tcp_chr_new_client(chr, sioc);
-+
-+ error:
-+    if (fds[0] >= 0) {
-+        close(fds[0]);
-+    }
-+    if (fds[1] >= 0) {
-+        close(fds[1]);
-+    }
-+    if (sioc) {
-+        object_unref(OBJECT(sioc));
-+    }
-+}
-+#endif
- 
- static void qmp_chardev_open_socket(Chardev *chr,
-                                     ChardevBackend *backend,
-@@ -1323,6 +1384,9 @@ static void qmp_chardev_open_socket(Chardev *chr,
- {
-     SocketChardev *s = SOCKET_CHARDEV(chr);
-     ChardevSocket *sock = backend->u.socket.data;
-+#ifndef _WIN32
-+    const char *cmd     = sock->cmd;
-+#endif
-     bool do_nodelay     = sock->has_nodelay ? sock->nodelay : false;
-     bool is_listen      = sock->has_server  ? sock->server  : true;
-     bool is_telnet      = sock->has_telnet  ? sock->telnet  : false;
-@@ -1393,6 +1457,14 @@ static void qmp_chardev_open_socket(Chardev *chr,
- 
-     update_disconnected_filename(s);
- 
-+#ifndef _WIN32
-+    if (cmd) {
-+        chardev_open_socket_cmd(chr, cmd, errp);
-+
-+        /* everything ready (or failed permanently) before we return */
-+        *be_opened = true;
-+    } else
-+#endif
-     if (s->is_listen) {
-         if (qmp_chardev_open_socket_server(chr, is_telnet || is_tn3270,
-                                            is_waitconnect, errp) < 0) {
-@@ -1412,6 +1484,9 @@ static void qemu_chr_parse_socket(QemuOpts *opts, ChardevBackend *backend,
-     const char *host = qemu_opt_get(opts, "host");
-     const char *port = qemu_opt_get(opts, "port");
-     const char *fd = qemu_opt_get(opts, "fd");
-+#ifndef _WIN32
-+    const char *cmd = qemu_opt_get(opts, "cmd");
-+#endif
- #ifdef CONFIG_LINUX
-     bool tight = qemu_opt_get_bool(opts, "tight", true);
-     bool abstract = qemu_opt_get_bool(opts, "abstract", false);
-@@ -1419,6 +1494,20 @@ static void qemu_chr_parse_socket(QemuOpts *opts, ChardevBackend *backend,
-     SocketAddressLegacy *addr;
-     ChardevSocket *sock;
- 
-+#ifndef _WIN32
-+    if (cmd) {
-+        /*
-+         * Here we have to ensure that no options are set which are incompatible with
-+         * spawning a command, otherwise unmodified code that doesn't know about
-+         * command spawning (like socket_reconnect_timeout()) might get called.
-+         */
-+        if (path || sock->server || sock->has_telnet || sock->has_tn3270 || sock->reconnect || host || port || sock->tls_creds) {
-+            error_setg(errp, "chardev: socket: cmd does not support any additional options");
-+            return;
-+        }
-+    } else
-+#endif
-+
-     if ((!!path + !!fd + !!host) > 1) {
-         error_setg(errp,
-                    "None or one of 'path', 'fd' or 'host' option required.");
-@@ -1469,13 +1558,24 @@ static void qemu_chr_parse_socket(QemuOpts *opts, ChardevBackend *backend,
-     sock->tls_creds = g_strdup(qemu_opt_get(opts, "tls-creds"));
-     sock->has_tls_authz = qemu_opt_get(opts, "tls-authz");
-     sock->tls_authz = g_strdup(qemu_opt_get(opts, "tls-authz"));
-+#ifndef _WIN32
-+    sock->cmd = g_strdup(cmd);
-+#endif
- 
-     addr = g_new0(SocketAddressLegacy, 1);
-+#ifndef _WIN32
-+    if (path || cmd) {
-+#else
-     if (path) {
-+#endif
-         UnixSocketAddress *q_unix;
-         addr->type = SOCKET_ADDRESS_TYPE_UNIX;
-         q_unix = addr->u.q_unix.data = g_new0(UnixSocketAddress, 1);
-+#ifndef _WIN32
-+        q_unix->path = cmd ? g_strdup_printf("cmd:%s", cmd) : g_strdup(path);
-+#else
-         q_unix->path = g_strdup(path);
-+#endif
- #ifdef CONFIG_LINUX
-         q_unix->has_tight = true;
-         q_unix->tight = tight;
-diff --git a/chardev/char.c b/chardev/char.c
-index 0169d8dde..ce9a21f41 100644
---- a/chardev/char.c
-+++ b/chardev/char.c
-@@ -835,6 +835,9 @@ QemuOptsList qemu_chardev_opts = {
-         },{
-             .name = "path",
-             .type = QEMU_OPT_STRING,
-+        },{
-+            .name = "cmd",
-+            .type = QEMU_OPT_STRING,
-         },{
-             .name = "host",
-             .type = QEMU_OPT_STRING,
-diff --git a/qapi/char.json b/qapi/char.json
-index 7b4215157..37feabdac 100644
---- a/qapi/char.json
-+++ b/qapi/char.json
-@@ -250,6 +250,10 @@
- #
- # @addr: socket address to listen on (server=true)
- #        or connect to (server=false)
-+# @cmd: command to run via "sh -c" with stdin as one end of
-+#       a AF_UNIX SOCK_DSTREAM socket pair. The other end
-+#       is used by the chardev. Either an addr or a cmd can
-+#       be specified, but not both.
- # @tls-creds: the ID of the TLS credentials object (since 2.6)
- # @tls-authz: the ID of the QAuthZ authorization object against which
- #             the client's x509 distinguished name will be validated. This
-@@ -276,6 +280,7 @@
- ##
- { 'struct': 'ChardevSocket',
-   'data': { 'addr': 'SocketAddressLegacy',
-+            '*cmd': 'str',
-             '*tls-creds': 'str',
-             '*tls-authz'  : 'str',
-             '*server': 'bool',
--- 
-2.30.2
-
diff --git a/meta/recipes-devtools/qemu/qemu/0002-linux-user-Replace-use-of-lfs64-related-functions-an.patch b/meta/recipes-devtools/qemu/qemu/0002-linux-user-Replace-use-of-lfs64-related-functions-an.patch
index 14b5338eb26..ceae67be644 100644
--- a/meta/recipes-devtools/qemu/qemu/0002-linux-user-Replace-use-of-lfs64-related-functions-an.patch
+++ b/meta/recipes-devtools/qemu/qemu/0002-linux-user-Replace-use-of-lfs64-related-functions-an.patch
@@ -16,11 +16,11 @@ Cc: Laurent Vivier <laurent@vivier.eu>
  linux-user/syscall.c | 153 +++++++++++--------------------------------
  1 file changed, 39 insertions(+), 114 deletions(-)
 
-diff --git a/linux-user/syscall.c b/linux-user/syscall.c
-index 1f8c10f8ef..30d83ed162 100644
---- a/linux-user/syscall.c
-+++ b/linux-user/syscall.c
-@@ -795,8 +795,8 @@ safe_syscall6(ssize_t, copy_file_range, int, infd, loff_t *, pinoff,
+Index: qemu-8.0.0/linux-user/syscall.c
+===================================================================
+--- qemu-8.0.0.orig/linux-user/syscall.c
++++ qemu-8.0.0/linux-user/syscall.c
+@@ -761,8 +761,8 @@ safe_syscall6(ssize_t, copy_file_range,
   */
  #define safe_ioctl(...) safe_syscall(__NR_ioctl, __VA_ARGS__)
  /* Similarly for fcntl. Note that callers must always:
@@ -31,7 +31,7 @@ index 1f8c10f8ef..30d83ed162 100644
   * This will then work and use a 64-bit offset for both 32-bit and 64-bit hosts.
   */
  #ifdef __NR_fcntl64
-@@ -6797,13 +6797,13 @@ static int target_to_host_fcntl_cmd(int cmd)
+@@ -6813,13 +6813,13 @@ static int target_to_host_fcntl_cmd(int
          ret = cmd;
          break;
      case TARGET_F_GETLK:
@@ -48,7 +48,7 @@ index 1f8c10f8ef..30d83ed162 100644
          break;
      case TARGET_F_GETOWN:
          ret = F_GETOWN;
-@@ -6817,17 +6817,6 @@ static int target_to_host_fcntl_cmd(int cmd)
+@@ -6833,17 +6833,6 @@ static int target_to_host_fcntl_cmd(int
      case TARGET_F_SETSIG:
          ret = F_SETSIG;
          break;
@@ -66,7 +66,7 @@ index 1f8c10f8ef..30d83ed162 100644
      case TARGET_F_SETLEASE:
          ret = F_SETLEASE;
          break;
-@@ -6879,8 +6868,8 @@ static int target_to_host_fcntl_cmd(int cmd)
+@@ -6895,8 +6884,8 @@ static int target_to_host_fcntl_cmd(int
       * them to 5, 6 and 7 before making the syscall(). Since we make the
       * syscall directly, adjust to what is supported by the kernel.
       */
@@ -77,7 +77,7 @@ index 1f8c10f8ef..30d83ed162 100644
      }
  #endif
  
-@@ -6913,55 +6902,11 @@ static int host_to_target_flock(int type)
+@@ -6929,55 +6918,11 @@ static int host_to_target_flock(int type
      return type;
  }
  
@@ -136,7 +136,7 @@ index 1f8c10f8ef..30d83ed162 100644
      abi_short l_type;
      abi_short l_whence;
      abi_llong l_start;
-@@ -6969,10 +6914,10 @@ struct target_oabi_flock64 {
+@@ -6985,10 +6930,10 @@ struct target_oabi_flock64 {
      abi_int   l_pid;
  } QEMU_PACKED;
  
@@ -149,7 +149,7 @@ index 1f8c10f8ef..30d83ed162 100644
      int l_type;
  
      if (!lock_user_struct(VERIFY_READ, target_fl, target_flock_addr, 1)) {
-@@ -6993,10 +6938,10 @@ static inline abi_long copy_from_user_oabi_flock64(struct flock64 *fl,
+@@ -7009,10 +6954,10 @@ static inline abi_long copy_from_user_oa
      return 0;
  }
  
@@ -163,7 +163,7 @@ index 1f8c10f8ef..30d83ed162 100644
      short l_type;
  
      if (!lock_user_struct(VERIFY_WRITE, target_fl, target_flock_addr, 0)) {
-@@ -7014,10 +6959,10 @@ static inline abi_long copy_to_user_oabi_flock64(abi_ulong target_flock_addr,
+@@ -7030,10 +6975,10 @@ static inline abi_long copy_to_user_oabi
  }
  #endif
  
@@ -176,7 +176,7 @@ index 1f8c10f8ef..30d83ed162 100644
      int l_type;
  
      if (!lock_user_struct(VERIFY_READ, target_fl, target_flock_addr, 1)) {
-@@ -7038,10 +6983,10 @@ static inline abi_long copy_from_user_flock64(struct flock64 *fl,
+@@ -7054,10 +6999,10 @@ static inline abi_long copy_from_user_fl
      return 0;
  }
  
@@ -190,7 +190,7 @@ index 1f8c10f8ef..30d83ed162 100644
      short l_type;
  
      if (!lock_user_struct(VERIFY_WRITE, target_fl, target_flock_addr, 0)) {
-@@ -7060,7 +7005,7 @@ static inline abi_long copy_to_user_flock64(abi_ulong target_flock_addr,
+@@ -7076,7 +7021,7 @@ static inline abi_long copy_to_user_floc
  
  static abi_long do_fcntl(int fd, int cmd, abi_ulong arg)
  {
@@ -199,7 +199,7 @@ index 1f8c10f8ef..30d83ed162 100644
  #ifdef F_GETOWN_EX
      struct f_owner_ex fox;
      struct target_f_owner_ex *target_fox;
-@@ -7073,6 +7018,7 @@ static abi_long do_fcntl(int fd, int cmd, abi_ulong arg)
+@@ -7089,6 +7034,7 @@ static abi_long do_fcntl(int fd, int cmd
  
      switch(cmd) {
      case TARGET_F_GETLK:
@@ -207,7 +207,7 @@ index 1f8c10f8ef..30d83ed162 100644
          ret = copy_from_user_flock(&fl64, arg);
          if (ret) {
              return ret;
-@@ -7082,32 +7028,11 @@ static abi_long do_fcntl(int fd, int cmd, abi_ulong arg)
+@@ -7098,32 +7044,11 @@ static abi_long do_fcntl(int fd, int cmd
              ret = copy_to_user_flock(arg, &fl64);
          }
          break;
@@ -241,7 +241,7 @@ index 1f8c10f8ef..30d83ed162 100644
          if (ret) {
              return ret;
          }
-@@ -7332,7 +7257,7 @@ static inline abi_long target_truncate64(CPUArchState *cpu_env, const char *arg1
+@@ -7348,7 +7273,7 @@ static inline abi_long target_truncate64
          arg2 = arg3;
          arg3 = arg4;
      }
@@ -250,7 +250,7 @@ index 1f8c10f8ef..30d83ed162 100644
  }
  #endif
  
-@@ -7346,7 +7271,7 @@ static inline abi_long target_ftruncate64(CPUArchState *cpu_env, abi_long arg1,
+@@ -7362,7 +7287,7 @@ static inline abi_long target_ftruncate6
          arg2 = arg3;
          arg3 = arg4;
      }
@@ -259,7 +259,7 @@ index 1f8c10f8ef..30d83ed162 100644
  }
  #endif
  
-@@ -8452,7 +8377,7 @@ static int do_getdents(abi_long dirfd, abi_long arg2, abi_long count)
+@@ -8598,7 +8523,7 @@ static int do_getdents(abi_long dirfd, a
      void *tdirp;
      int hlen, hoff, toff;
      int hreclen, treclen;
@@ -268,7 +268,7 @@ index 1f8c10f8ef..30d83ed162 100644
  
      hdirp = g_try_malloc(count);
      if (!hdirp) {
-@@ -8505,7 +8430,7 @@ static int do_getdents(abi_long dirfd, abi_long arg2, abi_long count)
+@@ -8651,7 +8576,7 @@ static int do_getdents(abi_long dirfd, a
               * Return what we have, resetting the file pointer to the
               * location of the first record not returned.
               */
@@ -277,7 +277,7 @@ index 1f8c10f8ef..30d83ed162 100644
              break;
          }
  
-@@ -8539,7 +8464,7 @@ static int do_getdents64(abi_long dirfd, abi_long arg2, abi_long count)
+@@ -8685,7 +8610,7 @@ static int do_getdents64(abi_long dirfd,
      void *tdirp;
      int hlen, hoff, toff;
      int hreclen, treclen;
@@ -286,7 +286,7 @@ index 1f8c10f8ef..30d83ed162 100644
  
      hdirp = g_try_malloc(count);
      if (!hdirp) {
-@@ -8581,7 +8506,7 @@ static int do_getdents64(abi_long dirfd, abi_long arg2, abi_long count)
+@@ -8727,7 +8652,7 @@ static int do_getdents64(abi_long dirfd,
               * Return what we have, resetting the file pointer to the
               * location of the first record not returned.
               */
@@ -295,7 +295,7 @@ index 1f8c10f8ef..30d83ed162 100644
              break;
          }
  
-@@ -11114,7 +11039,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
+@@ -11158,7 +11083,7 @@ static abi_long do_syscall1(CPUArchState
                  return -TARGET_EFAULT;
              }
          }
@@ -304,7 +304,7 @@ index 1f8c10f8ef..30d83ed162 100644
          unlock_user(p, arg2, ret);
          return ret;
      case TARGET_NR_pwrite64:
-@@ -11131,7 +11056,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
+@@ -11175,7 +11100,7 @@ static abi_long do_syscall1(CPUArchState
                  return -TARGET_EFAULT;
              }
          }
@@ -313,7 +313,7 @@ index 1f8c10f8ef..30d83ed162 100644
          unlock_user(p, arg2, 0);
          return ret;
  #endif
-@@ -11954,14 +11879,14 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
+@@ -11998,14 +11923,14 @@ static abi_long do_syscall1(CPUArchState
      case TARGET_NR_fcntl64:
      {
          int cmd;
@@ -333,7 +333,7 @@ index 1f8c10f8ef..30d83ed162 100644
          }
  #endif
  
-@@ -11971,7 +11896,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
+@@ -12015,7 +11940,7 @@ static abi_long do_syscall1(CPUArchState
          }
  
          switch(arg2) {
@@ -342,7 +342,7 @@ index 1f8c10f8ef..30d83ed162 100644
              ret = copyfrom(&fl, arg3);
              if (ret) {
                  break;
-@@ -11982,8 +11907,8 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
+@@ -12026,8 +11951,8 @@ static abi_long do_syscall1(CPUArchState
              }
  	    break;
  
@@ -353,6 +353,3 @@ index 1f8c10f8ef..30d83ed162 100644
              ret = copyfrom(&fl, arg3);
              if (ret) {
                  break;
--- 
-2.39.0
-
diff --git a/meta/recipes-devtools/qemu/qemu/0003-apic-fixup-fallthrough-to-PIC.patch b/meta/recipes-devtools/qemu/qemu/0003-apic-fixup-fallthrough-to-PIC.patch
index f350ffce47f..e85f8202e9a 100644
--- a/meta/recipes-devtools/qemu/qemu/0003-apic-fixup-fallthrough-to-PIC.patch
+++ b/meta/recipes-devtools/qemu/qemu/0003-apic-fixup-fallthrough-to-PIC.patch
@@ -29,11 +29,11 @@ Signed-off-by: He Zhe <zhe.he@windriver.com>
  hw/intc/apic.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/hw/intc/apic.c b/hw/intc/apic.c
-index 3df11c34d..9506c88ce 100644
---- a/hw/intc/apic.c
-+++ b/hw/intc/apic.c
-@@ -605,7 +605,7 @@ int apic_accept_pic_intr(DeviceState *dev)
+Index: qemu-8.0.0/hw/intc/apic.c
+===================================================================
+--- qemu-8.0.0.orig/hw/intc/apic.c
++++ qemu-8.0.0/hw/intc/apic.c
+@@ -607,7 +607,7 @@ int apic_accept_pic_intr(DeviceState *de
      APICCommonState *s = APIC(dev);
      uint32_t lvt0;
  
@@ -42,6 +42,3 @@ index 3df11c34d..9506c88ce 100644
          return -1;
  
      lvt0 = s->lvt[APIC_LVT_LINT0];
--- 
-2.30.2
-
diff --git a/meta/recipes-devtools/qemu/qemu/0004-configure-Add-pkg-config-handling-for-libgcrypt.patch b/meta/recipes-devtools/qemu/qemu/0004-configure-Add-pkg-config-handling-for-libgcrypt.patch
index 6faebd4e091..02f22143c13 100644
--- a/meta/recipes-devtools/qemu/qemu/0004-configure-Add-pkg-config-handling-for-libgcrypt.patch
+++ b/meta/recipes-devtools/qemu/qemu/0004-configure-Add-pkg-config-handling-for-libgcrypt.patch
@@ -14,11 +14,11 @@ Signed-off-by: He Zhe <zhe.he@windriver.com>
  meson.build | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/meson.build b/meson.build
-index 861de93c4..d45ff2d7c 100644
---- a/meson.build
-+++ b/meson.build
-@@ -1063,7 +1063,7 @@ endif
+Index: qemu-8.0.0/meson.build
+===================================================================
+--- qemu-8.0.0.orig/meson.build
++++ qemu-8.0.0/meson.build
+@@ -1213,7 +1213,7 @@ endif
  if not gnutls_crypto.found()
    if (not get_option('gcrypt').auto() or have_system) and not get_option('nettle').enabled()
      gcrypt = dependency('libgcrypt', version: '>=1.8',
@@ -27,6 +27,3 @@ index 861de93c4..d45ff2d7c 100644
                          required: get_option('gcrypt'),
                          kwargs: static_kwargs)
      # Debian has removed -lgpg-error from libgcrypt-config
--- 
-2.30.2
-
diff --git a/meta/recipes-devtools/qemu/qemu/0005-qemu-Do-not-include-file-if-not-exists.patch b/meta/recipes-devtools/qemu/qemu/0005-qemu-Do-not-include-file-if-not-exists.patch
index 3f3c39f996b..38aa4c3bbe3 100644
--- a/meta/recipes-devtools/qemu/qemu/0005-qemu-Do-not-include-file-if-not-exists.patch
+++ b/meta/recipes-devtools/qemu/qemu/0005-qemu-Do-not-include-file-if-not-exists.patch
@@ -16,11 +16,11 @@ Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
  linux-user/syscall.c | 2 ++
  1 file changed, 2 insertions(+)
 
-diff --git a/linux-user/syscall.c b/linux-user/syscall.c
-index f65045efe..340e0c6f0 100644
---- a/linux-user/syscall.c
-+++ b/linux-user/syscall.c
-@@ -113,7 +113,9 @@
+Index: qemu-8.0.0/linux-user/syscall.c
+===================================================================
+--- qemu-8.0.0.orig/linux-user/syscall.c
++++ qemu-8.0.0/linux-user/syscall.c
+@@ -115,7 +115,9 @@
  #include <linux/blkpg.h>
  #include <netpacket/packet.h>
  #include <linux/netlink.h>
@@ -30,6 +30,3 @@ index f65045efe..340e0c6f0 100644
  #include <linux/rtc.h>
  #include <sound/asound.h>
  #ifdef HAVE_BTRFS_H
--- 
-2.30.2
-
diff --git a/meta/recipes-devtools/qemu/qemu/0006-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch b/meta/recipes-devtools/qemu/qemu/0006-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
index 75c03693180..5d1d7c6881c 100644
--- a/meta/recipes-devtools/qemu/qemu/0006-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
+++ b/meta/recipes-devtools/qemu/qemu/0006-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
@@ -23,11 +23,11 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
  linux-user/mmap.c | 10 +++++++---
  1 file changed, 7 insertions(+), 3 deletions(-)
 
-diff --git a/linux-user/mmap.c b/linux-user/mmap.c
-index c125031b9..e651834a5 100644
---- a/linux-user/mmap.c
-+++ b/linux-user/mmap.c
-@@ -749,12 +749,16 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
+Index: qemu-8.0.0/linux-user/mmap.c
+===================================================================
+--- qemu-8.0.0.orig/linux-user/mmap.c
++++ qemu-8.0.0/linux-user/mmap.c
+@@ -776,12 +776,16 @@ abi_long target_mremap(abi_ulong old_add
      int prot;
      void *host_addr;
  
@@ -47,6 +47,3 @@ index c125031b9..e651834a5 100644
          return -1;
      }
  
--- 
-2.30.2
-
diff --git a/meta/recipes-devtools/qemu/qemu/0007-qemu-Determinism-fixes.patch b/meta/recipes-devtools/qemu/qemu/0007-qemu-Determinism-fixes.patch
index 0d7dae36891..d3f965e0703 100644
--- a/meta/recipes-devtools/qemu/qemu/0007-qemu-Determinism-fixes.patch
+++ b/meta/recipes-devtools/qemu/qemu/0007-qemu-Determinism-fixes.patch
@@ -16,10 +16,10 @@ RP 2021/3/1
  scripts/decodetree.py | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/scripts/decodetree.py b/scripts/decodetree.py
-index a03dc6b5e..4ea24c1f3 100644
---- a/scripts/decodetree.py
-+++ b/scripts/decodetree.py
+Index: qemu-8.0.0/scripts/decodetree.py
+===================================================================
+--- qemu-8.0.0.orig/scripts/decodetree.py
++++ qemu-8.0.0/scripts/decodetree.py
 @@ -1328,7 +1328,7 @@ def main():
      toppat = ExcMultiPattern(0)
  
@@ -29,6 +29,3 @@ index a03dc6b5e..4ea24c1f3 100644
          f = open(filename, 'rt', encoding='utf-8')
          parse_file(f, toppat)
          f.close()
--- 
-2.30.2
-
diff --git a/meta/recipes-devtools/qemu/qemu/0008-tests-meson.build-use-relative-path-to-refer-to-file.patch b/meta/recipes-devtools/qemu/qemu/0008-tests-meson.build-use-relative-path-to-refer-to-file.patch
index 43d3c7cf1f3..a84364ccc18 100644
--- a/meta/recipes-devtools/qemu/qemu/0008-tests-meson.build-use-relative-path-to-refer-to-file.patch
+++ b/meta/recipes-devtools/qemu/qemu/0008-tests-meson.build-use-relative-path-to-refer-to-file.patch
@@ -17,22 +17,25 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  tests/unit/meson.build | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/tests/unit/meson.build b/tests/unit/meson.build
-index 96b295263..e4c3246dc 100644
---- a/tests/unit/meson.build
-+++ b/tests/unit/meson.build
-@@ -44,9 +44,9 @@ tests = {
+Index: qemu-8.0.0/tests/unit/meson.build
+===================================================================
+--- qemu-8.0.0.orig/tests/unit/meson.build
++++ qemu-8.0.0/tests/unit/meson.build
+@@ -46,7 +46,7 @@ tests = {
    'test-keyval': [testqapi],
    'test-logging': [],
    'test-uuid': [],
 -  'ptimer-test': ['ptimer-test-stubs.c', meson.project_source_root() / 'hw/core/ptimer.c'],
 +  'ptimer-test': ['ptimer-test-stubs.c', '../../hw/core/ptimer.c'],
    'test-qapi-util': [],
--  'test-smp-parse': [qom, meson.project_source_root() / 'hw/core/machine-smp.c'],
-+  'test-smp-parse': [qom, '../../hw/core/machine-smp.c'],
- }
- 
- if have_system or have_tools
--- 
-2.30.2
-
+   'test-interval-tree': [],
+   'test-xs-node': [qom],
+@@ -136,7 +136,7 @@ if have_system
+     'test-util-sockets': ['socket-helpers.c'],
+     'test-base64': [],
+     'test-bufferiszero': [],
+-    'test-smp-parse': [qom, meson.project_source_root() / 'hw/core/machine-smp.c'],
++    'test-smp-parse': [qom, '../../hw/core/machine-smp.c'],
+     'test-vmstate': [migration, io],
+     'test-yank': ['socket-helpers.c', qom, io, chardev]
+   }
diff --git a/meta/recipes-devtools/qemu/qemu/0009-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch b/meta/recipes-devtools/qemu/qemu/0009-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
index 23d0a698020..4de6cc24458 100644
--- a/meta/recipes-devtools/qemu/qemu/0009-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
+++ b/meta/recipes-devtools/qemu/qemu/0009-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
@@ -18,10 +18,10 @@ Cc: Michael S. Tsirkin <mst@redhat.com>
  util/mmap-alloc.c | 10 +++++++---
  1 file changed, 7 insertions(+), 3 deletions(-)
 
-diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
-index 893d86435..86d3cda24 100644
---- a/util/mmap-alloc.c
-+++ b/util/mmap-alloc.c
+Index: qemu-8.0.0/util/mmap-alloc.c
+===================================================================
+--- qemu-8.0.0.orig/util/mmap-alloc.c
++++ qemu-8.0.0/util/mmap-alloc.c
 @@ -10,14 +10,18 @@
   * later.  See the COPYING file in the top-level directory.
   */
@@ -44,6 +44,3 @@ index 893d86435..86d3cda24 100644
  #include "qemu/mmap-alloc.h"
  #include "qemu/host-utils.h"
  #include "qemu/cutils.h"
--- 
-2.30.2
-
diff --git a/meta/recipes-devtools/qemu/qemu/0010-hw-pvrdma-Protect-against-buggy-or-malicious-guest-d.patch b/meta/recipes-devtools/qemu/qemu/0010-hw-pvrdma-Protect-against-buggy-or-malicious-guest-d.patch
index 810c74fabd3..6caf35b6340 100644
--- a/meta/recipes-devtools/qemu/qemu/0010-hw-pvrdma-Protect-against-buggy-or-malicious-guest-d.patch
+++ b/meta/recipes-devtools/qemu/qemu/0010-hw-pvrdma-Protect-against-buggy-or-malicious-guest-d.patch
@@ -21,13 +21,13 @@ Signed-off-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
  hw/rdma/vmw/pvrdma_cmd.c | 6 ++++++
  1 file changed, 6 insertions(+)
 
-diff --git a/hw/rdma/vmw/pvrdma_cmd.c b/hw/rdma/vmw/pvrdma_cmd.c
-index da7ddfa548..89db963c46 100644
---- a/hw/rdma/vmw/pvrdma_cmd.c
-+++ b/hw/rdma/vmw/pvrdma_cmd.c
-@@ -796,6 +796,12 @@ int pvrdma_exec_cmd(PVRDMADev *dev)
- 
-     dsr_info = &dev->dsr_info;
+Index: qemu-8.0.0/hw/rdma/vmw/pvrdma_cmd.c
+===================================================================
+--- qemu-8.0.0.orig/hw/rdma/vmw/pvrdma_cmd.c
++++ qemu-8.0.0/hw/rdma/vmw/pvrdma_cmd.c
+@@ -782,6 +782,12 @@ int pvrdma_exec_cmd(PVRDMADev *dev)
+             goto out;
+     }
  
 +    if (!dsr_info->dsr) {
 +            /* Buggy or malicious guest driver */
@@ -38,6 +38,3 @@ index da7ddfa548..89db963c46 100644
      if (dsr_info->req->hdr.cmd >= sizeof(cmd_handlers) /
                        sizeof(struct cmd_handler)) {
          rdma_error_report("Unsupported command");
--- 
-2.34.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/cross.patch b/meta/recipes-devtools/qemu/qemu/cross.patch
index ca2ad361efc..112eb92593a 100644
--- a/meta/recipes-devtools/qemu/qemu/cross.patch
+++ b/meta/recipes-devtools/qemu/qemu/cross.patch
@@ -14,19 +14,19 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
  configure | 4 ----
  1 file changed, 4 deletions(-)
 
-Index: qemu-7.1.0/configure
+Index: qemu-8.0.0/configure
 ===================================================================
---- qemu-7.1.0.orig/configure
-+++ qemu-7.1.0/configure
-@@ -2710,7 +2710,6 @@ if test "$skip_meson" = no; then
-   echo "strip = [$(meson_quote $strip)]" >> $cross
+--- qemu-8.0.0.orig/configure
++++ qemu-8.0.0/configure
+@@ -2590,7 +2590,6 @@ if test "$skip_meson" = no; then
    echo "widl = [$(meson_quote $widl)]" >> $cross
    echo "windres = [$(meson_quote $windres)]" >> $cross
+   echo "windmc = [$(meson_quote $windmc)]" >> $cross
 -  if test "$cross_compile" = "yes"; then
      cross_arg="--cross-file config-meson.cross"
      echo "[host_machine]" >> $cross
      echo "system = '$targetos'" >> $cross
-@@ -2728,9 +2727,6 @@ if test "$skip_meson" = no; then
+@@ -2608,9 +2607,6 @@ if test "$skip_meson" = no; then
      else
          echo "endian = 'little'" >> $cross
      fi
diff --git a/meta/recipes-devtools/qemu/qemu_7.2.0.bb b/meta/recipes-devtools/qemu/qemu_8.0.0.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu_7.2.0.bb
rename to meta/recipes-devtools/qemu/qemu_8.0.0.bb
-- 
2.39.2


