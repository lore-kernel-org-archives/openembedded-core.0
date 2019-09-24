Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 83ABE7E21C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 02:47:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x8O2jTmB031731
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 23 Sep 2019 19:47:03 -0700
Received: from fidler.wrs.com (172.25.44.5) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Mon, 23 Sep 2019 19:46:25 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 23 Sep 2019 22:45:08 -0400
Message-ID: <20190924024508.9175-4-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190924024508.9175-1-Randy.MacLeod@windriver.com>
References: <20190924024508.9175-1-Randy.MacLeod@windriver.com>
MIME-Version: 1.0
Cc: stevenrwalter@gmail.com, cardoe@cardoe.com, bunk@stusta.de
Subject: [RFC][Patch 3/3] rust: mv README.md to recipes-devtools/rust/README-rust.md
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Sep 2019 02:47:59 -0000
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
2.22.0


