Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web08.5578.1614217729020898114
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Feb 2021 17:48:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: randy.macleod@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 11P1mbCJ006948
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Feb 2021 17:48:43 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 24 Feb 2021 17:48:28 -0800
Received: from vme.wrs.com (172.25.44.2) by ala-exchng01.corp.ad.wrs.com
 (147.11.82.252) with Microsoft SMTP Server id 15.1.2106.2 via Frontend
 Transport; Wed, 24 Feb 2021 17:48:27 -0800
From: "Randy MacLeod" <randy.macleod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [v2] Merge meta-rust to oe-core
Date: Wed, 24 Feb 2021 20:48:16 -0500
Message-ID: <20210225014823.397741-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <16668FEB024AAA5B.31532@lists.openembedded.org>
References: <16668FEB024AAA5B.31532@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain


Added or updated these commits:

   86109491bc maintainers: Add myself as maintainer for rust pkgs
   ...
   b411e322b3 rust: remove container build scripts used by meta-rust
   c646d47ebc rust: update the README to conform to being in oe-core
   e19d823567 meta-rust: merge commits

The last commit update was just squashing a new commit from meta-rust:
   f8b9103 Remove checks for Rust versions we don't build anymore.


To Do List
==========

1) cargo-bitbake - the README suggest adding this using desktop
   cargo but once we get the SDK merged, it should be added there.
   Someone suggested using devtool for this rather than cargo-bitbake.

2) Fix the SDK libcrypto, libstdc++ glibc-2.33 problem. I'm running a
git bisect using poky, meta-oe/master, meta-rust+SDK patches.

3) Add a test case to either:
   - just build rust-hello-world or
   - run it in qemu

N) Fix *some* of the remaining bugs in:
      https://github.com/meta-rust/meta-rust/issues

FYI:

$ git log --oneline -8
fceca1dfbe (HEAD -> rust-squash) maintainers: Add myself as maintainer for rust pkgs
791684e0c1 cargo/rust/rustfmt: exclude from world
b411e322b3 rust: remove container build scripts used by meta-rust
c646d47ebc rust: update the README to conform to being in oe-core
e19d823567 meta-rust: merge commits
ab137fb83c rust: mv README.md to recipes-devtools/rust/README-rust.md
dac403bcc1 meta-rust: move code to oe-core from meta-rust layer
5a1a5baa0a libgit2: pull in updates from meta-oe  <----- now in master next so omitted.


$ git diff 5a1a5baa0a HEAD | diffstat
 classes/cargo.bbclass                                                                      |   77 ++
 classes/cargo_common.bbclass                                                               |  121 +++
 classes/crate-fetch.bbclass                                                                |   13 
 classes/rust-bin.bbclass                                                                   |  149 ++++
 classes/rust-common.bbclass                                                                |  167 ++++
 classes/rust.bbclass                                                                       |   45 +
 conf/distro/include/maintainers.inc                                                        |    7 
 conf/distro/include/rust_security_flags.inc                                                |    7 
 conf/distro/include/rust_versions.inc                                                      |   13 
 conf/layer.conf                                                                            |    2 
 lib/crate.py                                                                               |  149 ++++
 recipes-devtools/cargo/cargo-1.47.0/0001-Disable-http2.patch                               |   31 
 recipes-devtools/cargo/cargo-1.49.0/0001-Disable-http2.patch                               |   31 
 recipes-devtools/cargo/cargo.inc                                                           |   52 +
 recipes-devtools/cargo/cargo_1.47.0.bb                                                     |    3 
 recipes-devtools/cargo/cargo_1.49.0.bb                                                     |    3 
 recipes-devtools/rust/README-rust.md                                                       |   58 +
 recipes-devtools/rust/libstd-rs.inc                                                        |   40 +
 recipes-devtools/rust/libstd-rs_1.47.0.bb                                                  |    5 
 recipes-devtools/rust/libstd-rs_1.49.0.bb                                                  |    5 
 recipes-devtools/rust/rust-cross.inc                                                       |   71 +
 recipes-devtools/rust/rust-cross_1.47.0.bb                                                 |    2 
 recipes-devtools/rust/rust-cross_1.49.0.bb                                                 |    2 
 recipes-devtools/rust/rust-llvm.inc                                                        |   64 +
 recipes-devtools/rust/rust-llvm/0002-llvm-allow-env-override-of-exe-path.patch             |   32 
 recipes-devtools/rust/rust-llvm_1.47.0.bb                                                  |    2 
 recipes-devtools/rust/rust-llvm_1.49.0.bb                                                  |    2 
 recipes-devtools/rust/rust-snapshot-1.47.0.inc                                             |   13 
 recipes-devtools/rust/rust-snapshot-1.49.0.inc                                             |   13 
 recipes-devtools/rust/rust-snapshot.inc                                                    |    9 
 recipes-devtools/rust/rust-source-1.47.0.inc                                               |    3 
 recipes-devtools/rust/rust-source-1.49.0.inc                                               |    3 
 recipes-devtools/rust/rust-source.inc                                                      |    3 
 recipes-devtools/rust/rust-target.inc                                                      |   10 
 recipes-devtools/rust/rust.inc                                                             |  512 ++++++++++++++
 recipes-devtools/rust/rust/0001-rustc_target-Fix-dash-vs-underscore-mismatches-in-op.patch |   75 ++
 recipes-devtools/rust/rust_1.47.0.bb                                                       |    9 
 recipes-devtools/rust/rust_1.49.0.bb                                                       |   15 
 recipes-example/rust-hello-world/rust-hello-world/0001-enable-LTO.patch                    |   23 
 recipes-example/rust-hello-world/rust-hello-world_git.bb                                   |   17 
 recipes-example/rustfmt/rustfmt_1.4.2.bb                                                   |  171 ++++
 41 files changed, 2029 insertions(+)



