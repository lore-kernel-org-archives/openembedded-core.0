Return-Path: <yashinde145@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D12BC4332F
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 18:00:25 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.25827.1671645621188131280
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Dec 2022 10:00:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ndi2a1OP;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: yashinde145@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id 124so11272022pfy.0
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 10:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SfxNFH1WPqlU4qfexx+ktOQ3R0keRoFLfSE46fpKvNU=;
        b=ndi2a1OPvXLMWPza/pOrUWkp1KtXdIxUN4G1FwKKsm/S8nqntQYdjVFbiBkfqkVWwj
         452YsxtSnERwwUGtAjS82wKAoE2D70WteLM8i6FnZb7C3bIbM7XZMGTQdbLuMCEGXXwc
         c1zKg4ihV6QAZGiaofqT6hIfurtCp7q7L/g9zvB9ERjwEdaShtU8ktvj2wbB6VcmzZqt
         tTVV+ECNhRFQg3oBMfB4l8mapLF/RX8QPT42HSM0VLAvWDA8R/RAvybrBtE7AVooHmJM
         oJO5XEaMLti1dyBqAH6IgkKmVGmTCQ8flLoZiW8bo6JUjavOkD80RWpUmqM449tKAbmX
         6kpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SfxNFH1WPqlU4qfexx+ktOQ3R0keRoFLfSE46fpKvNU=;
        b=Kjm/VD1wwLBt2VZx/2KW4FS9HgxoibJMsCA0HWiXHtJJk77xApjKdRz221t7dYeXdW
         Zj9vK4p7hTMEOdW+uOMBwC3YCP647o58DpJX966qOrC/rB3FUfSNQK7Yp4gTW1GzG47L
         jEXiuQacUN2NKSsJ/1BRyvS/GXM7WHr7qpDETzlWnH5R0Az9a0sEuBJqcG2gBtIpFfID
         J1S0ijlC/Wn0c2nTO+NwetFmdb4YFoDbVxTgi0cS1xxgFHnHrtC5aVQhCE+Tlm2GBoXp
         PztaylY5v8pMu3vEPJoJkx3SsQHKkgcmiJKGTOrouf+Pl20Ct0hzJ6D9Jdi45LHCT+7L
         Gchg==
X-Gm-Message-State: AFqh2kqZxgLh57JRLOd7SRBVMFKVCPkEgas0R0H6Rgm24znL+6GJElVV
	NNySN19Y7VDDe14UELNQCr0JZm6RoMQ=
X-Google-Smtp-Source: AMrXdXtaWErjkvo5ufettuJgVSHG2cgG1jHPiRo7/PE0F+KEz5Z0duepg/q6Iawa0laiC5Uu9/HzAw==
X-Received: by 2002:aa7:8757:0:b0:56c:3e38:bf0e with SMTP id g23-20020aa78757000000b0056c3e38bf0emr2914467pfo.11.1671645620354;
        Wed, 21 Dec 2022 10:00:20 -0800 (PST)
Received: from localhost.localdomain ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id n8-20020aa79848000000b0056be1581126sm11241037pfq.143.2022.12.21.10.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Dec 2022 10:00:19 -0800 (PST)
From: Yash Shinde <yashinde145@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Yash.Shinde@windriver.com
Subject: [PATCH v2] binutils : Fix CVE-2022-4285
Date: Wed, 21 Dec 2022 23:30:09 +0530
Message-Id: <20221221180009.255511-1-yashinde145@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 18:00:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174935

From: Yash Shinde <Yash.Shinde@windriver.com>

Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=5c831a3c7f3ca98d6aba1200353311e1a1f84c70]

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 .../binutils/binutils-2.39.inc                |  1 +
 .../binutils/0015-CVE-2022-4285.patch         | 36 +++++++++++++++++++
 2 files changed, 37 insertions(+)
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
index 0000000000..5ff5290334
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0015-CVE-2022-4285.patch
@@ -0,0 +1,36 @@
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
-- 
2.25.1


