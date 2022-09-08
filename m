Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77B95C54EE9
	for <webhook@archiver.kernel.org>; Thu,  8 Sep 2022 18:48:46 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.481.1662662920108441940
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Sep 2022 11:48:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CB7fxsg7;
 spf=pass (domain: gmail.com, ip: 209.85.214.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id l10so5543661plb.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Sep 2022 11:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=MKr5lfRJox/Xh6yTegHQ7ic7kJKcPMO55WmyZ4pobUQ=;
        b=CB7fxsg7bUgbT5JuZNF/U3tVBOyRHKCKLc7T8vM6eHPYtub0ibO3bNCQG3K+tHKRUp
         KgNp5FlpyuBRX5w/CPY05iEXTdsJoHbQRqrqTX0yQAGRIb90JW5aTWScqbFWfpBd58NJ
         HchvUqhmwDDmIBKic6Z4NX0V0op4JSTe+EdSnTSfIbD7+aV36iW6E+b/Z0rJXyZPg2UC
         QPQccbSmmd5m9tHFXGaSGw0lrLyncmkNen4RJQV6NIu5FTVpAI6c3Z7n5+DuOTnbFTRa
         IM1b182H/Fdwym0XFFlQitdYJgt7WjrEP9uSOhONu46zY0CU+eiqFJxImSbn6LiqOW04
         qyyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=MKr5lfRJox/Xh6yTegHQ7ic7kJKcPMO55WmyZ4pobUQ=;
        b=yB7bsk3QW9QmpRenF2FnL4x8qDKhElOSck3vtiOaQ2SeIq86qnjxVTbJML/qPIesDI
         T/o/pyWyVV+L+Ixbi6bwpbcFrYST1OLzM5KAXXPLP0i6fXJ6rQNrnB6PAsBNNBXGEJrD
         tqq0AHJTA/cV4lXHdJZ/REIRmROygAgd5s5wh2EWOwgnvs5VY/8RCR7rsK0kZ67mjKma
         YMpWCsqS2YEkYYkQYNYiYqkbC23nyxXztOK9FkyIYyC0U68foSBqzzV7zYk5P2DxXmZk
         HABllDflfNa+dccQehPdP8HsuwmKhHWiEmsaLtR/CEmCztfRR3DOLGUx/kvk4h6LWFx/
         W7SA==
X-Gm-Message-State: ACgBeo0WAYyJn/bCPKkTaXwfFepCf4kda9XtCamNSNDcYgp9lBv02Nj+
	wT+/McYzhqhYe4UbNpBoiMwyDW2SLUDtnw==
X-Google-Smtp-Source: 
 AA6agR55Ow0QxixhuA6PBWjraKtqj0YQsTgoewvBnr/nb5N/I1nY1OLsaJVEuW7xmw/HGimLU3zddw==
X-Received: by 2002:a17:902:ced0:b0:172:e189:f709 with SMTP id
 d16-20020a170902ced000b00172e189f709mr9629679plg.63.1662662919201;
        Thu, 08 Sep 2022 11:48:39 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1761])
        by smtp.gmail.com with ESMTPSA id
 i67-20020a626d46000000b0053e7d3b8d6dsm4215549pfc.1.2022.09.08.11.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 11:48:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] binutils-cross-canadian: Do not package gprofng.rc
Date: Thu,  8 Sep 2022 11:48:36 -0700
Message-Id: <20220908184836.3612384-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Sep 2022 18:48:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170470

This file is already packaged via nativesdk-gprofng and can cause
populate SDK conflicts

Also delete the etc directory if its empty it can still cause packaging
QA errors

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Delete empty etc dir as well

 meta/recipes-devtools/binutils/binutils-cross-canadian.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
index 4e8f10c1c4..12e7d77d8d 100644
--- a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
+++ b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
@@ -23,10 +23,10 @@ do_install () {
 	rm -f ${D}${libdir}/libiberty*
 	rm -f ${D}${libdir}/libopcodes*
 	rm -f ${D}${includedir}/*.h
-	
+	rm -f ${D}${sysconfdir}/gprofng.rc
+	rmdir ${D}${sysconfdir} || :
+
 	cross_canadian_bindirlinks
 }
 
-FILES:${PN} += "${sysconfdir}/gprofng.rc"
-
 BBCLASSEXTEND = ""
-- 
2.37.3


