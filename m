Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6D655602D9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 02:45:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x8O2jFN8023366
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 23 Sep 2019 19:45:15 -0700 (PDT)
Received: from fidler.wrs.com (172.25.44.5) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Mon, 23 Sep 2019 19:45:09 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 23 Sep 2019 22:45:05 -0400
Message-ID: <20190924024508.9175-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Cc: stevenrwalter@gmail.com, cardoe@cardoe.com, bunk@stusta.de
Subject: [RFC][PATCH 0/3] Move rust from meta-rust to oe-core
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
X-List-Received-Date: Tue, 24 Sep 2019 02:45:30 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

I moved the Rust support from meta-rust to oe-core.

As you'd expect, it's still building rust-hello-world for all qemus 
(except riscv64 which may never have worked). 
Rust-hello-world runs for me on qemu:
   x86-64, arm, arm64
It may run on other machines but that's what I've tested so far.

We need a list of meta-rust issues that should be resolved 
in order to get the code accepted in oe-core. I opened an issue 
to track that:
   https://github.com/meta-rust/meta-rust/issues/251
but there haven't been any comments yet. I'd rather track
issues in github than in the YP Bugzilla:
  https://bugzilla.yoctoproject.org/show_bug.cgi?id=12675

Here, in no particular order, are some of
the defects that I believe need to be fixed:

1. build system is assumed to be linux-x86_64
   https://github.com/meta-rust/meta-rust/issues/23

2. Make rust-native build in parallel (it's very slow!)
   (meta-rust issue/PR to be created by Randy)

3. Document developer workflows such as cargo-bitbake.

4. Build offline ( BB_NO_NETWORK = '1' )

5. make rust-hello-world install for qemuriscv64
   https://github.com/meta-rust/meta-rust/issues/252

6. ... build rustc and cargo for target (nice to have, only).
   https://github.com/meta-rust/meta-rust/issues/81

7. Bootstrap from C as an option?
   See: https://bugzilla.yoctoproject.org/show_bug.cgi?id=12675#c2

8. Update librsvg to latest (2.46) which uses rust.

What have I missed?

I'll work on several of these defects but I'll likely
need help from people with more Rust experience.

../Randy

Randy MacLeod (3):
  Add libgit2, libssh2 from meta-oe for rust
  meta-rust: move code to oe-core from meta-rust layer
  rust: mv README.md to recipes-devtools/rust/README-rust.md

 meta/classes/cargo.bbclass                    |  70 +++
 meta/classes/cargo_common.bbclass             |  98 ++++
 meta/classes/crate-fetch.bbclass              |  13 +
 meta/classes/rust-bin.bbclass                 | 149 +++++
 meta/classes/rust-common.bbclass              | 144 +++++
 meta/classes/rust.bbclass                     |  45 ++
 .../distro/include/rust_security_flags.inc    |   7 +
 meta/conf/layer.conf                          |   2 +
 meta/lib/crate.py                             | 149 +++++
 .../cargo-1.34.2/0001-Disable-http2.patch     |  29 +
 .../cargo-1.36.0/0001-Disable-http2.patch     |  31 ++
 .../cargo-1.37.0/0001-Disable-http2.patch     |  29 +
 meta/recipes-devtools/cargo/cargo.inc         |  43 ++
 meta/recipes-devtools/cargo/cargo_1.34.2.bb   |   8 +
 meta/recipes-devtools/cargo/cargo_1.36.0.bb   |   8 +
 meta/recipes-devtools/cargo/cargo_1.37.0.bb   |   8 +
 meta/recipes-devtools/rust/README-rust.md     |  69 +++
 meta/recipes-devtools/rust/libstd-rs.inc      |  31 ++
 .../recipes-devtools/rust/libstd-rs_1.34.2.bb |   8 +
 .../recipes-devtools/rust/libstd-rs_1.36.0.bb |   8 +
 .../recipes-devtools/rust/libstd-rs_1.37.0.bb |   8 +
 meta/recipes-devtools/rust/rust-cross.inc     |  52 ++
 .../rust/rust-cross_1.34.2.bb                 |   3 +
 .../rust/rust-cross_1.36.0.bb                 |   3 +
 .../rust/rust-cross_1.37.0.bb                 |   3 +
 meta/recipes-devtools/rust/rust-llvm.inc      |  62 +++
 ...-llvm-allow-env-override-of-exe-path.patch |  32 ++
 .../recipes-devtools/rust/rust-llvm_1.34.2.bb |  16 +
 .../recipes-devtools/rust/rust-llvm_1.36.0.bb |  16 +
 .../recipes-devtools/rust/rust-llvm_1.37.0.bb |  16 +
 .../rust/rust-snapshot-1.34.2.inc             |  24 +
 .../rust/rust-snapshot-1.36.0.inc             |  24 +
 .../rust/rust-snapshot-1.37.0.inc             |  24 +
 .../rust/rust-source-1.34.2.inc               |  11 +
 .../rust/rust-source-1.36.0.inc               |  11 +
 .../rust/rust-source-1.37.0.inc               |  11 +
 meta/recipes-devtools/rust/rust.inc           | 509 ++++++++++++++++++
 meta/recipes-devtools/rust/rust_1.34.2.bb     |  12 +
 meta/recipes-devtools/rust/rust_1.36.0.bb     |  12 +
 meta/recipes-devtools/rust/rust_1.37.0.bb     |  12 +
 .../rust-hello-world/rust-hello-world_git.bb  |  13 +
 meta/recipes-example/rustfmt/rustfmt_0.8.0.bb |  67 +++
 .../recipes-support/libgit2/libgit2_0.27.8.bb |  25 +
 meta/recipes-support/libssh2/libssh2_1.8.2.bb |  27 +
 scripts/build.sh                              |  19 +
 scripts/cleanup-env.sh                        |  14 +
 scripts/containerize.sh                       |  54 ++
 scripts/fetch.sh                              | 103 ++++
 scripts/publish-build-cache.sh                |  13 +
 scripts/setup-env.sh                          |  12 +
 50 files changed, 2157 insertions(+)
 create mode 100644 meta/classes/cargo.bbclass
 create mode 100644 meta/classes/cargo_common.bbclass
 create mode 100644 meta/classes/crate-fetch.bbclass
 create mode 100644 meta/classes/rust-bin.bbclass
 create mode 100644 meta/classes/rust-common.bbclass
 create mode 100644 meta/classes/rust.bbclass
 create mode 100644 meta/conf/distro/include/rust_security_flags.inc
 create mode 100644 meta/lib/crate.py
 create mode 100644 meta/recipes-devtools/cargo/cargo-1.34.2/0001-Disable-http2.patch
 create mode 100644 meta/recipes-devtools/cargo/cargo-1.36.0/0001-Disable-http2.patch
 create mode 100644 meta/recipes-devtools/cargo/cargo-1.37.0/0001-Disable-http2.patch
 create mode 100644 meta/recipes-devtools/cargo/cargo.inc
 create mode 100644 meta/recipes-devtools/cargo/cargo_1.34.2.bb
 create mode 100644 meta/recipes-devtools/cargo/cargo_1.36.0.bb
 create mode 100644 meta/recipes-devtools/cargo/cargo_1.37.0.bb
 create mode 100644 meta/recipes-devtools/rust/README-rust.md
 create mode 100644 meta/recipes-devtools/rust/libstd-rs.inc
 create mode 100644 meta/recipes-devtools/rust/libstd-rs_1.34.2.bb
 create mode 100644 meta/recipes-devtools/rust/libstd-rs_1.36.0.bb
 create mode 100644 meta/recipes-devtools/rust/libstd-rs_1.37.0.bb
 create mode 100644 meta/recipes-devtools/rust/rust-cross.inc
 create mode 100644 meta/recipes-devtools/rust/rust-cross_1.34.2.bb
 create mode 100644 meta/recipes-devtools/rust/rust-cross_1.36.0.bb
 create mode 100644 meta/recipes-devtools/rust/rust-cross_1.37.0.bb
 create mode 100644 meta/recipes-devtools/rust/rust-llvm.inc
 create mode 100644 meta/recipes-devtools/rust/rust-llvm/0002-llvm-allow-env-override-of-exe-path.patch
 create mode 100644 meta/recipes-devtools/rust/rust-llvm_1.34.2.bb
 create mode 100644 meta/recipes-devtools/rust/rust-llvm_1.36.0.bb
 create mode 100644 meta/recipes-devtools/rust/rust-llvm_1.37.0.bb
 create mode 100644 meta/recipes-devtools/rust/rust-snapshot-1.34.2.inc
 create mode 100644 meta/recipes-devtools/rust/rust-snapshot-1.36.0.inc
 create mode 100644 meta/recipes-devtools/rust/rust-snapshot-1.37.0.inc
 create mode 100644 meta/recipes-devtools/rust/rust-source-1.34.2.inc
 create mode 100644 meta/recipes-devtools/rust/rust-source-1.36.0.inc
 create mode 100644 meta/recipes-devtools/rust/rust-source-1.37.0.inc
 create mode 100644 meta/recipes-devtools/rust/rust.inc
 create mode 100644 meta/recipes-devtools/rust/rust_1.34.2.bb
 create mode 100644 meta/recipes-devtools/rust/rust_1.36.0.bb
 create mode 100644 meta/recipes-devtools/rust/rust_1.37.0.bb
 create mode 100644 meta/recipes-example/rust-hello-world/rust-hello-world_git.bb
 create mode 100644 meta/recipes-example/rustfmt/rustfmt_0.8.0.bb
 create mode 100644 meta/recipes-support/libgit2/libgit2_0.27.8.bb
 create mode 100644 meta/recipes-support/libssh2/libssh2_1.8.2.bb
 create mode 100755 scripts/build.sh
 create mode 100755 scripts/cleanup-env.sh
 create mode 100755 scripts/containerize.sh
 create mode 100755 scripts/fetch.sh
 create mode 100755 scripts/publish-build-cache.sh
 create mode 100755 scripts/setup-env.sh

-- 
2.22.0


