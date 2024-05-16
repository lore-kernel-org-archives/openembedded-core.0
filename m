Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37B47C25B79
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 11:21:27 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.10989.1715858477352812765
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 May 2024 04:21:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b0VnyGDl;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a5a89787ea4so290094366b.2
        for <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 04:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715858475; x=1716463275; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JbEr+6Ejlt39m/d596jf0Dl4SzxFVtw4fyf0ljvkpwk=;
        b=b0VnyGDlV+4v982+ulYySy0Ax8caTrLoyRox1h8mURgjLTA2hPVOuw0alTzyF9Pefc
         eidema9zL2Z97FrUoKwRtc/a9I/rf1KjTpZouwbTiS4jfhZsEgocz7Jd2OdziHN5bUWW
         7Ow7UURkcuk2CI/kuSWTiyRNhTmlZpKO0Gzp2pitnig5qpxIFYJ9sD4lYNav7vJX4hLh
         6wASvvm8iZ7pe8OVFzBCNFuclUcGt2nh61X2xa6QQzqNTmf+X11CXyApG5cOnvtLqEa8
         hqYNtHdi0zo/JogPazhUDhHEc8GJzi5HiQX4EBkkUO/gK2kUYevBO7TGnnIgUeyjjSo1
         CxkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715858475; x=1716463275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JbEr+6Ejlt39m/d596jf0Dl4SzxFVtw4fyf0ljvkpwk=;
        b=JPhanIFcf/SzlJ5+kcO6qmb4CfAbcBeEzrSMZkOhN7sZ2i483DUkfKRVC+KLI2IbZ1
         FGMIjAlird5bXnvu0EJID57D+ze8z/H4w+dYeyVKEm+BV4RjPJZbWzoJstNtG95YDsJl
         PLk8lfFnciVa3eiC+LaHPasfcp+kKh3OmNRhrLuSihT4w+3ikK1EBVhPDEsJy8eRxvw8
         ZLSDK/lqYWA6MeU5zylBE7gQg41u93OIgouLfKdxeOMbE68ru5MuNFh14Vo7rAuTM6QB
         /gA7iOKaT34zWY9+vypxI1k4I9t75OwPKT9uJzM2MEAPLw0o5WJmTeCaL8z1KWB1bslY
         o3GA==
X-Gm-Message-State: AOJu0YzhxuYbUm1slvQPt7DJd7yaJXvwO4/N9U/sRRPhosT14i5nfRKq
	s6DXkEqpBTNnycYGVPdeyl9qmjwOOT2ZJqmhOTpNv223JMF/w/gnvK1MAg==
X-Google-Smtp-Source: AGHT+IEpZHpAGqUZ6Ufuytt5zycDMla/cLW6CD59mJIY6KISDJO/nK5yw5eCIb3s3Lgq0qu+JAeAPA==
X-Received: by 2002:a17:906:4ecb:b0:a59:c0a6:25d3 with SMTP id a640c23a62f3a-a5a2d54c102mr1220397066b.12.1715858474747;
        Thu, 16 May 2024 04:21:14 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5cdcd149c5sm131254866b.201.2024.05.16.04.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 04:21:14 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/4] rust: add reproducibility patch to eliminate host leakage
Date: Thu, 16 May 2024 13:21:09 +0200
Message-Id: <20240516112111.2145436-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240516112111.2145436-1-alex.kanavin@gmail.com>
References: <20240516112111.2145436-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 11:21:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199466

From: Alexander Kanavin <alex@linutronix.de>

[YOCTO #15185]

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...te-host-information-into-compilation.patch | 51 +++++++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/0001-cargo-do-not-write-host-information-into-compilation.patch

diff --git a/meta/recipes-devtools/rust/files/0001-cargo-do-not-write-host-information-into-compilation.patch b/meta/recipes-devtools/rust/files/0001-cargo-do-not-write-host-information-into-compilation.patch
new file mode 100644
index 00000000000..a6ee8676058
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/0001-cargo-do-not-write-host-information-into-compilation.patch
@@ -0,0 +1,51 @@
+From 065d7c263091118437465d714d8a29dbb6296921 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Mon, 13 May 2024 14:57:54 +0200
+Subject: [PATCH] cargo: do not write host information into compilation unit
+ hashes
+
+This breaks reproducibility in cross-builds where the cross-target
+can be the same, but build hosts are different, as seen with
+"rustc --version -v":
+...
+host: x86_64-unknown-linux-gnu
+
+vs.
+
+host: aarch64-unknown-linux-gnu
+
+This can possibly be improved by only hashing host info if the build
+is a native one (e.g. there's no --target option passed to cargo
+invocation) but I'm not sure how.
+
+Upstream-Status: Inappropriate [reported at https://github.com/rust-lang/cargo/issues/13922]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ .../src/cargo/core/compiler/context/compilation_files.rs      | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/tools/cargo/src/cargo/core/compiler/context/compilation_files.rs b/src/tools/cargo/src/cargo/core/compiler/context/compilation_files.rs
+index d83dbf10c..b2ad8d9f3 100644
+--- a/src/tools/cargo/src/cargo/core/compiler/context/compilation_files.rs
++++ b/src/tools/cargo/src/cargo/core/compiler/context/compilation_files.rs
+@@ -652,7 +652,7 @@ fn hash_rustc_version(bcx: &BuildContext<'_, '_>, hasher: &mut StableHasher) {
+     if vers.pre.is_empty() || bcx.config.cli_unstable().separate_nightlies {
+         // For stable, keep the artifacts separate. This helps if someone is
+         // testing multiple versions, to avoid recompiles.
+-        bcx.rustc().verbose_version.hash(hasher);
++        //bcx.rustc().verbose_version.hash(hasher);
+         return;
+     }
+     // On "nightly"/"beta"/"dev"/etc, keep each "channel" separate. Don't hash
+@@ -665,7 +665,7 @@ fn hash_rustc_version(bcx: &BuildContext<'_, '_>, hasher: &mut StableHasher) {
+     // Keep "host" since some people switch hosts to implicitly change
+     // targets, (like gnu vs musl or gnu vs msvc). In the future, we may want
+     // to consider hashing `unit.kind.short_name()` instead.
+-    bcx.rustc().host.hash(hasher);
++    //bcx.rustc().host.hash(hasher);
+     // None of the other lines are important. Currently they are:
+     // binary: rustc  <-- or "rustdoc"
+     // commit-hash: 38114ff16e7856f98b2b4be7ab4cd29b38bed59a
+-- 
+2.39.2
+
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index c83c8ec3a39..20ef5e82bc4 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -12,6 +12,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://target-build-value.patch;patchdir=${RUSTSRC} \
             file://0001-Handle-vendored-sources-when-remapping-paths.patch;patchdir=${RUSTSRC} \
             file://repro-issue-fix-with-v175.patch;patchdir=${RUSTSRC} \
+            file://0001-cargo-do-not-write-host-information-into-compilation.patch;patchdir=${RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] = "4526f786d673e4859ff2afa0bab2ba13c918b796519a25c1acce06dba9542340"
 
-- 
2.39.2


