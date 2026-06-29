Return-Path: <adongare@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 715D7C43327
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 12:39:24 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36613.1782736762806346626
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 05:39:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=HbugRxOC;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: adongare@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5323; q=dns/txt;
  s=iport01; t=1782736762; x=1783946362;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vXYfzua3Ts+Bo16ZZ5BFrzVr8CYOh8jkx3RZes8FX00=;
  b=HbugRxOCsU/dALfaTWVpBjzFktWOO49Zi+vI46iYEEHC776FkoZcgxtm
   31hxyhaBq/n0x8Os/bInHjLn4LEpTpUnd52H0ZudYDl2/xnwg+Ztg4/Wt
   jw4NgX4QWiJd40BFH2Ima16VTc7Wz5Qqae0l2UyXkBWCXtysBoKjCU+6E
   TAFY97w6v58MQGNrpfgqyuvtFiiN6Aa3TJM4Z4NNi6mIZAMA/v53fYOnG
   lSxeFSfbdvFn8WwC29DVb5SDRJK1xjftZKhXPl81vwtxMeUtEhBvffQa2
   4r4fxG6GBqHtwjqt18i8ydFogPoinCQZGmGxDXTSkO7NN/yignjbX0ZHd
   g==;
X-CSE-ConnectionGUID: Q32wJew4TJmtxxjP2Td81g==
X-CSE-MsgGUID: Vcgpzt42Sf64uLfd3pp5JA==
X-IPAS-Result: =?us-ascii?q?A0BFAgDHZkJq/47/Ja1aglmCV3RfQkkDlkiLZ5I3gX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhQaNTQImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDYZaAQIBKgsBRiwDAQJPCyMhG4JnAYI6AzYCARG3CIF5M4EBg1oFC?=
 =?us-ascii?q?QJDUNhJDYJWAQsUAQWBM4U/gnyFI1sYAYR8JxsbgXKEfoEFgRpCAgOIIgSCI?=
 =?us-ascii?q?noSgVoeUI5BSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4EMGwcFgR2Ba?=
 =?us-ascii?q?YEEhH0jHwM5f4EwdVhmFTA1gQIBER4KgVInAwsYDUgRLDcUGwQ+bgeMXhcPg?=
 =?us-ascii?q?TWBAQeBBQkBKyBbgTGTES4TkiSgHnEKKIN1jCGPPoV8GjOEBIFXpRGZCIJZi?=
 =?us-ascii?q?F6CU4QJkkeEaIFoPIFZcBWDIglKGQ+OLAwLg2CCZIIvgQHBcCQ1CwMvAQEHA?=
 =?us-ascii?q?gcOAwuBaJF9AQE?=
IronPort-Data: A9a23:ASvvTqLoOr1gzdumFE+RgJQlxSXFcZb7ZxGr2PjKsXjdYENSgmQCy
 jdMUTyCOa3Za2D9eYh/YIix9RxS7JHVn4cyGwsd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnR0
 T/Oi5eHYgH9hWQkajh8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1XVxspH4AHptpVBH1e5
 f4gcgwBPkmM0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBULAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2ME6ojx5nYj/7DLo3kOCuiXDlfhVTqUmeouw85G27IAlZjOiyYIaOI4XbLSlTtniTq
 XrU4zijOR9EaMG7xzbe6mrxpMaayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRu1vfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:LmHg6qivBGIswTFmKakoLgPbIHBQXvYji2hC6mlwRA09TyVXra
 +TdZMgpHrJYVkqOU3I9ersBEDiewK/yXcW2+ks1N6ZNWGM0ldAR7sN0WKN+VHd8gTFh4pgPN
 9bAstDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhBQpcUAUdAY0++/YTzrdHFLeA==
X-Talos-CUID: =?us-ascii?q?9a23=3AvCkC7GkCXaowNQ5Aed6B75bQDlDXOUSGlmjyLlD?=
 =?us-ascii?q?kNURsVK2FS2fKxK80ysU7zg=3D=3D?=
X-Talos-MUID: 9a23:ub0l6gW0/88EjE3q/AHniylwKJsy2KrwVF0pn5ldo9HZFwUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,231,1774310400"; 
   d="scan'208";a="487843119"
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Jun 2026 12:39:21 +0000
Received: from sjc-ads-4153.cisco.com (sjc-ads-4153.cisco.com [171.70.54.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id BD2721800034D;
	Mon, 29 Jun 2026 12:39:21 +0000 (GMT)
Received: by sjc-ads-4153.cisco.com (Postfix, from userid 1870532)
	id 73845CC12A6; Mon, 29 Jun 2026 05:39:21 -0700 (PDT)
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Anil Dongare <adongare@cisco.com>
Subject: [OE-core] [wrynose] [PATCH 1/2] cargo: Fix CVE-2026-5222
Date: Mon, 29 Jun 2026 05:39:15 -0700
Message-ID: <20260629123917.60003-1-adongare@cisco.com>
X-Mailer: git-send-email 2.44.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4153.cisco.com [171.70.54.174];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.174, sjc-ads-4153.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 12:39:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239767

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
index 0000000000..e323e67651
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
+ src/tools/cargo/src/cargo/sources/git/source.rs |  7 ++++
+ src/tools/cargo/src/cargo/util/canonical_url.rs | 44 ++++++++++++++-----------
+ 2 files changed, 31 insertions(+), 20 deletions(-)
+
+diff --git a/src/tools/cargo/src/cargo/sources/git/source.rs b/src/tools/cargo/src/cargo/sources/git/source.rs
+index d6dbe03..a7b3205 100644
+--- a/src/tools/cargo/src/cargo/sources/git/source.rs
++++ b/src/tools/cargo/src/cargo/sources/git/source.rs
+@@ -470,6 +470,13 @@ mod test {
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
index f11bbea9b3..36407fa975 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -11,6 +11,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://0001-Update-amdgpu-data-layout.patch;patchdir=${RUSTSRC} \
             file://0001-Adjust-loongarch-assembly-test.patch;patchdir=${RUSTSRC} \
             file://0001-Fix-multiple-option-or-permutations-test-for-big-end.patch;patchdir=${RUSTSRC} \
+            file://CVE-2026-5222.patch;patchdir=${RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] = "174fce10ce012317ca995810296d8af199318838180b03d68a853e0f02d4b571"
 
-- 
2.44.4


