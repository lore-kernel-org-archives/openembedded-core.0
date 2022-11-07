Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1F49C47089
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 14:55:32 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.4286.1667832922748436115
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 06:55:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XeAOH6UV;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id g12so16556853wrs.10
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 06:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yoqk9+VyojVyqwkVJidT9ZO8ihfmGTnljtm+d77I5cs=;
        b=XeAOH6UV1RwvgnepMlPUAb5JCqL3Qj8wFDJdEAP+4M5z5/vhwIaMczGJny95EYzYXb
         TjooGFDTAjBiH9IrTUb9Fr4naQyIVkSGXS2lSUPdixr1bwNMEnmV1eA+ef6EusXfr7Nl
         bwMmIx7VWG6mh7A0qsaQjnu3z3VbF1eKA9d236GTN250K0z1wTwZiYsQe/fYr0mUh8hf
         SkYtxWbbtP75kUJrZz3bpg1IaSURcX9/x771Mk104TU0Y9dCRtZD2e6r93OUb+YHn8pI
         xmyx66Wp9BBmc30NABqpdSoxPGJCFjaE1JNNW7d4uNa4bRLI9aJUBd9GlN3B7w7tGmjF
         hNTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yoqk9+VyojVyqwkVJidT9ZO8ihfmGTnljtm+d77I5cs=;
        b=nzmh3a7sh4oqqwBXystpODf9AzOj+5pCe8/I1mUkptTmaG7C+a63ORgB5HDUkFvyXR
         yZ+bMJJ8gYvI98S918V9cjd9ZYxmjUggBVzxCCiKLzz+boksrXTBbzJhEIScyVeldujH
         WP66fS2TK5LnsiOiZRtaDyFOjKVV31yeqTAreSrqfUBvZAWra5JKNbH78Lslw08t/TBA
         HS5Qay5dUR8YlIFgVqQy4Q5NZ/1LvydavGfiuAp4fXMlYYgV//sX4UbIjyplSie5k+By
         Ax7t1szdPOkUo/n4Ib4Je3uKeS0S7QkcQJnbs0XXfHsIxPTR+Z3+j8swMGIeJ5PbHz1T
         EEdg==
X-Gm-Message-State: ACrzQf0HRCEypsjYT5ldR1HahrbhjGv1okBtcoNSFtv+bo+YRMoDjEt3
	hKAFj+Zxrs66xJYKpLWPuJHe0jjOKrM=
X-Google-Smtp-Source: AMsMyM4x0lIO1EbyCjfsh+pvFYKgWMJp83Q0005LmhFUH3WmFbq7w0xZbKT/i5KW5EAQO9Qw/wMJhA==
X-Received: by 2002:a5d:6884:0:b0:236:f5e5:13c1 with SMTP id h4-20020a5d6884000000b00236f5e513c1mr17849808wru.43.1667832921206;
        Mon, 07 Nov 2022 06:55:21 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id s13-20020a5d69cd000000b0023659925b2asm7460440wrw.51.2022.11.07.06.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 06:55:20 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 08/48] alsa-utils: upgrade 1.2.7 -> 1.2.8
Date: Mon,  7 Nov 2022 15:54:28 +0100
Message-Id: <20221107145508.1051404-8-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221107145508.1051404-1-alex@linutronix.de>
References: <20221107145508.1051404-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 14:55:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172858

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../alsa/{alsa-utils_1.2.7.bb => alsa-utils_1.2.8.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.2.7.bb => alsa-utils_1.2.8.bb} (98%)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.2.7.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.2.8.bb
similarity index 98%
rename from meta/recipes-multimedia/alsa/alsa-utils_1.2.7.bb
rename to meta/recipes-multimedia/alsa/alsa-utils_1.2.8.bb
index a78df2e112..b355deacc8 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.2.7.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.2.8.bb
@@ -25,7 +25,7 @@ PACKAGECONFIG[manpages] = "--enable-xmlto, --disable-xmlto, xmlto-native docbook
 
 # alsa-utils specified in SRC_URI due to alsa-utils-scripts recipe
 SRC_URI = "https://www.alsa-project.org/files/pub/utils/alsa-utils-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "e906bf2404ff04c448eaa3d226d283a62b9a283f12e4fd8457fb24bac274e678"
+SRC_URI[sha256sum] = "e140fa604c351f36bd72167c8860c69d81b964ae6ab53992d6434dde38e9333c"
 
 # On build machines with python-docutils (not python3-docutils !!) installed
 # rst2man (not rst2man.py) is detected and compile fails with
-- 
2.30.2


