Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web12.2114.1614135755959497758
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Feb 2021 19:02:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: randy.macleod@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 11O32Okg009274
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Feb 2021 19:02:30 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 23 Feb 2021 19:02:11 -0800
Received: from vme.wrs.com (172.25.44.2) by ala-exchng01.corp.ad.wrs.com
 (147.11.82.252) with Microsoft SMTP Server id 15.1.2106.2 via Frontend
 Transport; Tue, 23 Feb 2021 19:02:11 -0800
From: "Randy MacLeod" <randy.macleod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 5/8] rust: mv README.md to recipes-devtools/rust/README-rust.md
Date: Tue, 23 Feb 2021 22:01:58 -0500
Message-ID: <20210224030201.349588-6-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210224030201.349588-1-Randy.MacLeod@windriver.com>
References: <20210224030201.349588-1-Randy.MacLeod@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Import the meta-rust/README.md but relocate and rename it.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta/recipes-devtools/rust/README-rust.md | 69 +++++++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/README-rust.md

diff --git a/meta/recipes-devtools/rust/README-rust.md b/meta/recipes-devtools/rust/README-rust.md
new file mode 100644
index 0000000000..329d59ab7b
--- /dev/null
+++ b/meta/recipes-devtools/rust/README-rust.md
@@ -0,0 +1,69 @@
+## Introduction
+
+This OpenEmbedded layer provides the rust compiler, tools for building packages
+(cargo), and a few example projects.
+
+## What works:
+
+ - Building `rust-native` and `cargo-native`
+ - Building Rust based projects with Cargo for the TARGET
+   - e.g. `rustfmt` which is used by the CI system
+ - `-buildsdk` and `-crosssdk` packages
+
+## What doesn't:
+
+ - Using anything but x86_64 as the build environment
+ - rust (built for target) issue #81
+
+## What's untested:
+
+ - cargo (built for target)
+
+## Building a rust package
+
+When building a rust package in bitbake, it's usually easiest to build with
+cargo using cargo.bbclass.  If the package already has a Cargo.toml file (most
+rust packages do), then it's especially easy.  Otherwise you should probably
+get the code building in cargo first.
+
+Once your package builds in cargo, you can use
+[cargo-bitbake](https://github.com/cardoe/cargo-bitbake) to generate a bitbake
+recipe for it.  This allows bitbake to fetch all the necessary dependent
+crates, as well as a pegged version of the crates.io index, to ensure maximum
+reproducibility.
+
+NOTE: You will have to edit the generated recipe based on the comments
+contained within it
+
+## TODO
+
+## Pitfalls
+
+ - TARGET_SYS _must_ be different from BUILD_SYS. This is due to the way Rust configuration options are tracked for different targets. This is the reason we use the Yocto triples instead of the native Rust triples. See rust-lang/cargo#3349.
+
+## Dependencies
+
+On the host:
+ - Any `-sys` packages your project might need must have RDEPENDs for
+ the native library.
+
+On the target:
+ - Any `-sys` packages your project might need must have RDEPENDs for
+ the native library.
+
+## Maintainer(s) & Patch policy
+
+Open a Pull Request.
+
+The master branch supports the latest master of poky. When poky creates releases, we will create a branch with the same name as the poky release. This release branch should always work with that poky release. Note that these release branches will typically be less tested than the master branch.
+
+All new patches against rust, rust-llvm, and cargo must have referenced
+upstream issues or PRs opened or an explanation why the patch cannot be
+upstreamed. This cooresponds to the OpenEmbedded policy for other meta layers.
+
+More info can be seen on the wiki.
+
+## Copyright
+
+MIT OR Apache-2.0 - Same as rust
+
-- 
2.27.0

