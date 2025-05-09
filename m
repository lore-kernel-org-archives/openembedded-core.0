Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93D7CC3ABCE
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 15:24:13 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.1410.1746804251417523536
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 May 2025 08:24:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=246GkIYd;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-736c062b1f5so2438570b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 08:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1746804251; x=1747409051; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OpNh2vAwV3ninlNCjdDlcBraQy9dE9QqK3gXWhBlaA0=;
        b=246GkIYdGJl0/9GCeO5oQdYRvmGkq4E7qtAnWV48V4wJVvv/MyBxULoo2+DLcfnc8z
         APQOT8lctp/VZR0E9VJ86cKZND+zEnNRo+kGUfmyCyg2D4gbHqu8HUHrcWvVueGAet71
         NLDVMScbMrfloY1UuuitRkzCUKOicxyWK4KgIhrLuona3PGD4Ymqm4BVm9MrlKx5SWqG
         DNRgfC628yRbodZvD5S2hrNpTCABRq//RfmOw1HUq+6pxNCvayJUYmbHHe4S12yEMemj
         heOCWwOnu4QImK8Ez+TfyVyMB0nnGmB1o9ynRYZBdV7UrueiHjSWGdkOnKwiXO4zyis3
         FhVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746804251; x=1747409051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OpNh2vAwV3ninlNCjdDlcBraQy9dE9QqK3gXWhBlaA0=;
        b=eJJPnNbmcgDd/x1y0ZScuyDZ8e0IIaaSak+a1vILhxX1KeT/HZWVujQVfPuM8YSIB2
         O6xwNoHNiLf2GMtGH4duplEgMAsT24pLbDUthWHdUMwPa2r5KCfeCFSpEdVpLqMjc90K
         imxIomdhn7LJCgt+eqQ74vrydzd7tvErlCrNopM830OlocnZ30IEZXn0MzG3pdChfVMn
         KmFI/1AwT40MWAVTpsuheNU7aTg/NcXqRoC0ofzfap1D7Z3NUP527CniWd9DsYt+q6Ln
         zyB4EKLtkVx8+NX2iVmMSLvFXReBR5S/ZsPydhfX1zA5hwDoqsvwLDWa6rci9g+ZPNpa
         w3PQ==
X-Gm-Message-State: AOJu0Yw0stfkUqW3trTcXQjXoYRnied2z4XI1q+RI/PaSW+i0957jUtD
	iFoyK02DVjs5DwQGQOb9C5CM3e8fY8MdzFvDX9RM3q+yjrq6BCzXfVdprZtr8qFNfyD8IBOoFpn
	Q
X-Gm-Gg: ASbGncv1GID9Q/59dB/FVk9mcdZZHGXDaBw+f4VlSgoCShv5dIuOXYPUbvc93aZy0fN
	+tN2iJlP6luZNROzMGhLf8GqENaXYO01U6mGGS7K7UppWLMKpkFEjwlk2k9ouvo1lFyP8ng4cuQ
	wM2asokzjnLe/85PtYamhZUnfP0f2BZj4Q9UzG9FD4p6qRqesjFVVV6gAkeeUPJ4lAkDsGO8s9q
	Ve2VxihDMeOWgwMXNMbEBtAf7hgGFzbMmpPADHMwMbI1/nRHG1f9KAg9ui4Nyj4Rr1ipZxly5lo
	UU0IPMPHkPgNBK/HAy14GwwzVDHYCu9INi9e5zvjdyo=
X-Google-Smtp-Source: AGHT+IGcoG4sm0ehK1LsXrBYM4GM7JO/fxONMg5qYID+B//p9IuYXUQ91pPuWw+61xgyPa8TyOJzDw==
X-Received: by 2002:a05:6a00:190e:b0:740:595e:1676 with SMTP id d2e1a72fcca58-7423bc59257mr6545595b3a.8.1746804250541;
        Fri, 09 May 2025 08:24:10 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:1912:b658:11a7:402c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a108fbsm1848319b3a.115.2025.05.09.08.24.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 08:24:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 12/17] buildtools-tarball: add envvars into BB_ENV_PASSTHROUGH_ADDITIONS
Date: Fri,  9 May 2025 08:23:28 -0700
Message-ID: <5fa8cb40395977722d0d5a2271c8044598fb1f01.1746804035.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1746804035.git.steve@sakoman.com>
References: <cover.1746804035.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 15:24:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216220

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


