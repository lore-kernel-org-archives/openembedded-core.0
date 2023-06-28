Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7BBAC001B0
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 02:30:04 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web11.7373.1687919396311611197
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 19:29:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=3MpPCl1S;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.179, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-39e86b3da59so4705500b6e.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 19:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687919395; x=1690511395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PmdZ74xaQM/iARvehcVXbd3mll9gmGfQOEbNb9UioWs=;
        b=3MpPCl1SUcQ+sSigCf3Nh2+dq6h4J71DdRM70NroEXuuiXePz1KKYCnnMp7oeL0d7g
         Is01O4ZN8A5Yc/hoQVtqZ6MMdoPzmb7+dAAXEUXH9V0MS/wyjbP2bbDHHZzMLR5tivJ4
         uaxQ4qSyUmJk9vaGILUVup71m23uS6cvAFG9km1J4/rIBtUI0zeVkPcQ8dVzWIXWju36
         PXfBNCjqRbAb+yGGG5bAEk91MdyNT/2/m7CCb0kmkPC38kL3aDik8+8OE133nRQkdNzb
         syLzLI2RiGAmmx3b767u1Jnae3O/3X2zLroHM2yG6fq0M8ntU7+UqXWF55ptjeNdayUg
         3G4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687919395; x=1690511395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PmdZ74xaQM/iARvehcVXbd3mll9gmGfQOEbNb9UioWs=;
        b=PNx1DWtk0docM1+wC6FdWBzWeIAntvRgqYSfcYoHK4tnMMkUKqMC4zGFSmkDjb4AR3
         FAkDo/W4SsTtyf24ZOuGQISU6fNcAXIljlKAPmqyQf0qTmdKzchWrBEajIk6dcOA0BJV
         AhS7dSy+aznoBf1HgBymPgQTy/6sldCdLH5rXY5/0qx2vLfBcYTrdk1EMp9opK5VPWoQ
         dhEHsvW5nC4i+pHwM5HQhldbeBGhsvXwLjnl/UCaFbvOZiaof8arzukhLpi/utWFDdsC
         ofXncf6SmPErsBCpoYws5APdP3kEPo19Lv1d7kUOqZMplOk/ObxvKKHi1pQMpdSLWRC9
         1+dA==
X-Gm-Message-State: AC+VfDzhpUQZNf5oeHl6tkwLzYpxZ8Fh38Ip2E4VQldNYAxQM1UkOcqt
	nxJcjkGqk7mvocsURJ/PmG5h3ToJi00WieV/p1Nl6g==
X-Google-Smtp-Source: ACHHUZ7BDeB/NJfADMaJcsJaas5n6OmSNw1t4kJZ4TLcpaMZLVkGawXCXgTO/Br6S8sNVeRwRx/6dQ==
X-Received: by 2002:a05:6808:148c:b0:3a3:6360:ffbe with SMTP id e12-20020a056808148c00b003a36360ffbemr1639912oiw.24.1687919395188;
        Tue, 27 Jun 2023 19:29:55 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c18-20020a62e812000000b0063d2d9990ecsm1568666pfi.87.2023.06.27.19.29.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 19:29:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 01/30] binutils: fix CVE-2023-1972
Date: Tue, 27 Jun 2023 16:29:17 -1000
Message-Id: <ebb15853372d28808189fc417409229ed051ad57.1687919241.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687919241.git.steve@sakoman.com>
References: <cover.1687919241.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 02:30:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183510

From: Ross Burton <ross.burton@arm.com>

Backport a patch from upstream to fix CVE-2023-1972.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 10d63933e3a30bfac2f6cec896460c22e04baadd)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.40.inc                |  1 +
 ...emory-access-when-an-accessing-a-zer.patch | 43 +++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0001-Fix-an-illegal-memory-access-when-an-accessing-a-zer.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.40.inc b/meta/recipes-devtools/binutils/binutils-2.40.inc
index 006d60e784..fb99d93b26 100644
--- a/meta/recipes-devtools/binutils/binutils-2.40.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.40.inc
@@ -34,5 +34,6 @@ SRC_URI = "\
      file://0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
      file://0015-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch \
      file://0016-CVE-2023-25586.patch \
+     file://0001-Fix-an-illegal-memory-access-when-an-accessing-a-zer.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0001-Fix-an-illegal-memory-access-when-an-accessing-a-zer.patch b/meta/recipes-devtools/binutils/binutils/0001-Fix-an-illegal-memory-access-when-an-accessing-a-zer.patch
new file mode 100644
index 0000000000..31157cacd2
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0001-Fix-an-illegal-memory-access-when-an-accessing-a-zer.patch
@@ -0,0 +1,43 @@
+From c22d38baefc5a7a1e1f5cdc9dbb556b1f0ec5c57 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Thu, 30 Mar 2023 10:10:09 +0100
+Subject: [PATCH] Fix an illegal memory access when an accessing a
+ zer0-lengthverdef table.
+
+  PR 30285
+  * elf.c (_bfd_elf_slurp_version_tables): Fail if no version definitions are allocated.
+
+CVE: CVE-2023-1972
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ bfd/ChangeLog | 6 ++++++
+ bfd/elf.c     | 5 +++++
+ 2 files changed, 11 insertions(+)
+
+diff --git a/bfd/elf.c b/bfd/elf.c
+index 027d0143735..185028cbd97 100644
+--- a/bfd/elf.c
++++ b/bfd/elf.c
+@@ -9030,6 +9030,9 @@ _bfd_elf_slurp_version_tables (bfd *abfd, bool default_imported_symver)
+ 	  bfd_set_error (bfd_error_file_too_big);
+ 	  goto error_return_verdef;
+ 	}
++
++      if (amt == 0)
++	goto error_return_verdef;
+       elf_tdata (abfd)->verdef = (Elf_Internal_Verdef *) bfd_zalloc (abfd, amt);
+       if (elf_tdata (abfd)->verdef == NULL)
+ 	goto error_return_verdef;
+@@ -9133,6 +9136,8 @@ _bfd_elf_slurp_version_tables (bfd *abfd, bool default_imported_symver)
+ 	  bfd_set_error (bfd_error_file_too_big);
+ 	  goto error_return;
+ 	}
++      if (amt == 0)
++	goto error_return;
+       elf_tdata (abfd)->verdef = (Elf_Internal_Verdef *) bfd_zalloc (abfd, amt);
+       if (elf_tdata (abfd)->verdef == NULL)
+ 	goto error_return;
+-- 
+2.34.1
+
-- 
2.34.1


