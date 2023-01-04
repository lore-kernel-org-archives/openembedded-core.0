Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83FA9C46467
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 14:01:03 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.12605.1672840861496303830
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 06:01:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Mio+hWls;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id j17so27694238wrr.7
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 06:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BEpI56LcSnqRl5+l86AlW3h0OwQOPdysytIVUYEgT9Q=;
        b=Mio+hWls7j6zUTIkJeLMmCmXXHXfUN99ppK7w2bmXf3YmchsxL7DFM7gpDLy/8Aytn
         SKVv3MvBTk3C2GqXDG7u/KzSINyeAUDxts/C5ubFT1x1i/npUHL9uMhBTt80VhhYq3Nw
         BMK1DMxpLAUbqtB68uryArwm0u2Sj8GgCT3cgLcWOncbv4DalWGpXq70UnFyNseKUr3o
         tsdk6b2Tcpu0QmOgROwYlFdz9x8ojKU/N3HZYY3X40WuVpSDigzarC7RKmn6SnVfHFkK
         Lwm0iIeWR+h+7WkclBA/EwQaLSYYU9+O7hQYXYC0qfgOZUbk0r4PlsPPnTGgdcnWbpdv
         hG6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BEpI56LcSnqRl5+l86AlW3h0OwQOPdysytIVUYEgT9Q=;
        b=mR9YmcB2erMUObuxBa+Kba9nxe4TCBjYVnzoLxy0tJ22KcMoOyRTQwzEKmdNF05XxD
         Z4f1i1rHBt0kOxhWOa0FiFA3Wkbs95KTbEG4IuId3tmySJu+9xQ5wwnDTfcdAza0YLeZ
         LEqyDZEpE3PvdUQCIDyRL1zjMDASaG3IFgSe1q9eoYmbT2/6iM+uuzB2oAmYOY+ZESgN
         e0LdKMSnZC6EezzOoUbbtSVOrk+dpAElKhP+t9T/LjQ3PjGT+D/y+DLNqCHF4VtjbwqG
         vGIUwc0TBo2dRsfDHSrSHS+r+rnGJN7OQrhu3Zb7DOolPWVBtvaliyAlgOCuuYi7D0mv
         gkDg==
X-Gm-Message-State: AFqh2kr6lJAtUF8WXTyhOZJ53D/bM9QW9B+nmfSmNVEtbMvw0HCWWpCa
	/9+SQppOxkfPkes/BhUgDr9h01TsdDk=
X-Google-Smtp-Source: AMrXdXvvihisaCvAElatinbuaLdo0sPYDygHmsg9ZLDXM7vjh7iPxXcOMFavBAW+Wm6o3SyrjDTEyQ==
X-Received: by 2002:adf:e80e:0:b0:242:368:7665 with SMTP id o14-20020adfe80e000000b0024203687665mr30750143wrm.60.1672840859645;
        Wed, 04 Jan 2023 06:00:59 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id z8-20020a056000110800b00241dd5de644sm33244715wrw.97.2023.01.04.06.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 06:00:58 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH] rust: Merge all rustc-source patches into rust-source.inc
Date: Wed,  4 Jan 2023 14:00:50 +0000
Message-Id: <20230104140051.631056-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 14:01:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175478

With the dim-sum approach to patching we had the same patch applied in
many places, but not all, so that there were no guarantees that we were
actually building agaginst the same thing in all recipes.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
I've no actual evidence, but I wonder if this might help with
https://bugzilla.yoctoproject.org/show_bug.cgi?id=14975

 meta/recipes-devtools/rust/cargo_1.66.0.bb    |  8 --------
 .../rust/{rust => files}/hardcodepaths.patch  |  0
 meta/recipes-devtools/rust/rust-source.inc    | 20 +++++++++----------
 meta/recipes-devtools/rust/rust_1.66.0.bb     |  3 ---
 4 files changed, 9 insertions(+), 22 deletions(-)
 rename meta/recipes-devtools/rust/{rust => files}/hardcodepaths.patch (100%)

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
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index 643494b37e75..9182d50c4cef 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -1,20 +1,18 @@
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
 "
-
-SRC_URI:append:class-target:pn-rust = " \
-    file://getrandom-open64.patch \
-    file://0001-Do-not-use-LFS64-on-linux-with-musl.patch \
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


