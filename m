Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D216C7EE32
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 02:29:41 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.79.1685068177522902176
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 May 2023 19:29:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=utXUoK95;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2536e522e47so396585a91.1
        for <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 19:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1685068176; x=1687660176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PAVv+4xH1p9AN+or8si4V4c2VY6m6eoMjwlUO+RYUaQ=;
        b=utXUoK95/53W77q8o5R4KXSmE85paJaOcurqVI7kpQxGflJW5+D17HNjjoURpXG81T
         dmAtPGqJmlyDPM55Aq885L+KuBQxNjDvI1tiUTFYeKFribqkBBLc4jlHhIkheFsjHOwz
         BNTPvjDQH53ixMZMGXa0wYYWpvlCboZDy8RTkb7ITuzpTQeGpR3IgqODlGUCLTDaejVr
         BsKC87okPl3YsbbzKedrwEHOhhDezlo8SqsoXK9Q5KW58lGbrjZAaXOFwTmtGQ9+6JYO
         iW23mcY8X7I6ynvcrU3YcYjXSr+3+l0kEasDZLmLApoWwZSbVsV9e+KXricezKtMFAL3
         4SIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685068176; x=1687660176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PAVv+4xH1p9AN+or8si4V4c2VY6m6eoMjwlUO+RYUaQ=;
        b=Ed3R1j2P+MMb93l1WVS5dmwqx9cIpVDtnPrD4t0S21OxgCca3NHw7IXhAeF0gD6Pgq
         KvKbgGa8t1VH0RLVJUvoO2cBW5YUHYMFtVxJW44ClOy+prW+2l6uW19fhZawIqdX03vG
         /uNOOJ+4eOkVL3PiL0r4OC5G/aHfnjkjexmP6A2gapx2GunQ/1Hcd4ox8BE2A3v+XvJo
         9Oja4bgAg6JuTwwfmpkPwo/UVBQyrWjSVupR1xRSh7aHumN2Y7zdreoBRbJs0tyEvVvy
         coddiWlaT0Eta+CACS/dUw0OwV+LJl5nJMeg1GzaYc2fdHdqb6HNn5Cs1A06jZV4cBzI
         w7vQ==
X-Gm-Message-State: AC+VfDyaj3vL8JmaKI2qxP++br7sxbsrY6GECR1tHmkAX/q5MvZFlIjc
	zXOZOdf+X+S+rly38HoTQr0uhW/hkJLBPfwsaNo=
X-Google-Smtp-Source: ACHHUZ6NMszizXPCHBx4NiiqLQ+DIkqwz9J/NDB6Oz6uHTK02u1njlBUd8af3VwG0UBpdUtN8nXVZA==
X-Received: by 2002:a17:902:ce86:b0:1ad:cba5:5505 with SMTP id f6-20020a170902ce8600b001adcba55505mr1055152plg.14.1685068176633;
        Thu, 25 May 2023 19:29:36 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id t13-20020a170902b20d00b0019ee045a2b3sm2023794plr.308.2023.05.25.19.29.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 19:29:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/21] nghttp2: Deleted the entries for -client and -server, and removed a dependency on them from the main package.
Date: Thu, 25 May 2023 16:28:56 -1000
Message-Id: <619a643f71eceab73bbbe4dacd1eb42b6d6b01d1.1685068004.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1685068004.git.steve@sakoman.com>
References: <cover.1685068004.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 02:29:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181740

From: leimaohui <leimaohui@fujitsu.com>

By default there is nothing in nghttp2-client and nghttp2-server ,nghttp2-client
and nghttp2-server aren't created. So there are dependences error if install
main package.

Problem: conflicting requests
  - nothing provides nghttp2-client >= 1.52.0 needed by nghttp2-1.52.0-r0.core2_64
  - nothing provides nghttp2-server >= 1.52.0 needed by nghttp2-1.52.0-r0.core2_64

Upstream-Status: Backport [OE-core d2cbe060955c598bd81923ecd554fbe82c17af99]
Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/nghttp2/nghttp2_1.47.0.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/nghttp2/nghttp2_1.47.0.bb b/meta/recipes-support/nghttp2/nghttp2_1.47.0.bb
index becacd4502..90d3286ac6 100644
--- a/meta/recipes-support/nghttp2/nghttp2_1.47.0.bb
+++ b/meta/recipes-support/nghttp2/nghttp2_1.47.0.bb
@@ -23,17 +23,15 @@ EXTRA_OECMAKE = "-DENABLE_EXAMPLES=OFF -DENABLE_APP=OFF -DENABLE_HPACK_TOOLS=OFF
 #
 EXTRA_OECMAKE += "-DENABLE_PYTHON_BINDINGS=OFF"
 
-PACKAGES =+ "lib${BPN} ${PN}-client ${PN}-proxy ${PN}-server"
+PACKAGES =+ "lib${BPN} ${PN}-proxy "
 
-RDEPENDS:${PN} = "${PN}-client (>= ${PV}) ${PN}-proxy (>= ${PV}) ${PN}-server (>= ${PV})"
+RDEPENDS:${PN} = "${PN}-proxy (>= ${PV})"
 RDEPENDS:${PN}:class-native = ""
 RDEPENDS:${PN}-proxy = "openssl python3-core python3-io python3-shell"
 
 ALLOW_EMPTY:${PN} = "1"
 FILES:${PN} = ""
 FILES:lib${BPN} = "${libdir}/*${SOLIBS}"
-FILES:${PN}-client = "${bindir}/h2load ${bindir}/nghttp"
 FILES:${PN}-proxy = "${bindir}/nghttpx ${datadir}/${BPN}/fetch-ocsp-response"
-FILES:${PN}-server = "${bindir}/nghttpd"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


