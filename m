Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B955D5B15F
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 18:35:32 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10921.1765650926301920771
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 10:35:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aPqbgIzb;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-bde0f62464cso2150428a12.2
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 10:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765650925; x=1766255725; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O6eeW1KGqiycwl83Sb7UOmAgThOlZVnql7YhWJfjIxU=;
        b=aPqbgIzbmiJOtFRMQlBkrkveKy4+6lXsku/MhUlzabz0ZYeTw5/fMu+BMLE8lEeqHu
         RkcBE32yGN0Q+EDTWpijcqe3TV1VCI+0Mf+aFzXRKiNZmLPyFVYgPiWHZZYM8gBdQdc8
         LB6Ygp4leUMB3frOku28Bj9EBRmDbX5zUORJ4sEpL2vYt0IVsYlN54RJw4i42crQpG4p
         DbonWqrvAsnzBe2nxPIvdruitZNq0Xz3kpFE/kZDOSjma8zL4rmvfbvUhoKrDePN35+3
         UeAiwNT2m+/dfWvA2gWdx3gDXTWE5kR5NdVd5DNSBv0vLYDA4hN3rq8Hjzh93J3nYBjQ
         gnvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765650925; x=1766255725;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O6eeW1KGqiycwl83Sb7UOmAgThOlZVnql7YhWJfjIxU=;
        b=W1hSJWuYtCL4/z/L7SY1Cet8midpYwuBdwpALuL1ziCzGre31tD+9599yE+l3amuj0
         l8+byrPSEEw1EorZbLGYrSI+SIER5exzChLISjVMW9IM5nXMuIzyQ9hqd8p+looDPfj9
         UwFs76FiiFE8eZean9HREZFyUTRa3vIIQGZFnus0fPCa8kFGhitD8wcGbaASoQy3u3OI
         nng40gftoHYopvpVrZyfxd/vN9PUbqjMJxYHQZ3ozhlcDbxfLsMrYtXqg8SOPxPdVog8
         AIzlJdJs0TJLA6hQz4LNDzajDk7I6T1JYHM3eDCBaAd9Thb2JYKa37UD9wC9dse3FH2N
         kfcA==
X-Gm-Message-State: AOJu0Yzd+yxYkZpuFvZWZo9IKsOeAhZCbyN8Dvr/L65bGTWlk8yjyqdw
	dw4cf6ttx4TS+KVfJNlfFYlySF++4cziHRwO1ceG7hLXZqgovXWj2RG79gsatcuF
X-Gm-Gg: AY/fxX6mWNNGubK2hwGwj8GQEIiX+hC/IFymePOuF7tA6PnRyVRuhpg2tUJrcbE866a
	xkIyMcDHh2Kt7bV7ASLziOjGJDCl+FkLSpvNT2b/mfUIVH/SjwMK/+SNrS6aJaiT/5oToOvwVSx
	DIJM7HPjJ197IQJRbCcQvqjrhKB9aBpgFukLLRRvLlewpdaTrVPPVucmH+UA/Hul2yegKg0tLYZ
	aECCJ655VOGKzBJOq78eOjejRLrLCkCVOnwecxbva0oythV4cUFCzohEPJDhf5+JrfQsNxW5MgW
	36c3kWRKp6y7AP3t/M+AzRFGV3Fj6ZwfwaBAOMxwpkCojfAqqJy/BwShsQb1LRm+rjmPNlkgj+v
	HGw9TDx90rgdtBcPGmgRqScgAqqRrkNbKo99Ep55MU/IcBgLobzqUu/CfzRSXs6IZ7+Kh1fC4o4
	/xBXRJMrF4Fc224lOVlI77+G0zzS7LqF4T4JVHoOoA0U7AQHLVeqA0MVE4JMBpD6Hnp1PvPRE0i
	DF+r0BnG/Tm2CbDjyapl9wIN9Qqp4DkWzE23KyjDCU=
X-Google-Smtp-Source: AGHT+IHNgjaPJUfwucscno+VPYWGGPtPdB4pgSI9NUHNo8WjJlR1/HapFJtOki7CKxe1U99eUx1xEw==
X-Received: by 2002:a05:7301:4290:b0:2a4:61a1:c0d5 with SMTP id 5a478bee46e88-2ac3012e79emr3906504eec.36.1765650925174;
        Sat, 13 Dec 2025 10:35:25 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::69b8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e2b51b2sm26753137c88.8.2025.12.13.10.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 10:35:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] kexec-tools: Upgrade to 2.0.32
Date: Sat, 13 Dec 2025 10:35:22 -0800
Message-ID: <20251213183522.1194934-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 18:35:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227691

License-Update: Update with current text for GPLv2 [1]

* This version has support for riscv64 so enable it in COMPATIBLE_HOSTS
* LoongArch support and other fixes
* Drop patch already upstream in 2.0.32 release

[1] https://git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git/commit/COPYING?h=main&id=591ebf60649de53dd7a9c916ef4e831626ab1810

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Upgrade to a version which has RV64 support instead of backporting the patches

 ...nt-base-match-pinned-section-address.patch | 62 -------------------
 ...-tools_2.0.31.bb => kexec-tools_2.0.32.bb} |  8 +--
 2 files changed, 3 insertions(+), 67 deletions(-)
 delete mode 100644 meta/recipes-kernel/kexec/kexec-tools/0001-Make-the-segment-base-match-pinned-section-address.patch
 rename meta/recipes-kernel/kexec/{kexec-tools_2.0.31.bb => kexec-tools_2.0.32.bb} (92%)

diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-Make-the-segment-base-match-pinned-section-address.patch b/meta/recipes-kernel/kexec/kexec-tools/0001-Make-the-segment-base-match-pinned-section-address.patch
deleted file mode 100644
index 6babf16e6e..0000000000
--- a/meta/recipes-kernel/kexec/kexec-tools/0001-Make-the-segment-base-match-pinned-section-address.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 0d8a9e12b6509cb2a79818f5f4062a0bee33edfc Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 3 Sep 2025 13:28:32 -0700
-Subject: [PATCH] Make the segment base match pinned section address
-
-ET_EXEC uses image base of 0x400000, but the build forces
-section VMAs like .text = 0x10000. LLD now errors when any
-section address is below the image base unless you explicitly
-set the base. (Older LLD tolerated it.)
-
-To fix this, set the image base to match forced section addresses
-
-Fixes
-| x86_64-yoe-linux-ld.lld: error: section '.text' address (0x10000) is smaller than image base (0x400000); specify --image-base
-| x86_64-yoe-linux-ld.lld: error: section '.bss' address (0x12000) is smaller than image base (0x400000); specify --image-base
-
-Upstream-Status: Submitted [https://lists.infradead.org/pipermail/kexec/2025-September/033493.html]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- kexec_test/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
---- a/kexec_test/Makefile
-+++ b/kexec_test/Makefile
-@@ -5,7 +5,7 @@ RELOC:=0x10000
- KEXEC_TEST_SRCS:= kexec_test/kexec_test16.S kexec_test/kexec_test.S
-
- dist += kexec_test/Makefile $(KEXEC_TEST_SRCS)				\
--	kexec_test/x86-setup-legacy-pic.S
-+	kexec_test/x86-setup-legacy-pic.S kexec_test/kexec_test.ld
-
- BUILD_KEXEC_TEST = no
- ifeq ($(ARCH),i386)
-@@ -31,7 +31,7 @@ $(KEXEC_TEST): CPPFLAGS+=-DRELOC=$(RELOC
- $(KEXEC_TEST): ASFLAGS+=-m32
- #$(KEXEC_TEST): LDFLAGS=-m32 -Wl,-e -Wl,_start -Wl,-Ttext -Wl,$(RELOC) \
- #		       -nostartfiles
--$(KEXEC_TEST): LDFLAGS=-melf_i386 -e _start -Ttext $(RELOC)
-+$(KEXEC_TEST): LDFLAGS=-melf_i386 -e _start -T $(srcdir)/kexec_test/kexec_test.ld
-
- $(KEXEC_TEST): $(KEXEC_TEST_OBJS)
- 	mkdir -p $(@D)
---- /dev/null
-+++ b/kexec_test/kexec_test.ld
-@@ -0,0 +1,16 @@
-+ENTRY(_start)
-+SECTIONS
-+{
-+  . = 0x10000;
-+  .text : { *(.text .text.*) }
-+
-+  /* Place the note after .text to avoid overlap */
-+  . = ALIGN(16);
-+  .note.gnu.property : { *(.note.gnu.property) }
-+
-+  .rodata : { *(.rodata .rodata.*) }
-+
-+  /* If you need bss fixed: */
-+  . = 0x12000;
-+  .bss : { *(.bss .bss.* COMMON) }
-+}
diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.31.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.32.bb
similarity index 92%
rename from meta/recipes-kernel/kexec/kexec-tools_2.0.31.bb
rename to meta/recipes-kernel/kexec/kexec-tools_2.0.32.bb
index b12f76a0bf..e052cc5b1b 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.31.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.32.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Kexec is a fast reboot feature that lets you reboot to a new Linu
 HOMEPAGE = "http://kernel.org/pub/linux/utils/kernel/kexec/"
 SECTION = "kernel/userland"
 LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+LIC_FILES_CHKSUM = "file://COPYING;md5=570a9b3749dd0463a1778803b12a6dce \
                     file://kexec/kexec.c;beginline=1;endline=20;md5=af10f6ae4a8715965e648aa687ad3e09 \
                     "
 DEPENDS = "zlib xz"
@@ -19,10 +19,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz
            file://0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch \
            file://0001-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitly.patch \
            file://0001-ppc-fs2dt-Match-function-signatures.patch \
-           file://0001-Make-the-segment-base-match-pinned-section-address.patch \
            "
-
-SRC_URI[sha256sum] = "ddaaa65b02b4f8aa9222586b1f26565b93a4baeffd35bcbd523f15fae7aa4897"
+SRC_URI[sha256sum] = "41c427651269cba7ecb0a3a537403076c5694949783b5cc3ae046223bc962087"

 inherit autotools update-rc.d systemd

@@ -86,7 +84,7 @@ SYSTEMD_SERVICE:kdump = "kdump.service"

 SECURITY_PIE_CFLAGS:remove = "-fPIE -pie"

-COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*|powerpc.*|mips.*)-(linux|freebsd.*)'
+COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*|powerpc.*|mips.*|riscv64.*)-(linux|freebsd.*)'
 # makedumpfile would not compile on mips/rv32
 COMPATIBLE_HOST:mipsarcho32 = "null"
 COMPATIBLE_HOST:riscv32 = "null"

