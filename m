Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77A4DC61DB3
	for <webhook@archiver.kernel.org>; Sat,  7 Jan 2023 09:49:03 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.17328.1673084933276117825
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Jan 2023 01:48:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NrloSnrd;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: alex.kiernan@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id x10so2503007edd.10
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Jan 2023 01:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GL+uUPAvJDzrOXifvOkTzkiYuofZbdP407YM84YrcUk=;
        b=NrloSnrdPEWVxnFBLmJKZNgrWb1MPCUnKLZdLnjHqADKvhy3B9zwKAfqFdj8Fio2MS
         BkUCzXC/AoRdgWq/gU2Hy/T+924J9GgNGJEY5N4PpCz0I1dzYhCXgjCgPEAm/XUwIqFL
         KN83NXsiW1Tc8EHCWpCGeFdqgga/SXHvLq2SRIHdY25lkBaV8ZyDfSBx7o8dirqqZBBK
         913pT1C8jsu16/K9YDj38gJ5JQrB1R4Ogj0WO9SZDseh4ycbt6yC4gcHYuoG+S12EskU
         8RCDtLvBYvbooiIfIII6fPmoiJrIiOWpAX3Q81DDBubxoK07HJoC3SgNL827AHdmEp06
         oYUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GL+uUPAvJDzrOXifvOkTzkiYuofZbdP407YM84YrcUk=;
        b=HQep4pSmOEMKvJ/JZ5jgGPnAnsubgTb9S1qQZGPwSEQNE/APhCTdHW5or79AP0hksO
         kDaNsZqLMzs7eMSMRnQX9eJPLMudoJRNojEMYxlOFCZ6UTJwQckDCxmM98N2BUmKr4Wc
         d8KmxKG7p5QFDIfHkU5WsLYM9ebE0P/YUzwej9/bhKtJY7NQ/Q3wHSTy1RogsYlRpchb
         jBWqAqpjeW0/nw+8GSyJRMbFigT/HgOxVSa5H8LOEQYQ7HJKovJ5f5J+ALrZHhcxTma9
         nZGu6EPUh1iCsG/mRH2rWD/VvHttRvlTLePu1GV7UXK7rNwaD7scAVJxT67/BE4WoEbx
         Q74Q==
X-Gm-Message-State: AFqh2kpVizWYjsyhbTOiuUXMTaO4WLUBhxa0uN5UfmH+cBjp7EqbQwyn
	FMvGQ9Glqe1LinZQ7FicmMFJ/CuwtQI=
X-Google-Smtp-Source: AMrXdXt76SfaWo+GbNGHw3t+azMnZNYvQYe0+xafG+2dOrzd9J0hx9E2OvIN3Qv/V/Pvao/hMqoDtA==
X-Received: by 2002:a05:6402:2907:b0:497:1787:13af with SMTP id ee7-20020a056402290700b00497178713afmr3363918edb.32.1673084931400;
        Sat, 07 Jan 2023 01:48:51 -0800 (PST)
Received: from localhost.localdomain ([80.209.166.248])
        by smtp.gmail.com with ESMTPSA id v19-20020a509553000000b0046cbcc86bdesm1329889eda.7.2023.01.07.01.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jan 2023 01:48:50 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v2] rust: Merge all rustc-source patches into rust-source.inc
Date: Sat,  7 Jan 2023 09:48:39 +0000
Message-Id: <20230107094839.26387-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Jan 2023 09:49:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175617

With the dim-sum approach to patching we had the same patch applied in
many places, but not all, so that there were no guarantees that we were
actually building agaginst the same thing in all recipes.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
I've no actual evidence, but I wonder if this might help with
https://bugzilla.yoctoproject.org/show_bug.cgi?id=14975 as I tripped
over this whilst doing these changes.

Changes in v2:
- Rebased

 meta/recipes-devtools/rust/cargo_1.66.0.bb    |  8 -------
 .../rust/{rust => files}/hardcodepaths.patch  |  0
 .../rust/{rust => files}/zlib-off64_t.patch   |  0
 meta/recipes-devtools/rust/rust-source.inc    | 22 +++++++++----------
 meta/recipes-devtools/rust/rust_1.66.0.bb     |  3 ---
 5 files changed, 10 insertions(+), 23 deletions(-)
 rename meta/recipes-devtools/rust/{rust => files}/hardcodepaths.patch (100%)
 rename meta/recipes-devtools/rust/{rust => files}/zlib-off64_t.patch (100%)

diff --git a/meta/recipes-devtools/rust/cargo_1.66.0.bb b/meta/recipes-devtools/rust/cargo_1.66.0.bb
index f45f8f1e12d7..2b2394e898b5 100644
--- a/meta/recipes-devtools/rust/cargo_1.66.0.bb
+++ b/meta/recipes-devtools/rust/cargo_1.66.0.bb
@@ -14,14 +14,6 @@ LIC_FILES_CHKSUM = " \
 require rust-source.inc
 require rust-snapshot.inc
 
-SRC_URI:append:class-target = "\
-    file://crossbeam_atomic.patch;patchdir=${RUSTSRC} \
-    file://getrandom-open64.patch;patchdir=${RUSTSRC} \                          
-"
-
-# Used by crossbeam_atomic.patch
-export TARGET_VENDOR
-
 S = "${RUSTSRC}/src/tools/cargo"
 CARGO_VENDORING_DIRECTORY = "${RUSTSRC}/vendor"
 
diff --git a/meta/recipes-devtools/rust/rust/hardcodepaths.patch b/meta/recipes-devtools/rust/files/hardcodepaths.patch
similarity index 100%
rename from meta/recipes-devtools/rust/rust/hardcodepaths.patch
rename to meta/recipes-devtools/rust/files/hardcodepaths.patch
diff --git a/meta/recipes-devtools/rust/rust/zlib-off64_t.patch b/meta/recipes-devtools/rust/files/zlib-off64_t.patch
similarity index 100%
rename from meta/recipes-devtools/rust/rust/zlib-off64_t.patch
rename to meta/recipes-devtools/rust/files/zlib-off64_t.patch
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index bfb625fb363d..6f1df4561b29 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -1,21 +1,19 @@
 RUST_VERSION ?= "${@d.getVar('PV').split('-')[0]}"
-SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;name=rust"
-SRC_URI[rust.sha256sum] = "0dc176e34fae9871f855a6ba4cb30fa19d69c5b4428d29281a07419c4950715c"
 
-SRC_URI:append:class-target:pn-libstd-rs = "\
-    file://0001-Do-not-use-LFS64-on-linux-with-musl.patch;patchdir=../.. \
+SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;name=rust \
+            file://crossbeam_atomic.patch;patchdir=${RUSTSRC} \
+            file://hardcodepaths.patch;patchdir=${RUSTSRC} \
+            file://getrandom-open64.patch;patchdir=${RUSTSRC} \
+            file://0001-Do-not-use-LFS64-on-linux-with-musl.patch;patchdir=${RUSTSRC} \
+            file://zlib-off64_t.patch;patchdir=${RUSTSRC} \
 "
-
-SRC_URI:append:class-target:pn-rust = " \
-    file://getrandom-open64.patch \
-    file://0001-Do-not-use-LFS64-on-linux-with-musl.patch \
-    file://zlib-off64_t.patch \
-    file://hardcodepaths.patch \
-    file://crossbeam_atomic.patch"
-SRC_URI:append:class-nativesdk:pn-nativesdk-rust = " file://hardcodepaths.patch"
+SRC_URI[rust.sha256sum] = "0dc176e34fae9871f855a6ba4cb30fa19d69c5b4428d29281a07419c4950715c"
 
 RUSTSRC = "${WORKDIR}/rustc-${RUST_VERSION}-src"
 
+# Used by crossbeam_atomic.patch
+export TARGET_VENDOR
+
 UPSTREAM_CHECK_URI = "https://forge.rust-lang.org/infra/other-installation-methods.html"
 UPSTREAM_CHECK_REGEX = "rustc-(?P<pver>\d+(\.\d+)+)-src"
 
diff --git a/meta/recipes-devtools/rust/rust_1.66.0.bb b/meta/recipes-devtools/rust/rust_1.66.0.bb
index f1ec769aef48..eba933ddeda4 100644
--- a/meta/recipes-devtools/rust/rust_1.66.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.66.0.bb
@@ -218,9 +218,6 @@ FILES:${PN} += "${libdir}/rustlib"
 FILES:${PN} += "${libdir}/*.so"
 FILES:${PN}-dev = ""
 
-# Used by crossbeam_atomic.patch
-export TARGET_VENDOR
-
 do_compile () {
     rust_runx build --stage 2
 }
-- 
2.39.0


