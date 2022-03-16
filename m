Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8D5BC433EF
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 20:33:31 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web12.1958.1647462810940817996
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 13:33:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Z5gP297m;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id u16so3588749wru.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 13:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=d7rCKdixTV4FrZnqd2c+JH1NXujwddZUoQ/DlUcHC6o=;
        b=Z5gP297mEBCmVU7+3gS84os5BVb0oafYAbUfW2/tLtpRfCYs1CfQ+D1SLu1LT3er0o
         0rRFfhRruWz/8Vr5uPVLqPimEHVi7Hmwy9vLpUMkHZ6RPF0ZBBKm9rlep5fHWMx/yC1G
         wM1M+bsLJTBLvG0ttD3+k4p463GpYIRJEn7PM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d7rCKdixTV4FrZnqd2c+JH1NXujwddZUoQ/DlUcHC6o=;
        b=l0CF5yTzRv8REXaBCGDFnHFvHRsTgLqMcvWz1wEIWxfCCMpfT6rgsDOreKm0Pbajy7
         1qC51xwC4AljfsAZX1qxEdbX9hircYJKz4ZQVOJtkWGlRpARg4hhSjCMHIOGbZ41uwM4
         1M0PO4E5r2WB/gSJGuCSsyNN5/GWezHdJYGScSYeBWJNISCKg4zpWAqJF41JgeQVAomA
         1ENeYPhxk4rykg9/rGfc2vRp8uiiUCtwwYxYZLgbc+dSpXcUxW4/jssQ6HmdMVR1X+nr
         JkTb6PZAxNBsXmcZuQt0A7wb6ciNmdS7Z3mg6PY5Vn23IrzA1myDhguk8/L/10MM0Ih+
         m9fw==
X-Gm-Message-State: AOAM530dOMfMlbyzqOwQElbFQRsI88za6OEBpDWIbcsxX29Qi4tRDc9N
	XEeH0ZgIxg0YslBOyuQBUmyiI3s4cNPxDeiR
X-Google-Smtp-Source: 
 ABdhPJwZy9CNQjImtfiAyXrkbgw/sZrPS81tX9BveMq8WGNTOreTU4rcm9RRuP1dBMdaMxZrBlkgww==
X-Received: by 2002:a5d:608e:0:b0:203:e8a3:36f3 with SMTP id
 w14-20020a5d608e000000b00203e8a336f3mr350046wrt.176.1647462809224;
        Wed, 16 Mar 2022 13:33:29 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:bc44:1420:18a9:e343])
        by smtp.gmail.com with ESMTPSA id
 u11-20020a05600c19cb00b00389efe9c512sm6520630wmq.23.2022.03.16.13.33.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 13:33:28 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] rust-cross: Add rust-crosssdk variant for nativesdk use
Date: Wed, 16 Mar 2022 20:33:26 +0000
Message-Id: <20220316203327.950175-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220316203327.950175-1-richard.purdie@linuxfoundation.org>
References: <20220316203327.950175-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Mar 2022 20:33:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163357

Allow nativesdk recipes to find a correct version of the rust cross
compiler.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/rust/rust-cross.inc          | 7 -------
 meta/recipes-devtools/rust/rust-cross_1.59.0.bb    | 6 ++++++
 meta/recipes-devtools/rust/rust-crosssdk_1.59.0.bb | 8 ++++++++
 3 files changed, 14 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-devtools/rust/rust-crosssdk_1.59.0.bb

diff --git a/meta/recipes-devtools/rust/rust-cross.inc b/meta/recipes-devtools/rust/rust-cross.inc
index a77f7d51223..f6babfeedaa 100644
--- a/meta/recipes-devtools/rust/rust-cross.inc
+++ b/meta/recipes-devtools/rust/rust-cross.inc
@@ -1,6 +1,3 @@
-require rust.inc
-inherit cross
-
 python do_rust_gen_targets () {
     wd = d.getVar('WORKDIR') + '/targets/'
     # It is important 'TARGET' is last here so that it overrides our less
@@ -30,12 +27,8 @@ INHIBIT_DEFAULT_RUST_DEPS = "1"
 # so it might make sense to take it's mapping. For now, though, we just mention
 # the bits we need explicitly.
 DEPENDS += "rust-llvm-native"
-DEPENDS += "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}compilerlibs virtual/libc"
 DEPENDS += "rust-native"
 
-PROVIDES = "virtual/${TARGET_PREFIX}rust"
-PN = "rust-cross-${TUNE_PKGARCH}-${TCLIBC}"
-
 # In the cross compilation case, rustc doesn't seem to get the rpath quite
 # right. It manages to include '../../lib/${TARGET_PREFIX}', but doesn't
 # include the '../../lib' (ie: relative path from cross_bindir to normal
diff --git a/meta/recipes-devtools/rust/rust-cross_1.59.0.bb b/meta/recipes-devtools/rust/rust-cross_1.59.0.bb
index 3179d395d25..5358d98da85 100644
--- a/meta/recipes-devtools/rust/rust-cross_1.59.0.bb
+++ b/meta/recipes-devtools/rust/rust-cross_1.59.0.bb
@@ -1,2 +1,8 @@
+require rust.inc
+inherit cross
 require rust-cross.inc
 require rust-source.inc
+
+DEPENDS += "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}compilerlibs virtual/libc"
+PROVIDES = "virtual/${TARGET_PREFIX}rust"
+PN = "rust-cross-${TUNE_PKGARCH}-${TCLIBC}"
diff --git a/meta/recipes-devtools/rust/rust-crosssdk_1.59.0.bb b/meta/recipes-devtools/rust/rust-crosssdk_1.59.0.bb
new file mode 100644
index 00000000000..5929978591f
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust-crosssdk_1.59.0.bb
@@ -0,0 +1,8 @@
+require rust.inc
+inherit crosssdk
+require rust-cross.inc
+require rust-source.inc
+
+DEPENDS += "virtual/${TARGET_PREFIX}gcc-crosssdk virtual/nativesdk-${TARGET_PREFIX}compilerlibs virtual/nativesdk-libc"
+PROVIDES = "virtual/nativesdk-${TARGET_PREFIX}rust"
+PN = "rust-crosssdk-${TUNE_PKGARCH}-${TCLIBC}"
-- 
2.32.0


