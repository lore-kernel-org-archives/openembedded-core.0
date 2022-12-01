Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B31BC4321E
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 14:28:22 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.44787.1669904879017606514
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 06:28:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=xtspHYY3;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id 62so1783781pgb.13
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 06:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w/JMBBNme0lvxU7ImDJGm0Gh/iLEP8sFCUtmqE/mrQU=;
        b=xtspHYY3zrd+PUwNy4CjZsUvn/ficdHVhe+ODIOA2RpNGsBl6fYzc2h8QDpmeO2kOw
         5BLynMmzaX5apD820PYP/xR/adYW+ZNjRTulVu++jltK5c5PnX/ffE4syK3Zs4/HMXlW
         2md+DR0IEBNYdJi4ZkdcDOLoKWbyWm7M3kZRrFjDXPcH0YaZCY29PUCyTRENr9UdiT8a
         0wMM/GKbF8YTvgi9BgwGgW8Bmo8TA0QxfsXS1Dg7qqkRqieJsmmpCx3MZYF+w63AIp5O
         yQxpu1N2M4jfPA1w6CzzRIDNW+y7pZpw1v5i/VVCz/p62oiOvDvnrd3VzmL3avo2tcLS
         ElmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w/JMBBNme0lvxU7ImDJGm0Gh/iLEP8sFCUtmqE/mrQU=;
        b=bUYsOQIT1Up/9XY8Rh/qvoVjsmzbfmhum79IHvddf9xigY3iiXQh5jrGQPIfIYiVuH
         xhxFZ1YPHP4oHU+EdZBUbPIdZn6Jede5bRndG1a5V2aAOFMFcz4gowYSBuJLYAcgGTAM
         goK/6EehtWOrhhjZSnO5dQcg6nQnDgsN94XvRMtd9CunXGVxbsRO1T9hVuqID1sM0f++
         v3xRnH83NtkL9H+MJusJa7tmkdBgoGt4fy7I2BIxqJ4xm7TPdidnPtgTyYWlAiT3dDZk
         SYeYkpBRPvWae0brVwrh4kcEjZGQqhlOOTbRvfAijxqCx7Puo3mcJPuXO3CZYWRQi8o9
         ZHGg==
X-Gm-Message-State: ANoB5pk40l5EbdqBfY/OCJAEXq2Y0F5Vo3i92Bk9sEimZMhbl2d1AzuD
	QixrnmKvn4WU057W9AMUiPcVRFtZT/f+DLgqwPI=
X-Google-Smtp-Source: AA0mqf6WTeuVY/dkNIdSSSizJddHo8f/hZQ7XJ4DxBu/vS93BqQQfheLuHpjce8ooj2pjfyQwdlVCQ==
X-Received: by 2002:a63:d255:0:b0:477:d17b:414 with SMTP id t21-20020a63d255000000b00477d17b0414mr29418984pgi.503.1669904893798;
        Thu, 01 Dec 2022 06:28:13 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id b14-20020a17090a6ace00b00218e8a0d7f0sm4908308pjm.22.2022.12.01.06.28.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 06:28:13 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 23/23] mirrors.bbclass: update CPAN_MIRROR
Date: Thu,  1 Dec 2022 04:27:17 -1000
Message-Id: <c0f3da88a9646fc5e6d549b1a2327c0823c0e5a1.1669904703.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669904703.git.steve@sakoman.com>
References: <cover.1669904703.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 14:28:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174109

From: Tim Orling <ticotimo@gmail.com>

Both of these redirect to https://cpan.metacpan.org/:
http://cpan.metacpan.org/
http://search.cpan.org/CPAN/

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit f1b74fc09f70d52d9ac629b04d81aa94fd97ff40)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/mirrors.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
index b8926fa6e5..3720c00ae5 100644
--- a/meta/classes/mirrors.bbclass
+++ b/meta/classes/mirrors.bbclass
@@ -61,8 +61,7 @@ osc://.*/.*     http://sources.openembedded.org/ \
 https?://.*/.*  http://sources.openembedded.org/ \
 ftp://.*/.*     http://sources.openembedded.org/ \
 npm://.*/?.*    http://sources.openembedded.org/ \
-${CPAN_MIRROR}  http://cpan.metacpan.org/ \
-${CPAN_MIRROR}  http://search.cpan.org/CPAN/ \
+${CPAN_MIRROR}  https://cpan.metacpan.org/ \
 https?://downloads.yoctoproject.org/releases/uninative/ https://mirrors.kernel.org/yocto/uninative/ \
 https?://downloads.yoctoproject.org/mirror/sources/ https://mirrors.kernel.org/yocto-sources/ \
 "
-- 
2.25.1


