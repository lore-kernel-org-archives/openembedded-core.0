Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB494C55173
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 12:15:07 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4405.1785586501022381163
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Aug 2026 05:15:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=I6GDXxxG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-495635a85d2so5828365e9.0
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2026 05:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785586499; x=1786191299; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sa2DKfIka5+WzfWCqDGehMPcYHyjeyJHlOKGRQk9Inw=;
        b=I6GDXxxGZf+x+Avb3EAFRYUV6vbFTZ8RHatPR5FkpH9kKL0T8S981IVckeYR1XrBxC
         UmaFL5QlwFUBHaROvvlAPRhH334wnVyTo9M8crKssijORfTmuQqpWf8ACgtmjj97LwxP
         NiTwmDtwdkOIhbywsgE5Su8zW/RDlYPvz6CA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785586499; x=1786191299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sa2DKfIka5+WzfWCqDGehMPcYHyjeyJHlOKGRQk9Inw=;
        b=fWpjqU39WlT5WAzk8PMUOWfS8Yxu4rmRztoY9ly+5LPQmG5MvUSs20mxZ1QxeU6Nlq
         UZl8MzIYHEIZaFofRrKu95WJ7j7HzQbirT1aCEQ28CWd//kkFQAqYBZZypSH8ASJ7NSE
         mA+vmbGcb3xhgJWCvGFhI70aoHn3+E9+H1v8z78LFeFLObnfs6OMu6mPHzsbcolpgOWO
         IXiLo6D2bJYeWaSXyGCTLWlHi6ISOR5OwICWsaNSoMCvLED3ooQFoYccsGV7ikgoWuiL
         ago4UuhC0nwOjNW+ogeaVZ5dEeUrUcok3i1Cn1maT/nvwADXfD2ORhXpU2bhEUOavmLN
         GRSQ==
X-Gm-Message-State: AOJu0YxhjMIT/J8hwjclvJWupdNM0iVED/0fH/7f7I17NHId9p5CqaGF
	BVhY+7QhJ+b9S5iNuaw7DVcfoTc8SZmmJZZu7SEd6/8vygT4iqITLleAztKPzRbAKtr3+PLBlSh
	aTPoCFuo=
X-Gm-Gg: AR+sD12DL+CGl9EmWy18myMtaVPJiBxm6A32muFwqnmw025nz6cR6OXYAofkI8ISIkA
	feSP2W3Bumnx9taN2ZHarPg6/n58hN1pcAZOOAYPX+Q9sKIF1jqCWRAiTygLNQOJ42XHiqM5aYS
	t3u9PpR1+qKyaFVHMwoMIEoPcDT0LbfEUbwVwr9MeYoIKH1kzBMXo+GO8GwPXb7CIZphO4YNRFu
	xuU8SNmgmRbFQbCcSKZ+2fbLV7iwpQ1amkBl/mESwFv1MCxX8FFsMadcBzNsgQPafSnHHmLcPGz
	y8iJI6hC5scRWGFb3NrxDBsifWqiojnMbOiQ82sShfN2UtB+ezvmXSCmk1YOR+hqBbEimjnSAVp
	zbdoTuW8/Zgo41wcASTpm+l1hzLY93wtp/0VbK5hKmvi047Htgek5WrKfitcIC2ocQs+KJbsYQr
	ucFSXUUo12tqG1DTSOOfvvMEfWH3DrRuuClEOa18kTtIrV3oMOZYr0kFYw1J7IrYi4k/XTEjFcO
	ICR6IleGCS2xRUI7A==
X-Received: by 2002:a05:600c:4fc5:b0:495:4e1d:82df with SMTP id 5b1f17b1804b1-4980f233e12mr41284745e9.10.1785586499031;
        Sat, 01 Aug 2026 05:14:59 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:43cd:3a42:fe4b:e585])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd42d91b3sm16518796f8f.14.2026.08.01.05.14.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 05:14:58 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/6] hwdata: upgrade 0.409 -> 0.410
Date: Sat,  1 Aug 2026 13:14:51 +0100
Message-ID: <20260801121454.2770123-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260801121454.2770123-1-richard.purdie@linuxfoundation.org>
References: <20260801121454.2770123-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2026 12:15:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242492

8bb6c48 Update pci and vendor ids
d1f6971 Use -test suffix for --local-only branch names
1e9cfbd Add automatic USB patch regeneration

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../recipes-support/hwdata/{hwdata_0.409.bb => hwdata_0.410.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/hwdata/{hwdata_0.409.bb => hwdata_0.410.bb} (93%)

diff --git a/meta/recipes-support/hwdata/hwdata_0.409.bb b/meta/recipes-support/hwdata/hwdata_0.410.bb
similarity index 93%
rename from meta/recipes-support/hwdata/hwdata_0.409.bb
rename to meta/recipes-support/hwdata/hwdata_0.410.bb
index 7117c0857c7..a34724abeaa 100644
--- a/meta/recipes-support/hwdata/hwdata_0.409.bb
+++ b/meta/recipes-support/hwdata/hwdata_0.410.bb
@@ -8,7 +8,7 @@ LICENSE = "GPL-2.0-or-later OR X11"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https;tag=v${PV}"
-SRCREV = "73fa04de426aefe192505fcbc6c24237a9fd9c9b"
+SRCREV = "8bb6c48dc2e683777e625d1c9ef02c1b25b741cd"
 
 inherit allarch
 

