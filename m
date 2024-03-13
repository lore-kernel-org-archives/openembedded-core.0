Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADD17C54E72
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 17:33:57 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.2091.1710351229755593859
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 10:33:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mSrqK0Xk;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-51381021af1so171630e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 10:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710351228; x=1710956028; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JfNmhYo7/JA31m3EBuGKcXqLiPQrpgMk+ncN16tppxE=;
        b=mSrqK0Xk/MtFZs9HbLxT9K3yFvyGaQ8+0ufZ4RfqZUgLQK7D6YHPRujfNM6TtbRC/+
         tcCsl/t832doHQ3qFN0LrGXb0ktkVE1eCrlo1bo/KPZATFddTWIXNDMyi760M2JdEZRm
         b0Je7DmIlJF/dF93GphnRo3SpAYmnjq9rHo0sq3My8kHxe+wSEziwZ31FOu/eZNigB9P
         oGXsAdO8ZWvOVc6eJeusP/cj8OFL1LBj1v2lhtZ0f8UuDg0VvpwogSB8cZMu29pyP6cn
         Eeqs/dRkyWLVc4FY3stVaPqp24/Q55esVGIKXw+9z8oZagd+vbYnSXkfyetYkRieUA3B
         Se7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710351228; x=1710956028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JfNmhYo7/JA31m3EBuGKcXqLiPQrpgMk+ncN16tppxE=;
        b=ZeAxa+z2GLBNPsNveRDvobcdu8fQK9oljh15ZQEfGXyFH4E9K4RkRveFV9Ep6M3JTt
         VAH89xbwYaGrLpGJaIZ6t4lLxK1vxt/5DF0VdFPVbUJFQ8IfjjYaX47tBriQYvFdqfhd
         xUJdK6PO4HVIvkvTLmSy54tCdIe4ezJqztQxnbIAzF40R8jqqmxdydfd6Ttth9weYxof
         gOWJWnd5iCa9cHt7En5JVjoAfRFCG5LQbVw4Bn3vcLJiqUbRDfZTIXcLVDGzRBQpM2yC
         aQqE8YfWlNdTxBrAXBDf9vhz6ZcAfn6io0CFuBLhPkyhibZjm6mbChErmiKE3ATW3eHL
         O+yg==
X-Gm-Message-State: AOJu0YzYjf8FOy8w3GShugpX9T8+Er6P1XK7I5e35lKobwCC+IPGOPGt
	ahiiU4D1qJU35qxCKfKNG6tjjtNa+S9GMJrPBJY3P3d+B4TQXUTJYSm55Uym
X-Google-Smtp-Source: AGHT+IGP4WMEdXee0GsLWY3SGJLw3/NoZFk8CLZ/rzbkM90pybu42u/MbK4dD1YIGGOYvS/7oBtjQg==
X-Received: by 2002:a05:6512:4896:b0:513:ca40:fafc with SMTP id eq22-20020a056512489600b00513ca40fafcmr1409429lfb.11.1710351227910;
        Wed, 13 Mar 2024 10:33:47 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l5-20020a05600c1d0500b00412ea52b102sm2989710wms.34.2024.03.13.10.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 10:33:47 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 13/21] ovmf: update 202308 -> 202402
Date: Wed, 13 Mar 2024 18:33:28 +0100
Message-Id: <20240313173336.3900178-13-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240313173336.3900178-1-alex@linutronix.de>
References: <20240313173336.3900178-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 17:33:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197065

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-core/ovmf/ovmf_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index 3dc031d3b67..9463ec148bb 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -26,8 +26,8 @@ SRC_URI = "gitsm://github.com/tianocore/edk2.git;branch=master;protocol=https \
            file://0004-reproducible.patch \
            "
 
-PV = "edk2-stable202308"
-SRCREV = "819cfc6b42a68790a23509e4fcc58ceb70e1965e"
+PV = "edk2-stable202402"
+SRCREV = "edc6681206c1a8791981a2f911d2fb8b3d2f5768"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>edk2-stable.*)"
 
 inherit deploy
-- 
2.39.2


