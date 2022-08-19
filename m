Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCBF6C32792
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 07:28:18 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.467.1660894092023229100
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:28:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gJmT/Kbl;
 spf=pass (domain: gmail.com, ip: 209.85.128.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id
 m3-20020a05600c3b0300b003a5e0557150so3550459wms.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=AUNxGlYS2FDD6+BNqWWHfRLrmGz8AjQ2DhHUauw4bB0=;
        b=gJmT/KblqoFcdLtaJ+PHXoY+g/qWc8bU0njqrIfC2W4KyRl/KKsq74T28PeSXxaPBC
         iuprvV5nLHoxVIBLmKA1MZiXextFnV6c+ddfACj+H+zZSeBhsgFbOa74gYs8WJdSr10p
         K+31mvChQDsip4yHgIgsFtj7uuBujznV4xkjT8dEhzWS8HMXxga0xbNaHnMUTk9Io6rZ
         cTKJLl/aCAFZa7CGZyHF9aAyat5CFSG7rt2em5PYLN3h8ev34sLwqJGvMOFo6DqqIveZ
         XCCumLTFuThjEepJ8E6ZAdrMQwbFCDbUqGi+hNySpBsqox0S5n2AVJmnisiGYg9R4d6q
         0tXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=AUNxGlYS2FDD6+BNqWWHfRLrmGz8AjQ2DhHUauw4bB0=;
        b=Tw/mcQelKa2y8Ce8n5Cak9dGVYHv5tVgvlKTTtRqXhHJmlqMmnr1P69qH9CfNhMOZg
         UHAj4RqRdzfeojwqUaogQwOqNW/5YamMO3wVU1h6s4kT6PQqKboGMrAntvZSRzHSdFYU
         LIObPyCgCAe+FjAwjlKV7fdxc+JIMlusgkUjhcN7PGMSSW8F4GK8yfNFm2XNigDLXdt/
         J9UoC+GT/CqHMEoVksHEvdN30+7hPAyLLz3v6QHRTvLqEVGKKssR9rn1qoSLCBZxp31H
         pK5VnfZiO+mIgCdGpt7n1vsIcCNwFnWb4iGz/A9bx8HUfML1Co0J+cErNC7r0ExY+2Dv
         twtw==
X-Gm-Message-State: ACgBeo3yeWuBXZalqf0b/dY6fjVfek4/Qt2Z2o8rBCDSicfPaoytrYQ+
	OFKaBpYyOE4EEjUbebmAbtf61WB5KK0=
X-Google-Smtp-Source: 
 AA6agR7/t0UvD8vA9LHTEMTB5YXj/gAKYL+ZTAFpsR62SdklpW52dRRAW3FQ5s//P9FW/xHZZ1Ns/g==
X-Received: by 2002:a1c:7708:0:b0:3a5:5543:cec4 with SMTP id
 t8-20020a1c7708000000b003a55543cec4mr7223603wmi.47.1660894090548;
        Fri, 19 Aug 2022 00:28:10 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 ay15-20020a05600c1e0f00b003a604a29a34sm4650739wmb.35.2022.08.19.00.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 00:28:09 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 27/42] python3-dtschema: upgrade 2022.8 -> 2022.8.1
Date: Fri, 19 Aug 2022 09:27:12 +0200
Message-Id: <20220819072727.2236928-27-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220819072727.2236928-1-alex@linutronix.de>
References: <20220819072727.2236928-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 07:28:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169599

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...{python3-dtschema_2022.8.bb => python3-dtschema_2022.8.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dtschema_2022.8.bb => python3-dtschema_2022.8.1.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-dtschema_2022.8.bb b/meta/recipes-devtools/python/python3-dtschema_2022.8.1.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-dtschema_2022.8.bb
rename to meta/recipes-devtools/python/python3-dtschema_2022.8.1.bb
index e8c8ac6f92..38f646e50a 100644
--- a/meta/recipes-devtools/python/python3-dtschema_2022.8.bb
+++ b/meta/recipes-devtools/python/python3-dtschema_2022.8.1.bb
@@ -7,7 +7,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "dtschema"
 
-SRC_URI[sha256sum] = "1befe7c9f74cea248a8b524cf6185ac48912a5b2aae96854d77cb94584433ca4"
+SRC_URI[sha256sum] = "3e56a9920944223d6f93fd51ada19dd8db554ac9182ef52c1c5c9d4966ab30aa"
 
 DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS:${PN} += "python3-ruamel-yaml python3-jsonschema python3-rfc3987"
-- 
2.30.2


