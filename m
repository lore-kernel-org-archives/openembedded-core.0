Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8088C4167B
	for <webhook@archiver.kernel.org>; Mon, 19 Dec 2022 15:31:46 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.24928.1671463900457506069
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Dec 2022 07:31:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Vor7AQeD;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: pgowda.cve@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id u7so1177195plq.11
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Dec 2022 07:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9FhUroVPBfb1R5z/czhAl+AC/wvJ0s3ARApR/WfOWWA=;
        b=Vor7AQeDRAN2/kvBxAFa09TI0wSiKtonxJ1CBGjIDNXy5QJL+YJ+TxRvfLJdWRk7Pz
         YCmxD53hZnQ0PjeZjERhRKIp5q6uqf6Y4jaHhTwZXPMK+DKd39FezmevQAo7c+BJk1F1
         taf3XtxuTt9Vqp0LvJc/ie25YbsyfmHFccG41e5m97szkn+lNYDcV8sjbRD9huJ4mT4z
         YMtJ70tzjtnSXxFGKroOv2BPthl6A2Ohrf0ifvJw26qNgQRXiiOQOamJ/wk7t/941u/K
         E6FJ84F7fs/HpvqhJ9mWVU1c/aHwMSKbdub3f92SqJPktrcn0s+R6R4y7bcTsW3/jwzv
         jdmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9FhUroVPBfb1R5z/czhAl+AC/wvJ0s3ARApR/WfOWWA=;
        b=HRMcOwqUuCws/d+o3FpKlqxdjaFHK/8QaU+5jQwjZkqOhets3xwxZxTRhZBjmdIAFL
         Ij2q6DlR0njzUHp+rV3EqFDx8cR/f5SnkRI4miZ0y3cCVcZg12Y/QzP9BoQsMzghfNz5
         MGcRQzdSHCDOtHk15bzzh9NRqSs60EQ587bbLNoIqABVcrCVMUY5XEbLBQ7dHXDoDtqH
         4G4/3+USbi7nisJtmivxJgFzP1y7ht399QBhVqxROA1Yr0nZLC+OBZtFRvtFKkkdRx+r
         dcQb09QvsnQKIYxEQ6STjZu7aRzJc4uXtAlnhRhy4OCOr3fL3Q71WVhdrUk4CY4ZX5PA
         1uEw==
X-Gm-Message-State: AFqh2krUDxAAtdbgjLLsqvzyPPYelXH0HN4xxGN1i2wLN+VfvUwELMYV
	zvuMA4ppn+EC8G4XeuRttwKh8cFzSeQ=
X-Google-Smtp-Source: AMrXdXu/wLI0L8Ce14HACndqgF8OpK8VDszAeT72Ek1vRhv2mongcp9ddxB2rNpeb4kAWAd/3KbgcA==
X-Received: by 2002:a17:90a:ee91:b0:223:b1e3:8ae6 with SMTP id i17-20020a17090aee9100b00223b1e38ae6mr7574197pjz.41.1671463899450;
        Mon, 19 Dec 2022 07:31:39 -0800 (PST)
Received: from localhost.localdomain ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id h2-20020a17090a050200b0020a11217682sm6017420pjh.27.2022.12.19.07.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Dec 2022 07:31:39 -0800 (PST)
From: pgowda.cve@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: rwmacleod@gmail.com,
	pgowda <pgowda.cve@gmail.com>
Subject: [PATCH] Binutils : Fix CVE-2022-4285
Date: Mon, 19 Dec 2022 21:01:33 +0530
Message-Id: <20221219153133.3582287-1-pgowda.cve@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Dec 2022 15:31:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174819

From: pgowda <pgowda.cve@gmail.com>

Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=5c831a3c7f3ca98d6aba1200353311e1a1f84c70]

Signed-off-by: pgowda <pgowda.cve@gmail.com>
---
 .../binutils/binutils-2.39.inc                |  1 +
 .../binutils/0015-CVE-2022-4285.patch         | 37 +++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0015-CVE-2022-4285.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.39.inc b/meta/recipes-devtools/binutils/binutils-2.39.inc
index b040e57037..419571d56c 100644
--- a/meta/recipes-devtools/binutils/binutils-2.39.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.39.inc
@@ -35,6 +35,7 @@ SRC_URI = "\
      file://0014-CVE-2022-38128-1.patch \
      file://0014-CVE-2022-38128-2.patch \
      file://0014-CVE-2022-38128-3.patch \
+     file://0015-CVE-2022-4285.patch \
 "
 S  = "${WORKDIR}/git"
 # Already in 2.39 branch
diff --git a/meta/recipes-devtools/binutils/binutils/0015-CVE-2022-4285.patch b/meta/recipes-devtools/binutils/binutils/0015-CVE-2022-4285.patch
new file mode 100644
index 0000000000..46ec0b15a3
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0015-CVE-2022-4285.patch
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
+Upstream-Status: Backport
+[https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=5c831a3c7f3ca98d6aba1200353311e1a1f84c70]
+
+Signed-off-by: Pgowda <pgowda.cve@gmail.com>
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


