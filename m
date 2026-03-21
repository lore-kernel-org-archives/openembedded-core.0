Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4C041094478
	for <webhook@archiver.kernel.org>; Sat, 21 Mar 2026 13:18:36 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10732.1774099114288405618
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Mar 2026 06:18:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k53RiW2m;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: stondo@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43b4d734678so2890837f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Mar 2026 06:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774099112; x=1774703912; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L+o5I3bLWzC/ut6XgrArrL2FIfC37GhFSFvHtXDg7ew=;
        b=k53RiW2mKpYjIJCpujyzzvu2swaNxp7avXU7nmbtp1UIGl1446WTpRZ28pvpeG/YNv
         thREN5D8jgp33WyUS4bySAunXS5ZpDPt5Jj61D9koFvvyo6kYFTu03RVfgP9t9joAipD
         WH1kBPkpxdtGhZV7ecoQcA/RA3Ub8QQvTZoEmE2Ufozj0K3WLi62xHpjfHv2JUy8bid2
         Cn1IW/KsDjv2BSIur+wDGKByuG4/Ev7pMCB9DSQGLiybRb/JgmNC83qsGD6e6d1NrrDC
         abrATEHpPs7XGs8I9b+Es80XOztH3zMLtxMEPXKaPYAZx4+4fY+EcK5HUvedlIhY/4ta
         jh0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774099112; x=1774703912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L+o5I3bLWzC/ut6XgrArrL2FIfC37GhFSFvHtXDg7ew=;
        b=aBtOZfq+FKPbhv46NIJQJrUYqg+z7+9UjcFvfJAzxEevuro8sD6o2OrHO7ravIGBNX
         OCYHqfM5sT+bfIyIOL8uCIaC4xGAQHrXRYbzQxHvqX/SFxgfYSvIz/+zgzy4qlLFiBVO
         3ItGS26aaBNxgVtl/DUfNJNQf4eJylTw0Z5p3uAskgvTCr6+77n8uxnSZPEuDPGDXwKe
         wCNj5j7PDdzQVMwKxhUbAYKr52qAx8bpR1/81oSWJAqaaF8/rju25q0QM2Kd1eaPdPrH
         Xes7QHhU9xbqEJpwGMyIsfQL7NpEHrhPKiYpbOTJNzyMFmNcShr6G8ODgAM95WnBzPKH
         YvbQ==
X-Gm-Message-State: AOJu0YydXSjS8okqknAx83umD4cXi5HqdoinavHL5i04NfRBEXYQwpLO
	Zl8Qssqr3BOFEEBxmD1Y5tXsJ3M1KeLmUz+BY+2P4z45XOR9fl6IpXpKvP0wBkjp
X-Gm-Gg: ATEYQzyF27OunOB0WyiPg5M1zQqMmg6Xxqag5lhLdFDfWkCikeP8xfNSoS4Qi3PE+bn
	gYLhckDU3QiCqTBRejw+U1Dq+qXw1KjAw75Rm7qXnmJT7B6bz5rUDSgFTTNQeVeM2SZCfrCl/Y7
	IO64nnkb/PPfXhGjx77yrcS8CU4AnPpYKPm9rYWqmh+ZXtmUifAvfU+KgTwUfFI1Ci2DZOqdMg2
	rVqKB7oUIL8IJlw0+7wOag4pYRtiMAH4Uuug7tWo09KUamZcFeWxzIlse2IiOIv8qHVGgXaN50f
	H0YEy++ZXX7DPR+U7JPCeJ7qAFmAryI+oKMx90Wu64bIXWKR26/mT/GK+Jg1UWRHYuVofxr/mYS
	y4qDNIU51mlqKyL0nrxScHii8C+CCsrCnirbg7ARuFHwGGudlgn7oJoZn7QGOCNB7e2e49SEAkp
	FTxJF2HWfXe591gBkR2AGZ+ko+yoQixNU4f7M=
X-Received: by 2002:a05:6000:4381:b0:439:fd13:5c4a with SMTP id ffacd0b85a97d-43b64234891mr10292697f8f.6.1774099112105;
        Sat, 21 Mar 2026 06:18:32 -0700 (PDT)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644bf1c5sm15004285f8f.14.2026.03.21.06.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 06:18:31 -0700 (PDT)
From: stondo@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ross.Burton@arm.com,
	jpewhacker@gmail.com,
	stefano.tondo.ext@siemens.com,
	Peter.Marko@siemens.com,
	adrian.freihofer@siemens.com,
	mathieu.dubois-briand@bootlin.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v11 2/4] spdx30: Add supplier support for image and SDK SBOMs
Date: Sat, 21 Mar 2026 14:18:24 +0100
Message-ID: <20260321131826.1401671-3-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260321131826.1401671-1-stondo@gmail.com>
References: <20260321131826.1401671-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Mar 2026 13:18:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233659

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

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


