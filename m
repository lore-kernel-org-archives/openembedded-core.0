Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93A73C25B06
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 13:13:20 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web12.6780.1659705197775584356
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 06:13:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EnhZaop1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id q30so3182139wra.11
        for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 06:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=EQAAOsR7VDLPtDmBP8DxT83b4Y/vW7FfqwsE2nmDzgI=;
        b=EnhZaop19he4MHThFeRGI4DiqwroWQIQ0ImH3/GivZsrwxuV2TXMR9fQ5biGJvh38V
         IHo1qDQkN9DXS5HheRdSmVbFVa8WLeWyShSZS+soZ/WNrhWEM4mXG7UEGAURloYl9wFi
         OTZs2JGFLp1EL6rXVTzZMUSpHOeZJALzdeUlQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=EQAAOsR7VDLPtDmBP8DxT83b4Y/vW7FfqwsE2nmDzgI=;
        b=g8o6eD7mP3088uChTD31+vC2jCBfGE222KRhISM4OZww+C8daU42wWV7QekMedOhp2
         jA6Y6b5gs7vxF95YPECGyoSo83WQ8mrSZa61PeyAjbWu32mdpdmgaavsADFDmnE7r2KV
         3KY53xDB9yUtwk1d7IJryegz1Wlz/T5/LgNzTRd1G/E86zTylZ9u/PR7H3hFfasEjDIs
         +MI4YbxvAF0QQjuGSF8hC4dUt5tNJTQcPfZwTeCFHDv9AOLRZqMAZzkHyElnWX1evSB/
         LcBgly69zoPDTh8PpbmEoBwoOUSxxw6Hq6G40muSGPrNwdQNvrqZEH5TIBaX+SC4NILD
         RrCw==
X-Gm-Message-State: ACgBeo0/6i8NbshTi+yyp7S34mUCBg7wmMz1XXscs+sK25YG2i2wLCWi
	5SZVGCWDOLcGb+pX+H19kI+MRdTS93PL+g==
X-Google-Smtp-Source: 
 AA6agR4x2DBNa9yd7ZByEhyArn1QI8VB35dJCem3k+hr+fz7MXl8AiZYZDoidzCQQxfGY1DGwXsFog==
X-Received: by 2002:a5d:64ca:0:b0:220:6247:42c1 with SMTP id
 f10-20020a5d64ca000000b00220624742c1mr4326366wri.478.1659705195953;
        Fri, 05 Aug 2022 06:13:15 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f483:fcb0:1452:5a5a])
        by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c204c00b003a51a0d35e7sm1908901wmg.37.2022.08.05.06.13.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 06:13:15 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 22/29] rust-common: Simplify libc handling
Date: Fri,  5 Aug 2022 14:12:45 +0100
Message-Id: <20220805131252.3706794-22-richard.purdie@linuxfoundation.org>
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
 https://lists.openembedded.org/g/openembedded-core/message/168956

The current libc handling code is simply wrong in many cases. Simplify it
to a check of the triplet for musl handling which is much simpler and less
error prone when handling things like nativesdk targets.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/rust-common.bbclass | 45 ++++++--------------------------
 1 file changed, 8 insertions(+), 37 deletions(-)

diff --git a/meta/classes/rust-common.bbclass b/meta/classes/rust-common.bbclass
index 7c432ed131b..516b258c15e 100644
--- a/meta/classes/rust-common.bbclass
+++ b/meta/classes/rust-common.bbclass
@@ -13,27 +13,6 @@ RUSTFLAGS += "${RUSTLIB} ${RUST_DEBUG_REMAP}"
 RUSTLIB_DEP ?= "libstd-rs"
 RUST_PANIC_STRATEGY ?= "unwind"
 
-# Native builds are not effected by TCLIBC. Without this, rust-native
-# thinks it's "target" (i.e. x86_64-linux) is a musl target.
-RUST_LIBC = "${TCLIBC}"
-RUST_LIBC:class-crosssdk = "glibc"
-RUST_LIBC:class-native = "glibc"
-
-def determine_libc(d, thing):
-    '''Determine which libc something should target'''
-
-    # BUILD is never musl, TARGET may be musl or glibc,
-    # HOST could be musl, but only if a compiler is built to be run on
-    # target in which case HOST_SYS != BUILD_SYS.
-    if thing == 'TARGET':
-        libc = d.getVar('RUST_LIBC')
-    elif thing == 'BUILD' and (d.getVar('HOST_SYS') != d.getVar('BUILD_SYS')):
-        libc = d.getVar('RUST_LIBC')
-    else:
-        libc = d.getVar('RUST_LIBC:class-native')
-
-    return libc
-
 def target_is_armv7(d):
     '''Determine if target is armv7'''
     # TUNE_FEATURES may include arm* even if the target is not arm
@@ -73,26 +52,18 @@ def rust_base_triple(d, thing):
     if thing == "BUILD" and bpn in ["rust"]:
         return arch + "-unknown-linux-gnu"
 
-    # All the Yocto targets are Linux and are 'unknown'
-    vendor = "-unknown"
-    os = d.getVar('{}_OS'.format(thing))
-    libc = determine_libc(d, thing)
-
-    # Prefix with a dash and convert glibc -> gnu
-    if libc == "glibc":
-        libc = "-gnu"
-    elif libc == "musl":
-        libc = "-musl"
-
-    # Don't double up musl (only appears to be the case on aarch64)
-    if os == "linux-musl":
-        if libc != "-musl":
-            bb.fatal("{}_OS was '{}' but TCLIBC was not 'musl'".format(thing, os))
-        os = "linux"
+    vendor = d.getVar('{}_VENDOR'.format(thing))
 
+    # Default to glibc
+    libc = "-gnu"
+    os = d.getVar('{}_OS'.format(thing))
     # This catches ARM targets and appends the necessary hard float bits
     if os == "linux-gnueabi" or os == "linux-musleabi":
         libc = bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'hf', '', d)
+    elif "musl" in os:
+        libc = "-musl"
+        os = "linux"
+
     return arch + vendor + '-' + os + libc
 
 
-- 
2.34.1


