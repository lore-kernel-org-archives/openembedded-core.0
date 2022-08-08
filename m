Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34DECC3F6B0
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 14:46:19 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.26548.1659969974464079228
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 07:46:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WEU3dnge;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id bv3so11155023wrb.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 07:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc;
        bh=AuFOaIcWJUSsOLwrQa33S/H1X1QfZgFzxmautNhsqJA=;
        b=WEU3dngejDW9ykEXX8tV2hZ+7UVYorznVXWRcYz0ao9N/3wzqdAjGvoYuzKczgnhfc
         At5pa99V3AnLX8DgkPqNJgsX1+TcvFYRvbo48Bj0VoJNr/SCBOAjMn6A7SjJGstJOWWu
         bfJg+GJq7829Xoi7x+B2QnHISGrASpj48pq14=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc;
        bh=AuFOaIcWJUSsOLwrQa33S/H1X1QfZgFzxmautNhsqJA=;
        b=yIDxhPR2boLl/jvjg8QsFTjahcNECrxgPnuakQdZn88DjsODVv1UViNpTQo4Gu/o+p
         C7L5tR+QsyTr5vubw7xdJSf9CspjlmTkOXOr9DoWyOVsH2jW+5YglIYVMpaSBRE3oLa1
         0fSmNLs00DMwg881+pY4WQzxDa6rTbNSdVzQzmNax/d+eyzyx1vVDz2CFboBiuBOw1Eq
         sdbIRwIXxEM5PS8vBNtgu6VrH+4e0/jVO1T15O766cKrtZlXsOFC96fT/xztfPTEO2b6
         A/i3V0rOBgWgSmCfJZJ1B7GEtp3wOmApQM4i62IEPcIi1ugtboUtUMR29c56sBdWcRVm
         zqAQ==
X-Gm-Message-State: ACgBeo0D6e/s1YRzAwihm19zAk1e/Dod+cyKVQuNZtQbiYevX1P+TwqY
	wZkmZWwWeIjaJV4CXa2Xm7DgEyzrBn31dg==
X-Google-Smtp-Source: 
 AA6agR7EGvTSFeUnUJ2Ecj/sz3xXrv65j0AVf5WG7ocmcacWr5TY+xcAEB+QfuCr/rCfLa+oXpiRZQ==
X-Received: by 2002:adf:e588:0:b0:21f:ace:dd82 with SMTP id
 l8-20020adfe588000000b0021f0acedd82mr11465984wrm.226.1659969972628;
        Mon, 08 Aug 2022 07:46:12 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:d3ed:8697:1d83:a16])
        by smtp.gmail.com with ESMTPSA id
 p13-20020a1c544d000000b003a3211112f8sm13900255wmi.46.2022.08.08.07.46.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 07:46:12 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] rust-common: Remove conflict with utils create_wrapper
Date: Mon,  8 Aug 2022 15:46:10 +0100
Message-Id: <20220808144611.59125-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 14:46:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169091

utils already has a create_wrapper function which I tried to use from cargo
and got unexpected results. Rename the rust function to avoid this conflict
of named.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/rust-common.bbclass | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/classes/rust-common.bbclass b/meta/classes/rust-common.bbclass
index 8ee05f57f86..4c1a63df0dc 100644
--- a/meta/classes/rust-common.bbclass
+++ b/meta/classes/rust-common.bbclass
@@ -114,7 +114,7 @@ RUST_TARGET_CXX = "${WRAPPER_DIR}/target-rust-cxx"
 RUST_TARGET_CCLD = "${WRAPPER_DIR}/target-rust-ccld"
 RUST_TARGET_AR = "${WRAPPER_DIR}/target-rust-ar"
 
-create_wrapper () {
+create_wrapper_rust () {
 	file="$1"
 	shift
 	extras="$1"
@@ -148,22 +148,22 @@ do_rust_create_wrappers () {
 	mkdir -p "${WRAPPER_DIR}"
 
 	# Yocto Build / Rust Host C compiler
-	create_wrapper "${RUST_BUILD_CC}" "" "${BUILD_CC}"
+	create_wrapper_rust "${RUST_BUILD_CC}" "" "${BUILD_CC}"
 	# Yocto Build / Rust Host C++ compiler
-	create_wrapper "${RUST_BUILD_CXX}" "" "${BUILD_CXX}"
+	create_wrapper_rust "${RUST_BUILD_CXX}" "" "${BUILD_CXX}"
 	# Yocto Build / Rust Host linker
-	create_wrapper "${RUST_BUILD_CCLD}" "" "${BUILD_CCLD}" "${BUILD_LDFLAGS}"
+	create_wrapper_rust "${RUST_BUILD_CCLD}" "" "${BUILD_CCLD}" "${BUILD_LDFLAGS}"
 	# Yocto Build / Rust Host archiver
-	create_wrapper "${RUST_BUILD_AR}" "" "${BUILD_AR}"
+	create_wrapper_rust "${RUST_BUILD_AR}" "" "${BUILD_AR}"
 
 	# Yocto Target / Rust Target C compiler
-	create_wrapper "${RUST_TARGET_CC}" "${WRAPPER_TARGET_EXTRALD}" "${WRAPPER_TARGET_CC}" "${WRAPPER_TARGET_LDFLAGS}"
+	create_wrapper_rust "${RUST_TARGET_CC}" "${WRAPPER_TARGET_EXTRALD}" "${WRAPPER_TARGET_CC}" "${WRAPPER_TARGET_LDFLAGS}"
 	# Yocto Target / Rust Target C++ compiler
-	create_wrapper "${RUST_TARGET_CXX}" "${WRAPPER_TARGET_EXTRALD}" "${WRAPPER_TARGET_CXX}" "${CXXFLAGS}"
+	create_wrapper_rust "${RUST_TARGET_CXX}" "${WRAPPER_TARGET_EXTRALD}" "${WRAPPER_TARGET_CXX}" "${CXXFLAGS}"
 	# Yocto Target / Rust Target linker
-	create_wrapper "${RUST_TARGET_CCLD}" "${WRAPPER_TARGET_EXTRALD}" "${WRAPPER_TARGET_CCLD}" "${WRAPPER_TARGET_LDFLAGS}"
+	create_wrapper_rust "${RUST_TARGET_CCLD}" "${WRAPPER_TARGET_EXTRALD}" "${WRAPPER_TARGET_CCLD}" "${WRAPPER_TARGET_LDFLAGS}"
 	# Yocto Target / Rust Target archiver
-	create_wrapper "${RUST_TARGET_AR}" "" "${WRAPPER_TARGET_AR}"
+	create_wrapper_rust "${RUST_TARGET_AR}" "" "${WRAPPER_TARGET_AR}"
 
 }
 
-- 
2.34.1


