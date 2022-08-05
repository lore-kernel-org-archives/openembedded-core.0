Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 864C9C25B06
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 13:13:10 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.6825.1659705185985244244
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 06:13:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Dkhyust4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id bv3so3222418wrb.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 06:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=EtPeiC82RmhBSABZHo2Bu2yDRAMp+AksMVgArsTu4n0=;
        b=Dkhyust4n4Y/k3K+8NASBfgOiFzxWhOtRJ9u2fduV/ysyTaBY1/FRFh8xoRXDFH1jc
         K42P6gqhguwreOmplA7E+hOCg/jLrSKmnOaFzV42yrItNZ9I7e3fVe0xzVkJu2oV/C/V
         MhoqYB0s8zAUc5c6cW1xLrtiHXOoFDSo9aEGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=EtPeiC82RmhBSABZHo2Bu2yDRAMp+AksMVgArsTu4n0=;
        b=B7wyaxQrQMfBHOe+w7TIZd13St0pY/qExvDMy1lvrL5AB+8hnNelZuwhPRI4Ez5asV
         0+8JP92oqTNyITuQI/iA5RwgcJFWI2lsj2jrdiQrWNLyPXnNPUVUS++025AS3Ba65C5E
         wuKnsXHBQtvT4WTML/hvqTz8AtE0XoZu5g1qHC0bn4YPvyhoSA53xcJz1ZxNwb2e9Laf
         tb03Z1pOaFTqVzb+65LIzWLaMK+jfkWFyoyVq81BGM7+czJpQ4UPqSg03PIP1P1+iGPx
         ++g7EnjNf0p0+95+OIz4tq1+j/Wh/mydm6ZfNowEocwOPq+NCLzHkrGZCJF4PnYIFYCR
         hv7A==
X-Gm-Message-State: ACgBeo2XEvSniuwGZnH47ZqPnQ4LMwQYK1d/VSI3a8Aqj10gGTNxjEJt
	Q2qac7fPTth018wZB7QgYbeOw+gvilmFYg==
X-Google-Smtp-Source: 
 AA6agR6ExSt5W6HbH2PvP+p+KqBIbOc3P2HA9D6vVhISiVtj1TILF45ZqH+JnEE26ZqF5uxRXbdXJg==
X-Received: by 2002:a05:6000:1789:b0:220:626a:b69a with SMTP id
 e9-20020a056000178900b00220626ab69amr4316591wrg.579.1659705184272;
        Fri, 05 Aug 2022 06:13:04 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f483:fcb0:1452:5a5a])
        by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c204c00b003a51a0d35e7sm1908901wmg.37.2022.08.05.06.13.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 06:13:03 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 12/29] rust.inc: Fix cross build llvm-config handling
Date: Fri,  5 Aug 2022 14:12:35 +0100
Message-Id: <20220805131252.3706794-12-richard.purdie@linuxfoundation.org>
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
 https://lists.openembedded.org/g/openembedded-core/message/168946

We need llvm-config for the target but the cross compiled target binary is
no good. We can copy the native one into the target location where it will
then return the target values though.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/rust/rust.inc | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust.inc b/meta/recipes-devtools/rust/rust.inc
index 30f2b71fe8c..47b76e725de 100644
--- a/meta/recipes-devtools/rust/rust.inc
+++ b/meta/recipes-devtools/rust/rust.inc
@@ -18,7 +18,8 @@ export RUST_TARGET_PATH="${WORKDIR}/targets/"
 export FORCE_CRATE_HASH="${BB_TASKHASH}"
 
 RUST_ALTERNATE_EXE_PATH ?= "${STAGING_LIBDIR}/llvm-rust/bin/llvm-config"
-export YOCTO_ALTERNATE_EXE_PATH = "${RUST_ALTERNATE_EXE_PATH}"
+RUST_ALTERNATE_EXE_PATH_NATIVE = "${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-config"
+
 export YOCTO_ALTERNATE_MULTILIB_NAME = "/${BASELIB}"
 
 # We don't want to use bitbakes vendoring because the rust sources do their
@@ -82,8 +83,9 @@ python do_configure() {
     host_section = "target.{}".format(d.getVar('RUST_TARGET_SYS', True))
     config.add_section(host_section)
 
-    llvm_config = d.expand("${YOCTO_ALTERNATE_EXE_PATH}")
-    config.set(host_section, "llvm-config", e(llvm_config))
+    llvm_config_target = d.expand("${RUST_ALTERNATE_EXE_PATH}")
+    llvm_config_build = d.expand("${RUST_ALTERNATE_EXE_PATH_NATIVE}")
+    config.set(host_section, "llvm-config", e(llvm_config_target))
 
     config.set(host_section, "cxx", e(d.expand("${RUST_TARGET_CXX}")))
     config.set(host_section, "cc", e(d.expand("${RUST_TARGET_CC}")))
@@ -93,7 +95,7 @@ python do_configure() {
     build_section = "target.{}".format(d.getVar('SNAPSHOT_BUILD_SYS', True))
     config.add_section(build_section)
 
-    config.set(build_section, "llvm-config", e(llvm_config))
+    config.set(build_section, "llvm-config", e(llvm_config_build))
 
     config.set(build_section, "cxx", e(d.expand("${RUST_BUILD_CXX}")))
     config.set(build_section, "cc", e(d.expand("${RUST_BUILD_CC}")))
@@ -169,6 +171,14 @@ rust_runx () {
     unset CXXFLAGS
     unset CPPFLAGS
 
+    # Copy the natively built llvm-config into the target so we can run it. Horrible,
+    # but works!
+    if [ ${RUST_ALTERNATE_EXE_PATH_NATIVE} != ${RUST_ALTERNATE_EXE_PATH} ]; then
+        mkdir -p `dirname ${RUST_ALTERNATE_EXE_PATH}`
+        cp ${RUST_ALTERNATE_EXE_PATH_NATIVE} ${RUST_ALTERNATE_EXE_PATH}
+        chrpath -d ${RUST_ALTERNATE_EXE_PATH}
+    fi
+
     oe_cargo_fix_env
 
     python3 src/bootstrap/bootstrap.py ${@oe.utils.parallel_make_argument(d, '-j %d')} "$@" --verbose
-- 
2.34.1


