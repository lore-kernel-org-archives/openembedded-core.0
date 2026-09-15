Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA6CEC982C2
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 00:11:03 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12267.1789431057994844686
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2026 17:10:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=T6ugvIx/;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: michalwsieron@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso2690820f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 17:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789431056; x=1790035856; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5d2atrChUlizI+1POPAYdQwjRwBVb3jDnx7+hmNxu/M=;
        b=T6ugvIx/njCpLpxIrYEbG/3i8Luo4wWvuqguga1qR80i7+ejrXyzFdHYvAOZQaCcMW
         TrL/Z83tNpIbx8Q2X1/hDHNWmGx33OBn6sh5wqSgY2erfCwUmGjTJ1jKWCClKPyq4ya7
         R/yxhl+lC0neCrQXP+18Mu4OcPaWEglVgNJWMGW52FSYur8AzPxVGMPud8YZA2f43G8t
         mfglnrWYD6dmTsXn7Z0qUphhlbEO5KE3rCs1rjRsw8Xyz+0giE3gOCuAoF3q5PASxkSI
         /DXyNXayMDjuqPsuves+ZXTVIZzpmwbpidBiOWCmCpFoupXqN/hnXN/71fw3zozOx+/7
         P8ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789431056; x=1790035856;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5d2atrChUlizI+1POPAYdQwjRwBVb3jDnx7+hmNxu/M=;
        b=il6L12VPufpaJx2DaUWY1QrlEbve8URKp2MMllDk+91IW6VIANJJc9P1d271w0xnMS
         CXRRC978LO5qgTiCFJjLCdHvUVieDPNJLLZdbaSzxAfk1Po0KRJDKpTmVFPHg2FEdEzl
         cu2hWLVw3zUpLOG7omtqRuMSHzWzh366zNstUtKRaCsQE4gnrdG5saFWb0CatvSEPMQT
         U9Ygfj/dpt8Nn/OFfWYmFzgCtcD+CjNliULP9czeKSirVEBGTa338gQr0G8BajxiYq+r
         iPYfQb6NL1sL8oJGww4CcgjQewoh7bzB3pfBhpzQnMwY4/b77RASuzVkpFd6GWMp/B3S
         g50A==
X-Gm-Message-State: AFuF++n5xp2QVQjBmhM2jKtlzCyqC7tsvlmWp2WpjrxugHxJ3i+nNfZW
	Tev0tk51tHz50zp285TDLt6eROLVwW9qHvrJ+uNthHGq/6283+Q2cV3w
X-Gm-Gg: AYBFou2q/nSrO7+59ytmzBSpK8rUbt6SBu855GyIOa5Im4sD36V6WFojlW7WCnpEOFd
	3pTdzqIpq5XBBaZw5gP6enJEvNXZQdVUQW87Ft/dcaiJFJC3cT41PuIGld4Ae48phGgmcqbj/B8
	cW9DfADlazt5xxnk1e9BoX5bBvslCIyjQprUZ3egL8WeZgw/3oLXsWtDpJHyq7qRmrGD6YzwSuo
	KqSx88gG0RGnxK5phGcFYaWE+IDghLvydbYfIhcRJwFmUxr2a47CGbtJQdnsIdtks3CAXC5lN/J
	uNBPnw5bcun3UFoLM0c085oEqgLI4YrZqR+wV69pINR3MwOR/mJ/1lcttWH4SuFzeqqzo6uoQIb
	Me61K5TNyS7Aw+o2YZtkP7US5uZdqKu+ql3H6YcmWtmO3UcK770Fj+6cxO8nk0BwwNnHMyHMt50
	sHmmRRcCtQ7QsGbWEtmydcRyki4RrR8eAajZwvmfxsAiiCdsIqTWAJDB623porOKPcJeaEG0Kh5
	g==
X-Received: by 2002:a05:6000:2385:b0:485:8c16:a34b with SMTP id ffacd0b85a97d-48702b16d05mr5168800f8f.35.1789431056123;
        Mon, 14 Sep 2026 17:10:56 -0700 (PDT)
Received: from [127.0.1.1] ([193.28.84.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ed106sm29287221f8f.1.2026.09.14.17.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 17:10:55 -0700 (PDT)
From: Michal Sieron <michalwsieron@gmail.com>
X-Google-Original-From: Michal Sieron <michal.sieron@nokia.com>
Date: Tue, 15 Sep 2026 02:10:37 +0200
Subject: [PATCH 2/6] libmicrohttpd: Drop libgcrypt from https dependencies
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-msieron-some-packageconfigs-v1-2-44dcf1145d3d@nokia.com>
References: <20260915-msieron-some-packageconfigs-v1-0-44dcf1145d3d@nokia.com>
In-Reply-To: <20260915-msieron-some-packageconfigs-v1-0-44dcf1145d3d@nokia.com>
To: openembedded-core@lists.openembedded.org
Cc: Michal Sieron <michal.sieron@nokia.com>
X-Mailer: b4 0.15.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 00:11:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245801

Old gnutls indeed had libgcrypt dependency, but that was quite some
time ago. New gnutls versions depend on nettle instead.

Signed-off-by: Michal Sieron <michal.sieron@nokia.com>
---
 meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb b/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb
index ba8969d649..aab3041280 100644
--- a/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb
+++ b/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb
@@ -18,7 +18,7 @@ EXTRA_OECONF += "--disable-static --with-gnutls=${STAGING_LIBDIR}/../ --enable-l
 PACKAGECONFIG ?= "curl https"
 
 PACKAGECONFIG[curl] = "--enable-curl,--disable-curl,curl,"
-PACKAGECONFIG[https] = "--enable-https,--disable-https,libgcrypt gnutls,"
+PACKAGECONFIG[https] = "--enable-https,--disable-https,gnutls"
 
 do_compile:append() {
     sed -i s:-L${STAGING_LIBDIR}::g libmicrohttpd.pc

-- 
2.43.0


