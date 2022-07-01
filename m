Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90E51CCA479
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 16:12:20 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web12.40664.1656691932601829659
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 09:12:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KwdZ02WE;
 spf=pass (domain: gmail.com, ip: 209.85.221.51,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id i1so3874907wrb.11
        for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 09:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YwYDb8z6iLPgEYwnd4sdhigoOEwrVopYOSZ9c8Q4Jfk=;
        b=KwdZ02WEnKsTy2vDJnA4irHXup8HfHwKcQ4U3cK2o4vdflMObmMeqmLEqNz3730sJL
         oX5L+KDOsjXQ22Z61YcqR8GYrlT2cVIjv/kSVyBaWAAwDZiC4ISUieYUqsbBVdqMSRdq
         70B9HDMXRkwIrls4rK/g5j3EYhJB3eBDdv/1SgK0HddpoBUOUM0r1UNp/VwzD7scZvIm
         DbkWWN8QFpiFKC1Fz1xUqhglaS4XYy7Fcclq+QAQyOXaf4nlKjZ6F8rGZv1OuczUaCwZ
         N9OI0aO/kIs7fLot2KxJipLY7drGfTuHQ8972sHJVv58bz2maRCyJzEQ2wESqz3vVK3u
         nBmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YwYDb8z6iLPgEYwnd4sdhigoOEwrVopYOSZ9c8Q4Jfk=;
        b=cvEIOruxdZHQPdSryEBv0U74vrpCX6vDytm08TV5ZmNQYA8SlZyMfzI0nXo9VpPehk
         8Npo886dIP8bAMkjA7JYGQLTfsC47pjn9cYWbabU45lc/8Sbl4pXlyPtewAESfDlj7K9
         6Bo/hTRtWeXPAHh0dJXd2hfe6B094l6yAkpJgMFNkhrQyGL7E7emeLp+t7IxXVmVwmI2
         upqPxdv5pmNBX32ncJr4Asb+FDM/4lXfga0Vq9F4vomqjAjIs2AtT2aeyM19wBMl4dt0
         ThGyJfMB7vf9DOhPPjqbk7PgE3ut1Ox22ZIyCi7MHY34/Q9+YbORLCGactphiyi5VBYv
         FD4Q==
X-Gm-Message-State: AJIora81wkKJzbe4vD50QVInhfN7iZJ4wSVMdCg//Uqoog+wt6L70X4X
	i8aBkgLRXh8HaCzLg/4EQ+lAATGmYT7UUQ==
X-Google-Smtp-Source: 
 AGRyM1tlw/bC4N63aqsPjlVUpD1C+aLyCZxwKc2jbRBpbt955CdQZz6mrZJWaxF7LrrAAZV89f8tAg==
X-Received: by 2002:adf:ee4c:0:b0:21b:81ae:79cf with SMTP id
 w12-20020adfee4c000000b0021b81ae79cfmr14219326wro.121.1656691930718;
        Fri, 01 Jul 2022 09:12:10 -0700 (PDT)
Received: from fio.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 g13-20020adffc8d000000b0021b99efceb6sm22961512wrr.22.2022.07.01.09.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 09:12:09 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: ricardo@foundries.io,
	daiane.angolini@foundries.io,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: [OE-core][kirkstone][PATCH] curl: backport openssl fix CN check error
 code
Date: Fri,  1 Jul 2022 17:12:05 +0100
Message-Id: <20220701161205.112341-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 16:12:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167535

Fix out of memory [1]

OpenSSL host verification + hostname in certificate CN only seems broken in 7.82.0

[1] https://github.com/curl/curl/issues/8559

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 ...0001-openssl-fix-CN-check-error-code.patch | 38 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/0001-openssl-fix-CN-check-error-code.patch

diff --git a/meta/recipes-support/curl/curl/0001-openssl-fix-CN-check-error-code.patch b/meta/recipes-support/curl/curl/0001-openssl-fix-CN-check-error-code.patch
new file mode 100644
index 0000000000..c5aa8f2d60
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
+Upstream-Status: Backported [https://github.com/curl/curl/commit/911714d617c106ed5d553bf003e34ec94ab6a136]
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
2.37.0


