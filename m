Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E823CC83F07
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 03:12:40 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.15028.1751425959743602126
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 20:12:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Vp04r5h6;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-748e63d4b05so2625000b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 20:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751425959; x=1752030759; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nhJo1FnU+O7zeTMkCOhnleY30045WzmsQ7UCybBeGsY=;
        b=Vp04r5h6XRoqToHDN6sGGRN1aVMZUntsd0q+2g/Ji4uJCF65y8vKPle+2ViSA/iG1p
         tXG4QvOKbWZzt+xhVv11K8sqTRe4ZJxyU26wIuVVj0AAwyKBhqJHDzv17h8+CMKTJBfI
         frsmiw6a6UZjQNJxZkcLXGpio0RxVEhMc5s4m03PucE1GX0qqRBP29EqQxN18TWsDU3F
         Ky9mToSaOXraqULlnWh7CYAU5k5vYrR0KKLDRZnkaIACfFBzWPbEG7/VLGQdxVGF1ING
         KKmST/inVr/vUAmpARnVa+0uzX1sHx7tqOxhecilnfzfUgRm7JVEg+3ksexQAICTyTRo
         mkDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751425959; x=1752030759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nhJo1FnU+O7zeTMkCOhnleY30045WzmsQ7UCybBeGsY=;
        b=k5sLj9cTkztA/UXZCUBR+7y1+hlm1dzIvlrBDEjJL1CIHsIx3KlZvopRI92M+aGRJn
         vuw/roROPXUjJBElS5jIu1wh6mHCrUXKWl+QQyJbeeWcY7KikSHjJliQBoePwfJQ9NNU
         ILod3czl4mDh0vDG0nLLs62XB5SURqhDR6o8seeayAn6K9YvbyAuSgJMIgZfeE8K7ko4
         ZbfplnQLHnsVYb8acz27nIhfM3RT0nqZfKLUK2i+5oO2NzT/dM28V0OABSnNtkONMjcM
         MCnVAIJHNvqrSDKFMnLAqxSdXSCksoOGlUcWTLxMgMVC68kMHfPyRoAKncVFi5xEYvFu
         J6CQ==
X-Gm-Message-State: AOJu0Yz+pafDxf32sgWqPweZ2GrvAfjztUQhMfDCZgMP35o/iJdCZbTS
	qiFipZ2/9UEP4VY1xFBRvJ0gZjXq20pcnqoAi3lwM//6pCEME6McQnHoBAtJmba4DBG+Yn7GZS/
	6Zypi
X-Gm-Gg: ASbGncsYqiNccG/TUxWnPrihfpZb6KiIjQPqdTMEGSl6iDweNb4G1WHHIRL0a1Waxc7
	9YXRxmyIwa9ihn2Fru4LkDVkKsdXGHyQPRuaEbzYEKDPvomFzOaTrqme5UHS+1Pl4k7KKL/OJF0
	MxKL+IEhXpmlXWb3woWGZV7V6UCs2U7p041HfRgHfW1jp7g+7p5jV8HdkXnW4LXMbHsu5OUBRRc
	GZrmuK8LkyXbVIP89H0Ce6KZ9odjmJS8eIsdxt5+wK9dE60/JqDC0eB8ydz8xCRWJDdj9fv5mGD
	1/v6CaTqTbZMsomKTBehWURoLZrj8ZGxK0Sob2J5NgE4+3uGWZWoBQ==
X-Google-Smtp-Source: AGHT+IHB9aSm3hYOvMQkPKL7nfRKcgTen5XUe028IponS46Ywv7zxATDHGEO/33lSg1inQDCHa2aIw==
X-Received: by 2002:a05:6a00:3cd6:b0:742:ae7e:7da8 with SMTP id d2e1a72fcca58-74b510402e8mr1899603b3a.8.1751425958938;
        Tue, 01 Jul 2025 20:12:38 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:34f8:320a:2e39:118e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af58069a9sm13633241b3a.174.2025.07.01.20.12.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 20:12:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 10/19] linux: add CVE_STATUS for a chrome* bug
Date: Tue,  1 Jul 2025 20:11:55 -0700
Message-ID: <8c39f6fa4454147e22d5e386046ed9b1076d7a95.1751425749.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751425749.git.steve@sakoman.com>
References: <cover.1751425749.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 03:12:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219764

From: Randy MacLeod <Randy.MacLeod@windriver.com>

This is not a linux-yocto CVE yet it shows up in the reports as:
   linux-yocto-custom CVE-2023-3079  0.0  8.8  Unpatched  https://nvd.nist.gov/vuln/detail/CVE-2023-3079

For reference, the CPE says:
  Affects cpe:2.3:o:linux:linux_kernel:-:*:*:*:*:*:*:*
So affects all Linux systems,
  Running on/with cpe:2.3:a:google:chrome:*:*:*:*:*:*:*:*

[ YOCTO #15780 ]

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 22ef4d2d116afb9d603a05fb107dd9da0e74558b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/cve-exclusion.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/linux/cve-exclusion.inc b/meta/recipes-kernel/linux/cve-exclusion.inc
index f1b7db44b6..80c76433ef 100644
--- a/meta/recipes-kernel/linux/cve-exclusion.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion.inc
@@ -133,6 +133,8 @@ CVE_STATUS[CVE-2023-1076] = "fixed-version: Fixed from version 6.3rc1"
 
 CVE_STATUS[CVE-2023-2898] = "fixed-version: Fixed from version 6.5rc1"
 
+CVE_STATUS[CVE-2023-3079] = "not-applicable-config: Issue only affects chromium, which is not in linux-yocto"
+
 CVE_STATUS[CVE-2023-3772] = "fixed-version: Fixed from version 6.5rc7"
 
 CVE_STATUS[CVE-2023-3773] = "fixed-version: Fixed from version 6.5rc7"
-- 
2.43.0


