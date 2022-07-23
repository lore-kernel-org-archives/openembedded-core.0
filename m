Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2DA4C433EF
	for <webhook@archiver.kernel.org>; Sat, 23 Jul 2022 13:00:13 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web09.6082.1658581205867435338
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Jul 2022 06:00:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=E3fU+AQA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id h9so9876260wrm.0
        for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Jul 2022 06:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=D17f6EwKzxwsh/V/ld0W4J3LncJkIflfuKd6uYWBEo0=;
        b=E3fU+AQAGxY3fhB/ZzXyEVEvChYDMFkXzMmPsDqNNzbcMqN0U2qOUdJWm60hPt88c5
         6FlS2WJcmYgXDg9vt6dJYhhEzbSu+F4Vg2vf+TGciguHUKOWXvQcXY7TWxb9J8L/ixB+
         udpWyJ1KK+tzmLh3rITzhlVEaFTA2k0ZdNaTE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D17f6EwKzxwsh/V/ld0W4J3LncJkIflfuKd6uYWBEo0=;
        b=fOtBIdfuri4XVNKL9D7qAeuxo5WE8FT8PF1tqEOm/Hu6az0Kq4AVlAUphmyNnZBXc4
         5IPeld51CNGfwWVvm0bYOLxTgBGKY5ELYpNk9aFLuxBi2lGP5opb3XnATDMC71Q5Wy9n
         ILSSA4ksq5++zZBKYHA1UplcIhcIvxXIdTXWLIB/Mxw7CsQrAgsQpHzHXNRqfII+ILZo
         2yKFSwyeb4nNNbVcOhtlfpMeY4m+LIYMhQWb2mPgncpJFwAxrK1CXdumxVVn6zPoYjlU
         jeBhDHqPgulwjZ7IlhucvvN/1Jiu73lGlqmvUddFQ4EiyUd+dON6SkYZSm1MzWquWU3Q
         gdhA==
X-Gm-Message-State: AJIora8VUJ+3LY4YjmU8KQW7DX858FMbyPBYqNjkBawiu6kLHM067wlv
	5KTssoLFV/ufjG5JhWlynpe+BXsfcZF0/Q==
X-Google-Smtp-Source: 
 AGRyM1trrRXI6B+5wyE8nZ9zPIsYzeM7ZRRhzNVCz0nl58nstq8clAD+OmtiR2i/vGGKxeoLT2aOrg==
X-Received: by 2002:a5d:6285:0:b0:21e:6554:5e31 with SMTP id
 k5-20020a5d6285000000b0021e65545e31mr2693359wru.21.1658581203529;
        Sat, 23 Jul 2022 06:00:03 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9bb3:b62f:20a1:a32])
        by smtp.gmail.com with ESMTPSA id
 bn1-20020a056000060100b0021e71894692sm1498999wrb.91.2022.07.23.06.00.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Jul 2022 06:00:02 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] rust-target-config: Allow the targets generated to be
 configurable
Date: Sat, 23 Jul 2022 14:00:01 +0100
Message-Id: <20220723130001.1793949-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220723130001.1793949-1-richard.purdie@linuxfoundation.org>
References: <20220723130001.1793949-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Jul 2022 13:00:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168437

Remove further code duplication by allowing the main function to be
configurable.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/rust-target-config.bbclass                | 10 ++++++++--
 meta/recipes-devtools/cargo/cargo-cross-canadian.inc   |  7 +------
 .../rust/rust-cross-canadian-common.inc                |  8 +-------
 meta/recipes-devtools/rust/rust-cross.inc              |  8 +-------
 4 files changed, 11 insertions(+), 22 deletions(-)

diff --git a/meta/classes/rust-target-config.bbclass b/meta/classes/rust-target-config.bbclass
index 8e59cefb06d..3fc7c33f721 100644
--- a/meta/classes/rust-target-config.bbclass
+++ b/meta/classes/rust-target-config.bbclass
@@ -353,10 +353,16 @@ rust_gen_target[vardepsexclude] += "RUST_HOST_SYS RUST_TARGET_SYS"
 
 do_rust_gen_targets[vardeps] += "DATA_LAYOUT TARGET_ENDIAN TARGET_POINTER_WIDTH TARGET_C_INT_WIDTH MAX_ATOMIC_WIDTH FEATURES"
 
+RUST_TARGETGENS = "BUILD"
+
 python do_rust_gen_targets () {
     wd = d.getVar('WORKDIR') + '/targets/'
-    build_arch = d.getVar('BUILD_ARCH')
-    rust_gen_target(d, 'BUILD', wd, build_arch)
+    # Order of BUILD, HOST, TARGET is important in case the files overwrite, most specific last
+    rust_gen_target(d, 'BUILD', wd, d.getVar('BUILD_ARCH'))
+    if "HOST" in d.getVar("RUST_TARGETGENS"):
+        rust_gen_target(d, 'HOST', wd, d.getVar('HOST_ARCH'))
+    if "TARGET" in d.getVar("RUST_TARGETGENS"):
+        rust_gen_target(d, 'TARGET', wd, d.getVar('TARGET_ARCH'))
 }
 
 addtask rust_gen_targets after do_patch before do_compile
diff --git a/meta/recipes-devtools/cargo/cargo-cross-canadian.inc b/meta/recipes-devtools/cargo/cargo-cross-canadian.inc
index e83b6a67b3b..a2fac929d45 100644
--- a/meta/recipes-devtools/cargo/cargo-cross-canadian.inc
+++ b/meta/recipes-devtools/cargo/cargo-cross-canadian.inc
@@ -28,12 +28,7 @@ inherit cross-canadian
 
 PN = "cargo-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 
-python do_rust_gen_targets () {
-    wd = d.getVar('WORKDIR') + '/targets/'
-
-    rust_gen_target(d, 'BUILD', wd, d.getVar('BUILD_ARCH'))
-    rust_gen_target(d, 'HOST', wd, d.getVar('HOST_ARCH'))
-}
+RUST_TARGETGENS = "BUILD HOST"
 
 do_compile:prepend () {
 	PKG_CONFIG_PATH="${RECIPE_SYSROOT_NATIVE}/usr/lib/pkgconfig:${PKG_CONFIG_PATH}"
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian-common.inc b/meta/recipes-devtools/rust/rust-cross-canadian-common.inc
index 5c0644e92d7..34020ff6ff4 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian-common.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian-common.inc
@@ -25,13 +25,7 @@ DEBUG_PREFIX_MAP = "-fdebug-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDP
                     -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
                     "
 
-python do_rust_gen_targets () {
-    wd = d.getVar('WORKDIR') + '/targets/'
-    # Order of BUILD, HOST, TARGET is important in case the files overwrite, most specific last
-    rust_gen_target(d, 'BUILD', wd, d.getVar('BUILD_ARCH'))
-    rust_gen_target(d, 'HOST', wd, d.getVar('HOST_ARCH'))
-    rust_gen_target(d, 'TARGET', wd, d.getVar('TARGET_ARCH'))
-}
+RUST_TARGETGENS = "BUILD HOST TARGET"
 
 INHIBIT_DEFAULT_RUST_DEPS = "1"
 
diff --git a/meta/recipes-devtools/rust/rust-cross.inc b/meta/recipes-devtools/rust/rust-cross.inc
index 719857ebbb3..ab538e6659b 100644
--- a/meta/recipes-devtools/rust/rust-cross.inc
+++ b/meta/recipes-devtools/rust/rust-cross.inc
@@ -1,10 +1,4 @@
-python do_rust_gen_targets () {
-    wd = d.getVar('WORKDIR') + '/targets/'
-    # Order of BUILD, HOST, TARGET is important in case the files overwrite, most specific last
-    rust_gen_target(d, 'BUILD', wd, d.getVar('BUILD_ARCH'))
-    rust_gen_target(d, 'HOST', wd, d.getVar('HOST_ARCH'))
-    rust_gen_target(d, 'TARGET', wd, d.getVar('TARGET_ARCH'))
-}
+RUST_TARGETGENS = "BUILD HOST TARGET"
 
 # Otherwise we'll depend on what we provide
 INHIBIT_DEFAULT_RUST_DEPS = "1"
-- 
2.34.1


