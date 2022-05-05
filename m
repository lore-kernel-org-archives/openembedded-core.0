Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 240BDC433FE
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 15:18:08 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web12.12514.1651763887125795155
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 May 2022 08:18:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fzQJ+q9b;
 spf=pass (domain: gmail.com, ip: 209.85.218.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id n10so9374326ejk.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 05 May 2022 08:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FbA5HAdRDDgRrNaUi/qJxXusSrd7anOaA9unP9XzBuE=;
        b=fzQJ+q9bGw4hQuG7MG/j4BIkrlO+NFruWeJL1UGa+bA2Sif+gN6Onj3u+45MUKUBiB
         Drb/6G6DFVyVQci65K/QRkx1n8tx7IurQXT321hFK6Eq+bUKdXKys2dyvzT4mDp+I5jX
         lYgGlPvcP29dVLrc9L091nZZzTYWRljNnKl5J+NFgVFvlligQvc3QLTbJgVSKMos/KWo
         kjHPIVGjMRN5wzQrkrI/2SMYCHR9O5aQy7VB5msE1E32iEzQnsWjN92C8B5IwB+EfC2e
         DRO/91Dv5p7mJckBuYjOccumN5dlhALEkEKhOEtghfhPhu0VB60Olt61N9AMerdliyH4
         KFDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FbA5HAdRDDgRrNaUi/qJxXusSrd7anOaA9unP9XzBuE=;
        b=3R3V7jeu0PSc3RpLpTZua0vsRkknlK4dC9mRSZOMGJna24E8ux2fsRnwD04ttKReeA
         RF7iiIc/cru9VQ3+u0JaKxBWeyyFq230vMsd3Obd5iwbipU/OimAOLjw70TLILM1TCh6
         3Fj3g1aJilPxY7QvXkUR/042IhO9eki5K/kuDfRebR6VWYBRsYLw1qsTY27DZNJk0cP2
         SrD2wniBU2v27AdlAhDRIIdc6aS0iStVXiEAvyz4kgrvDMGK9OLYA/LstQlJED6h67WB
         jxeTDU+FtTVu+RoF9PWXXxr/d4q3jKhqdlefGC2lbR3/h4EMDwMqA/OmAQfQKTfYkyby
         rzdg==
X-Gm-Message-State: AOAM533TtLBakk78kisIUC7EDqbWY0ErjxoJoedWajbKGS4f4yaBuhjD
	sbc2GcDroNlm2dfBj5BnOSo/dfnztbE=
X-Google-Smtp-Source: 
 ABdhPJyEoK3uwR7lbLaqdaMPbBC60jYfZ3yBBsd/EsflIg1DeTuonV3s60/Pi9/Ng3OQLlDNELzODA==
X-Received: by 2002:a17:906:7954:b0:6f4:dfbe:acd3 with SMTP id
 l20-20020a170906795400b006f4dfbeacd3mr6433390ejo.416.1651763882965;
        Thu, 05 May 2022 08:18:02 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 hz11-20020a1709072ceb00b006f3ef214ddfsm847777ejc.69.2022.05.05.08.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 08:18:02 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/2] stress-ng: disable apparmor from the correct spot
Date: Thu,  5 May 2022 17:17:57 +0200
Message-Id: <20220505151757.2099433-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220505151757.2099433-1-alex@linutronix.de>
References: <20220505151757.2099433-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 15:18:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165302

do_configure uses the base.bbclass version, which can
call 'make clean', negating the disabling.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-extended/stress-ng/stress-ng_0.14.00.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.14.00.bb b/meta/recipes-extended/stress-ng/stress-ng_0.14.00.bb
index ada35dbc4c..e7cc1d1846 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.14.00.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.14.00.bb
@@ -20,7 +20,7 @@ RCONFLICTS:${PN} = "stress"
 
 inherit bash-completion
 
-do_configure:prepend() {
+do_compile:prepend() {
     mkdir -p configs
     touch configs/HAVE_APPARMOR
 }
-- 
2.30.2


