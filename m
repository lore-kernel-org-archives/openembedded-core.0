Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3759BCF6499
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 01:58:06 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.45288.1727661476285643881
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Sep 2024 18:57:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=FfuyUYvT;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2e0946f9a8eso2692102a91.1
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Sep 2024 18:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1727661475; x=1728266275; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qNMX08NOQ1D+e7PviF8h502UiwGIQf4jOx7hKybfwgM=;
        b=FfuyUYvTCJpLyDSm8EyjGCCZhRHB2LD/M+un47RpF6ec0YcUjVqO2lrvaotBl934Vr
         JHgS32S/AiEgEKPjJGqNa9Rlu9AT5JrM5ww0vvQQYYjNSfNFhyRlCF0BnIOkxcYYdrac
         Q+IPHftxmqbWnJKecj9zC8nLyeVQU4ZV60xOzY/y1l6NsyCAXXyNMLONQG4kdsMf3rRZ
         Qt8gUSPKkpc/ydv81sQj0Thj4p+GBNt2nnakQ8IHG4dZ9iVO5xe56lr3m7z1XGkrWTOj
         46IgnPR5I+SCj1RyuFkLWolBSAYlFlBdFKXM7DmLB2daLPbgETBgg8KmJC3uhAO3HxL0
         sMmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727661475; x=1728266275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qNMX08NOQ1D+e7PviF8h502UiwGIQf4jOx7hKybfwgM=;
        b=aYRZxQVqAUB/3aKuZaI0K/UU8Wic0jBXXOMNQRjJFUtXb3ASieaKOF//QAnIC4FsIq
         zuqyXjG8GL++se6usXoH25iIcE8o2F8aUpPu+U44x/H9xP3aQ6xhEWhrfeVmGVMBNKvG
         m/hsfu4QmU+EWZN582RKcHsUjAAAcqyR1Lw3M8zsBdx4p3oX73p3soOni7cmL/Rclm7a
         QLIYtHa5rLEWejfMsLwQ4ZMrB+iukm1I59eMx8i6NbGxgfItnIOIBDF+2/4IMZvmeG3A
         s8QXEcbxXDwdB0v3EjnOYRefjcF2B36QRiopsUSfpFpsGXaHDTQJMVjPOj/gtspct/87
         pOww==
X-Gm-Message-State: AOJu0YxC1fA17sWS2xWlTc+gsS1tm2O7apTOh+q3DdVj+AMy/ROBnxGv
	p/INO/5FBJLOuwrQLSWoYcK8JPxE7i1fbyfQed4ERLof9+cxdjM7L6XasdkAT643xaOsernSjEO
	Bpl4=
X-Google-Smtp-Source: AGHT+IHurqmf1xezDNnz46O8iHWlsK6KCD9o1jx7G4PI48hWDWqiQJOc5WBYvFlZpRfsXyftxGFJFw==
X-Received: by 2002:a17:90a:34c5:b0:2c9:7e9d:8424 with SMTP id 98e67ed59e1d1-2e0b8ec8cdfmr12764002a91.30.1727661475604;
        Sun, 29 Sep 2024 18:57:55 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e0d4af744bsm5496070a91.23.2024.09.29.18.57.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 18:57:55 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 15/27] testimage: fallback for empty IMAGE_LINK_NAME
Date: Sun, 29 Sep 2024 18:57:10 -0700
Message-Id: <1b026479e6d86d43d68ba26bed4b31dac91fc327.1727661284.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1727661284.git.steve@sakoman.com>
References: <cover.1727661284.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Sep 2024 01:58:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205077

From: Konrad Weihmann <kweihmann@outlook.com>

if IMAGE_LINK_NAME is set empty to disable the symlinking
for image artifacts in deploy, testimage fails, as the path assembly
is incorrect.
In that case fallback to IMAGE_NAME

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c7a4e7e294992acc589c62adcaf6cd32659f2f9b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/testimage.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
index 2f68f83dfd..954c213912 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -110,7 +110,7 @@ TESTIMAGELOCK:qemuall = ""
 
 TESTIMAGE_DUMP_DIR ?= "${LOG_DIR}/runtime-hostdump/"
 
-TESTIMAGE_UPDATE_VARS ?= "DL_DIR WORKDIR DEPLOY_DIR_IMAGE IMAGE_LINK_NAME"
+TESTIMAGE_UPDATE_VARS ?= "DL_DIR WORKDIR DEPLOY_DIR_IMAGE IMAGE_LINK_NAME IMAGE_NAME"
 
 testimage_dump_monitor () {
     query-status
@@ -208,7 +208,7 @@ def testimage_main(d):
     bb.utils.mkdirhier(d.getVar("TEST_LOG_DIR"))
 
     image_name = ("%s/%s" % (d.getVar('DEPLOY_DIR_IMAGE'),
-                             d.getVar('IMAGE_LINK_NAME')))
+                             d.getVar('IMAGE_LINK_NAME') or d.getVar('IMAGE_NAME')))
 
     tdname = "%s.testdata.json" % image_name
     try:
-- 
2.34.1


