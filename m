Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAB94CD98DF
	for <webhook@archiver.kernel.org>; Sun, 14 Jun 2026 08:03:50 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.105042.1781424225890638028
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 01:03:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HWZsaU66;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-45eedcdaeaaso1527441f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 01:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781424224; x=1782029024; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=82Su2brHJlE1EH7uMukNof51ubNaStXOoA1ieIVdVoc=;
        b=HWZsaU66nZQ2btZniWaY1yTnCX9TNvCSvuXeiDU7Nj47GgCDnyqXDQvOykQyfrHJ7L
         Wq5NHw7mXRGDswZq8FEnHzvfD0OSE2rXKQpcfyJ3U0KPE95VsGEImbNAeCVcAgxt9yMt
         1Uo4Coq5v3udFpQR5rWbSX7dAF+aJ3KwPO5fE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424224; x=1782029024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=82Su2brHJlE1EH7uMukNof51ubNaStXOoA1ieIVdVoc=;
        b=j/D/2lwFAlRl/7A5ImROcR8EgK/jilB8wu2H3goIRYXg9A+1LUVtavB6kHNsxVWyM3
         AY9qUmu4Yc3oK6Zi42F4dOSZDsarae2yn8Tz0MpfIAA7hk5Rqlv8cNJfkdR341BLKTDU
         w00Lx5J5b4jJtSLiL8eqb6PIKnP6grW5dxuOMDqsRaV91fu6KqZJGbGIiK1UYrty3e+y
         R1pyK7vYEJt3MPitfotsv6cX1u9/3WqWk0l+6xh6EcfZuW78gP1o3bhrrQyMgz6N1t3b
         9+EcEQnij8hu7VktErsKlpO+Ppkdk/WD/Wpvf2Etb12G9LpPTGx6Hj18/2dFhi+5Q5cz
         fp/g==
X-Gm-Message-State: AOJu0Yw/6Hr5KSkITMVuGRlwzbo4OSKVa/+o4D7VaZ8mZJY70biY24Gm
	e6+tqotwtWfb2mWgo5a2mD5O0ArRYpo5pl4mFAIxfRtm8Xh2qQA2xvUYxmsxLPvu74sRQJU9NZ/
	Z1h+B
X-Gm-Gg: Acq92OHpthySsUO0pdZC+GOHkbB2nB2Hh3WU6cx+v3jHViLU6ADxSyAMurKW5LMw3G6
	lg+cdjN79byk9YVXOqnaVVfK9yiCcmjeQLT/j2C+Fkm3QFr8vXGzixFMjYBXMP/Y6iUocQ4PtLh
	dq09dpu+OlgzHOXxj7D1nY0KFMvDVooLM2tFIM0yBh4I0Tv5o16evhUKyngeWpZBH4VdTjcAGZ7
	2S2iHuxHJRpsMktIj1Uj4EPritEr7/gTsNpjYiEuE07uBm5FL7L38X9Al4TYfCJNn3QSvZi+wbc
	VCkiIyfXUvGmtcvFCGnF2Mfv+4BfX2yCAtZPIDLQDPgEU2vOlTp8DP9nXQrqlA3oM6FCIPWkFJc
	Pu8HiNjeAUx4oB4PWD/ikbrRpaFwZjTrshIPIkwnd6qenIXmTw/eYlAoBFnHL1Ju/zcJCWd4pdi
	bHWg1+NrdFjTN08bWRJ59v342GaKtpn0MMnU4wTpQX7WDRQkseaqiL
X-Received: by 2002:a05:600c:b43:b0:490:3d62:f5df with SMTP id 5b1f17b1804b1-490ec502d53mr88626715e9.30.1781424223912;
        Sun, 14 Jun 2026 01:03:43 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b23b:4f5a:d2e8:6789])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202edf89sm149999065e9.1.2026.06.14.01.03.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:03:43 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 21/56] libusb1: upgrade 1.0.29 -> 1.0.30
Date: Sun, 14 Jun 2026 09:02:32 +0100
Message-ID: <20260614080307.4017177-21-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
References: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 08:03:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238705

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libusb/{libusb1_1.0.29.bb => libusb1_1.0.30.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libusb/{libusb1_1.0.29.bb => libusb1_1.0.30.bb} (93%)

diff --git a/meta/recipes-support/libusb/libusb1_1.0.29.bb b/meta/recipes-support/libusb/libusb1_1.0.30.bb
similarity index 93%
rename from meta/recipes-support/libusb/libusb1_1.0.29.bb
rename to meta/recipes-support/libusb/libusb1_1.0.30.bb
index 856e32d1c62..caac5ceb57d 100644
--- a/meta/recipes-support/libusb/libusb1_1.0.29.bb
+++ b/meta/recipes-support/libusb/libusb1_1.0.30.bb
@@ -19,7 +19,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libusb-${PV}.tar.bz2 \
 GITHUB_BASE_URI = "https://github.com/libusb/libusb/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
 
-SRC_URI[sha256sum] = "5977fc950f8d1395ccea9bd48c06b3f808fd3c2c961b44b0c2e6e29fc3a70a85"
+SRC_URI[sha256sum] = "fea36f34f9156400209595e300840767ab1a385ede1dc7ee893015aea9c6dbaf"
 
 S = "${UNPACKDIR}/libusb-${PV}"
 

