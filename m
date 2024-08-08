Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18348C52D6F
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 02:29:14 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.50966.1723084146411404764
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Aug 2024 19:29:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=EnkDyD2A;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2cd48ad7f0dso469812a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 19:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1723084146; x=1723688946; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jqYbZ+tTsLtAt5K8bpdV6pthf5OwnSsz1Wh6xEk8WlY=;
        b=EnkDyD2ALfRgnr52VKNr2pbfu8gPveiWUQRZ2mNoc56D2P/OQqssK8CmZDrU++cmWP
         yu288o223jtc0/vTtAF4Empo2cGVm3WH0eZBO/M+zk6S2nccEUcl7JXB1RbVQhaWmzmV
         dIt9sLsnCWrnTcmrHABSP42lXBxBXOA6V24MlrrTgDMT/skfvF1YlmKyKazw/iJI99ZA
         /g4D+AE74bhPGHox64jgW8zzhRR98zGNStdQDpLJviXp8gM+oD0541FiBcstzLrC2k+0
         QmmPGe461Naj/z9ifq9sRP8Y1j0ghWCWfDFVg4Pp2FllqbLPvGptgTiJzgbGTITREJds
         5nMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723084146; x=1723688946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jqYbZ+tTsLtAt5K8bpdV6pthf5OwnSsz1Wh6xEk8WlY=;
        b=aYZN2G9p7Fo0ZFYDiF32Y2AqW0njTQzAmjr5MKu9WhMErFvrwZq+oXkkjIvu3Y/0xO
         ROL1GxHZsME2KXldZmYI6fYQGnEbBVNcbsq+vcLn+bEtMriVagWmW+YmSse8HDzuYiqj
         NBsf5euXRCaXG0iHjmMsCLNxB3xxLWv/YZVQuTT1uWPsgnIHRdGji0xLXH5T8yhq4va8
         1HeOyOuIHwpNq39AlYlISPrUUd8iR72THd8BRV+PTfvlkfqd8d/+WeRouGXGiCq5IKgx
         a98bat3v6NNFNjjgJdPessxPXzO4+PXiTXKJGBiifJw74tnOWFWWLS8JKdzgJsJKmNn7
         B6Lg==
X-Gm-Message-State: AOJu0YyHb8F4wJJ264lR/flFZtGr7alACdQko8PspADORLdv+qlTocgb
	loR03TjatmGJy1dDzZNveKjwF00gYfNDvWoSivtCo3maQGbS8C/IBawM1Sr0ouyGkulACaXQwsc
	4qF0=
X-Google-Smtp-Source: AGHT+IHTCO8Tx4LNZHfLq7uZ/+75deOrTmfzCmfpyMXv853NKtcqbWc+tO2TC8lqs/j8+LJjr/d/3A==
X-Received: by 2002:a17:90b:3888:b0:2bd:d42b:22dc with SMTP id 98e67ed59e1d1-2d1c346b923mr588761a91.43.1723084145669;
        Wed, 07 Aug 2024 19:29:05 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d1b3b0c796sm2269198a91.33.2024.08.07.19.29.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 19:29:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/10] curl: correct the PACKAGECONFIG for native/nativesdk
Date: Wed,  7 Aug 2024 19:28:44 -0700
Message-Id: <67b98253ea70a1e2850a78bb101c934093d30937.1723083840.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1723083840.git.steve@sakoman.com>
References: <cover.1723083840.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Aug 2024 02:29:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203108

From: Changqing Li <changqing.li@windriver.com>

Since commit 148de08220 [ curl: Update from 8.2.1 to 8.3.0 ],
--enable-crypto-auth option was removed and split into separate options
for basic-auth, bearer-auth, digest-auth, kerberos-auth negotiate-auth,
and aws. In this commit, --enable-crypto-auth is removed from
EXTRA_OECONF, and the separate options is added into PACKAGECONFIG for
target. But not added into PACKAGECONFIG for native/nativesdk, this make
curl/git in buildtools not works well to connect basic auth https
server.

Failed commands:
git ls-remote https://xxx(input username/passwd)
curl -u name:passwd https://xxx

Error:
Authentication failed xxx
HTTP/1.1 401 Unauthorized

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/curl/curl_8.7.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index 136782ffec..6d2886f70c 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -28,8 +28,8 @@ inherit autotools pkgconfig binconfig multilib_header ptest
 RANDOM ?= "/dev/urandom"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} aws basic-auth bearer-auth digest-auth negotiate-auth libidn openssl proxy random threaded-resolver verbose zlib"
-PACKAGECONFIG:class-native = "ipv6 openssl proxy random threaded-resolver verbose zlib"
-PACKAGECONFIG:class-nativesdk = "ipv6 openssl proxy random threaded-resolver verbose zlib"
+PACKAGECONFIG:class-native = "ipv6 openssl proxy random threaded-resolver verbose zlib aws basic-auth bearer-auth digest-auth negotiate-auth"
+PACKAGECONFIG:class-nativesdk = "ipv6 openssl proxy random threaded-resolver verbose zlib aws basic-auth bearer-auth digest-auth negotiate-auth"
 
 # 'ares' and 'threaded-resolver' are mutually exclusive
 PACKAGECONFIG[ares] = "--enable-ares,--disable-ares,c-ares,,,threaded-resolver"
-- 
2.34.1


