Return-Path: <adongare@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D08BACD98C5
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 13:01:01 +0000 (UTC)
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.128808.1781528457755112961
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2026 06:00:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=FaY5MxdU;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: adongare@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5335; q=dns/txt;
  s=iport01; t=1781528457; x=1782738057;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Hu3Mpeb7bRdtLu55xqKBFpyIDgkaS3jac9SJ5SoS4Us=;
  b=FaY5MxdUI25PzTlUnAxPOyPnkDjwR6uVeRKp7oWnGhbI45kYJX1XVF/f
   bdAnFo+6J4unswzI6QfMnNSggdPqk2VYsPU9yGpkMxg2BAuRHCDVLdlLo
   noeJgzoGYq4XAWZ90Wq3WZzB/RtaALLtVvmAmC+GeR4hBykcLAnuFJblj
   ahXB4Ix1sBCBt5qwVWHPQTtLq/ZMGUlXsofe+8lT7Lxhtz13dsIrUArbF
   RG/OH0b5V6omrCM6tcEXoT3e64mxH52/J96Zf8c1DrRdM4h2WpFPN8HQz
   OM7X5NXaCzelUY96au30oMh8cRHj1dXuC/U6/TTpj5m2MeEITADZJDPm3
   g==;
X-CSE-ConnectionGUID: YZWWDAnOTAORCdeOLJ98QA==
X-CSE-MsgGUID: 4EDeZB+QRMaHvRwJvIvuyA==
X-IPAS-Result: =?us-ascii?q?A0BFAgC29i9q/5P/Ja1aglmCV3RfQkkDlkiLZ5I3gX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhQaNRQImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDYZaAQIBKgsBRiwDAQJPCyMhG4JnAYI6AzYCARG0SIF5M4EBg1oFC?=
 =?us-ascii?q?QJDUNhJDYJWAQsUAQWBM4U/gnyFI1sYAYR8JxsbgXKEfoEFgRpCAgOIIgSCI?=
 =?us-ascii?q?noSgVoeUo44SIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4EMGwcFgUqCD?=
 =?us-ascii?q?4EFhQ0jHwM5f4FwgSVnZhUwNYEBAREfChwDCxgNSBEsNxQbBD5uB4xSFw+BN?=
 =?us-ascii?q?YEBB4EFCQErIIIMTpJDJAqSN6AecQoog3WMIY8+hXwaM4VbpRGZCIs3glOEC?=
 =?us-ascii?q?ZJHhGiBaDyBWXAVgyIJShkPjiwMC4NggmSCL4EBwW4kNQsDLwEBBwIHDgMLg?=
 =?us-ascii?q?WiRfQEB?=
IronPort-Data: A9a23:47e5DKu54fWr8wvjXFRRqlt3gufnVAdfMUV32f8akzHdYApBsoF/q
 tZmKT2DaP2Na2uhf4hzbIqx90ME7JTRmIJkGwtpri4wH3lAgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZDdJ5xYuajhKs/za9Us21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIwy9RIPk1n8
 9skARc3RRyOoMaUkeKCY7w57igjBJGD0II3oHpsy3TdSP0hW52GGv2M7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtIYH49tL/Aan3XejFfrl2cv6cf6GnIxws327/oWDbQUoDbGZUNzx7A/
 goq+UylLz0XBvbc8ACg+1KyvPDtgwLlRZM7QejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dUL
 FYZ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2cZLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWna1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:cneyyKBskPT0cHTlHemA55DYdb4zR+YMi2TDGXofdfUzSL38qy
 nAppUmPHPP5Qr5O0tQ++xoWpPhfZq0z/cciuMs1NyZMjUO1lHFEGhK1/qH/9SZIVycysdtkY
 F9bqN5FNr8SXJ+jcr8/U2ENuxI+qjhzEht7t2utkuEimpRGsdd0zs=
X-Talos-CUID: 9a23:B8ycfWDsnHFEOaf6ExhVy3E4M8YCTlT69lzcLmicKzc5cZTAHA==
X-Talos-MUID: 9a23:dksdPguQNFeEKP6NPM2n2BxOOfVCoJ2ULUktj68ZmdelKzFhEmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,206,1774310400"; 
   d="scan'208";a="494809000"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Jun 2026 13:00:56 +0000
Received: from sjc-ads-4153.cisco.com (sjc-ads-4153.cisco.com [171.70.54.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id 92E861800024F;
	Mon, 15 Jun 2026 13:00:56 +0000 (GMT)
Received: by sjc-ads-4153.cisco.com (Postfix, from userid 1870532)
	id 39A93CC12A6; Mon, 15 Jun 2026 06:00:56 -0700 (PDT)
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com, to@cisco.com,
	Anil Dongare <adongare@cisco.com>
Subject: [OE-core] [scarthgap] [PATCH 1/2] cargo: Fix CVE-2026-5222
Date: Mon, 15 Jun 2026 06:00:41 -0700
Message-ID: <20260615130043.14442-1-adongare@cisco.com>
X-Mailer: git-send-email 2.44.4
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238851

From: Anil Dongare <adongare@cisco.com>

This patch applies the upstream fix as referenced in [2], using the commit shown in [1].

[1] https://github.com/rust-lang/cargo/commit/c4d63a44234de22dc745231c416b80ed848d997f
[2] https://security-tracker.debian.org/tracker/CVE-2026-5222

Signed-off-by: Anil Dongare <adongare@cisco.com>
---
 .../rust/files/CVE-2026-5222.patch            | 92 +++++++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |  1 +
 2 files changed, 93 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/CVE-2026-5222.patch

diff --git a/meta/recipes-devtools/rust/files/CVE-2026-5222.patch b/meta/recipes-devtools/rust/files/CVE-2026-5222.patch
new file mode 100644
index 0000000000..50ba608c1c
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/CVE-2026-5222.patch
@@ -0,0 +1,92 @@
+From c4d63a44234de22dc745231c416b80ed848d997f Mon Sep 17 00:00:00 2001
+From: Arlo Siemsen <arkixml@gmail.com>
+Date: Mon, 25 May 2026 09:49:43 +0200
+Subject: [PATCH] CVE-2026-5222: avoid stripping .git suffix when for non git
+ registries
+
+CVE: CVE-2026-5222
+Upstream-Status: Backport [https://github.com/rust-lang/cargo/commit/c4d63a44234de22dc745231c416b80ed848d997f]
+
+(cherry picked from commit c4d63a44234de22dc745231c416b80ed848d997f)
+Signed-off-by: Anil Dongare <adongare@cisco.com>
+---
+ src/tools/cargo/src/cargo/sources/git/source.rs |  7 +++++++
+ src/tools/cargo/src/cargo/util/canonical_url.rs | 44 +++++++++++++------------
+ 2 files changed, 31 insertions(+), 20 deletions(-)
+
+diff --git a/src/tools/cargo/src/cargo/sources/git/source.rs b/src/tools/cargo/src/cargo/sources/git/source.rs
+index a75c1ec..1c8dbc8 100644
+--- a/src/tools/cargo/src/cargo/sources/git/source.rs
++++ b/src/tools/cargo/src/cargo/sources/git/source.rs
+@@ -377,6 +377,13 @@ mod test {
+         assert_eq!(ident1, ident2);
+     }
+ 
++    #[test]
++    fn test_canonicalize_idents_does_not_strip_dot_git_for_sparse() {
++        let ident1 = ident(&src("sparse+https://crates.io/fake-registry"));
++        let ident2 = ident(&src("sparse+https://crates.io/fake-registry.git"));
++        assert_ne!(ident1, ident2);
++    }
++
+     fn src(s: &str) -> SourceId {
+         SourceId::for_git(&s.into_url().unwrap(), GitReference::DefaultBranch).unwrap()
+     }
+diff --git a/src/tools/cargo/src/cargo/util/canonical_url.rs b/src/tools/cargo/src/cargo/util/canonical_url.rs
+index 7516e03..2716d2d 100644
+--- a/src/tools/cargo/src/cargo/util/canonical_url.rs
++++ b/src/tools/cargo/src/cargo/util/canonical_url.rs
+@@ -33,27 +33,31 @@ impl CanonicalUrl {
+             url.path_segments_mut().unwrap().pop_if_empty();
+         }
+ 
+-        // For GitHub URLs specifically, just lower-case everything. GitHub
+-        // treats both the same, but they hash differently, and we're gonna be
+-        // hashing them. This wants a more general solution, and also we're
+-        // almost certainly not using the same case conversion rules that GitHub
+-        // does. (See issue #84)
+-        if url.host_str() == Some("github.com") {
+-            url = format!("https{}", &url[url::Position::AfterScheme..])
+-                .parse()
+-                .unwrap();
+-            let path = url.path().to_lowercase();
+-            url.set_path(&path);
+-        }
++        // Perform further canonicalization specific to git registries, which
++        // do not contain a `+` specifier.
++        if !url.scheme().contains('+') {
++            // For GitHub URLs specifically, just lower-case everything. GitHub
++            // treats both the same, but they hash differently, and we're gonna be
++            // hashing them. This wants a more general solution, and also we're
++            // almost certainly not using the same case conversion rules that GitHub
++            // does. (See issue #84)
++            if url.host_str() == Some("github.com") {
++                url = format!("https{}", &url[url::Position::AfterScheme..])
++                    .parse()
++                    .unwrap();
++                let path = url.path().to_lowercase();
++                url.set_path(&path);
++            }
+ 
+-        // Repos can generally be accessed with or without `.git` extension.
+-        let needs_chopping = url.path().ends_with(".git");
+-        if needs_chopping {
+-            let last = {
+-                let last = url.path_segments().unwrap().next_back().unwrap();
+-                last[..last.len() - 4].to_owned()
+-            };
+-            url.path_segments_mut().unwrap().pop().push(&last);
++            // Repos can generally be accessed with or without `.git` extension.
++            let needs_chopping = url.path().ends_with(".git");
++            if needs_chopping {
++                let last = {
++                    let last = url.path_segments().unwrap().next_back().unwrap();
++                    last[..last.len() - 4].to_owned()
++                };
++                url.path_segments_mut().unwrap().pop().push(&last);
++            }
+         }
+ 
+         Ok(CanonicalUrl(url))
+-- 
+2.44.4
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index 5b433ceae7..963b5debcd 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -13,6 +13,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://0001-Handle-vendored-sources-when-remapping-paths.patch;patchdir=${RUSTSRC} \
             file://repro-issue-fix-with-v175.patch;patchdir=${RUSTSRC} \
             file://0001-cargo-do-not-write-host-information-into-compilation.patch;patchdir=${RUSTSRC} \
+            file://CVE-2026-5222.patch;patchdir=${RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] = "4526f786d673e4859ff2afa0bab2ba13c918b796519a25c1acce06dba9542340"
 
-- 
2.44.4


