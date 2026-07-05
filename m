Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18BD7C44510
	for <webhook@archiver.kernel.org>; Sun,  5 Jul 2026 22:43:09 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.140023.1783291378115800151
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2026 15:42:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ESaZiboX;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-475cb71a4ebso2509540f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 15:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783291376; x=1783896176; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lnSDeJ0uQymNjX7oD6bq2EMatxeiNM6a+uJRjE/2Q/o=;
        b=ESaZiboX1qc9uBYiPkOodEOBA+b/AfmG9XLZcfp7ukkH+V1kkwEoFKL++RLDUts23L
         AVHsKd3FEYovEXRj2CS8qj/K+aSn4qBRZl9CF6I7OtLV3Anr4UAw6hZE5LlKylbJNLwX
         phEq96z+0pXjydDlp7egDjJO3bLK3Vw2AamGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783291376; x=1783896176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lnSDeJ0uQymNjX7oD6bq2EMatxeiNM6a+uJRjE/2Q/o=;
        b=T1hVZInnGzEhzLO87Rt1K+COBWY6/kMXktq5xzl+21fJgzcvN26XG9MdIm70+21Pjs
         mN9VKS/ny+pUtvMpvucIUMLjMFvYDBCQi5MzqYT/9wfee6XJwNxfPJEarJXstps4KLWA
         Iw0f5dIyLaM/uwOqeKVjDqEz+ynGBepLv7GMMfhpEkMfEosvItxdz5KEn2HVROJUU4Yo
         H4TxBBs7d+HZVZmc1Sai767whkD8Vp3oGR7+a8Lcluky4ch7+n4gKmoU53coC3JISTWX
         +JiiRh1lZCAH1rOz59ercc3c9eJx4GBQM4UVoM5+JPAtUvknW2B4vgRv42fnSfEMZTTy
         SiVw==
X-Gm-Message-State: AOJu0Yycwm/9T2HJmXpCDhyFdxP46LPIDWSxGFkrZOgP33LNlAv+nwyi
	3vTKeANuRZ+/L3ZSfY44Q9/SSMuXwgzq9B8m/RcqmE00EFrbZndiYtdwJ7zfkBvafdGryihUE0M
	0cZvi8Qs=
X-Gm-Gg: AfdE7clVCSZ31HOSGPDtQGkUGIAFSxLluGDlsB8OgPAdi8ElIegeoxCh73ogDyohVod
	FUwlxpQWRxh4akG+TRzB55oqH4JwwJSJLLAWYkULSiqBbnAn9X7QRVv7XPlQgHCIPh7PCailmHm
	u2bJeoBcOlJYxw4L66W9mCDf3TYIRFqExbK6sAvWoIVUSCg4uGZj0z7lXi2gTsJUk3Fio/10iZG
	PFFSYhP7N75hTaD6bOZQLURobxtDxdC42Qtk7H5rvBjHHndPiQoJhG2TgLkkXf3jzdmdn1lDAUV
	eycYf+50qwI08vCsP2HCKlRvzD6mWOeH7NrVD1y/x4OkrTlVCfNyR4lThcY3htnE5dgLx+lao6j
	4Xu1pYL2UIhi42Mrw7xahcs8DeU8oeLmZJCNe3RA6zDgFv+6OxNrytpqGVZjdZVGp57K3IwQaYV
	xssaBDIMc/1I6YjtQ8RVMVA5BOxw==
X-Received: by 2002:a05:6000:2f88:b0:475:f0c2:759f with SMTP id ffacd0b85a97d-47aac9bcedcmr8899369f8f.48.1783291373263;
        Sun, 05 Jul 2026 15:42:53 -0700 (PDT)
Received: from FRSMI25-LASER.lan ([2001:861:8010:5750:6d3a:72ff:5857:d2a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960af0sm17943606f8f.30.2026.07.05.15.42.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 15:42:52 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 19/55] cargo: Fix CVE-2026-5223
Date: Mon,  6 Jul 2026 00:41:09 +0200
Message-ID: <3ece9abc2962df2fd236001dc328f741c4d1a95e.1783289522.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783289522.git.yoann.congal@smile.fr>
References: <cover.1783289522.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 22:43:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240177

From: Anil Dongare <adongare@cisco.com>

This patch applies the upstream fix as referenced in [2], using the commit shown in [1].

[1] https://github.com/rust-lang/cargo/commit/285cebf58911eca5b7f177f5d0b1c53e1f646577
[2] https://security-tracker.debian.org/tracker/CVE-2026-5223

Signed-off-by: Anil Dongare <adongare@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../rust/files/CVE-2026-5223.patch            | 125 ++++++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |   1 +
 2 files changed, 126 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/CVE-2026-5223.patch

diff --git a/meta/recipes-devtools/rust/files/CVE-2026-5223.patch b/meta/recipes-devtools/rust/files/CVE-2026-5223.patch
new file mode 100644
index 00000000000..5041dedac5c
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/CVE-2026-5223.patch
@@ -0,0 +1,125 @@
+From 285cebf58911eca5b7f177f5d0b1c53e1f646577 Mon Sep 17 00:00:00 2001
+From: Josh Triplett <josh@joshtriplett.org>
+Date: Mon, 30 Mar 2026 10:35:55 -0700
+Subject: [PATCH] CVE-2026-5223: prohibit unpacking symlinks and other
+ unexpected entries
+
+Cargo has historically not allowed creating .crate packages containing
+symlinks. (It packages the symlink target in place of the symlink,
+instead.) So, any package containing a symlink would have to be
+hand-constructed. Such packages are also not allowed on crates.io, so it
+could only come from an alternate registry.
+
+Rather than dealing with symlink traversal attacks when unpacking a
+crate, just prohibit symlinks entirely.
+
+In the process, also prohibit other kinds of unusual entries. As an
+exception, allow character devices but warn about them, because some
+exist in crates on crates.io.
+
+CVE: CVE-2026-5223
+Upstream-Status: Backport [https://github.com/rust-lang/cargo/commit/285cebf58911eca5b7f177f5d0b1c53e1f646577]
+
+(cherry picked from commit 285cebf58911eca5b7f177f5d0b1c53e1f646577)
+Signed-off-by: Anil Dongare <adongare@cisco.com>
+---
+ src/tools/cargo/src/cargo/sources/registry/mod.rs | 10 +++++-
+ src/tools/cargo/tests/testsuite/registry.rs       | 39 ++++++++++-------------
+ 2 files changed, 26 insertions(+), 23 deletions(-)
+
+diff --git a/src/tools/cargo/src/cargo/sources/registry/mod.rs b/src/tools/cargo/src/cargo/sources/registry/mod.rs
+index 04d4ec3..d152a1e 100644
+--- a/src/tools/cargo/src/cargo/sources/registry/mod.rs
++++ b/src/tools/cargo/src/cargo/sources/registry/mod.rs
+@@ -197,7 +197,7 @@ use cargo_util::paths::{self, exclude_from_backups_and_indexing};
+ use flate2::read::GzDecoder;
+ use serde::Deserialize;
+ use serde::Serialize;
+-use tar::Archive;
++use tar::{Archive, EntryType};
+ use tracing::debug;
+ 
+ use crate::core::dependency::Dependency;
+@@ -1088,6 +1088,14 @@ fn unpack(
+             )
+         }
+ 
++        // Prevent unpacking symlinks and other unexpected entry types
++        match entry.header().entry_type() {
++            EntryType::Regular | EntryType::Directory => {}
++            t => anyhow::bail!(
++                "invalid tarball downloaded, contains an entry at {entry_path:?} with invalid type {t:?}",
++            ),
++        }
++
+         // Prevent unpacking the lockfile from the crate itself.
+         if entry_path
+             .file_name()
+diff --git a/src/tools/cargo/tests/testsuite/registry.rs b/src/tools/cargo/tests/testsuite/registry.rs
+index 5a30dad..4a4e836 100644
+--- a/src/tools/cargo/tests/testsuite/registry.rs
++++ b/src/tools/cargo/tests/testsuite/registry.rs
+@@ -3274,8 +3274,7 @@ fn package_lock_inside_package_is_overwritten() {
+ }
+ 
+ #[cargo_test]
+-fn package_lock_as_a_symlink_inside_package_is_overwritten() {
+-    let registry = registry::init();
++fn package_lock_as_a_symlink_inside_package_is_invalid() {
+     let p = project()
+         .file(
+             "Cargo.toml",
+@@ -3298,21 +3297,23 @@ fn package_lock_as_a_symlink_inside_package_is_overwritten() {
+         .symlink(".cargo-ok", "src/lib.rs")
+         .publish();
+ 
+-    p.cargo("check").run();
++    p.cargo("check")
++        .with_status(101)
++        .with_stderr_data(str![[r#"
++[UPDATING] `dummy-registry` index
++[LOCKING] 1 package to latest compatible version
++[DOWNLOADING] crates ...
++[DOWNLOADED] bar v0.0.1 (registry `dummy-registry`)
++[ERROR] failed to download replaced source registry `crates-io`
+ 
+-    let id = SourceId::for_registry(registry.index_url()).unwrap();
+-    let hash = cargo::util::hex::short_hash(&id);
+-    let pkg_root = paths::cargo_home()
+-        .join("registry")
+-        .join("src")
+-        .join(format!("-{}", hash))
+-        .join("bar-0.0.1");
+-    let ok = pkg_root.join(".cargo-ok");
+-    let librs = pkg_root.join("src/lib.rs");
++Caused by:
++  failed to unpack package `bar v0.0.1 (registry `dummy-registry`)`
+ 
+-    // Is correctly overwritten and doesn't affect the file linked to
+-    assert_eq!(ok.metadata().unwrap().len(), 7);
+-    assert_eq!(fs::read_to_string(librs).unwrap(), "pub fn f() {}");
++Caused by:
++  invalid tarball downloaded, contains an entry at "bar-0.0.1/.cargo-ok" with invalid type Symlink
++
++"#]])
++        .run();
+ }
+ 
+ #[cargo_test]
+@@ -4751,13 +4752,7 @@ Caused by:
+   failed to unpack package `bar v1.0.0 (registry `dummy-registry`)`
+ 
+ Caused by:
+-  failed to unpack entry at `bar-1.0.0/smuggled`
+-
+-Caused by:
+-  failed to unpack `[ROOT]/home/.cargo/registry/src/-[HASH]/bar-1.0.0/smuggled`
+-
+-Caused by:
+-  [..] when creating dir [ROOT]/home/.cargo/registry/src/-[HASH]/bar-1.0.0/smuggled
++  invalid tarball downloaded, contains an entry at "bar-1.0.0/smuggled" with invalid type Symlink
+ 
+ "#]])
+         .run();
+-- 
+2.44.4
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index 36407fa9750..d897b2c262c 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -12,6 +12,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://0001-Adjust-loongarch-assembly-test.patch;patchdir=${RUSTSRC} \
             file://0001-Fix-multiple-option-or-permutations-test-for-big-end.patch;patchdir=${RUSTSRC} \
             file://CVE-2026-5222.patch;patchdir=${RUSTSRC} \
+            file://CVE-2026-5223.patch;patchdir=${RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] = "174fce10ce012317ca995810296d8af199318838180b03d68a853e0f02d4b571"
 

