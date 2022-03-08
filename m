Return-Path: <samuli.piippo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 084A3C433FE
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 08:58:31 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web10.6345.1646729909747817314
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 00:58:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qqz/67hZ;
 spf=pass (domain: gmail.com, ip: 209.85.208.173,
 mailfrom: samuli.piippo@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id z26so15891416lji.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 00:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/fnDGuMVFlqjRZlT6M2A40skKN+dzhISKlfJGLPCoto=;
        b=qqz/67hZe4Da+9w4F3Bnp6pZClZdkTwBKWo5L3OZvDaG5FB96Fw3U05QJqTOAPmkN0
         IVKPclpweI1wWEYYv0OtUGCZqcKAYl4GHlCfYILKT8YrSk4K4fsdfQ88FaIliWdSpU3M
         N1V67nuyXoYe3EoggDET6QtEJYxp5uDDxSQyn/mxAy7teeeKz7ESbhCR4ebIAznZ0HD7
         5LdoR0a9yNnz7c19Vjo27SR1jphtbRWtBadD9/X9izS5FPqf4eVStcOSRksD9x4etAE0
         TVcG+JI8dls37mnbB/I1oFGxCy98PJ+Y/oGXpSih49dxl4oD+uSyZB2QHXnbGelu79Sk
         8SQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/fnDGuMVFlqjRZlT6M2A40skKN+dzhISKlfJGLPCoto=;
        b=UCWK487ygtOjU1jGGL9t6Cl73C3oaYpjxrRKi82mwEjtZ6IoHPuZPFbQblq2jPSd10
         pnYB8IR2ef/hj+NRR8dG+3QdOoUYtw622IkY3IEfJiWBBqKcZs0knu/GnSEqinVzav+Q
         MTO7EmnNMGVaEBz1oYQnUGGokvZa7GJQqz7a9fAs12pCRaLb24lS+rT4cHkQJEu0o96L
         doX+vSWu48XHdbGJFpeh45exqvTa47xshnrJ4DWh+O64i6nqORustQSqGRBx7hUd84Pv
         t6+r0LN90rLF7zxr6+uOkGpFWkuL3gRuGEWxsygBvkLULc7Y/3nrhx0b4NP3QOO/2SDv
         4zDg==
X-Gm-Message-State: AOAM530wXkJgMPDSS9Wb4pOPZxVaknsg/w9a8br5/1JfI4uK6Ql0SHAz
	6UFCXhxUb4B29n4TlZmlo7mWWT1AmSE=
X-Google-Smtp-Source: 
 ABdhPJzACHC8g+dhXhVY2vEKUJbF9iI0CBaSsOqtElURYCx3KVg2hRe7PqqAkWaF36JRX5l/xrzCyg==
X-Received: by 2002:a2e:82c5:0:b0:247:e81f:8b02 with SMTP id
 n5-20020a2e82c5000000b00247e81f8b02mr5011144ljh.90.1646729907266;
        Tue, 08 Mar 2022 00:58:27 -0800 (PST)
Received: from dcbuildsrv.ci.qt.io ([192.89.120.62])
        by smtp.gmail.com with ESMTPSA id
 v12-20020a056512096c00b004437e92a5e8sm3353655lft.105.2022.03.08.00.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 00:58:26 -0800 (PST)
From: Samuli Piippo <samuli.piippo@gmail.com>
X-Google-Original-From: Samuli Piippo <samuli.piippo@qt.io>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@intel.com>
Subject: [PATCH] mesa: make sure GLES3 headers are installed
Date: Tue,  8 Mar 2022 08:58:12 +0000
Message-Id: <20220308085812.973165-1-samuli.piippo@qt.io>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Mar 2022 08:58:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162876

Since there is no libgles3-mesa package that would pull in the headers,
add dependency to libgles2-mesa-dev. Now there no need to manually add
GLES3 headers to image or toolchain.

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 2f79e8b34d..713a82dc7d 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -193,6 +193,9 @@ RDEPENDS:${PN}-dev = ""
 # development package of libgles3.
 RDEPENDS:libgles3-mesa-dev += "libgles2-mesa-dev"
 
+# Add dependency so that GLES3 header don't need to be added manually
+RDEPENDS_libgles2-mesa-dev += "libgles3-mesa-dev"
+
 PACKAGES =+ "libegl-mesa libegl-mesa-dev \
              libosmesa libosmesa-dev \
              libgl-mesa libgl-mesa-dev \
-- 
2.25.1


