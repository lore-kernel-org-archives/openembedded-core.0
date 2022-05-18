Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63960C4167B
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 10:59:36 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.3549.1652871575372610495
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GGJUfZnt;
 spf=pass (domain: gmail.com, ip: 209.85.208.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id c10so2508030edr.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QWIWtfSMReCksFSgyyzT1WgqdtPMd8p2yh40xku85nM=;
        b=GGJUfZntwilUjSv8wDIa/sBr8P3yo68+rUOAIj9EAb+BDXixw4ZVkxHb3GmGBwHQL1
         tg1Uk9LjGAMowmjLxh1ZNN4iGRb1XJk5r8s715NnEBYfAoX+CNxZTcNXj/vNWzlGr+EV
         Q2eOvRHtEiogDkx3yNrrEzIXr4Kza4OAgfJKq0Z+cV5oesLCsIpLOkofpfCjluMtNR/C
         ZUTkDry6CPEBNNGuUuVuzqNHt/yRTT2N34qkGsD63hecnsPQZJehRUYCaobvV5H+0qYL
         +ydOlqVxoOj/ZPwWtO/MqF6+o7gXMagFrn6+UhciOQJhbyD9G71OwByffw1tF+YFsq0S
         W3Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QWIWtfSMReCksFSgyyzT1WgqdtPMd8p2yh40xku85nM=;
        b=gxxjHBKLStr1kfxq7dAt+xFTJ0fI0VFUp0/ZHJJ28o19nO+9z6l7ayjwf0htanhQfn
         KqlmcAdT/fYqmI2LDVunixuBiTZTAMs4+I0uhAYLR3sNY/kjX0Zyz8lSly/4JQ0y8/Oz
         5x+Vz0IQBSj0BSoo/eEPVkUX60nBCIaDobaS4PRp0E3Ok3rz7W5uXh6o9iqYc+4WmmWg
         NuRXXCxnG9ntmGP+MH3AKMfWHP241Wn0zmtE/J0fAd+HO3uj/JRUQQ4SSXVsLGRqFy4L
         tHn0kucCjgXkTnnBgv9fx35q+mlwZCZ6eMCOHl5M0CaZLB2jIGpLMUvNGbhuEemRzvat
         zWrA==
X-Gm-Message-State: AOAM530wevyesnM/hsychXCoDNzduk5VU+KVJ80hGUgWOw2VOfYFfwh1
	2V8BHw9ab80VKUCOtOVetiiacwhtNC0=
X-Google-Smtp-Source: 
 ABdhPJx8aBO1refMnXoeqYEpVdz7ktuD2s8f4wqRLQ3pKDx+9ka17f8VpdQplwJZD7DG9e+cweTYnQ==
X-Received: by 2002:a05:6402:268e:b0:427:c402:d6f3 with SMTP id
 w14-20020a056402268e00b00427c402d6f3mr23914699edd.358.1652871573931;
        Wed, 18 May 2022 03:59:33 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 qs24-20020a170906459800b006f3ef214da9sm861524ejc.15.2022.05.18.03.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 03:59:33 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 46/49] sqlite3: upgrade 3.38.3 -> 3.38.5
Date: Wed, 18 May 2022 12:58:40 +0200
Message-Id: <20220518105843.3299331-46-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220518105843.3299331-1-alex@linutronix.de>
References: <20220518105843.3299331-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 10:59:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165843

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../sqlite/{sqlite3_3.38.3.bb => sqlite3_3.38.5.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.38.3.bb => sqlite3_3.38.5.bb} (86%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.38.3.bb b/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
similarity index 86%
rename from meta/recipes-support/sqlite/sqlite3_3.38.3.bb
rename to meta/recipes-support/sqlite/sqlite3_3.38.5.bb
index 286987b708..d56a3a0209 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.38.3.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
@@ -4,7 +4,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2022/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "61f2dd93a2e38c33468b7125967c3218bf9f4dd8365def6025e314f905dc942e"
+SRC_URI[sha256sum] = "5af07de982ba658fd91a03170c945f99c971f6955bc79df3266544373e39869c"
 
 # -19242 is only an issue in specific development branch commits
 CVE_CHECK_IGNORE += "CVE-2019-19242"
-- 
2.30.2


