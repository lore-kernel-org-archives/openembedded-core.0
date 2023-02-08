Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1876FC678D5
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 07:22:15 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.3126.1675840910613950144
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 23:22:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UGEhfN+v;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id j29-20020a05600c1c1d00b003dc52fed235so744312wms.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 23:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XzrIonYir/nPd7foZnXrGKiqNu7nSEM1PyhEqCydT+E=;
        b=UGEhfN+viNS8Ww6qdiaZtsxWc077AY3DkBo1s6SNB6AuiePyLYRj8GXbqCA2hz5nTJ
         gvgLsRbLHpPXrkC6LDg940SwPbbUbL+g5C+jtElgRo5RGwxO6zWXb9R23qLcgJOekmUK
         jYdc8205Kr2IZdcs5qsNQKMjCZCTQyJkyOMDf5BzKYDCMnlJxr15Q6uvUSPR/vDONbql
         ZMWkur2l6jzbFjEc4/gR9g0gkv+Z8ozcaGP+a5wXZpRp8jrMPlpinQkv0t0B8DzAXOJA
         RIAraDFcvKZBWpdkTPSzUm6+Etp03yWQQCICbbn0uxm0r2ISCiQFuOT8ry+J/3sYAgwM
         1duA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XzrIonYir/nPd7foZnXrGKiqNu7nSEM1PyhEqCydT+E=;
        b=DZhnkYRQflrklcSl/nHZxlnNTg9nKJ5F7Ye0KnpKxZunv3xmX/ywCTjNRrrPS1VCGk
         2c2Q2Ocep9GKX4N1nEfCSL9MHEXrUgdEQubkpVzMJVwICchCVMWLp7wiUiOufnSg80Jf
         YgYP2aUP1uVf4eIVLXOud2ouKJzctuyMUw/Gc62sA0P/raacJC06bRFHH2z02KHKti2v
         DLIh6t1tDboDJLdCL3SGPYnoscvFdu4ZhOy5XBdYERo9I/PJ+IUvj9TG9HUj3alZDL0D
         X+ymPGrGlhsv6D7EcsRC/WDYhs2Y0gL35JWWE1nlnjBNzfumvfYx2wE+/o/N908DmnRH
         ObkQ==
X-Gm-Message-State: AO0yUKWy/is7kBJQlpGjgsmRQj661ojmcPTyJsz0fI8LqUnBGRJ2GRqC
	RRCNjfzIR4FpfJzZ+q+DkUv1MaOdQ0k=
X-Google-Smtp-Source: AK7set/D9LwQan7WCnoTieqB0Feig54049MiKottUnY3WfEw9+e7e+v2mc/Xzp/ikSCrXEtHdNrBOw==
X-Received: by 2002:a05:600c:4d17:b0:3df:218d:b62c with SMTP id u23-20020a05600c4d1700b003df218db62cmr5451258wmp.12.1675840927873;
        Tue, 07 Feb 2023 23:22:07 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c2cd000b003daffc2ecdesm1087926wmc.13.2023.02.07.23.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 23:22:07 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 35/52] python3-dtschema: upgrade 2022.12 -> 2023.1
Date: Wed,  8 Feb 2023 08:21:26 +0100
Message-Id: <20230208072143.2930292-35-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230208072143.2930292-1-alex@linutronix.de>
References: <20230208072143.2930292-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 07:22:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176875

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{python3-dtschema_2022.12.bb => python3-dtschema_2023.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dtschema_2022.12.bb => python3-dtschema_2023.1.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-dtschema_2022.12.bb b/meta/recipes-devtools/python/python3-dtschema_2023.1.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-dtschema_2022.12.bb
rename to meta/recipes-devtools/python/python3-dtschema_2023.1.bb
index 9d860111c1..9767c95d30 100644
--- a/meta/recipes-devtools/python/python3-dtschema_2022.12.bb
+++ b/meta/recipes-devtools/python/python3-dtschema_2023.1.bb
@@ -7,7 +7,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "dtschema"
 
-SRC_URI[sha256sum] = "f532d433a915e507d4b426b7ef57a6730d23c0938b682fb4866f9dfa80a58ec6"
+SRC_URI[sha256sum] = "8fc8c269e4c57e9d008af7b32cd33b77afd4ea1ac9552bcfa96b41b9e0c52586"
 
 DEPENDS += "python3-setuptools-scm-native"
 RDEPENDS:${PN} += "python3-ruamel-yaml python3-jsonschema python3-rfc3987"
-- 
2.30.2


