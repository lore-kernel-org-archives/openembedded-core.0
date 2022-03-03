Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7BE6C433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 09:33:32 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web12.9075.1646300011851241259
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 01:33:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=E5zQv6E9;
 spf=pass (domain: gmail.com, ip: 209.85.218.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id gb39so9343220ejc.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 01:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xb9I1SJuidaB0ggSAwAi2q4/ECrpwij2w2BMbjDxPPQ=;
        b=E5zQv6E9FT8Ak/JF5293y1VpnfDbC2CRNvjuzp+FVpKjRcAuvW3kyq84FmCAn0wmX3
         nv9Lb5KsaQjTKZETO/JQFzIGSJrVkXXaAf75MhJRO77VHuJ4oWPZyuuu8Y5lBbw1qqrq
         Z5QfrVfiE8oehg1y6ioDC7Sd/SuEyP+hvwRY6+du+esGLkvYrDlAUVwRn+HvxcBOij8Z
         06okXySnVjPd1iFnjuD0Xg26wIXJhUugbc0KWCyteW6AhN8BvnXcqG353gXSC/m4V0m1
         c98IyCGwJ4LwmXBK//kjltYpQTnb7wlMbOgGU6qi7nSvIy4KBNxXQf/3IcrKzkZw1AKH
         lsIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xb9I1SJuidaB0ggSAwAi2q4/ECrpwij2w2BMbjDxPPQ=;
        b=booc8SVUhL0/+Jji4GeQEGdP2gflNoHqenszUsLTs/nt8jkCRHFRN7ikQzwQS4dnjt
         0fI3jRkrXfWZixFmccb/hmOXNxPfUtJJr3cgOQTzV9j56TlVTMNAHJDaHylGZT0S9KFo
         IIgWvGrnpjfaSa7E5R7HTkM204oNUsLK8gPYMWUnUzLTk9KUDWylCpyHNs3OP2Jsh62N
         eZ/BtsxbHQ22wbhGIPmb1oiZ+B4k7mGberqGy5fffYbASnPH7b5rodFzDnnvxrwXzdEe
         u73IODhDC09Ks3bMmDvR7JkYNflzE5OVZqIQrOI8p/ZLRgbeCE6KaqN7q5NFdTCkw30L
         iGug==
X-Gm-Message-State: AOAM533U+iJ72o1U3+ENMfzAd+/k3T3+QN9uqkk2P+RLTR1pizBHVCul
	rOQWAc+XfHQUiGF0n/62wNbnbhzkRAc=
X-Google-Smtp-Source: 
 ABdhPJwU6vxDH6wbvHYrgtdC1ZQDKQzfhFcBrhMDo3LtQ+YmwEAMZnr9R9ftxQGfwVBVqW1k6ZbCXQ==
X-Received: by 2002:a17:907:6e03:b0:6d9:9a96:ca1f with SMTP id
 sd3-20020a1709076e0300b006d99a96ca1fmr5823669ejc.735.1646300010284;
        Thu, 03 Mar 2022 01:33:30 -0800 (PST)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 fb21-20020a1709073a1500b006da6eefdf11sm504650ejc.49.2022.03.03.01.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 01:33:29 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/3] libsndfile1: correct upstream version check
Date: Thu,  3 Mar 2022 10:33:22 +0100
Message-Id: <20220303093324.1663870-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Mar 2022 09:33:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162638

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb
index 8430dee103..9f1a106600 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb
@@ -10,6 +10,7 @@ LICENSE = "LGPL-2.1-only"
 
 SRC_URI = "https://github.com/libsndfile/libsndfile/releases/download/${PV}/libsndfile-${PV}.tar.bz2 \
           "
+UPSTREAM_CHECK_URI = "https://github.com/libsndfile/libsndfile/releases/"
 
 SRC_URI[md5sum] = "3f3b2a86a032f064ef922a2c8c191f7b"
 SRC_URI[sha256sum] = "a8cfb1c09ea6e90eff4ca87322d4168cdbe5035cb48717b40bf77e751cc02163"
-- 
2.30.2


