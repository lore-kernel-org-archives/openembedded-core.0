Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4123AC54F5D
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 22:22:16 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2804.1785277329689135086
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2026 15:22:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=GYozNiVa;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso2309915e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 15:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785277328; x=1785882128; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IHy4snm+2Ap6hGsU5IBuSKkkDxY5ms1DSklRBEiH3h8=;
        b=GYozNiVaCQhJsPB6+slVGJjCums45mWKPK7HhKJjpnFtor7X5C046TsoUucz9vXdha
         Hmge9VKU2MJjdh8O9JY/rMRnYvScOzHIvCMjpo5ZgFr6h1vTuQ718z/bPA5iN9Ntd4G0
         F2rZ3Ikh/PDaoJdY2UN8T/YW1Gxnwg1HWgHRA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785277328; x=1785882128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=IHy4snm+2Ap6hGsU5IBuSKkkDxY5ms1DSklRBEiH3h8=;
        b=K90ZiL/joP+os1Jfl1UjKWodRYcZSpaHw392hsz2qEIQvlmDhYa8S8ZMhiWEmf60P/
         0Gtq3MzQvzRZk6Uz79XE1eHP92qEPlnHSDgSN+DPxGqJfLJDbjbEH5D2vQTFwRgXSRFK
         AY7m8dNdFQ8QN8sJDiMQYVDdvvCY1+HfNH7a6yMiKWlyjH7pSTFyi4hQPh9Tw9AvnHP9
         SxmCci0TNHr9mE3i+h9s9Vc8MTkSfUZ/+WRW9uRg7qoIt1h2ZGhAtz1SMM/S3kC0X5Ye
         C2ca2sbeZjzGs87h2dDX7BRH9elonIPkZmFF4NmSmgrYJn/PDOIQS9KYR1yv34BDyxKw
         q40A==
X-Gm-Message-State: AOJu0YwTTNDbuXKBsx6322oSK7eWae6GAVWtjC8a/BeNBsKcs3BqBLwl
	EhNSAfbFaukf9D70VLXx3YTRQQl4PesKqkfeYl0CY2T66UIVxH9jxfmUnVq7aFflDR3jK46a/B3
	f/VSHsdo=
X-Gm-Gg: AR+sD13I+8MqeChCANIovtpl7HXYTR3w++EFqjxsVqMmUD9P/i/0Jd9ZPbtQv0TQgMx
	iSQSJZ974TJqgvzTDs5z0Z0qVbO0rf8vzYZ3nfgn0FyuZ+xlMJBF0ZTNDhW3k7fzds+FROn/zbC
	fH1avfb5pKqNxcWsSsfBWFtbKkTPREyecnRZ6TBkqcCQBbvkSuyGFVXQUa2Bd1tPBr6PYSDiaC5
	WArlvYssKcT4x68eG1E5Xdd0CxZn7J4miyGj1X+wJ9nX0rhTRArv4F6vR28RgeeEm1loHvqBHHV
	r8pQbFxslUsAoxN5+E4k/+UcezcaF+AmkXTjoVQUCZjxQB7mnoVPoIBCjmPdSp096m7btcMHrN7
	XooIC/PdgPAQuFeIHMmi/QnzAuvBOzAi1aivAx0Vb0hOLw51hVQJkKZSV8dIaM5DbP8ZsNpVXYZ
	/Dg/PIOuB9RiFVMICwr/Nx8qez5cF12WT89KQXR+rFwXQKUciV9NeFjba2On5hEtglmtQG7pdvB
	WVi96jo2bepQV5+sxk0gfQzUkjLaQcbjD/9ChpAHw6NN251UQikYVP+YYqT8V4zMHiJyVXY89k=
X-Received: by 2002:a05:600c:8b41:b0:493:a613:56b2 with SMTP id 5b1f17b1804b1-496c653e2a0mr47066205e9.8.1785277327908;
        Tue, 28 Jul 2026 15:22:07 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4976bd6da4asm7669405e9.1.2026.07.28.15.22.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 15:22:07 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/19] python3-cryptography: set CVE_PRODUCT
Date: Wed, 29 Jul 2026 00:21:42 +0200
Message-ID: <f4029c635ce3dc1470352d3d3381d9fef19426ed.1785277157.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785277157.git.yoann.congal@smile.fr>
References: <cover.1785277157.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 22:22:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242210

From: mark.yang <mark.yang@lge.com>

NVD lists it as cryptography.io:cryptography and CNA lists it as
pyca:cryptography, so set both vendor:product pairs to match correctly
and precisely.

Suggested-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: mark.yang <mark.yang@lge.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b721019e0b2ccbaa8de267e14b282c48a5a3de8b)
Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/python/python3-cryptography_42.0.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-cryptography_42.0.5.bb b/meta/recipes-devtools/python/python3-cryptography_42.0.5.bb
index c4573fa6891..10ce753eac3 100644
--- a/meta/recipes-devtools/python/python3-cryptography_42.0.5.bb
+++ b/meta/recipes-devtools/python/python3-cryptography_42.0.5.bb
@@ -65,4 +65,6 @@ FILES:${PN}-dbg += " \
     ${PYTHON_SITEPACKAGES_DIR}/${SRCNAME}/hazmat/bindings/.debug \
 "
 
+CVE_PRODUCT = "cryptography.io:cryptography pyca:cryptography"
+
 BBCLASSEXTEND = "native nativesdk"

