Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CB1DC433EF
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 16:17:04 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.8186.1657124218915077919
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 09:16:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PB9h2HDH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id
 o16-20020a05600c379000b003a02eaea815so9454121wmr.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 09:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+kPrAlyUtfWG4J8PZBVrXCmryVKp9BCgx1l5GHFo3hg=;
        b=PB9h2HDHs72UN2jlmkBEHphBr3FZ+NylCTXyeprjcMOmpgnFTbKuqR0TOo+kxvyv1O
         QMQqctB9YDzxCGgm+Njz4BDCaC/TvXtfUUYu+x8CtJucLmKTh0QAyXNPpxx0imdnDfsY
         alDzRaHuxM6qLAcDFlAiPWt9WGYhjcvkmo030=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+kPrAlyUtfWG4J8PZBVrXCmryVKp9BCgx1l5GHFo3hg=;
        b=qAzEIjCFe9UcQSOOSn/Y5US5r1p6ux4RyTpWOk5v1F+wlWEo16Za9Sc62zR9/sBjHk
         kueJ1TbFFLsDEArzuloxe6DRBD/pvXgtiwFCrkoQXsUPN/ODsycBJSq0LFD7SKUV+9tN
         DxaAmn4TyhelSe0Cm7G9al273I/avtyE3wESR7QnOIjJQtkn/gGARO669/TU6JMeYsWu
         olRel2HEO1XMAnA0UenRV8gGUfyr12UefxF+XMLyoMD1U8hq9kcTDX4iO6gC0k+M+0XZ
         XKg2vqKHnwqevXeGqlIFX6GESqnP11SWNY0owGvgyHS6xTIUl4nUm1GB7AcrhAHY/QjR
         Kzig==
X-Gm-Message-State: AJIora/3xfjjGcZ1L5PVkWe99z8rVWV52aBOMbW+j5z4Z2sCNhYGIOkK
	Fs1GoOC6V6u6+kwv8hynHy/NtdGVgez6+A==
X-Google-Smtp-Source: 
 AGRyM1t02PmbPa3Ye5NyeyKFLkJSXVZDENrk7zKVS6HgfJPmPdq9BeduHc7CHoCamZNo3vQ7SKnXMA==
X-Received: by 2002:a05:600c:2246:b0:3a0:4d14:e9ca with SMTP id
 a6-20020a05600c224600b003a04d14e9camr45707859wmm.25.1657124216733;
        Wed, 06 Jul 2022 09:16:56 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9b71:63f4:5737:a5c8])
        by smtp.gmail.com with ESMTPSA id
 d3-20020a05600c34c300b003a2c67aa6c0sm116157wmq.23.2022.07.06.09.16.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 09:16:55 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] lua: Fix multilib buildpath reproducibility issues
Date: Wed,  6 Jul 2022 17:16:55 +0100
Message-Id: <20220706161655.1022188-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Jul 2022 16:17:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167733

The .pc we install ourselves for lua has hardcoded /lib assumptions in it
which means in a multilib environment, full build paths end up in users
like rpm's configuration.

Fix the .pc file to use a correct includedir and libdir to resolve
those reproducibility issues.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/lua/lua/lua.pc.in | 5 ++---
 meta/recipes-devtools/lua/lua_5.4.4.bb  | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/lua/lua/lua.pc.in b/meta/recipes-devtools/lua/lua/lua.pc.in
index c27e86e85db..1fc288c4fec 100644
--- a/meta/recipes-devtools/lua/lua/lua.pc.in
+++ b/meta/recipes-devtools/lua/lua/lua.pc.in
@@ -1,6 +1,5 @@
-prefix=/usr
-libdir=${prefix}/lib
-includedir=${prefix}/include
+libdir=@LIBDIR@
+includedir=@INCLUDEDIR@
 
 Name: Lua
 Description: Lua language engine
diff --git a/meta/recipes-devtools/lua/lua_5.4.4.bb b/meta/recipes-devtools/lua/lua_5.4.4.bb
index d7048413781..6f2cea53147 100644
--- a/meta/recipes-devtools/lua/lua_5.4.4.bb
+++ b/meta/recipes-devtools/lua/lua_5.4.4.bb
@@ -45,7 +45,7 @@ do_install () {
         install
     install -d ${D}${libdir}/pkgconfig
 
-    sed -e s/@VERSION@/${PV}/ ${WORKDIR}/lua.pc.in > ${WORKDIR}/lua.pc
+    sed -e s/@VERSION@/${PV}/ -e s#@LIBDIR@#${libdir}# -e s#@INCLUDEDIR@#${includedir}# ${WORKDIR}/lua.pc.in > ${WORKDIR}/lua.pc
     install -m 0644 ${WORKDIR}/lua.pc ${D}${libdir}/pkgconfig/
     rmdir ${D}${datadir}/lua/5.4
     rmdir ${D}${datadir}/lua
-- 
2.34.1


