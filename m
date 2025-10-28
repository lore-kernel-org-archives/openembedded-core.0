Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0899FCCD1BF
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 13:46:49 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.9358.1761659199739649849
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Oct 2025 06:46:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=NRXjU0BU;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-29488933a91so58099355ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 06:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1761659199; x=1762263999; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w5YJsPVDkT7YGM55xn4pxXDPwHhaNPrD4RW0JoBO8D0=;
        b=NRXjU0BUq/Kba3Gptk2bSo0+MdzlCIjdmaTKqRF2Xb9k3XWGCyOvzVxnk30JP5zx1a
         KN9j9XSoOSW5LQCfVeiouwDvLYkfMCbqB+Q5QeMQlJ0b4zlAoo7a8G/YmbYHOQdTh4pZ
         f10in/CgnZFridMY4EndHCv5EmMWo4rUCFBvCExJiM9fQgJs0po1plPOTTslgf/qeuHq
         7ZG3OMHclyjYHmCvukCB9QnhV9beD6BB4AH3pNpxQ19BZjYEXCFkULH3DcYqnCfwVBw4
         V56cunR+56aAmADNG0ZOPFrHHqMjGFAp2jpv8SKMk4t9ejRAuN61M8BPF5B0nK7hz0ts
         vTUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761659199; x=1762263999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w5YJsPVDkT7YGM55xn4pxXDPwHhaNPrD4RW0JoBO8D0=;
        b=sQq6a7yJLOavJe29+Y0pLDlTpgv4ypgZUVDUEhlGtnuZu8X3yh6WZUBLOzGNaYjwUE
         W068rdRJF0iD5S+GypU9+Er2UnlwonH89cDoGq6JkzOzL/SKnRp06LWWABkESxK0BbU3
         p1Hq03yex208H4Qm2YDFNJ0wrv8skUkDUisq6x7wtlGtiYptpAFPjUzy217h8Jb6gkrL
         06pTszmhjr2KAWUHiy50OLb5+2yfY9pMf6cRnF6W7ZZ8dt/G8cH83t9uFeRA01sMJQlv
         ppl+oHPBZ5pLOh7lYY9dTmsQafZe7ADJqqDK/adCTpOM/5GjbUyPH2oISy46Kjw1G4CL
         81tg==
X-Gm-Message-State: AOJu0Yzocw4oVGxV/Rgbm6nKATxAuCK3IGt3/2wQABCWYWLtItQOQrmM
	FGdxq4aJEbgQUhUPYKWC93kolM8Mp28xtdrZ3QVgc372rvoAnycPQ6nhSqBjcNXD+akYovHgxm1
	0CLdXKRc=
X-Gm-Gg: ASbGncvNhaej+QaVnbTjR30V6Y7ht74ItEhvQ2C4+AZQAIw37m1nNAV3FuLVCo6/WRX
	mBy1FtDi7DVfz/wWt3wM+8D8TwuDOnFmEgQVpO0x1knWKdFbjNt14pUY2wD3P3S4bzYQxOA88Hw
	iYRI9Z5SMSWnDk6EhlSDQYIGWdanOtjAIbohgkc9j/VUZfwQhakJF2BrusmhLCdppZJsi2el5gu
	D4BaEOACAJDY0cTNOMPNxFur2chRf1trL1w3z/7NWee2JwhGTBdYAhO+45mFSW+Qf8AEXS5C3ph
	mTidn9oUbJYnUD5SJLP6cpBG148dLU90TO5qWpdvj70O3MnaC1/Xwk8eDpCqbBb5+uFBgZmPSfB
	LSfSBqhsfuiWqEy8WDdbCpCrN2lTXXMQpXiEolwHfWqNMy84s0qlAeA072c8kT8meVxw=
X-Google-Smtp-Source: AGHT+IHkXZEFaLWkkfDivruooTVZJrBQygZU7UjAesVnX/ZoQ2y771RySZiG2q1GmcrWf6t5uICzsw==
X-Received: by 2002:a17:902:ce8d:b0:276:d3e:6844 with SMTP id d9443c01a7336-294cb510d0amr45487705ad.33.1761659198565;
        Tue, 28 Oct 2025 06:46:38 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:2bae:51f5:3bdc:4c68])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d40a7esm119894605ad.70.2025.10.28.06.46.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 06:46:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 8/8] curl: only set CA bundle in target build
Date: Tue, 28 Oct 2025 06:46:18 -0700
Message-ID: <0f98fecda8a0436f760e6fd9f3b7eb510e5258b8.1761596406.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1761596406.git.steve@sakoman.com>
References: <cover.1761596406.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 13:46:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225408

From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>

In native/nativesdk builds, sysconfdir refers to a recipe sysroot
directory, which will disappear once the workdir is cleaned up, breaking
libcurl's HTTPS connections.

By simply not setting --with-ca-bundle at all in non-target builds, curl
defaults to the host system's CA certificates, which is desirable anyways
to allow builds in environments that require local CA certificates.

(From OE-Core rev: 4909a46e93ba774c960c3d3c277e2a669af3fea6)

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/curl/curl_8.7.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index 6ed3d6e84d..713d90a378 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -94,11 +94,13 @@ PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd"
 EXTRA_OECONF = " \
     --disable-libcurl-option \
     --disable-ntlm-wb \
-    --with-ca-bundle=${sysconfdir}/ssl/certs/ca-certificates.crt \
     --without-libpsl \
     --enable-optimize \
     ${@'--without-ssl' if (bb.utils.filter('PACKAGECONFIG', 'gnutls mbedtls openssl', d) == '') else ''} \
 "
+EXTRA_OECONF:append:class-target = " \
+    --with-ca-bundle=${sysconfdir}/ssl/certs/ca-certificates.crt \
+"
 
 fix_absolute_paths () {
 	# cleanup buildpaths from curl-config
-- 
2.43.0


