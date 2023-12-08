Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4AF8C46CCD
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 02:33:59 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.11182.1702002838716761098
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Dec 2023 18:33:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=2LQDndTu;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1d06819a9cbso12653385ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 18:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1702002838; x=1702607638; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5V1/HstD7vIdY0yygkF+I4TALISNce8RXHHplUIcH0A=;
        b=2LQDndTuLC0Ffak7E4P18bzrf1t0FKAiKEDppyU/Nssd6/9eJ1cabrcwIxHeRtsk41
         6Y8NIeWvnF+Yt1k0KTZ4XappoA/6tS4B4JiqrsJHVMeGrx81pQ8Y8j0R6B4b0q7Xhx8W
         df1NPwQGXPRLbBKjE6yjfFcRCF+t1THZRnR354IMveTO/kOzW4/sgRm0SNo5qlmTmpFi
         Z+2XLqrshwi1rlAb6ar4eNJSgzqWFzsYPP1NimKZGFGWTqIcYFWtpWMxGoQTfxgf+k4X
         GWWWcGtBVamRQw6GitmCAMEjQaLfZuPywNnYyvVbK4TF/JUZq01EdcaOIPvUqzfxSD9o
         fRfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702002838; x=1702607638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5V1/HstD7vIdY0yygkF+I4TALISNce8RXHHplUIcH0A=;
        b=sBK3t8JgKvRIj4j5gKWH5xtQqF+PHlHtTqFHNr+5/hAKbYhi3cPtDyMPPz/VefZfPX
         H+tIgSrXovUMuB8oFMn5ERBAAT+lpFRrql82adTR0CdlwNvsjJ/KaOdl7W0b8iV2L1zL
         EkXFEzynCILmn17I7dIL/Wbn9vy2iVrDUVuBgf91GYH9HJ4gHhufJ62S17JoNuBR2xOK
         TMC713Mnz2vrTNztaAN6Jd7bh2lQIcjSanfcQj17+t6FoY3pUCnUC5MQfZqIl+mo83ZZ
         eGKLtcSug//8gjLXdU5ZpX8s1GtlFmmJAd/Mzo6LflFP423DppaMkbiMcsnJ4FAOzFMR
         RGdQ==
X-Gm-Message-State: AOJu0YwSATAhHqitSqFN05w8RSerY6FPmZWpvOuoFhwhdsCt8ucNcAfa
	UTVPuY2C9OcvAwoBbPSyWiF7GD2tghuPiXOYRSs=
X-Google-Smtp-Source: AGHT+IFTTEV8SGqY/hxjcOtImKXubvDR6K/h1xgsx0BT7s+tkgPVSA8+STRUwqyh02Hy6e9A6qb+OQ==
X-Received: by 2002:a17:902:f54f:b0:1d0:c849:780 with SMTP id h15-20020a170902f54f00b001d0c8490780mr3526833plf.70.1702002837857;
        Thu, 07 Dec 2023 18:33:57 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id i11-20020a170902c94b00b001c9bc811d4dsm499752pla.295.2023.12.07.18.33.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 18:33:57 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/15] rust-cross/rust-common: Merge arm target handling code to fix cross-canadian
Date: Thu,  7 Dec 2023 16:33:19 -1000
Message-Id: <0adada8111c17e8e5a7c32cef86bdb8e7dfd79d3.1702002667.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702002667.git.steve@sakoman.com>
References: <cover.1702002667.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 02:33:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192005

From: Richard Purdie <richard.purdie@linuxfoundation.org>

rust-cross had special handling for armv7 targets but we also need this
for cross-canadian. Merge the code into the main function so everything is
consistent.

Also then fix the arm definition to be arm-eabi since ABI is correctly
being looked up.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ff3c3dbbd2bf1bb7bb70b55cca203e9eedcf14a8)
Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/rust/rust-common.inc | 6 ++++++
 meta/recipes-devtools/rust/rust-cross.inc  | 7 +------
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust-common.inc b/meta/recipes-devtools/rust/rust-common.inc
index ac00fd3d43..3252827818 100644
--- a/meta/recipes-devtools/rust/rust-common.inc
+++ b/meta/recipes-devtools/rust/rust-common.inc
@@ -297,6 +297,12 @@ def rust_gen_target(d, thing, wd, features, cpu, arch, abi=""):
     sys = sys_for(d, thing)
     prefix = prefix_for(d, thing)
 
+    if thing == "TARGET":
+        abi = d.getVar('ABIEXTENSION')
+        # arm and armv7 have different targets in llvm
+        if arch == "arm" and target_is_armv7(d):
+            arch = 'armv7'
+
     rust_arch = oe.rust.arch_to_rust_arch(arch)
 
     if abi:
diff --git a/meta/recipes-devtools/rust/rust-cross.inc b/meta/recipes-devtools/rust/rust-cross.inc
index f6babfeeda..4c026b1f38 100644
--- a/meta/recipes-devtools/rust/rust-cross.inc
+++ b/meta/recipes-devtools/rust/rust-cross.inc
@@ -8,15 +8,10 @@ python do_rust_gen_targets () {
         features = ""
         cpu = "generic"
         arch = d.getVar('{}_ARCH'.format(thing))
-        abi = ""
         if thing is "TARGET":
-            abi = d.getVar('ABIEXTENSION')
-            # arm and armv7 have different targets in llvm
-            if arch == "arm" and target_is_armv7(d):
-                arch = 'armv7'
             features = d.getVar('TARGET_LLVM_FEATURES') or ""
             cpu = d.getVar('TARGET_LLVM_CPU')
-        rust_gen_target(d, thing, wd, features, cpu, arch, abi)
+        rust_gen_target(d, thing, wd, features, cpu, arch)
 }
 
 # Otherwise we'll depend on what we provide
-- 
2.34.1


