Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B588F53D9B
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 20:58:16 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.61522.1773694688633514127
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 13:58:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=mXqIRVtB;
 spf=pass (domain: baylibre.com, ip: 209.85.222.179, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8cb5c9ba82bso678491785a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 13:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773694687; x=1774299487; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=gtFeEejmTUo3VuU9quCz0XWTIW+HVC1Sn2lGhRR3QJQ=;
        b=mXqIRVtBe3Oi8oN8KVRj2C4S+biF/9838JqzPGjxpP9aIGbWDKy8dUIym3rVzKvlUa
         e6SKv2NO16rEBsLfU31j9HwbrIfpffjk4QEyhFCWnf/xO+BnxMMcBdo6xh9Yx+Xkw3cK
         WNizUxU9e9/20XWBYHe+aO8FtjzjqH1zD1NbFVOmg2S2PS9YhO9iahSsvuJyjW9VSov6
         L0YdEFBOpvYpP71r4ObwBeYKR0tTt0x14ZIFPrEa5IFqDI2kQINu9phXTcfoZrXDRtmY
         unngV1Ixp4R7voGemsr4ibk1tuHM0J2InOxJHhhCR9Dj7ZREZ3/joW8YhPZfOQRolMn1
         fbBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773694687; x=1774299487;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gtFeEejmTUo3VuU9quCz0XWTIW+HVC1Sn2lGhRR3QJQ=;
        b=NR21q5HJ5q91szWp2kyZkAP/f8I7K5QX/XsoC14DqP+LerRBGO36dEpUXDxZfa8dHJ
         nLCvZMSBzeGrvwIn4D3ejVpEfBXKp73IkysJEPMIFhLDGaoOD+/BubJmzJIKq5tTcsRJ
         EaSxXVS5UgWc6/Z8QAR5U/uNB5f0fcEOXhnlhPdXwI/kP8N93Us9iK0hrRcQOOui4epQ
         gC5E1dILV4nlG7rnrsiqt1ssUnbEeUA7goeBxE7/Cx93iuT6d7PiRPeFdoPwGTc+8SLR
         UcLq2vEdICFzYvu8Ufu4g2WuFOd73mvNVYzhpBnvxIj48Y78TesjR5OrNiTnS05Uzpxw
         qTfw==
X-Gm-Message-State: AOJu0Ywqw1OY/Ry7qq2y5iyh/3x2tIsx+xGgPKBdnKBHXDXhgPFdJB4Y
	HbMMWN13PLxd/Mfy78Dz5LgINITPxX5vaBSVxEk7g2+21pOEp93vdealxMV+QpmL/lOCAYKBnPF
	IpbBxP/E=
X-Gm-Gg: ATEYQzyY9cDw6Srf700rzyQLDi6RMs3HJGY0Izc2ptmnoG+J0JooF2ACycbhqaZMLpw
	EbmzGlBQh0eDZbFyQeHbpLdTF4FTPfeHCGwsBcpxEc+3N7x1mv0ZR9JFre3pvvcph2nX599t6m8
	cC+AvDTEjkav7NNIFtGCepzmPs9VpNZ8ZK5lVQQN9rlIl24laxKebeKJcIpPeVfPs6a0wu988Bx
	cSP9380ye7uxcEmNBe8xeH94xtEdUMiYfhZtMV230/N59yjvioYkFqHakzY87z0xYBShvfn0eBi
	1IOfP1Mvbp9BkQpFr1Vf1kdiWT/COuTX79gowgDc8I9N4uWXCmGP/wVFPPocL1y993hP96CQo6d
	fw3/aj0AcSiE12lyy9kZkWGdzHcJAkoZhR/EfNNH+zZYQ1BfIiUhudFBXdCF5PtqAfwWDXh8gKL
	EMw+nY08TULATEsmPN2dzm0TPp4iw=
X-Received: by 2002:a05:620a:4081:b0:8cd:79f2:dc48 with SMTP id af79cd13be357-8cdb5a9751bmr2059109585a.28.1773694686809;
        Mon, 16 Mar 2026 13:58:06 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cda1fbe54bsm1303245585a.9.2026.03.16.13.58.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 13:58:06 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] grub: add patch to use medany for riscv64
Date: Mon, 16 Mar 2026 16:58:03 -0400
Message-ID: <20260316205804.1627683-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 20:58:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233268

From the upstream bug report, filed in 2024:

|GRUB 2.12 does not compile correctly using large model on riscv64 using gcc 14.1.1 (gcc-14.1.1-5.fc40.x86_64).
|
|It is my understanding that the large model should not really be used on riscv64 yet and trying to build GRUB 2.12 with it results in an error:
|
|+ ././grub-mkimage -O riscv64-efi -o grubriscv64.efi.orig -d grub-core --sbat ././sbat.csv -m memdisk.squashfs -p /EFI/fedora all_video boot blscfg btrfs cat configfile cryptodisk echo ext2 f2fs fat font gcry_rijndael gcry_rsa gcry_serpent gcry_sha256 gcry_twofish gcry_whirlpool gfxmenu gfxterm gzio halt hfsplus http increment iso9660 jpeg loadenv loopback linux lvm luks luks2 memdisk mdraid09 mdraid1x minicmd net normal part_apple part_msdos part_gpt password_pbkdf2 pgp png reboot regexp search search_fs_uuid search_fs_file search_label serial sleep squash4 syslinuxcfg test tftp version video xfs zstd efi_netfs efifwsetup efinet lsefi lsefimmap connectefi
|././grub-mkimage: error: relocation 0x2b is not implemented yet.
|
|medany builds successfully and boots on the VisionFive2 and on VMs.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
This was originally submitted to solve VisionFive 2 builds in meta-riscv:

https://github.com/riscv/meta-riscv/pull/553

But it was suggested to submit here instead so it could be applied more
generally. I've tested it out three ways to ensure no adverse boot/build
effects:

1. MACHINE=visionfive2 in meta-riscv (the original test case) via SD card on a VisionFive 2
2. MACHINE=genericx86-64 (via QEMU), with EFI support enabled
3. MACHINE=qemuriscv64, with EFI support enabled

 ...any-instead-of-large-model-for-RISCV.patch | 39 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0263-Use-medany-instead-of-large-model-for-RISCV.patch

diff --git a/meta/recipes-bsp/grub/files/0263-Use-medany-instead-of-large-model-for-RISCV.patch b/meta/recipes-bsp/grub/files/0263-Use-medany-instead-of-large-model-for-RISCV.patch
new file mode 100644
index 0000000000..e10a116ae3
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0263-Use-medany-instead-of-large-model-for-RISCV.patch
@@ -0,0 +1,39 @@
+From fcf4b96cfd3a04e1cfa177b08afba4fd80c9978e Mon Sep 17 00:00:00 2001
+From: Jason Montleon <jason@montleon.com>
+Date: Fri, 3 May 2024 13:18:37 -0400
+Subject: [PATCH] Use medany instead of large model for RISCV
+
+Upstream-Status: Submitted [https://savannah.gnu.org/bugs/?65909]
+
+Signed-off-by: Jason Montleon <jason@montleon.com>
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+---
+ configure.ac | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 0d693f8..0289fe1 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1653,7 +1653,7 @@ fi]
+ 
+ CFLAGS="$TARGET_CFLAGS"
+ 
+-if test "$target_cpu" = x86_64 || test "$target_cpu" = sparc64 || test "$target_cpu" = riscv64 ; then
++if test "$target_cpu" = x86_64 || test "$target_cpu" = sparc64 ; then
+   # Use large model to support 4G memory
+   AC_CACHE_CHECK([whether option -mcmodel=large works], grub_cv_cc_mcmodel, [
+     CFLAGS="$TARGET_CFLAGS -mcmodel=large"
+@@ -1663,9 +1663,11 @@ if test "$target_cpu" = x86_64 || test "$target_cpu" = sparc64 || test "$target_
+   ])
+   if test "x$grub_cv_cc_mcmodel" = xyes; then
+     TARGET_CFLAGS="$TARGET_CFLAGS -mcmodel=large"
+-  elif test "$target_cpu" = sparc64 || test "$target_cpu" = riscv64; then
++  elif test "$target_cpu" = sparc64; then
+     TARGET_CFLAGS="$TARGET_CFLAGS -mcmodel=medany"
+   fi
++elif test "$target_cpu" = riscv64 ; then
++    TARGET_CFLAGS="$TARGET_CFLAGS -mcmodel=medany"
+ fi
+ 
+ # Stack smashing protector.
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 8c62315e69..7cdeff5edd 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -19,6 +19,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0003-grub.d-10_linux.in-add-oe-s-kernel-name.patch \
            file://0001-Revert-configure-Check-linker-for-image-base-support.patch \
            file://0002-Revert-configure-Print-a-more-helpful-error-if-autoc.patch \
+           file://0263-Use-medany-instead-of-large-model-for-RISCV.patch \
 "
 
 SRC_URI[sha256sum] = "d0415fbb3e739237064e173743a6e5f60c33a81ec02a069cc9152d80efff4967"
-- 
2.53.0


