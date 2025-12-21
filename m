Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0611E67495
	for <webhook@archiver.kernel.org>; Sun, 21 Dec 2025 21:37:46 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.68795.1766353065040279587
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Dec 2025 13:37:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=WbDRUZW9;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7e1651ae0d5so2591598b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Dec 2025 13:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1766353064; x=1766957864; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xGQf/oG1clCs/DEHFw2Igk9dFSqJEiUV1/umohS4Zts=;
        b=WbDRUZW9+qo9en1+1uEb1aOB3j6kkvz8hMwS8tOv7fSza6hQ8RhnmQL7VZZzTlq7G/
         thX1UKgSQQgRmT85GJ4EokScBqpv8V96eS3P7FCiXBnJiSh1CrIcGt4IY+S/uLdbRScJ
         HlMOGt4Wm0X23Lk01yWcmnE1hShB0lQkxgWxLVVnYNya+hk1l6AVmlfrBzAdbZ95zyzW
         i8NtpoX5m9FcuNTmInZ2qBWXl+FpZuIIU9/QhuyHajhbNRdmYwyoUUS9ASli8OMSlQC5
         yY5rsRrpCfzh2JK0IdYZOUYSyMi4b8/tteqMLssnHQ0w3o+A9yiBAAdRMnTNhyaHKNVK
         qsMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766353064; x=1766957864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xGQf/oG1clCs/DEHFw2Igk9dFSqJEiUV1/umohS4Zts=;
        b=vhrwjfvGJZPG4DXLCLM9d87lrwQrcgP3ykvVCmxt3F20bVPHc76yl14QnXERnLbXGb
         NWSg+RJBvFNmUswa5HYgTSzdkzWauFdEwL7bt5w3deQycJFMp2YB47bPW/rYVxjJdk0X
         Gqp1/9C02LRJ3POJ2eKbCkGpZrUWzZ5UAbOvME0IwIqWRhEuX084yAmXNLTVFfOaGlr3
         RcivtWa9vzx2U0/mG120Hdg+kszPWXU6HUvLPdKVOX0ENUPWtiUkL8DHBYjKnZ5md75U
         xFEebVwDwrch/L+YQ5XhSxVIWJG+FD0rSPRRAFzFruPs2i1O4Wx2HXbkm5ewJLDYrGtN
         2dzg==
X-Gm-Message-State: AOJu0YziZPhqtmmcd40AZwEsbOMo1vU2+5FGu9NZb0cX5g/P6omsQhU7
	CXE3SB6LJ36KRaW+aC89isgNz4pGpU11lGQQ21T8VU4cyw6LZuwZW7DD7rJyqsA7FF2Hp9FTjEr
	NYKgNrrI=
X-Gm-Gg: AY/fxX78RMVz/K1jBSCPQwGnncxAngZRharOEOiuY3I25ftQxu26Wa5ISb/5qzy0Dja
	kFNxAMVLPgeISGnyW397lDfvkDIzTdwU23pUGgXGmgSEkAU8HieYROQ3YmcjFEzW6ergpFfeY2F
	HHlIr4eIwK6hK5lrUR13t7GEG6Q8CbngZppdIYHnjmdC1XBqVU730Uc6OciDzKn4ff/w7OLXQHj
	SMCg1QBJIxwt4Rf+cBkaRkKTkk4biy3kPxFFiFWlq/kY4rpdMm0gdGTm4fkU0yzgqmEWRm9bi/E
	ZyA2dIdK38/vnAUZ0LVLgat/QpAVJBJy4hG/GSkc2I3f+8urZGyxUcluJQaOdXq87/Zpx1aEWeE
	b32KS0ljakMdd7l5hcwWknk1jUzXR7jma5d2QboRu3va4SH6MrIF/vHdeRxob8LRtryXtfAv1er
	gx
X-Google-Smtp-Source: AGHT+IFOes60KCU9MgW7xHGxHbsw/mIs8kWJzZo+zdWrVJu33HxyrXOarH+UjJsM51kUxxMTAZyFug==
X-Received: by 2002:a05:6a00:8086:b0:7e8:4587:e8c8 with SMTP id d2e1a72fcca58-7ff6687381bmr8396423b3a.59.1766353064186;
        Sun, 21 Dec 2025 13:37:44 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:dd61:72c7:d0b8:fed])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7dfabcbcsm8211166b3a.31.2025.12.21.13.37.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 13:37:43 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 14/18] curl: Use host CA bundle by default for native(sdk) builds
Date: Sun, 21 Dec 2025 13:37:07 -0800
Message-ID: <3a0e9f4517516e0cf26cd4f1160f244e6f8fe00f.1766352840.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1766352840.git.steve@sakoman.com>
References: <cover.1766352840.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Dec 2025 21:37:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228272

From: Moritz Haase <Moritz.Haase@bmw.de>

Fixes YOCTO #16077

Commit 4909a46e broke HTTPS downloads in opkg in the SDK, they now fail with:

> SSL certificate problem: self-signed certificate in certificate chain

The root cause is a difference in the handling of related env vars between
curl-cli and libcurl. The CLI will honour CURL_CA_BUNDLE and SSL_CERT_DIR|FILE
(see [0]). Those are set in the SDK via env setup scripts like [1], so curl
continued to work. The library however does not handle those env vars. Thus,
unless the program utilizing libcurl has implemented a similar mechanism itself
and configures libcurl accordingly via the API (like for example Git in [2] and
[3]), there will be no default CA bundle configured to verify certificates
against.

Opkg only supports setting the CA bundle path via config options 'ssl_ca_file'
and 'ssl_ca_path'. Upstreaming and then backporting a patch to add env var
support is not a feasible short-time fix for the issue at hand. Instead it's
better to ship libcurl in the SDK with a sensible built-in default - which also
helps any other libcurl users.

This patch is based on a proposal by Peter.Marko@siemens.com in the related
mailing list discussion at [4].

[0]: https://github.com/curl/curl/blob/400fffa90f30c7a2dc762fa33009d24851bd2016/src/tool_operate.c#L2056-L2084
[1]: https://git.openembedded.org/openembedded-core/tree/meta/recipes-support/curl/curl/environment.d-curl.sh?id=3a15ca2a784539098e95a3a06dec7c39f23db985
[2]: https://github.com/git/git/blob/6ab38b7e9cc7adafc304f3204616a4debd49c6e9/http.c#L1389
[3]: https://github.com/git/git/blob/6ab38b7e9cc7adafc304f3204616a4debd49c6e9/http.c#L1108-L1109
[4]: https://lists.openembedded.org/g/openembedded-core/topic/115993530#msg226751

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
CC: matthias.schiffer@ew.tq-group.com
CC: Peter.Marko@siemens.com
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3f819f57aa1960af36ac0448106d1dce7f38c050)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/curl/curl_8.17.0.bb | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/curl/curl_8.17.0.bb b/meta/recipes-support/curl/curl_8.17.0.bb
index 32585070eb..352f407d28 100644
--- a/meta/recipes-support/curl/curl_8.17.0.bb
+++ b/meta/recipes-support/curl/curl_8.17.0.bb
@@ -75,16 +75,21 @@ PACKAGECONFIG[websockets] = "--enable-websockets,--disable-websockets"
 PACKAGECONFIG[zlib] = "--with-zlib=${STAGING_LIBDIR}/../,--without-zlib,zlib"
 PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd"
 
+# Use host certificates for non-target builds. As libcurl doesn't honor any of the env vars (like
+# for example CURL_CA_PATH) that curl-cli does, we need to explicitly set '--with-ca-bundle'
+# accordingly, so that there is a working, built-in default even for those tools that use libcurl,
+# but don't have custom env var handling implemented (like opkg).
+CURL_CA_BUNDLE_BASE_DIR ?= "/etc"
+CURL_CA_BUNDLE_BASE_DIR:class-target = "${sysconfdir}"
+
 EXTRA_OECONF = " \
     --disable-libcurl-option \
     --without-libpsl \
     --enable-optimize \
+    --with-ca-bundle=${CURL_CA_BUNDLE_BASE_DIR}/ssl/certs/ca-certificates.crt \
     ${@'--without-ssl' if (bb.utils.filter('PACKAGECONFIG', 'gnutls mbedtls openssl', d) == '') else ''} \
     WATT_ROOT=${STAGING_DIR_TARGET}${prefix} \
 "
-EXTRA_OECONF:append:class-target = " \
-    --with-ca-bundle=${sysconfdir}/ssl/certs/ca-certificates.crt \
-"
 
 fix_absolute_paths () {
 	# cleanup buildpaths from curl-config
-- 
2.43.0


