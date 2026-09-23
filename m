Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25A65C982EA
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 09:11:55 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2925.1790154709865248313
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 02:11:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=v21JMR1Y;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d822dso4197905e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 02:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790154708; x=1790759508; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LUZ/oZXOQ1qsiFz5NSzTUcxGxOWSkM7/wh0LvOArpBE=;
        b=v21JMR1YDbyuzubfXFxH9A/jOu9ayt+hAEBqsjauIZPJRTnMxi2WjtoSjxRA0EhdmU
         CfXIZiUiuWVS117yr7sMzgo8I+HfmtdlY8r3spDFfV16Gw5ekWzJUoSN2j3YX4zZHFAs
         GcYRNp7Vp58DCsPxQs1GeQ5sqEsCitP6xphuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790154708; x=1790759508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LUZ/oZXOQ1qsiFz5NSzTUcxGxOWSkM7/wh0LvOArpBE=;
        b=PcoUz4fcmIvrttuRf+Zlrdc07OBr+AeDI3ddOK/eyJ2bvKoL0Y3y97vERPPOJq8ffb
         xE11CygYLRANfVNTg10NfLO+5uAmWKA3HjmBdVIyJCRHiwsAYiehFsVmySKA2KTZvzHn
         1zcE48OKlvoHeCvjVHSckJGh5L3QDiGcaLvSCXuphl1sbUUCVJRxsajqmcfbE6jrafVw
         DGpsbhwXFZ7vWAop1H5X34/heUwejHgZOW7oqWcxL0uTkbru/e1vqludD0LX3PqOTb6M
         jmlVti/6+oI3pTFhrBil6sG5U//hn/FtUhI0v5f0KlP51QqKHqCNzQG53XskFWuVOd+B
         e4BA==
X-Gm-Message-State: AFuF++mVpegCr9hm+UnbKoCOQzRvdjiUDAWvYNOYnlygAPAKyr32tlTb
	rRkkWQg2apwKnE16Ntk5bmdjn7hMGUdDGFpZQpLwZBELSQAIvAOl10lQ25+iS24WVxzjlR17xGE
	gj4MFIuA=
X-Gm-Gg: AYBFou1RgNsRH4dX/2E41jgo4/w2ntU7lnKhMC64I6OLv2E38PZferbp9r1UUQHPMr8
	jbwdndmUcToVo3ZSp5ZziAMSVqyF+NUsOrac+omepGPq1MKSY9BVkhGyuG2aD9YrMeYXMNVwkxv
	9Py3TJKU4+yvugIIC9YY2yBJzQqSju7M5w3g0+cymw9SfmFiZmK2E0VyuM3JqfJ1QXsbavW/FJ3
	uyoDLKJx9+sdJTSsv3fOZUpX7Jj51nK8vfQiUc/6YQbIS4mrpQt9Q14GDAriWyPU46G18JOQr5H
	VYxQoRoSn6NIFvs4MvQ4K0oJG81wtgKT9CN0ejbm3DO2vOGKTD5yonALB1ZxpDQIN8+i1QofW3G
	UFRdbBe7j0KnE8Su9GDxfdoOKSoHJ7AXpQkiOD4fV5NZUPLBnwRb/FbzEqCkf0TNC8Nk0axpaFt
	PYTKOSisNGoLfFIv5HpyThMcub9naPDsPsRSgH6/ezX5488Cis0+mLe2EPCzp+rN66no/Ul5sQd
	fjGuc68uzmreYy7f9bSbB1mhXYZk4tJw6x9QnyC5Pd17FVaCIa5lsnf4fkx6qZVAe3o6GfB9fGX
	2PKHuUU=
X-Received: by 2002:a05:600c:3e0b:b0:49d:827:e5b6 with SMTP id 5b1f17b1804b1-49fdf134f93mr25826245e9.20.1790154707979;
        Wed, 23 Sep 2026 02:11:47 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a02-8440-b519-f416-8bed-8817-19fd-ccf7.rev.sfr.net. [2a02:8440:b519:f416:8bed:8817:19fd:ccf7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe2730da9sm14251525e9.4.2026.09.23.02.11.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:11:47 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 27/48] golang: fix homepage
Date: Wed, 23 Sep 2026 11:10:29 +0200
Message-ID: <e859061f8f00937e5bb737c029ca2da3837d551c.1790154074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790154074.git.yoann.congal@smile.fr>
References: <cover.1790154074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 09:11:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246489

From: Peter Marko <peter.marko@siemens.com>

Leading space leads to SPDX document validation errors in some tools.

Example:
SchemaError: \" http://golang.org/\" is not valid under any of the
schemas listed in the 'anyOf' keyword
(components -> ... -> externalReferences -> 0 -> url)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: cbf36f436b477d81b58ff605846a2482308aefa)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/go/go-binary-native_1.22.12.bb | 2 +-
 meta/recipes-devtools/go/go-common.inc               | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/go/go-binary-native_1.22.12.bb b/meta/recipes-devtools/go/go-binary-native_1.22.12.bb
index dd84021cc9e..5dfb3133f6b 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.22.12.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.22.12.bb
@@ -1,7 +1,7 @@
 # This recipe is for bootstrapping our go-cross from a prebuilt binary of Go from golang.org.
 
 SUMMARY = "Go programming language compiler (upstream binary for bootstrap)"
-HOMEPAGE = " http://golang.org/"
+HOMEPAGE = "http://golang.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 
diff --git a/meta/recipes-devtools/go/go-common.inc b/meta/recipes-devtools/go/go-common.inc
index a39dea6c1cb..62b31f1762f 100644
--- a/meta/recipes-devtools/go/go-common.inc
+++ b/meta/recipes-devtools/go/go-common.inc
@@ -9,7 +9,7 @@ DESCRIPTION = " The Go programming language is an open source project to make \
  fast, statically typed, compiled language that feels like a\
  dynamically typed, interpreted language."
 
-HOMEPAGE = " http://golang.org/"
+HOMEPAGE = "http://golang.org/"
 LICENSE = "BSD-3-Clause"
 
 inherit goarch

