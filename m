Return-Path: <yashinde145@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D77EC4332F
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 18:11:45 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.26121.1671646297997233426
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Dec 2022 10:11:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JV1AycA3;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: yashinde145@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id v13-20020a17090a6b0d00b00219c3be9830so2847950pjj.4
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 10:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DyVoM/Yeb/jCDaU4KRSswvsyCAR8/lCCHyDHhZcETZ4=;
        b=JV1AycA3vouXMdKmu9lTIbOHtSzFlo1aPhNNx85UHMIsTt9JLs1GnyY1WpMd52L2qc
         7/MWOri+gbojTk7bWGZUTuJhba/hHX+w3heF3NeGpcdJJa459bHOe4hf6CjHNKDuiebV
         H0s6SPHrxJJBNxoe7xSnYz/6vyhYzeFRU/mEMD4pA6/ru+Dx19l1RU+uYfyPYDYYQ6if
         YP52JwtMwwGpJp/nWaSFuMt3H/ALVe/92m0LX++PqOsZt806KvZ8MAW58K1j8i2ACblO
         RGmHYcP/ztlRlRT85GesToCrftt5PgIQggadC8B5bj2i7bPocPJKIrnQCLw2PkqY2r8J
         4ZKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DyVoM/Yeb/jCDaU4KRSswvsyCAR8/lCCHyDHhZcETZ4=;
        b=tc8iU9mamrT8IfUNqGPRM3pnyZAVgWlRKx82oaiXYol8Mj33Qkj+w3AmK/6QdjGO8o
         I4xNxnCQ0K38sAGj4BIxxungLYLcYzJ1P/R5aqcR86GdxNDtobBcoZVDDjH0JzN6toru
         cv926+sHAyC/yAdNWdv7xCIgeBxAdlSCxCgcIa/INvRoJsDGrpRKU4bF8CHvjRlQDL0e
         Ilnvx/51y86hNRSIrsKjHHHuMrJKZub2yMd+TyeweQzu7ggZbfYZA68LCrtScoEu6EGH
         A/CAAMaENShRPzvlaH3tsn335+s2jXaTz8yyCa41hmHDPR0xoKF6NmrGsi/Anxsioeoe
         2UkA==
X-Gm-Message-State: AFqh2kqxLj5vxpOpuhUvc4Kq5ok1g+33voYU1rKTxyrMsJilBbj9OaBY
	ioO62x0HL5Q4K7g24m4FDLdE3DmtZ9E=
X-Google-Smtp-Source: AMrXdXsGeFVqP2qd1IwQ9F8coZrRIrLbOC6t4D5AqdN8zmGdtgp27796Yp3zWcPPBEWe7jEIVogeHA==
X-Received: by 2002:a17:903:2149:b0:189:5506:a7 with SMTP id s9-20020a170903214900b00189550600a7mr2508501ple.19.1671646297225;
        Wed, 21 Dec 2022 10:11:37 -0800 (PST)
Received: from localhost.localdomain ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id j14-20020a170902da8e00b001887e30b9ddsm11787469plx.257.2022.12.21.10.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Dec 2022 10:11:36 -0800 (PST)
From: Yash Shinde <yashinde145@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com,
	Umesh.Kallapa@windriver.com,
	Naveen.Gowda@windriver.com,
	Sundeep.Kokkonda@windriver.com,
	Shivaprasad.Moodalappa@windriver.com,
	Yash.Shinde@windriver.com
Subject: [kirkstone] [PATCH] binutils : Fix CVE-2022-4285
Date: Wed, 21 Dec 2022 23:41:21 +0530
Message-Id: <20221221181121.255767-1-yashinde145@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 18:11:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174936

From: Yash Shinde <Yash.Shinde@windriver.com>

Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=5c831a3c7f3ca98d6aba1200353311e1a1f84c70]

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 .../binutils/binutils-2.38.inc                |  1 +
 .../binutils/0019-CVE-2022-4285.patch         | 37 +++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0019-CVE-2022-4285.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index c1904768dc..0a4a0d7bc1 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -42,5 +42,6 @@ SRC_URI = "\
      file://0018-CVE-2022-38128-1.patch \
      file://0018-CVE-2022-38128-2.patch \
      file://0018-CVE-2022-38128-3.patch \
+     file://0019-CVE-2022-4285.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0019-CVE-2022-4285.patch b/meta/recipes-devtools/binutils/binutils/0019-CVE-2022-4285.patch
new file mode 100644
index 0000000000..e29bdaca00
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0019-CVE-2022-4285.patch
@@ -0,0 +1,37 @@
+From 5c831a3c7f3ca98d6aba1200353311e1a1f84c70 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Wed, 19 Oct 2022 15:09:12 +0100
+Subject: [PATCH] Fix an illegal memory access when parsing an ELF file
+ containing corrupt symbol version information.
+
+	PR 29699
+	* elf.c (_bfd_elf_slurp_version_tables): Fail if the sh_info field
+	of the section header is zero.
+
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=5c831a3c7f3ca98d6aba1200353311e1a1f84c70]
+CVE: CVE-2022-4285
+
+---
+ bfd/ChangeLog | 6 ++++++
+ bfd/elf.c     | 4 +++-
+ 2 files changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/bfd/elf.c b/bfd/elf.c
+index fe00e0f9189..7cd7febcf95 100644
+--- a/bfd/elf.c
++++ b/bfd/elf.c
+@@ -8918,7 +8918,9 @@ _bfd_elf_slurp_version_tables (bfd *abfd, bool default_imported_symver)
+ 	  bfd_set_error (bfd_error_file_too_big);
+ 	  goto error_return_verref;
+ 	}
+-      elf_tdata (abfd)->verref = (Elf_Internal_Verneed *) bfd_alloc (abfd, amt);
++      if (amt == 0)
++	goto error_return_verref;
++      elf_tdata (abfd)->verref = (Elf_Internal_Verneed *) bfd_zalloc (abfd, amt);
+       if (elf_tdata (abfd)->verref == NULL)
+ 	goto error_return_verref;
+ 
+-- 
+2.31.1
+
+
-- 
2.25.1


