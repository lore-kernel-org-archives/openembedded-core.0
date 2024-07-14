Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66DE4C3DA49
	for <webhook@archiver.kernel.org>; Sun, 14 Jul 2024 12:39:59 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web10.15476.1720960792753017240
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jul 2024 05:39:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Ro2qRG6W;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.172, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3c9cc681ee0so1980127b6e.0
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 05:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720960792; x=1721565592; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NyTQ0JgEQ8HFXFkETzCsaazlcgZVllu4eJOBZI46BxY=;
        b=Ro2qRG6WWge0vxwLj0PkICMI98Wdh7Ldv0vWNfJgk6T2LFMmgUj1erIoOMcLxnRNGh
         b6F9L78T2Jrg4EMRkW8x4BJZtxGUXcN6Ocmcqo3l1gEHztmNPQbInRBZCfbKIYUkGucu
         T43pyghHI0lRjJuASHX6Uadt+j+Wb6lvRFW8MAsuU9tPbUeXRzXBwUz/izjUFrVTQ5R4
         haNPAHX1ybr7bvLnpbcfxdwf87PtsA4kCnLecvqoHtcvmfXApJSe7CLMR93Usp/kYKJe
         FPRaS8JuiUEfZ+ums7Zozsval1x5udwLiIYYOfMsM6TKnCgzeyRJ2gEnb8CcWH/nqf9o
         8lxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720960792; x=1721565592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NyTQ0JgEQ8HFXFkETzCsaazlcgZVllu4eJOBZI46BxY=;
        b=eUri+OcmAO1UUTZEMcBOc+jobnGyQjg+ajPuDJCnp39dlSg98d4t1Obz2o89SAUAFv
         mUQQKVFvFyBBj++Ceh1kIHHUWo/BIwODeVt33eCk09uR0elIPt3WvVS8WPu9GJVMUEro
         mpQBSuF9Lrd8IPf9N6h6DLUaeLp/+MXXTJd686xqdBqboRCIak0VaiHud2H+ZO2ZmKja
         NrjvtvhOpq7c9cKc5iouMuEHGjLRlqJoN/J+kZLITEa4QVBGpcV/GGqhxl/wr84NlkCV
         4wXpzBu6f9JTU85MNTKouMrLWamjIUohw3DdxtNs2+izAfSJ+ySwWU/EHr+23LCPuQxJ
         +XcQ==
X-Gm-Message-State: AOJu0Yzjptn+kCovd6YsjsKCVDrjb584Jsd3RYPfE3Ys0BrbPkTTLC6G
	DXnlPQwW/yNtXsIceHgNzBAh+oI52eR+xm39Uw6Lpr7yogAV+1AD/0bx1o45qfNOIEVx24hGVHq
	6TG8=
X-Google-Smtp-Source: AGHT+IFkwQobWcATFLAOZcUNuJNp0G46bsm/MqlLM3KSMzUpCu1qZVHUWlDR3W+o/jgjfXGVqTJWzg==
X-Received: by 2002:a05:6808:1b0a:b0:3d9:3234:6268 with SMTP id 5614622812f47-3d93c0e9c2cmr19847880b6e.38.1720960791841;
        Sun, 14 Jul 2024 05:39:51 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bb7006bsm23245245ad.41.2024.07.14.05.39.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jul 2024 05:39:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 25/27] cve-exclusion: Drop the version comparision/warning
Date: Sun, 14 Jul 2024 05:38:54 -0700
Message-Id: <7eef8839d131861cca04e1424f0682e81638ca0a.1720960579.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720960579.git.steve@sakoman.com>
References: <cover.1720960579.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 12:39:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201884

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Since the CVE repository is no longer being updated, drop the warning
comparision since it is no longer valid.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../recipes-kernel/linux/cve-exclusion_6.6.inc | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.6.inc b/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
index 9f1f03ac53..32a0701edf 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
@@ -1,14 +1,14 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2024-05-02 12:41:43.351358+00:00 for version 6.6.29
-
-python check_kernel_cve_status_version() {
-    this_version = "6.6.29"
-    kernel_version = d.getVar("LINUX_VERSION")
-    if kernel_version != this_version:
-        bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
-}
-do_cve_check[prefuncs] += "check_kernel_cve_status_version"
+# Generated at 2024-06-06 20:41:33.044442+00:00 for version 6.6.32
+
+#python check_kernel_cve_status_version() {
+#    this_version = "6.6.29"
+#    kernel_version = d.getVar("LINUX_VERSION")
+#    if kernel_version != this_version:
+#        bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
+#}
+#do_cve_check[prefuncs] += "check_kernel_cve_status_version"
 
 CVE_STATUS[CVE-2003-1604] = "fixed-version: Fixed from version 2.6.12rc2"
 
-- 
2.34.1


