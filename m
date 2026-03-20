Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2237F1093172
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 00:28:39 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2620.1773966511140610099
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 17:28:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=PleiN6s/;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48541edecf9so16119155e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 17:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773966509; x=1774571309; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2fKU5Ducx78GYZd4fQ5Om3SJS0UpxldAFXiIHf9S6Ig=;
        b=PleiN6s/98/sRbD768zSgkPdd42tWAH+x5PyBVWLHAjNeVldH4/CLdPPGmBCgtKVjf
         MiyEGC95rVdKQQI3HUwU952YKv8Q+v9VupOtpDzeQejIHSgaRkrpkkxX6aWaL2ZYAFjy
         izHezCniv2/wS+sqxtAU4rwnQP03Dd82cEC+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773966509; x=1774571309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2fKU5Ducx78GYZd4fQ5Om3SJS0UpxldAFXiIHf9S6Ig=;
        b=eQ4yicW8rsMAfyov9nJlq/FAql+7Be+YXJ/JLxEBL1nV3rc22ciOmjNtPHQ7jJWtbP
         xDtD5y2H9vdryKSGBXClocOyaFTE3I73I4/YsvE3gZftZVtqdUcp6CrEvrQ5FvYG87ZU
         3ROg6TENHfs6kc5PcNMu7wHrIb6iUdwdbJxvNaYbKLVO+es4KdweuH64mHl4nTRVCiH2
         nnbgkulijRwj4dDS0eMnjgDmn0ngSIgvyPFUOUhvGhIMoLfTtIiAFCJbT+VtD64PX+o6
         fE98ikTIojRGPQ0Kh9f6tkTAGTu05zfIfmrxNcAX5RsGY5ur8aTWG2qWSPpCcCeec1w/
         tjjQ==
X-Gm-Message-State: AOJu0YzyWYDZs4RcCLpPzu04grGLWKgSoPhmrviht4C0b7Jr81Q6p3AN
	WLUUEO4RuHN+oX/mhS81P8GvvJXg2ScWsOd4SGHMB1dSqqbFFQ0rnDxETML+hCbBTn6M33OWx2r
	8B30C
X-Gm-Gg: ATEYQzxMuEtPVTDGWDzrYTI8URqX7YjZZuGw4+oKtPZzW5oIfvU+oj6laqS+HpB8Hs3
	WMDBmiozBAFtZ2iBDNkvGOQDENLsFmd2VkP2VCbqedeNtJEZhe8nNBISr3ThmWByCrgimuXMrYd
	NbJquGCD5+ZLUXiaX64ctLz4nrXGtMfIj9uNQlbJFeUh9WpOeRUvaVi0UvfCUcEJGllB+94FaUl
	2zYSLB6xobDzqSQs5OPE2z4gBRFfg2jeQMDb73Afalsmaj3tGrr/2sTO5MRybEVdQsZN/B4b/76
	1bT3pTQ9/Mz8+TMYtOSgBGYMlVvXqJybQo7dbRau8AMNndXhhwHnRF4S47wqGiSsgsnJ6e+SYMm
	S7Uavx/1qzdnvDLkwVLlTvs3CS5Uceb3Nkg4AKq6AZbzLeoiERaoAk76w6Z0JYAEJ6Pk6shXOHm
	GUM9EzNfHDUAKyV/wZbWUzkEBKGG/I3Xv5c7dsFEcEpKhCvNypiDu2fVAKyJ1IFkoXaTXtEpQth
	NeR2YIgcCME+zWFZsXE1Vlrpp8G2wx8L36U/w==
X-Received: by 2002:a05:600c:3e8d:b0:486:fe45:483 with SMTP id 5b1f17b1804b1-486fee25f82mr13906375e9.22.1773966509153;
        Thu, 19 Mar 2026 17:28:29 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe8359acsm23850655e9.12.2026.03.19.17.28.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 17:28:28 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/15] wireless-regdb: upgrade 2025.10.07 -> 2026.02.04
Date: Fri, 20 Mar 2026 01:28:09 +0100
Message-ID: <99b21af18cc644029aaf70a1eebc2f2e84a42207.1773966414.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773966414.git.yoann.congal@smile.fr>
References: <cover.1773966414.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 00:28:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233563

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f86c38b13121788fe6a654df04800d24b2b28b61)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
[YC: logs: https://git.kernel.org/pub/scm/linux/kernel/git/wens/wireless-regdb.git/log/?h=master-2026-02-04]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...ireless-regdb_2025.10.07.bb => wireless-regdb_2026.02.04.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2025.10.07.bb => wireless-regdb_2026.02.04.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2025.10.07.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.02.04.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2025.10.07.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.02.04.bb
index 68ae3b0464c..2f7c8160434 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2025.10.07.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.02.04.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "d4c872a44154604c869f5851f7d21d818d492835d370af7f58de8847973801c3"
+SRC_URI[sha256sum] = "0ff48a5cd9e9cfe8e815a24e023734919e9a3b7ad2f039243ad121cf5aabf6c6"
 
 inherit bin_package allarch
 

