Return-Path: <colinmca242@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1DCCEF99E7
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 23:01:57 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1788.1771023717149720055
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Feb 2026 15:01:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UzYIQD+v;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: colinmca242@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-40ee196dd78so942545fac.1
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 15:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771023716; x=1771628516; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SztaHI7Ju36U5e5JAwpJQi3dQzaCsQNLTNCriRbBw7g=;
        b=UzYIQD+vXf895hgfCRAWTjJJ35nnIxrW5EomdAsNsFDELo1oxyFc6LnRb01dCbfCDA
         9JJzQzLzYCYIxxFP1T1xRArjJ3dbWbyIFIo7Ih+8WsgVRBZtncx6S87PQGW+k4DK35fh
         N1M84af5C/XvWHnmBGN5S40CRBLYCSsXinImz5wH3J1k07T1fU+uAne00mOVQdZ6Omh2
         4DwRovviIAcLWjt9OOV2g1KEnUGXFjn5HqCER9bCDBPfkga8srVMPIJnHibm6b46cHfi
         XPjConcTQMEXMKU7yRtuejpb+J0xRXnGMk7LvBu1kAfqW7y2W1wrLItRnb1Q2R/15YsB
         h5FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771023716; x=1771628516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SztaHI7Ju36U5e5JAwpJQi3dQzaCsQNLTNCriRbBw7g=;
        b=kdP4aeGM6yZGljz0+BgB9CutCxglELoeG32ZVeY3lb5FuAc4P4Suii8Y92tb+hiVaP
         ASst1NC6seDhb5xIQ5NYZ4Xm0Lgcab5lSsXze+OnKTvpYL7LuhSnmOZGxl5mI7q5se1S
         xvxGpZXDcd0ZzWiJuNGztYR0AuIg7SLFP1ho/QN/VrSlDW0qGrnAZu/1iSm9xRDWoxLm
         cwObwzFVJGSZMDwFNaedfeAhjGTE4vX5TRRtvmxPK1kclxBxVkgZ7GJWxs+Et2Cx53R7
         7RefGYV8f+PvUyORYIjNiBssFRlCBTFOp73t8J3r8H3jNTkGEQfKZXSVnQWpv29CDq3a
         fhzg==
X-Gm-Message-State: AOJu0YxpzzC/aVmX8OOXfAbU6ugRmOMyIbhNNnSz4cjbi8ABjOoIxieY
	bNbppxvGM8YVL0weeMDfySf+s8QdIhUohxlyXS0n/QGy3KAPd/gTtlHhUxTUqg==
X-Gm-Gg: AZuq6aLggrLWIyIDmBd+HQkV1z3DbUVUsDR8LO7NNP7zfPjuVWSadkL7MNpqqceIF7U
	pN2WWEABTtZRjS9HrGiHzranNO9+J35TiQ3h8xYh8O4x0zRBn9oOTAM1uguo0D1pv2Ux1DFGlPZ
	HR95PHp4JWz0RKjsR0qHPfIJ5zza8rHcPOWpXXoD5jA4GWQcL8+C2N2QppknraPPm4SHhM7zgaB
	iUEdSjCu0fTPWDb/ROfHT11AezSx1SxQ0AV1RveqKA9T9WJ1bl2w3jko5399F2v1oqQDyeZ+f4T
	BO2ZgPPYgi/aRrU5/BvW6Vgo+CS/WG/RXZZzdLQreQDwTZFw3rNXhF8wyW+4yfQubSpt6yj5pOq
	gI/gOX5CTzWaZeCCMim8utMtaAMtfpev7iVfvwnSWtqjExm7cFe+lDllE+SBcT5chTGAHyMSjqW
	mdb+2ppjlWHreDtUFukZM=
X-Received: by 2002:a05:6870:f201:b0:408:6661:d517 with SMTP id 586e51a60fabf-40f086eb67fmr993534fac.4.1771023715719;
        Fri, 13 Feb 2026 15:01:55 -0800 (PST)
Received: from fedora ([136.37.200.217])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-40eaf101db0sm8092157fac.12.2026.02.13.15.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 15:01:55 -0800 (PST)
From: Colin Pinnell McAllister <colinmca242@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Colin Pinnell McAllister <colinmca242@gmail.com>
Subject: [PATCH v2 2/4] openssl: Disable TLS 1.0/1.1 by default
Date: Fri, 13 Feb 2026 17:01:28 -0600
Message-ID: <20260213230130.757732-3-colinmca242@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260213230130.757732-1-colinmca242@gmail.com>
References: <20260211184917.1045939-1-colinmca242@gmail.com>
 <20260213230130.757732-1-colinmca242@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 23:01:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231142

TLS 1.0 and TLS 1.1 have been deprecated by the IETF since 2021.
Disables support by default in packageconfig, requiring users to
explicitly opt-in for these deprecated protocols.

Signed-off-by: Colin Pinnell McAllister <colinmca242@gmail.com>
---
 meta/recipes-connectivity/openssl/openssl_3.5.5.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.5.5.bb b/meta/recipes-connectivity/openssl/openssl_3.5.5.bb
index c0d02b617b..6b9ccef0b5 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.5.5.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.5.5.bb
@@ -29,8 +29,8 @@ PACKAGECONFIG:class-native = ""
 PACKAGECONFIG:class-nativesdk = ""
 
 PACKAGECONFIG[cryptodev-linux] = "enable-devcryptoeng,disable-devcryptoeng,cryptodev-linux,,cryptodev-module"
-PACKAGECONFIG[no-tls1] = "no-tls1"
-PACKAGECONFIG[no-tls1_1] = "no-tls1_1"
+PACKAGECONFIG[tls1] = ",no-tls1"
+PACKAGECONFIG[tls1_1] = ",no-tls1_1"
 PACKAGECONFIG[manpages] = ""
 PACKAGECONFIG[fips] = "enable-fips"
 
-- 
2.53.0


