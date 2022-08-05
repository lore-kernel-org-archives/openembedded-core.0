Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90A33C282E7
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 13:13:10 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web12.6771.1659705181226824020
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 06:13:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BRajBH3C;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id
 i128-20020a1c3b86000000b003a3a22178beso3958400wma.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 06:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=K6DtOh7EoROS8kNyDWx2h1QFJhoL30l0OmGvFv8rZB8=;
        b=BRajBH3C2Zj8DVfwBMDy78NVvGwPbeYrC2RPAfl/B+MFdDrNWGQZriUBGD85ZI8dzE
         /ydDiBHVaNaodTxW+d5P4fbJZKAFsZxkcL8p2W0TjYUd/JzkqYZPH5FIgg5nl+xmm3dt
         11ejHkFsCc6yFbAzx7915zEhIJ+JPtBl1qg4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=K6DtOh7EoROS8kNyDWx2h1QFJhoL30l0OmGvFv8rZB8=;
        b=HqU5mFZxTKR9t3wF3FR+bbCUB3RgKaDkIR9rSePE7LJz+cGOKXeIQ39aWWIpOfGdnC
         U90+RQA6lo15ZiRiLy8Tl6dE5YMNhev+BtQ/2GJbEBI1LDYvj0gZuMzviRLlQZQ08voc
         55QT667CjvPHxbLy0cZP2ELjNVqKTWBKi4NVVP8CQ7gcS2rZ4N+KVYp9agt0C1XjLPzd
         vz+UMK/DGgj6iLFf3Lz861P3CxVXncbPfRlRf0VwcgwamJk22w0PpgL2HDwUdVi0SCTT
         QUNGlkID8BMrTlAwIXH8u3qr8YkwLgVoWGdJcYn2tWppkymJc83JyJrjhEBE8xeue6kH
         m2sA==
X-Gm-Message-State: ACgBeo1fK+0cdjEAgr7PZIcuEe03NcncGKh7WMRcOR8iWOYNY9Bpj7gY
	KYezbZdlJpYe+Cs9PvySOlslsikAeX8LCg==
X-Google-Smtp-Source: 
 AA6agR5207I0sZkLw+t+O47NMs0A8huZiPMEOtMi/RN4q/9EjKLz+RgDdWsnfxgLrQqp9HcvXWsm7Q==
X-Received: by 2002:a05:600c:35d5:b0:3a3:2490:c984 with SMTP id
 r21-20020a05600c35d500b003a32490c984mr9888759wmq.162.1659705179440;
        Fri, 05 Aug 2022 06:12:59 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f483:fcb0:1452:5a5a])
        by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c204c00b003a51a0d35e7sm1908901wmg.37.2022.08.05.06.12.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 06:12:58 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/29] rust-common: Rework wrappers top handle musl
Date: Fri,  5 Aug 2022 14:12:31 +0100
Message-Id: <20220805131252.3706794-8-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220805131252.3706794-1-richard.purdie@linuxfoundation.org>
References: <20220805131252.3706794-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Aug 2022 13:13:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168942

For musl we need to be able to add a library to the end of the linker commandline.
Rework the wrapper code to be able to do this through a new variable.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/rust-common.bbclass | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/meta/classes/rust-common.bbclass b/meta/classes/rust-common.bbclass
index b79a829462c..1bce7761ab0 100644
--- a/meta/classes/rust-common.bbclass
+++ b/meta/classes/rust-common.bbclass
@@ -141,13 +141,18 @@ RUST_TARGET_AR = "${WRAPPER_DIR}/target-rust-ar"
 create_wrapper () {
 	file="$1"
 	shift
+	extras="$1"
+	shift
 
 	cat <<- EOF > "${file}"
 	#!/usr/bin/env python3
 	import os, sys
 	orig_binary = "$@"
+	extras = "${extras}"
 	binary = orig_binary.split()[0]
 	args = orig_binary.split() + sys.argv[1:]
+	if extras:
+	    args.append(extras)
 	os.execvp(binary, args)
 	EOF
 	chmod +x "${file}"
@@ -157,6 +162,7 @@ WRAPPER_TARGET_CC = "${CC}"
 WRAPPER_TARGET_CXX = "${CXX}"
 WRAPPER_TARGET_CCLD = "${CCLD}"
 WRAPPER_TARGET_LDFLAGS = "${LDFLAGS}"
+WRAPPER_TARGET_EXTRALD = ""
 WRAPPER_TARGET_AR = "${AR}"
 
 # compiler is used by gcc-rs
@@ -166,22 +172,22 @@ do_rust_create_wrappers () {
 	mkdir -p "${WRAPPER_DIR}"
 
 	# Yocto Build / Rust Host C compiler
-	create_wrapper "${RUST_BUILD_CC}" "${BUILD_CC}"
+	create_wrapper "${RUST_BUILD_CC}" "" "${BUILD_CC}"
 	# Yocto Build / Rust Host C++ compiler
-	create_wrapper "${RUST_BUILD_CXX}" "${BUILD_CXX}"
+	create_wrapper "${RUST_BUILD_CXX}" "" "${BUILD_CXX}"
 	# Yocto Build / Rust Host linker
-	create_wrapper "${RUST_BUILD_CCLD}" "${BUILD_CCLD}" "${BUILD_LDFLAGS}"
+	create_wrapper "${RUST_BUILD_CCLD}" "" "${BUILD_CCLD}" "${BUILD_LDFLAGS}"
 	# Yocto Build / Rust Host archiver
-	create_wrapper "${RUST_BUILD_AR}" "${BUILD_AR}"
+	create_wrapper "${RUST_BUILD_AR}" "" "${BUILD_AR}"
 
 	# Yocto Target / Rust Target C compiler
-	create_wrapper "${RUST_TARGET_CC}" "${WRAPPER_TARGET_CC}" "${WRAPPER_TARGET_LDFLAGS}"
+	create_wrapper "${RUST_TARGET_CC}" "${WRAPPER_TARGET_EXTRALD}" "${WRAPPER_TARGET_CC}" "${WRAPPER_TARGET_LDFLAGS}"
 	# Yocto Target / Rust Target C++ compiler
-	create_wrapper "${RUST_TARGET_CXX}" "${WRAPPER_TARGET_CXX}" "${CXXFLAGS}"
+	create_wrapper "${RUST_TARGET_CXX}" "${WRAPPER_TARGET_EXTRALD}" "${WRAPPER_TARGET_CXX}" "${CXXFLAGS}"
 	# Yocto Target / Rust Target linker
-	create_wrapper "${RUST_TARGET_CCLD}" "${WRAPPER_TARGET_CCLD}" "${WRAPPER_TARGET_LDFLAGS}"
+	create_wrapper "${RUST_TARGET_CCLD}" "${WRAPPER_TARGET_EXTRALD}" "${WRAPPER_TARGET_CCLD}" "${WRAPPER_TARGET_LDFLAGS}"
 	# Yocto Target / Rust Target archiver
-	create_wrapper "${RUST_TARGET_AR}" "${WRAPPER_TARGET_AR}"
+	create_wrapper "${RUST_TARGET_AR}" "" "${WRAPPER_TARGET_AR}"
 
 }
 
-- 
2.34.1


