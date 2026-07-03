Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C10EC44500
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 08:30:20 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.88754.1783067410970143809
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2026 01:30:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FOLcYhWl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47488efcf30so185639f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 01:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1783067409; x=1783672209; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6UGwTiooNkZDSm54+TeG2i+NLqo2NZb7hARVL1r+9cc=;
        b=FOLcYhWl7ViVbzgyeoA2pnA+KeLt9Ke5kXzrJc4IJWlTgJ8X561fAOrqTftJxxeyhe
         uhIDlvHWx7kRj0tJZjzDzlUN1ibck91v2eS81jL2iDkpVuuiwcHV5hzFFpO4FswFq5x2
         AvYVwvSlYP0wf6U5shAaEAUpR9rZL3aub16tE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783067409; x=1783672209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6UGwTiooNkZDSm54+TeG2i+NLqo2NZb7hARVL1r+9cc=;
        b=bJwSreBiCqE9EzoI3Fv2ISf1dcUWje38J/gUDzjGJf7WKtyf/rvx6AbJIzcwa9G3HJ
         1ey65/G3Nm4y7BNAtzUsPvOEew2L+TNu8mP4HwOj83yCZXvzvyCbmPa5TcU9jKFeB2Pt
         NRstnh80Acxw4FKC8imxb0skd4iIW4v7VfleCobYGn68q1ck9/t4hx/DwhPOvYp3HNSL
         gLNx6wgCby5sG4B72HlISzaxsH1t/nTLS+zF0ER3vMkWJDnBXMPFNMTfI4/URTqsL+gi
         7QVJALiccyZR4t5Bbty0S76a06qQXvIANNGabo/NUw0VfyA+p5ho7xDNUrTFjo1rLQjE
         10uA==
X-Gm-Message-State: AOJu0YyscnQt+FnEFvuddCtoRrcfsSK3DQLeLVKYucXSTfcTzVPnGHj0
	Zf06sCOdskuZ3Dw08AH4q2gUwd2S2oDpAPv+wlHrG3uRbybp5jK269fccFqAIETVusO+npi+ZBI
	68EGhNrA=
X-Gm-Gg: AfdE7cmanjoaPUUNNS4yF2vm4Nv3tMcmFT9H70orZcBPOzKs6dT/wsL2fTmCzL38B8t
	tXq5Ive/fM5dl1+OTa9u4L6mHh0ywtY25tzYoA5PxMz5/ghqiu3VO5KFW1Lhw1UpgeFHJx488qq
	47mm0PYrc1smpRGtNcn5H+mGL0ez5npDU9V2mBhb719dCUe7FNyssCFhqAXyVhpX0RWLG7askjW
	rPV3D3xLIuv5xFfrxJ97VMaUeP980em+IpfQbFHQx6iy+ucVAI4QBjAkjkUJsLOzWK7qJWbfycb
	DOrUarD/0AFOGdJb0pPXlkeXRCC/ysRe00mkcmct/SFIxEoyyEd6gvwesp1YDaxuNrtS/qVRTGP
	S5ZWtr0Sv/1NH7RoBdJmASt/cXY7a+D1NDuiaoj9g/t7nTpEcw+M4jBa74etZpCeq2Sr/ElVvy2
	tfz6dEoSQFKIQyeGjrVR/FWPiyddfZi45Kkwf4FSOs2liKFNeG+kGt
X-Received: by 2002:a5d:5850:0:b0:478:5710:464e with SMTP id ffacd0b85a97d-4785710478bmr8223495f8f.49.1783067408682;
        Fri, 03 Jul 2026 01:30:08 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ad8d:cf49:9149:eae0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db3dbb79sm15684554f8f.2.2026.07.03.01.30.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:30:07 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 11/15] python3-rpds-py: upgrade 2026.5.1 -> 2026.6.3
Date: Fri,  3 Jul 2026 09:29:51 +0100
Message-ID: <20260703082955.1585712-11-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703082955.1585712-1-richard.purdie@linuxfoundation.org>
References: <20260703082955.1585712-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 08:30:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240093

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/python3-rpds-py-crates.inc         | 28 +++++++------------
 ...026.5.1.bb => python3-rpds-py_2026.6.3.bb} |  2 +-
 2 files changed, 11 insertions(+), 19 deletions(-)
 rename meta/recipes-devtools/python/{python3-rpds-py_2026.5.1.bb => python3-rpds-py_2026.6.3.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-rpds-py-crates.inc b/meta/recipes-devtools/python/python3-rpds-py-crates.inc
index 9556b6f5936..16091415ef8 100644
--- a/meta/recipes-devtools/python/python3-rpds-py-crates.inc
+++ b/meta/recipes-devtools/python/python3-rpds-py-crates.inc
@@ -3,22 +3,18 @@
 # from Cargo.lock
 SRC_URI += " \
     crate://crates.io/archery/1.2.2 \
-    crate://crates.io/cc/1.2.48 \
-    crate://crates.io/find-msvc-tools/0.1.5 \
     crate://crates.io/heck/0.5.0 \
     crate://crates.io/libc/0.2.177 \
     crate://crates.io/once_cell/1.21.3 \
     crate://crates.io/portable-atomic/1.11.1 \
     crate://crates.io/proc-macro2/1.0.103 \
-    crate://crates.io/pyo3/0.28.3 \
-    crate://crates.io/pyo3-build-config/0.28.3 \
-    crate://crates.io/pyo3-ffi/0.28.3 \
-    crate://crates.io/pyo3-macros/0.28.3 \
-    crate://crates.io/pyo3-macros-backend/0.28.3 \
-    crate://crates.io/python3-dll-a/0.2.14 \
+    crate://crates.io/pyo3/0.29.0 \
+    crate://crates.io/pyo3-build-config/0.29.0 \
+    crate://crates.io/pyo3-ffi/0.29.0 \
+    crate://crates.io/pyo3-macros/0.29.0 \
+    crate://crates.io/pyo3-macros-backend/0.29.0 \
     crate://crates.io/quote/1.0.42 \
     crate://crates.io/rpds/1.2.1 \
-    crate://crates.io/shlex/1.3.0 \
     crate://crates.io/smallvec/1.15.1 \
     crate://crates.io/syn/2.0.111 \
     crate://crates.io/target-lexicon/0.13.3 \
@@ -27,22 +23,18 @@ SRC_URI += " \
 "
 
 SRC_URI[archery-1.2.2.sha256sum] = "70e0a5f99dfebb87bb342d0f53bb92c81842e100bbb915223e38349580e5441d"
-SRC_URI[cc-1.2.48.sha256sum] = "c481bdbf0ed3b892f6f806287d72acd515b352a4ec27a208489b8c1bc839633a"
-SRC_URI[find-msvc-tools-0.1.5.sha256sum] = "3a3076410a55c90011c298b04d0cfa770b00fa04e1e3c97d3f6c9de105a03844"
 SRC_URI[heck-0.5.0.sha256sum] = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
 SRC_URI[libc-0.2.177.sha256sum] = "2874a2af47a2325c2001a6e6fad9b16a53b802102b528163885171cf92b15976"
 SRC_URI[once_cell-1.21.3.sha256sum] = "42f5e15c9953c5e4ccceeb2e7382a716482c34515315f7b03532b8b4e8393d2d"
 SRC_URI[portable-atomic-1.11.1.sha256sum] = "f84267b20a16ea918e43c6a88433c2d54fa145c92a811b5b047ccbe153674483"
 SRC_URI[proc-macro2-1.0.103.sha256sum] = "5ee95bc4ef87b8d5ba32e8b7714ccc834865276eab0aed5c9958d00ec45f49e8"
-SRC_URI[pyo3-0.28.3.sha256sum] = "91fd8e38a3b50ed1167fb981cd6fd60147e091784c427b8f7183a7ee32c31c12"
-SRC_URI[pyo3-build-config-0.28.3.sha256sum] = "e368e7ddfdeb98c9bca7f8383be1648fd84ab466bf2bc015e94008db6d35611e"
-SRC_URI[pyo3-ffi-0.28.3.sha256sum] = "7f29e10af80b1f7ccaf7f69eace800a03ecd13e883acfacc1e5d0988605f651e"
-SRC_URI[pyo3-macros-0.28.3.sha256sum] = "df6e520eff47c45997d2fc7dd8214b25dd1310918bbb2642156ef66a67f29813"
-SRC_URI[pyo3-macros-backend-0.28.3.sha256sum] = "c4cdc218d835738f81c2338f822078af45b4afdf8b2e33cbb5916f108b813acb"
-SRC_URI[python3-dll-a-0.2.14.sha256sum] = "d381ef313ae70b4da5f95f8a4de773c6aa5cd28f73adec4b4a31df70b66780d8"
+SRC_URI[pyo3-0.29.0.sha256sum] = "cd274650b21d4bfc26a0a47587962c1edb425f69287324355cd040c3ea66071c"
+SRC_URI[pyo3-build-config-0.29.0.sha256sum] = "c5e2a7d2f0d013342f295c048ad19237add5154a55b1c5a254c0ec93d4109078"
+SRC_URI[pyo3-ffi-0.29.0.sha256sum] = "ca85c467da1bbc8d866eea5deff9cf29ea5f7785054a17da36e65bda9c05845b"
+SRC_URI[pyo3-macros-0.29.0.sha256sum] = "9ac53762fd065daa3194dd09337a38bd793a188100fd1a9304c4ab312d901771"
+SRC_URI[pyo3-macros-backend-0.29.0.sha256sum] = "4ca3a1557399783172dc5bf39cfca835157732532cba56b71d2292161e53b362"
 SRC_URI[quote-1.0.42.sha256sum] = "a338cc41d27e6cc6dce6cefc13a0729dfbb81c262b1f519331575dd80ef3067f"
 SRC_URI[rpds-1.2.1.sha256sum] = "e025feb26210bc196b908e72deb063b1b4000754304341cbc168a1e72c857ebc"
-SRC_URI[shlex-1.3.0.sha256sum] = "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64"
 SRC_URI[smallvec-1.15.1.sha256sum] = "67b1b7a3b5fe4f1376887184045fcf45c69e92af734b7aaddc05fb777b6fbd03"
 SRC_URI[syn-2.0.111.sha256sum] = "390cc9a294ab71bdb1aa2e99d13be9c753cd2d7bd6560c77118597410c4d2e87"
 SRC_URI[target-lexicon-0.13.3.sha256sum] = "df7f62577c25e07834649fc3b39fafdc597c0a3527dc1c60129201ccfcbaa50c"
diff --git a/meta/recipes-devtools/python/python3-rpds-py_2026.5.1.bb b/meta/recipes-devtools/python/python3-rpds-py_2026.6.3.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-rpds-py_2026.5.1.bb
rename to meta/recipes-devtools/python/python3-rpds-py_2026.6.3.bb
index 7f1511589ff..5898649c3bf 100644
--- a/meta/recipes-devtools/python/python3-rpds-py_2026.5.1.bb
+++ b/meta/recipes-devtools/python/python3-rpds-py_2026.6.3.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/rpds-py/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7767fa537c4596c54141f32882c4a984"
 
-SRC_URI[sha256sum] = "07b24fea40541e28570e5b795a4a38fbdcd12550c06bd0748005ecc8116ca256"
+SRC_URI[sha256sum] = "1cebd1337c242e4ec2293e541f712b2da849b29f48f0c293684b71c0632625d4"
 
 require ${BPN}-crates.inc
 

