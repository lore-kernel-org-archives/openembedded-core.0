Return-Path: <yashinde145@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AC60C4167B
	for <webhook@archiver.kernel.org>; Tue, 27 Dec 2022 16:42:18 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.160853.1672159336602062360
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Dec 2022 08:42:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SaZ7EBq7;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: yashinde145@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id 20so247346plo.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Dec 2022 08:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D9/b/GdwxsIQoyqaum5LYOfkbNQwCJcLdzCVSc8/EqM=;
        b=SaZ7EBq7hQ379fgMcnfA/cLcnwOzBMJ30nEIQLKH0IRKexqEfyDS+KnL2cTFFZkuQf
         nI6y9nxqNA963iQBTF4tSrR8/LR8TpVqj7BgzOVoGTFR7p8hns4R2QErH3p1mjOtQO+e
         cG6eYlgci8Ro8yBME1V7zoor58Gz7yj+5gTaroUMprbZX8tcfSEMI+SxMxeW6B7PB8qH
         DsZ1wcJP12qaMdyObL91dSvx8cN0w702tdABpGJzCHv2/kSAA8hZWAYHkMqyqjFJP47y
         vPfW3l/A2rVqhCH2iV0uJPEbYzFqBetNEbpW3kBUjHL1YxBDMaFAoeMyPWtNlIlcp3uj
         7Fhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D9/b/GdwxsIQoyqaum5LYOfkbNQwCJcLdzCVSc8/EqM=;
        b=gAm60Aschjv7POJ7ZvvcW7AxHKtiqAJuwVJ/B5gIPurkaPaTZFRkJ9X5Ht8N+t5Lnz
         +HLiwamO4iN9+WDkhx8ou4lGaXiuji6Ig1w8bzRADbHRd80hX2Jns71sKn9YwC60dhSb
         WG3V9HwO9LEPeqsjkpEqISQx2yemO8Ip99YMF05kfjrwDvqHhxUV+sQ3MG1yaoTiey2c
         s5v0Zs8ChtvtPG80LWFpaOYpDW8LITwFzD2uWxP+Ja1grJRaYxxHfCTFJwRx4UpEEKy9
         JjjaT0Slw6rAwAV3ToqF8HQMpT1Q6yWnfCI+aXb1cmV+4ngBB8mTpMT+TD9/RBFfYZY/
         HD8g==
X-Gm-Message-State: AFqh2kobERS9/3JTseNnmak/BfgVhf/z4LMy6Z4f8evWY540FeRQas3t
	KcjGM2peltcqfUW4PjxnJPcHc1fEJLVupA==
X-Google-Smtp-Source: AMrXdXszoopUA9qV3mJbLim+dgQaB0XQpaTdXPRzLcGfikIZkjnv7BQZ9Cc5KrPmRMulk9BN+/a/Ew==
X-Received: by 2002:a17:902:c401:b0:189:ba1f:b168 with SMTP id k1-20020a170902c40100b00189ba1fb168mr35937993plk.1.1672159335827;
        Tue, 27 Dec 2022 08:42:15 -0800 (PST)
Received: from localhost.localdomain ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id t8-20020a170902e84800b0017849a2b56asm9354159plg.46.2022.12.27.08.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 08:42:15 -0800 (PST)
From: Yash Shinde <yashinde145@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Yash.Shinde@windriver.com
Subject: [kirkstone] [PATCH v3] binutils : Fix CVE-2022-4285
Date: Tue, 27 Dec 2022 22:12:02 +0530
Message-Id: <20221227164202.3700000-1-yashinde145@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Dec 2022 16:42:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175030

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
index 0000000000..e5e404982e
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
+Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
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
-- 
2.25.1


