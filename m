Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AA24C44507
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 10:07:17 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5895.1783591636339478650
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2026 03:07:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=yWULS17D;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493e8d4f4dcso8850295e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 03:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783591635; x=1784196435; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0CU0MfA/b04v88pFelRVyHeRe4mB542lMyTrP/JmSDE=;
        b=yWULS17DYeNxu+yjUkEPH3rHwwGeBVcuXaPiEuOJUYLz2jXMDLQalKhdxt6uiteNnX
         uHQV8keDu3TJuCXATZKft+V19PIGJo7GkqoMiV7TNSV7gT04R6Bge7liuzL+yF1hmDmZ
         3LB6Uje8rbYKEiobYG+/lGJwlECUVKEmCVb+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783591635; x=1784196435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0CU0MfA/b04v88pFelRVyHeRe4mB542lMyTrP/JmSDE=;
        b=UbiDlWKZLXU/Md6G1hGXvNuuYFO0MPQkVRYAtvRyy6qbEaI+nc2Jt0MrDOzgE7NdJA
         8oEOR7DlmXPbUv3eQpQp/sD9QWTYDTKdl79CxEcuNl/U7kNeFMRxbIRiS/cQHcZg5ijp
         JxqEN5rWjNDAXK8Gh6cV/yqQ6SxKlx4+EBEg5mLIhO/udf6VaR2hlvGO4jFdbvSmzhut
         6b+4ZQEEWImifnDO6ys9Pa/sTslz8BvoOUsSeqlxtATJlKi34KHznJVshqAPhLuTb7LW
         oXOPlEFtRVWh6KM0R7PzTuG70lHH7B06T1OZg2/1SAn6gnoJwVwnaLFuXKrdrmttb+K9
         dJwA==
X-Gm-Message-State: AOJu0Yz6THwc3LuCtBMsusUglzauwRF7kICQVcw4GhaScQm61swc61jM
	74P0MM5QQfcnCPYYt0hHlfLknZt/TFrrMMTggfNs8VwnTc8vlTLKatp0vmUL+AphAa/hbecIkZK
	d3RNyWF4=
X-Gm-Gg: AfdE7clJh/MCdGMtjO+3CVwIYaL4yyHva3HcpgOKSwxzjKN0a/4qLM9u5FzV+yxkuRW
	2XQ5s6J1RGrMXqrM+vfv64WO6z9wnBhZtrb0K2UjGLZ+8EXeGml9x55XLfIVAO9OewtOT16vpQe
	Uh+E/z6vS17MgnqmV1ptO5t8EtPNLZewmpy6tJjGLK/30rQeyvH8zpbQ1FKnw7b9qzgaYUrr717
	pxRAyfaZ3qDtdFy4gbmqNOpsCIYLjksm+pKRitZ7MHLcsGWU3tBl7S0lkV0lmsSZEeUgZiT4H2m
	CIFuGFWRZa8Iz0jbMdNNd375BsxRSO31oyjXSoRTr5+ob7UDwdbYTnWDcSIhsfi9Ke7kh524SDM
	OWd8lnZ0FRv+YITydWus/iCttcfkBpWLGth2n3UU0uPpHvN9C1xYXCYSkiNxycq87e0fK2fN/8t
	T3jFf5yrWf+9d4mTk0hWVD/P/IymH+Ia3TjgQc/pzhc0y9cylplrp4YiZNPxVvKLHhuIlmv6NTu
	0v1s0XKovopWLAJN/IJCXoikjfP
X-Received: by 2002:a05:600c:e555:10b0:493:bb23:152a with SMTP id 5b1f17b1804b1-493e68a1853mr45040365e9.34.1783591634502;
        Thu, 09 Jul 2026 03:07:14 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00fd88810a86c49142.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:fd88:810a:86c4:9142])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e5a5d174sm149687135e9.2.2026.07.09.03.07.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 03:07:13 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 22/25] cargo: Fix CVE-2026-5223
Date: Thu,  9 Jul 2026 12:06:38 +0200
Message-ID: <40fe40b645870d3ac12bdf7cac6199dfe2c87a24.1783590688.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783590688.git.yoann.congal@smile.fr>
References: <cover.1783590688.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 10:07:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240569

From: Anil Dongare <adongare@cisco.com>

This patch applies the upstream fix as referenced in [2], using the commit shown in [1].

[1] https://github.com/rust-lang/cargo/commit/285cebf58911eca5b7f177f5d0b1c53e1f646577
[2] https://security-tracker.debian.org/tracker/CVE-2026-5223

Signed-off-by: Anil Dongare <adongare@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../rust/files/CVE-2026-5223.patch            | 114 ++++++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |   1 +
 2 files changed, 115 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/CVE-2026-5223.patch

diff --git a/meta/recipes-devtools/rust/files/CVE-2026-5223.patch b/meta/recipes-devtools/rust/files/CVE-2026-5223.patch
new file mode 100644
index 00000000000..5171d02dda9
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/CVE-2026-5223.patch
@@ -0,0 +1,114 @@
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
+Backport Changes:
+- Adapted to Cargo 0.76.0 in Rust 1.75.0, where unpack_package() still carries
+  the extraction loop directly and the newer smuggled-symlink regression test
+  is not present.
+
+(cherry picked from commit 285cebf58911eca5b7f177f5d0b1c53e1f646577)
+Signed-off-by: Anil Dongare <adongare@cisco.com>
+---
+ src/tools/cargo/src/cargo/sources/registry/mod.rs |  9 ++++++++-
+ src/tools/cargo/tests/testsuite/registry.rs       | 31 ++++++++++++-----------
+ 2 files changed, 24 insertions(+), 16 deletions(-)
+
+diff --git a/src/tools/cargo/src/cargo/sources/registry/mod.rs b/src/tools/cargo/src/cargo/sources/registry/mod.rs
+index 7ee461e..c97d96d 100644
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
+@@ -636,6 +636,13 @@ impl<'cfg> RegistrySource<'cfg> {
+                     prefix
+                 )
+             }
++            // Prevent unpacking symlinks and other unexpected entry types.
++            match entry.header().entry_type() {
++                EntryType::Regular | EntryType::Directory => {}
++                t => anyhow::bail!(
++                    "invalid tarball downloaded, contains an entry at {entry_path:?} with invalid type {t:?}",
++                ),
++            }
+             // Prevent unpacking the lockfile from the crate itself.
+             if entry_path
+                 .file_name()
+diff --git a/src/tools/cargo/tests/testsuite/registry.rs b/src/tools/cargo/tests/testsuite/registry.rs
+index b5dff27..178bfff 100644
+--- a/src/tools/cargo/tests/testsuite/registry.rs
++++ b/src/tools/cargo/tests/testsuite/registry.rs
+@@ -2550,8 +2550,7 @@ fn package_lock_inside_package_is_overwritten() {
+ }
+ 
+ #[cargo_test]
+-fn package_lock_as_a_symlink_inside_package_is_overwritten() {
+-    let registry = registry::init();
++fn package_lock_as_a_symlink_inside_package_is_invalid() {
+     let p = project()
+         .file(
+             "Cargo.toml",
+@@ -2573,21 +2572,23 @@ fn package_lock_as_a_symlink_inside_package_is_overwritten() {
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
+-    let pkg_root = cargo_home()
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
+-- 
+2.44.4
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index 1ba82a8657f..c2abe288899 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -14,6 +14,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://repro-issue-fix-with-v175.patch;patchdir=${RUSTSRC} \
             file://0001-cargo-do-not-write-host-information-into-compilation.patch;patchdir=${RUSTSRC} \
             file://CVE-2026-5222.patch;patchdir=${RUSTSRC} \
+            file://CVE-2026-5223.patch;patchdir=${RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] = "4526f786d673e4859ff2afa0bab2ba13c918b796519a25c1acce06dba9542340"
 

