Return-Path: <omri.sarig13@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2EEFC02194
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 13:08:57 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.115389.1738674534673339468
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Feb 2025 05:08:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M7AW1nw7;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: omri.sarig13@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-540218726d5so5404118e87.2
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 05:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738674532; x=1739279332; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ForLG5jI68B+65s62rQ0V0rBiaINrLil4UdFftGLtVQ=;
        b=M7AW1nw7s5jm8geYwD4b4lZX5TqqjTb4I/U3GVNzHRDjBW2zvZeFSm2CKg/qpKieRw
         XzmevJ/j84Dd5jgYZVkJZMMNcoLuNBBH385b+5Q77N+qnmcpLaOQhiWi4vMT9m3SjOed
         nUEoMizLXCCxuWvfT2Xg1el6G66eUMJUYl5W1WjZkj6EkJODQsW7ZNLrQ3FAooRuKsuD
         dGdni2zipWiwnSFXuqodmSCaA6OZEUUQdJ4f7t6/jiAn0vxB4nHkq0zVBpItAVMyuHaS
         +MADCwmYqgfSVp0US9JWpXP5wH3TD7rPDhqaO4rifVrmNW0LXhCMu+RdQhJ2X+rVDwqJ
         X5fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738674532; x=1739279332;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ForLG5jI68B+65s62rQ0V0rBiaINrLil4UdFftGLtVQ=;
        b=SC3mN1ws2KH6CPP9wADvhszEN8n9M6O1NTjW2pynvKbxlN2Gw4nZeNWjNWi8TgKheU
         amXMJfWM12GMEQlT1KTk0z0yspB9DPbqaSJptsj6hf9lKIYOCv8dcYgcH9JxFbF87XL1
         +P+kRGlTVyEFI7wN/EZqSGPAT1+DdzOVOYQ/pE0fetZMT424psH+u+0UqIO8AVlHcq71
         Ed7LQ4oAEhBC30gNz21WyJ4q/hoEX7PoJoX7TKmUocPwqmHqRO2oetDpvMykIeCXZFGk
         znZVubC0VRbXwDutZ4pMKM57nZ16Gzz5P01FHA6ZVc20itT1gB6NbzbUOWxLQKcVSfmQ
         4IFQ==
X-Gm-Message-State: AOJu0Yzq1c1c5Dfs0k/g/gS4BEK7PR+qJCTnw5NcBcMHTOTBsh1LBRPq
	qTAbR28Hr3evs0n5XZCCg4lbYNh1ggSDZ8tQRyqqUGL4MYdq0wwRuZxBQ6c7K4c=
X-Gm-Gg: ASbGncuy4xn0ZLKHHzgeS1/+DJMDJo6/lQ0k/p92tZWfWcajkBruzs02iS5nbZJhznB
	/wTDEpFAisANPTwbztB4ZZRCvFZ0BqTK4258DSt7g/xN6MVTCgd/9X+rJ6K1GfZ9Mm/rwmTDjWz
	YYJcp8RHQmymJeAct7vJf6LSzRjLQeAKZiWb/3cZP92WpY1dtHPtxiSW7xaMQmMcMHRreK/+KZL
	nrYdyaY+WRlJgmXv2+lF9p5XyYBXd5TzhbS79zBsn1T21rRzn+Ggi6Jbbm+v+sU4u44yq68diHk
	QrakO4XWt4uxsAFxonUkheDFbNVMS7gByD8nzgT2xv+5tBO3QP/TEtjvjesxO6TbwwA6SBfA9g=
	=
X-Google-Smtp-Source: AGHT+IHyF8ierxRucqHEY6p5V/CsBq2zQEfSulqqLdTdBIyyomwqMTVQyv4VlJDjGNQwOVz90C5WPg==
X-Received: by 2002:a05:6512:1392:b0:543:9b35:5abf with SMTP id 2adb3069b0e04-543e4bdff84mr7625874e87.2.1738674532268;
        Tue, 04 Feb 2025 05:08:52 -0800 (PST)
Received: from omsa-HP-EliteBook-840-14-inch-G9-Notebook-PC.prevas.se ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebebe4bdsm1566027e87.214.2025.02.04.05.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 05:08:50 -0800 (PST)
From: Omri Sarig <omri.sarig13@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Omri Sarig <omri.sarig13@gmail.com>
Subject: [PATCH v2 1/2] python3: Fix typo in python3-manifest.json
Date: Tue,  4 Feb 2025 14:08:39 +0100
Message-ID: <20250204130840.2282237-1-omri.sarig13@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 13:08:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210787

Fix a wrong "the" to be the intended "that".

Signed-off-by: Omri Sarig <omri.sarig13@gmail.com>
---
 meta/recipes-devtools/python/python3/python3-manifest.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index f99cc5e2f0..441830833b 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -1,7 +1,7 @@
 # DO NOT (entirely) modify this file manually, please read.
 #
 # IMPORTANT NOTE:
-# Please keep in mind that the create_manifest task relies on the fact the the
+# Please keep in mind that the create_manifest task relies on the fact that the
 # target and native Python packages are the same, and it also needs to be executed
 # with a fully working native package (with all the PACKAGECONFIGs enabled and all
 # and all the modules should be working, check log.do_compile), otherwise the script

