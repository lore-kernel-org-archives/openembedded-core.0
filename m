Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2DFEC4829A
	for <webhook@archiver.kernel.org>; Sat, 10 Feb 2024 16:13:02 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.16592.1707581578685710879
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Feb 2024 08:12:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QBDj0KFI;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4108db2ded5so3491365e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 10 Feb 2024 08:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707581576; x=1708186376; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CObw94ZDynBmaDdE9g2BDFMWvwSHlmM29Xg0ZQdG9Xw=;
        b=QBDj0KFI6NNsKDglEjZDAcO5lNBtTofQh+GkhdraNPl5smw21g1GJYOPZ8wvUcDHFr
         T6vYTAXWOwSYT448Z0FA0K7a8UnQTQ3fSwy63oOwg/pNo6TfgrQuFSc4VJzDM4yZPPEC
         nEo/RpAu6t9xQ4L0mWjwO6OFctdoWwhl76xsT/fncgW7pI1v2KSegCUTfXpk7sYfwkil
         y94e6LYhJF1D8QmkdxKmcoadGAQ8bAqFm3k34RbZuW1LbwGIFVON0sOLSES8rBdQr33u
         xUrKeEQzi30HQ63dhg6KGgzOWdl8I9+dHTOBjWFFNyP3heV46sfuOiQvhlYLE12mcPuF
         5D6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707581576; x=1708186376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CObw94ZDynBmaDdE9g2BDFMWvwSHlmM29Xg0ZQdG9Xw=;
        b=u5e5KTBrN6EDS7j4BzCvreLMFhEHvTjQ/BxUen63W97g8tUkLnxvVrpLJtrMgY2ldF
         TVnyLc9nmB1NlrDyvkNPn7+pkhnaEdfeOSqjlWpRdVNP1cfsRuE5rpDXnczwuH6ruWG2
         hBHC06VlsI2qu4Vez8uCw3iUJ0SpuO26Rgtu02aQ67EvESmvKJAmGsnc8HBu0pX0HRbO
         HhaCOl7Gn5e+e02cByt/tju+bsqoK0S/F30KaySjdA9LDtGU+pyM+QyUB9Uwn33F5uks
         1pSj/M6m5zABOgDbCyl3gXnY5kMUrOM7Ul68Yp59R+lJDU/ZTmMcASxEOmUCitb6110x
         XkHw==
X-Gm-Message-State: AOJu0YzjpxMz9cEln2Ap1xcHnMMO+5kGkjB2RfJTLBEU96U7KuEWmRQj
	DhDFShVQ+uE1BMs25PfCyFxmuxLMcP5dgyFaJCAF9Ujy1eIcDJDBZqJNEWCP
X-Google-Smtp-Source: AGHT+IEUimeiAeEHm3aHl1eg07k8evHEmG4SbSDFcNz3ptvbQZbsPD3eVtSxVZm30u3PiTRbfqrLvA==
X-Received: by 2002:a05:600c:198d:b0:410:72e0:d391 with SMTP id t13-20020a05600c198d00b0041072e0d391mr2265079wmq.6.1707581576035;
        Sat, 10 Feb 2024 08:12:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWkBosq39yOK9eRXK+sKLtB0mI1twUCFkMcDlGNCR7cDs+mqfBXI5NpZkHKO4TmksZBxn/cMe/BUtgkRAod5BChUEe97/s9SJxrAPIql2TJJP/TuKfLNx+0cFc2ZLibzEVqCRX2dasFFEp8JxILTA397RmLfX0DQLG/Xf6eEurt3OEjoHvzoak0nQ==
Received: from Zuma-000004PC.lan ([2a02:390:9c57:0:d016:9a35:28cd:913d])
        by smtp.gmail.com with ESMTPSA id n11-20020a05600c3b8b00b004105017f83fsm3774956wms.31.2024.02.10.08.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Feb 2024 08:12:55 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][kirkstone][PATCH] curl: don't enable debug builds
Date: Sat, 10 Feb 2024 16:12:34 +0000
Message-Id: <20240210161234.12849-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 Feb 2024 16:13:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195277

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
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/recipes-support/curl/curl_7.82.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index 965f05bc9812..b2efbd6172a7 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -76,6 +76,8 @@ PACKAGECONFIG:class-nativesdk = "ipv6 openssl proxy random threaded-resolver ver
 PACKAGECONFIG[ares] = "--enable-ares,--disable-ares,c-ares,,,threaded-resolver"
 PACKAGECONFIG[brotli] = "--with-brotli,--without-brotli,brotli"
 PACKAGECONFIG[builtinmanual] = "--enable-manual,--disable-manual"
+# Don't use this in production
+PACKAGECONFIG[debug] = "--enable-debug,--disable-debug"
 PACKAGECONFIG[dict] = "--enable-dict,--disable-dict,"
 PACKAGECONFIG[gnutls] = "--with-gnutls,--without-gnutls,gnutls"
 PACKAGECONFIG[gopher] = "--enable-gopher,--disable-gopher,"
@@ -112,9 +114,7 @@ EXTRA_OECONF = " \
     --enable-crypto-auth \
     --with-ca-bundle=${sysconfdir}/ssl/certs/ca-certificates.crt \
     --without-libpsl \
-    --enable-debug \
     --enable-optimize \
-    --disable-curldebug \
     ${@'--without-ssl' if (bb.utils.filter('PACKAGECONFIG', 'gnutls mbedtls nss openssl', d) == '') else ''} \
 "
 
-- 
2.39.0


