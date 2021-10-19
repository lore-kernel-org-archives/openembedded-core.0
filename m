Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F767C433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 15:34:40 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web08.11515.1634657679583047884
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EeiJL+Op;
 spf=pass (domain: gmail.com, ip: 209.85.128.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id g39so8334124wmp.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hLyiWWsaoz2JIx35Bvwr7lVRGH6Z2xf69bI4WPqnnGc=;
        b=EeiJL+OpmqGPZbqBjs0or2JRLJFrvqvfVAIVbalbbYOnM12coHEJ1+0RopKEbDB6ex
         rDc3XqRmA4Pe2Gsb3r7W4HiZ973bQrj5FxH3OeCvsBkZtTYY3hjtHB2Mgt7BKm0hzhD4
         v+vR7gbEC5p7Vw3maOGVt0j01J3JCkkYrAZF7O33t7wgxL99iuKmlr+D56+H5KVV2WA6
         lKApOEdMmhN8FFVx0ArwsJUmcns9pY21kOeNXlklbuAe6yL9+8DehgvsAL/GePgVaEI2
         h9uyqvswun4jlURqGXElaXt7nbEnVef0MaOkMlJHiga1Cy3b0ZKllH0NfUEL9n9eZNmy
         gfHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hLyiWWsaoz2JIx35Bvwr7lVRGH6Z2xf69bI4WPqnnGc=;
        b=ImCPFSulEXqhZkYoilDR11ib0sz7FEa4Lu1UX29hh9r9MzV2RcIjTqhiaBo5pGijiF
         F84N4Y2VEsYU6DUSbJFSyINQB3oh1Q24ZoyedtJB9uf9O/sG+YVj5l21WaUQP87xSKm6
         gPOPiMYDc5EifODnP59NmgkJkUmLTJOYOBjjOpjq2cw+4MXyxNF4aHuv8vJfTFVXd46W
         Dc2DNcNIC73Mtdn2b2aj8S3fjrklxhyISZKcUdbYFQfu1LS6u/xdyXjtyPqflhmEXFXf
         2mmBgJoOehXegCQs8mjPIB4S5sg3mqrF8+hUGACnyt5mmdpZJO9mArCksldoeRwnZBK4
         OQ9g==
X-Gm-Message-State: AOAM533uaSfPQCVlGfMbH4V9678lgqU2N+t43qSUgHnZ+sb4FmZhL2Pm
	47wOEv4JKy6sRVrRu5kOVn5tPdKBfH4=
X-Google-Smtp-Source: 
 ABdhPJyhjdllFMABwir+cBwdzB/s/6CAOQ99n4Og6Dbz+xgXPo9XLnbMgI2GtgrX7oV72zzYbILg9g==
X-Received: by 2002:adf:a38d:: with SMTP id
 l13mr44648739wrb.103.1634657678160;
        Tue, 19 Oct 2021 08:34:38 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t1sm5868537wre.32.2021.10.19.08.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 08:34:37 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 20/65] bison: upgrade 3.8.1 -> 3.8.2
Date: Tue, 19 Oct 2021 17:33:34 +0200
Message-Id: <20211019153419.3319802-20-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211019153419.3319802-1-alex@linutronix.de>
References: <20211019153419.3319802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 15:34:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157139

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/bison/{bison_3.8.1.bb => bison_3.8.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/bison/{bison_3.8.1.bb => bison_3.8.2.bb} (96%)

diff --git a/meta/recipes-devtools/bison/bison_3.8.1.bb b/meta/recipes-devtools/bison/bison_3.8.2.bb
similarity index 96%
rename from meta/recipes-devtools/bison/bison_3.8.1.bb
rename to meta/recipes-devtools/bison/bison_3.8.2.bb
index 54c1fe1b52..58395c3dce 100644
--- a/meta/recipes-devtools/bison/bison_3.8.1.bb
+++ b/meta/recipes-devtools/bison/bison_3.8.2.bb
@@ -12,7 +12,7 @@ DEPENDS = "bison-native flex-native"
 SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.xz \
            file://add-with-bisonlocaledir.patch \
            "
-SRC_URI[sha256sum] = "31fc602488aad6bdecf0ccc556e0fc72fc57cdc595cf92398f020e0cf4980f15"
+SRC_URI[sha256sum] = "9bba0214ccf7f1079c5d59210045227bcf619519840ebfa80cd3849cff5a5bf2"
 
 inherit autotools gettext texinfo
 
-- 
2.20.1


