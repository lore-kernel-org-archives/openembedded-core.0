Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EC17C44501
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 10:07:17 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5893.1783591635290011429
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2026 03:07:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=iSYmUXVD;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493c733f15aso7270075e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 03:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783591633; x=1784196433; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2y2XFkaitLihVswhbMrrRp5Hun9aodVJOsAdbQA7C24=;
        b=iSYmUXVDxg1gE/+L8RsRfXNNojPlfEglHYetad5ozZFN4mIJdxMJ2p8L4T0rWrpwyj
         CdEGLh9c4rtWugw0lIyCkBxqjQTFiYQd3tK7OtH9woiDFcmgCZuj9dvsgKnkvjUOUaPa
         8hbzO0ffYUoFyhbpgqxx9lyHFIQWtQSz7dNzM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783591633; x=1784196433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2y2XFkaitLihVswhbMrrRp5Hun9aodVJOsAdbQA7C24=;
        b=VrmxnibCbt1kEhQZzGpQil+h0FMOdNFRfW0tnQFW9wM5cd9clelbpIEic6pOxYmllP
         AueNDOTArzRq1o+SFadINuYcKHAQJx17cXhQpAE2eNlm3f1dkymlyljxUD3XtAnWSzHm
         08n7bEQKGb5+ohDBh9va3L+vPsAAh+8L8RGEqWWumI2MhgSLBiePb8qvr+NEtym6TnsD
         POAgiQjYVdCdRkzNKDUtLb3i1/QBC5P782sqpBQUY8XJGQQkZcRRObrvBUu6RQjjf4Fc
         2wWSs8Ef6S5zXdRcar8N0gtLmP4U/NUC29uztNElqUVwORxS9hBwx0OrHnMzvxu0K7Va
         FZzw==
X-Gm-Message-State: AOJu0YzavtD5k5VgkUr4HXSliZJ3brr6nVvZRr3jUQt0XoX3O2gndaku
	KsdNRBR0UrGzXpTKvxYt7O1t7p+z//94yjyeIG7bHfNlxCr6LEAJ2NVKEVdI/8RQkiv8nUcsmSr
	fB7cqvwY=
X-Gm-Gg: AfdE7ckBI1WC5VemVsZsGUtnMasMjXcCn1cbrYnoLmIui+bRlMymk6HkPZhzoT+E4lE
	zCYGT+TlzSX5w5tvHwDIYuxPMs8DO86hADOX0lKGsaG4jsamyBV/XWIT7MjH5OR3Alp14eDqeR6
	X7Lr9Jg+bKAIGY0KxO6MG94UzkD53F9ydE00J0t4QfBAmeuZxkXfydCXFtOPvLwGJZZoP/j+aYf
	aB6Iss+UchDpyZuT1rh/jX5lVbZpDZakBgh27Le4hyFt9WyyTAewHBpA2+7HcIDZMf3TyBHp40L
	c2DTWQeq08iPOOcC+fgt1ivCfvSNxZcZE+CYKVTdOl0cfYkPBpPnfu3z4gOgG/R5oD1HO/hGOBR
	DncIRCSuNDukvvmUnrdcoW2k7rLZ9EddLwTMfvDkpIDCG2dCWKFiid/6Rc0+R6/zj7wPvnZftFP
	F9aYTHdfaDGIc5ArgAMYAHwZwwCIoCyjaJAQHelZU4/R/AiI93zZrU0+WEt0CAw29Fk8IyHjiwh
	oJagMJ+ULCM//9eEw==
X-Received: by 2002:a05:600c:6095:b0:493:d305:b8f3 with SMTP id 5b1f17b1804b1-493e6898530mr63821345e9.3.1783591633415;
        Thu, 09 Jul 2026 03:07:13 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00fd88810a86c49142.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:fd88:810a:86c4:9142])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e5a5d174sm149687135e9.2.2026.07.09.03.07.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 03:07:12 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 21/25] cargo: Fix CVE-2026-5222
Date: Thu,  9 Jul 2026 12:06:37 +0200
Message-ID: <f2131556c486a0ed5a08e7ef3b2af4c42fb926b2.1783590688.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783590688.git.yoann.congal@smile.fr>
References: <cover.1783590688.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 10:07:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240568

From: Anil Dongare <adongare@cisco.com>

This patch applies the upstream fix as referenced in [2], using the commit shown in [1].

[1] https://github.com/rust-lang/cargo/commit/c4d63a44234de22dc745231c416b80ed848d997f
[2] https://security-tracker.debian.org/tracker/CVE-2026-5222

Signed-off-by: Anil Dongare <adongare@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../rust/files/CVE-2026-5222.patch            | 92 +++++++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |  1 +
 2 files changed, 93 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/CVE-2026-5222.patch

diff --git a/meta/recipes-devtools/rust/files/CVE-2026-5222.patch b/meta/recipes-devtools/rust/files/CVE-2026-5222.patch
new file mode 100644
index 00000000000..50ba608c1c3
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
index 318c7f0e293..1ba82a8657f 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -13,6 +13,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://0001-Handle-vendored-sources-when-remapping-paths.patch;patchdir=${RUSTSRC} \
             file://repro-issue-fix-with-v175.patch;patchdir=${RUSTSRC} \
             file://0001-cargo-do-not-write-host-information-into-compilation.patch;patchdir=${RUSTSRC} \
+            file://CVE-2026-5222.patch;patchdir=${RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] = "4526f786d673e4859ff2afa0bab2ba13c918b796519a25c1acce06dba9542340"
 

