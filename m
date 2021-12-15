Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ED1AC3525C
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 01:44:39 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.2650.1639608049934947823
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 14:40:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=W2uW2P8m;
 spf=pass (domain: gmail.com, ip: 209.85.221.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id e5so7311431wrc.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 14:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WOZ4wRp/Nz6YbpG2tM1qXNdwh2fNTiqtRhSA+7q/ebw=;
        b=W2uW2P8mgKJ5dDCrhN5F2W/6EhdUrYsgZu2E6W1EDJX4bN2hXwNexepp1qz5EhsnXI
         TG72Tc0ZN8T5UFgk/I3Skz7UvHj3Hvuj9mbhaWX9T7+3uvsB3dyfJQRTCyKohZfiOOtl
         /D4VQlFl7wvMj/OotkfHwUqjq0UrY23Ok6dNXy9DdXNdSUHxhidbgXGrNEnqsEDHACfE
         5yEQz2y6uiF7X+ZA2JLq11pNdgso9FEkTs3rzd3PXqhdhmf+Vuc7+AL6yVGdXAakReXc
         ixrBRlsLW4kBTSPt3ta/17r4RUdqklMk8GMWQ0pe6uY0RmMvTD4dXzlfCvzeIj0bXSoF
         hgAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WOZ4wRp/Nz6YbpG2tM1qXNdwh2fNTiqtRhSA+7q/ebw=;
        b=vB4+ad9/lwJsiyTr2x0CNad8EcEhYQrf20RPdcn0Kr48xrPBeeE39N40PK/pERXJCu
         hOUk7BBithKxiXlAYqRv3yAX49qC/TZE9Jy+obxTFeyuW2PHx2ICTB8diHF4ljFXLyIs
         T6LKdH4gFEiSSUtj5LxpRbEdqVZhnPaDz7eH8xUFGDw5mX5arcqns3mXoZd++tYyVweV
         fTOfU748sqsuvYXgwVHulaEwp1tf0zxT8OwGKNveKSTev0bSIyd75RCpRvj97gPoBOuI
         ZzUD8mUahcB1EZieVnqVXBAIK23OupQT9PK7VYdL0rvpc5H75wI/huTeuKdsPnbX/pra
         LQHw==
X-Gm-Message-State: AOAM530ZmZq0uwgRCtUWv6LmS4iiobtfBIXsGJ6b1pYk8jm4FJo8flCB
	Ju7x8oaxdWx2DrOqA4pC2QD99MFB7adpmQ==
X-Google-Smtp-Source: 
 ABdhPJzgbkcr8AR8SN+r6huiT67gXn8EItrs8xTAXpOs+muPH35xSc2ti9R+Es1qYrkR3EL3Id+swA==
X-Received: by 2002:a5d:5889:: with SMTP id n9mr6367643wrf.669.1639608048573;
        Wed, 15 Dec 2021 14:40:48 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 u2sm3587269wrs.17.2021.12.15.14.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 14:40:48 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: [PATCH 15/26] dpkg: update 1.20.9 -> 1.21.1
Date: Wed, 15 Dec 2021 23:40:23 +0100
Message-Id: <20211215224034.1814148-15-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211215224034.1814148-1-alex@linutronix.de>
References: <20211215224034.1814148-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 01:44:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159757

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/dpkg/dpkg.inc           |  2 +
 ...ild.c-ignore-return-of-1-from-tar-cf.patch |  8 +--
 .../0014-arch-Add-support-for-ARCv2-CPU.patch | 68 -------------------
 .../dpkg/{dpkg_1.20.9.bb => dpkg_1.21.1.bb}   |  5 +-
 4 files changed, 8 insertions(+), 75 deletions(-)
 delete mode 100644 meta/recipes-devtools/dpkg/dpkg/0014-arch-Add-support-for-ARCv2-CPU.patch
 rename meta/recipes-devtools/dpkg/{dpkg_1.20.9.bb => dpkg_1.21.1.bb} (88%)

diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index 80865a31a1..00b1e9187a 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -61,6 +61,8 @@ PROV:class-nativesdk = ""
 
 PROVIDES += "${PROV}"
 
+FILES:${PN} += "${datadir}/zsh"
+
 PACKAGES =+ "update-alternatives-dpkg"
 FILES:update-alternatives-dpkg = "${bindir}/update-alternatives ${localstatedir}/lib/dpkg/alternatives ${sysconfdir}/alternatives"
 RPROVIDES:update-alternatives-dpkg += "update-alternatives"
diff --git a/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch b/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch
index 2dc68e2064..4d3f238012 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-from-tar-cf.patch
@@ -1,4 +1,4 @@
-From d6f5fed6bc56e1f3b885a796a43aa2868ace57bc Mon Sep 17 00:00:00 2001
+From cb47e9cd6735fcafd231748dab8884ae991b669c Mon Sep 17 00:00:00 2001
 From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
 Date: Tue, 16 Jun 2020 03:57:25 +0000
 Subject: [PATCH] build.c: ignore return of 1 from tar -cf
@@ -29,10 +29,10 @@ Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/dpkg-deb/build.c b/dpkg-deb/build.c
-index d13a21c1e..059f2be6d 100644
+index 76613adec..7c216d1a9 100644
 --- a/dpkg-deb/build.c
 +++ b/dpkg-deb/build.c
-@@ -480,6 +480,7 @@ tarball_pack(const char *dir, filenames_feed_func *tar_filenames_feeder,
+@@ -482,6 +482,7 @@ tarball_pack(const char *dir, filenames_feed_func *tar_filenames_feeder,
  {
    int pipe_filenames[2], pipe_tarball[2];
    pid_t pid_tar, pid_comp;
@@ -40,7 +40,7 @@ index d13a21c1e..059f2be6d 100644
  
    /* Fork off a tar. We will feed it a list of filenames on stdin later. */
    m_pipe(pipe_filenames);
-@@ -532,7 +533,9 @@ tarball_pack(const char *dir, filenames_feed_func *tar_filenames_feeder,
+@@ -534,7 +535,9 @@ tarball_pack(const char *dir, filenames_feed_func *tar_filenames_feeder,
    /* All done, clean up wait for tar and <compress> to finish their job. */
    close(pipe_filenames[1]);
    subproc_reap(pid_comp, _("<compress> from tar -cf"), 0);
diff --git a/meta/recipes-devtools/dpkg/dpkg/0014-arch-Add-support-for-ARCv2-CPU.patch b/meta/recipes-devtools/dpkg/dpkg/0014-arch-Add-support-for-ARCv2-CPU.patch
deleted file mode 100644
index ece18a33ac..0000000000
--- a/meta/recipes-devtools/dpkg/dpkg/0014-arch-Add-support-for-ARCv2-CPU.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From c6acfba64b470c7e919fd5bd29124d7228492537 Mon Sep 17 00:00:00 2001
-From: Guillem Jover <guillem@debian.org>
-Date: Fri, 28 May 2021 04:07:49 +0200
-Subject: [PATCH] arch: Add support for ARCv2 CPU
-
-This is based on the ARCv2 32-bit little-endian hard-float ISA.
-
-Closes: #980963
-
-Upstream-Status: Backport [https://salsa.debian.org/dpkg-team/dpkg/-/commit/0d134cdcb0dcc6b21fa7926964c1426a5821181d]
-
-Based-on-patch-by: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
-Signed-off-by: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
----
- data/cputable                  | 1 +
- scripts/Dpkg/Shlibs/Objdump.pm | 1 +
- scripts/t/Dpkg_Arch.t          | 4 ++--
- 3 files changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/data/cputable b/data/cputable
-index 9f2a8e0e4..277bed88f 100644
---- a/data/cputable
-+++ b/data/cputable
-@@ -20,6 +20,7 @@ i386		i686		(i[34567]86|pentium)	32	little
- ia64		ia64		ia64			64	little
- alpha		alpha		alpha.*			64	little
- amd64		x86_64		(amd64|x86_64)		64	little
-+arc		arc		arc			32	little
- armeb		armeb		arm.*b			32	big
- arm		arm		arm.*			32	little
- arm64		aarch64		aarch64			64	little
-diff --git a/scripts/Dpkg/Shlibs/Objdump.pm b/scripts/Dpkg/Shlibs/Objdump.pm
-index 4cee866e7..93319d1eb 100644
---- a/scripts/Dpkg/Shlibs/Objdump.pm
-+++ b/scripts/Dpkg/Shlibs/Objdump.pm
-@@ -100,6 +100,7 @@ use constant {
-     ELF_MACH_OR1K           => 92,
-     ELF_MACH_XTENSA         => 94,
-     ELF_MACH_MICROBLAZE     => 189,
-+    ELF_MACH_ARCV2          => 195,
-     ELF_MACH_AVR_OLD        => 0x1057,
-     ELF_MACH_OR1K_OLD       => 0x8472,
-     ELF_MACH_ALPHA          => 0x9026,
-diff --git a/scripts/t/Dpkg_Arch.t b/scripts/t/Dpkg_Arch.t
-index a3a9e6fee..f0bba272a 100644
---- a/scripts/t/Dpkg_Arch.t
-+++ b/scripts/t/Dpkg_Arch.t
-@@ -16,7 +16,7 @@
- use strict;
- use warnings;
- 
--use Test::More tests => 16836;
-+use Test::More tests => 18407;
- 
- use_ok('Dpkg::Arch', qw(debarch_to_debtuple debarch_to_multiarch
-                         debarch_eq debarch_is debarch_is_wildcard
-@@ -174,7 +174,7 @@ is(gnutriplet_to_debarch(undef), undef, 'undef gnutriplet');
- is(gnutriplet_to_debarch('unknown-unknown-unknown'), undef, 'unknown gnutriplet');
- is(gnutriplet_to_debarch('x86_64-linux-gnu'), 'amd64', 'known gnutriplet');
- 
--is(scalar get_valid_arches(), 539, 'expected amount of known architectures');
-+is(scalar get_valid_arches(), 554, 'expected amount of known architectures');
- 
- {
-     local $ENV{CC} = 'false';
--- 
-2.16.2
-
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.20.9.bb b/meta/recipes-devtools/dpkg/dpkg_1.21.1.bb
similarity index 88%
rename from meta/recipes-devtools/dpkg/dpkg_1.20.9.bb
rename to meta/recipes-devtools/dpkg/dpkg_1.21.1.bb
index 4c587f2bf2..ccb4f06d32 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.20.9.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.21.1.bb
@@ -1,7 +1,7 @@
 require dpkg.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https;branch=1.20.x \
+SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https;branch=main \
            file://noman.patch \
            file://remove-tar-no-timestamp.patch \
            file://arch_pm.patch \
@@ -14,11 +14,10 @@ SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https;branch=1.20.
            file://0001-dpkg-Support-muslx32-build.patch \
            file://pager.patch \
            file://0001-Add-support-for-riscv32-CPU.patch \
-           file://0014-arch-Add-support-for-ARCv2-CPU.patch \
            "
 
 SRC_URI:append:class-native = " file://0001-build.c-ignore-return-of-1-from-tar-cf.patch"
 
-SRCREV = "2177b782b16e77e97c9643961a5ae3c639bcc4a3"
+SRCREV = "9b52f8fa74571049d868cb2af0643ee7f89a6151"
 
 S = "${WORKDIR}/git"
-- 
2.20.1


