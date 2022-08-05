Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0039C282E7
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 13:13:20 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web08.6587.1659705194196225206
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 06:13:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XqVgCrNE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id z12so3198457wrs.9
        for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 06:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=dJm3deYeEwWGNZaBphPaPpkPYhpoNBpT8PRYa5vF1fo=;
        b=XqVgCrNEJyUTaEV0jGvMrjOnO27ssaG+QmJ6sgY4HAbPSSt5d+v1gbj+LEWx9Lwbhj
         NNbg5HXbjHElatPpGwFUC9wZvTmcyS3Mydt1i9xm8rghuExQS1xbj/UoSvKzwnN+Zb9T
         3caTJ4FQeji4NbJjOG/hxoKFSuQ8uPgx9ADhM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=dJm3deYeEwWGNZaBphPaPpkPYhpoNBpT8PRYa5vF1fo=;
        b=63SodAPuqWMpALVCmntduHHc7ZOJZU5+okmSU4YLtFFwg3PfaXmvLhxIyV946YCHdP
         Lm009gSMmN83p6hwoNDqtkH8TW7oFxbM2XCrMyFMT4ni7X39siNo1WY+ViUDsi0x04Sj
         b50CqeEMH/GXJHB5Vne+hYP/xM+Fkh7KAEhk+ikImaJtI0Md9IgvE5BjnaqAjGRUDNI+
         pxoBHtPjG4Vx7mOOIZnPSQddTeR+pywHsLSeSlDhnhY/od5c0cQ65EtOTCh4R0T3j8a8
         jsocuRFiQ6Aos4syGLkO81Fg7gzTIoDbAhveQK58+kxD5SRiWG5QT3NKDVBuS9lWP8Xf
         amog==
X-Gm-Message-State: ACgBeo1Fd6xQ52qdLpBtuwAkXTl2Vnz5z1/clbQIIT0OBmEWu7m2rfcj
	96IfxDqZePO+LnWDGIrU6aMYutAn/7Nr5Q==
X-Google-Smtp-Source: 
 AA6agR6f8iFEDesKBZ+aEtg4C5Cjo1V8h2rhtHIlFNSPIr6l1CaJ0dZEEldpAFm5ZyxpCWU9b6jBCw==
X-Received: by 2002:a5d:40c7:0:b0:220:6407:6fc2 with SMTP id
 b7-20020a5d40c7000000b0022064076fc2mr4307458wrq.352.1659705192416;
        Fri, 05 Aug 2022 06:13:12 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f483:fcb0:1452:5a5a])
        by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c204c00b003a51a0d35e7sm1908901wmg.37.2022.08.05.06.13.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 06:13:12 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 19/29] rust.inc: Fix for cross compilation configuration
Date: Fri,  5 Aug 2022 14:12:42 +0100
Message-Id: <20220805131252.3706794-19-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220805131252.3706794-1-richard.purdie@linuxfoundation.org>
References: <20220805131252.3706794-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Aug 2022 13:13:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168953

For cross compilation, build, host and target may be different. Ensure
the main rust config has the appropriate sections added to match the
configurations.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/rust/rust.inc | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust.inc b/meta/recipes-devtools/rust/rust.inc
index 12c86e02c4a..7c16b8165bb 100644
--- a/meta/recipes-devtools/rust/rust.inc
+++ b/meta/recipes-devtools/rust/rust.inc
@@ -73,7 +73,7 @@ python do_configure() {
     config = configparser.RawConfigParser()
 
     # [target.ARCH-poky-linux]
-    host_section = "target.{}".format(d.getVar('RUST_TARGET_SYS', True))
+    host_section = "target.{}".format(d.getVar('RUST_HOST_SYS', True))
     config.add_section(host_section)
 
     llvm_config_target = d.expand("${RUST_ALTERNATE_EXE_PATH}")
@@ -86,12 +86,22 @@ python do_configure() {
     # If we don't do this rust-native will compile it's own llvm for BUILD.
     # [target.${BUILD_ARCH}-unknown-linux-gnu]
     build_section = "target.{}".format(d.getVar('RUST_BUILD_SYS', True))
-    config.add_section(build_section)
+    if build_section != host_section:
+        config.add_section(build_section)
 
-    config.set(build_section, "llvm-config", e(llvm_config_build))
+        config.set(build_section, "llvm-config", e(llvm_config_build))
 
-    config.set(build_section, "cxx", e(d.expand("${RUST_BUILD_CXX}")))
-    config.set(build_section, "cc", e(d.expand("${RUST_BUILD_CC}")))
+        config.set(build_section, "cxx", e(d.expand("${RUST_BUILD_CXX}")))
+        config.set(build_section, "cc", e(d.expand("${RUST_BUILD_CC}")))
+
+    target_section = "target.{}".format(d.getVar('RUST_TARGET_SYS', True))
+    if target_section != host_section and target_section != build_section:
+        config.add_section(target_section)
+
+        config.set(target_section, "llvm-config", e(llvm_config_target))
+
+        config.set(target_section, "cxx", e(d.expand("${RUST_TARGET_CXX}")))
+        config.set(target_section, "cc", e(d.expand("${RUST_TARGET_CC}")))
 
     # [llvm]
     config.add_section("llvm")
-- 
2.34.1


