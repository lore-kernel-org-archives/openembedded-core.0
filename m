Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2F46C624D5
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 11:58:03 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10721.1788350278987757925
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 04:57:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QqD4039b;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49954b88fffso7103025e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 04:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788350277; x=1788955077; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qZ1g5hXmqHwcFE4As7+z1MhahxjUrMQ22IBoljhKAJU=;
        b=QqD4039bz1v97LgT6yNW7/MjvfIFliGxYNGkneXPhwpQdlMWx1t271fut7hKIMZYLS
         p2kE19xj/BTKZ0VvGVVJv69cYm4Y+10yAM3xcmbYve1b/RcxX9tv/E7tb35XjguB7jCv
         xfSJnr65Z+Yu5qtDeGZanDINAdWATEM09YDmg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788350277; x=1788955077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qZ1g5hXmqHwcFE4As7+z1MhahxjUrMQ22IBoljhKAJU=;
        b=Pu1RCgy3uZ7SqnusIKX8gfk5i1Ig8wwh7d9Dql5AVG76lhnQ0rt9r+U7dLsNbvL44w
         F/es3tjs7aSSThbpK6sJrcxo07EFDxSKxtU3bFmEN42Gg6ilrSaXCIOV6PrH/XJmzZcg
         I8q3CQhsmuyHkP7Y07stfm09Bm0WEKrc7V8bkbccP3DIdw+DcFKVOQjc1JJ7A0IV9fwg
         cplcxh0YpVauiV5gHNqbth2WX6O+cqiGBAQK78Cj8QJk7wfAbBrA40xnqYJg25A/d5YB
         EZ+AQ+71Xul3OiLtNnZwhNxIiDEyQRvCT/49bj1bEE4Fla33xXqVlZfYo337puLoCoJ0
         O0Ag==
X-Gm-Message-State: AFuF++mbW5qXfemW0eXIGowsjbZmQVtzpyBc6V5/mOR59S98MAZU34Cm
	FtLYvalC34lKbPejwegA2ImkOSBN5fhTvmBZqT51uHFDjJAvRuhWW0JqTODCrPTiUmKOKFYyKx4
	XrRCGkyY=
X-Gm-Gg: AR+sD13TXeGDY/36sFm0ywk4VA5eFPLBwQ7LKRuJR7xegmA4aWzF3eMuD10IVwqQHJa
	LWs2nh6FTTwNvOltZoUtIpt3slT82voP4xp73nf7M+QMyvdzx8tp5T5qoYSdJNNdZFlzSm09kM/
	UZMgN3Yy7Zse8bXlaQAuk5Vo7aYuQPY7KpAnrEFX6VWefYuHEcnbm2a78pzt4e+7yBPjtZ6834O
	xVz6R3+2TRJhYnwoqJscr8AEdQ2texPAqk+nxcFOhfxLcJ038wdQxZmxHc9xJJsiXcGXCgu+uhG
	+DHH7C4/B62qq6HgD1TIk+JldM8q/FSPTSf/RmumjuRusXkf/PEN6olglCRVqSrCnnfn8Ml1wdU
	7RztAmwEV5eQIhCsB3FjC1CKQ10vJ/QRGkc+Shoh3z/8tAjQSl//Ci9NuEdI3soAnkU1Tdgzw8e
	SjtE0XYcoOp8x5UeANQfcqgIk1AQC7fgx7WBQh59gy4fQdMYEsXbE0k8MYc106r6BK1l3FDD+Qx
	b0f1rBQV80kooduzw==
X-Received: by 2002:a05:600c:6287:b0:499:ad2e:f7bc with SMTP id 5b1f17b1804b1-49ce5818eacmr72701845e9.10.1788350277068;
        Wed, 02 Sep 2026 04:57:57 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:89b1:8875:2e41:59f0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce47820e2sm66574265e9.13.2026.09.02.04.57.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 04:57:56 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] python3-uv-build: upgrade 0.12.6 -> 0.12.7
Date: Wed,  2 Sep 2026 12:57:51 +0100
Message-ID: <20260902115751.2762897-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902115751.2762897-1-richard.purdie@linuxfoundation.org>
References: <20260902115751.2762897-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 11:58:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244936

Python:
    Replace managed Python installations when upgrading to a newer build of the same version (#21323)

Enhancements:
    Support Linux s390x, ppc64le, and loongarch64 targets for cross-platform dependency resolution (#21313)
    Retry downloads with configured credentials when Azure Storage denies anonymous access to an endpoint configured via UV_AZURE_ENDPOINT_URL (#21318)

Preview features:
    Use content-based directory hashes to deduplicate extracted wheels in the cache with the content-addressed-cache preview feature (#19693)

Bug fixes:
    Reject source archives with hash mismatches before persisting their extracted contents to the cache (#21248)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/python3-uv-build-crates.inc        | 20 +++++++++----------
 ...d_0.12.6.bb => python3-uv-build_0.12.7.bb} |  2 +-
 2 files changed, 11 insertions(+), 11 deletions(-)
 rename meta/recipes-devtools/python/{python3-uv-build_0.12.6.bb => python3-uv-build_0.12.7.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-uv-build-crates.inc b/meta/recipes-devtools/python/python3-uv-build-crates.inc
index 8d76d041f3d..f6323e878fa 100644
--- a/meta/recipes-devtools/python/python3-uv-build-crates.inc
+++ b/meta/recipes-devtools/python/python3-uv-build-crates.inc
@@ -12,7 +12,7 @@ SRC_URI += " \
     crate://crates.io/anstyle-query/1.1.5 \
     crate://crates.io/anstyle-wincon/3.0.11 \
     crate://crates.io/anyhow/1.0.104 \
-    crate://crates.io/archive-trait/0.0.13 \
+    crate://crates.io/archive-trait/0.0.14 \
     crate://crates.io/arcstr/1.2.0 \
     crate://crates.io/arrayvec/0.7.8 \
     crate://crates.io/astral-tokio-tar/0.6.4 \
@@ -32,8 +32,8 @@ SRC_URI += " \
     crate://crates.io/bytecheck/0.8.2 \
     crate://crates.io/bytecheck_derive/0.8.2 \
     crate://crates.io/bytes/1.12.1 \
-    crate://crates.io/cap-primitives/4.0.2 \
-    crate://crates.io/cap-std/4.0.2 \
+    crate://crates.io/cap-primitives/4.0.3 \
+    crate://crates.io/cap-std/4.0.3 \
     crate://crates.io/cc/1.2.57 \
     crate://crates.io/cfg-if/1.0.4 \
     crate://crates.io/charset/0.1.5 \
@@ -214,8 +214,8 @@ SRC_URI += " \
     crate://crates.io/syn/2.0.118 \
     crate://crates.io/syn/3.0.3 \
     crate://crates.io/synstructure/0.13.2 \
-    crate://crates.io/tar-codec/0.0.13 \
-    crate://crates.io/tar-framing/0.0.13 \
+    crate://crates.io/tar-codec/0.0.14 \
+    crate://crates.io/tar-framing/0.0.14 \
     crate://crates.io/temp-env/0.3.6 \
     crate://crates.io/tempfile/3.27.0 \
     crate://crates.io/terminal_size/0.4.4 \
@@ -324,7 +324,7 @@ SRC_URI[anstyle-parse-1.0.0.sha256sum] = "52ce7f38b242319f7cabaa6813055467063ecd
 SRC_URI[anstyle-query-1.1.5.sha256sum] = "40c48f72fd53cd289104fc64099abca73db4166ad86ea0b4341abe65af83dadc"
 SRC_URI[anstyle-wincon-3.0.11.sha256sum] = "291e6a250ff86cd4a820112fb8898808a366d8f9f58ce16d1f538353ad55747d"
 SRC_URI[anyhow-1.0.104.sha256sum] = "330a5ed07fa54e4702c9d6c4174f74427fc0ef6e214bbd677ae50a5099946470"
-SRC_URI[archive-trait-0.0.13.sha256sum] = "dc23b595ad4092163eaf9c0c7532dd5b6d82274c21560c97dc03fa4e4f09e645"
+SRC_URI[archive-trait-0.0.14.sha256sum] = "c6080ea14ccf9019d7ce572c319e581c20a805c9bdc6dbfb9b988da003cbd1a3"
 SRC_URI[arcstr-1.2.0.sha256sum] = "03918c3dbd7701a85c6b9887732e2921175f26c350b4563841d0958c21d57e6d"
 SRC_URI[arrayvec-0.7.8.sha256sum] = "d3fb67a6e08acf24fdeccbac2cb6ac4305825bd1f117462e0e6f2f193345ad56"
 SRC_URI[astral-tokio-tar-0.6.4.sha256sum] = "b18457efd137254e016bbde5e1d88df61c4e1a5ae2223746e56123bac6af2463"
@@ -344,8 +344,8 @@ SRC_URI[bumpalo-3.20.2.sha256sum] = "5d20789868f4b01b2f2caec9f5c4e0213b41e3e5702
 SRC_URI[bytecheck-0.8.2.sha256sum] = "0caa33a2c0edca0419d15ac723dff03f1956f7978329b1e3b5fdaaaed9d3ca8b"
 SRC_URI[bytecheck_derive-0.8.2.sha256sum] = "89385e82b5d1821d2219e0b095efa2cc1f246cbf99080f3be46a1a85c0d392d9"
 SRC_URI[bytes-1.12.1.sha256sum] = "fc652a48c352aef3ea3aed32080501cf3ef6ed5da78602a020c991775b0aff04"
-SRC_URI[cap-primitives-4.0.2.sha256sum] = "cdadbd7c002d3a484b35243669abdae85a0ebaded5a61117169dc3400f9a7ff0"
-SRC_URI[cap-std-4.0.2.sha256sum] = "7281235d6e96d3544ca18bba9049be92f4190f8d923e3caef1b5f66cfa752608"
+SRC_URI[cap-primitives-4.0.3.sha256sum] = "8b5f74729fd2f44701d1a8eb47e906cdb3ccd9ec0f02baad85a744b791940b18"
+SRC_URI[cap-std-4.0.3.sha256sum] = "c1ec78e242cfa2cfe276807ac2ecc00315a6c97786977414bcd1c3963b6c91b8"
 SRC_URI[cc-1.2.57.sha256sum] = "7a0dd1ca384932ff3641c8718a02769f1698e7563dc6974ffd03346116310423"
 SRC_URI[cfg-if-1.0.4.sha256sum] = "9330f8b2ff13f34540b44e946ef35111825727b38d33286ef986142615121801"
 SRC_URI[charset-0.1.5.sha256sum] = "f1f927b07c74ba84c7e5fe4db2baeb3e996ab2688992e39ac68ce3220a677c7e"
@@ -526,8 +526,8 @@ SRC_URI[strsim-0.11.1.sha256sum] = "7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70
 SRC_URI[syn-2.0.118.sha256sum] = "1b9ae57f904213ebb649ce6895b8a66c66f0203b9319718f69a5612a065b1422"
 SRC_URI[syn-3.0.3.sha256sum] = "53e9bae58849f64dfa4f5d5ae372c8341f7305f82a3868709269343628b659a3"
 SRC_URI[synstructure-0.13.2.sha256sum] = "728a70f3dbaf5bab7f0c4b1ac8d7ae5ea60a4b5549c8a5914361c99147a709d2"
-SRC_URI[tar-codec-0.0.13.sha256sum] = "f718b1f470b8ff575d12c85c33bdc8b33743009669c7a5e1923b6583235a2258"
-SRC_URI[tar-framing-0.0.13.sha256sum] = "5aca504a58616b04eb381819c4ddfdf87b6d35f6699090e68d8b40954fb42da7"
+SRC_URI[tar-codec-0.0.14.sha256sum] = "7ea42eb144d30fcbf32c26dfea8959175bb8335bfb7b18d20c6ed32edecf0551"
+SRC_URI[tar-framing-0.0.14.sha256sum] = "783223a7a6590be4227cb821e7ce80372575511f67c824921aba0752d8ad5573"
 SRC_URI[temp-env-0.3.6.sha256sum] = "96374855068f47402c3121c6eed88d29cb1de8f3ab27090e273e420bdabcf050"
 SRC_URI[tempfile-3.27.0.sha256sum] = "32497e9a4c7b38532efcdebeef879707aa9f794296a4f0244f6f69e9bc8574bd"
 SRC_URI[terminal_size-0.4.4.sha256sum] = "230a1b821ccbd75b185820a1f1ff7b14d21da1e442e22c0863ea5f08771a8874"
diff --git a/meta/recipes-devtools/python/python3-uv-build_0.12.6.bb b/meta/recipes-devtools/python/python3-uv-build_0.12.7.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-uv-build_0.12.6.bb
rename to meta/recipes-devtools/python/python3-uv-build_0.12.7.bb
index de84e8d5ad0..00dcbc1ad14 100644
--- a/meta/recipes-devtools/python/python3-uv-build_0.12.6.bb
+++ b/meta/recipes-devtools/python/python3-uv-build_0.12.7.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
                     file://crates/uv-pep508/License-Apache;md5=e23fadd6ceef8c618fc1c65191d846fa \
                     file://crates/uv-pep508/License-BSD;md5=ef7a6027dc4c2389b9afad7e690274c7"
 
-SRC_URI[sha256sum] = "4756f1771d342ff8ff50b529ae23c58d58f14f097c243ca50d3778d0a23d24f0"
+SRC_URI[sha256sum] = "e04fe07cc9b6207a41e4971e04d85100edcd1be7fd9a6c889692f5092a9bd7cf"
 
 require ${BPN}-crates.inc
 

