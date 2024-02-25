Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F096C54E52
	for <webhook@archiver.kernel.org>; Sun, 25 Feb 2024 21:53:34 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.7444.1708898008237586991
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Feb 2024 13:53:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=0BQolwWv;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-299d3b09342so1475327a91.2
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 13:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1708898007; x=1709502807; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bGnPD0yb1HExFmP24x3qte9NUlC1s/nFtdy14BTfSAo=;
        b=0BQolwWv8+XrU/vPCP2LWBv/tc0xNErNXDct+nNk4zmjU0lHOjSBqEWDGZ34wxmhKf
         yguMmWGKd6rUl5upJKBkR6fVMpDgeBNeUG9UATJUfco1KzQzkXIDRMPDYHaxr/881PQM
         FQh0DHYpFSB1WTY8SQZOjUf/p45IVdrrgSkeJUGE3GWYvGcbnuHMtqCkv6x160lJB4gr
         W8nbplzrI/dX9kDa2CbyPZf/cMU1MoAd0yEZOiXMH+dlHLS0HbJzFfZHMLZujw3DYsow
         /KSezIAlLo28SlTipC/umRGnCC69KfXMI4Ng8l/Zz9cm77acMrPjZG4v4XyhASBHgRqA
         BLJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708898007; x=1709502807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bGnPD0yb1HExFmP24x3qte9NUlC1s/nFtdy14BTfSAo=;
        b=xKsiscZsmNF3mSEfH/AyX2XshVADwrshXxn/q2VzABSXyVsnMHfO9dFHIliFM9I9xN
         smNLNXc8tsVY0qCIbOddwx6hSOf4oK3Y3htHF46WTf1LnMWsLNfnnuDwZTF53AaPlQWA
         BC5QQOuc3MByvUpGjf1jGZNiIxSWfCvIZ3dGWGPUlTlNsQpE7PV03fQvjWuzmXYAD6Yo
         peW/U8gnLQmR+wEZxwcu4E2VgzL1cuFdUq6V7i9Ebj04kTJtdR6Nw8EH35JmhHg7DdWt
         e1OOxobPexro4WqbiEQVpGbq+XvdSr4a5OyCgk/omwGBA024uSwC6RiYQ9xLK0ytUZ+2
         3xfw==
X-Gm-Message-State: AOJu0YwRYDtujQ4cqSXqKFVbsvFWdS2SvaJgAmtrjD6GY+OgpIR4ZyqV
	J3mZEXioLuoAg0jJHRVvP0Tu8s1v3iiDdCEjwCyxXKCxifyIydS4W50Gqu2moWLzE91c+uT1jim
	ALEy6sg==
X-Google-Smtp-Source: AGHT+IHDQbblEiK3j7XsdgsuuAd23sUypaHHT3IBp9AAFJB4Ugpiab+Mv3jhAD0k04/Nzp8ZIrabxA==
X-Received: by 2002:a05:6a20:9d90:b0:1a0:cc37:f84a with SMTP id mu16-20020a056a209d9000b001a0cc37f84amr7322413pzb.34.1708898007616;
        Sun, 25 Feb 2024 13:53:27 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id a12-20020a17090acb8c00b0029a4089fbf0sm3082947pju.16.2024.02.25.13.53.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 13:53:27 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 18/22] curl: don't enable debug builds
Date: Sun, 25 Feb 2024 11:52:37 -1000
Message-Id: <01440b4968ded30c1970c335fe1598b684527831.1708897822.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708897822.git.steve@sakoman.com>
References: <cover.1708897822.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 21:53:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196170

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/curl/curl_7.82.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index de69d3d53b..383cf415d9 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -79,6 +79,8 @@ PACKAGECONFIG:class-nativesdk = "ipv6 openssl proxy random threaded-resolver ver
 PACKAGECONFIG[ares] = "--enable-ares,--disable-ares,c-ares,,,threaded-resolver"
 PACKAGECONFIG[brotli] = "--with-brotli,--without-brotli,brotli"
 PACKAGECONFIG[builtinmanual] = "--enable-manual,--disable-manual"
+# Don't use this in production
+PACKAGECONFIG[debug] = "--enable-debug,--disable-debug"
 PACKAGECONFIG[dict] = "--enable-dict,--disable-dict,"
 PACKAGECONFIG[gnutls] = "--with-gnutls,--without-gnutls,gnutls"
 PACKAGECONFIG[gopher] = "--enable-gopher,--disable-gopher,"
@@ -115,9 +117,7 @@ EXTRA_OECONF = " \
     --enable-crypto-auth \
     --with-ca-bundle=${sysconfdir}/ssl/certs/ca-certificates.crt \
     --without-libpsl \
-    --enable-debug \
     --enable-optimize \
-    --disable-curldebug \
     ${@'--without-ssl' if (bb.utils.filter('PACKAGECONFIG', 'gnutls mbedtls nss openssl', d) == '') else ''} \
 "
 
-- 
2.34.1


