Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFAA4F4610B
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 13:04:14 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16993.1774271047505210944
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2026 06:04:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L1db9tKx;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48374014a77so40736225e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 06:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774271045; x=1774875845; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2jpHzPAfrUAtKeZW5sUXk1YfZNj4NQZIL820RkQVvtY=;
        b=L1db9tKxahaAjvdxw3Ar+ThZKZKtSdmRnUSX91wrqKd5dTO//dm/kKgznGQRNJ9+dG
         Vc9tqSliVJbcG3o1eNfq/5genE1z1RvXKzPwYn+BIzh4DvxRj8icoYBtNnxDYIGUNgEk
         zCUl8vvMy4jH8WcH7ZqzebG/3SjHEpiOysLiKmBm1MY0p2A5Jss39ipaWkCEAzpWsHgi
         7ZdAbMKrkpvlfxEoIpav/sfFQHN+SgggZKl1Sj5d1PaZxUUedhBBg+mo/xhfWQU2daDT
         Ks0R+c3PzsUXvM4latidNswFs+l/ugXrvepN9a4wDFKYXhQhGW/1GGlGz6Kyl0GZg9/5
         J5Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774271045; x=1774875845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2jpHzPAfrUAtKeZW5sUXk1YfZNj4NQZIL820RkQVvtY=;
        b=oma6Hn9hOJl1yyymCTUoa67CayizBj6aLgTDNsL55hOQFyX15M7jk0lT07miak0H5R
         Ovnha1OedPCxgTn2RZDuC1Q5A/i9Gb2LnLYOQFjBdp/DB/m2AkvkdVVOPAhRVM9v3w6o
         SIKzKmqniGK/h8arjV8qxnkuR6GFXYaPWFbIXeimcTe98UsMovBAMyVMjnmfNkeoSCdf
         1ZP76+ZNIoSTWnQOaro7A1ORKFdKREdS/RMQJz0ifPVSkmfFw+5KuzN6OBeyjJV/49Y7
         pu4WXps863z27MG7AnyvKkVLMIFTXOwsGha5USKQqx4OM5diSbOS2Cnm20Y+jZfh0AL2
         AL2g==
X-Gm-Message-State: AOJu0Yw12qmrFdxY6el9TOkz4fVrLoMegvMFTp5Q5c9KUQygyMGJptBj
	tP2KDlrqILiHmQhci6/EumIrGU355yUUszdbZMvXxOkeYE2jjvQiciu+M/U8AYEY
X-Gm-Gg: ATEYQzz3z8AJQsorRiO092+DfFd82d01T95+1eIih9DnXtHp6a8gsI5W5BXaMJCQfhd
	7Cj/dOKGOrBUocfRop2ZjMGdH2DMD4ydKFkfmNg99N8dlx3jJdZe1kpaml1Vl9mMTwsGFkI+skz
	I8uzKAsoWV0j8+BXkSeMJlX4omIvQsrqxPsrSpmVlTqcn18qElMwPkuQMDs+KvqfSiw7THD0nqn
	DxNzbro2iXifNv7nK5hH8yEW2g92rsp4aVAk6drm9MIxXAGHDEQGSDODdUH7ouOEC7ZLA5u3MGk
	ujTmVJLJMDf2l9+u3u/cVNued7bfb8zZaUOoDTVtojm3sBu1I7MFF6MN+/9+Hton3wmoTvYPMX3
	zKws5mE3qRfqUXNqxA5c2QgJjkaDv+tGOfPn1GQc2dyC1vD1t+xbeKb+6S8yfmLKd/+9Q69/wAN
	Xl1GzGF02H/kA0Clg1P24QDTvw/erlZgjmAPRgA1wJ6l5zcZLeQXRB
X-Received: by 2002:a05:600c:468b:b0:485:3a27:a960 with SMTP id 5b1f17b1804b1-486feb5a4f8mr182481925e9.0.1774271043801;
        Mon, 23 Mar 2026 06:04:03 -0700 (PDT)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe7e2665sm324609665e9.6.2026.03.23.06.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 06:04:01 -0700 (PDT)
From: Stefano Tondo <stondo@gmail.com>
X-Google-Original-From: Stefano Tondo <stefano.tondo.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	Ross.Burton@arm.com,
	jpewhacker@gmail.com,
	stefano.tondo.ext@siemens.com,
	Peter.Marko@siemens.com,
	adrian.freihofer@siemens.com,
	mathieu.dubois-briand@bootlin.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [PATCH v12 2/4] spdx30: Add supplier support for image and SDK SBOMs
Date: Mon, 23 Mar 2026 14:03:48 +0100
Message-ID: <20260323130350.1177721-3-stefano.tondo.ext@siemens.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260323130350.1177721-1-stefano.tondo.ext@siemens.com>
References: <20260321131826.1401671-1-stondo@gmail.com>
 <20260323130350.1177721-1-stefano.tondo.ext@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 13:04:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233715

Add SPDX_IMAGE_SUPPLIER and SPDX_SDK_SUPPLIER variables that allow
setting a supplier agent on image and SDK SBOM root elements using
the suppliedBy property.

These follow the existing SPDX_PACKAGE_SUPPLIER pattern and use the
standard agent variable system to define supplier information.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx-3.0.bbclass | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
index 7515f460c3..9a6606dce6 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -124,6 +124,16 @@ SPDX_ON_BEHALF_OF[doc] = "The base variable name to describe the Agent on who's
 SPDX_PACKAGE_SUPPLIER[doc] = "The base variable name to describe the Agent who \
     is supplying artifacts produced by the build"
 
+SPDX_IMAGE_SUPPLIER[doc] = "The base variable name to describe the Agent who \
+    is supplying the image SBOM. The supplier will be set on all root elements \
+    of the image SBOM using the suppliedBy property. If not set, no supplier \
+    information will be added to the image SBOM."
+
+SPDX_SDK_SUPPLIER[doc] = "The base variable name to describe the Agent who \
+    is supplying the SDK SBOM. The supplier will be set on all root elements \
+    of the SDK SBOM using the suppliedBy property. If not set, no supplier \
+    information will be added to the SDK SBOM."
+
 SPDX_PACKAGE_VERSION ??= "${PV}"
 SPDX_PACKAGE_VERSION[doc] = "The version of a package, software_packageVersion \
     in software_Package"
-- 
2.53.0


