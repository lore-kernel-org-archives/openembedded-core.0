Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8974CD98EE
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 07:48:13 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10267.1781682489712408931
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2026 00:48:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=WNLCy6/r;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490b1bbcf3aso41006515e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 00:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781682488; x=1782287288; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jq6UoQQsiXd61WZGnI4lquwXIIhpusdEUYdqrZ810zs=;
        b=WNLCy6/rHJDMXnrT7dXeBqZxXH/n/3WDicgu5WVAoUyAK4WPzhFfQUBKfICDlnB40O
         4dTMy3Hsb0jGjTesjJLQHjPFL7lkv4+Codk0IcuZhacvVOJJwBV4zf0g9qkV+c1qMQ7z
         MvapaPRs2bg9wuAvZkXSIPlji2CTBbOL1zFwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781682488; x=1782287288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jq6UoQQsiXd61WZGnI4lquwXIIhpusdEUYdqrZ810zs=;
        b=LrB3AR4BeO7vMne2a400//DsxuxRX8hwHHnVQsbEWkm8UT1FrvuDLqb5lMkY2iGXk2
         tv7Qc0hOh5gCYNa4N5RdtQI+aceMmXyDa5G0ZN0AmsDmRvzy+iiCj+6tsWtQ+i4+w4/k
         WhNWkP7GuL+K7U9WQX4QONG9u8g8B/ADfGg3HMxye0MdipIEYxBpFu0DrzRAE2eYGs9W
         pfqXC2YQJp3PvVEIU4AyPRTdSPW7tliODszyu8UdHrJtUv1N9blBM1D3yncJZYm/CSbm
         TSDI3NlCcZclTBFfKb8UBkrA3PiT59hlDr3m/ua+kcKIH6IBQN1NbcvRAOtu319PrHOf
         IaMQ==
X-Gm-Message-State: AOJu0Yw8jLjlDxZXPiwIl6KjipoKfJSb339jzZ/HDZsMTSljUBHjFwhQ
	hE0AFnd02ZKUvQqo3EYBIe/it+Zo5KCp/7WYQUnFWNBXJ6rdoBvQNUmaWkA5D3eHYruyf1Sq046
	y0pDK
X-Gm-Gg: Acq92OFYK/fdVDdSr4TjESQHnvyhpi3Ja6CZ2o0+ANjOpN918k+sZBGtM2RQxOZID5K
	QsgzoDR2cuygOqEMdwMqPOjX7yV7GM7kJLbnsyc2AnssT5wlA899AGyqYCfo/dOAFD1BrHCqsOH
	XkMYRuBrl+JmPASjr7K58RdgHSn3AuiMkXmJzJP1tZabxPaMrDGMSAagvoFVPdIErfpfJKC4INu
	94AzQZnBintu4uXfWhRKMuLvZjAxKr5q7JlEc8xL15LrM/Kxg5EaqGZksM/+vX/cMQCkQusQ0ri
	nqkbsF8Jab3lgwWCisr3x9oMBrM0OfbDQ6S9ObIOuTGwX70tphJ0WraJsB3Wl4jrKVI0ZaLiXU1
	aoNbK0bWbOfHq2oq9Ke1JwjdgjCplmpyojx4U4fQr5D7iZgHsc9odp0arGeaFgjpRrHzLmSgKX8
	1QmKLvNie2nssk9yB6EJlNpWa4bQbxvIsOHU3ih8IVCQjmA0qeBs7bx6CZBFegzsZ5phRMUJ/SN
	h6ZCjP2zwfSgssELg8/7p7Q9za/
X-Received: by 2002:a05:600c:a30c:b0:490:be1e:6ce6 with SMTP id 5b1f17b1804b1-492333aead6mr39813685e9.9.1781682487984;
        Wed, 17 Jun 2026 00:48:07 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bc19bde07170effe.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bc19:bde0:7170:effe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2dbfb1sm54721732f8f.35.2026.06.17.00.48.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 00:48:07 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 5/8] wireless-regdb: upgrade 2026.03.18 -> 2026.05.30
Date: Wed, 17 Jun 2026 09:47:56 +0200
Message-ID: <e073fbb9e29511f3ed4d85eac23887ddb0329439.1781682367.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781682367.git.yoann.congal@smile.fr>
References: <cover.1781682367.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 07:48:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239020

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
(cherry picked from commit 86e35bc1ab5fb2132b06b666fe73fc9bd6446ab6)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...ireless-regdb_2026.03.18.bb => wireless-regdb_2026.05.30.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2026.03.18.bb => wireless-regdb_2026.05.30.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.03.18.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.05.30.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.03.18.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.05.30.bb
index a70e9dd0dae..e544b729656 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.03.18.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.05.30.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "5fc0000475d8c5368ccc5222827c16aef98b1eb6a69c9b5a3e7b7e98528945ac"
+SRC_URI[sha256sum] = "8a27bfc081bafed8c24dd70fab0d96f098e5a0bfcd08d3da672595f225ab8993"
 
 inherit bin_package allarch
 

