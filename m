Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DED58ECAAD2
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 21:03:09 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.3756.1661806985454609360
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Aug 2022 14:03:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=mfUUTlpT;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id
 i5-20020a17090a2a0500b001fd8708ffdfso6693433pjd.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Aug 2022 14:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=ECLJ+OVJROsRP0Q8f42hVPNrXTTqrSjISjG8eVDMXB4=;
        b=mfUUTlpTOXkllZ0EJFYRi61Tbw9ELZHQnkmrpEiz4mnlbHBu/N7mAEv7Iqxh1aEN/B
         whouI3oefLXRuYG4yXvDRl3PvEXlshADQdZ6Y/mY75GPinFSEs/a1MnOEfmmZY9HrSe9
         o92+jcKojRpqAavPMnnk27DadkBeTNRtUPbxXZV70sGrcaIdCkkbBYpRsm08AEM0hiDo
         teH3Yr2l4Hogf6fzI+zm6LIWWYLDhg6JRA2bduh3uuLMPXvswaqUjdn6TOT2oKGFABp1
         0KWT+3g0pw37Y1uxxH1F6EiWfRotKn09tP94xJPgc2J8S2oO1A//7RtT+WrSYHttlr3C
         Sw3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=ECLJ+OVJROsRP0Q8f42hVPNrXTTqrSjISjG8eVDMXB4=;
        b=u4pltYhWQUDQ7+mvKc1r5w9IFGEwrnZby+eAUZZ+JFXoJ6MW9HcvuhlhKBS4+XgtEm
         r8zegcj7CEsvmZFsGruTtBHAAXN1SFZ5PvARS7QKlk1+MRx6Nd9Lj083SfDiV2RsWmqN
         bm5X0SRLJU7kLnpKy0rOVb9NTTM+KieLCzwhQ1roe9zsLq2gfBKI+TCOEWpOU7jfzmzp
         jlMd5q87oiJrYNFq1PKfUFav+wMhuFETodwzoagcLu+frs6iM4JfYkknha076jKQ4s4t
         5pS7Xp0xnzLJy8vrh1Sdzal0rq+BSPvgO0p20Lfy8Oo5f5rvIWJzIhxBYuqmvqbDon4s
         EP8w==
X-Gm-Message-State: ACgBeo1mVYcjJAMD4epJvh/5NZWnwswuJNsVp3PlwJSc+PQ1nh5XYQpC
	XgkTpQKWHhj1F7uHdxlYTsYr/muhSsczSZpG
X-Google-Smtp-Source: 
 AA6agR7FSZRR4vOxgB428Ut0wrkzE+m1pCvpQb6scpb3HIyWMn/sHvuAcN7TcJNvhPocQU5wrkbSig==
X-Received: by 2002:a17:902:ec8d:b0:172:f3c7:97a9 with SMTP id
 x13-20020a170902ec8d00b00172f3c797a9mr18577239plg.40.1661806984547;
        Mon, 29 Aug 2022 14:03:04 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 q15-20020a17090311cf00b0016eede528b4sm8058957plh.61.2022.08.29.14.03.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 14:03:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/14] mobile-broadband-provider-info: upgrade
 20220511 -> 20220725
Date: Mon, 29 Aug 2022 11:02:28 -1000
Message-Id: 
 <5dd5130f9b13212a4f5e8b075ae1ecda868c5f28.1661806803.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661806803.git.steve@sakoman.com>
References: <cover.1661806803.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Aug 2022 21:03:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170034

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 96185dac787e14fa9eb77d009653a2fd4d926e3f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../mobile-broadband-provider-info_git.bb                     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
index e6f216e5cb..2cc92b7b47 100644
--- a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
+++ b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
@@ -5,8 +5,8 @@ SECTION = "network"
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=87964579b2a8ece4bc6744d2dc9a8b04"
 
-SRCREV = "3d5c8d0f7e0264768a2c000d0fd4b4d4a991e041"
-PV = "20220511"
+SRCREV = "fe19892a8168bf19d81e3bc4ee319bf7f9f058f5"
+PV = "20220725"
 PE = "1"
 
 SRC_URI = "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info.git;protocol=https;branch=main"
-- 
2.25.1


