Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDD2EC43602
	for <webhook@archiver.kernel.org>; Sun,  5 Jul 2026 22:42:56 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.139216.1783291374554035602
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2026 15:42:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=nxj73xf0;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493b27c7451so30442015e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 15:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783291373; x=1783896173; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s8eiqg/4S9xHRcEkeF8TmAdlHo0m5Pl2dQYhRIwtKCY=;
        b=nxj73xf01FByz9dwqvPJV8uv5EDNoZJBQS+I3RFhANCrbqvah5O9PMXIe6DfT7FaRX
         qCojM2q8oAh4TRzedpQieFyKTO9Fw5RX1iJbuJk1gkLS6keEYHd6BqKoVhNyTGqcZ2Ur
         i7F2+X6jV0UGV0XZZOSfwPvI2sjUw7JufTx6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783291373; x=1783896173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s8eiqg/4S9xHRcEkeF8TmAdlHo0m5Pl2dQYhRIwtKCY=;
        b=KxnXua6vCCUlqi+i6LcXVoORzGTZZiEhGwgO213UQJPdaBlFwGXbg7VpSqQyIA0286
         FY0riZKRz24IJS7/Hg0PtQu7DOXbD5A8RNlrAw4LdlZyTnM5bfiiOOtZMi5t+liOkNgz
         ngi4e8M4WOF1e2TX3s8WtYyEayKtHHOgkN03fJht3gCOGCgtqqt0IGlVtjvRqJfsbK6s
         wmXoMG09slp3NiD2NWYjEZTRugl7hZBVg9gZFe5S+rDIRTydQSjYg5D6GxgwAISKJXGp
         wENIjBteSU4Ukjz5i7tpTXbrOp455pq0wFcf8dV9G08AWgOi2XBTEVNPqTe6boH9Cu6R
         ImwA==
X-Gm-Message-State: AOJu0Yw2SNysBAY4bBKh8NafsFpMIPD29mF3GqxmOjmll90rGBLlP5g3
	hApncKYOOp6GHiD/+T0K91TDYQE/edrSODauEGcWlE8yXNBN4zTJbfAnldpcOue7qC5kO7gWbmh
	1yFSHYuA=
X-Gm-Gg: AfdE7cnBBI+eBf22czCfhSVCU/Y8nPZFq+wt8eTWeaLw6MIRVQlCeJyd2/5TveXlcVs
	kEd4oPCWxuYRHsUgTPbRgHTkxmfQmbtpj65zMgKIlSdor9NvAwgBMf/1LMcI9aZB6naGgRNdjbX
	lT2bZbbV28p/DeoHYKxNHdxO+9GnxLS938PUqSzjX28AXchptXPi2WXzmc/M3J3umkN/Nyj/stR
	DApXFek5bM7KVrhBPfaBZpAhL1uW8tDupoXvOQPYexwejUiuOW2ca22MYEwCqkV5S//5NqIVR8R
	+dYgjnqVALcT2gaYXfC1rhx5jW8RqDDd3oFM6jDROcWpsywYHrKpZKXs5XnaUtakebsMvOYr2PR
	z9J863DJcWg4MH9NeZzpVpZiKohUGg+K2nfWipQqjgowvWNi/H9/gcRjIyVmHsrBdKhdLYQ//pL
	S+4Nt+camlVBXB+83qj8Hj6fPkgg==
X-Received: by 2002:a05:600c:a48:b0:493:cbdc:7cd2 with SMTP id 5b1f17b1804b1-493d127f015mr87993305e9.3.1783291372707;
        Sun, 05 Jul 2026 15:42:52 -0700 (PDT)
Received: from FRSMI25-LASER.lan ([2001:861:8010:5750:6d3a:72ff:5857:d2a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960af0sm17943606f8f.30.2026.07.05.15.42.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 15:42:52 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 18/55] cargo: Fix CVE-2026-5222
Date: Mon,  6 Jul 2026 00:41:08 +0200
Message-ID: <6c39ce6376c45e85fba491a8719c7ff31bf2a5cd.1783289522.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783289522.git.yoann.congal@smile.fr>
References: <cover.1783289522.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 22:42:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240172

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
index 00000000000..e323e67651f
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
index f11bbea9b34..36407fa9750 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -11,6 +11,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://0001-Update-amdgpu-data-layout.patch;patchdir=${RUSTSRC} \
             file://0001-Adjust-loongarch-assembly-test.patch;patchdir=${RUSTSRC} \
             file://0001-Fix-multiple-option-or-permutations-test-for-big-end.patch;patchdir=${RUSTSRC} \
+            file://CVE-2026-5222.patch;patchdir=${RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] = "174fce10ce012317ca995810296d8af199318838180b03d68a853e0f02d4b571"
 

