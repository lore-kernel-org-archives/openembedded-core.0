Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02EDAC38141
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 18:12:20 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.82089.1674238334505199985
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Jan 2023 10:12:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=MaF9Su3/;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id i1so4591284pfk.3
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 10:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x7hGhjN5K1el0MQ35A6PxysOP1eSge+r2wHaRY5kymg=;
        b=MaF9Su3/i5e6zFxkP3EdAVyg+vZhamOFEHvVBsBdDjAJoHHrIJY8mWZK51O6jkt0Xc
         vkORQ91egrp18pqvzZa0FCyxj5pCHH2ftanoSSGqwDxzbU7oOjeWc6flhL6ilAp3vorY
         zDVHGUx7g2Ln9dTepHJXd0mbwxPeYuag0benEmJCBkYehgbdXu3TGu2zvvbvTBTENYPA
         g+r64vx7d+luUJxlcyfJEalGoH0a6e+a5CtG+yYaV/NHHUlhdHFFUVvb7kEZfU7XJ9Vx
         icHsFsSR/9VUJiuCUCIjrVS/vnf31bCp91tk0PNXoITy5Br7fEDOhFSd564I04dYaL6D
         EYYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x7hGhjN5K1el0MQ35A6PxysOP1eSge+r2wHaRY5kymg=;
        b=GZWsDuLtMAFJkiGWOJrVR1AWFuPtu492t96hXioh52sozqSYCvz/y6SoJH5jbCX/vE
         cSIH3cqSnsJ9px2p1Nwq/QVmlmsZ0T5XK6iFHu32Svkfqs33W81WDxLNgjxY6S1wttN1
         z22mvF83ALkSKXM4QJ/vBSvPT0258cI2WCZ35ixWjPabQTS2f9Z7ARn+ZUIEQ0PaAf6w
         WxKSzEauB8Y2dqc1QDzFPBQM+MXGODg003JcQsTGJmVwUfaLpXNOgv2ZPA9cmeecvckr
         fvDgWTKuVVIHswkEFQ3SMO1ltulyxro9FIXZ/4P655cRli6V6CZs9Fkyyjjf/fBVER8v
         +k1A==
X-Gm-Message-State: AFqh2krzmWx34YI7sJShPj5uwDsxZUMj5YMmkS1WvaHKLzT4GQ2ZPiwA
	8H4IboO/QScAo47K0CfNwVFhNqbwVCw1i7ZQhe4=
X-Google-Smtp-Source: AMrXdXtH4BSVtUULgcF6h9wE9PBwifrUaC6h16xnjDQD2g0zWi6QxczCZqoo/qTmw0dwJlxbG2YFwQ==
X-Received: by 2002:aa7:9461:0:b0:57f:ef11:acf6 with SMTP id t1-20020aa79461000000b0057fef11acf6mr15825306pfq.8.1674238333497;
        Fri, 20 Jan 2023 10:12:13 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id i128-20020a626d86000000b0058db8f8bce8sm8990396pfc.166.2023.01.20.10.12.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 10:12:13 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 38/41] curl: don't enable debug builds
Date: Fri, 20 Jan 2023 08:10:55 -1000
Message-Id: <dea11274a6ed33a9c20909b8adb81ce9b9bcd1a5.1674238148.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674238148.git.steve@sakoman.com>
References: <cover.1674238148.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Jan 2023 18:12:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176245

From: Ross Burton <ross.burton@arm.com>

In oe-core 27824261 --enable-debug was added to the configure arguments
to turn on debugging symbols.  However, enabling debug mode does more
than turn on debugging symbols and introduces some codepaths that can be
controlled with environment variables.  Bluntly, the curl maintainer
says that --enable-debug should not be used in production:

https://curl.se/mail/lib-2023-01/0039.html

I did a build and verified that the curl-dbg package doesn't massively
shrink, so the debug symbols are still being built.

Remove the debug options and hide them behind a PACKAGECONFIG, with a
comment that it should not be used in production.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3ed3b2ffeeaa5d888f77dd30cb8cd81d3275398a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/curl/curl_7.85.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/curl/curl_7.85.0.bb b/meta/recipes-support/curl/curl_7.85.0.bb
index 1e47e9fac5..846cdacb41 100644
--- a/meta/recipes-support/curl/curl_7.85.0.bb
+++ b/meta/recipes-support/curl/curl_7.85.0.bb
@@ -38,6 +38,8 @@ PACKAGECONFIG:class-nativesdk = "ipv6 openssl proxy random threaded-resolver ver
 PACKAGECONFIG[ares] = "--enable-ares,--disable-ares,c-ares,,,threaded-resolver"
 PACKAGECONFIG[brotli] = "--with-brotli,--without-brotli,brotli"
 PACKAGECONFIG[builtinmanual] = "--enable-manual,--disable-manual"
+# Don't use this in production
+PACKAGECONFIG[debug] = "--enable-debug,--disable-debug"
 PACKAGECONFIG[dict] = "--enable-dict,--disable-dict,"
 PACKAGECONFIG[gnutls] = "--with-gnutls,--without-gnutls,gnutls"
 PACKAGECONFIG[gopher] = "--enable-gopher,--disable-gopher,"
@@ -74,9 +76,7 @@ EXTRA_OECONF = " \
     --enable-crypto-auth \
     --with-ca-bundle=${sysconfdir}/ssl/certs/ca-certificates.crt \
     --without-libpsl \
-    --enable-debug \
     --enable-optimize \
-    --disable-curldebug \
     ${@'--without-ssl' if (bb.utils.filter('PACKAGECONFIG', 'gnutls mbedtls nss openssl', d) == '') else ''} \
 "
 
-- 
2.25.1


