Return-Path: <martin@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA112C25B7C
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 13:28:53 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web10.10133.1716384528934180021
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 06:28:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=wirfTW9L;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: martin@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=JFha2bADE9O1d1/3YUdZeD2TJdjHpACUga8qlMQz7iI=; b=wirfTW9L0IwFjLnN3QA0rOAYT1
	biOGOETPRLiqdkqs/Jp64IzAJaIjsuFp4436cmr/T35yK5/+ToIt14r4k1ux9tcqA4C7KL9tAVGEl
	eeSMzZAqymclVfX4XwZInmIzMGkcb6DW6/hqGF4iYOeNL46DS4SHMWyTjTDe2QF7ViMvy5KtSW8+w
	oBHZWbviM8g7d28jxmjj2yfFEMva+OysCpPOyZ8/Q/ZMeI2ld9WelExFIZMtWLLU7xlgb4cEXiLwJ
	ksMBMU60O5X1TXt2zinbm9os5ECiBeR4rlQFYPSHC9G/V0jmAxjfOnYT01ZqLhKSAbNRCg94Z0pD3
	bBnwohMw==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <martin@geanix.com>)
	id 1s9m1P-000JcB-6h; Wed, 22 May 2024 15:28:47 +0200
Received: from [185.17.218.86] (helo=zen..)
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <martin@geanix.com>)
	id 1s9m1P-000EQC-0x;
	Wed, 22 May 2024 15:28:47 +0200
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
Subject: [PATCH] qemu: upgrade 8.2.1 -> 9.0.0
Date: Wed, 22 May 2024 15:28:38 +0200
Message-ID: <20240522132838.2519681-1-martin@geanix.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: martin@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27283/Wed May 22 10:29:37 2024)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 13:28:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199752

Remove pacthes accepted upstream, and refresh the remaining ones. Remove
patches required by ubuntu 18.04, as those are unmaintainable.

Remove CVE status for CVEs not applicable to the new version.

Exclude hppa-firmware{,64}.img files from stripping during packaging, as
those (binary) files are already stripped.

Signed-off-by: Martin Hundebøll <martin@geanix.com>
---

I'm no sure about the CVE changes, but the one I removed didn't have
qemu-9.* listed as a vulnerable configuration.

This has been tested with runqemu on a standard qemux86-64 machine. If
it breaks miserably elsewhere, then at least there's a starting point.

 meta/conf/distro/include/tcmode-default.inc   |   2 +-
 ...u-native_8.2.1.bb => qemu-native_9.0.0.bb} |   0
 ...e_8.2.1.bb => qemu-system-native_9.0.0.bb} |   0
 meta/recipes-devtools/qemu/qemu.inc           |  58 +---
 ...4-Handle-the-vsyscall-page-in-open_s.patch |  56 ----
 ...n-environment-space-to-boot-loader-q.patch |  18 +-
 ... 0002-apic-fixup-fallthrough-to-PIC.patch} |  18 +-
 ...ongarch64-Remove-TARGET_FORCE_SHMLBA.patch |  43 ---
 ...d-pkg-config-handling-for-libgcrypt.patch} |  18 +-
 ...0003-linux-user-Add-strace-for-shmat.patch |  71 -----
 ...0004-linux-user-Rewrite-target_shmat.patch | 236 ---------------
 ...u-Do-not-include-file-if-not-exists.patch} |  18 +-
 ...r-space-mmap-tweaks-to-address-musl.patch} |  18 +-
 ...that-shmat-does-not-break-proc-self-.patch |  85 ------
 ...atch => 0006-qemu-Determinism-fixes.patch} |  18 +-
 ...-use-relative-path-to-refer-to-file.patch} |  20 +-
 ...nd-MAP_SHARED_VALIDATE-on-needed-li.patch} |  16 +-
 ...e-use-of-lfs64-related-functions-an.patch} |  61 ++--
 ...ure-lookup-meson-exutable-from-PATH.patch} |  21 +-
 ...t-against-buggy-or-malicious-guest-d.patch |  40 ---
 ...round-for-missing-MAP_FIXED_NOREPLAC.patch | 282 ------------------
 ...nd-the-python-venv-aren-t-used-for-.patch} |  26 +-
 ...round-for-missing-MAP_SHARED_VALIDAT.patch |  51 ----
 ...79ad8629b57a43daa62e46cc7af6e1078116.patch |  60 ----
 .../qemu/qemu/CVE-2023-6683.patch             |  91 ------
 .../qemu/{qemu_8.2.1.bb => qemu_9.0.0.bb}     |   0
 26 files changed, 163 insertions(+), 1164 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu-native_8.2.1.bb => qemu-native_9.0.0.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu-system-native_8.2.1.bb => qemu-system-native_9.0.0.bb} (100%)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-linux-user-x86_64-Handle-the-vsyscall-page-in-open_s.patch
 rename meta/recipes-devtools/qemu/qemu/{0003-apic-fixup-fallthrough-to-PIC.patch => 0002-apic-fixup-fallthrough-to-PIC.patch} (80%)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0002-linux-user-loongarch64-Remove-TARGET_FORCE_SHMLBA.patch
 rename meta/recipes-devtools/qemu/qemu/{0004-configure-Add-pkg-config-handling-for-libgcrypt.patch => 0003-configure-Add-pkg-config-handling-for-libgcrypt.patch} (73%)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0003-linux-user-Add-strace-for-shmat.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0004-linux-user-Rewrite-target_shmat.patch
 rename meta/recipes-devtools/qemu/qemu/{0005-qemu-Do-not-include-file-if-not-exists.patch => 0004-qemu-Do-not-include-file-if-not-exists.patch} (67%)
 rename meta/recipes-devtools/qemu/qemu/{0006-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch => 0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch} (80%)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0005-tests-tcg-Check-that-shmat-does-not-break-proc-self-.patch
 rename meta/recipes-devtools/qemu/qemu/{0007-qemu-Determinism-fixes.patch => 0006-qemu-Determinism-fixes.patch} (71%)
 rename meta/recipes-devtools/qemu/qemu/{0008-tests-meson.build-use-relative-path-to-refer-to-file.patch => 0007-tests-meson.build-use-relative-path-to-refer-to-file.patch} (76%)
 rename meta/recipes-devtools/qemu/qemu/{0009-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch => 0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch} (80%)
 rename meta/recipes-devtools/qemu/qemu/{0002-linux-user-Replace-use-of-lfs64-related-functions-an.patch => 0009-linux-user-Replace-use-of-lfs64-related-functions-an.patch} (81%)
 rename meta/recipes-devtools/qemu/qemu/{fixedmeson.patch => 0010-configure-lookup-meson-exutable-from-PATH.patch} (53%)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0010-hw-pvrdma-Protect-against-buggy-or-malicious-guest-d.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0011-linux-user-workaround-for-missing-MAP_FIXED_NOREPLAC.patch
 rename meta/recipes-devtools/qemu/qemu/{no-pip.patch => 0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch} (70%)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0012-linux-user-workaround-for-missing-MAP_SHARED_VALIDAT.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/4a8579ad8629b57a43daa62e46cc7af6e1078116.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-6683.patch
 rename meta/recipes-devtools/qemu/{qemu_8.2.1.bb => qemu_9.0.0.bb} (100%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 23d5aa6de8..a55258dfbe 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -22,7 +22,7 @@ BINUVERSION ?= "2.42%"
 GDBVERSION ?= "14.%"
 GLIBCVERSION ?= "2.39%"
 LINUXLIBCVERSION ?= "6.6%"
-QEMUVERSION ?= "8.2%"
+QEMUVERSION ?= "9.0%"
 GOVERSION ?= "1.22%"
 RUSTVERSION ?= "1.75%"
 
diff --git a/meta/recipes-devtools/qemu/qemu-native_8.2.1.bb b/meta/recipes-devtools/qemu/qemu-native_9.0.0.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-native_8.2.1.bb
rename to meta/recipes-devtools/qemu/qemu-native_9.0.0.bb
diff --git a/meta/recipes-devtools/qemu/qemu-system-native_8.2.1.bb b/meta/recipes-devtools/qemu/qemu-system-native_9.0.0.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-system-native_8.2.1.bb
rename to meta/recipes-devtools/qemu/qemu-system-native_9.0.0.bb
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index f76cbbb5cb..3b5775c31b 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -22,62 +22,31 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://powerpc_rom.bin \
            file://run-ptest \
            file://0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch \
-           file://0003-apic-fixup-fallthrough-to-PIC.patch \
-           file://0004-configure-Add-pkg-config-handling-for-libgcrypt.patch \
-           file://0005-qemu-Do-not-include-file-if-not-exists.patch \
-           file://0006-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch \
-           file://0007-qemu-Determinism-fixes.patch \
-           file://0008-tests-meson.build-use-relative-path-to-refer-to-file.patch \
-           file://0009-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch \
-           file://0010-hw-pvrdma-Protect-against-buggy-or-malicious-guest-d.patch \
-           file://0002-linux-user-Replace-use-of-lfs64-related-functions-an.patch \
-           file://fixedmeson.patch \
-           file://no-pip.patch \
-           file://4a8579ad8629b57a43daa62e46cc7af6e1078116.patch \
-           file://0001-linux-user-x86_64-Handle-the-vsyscall-page-in-open_s.patch \
-           file://0002-linux-user-loongarch64-Remove-TARGET_FORCE_SHMLBA.patch \
-           file://0003-linux-user-Add-strace-for-shmat.patch \
-           file://0004-linux-user-Rewrite-target_shmat.patch \
-           file://0005-tests-tcg-Check-that-shmat-does-not-break-proc-self-.patch \
-           file://CVE-2023-6683.patch \
+           file://0002-apic-fixup-fallthrough-to-PIC.patch \
+           file://0003-configure-Add-pkg-config-handling-for-libgcrypt.patch \
+           file://0004-qemu-Do-not-include-file-if-not-exists.patch \
+           file://0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch \
+           file://0006-qemu-Determinism-fixes.patch \
+           file://0007-tests-meson.build-use-relative-path-to-refer-to-file.patch \
+           file://0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch \
+           file://0009-linux-user-Replace-use-of-lfs64-related-functions-an.patch \
+           file://0010-configure-lookup-meson-exutable-from-PATH.patch \
+           file://0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch \
            file://qemu-guest-agent.init \
            file://qemu-guest-agent.udev \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
-# SDK_OLDEST_KERNEL is set below 4.17, which is the minimum version required by QEMU >= 8.1
-# This is due to two MMAP flags being used at certain points
-SRC_URI:append:class-nativesdk = " \
-	file://0011-linux-user-workaround-for-missing-MAP_FIXED_NOREPLAC.patch \
-	file://0012-linux-user-workaround-for-missing-MAP_SHARED_VALIDAT.patch \
-        "
-
-# Support building and using native version on pre 4.17 kernels
-SRC_URI:append:class-native = " \
-	file://0011-linux-user-workaround-for-missing-MAP_FIXED_NOREPLAC.patch \
-	file://0012-linux-user-workaround-for-missing-MAP_SHARED_VALIDAT.patch \
-        "
-
-SRC_URI[sha256sum] = "8562751158175f9d187c5f22b57555abe3c870f0325c8ced12c34c6d987729be"
+SRC_URI[sha256sum] = "32708ac66c30d8c892633ea968c771c1c76d597d70ddead21a0d22ccf386da69"
 
 CVE_STATUS[CVE-2007-0998] = "not-applicable-config: The VNC server can expose host files uder some circumstances. We don't enable it by default."
 
 # https://bugzilla.redhat.com/show_bug.cgi?id=1609015#c11
 CVE_STATUS[CVE-2018-18438] = "disputed: The issues identified by this CVE were determined to not constitute a vulnerability."
 
-# As per https://nvd.nist.gov/vuln/detail/CVE-2023-0664
-# https://bugzilla.redhat.com/show_bug.cgi?id=2167423
-CVE_STATUS[CVE-2023-0664] = "not-applicable-platform: Issue only applies on Windows"
-
 # As per https://bugzilla.redhat.com/show_bug.cgi?id=2203387
 CVE_STATUS[CVE-2023-2680] = "not-applicable-platform: RHEL specific issue."
 
-CVE_STATUS[CVE-2023-3019] = "cpe-incorrect: Applies only against versions before 8.2.0"
-
-CVE_STATUS[CVE-2023-5088] = "cpe-incorrect: Applies only against version 8.2.0 and earlier"
-
-CVE_STATUS[CVE-2023-6693] = "cpe-incorrect: Applies only against version 8.2.0 and earlier"
-
 COMPATIBLE_HOST:mipsarchn32 = "null"
 COMPATIBLE_HOST:mipsarchn64 = "null"
 COMPATIBLE_HOST:riscv32 = "null"
@@ -292,6 +261,11 @@ python split_qemu_packages () {
         d.appendVar('RDEPENDS:' + mipspackage, ' ' + d.getVar("MLPREFIX") + 'bash')
 }
 
+INHIBIT_PACKAGE_STRIP_FILES += " \
+    ${PKGD}${datadir}/qemu/hppa-firmware.img \
+    ${PKGD}${datadir}/qemu/hppa-firmware64.img \
+"
+
 # Put the guest agent in a separate package
 PACKAGES =+ "${PN}-guest-agent"
 SUMMARY:${PN}-guest-agent = "QEMU guest agent"
diff --git a/meta/recipes-devtools/qemu/qemu/0001-linux-user-x86_64-Handle-the-vsyscall-page-in-open_s.patch b/meta/recipes-devtools/qemu/qemu/0001-linux-user-x86_64-Handle-the-vsyscall-page-in-open_s.patch
deleted file mode 100644
index 2eaebe883c..0000000000
--- a/meta/recipes-devtools/qemu/qemu/0001-linux-user-x86_64-Handle-the-vsyscall-page-in-open_s.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 4517e2046610722879761bcdb60edbb2b929c848 Mon Sep 17 00:00:00 2001
-From: Richard Henderson <richard.henderson@linaro.org>
-Date: Wed, 28 Feb 2024 10:25:14 -1000
-Subject: [PATCH 1/5] linux-user/x86_64: Handle the vsyscall page in
- open_self_maps_{2,4}
-
-This is the only case in which we expect to have no host memory backing
-for a guest memory page, because in general linux user processes cannot
-map any pages in the top half of the 64-bit address space.
-
-Upstream-Status: Submitted [https://www.mail-archive.com/qemu-devel@nongnu.org/msg1026793.html]
-
-Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2170
-Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
----
- linux-user/syscall.c | 16 ++++++++++++++++
- 1 file changed, 16 insertions(+)
-
-diff --git a/linux-user/syscall.c b/linux-user/syscall.c
-index a114f29a8..8307a8a61 100644
---- a/linux-user/syscall.c
-+++ b/linux-user/syscall.c
-@@ -7922,6 +7922,10 @@ static void open_self_maps_4(const struct open_self_maps_data *d,
-         path = "[heap]";
-     } else if (start == info->vdso) {
-         path = "[vdso]";
-+#ifdef TARGET_X86_64
-+    } else if (start == TARGET_VSYSCALL_PAGE) {
-+        path = "[vsyscall]";
-+#endif
-     }
- 
-     /* Except null device (MAP_ANON), adjust offset for this fragment. */
-@@ -8010,6 +8014,18 @@ static int open_self_maps_2(void *opaque, target_ulong guest_start,
-     uintptr_t host_start = (uintptr_t)g2h_untagged(guest_start);
-     uintptr_t host_last = (uintptr_t)g2h_untagged(guest_end - 1);
- 
-+#ifdef TARGET_X86_64
-+    /*
-+     * Because of the extremely high position of the page within the guest
-+     * virtual address space, this is not backed by host memory at all.
-+     * Therefore the loop below would fail.  This is the only instance
-+     * of not having host backing memory.
-+     */
-+    if (guest_start == TARGET_VSYSCALL_PAGE) {
-+        return open_self_maps_3(opaque, guest_start, guest_end, flags);
-+    }
-+#endif
-+
-     while (1) {
-         IntervalTreeNode *n =
-             interval_tree_iter_first(d->host_maps, host_start, host_start);
--- 
-2.34.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
index c65508017d..2333cc8432 100644
--- a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
+++ b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
@@ -1,7 +1,7 @@
-From de64af82950a6908f9407dfc92b83c17e2af3eab Mon Sep 17 00:00:00 2001
+From e9baf07a667a1c04b57e14776cc4fa387448c908 Mon Sep 17 00:00:00 2001
 From: Jason Wessel <jason.wessel@windriver.com>
 Date: Fri, 28 Mar 2014 17:42:43 +0800
-Subject: [PATCH 01/12] qemu: Add addition environment space to boot loader
+Subject: [PATCH 01/11] qemu: Add addition environment space to boot loader
  qemu-system-mips
 
 Upstream-Status: Inappropriate - OE uses deep paths
@@ -13,16 +13,15 @@ to only 256 bytes. This patch expands the limit.
 
 Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
 Signed-off-by: Roy Li <rongqing.li@windriver.com>
-
 ---
  hw/mips/malta.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: qemu-8.0.0/hw/mips/malta.c
-===================================================================
---- qemu-8.0.0.orig/hw/mips/malta.c
-+++ qemu-8.0.0/hw/mips/malta.c
-@@ -64,7 +64,7 @@
+diff --git a/hw/mips/malta.c b/hw/mips/malta.c
+index af74008c82..a588b9ad4e 100644
+--- a/hw/mips/malta.c
++++ b/hw/mips/malta.c
+@@ -63,7 +63,7 @@
  #define ENVP_PADDR          0x2000
  #define ENVP_VADDR          cpu_mips_phys_to_kseg0(NULL, ENVP_PADDR)
  #define ENVP_NB_ENTRIES     16
@@ -31,3 +30,6 @@ Index: qemu-8.0.0/hw/mips/malta.c
  
  /* Hardware addresses */
  #define FLASH_ADDRESS       0x1e000000ULL
+-- 
+2.44.0
+
diff --git a/meta/recipes-devtools/qemu/qemu/0003-apic-fixup-fallthrough-to-PIC.patch b/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
similarity index 80%
rename from meta/recipes-devtools/qemu/qemu/0003-apic-fixup-fallthrough-to-PIC.patch
rename to meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
index e85f8202e9..5f8fe4faa3 100644
--- a/meta/recipes-devtools/qemu/qemu/0003-apic-fixup-fallthrough-to-PIC.patch
+++ b/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
@@ -1,7 +1,7 @@
-From dc2a8ccd440ee3741b61606eafed3f7e092f4312 Mon Sep 17 00:00:00 2001
+From 23bf534e463bf4c1ba2e1356eaf17be0b23b192e Mon Sep 17 00:00:00 2001
 From: Mark Asselstine <mark.asselstine@windriver.com>
 Date: Tue, 26 Feb 2013 11:43:28 -0500
-Subject: [PATCH 03/12] apic: fixup fallthrough to PIC
+Subject: [PATCH 02/11] apic: fixup fallthrough to PIC
 
 Commit 0e21e12bb311c4c1095d0269dc2ef81196ccb60a [Don't route PIC
 interrupts through the local APIC if the local APIC config says so.]
@@ -24,16 +24,15 @@ serviced, is -1.
 Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
 Upstream-Status: Submitted [https://lists.gnu.org/archive/html/qemu-devel/2013-04/msg00878.html]
 Signed-off-by: He Zhe <zhe.he@windriver.com>
-
 ---
  hw/intc/apic.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: qemu-8.0.0/hw/intc/apic.c
-===================================================================
---- qemu-8.0.0.orig/hw/intc/apic.c
-+++ qemu-8.0.0/hw/intc/apic.c
-@@ -607,7 +607,7 @@ int apic_accept_pic_intr(DeviceState *de
+diff --git a/hw/intc/apic.c b/hw/intc/apic.c
+index 4186c57b34..43cd805a96 100644
+--- a/hw/intc/apic.c
++++ b/hw/intc/apic.c
+@@ -759,7 +759,7 @@ int apic_accept_pic_intr(DeviceState *dev)
      APICCommonState *s = APIC(dev);
      uint32_t lvt0;
  
@@ -42,3 +41,6 @@ Index: qemu-8.0.0/hw/intc/apic.c
          return -1;
  
      lvt0 = s->lvt[APIC_LVT_LINT0];
+-- 
+2.44.0
+
diff --git a/meta/recipes-devtools/qemu/qemu/0002-linux-user-loongarch64-Remove-TARGET_FORCE_SHMLBA.patch b/meta/recipes-devtools/qemu/qemu/0002-linux-user-loongarch64-Remove-TARGET_FORCE_SHMLBA.patch
deleted file mode 100644
index 3f01aaa644..0000000000
--- a/meta/recipes-devtools/qemu/qemu/0002-linux-user-loongarch64-Remove-TARGET_FORCE_SHMLBA.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 5bf65b24414d3ff8339f6f1beb221c7c35c91e5d Mon Sep 17 00:00:00 2001
-From: Richard Henderson <richard.henderson@linaro.org>
-Date: Wed, 28 Feb 2024 10:25:15 -1000
-Subject: [PATCH 2/5] linux-user/loongarch64: Remove TARGET_FORCE_SHMLBA
-
-The kernel abi was changed with
-
-    commit d23b77953f5a4fbf94c05157b186aac2a247ae32
-    Author: Huacai Chen <chenhuacai@kernel.org>
-    Date:   Wed Jan 17 12:43:08 2024 +0800
-
-        LoongArch: Change SHMLBA from SZ_64K to PAGE_SIZE
-
-during the v6.8 cycle.
-
-Upstream-Status: Submitted [https://www.mail-archive.com/qemu-devel@nongnu.org/msg1026793.html]
-
-Reviewed-by: Song Gao <gaosong@loongson.cn>
-Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
----
- linux-user/loongarch64/target_syscall.h | 7 -------
- 1 file changed, 7 deletions(-)
-
-diff --git a/linux-user/loongarch64/target_syscall.h b/linux-user/loongarch64/target_syscall.h
-index 8b5de5212..39f229bb9 100644
---- a/linux-user/loongarch64/target_syscall.h
-+++ b/linux-user/loongarch64/target_syscall.h
-@@ -38,11 +38,4 @@ struct target_pt_regs {
- #define TARGET_MCL_FUTURE  2
- #define TARGET_MCL_ONFAULT 4
- 
--#define TARGET_FORCE_SHMLBA
--
--static inline abi_ulong target_shmlba(CPULoongArchState *env)
--{
--    return 64 * KiB;
--}
--
- #endif
--- 
-2.34.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/0004-configure-Add-pkg-config-handling-for-libgcrypt.patch b/meta/recipes-devtools/qemu/qemu/0003-configure-Add-pkg-config-handling-for-libgcrypt.patch
similarity index 73%
rename from meta/recipes-devtools/qemu/qemu/0004-configure-Add-pkg-config-handling-for-libgcrypt.patch
rename to meta/recipes-devtools/qemu/qemu/0003-configure-Add-pkg-config-handling-for-libgcrypt.patch
index f981a64a54..30e269f8f4 100644
--- a/meta/recipes-devtools/qemu/qemu/0004-configure-Add-pkg-config-handling-for-libgcrypt.patch
+++ b/meta/recipes-devtools/qemu/qemu/0003-configure-Add-pkg-config-handling-for-libgcrypt.patch
@@ -1,7 +1,7 @@
-From d8265abdce5dc2bf74b3fccdf2b7257b4f3894f0 Mon Sep 17 00:00:00 2001
+From e4f6c6b9f43b28271bc9dc6cbcafad53f80387e0 Mon Sep 17 00:00:00 2001
 From: He Zhe <zhe.he@windriver.com>
 Date: Wed, 28 Aug 2019 19:56:28 +0800
-Subject: [PATCH 04/12] configure: Add pkg-config handling for libgcrypt
+Subject: [PATCH 03/11] configure: Add pkg-config handling for libgcrypt
 
 libgcrypt may also be controlled by pkg-config, this patch adds pkg-config
 handling for libgcrypt.
@@ -9,16 +9,15 @@ handling for libgcrypt.
 Upstream-Status: Denied [https://lists.nongnu.org/archive/html/qemu-devel/2019-08/msg06333.html]
 
 Signed-off-by: He Zhe <zhe.he@windriver.com>
-
 ---
  meson.build | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: qemu-8.1.0/meson.build
-===================================================================
---- qemu-8.1.0.orig/meson.build
-+++ qemu-8.1.0/meson.build
-@@ -1481,7 +1481,7 @@ endif
+diff --git a/meson.build b/meson.build
+index 91a0aa64c6..e8373d55b8 100644
+--- a/meson.build
++++ b/meson.build
+@@ -1655,7 +1655,7 @@ endif
  if not gnutls_crypto.found()
    if (not get_option('gcrypt').auto() or have_system) and not get_option('nettle').enabled()
      gcrypt = dependency('libgcrypt', version: '>=1.8',
@@ -27,3 +26,6 @@ Index: qemu-8.1.0/meson.build
                          required: get_option('gcrypt'))
      # Debian has removed -lgpg-error from libgcrypt-config
      # as it "spreads unnecessary dependencies" which in
+-- 
+2.44.0
+
diff --git a/meta/recipes-devtools/qemu/qemu/0003-linux-user-Add-strace-for-shmat.patch b/meta/recipes-devtools/qemu/qemu/0003-linux-user-Add-strace-for-shmat.patch
deleted file mode 100644
index 0c601c804a..0000000000
--- a/meta/recipes-devtools/qemu/qemu/0003-linux-user-Add-strace-for-shmat.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From e8f06676c6c88e12cd5f4f81a839b7111c683596 Mon Sep 17 00:00:00 2001
-From: Richard Henderson <richard.henderson@linaro.org>
-Date: Wed, 28 Feb 2024 10:25:16 -1000
-Subject: [PATCH 3/5] linux-user: Add strace for shmat
-
-Upstream-Status: Submitted [https://www.mail-archive.com/qemu-devel@nongnu.org/msg1026793.html]
-
-Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
----
- linux-user/strace.c    | 23 +++++++++++++++++++++++
- linux-user/strace.list |  2 +-
- 2 files changed, 24 insertions(+), 1 deletion(-)
-
-diff --git a/linux-user/strace.c b/linux-user/strace.c
-index cf26e5526..47d6ec326 100644
---- a/linux-user/strace.c
-+++ b/linux-user/strace.c
-@@ -670,6 +670,25 @@ print_semctl(CPUArchState *cpu_env, const struct syscallname *name,
- }
- #endif
- 
-+static void
-+print_shmat(CPUArchState *cpu_env, const struct syscallname *name,
-+            abi_long arg0, abi_long arg1, abi_long arg2,
-+            abi_long arg3, abi_long arg4, abi_long arg5)
-+{
-+    static const struct flags shmat_flags[] = {
-+        FLAG_GENERIC(SHM_RND),
-+        FLAG_GENERIC(SHM_REMAP),
-+        FLAG_GENERIC(SHM_RDONLY),
-+        FLAG_GENERIC(SHM_EXEC),
-+    };
-+
-+    print_syscall_prologue(name);
-+    print_raw_param(TARGET_ABI_FMT_ld, arg0, 0);
-+    print_pointer(arg1, 0);
-+    print_flags(shmat_flags, arg2, 1);
-+    print_syscall_epilogue(name);
-+}
-+
- #ifdef TARGET_NR_ipc
- static void
- print_ipc(CPUArchState *cpu_env, const struct syscallname *name,
-@@ -683,6 +702,10 @@ print_ipc(CPUArchState *cpu_env, const struct syscallname *name,
-         print_ipc_cmd(arg3);
-         qemu_log(",0x" TARGET_ABI_FMT_lx ")", arg4);
-         break;
-+    case IPCOP_shmat:
-+        print_shmat(cpu_env, &(const struct syscallname){ .name = "shmat" },
-+                    arg1, arg4, arg2, 0, 0, 0);
-+        break;
-     default:
-         qemu_log(("%s("
-                   TARGET_ABI_FMT_ld ","
-diff --git a/linux-user/strace.list b/linux-user/strace.list
-index 6655d4f26..dfd4237d1 100644
---- a/linux-user/strace.list
-+++ b/linux-user/strace.list
-@@ -1398,7 +1398,7 @@
- { TARGET_NR_sgetmask, "sgetmask" , NULL, NULL, NULL },
- #endif
- #ifdef TARGET_NR_shmat
--{ TARGET_NR_shmat, "shmat" , NULL, NULL, print_syscall_ret_addr },
-+{ TARGET_NR_shmat, "shmat" , NULL, print_shmat, print_syscall_ret_addr },
- #endif
- #ifdef TARGET_NR_shmctl
- { TARGET_NR_shmctl, "shmctl" , NULL, NULL, NULL },
--- 
-2.34.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/0004-linux-user-Rewrite-target_shmat.patch b/meta/recipes-devtools/qemu/qemu/0004-linux-user-Rewrite-target_shmat.patch
deleted file mode 100644
index 88c3ed40b0..0000000000
--- a/meta/recipes-devtools/qemu/qemu/0004-linux-user-Rewrite-target_shmat.patch
+++ /dev/null
@@ -1,236 +0,0 @@
-From cb48d5d1592e63ebd0d4a3e300ef98e38e6306d7 Mon Sep 17 00:00:00 2001
-From: Richard Henderson <richard.henderson@linaro.org>
-Date: Wed, 28 Feb 2024 10:25:17 -1000
-Subject: [PATCH 4/5] linux-user: Rewrite target_shmat
-
-Handle combined host and guest alignment requirements.
-Handle host and guest page size differences.
-Handle SHM_EXEC.
-
-Upstream-Status: Submitted [https://www.mail-archive.com/qemu-devel@nongnu.org/msg1026793.html]
-
-Resolves: https://gitlab.com/qemu-project/qemu/-/issues/115
-Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
----
- linux-user/mmap.c | 166 +++++++++++++++++++++++++++++++++++++---------
- 1 file changed, 133 insertions(+), 33 deletions(-)
-
-diff --git a/linux-user/mmap.c b/linux-user/mmap.c
-index 18fb3aaf7..6a2f649bb 100644
---- a/linux-user/mmap.c
-+++ b/linux-user/mmap.c
-@@ -1062,69 +1062,161 @@ static inline abi_ulong target_shmlba(CPUArchState *cpu_env)
- }
- #endif
- 
-+#if defined(__arm__) || defined(__mips__) || defined(__sparc__)
-+#define HOST_FORCE_SHMLBA 1
-+#else
-+#define HOST_FORCE_SHMLBA 0
-+#endif
-+
- abi_ulong target_shmat(CPUArchState *cpu_env, int shmid,
-                        abi_ulong shmaddr, int shmflg)
- {
-     CPUState *cpu = env_cpu(cpu_env);
--    abi_ulong raddr;
-     struct shmid_ds shm_info;
-     int ret;
--    abi_ulong shmlba;
-+    int h_pagesize;
-+    int t_shmlba, h_shmlba, m_shmlba;
-+    size_t t_len, h_len, m_len;
- 
-     /* shmat pointers are always untagged */
- 
--    /* find out the length of the shared memory segment */
-+    /*
-+     * Because we can't use host shmat() unless the address is sufficiently
-+     * aligned for the host, we'll need to check both.
-+     * TODO: Could be fixed with softmmu.
-+     */
-+    t_shmlba = target_shmlba(cpu_env);
-+    h_pagesize = qemu_real_host_page_size();
-+    h_shmlba = (HOST_FORCE_SHMLBA ? SHMLBA : h_pagesize);
-+    m_shmlba = MAX(t_shmlba, h_shmlba);
-+
-+    if (shmaddr) {
-+        if (shmaddr & (m_shmlba - 1)) {
-+            if (shmflg & SHM_RND) {
-+                /*
-+                 * The guest is allowing the kernel to round the address.
-+                 * Assume that the guest is ok with us rounding to the
-+                 * host required alignment too.  Anyway if we don't, we'll
-+                 * get an error from the kernel.
-+                 */
-+                shmaddr &= ~(m_shmlba - 1);
-+                if (shmaddr == 0 && (shmflg & SHM_REMAP)) {
-+                    return -TARGET_EINVAL;
-+                }
-+            } else {
-+                int require = TARGET_PAGE_SIZE;
-+#ifdef TARGET_FORCE_SHMLBA
-+                require = t_shmlba;
-+#endif
-+                /*
-+                 * Include host required alignment, as otherwise we cannot
-+                 * use host shmat at all.
-+                 */
-+                require = MAX(require, h_shmlba);
-+                if (shmaddr & (require - 1)) {
-+                    return -TARGET_EINVAL;
-+                }
-+            }
-+        }
-+    } else {
-+        if (shmflg & SHM_REMAP) {
-+            return -TARGET_EINVAL;
-+        }
-+    }
-+    /* All rounding now manually concluded. */
-+    shmflg &= ~SHM_RND;
-+
-+    /* Find out the length of the shared memory segment. */
-     ret = get_errno(shmctl(shmid, IPC_STAT, &shm_info));
-     if (is_error(ret)) {
-         /* can't get length, bail out */
-         return ret;
-     }
-+    t_len = TARGET_PAGE_ALIGN(shm_info.shm_segsz);
-+    h_len = ROUND_UP(shm_info.shm_segsz, h_pagesize);
-+    m_len = MAX(t_len, h_len);
- 
--    shmlba = target_shmlba(cpu_env);
--
--    if (shmaddr & (shmlba - 1)) {
--        if (shmflg & SHM_RND) {
--            shmaddr &= ~(shmlba - 1);
--        } else {
--            return -TARGET_EINVAL;
--        }
--    }
--    if (!guest_range_valid_untagged(shmaddr, shm_info.shm_segsz)) {
-+    if (!guest_range_valid_untagged(shmaddr, m_len)) {
-         return -TARGET_EINVAL;
-     }
- 
-     WITH_MMAP_LOCK_GUARD() {
--        void *host_raddr;
-+        bool mapped = false;
-+        void *want, *test;
-         abi_ulong last;
- 
--        if (shmaddr) {
--            host_raddr = shmat(shmid, (void *)g2h_untagged(shmaddr), shmflg);
-+        if (!shmaddr) {
-+            shmaddr = mmap_find_vma(0, m_len, m_shmlba);
-+            if (shmaddr == -1) {
-+                return -TARGET_ENOMEM;
-+            }
-+            mapped = !reserved_va;
-+        } else if (shmflg & SHM_REMAP) {
-+            /*
-+             * If host page size > target page size, the host shmat may map
-+             * more memory than the guest expects.  Reject a mapping that
-+             * would replace memory in the unexpected gap.
-+             * TODO: Could be fixed with softmmu.
-+             */
-+            if (t_len < h_len &&
-+                !page_check_range_empty(shmaddr + t_len,
-+                                        shmaddr + h_len - 1)) {
-+                return -TARGET_EINVAL;
-+            }
-         } else {
--            abi_ulong mmap_start;
-+            if (!page_check_range_empty(shmaddr, shmaddr + m_len - 1)) {
-+                return -TARGET_EINVAL;
-+            }
-+        }
- 
--            /* In order to use the host shmat, we need to honor host SHMLBA.  */
--            mmap_start = mmap_find_vma(0, shm_info.shm_segsz,
--                                       MAX(SHMLBA, shmlba));
-+        /* All placement is now complete. */
-+        want = (void *)g2h_untagged(shmaddr);
- 
--            if (mmap_start == -1) {
--                return -TARGET_ENOMEM;
-+        /*
-+         * Map anonymous pages across the entire range, then remap with
-+         * the shared memory.  This is required for a number of corner
-+         * cases for which host and guest page sizes differ.
-+         */
-+        if (h_len != t_len) {
-+            int mmap_p = PROT_READ | (shmflg & SHM_RDONLY ? 0 : PROT_WRITE);
-+            int mmap_f = MAP_PRIVATE | MAP_ANONYMOUS
-+                       | (reserved_va || (shmflg & SHM_REMAP)
-+                          ? MAP_FIXED : MAP_FIXED_NOREPLACE);
-+
-+            test = mmap(want, m_len, mmap_p, mmap_f, -1, 0);
-+            if (unlikely(test != want)) {
-+                /* shmat returns EINVAL not EEXIST like mmap. */
-+                ret = (test == MAP_FAILED && errno != EEXIST
-+                       ? get_errno(-1) : -TARGET_EINVAL);
-+                if (mapped) {
-+                    do_munmap(want, m_len);
-+                }
-+                return ret;
-             }
--            host_raddr = shmat(shmid, g2h_untagged(mmap_start),
--                               shmflg | SHM_REMAP);
-+            mapped = true;
-         }
- 
--        if (host_raddr == (void *)-1) {
--            return get_errno(-1);
-+        if (reserved_va || mapped) {
-+            shmflg |= SHM_REMAP;
-+        }
-+        test = shmat(shmid, want, shmflg);
-+        if (test == MAP_FAILED) {
-+            ret = get_errno(-1);
-+            if (mapped) {
-+                do_munmap(want, m_len);
-+            }
-+            return ret;
-         }
--        raddr = h2g(host_raddr);
--        last = raddr + shm_info.shm_segsz - 1;
-+        assert(test == want);
- 
--        page_set_flags(raddr, last,
-+        last = shmaddr + m_len - 1;
-+        page_set_flags(shmaddr, last,
-                        PAGE_VALID | PAGE_RESET | PAGE_READ |
--                       (shmflg & SHM_RDONLY ? 0 : PAGE_WRITE));
-+                       (shmflg & SHM_RDONLY ? 0 : PAGE_WRITE) |
-+                       (shmflg & SHM_EXEC ? PAGE_EXEC : 0));
- 
--        shm_region_rm_complete(raddr, last);
--        shm_region_add(raddr, last);
-+        shm_region_rm_complete(shmaddr, last);
-+        shm_region_add(shmaddr, last);
-     }
- 
-     /*
-@@ -1138,7 +1230,15 @@ abi_ulong target_shmat(CPUArchState *cpu_env, int shmid,
-         tb_flush(cpu);
-     }
- 
--    return raddr;
-+    if (qemu_loglevel_mask(CPU_LOG_PAGE)) {
-+        FILE *f = qemu_log_trylock();
-+        if (f) {
-+            fprintf(f, "page layout changed following shmat\n");
-+            page_dump(f);
-+            qemu_log_unlock(f);
-+        }
-+    }
-+    return shmaddr;
- }
- 
- abi_long target_shmdt(abi_ulong shmaddr)
--- 
-2.34.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/0005-qemu-Do-not-include-file-if-not-exists.patch b/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
similarity index 67%
rename from meta/recipes-devtools/qemu/qemu/0005-qemu-Do-not-include-file-if-not-exists.patch
rename to meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
index 38aa4c3bbe..d9cab428c4 100644
--- a/meta/recipes-devtools/qemu/qemu/0005-qemu-Do-not-include-file-if-not-exists.patch
+++ b/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
@@ -1,7 +1,7 @@
-From f39e7bfc5ed07b5ecaeb705c4eae4855ca120d47 Mon Sep 17 00:00:00 2001
+From 5223d46a8d5302396f9fc7cc5d830769e87242fe Mon Sep 17 00:00:00 2001
 From: Oleksiy Obitotskyy <oobitots@cisco.com>
 Date: Wed, 25 Mar 2020 21:21:35 +0200
-Subject: [PATCH 05/12] qemu: Do not include file if not exists
+Subject: [PATCH 04/11] qemu: Do not include file if not exists
 
 Script configure checks for if_alg.h and check failed but
 if_alg.h still included.
@@ -11,16 +11,15 @@ Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
 
 [update patch context]
 Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
-
 ---
  linux-user/syscall.c | 2 ++
  1 file changed, 2 insertions(+)
 
-Index: qemu-8.0.0/linux-user/syscall.c
-===================================================================
---- qemu-8.0.0.orig/linux-user/syscall.c
-+++ qemu-8.0.0/linux-user/syscall.c
-@@ -115,7 +115,9 @@
+diff --git a/linux-user/syscall.c b/linux-user/syscall.c
+index 3df2b94d9a..18f09f1f07 100644
+--- a/linux-user/syscall.c
++++ b/linux-user/syscall.c
+@@ -116,7 +116,9 @@
  #include <linux/blkpg.h>
  #include <netpacket/packet.h>
  #include <linux/netlink.h>
@@ -30,3 +29,6 @@ Index: qemu-8.0.0/linux-user/syscall.c
  #include <linux/rtc.h>
  #include <sound/asound.h>
  #ifdef HAVE_BTRFS_H
+-- 
+2.44.0
+
diff --git a/meta/recipes-devtools/qemu/qemu/0006-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch b/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
similarity index 80%
rename from meta/recipes-devtools/qemu/qemu/0006-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
rename to meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
index 5d1d7c6881..3c7f5776ff 100644
--- a/meta/recipes-devtools/qemu/qemu/0006-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
+++ b/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
@@ -1,7 +1,7 @@
-From 375cae3dd6151ef33cae8f243f6a2c2da6c0c356 Mon Sep 17 00:00:00 2001
+From 1c295069857b9850f15f2cd6b33b133ea641a454 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 8 Jan 2021 17:27:06 +0000
-Subject: [PATCH 06/12] qemu: Add some user space mmap tweaks to address musl
+Subject: [PATCH 05/11] qemu: Add some user space mmap tweaks to address musl
  32 bit
 
 When using qemu-i386 to build qemux86 webkitgtk on musl, it sits in an
@@ -18,16 +18,15 @@ rather than ENOMEM so adjust the other part of the test to this.
 
 Upstream-Status: Submitted [https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg01355.html]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
-
 ---
  linux-user/mmap.c | 10 +++++++---
  1 file changed, 7 insertions(+), 3 deletions(-)
 
-Index: qemu-8.0.0/linux-user/mmap.c
-===================================================================
---- qemu-8.0.0.orig/linux-user/mmap.c
-+++ qemu-8.0.0/linux-user/mmap.c
-@@ -776,12 +776,16 @@ abi_long target_mremap(abi_ulong old_add
+diff --git a/linux-user/mmap.c b/linux-user/mmap.c
+index be3b9a68eb..481286f01d 100644
+--- a/linux-user/mmap.c
++++ b/linux-user/mmap.c
+@@ -1060,12 +1060,16 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
      int prot;
      void *host_addr;
  
@@ -47,3 +46,6 @@ Index: qemu-8.0.0/linux-user/mmap.c
          return -1;
      }
  
+-- 
+2.44.0
+
diff --git a/meta/recipes-devtools/qemu/qemu/0005-tests-tcg-Check-that-shmat-does-not-break-proc-self-.patch b/meta/recipes-devtools/qemu/qemu/0005-tests-tcg-Check-that-shmat-does-not-break-proc-self-.patch
deleted file mode 100644
index 5afb35ea0c..0000000000
--- a/meta/recipes-devtools/qemu/qemu/0005-tests-tcg-Check-that-shmat-does-not-break-proc-self-.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-From 1234063488134ad1f541f56dd30caa7896905f06 Mon Sep 17 00:00:00 2001
-From: Ilya Leoshkevich <iii@linux.ibm.com>
-Date: Wed, 28 Feb 2024 10:25:18 -1000
-Subject: [PATCH 5/5] tests/tcg: Check that shmat() does not break
- /proc/self/maps
-
-Add a regression test for a recently fixed issue, where shmat()
-desynced the guest and the host view of the address space and caused
-open("/proc/self/maps") to SEGV.
-
-Upstream-Status: Submitted [https://www.mail-archive.com/qemu-devel@nongnu.org/msg1026793.html]
-
-Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
-Message-Id: <jwyuvao4apydvykmsnvacwshdgy3ixv7qvkh4dbxm3jkwgnttw@k4wpaayou7oq>
-Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
----
- tests/tcg/multiarch/linux/linux-shmat-maps.c | 55 ++++++++++++++++++++
- 1 file changed, 55 insertions(+)
- create mode 100644 tests/tcg/multiarch/linux/linux-shmat-maps.c
-
-diff --git a/tests/tcg/multiarch/linux/linux-shmat-maps.c b/tests/tcg/multiarch/linux/linux-shmat-maps.c
-new file mode 100644
-index 000000000..0ccf7a973
---- /dev/null
-+++ b/tests/tcg/multiarch/linux/linux-shmat-maps.c
-@@ -0,0 +1,55 @@
-+/*
-+ * Test that shmat() does not break /proc/self/maps.
-+ *
-+ * SPDX-License-Identifier: GPL-2.0-or-later
-+ */
-+#include <assert.h>
-+#include <fcntl.h>
-+#include <stdlib.h>
-+#include <sys/ipc.h>
-+#include <sys/shm.h>
-+#include <unistd.h>
-+
-+int main(void)
-+{
-+    char buf[128];
-+    int err, fd;
-+    int shmid;
-+    ssize_t n;
-+    void *p;
-+
-+    shmid = shmget(IPC_PRIVATE, 1, IPC_CREAT | 0600);
-+    assert(shmid != -1);
-+
-+    /*
-+     * The original bug required a non-NULL address, which skipped the
-+     * mmap_find_vma step, which could result in a host mapping smaller
-+     * than the target mapping.  Choose an address at random.
-+     */
-+    p = shmat(shmid, (void *)0x800000, SHM_RND);
-+    if (p == (void *)-1) {
-+        /*
-+         * Because we are now running the testcase for all guests for which
-+         * we have a cross-compiler, the above random address might conflict
-+         * with the guest executable in some way.  Rather than stopping,
-+         * continue with a system supplied address, which should never fail.
-+         */
-+        p = shmat(shmid, NULL, 0);
-+        assert(p != (void *)-1);
-+    }
-+
-+    fd = open("/proc/self/maps", O_RDONLY);
-+    assert(fd != -1);
-+    do {
-+        n = read(fd, buf, sizeof(buf));
-+        assert(n >= 0);
-+    } while (n != 0);
-+    close(fd);
-+
-+    err = shmdt(p);
-+    assert(err == 0);
-+    err = shmctl(shmid, IPC_RMID, NULL);
-+    assert(err == 0);
-+
-+    return EXIT_SUCCESS;
-+}
--- 
-2.34.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/0007-qemu-Determinism-fixes.patch b/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
similarity index 71%
rename from meta/recipes-devtools/qemu/qemu/0007-qemu-Determinism-fixes.patch
rename to meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
index d3f965e070..f07054f19a 100644
--- a/meta/recipes-devtools/qemu/qemu/0007-qemu-Determinism-fixes.patch
+++ b/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
@@ -1,7 +1,7 @@
-From 50bab5c2605b609ea7ea154f57a9be96d656725a Mon Sep 17 00:00:00 2001
+From 9d32df80e33a7541658858497f45bed1e59e3621 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Mon, 1 Mar 2021 13:00:47 +0000
-Subject: [PATCH 07/12] qemu: Determinism fixes
+Subject: [PATCH 06/11] qemu: Determinism fixes
 
 When sources are included within debug information, a couple of areas of the
 qemu build are not reproducible due to either full buildpaths or timestamps.
@@ -11,16 +11,15 @@ meson to pass relative paths but we can fix that in the script.
 
 Upstream-Status: Pending [some version of all/part of this may be accepted]
 RP 2021/3/1
-
 ---
  scripts/decodetree.py | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: qemu-8.0.0/scripts/decodetree.py
-===================================================================
---- qemu-8.0.0.orig/scripts/decodetree.py
-+++ qemu-8.0.0/scripts/decodetree.py
-@@ -1328,7 +1328,7 @@ def main():
+diff --git a/scripts/decodetree.py b/scripts/decodetree.py
+index e8b72da3a9..5cd86b1428 100644
+--- a/scripts/decodetree.py
++++ b/scripts/decodetree.py
+@@ -1558,7 +1558,7 @@ def main():
      toppat = ExcMultiPattern(0)
  
      for filename in args:
@@ -29,3 +28,6 @@ Index: qemu-8.0.0/scripts/decodetree.py
          f = open(filename, 'rt', encoding='utf-8')
          parse_file(f, toppat)
          f.close()
+-- 
+2.44.0
+
diff --git a/meta/recipes-devtools/qemu/qemu/0008-tests-meson.build-use-relative-path-to-refer-to-file.patch b/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
similarity index 76%
rename from meta/recipes-devtools/qemu/qemu/0008-tests-meson.build-use-relative-path-to-refer-to-file.patch
rename to meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
index a84364ccc1..74de158b2e 100644
--- a/meta/recipes-devtools/qemu/qemu/0008-tests-meson.build-use-relative-path-to-refer-to-file.patch
+++ b/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
@@ -1,7 +1,7 @@
-From 2bf9388b801d4389e2d57e95a7897bfc1c42786e Mon Sep 17 00:00:00 2001
+From 77ebf67d0c96f51da91c8499200ebd13f4dcdd68 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Thu, 14 Jan 2021 06:33:04 +0000
-Subject: [PATCH 08/12] tests/meson.build: use relative path to refer to files
+Subject: [PATCH 07/11] tests/meson.build: use relative path to refer to files
 
 Fix error like:
 Fatal error: can't create tests/ptimer-test.p/..._qemu-5.2.0_hw_core_ptimer.c.o: File name too long
@@ -12,16 +12,15 @@ filename too long. Fixed by using relative path to refer to files
 Upstream-Status: Submitted [send to qemu-devel]
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
-
 ---
  tests/unit/meson.build | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
-Index: qemu-8.0.0/tests/unit/meson.build
-===================================================================
---- qemu-8.0.0.orig/tests/unit/meson.build
-+++ qemu-8.0.0/tests/unit/meson.build
-@@ -46,7 +46,7 @@ tests = {
+diff --git a/tests/unit/meson.build b/tests/unit/meson.build
+index 228a21d03c..272fb4c6ca 100644
+--- a/tests/unit/meson.build
++++ b/tests/unit/meson.build
+@@ -47,7 +47,7 @@ tests = {
    'test-keyval': [testqapi],
    'test-logging': [],
    'test-uuid': [],
@@ -30,7 +29,7 @@ Index: qemu-8.0.0/tests/unit/meson.build
    'test-qapi-util': [],
    'test-interval-tree': [],
    'test-xs-node': [qom],
-@@ -136,7 +136,7 @@ if have_system
+@@ -138,7 +138,7 @@ if have_system
      'test-util-sockets': ['socket-helpers.c'],
      'test-base64': [],
      'test-bufferiszero': [],
@@ -39,3 +38,6 @@ Index: qemu-8.0.0/tests/unit/meson.build
      'test-vmstate': [migration, io],
      'test-yank': ['socket-helpers.c', qom, io, chardev]
    }
+-- 
+2.44.0
+
diff --git a/meta/recipes-devtools/qemu/qemu/0009-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch b/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
similarity index 80%
rename from meta/recipes-devtools/qemu/qemu/0009-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
rename to meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
index 4de6cc2445..2e28590e11 100644
--- a/meta/recipes-devtools/qemu/qemu/0009-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
+++ b/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
@@ -1,7 +1,7 @@
-From ebf4bb2f51da83af0c61480414cfa156f7308b34 Mon Sep 17 00:00:00 2001
+From 21b159a11bbcb1eeb26f12456e4c3fd62a06cbec Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 21 Mar 2022 10:09:38 -0700
-Subject: [PATCH 09/12] Define MAP_SYNC and MAP_SHARED_VALIDATE on needed linux
+Subject: [PATCH 08/11] Define MAP_SYNC and MAP_SHARED_VALIDATE on needed linux
  systems
 
 linux only wires MAP_SYNC and MAP_SHARED_VALIDATE for architectures
@@ -13,15 +13,14 @@ Upstream-Status: Submitted [https://lists.nongnu.org/archive/html/qemu-devel/202
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Cc: Zhang Yi <yi.z.zhang@linux.intel.com>
 Cc: Michael S. Tsirkin <mst@redhat.com>
-
 ---
  util/mmap-alloc.c | 10 +++++++---
  1 file changed, 7 insertions(+), 3 deletions(-)
 
-Index: qemu-8.0.0/util/mmap-alloc.c
-===================================================================
---- qemu-8.0.0.orig/util/mmap-alloc.c
-+++ qemu-8.0.0/util/mmap-alloc.c
+diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
+index ed14f9c64d..038f5b4b55 100644
+--- a/util/mmap-alloc.c
++++ b/util/mmap-alloc.c
 @@ -10,14 +10,18 @@
   * later.  See the COPYING file in the top-level directory.
   */
@@ -44,3 +43,6 @@ Index: qemu-8.0.0/util/mmap-alloc.c
  #include "qemu/mmap-alloc.h"
  #include "qemu/host-utils.h"
  #include "qemu/cutils.h"
+-- 
+2.44.0
+
diff --git a/meta/recipes-devtools/qemu/qemu/0002-linux-user-Replace-use-of-lfs64-related-functions-an.patch b/meta/recipes-devtools/qemu/qemu/0009-linux-user-Replace-use-of-lfs64-related-functions-an.patch
similarity index 81%
rename from meta/recipes-devtools/qemu/qemu/0002-linux-user-Replace-use-of-lfs64-related-functions-an.patch
rename to meta/recipes-devtools/qemu/qemu/0009-linux-user-Replace-use-of-lfs64-related-functions-an.patch
index ceae67be64..7577249d39 100644
--- a/meta/recipes-devtools/qemu/qemu/0002-linux-user-Replace-use-of-lfs64-related-functions-an.patch
+++ b/meta/recipes-devtools/qemu/qemu/0009-linux-user-Replace-use-of-lfs64-related-functions-an.patch
@@ -1,7 +1,7 @@
-From 71f14902256e3c3529710b713e1ea43100bf4c40 Mon Sep 17 00:00:00 2001
+From 23de30079dbf47a8026faddd550a9e181d609c8f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 17 Dec 2022 08:37:46 -0800
-Subject: [PATCH 2/2] linux-user: Replace use of lfs64 related functions and
+Subject: [PATCH 09/11] linux-user: Replace use of lfs64 related functions and
  macros
 
 Builds defines -D_FILE_OFFSET_BITS=64 which makes the original functions
@@ -16,11 +16,11 @@ Cc: Laurent Vivier <laurent@vivier.eu>
  linux-user/syscall.c | 153 +++++++++++--------------------------------
  1 file changed, 39 insertions(+), 114 deletions(-)
 
-Index: qemu-8.0.0/linux-user/syscall.c
-===================================================================
---- qemu-8.0.0.orig/linux-user/syscall.c
-+++ qemu-8.0.0/linux-user/syscall.c
-@@ -761,8 +761,8 @@ safe_syscall6(ssize_t, copy_file_range,
+diff --git a/linux-user/syscall.c b/linux-user/syscall.c
+index 18f09f1f07..1b7c50a2a7 100644
+--- a/linux-user/syscall.c
++++ b/linux-user/syscall.c
+@@ -761,8 +761,8 @@ safe_syscall6(ssize_t, copy_file_range, int, infd, loff_t *, pinoff,
   */
  #define safe_ioctl(...) safe_syscall(__NR_ioctl, __VA_ARGS__)
  /* Similarly for fcntl. Note that callers must always:
@@ -31,7 +31,7 @@ Index: qemu-8.0.0/linux-user/syscall.c
   * This will then work and use a 64-bit offset for both 32-bit and 64-bit hosts.
   */
  #ifdef __NR_fcntl64
-@@ -6813,13 +6813,13 @@ static int target_to_host_fcntl_cmd(int
+@@ -6739,13 +6739,13 @@ static int target_to_host_fcntl_cmd(int cmd)
          ret = cmd;
          break;
      case TARGET_F_GETLK:
@@ -48,7 +48,7 @@ Index: qemu-8.0.0/linux-user/syscall.c
          break;
      case TARGET_F_GETOWN:
          ret = F_GETOWN;
-@@ -6833,17 +6833,6 @@ static int target_to_host_fcntl_cmd(int
+@@ -6759,17 +6759,6 @@ static int target_to_host_fcntl_cmd(int cmd)
      case TARGET_F_SETSIG:
          ret = F_SETSIG;
          break;
@@ -66,7 +66,7 @@ Index: qemu-8.0.0/linux-user/syscall.c
      case TARGET_F_SETLEASE:
          ret = F_SETLEASE;
          break;
-@@ -6895,8 +6884,8 @@ static int target_to_host_fcntl_cmd(int
+@@ -6821,8 +6810,8 @@ static int target_to_host_fcntl_cmd(int cmd)
       * them to 5, 6 and 7 before making the syscall(). Since we make the
       * syscall directly, adjust to what is supported by the kernel.
       */
@@ -77,7 +77,7 @@ Index: qemu-8.0.0/linux-user/syscall.c
      }
  #endif
  
-@@ -6929,55 +6918,11 @@ static int host_to_target_flock(int type
+@@ -6855,55 +6844,11 @@ static int host_to_target_flock(int type)
      return type;
  }
  
@@ -136,7 +136,7 @@ Index: qemu-8.0.0/linux-user/syscall.c
      abi_short l_type;
      abi_short l_whence;
      abi_llong l_start;
-@@ -6985,10 +6930,10 @@ struct target_oabi_flock64 {
+@@ -6911,10 +6856,10 @@ struct target_oabi_flock64 {
      abi_int   l_pid;
  } QEMU_PACKED;
  
@@ -149,7 +149,7 @@ Index: qemu-8.0.0/linux-user/syscall.c
      int l_type;
  
      if (!lock_user_struct(VERIFY_READ, target_fl, target_flock_addr, 1)) {
-@@ -7009,10 +6954,10 @@ static inline abi_long copy_from_user_oa
+@@ -6935,10 +6880,10 @@ static inline abi_long copy_from_user_oabi_flock64(struct flock64 *fl,
      return 0;
  }
  
@@ -163,7 +163,7 @@ Index: qemu-8.0.0/linux-user/syscall.c
      short l_type;
  
      if (!lock_user_struct(VERIFY_WRITE, target_fl, target_flock_addr, 0)) {
-@@ -7030,10 +6975,10 @@ static inline abi_long copy_to_user_oabi
+@@ -6956,10 +6901,10 @@ static inline abi_long copy_to_user_oabi_flock64(abi_ulong target_flock_addr,
  }
  #endif
  
@@ -176,7 +176,7 @@ Index: qemu-8.0.0/linux-user/syscall.c
      int l_type;
  
      if (!lock_user_struct(VERIFY_READ, target_fl, target_flock_addr, 1)) {
-@@ -7054,10 +6999,10 @@ static inline abi_long copy_from_user_fl
+@@ -6980,10 +6925,10 @@ static inline abi_long copy_from_user_flock64(struct flock64 *fl,
      return 0;
  }
  
@@ -190,7 +190,7 @@ Index: qemu-8.0.0/linux-user/syscall.c
      short l_type;
  
      if (!lock_user_struct(VERIFY_WRITE, target_fl, target_flock_addr, 0)) {
-@@ -7076,7 +7021,7 @@ static inline abi_long copy_to_user_floc
+@@ -7002,7 +6947,7 @@ static inline abi_long copy_to_user_flock64(abi_ulong target_flock_addr,
  
  static abi_long do_fcntl(int fd, int cmd, abi_ulong arg)
  {
@@ -199,7 +199,7 @@ Index: qemu-8.0.0/linux-user/syscall.c
  #ifdef F_GETOWN_EX
      struct f_owner_ex fox;
      struct target_f_owner_ex *target_fox;
-@@ -7089,6 +7034,7 @@ static abi_long do_fcntl(int fd, int cmd
+@@ -7015,6 +6960,7 @@ static abi_long do_fcntl(int fd, int cmd, abi_ulong arg)
  
      switch(cmd) {
      case TARGET_F_GETLK:
@@ -207,7 +207,7 @@ Index: qemu-8.0.0/linux-user/syscall.c
          ret = copy_from_user_flock(&fl64, arg);
          if (ret) {
              return ret;
-@@ -7098,32 +7044,11 @@ static abi_long do_fcntl(int fd, int cmd
+@@ -7024,32 +6970,11 @@ static abi_long do_fcntl(int fd, int cmd, abi_ulong arg)
              ret = copy_to_user_flock(arg, &fl64);
          }
          break;
@@ -241,7 +241,7 @@ Index: qemu-8.0.0/linux-user/syscall.c
          if (ret) {
              return ret;
          }
-@@ -7348,7 +7273,7 @@ static inline abi_long target_truncate64
+@@ -7278,7 +7203,7 @@ static inline abi_long target_truncate64(CPUArchState *cpu_env, const char *arg1
          arg2 = arg3;
          arg3 = arg4;
      }
@@ -250,7 +250,7 @@ Index: qemu-8.0.0/linux-user/syscall.c
  }
  #endif
  
-@@ -7362,7 +7287,7 @@ static inline abi_long target_ftruncate6
+@@ -7292,7 +7217,7 @@ static inline abi_long target_ftruncate64(CPUArchState *cpu_env, abi_long arg1,
          arg2 = arg3;
          arg3 = arg4;
      }
@@ -259,7 +259,7 @@ Index: qemu-8.0.0/linux-user/syscall.c
  }
  #endif
  
-@@ -8598,7 +8523,7 @@ static int do_getdents(abi_long dirfd, a
+@@ -8667,7 +8592,7 @@ static int do_getdents(abi_long dirfd, abi_long arg2, abi_long count)
      void *tdirp;
      int hlen, hoff, toff;
      int hreclen, treclen;
@@ -268,7 +268,7 @@ Index: qemu-8.0.0/linux-user/syscall.c
  
      hdirp = g_try_malloc(count);
      if (!hdirp) {
-@@ -8651,7 +8576,7 @@ static int do_getdents(abi_long dirfd, a
+@@ -8720,7 +8645,7 @@ static int do_getdents(abi_long dirfd, abi_long arg2, abi_long count)
               * Return what we have, resetting the file pointer to the
               * location of the first record not returned.
               */
@@ -277,7 +277,7 @@ Index: qemu-8.0.0/linux-user/syscall.c
              break;
          }
  
-@@ -8685,7 +8610,7 @@ static int do_getdents64(abi_long dirfd,
+@@ -8754,7 +8679,7 @@ static int do_getdents64(abi_long dirfd, abi_long arg2, abi_long count)
      void *tdirp;
      int hlen, hoff, toff;
      int hreclen, treclen;
@@ -286,7 +286,7 @@ Index: qemu-8.0.0/linux-user/syscall.c
  
      hdirp = g_try_malloc(count);
      if (!hdirp) {
-@@ -8727,7 +8652,7 @@ static int do_getdents64(abi_long dirfd,
+@@ -8796,7 +8721,7 @@ static int do_getdents64(abi_long dirfd, abi_long arg2, abi_long count)
               * Return what we have, resetting the file pointer to the
               * location of the first record not returned.
               */
@@ -295,7 +295,7 @@ Index: qemu-8.0.0/linux-user/syscall.c
              break;
          }
  
-@@ -11158,7 +11083,7 @@ static abi_long do_syscall1(CPUArchState
+@@ -11527,7 +11452,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
                  return -TARGET_EFAULT;
              }
          }
@@ -304,7 +304,7 @@ Index: qemu-8.0.0/linux-user/syscall.c
          unlock_user(p, arg2, ret);
          return ret;
      case TARGET_NR_pwrite64:
-@@ -11175,7 +11100,7 @@ static abi_long do_syscall1(CPUArchState
+@@ -11544,7 +11469,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
                  return -TARGET_EFAULT;
              }
          }
@@ -313,7 +313,7 @@ Index: qemu-8.0.0/linux-user/syscall.c
          unlock_user(p, arg2, 0);
          return ret;
  #endif
-@@ -11998,14 +11923,14 @@ static abi_long do_syscall1(CPUArchState
+@@ -12404,14 +12329,14 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
      case TARGET_NR_fcntl64:
      {
          int cmd;
@@ -333,7 +333,7 @@ Index: qemu-8.0.0/linux-user/syscall.c
          }
  #endif
  
-@@ -12015,7 +11940,7 @@ static abi_long do_syscall1(CPUArchState
+@@ -12421,7 +12346,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
          }
  
          switch(arg2) {
@@ -342,7 +342,7 @@ Index: qemu-8.0.0/linux-user/syscall.c
              ret = copyfrom(&fl, arg3);
              if (ret) {
                  break;
-@@ -12026,8 +11951,8 @@ static abi_long do_syscall1(CPUArchState
+@@ -12432,8 +12357,8 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
              }
  	    break;
  
@@ -353,3 +353,6 @@ Index: qemu-8.0.0/linux-user/syscall.c
              ret = copyfrom(&fl, arg3);
              if (ret) {
                  break;
+-- 
+2.44.0
+
diff --git a/meta/recipes-devtools/qemu/qemu/fixedmeson.patch b/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
similarity index 53%
rename from meta/recipes-devtools/qemu/qemu/fixedmeson.patch
rename to meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
index 9047f66dc3..98ce85a8cf 100644
--- a/meta/recipes-devtools/qemu/qemu/fixedmeson.patch
+++ b/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
@@ -1,10 +1,18 @@
+From e12a93174f9b652604dda8d8464b9559b62b29d5 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
+Date: Wed, 22 May 2024 14:02:55 +0200
+Subject: [PATCH 10/11] configure: lookup meson exutable from PATH
+
 Upstream-Status: Inappropriate [workaround, would need a real fix for upstream]
+---
+ configure | 7 +------
+ 1 file changed, 1 insertion(+), 6 deletions(-)
 
-Index: qemu-8.2.0/configure
-===================================================================
---- qemu-8.2.0.orig/configure
-+++ qemu-8.2.0/configure
-@@ -955,12 +955,7 @@ fi
+diff --git a/configure b/configure
+index 3cd736b139..482a1f8ef3 100755
+--- a/configure
++++ b/configure
+@@ -956,12 +956,7 @@ fi
  $mkvenv ensuregroup --dir "${source_path}/python/wheels" \
       ${source_path}/pythondeps.toml meson || exit 1
  
@@ -18,3 +26,6 @@ Index: qemu-8.2.0/configure
  
  # Conditionally ensure Sphinx is installed.
  
+-- 
+2.44.0
+
diff --git a/meta/recipes-devtools/qemu/qemu/0010-hw-pvrdma-Protect-against-buggy-or-malicious-guest-d.patch b/meta/recipes-devtools/qemu/qemu/0010-hw-pvrdma-Protect-against-buggy-or-malicious-guest-d.patch
deleted file mode 100644
index 6caf35b634..0000000000
--- a/meta/recipes-devtools/qemu/qemu/0010-hw-pvrdma-Protect-against-buggy-or-malicious-guest-d.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-CVE: CVE-2022-1050
-Upstream-Status: Submitted [https://lore.kernel.org/qemu-devel/20220403095234.2210-1-yuval.shaia.ml@gmail.com/]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From dbdef95c272e8f3ec037c3db4197c66002e30995 Mon Sep 17 00:00:00 2001
-From: Yuval Shaia <yuval.shaia.ml@gmail.com>
-Date: Sun, 3 Apr 2022 12:52:34 +0300
-Subject: [PATCH] hw/pvrdma: Protect against buggy or malicious guest driver
-
-Guest driver might execute HW commands when shared buffers are not yet
-allocated.
-This could happen on purpose (malicious guest) or because of some other
-guest/host address mapping error.
-We need to protect againts such case.
-
-Fixes: CVE-2022-1050
-
-Reported-by: Raven <wxhusst@gmail.com>
-Signed-off-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
----
- hw/rdma/vmw/pvrdma_cmd.c | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-Index: qemu-8.0.0/hw/rdma/vmw/pvrdma_cmd.c
-===================================================================
---- qemu-8.0.0.orig/hw/rdma/vmw/pvrdma_cmd.c
-+++ qemu-8.0.0/hw/rdma/vmw/pvrdma_cmd.c
-@@ -782,6 +782,12 @@ int pvrdma_exec_cmd(PVRDMADev *dev)
-             goto out;
-     }
- 
-+    if (!dsr_info->dsr) {
-+            /* Buggy or malicious guest driver */
-+            rdma_error_report("Exec command without dsr, req or rsp buffers");
-+            goto out;
-+    }
-+
-     if (dsr_info->req->hdr.cmd >= sizeof(cmd_handlers) /
-                       sizeof(struct cmd_handler)) {
-         rdma_error_report("Unsupported command");
diff --git a/meta/recipes-devtools/qemu/qemu/0011-linux-user-workaround-for-missing-MAP_FIXED_NOREPLAC.patch b/meta/recipes-devtools/qemu/qemu/0011-linux-user-workaround-for-missing-MAP_FIXED_NOREPLAC.patch
deleted file mode 100644
index cc53b1eedd..0000000000
--- a/meta/recipes-devtools/qemu/qemu/0011-linux-user-workaround-for-missing-MAP_FIXED_NOREPLAC.patch
+++ /dev/null
@@ -1,282 +0,0 @@
-From fa9bcabe2387bb230ef82d62827ad6f93b8a1e61 Mon Sep 17 00:00:00 2001
-From: Frederic Konrad <fkonrad@amd.com>
-Date: Wed, 17 Jan 2024 18:15:06 +0000
-Subject: [PATCH 1/2] linux-user/*: workaround for missing MAP_FIXED_NOREPLACE
-
-QEMU v8.1.0 recently requires MAP_FIXED_NOREPLACE flags implementation for mmap.
-
-This is missing from ubuntu 18.04, thus this patch catches the mmap calls which
-could use that new flag and forwards them to mmap when MAP_FIXED_NOREPLACE
-flag isn't set or emulates them by checking the returned address w.r.t the
-requested address.
-
-Signed-off-by: Frederic Konrad <fkonrad@amd.com>
-Signed-off-by: Francisco Iglesias <francisco.iglesias@amd.com>
-
-Upstream-Status: Inappropriate [OE specific]
-
-The upstream only supports the last two major releases of an OS.  The ones
-they have declared all have kernel 4.17 or newer.
-
-See:
-https://xilinx.slack.com/archives/D04G2647CTV/p1705074697942019
-
-https://www.qemu.org/docs/master/about/build-platforms.html
-
- The project aims to support the most recent major version at all times for up
- to five years after its initial release. Support for the previous major
- version will be dropped 2 years after the new major version is released or
- when the vendor itself drops support, whichever comes first.
-
-Signed-off-by: Mark Hatle <mark.hatle@amd.com>
----
- linux-user/elfload.c    |  7 +++--
- linux-user/meson.build  |  1 +
- linux-user/mmap-fixed.c | 63 +++++++++++++++++++++++++++++++++++++++++
- linux-user/mmap-fixed.h | 39 +++++++++++++++++++++++++
- linux-user/mmap.c       | 31 +++++++++++---------
- linux-user/syscall.c    |  1 +
- 6 files changed, 125 insertions(+), 17 deletions(-)
- create mode 100644 linux-user/mmap-fixed.c
- create mode 100644 linux-user/mmap-fixed.h
-
-Index: qemu-8.2.1/linux-user/elfload.c
-===================================================================
---- qemu-8.2.1.orig/linux-user/elfload.c
-+++ qemu-8.2.1/linux-user/elfload.c
-@@ -22,6 +22,7 @@
- #include "qemu/error-report.h"
- #include "target_signal.h"
- #include "accel/tcg/debuginfo.h"
-+#include "mmap-fixed.h"
- 
- #ifdef TARGET_ARM
- #include "target/arm/cpu-features.h"
-@@ -2765,9 +2766,9 @@ static abi_ulong create_elf_tables(abi_u
- static int pgb_try_mmap(uintptr_t addr, uintptr_t addr_last, bool keep)
- {
-     size_t size = addr_last - addr + 1;
--    void *p = mmap((void *)addr, size, PROT_NONE,
--                   MAP_ANONYMOUS | MAP_PRIVATE |
--                   MAP_NORESERVE | MAP_FIXED_NOREPLACE, -1, 0);
-+    void *p = mmap_fixed_noreplace((void *)addr, size, PROT_NONE,
-+                                   MAP_ANONYMOUS | MAP_PRIVATE |
-+                                   MAP_NORESERVE | MAP_FIXED_NOREPLACE, -1, 0);
-     int ret;
- 
-     if (p == MAP_FAILED) {
-Index: qemu-8.2.1/linux-user/meson.build
-===================================================================
---- qemu-8.2.1.orig/linux-user/meson.build
-+++ qemu-8.2.1/linux-user/meson.build
-@@ -14,6 +14,7 @@ linux_user_ss.add(files(
-   'linuxload.c',
-   'main.c',
-   'mmap.c',
-+  'mmap-fixed.c',
-   'signal.c',
-   'strace.c',
-   'syscall.c',
-Index: qemu-8.2.1/linux-user/mmap-fixed.c
-===================================================================
---- /dev/null
-+++ qemu-8.2.1/linux-user/mmap-fixed.c
-@@ -0,0 +1,63 @@
-+/*
-+ * Workaround for MAP_FIXED_NOREPLACE
-+ *
-+ * Copyright (c) 2024, Advanced Micro Devices, Inc.
-+ * Developed by Fred Konrad <fkonrad@amd.com>
-+ *
-+ * Permission is hereby granted, free of charge, to any person obtaining a copy
-+ * of this software and associated documentation files (the "Software"), to deal
-+ * in the Software without restriction, including without limitation the rights
-+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-+ * copies of the Software, and to permit persons to whom the Software is
-+ * furnished to do so, subject to the following conditions:
-+ *
-+ * The above copyright notice and this permission notice shall be included in
-+ * all copies or substantial portions of the Software.
-+ *
-+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
-+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-+ * THE SOFTWARE.
-+ */
-+
-+#include <sys/mman.h>
-+#include <errno.h>
-+
-+#ifndef MAP_FIXED_NOREPLACE
-+#include "mmap-fixed.h"
-+
-+void *mmap_fixed_noreplace(void *addr, size_t len, int prot, int flags,
-+                                  int fd, off_t offset)
-+{
-+    void *retaddr;
-+
-+    if (!(flags & MAP_FIXED_NOREPLACE)) {
-+        /* General case, use the regular mmap.  */
-+        return mmap(addr, len, prot, flags, fd, offset);
-+    }
-+
-+    /* Since MAP_FIXED_NOREPLACE is not implemented, try to emulate it.  */
-+    flags = flags & ~(MAP_FIXED_NOREPLACE | MAP_FIXED);
-+    retaddr = mmap(addr, len, prot, flags, fd, offset);
-+    if ((retaddr == addr) || (retaddr == MAP_FAILED)) {
-+        /*
-+         * Either the map worked and we get the good address so it can be
-+         * returned, or it failed and would have failed the same with
-+         * MAP_FIXED*, in which case return MAP_FAILED.
-+         */
-+        return retaddr;
-+    } else {
-+        /*
-+         * Page has been mapped but not at the requested address.. unmap it and
-+         * return EEXIST.
-+         */
-+        munmap(retaddr, len);
-+        errno = EEXIST;
-+        return MAP_FAILED;
-+    }
-+}
-+
-+#endif
-Index: qemu-8.2.1/linux-user/mmap-fixed.h
-===================================================================
---- /dev/null
-+++ qemu-8.2.1/linux-user/mmap-fixed.h
-@@ -0,0 +1,39 @@
-+/*
-+ * Workaround for MAP_FIXED_NOREPLACE
-+ *
-+ * Copyright (c) 2024, Advanced Micro Devices, Inc.
-+ * Developed by Fred Konrad <fkonrad@amd.com>
-+ *
-+ * Permission is hereby granted, free of charge, to any person obtaining a copy
-+ * of this software and associated documentation files (the "Software"), to deal
-+ * in the Software without restriction, including without limitation the rights
-+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-+ * copies of the Software, and to permit persons to whom the Software is
-+ * furnished to do so, subject to the following conditions:
-+ *
-+ * The above copyright notice and this permission notice shall be included in
-+ * all copies or substantial portions of the Software.
-+ *
-+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
-+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-+ * THE SOFTWARE.
-+ */
-+
-+#ifndef MMAP_FIXED_H
-+#define MMAP_FIXED_H
-+
-+#ifndef MAP_FIXED_NOREPLACE
-+#define MAP_FIXED_NOREPLACE 0x100000
-+
-+void *mmap_fixed_noreplace(void *addr, size_t len, int prot, int flags,
-+                           int fd, off_t offset);
-+
-+#else /* MAP_FIXED_NOREPLACE */
-+#define mmap_fixed_noreplace mmap
-+#endif /* MAP_FIXED_NOREPLACE */
-+
-+#endif /* MMAP_FIXED_H */
-Index: qemu-8.2.1/linux-user/mmap.c
-===================================================================
---- qemu-8.2.1.orig/linux-user/mmap.c
-+++ qemu-8.2.1/linux-user/mmap.c
-@@ -25,6 +25,7 @@
- #include "user-mmap.h"
- #include "target_mman.h"
- #include "qemu/interval-tree.h"
-+#include "mmap-fixed.h"
- 
- #ifdef TARGET_ARM
- #include "target/arm/cpu-features.h"
-@@ -273,7 +274,7 @@ int target_mprotect(abi_ulong start, abi
- static int do_munmap(void *addr, size_t len)
- {
-     if (reserved_va) {
--        void *ptr = mmap(addr, len, PROT_NONE,
-+        void *ptr =  mmap_fixed_noreplace(addr, len, PROT_NONE,
-                          MAP_FIXED | MAP_ANONYMOUS
-                          | MAP_PRIVATE | MAP_NORESERVE, -1, 0);
-         return ptr == addr ? 0 : -1;
-@@ -319,9 +320,9 @@ static bool mmap_frag(abi_ulong real_sta
-          * outside of the fragment we need to map.  Allocate a new host
-          * page to cover, discarding whatever else may have been present.
-          */
--        void *p = mmap(host_start, qemu_host_page_size,
--                       target_to_host_prot(prot),
--                       flags | MAP_ANONYMOUS, -1, 0);
-+        void *p = mmap_fixed_noreplace(host_start, qemu_host_page_size,
-+                                       target_to_host_prot(prot),
-+                                       flags | MAP_ANONYMOUS, -1, 0);
-         if (p != host_start) {
-             if (p != MAP_FAILED) {
-                 munmap(p, qemu_host_page_size);
-@@ -420,8 +421,9 @@ abi_ulong mmap_find_vma(abi_ulong start,
-          *  - mremap() with MREMAP_FIXED flag
-          *  - shmat() with SHM_REMAP flag
-          */
--        ptr = mmap(g2h_untagged(addr), size, PROT_NONE,
--                   MAP_ANONYMOUS | MAP_PRIVATE | MAP_NORESERVE, -1, 0);
-+        ptr = mmap_fixed_noreplace(g2h_untagged(addr), size, PROT_NONE,
-+                                   MAP_ANONYMOUS | MAP_PRIVATE | MAP_NORESERVE,
-+                                   -1, 0);
- 
-         /* ENOMEM, if host address space has no memory */
-         if (ptr == MAP_FAILED) {
-@@ -615,16 +617,16 @@ abi_long target_mmap(abi_ulong start, ab
-          * especially important if qemu_host_page_size >
-          * qemu_real_host_page_size.
-          */
--        p = mmap(g2h_untagged(start), host_len, host_prot,
--                 flags | MAP_FIXED | MAP_ANONYMOUS, -1, 0);
-+        p = mmap_fixed_noreplace(g2h_untagged(start), host_len, host_prot,
-+                                 flags | MAP_FIXED | MAP_ANONYMOUS, -1, 0);
-         if (p == MAP_FAILED) {
-             goto fail;
-         }
-         /* update start so that it points to the file position at 'offset' */
-         host_start = (uintptr_t)p;
-         if (!(flags & MAP_ANONYMOUS)) {
--            p = mmap(g2h_untagged(start), len, host_prot,
--                     flags | MAP_FIXED, fd, host_offset);
-+            p = mmap_fixed_noreplace(g2h_untagged(start), len, host_prot,
-+                                     flags | MAP_FIXED, fd, host_offset);
-             if (p == MAP_FAILED) {
-                 munmap(g2h_untagged(start), host_len);
-                 goto fail;
-@@ -749,8 +751,9 @@ abi_long target_mmap(abi_ulong start, ab
-             len1 = real_last - real_start + 1;
-             want_p = g2h_untagged(real_start);
- 
--            p = mmap(want_p, len1, target_to_host_prot(target_prot),
--                     flags, fd, offset1);
-+            p = mmap_fixed_noreplace(want_p, len1,
-+                                     target_to_host_prot(target_prot),
-+                                     flags, fd, offset1);
-             if (p != want_p) {
-                 if (p != MAP_FAILED) {
-                     munmap(p, len1);
-Index: qemu-8.2.1/linux-user/syscall.c
-===================================================================
---- qemu-8.2.1.orig/linux-user/syscall.c
-+++ qemu-8.2.1/linux-user/syscall.c
-@@ -145,6 +145,7 @@
- #include "qapi/error.h"
- #include "fd-trans.h"
- #include "cpu_loop-common.h"
-+#include "mmap-fixed.h"
- 
- #ifndef CLONE_IO
- #define CLONE_IO                0x80000000      /* Clone io context */
diff --git a/meta/recipes-devtools/qemu/qemu/no-pip.patch b/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
similarity index 70%
rename from meta/recipes-devtools/qemu/qemu/no-pip.patch
rename to meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
index 92b2edbe9f..c7bb9b1b47 100644
--- a/meta/recipes-devtools/qemu/qemu/no-pip.patch
+++ b/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
@@ -1,4 +1,8 @@
-qemu: Ensure pip and the python venv aren't used for meson
+From a93c2a6b2c9db9c4bd30298da43c37c5e5c6236e Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Wed, 22 May 2024 13:58:23 +0200
+Subject: [PATCH 11/11] qemu: Ensure pip and the python venv aren't used for
+ meson
 
 Qemu wants to use a supported python version and a specific meson version
 to "help" users and uses pip and creates a venv to do this. This is a nightmare
@@ -21,12 +25,15 @@ as it stands is a workaround.
 
 Upstream-Status: Inappropriate [oe specific]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+---
+ configure | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
-Index: qemu-8.2.0/configure
-===================================================================
---- qemu-8.2.0.orig/configure
-+++ qemu-8.2.0/configure
-@@ -937,7 +937,7 @@ python="$(command -v "$python")"
+diff --git a/configure b/configure
+index 482a1f8ef3..0da4bf3e4d 100755
+--- a/configure
++++ b/configure
+@@ -938,14 +938,14 @@ python="$(command -v "$python")"
  echo "python determined to be '$python'"
  echo "python version: $($python --version)"
  
@@ -35,11 +42,14 @@ Index: qemu-8.2.0/configure
  if test "$?" -ne 0 ; then
      error_exit "python venv creation failed"
  fi
-@@ -945,6 +945,7 @@ fi
+ 
  # Suppress writing compiled files
  python="$python -B"
- mkvenv="$python ${source_path}/python/scripts/mkvenv.py"
+-mkvenv="$python ${source_path}/python/scripts/mkvenv.py"
 +mkvenv=true
  
  # Finish preparing the virtual environment using vendored .whl files
  
+-- 
+2.44.0
+
diff --git a/meta/recipes-devtools/qemu/qemu/0012-linux-user-workaround-for-missing-MAP_SHARED_VALIDAT.patch b/meta/recipes-devtools/qemu/qemu/0012-linux-user-workaround-for-missing-MAP_SHARED_VALIDAT.patch
deleted file mode 100644
index 48034a4680..0000000000
--- a/meta/recipes-devtools/qemu/qemu/0012-linux-user-workaround-for-missing-MAP_SHARED_VALIDAT.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 5c73e53997df800a742f9cd7355f3045861984bb Mon Sep 17 00:00:00 2001
-From: Frederic Konrad <fkonrad@amd.com>
-Date: Thu, 18 Jan 2024 10:43:44 +0000
-Subject: [PATCH 2/2] linux-user/*: workaround for missing MAP_SHARED_VALIDATE
-
-QEMU v8.1.0 recently requires MAP_SHARED_VALIDATE flags implementation for mmap.
-
-This is missing from the Ubuntu 18.04 compiler but looks like to be in the
-kernel source.
-
-Signed-off-by: Frederic Konrad <fkonrad@amd.com>
-Signed-off-by: Francisco Iglesias <francisco.iglesias@amd.com>
-
-Upstream-Status: Inappropriate [OE specific]
-
-The upstream only supports the last two major releases of an OS.  The ones
-they have declared all have kernel 4.17 or newer.
-
-See:
-https://xilinx.slack.com/archives/D04G2647CTV/p1705074697942019
-
-https://www.qemu.org/docs/master/about/build-platforms.html
-
- The project aims to support the most recent major version at all times for up
- to five years after its initial release. Support for the previous major
- version will be dropped 2 years after the new major version is released or
- when the vendor itself drops support, whichever comes first.
-
-Signed-off-by: Mark Hatle <mark.hatle@amd.com>
----
- linux-user/mmap-fixed.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/linux-user/mmap-fixed.h b/linux-user/mmap-fixed.h
-index ef6eef5114..ec86586c1f 100644
---- a/linux-user/mmap-fixed.h
-+++ b/linux-user/mmap-fixed.h
-@@ -26,6 +26,10 @@
- #ifndef MMAP_FIXED_H
- #define MMAP_FIXED_H
- 
-+#ifndef MAP_SHARED_VALIDATE
-+#define MAP_SHARED_VALIDATE 0x03
-+#endif
-+
- #ifndef MAP_FIXED_NOREPLACE
- #define MAP_FIXED_NOREPLACE 0x100000
- 
--- 
-2.34.1
-
diff --git a/meta/recipes-devtools/qemu/qemu/4a8579ad8629b57a43daa62e46cc7af6e1078116.patch b/meta/recipes-devtools/qemu/qemu/4a8579ad8629b57a43daa62e46cc7af6e1078116.patch
deleted file mode 100644
index 5ad859ebe6..0000000000
--- a/meta/recipes-devtools/qemu/qemu/4a8579ad8629b57a43daa62e46cc7af6e1078116.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 4a8579ad8629b57a43daa62e46cc7af6e1078116 Mon Sep 17 00:00:00 2001
-From: Richard Henderson <richard.henderson@linaro.org>
-Date: Tue, 13 Feb 2024 10:20:27 -1000
-Subject: [PATCH] linux-user: Split out do_munmap
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Submitted [https://gitlab.com/rth7680/qemu/-/commit/4a8579ad8629b57a43daa62e46cc7af6e1078116]
-
-Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
-Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
----
- linux-user/mmap.c | 23 ++++++++++++++++-------
- 1 file changed, 16 insertions(+), 7 deletions(-)
-
-diff --git a/linux-user/mmap.c b/linux-user/mmap.c
-index 1bbfeb25b14..8ebcca44444 100644
---- a/linux-user/mmap.c
-+++ b/linux-user/mmap.c
-@@ -267,6 +267,21 @@ int target_mprotect(abi_ulong start, abi_ulong len, int target_prot)
-     return ret;
- }
- 
-+/*
-+ * Perform munmap on behalf of the target, with host parameters.
-+ * If reserved_va, we must replace the memory reservation.
-+ */
-+static int do_munmap(void *addr, size_t len)
-+{
-+    if (reserved_va) {
-+        void *ptr = mmap(addr, len, PROT_NONE,
-+                         MAP_FIXED | MAP_ANONYMOUS
-+                         | MAP_PRIVATE | MAP_NORESERVE, -1, 0);
-+        return ptr == addr ? 0 : -1;
-+    }
-+    return munmap(addr, len);
-+}
-+
- /* map an incomplete host page */
- static bool mmap_frag(abi_ulong real_start, abi_ulong start, abi_ulong last,
-                       int prot, int flags, int fd, off_t offset)
-@@ -854,13 +869,7 @@ static int mmap_reserve_or_unmap(abi_ulong start, abi_ulong len)
-     real_len = real_last - real_start + 1;
-     host_start = g2h_untagged(real_start);
- 
--    if (reserved_va) {
--        void *ptr = mmap(host_start, real_len, PROT_NONE,
--                         MAP_FIXED | MAP_ANONYMOUS
--                         | MAP_PRIVATE | MAP_NORESERVE, -1, 0);
--        return ptr == host_start ? 0 : -1;
--    }
--    return munmap(host_start, real_len);
-+    return do_munmap(host_start, real_len);
- }
- 
- int target_munmap(abi_ulong start, abi_ulong len)
--- 
-GitLab
-
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2023-6683.patch b/meta/recipes-devtools/qemu/qemu/CVE-2023-6683.patch
deleted file mode 100644
index 732cb6af18..0000000000
--- a/meta/recipes-devtools/qemu/qemu/CVE-2023-6683.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-From 405484b29f6548c7b86549b0f961b906337aa68a Mon Sep 17 00:00:00 2001
-From: Fiona Ebner <f.ebner@proxmox.com>
-Date: Wed, 24 Jan 2024 11:57:48 +0100
-Subject: [PATCH] ui/clipboard: mark type as not available when there is no
- data
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-With VNC, a client can send a non-extended VNC_MSG_CLIENT_CUT_TEXT
-message with len=0. In qemu_clipboard_set_data(), the clipboard info
-will be updated setting data to NULL (because g_memdup(data, size)
-returns NULL when size is 0). If the client does not set the
-VNC_ENCODING_CLIPBOARD_EXT feature when setting up the encodings, then
-the 'request' callback for the clipboard peer is not initialized.
-Later, because data is NULL, qemu_clipboard_request() can be reached
-via vdagent_chr_write() and vdagent_clipboard_recv_request() and
-there, the clipboard owner's 'request' callback will be attempted to
-be called, but that is a NULL pointer.
-
-In particular, this can happen when using the KRDC (22.12.3) VNC
-client.
-
-Another scenario leading to the same issue is with two clients (say
-noVNC and KRDC):
-
-The noVNC client sets the extension VNC_FEATURE_CLIPBOARD_EXT and
-initializes its cbpeer.
-
-The KRDC client does not, but triggers a vnc_client_cut_text() (note
-it's not the _ext variant)). There, a new clipboard info with it as
-the 'owner' is created and via qemu_clipboard_set_data() is called,
-which in turn calls qemu_clipboard_update() with that info.
-
-In qemu_clipboard_update(), the notifier for the noVNC client will be
-called, i.e. vnc_clipboard_notify() and also set vs->cbinfo for the
-noVNC client. The 'owner' in that clipboard info is the clipboard peer
-for the KRDC client, which did not initialize the 'request' function.
-That sounds correct to me, it is the owner of that clipboard info.
-
-Then when noVNC sends a VNC_MSG_CLIENT_CUT_TEXT message (it did set
-the VNC_FEATURE_CLIPBOARD_EXT feature correctly, so a check for it
-passes), that clipboard info is passed to qemu_clipboard_request() and
-the original segfault still happens.
-
-Fix the issue by handling updates with size 0 differently. In
-particular, mark in the clipboard info that the type is not available.
-
-While at it, switch to g_memdup2(), because g_memdup() is deprecated.
-
-Cc: qemu-stable@nongnu.org
-Fixes: CVE-2023-6683
-Reported-by: Markus Frank <m.frank@proxmox.com>
-Suggested-by: Marc-André Lureau <marcandre.lureau@redhat.com>
-Signed-off-by: Fiona Ebner <f.ebner@proxmox.com>
-Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
-Tested-by: Markus Frank <m.frank@proxmox.com>
-Message-ID: <20240124105749.204610-1-f.ebner@proxmox.com>
-
-CVE: CVE-2023-6683
-
-Upstream-Status: Backport [https://github.com/qemu/qemu/commit/405484b29f6548c7b86549b0f961b906337aa68a]
-Signed-off-by: Simone Weiß <simone.p.weiss@posteo.com>
-
----
- ui/clipboard.c | 12 +++++++++---
- 1 file changed, 9 insertions(+), 3 deletions(-)
-
-diff --git a/ui/clipboard.c b/ui/clipboard.c
-index 3d14bffaf80f..b3f6fa3c9e1f 100644
---- a/ui/clipboard.c
-+++ b/ui/clipboard.c
-@@ -163,9 +163,15 @@ void qemu_clipboard_set_data(QemuClipboardPeer *peer,
-     }
- 
-     g_free(info->types[type].data);
--    info->types[type].data = g_memdup(data, size);
--    info->types[type].size = size;
--    info->types[type].available = true;
-+    if (size) {
-+        info->types[type].data = g_memdup2(data, size);
-+        info->types[type].size = size;
-+        info->types[type].available = true;
-+    } else {
-+        info->types[type].data = NULL;
-+        info->types[type].size = 0;
-+        info->types[type].available = false;
-+    }
- 
-     if (update) {
-         qemu_clipboard_update(info);
diff --git a/meta/recipes-devtools/qemu/qemu_8.2.1.bb b/meta/recipes-devtools/qemu/qemu_9.0.0.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu_8.2.1.bb
rename to meta/recipes-devtools/qemu/qemu_9.0.0.bb
-- 
2.44.0


