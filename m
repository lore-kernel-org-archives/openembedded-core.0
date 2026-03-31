Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89598FF60D6
	for <webhook@archiver.kernel.org>; Tue, 31 Mar 2026 06:57:33 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14328.1774940247484968470
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2026 23:57:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=lIaed4of;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4852c9b4158so42028915e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 23:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774940246; x=1775545046; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Z5P92f/WBPWltkhEdKSyzPt4B8v/iLjxe5CiaZdZIQ=;
        b=lIaed4ofp3gu/tMiXV5tzV2J1aKEYUEpFOdYotkbp5P6MWzcUqn9HRM7CI7mBP9D0F
         cJ+x1GU/IRke+7KQAazy0h1s1qmdhUmnypnDsBx0CQ4myu1RSqbdxA9LEb+rpOJnQPT2
         QyTY/1ieyX3Xo2A4TgaVl9LDL/qgJVk29/A/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774940246; x=1775545046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2Z5P92f/WBPWltkhEdKSyzPt4B8v/iLjxe5CiaZdZIQ=;
        b=Y4sAt7CNqrkuavCaHNTyUWAl69+DgMeXfLbLw1N7WC0+a+F0usF/fisAFZCr9HsP90
         31f1kS9WbGa6mjDSxWf5fMudizG+UbkPfqeTHOpvhIW61He3NUhdjFnPZkjJmACkwPAw
         E79ahoQrIynU9miEfLr+ReKyc47m2oRdhf16MyFCmERWk/vljC4NCn7Na1pmj2+AmutN
         s++2mL3SwilcDXbBNfkBefEDylLf6dW9qc+DlZkvYaAHai/l//rnfiPUElyL1Ifp2VYe
         qtt8XzCJxDnyGTVnIKEdCWB0JXwqQDIhNEvCcPATynMKQr6FJpXTkN2gm+CZz1AxWrPi
         u3bw==
X-Gm-Message-State: AOJu0YzgjQ6SQEbN7VD4pTa1rQQOFhZAbnx49RZhiaMhaiJhKi9FCKo7
	VoFkci5vQaXgyfciXyv7oZaQ6V2poo+atnLbYbtDtfpCaCLvaljWlijgPKczdexWHEvHB/JoYUG
	KkKepa1E=
X-Gm-Gg: ATEYQzx7gEsvqOTmdvndk6qSyPIlwyHHbOzPyjq9QnvcuZi1hcaIDht9IwOglxUyHcf
	pYf2tRP0cO4UPAeFn7pRfPSecJeRzZbPVs5ALsvh8obC86HbtpO3lDO18C8e5iNu5izfs6HAOHo
	6Qwc3WCHjWrmvC+mJKLbkwSw7Z4nX+L/igYfWDNnlwqc1pP5p0woImhnYPLAnKe8K765nxp8ePP
	uEJ4bzC/8p9qCWZ4lCO0gtwN+oVPK9ewMNEfpio2ZlPUl0V8Eu/9FfCfUxBZ9I4UBvNF3CbD8wd
	bHit80vYTSkk00lidd1ELsND5gkMkML/lHQWQg/uXwhJRHO+gVzGIpNSnj0TutobfErD5XAnk1V
	Gwfs6g+SAKJGbocqZbrElPsio9rOS7bXIWIKSH0Vc7p+SCdbIGi40GiHexECdy7WHFxxZVYc7hj
	uMKP1+/6vClhQsEltxFElUoBADRTFTo9EUti9UNafVmzQNjePybDr4lTaL5aLqUJC/T6bBxhFF2
	vRBVsJ/7xgX24AYJpIRf9SD5rk=
X-Received: by 2002:a05:600c:8b08:b0:485:303b:c50a with SMTP id 5b1f17b1804b1-48727d73611mr249071005e9.13.1774940245567;
        Mon, 30 Mar 2026 23:57:25 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887c8a546esm11016455e9.5.2026.03.30.23.57.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 23:57:23 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap v2 1/6] tzdata,tzcode-native: Upgrade 2025b -> 2025c
Date: Tue, 31 Mar 2026 08:56:58 +0200
Message-ID: <7255b0ff315367abb5f0c6f00974bf30f7861d1b.1774939987.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774939987.git.yoann.congal@smile.fr>
References: <cover.1774939987.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 06:57:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234263

From: Paul Barker <paul@pbarker.dev>

This release mostly changes code and commentary. The only changed data
are leap second table expiration and pre-1976 time in Baja California.

Full release notes:
  https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/TAGXKYLMAQRZRFTERQ33CEKOW7KRJVAK/

Signed-off-by: Paul Barker <paul@pbarker.dev>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 452334219309793ad74abd6ff390dcb06cab929b)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index f21bedf4fc5..35f22d5a15a 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2025b"
+PV = "2025c"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -16,5 +16,5 @@ S = "${WORKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "05f8fedb3525ee70d49c87d3fae78a8a0dbae4fe87aa565c65cda9948ae135ec"
-SRC_URI[tzdata.sha256sum] = "11810413345fc7805017e27ea9fa4885fd74cd61b2911711ad038f5d28d71474"
+SRC_URI[tzcode.sha256sum] = "697ebe6625444aef5080f58e49d03424bbb52e08bf483d3ddb5acf10cbd15740"
+SRC_URI[tzdata.sha256sum] = "4aa79e4effee53fc4029ffe5f6ebe97937282ebcdf386d5d2da91ce84142f957"

