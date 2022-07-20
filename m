Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52A82CCA48A
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 08:45:35 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.51640.1658306692472670656
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qwx/qyqV;
 spf=pass (domain: gmail.com, ip: 209.85.218.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id os14so31836038ejb.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xwnPc7b/0UEEgAhKTE3edtQIQrgrXSC3rvHmNYc8yo4=;
        b=qwx/qyqVOTbQD7MDAWlWqCiUpNAqP7P9Ajh3jeEhGEhg8iUP6EDPfqXz6SB/U8E9v1
         ze2KQBhA0D//qpoPDp/SSUZW2Fl+yt4JOGTnt3Df0KJEfPXq5uO4VD3IbvTStXQ9iJfZ
         eTSQfChOqJA8MTLjcQTVCvIlhg+GLGUaMcvR7BX9h7MUQVVKTydW0QlLaYuTX2LLH+VU
         9uMhImrepGzBr3xXT6YwXkBqWsx/yFjsayGLDRlpV8NFj2RV1rXvFKV76hRnLBJcs/tP
         ajbOCl66U5RiVPpVSuSJ1t8HeKrXwTrMuk71wA0JMEaM9HLuB2Ljowi0xtLiYqbR6ldw
         6fBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xwnPc7b/0UEEgAhKTE3edtQIQrgrXSC3rvHmNYc8yo4=;
        b=R9qKMhB0+fZE6U+9rDgC+teU/1XNQ3/0k9jZphpQG+wXMo9+MRCblIrPYCO7qUPy6B
         mb1QFGr/KnS9PkCk/PZGgzxgCcfiRrL3OxyVK4mvP4yaa7pu6/RFRb1iDNiG0oYLIg0m
         l+FAEnQeJZxSTJ4RqWfurLnVDaDj7dvaolthuUFTllxaorqJSV/KNsT7EUjtQoLo3CYh
         cod5S+XsQy+M9NpRq0YniOPEnskRvH2SFvG8o67bYVWNd+Xxr4FsD9c7NIfOub6FBYBt
         0Y0Yk5UldlXKoFqu9bi8WU7yMqeMLGs1djMFiTNUmzhVlVorNs8XYrBbiK62vpRxRy//
         jymw==
X-Gm-Message-State: AJIora+ZjYAaMcjwaJ7WW8dJvGE0bB7to84lt/nQVL/YG6gbNdMswGjs
	pNwlrSqiaa4lNYPAn/JwAgrS8sZ1epQ=
X-Google-Smtp-Source: 
 AGRyM1upGUZQ6c4pnJmizGlozxhN4mvheGrR8oAMyyDAUGJAl1PDVvrKDoC1F6mVPRa7+S5MSUeKrA==
X-Received: by 2002:a17:907:69b0:b0:72b:8e7b:6c2c with SMTP id
 ra48-20020a17090769b000b0072b8e7b6c2cmr34685149ejc.61.1658306729195;
        Wed, 20 Jul 2022 01:45:29 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 s9-20020a170906a18900b00722e5b234basm7781784ejy.179.2022.07.20.01.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 01:45:28 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 40/51] python3-dtschema: upgrade 2022.5 -> 2022.7
Date: Wed, 20 Jul 2022 10:44:31 +0200
Message-Id: <20220720084442.2940187-40-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220720084442.2940187-1-alex@linutronix.de>
References: <20220720084442.2940187-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 08:45:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168333

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{python3-dtschema_2022.5.bb => python3-dtschema_2022.7.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dtschema_2022.5.bb => python3-dtschema_2022.7.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-dtschema_2022.5.bb b/meta/recipes-devtools/python/python3-dtschema_2022.7.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-dtschema_2022.5.bb
rename to meta/recipes-devtools/python/python3-dtschema_2022.7.bb
index 0520dd76aa..dd9092f449 100644
--- a/meta/recipes-devtools/python/python3-dtschema_2022.5.bb
+++ b/meta/recipes-devtools/python/python3-dtschema_2022.7.bb
@@ -7,7 +7,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "dtschema"
 
-SRC_URI[sha256sum] = "147ff18bf446131d3ba14bc751febd84f4fdedf06130f53e193d3370052dfe3f"
+SRC_URI[sha256sum] = "2238753fa16bee7b26841cced75d745af777b896190f40aff5802992335201bb"
 
 DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS:${PN} += "python3-ruamel-yaml python3-jsonschema python3-rfc3987"
-- 
2.30.2


