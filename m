Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web08.2051.1614135755459808800
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Feb 2021 19:02:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: randy.macleod@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 11O3238o015513
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Feb 2021 19:02:23 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 23 Feb 2021 19:02:08 -0800
Received: from vme.wrs.com (172.25.44.2) by ala-exchng01.corp.ad.wrs.com
 (147.11.82.252) with Microsoft SMTP Server id 15.1.2106.2 via Frontend
 Transport; Tue, 23 Feb 2021 19:02:08 -0800
From: "Randy MacLeod" <randy.macleod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: Merge meta-rust to oe-core
Date: Tue, 23 Feb 2021 22:01:53 -0500
Message-ID: <20210224030201.349588-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Clean-up the merge of meta-rust to oe-core by squashing most of the 
meta-rust history so we are left with:

  35da4b252f rust: add a language demo image to test reproducibility
  088374371b cargo/rust/rustfmt: exclude from world
  7df10d2a22 meta-rust: merge commits
  4187796cd6 rust: mv README.md to recipes-devtools/rust/README-rust.md
  03b9c60ef4 meta-rust: move code to oe-core from meta-rust layer
  2c62874204 libgit2: pull in updates from meta-oe
  24cb3db88c libssh2: pull in additional commits from meta-oe
  e9a0a3bad2 Add libgit2, libssh2 from meta-oe for rust

The full diffstat is below. (1)

I didn't really notice the scripts shown below since they are mostly harmless.
I'll review them and remove them in v2 if they don't make sense for oe-core.

----------
BUILDALL-QEMU LOG FOR rust-hello-world
START TIME: 2021-02-23_16:39:26
HOSTNAME: ala-lpggp3
HOST OS: Ubuntu 18.04.3 LTS
HOST KERNEL: 5.4.0-62-generic
===============
BUILD RESULTS:
[glibc]
PASS: qemuarmv5
PASS: qemumips
PASS: qemux86-64
PASS: qemuarm64
PASS: qemumips64
PASS: qemuarm
PASS: qemuppc
PASS: qemuriscv64
PASS: qemux86
[musl]
PASS: qemuarmv5
PASS: qemumips
PASS: qemux86-64
PASS: qemuarm64
PASS: qemumips64
PASS: qemuarm
FAIL: qemuppc
FAIL: qemuriscv64
PASS: qemux86
===============
PASSED: 16
FAILED: 2
----------

Khem is aware of the musl/riscv64 issue and hopes to have a fix for
the next release of rustc. I haven't looked into the musl/ppc problem yet.
World build is clean.

The SDK changes aren't included since they haven't been merged to meta-rust.
The SDK works for older releases but there is a problem with libcrypto and glibc-2.33:
   ldd sysroots/x86_64-oesdk-linux/usr/bin/../lib/libcrypto.so.1.1
sysroots/x86_64-oesdk-linux/usr/bin/../lib/libcrypto.so.1.1: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.33' not found (required by sysroots/x86_64-oesdk-linux/usr/bin/../lib/libcrypto.so.1.1)

I have a reproducible build test somewhere but it's not tested recently
so I'll send that later.

I'll create a rust version of meta/lib/oeqa/selftest/cases/gotoolchain.py
but for the local rust-hello-world recipe so it should be simpler.

../Randy


1)

 meta/classes/cargo.bbclass                                              |   77 +
 meta/classes/cargo_common.bbclass                                       |  121 ++
 meta/classes/crate-fetch.bbclass                                        |   13 
 meta/classes/rust-bin.bbclass                                           |  149 ++
 meta/classes/rust-common.bbclass                                        |  167 +++
 meta/classes/rust.bbclass                                               |   45 
 meta/conf/distro/include/rust_security_flags.inc                        |    7 
 meta/conf/distro/include/rust_versions.inc                              |   13 
 meta/conf/layer.conf                                                    |    2 
 meta/lib/crate.py                                                       |  149 ++
 meta/recipes-devtools/cargo/cargo-1.47.0/0001-Disable-http2.patch       |   31 
 meta/recipes-devtools/cargo/cargo-1.49.0/0001-Disable-http2.patch       |   31 
 meta/recipes-devtools/cargo/cargo.inc                                   |   52 
 meta/recipes-devtools/cargo/cargo_1.47.0.bb                             |    3 
 meta/recipes-devtools/cargo/cargo_1.49.0.bb                             |    3 
 meta/recipes-devtools/images/core-image-languages.bb                    |   12 
 meta/recipes-devtools/rust/README-rust.md                               |   69 +
 meta/recipes-devtools/rust/libstd-rs.inc                                |   40 
 meta/recipes-devtools/rust/libstd-rs_1.47.0.bb                          |    5 
 meta/recipes-devtools/rust/libstd-rs_1.49.0.bb                          |    5 
 meta/recipes-devtools/rust/rust-cross.inc                               |   71 +
 meta/recipes-devtools/rust/rust-cross_1.47.0.bb                         |    2 
 meta/recipes-devtools/rust/rust-cross_1.49.0.bb                         |    2 
 meta/recipes-devtools/rust/rust-llvm.inc                                |   64 +
 s-devtools/rust/rust-llvm/0002-llvm-allow-env-override-of-exe-path.patch|   32 
 meta/recipes-devtools/rust/rust-llvm_1.47.0.bb                          |    2 
 meta/recipes-devtools/rust/rust-llvm_1.49.0.bb                          |    2 
 meta/recipes-devtools/rust/rust-snapshot-1.47.0.inc                     |   13 
 meta/recipes-devtools/rust/rust-snapshot-1.49.0.inc                     |   13 
 meta/recipes-devtools/rust/rust-snapshot.inc                            |    9 
 meta/recipes-devtools/rust/rust-source-1.47.0.inc                       |    3 
 meta/recipes-devtools/rust/rust-source-1.49.0.inc                       |    3 
 meta/recipes-devtools/rust/rust-source.inc                              |    3 
 meta/recipes-devtools/rust/rust-target.inc                              |   10 
 meta/recipes-devtools/rust/rust.inc                                     |  524 ++++++++++
 ust/rust/0001-rustc_target-Fix-dash-vs-underscore-mismatches-in-op.patch|   75 +
 meta/recipes-devtools/rust/rust_1.47.0.bb                               |    9 
 meta/recipes-devtools/rust/rust_1.49.0.bb                               |   15 
 /recipes-example/rust-hello-world/rust-hello-world/0001-enable-LTO.patch|   23 
 meta/recipes-example/rust-hello-world/rust-hello-world_git.bb           |   17 
 meta/recipes-example/rustfmt/rustfmt_1.4.2.bb                           |  171 +++
 meta/recipes-support/libgit2/libgit2_1.1.0.bb                           |   22 
 h2/files/0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch|   46 
 bssh2/files/0001-configure-Conditionally-undefine-backend-m4-macro.patch|   30 
 meta/recipes-support/libssh2/files/CVE-2019-17498.patch                 |  131 ++
 meta/recipes-support/libssh2/files/run-ptest                            |    8 
 meta/recipes-support/libssh2/libssh2_1.9.0.bb                           |   53 +
 scripts/build.sh                                                        |   19 
 scripts/cleanup-env.sh                                                  |   14 
 scripts/containerize.sh                                                 |   54 +
 scripts/fetch.sh                                                        |  103 +
 scripts/publish-build-cache.sh                                          |   13 
 scripts/setup-env.sh                                                    |   12 
 53 files changed, 2562 insertions(+)


