Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B181CC54E5D
	for <webhook@archiver.kernel.org>; Tue, 12 Mar 2024 13:53:48 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.10098.1710251624538409513
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Mar 2024 06:53:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=cHwNTWlk;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1dd10a37d68so48042545ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Mar 2024 06:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710251624; x=1710856424; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Si6LmshsOcn8TILhVZQKcxA8BVn4A5d3O5VbWRAbKFQ=;
        b=cHwNTWlk2RhKzy2L6EgXPPmx51L90G/WJPsObhl7z9VDW/a/0AVXIuVLWNvD2Z2MDh
         JUgYbGkTQaefJtLCa4MtONFu9JvyWWXraiPDclzlYWYdCn9JBQ1SbcxJE3wRKtb+fmTR
         vH0BvDGVVXvlGK5hcHr67+QSxcQAXy+i7meeMiYtXZ8WNTJ4QuMoU5nvzC9pAylOA3LT
         iOzqtiK5LsQRk8/0yGd06KpT4a6uiOcbIb7HSsE2Hc6Wwn6ys+Uy31BDppSsMRhWdIxA
         yNVL1LFCfZJ+8EgBYpbnBb6lfx/OQeGaFuADFUZwcHIF5JdG7EQ/WppCXC5y7eqqD9Js
         sKlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710251624; x=1710856424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Si6LmshsOcn8TILhVZQKcxA8BVn4A5d3O5VbWRAbKFQ=;
        b=f6Zyp4hJbkqN4STT5vGIoR6nFG4WkbCVkzcRa0zGQ0b/Vy71a6hMmNImVXdqihoaeN
         bVaIW//+Ywghk+xlez0xs4V7gdlSeDR5QezVnrFZmPdO5G+124VeBTMdFxVFxf/0EIKG
         tWkazJZB2xqQcLIR+ggYN+5CH4gWlQytbMT7plBN8hsAs+ykRrqLDye8f7ZNrPuHQDMf
         rfMugw0lqa5hjNYG6QDTRODnvTaO5yPiJYxbZch48Bz2OYbXcku11YzNQzGOTQdfBjxs
         wfG5VpM1qKUr4JR1Ui6pdc1pH1iXYMbvxnmmro5zHXXpBEBE7/iS2dmunAbloRiYwkRj
         lqqA==
X-Gm-Message-State: AOJu0YyTWtWTYbRwu6tCxSFQiB2KazXKpvCw3PD4vwmfMBBZsjIjWg/w
	9Ns6x82TGMfJ3QHZLm8fj/9hHrFzl8vlQZke84997Sq0t/tNz/fLE/w312Y9rj/sQ79ar2W05s0
	EOiY=
X-Google-Smtp-Source: AGHT+IF/U0vUd5e8NmsHem+ramVdhju07ctEFFzSUGMyf0+8j7OzPMejXtHXLJNzErqyLReIBEP90g==
X-Received: by 2002:a17:902:d2cc:b0:1dd:8cab:21bf with SMTP id n12-20020a170902d2cc00b001dd8cab21bfmr416140plc.13.1710251623695;
        Tue, 12 Mar 2024 06:53:43 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id 12-20020a170902c10c00b001dc3916853csm6734776pli.73.2024.03.12.06.53.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 06:53:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 6/8] linux-yocto/5.15: update CVE exclusions (5.15.150)
Date: Tue, 12 Mar 2024 03:53:21 -1000
Message-Id: <253dd177e608f3e2d6fb8ea73d265e4d1a74b7cd.1710251458.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710251458.git.steve@sakoman.com>
References: <cover.1710251458.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Mar 2024 13:53:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196988

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
index 2e30efe6be..922d7f457f 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2024-02-26 23:36:34.200936 for version 5.15.149
+# Generated at 2024-03-08 10:36:30.059302 for version 5.15.150
 
 python check_kernel_cve_status_version() {
-    this_version = "5.15.149"
+    this_version = "5.15.150"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
-- 
2.34.1


