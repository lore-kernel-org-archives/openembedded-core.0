Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA515C5321D
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 18:27:10 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.20563.1724351229740040983
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Aug 2024 11:27:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kF6dmjK8;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a7d26c2297eso145411966b.2
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 11:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724351228; x=1724956028; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1EvuO7SokDdEGrV0ElWHtZPcAwM2t8o8Tsg0KdmoZRM=;
        b=kF6dmjK8zRsObeFFa2ywEbr2cdt9lmQE/iXjZacGoQ2fB6s1Y/n/5a4Da/vveKo+J3
         O8TOxxT7Wg7Zkt8gWDKbc6RkqWS2gp4KFHdpJVwr50qemHCRiJQbj/cVvzvOxHLo5+ON
         BQoQV9XkEGv6SNASy/l+uimmW+7+DCglObCuk1Abcs6z7B7iDs1gYgWn27n+dcXFpMzE
         6BlOs0q6ODMDQEe3BPDLLW29upXZkF/3FofsF84diaetMq3p7dj5GZTykgJqydijpvsy
         1j+BLZSqRDcoaxvWFl3YW5VWt8cu4dTKrserKtbAMANAlQzdEC8pnETjOvTZ8bmHg/wc
         qH3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724351228; x=1724956028;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1EvuO7SokDdEGrV0ElWHtZPcAwM2t8o8Tsg0KdmoZRM=;
        b=jZFIHN0fcCLGWERs2MTfIUS2bus8nZa81JLhz2Bij44XGjCD1a/gf+ajhcFr/1PDil
         XSJSxt4LAsK8poK/P82Ok5KotVGLgk37r0/Yt6Ljzm4JT4cYEGkavHL6S9zuP4nROcYP
         RCiUWjMVrVEpim9nGfmcgrD3T8ewRzC4bBlWYrojszbrAUv1mZS0l3Q040qk3Q4Q5KE7
         oxadvwe4SKsfgBW+relsQilmL/9nmSD/1NOBFsdbMI5pCK8fkB4BjQZvz1QduU4EtFgI
         IiaF12pg3LwYG3OCHp6/Su6m+rslpODtTzwh3Ioh9UpUajXznu5ZrxfrkcxtyIMvBSMr
         kgfA==
X-Gm-Message-State: AOJu0Yx3f695sQkO12aF0qgMsTUtPqhIwkLpSWK2Rqb3xjTIq8DTTERc
	uxVrFHr1LWOsSisyk5IeZmXKf8vMkIOXmzAQ3iv8lYTVQgYcEek1zwE4JA==
X-Google-Smtp-Source: AGHT+IHXw8OPJ7m8SrRlbIA0hj1dVKLa0lucQZqIhwjMyR06rN4sLLybN6LPqrZW4hJgsPOZxg8IrA==
X-Received: by 2002:a17:907:e251:b0:a83:7ecb:1d1f with SMTP id a640c23a62f3a-a866f70503emr497227266b.46.1724351227434;
        Thu, 22 Aug 2024 11:27:07 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f43367fsm150394266b.115.2024.08.22.11.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 11:27:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH] python3-numpy: disable ccache
Date: Thu, 22 Aug 2024 20:26:52 +0200
Message-ID: <20240822182652.1817179-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Aug 2024 18:27:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203660

* fails to parse CXX correctly since the setuptools upgrade from 72.1.0 to 72.2.0
* it can be resolved by upgrading numpy as in:
  https://lists.openembedded.org/g/openembedded-core/message/203231
  which switches from setuptools3 to python_mesonpy, but before that
  is merged, we can just disable ccache here
* more details in:
  https://lists.openembedded.org/g/openembedded-core/message/203658

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/recipes-devtools/python/python3-numpy_1.26.4.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-numpy_1.26.4.bb b/meta/recipes-devtools/python/python3-numpy_1.26.4.bb
index 914245507c..7cd9d30d2d 100644
--- a/meta/recipes-devtools/python/python3-numpy_1.26.4.bb
+++ b/meta/recipes-devtools/python/python3-numpy_1.26.4.bb
@@ -24,6 +24,9 @@ inherit ptest setuptools3 github-releases
 
 S = "${WORKDIR}/numpy-${PV}"
 
+# fails to parse CXX correctly since the setuptools upgrade from 72.1.0 to 72.2.0
+# https://lists.openembedded.org/g/openembedded-core/message/203658
+CCACHE_DISABLE = "1"
 CLEANBROKEN = "1"
 
 do_compile:prepend() {
-- 
2.46.0


