Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50BB3CCA47E
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 14:40:09 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.7228.1654699203213415335
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:40:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=onJGuKuc;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d13so2147256plh.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=eGi4FwQt/CWPzaA66UAe34BGhu5slEfYhiljgFU8N3w=;
        b=onJGuKucBrUnS/6KdH1f8H0NTJOCqosFJLfcWL6P6rqmWkGsjwJKKdh8PopkTvkEur
         kMS4qZb7oiTYmYFrjBgKur0UA1raGrVienapDC/8RXNpmSd/IKQ/pSGbqLkAmq6goZWk
         pZVu9uflUUEdTqGwUol+K5OHXkSVlM18wnbMYN8GkdkcKgzUmmZ3U83bqG4NU34/iseI
         z7UDPpv/DA6QRE0R1E43O+rfLLqMUO9dmfLpLSTUsDIYM17WOcwyTrl4V7/Zvy5RnPNg
         G5vwRdCER2okG2BEKmbwJZOCbWnl6aL8nrV0fFXATAb99/ISk+8fSp4EaTLnVgrPHHx4
         FxZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eGi4FwQt/CWPzaA66UAe34BGhu5slEfYhiljgFU8N3w=;
        b=VNPovfw2podn1HnFdZE5RpedQyq9zyhAFFVuZruFs8TtmB/OFSwLV5VvWR83t1gWQy
         KGpm1O14EM17JPS6MdqPRsQKJRiPZ3PBUlTdWErKwPFxfqkq3EATjU0zh12YJw/+zk3r
         sXFSd2skZpU1uWWGG8bjO08xcmxgWuda2e3RiP7c90eu4idNxzEMfIMulqkJ9YOnloty
         PcP8uqJYunu1QsYzNPfiV1uVE5H3q1p8J1wm2YIwswxZE5dzf0BDYdO6uyKFQ55+Eo8K
         Vdwjfejm/UUIGKd4Yln+YaT6ZO6nbLCaDRQZvlQBiXdleMLTOowdDyRUeZK6wGtrjkSN
         mPEw==
X-Gm-Message-State: AOAM532j3FHeW0VYCaIF+448iolCbK/WUXeguKVs+QL6h3O8CI4D/XSo
	OpWieCegzOToeDWVRoZK8ut/ndT+n4G2QdhK
X-Google-Smtp-Source: 
 ABdhPJxx8ipuI5EHuP3gwUcnr/8UmrOUY+I6FJnENnOVRVDDHJxprme24cyIFpg1S5+LwH1sliDVDQ==
X-Received: by 2002:a17:90b:2241:b0:1e8:8ad8:5f22 with SMTP id
 hk1-20020a17090b224100b001e88ad85f22mr15544382pjb.73.1654699202274;
        Wed, 08 Jun 2022 07:40:02 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i4-20020aa787c4000000b0051bc581b62asm12945213pfo.121.2022.06.08.07.40.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 07:40:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/22] cve-check: fix return type in check_cves
Date: Wed,  8 Jun 2022 04:39:16 -1000
Message-Id: 
 <2fc716ad75dcc59000dcc18143f06bcdf43be242.1654698895.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654698895.git.steve@sakoman.com>
References: <cover.1654698895.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jun 2022 14:40:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166714

From: Marta Rybczynska <rybczynska@gmail.com>

Make empty return types in check_cvs the same for all code paths.

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f86393c93dec47b24e837d0c4c5761a716ecdbb6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/cve-check.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 0c5f40b78d..1b4910f737 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -264,7 +264,7 @@ def check_cves(d, patched_cves):
     products = d.getVar("CVE_PRODUCT").split()
     # If this has been unset then we're not scanning for CVEs here (for example, image recipes)
     if not products:
-        return ([], [], [], {})
+        return ([], [], [], [])
     pv = d.getVar("CVE_VERSION").split("+git")[0]
 
     # If the recipe has been skipped/ignored we return empty lists
-- 
2.25.1


