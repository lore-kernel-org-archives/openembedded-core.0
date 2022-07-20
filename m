Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2823CCCA482
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 08:45:25 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.51644.1658306707520253040
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TmtrvE6E;
 spf=pass (domain: gmail.com, ip: 209.85.208.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id x91so22891876ede.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a7/bQqIeLeTl7u+FwchnwliJNOITcac2K88SxxCg01Y=;
        b=TmtrvE6Ee6dD29xtDnRsqKwh3XJXz8xSEzPP4NMen8DPUc88x8P6GUuHWpspV8VUdr
         jK+lwBQxbsDVjzoI8+ISlv35HkHL+nvsAotmB6FGGYFOsrz+WU48k6KSF/AdvbH1Hk6F
         7ZAqbbhxMgn0wRDeqHci6e9NH5f6Chlm5KBfjvOG2N+zHlzlW0dPIGWY6+dyx2vrDJP3
         /bwlvrsq4HAVUUXW6uAOYNiDttJshMZm8LwMsbpWSEhhZjmawSFo7GZhRSAbY2Tva/g3
         PGKP2y5wFL1GFTDzQYXJFEqcks9poFu6A6gZIFrJKFAPquMlBrQlgbZnIKES6dIOAIzN
         IOXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a7/bQqIeLeTl7u+FwchnwliJNOITcac2K88SxxCg01Y=;
        b=tDUEfC7cdLIIMQlAwYboSxyzAd7T3nTbCOKMThZCKAWkfaAlzvwvHr8oP0utBTnaCZ
         2kf47TxMofjEp3nMcHQ5hqWuuTA3akQuvoILuecQS9PHgd6FCAQSA1Airz6n8UOflDPy
         UKpJh8mmW/kepq0FA2eon3+MD++mpx7wKRNne68a0DmbwudDNuNTBgOZSk2k7Iu6lY46
         sUY58xS0vifKggqCriISG0UkQA5FoOVKSi42si7/b/BldXnkifHNI+rextZXwdBwRHj0
         FZTAmdfvt/5l9jlJIr3raILlVXufR/8RF4sfyMqgVLaCt/8lAI2pDmjrcYDtFo9RKoxy
         vgEg==
X-Gm-Message-State: AJIora+RQ9QzrHhMINkNxAF/ZD7PapzzigLHJdpYgGthICnoyBxMJvWt
	yzfFzBoNlsjg8+NAMSctAUohubM5VG4=
X-Google-Smtp-Source: 
 AGRyM1u9zmDgz+lLg0ii3r8P7CczuLIGjJI1IhaFzCjItm4SqMgqv9Pfs62lY3bLPABxDftAijjodg==
X-Received: by 2002:a05:6402:438f:b0:43a:cee2:a081 with SMTP id
 o15-20020a056402438f00b0043acee2a081mr50324505edc.298.1658306718755;
        Wed, 20 Jul 2022 01:45:18 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 s9-20020a170906a18900b00722e5b234basm7781784ejy.179.2022.07.20.01.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 01:45:18 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 30/51] libidn2: upgrade 2.3.2 -> 2.3.3
Date: Wed, 20 Jul 2022 10:44:21 +0200
Message-Id: <20220720084442.2940187-30-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220720084442.2940187-1-alex@linutronix.de>
References: <20220720084442.2940187-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 08:45:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168324

License-Update: copyright years
Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libidn/{libidn2_2.3.2.bb => libidn2_2.3.3.bb}          | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/libidn/{libidn2_2.3.2.bb => libidn2_2.3.3.bb} (81%)

diff --git a/meta/recipes-extended/libidn/libidn2_2.3.2.bb b/meta/recipes-extended/libidn/libidn2_2.3.3.bb
similarity index 81%
rename from meta/recipes-extended/libidn/libidn2_2.3.2.bb
rename to meta/recipes-extended/libidn/libidn2_2.3.3.bb
index e1b25b4b8c..a86b2b5a8d 100644
--- a/meta/recipes-extended/libidn/libidn2_2.3.2.bb
+++ b/meta/recipes-extended/libidn/libidn2_2.3.3.bb
@@ -7,11 +7,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2d834ea7d480438ada04e5d846152395 \
                     file://COPYING.LESSERv3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
                     file://COPYINGv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.unicode;md5=684cf5f7e3fded3546679424528261a9 \
-                    file://src/idn2.c;endline=16;md5=e4b6d628a84a55f1fd8ae4c76c5f6509 \
-                    file://lib/idn2.h.in;endline=27;md5=d0fc8ec628be130a1d5b889107e92477"
+                    file://src/idn2.c;endline=16;md5=0f347a5b17acf44440bf53e406f1df70 \
+                    file://lib/idn2.h.in;endline=27;md5=4d7b3771faa9c60067ed1da914508bc5 \
+                    "
 
 SRC_URI = "${GNU_MIRROR}/libidn/${BPN}-${PV}.tar.gz"
-SRC_URI[sha256sum] = "76940cd4e778e8093579a9d195b25fff5e936e9dc6242068528b437a76764f91"
+SRC_URI[sha256sum] = "f3ac987522c00d33d44b323cae424e2cffcb4c63c6aa6cd1376edacbf1c36eb0"
 
 DEPENDS = "virtual/libiconv libunistring"
 
-- 
2.30.2


