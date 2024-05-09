Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F171C10F1A
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 12:05:40 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.8401.1715256338878293586
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 May 2024 05:05:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=l2jWjial;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6f453d2c5a1so741607b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 05:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1715256338; x=1715861138; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R8amuLqM/tLTRyu3WVQVtdshMgxjCw6eE+brmfWchl4=;
        b=l2jWjialVVBmHPS2mi2xdAppZzpBuHoo5b4Tg50XP5wstl8dOnHmkC2KCjq26JlDfo
         BkNhcHQhkAVM6bcSr2PdSqNQWnwd5Ck9wInHatew9ZbX/5PxAJzOWVXhP0keT7JdTQRI
         OkKuL7xVMJl3h31WmMXJaC7+ZbHJ4jaOeZW9tBlfLPXnTx82sZQyhdcpOOQfJg1M+35p
         NOLe9N5M000q6O1znV4AInuSUpRpLf9gPmQ+IG3oXx24GYZoZaddZu/HTguHUrYxFFPW
         JZz4cmbUju5gaPX20sqjZBZOc+oCLG7hlawLJKwSpAtlrDJDjRrCiDG7oIQfNfR5YXjE
         MOlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715256338; x=1715861138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R8amuLqM/tLTRyu3WVQVtdshMgxjCw6eE+brmfWchl4=;
        b=tO+tM580oJFWvn3oPWDeEQtcxPU70cDFTn5iTc70JMY7KvcPiAoiXCLSc0YSf/G1UZ
         nKDGzVUMrUCTl873PtEkbfds89dsxYoFT5bVXLdmNGUIG8nUbZN34XCo6uMl0+qWdIiM
         eG1BcLLsM+kjdmC5xFg3ZK5J9/y0x3Zw5Tfhb+2H5dzdYTlJpYokUPnq6S5XTsSZNbmA
         6luteauNnmts6BPeEPPzZaCSJmt4x33VXOX5LJiThf7Um3e+dnYsq2avDI/wErDT2QZs
         MwLLZxwNb+bUn2ea0QBhQHf7qi62SQkKukVoQe77F3T89xWaHouimZKLA8ZJf1cL5HB/
         +0KQ==
X-Gm-Message-State: AOJu0Yx2xI0eQlTpfwULOfGWKWI86X3CXEyGEhNUVZNTSAV9rxQD87CA
	AVh9O++eXhVt3K7YRm9pv7mIuM7Tf68sLd6oGqZU1+jI/38J3WHDiyOAHJRZJv11TIn6wDhFPrC
	a
X-Google-Smtp-Source: AGHT+IG8RvZlg8UwQm+HDqKjmKC5v+WfL0qONeSOANRPVXgYsFfQo0Aew1A7OVlI818fFtJJkgRINw==
X-Received: by 2002:a05:6a20:729a:b0:1ae:3812:945e with SMTP id adf61e73a8af0-1afc8dd9e18mr5835188637.62.1715256338194;
        Thu, 09 May 2024 05:05:38 -0700 (PDT)
Received: from xps13.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2af2c41sm1185613b3a.172.2024.05.09.05.05.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 05:05:37 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/23] linux-yocto/5.15: update CVE exclusions (5.15.153)
Date: Thu,  9 May 2024 05:04:51 -0700
Message-Id: <2a4c110a9c019cfa0ade1eeed68857c50a232e74.1715256149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1715256149.git.steve@sakoman.com>
References: <cover.1715256149.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 12:05:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199160

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/nluedtke/linux_kernel_cves

    1/1 [
        Author: Nicholas Luedtke
        Email: nicholas.luedtke@uwalumni.com
        Subject: Update 25Feb24
        Date: Sun, 25 Feb 2024 07:03:08 -0500

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/cve-exclusion_5.15.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_5.15.inc b/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
index f60ba5177a..c163fe4938 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2024-03-19 17:41:49.053760 for version 5.15.152
+# Generated at 2024-03-28 13:46:59.505239 for version 5.15.153
 
 python check_kernel_cve_status_version() {
-    this_version = "5.15.152"
+    this_version = "5.15.153"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
-- 
2.34.1


