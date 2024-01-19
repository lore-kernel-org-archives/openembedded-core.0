Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EA5CC47DD9
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 21:14:26 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web10.6079.1705698864623395340
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jan 2024 13:14:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FDqxqZeg;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-681922a61baso10591816d6.1
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 13:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705698864; x=1706303664; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2uOkWQOHLvdPLh+ZsbI6rNNLBzEtIO5g/pUgzc5zENo=;
        b=FDqxqZeg30SkKK37rW3QVqVLOJnvVYUKPtC20FHQPmtNSVVjtDc7iKxL+PPlJGDbM0
         wg0X3UAFnB3trwHybYgd7ZeZG2eDZv/VftfIkcr6yizQngmyjT/0U2LS/w4tNmUxUE9y
         gVIWkzXapnNRPFz9yg3HgpuTpSUzxEDX6C3dGT/9CqMqWESz+RxKUnpWaqtzq54mnBiV
         B7NpUf6LxrIfV1v/JQT94SExqtEFVRaQvg8+TOGSOVHNVDzr/dlMc1GFgWfLnSGaOlnk
         xPIuRFZ+5PusVwCSMmpmqf2x4MLkW9vOFWJFPqw+Z2d3tFvm1uCIXD+RVpioRw2yIt1m
         hQeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705698864; x=1706303664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2uOkWQOHLvdPLh+ZsbI6rNNLBzEtIO5g/pUgzc5zENo=;
        b=TIQLrtwMQ1qSwqVcSBIRi5A0Ryvynuuvr+WFx84eWP0vRd31BQnMu/7dzKE728R/vp
         w7d0OCj6w2FXY1j7wyrtv2eYqyMLrvunnhjnm7cXorj0sQEwJDjoVEUX3qLO2cE1bvLp
         3zZBUD/BYLkW2A8QQaZQtvSVjS2/WbblXUHDxBXjN0Xh794Oe3kSQICGs2rSykBSp+V7
         5cLbiA9crb8JB4SQ5cfxQ28h2Yb8sYwLH2h7yPQ+cn5KjkAVaI3pV9np5GDc99SqAqxj
         c9mXIfJ7xxrSm4pnAzvNujsBRTubbHXuLjM6SaB7+gkqLXfaT/8kTbE3gmdsAK1BFRy3
         TdOw==
X-Gm-Message-State: AOJu0Ywe73uY8R0+zJDFfosUoTT3XFUkwcd9pIhtyJ4xGaI+So96wMLW
	cN+jb1h85MyPmpC0GIGljKQCWmBOM1dO16E9X9oP6T3/R1Hd3dBePBVKRocdi2Y=
X-Google-Smtp-Source: AGHT+IEmGpAFWRtVi5xzSsPYg9R7KTOS4ZNhslq1t/WE9LKZWcZxO0FrDKWeMTQuAAnKaSrAD7wWEg==
X-Received: by 2002:a05:6214:29ef:b0:682:4c34:90d2 with SMTP id jv15-20020a05621429ef00b006824c3490d2mr638561qvb.7.1705698863639;
        Fri, 19 Jan 2024 13:14:23 -0800 (PST)
Received: from bruce-XPS-8940.. ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id mk13-20020a056214580d00b0068178f50102sm33552qvb.25.2024.01.19.13.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 13:14:22 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/11] linux-yocto/6.6: update CVE exclusions
Date: Fri, 19 Jan 2024 16:14:10 -0500
Message-Id: <724d8f54fcd82f4d9488843c4473d8ea90a05bec.1705698717.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1705698717.git.bruce.ashfield@gmail.com>
References: <cover.1705698717.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 21:14:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194068

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/nluedtke/linux_kernel_cves

    1/1 [
        Author: Nicholas Luedtke
        Email: nicholas.luedtke@uwalumni.com
        Subject: Update 27Dec23
        Date: Wed, 27 Dec 2023 19:47:13 -0500

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/cve-exclusion_6.6.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.6.inc b/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
index ee7df04c4a..2b74d3585d 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2024-01-03 18:54:52.866645+00:00 for version 6.6.9
+# Generated at 2024-01-11 15:23:15.711210+00:00 for version 6.6.11
 
 python check_kernel_cve_status_version() {
-    this_version = "6.6.9"
+    this_version = "6.6.11"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
-- 
2.39.2


