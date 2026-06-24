Return-Path: <antoine.gouby@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89AA8CDB479
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 09:57:10 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3433.1782295027869208680
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2026 02:57:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fmKZQfkU;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: antoine.gouby@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49258ac7294so5696525e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 02:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782295026; x=1782899826; darn=lists.openembedded.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IEYEuC+4KNLNU2dEfhebrEJwrP0SUPQCaTnchep7q3c=;
        b=fmKZQfkUwJdafnMMbRZMpofzMrYJIF6VNIxhTKer4JS77f4DUSSVuMt6dP7/h+kYft
         dZwkxKi6r/TVvZDO3tWKBCX3qJJntT+V107GkDSxAsTpDp/PYlgwjxiUeRa6R7I1O0oN
         jSGVZ/wa5Tru1sKRTp1Kqgs0HEn2lyK8hDtv0yAqxFrRSV9HcqsntYcoJXIHPZx3VUdh
         U+gm5Z8Avt+UvvrQ8VdaErJzZ08PNmqPBF47V/lOHPYo2Ml59aYsOpvqGOWSgr/Y1i4X
         So/KYyprdqu3wAF5MREzYY1tM2U8aKNZ5cBvScYBm5sw75hk4J7Djl6+KSV+FSP4OT+r
         /3TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782295026; x=1782899826;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IEYEuC+4KNLNU2dEfhebrEJwrP0SUPQCaTnchep7q3c=;
        b=mroyYmfHJq5aZCZ771JfMfNlRYMO/fMYD6i1VOTCAAZ2s6RqbnnmJmSGc0LmkcsqqL
         GI4txYE14CYjRpJj3RheI1aATp7h9rI29Kf5DWojxgdjuG2RrXNP56JODpY+9LKOXMKK
         p+4msxqKaRqacPKj5xVaD5mhoTg1iii3eY2WwvCgY/fsV6B8gi84LwczCCQkqEMpmUBv
         vLeSwws8Jh0tViBupnb+pcsMBdmbGJw9WHQye2yyzTHvMo3jQI3vTShcJ2e5TVsdR8tx
         b1IPh+bURY6BCSbx74NW1+xw5EZqzjS+s5nkbO/ZGFCN7Flxz3gOw+kbcBSzHX29OxNo
         vXwg==
X-Gm-Message-State: AOJu0YxpnZUrfz05sURJa70Bs+kG+TeIeAMlIM7LFu0FqNdTnhKDya91
	JARSHehsIjCGW4e4+CDAXcBYkY9O25aXpZZVWPk/j05NfAXezk8CLmJLySze4Gyl
X-Gm-Gg: AfdE7cl2kYhgcbyCX3iipqAeVswPshIVyNHRpn5aScAyEKunmm6Hxft/R3zocWKtK8D
	Lbqoi1nDDRoyYjwUujD9uDWCBb9J8xOkROYIlimBmgOq2OJOfdqxIBgVT/Iyo952JS4d3lrhdAK
	9kZpOcoZ4uDFn/lIoFflzOrs6VfX1cPKhmNS1BayL9WlVfToi7/3riCHfN+0Hp5En6jutAAJ/PQ
	TqX4jpFM9ipSEeRIFprQe84KQyQjzbpuYBpbZDnhww/eK7WwjbuUqGx9/E5LdDVtBEUQQZpoa25
	C4wvVIg7FRzF+MwtkJDqWP1eIx+BMaqWd4r4EXjj0tuBq0av1Nw+0WtrP1VFvzchqOcaAWXsO3r
	H9CjV4lJaEsm0LDF++MUAtIL4t1GmQ/XlGbTUjz7vuJzspOhoK3U8FoWDcN3bv6+enKWYe2h/Zy
	e555fVoiwOEJDUqrtmkRrSQgHuY2TU+KwmHqmdtva48dZaNMBo6gF7HwOrq2QGfXdL+p17Kg0+A
	CZAy+WGLvWJpu1zclkH8jxr9mgoNsLrsXj3NBY=
X-Received: by 2002:a05:600c:3e15:b0:490:4663:691b with SMTP id 5b1f17b1804b1-49260849b67mr33382995e9.7.1782295025748;
        Wed, 24 Jun 2026 02:57:05 -0700 (PDT)
Received: from [10.0.1.77] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1ee01d46sm4568216f8f.13.2026.06.24.02.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 02:57:04 -0700 (PDT)
From: Antoine Gouby <antoine.gouby@gmail.com>
Date: Wed, 24 Jun 2026 11:56:58 +0200
Subject: [PATCH v2] mesa: fix INSANE_SKIP package name for mesa-gl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-mesa-fix-insane-skip-v2-1-0905e0c61457@toradex.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAMAwEvyI5GyhRe/Ar4qHoqkGspQERxL9bP
 A7MzEOGrDDqq4cyLjU9YwGpK5q2EFewzoVJnHjnpeUDFnjRmzVaiGDbNbGgaztpIAJHJU0ZRfm
 3w/i+H/FCtnFmAAAA
X-Change-ID: 20260624-mesa-fix-insane-skip-2e54523e22e0
To: openembedded-core@lists.openembedded.org
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antoine Gouby <antoine.gouby@toradex.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1822;
 i=antoine.gouby@toradex.com; h=from:subject:message-id;
 bh=LdFaZTV3C5uD3JrktGFYrgpuC3rsU6S+U9ff5DEMpNA=;
 b=owGbwMvMwCWm0rPo7MxLN2YynlZLYsiyXvku4ZB0R2RgDX8e93sGIY1zl+M2vVrnccppqXW2p
 6uLCI9cRykLgxgXg6yYIkvGE1VBPoUQWQ+O5mSYOaxMIEMYuDgFYCJ6fxj+R55vU7u2XEVIQzt1
 3rTy0Pwgofsn991uzJ36RlSAKWalOiPDfL14RuMr71xaJ4VffXhUNE7/4QPuVs6W2viq/V8K1op
 xAgA=
X-Developer-Key: i=antoine.gouby@toradex.com; a=openpgp;
 fpr=68E425110E20541D48088363248CA2CD99D2D899
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 09:57:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239483

From: Antoine Gouby <antoine.gouby@toradex.com>

mesa.inc is shared by both mesa.bb and mesa-gl.bb. The variable
INSANE_SKIP:${PN}-megadriver expands to mesa-gl-megadriver when
included by mesa-gl.bb, but the package is always named mesa-megadriver
(hardcoded via PACKAGES =+). The skip therefore had no effect for
mesa-gl builds.

This was hidden until mesa 26.1.0 removed the with_gbm condition from
the dril subdir build, causing mesa-gl to now install DRI driver
symlinks into mesa-megadriver for the first time.

Use ${MLPREFIX}mesa-megadriver to correctly handle both mesa-gl builds
(where MLPREFIX is empty) and multilib variants (where it expands to
e.g. "lib32-").

Signed-off-by: Antoine Gouby <antoine.gouby@toradex.com>
---
Changes in v2:
- Use ${MLPREFIX}mesa-megadriver instead of hardcoded mesa-megadriver
  to also include multilib builds (e.g. lib32-mesa)

v1: https://lore.kernel.org/openembedded-core/20260623-mesa-fix-insane-skip-v1-1-97856536ea8b@toradex.com
---
 meta/recipes-graphics/mesa/mesa.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 67b740f9e9fb..9c398951b6fc 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -347,7 +347,7 @@ FILES:${PN}-tools = "${bindir} ${datadir}"
 ALLOW_EMPTY:${PN}-tools = "1"
 
 # All DRI drivers are symlinks to libdril_dri.so
-INSANE_SKIP:${PN}-megadriver += "dev-so"
+INSANE_SKIP:${MLPREFIX}mesa-megadriver += "dev-so"
 
 # OpenCL ICDs package also ship correspondig .so files, there is no -dev package
 INSANE_SKIP:libopencl-mesa += "dev-so"

---
base-commit: d595615c6a027b80d6f7ea80ab25e85e97b2436f
change-id: 20260624-mesa-fix-insane-skip-2e54523e22e0

Best regards,
-- 
Antoine Gouby <antoine.gouby@toradex.com>


