Return-Path: <adongare@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 462F9C43602
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 12:36:54 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.91175.1782736605692529520
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 05:36:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=YXB9S4uS;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: adongare@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5323; q=dns/txt;
  s=iport01; t=1782736605; x=1783946205;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vXYfzua3Ts+Bo16ZZ5BFrzVr8CYOh8jkx3RZes8FX00=;
  b=YXB9S4uS43K6yhP5p4i3Y3IlWAIxr9WMG7rGiQ3N+a3MVrDzQlFx4dfo
   EohHIdylOU75siUTtFTZutphmPSdz5YhKdt4O+JP7+4hq/Uo5hqh1R7Bq
   iIrGEmv2gc5ZeUmUgmvtaypoNK7PP7uQe0mbAg1LH+eUz9wXQJST/QT61
   UJGufhYHrqNOxhtwTAZu8SHefSQx6WN3SUrBKKX2xq1zOORtyxxTBOrAN
   q+jBjyAoKrIPWary837q4R3ZyGGrCdbjHDtU7KYSPhDHgcJnyKpUTDWs8
   G7fQzILFYkQV97Jpym5XiWiiibLvXuFBa1r34YpES2FRrDq1NCbJQDCie
   Q==;
X-CSE-ConnectionGUID: c5UWu1XdS+iGhSwZrWSd5w==
X-CSE-MsgGUID: T+JfvEQITBiql1qFRv1F6g==
X-IPAS-Result: =?us-ascii?q?A0BFAgBQZkJq/5P/Ja1aglmCV3RfQkkDlkiLZ5I3gX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhQaNTQImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDYZaAQIBKgsBRiwDAQJPCyMhG4JnAYI6AzYCARG3A4F5M4EBg1oFC?=
 =?us-ascii?q?QJDUNhJDYJWAQsUAQWBM4U/gnyFI1sYAYR8JxsbgXKEfoEFgRpCAgOIIgSCI?=
 =?us-ascii?q?noSgVoeUI5BSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4EMGwcFgR2Ba?=
 =?us-ascii?q?YEEhH0jHwM5f4EwdVhmFTA1gQIBER4KgVInAwsYDUgRLDcUGwQ+bgeMXhcPg?=
 =?us-ascii?q?TWBAQeBBQkBKyBbgTGTES4TkiSgHnEKKIN1jCGPPoV8GjOEBIFXpRGZCIJZi?=
 =?us-ascii?q?F6CU4QJkkeEaIFoPIFZcBWDIglKGQ+OLAwLg2CCZIIvgQHBcCQ1CwMvAQEHA?=
 =?us-ascii?q?gcOAwuBaJF9AQE?=
IronPort-Data: A9a23:q6fKAKABK+8zExVW/3jiw5YqxClBgxIJ4kV8jS/XYbTApG4k0D0Hz
 mZKW2vSPf/fMDSmKd52aIi/p0NTvZaByNRqOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jX2thh
 fuo+5eBYAH/i2YuWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TEyKhTM1xvDYEjuedYAVpRx
 +YnEzxQcUXW7w626OrTpuhEnM8vKozveYgYoHwllGmfBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGYwBPjDS0Un1lM/AZ45muihnHTXeDxDo1XTrq0yi4TW5FEpiuG1aoqII7RmQ+1p3WSWu
 E//3ljTAwgebcWx8yTc3Cyj07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/OMpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOf9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:5UxBzaFh7SSuGge+pLqExMeALOsnbusQ8zAXPo5KJiC9Ffbo8v
 xG88576faZslsssRIb6LK90cu7IU80nKQdieJ6AV7IZmfbUQWTQL2KxLGSpwEIYxeOldJ15O
 NHb7V0DsH2ABxRiMb35xT9LvMbqeP3l5xBQYzlvg5QpcYAUdAH0ztE
X-Talos-CUID: =?us-ascii?q?9a23=3AxcdzWWmjmYVOLc/nW/2O/Qiic6DXOXaA8UjNen+?=
 =?us-ascii?q?0MiVoZ72uVm2Kx5hoztU7zg=3D=3D?=
X-Talos-MUID: 9a23:ujxUBwvE2YzFbYyva82nuHJAOtlF2oWSIkEUlcwflfOabAIuNGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,231,1774310400"; 
   d="scan'208";a="502102851"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Jun 2026 12:36:44 +0000
Received: from sjc-ads-4153.cisco.com (sjc-ads-4153.cisco.com [171.70.54.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id A5A471800024C;
	Mon, 29 Jun 2026 12:36:44 +0000 (GMT)
Received: by sjc-ads-4153.cisco.com (Postfix, from userid 1870532)
	id 597FECC12A6; Mon, 29 Jun 2026 05:36:44 -0700 (PDT)
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Anil Dongare <adongare@cisco.com>
Subject: [OE-core] [scarthgap] [PATCH 1/2] cargo: Fix CVE-2026-5222
Date: Mon, 29 Jun 2026 05:36:37 -0700
Message-ID: <20260629123639.57917-1-adongare@cisco.com>
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
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 12:36:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239765

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


