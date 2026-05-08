Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EECA8CD342F
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 07:12:16 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8155.1778224336279541993
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 00:12:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Gcb6xLqB;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-45297094718so1336005f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 00:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778224334; x=1778829134; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gMB5OfmAxcl3j8ry3TQG+LXR5PhFVOTwV41akQALLIs=;
        b=Gcb6xLqBHGENrjPtYmI2jVm5oDhNuqDQSCsTdQqxCrQHEeFaacz8EY4ukNbmF0GoQj
         uuRLNePJxqfPJLHSKrgxUSBJtiuAbkwisc5wPPv8nWga2ZIENeYAkqYoARvdsaYFcem7
         Zaz51eDDW+Y/K7eardhEjJbZ8hdqBkI7/ae4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224334; x=1778829134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gMB5OfmAxcl3j8ry3TQG+LXR5PhFVOTwV41akQALLIs=;
        b=W90B4EzMOmClecESrp2i4k+dAcOGjYMhGIPQARZtffR+64rWIq99ej94c6UKTWKF3n
         K0iFWYWGKUAuXXy6KeMWrkottApljxgBvAa8ylMz3hP7As3uVTdYLbMNQ3+CHsW219DZ
         67RIULu1L4wdBaDn0uyUTgYV7dY3BId+PJhqrrsdhkUW7rtx8/ZDbOdn3SrVIApDLbNP
         1HptiTdaSDPeXQ1hiKigWaIYNYK77Viwoc11am0Oi9L1Nn3JowFAhbbmYHy5QSrSEnXg
         tyc8fEnbbHvbFHiNgTTAbJmbddGdsP+eDD+0cBKYu+wdAKfyf9M5HZOmx18FIC9MaoyK
         ALtQ==
X-Gm-Message-State: AOJu0YxQcpi/lM2nOyduhu/QvcGz8yTOJmxXROPMNJZPQgzVNInpKJEr
	XlwG73nfWejz2X0YyYcy1LRJ8dBoSPzsjm7mPGidcDCWOwys5k9qB9bvmdh3MSSSPvItdWt4tMj
	kE5u8DTI=
X-Gm-Gg: Acq92OFeD4R5ODcbWZvrU+92Ix/Ybtynegj+Rm8uVgA7WKT1UcKk3y/FS+jz0uHVvYQ
	2sAaBuNdxsRQmxAziGhy+V+WlInTFF1JuqBdfmMYj1z0rC2wyw2koCL7RaVey66IIC/b9nDcmeF
	8gabimC8bFecfXYshavQb09/XhQjbJWLxvayGWypArhn/3i7OyCUuPdj0DyHWDpZ4jRXsN+3qVQ
	GuxEzHGUQvXngWQQBnwb9qrDIs4Dy3CwmPM32EDEP0uglN3ULA6xCnneNPYII2b028ivzBi/iXG
	x04fmeo4Ro48NUMVypx083wJnbnRndBHquK8HhB/ZPjrbkf7lAHUPPE3gk53UK475f5p2CWvFcl
	t5JwN6/1wTObHTB8LvmRR0hU+SiK+AH+aFaEPcjhfVY8vmuu8kCCr2TsyqPCuC/ADVsao0aEyqj
	ZzEPDfe4ISwljpzOxORvzfdjQQr2KjyuFELpQfqfYMHI9+J4kQUKQ/TZpe2jP3GDTO3oZ7R94Jn
	ciWzfNGG3GO+JJymk+eNnH3kjw=
X-Received: by 2002:a05:6000:22ca:b0:43e:a70d:7622 with SMTP id ffacd0b85a97d-4515cf11e8bmr18330423f8f.22.1778224334102;
        Fri, 08 May 2026 00:12:14 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6be40sm2415545f8f.12.2026.05.08.00.12.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:12:13 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 07/52] gnutls: set status for CVE-2026-1584
Date: Fri,  8 May 2026 09:11:00 +0200
Message-ID: <47f54c2b82fac1903e3e6340dc0ae154accfa72d.1778198557.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778198557.git.yoann.congal@smile.fr>
References: <cover.1778198557.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 07:12:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236649

From: Peter Marko <peter.marko@siemens.com>

This is a version-less RedHat CVE.
Per Debian security tracker [1] this is fixed in 3.8.12.

[1] https://security-tracker.debian.org/tracker/CVE-2026-1584

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 526972e5fa9c41a73c30eb6351bdf699784a5384)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-support/gnutls/gnutls_3.8.12.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/gnutls/gnutls_3.8.12.bb b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
index 72184280122..8554ab943d6 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.12.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
@@ -107,3 +107,4 @@ pkg_postinst_ontarget:${PN}-fips () {
 
 CVE_STATUS[CVE-2025-32989] = "fixed-version: fixed in version 3.8.10"
 CVE_STATUS[CVE-2025-32990] = "fixed-version: fixed in version 3.8.10"
+CVE_STATUS[CVE-2026-1584] = "fixed-version: fixed in version 3.8.12"

