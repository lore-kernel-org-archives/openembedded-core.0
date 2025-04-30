Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4555AC3ABAD
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 02:54:17 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.8211.1745981652995869095
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Apr 2025 19:54:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=VFVFKy5D;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22423adf751so68136185ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 19:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1745981652; x=1746586452; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mysJHprIr3k236125K9uYFA/ww1PTdCAwfeUTzO+Zxo=;
        b=VFVFKy5DWe1aC8QX545oM5J/pfTuntmOZ9Ul3RNo6wqyej/mmW11csXK1rKCwLT5Yb
         kGUZzAKjtZevwIxy9ENoPodem6962z4VwQPmvuc8WVjuVnvCwXZ76FKF+PEVXy2mmwYm
         mfergekAoitEzHTCYdHuguPu/4HZ6EhCsidyyyTPhcC7FB8SS1+B8Fbvbsh3NVGSisBP
         m2fy6MsK8P1CmI2VrR6zB+nq6xAJbWt1bB5Us3MRNS6xgdRCSQowzKKVmEEmh/xgeymA
         LyHX2N+DJp3QgOXNsLSF2bDqI2/NhfJGVtwyu69l5fu5eeZOd+8Fr1Z4iFkXRiybUId9
         nqVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745981652; x=1746586452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mysJHprIr3k236125K9uYFA/ww1PTdCAwfeUTzO+Zxo=;
        b=UjLal/Aa42IDllUVwaVWHFcwrLnpMG4feIGu8i1y1a4v+xEjSh6cSQ9G86gP63s8tD
         TuY8qE08Bujl+X+8I5QPNIcSUcLFFVHPah5jzIRBHMX/8rYEhTn1dPTgcYe3lVTOYqxf
         FvJGCQSXNoFQFb79JpScSiqnlqFl2UmHXXiUUb6C2EHkKM7aDzjN9+9DYtPNmHFdaB9E
         NO5RHCpHIaY71vAjXyMj5vqAQlyX7PRxHCSeSQDGUpVgq1ChKs/koNRFaTbVzqqagZyQ
         Va3NX7PlYvNntuR17KIBTBfv0V5YVfyZDSaP0kSqs7jX0zoYe2XWHrGMD2QlFhPLp4nH
         PNRw==
X-Gm-Message-State: AOJu0YwNz3ANXDNzytYQcve7SjYnawIarimDwIjVDHtJqhWzace9sfiN
	OPMnK+oRjfFWTA+GYwf/gxu92GEpNYTWrj0TA2eJFH889sd0+epjyR/1ckxHn6+BTpR1dm5ULTq
	D
X-Gm-Gg: ASbGncsPBRYgy89IB9kGX5DuXAT7pDJJfOjkHnhV4qTCgZpFyTiKNDU97SkzHiF0ECY
	a5gG1/KENMnURhfYyQvtaiq5yO2jSGXthNxTOP/fjrVQTYGgpFZc957D04PQr1GCT+Fdq/fn43I
	xHVGlt1tEcIA5cN3TQGKXphDW4Cr3vG94jQ3ER5uOXBH9GKFVsQJuIiv5WafRMuz8ziZ3h/XG9U
	PA+VHBS5b3hun70bFtkmXbT8TR9pYUJ3AbJEWqbusUZJkGL53olks2PAa+zxoKMrFXAlQPxXtcI
	9BGTPMoWOP8L8z5cQDYK/iZGBXQN3V0M8yYMO2aYlw==
X-Google-Smtp-Source: AGHT+IHTr6hclmnAY2AQbqa+PHbSVrz8HXV3ioGYX/Y+uVl4nzDcVPyyhcrLufSTeDyeUEEWvB02zA==
X-Received: by 2002:a17:903:18b:b0:220:c911:3f60 with SMTP id d9443c01a7336-22df35ca8a0mr21740775ad.47.1745981652268;
        Tue, 29 Apr 2025 19:54:12 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:34b:e5e0:c38a:7e03])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a34a2ea46sm347852a91.31.2025.04.29.19.54.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 19:54:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/14] binutils: Fix CVE-2025-1178
Date: Tue, 29 Apr 2025 19:53:34 -0700
Message-ID: <e820e5364c4b3ec52796a77842b480fea8bc7967.1745981510.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745981510.git.steve@sakoman.com>
References: <cover.1745981510.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 02:54:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215700

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Prevent an abort in the bfd linker when attempting to
generate dynamic relocs for a corrupt input file.

PR 32638

Backport a patch from upstream to fix CVE-2025-1178
Upstream-Status: Backport from [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=75086e9de1707281172cc77f178e7949a4414ed0]

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.38.inc                |  1 +
 .../binutils/0039-CVE-2025-1178.patch         | 33 +++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0039-CVE-2025-1178.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index 26d0b570f3..82dd5c9eb6 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -73,5 +73,6 @@ SRC_URI = "\
      file://0036-CVE-2023-39130.patch \
      file://0037-CVE-2024-53589.patch \
      file://0038-CVE-2025-0840.patch \
+     file://0039-CVE-2025-1178.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0039-CVE-2025-1178.patch b/meta/recipes-devtools/binutils/binutils/0039-CVE-2025-1178.patch
new file mode 100644
index 0000000000..9d2054abab
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0039-CVE-2025-1178.patch
@@ -0,0 +1,33 @@
+From 75086e9de1707281172cc77f178e7949a4414ed0 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Wed, 5 Feb 2025 13:26:51 +0000
+Subject: [PATCH] Prevent an abort in the bfd linker when attempting to
+ generate dynamic relocs for a corrupt input file.
+
+PR 32638
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=75086e9de1707281172cc77f178e7949a4414ed0]
+CVE: CVE-2025-1178
+
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+
+diff --git a/bfd/elf64-x86-64.c b/bfd/elf64-x86-64.c
+index 970379de..cbd16abc 100644
+--- a/bfd/elf64-x86-64.c
++++ b/bfd/elf64-x86-64.c
+@@ -4575,6 +4575,15 @@ elf_x86_64_finish_dynamic_symbol (bfd *output_bfd,
+ 
+       if (generate_dynamic_reloc)
+ 	{
++	  /* If the relgot section has not been created, then
++	     generate an error instead of a reloc.  cf PR 32638.  */
++	  if (relgot == NULL || relgot->size == 0)
++	    {
++	      info->callbacks->einfo (_("%F%pB: Unable to generate dynamic relocs because a suitable section does not exist\n"),
++					output_bfd);
++	      return false;
++	    }
++	  
+ 	  if (relative_reloc_name != NULL
+ 	      && htab->params->report_relative_reloc)
+ 	    _bfd_x86_elf_link_report_relative_reloc
-- 
2.43.0


