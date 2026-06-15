Return-Path: <adongare@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7697CD98CF
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 13:01:01 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.128807.1781528457729643013
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2026 06:00:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=VKxl8pdh;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: adongare@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5949; q=dns/txt;
  s=iport01; t=1781528457; x=1782738057;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vFCTyIhOhbOIgzhZ1KIsjoZ/6yPFlN57bIxuZNHG7Jw=;
  b=VKxl8pdhcG0FUcVACQU3DCsWEWAIsZiawgSKWOGyEp2p3OU0D/Y9SGce
   Wv6cf6Q6XO5Oxes9iT0Bv+ti+rYCqsfRNk+/O78GYeNuYvpKIOgn+ceKx
   PYVmPucNAZcJHFJ8v17O4dGaElUCBlr8tjFP4rO6iiS6dXePZhKk4WIrr
   J+5I3CoK+AS+UczLk/Lzg24pZDSa8OfWYifHXeXorFZfsVQm+89bTlmhw
   BwI8TvrPpv0UuFFlaGOytC5WKtRePSYNWglS67NNE0EORsah9mYwoHVcq
   akM0ZHbahSENq51Swg7YtDGjsIA33Pt+lawmIxVXdj3YFPL6iVAQdPLX+
   w==;
X-CSE-ConnectionGUID: f1NbaxI1RdCjWCPSz0TPmg==
X-CSE-MsgGUID: dbnTJL2NTDixq4qh0JZXHQ==
X-IPAS-Result: =?us-ascii?q?A0D+AgAm9i9q/5P/Ja1UBoJZgld0X0JJA5ZIA54bgX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhQYCjUMCJjYHDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2GWgECAQMyATQSEBwDAQIvKyMIGYMCAYJzAgERs3YaN4IsgQGDW?=
 =?us-ascii?q?gUJAkNQ2ywBCxQBBYEzhT+IH1sYAYR8JxsbgXKECHaBBYFcAgOBTYZVBIIie?=
 =?us-ascii?q?hKBWh6CI4IKil1IgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQwbBwWBS?=
 =?us-ascii?q?oIPgQWFDSMfAzl/gXCBJWdmFTA1gQEBER8KHAMLGA1IESw3FBsEPm4HjFIXD?=
 =?us-ascii?q?4FwTQF6EwErFwl7KApfEzuSYBGSN4E1n1oKKIN1jCGVOhozhASBV5JAklGZC?=
 =?us-ascii?q?I4KlVN9hGiBbgE1gVlwFYMiCUoZD44sDAuDYIJkgi+BAcFgJDULAy8BAQcCB?=
 =?us-ascii?q?w4DC4FokX0BAQ?=
IronPort-Data: A9a23:VzHzJaj5WEF+S0kEE6SHIYF4X161MREKZh0ujC45NGQN5FlHY01je
 htvXDiAPPuKY2akL9xyYY62/EoOuZbTz99jQQpoqis0Rn5jpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeDULOZ82QsaDxMtfve8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUWo8B9CHFvr
 MYUAzIyRSi4lbqK+Le0H7wEasQLdKEHPasFsX1miDWcBvE8TNWaG+PB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZgh/5JEWxI9EglH2fzpep1uPqII84nPYy0p6172F3N/9Jo3XH5UOwhnCz
 o7A12jzBC04EIa59RaE4mvwn++XvxHLeLtHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBF2YHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289Fte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:PoD3+asAEk+Si5a2qP8FOcj97skDrtV00zEX/kB9WHVpmwKj+P
 xG+85rsiMc5wxxZJhNo7290ey7MBHhHP1OkO0s1NWZPDUO0VHAROoJ0WKh+UyEJ8SUzIBgPM
 lbH5SWIeeAa2SS9fyKgzWQIpIH3MSN9ryuiKP1yndgShwvVoRbhj0Jczpy1iZNNXJ77V1TLu
 vl2vZ6
X-Talos-CUID: =?us-ascii?q?9a23=3AzQ9ciWpnqleZEsQtxtiVu/7mUc58VHfU3FaJGUO?=
 =?us-ascii?q?TC1lCcIaHEWOo/awxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AQ/XIHw26CGP+9CPtwXQ61dA9vTUj766oNGIpy7M?=
 =?us-ascii?q?6l8iULHBpO2+/vgSXe9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,206,1774310400"; 
   d="scan'208";a="495283472"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Jun 2026 13:00:56 +0000
Received: from sjc-ads-4153.cisco.com (sjc-ads-4153.cisco.com [171.70.54.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id A184418000276;
	Mon, 15 Jun 2026 13:00:56 +0000 (GMT)
Received: by sjc-ads-4153.cisco.com (Postfix, from userid 1870532)
	id 3CC04CC12A7; Mon, 15 Jun 2026 06:00:56 -0700 (PDT)
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com, to@cisco.com,
	Anil Dongare <adongare@cisco.com>
Subject: [OE-core] [scarthgap] [PATCH 2/2] cargo: Fix CVE-2026-5223
Date: Mon, 15 Jun 2026 06:00:42 -0700
Message-ID: <20260615130043.14442-2-adongare@cisco.com>
X-Mailer: git-send-email 2.44.4
In-Reply-To: <20260615130043.14442-1-adongare@cisco.com>
References: <20260615130043.14442-1-adongare@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4153.cisco.com [171.70.54.174];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.174, sjc-ads-4153.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 13:01:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238850

From: Anil Dongare <adongare@cisco.com>

This patch applies the upstream fix as referenced in [2], using the commit shown in [1].

[1] https://github.com/rust-lang/cargo/commit/285cebf58911eca5b7f177f5d0b1c53e1f646577
[2] https://security-tracker.debian.org/tracker/CVE-2026-5223

Signed-off-by: Anil Dongare <adongare@cisco.com>
---
 .../rust/files/CVE-2026-5223.patch            | 114 ++++++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |   1 +
 2 files changed, 115 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/CVE-2026-5223.patch

diff --git a/meta/recipes-devtools/rust/files/CVE-2026-5223.patch b/meta/recipes-devtools/rust/files/CVE-2026-5223.patch
new file mode 100644
index 0000000000..5171d02dda
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
index 963b5debcd..c69c893cbb 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -14,6 +14,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://repro-issue-fix-with-v175.patch;patchdir=${RUSTSRC} \
             file://0001-cargo-do-not-write-host-information-into-compilation.patch;patchdir=${RUSTSRC} \
             file://CVE-2026-5222.patch;patchdir=${RUSTSRC} \
+            file://CVE-2026-5223.patch;patchdir=${RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] = "4526f786d673e4859ff2afa0bab2ba13c918b796519a25c1acce06dba9542340"
 
-- 
2.44.4


