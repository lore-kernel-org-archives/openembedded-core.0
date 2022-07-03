Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD5A1C433EF
	for <webhook@archiver.kernel.org>; Sun,  3 Jul 2022 19:38:25 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.64480.1656877103627791465
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 12:38:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=fsYU505O;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id o15so2886965pjh.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 12:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=p2zaZHhjdcxI4HWxXzr/898/pTG28cWrsIldJKsfCuQ=;
        b=fsYU505OGDBoeiB9xCsOzBahcAvy4aryzA+o2Ad6z+uk4IP5WN/D7F1B//92r/XGw3
         ztnpkvrOTiBQLA+epoSwP6JlvbEQAvjxZOfZw/rhwrTyHl4S/uthjAcXKMeLe3SjpKDr
         yVjA7oCDAj3BSbmMR6QOEWW2yxeJycp18GJrJl1DwIFC08OA6OPeIt1Hcg32smjwHC5k
         q/x65MTCuDgXjEd/QtEzpIVuTDBYKsM97EsD2bQesGokbs1MpY7LC8c5sfz5+U2chFpF
         ITnNgqV3aHWRPHfECOLKAxIRyKp+s7g/3SlrTAYo2CnDyg8GbxWbC8u4Rlhlj5qEvmdV
         gaww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p2zaZHhjdcxI4HWxXzr/898/pTG28cWrsIldJKsfCuQ=;
        b=hHmFY+VqAxsSiEPoSTVacBbsU9ZQVN0UO8rAUblYehIH7Ypd8gox1/Sf8tLUMdTAHQ
         UKsW9l100K8R6vtyGSsbIV98lrFi69rn5J+nfBWZRN4VUocbfNqJ7lTDRvIqHqkuGwWD
         Wn9cCpji4xsw6Xzpg9au0adnkCzaQZxkgsWRF7vZesmmSmAnPCkl1Ngc4aarwIKtx+IG
         RQejqZZwUa6jepvBMVdePHrGJGVblyd0/EULm+i9ThOF0AcirVx5DF9apD63jxKoUsXi
         YWbgNWy/CqCkfz0a75hCxXAE3rkyEohypV5ekeXMCLhdYm5FeDMd4s8c17Bb04fSP+Cn
         QXKA==
X-Gm-Message-State: AJIora/O3JATaGgztObVuwmnZsF5e+WUDMuzlnD2d/2j7PSK/DQToF8A
	5hOOeOJdrru2T25TDvz/JeI3lfwsrXLBxv7X
X-Google-Smtp-Source: 
 AGRyM1vT4p6rQVlzp7WX65PhwZwEQHyLgBeKeaxHwNIb4Vq5OYMNX+XIpStMS4OWzJcohAuvqfqVPw==
X-Received: by 2002:a17:902:aa4b:b0:164:11ad:af0f with SMTP id
 c11-20020a170902aa4b00b0016411adaf0fmr32565865plr.54.1656877102443;
        Sun, 03 Jul 2022 12:38:22 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 d4-20020a170902654400b00168aed83c63sm19441739pln.237.2022.07.03.12.38.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jul 2022 12:38:20 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 25/30] curl: backport openssl fix CN check error
 code
Date: Sun,  3 Jul 2022 09:36:00 -1000
Message-Id: 
 <7a8d374a3d4bbef336be2b273afc00c93c637ae6.1656876825.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1656876825.git.steve@sakoman.com>
References: <cover.1656876825.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Jul 2022 19:38:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167585

From: Jose Quaresma <quaresma.jose@gmail.com>

Fix out of memory [1]

OpenSSL host verification + hostname in certificate CN only seems broken in 7.82.0

[1] https://github.com/curl/curl/issues/8559

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...0001-openssl-fix-CN-check-error-code.patch | 38 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/0001-openssl-fix-CN-check-error-code.patch

diff --git a/meta/recipes-support/curl/curl/0001-openssl-fix-CN-check-error-code.patch b/meta/recipes-support/curl/curl/0001-openssl-fix-CN-check-error-code.patch
new file mode 100644
index 0000000000..c0a2355e5b
--- /dev/null
+++ b/meta/recipes-support/curl/curl/0001-openssl-fix-CN-check-error-code.patch
@@ -0,0 +1,38 @@
+From 0677924c6ec7e0d68964553fb760f6d407242c54 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Tue, 8 Mar 2022 13:38:13 +0100
+Subject: [PATCH] openssl: fix CN check error code
+
+Due to a missing 'else' this returns error too easily.
+
+Regressed in: d15692ebb
+
+Reported-by: Kristoffer Gleditsch
+Fixes #8559
+Closes #8560
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/911714d617c106ed5d553bf003e34ec94ab6a136]
+
+Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
+
+---
+ lib/vtls/openssl.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/lib/vtls/openssl.c b/lib/vtls/openssl.c
+index 616a510..1bafe96 100644
+--- a/lib/vtls/openssl.c
++++ b/lib/vtls/openssl.c
+@@ -1808,7 +1808,8 @@ CURLcode Curl_ossl_verifyhost(struct Curl_easy *data, struct connectdata *conn,
+               memcpy(peer_CN, ASN1_STRING_get0_data(tmp), peerlen);
+               peer_CN[peerlen] = '\0';
+             }
+-            result = CURLE_OUT_OF_MEMORY;
++            else
++              result = CURLE_OUT_OF_MEMORY;
+           }
+         }
+         else /* not a UTF8 name */
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index ba3fd11820..d5dfe62a39 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -23,6 +23,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2022-27779.patch \
            file://CVE-2022-27782-1.patch \
            file://CVE-2022-27782-2.patch \
+           file://0001-openssl-fix-CN-check-error-code.patch \
            "
 SRC_URI[sha256sum] = "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
 
-- 
2.25.1


