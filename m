Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F916C3DA7A
	for <webhook@archiver.kernel.org>; Mon,  2 Jan 2023 22:47:57 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.49528.1672699674479022282
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Jan 2023 14:47:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=H/J6k3pl;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id d4so19602390wrw.6
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Jan 2023 14:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3+Qz0Um/IXHqr0ElWFE2zvU/XAvYdKV08MrSf+e3l9k=;
        b=H/J6k3plWh2oVBCa2K1hRW6zV2RgDMaRsZly5zyQqyhSoxkJr1uALFvklAtOgLuQS7
         R41CLeVxb4RQn3QgcjuESLFY1MmI2wQOM49ktAIawrZd+SpDYdodpOH9Z6D7yRvMjMqU
         0CfxAPYn9H9D0UfybMda9O8TuCW4pDULsn7nWOzHkRXrHD5r5+eCtfNETWQ83CLAwsUm
         OE7VggcLDL0duvKmX6nPYAnUslzk6jJrIB3wO649NDpnq+lGwcs7jN1g/KR9MU0I/alR
         Io0bgGRg0snwVfBD0szjByarYdoF4oKoDEwfp6Vang9QRgzAzFC9QqvJhoovxhhxL3IH
         XlOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3+Qz0Um/IXHqr0ElWFE2zvU/XAvYdKV08MrSf+e3l9k=;
        b=2KuFiDG8xEOC3Y1RQn6K6Z42qkh1Z411v1jxxt5R1Z8UDxVHnkuHS3cO7OPkxDi9M2
         h8cI3VJSNIISn/7fqIWlPgCH3RGZmLScEjehCdYG0dZds55gNuVg4Dni5BfajTIN9XVB
         xh/L9dhHhGMfr09XOfJLaIYq8WxRMfoVgknbrIGol6yP4nwItp30TRDMltrA4Tbgihvw
         Uj51fBFuoxRlY0/5u9VRJC8j3EgQPiJFc/WwqtTKPWn75kHNX5gVa1jlykCrcbvqU/rH
         cwy/gYZnfClf1bD1yysY6ZWGcgsTRRQPnbmj4VjAbMDeXIS1dXhaFwtEUnqnPvfxDNyM
         MxtQ==
X-Gm-Message-State: AFqh2krp3giF2MzvGvTjW1R/QGC3EZTX58nt2U1/IS2Kn0l4eIcRFlNg
	qE2zZzZtZBx047VCG13KMlW3WOwfmi4=
X-Google-Smtp-Source: AMrXdXvCeTJRIhBhQdBft1oEeC6OGWKHXh1FkepdxVhEdOMbJqB6pEtGn3AeB692gcRifz07IvBJsA==
X-Received: by 2002:a5d:5965:0:b0:27f:1c70:58c3 with SMTP id e37-20020a5d5965000000b0027f1c7058c3mr16904749wri.24.1672699672595;
        Mon, 02 Jan 2023 14:47:52 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id t12-20020a05600001cc00b0027b35baf811sm23309782wrx.57.2023.01.02.14.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jan 2023 14:47:52 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH 1/2] classes: image: Set empty weak default IMAGE_LINGUAS
Date: Mon,  2 Jan 2023 22:47:43 +0000
Message-Id: <20230102224744.287985-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Jan 2023 22:47:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175328

This is already set in default-distrovars.inc and so this assignment
will almost never succeed. Rather than leaving it to confuse, set an
empty weak default.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/classes-recipe/image.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.bbclass
index e387645503ad..d4bf02784ab0 100644
--- a/meta/classes-recipe/image.bbclass
+++ b/meta/classes-recipe/image.bbclass
@@ -182,8 +182,7 @@ python () {
 
 IMAGE_POSTPROCESS_COMMAND ?= ""
 
-# some default locales
-IMAGE_LINGUAS ?= "de-de fr-fr en-gb"
+IMAGE_LINGUAS ??= ""
 
 LINGUAS_INSTALL ?= "${@" ".join(map(lambda s: "locale-base-%s" % s, d.getVar('IMAGE_LINGUAS').split()))}"
 
-- 
2.39.0


