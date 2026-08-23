Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30C91C5DF81
	for <webhook@archiver.kernel.org>; Sun, 23 Aug 2026 07:49:40 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10731.1787471375341965117
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2026 00:49:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dteFLXqr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4998590d392so6091355e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2026 00:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1787471373; x=1788076173; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=azBUNqQLNfXwJ/CUvficO39C358KPYUfqp2gZKRpk0w=;
        b=dteFLXqrV6Boqr4gQG7pC0l+MWwD8y7qqNy3p7QjsLK/v4RyWHmWSWpi3sGr9UCDFN
         MiuUzNakWx908xZrElitBkismDHFpgGkL6WTGYUCM/tcwUHiSAgWdX1RzLUG67yohPXm
         PQzttE/42+nZHc/mmTcVDl36uXqkS+FVvE4Vc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787471373; x=1788076173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=azBUNqQLNfXwJ/CUvficO39C358KPYUfqp2gZKRpk0w=;
        b=SIecH5Od3jB41LeaCtNoixo8Xp/jo/UeJO5uzjkosQ5ijQ/lonZLx+s/jtQmWFwyYm
         xFnA+UqhqjK99/VIU4dzGwebBbwOJcCcaYRrdPFSgXpMbGY2AtO4K29d+9TJ8cc4hkJN
         6GqssMCaq4Ej+sEqy0zsK/833skCipudczmFYtiAMPVQDpX2hOI2+OruelCVAvwjnJXF
         LlCIldsuyiQvxM1So+ZrB5XBRymyLk+EWJ96HQRP9C9UGW4OjL5YyVEbj01nErEaqfY3
         RDl02FU00QN9437gYfvrgYRxJ3+tctchAyrnzJm4mOJbEpQrUj+fiDXLPIMk/LtSWEv1
         Y8Gw==
X-Gm-Message-State: AFuF++k5L6KxMXR9kmM3w1KDEPGRFC00xUM+CenAb8kJ3sqHtcSF9mtM
	pCuFIh62UIRGJOHKyLxht3iWK64o5MF3AXv3g1bxT11Ly6J6S4La8TJm0GEvQhkGwqTggEDIrTi
	3BSSNcbU=
X-Gm-Gg: AR+sD11iBZu1ukGVPP5tDUu5tqFHWOPh3sipx3suo0scnkCXWOgfSA8Sddk+z+CLKLr
	jWtBEdPKvtsGqB2D9ajuyx1XNVZj0fjnj2qCuul35n2CQ/8FVzsTa+GwlE/hcBQiqEJPYtQ61OZ
	EKUJqBkRt9c+PcNuPrcfKYXoyVV9uy8Ot7I5DC7DxD7BOeP3Gl7RfayOpOyaydzexmPDPvlGGgg
	ugS6dekekKg3WJtv4cwoSY2A12plZnVyKFw/TyYJhCwIFWg4F95ME1T5N7cNkBlyosdugUPe8rf
	HKRCtEyOnwFebno6n8yas79C3nG+9JODWc5+0yLLscJpdEejx/QpwU9FQhiyTdvMHX1utBSKsPA
	1oxFuDHK/BUc9fiBUEQ28OzK/prw7jpAqfSQTBSXjfFcANW28gjBGWb+wRmcRbKoNq570jC1gYx
	S6tCUqO6/iitkffQIYATNkb3Mgzys2dpPvZAw1Q1e9sj+P1I4h2DsgUWMd5wiFwdh6shzorY570
	+bb/ZK4CNbhJXvmOfpK0zHY0Omh
X-Received: by 2002:a05:600c:c493:b0:499:7aa7:eaa7 with SMTP id 5b1f17b1804b1-499b845c184mr210967965e9.15.1787471373524;
        Sun, 23 Aug 2026 00:49:33 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8601:39db:494d:605c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482c9bfcc31sm4279602f8f.17.2026.08.23.00.49.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 00:49:31 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/7] python3-pip: upgrade 26.2 -> 26.2.1
Date: Sun, 23 Aug 2026 08:49:11 +0100
Message-ID: <20260823074911.1711858-7-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260823074911.1711858-1-richard.purdie@linuxfoundation.org>
References: <20260823074911.1711858-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2026 07:49:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244018

26.2.1 (2026-08-04)
===================

Bug Fixes
---------

- Reallow keyring installed in a (non-activated) virtual environment to be be used
  via the ``import`` provider method while installing build dependencies. (`#14227 <https://github.com/pypa/pip/issues/14227>`_)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/{python3-pip_26.2.bb => python3-pip_26.2.1.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pip_26.2.bb => python3-pip_26.2.1.bb} (97%)

diff --git a/meta/recipes-devtools/python/python3-pip_26.2.bb b/meta/recipes-devtools/python/python3-pip_26.2.1.bb
similarity index 97%
rename from meta/recipes-devtools/python/python3-pip_26.2.bb
rename to meta/recipes-devtools/python/python3-pip_26.2.1.bb
index 4e5a777931c..7f041f822e3 100644
--- a/meta/recipes-devtools/python/python3-pip_26.2.bb
+++ b/meta/recipes-devtools/python/python3-pip_26.2.1.bb
@@ -26,7 +26,7 @@ inherit pypi python_flit_core
 
 SRC_URI += "file://no_shebang_mangling.patch"
 
-SRC_URI[sha256sum] = "2d8542afcc84cdd8e846c2b36b2861fad1da376dd98f8e7113e9108a3c331690"
+SRC_URI[sha256sum] = "f6ad667e89a1fe78046c8f13232b247200f5258d7828f3f7883d660878e0813f"
 
 CVE_PRODUCT = "pypa:pip"
 

