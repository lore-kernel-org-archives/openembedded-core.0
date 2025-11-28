Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC729D116F6
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 06:19:07 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10258.1764310741974414741
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Nov 2025 22:19:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aUi8J0+E;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-297f35be2ffso22658705ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 22:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764310741; x=1764915541; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oi49RV4guJCKDTPkzHbCNxQIJSgnmwk4KB6QRlzyzWg=;
        b=aUi8J0+E7abGaY3eHf5z9bV2ch1JItyV4Bd+b6i2PrOQFZBtIwYGZDRCUk1yX/uC/P
         XVilSMGuZzb1I3n/lfcoIH1/hVOtBgEWtqV7lbuehoHmVTt/CPZs+dk7RSNjcloflhsS
         eq1AxobXWYrhpNHt3BhUPHNtOqiUgOq9kMRY16NcOaIOJeGc6vDDJ+bAaIivIOQrGJpd
         SBhhqFr8d5jXpC1+rAf8eIbhcg1QbFlsxowmxuDZeYcvBwzOzala8Zs2DGYsa+dCaYQc
         ZTDnZI/u9RLXyFnyPP8al5Ih0uU576NU95BbgfG8EuYoPV+kl+dWzL9Bfuk/KgcBEpk5
         Hicg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764310741; x=1764915541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Oi49RV4guJCKDTPkzHbCNxQIJSgnmwk4KB6QRlzyzWg=;
        b=O3ybC3Yu/hIp9QchGWWDH9IW6FdZaClchtd12llTRqVKqiUm2xqGEnlu78nnxvSeaL
         cwm382Uvk+4W6HCQ8oDqwy0A/vjoJ9fXh0uhbK/i1h5Ca4o2AR3oAMEM5s5txBMMJH8E
         KMG+avcO2+sTl++bOEUCJvkT7EdYMy1Iql09XgFJyi/ATV+k3hNNXyh69p09tPpYUpaN
         5BEtOep9LwZlebhKGEp/aOE1sLI1NSj2S/hpNeUjxrUmV9KNLNvkTNwMxBB5DZAPUOrj
         vSasdH6j+zPNzev26AmFkV/OZu63tBDsZcK101Jjg4RFwD/A+2OjAyqGeCHISacWYu+g
         ruJw==
X-Gm-Message-State: AOJu0YwsgdZjkxO5tyc0RhIufgcvRdjl0/1aWmL2fTjN0PY9mdqREZYT
	8dyzZ8FBWgum2Oj6xmujrFZA6HDz+iTofsdfa2kl+a55fKrzVD996lzAYWLJvA==
X-Gm-Gg: ASbGnct0JUvtHTXv6ghGTCdoz9Q/8tnAKWYTLcbNY2h6+ieprxZfJlf57+ZDI0TFUwj
	ebXrzXyoHx9q/ZPhpeDej58i/2dXrobGFwavDdkqdr1pLOWGknMiJBWS6rXRo/VjzegBtR48DIW
	ZAmM4FBSzhupFsONmTqSNM2qFDJhYiC2hLPVClNE0l9xGBMcCCrzkdlJmawgiBHQhIytVamR87D
	7uqZBPe7mG//n1It4W14/rQ3admIsIkrNermL0viiouzY53WOTW6JYdvCKwyR0NXPrAVQQb4cYq
	1XPe8DneV1Gj9mAliLvC6Ow8RwNWYEkMFFE2gri/FMDqsVbG5AuE9SqmUe8pClkunyMm2Mvhjs/
	x2v356nMDcayfsjSQc7tT7eYBOZWj7PsBsp4eEfnyDOk01Jlt7tLH6zIwEIbPCWd2BO2z1ddQY9
	AZsZuCO//kcsGzO+dB4/D/p2lq
X-Google-Smtp-Source: AGHT+IE8v0BRNtEYOarHKrWBnLnWqOw82IQViOVo5UX6RY5+bW9rFFaVBd576jNuVtztjJ91GFa4TA==
X-Received: by 2002:a17:903:13c7:b0:297:ece8:a3cb with SMTP id d9443c01a7336-29b6c536c08mr301407905ad.25.1764310741197;
        Thu, 27 Nov 2025 22:19:01 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([165.225.124.245])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce40a60asm35427335ad.19.2025.11.27.22.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 22:19:00 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH 03/14] ttyrun: upgrade 2.38.0 -> 2.39.0
Date: Fri, 28 Nov 2025 19:18:40 +1300
Message-ID: <20251128061851.1634479-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251128061851.1634479-1-ankur.tyagi85@gmail.com>
References: <20251128061851.1634479-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 06:19:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226886

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Release Notes:
https://github.com/ibm-s390-linux/s390-tools/releases/tag/v2.39.0

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/recipes-core/ttyrun/{ttyrun_2.38.0.bb => ttyrun_2.39.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ttyrun/{ttyrun_2.38.0.bb => ttyrun_2.39.0.bb} (94%)

diff --git a/meta/recipes-core/ttyrun/ttyrun_2.38.0.bb b/meta/recipes-core/ttyrun/ttyrun_2.39.0.bb
similarity index 94%
rename from meta/recipes-core/ttyrun/ttyrun_2.38.0.bb
rename to meta/recipes-core/ttyrun/ttyrun_2.39.0.bb
index 90380e51ea..c7ca8f3ec3 100644
--- a/meta/recipes-core/ttyrun/ttyrun_2.38.0.bb
+++ b/meta/recipes-core/ttyrun/ttyrun_2.39.0.bb
@@ -7,7 +7,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f5118f167b055bfd7c3450803f1847af"
 
 SRC_URI = "git://github.com/ibm-s390-linux/s390-tools;protocol=https;branch=master;tag=v${PV}"
-SRCREV = "660bab6e68fded26b2117e1dcec0844549a22fed"
+SRCREV = "940ce6790021816f280fab66f443e4721d527833"
 
 CVE_PRODUCT = "s390-tools"
 

