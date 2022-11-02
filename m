Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11314C43219
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 02:42:32 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web12.1982.1667356951013526101
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 19:42:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=XthZB3IF;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id v17so12279973plo.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 19:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o0UDy3Qx4cQMDwsNHBkiy1iG/F1wbL28JbmwAb/5frI=;
        b=XthZB3IF3tajSmJfDiQzGj6N2Lxx/A1j333t3Xd9H67fPCnfWRJJ5Pih4Cotm2DKQu
         nlba/X+qUspDuwCpvaU9weGwnWim5tj3PrCFFjkzhLV9uHfytdFcsdzktDF2tTJr3pyQ
         23dn0fjpFugnxC0Veh8b7uRaCdZbiE+/SjwNc1ZyWAdhy3kdxg6Ha/dg3yrBmy6YPxsT
         cZhD5ThCRxrt4iNXwUjkCmJlgYXDmHhEfEv8Wk2aJ2d7huU6URFcAemx00mobI8tfrLO
         fzzMkbHeg6927oVKmW4uiaX8C8RUwdH7I4Wq6N8XEZNmkS5Kn7G0PoHEJYUsO2pUGpqQ
         mZqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o0UDy3Qx4cQMDwsNHBkiy1iG/F1wbL28JbmwAb/5frI=;
        b=xyQsRvggQNiPSHNHQzzXPSyXoWvEDce9K1bDAlZyV524TAIy2wVUW63Ia8BS49t6jo
         7Bpz0dvNU2N+DoClCZvWL29Pv6Q5UVKTH4aG/QDk3Q7lEIfvNxvqcesEfFVjxz2Zw5Dy
         4udSj9znupw2k9Gz9x8UJHMoQmbWvNgYbFdOG2lZbSZlQ8buGRRORmV3/2rgpGYBvAu8
         tDDu8DNgVzRNvFV2pVo1NI5qqEVHEFz6QW2PF0EfrRX/ZQQ62YQKSVfvHf6hFRLleLHZ
         ihVt2kZM5cYoQlq2R8o7Aylc54FpUlN0Xm3X/gP/KY5t4+kWk6vmtoll2w/RJ7XwdClX
         14zQ==
X-Gm-Message-State: ACrzQf0nVM0QEslVSzlEpikUNjyQbO8kC+JjS5WV1k75ga1LeZSzBoCy
	T4JjINmy2s0Bs219eAQ4oWBoU6S3LxVpg6uu
X-Google-Smtp-Source: AMsMyM5sePcvwS9TuvE6F4j9MXu2msWwBXIQ+35qjMT4+tAtwpE/Wc+9hCwzXe2p3ND73tg2g5hKOw==
X-Received: by 2002:a17:902:ce88:b0:186:b345:97c0 with SMTP id f8-20020a170902ce8800b00186b34597c0mr22965147plg.13.1667356950069;
        Tue, 01 Nov 2022 19:42:30 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id d18-20020a170902e15200b00186da904da0sm1462846pla.154.2022.11.01.19.42.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 19:42:29 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 03/20] xserver-xorg: ignore CVE-2022-3553 as it is XQuartz-specific
Date: Tue,  1 Nov 2022 16:41:53 -1000
Message-Id: <2017ed15cc5b29319fe1b769c1fcfc5c2f799fd8.1667356805.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667356805.git.steve@sakoman.com>
References: <cover.1667356805.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 02:42:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172543

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 769576f36aac9652525beec5c7e8a4d26632b844)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 057a1ba6ad..dd741270a7 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -28,6 +28,8 @@ CVE_CHECK_IGNORE += "CVE-2011-4613"
 # impossible or difficult to exploit. There is currently no upstream patch
 # available for this flaw.
 CVE_CHECK_IGNORE += "CVE-2020-25697"
+# This is specific to XQuartz, which is the macOS X server port
+CVE_CHECK_IGNORE += "CVE-2022-3553"
 
 S = "${WORKDIR}/${XORG_PN}-${PV}"
 
-- 
2.25.1


