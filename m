Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F701C47074
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 15:45:38 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.151000.1703864728323275507
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Dec 2023 07:45:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=DfSaPbMT;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d4a75a29fbso34885ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 07:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703864727; x=1704469527; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KzyTQ4K7XnJH6Ead8fzHXYQIMVAc1IkQOc1UGmP5YPY=;
        b=DfSaPbMTlpLBdMIZWwI+CNAig4aJfPZ/x7mgM8AOIV6AZ/jmpJmpsRbUbbjadXMIZZ
         1g94U2dPN37Fy9JgMRNdIob9DZjHp9DUzK1U5Bba7re9Zydx4jBTfCsj+PGLBX1XlEJT
         /g4adZ0p03Neu6KRHK0taUbaoA4hXNIy7Kxsd8CndLMg4OGrsCSQC5dcrpwWUMA0S5/P
         FKYt5aJXEMjwQRF+5fDSQSTdCN26YPUVxe13bDTNrpcWy9vfap1TNdd+c+f4WImG9ouD
         1eC5lummFj9xq4LV393pBcnKOxKX990mfsrJhr3h1gt3eH13pRQqcBGw9UsjbS4VfQjB
         t3pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703864727; x=1704469527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KzyTQ4K7XnJH6Ead8fzHXYQIMVAc1IkQOc1UGmP5YPY=;
        b=dWo3pDOcqmOxlUFJ/oOw6Y0EjCgQYsIf6Wn550reEZp0OnR/WY47k8EYHBYlrGAjOo
         2fLUTGiUYHnGsK851KS0jZyxlnytT0h93CRkwW8juFqRrfyPZgXBvxbLfc0Xegtjt1C6
         G0ojoStv9/xT5jd6IPvtGhonO2b5165USMCBKTgOQDe3mB//y8sYKb8TpHGFF9CCaLLf
         Q+6lU8ybQr0E+InSeNRI6mRkGveBtaBKxe9p9JJhSrwgnmwymZzyOx8MQt6QW6lXi8fE
         rPGvp5YjzRA3gqrxzzXbVUgeTZJ652uk44jbKX/54YGm9S2hdlQK5wdfrFdkxubD2/tU
         nRDA==
X-Gm-Message-State: AOJu0YzOKbODlLg1k1CPNXRxvhYlDpwT/0lyqFAIWxq5tGAc2KcM/Gvy
	t5MnbDVfi0jAemjJO33B10lH92+7Bbytpf06EQiQ6ML3JOVVCQ==
X-Google-Smtp-Source: AGHT+IFwYhZ7/7hE3tsuddXZvK1rrH8xcei2jGFdK6hsWo5fNTmFBSHwuLS1Z3zBVk+sruHSl9Q6KQ==
X-Received: by 2002:a17:902:a3cc:b0:1d4:6803:7fd7 with SMTP id q12-20020a170902a3cc00b001d468037fd7mr6979029plb.68.1703864727083;
        Fri, 29 Dec 2023 07:45:27 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id jm7-20020a17090304c700b001d3e6f58e5esm15772705plb.6.2023.12.29.07.45.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 07:45:26 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 12/41] linux/cve-exclusion6.1: Update to latest kernel point release
Date: Fri, 29 Dec 2023 05:44:26 -1000
Message-Id: <ec48d71311808126ce22b0ea771e37750ac98304.1703864512.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703864512.git.steve@sakoman.com>
References: <cover.1703864512.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 15:45:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193029

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c4ffd18d3e71b935acc050b106267db544d86df7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/cve-exclusion_6.1.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc b/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
index bf23742d70..1b51737c7d 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2023-12-18 14:15:17.069657+00:00 for version 6.1.65
+# Generated at 2023-12-23 08:44:42.304531+00:00 for version 6.1.68
 
 python check_kernel_cve_status_version() {
-    this_version = "6.1.65"
+    this_version = "6.1.68"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
-- 
2.34.1


