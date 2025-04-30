Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84B43C3DA4A
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 03:00:37 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.8297.1745982034724892705
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Apr 2025 20:00:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=FsNIJlPc;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-223f4c06e9fso4832325ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 20:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1745982034; x=1746586834; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OpNh2vAwV3ninlNCjdDlcBraQy9dE9QqK3gXWhBlaA0=;
        b=FsNIJlPccDOqTbYjvK3jL49QL+0VoTrxSIWG+5/I9C1wP9XCI1foB8TBwb1Dm+v+Yz
         OQQiQ3zINI3SMH931sdYiK9QoWX8mXGsiY1M42yucSeCE8TF8xPjuJM9QILIW60kgwvY
         hcxNdv0RElY/EfFtXXf/4CoAoyv+3bnMirsOMcSX561t4tfmCMtj3ZZYGK+Nnx1IhTmh
         Wdu/4VtZZIAlv64/Mk3nVyVuFA1PUqEQGZ9aaKKW9kejnpNR2f7qekBW/i1fD1UfxfBf
         swLcKCeFMAyztAcDUtOxagU6wOs6U4TWVWXEiV8kztuGrvgCzv6mwVglN4NEGFyiaH7l
         +w0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745982034; x=1746586834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OpNh2vAwV3ninlNCjdDlcBraQy9dE9QqK3gXWhBlaA0=;
        b=CYZzoYvEi0XV5riMZAGiB7qE2yD9ER2ZesiAtGnZ7Wd+AU3KLnhOYbqUvisSNBipFo
         I90L2L2ikbo24lSWNy7NbSurtc9YrBdYWJQImYUrTRdFjn7C8fyaf4257QQrD5FUpH4F
         QovvhxrPdqaeGv0Z6adRbhXFdJH9W1VVKhgY0uCXV+b71i40Fuan6j552ugKDegMH6p2
         NYogncsse+P5GRSnbNLFjDrZBCNdeWINxkT7kczLf58jDU9W++FSgDszHpxnf7VWKdwW
         tzqQf+9rWtDL8PY03GncjAltTxhd24XYnN3A/VE4MgBgeXSe6ogohun/6b50O3NWGaFl
         WOLQ==
X-Gm-Message-State: AOJu0YwPfSpyDYZxL8976npxC6JHHnIvPPtrgtAScwuaFklgRZmpwUu+
	E/dVaJWBbdup5eymMcSUZMngiRHsBTEqy4JSLnG/xU5LjTC75Z0jcGBWMA+HgLpNB2/qei3ypBj
	A
X-Gm-Gg: ASbGnctyguLkMhYDSJka9+YmTzvT/Hcw8J5clmvOhQOZX0mI+gqOtuV3Hd4RUslo3UP
	/7Xdq9A6kAj4r7qLT9FJLbnowtFKvjrQtaAEFp/XnwlvVXzzOvWpiwP/uBzvCa/jMX1eYJdnPJR
	ZRWnD06zCwcT+SibcGBZkT/jP2SRGKDxOyWqrGkU84CINAbbe4yVFVvL3pNnChGzu+2x8p2dINf
	RxmMZTpCOUDAoscy/FIQQssoTYm5lALMB3Y7+Ugx47Yp/eznL6/X92ORuqD48Uh1hLRq6beIsGU
	7olTwxHo5acTTqUUzT7m1w4GHbCYXwc=
X-Google-Smtp-Source: AGHT+IHiYH6deB5fE/yCL8Bjecn9iXTZYn53tZDxvHsgJBkiQveRNDLXBhK4vPOco1v9G5+W/4VGSw==
X-Received: by 2002:a17:902:db0a:b0:224:3d:2ffd with SMTP id d9443c01a7336-22df47e5fb1mr17158205ad.17.1745982033947;
        Tue, 29 Apr 2025 20:00:33 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:34b:e5e0:c38a:7e03])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22de49dccd3sm30461175ad.123.2025.04.29.20.00.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 20:00:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 13/15] buildtools-tarball: add envvars into BB_ENV_PASSTHROUGH_ADDITIONS
Date: Tue, 29 Apr 2025 20:00:01 -0700
Message-ID: <27f018d8e8ace97d0b1cdfb8782a2a7a0a319816.1745981742.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745981742.git.steve@sakoman.com>
References: <cover.1745981742.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 03:00:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215719

From: Changqing Li <changqing.li@windriver.com>

Here is one testcase:
For recipe tensorflow-lite-host-tools_2.18.0.bb, refer [1],
do_configure[network] = "1"
and it will git clone some repos in CMakeLists.txt

When buildtools is used and nativesdk-git is installed into sdk,
do_configure failed with error:
[1/9] Performing download step (git clone) for 'protobuf-populate'
Cloning into 'protobuf'...
fatal: unable to access 'https://github.com/protocolbuffers/protobuf/': error setting certificate file: /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-wrlinuxsdk-linux/etc/ssl/certs/ca-certificates.crt

Fix by adding GIT_SSL_CAINFO in BB_ENV_PASSTHROUGH_ADDITIONS, so that
user can export GIT_SSL_CAINFO=${GIT_SSL_CAINFO} in their
do_configure:prepend() to fix above do_configure failure

CURL_CA_BUNDLE and REQUESTS_CA_BUNDLE is similar envvars, so all add
into BB_ENV_PASSTHROUGH_ADDITIONS

[1] https://github.com/nxp-imx/meta-imx/blob/styhead-6.12.3-1.0.0/meta-imx-ml/recipes-libraries/tensorflow-lite/tensorflow-lite-host-tools_2.18.0.bb

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/git/git/environment.d-git.sh               | 1 +
 .../python/python3-requests/environment.d-python3-requests.sh    | 1 +
 meta/recipes-support/curl/curl/environment.d-curl.sh             | 1 +
 3 files changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/git/git/environment.d-git.sh b/meta/recipes-devtools/git/git/environment.d-git.sh
index 18104f0528..f8e3221510 100644
--- a/meta/recipes-devtools/git/git/environment.d-git.sh
+++ b/meta/recipes-devtools/git/git/environment.d-git.sh
@@ -1,3 +1,4 @@
 if [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
     export GIT_SSL_CAINFO="${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt"
+    export BB_ENV_PASSTHROUGH_ADDITIONS="${BB_ENV_PASSTHROUGH_ADDITIONS:-} GIT_SSL_CAINFO"
 fi
diff --git a/meta/recipes-devtools/python/python3-requests/environment.d-python3-requests.sh b/meta/recipes-devtools/python/python3-requests/environment.d-python3-requests.sh
index f2eee203ca..c7faec127d 100644
--- a/meta/recipes-devtools/python/python3-requests/environment.d-python3-requests.sh
+++ b/meta/recipes-devtools/python/python3-requests/environment.d-python3-requests.sh
@@ -1,3 +1,4 @@
 if [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
     export REQUESTS_CA_BUNDLE="${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt"
+    export BB_ENV_PASSTHROUGH_ADDITIONS="${BB_ENV_PASSTHROUGH_ADDITIONS:-} REQUESTS_CA_BUNDLE"
 fi
diff --git a/meta/recipes-support/curl/curl/environment.d-curl.sh b/meta/recipes-support/curl/curl/environment.d-curl.sh
index 0d53aabb8e..0ab83a267d 100644
--- a/meta/recipes-support/curl/curl/environment.d-curl.sh
+++ b/meta/recipes-support/curl/curl/environment.d-curl.sh
@@ -1,3 +1,4 @@
 if [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
     export CURL_CA_BUNDLE="${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt"
+    export BB_ENV_PASSTHROUGH_ADDITIONS="${BB_ENV_PASSTHROUGH_ADDITIONS:-} CURL_CA_BUNDLE"
 fi
-- 
2.43.0


