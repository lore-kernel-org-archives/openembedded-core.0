Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21D4BC46CD2
	for <webhook@archiver.kernel.org>; Sat, 30 Dec 2023 15:50:16 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.186589.1703951405089586173
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Dec 2023 07:50:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jDjxNbwz;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-336c5b5c163so2481409f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 30 Dec 2023 07:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703951403; x=1704556203; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hJ/1Z0IHhf4aUHzeU+1mdMQCaGEsj8KVIJuIB0XzZUQ=;
        b=jDjxNbwzPuv6vwHK08sjbfzlhMvmTHjFWwWT91KJIYiBxwknwA6WS1kCRLENsnJ6CQ
         h0y0xOoMDuH8sKft3YCggyHeDKxD+8qle1glsgLLiBY4kZ/fxb1aW61aBPn4fmBCAbdY
         G2nKRByVR6jm0ZukHaPqdUSMNfXVrkILjlUlOIUBPrWgVpfwtLiWHFWOdy/oMTKjs4mF
         A909T5Ytk6o0Z827dsDXKnOOhoU0SBnvUPfZ7DKrrwzdNRwULMieOPKVjk82QKez0tuP
         38uvqnqJq6t0nlJghlSek/8VAsdNPP9f2WGHJYFeAxmaq/RFjPSWOhqXnpqgTaVjaN4+
         sBoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703951403; x=1704556203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hJ/1Z0IHhf4aUHzeU+1mdMQCaGEsj8KVIJuIB0XzZUQ=;
        b=mdypI9fVQjnQVFuFOKQGK8xHzGXTywZz/AZKBuhNrEGkUP1IQ89nHmwrNh68uhNFHC
         iA6May7IPjpufKwtRM84qhNaiCqbo5i3VryfF4dhnwVk5hS5jai/tayP2OKyi31RVrI2
         kRhtbRJOIKQcdgLNtz/ONACOgmMWivZf6aA0ry2RenEAQqT1jfCz5+qDjDEcQYKxNcu8
         XtwGI7q0RV3D48FbV77gjrk1xgW8Px2Oryb6S+xOjKQIK6jl+WdhpyWWc9ixjWtgkyu6
         +RhqsD1C2gjh7VLgVKAgSwugl07IumxWSjFZvro87ao8SYQKFtdR9MPHxfC2xORY3ngd
         9Ikw==
X-Gm-Message-State: AOJu0YzvcnYeiyrho2QCVjVlH4HEiaTVBhjWrjWQGhqw2wZHC60miNUT
	eD6KAvrAoD99fGlrYkjF3Ey9hJgd6CI=
X-Google-Smtp-Source: AGHT+IEwkaTOagkgSrPdo47klmC2wAP9ii5Bxt5rVRWHyioIsj7sbrUsDqlf3wRinu7vKX4b+aNrTA==
X-Received: by 2002:adf:fed1:0:b0:336:364c:9de4 with SMTP id q17-20020adffed1000000b00336364c9de4mr6114204wrs.1.1703951401379;
        Sat, 30 Dec 2023 07:50:01 -0800 (PST)
Received: from Zuma-000004PC.lan (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id w5-20020a5d5445000000b0033660f75d08sm21777428wrv.116.2023.12.30.07.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Dec 2023 07:49:59 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH 4/4] rust: Upgrade 1.74.1 -> 1.75.0
Date: Sat, 30 Dec 2023 15:49:53 +0000
Message-Id: <20231230154953.8135-4-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20231230154953.8135-1-alex.kiernan@gmail.com>
References: <20231230154953.8135-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Dec 2023 15:50:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193077

Drop backported musl fixes. Set `change-id` rather than `changelog-seen`
to fix build warning. Add fixes for 85c0ce24cc74 ("remap cargo
dependencies to /rust/deps") which otherwise cause build failures:

| thread 'main' panicked at src/core/builder.rs:1795:26:
| std::fs::read_dir(registry_src) failed with No such file or directory (os=
 error 2)

https://blog.rust-lang.org/2023/12/28/Rust-1.75.0.html
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/conf/distro/include/tcmode-default.inc   |   2 +-
 .../rust/{cargo_1.74.1.bb =3D> cargo_1.75.0.bb} |   0
 ...0001-Don-t-use-LFS64-symbols-on-musl.patch | 163 --------------
 ...istent-empty-CARGO_HOME-registry-src.patch |  50 +++++
 ...Define-SOCK_NONBLOCK-with-O_NONBLOCK.patch | 122 -----------
 ...TC_DEBUGINFO_MAP-RUSTC_CARGO_REGISTR.patch |  42 ++++
 ...ine-F_SETLK-F_SETLKW-and-fix-F_GETLK.patch |  41 ----
 ...GETLK-F_OFD_SETLK-and-F_OFD_SETLKW-t.patch | 205 ------------------
 ...-musl-Define-O_LARGEFILE-for-riscv32.patch |  32 ---
 ...efine-SOCK_SEQPACKET-in-common-place.patch | 115 ----------
 ...ibstd-rs_1.74.1.bb =3D> libstd-rs_1.75.0.bb} |   0
 ....74.1.bb =3D> rust-cross-canadian_1.75.0.bb} |   0
 ...ust-llvm_1.74.1.bb =3D> rust-llvm_1.75.0.bb} |   2 +-
 meta/recipes-devtools/rust/rust-snapshot.inc  |  60 ++---
 meta/recipes-devtools/rust/rust-source.inc    |  10 +-
 .../rust/{rust_1.74.1.bb =3D> rust_1.75.0.bb}   |   2 +-
 16 files changed, 128 insertions(+), 718 deletions(-)
 rename meta/recipes-devtools/rust/{cargo_1.74.1.bb =3D> cargo_1.75.0.bb} (=
100%)
 delete mode 100644 meta/recipes-devtools/rust/files/0001-Don-t-use-LFS64-s=
ymbols-on-musl.patch
 create mode 100644 meta/recipes-devtools/rust/files/0001-Handle-non-existe=
nt-empty-CARGO_HOME-registry-src.patch
 delete mode 100644 meta/recipes-devtools/rust/files/0001-musl-Define-SOCK_=
NONBLOCK-with-O_NONBLOCK.patch
 create mode 100644 meta/recipes-devtools/rust/files/0002-Ignore-blank-RUST=
C_DEBUGINFO_MAP-RUSTC_CARGO_REGISTR.patch
 delete mode 100644 meta/recipes-devtools/rust/files/0002-musl-riscv32-Defi=
ne-F_SETLK-F_SETLKW-and-fix-F_GETLK.patch
 delete mode 100644 meta/recipes-devtools/rust/files/0003-musl-Move-F_OFD_G=
ETLK-F_OFD_SETLK-and-F_OFD_SETLKW-t.patch
 delete mode 100644 meta/recipes-devtools/rust/files/0004-musl-Define-O_LAR=
GEFILE-for-riscv32.patch
 delete mode 100644 meta/recipes-devtools/rust/files/0005-musl-Define-SOCK_=
SEQPACKET-in-common-place.patch
 rename meta/recipes-devtools/rust/{libstd-rs_1.74.1.bb =3D> libstd-rs_1.75=
.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.74.1.bb =3D> rust=
-cross-canadian_1.75.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-llvm_1.74.1.bb =3D> rust-llvm_1.75=
.0.bb} (99%)
 rename meta/recipes-devtools/rust/{rust_1.74.1.bb =3D> rust_1.75.0.bb} (99=
%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro=
/include/tcmode-default.inc
index 6f8f8a7888af..e3ae8e2fd2c0 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -25,7 +25,7 @@ LINUXLIBCVERSION ?=3D "6.5%"
 QEMUVERSION ?=3D "8.1%"
 GOVERSION ?=3D "1.20%"
 LLVMVERSION ?=3D "17.%"
-RUSTVERSION ?=3D "1.74%"
+RUSTVERSION ?=3D "1.75%"
=20
 PREFERRED_VERSION_gcc ?=3D "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?=3D "${GCCVERSION}"
diff --git a/meta/recipes-devtools/rust/cargo_1.74.1.bb b/meta/recipes-devt=
ools/rust/cargo_1.75.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/cargo_1.74.1.bb
rename to meta/recipes-devtools/rust/cargo_1.75.0.bb
diff --git a/meta/recipes-devtools/rust/files/0001-Don-t-use-LFS64-symbols-=
on-musl.patch b/meta/recipes-devtools/rust/files/0001-Don-t-use-LFS64-symbo=
ls-on-musl.patch
deleted file mode 100644
index ddad684e578a..000000000000
--- a/meta/recipes-devtools/rust/files/0001-Don-t-use-LFS64-symbols-on-musl=
.patch
+++ /dev/null
@@ -1,163 +0,0 @@
-From df423041e070dc30b835ecfea7181914e834e33d Mon Sep 17 00:00:00 2001
-From: git-bruh <e817509a-8ee9-4332-b0ad-3a6bdf9ab63f@aleeas.com>
-Date: Tue, 19 Sep 2023 19:47:50 +0530
-Subject: [PATCH] Don't use LFS64 symbols on musl
-
-Simplify #[cfg] blocks
-
-fmt
-
-don't try to use the more appropriate direntry on musl
-
-Upstream-Status: Backport [https://github.com/rust-lang/rust/pull/115968/c=
ommits/7a504cc68a56bfaa7855016c81ced9e6b1320fc5]
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
----
- library/std/src/os/linux/fs.rs |  9 ++++++++-
- library/std/src/sys/unix/fd.rs | 24 ++++++++++++++++++++----
- library/std/src/sys/unix/fs.rs | 23 ++++++++++++++---------
- 3 files changed, 42 insertions(+), 14 deletions(-)
-
-diff --git a/library/std/src/os/linux/fs.rs b/library/std/src/os/linux/fs.=
rs
-index 479bbcc17a89..ab0b2a3eda3f 100644
---- a/library/std/src/os/linux/fs.rs
-+++ b/library/std/src/os/linux/fs.rs
-@@ -329,7 +329,14 @@ pub trait MetadataExt {
- impl MetadataExt for Metadata {
-     #[allow(deprecated)]
-     fn as_raw_stat(&self) -> &raw::stat {
--        unsafe { &*(self.as_inner().as_inner() as *const libc::stat64 as =
*const raw::stat) }
-+        #[cfg(target_env =3D "musl")]
-+        unsafe {
-+            &*(self.as_inner().as_inner() as *const libc::stat as *const =
raw::stat)
-+        }
-+        #[cfg(not(target_env =3D "musl"))]
-+        unsafe {
-+            &*(self.as_inner().as_inner() as *const libc::stat64 as *cons=
t raw::stat)
-+        }
-     }
-     fn st_dev(&self) -> u64 {
-         self.as_inner().as_inner().st_dev as u64
-diff --git a/library/std/src/sys/unix/fd.rs b/library/std/src/sys/unix/fd.=
rs
-index 6c4f408426a9..bf1fb3123c4c 100644
---- a/library/std/src/sys/unix/fd.rs
-+++ b/library/std/src/sys/unix/fd.rs
-@@ -126,9 +126,17 @@ pub fn read_to_end(&self, buf: &mut Vec<u8>) -> io::R=
esult<usize> {
-     }
-=20
-     pub fn read_at(&self, buf: &mut [u8], offset: u64) -> io::Result<usiz=
e> {
--        #[cfg(not(any(target_os =3D "linux", target_os =3D "android", tar=
get_os =3D "hurd")))]
-+        #[cfg(not(any(
-+            all(target_os =3D "linux", not(target_env =3D "musl")),
-+            target_os =3D "android",
-+            target_os =3D "hurd"
-+        )))]
-         use libc::pread as pread64;
--        #[cfg(any(target_os =3D "linux", target_os =3D "android", target_=
os =3D "hurd"))]
-+        #[cfg(any(
-+            all(target_os =3D "linux", not(target_env =3D "musl")),
-+            target_os =3D "android",
-+            target_os =3D "hurd"
-+        ))]
-         use libc::pread64;
-=20
-         unsafe {
-@@ -285,9 +293,17 @@ pub fn is_write_vectored(&self) -> bool {
-     }
-=20
-     pub fn write_at(&self, buf: &[u8], offset: u64) -> io::Result<usize> {
--        #[cfg(not(any(target_os =3D "linux", target_os =3D "android", tar=
get_os =3D "hurd")))]
-+        #[cfg(not(any(
-+            all(target_os =3D "linux", not(target_env =3D "musl")),
-+            target_os =3D "android",
-+            target_os =3D "hurd"
-+        )))]
-         use libc::pwrite as pwrite64;
--        #[cfg(any(target_os =3D "linux", target_os =3D "android", target_=
os =3D "hurd"))]
-+        #[cfg(any(
-+            all(target_os =3D "linux", not(target_env =3D "musl")),
-+            target_os =3D "android",
-+            target_os =3D "hurd"
-+        ))]
-         use libc::pwrite64;
-=20
-         unsafe {
-diff --git a/library/std/src/sys/unix/fs.rs b/library/std/src/sys/unix/fs.=
rs
-index 764e1f257901..b61554098531 100644
---- a/library/std/src/sys/unix/fs.rs
-+++ b/library/std/src/sys/unix/fs.rs
-@@ -40,13 +40,17 @@
- ))]
- use libc::c_char;
- #[cfg(any(
--    target_os =3D "linux",
-+    all(target_os =3D "linux", not(target_env =3D "musl")),
-     target_os =3D "emscripten",
-     target_os =3D "android",
--    target_os =3D "hurd",
-+    target_os =3D "hurd"
- ))]
- use libc::dirfd;
--#[cfg(any(target_os =3D "linux", target_os =3D "emscripten", target_os =
=3D "hurd"))]
-+#[cfg(any(
-+    all(target_os =3D "linux", not(target_env =3D "musl")),
-+    target_os =3D "emscripten",
-+    target_os =3D "hurd"
-+))]
- use libc::fstatat64;
- #[cfg(any(
-     target_os =3D "android",
-@@ -56,9 +60,10 @@
-     target_os =3D "illumos",
-     target_os =3D "nto",
-     target_os =3D "vita",
-+    all(target_os =3D "linux", target_env =3D "musl"),
- ))]
- use libc::readdir as readdir64;
--#[cfg(any(target_os =3D "linux", target_os =3D "hurd"))]
-+#[cfg(any(all(target_os =3D "linux", not(target_env =3D "musl")), target_=
os =3D "hurd"))]
- use libc::readdir64;
- #[cfg(any(target_os =3D "emscripten", target_os =3D "l4re"))]
- use libc::readdir64_r;
-@@ -82,7 +87,7 @@
-     lstat as lstat64, off64_t, open as open64, stat as stat64,
- };
- #[cfg(not(any(
--    target_os =3D "linux",
-+    all(target_os =3D "linux", not(target_env =3D "musl")),
-     target_os =3D "emscripten",
-     target_os =3D "l4re",
-     target_os =3D "android",
-@@ -93,7 +98,7 @@
-     lstat as lstat64, off_t as off64_t, open as open64, stat as stat64,
- };
- #[cfg(any(
--    target_os =3D "linux",
-+    all(target_os =3D "linux", not(target_env =3D "musl")),
-     target_os =3D "emscripten",
-     target_os =3D "l4re",
-     target_os =3D "hurd"
-@@ -829,10 +834,10 @@ pub fn file_name(&self) -> OsString {
-=20
-     #[cfg(all(
-         any(
--            target_os =3D "linux",
-+            all(target_os =3D "linux", not(target_env =3D "musl")),
-             target_os =3D "emscripten",
-             target_os =3D "android",
--            target_os =3D "hurd",
-+            target_os =3D "hurd"
-         ),
-         not(miri)
-     ))]
-@@ -858,7 +863,7 @@ pub fn metadata(&self) -> io::Result<FileAttr> {
-=20
-     #[cfg(any(
-         not(any(
--            target_os =3D "linux",
-+            all(target_os =3D "linux", not(target_env =3D "musl")),
-             target_os =3D "emscripten",
-             target_os =3D "android",
-             target_os =3D "hurd",
---=20
-2.39.0
-
diff --git a/meta/recipes-devtools/rust/files/0001-Handle-non-existent-empt=
y-CARGO_HOME-registry-src.patch b/meta/recipes-devtools/rust/files/0001-Han=
dle-non-existent-empty-CARGO_HOME-registry-src.patch
new file mode 100644
index 000000000000..fc4325918bf4
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/0001-Handle-non-existent-empty-CARGO=
_HOME-registry-src.patch
@@ -0,0 +1,50 @@
+From b7ea9bc30a4c71fdfdb8684ea2f3436cd3aa11c0 Mon Sep 17 00:00:00 2001
+From: Alex Kiernan <alex.kiernan@gmail.com>
+Date: Sat, 30 Dec 2023 15:13:27 +0000
+Subject: [PATCH 1/2] Handle non-existent/empty <CARGO_HOME>/registry/src
+
+If remap-debuginfo is set but cargo isn't vendored into
+.cargo/registry/src, don't panic:
+
+| thread 'main' panicked at src/core/builder.rs:1795:26:
+| std::fs::read_dir(registry_src) failed with No such file or directory (o=
s error 2)
+
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+Upstream-Status: Submitted [https://github.com/rust-lang/rust/pull/119445]
+---
+ src/bootstrap/src/core/builder.rs | 16 ++++++++++------
+ 1 file changed, 10 insertions(+), 6 deletions(-)
+
+diff --git a/src/bootstrap/src/core/builder.rs b/src/bootstrap/src/core/bu=
ilder.rs
+index cd276674dee6..ae4d70df339f 100644
+--- a/src/bootstrap/src/core/builder.rs
++++ b/src/bootstrap/src/core/builder.rs
+@@ -1791,15 +1791,19 @@ pub fn cargo(
+         if self.config.rust_remap_debuginfo {
+             // FIXME: handle vendored sources
+             let registry_src =3D t!(home::cargo_home()).join("registry").=
join("src");
+-            let mut env_var =3D OsString::new();
+-            for entry in t!(std::fs::read_dir(registry_src)) {
++            if registry_src.is_dir() {
++                let mut env_var =3D OsString::new();
++                for entry in t!(std::fs::read_dir(registry_src)) {
++                    if !env_var.is_empty() {
++                        env_var.push("\t");
++                    }
++                    env_var.push(t!(entry).path());
++                    env_var.push("=3D/rust/deps");
++                }
+                 if !env_var.is_empty() {
+-                    env_var.push("\t");
++                    cargo.env("RUSTC_CARGO_REGISTRY_SRC_TO_REMAP", env_va=
r);
+                 }
+-                env_var.push(t!(entry).path());
+-                env_var.push("=3D/rust/deps");
+             }
+-            cargo.env("RUSTC_CARGO_REGISTRY_SRC_TO_REMAP", env_var);
+         }
+=20
+         // Enable usage of unstable features
+--=20
+2.39.0
+
diff --git a/meta/recipes-devtools/rust/files/0001-musl-Define-SOCK_NONBLOC=
K-with-O_NONBLOCK.patch b/meta/recipes-devtools/rust/files/0001-musl-Define=
-SOCK_NONBLOCK-with-O_NONBLOCK.patch
deleted file mode 100644
index a50f5ef464db..000000000000
--- a/meta/recipes-devtools/rust/files/0001-musl-Define-SOCK_NONBLOCK-with-=
O_NONBLOCK.patch
+++ /dev/null
@@ -1,122 +0,0 @@
-From 5ab4734092ccb875d8cd1eb3c7ba7228f559c8c1 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 8 Apr 2023 08:25:46 -0700
-Subject: [PATCH 1/5] musl: Define SOCK_NONBLOCK with O_NONBLOCK
-
-Much like glibc, these defines are same on musl [1] [2]
-therefore consolidate the definition in one place
-for SOCK_NONBLOCK
-
-[1] https://github.com/search?q=3Drepo%3Abminor%2Fmusl++%22%23define+SOCK_=
NONBLOCK%22&type=3Dcode
-[2] https://github.com/search?q=3Drepo%3Abminor%2Fmusl++%22%23define+O_NON=
BLOCK%22&type=3Dcode
-
-Upstream-Status: Backport [https://github.com/rust-lang/libc/pull/3302/com=
mits/5ab4734092ccb875d8cd1eb3c7ba7228f559c8c1]
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
----
- src/unix/linux_like/linux/musl/b32/arm/mod.rs  | 2 --
- src/unix/linux_like/linux/musl/b32/hexagon.rs  | 1 -
- src/unix/linux_like/linux/musl/b32/mips/mod.rs | 2 --
- src/unix/linux_like/linux/musl/b32/powerpc.rs  | 2 --
- src/unix/linux_like/linux/musl/b32/x86/mod.rs  | 2 --
- src/unix/linux_like/linux/musl/b64/mod.rs      | 2 --
- src/unix/linux_like/linux/musl/mod.rs          | 1 +
- 7 files changed, 1 insertion(+), 11 deletions(-)
-
-Index: rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/arm=
/mod.rs
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.74.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b32/a=
rm/mod.rs
-+++ rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/arm/mo=
d.rs
-@@ -311,8 +311,6 @@ pub const O_SYNC: ::c_int =3D 1052672;
- pub const O_RSYNC: ::c_int =3D 1052672;
- pub const O_DSYNC: ::c_int =3D 4096;
-=20
--pub const SOCK_NONBLOCK: ::c_int =3D 2048;
--
- pub const MAP_ANON: ::c_int =3D 0x0020;
- pub const MAP_GROWSDOWN: ::c_int =3D 0x0100;
- pub const MAP_DENYWRITE: ::c_int =3D 0x0800;
-Index: rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/hex=
agon.rs
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.74.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b32/h=
exagon.rs
-+++ rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/hexago=
n.rs
-@@ -295,7 +295,6 @@ pub const SIG_SETMASK: ::c_int =3D 2; // F
- pub const SIG_BLOCK: ::c_int =3D 0x000000;
- pub const SIG_UNBLOCK: ::c_int =3D 0x01;
- pub const SOCK_DGRAM: ::c_int =3D 2;
--pub const SOCK_NONBLOCK: ::c_int =3D 2048;
- pub const SOCK_SEQPACKET: ::c_int =3D 5;
- pub const SOCK_STREAM: ::c_int =3D 1;
- pub const SOL_CAIF: ::c_int =3D 278;
-Index: rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/mip=
s/mod.rs
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.74.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b32/m=
ips/mod.rs
-+++ rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/mips/m=
od.rs
-@@ -250,8 +250,6 @@ pub const O_SYNC: ::c_int =3D 0o40020;
- pub const O_RSYNC: ::c_int =3D 0o40020;
- pub const O_DSYNC: ::c_int =3D 0o020;
-=20
--pub const SOCK_NONBLOCK: ::c_int =3D 0o200;
--
- pub const MAP_ANON: ::c_int =3D 0x800;
- pub const MAP_GROWSDOWN: ::c_int =3D 0x1000;
- pub const MAP_DENYWRITE: ::c_int =3D 0x2000;
-Index: rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/pow=
erpc.rs
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.74.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b32/p=
owerpc.rs
-+++ rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/powerp=
c.rs
-@@ -243,8 +243,6 @@ pub const O_SYNC: ::c_int =3D 1052672;
- pub const O_RSYNC: ::c_int =3D 1052672;
- pub const O_DSYNC: ::c_int =3D 4096;
-=20
--pub const SOCK_NONBLOCK: ::c_int =3D 2048;
--
- pub const MAP_ANON: ::c_int =3D 0x0020;
- pub const MAP_GROWSDOWN: ::c_int =3D 0x0100;
- pub const MAP_DENYWRITE: ::c_int =3D 0x0800;
-Index: rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/x86=
/mod.rs
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.74.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b32/x=
86/mod.rs
-+++ rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/x86/mo=
d.rs
-@@ -300,8 +300,6 @@ pub const O_SYNC: ::c_int =3D 1052672;
- pub const O_RSYNC: ::c_int =3D 1052672;
- pub const O_DSYNC: ::c_int =3D 4096;
-=20
--pub const SOCK_NONBLOCK: ::c_int =3D 2048;
--
- pub const MAP_ANON: ::c_int =3D 0x0020;
- pub const MAP_GROWSDOWN: ::c_int =3D 0x0100;
- pub const MAP_DENYWRITE: ::c_int =3D 0x0800;
-Index: rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b64/mod=
.rs
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.74.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b64/m=
od.rs
-+++ rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b64/mod.rs
-@@ -134,8 +134,6 @@ pub const __SIZEOF_PTHREAD_RWLOCK_T: usi
- pub const __SIZEOF_PTHREAD_MUTEX_T: usize =3D 40;
- pub const __SIZEOF_PTHREAD_BARRIER_T: usize =3D 32;
-=20
--pub const SOCK_NONBLOCK: ::c_int =3D 2048;
--
- pub const SOCK_SEQPACKET: ::c_int =3D 5;
-=20
- extern "C" {
-Index: rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/mod.rs
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.74.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/mod.rs
-+++ rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/mod.rs
-@@ -542,6 +542,7 @@ pub const POSIX_MADV_DONTNEED: ::c_int =3D
- pub const MAP_ANONYMOUS: ::c_int =3D MAP_ANON;
-=20
- pub const SOCK_DCCP: ::c_int =3D 6;
-+pub const SOCK_NONBLOCK: ::c_int =3D O_NONBLOCK;
- pub const SOCK_PACKET: ::c_int =3D 10;
-=20
- pub const SOMAXCONN: ::c_int =3D 128;
-Index: rustc-1.74.0-src/vendor/libc/.cargo-checksum.json
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.74.0-src.orig/vendor/libc/.cargo-checksum.json
-+++ rustc-1.74.0-src/vendor/libc/.cargo-checksum.json
-@@ -1 +1 @@
--{"files":{"CONTRIBUTING.md":"bdc90b52cf803faac96e594069a86dd8ea150d5ba7fb=
3e6cadfc08dac4c7b0ce","Cargo.toml":"a58e58fa9bde015e08609ea2f17e56c5df7c82a=
a6f3fa1a144c02ee4715227b9","LICENSE-APACHE":"62c7a1e35f56406896d7aa7ca52d0c=
c0d272ac022b5d2796e7d6905db8a3636a","LICENSE-MIT":"a8d47ff51ca256f56a8932db=
a07660672dbfe3004257ca8de708aac1415937a1","README.md":"ecc47e284f8d007fc048=
666d5108dd41cdc440ab9eedfe8c47d1634613522787","build.rs":"9e94683e94db80e82=
82fce07549cf748d9037852fb06df1c7596bea2ed130d50","rustfmt.toml":"eaa2ea84fc=
1ba0359b77680804903e07bb38d257ab11986b95b158e460f787b2","src/fixed_width_in=
ts.rs":"7f986e5f5e68d25ef04d386fd2f640e8be8f15427a8d4a458ea01d26b8dca0ca","=
src/fuchsia/aarch64.rs":"893fcec48142d273063ffd814dca33fbec92205fd39ada9707=
5f85201d803996","src/fuchsia/align.rs":"ae1cf8f011a99737eabeb14ffff768e60f1=
3b13363d7646744dbb0f443dab3d6","src/fuchsia/mod.rs":"30f4dc83ef120300d61896=
696512436377c5f36f1431d98ab7e01e498c0c47d5","src/fuchsia/no_align.rs":"303f=
3f1b255e0088b5715094353cf00476131d8e94e6aebb3f469557771c8b8a","src/fuchsia/=
riscv64.rs":"617cd75e79e0e20f664db764a4dc2a396d9fd11a4d95371acd91ed4811293b=
11","src/fuchsia/x86_64.rs":"93a3632b5cf67d2a6bcb7dc0a558605252d5fe689e0f38=
d8aa2ec5852255ac87","src/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f3=
68ae10ceccefeed9debb3bbe08777fc682","src/hermit/mod.rs":"d3bfce41e4463d4be8=
020a2d063c9bfa8b665f45f1cc6cbf3163f5d01e7cb21f","src/hermit/x86_64.rs":"ab8=
32b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/lib.rs"=
:"24111461547739f3646f95bcb66c43f2ae679a727ff5938299434c522c02e458","src/ma=
cros.rs":"b457eb028b8e8ab3c24bb7292b874ad4e491edbb83594f6a3da024df5348c088"=
,"src/psp.rs":"dd31aabd46171d474ec5828372e28588935120e7355c90c105360d8fa926=
4c1c","src/sgx.rs":"16a95cdefc81c5ee00d8353a60db363c4cc3e0f75abcd5d0144723f=
2a306ed1b","src/solid/aarch64.rs":"a726e47f324adf73a4a0b67a2c183408d0cad105=
ae66acf36db37a42ab7f8707","src/solid/arm.rs":"e39a4f74ebbef3b97b8c95758ad74=
1123d84ed3eb48d9cf4f1f4872097fc27fe","src/solid/mod.rs":"5f4151dca5132e4b4e=
4c23ab9737e12856dddbdc0ca3f7dbc004328ef3c8acde","src/switch.rs":"9da3dd39b3=
de45a7928789926e8572d00e1e11a39e6f7289a1349aadce90edba","src/unix/aix/mod.r=
s":"54229b5e774669c16912112e8b50fa938db76f534971222a11723a05195a0948","src/=
unix/aix/powerpc64.rs":"cf374d81139d45f9d77c6a764f640bfbf7e0a5903689652c829=
6f8e10d55169b","src/unix/align.rs":"2cdc7c826ef7ae61f5171c5ae8c445a743d86f1=
a7f2d9d7e4ceeec56d6874f65","src/unix/bsd/apple/b32/align.rs":"ec833a747866f=
e19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b3=
2/mod.rs":"2546ad3eb6aecb95f916648bc63264117c92b4b4859532b34cb011e4c75a5a72=
","src/unix/bsd/apple/b64/aarch64/align.rs":"2eaf0f561a32bdcbf4e0477c8895d5=
e7bcb5cdebd5fef7b4df2ca8e38e144d94","src/unix/bsd/apple/b64/aarch64/mod.rs"=
:"44c217a4f263afe7a97435de9323d20a96c37836f899ca0925306d4b7e073c27","src/un=
ix/bsd/apple/b64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d1=
5fa68884c40b0e26c","src/unix/bsd/apple/b64/mod.rs":"f5e278a1af7fb358891d1c9=
be4eb7e815aaca0c5cb738d0c3604ba2208a856f7","src/unix/bsd/apple/b64/x86_64/a=
lign.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c"=
,"src/unix/bsd/apple/b64/x86_64/mod.rs":"8c87c5855038aae5d433c8f5eb3b29b0a1=
75879a0245342b3bfd83bdf4cfd936","src/unix/bsd/apple/long_array.rs":"3cf1f19=
b812e6d093c819dc65ce55b13491963e0780eda0d0bd1577603e81948","src/unix/bsd/ap=
ple/mod.rs":"0931fd351d585728e6384d7b952b8d816e9acdb9c86c172324445f3c33f692=
ca","src/unix/bsd/freebsdlike/dragonfly/errno.rs":"8295b8bb0dfd38d2cdb4d919=
2cdeeb534cc6c3b208170e64615fa3e0edb3e578","src/unix/bsd/freebsdlike/dragonf=
ly/mod.rs":"f2e78625fe1eb14f43e730a3987eba888cb8ac04c23008e7c2d2f7c72258b9e=
6","src/unix/bsd/freebsdlike/freebsd/aarch64.rs":"6c8e216385f53a4bf5f171749=
b57602fc34a4e4b160a44ca31c058cb0c8a2126","src/unix/bsd/freebsdlike/freebsd/=
arm.rs":"59d6a670eea562fb87686e243e0a84603d29a2028a3d4b3f99ccc01bd04d2f47",=
"src/unix/bsd/freebsdlike/freebsd/freebsd11/b64.rs":"9808d152c1196aa647f1b0=
f0cf84dac8c930da7d7f897a44975545e3d9d17681","src/unix/bsd/freebsdlike/freeb=
sd/freebsd11/mod.rs":"e243ae0e89623d4fa9f85afe14369cc5fd5f2028ea715773dbec7=
22ba80dac1f","src/unix/bsd/freebsdlike/freebsd/freebsd12/b64.rs":"61cbe45f8=
499bedb168106b686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/free=
bsdlike/freebsd/freebsd12/mod.rs":"bef9fae288a4f29e941ea369be1cd20b170040e6=
0665a4d49a4a9e79009b72d8","src/unix/bsd/freebsdlike/freebsd/freebsd12/x86_6=
4.rs":"2df36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","s=
rc/unix/bsd/freebsdlike/freebsd/freebsd13/b64.rs":"61cbe45f8499bedb168106b6=
86d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd=
/freebsd13/mod.rs":"3c514e037694ce22724abb3c9c4687defda7f0e3456b615ca73593e=
860e38b16","src/unix/bsd/freebsdlike/freebsd/freebsd13/x86_64.rs":"2df36a7f=
122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/fre=
ebsdlike/freebsd/freebsd14/b64.rs":"61cbe45f8499bedb168106b686d4f8239472f25=
c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd14/mod.=
rs":"318abe48bfdd1c74ecd6afbd6c9329c5c72ce4f7d420edd6be2fc12b223ae32f","src=
/unix/bsd/freebsdlike/freebsd/freebsd14/x86_64.rs":"e7b5863e222d6cc416b6b0f=
be71690fad909e899b4c4ae810bbca117e4fcb650","src/unix/bsd/freebsdlike/freebs=
d/mod.rs":"4c3cd57aaf7fbce072e28e0d2d285b5fda9702e924561d2fd01e49e6ee186a98=
","src/unix/bsd/freebsdlike/freebsd/powerpc.rs":"9ca3f82f88974e6db5569f2d76=
a5a3749b248a31747a6c0da5820492bdfeca42","src/unix/bsd/freebsdlike/freebsd/p=
owerpc64.rs":"2dae3ecc87eac3b11657aa98915def55fc4b5c0de11fe26aae23329a54628=
a9a","src/unix/bsd/freebsdlike/freebsd/riscv64.rs":"fa4bed4c58cad24ba339594=
1c7fa6b11e089551a04714f9561078e400f5b2b62","src/unix/bsd/freebsdlike/freebs=
d/x86.rs":"6766e2ce85e187b306cd3b0b8d7e15b8f4042c5cff81d89b3af69ecc99c70ab0=
","src/unix/bsd/freebsdlike/freebsd/x86_64/align.rs":"0e1f69a88fca1c32874b1=
daf5db3d446fefbe518dca497f096cc9168c39dde70","src/unix/bsd/freebsdlike/free=
bsd/x86_64/mod.rs":"51e4dd0c8ae247bb652feda5adad9333ea3bb30c750c3a3935e0b0e=
47d7803eb","src/unix/bsd/freebsdlike/mod.rs":"0eacafac87fb3a32ef1b85980fece=
2792e70eba9856af18a7407cc35be68ea57","src/unix/bsd/mod.rs":"dad51a24a524e92=
bfe9de3ac3b7d394d86058b9b8a1ccd4efa9bbb5c78e7fa1a","src/unix/bsd/netbsdlike=
/mod.rs":"0a66f7de43710e35a6a546e6c39066aa8b91a6efadb71db88738b0a577fd5537"=
,"src/unix/bsd/netbsdlike/netbsd/aarch64.rs":"65dcb58d11e8d8028401a9d07ca3e=
b4cb4f053e04249cc877353449d84ccc4cb","src/unix/bsd/netbsdlike/netbsd/arm.rs=
":"58cdbb70b0d6f536551f0f3bb3725d2d75c4690db12c26c034e7d6ec4a924452","src/u=
nix/bsd/netbsdlike/netbsd/mod.rs":"90dd33ef20dc3be8aef5bd152a6a06e7ab34f952=
7b3978487b593aaa16a907bd","src/unix/bsd/netbsdlike/netbsd/powerpc.rs":"ee7f=
f5d89d0ed22f531237b5059aa669df93a3b5c489fa641465ace8d405bf41","src/unix/bsd=
/netbsdlike/netbsd/sparc64.rs":"9489f4b3e4566f43bb12dfb92238960613dac7f6a45=
cc13068a8d152b902d7d9","src/unix/bsd/netbsdlike/netbsd/x86.rs":"20692320e36=
bfe028d1a34d16fe12ca77aa909cb02bda167376f98f1a09aefe7","src/unix/bsd/netbsd=
like/netbsd/x86_64.rs":"1afe5ef46b14397cdd68664b5b232e4f5b035b6db1d4cf411c8=
99d51ebca9f30","src/unix/bsd/netbsdlike/openbsd/aarch64.rs":"dd91931d373b7e=
caf6e2de25adadee10d16fa9b12c2cbacdff3eb291e1ba36af","src/unix/bsd/netbsdlik=
e/openbsd/arm.rs":"01580d261bc6447bb327a0d982181b7bdabfa066cee65a30373d3ced=
729ad307","src/unix/bsd/netbsdlike/openbsd/mips64.rs":"8532a189ae10c7d668d9=
d4065da8b05d124e09bd39442c9f74a7f231c43eca48","src/unix/bsd/netbsdlike/open=
bsd/mod.rs":"c27c6673bd3628549083a094219831fd9343129f91067b562781617d2a8871=
48","src/unix/bsd/netbsdlike/openbsd/powerpc.rs":"01580d261bc6447bb327a0d98=
2181b7bdabfa066cee65a30373d3ced729ad307","src/unix/bsd/netbsdlike/openbsd/p=
owerpc64.rs":"1dd5449dd1fd3d51e30ffdeeaece91d0aaf05c710e0ac699fecc5461cfa2c=
28e","src/unix/bsd/netbsdlike/openbsd/riscv64.rs":"1dd5449dd1fd3d51e30ffdee=
aece91d0aaf05c710e0ac699fecc5461cfa2c28e","src/unix/bsd/netbsdlike/openbsd/=
sparc64.rs":"d04fd287afbaa2c5df9d48c94e8374a532a3ba491b424ddf018270c7312f40=
85","src/unix/bsd/netbsdlike/openbsd/x86.rs":"6f7f5c4fde2a2259eb547890cbd86=
570cea04ef85347d7569e94e679448bec87","src/unix/bsd/netbsdlike/openbsd/x86_6=
4.rs":"d31db31630289c85af3339dbe357998a21ca584cbae31607448fe2cf7675a4e1","s=
rc/unix/haiku/b32.rs":"a2efdbf7158a6da341e1db9176b0ab193ba88b449616239ed95d=
ced11f54d87b","src/unix/haiku/b64.rs":"ff8115367d3d7d354f792d6176dfaaa26353=
f57056197b563bf4681f91ff7985","src/unix/haiku/mod.rs":"d7ec086b73db4f727991=
79627aa6330a513dcf786b06e19c75ff884d1235948e","src/unix/haiku/native.rs":"d=
bfcbf4954a79d1df2ff58e0590bbcb8c57dfc7a32392aa73ee4726b66bd6cc8","src/unix/=
haiku/x86_64.rs":"3ec3aeeb7ed208b8916f3e32d42bfd085ff5e16936a1a35d9a52789f0=
43b7237","src/unix/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae10=
ceccefeed9debb3bbe08777fc682","src/unix/hermit/mod.rs":"a1494a0bddf301cceb0=
d9b8529a84b5882fe855ceae77a1c4e8d6034e705e26c","src/unix/hermit/x86_64.rs":=
"ab832b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/uni=
x/linux_like/android/b32/arm.rs":"ce582de7e983a33d3bfad13075c53aac9016cee35=
f06ad8653ee9072c3ec2564","src/unix/linux_like/android/b32/mod.rs":"7c173e03=
75119bf06a3081652faede95e5bcd6858e7576b7533d037978737c8f","src/unix/linux_l=
ike/android/b32/x86/align.rs":"812914e4241df82e32b12375ca3374615dc3a4bdd4cf=
31f0423c5815320c0dab","src/unix/linux_like/android/b32/x86/mod.rs":"e6d107e=
fbcd37b5b85dfa18f683300cbf768ffa0237997a9fa52b184a53323ac","src/unix/linux_=
like/android/b64/aarch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3ee2faf=
6fcae3770f9e505cddca35c7b","src/unix/linux_like/android/b64/aarch64/int128.=
rs":"1735f6f5c56770d20dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de","src=
/unix/linux_like/android/b64/aarch64/mod.rs":"10e963e29ff209703de6336c99cca=
96fd79789438d34c82a693eae56e8916c3c","src/unix/linux_like/android/b64/mod.r=
s":"71e4fcbe952bfa4a5f9022f3972e906917b38f729b9d8ef57cd5d179104894ac","src/=
unix/linux_like/android/b64/riscv64/align.rs":"0bf138f84e5327d8339bcd4adf07=
1a6832b516445e597552c82bbd881095e3a8","src/unix/linux_like/android/b64/risc=
v64/mod.rs":"19d4bf2237c47127eba9144e0b82e995bc079315e719179a91813b0ae7b0e4=
9d","src/unix/linux_like/android/b64/x86_64/align.rs":"7169d07a9fd4716f7512=
719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/android/=
b64/x86_64/mod.rs":"4ec2de11a9b65c4325b7b991f0b99a414975e0e61ba8668caca5d92=
1e9b314d1","src/unix/linux_like/android/mod.rs":"66a9e38a47493a42b3b1c32552=
4f3c944e74d1e3e8ecce3cc276ec08fecab13b","src/unix/linux_like/emscripten/ali=
gn.rs":"86c95cbed7a7161b1f23ee06843e7b0e2340ad92b2cb86fe2a8ef3e0e8c36216","=
src/unix/linux_like/emscripten/mod.rs":"67d6b90f539f746aa3290ea7f9d3f3f8d2d=
8a6557233584004ed5697f7821a50","src/unix/linux_like/emscripten/no_align.rs"=
:"0128e4aa721a9902754828b61b5ec7d8a86619983ed1e0544a85d35b1051fad6","src/un=
ix/linux_like/linux/align.rs":"bc5abcd38e2320171e0981e773c9c5fe3e0d5a66fdff=
049228f6a1acad80ef8b","src/unix/linux_like/linux/arch/generic/mod.rs":"fb5d=
e1368cabae03d3ea0152159b7685a9d91efdecee4c5b83efc085ffef8a73","src/unix/lin=
ux_like/linux/arch/mips/mod.rs":"75814e198d1a9a6808be3a5e5edb1bfdc57f75b063=
94e9040739be363c09d82f","src/unix/linux_like/linux/arch/mod.rs":"5bd5361f8a=
6ab4e18bbba6da9f92c164ae252b15a0ed10064812544aa1fdf198","src/unix/linux_lik=
e/linux/arch/powerpc/mod.rs":"bef6b7af9e5e2b4e5545c9c7e3e23a8b743277a0ed958=
53e7eddc38e44299f02","src/unix/linux_like/linux/arch/sparc/mod.rs":"91593ec=
0440f1dd8f8e612028f432c44c14089286e2aca50e10511ab942db8c3","src/unix/linux_=
like/linux/gnu/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec72519573=
15afa53a7b9f936","src/unix/linux_like/linux/gnu/b32/arm/align.rs":"6ec0eb3e=
e93f7ae99fd714b4deabfb5e97fbcefd8c26f5a45fb8e7150899cdeb","src/unix/linux_l=
ike/linux/gnu/b32/arm/mod.rs":"9ab3e97b579a9122690cd01026e14528862860346b70=
0aafbb755a7e04054f7f","src/unix/linux_like/linux/gnu/b32/csky/align.rs":"3f=
ed009dc9af3cc81be7087da9d2d7d1f39845e4497e290259c5cdbae25f039d","src/unix/l=
inux_like/linux/gnu/b32/csky/mod.rs":"4c21d6e7463bb22f00b984294893d12c84018=
d5d26ec661d6a30f4a9625ba639","src/unix/linux_like/linux/gnu/b32/m68k/align.=
rs":"8faa92f77a9232c035418d45331774e64a9a841d99c91791570a203bf2b45bcb","src=
/unix/linux_like/linux/gnu/b32/m68k/mod.rs":"6aab7f1b864e9691d14aa7d389f717=
c4077b8eed72a7f11e3b8c7fef245e4046","src/unix/linux_like/linux/gnu/b32/mips=
/align.rs":"429fb5e005cb7143602d430098b6ebfb7d360685b194f333dfd587472ae954e=
e","src/unix/linux_like/linux/gnu/b32/mips/mod.rs":"6b9a5dac6f937ddc1453e80=
8e3c43502c87143332df9e43ac64fb8b1eda6c116","src/unix/linux_like/linux/gnu/b=
32/mod.rs":"b56625dd20dd48a8699034d349ef089c540c0ddcbf8a3481d598d101f8b40b7=
8","src/unix/linux_like/linux/gnu/b32/powerpc.rs":"5c5d90326b54b57b98eff474=
5fe7a3fb02f053b2dc782241a73e807b491936a3","src/unix/linux_like/linux/gnu/b3=
2/riscv32/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd37543ef=
e86621b119","src/unix/linux_like/linux/gnu/b32/riscv32/mod.rs":"491a9a97cf7=
12985b75d3ad714691ef60898d88c78bc386a6917de0a6774cc26","src/unix/linux_like=
/linux/gnu/b32/sparc/align.rs":"21adbed27df73e2d1ed934aaf733a643003d7baf2bd=
e9c48ea440895bcca6d41","src/unix/linux_like/linux/gnu/b32/sparc/mod.rs":"80=
894eece66e9348f45d1b07ad37c757ea694bbd10ed49d3f920b34e9f51a9a3","src/unix/l=
inux_like/linux/gnu/b32/x86/align.rs":"e4bafdc4a519a7922a81b37a62bbfd1177a2=
f620890eef8f1fbc47162e9eb413","src/unix/linux_like/linux/gnu/b32/x86/mod.rs=
":"c703cc5e9de2dc31d9e5831bfb6f354d6e3518b2ae02263f68a9a70f1c0167e2","src/u=
nix/linux_like/linux/gnu/b64/aarch64/align.rs":"fdf1c72375a2167699157e0dd82=
5422690bb6719f7bc69515a2e5846d0431d7c","src/unix/linux_like/linux/gnu/b64/a=
arch64/fallback.rs":"832e7487249c1c0bb6e9911ce3f7d32ca22378e42392ab83c56915=
cbc59d8be3","src/unix/linux_like/linux/gnu/b64/aarch64/ilp32.rs":"bf4611b73=
7813deef6787babf6c01698605f3b75482269b8546318667bc68e29","src/unix/linux_li=
ke/linux/gnu/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426442f09724d9b2052=
b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/gnu/b64/aarch64/lp64=
.rs":"11a950697fdda0258c6e37c6b13993348c8de4134105ed4faa79358e53175072","sr=
c/unix/linux_like/linux/gnu/b64/aarch64/mod.rs":"172495fbfdf659b9b825148bff=
c2b62704f63fc872428617e868eb15802c9978","src/unix/linux_like/linux/gnu/b64/=
loongarch64/align.rs":"060aa33cc737966c691aab8511c5c5729e551458ce18d0e284e0=
d45f39beeb60","src/unix/linux_like/linux/gnu/b64/loongarch64/mod.rs":"18eda=
da8aa5d4127d9aa1bd81c62b5a4209f1efd8b2b2631e801c9e855ab1480","src/unix/linu=
x_like/linux/gnu/b64/mips64/align.rs":"7169d07a9fd4716f7512719aec9fda5d8bed=
306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/linux/gnu/b64/mips64/mod=
.rs":"628c410b9aaec3c8f43838a28616b577a1d6de60a9799b09bb884d80281f96eb","sr=
c/unix/linux_like/linux/gnu/b64/mod.rs":"6a160ef25439c4fecdb0e3bd0b81874226=
3c791364da874d4febd3aa644ec8e2","src/unix/linux_like/linux/gnu/b64/powerpc6=
4/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268130=
d9","src/unix/linux_like/linux/gnu/b64/powerpc64/mod.rs":"c778a136f06c2ffea=
cea19fa14ce79b828f91b67a002dec5ce87289bae36234e","src/unix/linux_like/linux=
/gnu/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd=
37543efe86621b119","src/unix/linux_like/linux/gnu/b64/riscv64/mod.rs":"c8f0=
7efc5ddd5d874f1ebc329cd6907818d132ac3e30f4f2a4b04be3fb388551","src/unix/lin=
ux_like/linux/gnu/b64/s390x.rs":"a2fd9277c2dcf76f7a16a3bcca745d5a9932c765c0=
dc2feb31c3641be25eb0aa","src/unix/linux_like/linux/gnu/b64/sparc64/align.rs=
":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268130d9","src/u=
nix/linux_like/linux/gnu/b64/sparc64/mod.rs":"e8047e9966a2b90063e0151a0278c=
54885e7b323286cf5ab55cbaf151fc772d3","src/unix/linux_like/linux/gnu/b64/x86=
_64/align.rs":"62e822478356db4a73b6bbd1b36d825b893939ab4b308ec11b0578bcc4b4=
9769","src/unix/linux_like/linux/gnu/b64/x86_64/mod.rs":"891e595d33714b9883=
b92f0554d1d361fba2b6c3f6cac09a288252f44c6ec667","src/unix/linux_like/linux/=
gnu/b64/x86_64/not_x32.rs":"38f74ce15d9662ce4818815a2b87be1618d5e45f190f7e4=
db84ff3285b4421fb","src/unix/linux_like/linux/gnu/b64/x86_64/x32.rs":"b2021=
8a11364a6dec87f96d6c0d8b19e660697ab09ad5ee0e9b3a9dafedaaebb","src/unix/linu=
x_like/linux/gnu/mod.rs":"47dd970aedda9c70429741d7c9892a0d5d264e9abcb1c41d5=
bb913a86f0a5362","src/unix/linux_like/linux/gnu/no_align.rs":"9cd223135de75=
315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/linux_like/l=
inux/mod.rs":"1582c09db7b752af0f796a4cba8aa2bb4ecea895c551a2219e76047bcce74=
a23","src/unix/linux_like/linux/musl/b32/arm/align.rs":"3e8ac052c1043764776=
b54c93ba4260e061df998631737a897d9d47d54f7b80c","src/unix/linux_like/linux/m=
usl/b32/arm/mod.rs":"f5b217a93f99c2852f7fd1459f529798372fa7df84ee0cfd3d8cdd=
5b2021b8cf","src/unix/linux_like/linux/musl/b32/hexagon.rs":"226a8b64ce9c75=
abbbee6d2dceb0b44f7b6c750c4102ebd4d015194afee6666e","src/unix/linux_like/li=
nux/musl/b32/mips/align.rs":"429fb5e005cb7143602d430098b6ebfb7d360685b194f3=
33dfd587472ae954ee","src/unix/linux_like/linux/musl/b32/mips/mod.rs":"16f61=
4dd59695497a01b542deacd1669335678bdd0b14d16dde482fb5c4e02f4","src/unix/linu=
x_like/linux/musl/b32/mod.rs":"31677597fd9544c4b1ec1477628288f6273fabbc06e3=
8f33da862ad55f019ce1","src/unix/linux_like/linux/musl/b32/powerpc.rs":"ebf7=
3f570b11512adc4a7b513aedff02a55125ead167fe5dbd45c39afb87cddb","src/unix/lin=
ux_like/linux/musl/b32/riscv32/align.rs":"efd2accf33b87de7c7547903359a5da89=
6edc33cd6c719552c7474b60d4a5d48","src/unix/linux_like/linux/musl/b32/riscv3=
2/mod.rs":"7b067c7989a80e35daa9987af799d97dd1fb3df71ef82285137f51fbad2354d9=
","src/unix/linux_like/linux/musl/b32/x86/align.rs":"08e77fbd7435d7dec2ff56=
932433bece3f02e47ce810f89004a275a86d39cbe1","src/unix/linux_like/linux/musl=
/b32/x86/mod.rs":"de632ac323bd2bb4f83d4826d6eb7e29d4b0e6293aa0c4cb9c99ef0fc=
abc71b7","src/unix/linux_like/linux/musl/b64/aarch64/align.rs":"6ba32725d24=
d7d8e6aa111f3b57aafa318f83b606abe96561329151829821133","src/unix/linux_like=
/linux/musl/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426442f09724d9b2052b=
46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/musl/b64/aarch64/mod.=
rs":"31e75179cbb4e26425b3f5b052e358f593153da662884655e60801d852e55dc2","src=
/unix/linux_like/linux/musl/b64/mips64.rs":"9a5d29f666332bb056d0e2951e9de98=
9aa1dc016075f009db3f2f628e0cdda8c","src/unix/linux_like/linux/musl/b64/mod.=
rs":"884243eb5af7df963d858d5baf47e622b45f04e0ae701728b134e986191b614b","src=
/unix/linux_like/linux/musl/b64/powerpc64.rs":"e77f4cf5d65320023043e4354725=
397f6b079c1b7b6b3cef2c3293350b46b303","src/unix/linux_like/linux/musl/b64/r=
iscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd37543efe86=
621b119","src/unix/linux_like/linux/musl/b64/riscv64/mod.rs":"a80b1813148de=
c8bc396c02638978c0b4e5e040edafd56d98f8683fe2ae51ab5","src/unix/linux_like/l=
inux/musl/b64/s390x.rs":"80a92e54e47016d051c7bd55bee9580cbedd298164199d71a6=
7d49167e744432","src/unix/linux_like/linux/musl/b64/x86_64/align.rs":"77309=
276ad7a42cbe59ca381f23590b7a143aded05555b34a5b307b808cbca6e","src/unix/linu=
x_like/linux/musl/b64/x86_64/mod.rs":"032863c74d3ca73cb75483218f9bd774ae1ae=
7d3646d2ffb21e4cc7d4b5e0e3d","src/unix/linux_like/linux/musl/lfs64.rs":"3e4=
fb381f3a0756520bde0f1692d4fa45e4ae8133bf7d7c64b0e3fdd512f235f","src/unix/li=
nux_like/linux/musl/mod.rs":"f79e4d7bef14f422c6a77f1573ff503a82305bfa5ac3e4=
c6f571c09212b75620","src/unix/linux_like/linux/no_align.rs":"62cdca0e011937=
aaf09a51ca86d9f0ee0fdb05f61ec3c058e6a5d5fa6357d784","src/unix/linux_like/li=
nux/non_exhaustive.rs":"181a05bf94fdb911db83ce793b993bd6548a4115b306a7ef3c1=
0f745a8fea3e9","src/unix/linux_like/linux/uclibc/align.rs":"9ed16138d8e439b=
d90930845a65eafa7ebd67366e6bf633936d44014f6e4c959","src/unix/linux_like/lin=
ux/uclibc/arm/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec725195731=
5afa53a7b9f936","src/unix/linux_like/linux/uclibc/arm/mod.rs":"50288ff9e411=
ab0966da24838f2c2a5618021bc19c422a04f577b2979ef4081e","src/unix/linux_like/=
linux/uclibc/arm/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c=
85a76f8316c86653db25","src/unix/linux_like/linux/uclibc/mips/mips32/align.r=
s":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936","src/=
unix/linux_like/linux/uclibc/mips/mips32/mod.rs":"d0c4434e2bf813372c418a8f5=
16c706cdccc9f7be2f0921b2207b0afdb66fe81","src/unix/linux_like/linux/uclibc/=
mips/mips32/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76=
f8316c86653db25","src/unix/linux_like/linux/uclibc/mips/mips64/align.rs":"a=
7bdcb18a37a2d91e64d5fad83ea3edc78f5412adb28f77ab077dbb26dd08b2d","src/unix/=
linux_like/linux/uclibc/mips/mips64/mod.rs":"3f38ee6a4690b9d7594be20d216467=
a34d955f7653c2c8ce1e6147daeb53f1e0","src/unix/linux_like/linux/uclibc/mips/=
mips64/no_align.rs":"4a18e3875698c85229599225ac3401a2a40da87e77b2ad4ef47c6f=
cd5a24ed30","src/unix/linux_like/linux/uclibc/mips/mod.rs":"a048fce1c2d9b1a=
d57305642e8ad05ca0f0c7e4753267a2e2d6b4fee5db3b072","src/unix/linux_like/lin=
ux/uclibc/mod.rs":"1c3d25cddcfefa2bd17bdc81550826be31a08eef235e13f825f169a5=
029c8bca","src/unix/linux_like/linux/uclibc/no_align.rs":"3f28637046524618a=
daa1012e26cb7ffe94b9396e6b518cccdc69d59f274d709","src/unix/linux_like/linux=
/uclibc/x86_64/l4re.rs":"024eba5753e852dbdd212427351affe7e83f9916c1864bce41=
4d7aa2618f192e","src/unix/linux_like/linux/uclibc/x86_64/mod.rs":"196d03aff=
befb85716937c15904831e731eb222ee906e05e42102d639a8152ea","src/unix/linux_li=
ke/linux/uclibc/x86_64/other.rs":"42c3f71e58cabba373f6a55a623f3c31b85049eb6=
4824c09c2b082b3b2d6a0a8","src/unix/linux_like/mod.rs":"45c98e7a0fad03b03c4c=
76f11a80e2423873f0a6563e35c60309a29b2c8ff44f","src/unix/mod.rs":"dd4ce377ba=
9517182e718848739a5c3f58cdbbcd4ee467eef9aaf8df5aed5053","src/unix/newlib/aa=
rch64/mod.rs":"bac93836a9a57b2c710f32f852e92a4d11ad6759ab0fb6ad33e71d60e532=
78af","src/unix/newlib/align.rs":"28aaf87fafbc6b312622719d472d8cf65f9e5467d=
15339df5f73e66d8502b28a","src/unix/newlib/arm/mod.rs":"cbba6b3e957eceb49680=
6e60de8725a23ff3fa0015983b4b4fa27b233732b526","src/unix/newlib/espidf/mod.r=
s":"816f235f4aa4baabba7f2606b31d0fdb03988c52194c966728de8690bf17299d","src/=
unix/newlib/generic.rs":"eab066d9f0a0f3eb53cc1073d01496bba0110989e1f6a59838=
afd19f870cd599","src/unix/newlib/horizon/mod.rs":"7cc5cc120437421db139bfa6a=
90b18168cd3070bdd0f5be96d40fe4c996f3ca1","src/unix/newlib/mod.rs":"9e36de3f=
d78e10cb6b9a59dc5ebe5a1b44a63ccb91433bb33653fb30d0c303c6","src/unix/newlib/=
no_align.rs":"e0743b2179495a9514bc3a4d1781e492878c4ec834ee0085d0891dd1712e8=
2fb","src/unix/newlib/powerpc/mod.rs":"0202ffd57caf75b6afa2c9717750ffb96e37=
5ac33df0ae9609a3f831be393b67","src/unix/newlib/vita/mod.rs":"68e0ce186b44e0=
b3031eb824710e7454dc2a9df98db98120840c3c6f4d885871","src/unix/no_align.rs":=
"c06e95373b9088266e0b14bba0954eef95f93fb2b01d951855e382d22de78e53","src/uni=
x/nto/aarch64.rs":"4709c9afdc8d583be876598e7c238499ee3e8da5bd2baa614d9c7dd4=
14851555","src/unix/nto/mod.rs":"59ab89a8fb6e0a6d22fa968ed4873c2bafa19a0f60=
a90c9a5148816cb7440889","src/unix/nto/neutrino.rs":"799bff4ab01a6424db6c5a2=
b76aa5679826d41495f9d13c63485bf13bc80026b","src/unix/nto/x86_64.rs":"a3e18e=
93c2999da1cd7a6f748a4b60c07aefb73d8ea2aafec19a84cfb040bc8e","src/unix/redox=
/mod.rs":"73658b0d28c82a122875aa2b45c489834f4de58c378add7932bbaf3ffb2ae789"=
,"src/unix/solarish/compat.rs":"00f1ee3faec9da69204e42f025f6735dd13d894071a=
154425dcc43ecbdd06e7f","src/unix/solarish/illumos.rs":"cd93c2d84722bbf9933a=
92842a8998eb0b2afc962f50bc2546ad127b82809fa7","src/unix/solarish/mod.rs":"b=
1660c631a599a3355116e7485b88ab2f8f2929c2e37851a763431387b902f14","src/unix/=
solarish/solaris.rs":"41b350a89ddf01cd12a10f93640f92be53be0b0d976021cdc08da=
17bf3e72edf","src/unix/solarish/x86.rs":"e86e806df0caed72765040eaa2f3c88319=
8d1aa91508540adf9b7008c77f522e","src/unix/solarish/x86_64.rs":"ec2b01f194eb=
8a6a27133c57681da195a949e03098f3ea1e847227a9c09ef5fc","src/unix/solarish/x8=
6_common.rs":"ac869d9c3c95645c22460468391eb1982023c3a8e02b9e06a72e3aef3d5f1=
eac","src/vxworks/aarch64.rs":"98f0afdc511cd02557e506c21fed6737585490a1dce7=
a9d4941d08c437762b99","src/vxworks/arm.rs":"acb7968ce99fe3f4abdf39d98f8133d=
21a4fba435b8ef7084777cb181d788e88","src/vxworks/mod.rs":"e4edcbcf43a325e738=
c9465507594d0c87abf3f0e2b9b046c1425f8d44bdad0f","src/vxworks/powerpc.rs":"a=
cb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788e88","src/vxwor=
ks/powerpc64.rs":"98f0afdc511cd02557e506c21fed6737585490a1dce7a9d4941d08c43=
7762b99","src/vxworks/x86.rs":"552f007f38317620b23889cb7c49d1d1158412524390=
60122f52f434fbc6e5ba","src/vxworks/x86_64.rs":"018d92be3ad628a129eff9f2f5df=
bc0883d8b8e5f2fa917b900a7f98ed6b514a","src/wasi.rs":"09ee3b3348b212b050f6ca=
8ae008a28679ea44a375674307a4e7c9ca0d3ed7d5","src/windows/gnu/align.rs":"b2c=
13ec1b9f3b39a75c452c80c951dff9d0215e31d77e883b4502afb31794647","src/windows=
/gnu/mod.rs":"3c8c7edb7cdf5d0c44af936db2a94869585c69dfabeef30571b4f4e383757=
67a","src/windows/mod.rs":"9fdc5e1c62c441abef7bc62a7343efb2041edc24db9ac0ef=
c0f74df55b69e249","src/windows/msvc/mod.rs":"c068271e00fca6b62bc4bf44bcf142=
cfc38caeded9b6c4e01d1ceef3ccf986f4","src/xous.rs":"eb0675f25ba01f73072d2b70=
907fb8abb1148facefe5a20756c49250f3d65fae","tests/const_fn.rs":"cb75a1f0864f=
926aebe79118fc34d51a0d1ade2c20a394e7774c7e545f21f1f4"},"package":"9cdc71e17=
332e86d2e1d38c1f99edcb6288ee11b815fb1a4b049eaa2114d369b"}
-\ No newline at end of file
-+{"files":{"CONTRIBUTING.md":"bdc90b52cf803faac96e594069a86dd8ea150d5ba7fb=
3e6cadfc08dac4c7b0ce","Cargo.toml":"a58e58fa9bde015e08609ea2f17e56c5df7c82a=
a6f3fa1a144c02ee4715227b9","LICENSE-APACHE":"62c7a1e35f56406896d7aa7ca52d0c=
c0d272ac022b5d2796e7d6905db8a3636a","LICENSE-MIT":"a8d47ff51ca256f56a8932db=
a07660672dbfe3004257ca8de708aac1415937a1","README.md":"ecc47e284f8d007fc048=
666d5108dd41cdc440ab9eedfe8c47d1634613522787","build.rs":"9e94683e94db80e82=
82fce07549cf748d9037852fb06df1c7596bea2ed130d50","rustfmt.toml":"eaa2ea84fc=
1ba0359b77680804903e07bb38d257ab11986b95b158e460f787b2","src/fixed_width_in=
ts.rs":"7f986e5f5e68d25ef04d386fd2f640e8be8f15427a8d4a458ea01d26b8dca0ca","=
src/fuchsia/aarch64.rs":"893fcec48142d273063ffd814dca33fbec92205fd39ada9707=
5f85201d803996","src/fuchsia/align.rs":"ae1cf8f011a99737eabeb14ffff768e60f1=
3b13363d7646744dbb0f443dab3d6","src/fuchsia/mod.rs":"30f4dc83ef120300d61896=
696512436377c5f36f1431d98ab7e01e498c0c47d5","src/fuchsia/no_align.rs":"303f=
3f1b255e0088b5715094353cf00476131d8e94e6aebb3f469557771c8b8a","src/fuchsia/=
riscv64.rs":"617cd75e79e0e20f664db764a4dc2a396d9fd11a4d95371acd91ed4811293b=
11","src/fuchsia/x86_64.rs":"93a3632b5cf67d2a6bcb7dc0a558605252d5fe689e0f38=
d8aa2ec5852255ac87","src/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f3=
68ae10ceccefeed9debb3bbe08777fc682","src/hermit/mod.rs":"d3bfce41e4463d4be8=
020a2d063c9bfa8b665f45f1cc6cbf3163f5d01e7cb21f","src/hermit/x86_64.rs":"ab8=
32b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/lib.rs"=
:"24111461547739f3646f95bcb66c43f2ae679a727ff5938299434c522c02e458","src/ma=
cros.rs":"b457eb028b8e8ab3c24bb7292b874ad4e491edbb83594f6a3da024df5348c088"=
,"src/psp.rs":"dd31aabd46171d474ec5828372e28588935120e7355c90c105360d8fa926=
4c1c","src/sgx.rs":"16a95cdefc81c5ee00d8353a60db363c4cc3e0f75abcd5d0144723f=
2a306ed1b","src/solid/aarch64.rs":"a726e47f324adf73a4a0b67a2c183408d0cad105=
ae66acf36db37a42ab7f8707","src/solid/arm.rs":"e39a4f74ebbef3b97b8c95758ad74=
1123d84ed3eb48d9cf4f1f4872097fc27fe","src/solid/mod.rs":"5f4151dca5132e4b4e=
4c23ab9737e12856dddbdc0ca3f7dbc004328ef3c8acde","src/switch.rs":"9da3dd39b3=
de45a7928789926e8572d00e1e11a39e6f7289a1349aadce90edba","src/unix/aix/mod.r=
s":"54229b5e774669c16912112e8b50fa938db76f534971222a11723a05195a0948","src/=
unix/aix/powerpc64.rs":"cf374d81139d45f9d77c6a764f640bfbf7e0a5903689652c829=
6f8e10d55169b","src/unix/align.rs":"2cdc7c826ef7ae61f5171c5ae8c445a743d86f1=
a7f2d9d7e4ceeec56d6874f65","src/unix/bsd/apple/b32/align.rs":"ec833a747866f=
e19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b3=
2/mod.rs":"2546ad3eb6aecb95f916648bc63264117c92b4b4859532b34cb011e4c75a5a72=
","src/unix/bsd/apple/b64/aarch64/align.rs":"2eaf0f561a32bdcbf4e0477c8895d5=
e7bcb5cdebd5fef7b4df2ca8e38e144d94","src/unix/bsd/apple/b64/aarch64/mod.rs"=
:"44c217a4f263afe7a97435de9323d20a96c37836f899ca0925306d4b7e073c27","src/un=
ix/bsd/apple/b64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d1=
5fa68884c40b0e26c","src/unix/bsd/apple/b64/mod.rs":"f5e278a1af7fb358891d1c9=
be4eb7e815aaca0c5cb738d0c3604ba2208a856f7","src/unix/bsd/apple/b64/x86_64/a=
lign.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c"=
,"src/unix/bsd/apple/b64/x86_64/mod.rs":"8c87c5855038aae5d433c8f5eb3b29b0a1=
75879a0245342b3bfd83bdf4cfd936","src/unix/bsd/apple/long_array.rs":"3cf1f19=
b812e6d093c819dc65ce55b13491963e0780eda0d0bd1577603e81948","src/unix/bsd/ap=
ple/mod.rs":"0931fd351d585728e6384d7b952b8d816e9acdb9c86c172324445f3c33f692=
ca","src/unix/bsd/freebsdlike/dragonfly/errno.rs":"8295b8bb0dfd38d2cdb4d919=
2cdeeb534cc6c3b208170e64615fa3e0edb3e578","src/unix/bsd/freebsdlike/dragonf=
ly/mod.rs":"f2e78625fe1eb14f43e730a3987eba888cb8ac04c23008e7c2d2f7c72258b9e=
6","src/unix/bsd/freebsdlike/freebsd/aarch64.rs":"6c8e216385f53a4bf5f171749=
b57602fc34a4e4b160a44ca31c058cb0c8a2126","src/unix/bsd/freebsdlike/freebsd/=
arm.rs":"59d6a670eea562fb87686e243e0a84603d29a2028a3d4b3f99ccc01bd04d2f47",=
"src/unix/bsd/freebsdlike/freebsd/freebsd11/b64.rs":"9808d152c1196aa647f1b0=
f0cf84dac8c930da7d7f897a44975545e3d9d17681","src/unix/bsd/freebsdlike/freeb=
sd/freebsd11/mod.rs":"e243ae0e89623d4fa9f85afe14369cc5fd5f2028ea715773dbec7=
22ba80dac1f","src/unix/bsd/freebsdlike/freebsd/freebsd12/b64.rs":"61cbe45f8=
499bedb168106b686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/free=
bsdlike/freebsd/freebsd12/mod.rs":"bef9fae288a4f29e941ea369be1cd20b170040e6=
0665a4d49a4a9e79009b72d8","src/unix/bsd/freebsdlike/freebsd/freebsd12/x86_6=
4.rs":"2df36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","s=
rc/unix/bsd/freebsdlike/freebsd/freebsd13/b64.rs":"61cbe45f8499bedb168106b6=
86d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd=
/freebsd13/mod.rs":"3c514e037694ce22724abb3c9c4687defda7f0e3456b615ca73593e=
860e38b16","src/unix/bsd/freebsdlike/freebsd/freebsd13/x86_64.rs":"2df36a7f=
122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/fre=
ebsdlike/freebsd/freebsd14/b64.rs":"61cbe45f8499bedb168106b686d4f8239472f25=
c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd14/mod.=
rs":"318abe48bfdd1c74ecd6afbd6c9329c5c72ce4f7d420edd6be2fc12b223ae32f","src=
/unix/bsd/freebsdlike/freebsd/freebsd14/x86_64.rs":"e7b5863e222d6cc416b6b0f=
be71690fad909e899b4c4ae810bbca117e4fcb650","src/unix/bsd/freebsdlike/freebs=
d/mod.rs":"4c3cd57aaf7fbce072e28e0d2d285b5fda9702e924561d2fd01e49e6ee186a98=
","src/unix/bsd/freebsdlike/freebsd/powerpc.rs":"9ca3f82f88974e6db5569f2d76=
a5a3749b248a31747a6c0da5820492bdfeca42","src/unix/bsd/freebsdlike/freebsd/p=
owerpc64.rs":"2dae3ecc87eac3b11657aa98915def55fc4b5c0de11fe26aae23329a54628=
a9a","src/unix/bsd/freebsdlike/freebsd/riscv64.rs":"fa4bed4c58cad24ba339594=
1c7fa6b11e089551a04714f9561078e400f5b2b62","src/unix/bsd/freebsdlike/freebs=
d/x86.rs":"6766e2ce85e187b306cd3b0b8d7e15b8f4042c5cff81d89b3af69ecc99c70ab0=
","src/unix/bsd/freebsdlike/freebsd/x86_64/align.rs":"0e1f69a88fca1c32874b1=
daf5db3d446fefbe518dca497f096cc9168c39dde70","src/unix/bsd/freebsdlike/free=
bsd/x86_64/mod.rs":"51e4dd0c8ae247bb652feda5adad9333ea3bb30c750c3a3935e0b0e=
47d7803eb","src/unix/bsd/freebsdlike/mod.rs":"0eacafac87fb3a32ef1b85980fece=
2792e70eba9856af18a7407cc35be68ea57","src/unix/bsd/mod.rs":"dad51a24a524e92=
bfe9de3ac3b7d394d86058b9b8a1ccd4efa9bbb5c78e7fa1a","src/unix/bsd/netbsdlike=
/mod.rs":"0a66f7de43710e35a6a546e6c39066aa8b91a6efadb71db88738b0a577fd5537"=
,"src/unix/bsd/netbsdlike/netbsd/aarch64.rs":"65dcb58d11e8d8028401a9d07ca3e=
b4cb4f053e04249cc877353449d84ccc4cb","src/unix/bsd/netbsdlike/netbsd/arm.rs=
":"58cdbb70b0d6f536551f0f3bb3725d2d75c4690db12c26c034e7d6ec4a924452","src/u=
nix/bsd/netbsdlike/netbsd/mod.rs":"90dd33ef20dc3be8aef5bd152a6a06e7ab34f952=
7b3978487b593aaa16a907bd","src/unix/bsd/netbsdlike/netbsd/powerpc.rs":"ee7f=
f5d89d0ed22f531237b5059aa669df93a3b5c489fa641465ace8d405bf41","src/unix/bsd=
/netbsdlike/netbsd/sparc64.rs":"9489f4b3e4566f43bb12dfb92238960613dac7f6a45=
cc13068a8d152b902d7d9","src/unix/bsd/netbsdlike/netbsd/x86.rs":"20692320e36=
bfe028d1a34d16fe12ca77aa909cb02bda167376f98f1a09aefe7","src/unix/bsd/netbsd=
like/netbsd/x86_64.rs":"1afe5ef46b14397cdd68664b5b232e4f5b035b6db1d4cf411c8=
99d51ebca9f30","src/unix/bsd/netbsdlike/openbsd/aarch64.rs":"dd91931d373b7e=
caf6e2de25adadee10d16fa9b12c2cbacdff3eb291e1ba36af","src/unix/bsd/netbsdlik=
e/openbsd/arm.rs":"01580d261bc6447bb327a0d982181b7bdabfa066cee65a30373d3ced=
729ad307","src/unix/bsd/netbsdlike/openbsd/mips64.rs":"8532a189ae10c7d668d9=
d4065da8b05d124e09bd39442c9f74a7f231c43eca48","src/unix/bsd/netbsdlike/open=
bsd/mod.rs":"c27c6673bd3628549083a094219831fd9343129f91067b562781617d2a8871=
48","src/unix/bsd/netbsdlike/openbsd/powerpc.rs":"01580d261bc6447bb327a0d98=
2181b7bdabfa066cee65a30373d3ced729ad307","src/unix/bsd/netbsdlike/openbsd/p=
owerpc64.rs":"1dd5449dd1fd3d51e30ffdeeaece91d0aaf05c710e0ac699fecc5461cfa2c=
28e","src/unix/bsd/netbsdlike/openbsd/riscv64.rs":"1dd5449dd1fd3d51e30ffdee=
aece91d0aaf05c710e0ac699fecc5461cfa2c28e","src/unix/bsd/netbsdlike/openbsd/=
sparc64.rs":"d04fd287afbaa2c5df9d48c94e8374a532a3ba491b424ddf018270c7312f40=
85","src/unix/bsd/netbsdlike/openbsd/x86.rs":"6f7f5c4fde2a2259eb547890cbd86=
570cea04ef85347d7569e94e679448bec87","src/unix/bsd/netbsdlike/openbsd/x86_6=
4.rs":"d31db31630289c85af3339dbe357998a21ca584cbae31607448fe2cf7675a4e1","s=
rc/unix/haiku/b32.rs":"a2efdbf7158a6da341e1db9176b0ab193ba88b449616239ed95d=
ced11f54d87b","src/unix/haiku/b64.rs":"ff8115367d3d7d354f792d6176dfaaa26353=
f57056197b563bf4681f91ff7985","src/unix/haiku/mod.rs":"d7ec086b73db4f727991=
79627aa6330a513dcf786b06e19c75ff884d1235948e","src/unix/haiku/native.rs":"d=
bfcbf4954a79d1df2ff58e0590bbcb8c57dfc7a32392aa73ee4726b66bd6cc8","src/unix/=
haiku/x86_64.rs":"3ec3aeeb7ed208b8916f3e32d42bfd085ff5e16936a1a35d9a52789f0=
43b7237","src/unix/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae10=
ceccefeed9debb3bbe08777fc682","src/unix/hermit/mod.rs":"a1494a0bddf301cceb0=
d9b8529a84b5882fe855ceae77a1c4e8d6034e705e26c","src/unix/hermit/x86_64.rs":=
"ab832b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/uni=
x/linux_like/android/b32/arm.rs":"ce582de7e983a33d3bfad13075c53aac9016cee35=
f06ad8653ee9072c3ec2564","src/unix/linux_like/android/b32/mod.rs":"7c173e03=
75119bf06a3081652faede95e5bcd6858e7576b7533d037978737c8f","src/unix/linux_l=
ike/android/b32/x86/align.rs":"812914e4241df82e32b12375ca3374615dc3a4bdd4cf=
31f0423c5815320c0dab","src/unix/linux_like/android/b32/x86/mod.rs":"e6d107e=
fbcd37b5b85dfa18f683300cbf768ffa0237997a9fa52b184a53323ac","src/unix/linux_=
like/android/b64/aarch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3ee2faf=
6fcae3770f9e505cddca35c7b","src/unix/linux_like/android/b64/aarch64/int128.=
rs":"1735f6f5c56770d20dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de","src=
/unix/linux_like/android/b64/aarch64/mod.rs":"10e963e29ff209703de6336c99cca=
96fd79789438d34c82a693eae56e8916c3c","src/unix/linux_like/android/b64/mod.r=
s":"71e4fcbe952bfa4a5f9022f3972e906917b38f729b9d8ef57cd5d179104894ac","src/=
unix/linux_like/android/b64/riscv64/align.rs":"0bf138f84e5327d8339bcd4adf07=
1a6832b516445e597552c82bbd881095e3a8","src/unix/linux_like/android/b64/risc=
v64/mod.rs":"19d4bf2237c47127eba9144e0b82e995bc079315e719179a91813b0ae7b0e4=
9d","src/unix/linux_like/android/b64/x86_64/align.rs":"7169d07a9fd4716f7512=
719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/android/=
b64/x86_64/mod.rs":"4ec2de11a9b65c4325b7b991f0b99a414975e0e61ba8668caca5d92=
1e9b314d1","src/unix/linux_like/android/mod.rs":"66a9e38a47493a42b3b1c32552=
4f3c944e74d1e3e8ecce3cc276ec08fecab13b","src/unix/linux_like/emscripten/ali=
gn.rs":"86c95cbed7a7161b1f23ee06843e7b0e2340ad92b2cb86fe2a8ef3e0e8c36216","=
src/unix/linux_like/emscripten/mod.rs":"67d6b90f539f746aa3290ea7f9d3f3f8d2d=
8a6557233584004ed5697f7821a50","src/unix/linux_like/emscripten/no_align.rs"=
:"0128e4aa721a9902754828b61b5ec7d8a86619983ed1e0544a85d35b1051fad6","src/un=
ix/linux_like/linux/align.rs":"bc5abcd38e2320171e0981e773c9c5fe3e0d5a66fdff=
049228f6a1acad80ef8b","src/unix/linux_like/linux/arch/generic/mod.rs":"fb5d=
e1368cabae03d3ea0152159b7685a9d91efdecee4c5b83efc085ffef8a73","src/unix/lin=
ux_like/linux/arch/mips/mod.rs":"75814e198d1a9a6808be3a5e5edb1bfdc57f75b063=
94e9040739be363c09d82f","src/unix/linux_like/linux/arch/mod.rs":"5bd5361f8a=
6ab4e18bbba6da9f92c164ae252b15a0ed10064812544aa1fdf198","src/unix/linux_lik=
e/linux/arch/powerpc/mod.rs":"bef6b7af9e5e2b4e5545c9c7e3e23a8b743277a0ed958=
53e7eddc38e44299f02","src/unix/linux_like/linux/arch/sparc/mod.rs":"91593ec=
0440f1dd8f8e612028f432c44c14089286e2aca50e10511ab942db8c3","src/unix/linux_=
like/linux/gnu/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec72519573=
15afa53a7b9f936","src/unix/linux_like/linux/gnu/b32/arm/align.rs":"6ec0eb3e=
e93f7ae99fd714b4deabfb5e97fbcefd8c26f5a45fb8e7150899cdeb","src/unix/linux_l=
ike/linux/gnu/b32/arm/mod.rs":"9ab3e97b579a9122690cd01026e14528862860346b70=
0aafbb755a7e04054f7f","src/unix/linux_like/linux/gnu/b32/csky/align.rs":"3f=
ed009dc9af3cc81be7087da9d2d7d1f39845e4497e290259c5cdbae25f039d","src/unix/l=
inux_like/linux/gnu/b32/csky/mod.rs":"4c21d6e7463bb22f00b984294893d12c84018=
d5d26ec661d6a30f4a9625ba639","src/unix/linux_like/linux/gnu/b32/m68k/align.=
rs":"8faa92f77a9232c035418d45331774e64a9a841d99c91791570a203bf2b45bcb","src=
/unix/linux_like/linux/gnu/b32/m68k/mod.rs":"6aab7f1b864e9691d14aa7d389f717=
c4077b8eed72a7f11e3b8c7fef245e4046","src/unix/linux_like/linux/gnu/b32/mips=
/align.rs":"429fb5e005cb7143602d430098b6ebfb7d360685b194f333dfd587472ae954e=
e","src/unix/linux_like/linux/gnu/b32/mips/mod.rs":"6b9a5dac6f937ddc1453e80=
8e3c43502c87143332df9e43ac64fb8b1eda6c116","src/unix/linux_like/linux/gnu/b=
32/mod.rs":"b56625dd20dd48a8699034d349ef089c540c0ddcbf8a3481d598d101f8b40b7=
8","src/unix/linux_like/linux/gnu/b32/powerpc.rs":"5c5d90326b54b57b98eff474=
5fe7a3fb02f053b2dc782241a73e807b491936a3","src/unix/linux_like/linux/gnu/b3=
2/riscv32/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd37543ef=
e86621b119","src/unix/linux_like/linux/gnu/b32/riscv32/mod.rs":"491a9a97cf7=
12985b75d3ad714691ef60898d88c78bc386a6917de0a6774cc26","src/unix/linux_like=
/linux/gnu/b32/sparc/align.rs":"21adbed27df73e2d1ed934aaf733a643003d7baf2bd=
e9c48ea440895bcca6d41","src/unix/linux_like/linux/gnu/b32/sparc/mod.rs":"80=
894eece66e9348f45d1b07ad37c757ea694bbd10ed49d3f920b34e9f51a9a3","src/unix/l=
inux_like/linux/gnu/b32/x86/align.rs":"e4bafdc4a519a7922a81b37a62bbfd1177a2=
f620890eef8f1fbc47162e9eb413","src/unix/linux_like/linux/gnu/b32/x86/mod.rs=
":"c703cc5e9de2dc31d9e5831bfb6f354d6e3518b2ae02263f68a9a70f1c0167e2","src/u=
nix/linux_like/linux/gnu/b64/aarch64/align.rs":"fdf1c72375a2167699157e0dd82=
5422690bb6719f7bc69515a2e5846d0431d7c","src/unix/linux_like/linux/gnu/b64/a=
arch64/fallback.rs":"832e7487249c1c0bb6e9911ce3f7d32ca22378e42392ab83c56915=
cbc59d8be3","src/unix/linux_like/linux/gnu/b64/aarch64/ilp32.rs":"bf4611b73=
7813deef6787babf6c01698605f3b75482269b8546318667bc68e29","src/unix/linux_li=
ke/linux/gnu/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426442f09724d9b2052=
b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/gnu/b64/aarch64/lp64=
.rs":"11a950697fdda0258c6e37c6b13993348c8de4134105ed4faa79358e53175072","sr=
c/unix/linux_like/linux/gnu/b64/aarch64/mod.rs":"172495fbfdf659b9b825148bff=
c2b62704f63fc872428617e868eb15802c9978","src/unix/linux_like/linux/gnu/b64/=
loongarch64/align.rs":"060aa33cc737966c691aab8511c5c5729e551458ce18d0e284e0=
d45f39beeb60","src/unix/linux_like/linux/gnu/b64/loongarch64/mod.rs":"18eda=
da8aa5d4127d9aa1bd81c62b5a4209f1efd8b2b2631e801c9e855ab1480","src/unix/linu=
x_like/linux/gnu/b64/mips64/align.rs":"7169d07a9fd4716f7512719aec9fda5d8bed=
306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/linux/gnu/b64/mips64/mod=
.rs":"628c410b9aaec3c8f43838a28616b577a1d6de60a9799b09bb884d80281f96eb","sr=
c/unix/linux_like/linux/gnu/b64/mod.rs":"6a160ef25439c4fecdb0e3bd0b81874226=
3c791364da874d4febd3aa644ec8e2","src/unix/linux_like/linux/gnu/b64/powerpc6=
4/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268130=
d9","src/unix/linux_like/linux/gnu/b64/powerpc64/mod.rs":"c778a136f06c2ffea=
cea19fa14ce79b828f91b67a002dec5ce87289bae36234e","src/unix/linux_like/linux=
/gnu/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd=
37543efe86621b119","src/unix/linux_like/linux/gnu/b64/riscv64/mod.rs":"c8f0=
7efc5ddd5d874f1ebc329cd6907818d132ac3e30f4f2a4b04be3fb388551","src/unix/lin=
ux_like/linux/gnu/b64/s390x.rs":"a2fd9277c2dcf76f7a16a3bcca745d5a9932c765c0=
dc2feb31c3641be25eb0aa","src/unix/linux_like/linux/gnu/b64/sparc64/align.rs=
":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268130d9","src/u=
nix/linux_like/linux/gnu/b64/sparc64/mod.rs":"e8047e9966a2b90063e0151a0278c=
54885e7b323286cf5ab55cbaf151fc772d3","src/unix/linux_like/linux/gnu/b64/x86=
_64/align.rs":"62e822478356db4a73b6bbd1b36d825b893939ab4b308ec11b0578bcc4b4=
9769","src/unix/linux_like/linux/gnu/b64/x86_64/mod.rs":"891e595d33714b9883=
b92f0554d1d361fba2b6c3f6cac09a288252f44c6ec667","src/unix/linux_like/linux/=
gnu/b64/x86_64/not_x32.rs":"38f74ce15d9662ce4818815a2b87be1618d5e45f190f7e4=
db84ff3285b4421fb","src/unix/linux_like/linux/gnu/b64/x86_64/x32.rs":"b2021=
8a11364a6dec87f96d6c0d8b19e660697ab09ad5ee0e9b3a9dafedaaebb","src/unix/linu=
x_like/linux/gnu/mod.rs":"47dd970aedda9c70429741d7c9892a0d5d264e9abcb1c41d5=
bb913a86f0a5362","src/unix/linux_like/linux/gnu/no_align.rs":"9cd223135de75=
315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/linux_like/l=
inux/mod.rs":"1582c09db7b752af0f796a4cba8aa2bb4ecea895c551a2219e76047bcce74=
a23","src/unix/linux_like/linux/musl/b32/arm/align.rs":"3e8ac052c1043764776=
b54c93ba4260e061df998631737a897d9d47d54f7b80c","src/unix/linux_like/linux/m=
usl/b32/arm/mod.rs":"b63a21b02ff1f55e3aca71af51a054d61fd2b4b452ccbf9f34acb4=
31c51d00ea","src/unix/linux_like/linux/musl/b32/hexagon.rs":"f0b9505a5935f5=
fd163eebaa14d4c18ff948c4b199b03e5b88c91f99d4b0fce6","src/unix/linux_like/li=
nux/musl/b32/mips/align.rs":"429fb5e005cb7143602d430098b6ebfb7d360685b194f3=
33dfd587472ae954ee","src/unix/linux_like/linux/musl/b32/mips/mod.rs":"9b6df=
c603accb6ef68010573f30b015868a1da1e1fc3ea2dc0337f33b4015ec6","src/unix/linu=
x_like/linux/musl/b32/mod.rs":"31677597fd9544c4b1ec1477628288f6273fabbc06e3=
8f33da862ad55f019ce1","src/unix/linux_like/linux/musl/b32/powerpc.rs":"0ebe=
9c42bb746583360d990d5a63a407075be3c7bdd260e5345e8aeac4d060cc","src/unix/lin=
ux_like/linux/musl/b32/riscv32/align.rs":"efd2accf33b87de7c7547903359a5da89=
6edc33cd6c719552c7474b60d4a5d48","src/unix/linux_like/linux/musl/b32/riscv3=
2/mod.rs":"7b067c7989a80e35daa9987af799d97dd1fb3df71ef82285137f51fbad2354d9=
","src/unix/linux_like/linux/musl/b32/x86/align.rs":"08e77fbd7435d7dec2ff56=
932433bece3f02e47ce810f89004a275a86d39cbe1","src/unix/linux_like/linux/musl=
/b32/x86/mod.rs":"9283e5d343aa668a6c2e520fb7db2548f344f1f5adf63ec7961954b61=
e6f6fad","src/unix/linux_like/linux/musl/b64/aarch64/align.rs":"6ba32725d24=
d7d8e6aa111f3b57aafa318f83b606abe96561329151829821133","src/unix/linux_like=
/linux/musl/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426442f09724d9b2052b=
46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/musl/b64/aarch64/mod.=
rs":"31e75179cbb4e26425b3f5b052e358f593153da662884655e60801d852e55dc2","src=
/unix/linux_like/linux/musl/b64/mips64.rs":"9a5d29f666332bb056d0e2951e9de98=
9aa1dc016075f009db3f2f628e0cdda8c","src/unix/linux_like/linux/musl/b64/mod.=
rs":"8275e7a108c71f180de71b86f74baa1e35d9e915befb8ab8191d2a2fe76d3bb9","src=
/unix/linux_like/linux/musl/b64/powerpc64.rs":"e77f4cf5d65320023043e4354725=
397f6b079c1b7b6b3cef2c3293350b46b303","src/unix/linux_like/linux/musl/b64/r=
iscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd37543efe86=
621b119","src/unix/linux_like/linux/musl/b64/riscv64/mod.rs":"a80b1813148de=
c8bc396c02638978c0b4e5e040edafd56d98f8683fe2ae51ab5","src/unix/linux_like/l=
inux/musl/b64/s390x.rs":"80a92e54e47016d051c7bd55bee9580cbedd298164199d71a6=
7d49167e744432","src/unix/linux_like/linux/musl/b64/x86_64/align.rs":"77309=
276ad7a42cbe59ca381f23590b7a143aded05555b34a5b307b808cbca6e","src/unix/linu=
x_like/linux/musl/b64/x86_64/mod.rs":"032863c74d3ca73cb75483218f9bd774ae1ae=
7d3646d2ffb21e4cc7d4b5e0e3d","src/unix/linux_like/linux/musl/lfs64.rs":"3e4=
fb381f3a0756520bde0f1692d4fa45e4ae8133bf7d7c64b0e3fdd512f235f","src/unix/li=
nux_like/linux/musl/mod.rs":"9bfa05126ad26ecaecb29ba01b6d768e0b5d72e6cfc705=
4e13f0d9365eb5735c","src/unix/linux_like/linux/no_align.rs":"62cdca0e011937=
aaf09a51ca86d9f0ee0fdb05f61ec3c058e6a5d5fa6357d784","src/unix/linux_like/li=
nux/non_exhaustive.rs":"181a05bf94fdb911db83ce793b993bd6548a4115b306a7ef3c1=
0f745a8fea3e9","src/unix/linux_like/linux/uclibc/align.rs":"9ed16138d8e439b=
d90930845a65eafa7ebd67366e6bf633936d44014f6e4c959","src/unix/linux_like/lin=
ux/uclibc/arm/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec725195731=
5afa53a7b9f936","src/unix/linux_like/linux/uclibc/arm/mod.rs":"50288ff9e411=
ab0966da24838f2c2a5618021bc19c422a04f577b2979ef4081e","src/unix/linux_like/=
linux/uclibc/arm/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c=
85a76f8316c86653db25","src/unix/linux_like/linux/uclibc/mips/mips32/align.r=
s":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936","src/=
unix/linux_like/linux/uclibc/mips/mips32/mod.rs":"d0c4434e2bf813372c418a8f5=
16c706cdccc9f7be2f0921b2207b0afdb66fe81","src/unix/linux_like/linux/uclibc/=
mips/mips32/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76=
f8316c86653db25","src/unix/linux_like/linux/uclibc/mips/mips64/align.rs":"a=
7bdcb18a37a2d91e64d5fad83ea3edc78f5412adb28f77ab077dbb26dd08b2d","src/unix/=
linux_like/linux/uclibc/mips/mips64/mod.rs":"3f38ee6a4690b9d7594be20d216467=
a34d955f7653c2c8ce1e6147daeb53f1e0","src/unix/linux_like/linux/uclibc/mips/=
mips64/no_align.rs":"4a18e3875698c85229599225ac3401a2a40da87e77b2ad4ef47c6f=
cd5a24ed30","src/unix/linux_like/linux/uclibc/mips/mod.rs":"a048fce1c2d9b1a=
d57305642e8ad05ca0f0c7e4753267a2e2d6b4fee5db3b072","src/unix/linux_like/lin=
ux/uclibc/mod.rs":"1c3d25cddcfefa2bd17bdc81550826be31a08eef235e13f825f169a5=
029c8bca","src/unix/linux_like/linux/uclibc/no_align.rs":"3f28637046524618a=
daa1012e26cb7ffe94b9396e6b518cccdc69d59f274d709","src/unix/linux_like/linux=
/uclibc/x86_64/l4re.rs":"024eba5753e852dbdd212427351affe7e83f9916c1864bce41=
4d7aa2618f192e","src/unix/linux_like/linux/uclibc/x86_64/mod.rs":"196d03aff=
befb85716937c15904831e731eb222ee906e05e42102d639a8152ea","src/unix/linux_li=
ke/linux/uclibc/x86_64/other.rs":"42c3f71e58cabba373f6a55a623f3c31b85049eb6=
4824c09c2b082b3b2d6a0a8","src/unix/linux_like/mod.rs":"45c98e7a0fad03b03c4c=
76f11a80e2423873f0a6563e35c60309a29b2c8ff44f","src/unix/mod.rs":"dd4ce377ba=
9517182e718848739a5c3f58cdbbcd4ee467eef9aaf8df5aed5053","src/unix/newlib/aa=
rch64/mod.rs":"bac93836a9a57b2c710f32f852e92a4d11ad6759ab0fb6ad33e71d60e532=
78af","src/unix/newlib/align.rs":"28aaf87fafbc6b312622719d472d8cf65f9e5467d=
15339df5f73e66d8502b28a","src/unix/newlib/arm/mod.rs":"cbba6b3e957eceb49680=
6e60de8725a23ff3fa0015983b4b4fa27b233732b526","src/unix/newlib/espidf/mod.r=
s":"816f235f4aa4baabba7f2606b31d0fdb03988c52194c966728de8690bf17299d","src/=
unix/newlib/generic.rs":"eab066d9f0a0f3eb53cc1073d01496bba0110989e1f6a59838=
afd19f870cd599","src/unix/newlib/horizon/mod.rs":"7cc5cc120437421db139bfa6a=
90b18168cd3070bdd0f5be96d40fe4c996f3ca1","src/unix/newlib/mod.rs":"9e36de3f=
d78e10cb6b9a59dc5ebe5a1b44a63ccb91433bb33653fb30d0c303c6","src/unix/newlib/=
no_align.rs":"e0743b2179495a9514bc3a4d1781e492878c4ec834ee0085d0891dd1712e8=
2fb","src/unix/newlib/powerpc/mod.rs":"0202ffd57caf75b6afa2c9717750ffb96e37=
5ac33df0ae9609a3f831be393b67","src/unix/newlib/vita/mod.rs":"68e0ce186b44e0=
b3031eb824710e7454dc2a9df98db98120840c3c6f4d885871","src/unix/no_align.rs":=
"c06e95373b9088266e0b14bba0954eef95f93fb2b01d951855e382d22de78e53","src/uni=
x/nto/aarch64.rs":"4709c9afdc8d583be876598e7c238499ee3e8da5bd2baa614d9c7dd4=
14851555","src/unix/nto/mod.rs":"59ab89a8fb6e0a6d22fa968ed4873c2bafa19a0f60=
a90c9a5148816cb7440889","src/unix/nto/neutrino.rs":"799bff4ab01a6424db6c5a2=
b76aa5679826d41495f9d13c63485bf13bc80026b","src/unix/nto/x86_64.rs":"a3e18e=
93c2999da1cd7a6f748a4b60c07aefb73d8ea2aafec19a84cfb040bc8e","src/unix/redox=
/mod.rs":"73658b0d28c82a122875aa2b45c489834f4de58c378add7932bbaf3ffb2ae789"=
,"src/unix/solarish/compat.rs":"00f1ee3faec9da69204e42f025f6735dd13d894071a=
154425dcc43ecbdd06e7f","src/unix/solarish/illumos.rs":"cd93c2d84722bbf9933a=
92842a8998eb0b2afc962f50bc2546ad127b82809fa7","src/unix/solarish/mod.rs":"b=
1660c631a599a3355116e7485b88ab2f8f2929c2e37851a763431387b902f14","src/unix/=
solarish/solaris.rs":"41b350a89ddf01cd12a10f93640f92be53be0b0d976021cdc08da=
17bf3e72edf","src/unix/solarish/x86.rs":"e86e806df0caed72765040eaa2f3c88319=
8d1aa91508540adf9b7008c77f522e","src/unix/solarish/x86_64.rs":"ec2b01f194eb=
8a6a27133c57681da195a949e03098f3ea1e847227a9c09ef5fc","src/unix/solarish/x8=
6_common.rs":"ac869d9c3c95645c22460468391eb1982023c3a8e02b9e06a72e3aef3d5f1=
eac","src/vxworks/aarch64.rs":"98f0afdc511cd02557e506c21fed6737585490a1dce7=
a9d4941d08c437762b99","src/vxworks/arm.rs":"acb7968ce99fe3f4abdf39d98f8133d=
21a4fba435b8ef7084777cb181d788e88","src/vxworks/mod.rs":"e4edcbcf43a325e738=
c9465507594d0c87abf3f0e2b9b046c1425f8d44bdad0f","src/vxworks/powerpc.rs":"a=
cb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788e88","src/vxwor=
ks/powerpc64.rs":"98f0afdc511cd02557e506c21fed6737585490a1dce7a9d4941d08c43=
7762b99","src/vxworks/x86.rs":"552f007f38317620b23889cb7c49d1d1158412524390=
60122f52f434fbc6e5ba","src/vxworks/x86_64.rs":"018d92be3ad628a129eff9f2f5df=
bc0883d8b8e5f2fa917b900a7f98ed6b514a","src/wasi.rs":"09ee3b3348b212b050f6ca=
8ae008a28679ea44a375674307a4e7c9ca0d3ed7d5","src/windows/gnu/align.rs":"b2c=
13ec1b9f3b39a75c452c80c951dff9d0215e31d77e883b4502afb31794647","src/windows=
/gnu/mod.rs":"3c8c7edb7cdf5d0c44af936db2a94869585c69dfabeef30571b4f4e383757=
67a","src/windows/mod.rs":"9fdc5e1c62c441abef7bc62a7343efb2041edc24db9ac0ef=
c0f74df55b69e249","src/windows/msvc/mod.rs":"c068271e00fca6b62bc4bf44bcf142=
cfc38caeded9b6c4e01d1ceef3ccf986f4","src/xous.rs":"eb0675f25ba01f73072d2b70=
907fb8abb1148facefe5a20756c49250f3d65fae","tests/const_fn.rs":"cb75a1f0864f=
926aebe79118fc34d51a0d1ade2c20a394e7774c7e545f21f1f4"},"package":"9cdc71e17=
332e86d2e1d38c1f99edcb6288ee11b815fb1a4b049eaa2114d369b"}
-\ No newline at end of file
diff --git a/meta/recipes-devtools/rust/files/0002-Ignore-blank-RUSTC_DEBUG=
INFO_MAP-RUSTC_CARGO_REGISTR.patch b/meta/recipes-devtools/rust/files/0002-=
Ignore-blank-RUSTC_DEBUGINFO_MAP-RUSTC_CARGO_REGISTR.patch
new file mode 100644
index 000000000000..ec492a140ebb
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/0002-Ignore-blank-RUSTC_DEBUGINFO_MA=
P-RUSTC_CARGO_REGISTR.patch
@@ -0,0 +1,42 @@
+From 076b352d19191bbe849bd24172ab538e93f9c89f Mon Sep 17 00:00:00 2001
+From: Alex Kiernan <alex.kiernan@gmail.com>
+Date: Sat, 30 Dec 2023 15:15:40 +0000
+Subject: [PATCH 2/2] Ignore blank
+ RUSTC_DEBUGINFO_MAP/RUSTC_CARGO_REGISTRY_SRC_TO_REMAP
+
+If RUSTC_DEBUGINFO_MAP or RUSTC_CARGO_REGISTRY_SRC_TO_REMAP are empty,
+avoid inserting `--remap-path-prefix` with no associated argument.
+
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+Upstream-Status: Submitted [https://github.com/rust-lang/rust/pull/119445]
+---
+ src/bootstrap/src/bin/rustc.rs | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/src/bootstrap/src/bin/rustc.rs b/src/bootstrap/src/bin/rustc.=
rs
+index 070a2da6afb8..0c2c5863f5d7 100644
+--- a/src/bootstrap/src/bin/rustc.rs
++++ b/src/bootstrap/src/bin/rustc.rs
+@@ -125,13 +125,17 @@ fn main() {
+     }
+=20
+     if let Ok(map) =3D env::var("RUSTC_DEBUGINFO_MAP") {
+-        cmd.arg("--remap-path-prefix").arg(&map);
++        if !map.is_empty() {
++            cmd.arg("--remap-path-prefix").arg(&map);
++        }
+     }
+     // The remap flags for Cargo registry sources need to be passed after=
 the remapping for the
+     // Rust source code directory, to handle cases when $CARGO_HOME is in=
side the source directory.
+     if let Ok(maps) =3D env::var("RUSTC_CARGO_REGISTRY_SRC_TO_REMAP") {
+         for map in maps.split('\t') {
+-            cmd.arg("--remap-path-prefix").arg(map);
++            if !map.is_empty() {
++                cmd.arg("--remap-path-prefix").arg(map);
++            }
+         }
+     }
+=20
+--=20
+2.39.0
+
diff --git a/meta/recipes-devtools/rust/files/0002-musl-riscv32-Define-F_SE=
TLK-F_SETLKW-and-fix-F_GETLK.patch b/meta/recipes-devtools/rust/files/0002-=
musl-riscv32-Define-F_SETLK-F_SETLKW-and-fix-F_GETLK.patch
deleted file mode 100644
index 257a83796054..000000000000
--- a/meta/recipes-devtools/rust/files/0002-musl-riscv32-Define-F_SETLK-F_S=
ETLKW-and-fix-F_GETLK.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 36ef860159989c86fbdbb98cbd3827c9a96be6ce Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 8 Apr 2023 08:51:02 -0700
-Subject: [PATCH 2/5] musl/riscv32: Define F_SETLK, F_SETLKW and fix F_GETLK
-
-F_SETLK and F_SETLKW were not defined therefore define them
-and F_GETLK value was not matching the musl port hence fixed
-
-Upstream-Status: Backport [https://github.com/rust-lang/libc/pull/3302/com=
mits/36ef860159989c86fbdbb98cbd3827c9a96be6ce]
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
----
- src/unix/linux_like/linux/musl/b32/riscv32/mod.rs | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-Index: rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/ris=
cv32/mod.rs
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.74.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b32/r=
iscv32/mod.rs
-+++ rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/riscv3=
2/mod.rs
-@@ -323,9 +323,11 @@ pub const POLLWRBAND: ::c_short =3D 512;
- pub const O_ASYNC: ::c_int =3D 8192;
- pub const O_NDELAY: ::c_int =3D 2048;
- pub const EFD_NONBLOCK: ::c_int =3D 2048;
--pub const F_GETLK: ::c_int =3D 5;
--pub const F_GETOWN: ::c_int =3D 9;
- pub const F_SETOWN: ::c_int =3D 8;
-+pub const F_GETOWN: ::c_int =3D 9;
-+pub const F_GETLK: ::c_int =3D 12;
-+pub const F_SETLK: ::c_int =3D 13;
-+pub const F_SETLKW: ::c_int =3D 14;
- pub const SFD_NONBLOCK: ::c_int =3D 2048;
- pub const TCSANOW: ::c_int =3D 0;
- pub const TCSADRAIN: ::c_int =3D 1;
-Index: rustc-1.74.0-src/vendor/libc/.cargo-checksum.json
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.74.0-src.orig/vendor/libc/.cargo-checksum.json
-+++ rustc-1.74.0-src/vendor/libc/.cargo-checksum.json
-@@ -1 +1 @@
--{"files":{"CONTRIBUTING.md":"bdc90b52cf803faac96e594069a86dd8ea150d5ba7fb=
3e6cadfc08dac4c7b0ce","Cargo.toml":"a58e58fa9bde015e08609ea2f17e56c5df7c82a=
a6f3fa1a144c02ee4715227b9","LICENSE-APACHE":"62c7a1e35f56406896d7aa7ca52d0c=
c0d272ac022b5d2796e7d6905db8a3636a","LICENSE-MIT":"a8d47ff51ca256f56a8932db=
a07660672dbfe3004257ca8de708aac1415937a1","README.md":"ecc47e284f8d007fc048=
666d5108dd41cdc440ab9eedfe8c47d1634613522787","build.rs":"9e94683e94db80e82=
82fce07549cf748d9037852fb06df1c7596bea2ed130d50","rustfmt.toml":"eaa2ea84fc=
1ba0359b77680804903e07bb38d257ab11986b95b158e460f787b2","src/fixed_width_in=
ts.rs":"7f986e5f5e68d25ef04d386fd2f640e8be8f15427a8d4a458ea01d26b8dca0ca","=
src/fuchsia/aarch64.rs":"893fcec48142d273063ffd814dca33fbec92205fd39ada9707=
5f85201d803996","src/fuchsia/align.rs":"ae1cf8f011a99737eabeb14ffff768e60f1=
3b13363d7646744dbb0f443dab3d6","src/fuchsia/mod.rs":"30f4dc83ef120300d61896=
696512436377c5f36f1431d98ab7e01e498c0c47d5","src/fuchsia/no_align.rs":"303f=
3f1b255e0088b5715094353cf00476131d8e94e6aebb3f469557771c8b8a","src/fuchsia/=
riscv64.rs":"617cd75e79e0e20f664db764a4dc2a396d9fd11a4d95371acd91ed4811293b=
11","src/fuchsia/x86_64.rs":"93a3632b5cf67d2a6bcb7dc0a558605252d5fe689e0f38=
d8aa2ec5852255ac87","src/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f3=
68ae10ceccefeed9debb3bbe08777fc682","src/hermit/mod.rs":"d3bfce41e4463d4be8=
020a2d063c9bfa8b665f45f1cc6cbf3163f5d01e7cb21f","src/hermit/x86_64.rs":"ab8=
32b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/lib.rs"=
:"24111461547739f3646f95bcb66c43f2ae679a727ff5938299434c522c02e458","src/ma=
cros.rs":"b457eb028b8e8ab3c24bb7292b874ad4e491edbb83594f6a3da024df5348c088"=
,"src/psp.rs":"dd31aabd46171d474ec5828372e28588935120e7355c90c105360d8fa926=
4c1c","src/sgx.rs":"16a95cdefc81c5ee00d8353a60db363c4cc3e0f75abcd5d0144723f=
2a306ed1b","src/solid/aarch64.rs":"a726e47f324adf73a4a0b67a2c183408d0cad105=
ae66acf36db37a42ab7f8707","src/solid/arm.rs":"e39a4f74ebbef3b97b8c95758ad74=
1123d84ed3eb48d9cf4f1f4872097fc27fe","src/solid/mod.rs":"5f4151dca5132e4b4e=
4c23ab9737e12856dddbdc0ca3f7dbc004328ef3c8acde","src/switch.rs":"9da3dd39b3=
de45a7928789926e8572d00e1e11a39e6f7289a1349aadce90edba","src/unix/aix/mod.r=
s":"54229b5e774669c16912112e8b50fa938db76f534971222a11723a05195a0948","src/=
unix/aix/powerpc64.rs":"cf374d81139d45f9d77c6a764f640bfbf7e0a5903689652c829=
6f8e10d55169b","src/unix/align.rs":"2cdc7c826ef7ae61f5171c5ae8c445a743d86f1=
a7f2d9d7e4ceeec56d6874f65","src/unix/bsd/apple/b32/align.rs":"ec833a747866f=
e19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b3=
2/mod.rs":"2546ad3eb6aecb95f916648bc63264117c92b4b4859532b34cb011e4c75a5a72=
","src/unix/bsd/apple/b64/aarch64/align.rs":"2eaf0f561a32bdcbf4e0477c8895d5=
e7bcb5cdebd5fef7b4df2ca8e38e144d94","src/unix/bsd/apple/b64/aarch64/mod.rs"=
:"44c217a4f263afe7a97435de9323d20a96c37836f899ca0925306d4b7e073c27","src/un=
ix/bsd/apple/b64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d1=
5fa68884c40b0e26c","src/unix/bsd/apple/b64/mod.rs":"f5e278a1af7fb358891d1c9=
be4eb7e815aaca0c5cb738d0c3604ba2208a856f7","src/unix/bsd/apple/b64/x86_64/a=
lign.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c"=
,"src/unix/bsd/apple/b64/x86_64/mod.rs":"8c87c5855038aae5d433c8f5eb3b29b0a1=
75879a0245342b3bfd83bdf4cfd936","src/unix/bsd/apple/long_array.rs":"3cf1f19=
b812e6d093c819dc65ce55b13491963e0780eda0d0bd1577603e81948","src/unix/bsd/ap=
ple/mod.rs":"0931fd351d585728e6384d7b952b8d816e9acdb9c86c172324445f3c33f692=
ca","src/unix/bsd/freebsdlike/dragonfly/errno.rs":"8295b8bb0dfd38d2cdb4d919=
2cdeeb534cc6c3b208170e64615fa3e0edb3e578","src/unix/bsd/freebsdlike/dragonf=
ly/mod.rs":"f2e78625fe1eb14f43e730a3987eba888cb8ac04c23008e7c2d2f7c72258b9e=
6","src/unix/bsd/freebsdlike/freebsd/aarch64.rs":"6c8e216385f53a4bf5f171749=
b57602fc34a4e4b160a44ca31c058cb0c8a2126","src/unix/bsd/freebsdlike/freebsd/=
arm.rs":"59d6a670eea562fb87686e243e0a84603d29a2028a3d4b3f99ccc01bd04d2f47",=
"src/unix/bsd/freebsdlike/freebsd/freebsd11/b64.rs":"9808d152c1196aa647f1b0=
f0cf84dac8c930da7d7f897a44975545e3d9d17681","src/unix/bsd/freebsdlike/freeb=
sd/freebsd11/mod.rs":"e243ae0e89623d4fa9f85afe14369cc5fd5f2028ea715773dbec7=
22ba80dac1f","src/unix/bsd/freebsdlike/freebsd/freebsd12/b64.rs":"61cbe45f8=
499bedb168106b686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/free=
bsdlike/freebsd/freebsd12/mod.rs":"bef9fae288a4f29e941ea369be1cd20b170040e6=
0665a4d49a4a9e79009b72d8","src/unix/bsd/freebsdlike/freebsd/freebsd12/x86_6=
4.rs":"2df36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","s=
rc/unix/bsd/freebsdlike/freebsd/freebsd13/b64.rs":"61cbe45f8499bedb168106b6=
86d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd=
/freebsd13/mod.rs":"3c514e037694ce22724abb3c9c4687defda7f0e3456b615ca73593e=
860e38b16","src/unix/bsd/freebsdlike/freebsd/freebsd13/x86_64.rs":"2df36a7f=
122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/fre=
ebsdlike/freebsd/freebsd14/b64.rs":"61cbe45f8499bedb168106b686d4f8239472f25=
c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd14/mod.=
rs":"318abe48bfdd1c74ecd6afbd6c9329c5c72ce4f7d420edd6be2fc12b223ae32f","src=
/unix/bsd/freebsdlike/freebsd/freebsd14/x86_64.rs":"e7b5863e222d6cc416b6b0f=
be71690fad909e899b4c4ae810bbca117e4fcb650","src/unix/bsd/freebsdlike/freebs=
d/mod.rs":"4c3cd57aaf7fbce072e28e0d2d285b5fda9702e924561d2fd01e49e6ee186a98=
","src/unix/bsd/freebsdlike/freebsd/powerpc.rs":"9ca3f82f88974e6db5569f2d76=
a5a3749b248a31747a6c0da5820492bdfeca42","src/unix/bsd/freebsdlike/freebsd/p=
owerpc64.rs":"2dae3ecc87eac3b11657aa98915def55fc4b5c0de11fe26aae23329a54628=
a9a","src/unix/bsd/freebsdlike/freebsd/riscv64.rs":"fa4bed4c58cad24ba339594=
1c7fa6b11e089551a04714f9561078e400f5b2b62","src/unix/bsd/freebsdlike/freebs=
d/x86.rs":"6766e2ce85e187b306cd3b0b8d7e15b8f4042c5cff81d89b3af69ecc99c70ab0=
","src/unix/bsd/freebsdlike/freebsd/x86_64/align.rs":"0e1f69a88fca1c32874b1=
daf5db3d446fefbe518dca497f096cc9168c39dde70","src/unix/bsd/freebsdlike/free=
bsd/x86_64/mod.rs":"51e4dd0c8ae247bb652feda5adad9333ea3bb30c750c3a3935e0b0e=
47d7803eb","src/unix/bsd/freebsdlike/mod.rs":"0eacafac87fb3a32ef1b85980fece=
2792e70eba9856af18a7407cc35be68ea57","src/unix/bsd/mod.rs":"dad51a24a524e92=
bfe9de3ac3b7d394d86058b9b8a1ccd4efa9bbb5c78e7fa1a","src/unix/bsd/netbsdlike=
/mod.rs":"0a66f7de43710e35a6a546e6c39066aa8b91a6efadb71db88738b0a577fd5537"=
,"src/unix/bsd/netbsdlike/netbsd/aarch64.rs":"65dcb58d11e8d8028401a9d07ca3e=
b4cb4f053e04249cc877353449d84ccc4cb","src/unix/bsd/netbsdlike/netbsd/arm.rs=
":"58cdbb70b0d6f536551f0f3bb3725d2d75c4690db12c26c034e7d6ec4a924452","src/u=
nix/bsd/netbsdlike/netbsd/mod.rs":"90dd33ef20dc3be8aef5bd152a6a06e7ab34f952=
7b3978487b593aaa16a907bd","src/unix/bsd/netbsdlike/netbsd/powerpc.rs":"ee7f=
f5d89d0ed22f531237b5059aa669df93a3b5c489fa641465ace8d405bf41","src/unix/bsd=
/netbsdlike/netbsd/sparc64.rs":"9489f4b3e4566f43bb12dfb92238960613dac7f6a45=
cc13068a8d152b902d7d9","src/unix/bsd/netbsdlike/netbsd/x86.rs":"20692320e36=
bfe028d1a34d16fe12ca77aa909cb02bda167376f98f1a09aefe7","src/unix/bsd/netbsd=
like/netbsd/x86_64.rs":"1afe5ef46b14397cdd68664b5b232e4f5b035b6db1d4cf411c8=
99d51ebca9f30","src/unix/bsd/netbsdlike/openbsd/aarch64.rs":"dd91931d373b7e=
caf6e2de25adadee10d16fa9b12c2cbacdff3eb291e1ba36af","src/unix/bsd/netbsdlik=
e/openbsd/arm.rs":"01580d261bc6447bb327a0d982181b7bdabfa066cee65a30373d3ced=
729ad307","src/unix/bsd/netbsdlike/openbsd/mips64.rs":"8532a189ae10c7d668d9=
d4065da8b05d124e09bd39442c9f74a7f231c43eca48","src/unix/bsd/netbsdlike/open=
bsd/mod.rs":"c27c6673bd3628549083a094219831fd9343129f91067b562781617d2a8871=
48","src/unix/bsd/netbsdlike/openbsd/powerpc.rs":"01580d261bc6447bb327a0d98=
2181b7bdabfa066cee65a30373d3ced729ad307","src/unix/bsd/netbsdlike/openbsd/p=
owerpc64.rs":"1dd5449dd1fd3d51e30ffdeeaece91d0aaf05c710e0ac699fecc5461cfa2c=
28e","src/unix/bsd/netbsdlike/openbsd/riscv64.rs":"1dd5449dd1fd3d51e30ffdee=
aece91d0aaf05c710e0ac699fecc5461cfa2c28e","src/unix/bsd/netbsdlike/openbsd/=
sparc64.rs":"d04fd287afbaa2c5df9d48c94e8374a532a3ba491b424ddf018270c7312f40=
85","src/unix/bsd/netbsdlike/openbsd/x86.rs":"6f7f5c4fde2a2259eb547890cbd86=
570cea04ef85347d7569e94e679448bec87","src/unix/bsd/netbsdlike/openbsd/x86_6=
4.rs":"d31db31630289c85af3339dbe357998a21ca584cbae31607448fe2cf7675a4e1","s=
rc/unix/haiku/b32.rs":"a2efdbf7158a6da341e1db9176b0ab193ba88b449616239ed95d=
ced11f54d87b","src/unix/haiku/b64.rs":"ff8115367d3d7d354f792d6176dfaaa26353=
f57056197b563bf4681f91ff7985","src/unix/haiku/mod.rs":"d7ec086b73db4f727991=
79627aa6330a513dcf786b06e19c75ff884d1235948e","src/unix/haiku/native.rs":"d=
bfcbf4954a79d1df2ff58e0590bbcb8c57dfc7a32392aa73ee4726b66bd6cc8","src/unix/=
haiku/x86_64.rs":"3ec3aeeb7ed208b8916f3e32d42bfd085ff5e16936a1a35d9a52789f0=
43b7237","src/unix/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae10=
ceccefeed9debb3bbe08777fc682","src/unix/hermit/mod.rs":"a1494a0bddf301cceb0=
d9b8529a84b5882fe855ceae77a1c4e8d6034e705e26c","src/unix/hermit/x86_64.rs":=
"ab832b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/uni=
x/linux_like/android/b32/arm.rs":"ce582de7e983a33d3bfad13075c53aac9016cee35=
f06ad8653ee9072c3ec2564","src/unix/linux_like/android/b32/mod.rs":"7c173e03=
75119bf06a3081652faede95e5bcd6858e7576b7533d037978737c8f","src/unix/linux_l=
ike/android/b32/x86/align.rs":"812914e4241df82e32b12375ca3374615dc3a4bdd4cf=
31f0423c5815320c0dab","src/unix/linux_like/android/b32/x86/mod.rs":"e6d107e=
fbcd37b5b85dfa18f683300cbf768ffa0237997a9fa52b184a53323ac","src/unix/linux_=
like/android/b64/aarch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3ee2faf=
6fcae3770f9e505cddca35c7b","src/unix/linux_like/android/b64/aarch64/int128.=
rs":"1735f6f5c56770d20dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de","src=
/unix/linux_like/android/b64/aarch64/mod.rs":"10e963e29ff209703de6336c99cca=
96fd79789438d34c82a693eae56e8916c3c","src/unix/linux_like/android/b64/mod.r=
s":"71e4fcbe952bfa4a5f9022f3972e906917b38f729b9d8ef57cd5d179104894ac","src/=
unix/linux_like/android/b64/riscv64/align.rs":"0bf138f84e5327d8339bcd4adf07=
1a6832b516445e597552c82bbd881095e3a8","src/unix/linux_like/android/b64/risc=
v64/mod.rs":"19d4bf2237c47127eba9144e0b82e995bc079315e719179a91813b0ae7b0e4=
9d","src/unix/linux_like/android/b64/x86_64/align.rs":"7169d07a9fd4716f7512=
719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/android/=
b64/x86_64/mod.rs":"4ec2de11a9b65c4325b7b991f0b99a414975e0e61ba8668caca5d92=
1e9b314d1","src/unix/linux_like/android/mod.rs":"66a9e38a47493a42b3b1c32552=
4f3c944e74d1e3e8ecce3cc276ec08fecab13b","src/unix/linux_like/emscripten/ali=
gn.rs":"86c95cbed7a7161b1f23ee06843e7b0e2340ad92b2cb86fe2a8ef3e0e8c36216","=
src/unix/linux_like/emscripten/mod.rs":"67d6b90f539f746aa3290ea7f9d3f3f8d2d=
8a6557233584004ed5697f7821a50","src/unix/linux_like/emscripten/no_align.rs"=
:"0128e4aa721a9902754828b61b5ec7d8a86619983ed1e0544a85d35b1051fad6","src/un=
ix/linux_like/linux/align.rs":"bc5abcd38e2320171e0981e773c9c5fe3e0d5a66fdff=
049228f6a1acad80ef8b","src/unix/linux_like/linux/arch/generic/mod.rs":"fb5d=
e1368cabae03d3ea0152159b7685a9d91efdecee4c5b83efc085ffef8a73","src/unix/lin=
ux_like/linux/arch/mips/mod.rs":"75814e198d1a9a6808be3a5e5edb1bfdc57f75b063=
94e9040739be363c09d82f","src/unix/linux_like/linux/arch/mod.rs":"5bd5361f8a=
6ab4e18bbba6da9f92c164ae252b15a0ed10064812544aa1fdf198","src/unix/linux_lik=
e/linux/arch/powerpc/mod.rs":"bef6b7af9e5e2b4e5545c9c7e3e23a8b743277a0ed958=
53e7eddc38e44299f02","src/unix/linux_like/linux/arch/sparc/mod.rs":"91593ec=
0440f1dd8f8e612028f432c44c14089286e2aca50e10511ab942db8c3","src/unix/linux_=
like/linux/gnu/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec72519573=
15afa53a7b9f936","src/unix/linux_like/linux/gnu/b32/arm/align.rs":"6ec0eb3e=
e93f7ae99fd714b4deabfb5e97fbcefd8c26f5a45fb8e7150899cdeb","src/unix/linux_l=
ike/linux/gnu/b32/arm/mod.rs":"9ab3e97b579a9122690cd01026e14528862860346b70=
0aafbb755a7e04054f7f","src/unix/linux_like/linux/gnu/b32/csky/align.rs":"3f=
ed009dc9af3cc81be7087da9d2d7d1f39845e4497e290259c5cdbae25f039d","src/unix/l=
inux_like/linux/gnu/b32/csky/mod.rs":"4c21d6e7463bb22f00b984294893d12c84018=
d5d26ec661d6a30f4a9625ba639","src/unix/linux_like/linux/gnu/b32/m68k/align.=
rs":"8faa92f77a9232c035418d45331774e64a9a841d99c91791570a203bf2b45bcb","src=
/unix/linux_like/linux/gnu/b32/m68k/mod.rs":"6aab7f1b864e9691d14aa7d389f717=
c4077b8eed72a7f11e3b8c7fef245e4046","src/unix/linux_like/linux/gnu/b32/mips=
/align.rs":"429fb5e005cb7143602d430098b6ebfb7d360685b194f333dfd587472ae954e=
e","src/unix/linux_like/linux/gnu/b32/mips/mod.rs":"6b9a5dac6f937ddc1453e80=
8e3c43502c87143332df9e43ac64fb8b1eda6c116","src/unix/linux_like/linux/gnu/b=
32/mod.rs":"b56625dd20dd48a8699034d349ef089c540c0ddcbf8a3481d598d101f8b40b7=
8","src/unix/linux_like/linux/gnu/b32/powerpc.rs":"5c5d90326b54b57b98eff474=
5fe7a3fb02f053b2dc782241a73e807b491936a3","src/unix/linux_like/linux/gnu/b3=
2/riscv32/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd37543ef=
e86621b119","src/unix/linux_like/linux/gnu/b32/riscv32/mod.rs":"491a9a97cf7=
12985b75d3ad714691ef60898d88c78bc386a6917de0a6774cc26","src/unix/linux_like=
/linux/gnu/b32/sparc/align.rs":"21adbed27df73e2d1ed934aaf733a643003d7baf2bd=
e9c48ea440895bcca6d41","src/unix/linux_like/linux/gnu/b32/sparc/mod.rs":"80=
894eece66e9348f45d1b07ad37c757ea694bbd10ed49d3f920b34e9f51a9a3","src/unix/l=
inux_like/linux/gnu/b32/x86/align.rs":"e4bafdc4a519a7922a81b37a62bbfd1177a2=
f620890eef8f1fbc47162e9eb413","src/unix/linux_like/linux/gnu/b32/x86/mod.rs=
":"c703cc5e9de2dc31d9e5831bfb6f354d6e3518b2ae02263f68a9a70f1c0167e2","src/u=
nix/linux_like/linux/gnu/b64/aarch64/align.rs":"fdf1c72375a2167699157e0dd82=
5422690bb6719f7bc69515a2e5846d0431d7c","src/unix/linux_like/linux/gnu/b64/a=
arch64/fallback.rs":"832e7487249c1c0bb6e9911ce3f7d32ca22378e42392ab83c56915=
cbc59d8be3","src/unix/linux_like/linux/gnu/b64/aarch64/ilp32.rs":"bf4611b73=
7813deef6787babf6c01698605f3b75482269b8546318667bc68e29","src/unix/linux_li=
ke/linux/gnu/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426442f09724d9b2052=
b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/gnu/b64/aarch64/lp64=
.rs":"11a950697fdda0258c6e37c6b13993348c8de4134105ed4faa79358e53175072","sr=
c/unix/linux_like/linux/gnu/b64/aarch64/mod.rs":"172495fbfdf659b9b825148bff=
c2b62704f63fc872428617e868eb15802c9978","src/unix/linux_like/linux/gnu/b64/=
loongarch64/align.rs":"060aa33cc737966c691aab8511c5c5729e551458ce18d0e284e0=
d45f39beeb60","src/unix/linux_like/linux/gnu/b64/loongarch64/mod.rs":"18eda=
da8aa5d4127d9aa1bd81c62b5a4209f1efd8b2b2631e801c9e855ab1480","src/unix/linu=
x_like/linux/gnu/b64/mips64/align.rs":"7169d07a9fd4716f7512719aec9fda5d8bed=
306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/linux/gnu/b64/mips64/mod=
.rs":"628c410b9aaec3c8f43838a28616b577a1d6de60a9799b09bb884d80281f96eb","sr=
c/unix/linux_like/linux/gnu/b64/mod.rs":"6a160ef25439c4fecdb0e3bd0b81874226=
3c791364da874d4febd3aa644ec8e2","src/unix/linux_like/linux/gnu/b64/powerpc6=
4/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268130=
d9","src/unix/linux_like/linux/gnu/b64/powerpc64/mod.rs":"c778a136f06c2ffea=
cea19fa14ce79b828f91b67a002dec5ce87289bae36234e","src/unix/linux_like/linux=
/gnu/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd=
37543efe86621b119","src/unix/linux_like/linux/gnu/b64/riscv64/mod.rs":"c8f0=
7efc5ddd5d874f1ebc329cd6907818d132ac3e30f4f2a4b04be3fb388551","src/unix/lin=
ux_like/linux/gnu/b64/s390x.rs":"a2fd9277c2dcf76f7a16a3bcca745d5a9932c765c0=
dc2feb31c3641be25eb0aa","src/unix/linux_like/linux/gnu/b64/sparc64/align.rs=
":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268130d9","src/u=
nix/linux_like/linux/gnu/b64/sparc64/mod.rs":"e8047e9966a2b90063e0151a0278c=
54885e7b323286cf5ab55cbaf151fc772d3","src/unix/linux_like/linux/gnu/b64/x86=
_64/align.rs":"62e822478356db4a73b6bbd1b36d825b893939ab4b308ec11b0578bcc4b4=
9769","src/unix/linux_like/linux/gnu/b64/x86_64/mod.rs":"891e595d33714b9883=
b92f0554d1d361fba2b6c3f6cac09a288252f44c6ec667","src/unix/linux_like/linux/=
gnu/b64/x86_64/not_x32.rs":"38f74ce15d9662ce4818815a2b87be1618d5e45f190f7e4=
db84ff3285b4421fb","src/unix/linux_like/linux/gnu/b64/x86_64/x32.rs":"b2021=
8a11364a6dec87f96d6c0d8b19e660697ab09ad5ee0e9b3a9dafedaaebb","src/unix/linu=
x_like/linux/gnu/mod.rs":"47dd970aedda9c70429741d7c9892a0d5d264e9abcb1c41d5=
bb913a86f0a5362","src/unix/linux_like/linux/gnu/no_align.rs":"9cd223135de75=
315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/linux_like/l=
inux/mod.rs":"1582c09db7b752af0f796a4cba8aa2bb4ecea895c551a2219e76047bcce74=
a23","src/unix/linux_like/linux/musl/b32/arm/align.rs":"3e8ac052c1043764776=
b54c93ba4260e061df998631737a897d9d47d54f7b80c","src/unix/linux_like/linux/m=
usl/b32/arm/mod.rs":"b63a21b02ff1f55e3aca71af51a054d61fd2b4b452ccbf9f34acb4=
31c51d00ea","src/unix/linux_like/linux/musl/b32/hexagon.rs":"f0b9505a5935f5=
fd163eebaa14d4c18ff948c4b199b03e5b88c91f99d4b0fce6","src/unix/linux_like/li=
nux/musl/b32/mips/align.rs":"429fb5e005cb7143602d430098b6ebfb7d360685b194f3=
33dfd587472ae954ee","src/unix/linux_like/linux/musl/b32/mips/mod.rs":"9b6df=
c603accb6ef68010573f30b015868a1da1e1fc3ea2dc0337f33b4015ec6","src/unix/linu=
x_like/linux/musl/b32/mod.rs":"31677597fd9544c4b1ec1477628288f6273fabbc06e3=
8f33da862ad55f019ce1","src/unix/linux_like/linux/musl/b32/powerpc.rs":"0ebe=
9c42bb746583360d990d5a63a407075be3c7bdd260e5345e8aeac4d060cc","src/unix/lin=
ux_like/linux/musl/b32/riscv32/align.rs":"efd2accf33b87de7c7547903359a5da89=
6edc33cd6c719552c7474b60d4a5d48","src/unix/linux_like/linux/musl/b32/riscv3=
2/mod.rs":"7b067c7989a80e35daa9987af799d97dd1fb3df71ef82285137f51fbad2354d9=
","src/unix/linux_like/linux/musl/b32/x86/align.rs":"08e77fbd7435d7dec2ff56=
932433bece3f02e47ce810f89004a275a86d39cbe1","src/unix/linux_like/linux/musl=
/b32/x86/mod.rs":"9283e5d343aa668a6c2e520fb7db2548f344f1f5adf63ec7961954b61=
e6f6fad","src/unix/linux_like/linux/musl/b64/aarch64/align.rs":"6ba32725d24=
d7d8e6aa111f3b57aafa318f83b606abe96561329151829821133","src/unix/linux_like=
/linux/musl/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426442f09724d9b2052b=
46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/musl/b64/aarch64/mod.=
rs":"31e75179cbb4e26425b3f5b052e358f593153da662884655e60801d852e55dc2","src=
/unix/linux_like/linux/musl/b64/mips64.rs":"9a5d29f666332bb056d0e2951e9de98=
9aa1dc016075f009db3f2f628e0cdda8c","src/unix/linux_like/linux/musl/b64/mod.=
rs":"8275e7a108c71f180de71b86f74baa1e35d9e915befb8ab8191d2a2fe76d3bb9","src=
/unix/linux_like/linux/musl/b64/powerpc64.rs":"e77f4cf5d65320023043e4354725=
397f6b079c1b7b6b3cef2c3293350b46b303","src/unix/linux_like/linux/musl/b64/r=
iscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd37543efe86=
621b119","src/unix/linux_like/linux/musl/b64/riscv64/mod.rs":"a80b1813148de=
c8bc396c02638978c0b4e5e040edafd56d98f8683fe2ae51ab5","src/unix/linux_like/l=
inux/musl/b64/s390x.rs":"80a92e54e47016d051c7bd55bee9580cbedd298164199d71a6=
7d49167e744432","src/unix/linux_like/linux/musl/b64/x86_64/align.rs":"77309=
276ad7a42cbe59ca381f23590b7a143aded05555b34a5b307b808cbca6e","src/unix/linu=
x_like/linux/musl/b64/x86_64/mod.rs":"032863c74d3ca73cb75483218f9bd774ae1ae=
7d3646d2ffb21e4cc7d4b5e0e3d","src/unix/linux_like/linux/musl/lfs64.rs":"3e4=
fb381f3a0756520bde0f1692d4fa45e4ae8133bf7d7c64b0e3fdd512f235f","src/unix/li=
nux_like/linux/musl/mod.rs":"9bfa05126ad26ecaecb29ba01b6d768e0b5d72e6cfc705=
4e13f0d9365eb5735c","src/unix/linux_like/linux/no_align.rs":"62cdca0e011937=
aaf09a51ca86d9f0ee0fdb05f61ec3c058e6a5d5fa6357d784","src/unix/linux_like/li=
nux/non_exhaustive.rs":"181a05bf94fdb911db83ce793b993bd6548a4115b306a7ef3c1=
0f745a8fea3e9","src/unix/linux_like/linux/uclibc/align.rs":"9ed16138d8e439b=
d90930845a65eafa7ebd67366e6bf633936d44014f6e4c959","src/unix/linux_like/lin=
ux/uclibc/arm/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec725195731=
5afa53a7b9f936","src/unix/linux_like/linux/uclibc/arm/mod.rs":"50288ff9e411=
ab0966da24838f2c2a5618021bc19c422a04f577b2979ef4081e","src/unix/linux_like/=
linux/uclibc/arm/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c=
85a76f8316c86653db25","src/unix/linux_like/linux/uclibc/mips/mips32/align.r=
s":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936","src/=
unix/linux_like/linux/uclibc/mips/mips32/mod.rs":"d0c4434e2bf813372c418a8f5=
16c706cdccc9f7be2f0921b2207b0afdb66fe81","src/unix/linux_like/linux/uclibc/=
mips/mips32/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76=
f8316c86653db25","src/unix/linux_like/linux/uclibc/mips/mips64/align.rs":"a=
7bdcb18a37a2d91e64d5fad83ea3edc78f5412adb28f77ab077dbb26dd08b2d","src/unix/=
linux_like/linux/uclibc/mips/mips64/mod.rs":"3f38ee6a4690b9d7594be20d216467=
a34d955f7653c2c8ce1e6147daeb53f1e0","src/unix/linux_like/linux/uclibc/mips/=
mips64/no_align.rs":"4a18e3875698c85229599225ac3401a2a40da87e77b2ad4ef47c6f=
cd5a24ed30","src/unix/linux_like/linux/uclibc/mips/mod.rs":"a048fce1c2d9b1a=
d57305642e8ad05ca0f0c7e4753267a2e2d6b4fee5db3b072","src/unix/linux_like/lin=
ux/uclibc/mod.rs":"1c3d25cddcfefa2bd17bdc81550826be31a08eef235e13f825f169a5=
029c8bca","src/unix/linux_like/linux/uclibc/no_align.rs":"3f28637046524618a=
daa1012e26cb7ffe94b9396e6b518cccdc69d59f274d709","src/unix/linux_like/linux=
/uclibc/x86_64/l4re.rs":"024eba5753e852dbdd212427351affe7e83f9916c1864bce41=
4d7aa2618f192e","src/unix/linux_like/linux/uclibc/x86_64/mod.rs":"196d03aff=
befb85716937c15904831e731eb222ee906e05e42102d639a8152ea","src/unix/linux_li=
ke/linux/uclibc/x86_64/other.rs":"42c3f71e58cabba373f6a55a623f3c31b85049eb6=
4824c09c2b082b3b2d6a0a8","src/unix/linux_like/mod.rs":"45c98e7a0fad03b03c4c=
76f11a80e2423873f0a6563e35c60309a29b2c8ff44f","src/unix/mod.rs":"dd4ce377ba=
9517182e718848739a5c3f58cdbbcd4ee467eef9aaf8df5aed5053","src/unix/newlib/aa=
rch64/mod.rs":"bac93836a9a57b2c710f32f852e92a4d11ad6759ab0fb6ad33e71d60e532=
78af","src/unix/newlib/align.rs":"28aaf87fafbc6b312622719d472d8cf65f9e5467d=
15339df5f73e66d8502b28a","src/unix/newlib/arm/mod.rs":"cbba6b3e957eceb49680=
6e60de8725a23ff3fa0015983b4b4fa27b233732b526","src/unix/newlib/espidf/mod.r=
s":"816f235f4aa4baabba7f2606b31d0fdb03988c52194c966728de8690bf17299d","src/=
unix/newlib/generic.rs":"eab066d9f0a0f3eb53cc1073d01496bba0110989e1f6a59838=
afd19f870cd599","src/unix/newlib/horizon/mod.rs":"7cc5cc120437421db139bfa6a=
90b18168cd3070bdd0f5be96d40fe4c996f3ca1","src/unix/newlib/mod.rs":"9e36de3f=
d78e10cb6b9a59dc5ebe5a1b44a63ccb91433bb33653fb30d0c303c6","src/unix/newlib/=
no_align.rs":"e0743b2179495a9514bc3a4d1781e492878c4ec834ee0085d0891dd1712e8=
2fb","src/unix/newlib/powerpc/mod.rs":"0202ffd57caf75b6afa2c9717750ffb96e37=
5ac33df0ae9609a3f831be393b67","src/unix/newlib/vita/mod.rs":"68e0ce186b44e0=
b3031eb824710e7454dc2a9df98db98120840c3c6f4d885871","src/unix/no_align.rs":=
"c06e95373b9088266e0b14bba0954eef95f93fb2b01d951855e382d22de78e53","src/uni=
x/nto/aarch64.rs":"4709c9afdc8d583be876598e7c238499ee3e8da5bd2baa614d9c7dd4=
14851555","src/unix/nto/mod.rs":"59ab89a8fb6e0a6d22fa968ed4873c2bafa19a0f60=
a90c9a5148816cb7440889","src/unix/nto/neutrino.rs":"799bff4ab01a6424db6c5a2=
b76aa5679826d41495f9d13c63485bf13bc80026b","src/unix/nto/x86_64.rs":"a3e18e=
93c2999da1cd7a6f748a4b60c07aefb73d8ea2aafec19a84cfb040bc8e","src/unix/redox=
/mod.rs":"73658b0d28c82a122875aa2b45c489834f4de58c378add7932bbaf3ffb2ae789"=
,"src/unix/solarish/compat.rs":"00f1ee3faec9da69204e42f025f6735dd13d894071a=
154425dcc43ecbdd06e7f","src/unix/solarish/illumos.rs":"cd93c2d84722bbf9933a=
92842a8998eb0b2afc962f50bc2546ad127b82809fa7","src/unix/solarish/mod.rs":"b=
1660c631a599a3355116e7485b88ab2f8f2929c2e37851a763431387b902f14","src/unix/=
solarish/solaris.rs":"41b350a89ddf01cd12a10f93640f92be53be0b0d976021cdc08da=
17bf3e72edf","src/unix/solarish/x86.rs":"e86e806df0caed72765040eaa2f3c88319=
8d1aa91508540adf9b7008c77f522e","src/unix/solarish/x86_64.rs":"ec2b01f194eb=
8a6a27133c57681da195a949e03098f3ea1e847227a9c09ef5fc","src/unix/solarish/x8=
6_common.rs":"ac869d9c3c95645c22460468391eb1982023c3a8e02b9e06a72e3aef3d5f1=
eac","src/vxworks/aarch64.rs":"98f0afdc511cd02557e506c21fed6737585490a1dce7=
a9d4941d08c437762b99","src/vxworks/arm.rs":"acb7968ce99fe3f4abdf39d98f8133d=
21a4fba435b8ef7084777cb181d788e88","src/vxworks/mod.rs":"e4edcbcf43a325e738=
c9465507594d0c87abf3f0e2b9b046c1425f8d44bdad0f","src/vxworks/powerpc.rs":"a=
cb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788e88","src/vxwor=
ks/powerpc64.rs":"98f0afdc511cd02557e506c21fed6737585490a1dce7a9d4941d08c43=
7762b99","src/vxworks/x86.rs":"552f007f38317620b23889cb7c49d1d1158412524390=
60122f52f434fbc6e5ba","src/vxworks/x86_64.rs":"018d92be3ad628a129eff9f2f5df=
bc0883d8b8e5f2fa917b900a7f98ed6b514a","src/wasi.rs":"09ee3b3348b212b050f6ca=
8ae008a28679ea44a375674307a4e7c9ca0d3ed7d5","src/windows/gnu/align.rs":"b2c=
13ec1b9f3b39a75c452c80c951dff9d0215e31d77e883b4502afb31794647","src/windows=
/gnu/mod.rs":"3c8c7edb7cdf5d0c44af936db2a94869585c69dfabeef30571b4f4e383757=
67a","src/windows/mod.rs":"9fdc5e1c62c441abef7bc62a7343efb2041edc24db9ac0ef=
c0f74df55b69e249","src/windows/msvc/mod.rs":"c068271e00fca6b62bc4bf44bcf142=
cfc38caeded9b6c4e01d1ceef3ccf986f4","src/xous.rs":"eb0675f25ba01f73072d2b70=
907fb8abb1148facefe5a20756c49250f3d65fae","tests/const_fn.rs":"cb75a1f0864f=
926aebe79118fc34d51a0d1ade2c20a394e7774c7e545f21f1f4"},"package":"9cdc71e17=
332e86d2e1d38c1f99edcb6288ee11b815fb1a4b049eaa2114d369b"}
-\ No newline at end of file
-+{"files":{"CONTRIBUTING.md":"bdc90b52cf803faac96e594069a86dd8ea150d5ba7fb=
3e6cadfc08dac4c7b0ce","Cargo.toml":"a58e58fa9bde015e08609ea2f17e56c5df7c82a=
a6f3fa1a144c02ee4715227b9","LICENSE-APACHE":"62c7a1e35f56406896d7aa7ca52d0c=
c0d272ac022b5d2796e7d6905db8a3636a","LICENSE-MIT":"a8d47ff51ca256f56a8932db=
a07660672dbfe3004257ca8de708aac1415937a1","README.md":"ecc47e284f8d007fc048=
666d5108dd41cdc440ab9eedfe8c47d1634613522787","build.rs":"9e94683e94db80e82=
82fce07549cf748d9037852fb06df1c7596bea2ed130d50","rustfmt.toml":"eaa2ea84fc=
1ba0359b77680804903e07bb38d257ab11986b95b158e460f787b2","src/fixed_width_in=
ts.rs":"7f986e5f5e68d25ef04d386fd2f640e8be8f15427a8d4a458ea01d26b8dca0ca","=
src/fuchsia/aarch64.rs":"893fcec48142d273063ffd814dca33fbec92205fd39ada9707=
5f85201d803996","src/fuchsia/align.rs":"ae1cf8f011a99737eabeb14ffff768e60f1=
3b13363d7646744dbb0f443dab3d6","src/fuchsia/mod.rs":"30f4dc83ef120300d61896=
696512436377c5f36f1431d98ab7e01e498c0c47d5","src/fuchsia/no_align.rs":"303f=
3f1b255e0088b5715094353cf00476131d8e94e6aebb3f469557771c8b8a","src/fuchsia/=
riscv64.rs":"617cd75e79e0e20f664db764a4dc2a396d9fd11a4d95371acd91ed4811293b=
11","src/fuchsia/x86_64.rs":"93a3632b5cf67d2a6bcb7dc0a558605252d5fe689e0f38=
d8aa2ec5852255ac87","src/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f3=
68ae10ceccefeed9debb3bbe08777fc682","src/hermit/mod.rs":"d3bfce41e4463d4be8=
020a2d063c9bfa8b665f45f1cc6cbf3163f5d01e7cb21f","src/hermit/x86_64.rs":"ab8=
32b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/lib.rs"=
:"24111461547739f3646f95bcb66c43f2ae679a727ff5938299434c522c02e458","src/ma=
cros.rs":"b457eb028b8e8ab3c24bb7292b874ad4e491edbb83594f6a3da024df5348c088"=
,"src/psp.rs":"dd31aabd46171d474ec5828372e28588935120e7355c90c105360d8fa926=
4c1c","src/sgx.rs":"16a95cdefc81c5ee00d8353a60db363c4cc3e0f75abcd5d0144723f=
2a306ed1b","src/solid/aarch64.rs":"a726e47f324adf73a4a0b67a2c183408d0cad105=
ae66acf36db37a42ab7f8707","src/solid/arm.rs":"e39a4f74ebbef3b97b8c95758ad74=
1123d84ed3eb48d9cf4f1f4872097fc27fe","src/solid/mod.rs":"5f4151dca5132e4b4e=
4c23ab9737e12856dddbdc0ca3f7dbc004328ef3c8acde","src/switch.rs":"9da3dd39b3=
de45a7928789926e8572d00e1e11a39e6f7289a1349aadce90edba","src/unix/aix/mod.r=
s":"54229b5e774669c16912112e8b50fa938db76f534971222a11723a05195a0948","src/=
unix/aix/powerpc64.rs":"cf374d81139d45f9d77c6a764f640bfbf7e0a5903689652c829=
6f8e10d55169b","src/unix/align.rs":"2cdc7c826ef7ae61f5171c5ae8c445a743d86f1=
a7f2d9d7e4ceeec56d6874f65","src/unix/bsd/apple/b32/align.rs":"ec833a747866f=
e19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b3=
2/mod.rs":"2546ad3eb6aecb95f916648bc63264117c92b4b4859532b34cb011e4c75a5a72=
","src/unix/bsd/apple/b64/aarch64/align.rs":"2eaf0f561a32bdcbf4e0477c8895d5=
e7bcb5cdebd5fef7b4df2ca8e38e144d94","src/unix/bsd/apple/b64/aarch64/mod.rs"=
:"44c217a4f263afe7a97435de9323d20a96c37836f899ca0925306d4b7e073c27","src/un=
ix/bsd/apple/b64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d1=
5fa68884c40b0e26c","src/unix/bsd/apple/b64/mod.rs":"f5e278a1af7fb358891d1c9=
be4eb7e815aaca0c5cb738d0c3604ba2208a856f7","src/unix/bsd/apple/b64/x86_64/a=
lign.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c"=
,"src/unix/bsd/apple/b64/x86_64/mod.rs":"8c87c5855038aae5d433c8f5eb3b29b0a1=
75879a0245342b3bfd83bdf4cfd936","src/unix/bsd/apple/long_array.rs":"3cf1f19=
b812e6d093c819dc65ce55b13491963e0780eda0d0bd1577603e81948","src/unix/bsd/ap=
ple/mod.rs":"0931fd351d585728e6384d7b952b8d816e9acdb9c86c172324445f3c33f692=
ca","src/unix/bsd/freebsdlike/dragonfly/errno.rs":"8295b8bb0dfd38d2cdb4d919=
2cdeeb534cc6c3b208170e64615fa3e0edb3e578","src/unix/bsd/freebsdlike/dragonf=
ly/mod.rs":"f2e78625fe1eb14f43e730a3987eba888cb8ac04c23008e7c2d2f7c72258b9e=
6","src/unix/bsd/freebsdlike/freebsd/aarch64.rs":"6c8e216385f53a4bf5f171749=
b57602fc34a4e4b160a44ca31c058cb0c8a2126","src/unix/bsd/freebsdlike/freebsd/=
arm.rs":"59d6a670eea562fb87686e243e0a84603d29a2028a3d4b3f99ccc01bd04d2f47",=
"src/unix/bsd/freebsdlike/freebsd/freebsd11/b64.rs":"9808d152c1196aa647f1b0=
f0cf84dac8c930da7d7f897a44975545e3d9d17681","src/unix/bsd/freebsdlike/freeb=
sd/freebsd11/mod.rs":"e243ae0e89623d4fa9f85afe14369cc5fd5f2028ea715773dbec7=
22ba80dac1f","src/unix/bsd/freebsdlike/freebsd/freebsd12/b64.rs":"61cbe45f8=
499bedb168106b686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/free=
bsdlike/freebsd/freebsd12/mod.rs":"bef9fae288a4f29e941ea369be1cd20b170040e6=
0665a4d49a4a9e79009b72d8","src/unix/bsd/freebsdlike/freebsd/freebsd12/x86_6=
4.rs":"2df36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","s=
rc/unix/bsd/freebsdlike/freebsd/freebsd13/b64.rs":"61cbe45f8499bedb168106b6=
86d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd=
/freebsd13/mod.rs":"3c514e037694ce22724abb3c9c4687defda7f0e3456b615ca73593e=
860e38b16","src/unix/bsd/freebsdlike/freebsd/freebsd13/x86_64.rs":"2df36a7f=
122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/fre=
ebsdlike/freebsd/freebsd14/b64.rs":"61cbe45f8499bedb168106b686d4f8239472f25=
c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd14/mod.=
rs":"318abe48bfdd1c74ecd6afbd6c9329c5c72ce4f7d420edd6be2fc12b223ae32f","src=
/unix/bsd/freebsdlike/freebsd/freebsd14/x86_64.rs":"e7b5863e222d6cc416b6b0f=
be71690fad909e899b4c4ae810bbca117e4fcb650","src/unix/bsd/freebsdlike/freebs=
d/mod.rs":"4c3cd57aaf7fbce072e28e0d2d285b5fda9702e924561d2fd01e49e6ee186a98=
","src/unix/bsd/freebsdlike/freebsd/powerpc.rs":"9ca3f82f88974e6db5569f2d76=
a5a3749b248a31747a6c0da5820492bdfeca42","src/unix/bsd/freebsdlike/freebsd/p=
owerpc64.rs":"2dae3ecc87eac3b11657aa98915def55fc4b5c0de11fe26aae23329a54628=
a9a","src/unix/bsd/freebsdlike/freebsd/riscv64.rs":"fa4bed4c58cad24ba339594=
1c7fa6b11e089551a04714f9561078e400f5b2b62","src/unix/bsd/freebsdlike/freebs=
d/x86.rs":"6766e2ce85e187b306cd3b0b8d7e15b8f4042c5cff81d89b3af69ecc99c70ab0=
","src/unix/bsd/freebsdlike/freebsd/x86_64/align.rs":"0e1f69a88fca1c32874b1=
daf5db3d446fefbe518dca497f096cc9168c39dde70","src/unix/bsd/freebsdlike/free=
bsd/x86_64/mod.rs":"51e4dd0c8ae247bb652feda5adad9333ea3bb30c750c3a3935e0b0e=
47d7803eb","src/unix/bsd/freebsdlike/mod.rs":"0eacafac87fb3a32ef1b85980fece=
2792e70eba9856af18a7407cc35be68ea57","src/unix/bsd/mod.rs":"dad51a24a524e92=
bfe9de3ac3b7d394d86058b9b8a1ccd4efa9bbb5c78e7fa1a","src/unix/bsd/netbsdlike=
/mod.rs":"0a66f7de43710e35a6a546e6c39066aa8b91a6efadb71db88738b0a577fd5537"=
,"src/unix/bsd/netbsdlike/netbsd/aarch64.rs":"65dcb58d11e8d8028401a9d07ca3e=
b4cb4f053e04249cc877353449d84ccc4cb","src/unix/bsd/netbsdlike/netbsd/arm.rs=
":"58cdbb70b0d6f536551f0f3bb3725d2d75c4690db12c26c034e7d6ec4a924452","src/u=
nix/bsd/netbsdlike/netbsd/mod.rs":"90dd33ef20dc3be8aef5bd152a6a06e7ab34f952=
7b3978487b593aaa16a907bd","src/unix/bsd/netbsdlike/netbsd/powerpc.rs":"ee7f=
f5d89d0ed22f531237b5059aa669df93a3b5c489fa641465ace8d405bf41","src/unix/bsd=
/netbsdlike/netbsd/sparc64.rs":"9489f4b3e4566f43bb12dfb92238960613dac7f6a45=
cc13068a8d152b902d7d9","src/unix/bsd/netbsdlike/netbsd/x86.rs":"20692320e36=
bfe028d1a34d16fe12ca77aa909cb02bda167376f98f1a09aefe7","src/unix/bsd/netbsd=
like/netbsd/x86_64.rs":"1afe5ef46b14397cdd68664b5b232e4f5b035b6db1d4cf411c8=
99d51ebca9f30","src/unix/bsd/netbsdlike/openbsd/aarch64.rs":"dd91931d373b7e=
caf6e2de25adadee10d16fa9b12c2cbacdff3eb291e1ba36af","src/unix/bsd/netbsdlik=
e/openbsd/arm.rs":"01580d261bc6447bb327a0d982181b7bdabfa066cee65a30373d3ced=
729ad307","src/unix/bsd/netbsdlike/openbsd/mips64.rs":"8532a189ae10c7d668d9=
d4065da8b05d124e09bd39442c9f74a7f231c43eca48","src/unix/bsd/netbsdlike/open=
bsd/mod.rs":"c27c6673bd3628549083a094219831fd9343129f91067b562781617d2a8871=
48","src/unix/bsd/netbsdlike/openbsd/powerpc.rs":"01580d261bc6447bb327a0d98=
2181b7bdabfa066cee65a30373d3ced729ad307","src/unix/bsd/netbsdlike/openbsd/p=
owerpc64.rs":"1dd5449dd1fd3d51e30ffdeeaece91d0aaf05c710e0ac699fecc5461cfa2c=
28e","src/unix/bsd/netbsdlike/openbsd/riscv64.rs":"1dd5449dd1fd3d51e30ffdee=
aece91d0aaf05c710e0ac699fecc5461cfa2c28e","src/unix/bsd/netbsdlike/openbsd/=
sparc64.rs":"d04fd287afbaa2c5df9d48c94e8374a532a3ba491b424ddf018270c7312f40=
85","src/unix/bsd/netbsdlike/openbsd/x86.rs":"6f7f5c4fde2a2259eb547890cbd86=
570cea04ef85347d7569e94e679448bec87","src/unix/bsd/netbsdlike/openbsd/x86_6=
4.rs":"d31db31630289c85af3339dbe357998a21ca584cbae31607448fe2cf7675a4e1","s=
rc/unix/haiku/b32.rs":"a2efdbf7158a6da341e1db9176b0ab193ba88b449616239ed95d=
ced11f54d87b","src/unix/haiku/b64.rs":"ff8115367d3d7d354f792d6176dfaaa26353=
f57056197b563bf4681f91ff7985","src/unix/haiku/mod.rs":"d7ec086b73db4f727991=
79627aa6330a513dcf786b06e19c75ff884d1235948e","src/unix/haiku/native.rs":"d=
bfcbf4954a79d1df2ff58e0590bbcb8c57dfc7a32392aa73ee4726b66bd6cc8","src/unix/=
haiku/x86_64.rs":"3ec3aeeb7ed208b8916f3e32d42bfd085ff5e16936a1a35d9a52789f0=
43b7237","src/unix/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae10=
ceccefeed9debb3bbe08777fc682","src/unix/hermit/mod.rs":"a1494a0bddf301cceb0=
d9b8529a84b5882fe855ceae77a1c4e8d6034e705e26c","src/unix/hermit/x86_64.rs":=
"ab832b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/uni=
x/linux_like/android/b32/arm.rs":"ce582de7e983a33d3bfad13075c53aac9016cee35=
f06ad8653ee9072c3ec2564","src/unix/linux_like/android/b32/mod.rs":"7c173e03=
75119bf06a3081652faede95e5bcd6858e7576b7533d037978737c8f","src/unix/linux_l=
ike/android/b32/x86/align.rs":"812914e4241df82e32b12375ca3374615dc3a4bdd4cf=
31f0423c5815320c0dab","src/unix/linux_like/android/b32/x86/mod.rs":"e6d107e=
fbcd37b5b85dfa18f683300cbf768ffa0237997a9fa52b184a53323ac","src/unix/linux_=
like/android/b64/aarch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3ee2faf=
6fcae3770f9e505cddca35c7b","src/unix/linux_like/android/b64/aarch64/int128.=
rs":"1735f6f5c56770d20dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de","src=
/unix/linux_like/android/b64/aarch64/mod.rs":"10e963e29ff209703de6336c99cca=
96fd79789438d34c82a693eae56e8916c3c","src/unix/linux_like/android/b64/mod.r=
s":"71e4fcbe952bfa4a5f9022f3972e906917b38f729b9d8ef57cd5d179104894ac","src/=
unix/linux_like/android/b64/riscv64/align.rs":"0bf138f84e5327d8339bcd4adf07=
1a6832b516445e597552c82bbd881095e3a8","src/unix/linux_like/android/b64/risc=
v64/mod.rs":"19d4bf2237c47127eba9144e0b82e995bc079315e719179a91813b0ae7b0e4=
9d","src/unix/linux_like/android/b64/x86_64/align.rs":"7169d07a9fd4716f7512=
719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/android/=
b64/x86_64/mod.rs":"4ec2de11a9b65c4325b7b991f0b99a414975e0e61ba8668caca5d92=
1e9b314d1","src/unix/linux_like/android/mod.rs":"66a9e38a47493a42b3b1c32552=
4f3c944e74d1e3e8ecce3cc276ec08fecab13b","src/unix/linux_like/emscripten/ali=
gn.rs":"86c95cbed7a7161b1f23ee06843e7b0e2340ad92b2cb86fe2a8ef3e0e8c36216","=
src/unix/linux_like/emscripten/mod.rs":"67d6b90f539f746aa3290ea7f9d3f3f8d2d=
8a6557233584004ed5697f7821a50","src/unix/linux_like/emscripten/no_align.rs"=
:"0128e4aa721a9902754828b61b5ec7d8a86619983ed1e0544a85d35b1051fad6","src/un=
ix/linux_like/linux/align.rs":"bc5abcd38e2320171e0981e773c9c5fe3e0d5a66fdff=
049228f6a1acad80ef8b","src/unix/linux_like/linux/arch/generic/mod.rs":"fb5d=
e1368cabae03d3ea0152159b7685a9d91efdecee4c5b83efc085ffef8a73","src/unix/lin=
ux_like/linux/arch/mips/mod.rs":"75814e198d1a9a6808be3a5e5edb1bfdc57f75b063=
94e9040739be363c09d82f","src/unix/linux_like/linux/arch/mod.rs":"5bd5361f8a=
6ab4e18bbba6da9f92c164ae252b15a0ed10064812544aa1fdf198","src/unix/linux_lik=
e/linux/arch/powerpc/mod.rs":"bef6b7af9e5e2b4e5545c9c7e3e23a8b743277a0ed958=
53e7eddc38e44299f02","src/unix/linux_like/linux/arch/sparc/mod.rs":"91593ec=
0440f1dd8f8e612028f432c44c14089286e2aca50e10511ab942db8c3","src/unix/linux_=
like/linux/gnu/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec72519573=
15afa53a7b9f936","src/unix/linux_like/linux/gnu/b32/arm/align.rs":"6ec0eb3e=
e93f7ae99fd714b4deabfb5e97fbcefd8c26f5a45fb8e7150899cdeb","src/unix/linux_l=
ike/linux/gnu/b32/arm/mod.rs":"9ab3e97b579a9122690cd01026e14528862860346b70=
0aafbb755a7e04054f7f","src/unix/linux_like/linux/gnu/b32/csky/align.rs":"3f=
ed009dc9af3cc81be7087da9d2d7d1f39845e4497e290259c5cdbae25f039d","src/unix/l=
inux_like/linux/gnu/b32/csky/mod.rs":"4c21d6e7463bb22f00b984294893d12c84018=
d5d26ec661d6a30f4a9625ba639","src/unix/linux_like/linux/gnu/b32/m68k/align.=
rs":"8faa92f77a9232c035418d45331774e64a9a841d99c91791570a203bf2b45bcb","src=
/unix/linux_like/linux/gnu/b32/m68k/mod.rs":"6aab7f1b864e9691d14aa7d389f717=
c4077b8eed72a7f11e3b8c7fef245e4046","src/unix/linux_like/linux/gnu/b32/mips=
/align.rs":"429fb5e005cb7143602d430098b6ebfb7d360685b194f333dfd587472ae954e=
e","src/unix/linux_like/linux/gnu/b32/mips/mod.rs":"6b9a5dac6f937ddc1453e80=
8e3c43502c87143332df9e43ac64fb8b1eda6c116","src/unix/linux_like/linux/gnu/b=
32/mod.rs":"b56625dd20dd48a8699034d349ef089c540c0ddcbf8a3481d598d101f8b40b7=
8","src/unix/linux_like/linux/gnu/b32/powerpc.rs":"5c5d90326b54b57b98eff474=
5fe7a3fb02f053b2dc782241a73e807b491936a3","src/unix/linux_like/linux/gnu/b3=
2/riscv32/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd37543ef=
e86621b119","src/unix/linux_like/linux/gnu/b32/riscv32/mod.rs":"491a9a97cf7=
12985b75d3ad714691ef60898d88c78bc386a6917de0a6774cc26","src/unix/linux_like=
/linux/gnu/b32/sparc/align.rs":"21adbed27df73e2d1ed934aaf733a643003d7baf2bd=
e9c48ea440895bcca6d41","src/unix/linux_like/linux/gnu/b32/sparc/mod.rs":"80=
894eece66e9348f45d1b07ad37c757ea694bbd10ed49d3f920b34e9f51a9a3","src/unix/l=
inux_like/linux/gnu/b32/x86/align.rs":"e4bafdc4a519a7922a81b37a62bbfd1177a2=
f620890eef8f1fbc47162e9eb413","src/unix/linux_like/linux/gnu/b32/x86/mod.rs=
":"c703cc5e9de2dc31d9e5831bfb6f354d6e3518b2ae02263f68a9a70f1c0167e2","src/u=
nix/linux_like/linux/gnu/b64/aarch64/align.rs":"fdf1c72375a2167699157e0dd82=
5422690bb6719f7bc69515a2e5846d0431d7c","src/unix/linux_like/linux/gnu/b64/a=
arch64/fallback.rs":"832e7487249c1c0bb6e9911ce3f7d32ca22378e42392ab83c56915=
cbc59d8be3","src/unix/linux_like/linux/gnu/b64/aarch64/ilp32.rs":"bf4611b73=
7813deef6787babf6c01698605f3b75482269b8546318667bc68e29","src/unix/linux_li=
ke/linux/gnu/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426442f09724d9b2052=
b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/gnu/b64/aarch64/lp64=
.rs":"11a950697fdda0258c6e37c6b13993348c8de4134105ed4faa79358e53175072","sr=
c/unix/linux_like/linux/gnu/b64/aarch64/mod.rs":"172495fbfdf659b9b825148bff=
c2b62704f63fc872428617e868eb15802c9978","src/unix/linux_like/linux/gnu/b64/=
loongarch64/align.rs":"060aa33cc737966c691aab8511c5c5729e551458ce18d0e284e0=
d45f39beeb60","src/unix/linux_like/linux/gnu/b64/loongarch64/mod.rs":"18eda=
da8aa5d4127d9aa1bd81c62b5a4209f1efd8b2b2631e801c9e855ab1480","src/unix/linu=
x_like/linux/gnu/b64/mips64/align.rs":"7169d07a9fd4716f7512719aec9fda5d8bed=
306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/linux/gnu/b64/mips64/mod=
.rs":"628c410b9aaec3c8f43838a28616b577a1d6de60a9799b09bb884d80281f96eb","sr=
c/unix/linux_like/linux/gnu/b64/mod.rs":"6a160ef25439c4fecdb0e3bd0b81874226=
3c791364da874d4febd3aa644ec8e2","src/unix/linux_like/linux/gnu/b64/powerpc6=
4/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268130=
d9","src/unix/linux_like/linux/gnu/b64/powerpc64/mod.rs":"c778a136f06c2ffea=
cea19fa14ce79b828f91b67a002dec5ce87289bae36234e","src/unix/linux_like/linux=
/gnu/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd=
37543efe86621b119","src/unix/linux_like/linux/gnu/b64/riscv64/mod.rs":"c8f0=
7efc5ddd5d874f1ebc329cd6907818d132ac3e30f4f2a4b04be3fb388551","src/unix/lin=
ux_like/linux/gnu/b64/s390x.rs":"a2fd9277c2dcf76f7a16a3bcca745d5a9932c765c0=
dc2feb31c3641be25eb0aa","src/unix/linux_like/linux/gnu/b64/sparc64/align.rs=
":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268130d9","src/u=
nix/linux_like/linux/gnu/b64/sparc64/mod.rs":"e8047e9966a2b90063e0151a0278c=
54885e7b323286cf5ab55cbaf151fc772d3","src/unix/linux_like/linux/gnu/b64/x86=
_64/align.rs":"62e822478356db4a73b6bbd1b36d825b893939ab4b308ec11b0578bcc4b4=
9769","src/unix/linux_like/linux/gnu/b64/x86_64/mod.rs":"891e595d33714b9883=
b92f0554d1d361fba2b6c3f6cac09a288252f44c6ec667","src/unix/linux_like/linux/=
gnu/b64/x86_64/not_x32.rs":"38f74ce15d9662ce4818815a2b87be1618d5e45f190f7e4=
db84ff3285b4421fb","src/unix/linux_like/linux/gnu/b64/x86_64/x32.rs":"b2021=
8a11364a6dec87f96d6c0d8b19e660697ab09ad5ee0e9b3a9dafedaaebb","src/unix/linu=
x_like/linux/gnu/mod.rs":"47dd970aedda9c70429741d7c9892a0d5d264e9abcb1c41d5=
bb913a86f0a5362","src/unix/linux_like/linux/gnu/no_align.rs":"9cd223135de75=
315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/linux_like/l=
inux/mod.rs":"1582c09db7b752af0f796a4cba8aa2bb4ecea895c551a2219e76047bcce74=
a23","src/unix/linux_like/linux/musl/b32/arm/align.rs":"3e8ac052c1043764776=
b54c93ba4260e061df998631737a897d9d47d54f7b80c","src/unix/linux_like/linux/m=
usl/b32/arm/mod.rs":"b63a21b02ff1f55e3aca71af51a054d61fd2b4b452ccbf9f34acb4=
31c51d00ea","src/unix/linux_like/linux/musl/b32/hexagon.rs":"f0b9505a5935f5=
fd163eebaa14d4c18ff948c4b199b03e5b88c91f99d4b0fce6","src/unix/linux_like/li=
nux/musl/b32/mips/align.rs":"429fb5e005cb7143602d430098b6ebfb7d360685b194f3=
33dfd587472ae954ee","src/unix/linux_like/linux/musl/b32/mips/mod.rs":"9b6df=
c603accb6ef68010573f30b015868a1da1e1fc3ea2dc0337f33b4015ec6","src/unix/linu=
x_like/linux/musl/b32/mod.rs":"31677597fd9544c4b1ec1477628288f6273fabbc06e3=
8f33da862ad55f019ce1","src/unix/linux_like/linux/musl/b32/powerpc.rs":"0ebe=
9c42bb746583360d990d5a63a407075be3c7bdd260e5345e8aeac4d060cc","src/unix/lin=
ux_like/linux/musl/b32/riscv32/align.rs":"efd2accf33b87de7c7547903359a5da89=
6edc33cd6c719552c7474b60d4a5d48","src/unix/linux_like/linux/musl/b32/riscv3=
2/mod.rs":"0576807c1dd05e2114c3d0c819ae5a99fb5668262de6f9eabbda73d974a6fd29=
","src/unix/linux_like/linux/musl/b32/x86/align.rs":"08e77fbd7435d7dec2ff56=
932433bece3f02e47ce810f89004a275a86d39cbe1","src/unix/linux_like/linux/musl=
/b32/x86/mod.rs":"9283e5d343aa668a6c2e520fb7db2548f344f1f5adf63ec7961954b61=
e6f6fad","src/unix/linux_like/linux/musl/b64/aarch64/align.rs":"6ba32725d24=
d7d8e6aa111f3b57aafa318f83b606abe96561329151829821133","src/unix/linux_like=
/linux/musl/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426442f09724d9b2052b=
46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/musl/b64/aarch64/mod.=
rs":"31e75179cbb4e26425b3f5b052e358f593153da662884655e60801d852e55dc2","src=
/unix/linux_like/linux/musl/b64/mips64.rs":"9a5d29f666332bb056d0e2951e9de98=
9aa1dc016075f009db3f2f628e0cdda8c","src/unix/linux_like/linux/musl/b64/mod.=
rs":"8275e7a108c71f180de71b86f74baa1e35d9e915befb8ab8191d2a2fe76d3bb9","src=
/unix/linux_like/linux/musl/b64/powerpc64.rs":"e77f4cf5d65320023043e4354725=
397f6b079c1b7b6b3cef2c3293350b46b303","src/unix/linux_like/linux/musl/b64/r=
iscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd37543efe86=
621b119","src/unix/linux_like/linux/musl/b64/riscv64/mod.rs":"a80b1813148de=
c8bc396c02638978c0b4e5e040edafd56d98f8683fe2ae51ab5","src/unix/linux_like/l=
inux/musl/b64/s390x.rs":"80a92e54e47016d051c7bd55bee9580cbedd298164199d71a6=
7d49167e744432","src/unix/linux_like/linux/musl/b64/x86_64/align.rs":"77309=
276ad7a42cbe59ca381f23590b7a143aded05555b34a5b307b808cbca6e","src/unix/linu=
x_like/linux/musl/b64/x86_64/mod.rs":"032863c74d3ca73cb75483218f9bd774ae1ae=
7d3646d2ffb21e4cc7d4b5e0e3d","src/unix/linux_like/linux/musl/lfs64.rs":"3e4=
fb381f3a0756520bde0f1692d4fa45e4ae8133bf7d7c64b0e3fdd512f235f","src/unix/li=
nux_like/linux/musl/mod.rs":"9bfa05126ad26ecaecb29ba01b6d768e0b5d72e6cfc705=
4e13f0d9365eb5735c","src/unix/linux_like/linux/no_align.rs":"62cdca0e011937=
aaf09a51ca86d9f0ee0fdb05f61ec3c058e6a5d5fa6357d784","src/unix/linux_like/li=
nux/non_exhaustive.rs":"181a05bf94fdb911db83ce793b993bd6548a4115b306a7ef3c1=
0f745a8fea3e9","src/unix/linux_like/linux/uclibc/align.rs":"9ed16138d8e439b=
d90930845a65eafa7ebd67366e6bf633936d44014f6e4c959","src/unix/linux_like/lin=
ux/uclibc/arm/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec725195731=
5afa53a7b9f936","src/unix/linux_like/linux/uclibc/arm/mod.rs":"50288ff9e411=
ab0966da24838f2c2a5618021bc19c422a04f577b2979ef4081e","src/unix/linux_like/=
linux/uclibc/arm/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c=
85a76f8316c86653db25","src/unix/linux_like/linux/uclibc/mips/mips32/align.r=
s":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936","src/=
unix/linux_like/linux/uclibc/mips/mips32/mod.rs":"d0c4434e2bf813372c418a8f5=
16c706cdccc9f7be2f0921b2207b0afdb66fe81","src/unix/linux_like/linux/uclibc/=
mips/mips32/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76=
f8316c86653db25","src/unix/linux_like/linux/uclibc/mips/mips64/align.rs":"a=
7bdcb18a37a2d91e64d5fad83ea3edc78f5412adb28f77ab077dbb26dd08b2d","src/unix/=
linux_like/linux/uclibc/mips/mips64/mod.rs":"3f38ee6a4690b9d7594be20d216467=
a34d955f7653c2c8ce1e6147daeb53f1e0","src/unix/linux_like/linux/uclibc/mips/=
mips64/no_align.rs":"4a18e3875698c85229599225ac3401a2a40da87e77b2ad4ef47c6f=
cd5a24ed30","src/unix/linux_like/linux/uclibc/mips/mod.rs":"a048fce1c2d9b1a=
d57305642e8ad05ca0f0c7e4753267a2e2d6b4fee5db3b072","src/unix/linux_like/lin=
ux/uclibc/mod.rs":"1c3d25cddcfefa2bd17bdc81550826be31a08eef235e13f825f169a5=
029c8bca","src/unix/linux_like/linux/uclibc/no_align.rs":"3f28637046524618a=
daa1012e26cb7ffe94b9396e6b518cccdc69d59f274d709","src/unix/linux_like/linux=
/uclibc/x86_64/l4re.rs":"024eba5753e852dbdd212427351affe7e83f9916c1864bce41=
4d7aa2618f192e","src/unix/linux_like/linux/uclibc/x86_64/mod.rs":"196d03aff=
befb85716937c15904831e731eb222ee906e05e42102d639a8152ea","src/unix/linux_li=
ke/linux/uclibc/x86_64/other.rs":"42c3f71e58cabba373f6a55a623f3c31b85049eb6=
4824c09c2b082b3b2d6a0a8","src/unix/linux_like/mod.rs":"45c98e7a0fad03b03c4c=
76f11a80e2423873f0a6563e35c60309a29b2c8ff44f","src/unix/mod.rs":"dd4ce377ba=
9517182e718848739a5c3f58cdbbcd4ee467eef9aaf8df5aed5053","src/unix/newlib/aa=
rch64/mod.rs":"bac93836a9a57b2c710f32f852e92a4d11ad6759ab0fb6ad33e71d60e532=
78af","src/unix/newlib/align.rs":"28aaf87fafbc6b312622719d472d8cf65f9e5467d=
15339df5f73e66d8502b28a","src/unix/newlib/arm/mod.rs":"cbba6b3e957eceb49680=
6e60de8725a23ff3fa0015983b4b4fa27b233732b526","src/unix/newlib/espidf/mod.r=
s":"816f235f4aa4baabba7f2606b31d0fdb03988c52194c966728de8690bf17299d","src/=
unix/newlib/generic.rs":"eab066d9f0a0f3eb53cc1073d01496bba0110989e1f6a59838=
afd19f870cd599","src/unix/newlib/horizon/mod.rs":"7cc5cc120437421db139bfa6a=
90b18168cd3070bdd0f5be96d40fe4c996f3ca1","src/unix/newlib/mod.rs":"9e36de3f=
d78e10cb6b9a59dc5ebe5a1b44a63ccb91433bb33653fb30d0c303c6","src/unix/newlib/=
no_align.rs":"e0743b2179495a9514bc3a4d1781e492878c4ec834ee0085d0891dd1712e8=
2fb","src/unix/newlib/powerpc/mod.rs":"0202ffd57caf75b6afa2c9717750ffb96e37=
5ac33df0ae9609a3f831be393b67","src/unix/newlib/vita/mod.rs":"68e0ce186b44e0=
b3031eb824710e7454dc2a9df98db98120840c3c6f4d885871","src/unix/no_align.rs":=
"c06e95373b9088266e0b14bba0954eef95f93fb2b01d951855e382d22de78e53","src/uni=
x/nto/aarch64.rs":"4709c9afdc8d583be876598e7c238499ee3e8da5bd2baa614d9c7dd4=
14851555","src/unix/nto/mod.rs":"59ab89a8fb6e0a6d22fa968ed4873c2bafa19a0f60=
a90c9a5148816cb7440889","src/unix/nto/neutrino.rs":"799bff4ab01a6424db6c5a2=
b76aa5679826d41495f9d13c63485bf13bc80026b","src/unix/nto/x86_64.rs":"a3e18e=
93c2999da1cd7a6f748a4b60c07aefb73d8ea2aafec19a84cfb040bc8e","src/unix/redox=
/mod.rs":"73658b0d28c82a122875aa2b45c489834f4de58c378add7932bbaf3ffb2ae789"=
,"src/unix/solarish/compat.rs":"00f1ee3faec9da69204e42f025f6735dd13d894071a=
154425dcc43ecbdd06e7f","src/unix/solarish/illumos.rs":"cd93c2d84722bbf9933a=
92842a8998eb0b2afc962f50bc2546ad127b82809fa7","src/unix/solarish/mod.rs":"b=
1660c631a599a3355116e7485b88ab2f8f2929c2e37851a763431387b902f14","src/unix/=
solarish/solaris.rs":"41b350a89ddf01cd12a10f93640f92be53be0b0d976021cdc08da=
17bf3e72edf","src/unix/solarish/x86.rs":"e86e806df0caed72765040eaa2f3c88319=
8d1aa91508540adf9b7008c77f522e","src/unix/solarish/x86_64.rs":"ec2b01f194eb=
8a6a27133c57681da195a949e03098f3ea1e847227a9c09ef5fc","src/unix/solarish/x8=
6_common.rs":"ac869d9c3c95645c22460468391eb1982023c3a8e02b9e06a72e3aef3d5f1=
eac","src/vxworks/aarch64.rs":"98f0afdc511cd02557e506c21fed6737585490a1dce7=
a9d4941d08c437762b99","src/vxworks/arm.rs":"acb7968ce99fe3f4abdf39d98f8133d=
21a4fba435b8ef7084777cb181d788e88","src/vxworks/mod.rs":"e4edcbcf43a325e738=
c9465507594d0c87abf3f0e2b9b046c1425f8d44bdad0f","src/vxworks/powerpc.rs":"a=
cb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788e88","src/vxwor=
ks/powerpc64.rs":"98f0afdc511cd02557e506c21fed6737585490a1dce7a9d4941d08c43=
7762b99","src/vxworks/x86.rs":"552f007f38317620b23889cb7c49d1d1158412524390=
60122f52f434fbc6e5ba","src/vxworks/x86_64.rs":"018d92be3ad628a129eff9f2f5df=
bc0883d8b8e5f2fa917b900a7f98ed6b514a","src/wasi.rs":"09ee3b3348b212b050f6ca=
8ae008a28679ea44a375674307a4e7c9ca0d3ed7d5","src/windows/gnu/align.rs":"b2c=
13ec1b9f3b39a75c452c80c951dff9d0215e31d77e883b4502afb31794647","src/windows=
/gnu/mod.rs":"3c8c7edb7cdf5d0c44af936db2a94869585c69dfabeef30571b4f4e383757=
67a","src/windows/mod.rs":"9fdc5e1c62c441abef7bc62a7343efb2041edc24db9ac0ef=
c0f74df55b69e249","src/windows/msvc/mod.rs":"c068271e00fca6b62bc4bf44bcf142=
cfc38caeded9b6c4e01d1ceef3ccf986f4","src/xous.rs":"eb0675f25ba01f73072d2b70=
907fb8abb1148facefe5a20756c49250f3d65fae","tests/const_fn.rs":"cb75a1f0864f=
926aebe79118fc34d51a0d1ade2c20a394e7774c7e545f21f1f4"},"package":"9cdc71e17=
332e86d2e1d38c1f99edcb6288ee11b815fb1a4b049eaa2114d369b"}
-\ No newline at end of file
diff --git a/meta/recipes-devtools/rust/files/0003-musl-Move-F_OFD_GETLK-F_=
OFD_SETLK-and-F_OFD_SETLKW-t.patch b/meta/recipes-devtools/rust/files/0003-=
musl-Move-F_OFD_GETLK-F_OFD_SETLK-and-F_OFD_SETLKW-t.patch
deleted file mode 100644
index dfe20368a02f..000000000000
--- a/meta/recipes-devtools/rust/files/0003-musl-Move-F_OFD_GETLK-F_OFD_SET=
LK-and-F_OFD_SETLKW-t.patch
+++ /dev/null
@@ -1,205 +0,0 @@
-From 518f6e476531987a91a5273d81fbd0d5df77a19b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 8 Apr 2023 09:01:54 -0700
-Subject: [PATCH 3/5] musl: Move F_OFD_GETLK, F_OFD_SETLK and F_OFD_SETLKW =
to
- common location
-
-These defines are not architecture specific in musl [1] therefore move them
-to be common
-
-[1] https://git.musl-libc.org/cgit/musl/tree/include/fcntl.h#n48
-Upstream-Status: Backport [https://github.com/rust-lang/libc/pull/3302/com=
mits/518f6e476531987a91a5273d81fbd0d5df77a19b]
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
----
- src/unix/linux_like/linux/musl/b32/arm/mod.rs     | 3 ---
- src/unix/linux_like/linux/musl/b32/hexagon.rs     | 3 ---
- src/unix/linux_like/linux/musl/b32/mips/mod.rs    | 3 ---
- src/unix/linux_like/linux/musl/b32/powerpc.rs     | 3 ---
- src/unix/linux_like/linux/musl/b32/x86/mod.rs     | 3 ---
- src/unix/linux_like/linux/musl/b64/aarch64/mod.rs | 3 ---
- src/unix/linux_like/linux/musl/b64/mips64.rs      | 3 ---
- src/unix/linux_like/linux/musl/b64/powerpc64.rs   | 3 ---
- src/unix/linux_like/linux/musl/b64/riscv64/mod.rs | 3 ---
- src/unix/linux_like/linux/musl/b64/s390x.rs       | 3 ---
- src/unix/linux_like/linux/musl/b64/x86_64/mod.rs  | 3 ---
- src/unix/linux_like/linux/musl/mod.rs             | 4 ++++
- 12 files changed, 4 insertions(+), 33 deletions(-)
-
-Index: rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/arm=
/mod.rs
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.74.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b32/a=
rm/mod.rs
-+++ rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/arm/mo=
d.rs
-@@ -449,9 +449,6 @@ pub const F_GETOWN: ::c_int =3D 9;
- pub const F_SETLK: ::c_int =3D 13;
- pub const F_SETLKW: ::c_int =3D 14;
- pub const F_SETOWN: ::c_int =3D 8;
--pub const F_OFD_GETLK: ::c_int =3D 36;
--pub const F_OFD_SETLK: ::c_int =3D 37;
--pub const F_OFD_SETLKW: ::c_int =3D 38;
-=20
- pub const VEOF: usize =3D 4;
- pub const VEOL: usize =3D 11;
-Index: rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/hex=
agon.rs
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.74.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b32/h=
exagon.rs
-+++ rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/hexago=
n.rs
-@@ -225,9 +225,6 @@ pub const F_GETOWN_EX: ::c_int =3D 16;
- pub const F_GETSIG: ::c_int =3D 11;
- pub const F_LINUX_SPECIFIC_BASE: ::c_int =3D 1024;
- pub const FLUSHO: ::c_int =3D 4096;
--pub const F_OFD_GETLK: ::c_int =3D 36;
--pub const F_OFD_SETLK: ::c_int =3D 37;
--pub const F_OFD_SETLKW: ::c_int =3D 38;
- pub const F_OWNER_PGRP: ::c_int =3D 2;
- pub const F_OWNER_PID: ::c_int =3D 1;
- pub const F_OWNER_TID: ::c_int =3D 0;
-Index: rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/mip=
s/mod.rs
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.74.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b32/m=
ips/mod.rs
-+++ rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/mips/m=
od.rs
-@@ -386,9 +386,6 @@ pub const F_GETOWN: ::c_int =3D 23;
- pub const F_SETLK: ::c_int =3D 34;
- pub const F_SETLKW: ::c_int =3D 35;
- pub const F_SETOWN: ::c_int =3D 24;
--pub const F_OFD_GETLK: ::c_int =3D 36;
--pub const F_OFD_SETLK: ::c_int =3D 37;
--pub const F_OFD_SETLKW: ::c_int =3D 38;
-=20
- pub const VEOF: usize =3D 16;
- pub const VEOL: usize =3D 17;
-Index: rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/pow=
erpc.rs
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.74.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b32/p=
owerpc.rs
-+++ rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/powerp=
c.rs
-@@ -383,9 +383,6 @@ pub const F_GETOWN: ::c_int =3D 9;
- pub const F_SETLK: ::c_int =3D 13;
- pub const F_SETLKW: ::c_int =3D 14;
- pub const F_SETOWN: ::c_int =3D 8;
--pub const F_OFD_GETLK: ::c_int =3D 36;
--pub const F_OFD_SETLK: ::c_int =3D 37;
--pub const F_OFD_SETLKW: ::c_int =3D 38;
-=20
- pub const VEOF: usize =3D 4;
- pub const VEOL: usize =3D 6;
-Index: rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/x86=
/mod.rs
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.74.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b32/x=
86/mod.rs
-+++ rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/x86/mo=
d.rs
-@@ -439,9 +439,6 @@ pub const F_GETOWN: ::c_int =3D 9;
- pub const F_SETLK: ::c_int =3D 13;
- pub const F_SETLKW: ::c_int =3D 14;
- pub const F_SETOWN: ::c_int =3D 8;
--pub const F_OFD_GETLK: ::c_int =3D 36;
--pub const F_OFD_SETLK: ::c_int =3D 37;
--pub const F_OFD_SETLKW: ::c_int =3D 38;
-=20
- pub const VEOF: usize =3D 4;
- pub const VEOL: usize =3D 11;
-Index: rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b64/aar=
ch64/mod.rs
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.74.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b64/a=
arch64/mod.rs
-+++ rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b64/aarch6=
4/mod.rs
-@@ -250,9 +250,6 @@ pub const F_GETOWN: ::c_int =3D 9;
- pub const F_SETLK: ::c_int =3D 6;
- pub const F_SETLKW: ::c_int =3D 7;
- pub const F_SETOWN: ::c_int =3D 8;
--pub const F_OFD_GETLK: ::c_int =3D 36;
--pub const F_OFD_SETLK: ::c_int =3D 37;
--pub const F_OFD_SETLKW: ::c_int =3D 38;
-=20
- pub const VEOF: usize =3D 4;
-=20
-Index: rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b64/mip=
s64.rs
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.74.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b64/m=
ips64.rs
-+++ rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b64/mips64=
.rs
-@@ -612,9 +612,6 @@ pub const F_GETOWN: ::c_int =3D 23;
- pub const F_SETOWN: ::c_int =3D 24;
- pub const F_SETLK: ::c_int =3D 6;
- pub const F_SETLKW: ::c_int =3D 7;
--pub const F_OFD_GETLK: ::c_int =3D 36;
--pub const F_OFD_SETLK: ::c_int =3D 37;
--pub const F_OFD_SETLKW: ::c_int =3D 38;
-=20
- pub const MCL_CURRENT: ::c_int =3D 0x0001;
- pub const MCL_FUTURE: ::c_int =3D 0x0002;
-Index: rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b64/pow=
erpc64.rs
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.74.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b64/p=
owerpc64.rs
-+++ rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b64/powerp=
c64.rs
-@@ -212,9 +212,6 @@ pub const F_GETOWN: ::c_int =3D 9;
- pub const F_SETLK: ::c_int =3D 6;
- pub const F_SETLKW: ::c_int =3D 7;
- pub const F_SETOWN: ::c_int =3D 8;
--pub const F_OFD_GETLK: ::c_int =3D 36;
--pub const F_OFD_SETLK: ::c_int =3D 37;
--pub const F_OFD_SETLKW: ::c_int =3D 38;
-=20
- pub const VEOF: usize =3D 4;
-=20
-Index: rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b64/ris=
cv64/mod.rs
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.74.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b64/r=
iscv64/mod.rs
-+++ rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b64/riscv6=
4/mod.rs
-@@ -604,9 +604,6 @@ pub const F_GETOWN: ::c_int =3D 9;
- pub const F_SETLK: ::c_int =3D 6;
- pub const F_SETLKW: ::c_int =3D 7;
- pub const F_SETOWN: ::c_int =3D 8;
--pub const F_OFD_GETLK: ::c_int =3D 36;
--pub const F_OFD_SETLK: ::c_int =3D 37;
--pub const F_OFD_SETLKW: ::c_int =3D 38;
-=20
- pub const VEOF: usize =3D 4;
-=20
-Index: rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b64/s39=
0x.rs
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.74.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b64/s=
390x.rs
-+++ rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b64/s390x.=
rs
-@@ -296,9 +296,6 @@ pub const F_GETOWN: ::c_int =3D 9;
- pub const F_SETOWN: ::c_int =3D 8;
- pub const F_SETLK: ::c_int =3D 6;
- pub const F_SETLKW: ::c_int =3D 7;
--pub const F_OFD_GETLK: ::c_int =3D 36;
--pub const F_OFD_SETLK: ::c_int =3D 37;
--pub const F_OFD_SETLKW: ::c_int =3D 38;
-=20
- pub const VTIME: usize =3D 5;
- pub const VSWTC: usize =3D 7;
-Index: rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b64/x86=
_64/mod.rs
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.74.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b64/x=
86_64/mod.rs
-+++ rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b64/x86_64=
/mod.rs
-@@ -805,9 +805,6 @@ pub const F_GETOWN: ::c_int =3D 9;
- pub const F_SETLK: ::c_int =3D 6;
- pub const F_SETLKW: ::c_int =3D 7;
- pub const F_SETOWN: ::c_int =3D 8;
--pub const F_OFD_GETLK: ::c_int =3D 36;
--pub const F_OFD_SETLK: ::c_int =3D 37;
--pub const F_OFD_SETLKW: ::c_int =3D 38;
-=20
- pub const VEOF: usize =3D 4;
-=20
-Index: rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/mod.rs
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.74.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/mod.rs
-+++ rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/mod.rs
-@@ -512,6 +512,10 @@ pub const ECOMM: ::c_int =3D 70;
- pub const EPROTO: ::c_int =3D 71;
- pub const EDOTDOT: ::c_int =3D 73;
-=20
-+pub const F_OFD_GETLK: ::c_int =3D 36;
-+pub const F_OFD_SETLK: ::c_int =3D 37;
-+pub const F_OFD_SETLKW: ::c_int =3D 38;
-+
- pub const F_RDLCK: ::c_int =3D 0;
- pub const F_WRLCK: ::c_int =3D 1;
- pub const F_UNLCK: ::c_int =3D 2;
-Index: rustc-1.74.0-src/vendor/libc/.cargo-checksum.json
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.74.0-src.orig/vendor/libc/.cargo-checksum.json
-+++ rustc-1.74.0-src/vendor/libc/.cargo-checksum.json
-@@ -1 +1 @@
--{"files":{"CONTRIBUTING.md":"bdc90b52cf803faac96e594069a86dd8ea150d5ba7fb=
3e6cadfc08dac4c7b0ce","Cargo.toml":"a58e58fa9bde015e08609ea2f17e56c5df7c82a=
a6f3fa1a144c02ee4715227b9","LICENSE-APACHE":"62c7a1e35f56406896d7aa7ca52d0c=
c0d272ac022b5d2796e7d6905db8a3636a","LICENSE-MIT":"a8d47ff51ca256f56a8932db=
a07660672dbfe3004257ca8de708aac1415937a1","README.md":"ecc47e284f8d007fc048=
666d5108dd41cdc440ab9eedfe8c47d1634613522787","build.rs":"9e94683e94db80e82=
82fce07549cf748d9037852fb06df1c7596bea2ed130d50","rustfmt.toml":"eaa2ea84fc=
1ba0359b77680804903e07bb38d257ab11986b95b158e460f787b2","src/fixed_width_in=
ts.rs":"7f986e5f5e68d25ef04d386fd2f640e8be8f15427a8d4a458ea01d26b8dca0ca","=
src/fuchsia/aarch64.rs":"893fcec48142d273063ffd814dca33fbec92205fd39ada9707=
5f85201d803996","src/fuchsia/align.rs":"ae1cf8f011a99737eabeb14ffff768e60f1=
3b13363d7646744dbb0f443dab3d6","src/fuchsia/mod.rs":"30f4dc83ef120300d61896=
696512436377c5f36f1431d98ab7e01e498c0c47d5","src/fuchsia/no_align.rs":"303f=
3f1b255e0088b5715094353cf00476131d8e94e6aebb3f469557771c8b8a","src/fuchsia/=
riscv64.rs":"617cd75e79e0e20f664db764a4dc2a396d9fd11a4d95371acd91ed4811293b=
11","src/fuchsia/x86_64.rs":"93a3632b5cf67d2a6bcb7dc0a558605252d5fe689e0f38=
d8aa2ec5852255ac87","src/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f3=
68ae10ceccefeed9debb3bbe08777fc682","src/hermit/mod.rs":"d3bfce41e4463d4be8=
020a2d063c9bfa8b665f45f1cc6cbf3163f5d01e7cb21f","src/hermit/x86_64.rs":"ab8=
32b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/lib.rs"=
:"24111461547739f3646f95bcb66c43f2ae679a727ff5938299434c522c02e458","src/ma=
cros.rs":"b457eb028b8e8ab3c24bb7292b874ad4e491edbb83594f6a3da024df5348c088"=
,"src/psp.rs":"dd31aabd46171d474ec5828372e28588935120e7355c90c105360d8fa926=
4c1c","src/sgx.rs":"16a95cdefc81c5ee00d8353a60db363c4cc3e0f75abcd5d0144723f=
2a306ed1b","src/solid/aarch64.rs":"a726e47f324adf73a4a0b67a2c183408d0cad105=
ae66acf36db37a42ab7f8707","src/solid/arm.rs":"e39a4f74ebbef3b97b8c95758ad74=
1123d84ed3eb48d9cf4f1f4872097fc27fe","src/solid/mod.rs":"5f4151dca5132e4b4e=
4c23ab9737e12856dddbdc0ca3f7dbc004328ef3c8acde","src/switch.rs":"9da3dd39b3=
de45a7928789926e8572d00e1e11a39e6f7289a1349aadce90edba","src/unix/aix/mod.r=
s":"54229b5e774669c16912112e8b50fa938db76f534971222a11723a05195a0948","src/=
unix/aix/powerpc64.rs":"cf374d81139d45f9d77c6a764f640bfbf7e0a5903689652c829=
6f8e10d55169b","src/unix/align.rs":"2cdc7c826ef7ae61f5171c5ae8c445a743d86f1=
a7f2d9d7e4ceeec56d6874f65","src/unix/bsd/apple/b32/align.rs":"ec833a747866f=
e19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b3=
2/mod.rs":"2546ad3eb6aecb95f916648bc63264117c92b4b4859532b34cb011e4c75a5a72=
","src/unix/bsd/apple/b64/aarch64/align.rs":"2eaf0f561a32bdcbf4e0477c8895d5=
e7bcb5cdebd5fef7b4df2ca8e38e144d94","src/unix/bsd/apple/b64/aarch64/mod.rs"=
:"44c217a4f263afe7a97435de9323d20a96c37836f899ca0925306d4b7e073c27","src/un=
ix/bsd/apple/b64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d1=
5fa68884c40b0e26c","src/unix/bsd/apple/b64/mod.rs":"f5e278a1af7fb358891d1c9=
be4eb7e815aaca0c5cb738d0c3604ba2208a856f7","src/unix/bsd/apple/b64/x86_64/a=
lign.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c"=
,"src/unix/bsd/apple/b64/x86_64/mod.rs":"8c87c5855038aae5d433c8f5eb3b29b0a1=
75879a0245342b3bfd83bdf4cfd936","src/unix/bsd/apple/long_array.rs":"3cf1f19=
b812e6d093c819dc65ce55b13491963e0780eda0d0bd1577603e81948","src/unix/bsd/ap=
ple/mod.rs":"0931fd351d585728e6384d7b952b8d816e9acdb9c86c172324445f3c33f692=
ca","src/unix/bsd/freebsdlike/dragonfly/errno.rs":"8295b8bb0dfd38d2cdb4d919=
2cdeeb534cc6c3b208170e64615fa3e0edb3e578","src/unix/bsd/freebsdlike/dragonf=
ly/mod.rs":"f2e78625fe1eb14f43e730a3987eba888cb8ac04c23008e7c2d2f7c72258b9e=
6","src/unix/bsd/freebsdlike/freebsd/aarch64.rs":"6c8e216385f53a4bf5f171749=
b57602fc34a4e4b160a44ca31c058cb0c8a2126","src/unix/bsd/freebsdlike/freebsd/=
arm.rs":"59d6a670eea562fb87686e243e0a84603d29a2028a3d4b3f99ccc01bd04d2f47",=
"src/unix/bsd/freebsdlike/freebsd/freebsd11/b64.rs":"9808d152c1196aa647f1b0=
f0cf84dac8c930da7d7f897a44975545e3d9d17681","src/unix/bsd/freebsdlike/freeb=
sd/freebsd11/mod.rs":"e243ae0e89623d4fa9f85afe14369cc5fd5f2028ea715773dbec7=
22ba80dac1f","src/unix/bsd/freebsdlike/freebsd/freebsd12/b64.rs":"61cbe45f8=
499bedb168106b686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/free=
bsdlike/freebsd/freebsd12/mod.rs":"bef9fae288a4f29e941ea369be1cd20b170040e6=
0665a4d49a4a9e79009b72d8","src/unix/bsd/freebsdlike/freebsd/freebsd12/x86_6=
4.rs":"2df36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","s=
rc/unix/bsd/freebsdlike/freebsd/freebsd13/b64.rs":"61cbe45f8499bedb168106b6=
86d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd=
/freebsd13/mod.rs":"3c514e037694ce22724abb3c9c4687defda7f0e3456b615ca73593e=
860e38b16","src/unix/bsd/freebsdlike/freebsd/freebsd13/x86_64.rs":"2df36a7f=
122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/fre=
ebsdlike/freebsd/freebsd14/b64.rs":"61cbe45f8499bedb168106b686d4f8239472f25=
c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd14/mod.=
rs":"318abe48bfdd1c74ecd6afbd6c9329c5c72ce4f7d420edd6be2fc12b223ae32f","src=
/unix/bsd/freebsdlike/freebsd/freebsd14/x86_64.rs":"e7b5863e222d6cc416b6b0f=
be71690fad909e899b4c4ae810bbca117e4fcb650","src/unix/bsd/freebsdlike/freebs=
d/mod.rs":"4c3cd57aaf7fbce072e28e0d2d285b5fda9702e924561d2fd01e49e6ee186a98=
","src/unix/bsd/freebsdlike/freebsd/powerpc.rs":"9ca3f82f88974e6db5569f2d76=
a5a3749b248a31747a6c0da5820492bdfeca42","src/unix/bsd/freebsdlike/freebsd/p=
owerpc64.rs":"2dae3ecc87eac3b11657aa98915def55fc4b5c0de11fe26aae23329a54628=
a9a","src/unix/bsd/freebsdlike/freebsd/riscv64.rs":"fa4bed4c58cad24ba339594=
1c7fa6b11e089551a04714f9561078e400f5b2b62","src/unix/bsd/freebsdlike/freebs=
d/x86.rs":"6766e2ce85e187b306cd3b0b8d7e15b8f4042c5cff81d89b3af69ecc99c70ab0=
","src/unix/bsd/freebsdlike/freebsd/x86_64/align.rs":"0e1f69a88fca1c32874b1=
daf5db3d446fefbe518dca497f096cc9168c39dde70","src/unix/bsd/freebsdlike/free=
bsd/x86_64/mod.rs":"51e4dd0c8ae247bb652feda5adad9333ea3bb30c750c3a3935e0b0e=
47d7803eb","src/unix/bsd/freebsdlike/mod.rs":"0eacafac87fb3a32ef1b85980fece=
2792e70eba9856af18a7407cc35be68ea57","src/unix/bsd/mod.rs":"dad51a24a524e92=
bfe9de3ac3b7d394d86058b9b8a1ccd4efa9bbb5c78e7fa1a","src/unix/bsd/netbsdlike=
/mod.rs":"0a66f7de43710e35a6a546e6c39066aa8b91a6efadb71db88738b0a577fd5537"=
,"src/unix/bsd/netbsdlike/netbsd/aarch64.rs":"65dcb58d11e8d8028401a9d07ca3e=
b4cb4f053e04249cc877353449d84ccc4cb","src/unix/bsd/netbsdlike/netbsd/arm.rs=
":"58cdbb70b0d6f536551f0f3bb3725d2d75c4690db12c26c034e7d6ec4a924452","src/u=
nix/bsd/netbsdlike/netbsd/mod.rs":"90dd33ef20dc3be8aef5bd152a6a06e7ab34f952=
7b3978487b593aaa16a907bd","src/unix/bsd/netbsdlike/netbsd/powerpc.rs":"ee7f=
f5d89d0ed22f531237b5059aa669df93a3b5c489fa641465ace8d405bf41","src/unix/bsd=
/netbsdlike/netbsd/sparc64.rs":"9489f4b3e4566f43bb12dfb92238960613dac7f6a45=
cc13068a8d152b902d7d9","src/unix/bsd/netbsdlike/netbsd/x86.rs":"20692320e36=
bfe028d1a34d16fe12ca77aa909cb02bda167376f98f1a09aefe7","src/unix/bsd/netbsd=
like/netbsd/x86_64.rs":"1afe5ef46b14397cdd68664b5b232e4f5b035b6db1d4cf411c8=
99d51ebca9f30","src/unix/bsd/netbsdlike/openbsd/aarch64.rs":"dd91931d373b7e=
caf6e2de25adadee10d16fa9b12c2cbacdff3eb291e1ba36af","src/unix/bsd/netbsdlik=
e/openbsd/arm.rs":"01580d261bc6447bb327a0d982181b7bdabfa066cee65a30373d3ced=
729ad307","src/unix/bsd/netbsdlike/openbsd/mips64.rs":"8532a189ae10c7d668d9=
d4065da8b05d124e09bd39442c9f74a7f231c43eca48","src/unix/bsd/netbsdlike/open=
bsd/mod.rs":"c27c6673bd3628549083a094219831fd9343129f91067b562781617d2a8871=
48","src/unix/bsd/netbsdlike/openbsd/powerpc.rs":"01580d261bc6447bb327a0d98=
2181b7bdabfa066cee65a30373d3ced729ad307","src/unix/bsd/netbsdlike/openbsd/p=
owerpc64.rs":"1dd5449dd1fd3d51e30ffdeeaece91d0aaf05c710e0ac699fecc5461cfa2c=
28e","src/unix/bsd/netbsdlike/openbsd/riscv64.rs":"1dd5449dd1fd3d51e30ffdee=
aece91d0aaf05c710e0ac699fecc5461cfa2c28e","src/unix/bsd/netbsdlike/openbsd/=
sparc64.rs":"d04fd287afbaa2c5df9d48c94e8374a532a3ba491b424ddf018270c7312f40=
85","src/unix/bsd/netbsdlike/openbsd/x86.rs":"6f7f5c4fde2a2259eb547890cbd86=
570cea04ef85347d7569e94e679448bec87","src/unix/bsd/netbsdlike/openbsd/x86_6=
4.rs":"d31db31630289c85af3339dbe357998a21ca584cbae31607448fe2cf7675a4e1","s=
rc/unix/haiku/b32.rs":"a2efdbf7158a6da341e1db9176b0ab193ba88b449616239ed95d=
ced11f54d87b","src/unix/haiku/b64.rs":"ff8115367d3d7d354f792d6176dfaaa26353=
f57056197b563bf4681f91ff7985","src/unix/haiku/mod.rs":"d7ec086b73db4f727991=
79627aa6330a513dcf786b06e19c75ff884d1235948e","src/unix/haiku/native.rs":"d=
bfcbf4954a79d1df2ff58e0590bbcb8c57dfc7a32392aa73ee4726b66bd6cc8","src/unix/=
haiku/x86_64.rs":"3ec3aeeb7ed208b8916f3e32d42bfd085ff5e16936a1a35d9a52789f0=
43b7237","src/unix/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae10=
ceccefeed9debb3bbe08777fc682","src/unix/hermit/mod.rs":"a1494a0bddf301cceb0=
d9b8529a84b5882fe855ceae77a1c4e8d6034e705e26c","src/unix/hermit/x86_64.rs":=
"ab832b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/uni=
x/linux_like/android/b32/arm.rs":"ce582de7e983a33d3bfad13075c53aac9016cee35=
f06ad8653ee9072c3ec2564","src/unix/linux_like/android/b32/mod.rs":"7c173e03=
75119bf06a3081652faede95e5bcd6858e7576b7533d037978737c8f","src/unix/linux_l=
ike/android/b32/x86/align.rs":"812914e4241df82e32b12375ca3374615dc3a4bdd4cf=
31f0423c5815320c0dab","src/unix/linux_like/android/b32/x86/mod.rs":"e6d107e=
fbcd37b5b85dfa18f683300cbf768ffa0237997a9fa52b184a53323ac","src/unix/linux_=
like/android/b64/aarch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3ee2faf=
6fcae3770f9e505cddca35c7b","src/unix/linux_like/android/b64/aarch64/int128.=
rs":"1735f6f5c56770d20dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de","src=
/unix/linux_like/android/b64/aarch64/mod.rs":"10e963e29ff209703de6336c99cca=
96fd79789438d34c82a693eae56e8916c3c","src/unix/linux_like/android/b64/mod.r=
s":"71e4fcbe952bfa4a5f9022f3972e906917b38f729b9d8ef57cd5d179104894ac","src/=
unix/linux_like/android/b64/riscv64/align.rs":"0bf138f84e5327d8339bcd4adf07=
1a6832b516445e597552c82bbd881095e3a8","src/unix/linux_like/android/b64/risc=
v64/mod.rs":"19d4bf2237c47127eba9144e0b82e995bc079315e719179a91813b0ae7b0e4=
9d","src/unix/linux_like/android/b64/x86_64/align.rs":"7169d07a9fd4716f7512=
719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/android/=
b64/x86_64/mod.rs":"4ec2de11a9b65c4325b7b991f0b99a414975e0e61ba8668caca5d92=
1e9b314d1","src/unix/linux_like/android/mod.rs":"66a9e38a47493a42b3b1c32552=
4f3c944e74d1e3e8ecce3cc276ec08fecab13b","src/unix/linux_like/emscripten/ali=
gn.rs":"86c95cbed7a7161b1f23ee06843e7b0e2340ad92b2cb86fe2a8ef3e0e8c36216","=
src/unix/linux_like/emscripten/mod.rs":"67d6b90f539f746aa3290ea7f9d3f3f8d2d=
8a6557233584004ed5697f7821a50","src/unix/linux_like/emscripten/no_align.rs"=
:"0128e4aa721a9902754828b61b5ec7d8a86619983ed1e0544a85d35b1051fad6","src/un=
ix/linux_like/linux/align.rs":"bc5abcd38e2320171e0981e773c9c5fe3e0d5a66fdff=
049228f6a1acad80ef8b","src/unix/linux_like/linux/arch/generic/mod.rs":"fb5d=
e1368cabae03d3ea0152159b7685a9d91efdecee4c5b83efc085ffef8a73","src/unix/lin=
ux_like/linux/arch/mips/mod.rs":"75814e198d1a9a6808be3a5e5edb1bfdc57f75b063=
94e9040739be363c09d82f","src/unix/linux_like/linux/arch/mod.rs":"5bd5361f8a=
6ab4e18bbba6da9f92c164ae252b15a0ed10064812544aa1fdf198","src/unix/linux_lik=
e/linux/arch/powerpc/mod.rs":"bef6b7af9e5e2b4e5545c9c7e3e23a8b743277a0ed958=
53e7eddc38e44299f02","src/unix/linux_like/linux/arch/sparc/mod.rs":"91593ec=
0440f1dd8f8e612028f432c44c14089286e2aca50e10511ab942db8c3","src/unix/linux_=
like/linux/gnu/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec72519573=
15afa53a7b9f936","src/unix/linux_like/linux/gnu/b32/arm/align.rs":"6ec0eb3e=
e93f7ae99fd714b4deabfb5e97fbcefd8c26f5a45fb8e7150899cdeb","src/unix/linux_l=
ike/linux/gnu/b32/arm/mod.rs":"9ab3e97b579a9122690cd01026e14528862860346b70=
0aafbb755a7e04054f7f","src/unix/linux_like/linux/gnu/b32/csky/align.rs":"3f=
ed009dc9af3cc81be7087da9d2d7d1f39845e4497e290259c5cdbae25f039d","src/unix/l=
inux_like/linux/gnu/b32/csky/mod.rs":"4c21d6e7463bb22f00b984294893d12c84018=
d5d26ec661d6a30f4a9625ba639","src/unix/linux_like/linux/gnu/b32/m68k/align.=
rs":"8faa92f77a9232c035418d45331774e64a9a841d99c91791570a203bf2b45bcb","src=
/unix/linux_like/linux/gnu/b32/m68k/mod.rs":"6aab7f1b864e9691d14aa7d389f717=
c4077b8eed72a7f11e3b8c7fef245e4046","src/unix/linux_like/linux/gnu/b32/mips=
/align.rs":"429fb5e005cb7143602d430098b6ebfb7d360685b194f333dfd587472ae954e=
e","src/unix/linux_like/linux/gnu/b32/mips/mod.rs":"6b9a5dac6f937ddc1453e80=
8e3c43502c87143332df9e43ac64fb8b1eda6c116","src/unix/linux_like/linux/gnu/b=
32/mod.rs":"b56625dd20dd48a8699034d349ef089c540c0ddcbf8a3481d598d101f8b40b7=
8","src/unix/linux_like/linux/gnu/b32/powerpc.rs":"5c5d90326b54b57b98eff474=
5fe7a3fb02f053b2dc782241a73e807b491936a3","src/unix/linux_like/linux/gnu/b3=
2/riscv32/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd37543ef=
e86621b119","src/unix/linux_like/linux/gnu/b32/riscv32/mod.rs":"491a9a97cf7=
12985b75d3ad714691ef60898d88c78bc386a6917de0a6774cc26","src/unix/linux_like=
/linux/gnu/b32/sparc/align.rs":"21adbed27df73e2d1ed934aaf733a643003d7baf2bd=
e9c48ea440895bcca6d41","src/unix/linux_like/linux/gnu/b32/sparc/mod.rs":"80=
894eece66e9348f45d1b07ad37c757ea694bbd10ed49d3f920b34e9f51a9a3","src/unix/l=
inux_like/linux/gnu/b32/x86/align.rs":"e4bafdc4a519a7922a81b37a62bbfd1177a2=
f620890eef8f1fbc47162e9eb413","src/unix/linux_like/linux/gnu/b32/x86/mod.rs=
":"c703cc5e9de2dc31d9e5831bfb6f354d6e3518b2ae02263f68a9a70f1c0167e2","src/u=
nix/linux_like/linux/gnu/b64/aarch64/align.rs":"fdf1c72375a2167699157e0dd82=
5422690bb6719f7bc69515a2e5846d0431d7c","src/unix/linux_like/linux/gnu/b64/a=
arch64/fallback.rs":"832e7487249c1c0bb6e9911ce3f7d32ca22378e42392ab83c56915=
cbc59d8be3","src/unix/linux_like/linux/gnu/b64/aarch64/ilp32.rs":"bf4611b73=
7813deef6787babf6c01698605f3b75482269b8546318667bc68e29","src/unix/linux_li=
ke/linux/gnu/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426442f09724d9b2052=
b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/gnu/b64/aarch64/lp64=
.rs":"11a950697fdda0258c6e37c6b13993348c8de4134105ed4faa79358e53175072","sr=
c/unix/linux_like/linux/gnu/b64/aarch64/mod.rs":"172495fbfdf659b9b825148bff=
c2b62704f63fc872428617e868eb15802c9978","src/unix/linux_like/linux/gnu/b64/=
loongarch64/align.rs":"060aa33cc737966c691aab8511c5c5729e551458ce18d0e284e0=
d45f39beeb60","src/unix/linux_like/linux/gnu/b64/loongarch64/mod.rs":"18eda=
da8aa5d4127d9aa1bd81c62b5a4209f1efd8b2b2631e801c9e855ab1480","src/unix/linu=
x_like/linux/gnu/b64/mips64/align.rs":"7169d07a9fd4716f7512719aec9fda5d8bed=
306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/linux/gnu/b64/mips64/mod=
.rs":"628c410b9aaec3c8f43838a28616b577a1d6de60a9799b09bb884d80281f96eb","sr=
c/unix/linux_like/linux/gnu/b64/mod.rs":"6a160ef25439c4fecdb0e3bd0b81874226=
3c791364da874d4febd3aa644ec8e2","src/unix/linux_like/linux/gnu/b64/powerpc6=
4/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268130=
d9","src/unix/linux_like/linux/gnu/b64/powerpc64/mod.rs":"c778a136f06c2ffea=
cea19fa14ce79b828f91b67a002dec5ce87289bae36234e","src/unix/linux_like/linux=
/gnu/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd=
37543efe86621b119","src/unix/linux_like/linux/gnu/b64/riscv64/mod.rs":"c8f0=
7efc5ddd5d874f1ebc329cd6907818d132ac3e30f4f2a4b04be3fb388551","src/unix/lin=
ux_like/linux/gnu/b64/s390x.rs":"a2fd9277c2dcf76f7a16a3bcca745d5a9932c765c0=
dc2feb31c3641be25eb0aa","src/unix/linux_like/linux/gnu/b64/sparc64/align.rs=
":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268130d9","src/u=
nix/linux_like/linux/gnu/b64/sparc64/mod.rs":"e8047e9966a2b90063e0151a0278c=
54885e7b323286cf5ab55cbaf151fc772d3","src/unix/linux_like/linux/gnu/b64/x86=
_64/align.rs":"62e822478356db4a73b6bbd1b36d825b893939ab4b308ec11b0578bcc4b4=
9769","src/unix/linux_like/linux/gnu/b64/x86_64/mod.rs":"891e595d33714b9883=
b92f0554d1d361fba2b6c3f6cac09a288252f44c6ec667","src/unix/linux_like/linux/=
gnu/b64/x86_64/not_x32.rs":"38f74ce15d9662ce4818815a2b87be1618d5e45f190f7e4=
db84ff3285b4421fb","src/unix/linux_like/linux/gnu/b64/x86_64/x32.rs":"b2021=
8a11364a6dec87f96d6c0d8b19e660697ab09ad5ee0e9b3a9dafedaaebb","src/unix/linu=
x_like/linux/gnu/mod.rs":"47dd970aedda9c70429741d7c9892a0d5d264e9abcb1c41d5=
bb913a86f0a5362","src/unix/linux_like/linux/gnu/no_align.rs":"9cd223135de75=
315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/linux_like/l=
inux/mod.rs":"1582c09db7b752af0f796a4cba8aa2bb4ecea895c551a2219e76047bcce74=
a23","src/unix/linux_like/linux/musl/b32/arm/align.rs":"3e8ac052c1043764776=
b54c93ba4260e061df998631737a897d9d47d54f7b80c","src/unix/linux_like/linux/m=
usl/b32/arm/mod.rs":"b63a21b02ff1f55e3aca71af51a054d61fd2b4b452ccbf9f34acb4=
31c51d00ea","src/unix/linux_like/linux/musl/b32/hexagon.rs":"f0b9505a5935f5=
fd163eebaa14d4c18ff948c4b199b03e5b88c91f99d4b0fce6","src/unix/linux_like/li=
nux/musl/b32/mips/align.rs":"429fb5e005cb7143602d430098b6ebfb7d360685b194f3=
33dfd587472ae954ee","src/unix/linux_like/linux/musl/b32/mips/mod.rs":"9b6df=
c603accb6ef68010573f30b015868a1da1e1fc3ea2dc0337f33b4015ec6","src/unix/linu=
x_like/linux/musl/b32/mod.rs":"31677597fd9544c4b1ec1477628288f6273fabbc06e3=
8f33da862ad55f019ce1","src/unix/linux_like/linux/musl/b32/powerpc.rs":"0ebe=
9c42bb746583360d990d5a63a407075be3c7bdd260e5345e8aeac4d060cc","src/unix/lin=
ux_like/linux/musl/b32/riscv32/align.rs":"efd2accf33b87de7c7547903359a5da89=
6edc33cd6c719552c7474b60d4a5d48","src/unix/linux_like/linux/musl/b32/riscv3=
2/mod.rs":"0576807c1dd05e2114c3d0c819ae5a99fb5668262de6f9eabbda73d974a6fd29=
","src/unix/linux_like/linux/musl/b32/x86/align.rs":"08e77fbd7435d7dec2ff56=
932433bece3f02e47ce810f89004a275a86d39cbe1","src/unix/linux_like/linux/musl=
/b32/x86/mod.rs":"9283e5d343aa668a6c2e520fb7db2548f344f1f5adf63ec7961954b61=
e6f6fad","src/unix/linux_like/linux/musl/b64/aarch64/align.rs":"6ba32725d24=
d7d8e6aa111f3b57aafa318f83b606abe96561329151829821133","src/unix/linux_like=
/linux/musl/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426442f09724d9b2052b=
46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/musl/b64/aarch64/mod.=
rs":"31e75179cbb4e26425b3f5b052e358f593153da662884655e60801d852e55dc2","src=
/unix/linux_like/linux/musl/b64/mips64.rs":"9a5d29f666332bb056d0e2951e9de98=
9aa1dc016075f009db3f2f628e0cdda8c","src/unix/linux_like/linux/musl/b64/mod.=
rs":"8275e7a108c71f180de71b86f74baa1e35d9e915befb8ab8191d2a2fe76d3bb9","src=
/unix/linux_like/linux/musl/b64/powerpc64.rs":"e77f4cf5d65320023043e4354725=
397f6b079c1b7b6b3cef2c3293350b46b303","src/unix/linux_like/linux/musl/b64/r=
iscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd37543efe86=
621b119","src/unix/linux_like/linux/musl/b64/riscv64/mod.rs":"a80b1813148de=
c8bc396c02638978c0b4e5e040edafd56d98f8683fe2ae51ab5","src/unix/linux_like/l=
inux/musl/b64/s390x.rs":"80a92e54e47016d051c7bd55bee9580cbedd298164199d71a6=
7d49167e744432","src/unix/linux_like/linux/musl/b64/x86_64/align.rs":"77309=
276ad7a42cbe59ca381f23590b7a143aded05555b34a5b307b808cbca6e","src/unix/linu=
x_like/linux/musl/b64/x86_64/mod.rs":"032863c74d3ca73cb75483218f9bd774ae1ae=
7d3646d2ffb21e4cc7d4b5e0e3d","src/unix/linux_like/linux/musl/lfs64.rs":"3e4=
fb381f3a0756520bde0f1692d4fa45e4ae8133bf7d7c64b0e3fdd512f235f","src/unix/li=
nux_like/linux/musl/mod.rs":"9bfa05126ad26ecaecb29ba01b6d768e0b5d72e6cfc705=
4e13f0d9365eb5735c","src/unix/linux_like/linux/no_align.rs":"62cdca0e011937=
aaf09a51ca86d9f0ee0fdb05f61ec3c058e6a5d5fa6357d784","src/unix/linux_like/li=
nux/non_exhaustive.rs":"181a05bf94fdb911db83ce793b993bd6548a4115b306a7ef3c1=
0f745a8fea3e9","src/unix/linux_like/linux/uclibc/align.rs":"9ed16138d8e439b=
d90930845a65eafa7ebd67366e6bf633936d44014f6e4c959","src/unix/linux_like/lin=
ux/uclibc/arm/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec725195731=
5afa53a7b9f936","src/unix/linux_like/linux/uclibc/arm/mod.rs":"50288ff9e411=
ab0966da24838f2c2a5618021bc19c422a04f577b2979ef4081e","src/unix/linux_like/=
linux/uclibc/arm/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c=
85a76f8316c86653db25","src/unix/linux_like/linux/uclibc/mips/mips32/align.r=
s":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936","src/=
unix/linux_like/linux/uclibc/mips/mips32/mod.rs":"d0c4434e2bf813372c418a8f5=
16c706cdccc9f7be2f0921b2207b0afdb66fe81","src/unix/linux_like/linux/uclibc/=
mips/mips32/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76=
f8316c86653db25","src/unix/linux_like/linux/uclibc/mips/mips64/align.rs":"a=
7bdcb18a37a2d91e64d5fad83ea3edc78f5412adb28f77ab077dbb26dd08b2d","src/unix/=
linux_like/linux/uclibc/mips/mips64/mod.rs":"3f38ee6a4690b9d7594be20d216467=
a34d955f7653c2c8ce1e6147daeb53f1e0","src/unix/linux_like/linux/uclibc/mips/=
mips64/no_align.rs":"4a18e3875698c85229599225ac3401a2a40da87e77b2ad4ef47c6f=
cd5a24ed30","src/unix/linux_like/linux/uclibc/mips/mod.rs":"a048fce1c2d9b1a=
d57305642e8ad05ca0f0c7e4753267a2e2d6b4fee5db3b072","src/unix/linux_like/lin=
ux/uclibc/mod.rs":"1c3d25cddcfefa2bd17bdc81550826be31a08eef235e13f825f169a5=
029c8bca","src/unix/linux_like/linux/uclibc/no_align.rs":"3f28637046524618a=
daa1012e26cb7ffe94b9396e6b518cccdc69d59f274d709","src/unix/linux_like/linux=
/uclibc/x86_64/l4re.rs":"024eba5753e852dbdd212427351affe7e83f9916c1864bce41=
4d7aa2618f192e","src/unix/linux_like/linux/uclibc/x86_64/mod.rs":"196d03aff=
befb85716937c15904831e731eb222ee906e05e42102d639a8152ea","src/unix/linux_li=
ke/linux/uclibc/x86_64/other.rs":"42c3f71e58cabba373f6a55a623f3c31b85049eb6=
4824c09c2b082b3b2d6a0a8","src/unix/linux_like/mod.rs":"45c98e7a0fad03b03c4c=
76f11a80e2423873f0a6563e35c60309a29b2c8ff44f","src/unix/mod.rs":"dd4ce377ba=
9517182e718848739a5c3f58cdbbcd4ee467eef9aaf8df5aed5053","src/unix/newlib/aa=
rch64/mod.rs":"bac93836a9a57b2c710f32f852e92a4d11ad6759ab0fb6ad33e71d60e532=
78af","src/unix/newlib/align.rs":"28aaf87fafbc6b312622719d472d8cf65f9e5467d=
15339df5f73e66d8502b28a","src/unix/newlib/arm/mod.rs":"cbba6b3e957eceb49680=
6e60de8725a23ff3fa0015983b4b4fa27b233732b526","src/unix/newlib/espidf/mod.r=
s":"816f235f4aa4baabba7f2606b31d0fdb03988c52194c966728de8690bf17299d","src/=
unix/newlib/generic.rs":"eab066d9f0a0f3eb53cc1073d01496bba0110989e1f6a59838=
afd19f870cd599","src/unix/newlib/horizon/mod.rs":"7cc5cc120437421db139bfa6a=
90b18168cd3070bdd0f5be96d40fe4c996f3ca1","src/unix/newlib/mod.rs":"9e36de3f=
d78e10cb6b9a59dc5ebe5a1b44a63ccb91433bb33653fb30d0c303c6","src/unix/newlib/=
no_align.rs":"e0743b2179495a9514bc3a4d1781e492878c4ec834ee0085d0891dd1712e8=
2fb","src/unix/newlib/powerpc/mod.rs":"0202ffd57caf75b6afa2c9717750ffb96e37=
5ac33df0ae9609a3f831be393b67","src/unix/newlib/vita/mod.rs":"68e0ce186b44e0=
b3031eb824710e7454dc2a9df98db98120840c3c6f4d885871","src/unix/no_align.rs":=
"c06e95373b9088266e0b14bba0954eef95f93fb2b01d951855e382d22de78e53","src/uni=
x/nto/aarch64.rs":"4709c9afdc8d583be876598e7c238499ee3e8da5bd2baa614d9c7dd4=
14851555","src/unix/nto/mod.rs":"59ab89a8fb6e0a6d22fa968ed4873c2bafa19a0f60=
a90c9a5148816cb7440889","src/unix/nto/neutrino.rs":"799bff4ab01a6424db6c5a2=
b76aa5679826d41495f9d13c63485bf13bc80026b","src/unix/nto/x86_64.rs":"a3e18e=
93c2999da1cd7a6f748a4b60c07aefb73d8ea2aafec19a84cfb040bc8e","src/unix/redox=
/mod.rs":"73658b0d28c82a122875aa2b45c489834f4de58c378add7932bbaf3ffb2ae789"=
,"src/unix/solarish/compat.rs":"00f1ee3faec9da69204e42f025f6735dd13d894071a=
154425dcc43ecbdd06e7f","src/unix/solarish/illumos.rs":"cd93c2d84722bbf9933a=
92842a8998eb0b2afc962f50bc2546ad127b82809fa7","src/unix/solarish/mod.rs":"b=
1660c631a599a3355116e7485b88ab2f8f2929c2e37851a763431387b902f14","src/unix/=
solarish/solaris.rs":"41b350a89ddf01cd12a10f93640f92be53be0b0d976021cdc08da=
17bf3e72edf","src/unix/solarish/x86.rs":"e86e806df0caed72765040eaa2f3c88319=
8d1aa91508540adf9b7008c77f522e","src/unix/solarish/x86_64.rs":"ec2b01f194eb=
8a6a27133c57681da195a949e03098f3ea1e847227a9c09ef5fc","src/unix/solarish/x8=
6_common.rs":"ac869d9c3c95645c22460468391eb1982023c3a8e02b9e06a72e3aef3d5f1=
eac","src/vxworks/aarch64.rs":"98f0afdc511cd02557e506c21fed6737585490a1dce7=
a9d4941d08c437762b99","src/vxworks/arm.rs":"acb7968ce99fe3f4abdf39d98f8133d=
21a4fba435b8ef7084777cb181d788e88","src/vxworks/mod.rs":"e4edcbcf43a325e738=
c9465507594d0c87abf3f0e2b9b046c1425f8d44bdad0f","src/vxworks/powerpc.rs":"a=
cb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788e88","src/vxwor=
ks/powerpc64.rs":"98f0afdc511cd02557e506c21fed6737585490a1dce7a9d4941d08c43=
7762b99","src/vxworks/x86.rs":"552f007f38317620b23889cb7c49d1d1158412524390=
60122f52f434fbc6e5ba","src/vxworks/x86_64.rs":"018d92be3ad628a129eff9f2f5df=
bc0883d8b8e5f2fa917b900a7f98ed6b514a","src/wasi.rs":"09ee3b3348b212b050f6ca=
8ae008a28679ea44a375674307a4e7c9ca0d3ed7d5","src/windows/gnu/align.rs":"b2c=
13ec1b9f3b39a75c452c80c951dff9d0215e31d77e883b4502afb31794647","src/windows=
/gnu/mod.rs":"3c8c7edb7cdf5d0c44af936db2a94869585c69dfabeef30571b4f4e383757=
67a","src/windows/mod.rs":"9fdc5e1c62c441abef7bc62a7343efb2041edc24db9ac0ef=
c0f74df55b69e249","src/windows/msvc/mod.rs":"c068271e00fca6b62bc4bf44bcf142=
cfc38caeded9b6c4e01d1ceef3ccf986f4","src/xous.rs":"eb0675f25ba01f73072d2b70=
907fb8abb1148facefe5a20756c49250f3d65fae","tests/const_fn.rs":"cb75a1f0864f=
926aebe79118fc34d51a0d1ade2c20a394e7774c7e545f21f1f4"},"package":"9cdc71e17=
332e86d2e1d38c1f99edcb6288ee11b815fb1a4b049eaa2114d369b"}
-\ No newline at end of file
-+{"files":{"CONTRIBUTING.md":"bdc90b52cf803faac96e594069a86dd8ea150d5ba7fb=
3e6cadfc08dac4c7b0ce","Cargo.toml":"a58e58fa9bde015e08609ea2f17e56c5df7c82a=
a6f3fa1a144c02ee4715227b9","LICENSE-APACHE":"62c7a1e35f56406896d7aa7ca52d0c=
c0d272ac022b5d2796e7d6905db8a3636a","LICENSE-MIT":"a8d47ff51ca256f56a8932db=
a07660672dbfe3004257ca8de708aac1415937a1","README.md":"ecc47e284f8d007fc048=
666d5108dd41cdc440ab9eedfe8c47d1634613522787","build.rs":"9e94683e94db80e82=
82fce07549cf748d9037852fb06df1c7596bea2ed130d50","rustfmt.toml":"eaa2ea84fc=
1ba0359b77680804903e07bb38d257ab11986b95b158e460f787b2","src/fixed_width_in=
ts.rs":"7f986e5f5e68d25ef04d386fd2f640e8be8f15427a8d4a458ea01d26b8dca0ca","=
src/fuchsia/aarch64.rs":"893fcec48142d273063ffd814dca33fbec92205fd39ada9707=
5f85201d803996","src/fuchsia/align.rs":"ae1cf8f011a99737eabeb14ffff768e60f1=
3b13363d7646744dbb0f443dab3d6","src/fuchsia/mod.rs":"30f4dc83ef120300d61896=
696512436377c5f36f1431d98ab7e01e498c0c47d5","src/fuchsia/no_align.rs":"303f=
3f1b255e0088b5715094353cf00476131d8e94e6aebb3f469557771c8b8a","src/fuchsia/=
riscv64.rs":"617cd75e79e0e20f664db764a4dc2a396d9fd11a4d95371acd91ed4811293b=
11","src/fuchsia/x86_64.rs":"93a3632b5cf67d2a6bcb7dc0a558605252d5fe689e0f38=
d8aa2ec5852255ac87","src/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f3=
68ae10ceccefeed9debb3bbe08777fc682","src/hermit/mod.rs":"d3bfce41e4463d4be8=
020a2d063c9bfa8b665f45f1cc6cbf3163f5d01e7cb21f","src/hermit/x86_64.rs":"ab8=
32b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/lib.rs"=
:"24111461547739f3646f95bcb66c43f2ae679a727ff5938299434c522c02e458","src/ma=
cros.rs":"b457eb028b8e8ab3c24bb7292b874ad4e491edbb83594f6a3da024df5348c088"=
,"src/psp.rs":"dd31aabd46171d474ec5828372e28588935120e7355c90c105360d8fa926=
4c1c","src/sgx.rs":"16a95cdefc81c5ee00d8353a60db363c4cc3e0f75abcd5d0144723f=
2a306ed1b","src/solid/aarch64.rs":"a726e47f324adf73a4a0b67a2c183408d0cad105=
ae66acf36db37a42ab7f8707","src/solid/arm.rs":"e39a4f74ebbef3b97b8c95758ad74=
1123d84ed3eb48d9cf4f1f4872097fc27fe","src/solid/mod.rs":"5f4151dca5132e4b4e=
4c23ab9737e12856dddbdc0ca3f7dbc004328ef3c8acde","src/switch.rs":"9da3dd39b3=
de45a7928789926e8572d00e1e11a39e6f7289a1349aadce90edba","src/unix/aix/mod.r=
s":"54229b5e774669c16912112e8b50fa938db76f534971222a11723a05195a0948","src/=
unix/aix/powerpc64.rs":"cf374d81139d45f9d77c6a764f640bfbf7e0a5903689652c829=
6f8e10d55169b","src/unix/align.rs":"2cdc7c826ef7ae61f5171c5ae8c445a743d86f1=
a7f2d9d7e4ceeec56d6874f65","src/unix/bsd/apple/b32/align.rs":"ec833a747866f=
e19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b3=
2/mod.rs":"2546ad3eb6aecb95f916648bc63264117c92b4b4859532b34cb011e4c75a5a72=
","src/unix/bsd/apple/b64/aarch64/align.rs":"2eaf0f561a32bdcbf4e0477c8895d5=
e7bcb5cdebd5fef7b4df2ca8e38e144d94","src/unix/bsd/apple/b64/aarch64/mod.rs"=
:"44c217a4f263afe7a97435de9323d20a96c37836f899ca0925306d4b7e073c27","src/un=
ix/bsd/apple/b64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d1=
5fa68884c40b0e26c","src/unix/bsd/apple/b64/mod.rs":"f5e278a1af7fb358891d1c9=
be4eb7e815aaca0c5cb738d0c3604ba2208a856f7","src/unix/bsd/apple/b64/x86_64/a=
lign.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c"=
,"src/unix/bsd/apple/b64/x86_64/mod.rs":"8c87c5855038aae5d433c8f5eb3b29b0a1=
75879a0245342b3bfd83bdf4cfd936","src/unix/bsd/apple/long_array.rs":"3cf1f19=
b812e6d093c819dc65ce55b13491963e0780eda0d0bd1577603e81948","src/unix/bsd/ap=
ple/mod.rs":"0931fd351d585728e6384d7b952b8d816e9acdb9c86c172324445f3c33f692=
ca","src/unix/bsd/freebsdlike/dragonfly/errno.rs":"8295b8bb0dfd38d2cdb4d919=
2cdeeb534cc6c3b208170e64615fa3e0edb3e578","src/unix/bsd/freebsdlike/dragonf=
ly/mod.rs":"f2e78625fe1eb14f43e730a3987eba888cb8ac04c23008e7c2d2f7c72258b9e=
6","src/unix/bsd/freebsdlike/freebsd/aarch64.rs":"6c8e216385f53a4bf5f171749=
b57602fc34a4e4b160a44ca31c058cb0c8a2126","src/unix/bsd/freebsdlike/freebsd/=
arm.rs":"59d6a670eea562fb87686e243e0a84603d29a2028a3d4b3f99ccc01bd04d2f47",=
"src/unix/bsd/freebsdlike/freebsd/freebsd11/b64.rs":"9808d152c1196aa647f1b0=
f0cf84dac8c930da7d7f897a44975545e3d9d17681","src/unix/bsd/freebsdlike/freeb=
sd/freebsd11/mod.rs":"e243ae0e89623d4fa9f85afe14369cc5fd5f2028ea715773dbec7=
22ba80dac1f","src/unix/bsd/freebsdlike/freebsd/freebsd12/b64.rs":"61cbe45f8=
499bedb168106b686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/free=
bsdlike/freebsd/freebsd12/mod.rs":"bef9fae288a4f29e941ea369be1cd20b170040e6=
0665a4d49a4a9e79009b72d8","src/unix/bsd/freebsdlike/freebsd/freebsd12/x86_6=
4.rs":"2df36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","s=
rc/unix/bsd/freebsdlike/freebsd/freebsd13/b64.rs":"61cbe45f8499bedb168106b6=
86d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd=
/freebsd13/mod.rs":"3c514e037694ce22724abb3c9c4687defda7f0e3456b615ca73593e=
860e38b16","src/unix/bsd/freebsdlike/freebsd/freebsd13/x86_64.rs":"2df36a7f=
122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/fre=
ebsdlike/freebsd/freebsd14/b64.rs":"61cbe45f8499bedb168106b686d4f8239472f25=
c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd14/mod.=
rs":"318abe48bfdd1c74ecd6afbd6c9329c5c72ce4f7d420edd6be2fc12b223ae32f","src=
/unix/bsd/freebsdlike/freebsd/freebsd14/x86_64.rs":"e7b5863e222d6cc416b6b0f=
be71690fad909e899b4c4ae810bbca117e4fcb650","src/unix/bsd/freebsdlike/freebs=
d/mod.rs":"4c3cd57aaf7fbce072e28e0d2d285b5fda9702e924561d2fd01e49e6ee186a98=
","src/unix/bsd/freebsdlike/freebsd/powerpc.rs":"9ca3f82f88974e6db5569f2d76=
a5a3749b248a31747a6c0da5820492bdfeca42","src/unix/bsd/freebsdlike/freebsd/p=
owerpc64.rs":"2dae3ecc87eac3b11657aa98915def55fc4b5c0de11fe26aae23329a54628=
a9a","src/unix/bsd/freebsdlike/freebsd/riscv64.rs":"fa4bed4c58cad24ba339594=
1c7fa6b11e089551a04714f9561078e400f5b2b62","src/unix/bsd/freebsdlike/freebs=
d/x86.rs":"6766e2ce85e187b306cd3b0b8d7e15b8f4042c5cff81d89b3af69ecc99c70ab0=
","src/unix/bsd/freebsdlike/freebsd/x86_64/align.rs":"0e1f69a88fca1c32874b1=
daf5db3d446fefbe518dca497f096cc9168c39dde70","src/unix/bsd/freebsdlike/free=
bsd/x86_64/mod.rs":"51e4dd0c8ae247bb652feda5adad9333ea3bb30c750c3a3935e0b0e=
47d7803eb","src/unix/bsd/freebsdlike/mod.rs":"0eacafac87fb3a32ef1b85980fece=
2792e70eba9856af18a7407cc35be68ea57","src/unix/bsd/mod.rs":"dad51a24a524e92=
bfe9de3ac3b7d394d86058b9b8a1ccd4efa9bbb5c78e7fa1a","src/unix/bsd/netbsdlike=
/mod.rs":"0a66f7de43710e35a6a546e6c39066aa8b91a6efadb71db88738b0a577fd5537"=
,"src/unix/bsd/netbsdlike/netbsd/aarch64.rs":"65dcb58d11e8d8028401a9d07ca3e=
b4cb4f053e04249cc877353449d84ccc4cb","src/unix/bsd/netbsdlike/netbsd/arm.rs=
":"58cdbb70b0d6f536551f0f3bb3725d2d75c4690db12c26c034e7d6ec4a924452","src/u=
nix/bsd/netbsdlike/netbsd/mod.rs":"90dd33ef20dc3be8aef5bd152a6a06e7ab34f952=
7b3978487b593aaa16a907bd","src/unix/bsd/netbsdlike/netbsd/powerpc.rs":"ee7f=
f5d89d0ed22f531237b5059aa669df93a3b5c489fa641465ace8d405bf41","src/unix/bsd=
/netbsdlike/netbsd/sparc64.rs":"9489f4b3e4566f43bb12dfb92238960613dac7f6a45=
cc13068a8d152b902d7d9","src/unix/bsd/netbsdlike/netbsd/x86.rs":"20692320e36=
bfe028d1a34d16fe12ca77aa909cb02bda167376f98f1a09aefe7","src/unix/bsd/netbsd=
like/netbsd/x86_64.rs":"1afe5ef46b14397cdd68664b5b232e4f5b035b6db1d4cf411c8=
99d51ebca9f30","src/unix/bsd/netbsdlike/openbsd/aarch64.rs":"dd91931d373b7e=
caf6e2de25adadee10d16fa9b12c2cbacdff3eb291e1ba36af","src/unix/bsd/netbsdlik=
e/openbsd/arm.rs":"01580d261bc6447bb327a0d982181b7bdabfa066cee65a30373d3ced=
729ad307","src/unix/bsd/netbsdlike/openbsd/mips64.rs":"8532a189ae10c7d668d9=
d4065da8b05d124e09bd39442c9f74a7f231c43eca48","src/unix/bsd/netbsdlike/open=
bsd/mod.rs":"c27c6673bd3628549083a094219831fd9343129f91067b562781617d2a8871=
48","src/unix/bsd/netbsdlike/openbsd/powerpc.rs":"01580d261bc6447bb327a0d98=
2181b7bdabfa066cee65a30373d3ced729ad307","src/unix/bsd/netbsdlike/openbsd/p=
owerpc64.rs":"1dd5449dd1fd3d51e30ffdeeaece91d0aaf05c710e0ac699fecc5461cfa2c=
28e","src/unix/bsd/netbsdlike/openbsd/riscv64.rs":"1dd5449dd1fd3d51e30ffdee=
aece91d0aaf05c710e0ac699fecc5461cfa2c28e","src/unix/bsd/netbsdlike/openbsd/=
sparc64.rs":"d04fd287afbaa2c5df9d48c94e8374a532a3ba491b424ddf018270c7312f40=
85","src/unix/bsd/netbsdlike/openbsd/x86.rs":"6f7f5c4fde2a2259eb547890cbd86=
570cea04ef85347d7569e94e679448bec87","src/unix/bsd/netbsdlike/openbsd/x86_6=
4.rs":"d31db31630289c85af3339dbe357998a21ca584cbae31607448fe2cf7675a4e1","s=
rc/unix/haiku/b32.rs":"a2efdbf7158a6da341e1db9176b0ab193ba88b449616239ed95d=
ced11f54d87b","src/unix/haiku/b64.rs":"ff8115367d3d7d354f792d6176dfaaa26353=
f57056197b563bf4681f91ff7985","src/unix/haiku/mod.rs":"d7ec086b73db4f727991=
79627aa6330a513dcf786b06e19c75ff884d1235948e","src/unix/haiku/native.rs":"d=
bfcbf4954a79d1df2ff58e0590bbcb8c57dfc7a32392aa73ee4726b66bd6cc8","src/unix/=
haiku/x86_64.rs":"3ec3aeeb7ed208b8916f3e32d42bfd085ff5e16936a1a35d9a52789f0=
43b7237","src/unix/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae10=
ceccefeed9debb3bbe08777fc682","src/unix/hermit/mod.rs":"a1494a0bddf301cceb0=
d9b8529a84b5882fe855ceae77a1c4e8d6034e705e26c","src/unix/hermit/x86_64.rs":=
"ab832b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/uni=
x/linux_like/android/b32/arm.rs":"ce582de7e983a33d3bfad13075c53aac9016cee35=
f06ad8653ee9072c3ec2564","src/unix/linux_like/android/b32/mod.rs":"7c173e03=
75119bf06a3081652faede95e5bcd6858e7576b7533d037978737c8f","src/unix/linux_l=
ike/android/b32/x86/align.rs":"812914e4241df82e32b12375ca3374615dc3a4bdd4cf=
31f0423c5815320c0dab","src/unix/linux_like/android/b32/x86/mod.rs":"e6d107e=
fbcd37b5b85dfa18f683300cbf768ffa0237997a9fa52b184a53323ac","src/unix/linux_=
like/android/b64/aarch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3ee2faf=
6fcae3770f9e505cddca35c7b","src/unix/linux_like/android/b64/aarch64/int128.=
rs":"1735f6f5c56770d20dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de","src=
/unix/linux_like/android/b64/aarch64/mod.rs":"10e963e29ff209703de6336c99cca=
96fd79789438d34c82a693eae56e8916c3c","src/unix/linux_like/android/b64/mod.r=
s":"71e4fcbe952bfa4a5f9022f3972e906917b38f729b9d8ef57cd5d179104894ac","src/=
unix/linux_like/android/b64/riscv64/align.rs":"0bf138f84e5327d8339bcd4adf07=
1a6832b516445e597552c82bbd881095e3a8","src/unix/linux_like/android/b64/risc=
v64/mod.rs":"19d4bf2237c47127eba9144e0b82e995bc079315e719179a91813b0ae7b0e4=
9d","src/unix/linux_like/android/b64/x86_64/align.rs":"7169d07a9fd4716f7512=
719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/android/=
b64/x86_64/mod.rs":"4ec2de11a9b65c4325b7b991f0b99a414975e0e61ba8668caca5d92=
1e9b314d1","src/unix/linux_like/android/mod.rs":"66a9e38a47493a42b3b1c32552=
4f3c944e74d1e3e8ecce3cc276ec08fecab13b","src/unix/linux_like/emscripten/ali=
gn.rs":"86c95cbed7a7161b1f23ee06843e7b0e2340ad92b2cb86fe2a8ef3e0e8c36216","=
src/unix/linux_like/emscripten/mod.rs":"67d6b90f539f746aa3290ea7f9d3f3f8d2d=
8a6557233584004ed5697f7821a50","src/unix/linux_like/emscripten/no_align.rs"=
:"0128e4aa721a9902754828b61b5ec7d8a86619983ed1e0544a85d35b1051fad6","src/un=
ix/linux_like/linux/align.rs":"bc5abcd38e2320171e0981e773c9c5fe3e0d5a66fdff=
049228f6a1acad80ef8b","src/unix/linux_like/linux/arch/generic/mod.rs":"fb5d=
e1368cabae03d3ea0152159b7685a9d91efdecee4c5b83efc085ffef8a73","src/unix/lin=
ux_like/linux/arch/mips/mod.rs":"75814e198d1a9a6808be3a5e5edb1bfdc57f75b063=
94e9040739be363c09d82f","src/unix/linux_like/linux/arch/mod.rs":"5bd5361f8a=
6ab4e18bbba6da9f92c164ae252b15a0ed10064812544aa1fdf198","src/unix/linux_lik=
e/linux/arch/powerpc/mod.rs":"bef6b7af9e5e2b4e5545c9c7e3e23a8b743277a0ed958=
53e7eddc38e44299f02","src/unix/linux_like/linux/arch/sparc/mod.rs":"91593ec=
0440f1dd8f8e612028f432c44c14089286e2aca50e10511ab942db8c3","src/unix/linux_=
like/linux/gnu/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec72519573=
15afa53a7b9f936","src/unix/linux_like/linux/gnu/b32/arm/align.rs":"6ec0eb3e=
e93f7ae99fd714b4deabfb5e97fbcefd8c26f5a45fb8e7150899cdeb","src/unix/linux_l=
ike/linux/gnu/b32/arm/mod.rs":"9ab3e97b579a9122690cd01026e14528862860346b70=
0aafbb755a7e04054f7f","src/unix/linux_like/linux/gnu/b32/csky/align.rs":"3f=
ed009dc9af3cc81be7087da9d2d7d1f39845e4497e290259c5cdbae25f039d","src/unix/l=
inux_like/linux/gnu/b32/csky/mod.rs":"4c21d6e7463bb22f00b984294893d12c84018=
d5d26ec661d6a30f4a9625ba639","src/unix/linux_like/linux/gnu/b32/m68k/align.=
rs":"8faa92f77a9232c035418d45331774e64a9a841d99c91791570a203bf2b45bcb","src=
/unix/linux_like/linux/gnu/b32/m68k/mod.rs":"6aab7f1b864e9691d14aa7d389f717=
c4077b8eed72a7f11e3b8c7fef245e4046","src/unix/linux_like/linux/gnu/b32/mips=
/align.rs":"429fb5e005cb7143602d430098b6ebfb7d360685b194f333dfd587472ae954e=
e","src/unix/linux_like/linux/gnu/b32/mips/mod.rs":"6b9a5dac6f937ddc1453e80=
8e3c43502c87143332df9e43ac64fb8b1eda6c116","src/unix/linux_like/linux/gnu/b=
32/mod.rs":"b56625dd20dd48a8699034d349ef089c540c0ddcbf8a3481d598d101f8b40b7=
8","src/unix/linux_like/linux/gnu/b32/powerpc.rs":"5c5d90326b54b57b98eff474=
5fe7a3fb02f053b2dc782241a73e807b491936a3","src/unix/linux_like/linux/gnu/b3=
2/riscv32/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd37543ef=
e86621b119","src/unix/linux_like/linux/gnu/b32/riscv32/mod.rs":"491a9a97cf7=
12985b75d3ad714691ef60898d88c78bc386a6917de0a6774cc26","src/unix/linux_like=
/linux/gnu/b32/sparc/align.rs":"21adbed27df73e2d1ed934aaf733a643003d7baf2bd=
e9c48ea440895bcca6d41","src/unix/linux_like/linux/gnu/b32/sparc/mod.rs":"80=
894eece66e9348f45d1b07ad37c757ea694bbd10ed49d3f920b34e9f51a9a3","src/unix/l=
inux_like/linux/gnu/b32/x86/align.rs":"e4bafdc4a519a7922a81b37a62bbfd1177a2=
f620890eef8f1fbc47162e9eb413","src/unix/linux_like/linux/gnu/b32/x86/mod.rs=
":"c703cc5e9de2dc31d9e5831bfb6f354d6e3518b2ae02263f68a9a70f1c0167e2","src/u=
nix/linux_like/linux/gnu/b64/aarch64/align.rs":"fdf1c72375a2167699157e0dd82=
5422690bb6719f7bc69515a2e5846d0431d7c","src/unix/linux_like/linux/gnu/b64/a=
arch64/fallback.rs":"832e7487249c1c0bb6e9911ce3f7d32ca22378e42392ab83c56915=
cbc59d8be3","src/unix/linux_like/linux/gnu/b64/aarch64/ilp32.rs":"bf4611b73=
7813deef6787babf6c01698605f3b75482269b8546318667bc68e29","src/unix/linux_li=
ke/linux/gnu/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426442f09724d9b2052=
b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/gnu/b64/aarch64/lp64=
.rs":"11a950697fdda0258c6e37c6b13993348c8de4134105ed4faa79358e53175072","sr=
c/unix/linux_like/linux/gnu/b64/aarch64/mod.rs":"172495fbfdf659b9b825148bff=
c2b62704f63fc872428617e868eb15802c9978","src/unix/linux_like/linux/gnu/b64/=
loongarch64/align.rs":"060aa33cc737966c691aab8511c5c5729e551458ce18d0e284e0=
d45f39beeb60","src/unix/linux_like/linux/gnu/b64/loongarch64/mod.rs":"18eda=
da8aa5d4127d9aa1bd81c62b5a4209f1efd8b2b2631e801c9e855ab1480","src/unix/linu=
x_like/linux/gnu/b64/mips64/align.rs":"7169d07a9fd4716f7512719aec9fda5d8bed=
306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/linux/gnu/b64/mips64/mod=
.rs":"628c410b9aaec3c8f43838a28616b577a1d6de60a9799b09bb884d80281f96eb","sr=
c/unix/linux_like/linux/gnu/b64/mod.rs":"6a160ef25439c4fecdb0e3bd0b81874226=
3c791364da874d4febd3aa644ec8e2","src/unix/linux_like/linux/gnu/b64/powerpc6=
4/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268130=
d9","src/unix/linux_like/linux/gnu/b64/powerpc64/mod.rs":"c778a136f06c2ffea=
cea19fa14ce79b828f91b67a002dec5ce87289bae36234e","src/unix/linux_like/linux=
/gnu/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd=
37543efe86621b119","src/unix/linux_like/linux/gnu/b64/riscv64/mod.rs":"c8f0=
7efc5ddd5d874f1ebc329cd6907818d132ac3e30f4f2a4b04be3fb388551","src/unix/lin=
ux_like/linux/gnu/b64/s390x.rs":"a2fd9277c2dcf76f7a16a3bcca745d5a9932c765c0=
dc2feb31c3641be25eb0aa","src/unix/linux_like/linux/gnu/b64/sparc64/align.rs=
":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268130d9","src/u=
nix/linux_like/linux/gnu/b64/sparc64/mod.rs":"e8047e9966a2b90063e0151a0278c=
54885e7b323286cf5ab55cbaf151fc772d3","src/unix/linux_like/linux/gnu/b64/x86=
_64/align.rs":"62e822478356db4a73b6bbd1b36d825b893939ab4b308ec11b0578bcc4b4=
9769","src/unix/linux_like/linux/gnu/b64/x86_64/mod.rs":"891e595d33714b9883=
b92f0554d1d361fba2b6c3f6cac09a288252f44c6ec667","src/unix/linux_like/linux/=
gnu/b64/x86_64/not_x32.rs":"38f74ce15d9662ce4818815a2b87be1618d5e45f190f7e4=
db84ff3285b4421fb","src/unix/linux_like/linux/gnu/b64/x86_64/x32.rs":"b2021=
8a11364a6dec87f96d6c0d8b19e660697ab09ad5ee0e9b3a9dafedaaebb","src/unix/linu=
x_like/linux/gnu/mod.rs":"47dd970aedda9c70429741d7c9892a0d5d264e9abcb1c41d5=
bb913a86f0a5362","src/unix/linux_like/linux/gnu/no_align.rs":"9cd223135de75=
315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/linux_like/l=
inux/mod.rs":"1582c09db7b752af0f796a4cba8aa2bb4ecea895c551a2219e76047bcce74=
a23","src/unix/linux_like/linux/musl/b32/arm/align.rs":"3e8ac052c1043764776=
b54c93ba4260e061df998631737a897d9d47d54f7b80c","src/unix/linux_like/linux/m=
usl/b32/arm/mod.rs":"de0473ef4455fa461c00442f041ec110e6667614b00bb23385f35a=
f95d24f668","src/unix/linux_like/linux/musl/b32/hexagon.rs":"4f9a5b3b45bc97=
0611597f40add2c489de0fa8ad9dd77629e4daa1755c5e2918","src/unix/linux_like/li=
nux/musl/b32/mips/align.rs":"429fb5e005cb7143602d430098b6ebfb7d360685b194f3=
33dfd587472ae954ee","src/unix/linux_like/linux/musl/b32/mips/mod.rs":"8c7de=
54a04495204772b4bd622b6d34696d27b73ea9e097eb53afa1a7806e31f","src/unix/linu=
x_like/linux/musl/b32/mod.rs":"31677597fd9544c4b1ec1477628288f6273fabbc06e3=
8f33da862ad55f019ce1","src/unix/linux_like/linux/musl/b32/powerpc.rs":"539d=
b45fb9de65bb498f9fab739404146428fd5ecd4b39ef5d6d8c4e8215fb29","src/unix/lin=
ux_like/linux/musl/b32/riscv32/align.rs":"efd2accf33b87de7c7547903359a5da89=
6edc33cd6c719552c7474b60d4a5d48","src/unix/linux_like/linux/musl/b32/riscv3=
2/mod.rs":"0576807c1dd05e2114c3d0c819ae5a99fb5668262de6f9eabbda73d974a6fd29=
","src/unix/linux_like/linux/musl/b32/x86/align.rs":"08e77fbd7435d7dec2ff56=
932433bece3f02e47ce810f89004a275a86d39cbe1","src/unix/linux_like/linux/musl=
/b32/x86/mod.rs":"2237891b538b0b601aca13dfd9bfd030cdf98479e813c3d195ec2639b=
e88ee14","src/unix/linux_like/linux/musl/b64/aarch64/align.rs":"6ba32725d24=
d7d8e6aa111f3b57aafa318f83b606abe96561329151829821133","src/unix/linux_like=
/linux/musl/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426442f09724d9b2052b=
46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/musl/b64/aarch64/mod.=
rs":"54331c1112bc89cf35c0ebe0a974cb219d5167869ddd347e97faf1ec8c54cfec","src=
/unix/linux_like/linux/musl/b64/mips64.rs":"f606383f7a3639c508172becb2f1d25=
51b86dbd9bfceeef18871f94a30ed8d80","src/unix/linux_like/linux/musl/b64/mod.=
rs":"8275e7a108c71f180de71b86f74baa1e35d9e915befb8ab8191d2a2fe76d3bb9","src=
/unix/linux_like/linux/musl/b64/powerpc64.rs":"6308c2d4b27deab7cc062ffdb1a0=
277126a1bc6ccea84f7276150f062df9f6a6","src/unix/linux_like/linux/musl/b64/r=
iscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd37543efe86=
621b119","src/unix/linux_like/linux/musl/b64/riscv64/mod.rs":"e6c51d3d20b7b=
409dec3d7f41256a8a0366eabc7cf4db32a237e0ac7c8aa78fa","src/unix/linux_like/l=
inux/musl/b64/s390x.rs":"fbf661b30015e315639b900a0eecf868c6fe50245460ac9389=
1e1e8f5c55835a","src/unix/linux_like/linux/musl/b64/x86_64/align.rs":"77309=
276ad7a42cbe59ca381f23590b7a143aded05555b34a5b307b808cbca6e","src/unix/linu=
x_like/linux/musl/b64/x86_64/mod.rs":"e5d18b648529b09b35d161120016283f5e2ff=
54e28f60c031c63139901fe713a","src/unix/linux_like/linux/musl/lfs64.rs":"3e4=
fb381f3a0756520bde0f1692d4fa45e4ae8133bf7d7c64b0e3fdd512f235f","src/unix/li=
nux_like/linux/musl/mod.rs":"452e8a1bd998c6a2d026b84e148506cae01706e632cdda=
286fb70cc58c0fa357","src/unix/linux_like/linux/no_align.rs":"62cdca0e011937=
aaf09a51ca86d9f0ee0fdb05f61ec3c058e6a5d5fa6357d784","src/unix/linux_like/li=
nux/non_exhaustive.rs":"181a05bf94fdb911db83ce793b993bd6548a4115b306a7ef3c1=
0f745a8fea3e9","src/unix/linux_like/linux/uclibc/align.rs":"9ed16138d8e439b=
d90930845a65eafa7ebd67366e6bf633936d44014f6e4c959","src/unix/linux_like/lin=
ux/uclibc/arm/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec725195731=
5afa53a7b9f936","src/unix/linux_like/linux/uclibc/arm/mod.rs":"50288ff9e411=
ab0966da24838f2c2a5618021bc19c422a04f577b2979ef4081e","src/unix/linux_like/=
linux/uclibc/arm/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c=
85a76f8316c86653db25","src/unix/linux_like/linux/uclibc/mips/mips32/align.r=
s":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936","src/=
unix/linux_like/linux/uclibc/mips/mips32/mod.rs":"d0c4434e2bf813372c418a8f5=
16c706cdccc9f7be2f0921b2207b0afdb66fe81","src/unix/linux_like/linux/uclibc/=
mips/mips32/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76=
f8316c86653db25","src/unix/linux_like/linux/uclibc/mips/mips64/align.rs":"a=
7bdcb18a37a2d91e64d5fad83ea3edc78f5412adb28f77ab077dbb26dd08b2d","src/unix/=
linux_like/linux/uclibc/mips/mips64/mod.rs":"3f38ee6a4690b9d7594be20d216467=
a34d955f7653c2c8ce1e6147daeb53f1e0","src/unix/linux_like/linux/uclibc/mips/=
mips64/no_align.rs":"4a18e3875698c85229599225ac3401a2a40da87e77b2ad4ef47c6f=
cd5a24ed30","src/unix/linux_like/linux/uclibc/mips/mod.rs":"a048fce1c2d9b1a=
d57305642e8ad05ca0f0c7e4753267a2e2d6b4fee5db3b072","src/unix/linux_like/lin=
ux/uclibc/mod.rs":"1c3d25cddcfefa2bd17bdc81550826be31a08eef235e13f825f169a5=
029c8bca","src/unix/linux_like/linux/uclibc/no_align.rs":"3f28637046524618a=
daa1012e26cb7ffe94b9396e6b518cccdc69d59f274d709","src/unix/linux_like/linux=
/uclibc/x86_64/l4re.rs":"024eba5753e852dbdd212427351affe7e83f9916c1864bce41=
4d7aa2618f192e","src/unix/linux_like/linux/uclibc/x86_64/mod.rs":"196d03aff=
befb85716937c15904831e731eb222ee906e05e42102d639a8152ea","src/unix/linux_li=
ke/linux/uclibc/x86_64/other.rs":"42c3f71e58cabba373f6a55a623f3c31b85049eb6=
4824c09c2b082b3b2d6a0a8","src/unix/linux_like/mod.rs":"45c98e7a0fad03b03c4c=
76f11a80e2423873f0a6563e35c60309a29b2c8ff44f","src/unix/mod.rs":"dd4ce377ba=
9517182e718848739a5c3f58cdbbcd4ee467eef9aaf8df5aed5053","src/unix/newlib/aa=
rch64/mod.rs":"bac93836a9a57b2c710f32f852e92a4d11ad6759ab0fb6ad33e71d60e532=
78af","src/unix/newlib/align.rs":"28aaf87fafbc6b312622719d472d8cf65f9e5467d=
15339df5f73e66d8502b28a","src/unix/newlib/arm/mod.rs":"cbba6b3e957eceb49680=
6e60de8725a23ff3fa0015983b4b4fa27b233732b526","src/unix/newlib/espidf/mod.r=
s":"816f235f4aa4baabba7f2606b31d0fdb03988c52194c966728de8690bf17299d","src/=
unix/newlib/generic.rs":"eab066d9f0a0f3eb53cc1073d01496bba0110989e1f6a59838=
afd19f870cd599","src/unix/newlib/horizon/mod.rs":"7cc5cc120437421db139bfa6a=
90b18168cd3070bdd0f5be96d40fe4c996f3ca1","src/unix/newlib/mod.rs":"9e36de3f=
d78e10cb6b9a59dc5ebe5a1b44a63ccb91433bb33653fb30d0c303c6","src/unix/newlib/=
no_align.rs":"e0743b2179495a9514bc3a4d1781e492878c4ec834ee0085d0891dd1712e8=
2fb","src/unix/newlib/powerpc/mod.rs":"0202ffd57caf75b6afa2c9717750ffb96e37=
5ac33df0ae9609a3f831be393b67","src/unix/newlib/vita/mod.rs":"68e0ce186b44e0=
b3031eb824710e7454dc2a9df98db98120840c3c6f4d885871","src/unix/no_align.rs":=
"c06e95373b9088266e0b14bba0954eef95f93fb2b01d951855e382d22de78e53","src/uni=
x/nto/aarch64.rs":"4709c9afdc8d583be876598e7c238499ee3e8da5bd2baa614d9c7dd4=
14851555","src/unix/nto/mod.rs":"59ab89a8fb6e0a6d22fa968ed4873c2bafa19a0f60=
a90c9a5148816cb7440889","src/unix/nto/neutrino.rs":"799bff4ab01a6424db6c5a2=
b76aa5679826d41495f9d13c63485bf13bc80026b","src/unix/nto/x86_64.rs":"a3e18e=
93c2999da1cd7a6f748a4b60c07aefb73d8ea2aafec19a84cfb040bc8e","src/unix/redox=
/mod.rs":"73658b0d28c82a122875aa2b45c489834f4de58c378add7932bbaf3ffb2ae789"=
,"src/unix/solarish/compat.rs":"00f1ee3faec9da69204e42f025f6735dd13d894071a=
154425dcc43ecbdd06e7f","src/unix/solarish/illumos.rs":"cd93c2d84722bbf9933a=
92842a8998eb0b2afc962f50bc2546ad127b82809fa7","src/unix/solarish/mod.rs":"b=
1660c631a599a3355116e7485b88ab2f8f2929c2e37851a763431387b902f14","src/unix/=
solarish/solaris.rs":"41b350a89ddf01cd12a10f93640f92be53be0b0d976021cdc08da=
17bf3e72edf","src/unix/solarish/x86.rs":"e86e806df0caed72765040eaa2f3c88319=
8d1aa91508540adf9b7008c77f522e","src/unix/solarish/x86_64.rs":"ec2b01f194eb=
8a6a27133c57681da195a949e03098f3ea1e847227a9c09ef5fc","src/unix/solarish/x8=
6_common.rs":"ac869d9c3c95645c22460468391eb1982023c3a8e02b9e06a72e3aef3d5f1=
eac","src/vxworks/aarch64.rs":"98f0afdc511cd02557e506c21fed6737585490a1dce7=
a9d4941d08c437762b99","src/vxworks/arm.rs":"acb7968ce99fe3f4abdf39d98f8133d=
21a4fba435b8ef7084777cb181d788e88","src/vxworks/mod.rs":"e4edcbcf43a325e738=
c9465507594d0c87abf3f0e2b9b046c1425f8d44bdad0f","src/vxworks/powerpc.rs":"a=
cb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788e88","src/vxwor=
ks/powerpc64.rs":"98f0afdc511cd02557e506c21fed6737585490a1dce7a9d4941d08c43=
7762b99","src/vxworks/x86.rs":"552f007f38317620b23889cb7c49d1d1158412524390=
60122f52f434fbc6e5ba","src/vxworks/x86_64.rs":"018d92be3ad628a129eff9f2f5df=
bc0883d8b8e5f2fa917b900a7f98ed6b514a","src/wasi.rs":"09ee3b3348b212b050f6ca=
8ae008a28679ea44a375674307a4e7c9ca0d3ed7d5","src/windows/gnu/align.rs":"b2c=
13ec1b9f3b39a75c452c80c951dff9d0215e31d77e883b4502afb31794647","src/windows=
/gnu/mod.rs":"3c8c7edb7cdf5d0c44af936db2a94869585c69dfabeef30571b4f4e383757=
67a","src/windows/mod.rs":"9fdc5e1c62c441abef7bc62a7343efb2041edc24db9ac0ef=
c0f74df55b69e249","src/windows/msvc/mod.rs":"c068271e00fca6b62bc4bf44bcf142=
cfc38caeded9b6c4e01d1ceef3ccf986f4","src/xous.rs":"eb0675f25ba01f73072d2b70=
907fb8abb1148facefe5a20756c49250f3d65fae","tests/const_fn.rs":"cb75a1f0864f=
926aebe79118fc34d51a0d1ade2c20a394e7774c7e545f21f1f4"},"package":"9cdc71e17=
332e86d2e1d38c1f99edcb6288ee11b815fb1a4b049eaa2114d369b"}
-\ No newline at end of file
diff --git a/meta/recipes-devtools/rust/files/0004-musl-Define-O_LARGEFILE-=
for-riscv32.patch b/meta/recipes-devtools/rust/files/0004-musl-Define-O_LAR=
GEFILE-for-riscv32.patch
deleted file mode 100644
index fe7de706c2f3..000000000000
--- a/meta/recipes-devtools/rust/files/0004-musl-Define-O_LARGEFILE-for-ris=
cv32.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From b042f5da5e35c55e90832ad19edd4e23217f3eb0 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 8 Apr 2023 09:19:53 -0700
-Subject: [PATCH 4/5] musl: Define O_LARGEFILE for riscv32
-
-Upstream-Status: Backport [https://github.com/rust-lang/libc/pull/3302/com=
mits/b042f5da5e35c55e90832ad19edd4e23217f3eb0]
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
----
- src/unix/linux_like/linux/musl/b32/riscv32/mod.rs | 1 +
- 1 file changed, 1 insertion(+)
-
-Index: rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/ris=
cv32/mod.rs
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.74.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b32/r=
iscv32/mod.rs
-+++ rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/riscv3=
2/mod.rs
-@@ -355,6 +355,7 @@ pub const __SIZEOF_PTHREAD_MUTEXATTR_T:
- pub const __SIZEOF_PTHREAD_BARRIERATTR_T: usize =3D 4;
- pub const O_DIRECT: ::c_int =3D 16384;
- pub const O_DIRECTORY: ::c_int =3D 65536;
-+pub const O_LARGEFILE: ::c_int =3D 0o0100000;
- pub const O_NOFOLLOW: ::c_int =3D 131072;
- pub const MAP_HUGETLB: ::c_int =3D 262144;
- pub const MAP_LOCKED: ::c_int =3D 8192;
-Index: rustc-1.74.0-src/vendor/libc/.cargo-checksum.json
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.74.0-src.orig/vendor/libc/.cargo-checksum.json
-+++ rustc-1.74.0-src/vendor/libc/.cargo-checksum.json
-@@ -1 +1 @@
--{"files":{"CONTRIBUTING.md":"bdc90b52cf803faac96e594069a86dd8ea150d5ba7fb=
3e6cadfc08dac4c7b0ce","Cargo.toml":"a58e58fa9bde015e08609ea2f17e56c5df7c82a=
a6f3fa1a144c02ee4715227b9","LICENSE-APACHE":"62c7a1e35f56406896d7aa7ca52d0c=
c0d272ac022b5d2796e7d6905db8a3636a","LICENSE-MIT":"a8d47ff51ca256f56a8932db=
a07660672dbfe3004257ca8de708aac1415937a1","README.md":"ecc47e284f8d007fc048=
666d5108dd41cdc440ab9eedfe8c47d1634613522787","build.rs":"9e94683e94db80e82=
82fce07549cf748d9037852fb06df1c7596bea2ed130d50","rustfmt.toml":"eaa2ea84fc=
1ba0359b77680804903e07bb38d257ab11986b95b158e460f787b2","src/fixed_width_in=
ts.rs":"7f986e5f5e68d25ef04d386fd2f640e8be8f15427a8d4a458ea01d26b8dca0ca","=
src/fuchsia/aarch64.rs":"893fcec48142d273063ffd814dca33fbec92205fd39ada9707=
5f85201d803996","src/fuchsia/align.rs":"ae1cf8f011a99737eabeb14ffff768e60f1=
3b13363d7646744dbb0f443dab3d6","src/fuchsia/mod.rs":"30f4dc83ef120300d61896=
696512436377c5f36f1431d98ab7e01e498c0c47d5","src/fuchsia/no_align.rs":"303f=
3f1b255e0088b5715094353cf00476131d8e94e6aebb3f469557771c8b8a","src/fuchsia/=
riscv64.rs":"617cd75e79e0e20f664db764a4dc2a396d9fd11a4d95371acd91ed4811293b=
11","src/fuchsia/x86_64.rs":"93a3632b5cf67d2a6bcb7dc0a558605252d5fe689e0f38=
d8aa2ec5852255ac87","src/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f3=
68ae10ceccefeed9debb3bbe08777fc682","src/hermit/mod.rs":"d3bfce41e4463d4be8=
020a2d063c9bfa8b665f45f1cc6cbf3163f5d01e7cb21f","src/hermit/x86_64.rs":"ab8=
32b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/lib.rs"=
:"24111461547739f3646f95bcb66c43f2ae679a727ff5938299434c522c02e458","src/ma=
cros.rs":"b457eb028b8e8ab3c24bb7292b874ad4e491edbb83594f6a3da024df5348c088"=
,"src/psp.rs":"dd31aabd46171d474ec5828372e28588935120e7355c90c105360d8fa926=
4c1c","src/sgx.rs":"16a95cdefc81c5ee00d8353a60db363c4cc3e0f75abcd5d0144723f=
2a306ed1b","src/solid/aarch64.rs":"a726e47f324adf73a4a0b67a2c183408d0cad105=
ae66acf36db37a42ab7f8707","src/solid/arm.rs":"e39a4f74ebbef3b97b8c95758ad74=
1123d84ed3eb48d9cf4f1f4872097fc27fe","src/solid/mod.rs":"5f4151dca5132e4b4e=
4c23ab9737e12856dddbdc0ca3f7dbc004328ef3c8acde","src/switch.rs":"9da3dd39b3=
de45a7928789926e8572d00e1e11a39e6f7289a1349aadce90edba","src/unix/aix/mod.r=
s":"54229b5e774669c16912112e8b50fa938db76f534971222a11723a05195a0948","src/=
unix/aix/powerpc64.rs":"cf374d81139d45f9d77c6a764f640bfbf7e0a5903689652c829=
6f8e10d55169b","src/unix/align.rs":"2cdc7c826ef7ae61f5171c5ae8c445a743d86f1=
a7f2d9d7e4ceeec56d6874f65","src/unix/bsd/apple/b32/align.rs":"ec833a747866f=
e19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b3=
2/mod.rs":"2546ad3eb6aecb95f916648bc63264117c92b4b4859532b34cb011e4c75a5a72=
","src/unix/bsd/apple/b64/aarch64/align.rs":"2eaf0f561a32bdcbf4e0477c8895d5=
e7bcb5cdebd5fef7b4df2ca8e38e144d94","src/unix/bsd/apple/b64/aarch64/mod.rs"=
:"44c217a4f263afe7a97435de9323d20a96c37836f899ca0925306d4b7e073c27","src/un=
ix/bsd/apple/b64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d1=
5fa68884c40b0e26c","src/unix/bsd/apple/b64/mod.rs":"f5e278a1af7fb358891d1c9=
be4eb7e815aaca0c5cb738d0c3604ba2208a856f7","src/unix/bsd/apple/b64/x86_64/a=
lign.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c"=
,"src/unix/bsd/apple/b64/x86_64/mod.rs":"8c87c5855038aae5d433c8f5eb3b29b0a1=
75879a0245342b3bfd83bdf4cfd936","src/unix/bsd/apple/long_array.rs":"3cf1f19=
b812e6d093c819dc65ce55b13491963e0780eda0d0bd1577603e81948","src/unix/bsd/ap=
ple/mod.rs":"0931fd351d585728e6384d7b952b8d816e9acdb9c86c172324445f3c33f692=
ca","src/unix/bsd/freebsdlike/dragonfly/errno.rs":"8295b8bb0dfd38d2cdb4d919=
2cdeeb534cc6c3b208170e64615fa3e0edb3e578","src/unix/bsd/freebsdlike/dragonf=
ly/mod.rs":"f2e78625fe1eb14f43e730a3987eba888cb8ac04c23008e7c2d2f7c72258b9e=
6","src/unix/bsd/freebsdlike/freebsd/aarch64.rs":"6c8e216385f53a4bf5f171749=
b57602fc34a4e4b160a44ca31c058cb0c8a2126","src/unix/bsd/freebsdlike/freebsd/=
arm.rs":"59d6a670eea562fb87686e243e0a84603d29a2028a3d4b3f99ccc01bd04d2f47",=
"src/unix/bsd/freebsdlike/freebsd/freebsd11/b64.rs":"9808d152c1196aa647f1b0=
f0cf84dac8c930da7d7f897a44975545e3d9d17681","src/unix/bsd/freebsdlike/freeb=
sd/freebsd11/mod.rs":"e243ae0e89623d4fa9f85afe14369cc5fd5f2028ea715773dbec7=
22ba80dac1f","src/unix/bsd/freebsdlike/freebsd/freebsd12/b64.rs":"61cbe45f8=
499bedb168106b686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/free=
bsdlike/freebsd/freebsd12/mod.rs":"bef9fae288a4f29e941ea369be1cd20b170040e6=
0665a4d49a4a9e79009b72d8","src/unix/bsd/freebsdlike/freebsd/freebsd12/x86_6=
4.rs":"2df36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","s=
rc/unix/bsd/freebsdlike/freebsd/freebsd13/b64.rs":"61cbe45f8499bedb168106b6=
86d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd=
/freebsd13/mod.rs":"3c514e037694ce22724abb3c9c4687defda7f0e3456b615ca73593e=
860e38b16","src/unix/bsd/freebsdlike/freebsd/freebsd13/x86_64.rs":"2df36a7f=
122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/fre=
ebsdlike/freebsd/freebsd14/b64.rs":"61cbe45f8499bedb168106b686d4f8239472f25=
c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd14/mod.=
rs":"318abe48bfdd1c74ecd6afbd6c9329c5c72ce4f7d420edd6be2fc12b223ae32f","src=
/unix/bsd/freebsdlike/freebsd/freebsd14/x86_64.rs":"e7b5863e222d6cc416b6b0f=
be71690fad909e899b4c4ae810bbca117e4fcb650","src/unix/bsd/freebsdlike/freebs=
d/mod.rs":"4c3cd57aaf7fbce072e28e0d2d285b5fda9702e924561d2fd01e49e6ee186a98=
","src/unix/bsd/freebsdlike/freebsd/powerpc.rs":"9ca3f82f88974e6db5569f2d76=
a5a3749b248a31747a6c0da5820492bdfeca42","src/unix/bsd/freebsdlike/freebsd/p=
owerpc64.rs":"2dae3ecc87eac3b11657aa98915def55fc4b5c0de11fe26aae23329a54628=
a9a","src/unix/bsd/freebsdlike/freebsd/riscv64.rs":"fa4bed4c58cad24ba339594=
1c7fa6b11e089551a04714f9561078e400f5b2b62","src/unix/bsd/freebsdlike/freebs=
d/x86.rs":"6766e2ce85e187b306cd3b0b8d7e15b8f4042c5cff81d89b3af69ecc99c70ab0=
","src/unix/bsd/freebsdlike/freebsd/x86_64/align.rs":"0e1f69a88fca1c32874b1=
daf5db3d446fefbe518dca497f096cc9168c39dde70","src/unix/bsd/freebsdlike/free=
bsd/x86_64/mod.rs":"51e4dd0c8ae247bb652feda5adad9333ea3bb30c750c3a3935e0b0e=
47d7803eb","src/unix/bsd/freebsdlike/mod.rs":"0eacafac87fb3a32ef1b85980fece=
2792e70eba9856af18a7407cc35be68ea57","src/unix/bsd/mod.rs":"dad51a24a524e92=
bfe9de3ac3b7d394d86058b9b8a1ccd4efa9bbb5c78e7fa1a","src/unix/bsd/netbsdlike=
/mod.rs":"0a66f7de43710e35a6a546e6c39066aa8b91a6efadb71db88738b0a577fd5537"=
,"src/unix/bsd/netbsdlike/netbsd/aarch64.rs":"65dcb58d11e8d8028401a9d07ca3e=
b4cb4f053e04249cc877353449d84ccc4cb","src/unix/bsd/netbsdlike/netbsd/arm.rs=
":"58cdbb70b0d6f536551f0f3bb3725d2d75c4690db12c26c034e7d6ec4a924452","src/u=
nix/bsd/netbsdlike/netbsd/mod.rs":"90dd33ef20dc3be8aef5bd152a6a06e7ab34f952=
7b3978487b593aaa16a907bd","src/unix/bsd/netbsdlike/netbsd/powerpc.rs":"ee7f=
f5d89d0ed22f531237b5059aa669df93a3b5c489fa641465ace8d405bf41","src/unix/bsd=
/netbsdlike/netbsd/sparc64.rs":"9489f4b3e4566f43bb12dfb92238960613dac7f6a45=
cc13068a8d152b902d7d9","src/unix/bsd/netbsdlike/netbsd/x86.rs":"20692320e36=
bfe028d1a34d16fe12ca77aa909cb02bda167376f98f1a09aefe7","src/unix/bsd/netbsd=
like/netbsd/x86_64.rs":"1afe5ef46b14397cdd68664b5b232e4f5b035b6db1d4cf411c8=
99d51ebca9f30","src/unix/bsd/netbsdlike/openbsd/aarch64.rs":"dd91931d373b7e=
caf6e2de25adadee10d16fa9b12c2cbacdff3eb291e1ba36af","src/unix/bsd/netbsdlik=
e/openbsd/arm.rs":"01580d261bc6447bb327a0d982181b7bdabfa066cee65a30373d3ced=
729ad307","src/unix/bsd/netbsdlike/openbsd/mips64.rs":"8532a189ae10c7d668d9=
d4065da8b05d124e09bd39442c9f74a7f231c43eca48","src/unix/bsd/netbsdlike/open=
bsd/mod.rs":"c27c6673bd3628549083a094219831fd9343129f91067b562781617d2a8871=
48","src/unix/bsd/netbsdlike/openbsd/powerpc.rs":"01580d261bc6447bb327a0d98=
2181b7bdabfa066cee65a30373d3ced729ad307","src/unix/bsd/netbsdlike/openbsd/p=
owerpc64.rs":"1dd5449dd1fd3d51e30ffdeeaece91d0aaf05c710e0ac699fecc5461cfa2c=
28e","src/unix/bsd/netbsdlike/openbsd/riscv64.rs":"1dd5449dd1fd3d51e30ffdee=
aece91d0aaf05c710e0ac699fecc5461cfa2c28e","src/unix/bsd/netbsdlike/openbsd/=
sparc64.rs":"d04fd287afbaa2c5df9d48c94e8374a532a3ba491b424ddf018270c7312f40=
85","src/unix/bsd/netbsdlike/openbsd/x86.rs":"6f7f5c4fde2a2259eb547890cbd86=
570cea04ef85347d7569e94e679448bec87","src/unix/bsd/netbsdlike/openbsd/x86_6=
4.rs":"d31db31630289c85af3339dbe357998a21ca584cbae31607448fe2cf7675a4e1","s=
rc/unix/haiku/b32.rs":"a2efdbf7158a6da341e1db9176b0ab193ba88b449616239ed95d=
ced11f54d87b","src/unix/haiku/b64.rs":"ff8115367d3d7d354f792d6176dfaaa26353=
f57056197b563bf4681f91ff7985","src/unix/haiku/mod.rs":"d7ec086b73db4f727991=
79627aa6330a513dcf786b06e19c75ff884d1235948e","src/unix/haiku/native.rs":"d=
bfcbf4954a79d1df2ff58e0590bbcb8c57dfc7a32392aa73ee4726b66bd6cc8","src/unix/=
haiku/x86_64.rs":"3ec3aeeb7ed208b8916f3e32d42bfd085ff5e16936a1a35d9a52789f0=
43b7237","src/unix/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae10=
ceccefeed9debb3bbe08777fc682","src/unix/hermit/mod.rs":"a1494a0bddf301cceb0=
d9b8529a84b5882fe855ceae77a1c4e8d6034e705e26c","src/unix/hermit/x86_64.rs":=
"ab832b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/uni=
x/linux_like/android/b32/arm.rs":"ce582de7e983a33d3bfad13075c53aac9016cee35=
f06ad8653ee9072c3ec2564","src/unix/linux_like/android/b32/mod.rs":"7c173e03=
75119bf06a3081652faede95e5bcd6858e7576b7533d037978737c8f","src/unix/linux_l=
ike/android/b32/x86/align.rs":"812914e4241df82e32b12375ca3374615dc3a4bdd4cf=
31f0423c5815320c0dab","src/unix/linux_like/android/b32/x86/mod.rs":"e6d107e=
fbcd37b5b85dfa18f683300cbf768ffa0237997a9fa52b184a53323ac","src/unix/linux_=
like/android/b64/aarch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3ee2faf=
6fcae3770f9e505cddca35c7b","src/unix/linux_like/android/b64/aarch64/int128.=
rs":"1735f6f5c56770d20dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de","src=
/unix/linux_like/android/b64/aarch64/mod.rs":"10e963e29ff209703de6336c99cca=
96fd79789438d34c82a693eae56e8916c3c","src/unix/linux_like/android/b64/mod.r=
s":"71e4fcbe952bfa4a5f9022f3972e906917b38f729b9d8ef57cd5d179104894ac","src/=
unix/linux_like/android/b64/riscv64/align.rs":"0bf138f84e5327d8339bcd4adf07=
1a6832b516445e597552c82bbd881095e3a8","src/unix/linux_like/android/b64/risc=
v64/mod.rs":"19d4bf2237c47127eba9144e0b82e995bc079315e719179a91813b0ae7b0e4=
9d","src/unix/linux_like/android/b64/x86_64/align.rs":"7169d07a9fd4716f7512=
719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/android/=
b64/x86_64/mod.rs":"4ec2de11a9b65c4325b7b991f0b99a414975e0e61ba8668caca5d92=
1e9b314d1","src/unix/linux_like/android/mod.rs":"66a9e38a47493a42b3b1c32552=
4f3c944e74d1e3e8ecce3cc276ec08fecab13b","src/unix/linux_like/emscripten/ali=
gn.rs":"86c95cbed7a7161b1f23ee06843e7b0e2340ad92b2cb86fe2a8ef3e0e8c36216","=
src/unix/linux_like/emscripten/mod.rs":"67d6b90f539f746aa3290ea7f9d3f3f8d2d=
8a6557233584004ed5697f7821a50","src/unix/linux_like/emscripten/no_align.rs"=
:"0128e4aa721a9902754828b61b5ec7d8a86619983ed1e0544a85d35b1051fad6","src/un=
ix/linux_like/linux/align.rs":"bc5abcd38e2320171e0981e773c9c5fe3e0d5a66fdff=
049228f6a1acad80ef8b","src/unix/linux_like/linux/arch/generic/mod.rs":"fb5d=
e1368cabae03d3ea0152159b7685a9d91efdecee4c5b83efc085ffef8a73","src/unix/lin=
ux_like/linux/arch/mips/mod.rs":"75814e198d1a9a6808be3a5e5edb1bfdc57f75b063=
94e9040739be363c09d82f","src/unix/linux_like/linux/arch/mod.rs":"5bd5361f8a=
6ab4e18bbba6da9f92c164ae252b15a0ed10064812544aa1fdf198","src/unix/linux_lik=
e/linux/arch/powerpc/mod.rs":"bef6b7af9e5e2b4e5545c9c7e3e23a8b743277a0ed958=
53e7eddc38e44299f02","src/unix/linux_like/linux/arch/sparc/mod.rs":"91593ec=
0440f1dd8f8e612028f432c44c14089286e2aca50e10511ab942db8c3","src/unix/linux_=
like/linux/gnu/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec72519573=
15afa53a7b9f936","src/unix/linux_like/linux/gnu/b32/arm/align.rs":"6ec0eb3e=
e93f7ae99fd714b4deabfb5e97fbcefd8c26f5a45fb8e7150899cdeb","src/unix/linux_l=
ike/linux/gnu/b32/arm/mod.rs":"9ab3e97b579a9122690cd01026e14528862860346b70=
0aafbb755a7e04054f7f","src/unix/linux_like/linux/gnu/b32/csky/align.rs":"3f=
ed009dc9af3cc81be7087da9d2d7d1f39845e4497e290259c5cdbae25f039d","src/unix/l=
inux_like/linux/gnu/b32/csky/mod.rs":"4c21d6e7463bb22f00b984294893d12c84018=
d5d26ec661d6a30f4a9625ba639","src/unix/linux_like/linux/gnu/b32/m68k/align.=
rs":"8faa92f77a9232c035418d45331774e64a9a841d99c91791570a203bf2b45bcb","src=
/unix/linux_like/linux/gnu/b32/m68k/mod.rs":"6aab7f1b864e9691d14aa7d389f717=
c4077b8eed72a7f11e3b8c7fef245e4046","src/unix/linux_like/linux/gnu/b32/mips=
/align.rs":"429fb5e005cb7143602d430098b6ebfb7d360685b194f333dfd587472ae954e=
e","src/unix/linux_like/linux/gnu/b32/mips/mod.rs":"6b9a5dac6f937ddc1453e80=
8e3c43502c87143332df9e43ac64fb8b1eda6c116","src/unix/linux_like/linux/gnu/b=
32/mod.rs":"b56625dd20dd48a8699034d349ef089c540c0ddcbf8a3481d598d101f8b40b7=
8","src/unix/linux_like/linux/gnu/b32/powerpc.rs":"5c5d90326b54b57b98eff474=
5fe7a3fb02f053b2dc782241a73e807b491936a3","src/unix/linux_like/linux/gnu/b3=
2/riscv32/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd37543ef=
e86621b119","src/unix/linux_like/linux/gnu/b32/riscv32/mod.rs":"491a9a97cf7=
12985b75d3ad714691ef60898d88c78bc386a6917de0a6774cc26","src/unix/linux_like=
/linux/gnu/b32/sparc/align.rs":"21adbed27df73e2d1ed934aaf733a643003d7baf2bd=
e9c48ea440895bcca6d41","src/unix/linux_like/linux/gnu/b32/sparc/mod.rs":"80=
894eece66e9348f45d1b07ad37c757ea694bbd10ed49d3f920b34e9f51a9a3","src/unix/l=
inux_like/linux/gnu/b32/x86/align.rs":"e4bafdc4a519a7922a81b37a62bbfd1177a2=
f620890eef8f1fbc47162e9eb413","src/unix/linux_like/linux/gnu/b32/x86/mod.rs=
":"c703cc5e9de2dc31d9e5831bfb6f354d6e3518b2ae02263f68a9a70f1c0167e2","src/u=
nix/linux_like/linux/gnu/b64/aarch64/align.rs":"fdf1c72375a2167699157e0dd82=
5422690bb6719f7bc69515a2e5846d0431d7c","src/unix/linux_like/linux/gnu/b64/a=
arch64/fallback.rs":"832e7487249c1c0bb6e9911ce3f7d32ca22378e42392ab83c56915=
cbc59d8be3","src/unix/linux_like/linux/gnu/b64/aarch64/ilp32.rs":"bf4611b73=
7813deef6787babf6c01698605f3b75482269b8546318667bc68e29","src/unix/linux_li=
ke/linux/gnu/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426442f09724d9b2052=
b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/gnu/b64/aarch64/lp64=
.rs":"11a950697fdda0258c6e37c6b13993348c8de4134105ed4faa79358e53175072","sr=
c/unix/linux_like/linux/gnu/b64/aarch64/mod.rs":"172495fbfdf659b9b825148bff=
c2b62704f63fc872428617e868eb15802c9978","src/unix/linux_like/linux/gnu/b64/=
loongarch64/align.rs":"060aa33cc737966c691aab8511c5c5729e551458ce18d0e284e0=
d45f39beeb60","src/unix/linux_like/linux/gnu/b64/loongarch64/mod.rs":"18eda=
da8aa5d4127d9aa1bd81c62b5a4209f1efd8b2b2631e801c9e855ab1480","src/unix/linu=
x_like/linux/gnu/b64/mips64/align.rs":"7169d07a9fd4716f7512719aec9fda5d8bed=
306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/linux/gnu/b64/mips64/mod=
.rs":"628c410b9aaec3c8f43838a28616b577a1d6de60a9799b09bb884d80281f96eb","sr=
c/unix/linux_like/linux/gnu/b64/mod.rs":"6a160ef25439c4fecdb0e3bd0b81874226=
3c791364da874d4febd3aa644ec8e2","src/unix/linux_like/linux/gnu/b64/powerpc6=
4/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268130=
d9","src/unix/linux_like/linux/gnu/b64/powerpc64/mod.rs":"c778a136f06c2ffea=
cea19fa14ce79b828f91b67a002dec5ce87289bae36234e","src/unix/linux_like/linux=
/gnu/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd=
37543efe86621b119","src/unix/linux_like/linux/gnu/b64/riscv64/mod.rs":"c8f0=
7efc5ddd5d874f1ebc329cd6907818d132ac3e30f4f2a4b04be3fb388551","src/unix/lin=
ux_like/linux/gnu/b64/s390x.rs":"a2fd9277c2dcf76f7a16a3bcca745d5a9932c765c0=
dc2feb31c3641be25eb0aa","src/unix/linux_like/linux/gnu/b64/sparc64/align.rs=
":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268130d9","src/u=
nix/linux_like/linux/gnu/b64/sparc64/mod.rs":"e8047e9966a2b90063e0151a0278c=
54885e7b323286cf5ab55cbaf151fc772d3","src/unix/linux_like/linux/gnu/b64/x86=
_64/align.rs":"62e822478356db4a73b6bbd1b36d825b893939ab4b308ec11b0578bcc4b4=
9769","src/unix/linux_like/linux/gnu/b64/x86_64/mod.rs":"891e595d33714b9883=
b92f0554d1d361fba2b6c3f6cac09a288252f44c6ec667","src/unix/linux_like/linux/=
gnu/b64/x86_64/not_x32.rs":"38f74ce15d9662ce4818815a2b87be1618d5e45f190f7e4=
db84ff3285b4421fb","src/unix/linux_like/linux/gnu/b64/x86_64/x32.rs":"b2021=
8a11364a6dec87f96d6c0d8b19e660697ab09ad5ee0e9b3a9dafedaaebb","src/unix/linu=
x_like/linux/gnu/mod.rs":"47dd970aedda9c70429741d7c9892a0d5d264e9abcb1c41d5=
bb913a86f0a5362","src/unix/linux_like/linux/gnu/no_align.rs":"9cd223135de75=
315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/linux_like/l=
inux/mod.rs":"1582c09db7b752af0f796a4cba8aa2bb4ecea895c551a2219e76047bcce74=
a23","src/unix/linux_like/linux/musl/b32/arm/align.rs":"3e8ac052c1043764776=
b54c93ba4260e061df998631737a897d9d47d54f7b80c","src/unix/linux_like/linux/m=
usl/b32/arm/mod.rs":"de0473ef4455fa461c00442f041ec110e6667614b00bb23385f35a=
f95d24f668","src/unix/linux_like/linux/musl/b32/hexagon.rs":"4f9a5b3b45bc97=
0611597f40add2c489de0fa8ad9dd77629e4daa1755c5e2918","src/unix/linux_like/li=
nux/musl/b32/mips/align.rs":"429fb5e005cb7143602d430098b6ebfb7d360685b194f3=
33dfd587472ae954ee","src/unix/linux_like/linux/musl/b32/mips/mod.rs":"8c7de=
54a04495204772b4bd622b6d34696d27b73ea9e097eb53afa1a7806e31f","src/unix/linu=
x_like/linux/musl/b32/mod.rs":"31677597fd9544c4b1ec1477628288f6273fabbc06e3=
8f33da862ad55f019ce1","src/unix/linux_like/linux/musl/b32/powerpc.rs":"539d=
b45fb9de65bb498f9fab739404146428fd5ecd4b39ef5d6d8c4e8215fb29","src/unix/lin=
ux_like/linux/musl/b32/riscv32/align.rs":"efd2accf33b87de7c7547903359a5da89=
6edc33cd6c719552c7474b60d4a5d48","src/unix/linux_like/linux/musl/b32/riscv3=
2/mod.rs":"0576807c1dd05e2114c3d0c819ae5a99fb5668262de6f9eabbda73d974a6fd29=
","src/unix/linux_like/linux/musl/b32/x86/align.rs":"08e77fbd7435d7dec2ff56=
932433bece3f02e47ce810f89004a275a86d39cbe1","src/unix/linux_like/linux/musl=
/b32/x86/mod.rs":"2237891b538b0b601aca13dfd9bfd030cdf98479e813c3d195ec2639b=
e88ee14","src/unix/linux_like/linux/musl/b64/aarch64/align.rs":"6ba32725d24=
d7d8e6aa111f3b57aafa318f83b606abe96561329151829821133","src/unix/linux_like=
/linux/musl/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426442f09724d9b2052b=
46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/musl/b64/aarch64/mod.=
rs":"54331c1112bc89cf35c0ebe0a974cb219d5167869ddd347e97faf1ec8c54cfec","src=
/unix/linux_like/linux/musl/b64/mips64.rs":"f606383f7a3639c508172becb2f1d25=
51b86dbd9bfceeef18871f94a30ed8d80","src/unix/linux_like/linux/musl/b64/mod.=
rs":"8275e7a108c71f180de71b86f74baa1e35d9e915befb8ab8191d2a2fe76d3bb9","src=
/unix/linux_like/linux/musl/b64/powerpc64.rs":"6308c2d4b27deab7cc062ffdb1a0=
277126a1bc6ccea84f7276150f062df9f6a6","src/unix/linux_like/linux/musl/b64/r=
iscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd37543efe86=
621b119","src/unix/linux_like/linux/musl/b64/riscv64/mod.rs":"e6c51d3d20b7b=
409dec3d7f41256a8a0366eabc7cf4db32a237e0ac7c8aa78fa","src/unix/linux_like/l=
inux/musl/b64/s390x.rs":"fbf661b30015e315639b900a0eecf868c6fe50245460ac9389=
1e1e8f5c55835a","src/unix/linux_like/linux/musl/b64/x86_64/align.rs":"77309=
276ad7a42cbe59ca381f23590b7a143aded05555b34a5b307b808cbca6e","src/unix/linu=
x_like/linux/musl/b64/x86_64/mod.rs":"e5d18b648529b09b35d161120016283f5e2ff=
54e28f60c031c63139901fe713a","src/unix/linux_like/linux/musl/lfs64.rs":"3e4=
fb381f3a0756520bde0f1692d4fa45e4ae8133bf7d7c64b0e3fdd512f235f","src/unix/li=
nux_like/linux/musl/mod.rs":"452e8a1bd998c6a2d026b84e148506cae01706e632cdda=
286fb70cc58c0fa357","src/unix/linux_like/linux/no_align.rs":"62cdca0e011937=
aaf09a51ca86d9f0ee0fdb05f61ec3c058e6a5d5fa6357d784","src/unix/linux_like/li=
nux/non_exhaustive.rs":"181a05bf94fdb911db83ce793b993bd6548a4115b306a7ef3c1=
0f745a8fea3e9","src/unix/linux_like/linux/uclibc/align.rs":"9ed16138d8e439b=
d90930845a65eafa7ebd67366e6bf633936d44014f6e4c959","src/unix/linux_like/lin=
ux/uclibc/arm/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec725195731=
5afa53a7b9f936","src/unix/linux_like/linux/uclibc/arm/mod.rs":"50288ff9e411=
ab0966da24838f2c2a5618021bc19c422a04f577b2979ef4081e","src/unix/linux_like/=
linux/uclibc/arm/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c=
85a76f8316c86653db25","src/unix/linux_like/linux/uclibc/mips/mips32/align.r=
s":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936","src/=
unix/linux_like/linux/uclibc/mips/mips32/mod.rs":"d0c4434e2bf813372c418a8f5=
16c706cdccc9f7be2f0921b2207b0afdb66fe81","src/unix/linux_like/linux/uclibc/=
mips/mips32/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76=
f8316c86653db25","src/unix/linux_like/linux/uclibc/mips/mips64/align.rs":"a=
7bdcb18a37a2d91e64d5fad83ea3edc78f5412adb28f77ab077dbb26dd08b2d","src/unix/=
linux_like/linux/uclibc/mips/mips64/mod.rs":"3f38ee6a4690b9d7594be20d216467=
a34d955f7653c2c8ce1e6147daeb53f1e0","src/unix/linux_like/linux/uclibc/mips/=
mips64/no_align.rs":"4a18e3875698c85229599225ac3401a2a40da87e77b2ad4ef47c6f=
cd5a24ed30","src/unix/linux_like/linux/uclibc/mips/mod.rs":"a048fce1c2d9b1a=
d57305642e8ad05ca0f0c7e4753267a2e2d6b4fee5db3b072","src/unix/linux_like/lin=
ux/uclibc/mod.rs":"1c3d25cddcfefa2bd17bdc81550826be31a08eef235e13f825f169a5=
029c8bca","src/unix/linux_like/linux/uclibc/no_align.rs":"3f28637046524618a=
daa1012e26cb7ffe94b9396e6b518cccdc69d59f274d709","src/unix/linux_like/linux=
/uclibc/x86_64/l4re.rs":"024eba5753e852dbdd212427351affe7e83f9916c1864bce41=
4d7aa2618f192e","src/unix/linux_like/linux/uclibc/x86_64/mod.rs":"196d03aff=
befb85716937c15904831e731eb222ee906e05e42102d639a8152ea","src/unix/linux_li=
ke/linux/uclibc/x86_64/other.rs":"42c3f71e58cabba373f6a55a623f3c31b85049eb6=
4824c09c2b082b3b2d6a0a8","src/unix/linux_like/mod.rs":"45c98e7a0fad03b03c4c=
76f11a80e2423873f0a6563e35c60309a29b2c8ff44f","src/unix/mod.rs":"dd4ce377ba=
9517182e718848739a5c3f58cdbbcd4ee467eef9aaf8df5aed5053","src/unix/newlib/aa=
rch64/mod.rs":"bac93836a9a57b2c710f32f852e92a4d11ad6759ab0fb6ad33e71d60e532=
78af","src/unix/newlib/align.rs":"28aaf87fafbc6b312622719d472d8cf65f9e5467d=
15339df5f73e66d8502b28a","src/unix/newlib/arm/mod.rs":"cbba6b3e957eceb49680=
6e60de8725a23ff3fa0015983b4b4fa27b233732b526","src/unix/newlib/espidf/mod.r=
s":"816f235f4aa4baabba7f2606b31d0fdb03988c52194c966728de8690bf17299d","src/=
unix/newlib/generic.rs":"eab066d9f0a0f3eb53cc1073d01496bba0110989e1f6a59838=
afd19f870cd599","src/unix/newlib/horizon/mod.rs":"7cc5cc120437421db139bfa6a=
90b18168cd3070bdd0f5be96d40fe4c996f3ca1","src/unix/newlib/mod.rs":"9e36de3f=
d78e10cb6b9a59dc5ebe5a1b44a63ccb91433bb33653fb30d0c303c6","src/unix/newlib/=
no_align.rs":"e0743b2179495a9514bc3a4d1781e492878c4ec834ee0085d0891dd1712e8=
2fb","src/unix/newlib/powerpc/mod.rs":"0202ffd57caf75b6afa2c9717750ffb96e37=
5ac33df0ae9609a3f831be393b67","src/unix/newlib/vita/mod.rs":"68e0ce186b44e0=
b3031eb824710e7454dc2a9df98db98120840c3c6f4d885871","src/unix/no_align.rs":=
"c06e95373b9088266e0b14bba0954eef95f93fb2b01d951855e382d22de78e53","src/uni=
x/nto/aarch64.rs":"4709c9afdc8d583be876598e7c238499ee3e8da5bd2baa614d9c7dd4=
14851555","src/unix/nto/mod.rs":"59ab89a8fb6e0a6d22fa968ed4873c2bafa19a0f60=
a90c9a5148816cb7440889","src/unix/nto/neutrino.rs":"799bff4ab01a6424db6c5a2=
b76aa5679826d41495f9d13c63485bf13bc80026b","src/unix/nto/x86_64.rs":"a3e18e=
93c2999da1cd7a6f748a4b60c07aefb73d8ea2aafec19a84cfb040bc8e","src/unix/redox=
/mod.rs":"73658b0d28c82a122875aa2b45c489834f4de58c378add7932bbaf3ffb2ae789"=
,"src/unix/solarish/compat.rs":"00f1ee3faec9da69204e42f025f6735dd13d894071a=
154425dcc43ecbdd06e7f","src/unix/solarish/illumos.rs":"cd93c2d84722bbf9933a=
92842a8998eb0b2afc962f50bc2546ad127b82809fa7","src/unix/solarish/mod.rs":"b=
1660c631a599a3355116e7485b88ab2f8f2929c2e37851a763431387b902f14","src/unix/=
solarish/solaris.rs":"41b350a89ddf01cd12a10f93640f92be53be0b0d976021cdc08da=
17bf3e72edf","src/unix/solarish/x86.rs":"e86e806df0caed72765040eaa2f3c88319=
8d1aa91508540adf9b7008c77f522e","src/unix/solarish/x86_64.rs":"ec2b01f194eb=
8a6a27133c57681da195a949e03098f3ea1e847227a9c09ef5fc","src/unix/solarish/x8=
6_common.rs":"ac869d9c3c95645c22460468391eb1982023c3a8e02b9e06a72e3aef3d5f1=
eac","src/vxworks/aarch64.rs":"98f0afdc511cd02557e506c21fed6737585490a1dce7=
a9d4941d08c437762b99","src/vxworks/arm.rs":"acb7968ce99fe3f4abdf39d98f8133d=
21a4fba435b8ef7084777cb181d788e88","src/vxworks/mod.rs":"e4edcbcf43a325e738=
c9465507594d0c87abf3f0e2b9b046c1425f8d44bdad0f","src/vxworks/powerpc.rs":"a=
cb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788e88","src/vxwor=
ks/powerpc64.rs":"98f0afdc511cd02557e506c21fed6737585490a1dce7a9d4941d08c43=
7762b99","src/vxworks/x86.rs":"552f007f38317620b23889cb7c49d1d1158412524390=
60122f52f434fbc6e5ba","src/vxworks/x86_64.rs":"018d92be3ad628a129eff9f2f5df=
bc0883d8b8e5f2fa917b900a7f98ed6b514a","src/wasi.rs":"09ee3b3348b212b050f6ca=
8ae008a28679ea44a375674307a4e7c9ca0d3ed7d5","src/windows/gnu/align.rs":"b2c=
13ec1b9f3b39a75c452c80c951dff9d0215e31d77e883b4502afb31794647","src/windows=
/gnu/mod.rs":"3c8c7edb7cdf5d0c44af936db2a94869585c69dfabeef30571b4f4e383757=
67a","src/windows/mod.rs":"9fdc5e1c62c441abef7bc62a7343efb2041edc24db9ac0ef=
c0f74df55b69e249","src/windows/msvc/mod.rs":"c068271e00fca6b62bc4bf44bcf142=
cfc38caeded9b6c4e01d1ceef3ccf986f4","src/xous.rs":"eb0675f25ba01f73072d2b70=
907fb8abb1148facefe5a20756c49250f3d65fae","tests/const_fn.rs":"cb75a1f0864f=
926aebe79118fc34d51a0d1ade2c20a394e7774c7e545f21f1f4"},"package":"9cdc71e17=
332e86d2e1d38c1f99edcb6288ee11b815fb1a4b049eaa2114d369b"}
-\ No newline at end of file
-+{"files":{"CONTRIBUTING.md":"bdc90b52cf803faac96e594069a86dd8ea150d5ba7fb=
3e6cadfc08dac4c7b0ce","Cargo.toml":"a58e58fa9bde015e08609ea2f17e56c5df7c82a=
a6f3fa1a144c02ee4715227b9","LICENSE-APACHE":"62c7a1e35f56406896d7aa7ca52d0c=
c0d272ac022b5d2796e7d6905db8a3636a","LICENSE-MIT":"a8d47ff51ca256f56a8932db=
a07660672dbfe3004257ca8de708aac1415937a1","README.md":"ecc47e284f8d007fc048=
666d5108dd41cdc440ab9eedfe8c47d1634613522787","build.rs":"9e94683e94db80e82=
82fce07549cf748d9037852fb06df1c7596bea2ed130d50","rustfmt.toml":"eaa2ea84fc=
1ba0359b77680804903e07bb38d257ab11986b95b158e460f787b2","src/fixed_width_in=
ts.rs":"7f986e5f5e68d25ef04d386fd2f640e8be8f15427a8d4a458ea01d26b8dca0ca","=
src/fuchsia/aarch64.rs":"893fcec48142d273063ffd814dca33fbec92205fd39ada9707=
5f85201d803996","src/fuchsia/align.rs":"ae1cf8f011a99737eabeb14ffff768e60f1=
3b13363d7646744dbb0f443dab3d6","src/fuchsia/mod.rs":"30f4dc83ef120300d61896=
696512436377c5f36f1431d98ab7e01e498c0c47d5","src/fuchsia/no_align.rs":"303f=
3f1b255e0088b5715094353cf00476131d8e94e6aebb3f469557771c8b8a","src/fuchsia/=
riscv64.rs":"617cd75e79e0e20f664db764a4dc2a396d9fd11a4d95371acd91ed4811293b=
11","src/fuchsia/x86_64.rs":"93a3632b5cf67d2a6bcb7dc0a558605252d5fe689e0f38=
d8aa2ec5852255ac87","src/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f3=
68ae10ceccefeed9debb3bbe08777fc682","src/hermit/mod.rs":"d3bfce41e4463d4be8=
020a2d063c9bfa8b665f45f1cc6cbf3163f5d01e7cb21f","src/hermit/x86_64.rs":"ab8=
32b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/lib.rs"=
:"24111461547739f3646f95bcb66c43f2ae679a727ff5938299434c522c02e458","src/ma=
cros.rs":"b457eb028b8e8ab3c24bb7292b874ad4e491edbb83594f6a3da024df5348c088"=
,"src/psp.rs":"dd31aabd46171d474ec5828372e28588935120e7355c90c105360d8fa926=
4c1c","src/sgx.rs":"16a95cdefc81c5ee00d8353a60db363c4cc3e0f75abcd5d0144723f=
2a306ed1b","src/solid/aarch64.rs":"a726e47f324adf73a4a0b67a2c183408d0cad105=
ae66acf36db37a42ab7f8707","src/solid/arm.rs":"e39a4f74ebbef3b97b8c95758ad74=
1123d84ed3eb48d9cf4f1f4872097fc27fe","src/solid/mod.rs":"5f4151dca5132e4b4e=
4c23ab9737e12856dddbdc0ca3f7dbc004328ef3c8acde","src/switch.rs":"9da3dd39b3=
de45a7928789926e8572d00e1e11a39e6f7289a1349aadce90edba","src/unix/aix/mod.r=
s":"54229b5e774669c16912112e8b50fa938db76f534971222a11723a05195a0948","src/=
unix/aix/powerpc64.rs":"cf374d81139d45f9d77c6a764f640bfbf7e0a5903689652c829=
6f8e10d55169b","src/unix/align.rs":"2cdc7c826ef7ae61f5171c5ae8c445a743d86f1=
a7f2d9d7e4ceeec56d6874f65","src/unix/bsd/apple/b32/align.rs":"ec833a747866f=
e19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b3=
2/mod.rs":"2546ad3eb6aecb95f916648bc63264117c92b4b4859532b34cb011e4c75a5a72=
","src/unix/bsd/apple/b64/aarch64/align.rs":"2eaf0f561a32bdcbf4e0477c8895d5=
e7bcb5cdebd5fef7b4df2ca8e38e144d94","src/unix/bsd/apple/b64/aarch64/mod.rs"=
:"44c217a4f263afe7a97435de9323d20a96c37836f899ca0925306d4b7e073c27","src/un=
ix/bsd/apple/b64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d1=
5fa68884c40b0e26c","src/unix/bsd/apple/b64/mod.rs":"f5e278a1af7fb358891d1c9=
be4eb7e815aaca0c5cb738d0c3604ba2208a856f7","src/unix/bsd/apple/b64/x86_64/a=
lign.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c"=
,"src/unix/bsd/apple/b64/x86_64/mod.rs":"8c87c5855038aae5d433c8f5eb3b29b0a1=
75879a0245342b3bfd83bdf4cfd936","src/unix/bsd/apple/long_array.rs":"3cf1f19=
b812e6d093c819dc65ce55b13491963e0780eda0d0bd1577603e81948","src/unix/bsd/ap=
ple/mod.rs":"0931fd351d585728e6384d7b952b8d816e9acdb9c86c172324445f3c33f692=
ca","src/unix/bsd/freebsdlike/dragonfly/errno.rs":"8295b8bb0dfd38d2cdb4d919=
2cdeeb534cc6c3b208170e64615fa3e0edb3e578","src/unix/bsd/freebsdlike/dragonf=
ly/mod.rs":"f2e78625fe1eb14f43e730a3987eba888cb8ac04c23008e7c2d2f7c72258b9e=
6","src/unix/bsd/freebsdlike/freebsd/aarch64.rs":"6c8e216385f53a4bf5f171749=
b57602fc34a4e4b160a44ca31c058cb0c8a2126","src/unix/bsd/freebsdlike/freebsd/=
arm.rs":"59d6a670eea562fb87686e243e0a84603d29a2028a3d4b3f99ccc01bd04d2f47",=
"src/unix/bsd/freebsdlike/freebsd/freebsd11/b64.rs":"9808d152c1196aa647f1b0=
f0cf84dac8c930da7d7f897a44975545e3d9d17681","src/unix/bsd/freebsdlike/freeb=
sd/freebsd11/mod.rs":"e243ae0e89623d4fa9f85afe14369cc5fd5f2028ea715773dbec7=
22ba80dac1f","src/unix/bsd/freebsdlike/freebsd/freebsd12/b64.rs":"61cbe45f8=
499bedb168106b686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/free=
bsdlike/freebsd/freebsd12/mod.rs":"bef9fae288a4f29e941ea369be1cd20b170040e6=
0665a4d49a4a9e79009b72d8","src/unix/bsd/freebsdlike/freebsd/freebsd12/x86_6=
4.rs":"2df36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","s=
rc/unix/bsd/freebsdlike/freebsd/freebsd13/b64.rs":"61cbe45f8499bedb168106b6=
86d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd=
/freebsd13/mod.rs":"3c514e037694ce22724abb3c9c4687defda7f0e3456b615ca73593e=
860e38b16","src/unix/bsd/freebsdlike/freebsd/freebsd13/x86_64.rs":"2df36a7f=
122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/fre=
ebsdlike/freebsd/freebsd14/b64.rs":"61cbe45f8499bedb168106b686d4f8239472f25=
c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd14/mod.=
rs":"318abe48bfdd1c74ecd6afbd6c9329c5c72ce4f7d420edd6be2fc12b223ae32f","src=
/unix/bsd/freebsdlike/freebsd/freebsd14/x86_64.rs":"e7b5863e222d6cc416b6b0f=
be71690fad909e899b4c4ae810bbca117e4fcb650","src/unix/bsd/freebsdlike/freebs=
d/mod.rs":"4c3cd57aaf7fbce072e28e0d2d285b5fda9702e924561d2fd01e49e6ee186a98=
","src/unix/bsd/freebsdlike/freebsd/powerpc.rs":"9ca3f82f88974e6db5569f2d76=
a5a3749b248a31747a6c0da5820492bdfeca42","src/unix/bsd/freebsdlike/freebsd/p=
owerpc64.rs":"2dae3ecc87eac3b11657aa98915def55fc4b5c0de11fe26aae23329a54628=
a9a","src/unix/bsd/freebsdlike/freebsd/riscv64.rs":"fa4bed4c58cad24ba339594=
1c7fa6b11e089551a04714f9561078e400f5b2b62","src/unix/bsd/freebsdlike/freebs=
d/x86.rs":"6766e2ce85e187b306cd3b0b8d7e15b8f4042c5cff81d89b3af69ecc99c70ab0=
","src/unix/bsd/freebsdlike/freebsd/x86_64/align.rs":"0e1f69a88fca1c32874b1=
daf5db3d446fefbe518dca497f096cc9168c39dde70","src/unix/bsd/freebsdlike/free=
bsd/x86_64/mod.rs":"51e4dd0c8ae247bb652feda5adad9333ea3bb30c750c3a3935e0b0e=
47d7803eb","src/unix/bsd/freebsdlike/mod.rs":"0eacafac87fb3a32ef1b85980fece=
2792e70eba9856af18a7407cc35be68ea57","src/unix/bsd/mod.rs":"dad51a24a524e92=
bfe9de3ac3b7d394d86058b9b8a1ccd4efa9bbb5c78e7fa1a","src/unix/bsd/netbsdlike=
/mod.rs":"0a66f7de43710e35a6a546e6c39066aa8b91a6efadb71db88738b0a577fd5537"=
,"src/unix/bsd/netbsdlike/netbsd/aarch64.rs":"65dcb58d11e8d8028401a9d07ca3e=
b4cb4f053e04249cc877353449d84ccc4cb","src/unix/bsd/netbsdlike/netbsd/arm.rs=
":"58cdbb70b0d6f536551f0f3bb3725d2d75c4690db12c26c034e7d6ec4a924452","src/u=
nix/bsd/netbsdlike/netbsd/mod.rs":"90dd33ef20dc3be8aef5bd152a6a06e7ab34f952=
7b3978487b593aaa16a907bd","src/unix/bsd/netbsdlike/netbsd/powerpc.rs":"ee7f=
f5d89d0ed22f531237b5059aa669df93a3b5c489fa641465ace8d405bf41","src/unix/bsd=
/netbsdlike/netbsd/sparc64.rs":"9489f4b3e4566f43bb12dfb92238960613dac7f6a45=
cc13068a8d152b902d7d9","src/unix/bsd/netbsdlike/netbsd/x86.rs":"20692320e36=
bfe028d1a34d16fe12ca77aa909cb02bda167376f98f1a09aefe7","src/unix/bsd/netbsd=
like/netbsd/x86_64.rs":"1afe5ef46b14397cdd68664b5b232e4f5b035b6db1d4cf411c8=
99d51ebca9f30","src/unix/bsd/netbsdlike/openbsd/aarch64.rs":"dd91931d373b7e=
caf6e2de25adadee10d16fa9b12c2cbacdff3eb291e1ba36af","src/unix/bsd/netbsdlik=
e/openbsd/arm.rs":"01580d261bc6447bb327a0d982181b7bdabfa066cee65a30373d3ced=
729ad307","src/unix/bsd/netbsdlike/openbsd/mips64.rs":"8532a189ae10c7d668d9=
d4065da8b05d124e09bd39442c9f74a7f231c43eca48","src/unix/bsd/netbsdlike/open=
bsd/mod.rs":"c27c6673bd3628549083a094219831fd9343129f91067b562781617d2a8871=
48","src/unix/bsd/netbsdlike/openbsd/powerpc.rs":"01580d261bc6447bb327a0d98=
2181b7bdabfa066cee65a30373d3ced729ad307","src/unix/bsd/netbsdlike/openbsd/p=
owerpc64.rs":"1dd5449dd1fd3d51e30ffdeeaece91d0aaf05c710e0ac699fecc5461cfa2c=
28e","src/unix/bsd/netbsdlike/openbsd/riscv64.rs":"1dd5449dd1fd3d51e30ffdee=
aece91d0aaf05c710e0ac699fecc5461cfa2c28e","src/unix/bsd/netbsdlike/openbsd/=
sparc64.rs":"d04fd287afbaa2c5df9d48c94e8374a532a3ba491b424ddf018270c7312f40=
85","src/unix/bsd/netbsdlike/openbsd/x86.rs":"6f7f5c4fde2a2259eb547890cbd86=
570cea04ef85347d7569e94e679448bec87","src/unix/bsd/netbsdlike/openbsd/x86_6=
4.rs":"d31db31630289c85af3339dbe357998a21ca584cbae31607448fe2cf7675a4e1","s=
rc/unix/haiku/b32.rs":"a2efdbf7158a6da341e1db9176b0ab193ba88b449616239ed95d=
ced11f54d87b","src/unix/haiku/b64.rs":"ff8115367d3d7d354f792d6176dfaaa26353=
f57056197b563bf4681f91ff7985","src/unix/haiku/mod.rs":"d7ec086b73db4f727991=
79627aa6330a513dcf786b06e19c75ff884d1235948e","src/unix/haiku/native.rs":"d=
bfcbf4954a79d1df2ff58e0590bbcb8c57dfc7a32392aa73ee4726b66bd6cc8","src/unix/=
haiku/x86_64.rs":"3ec3aeeb7ed208b8916f3e32d42bfd085ff5e16936a1a35d9a52789f0=
43b7237","src/unix/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae10=
ceccefeed9debb3bbe08777fc682","src/unix/hermit/mod.rs":"a1494a0bddf301cceb0=
d9b8529a84b5882fe855ceae77a1c4e8d6034e705e26c","src/unix/hermit/x86_64.rs":=
"ab832b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/uni=
x/linux_like/android/b32/arm.rs":"ce582de7e983a33d3bfad13075c53aac9016cee35=
f06ad8653ee9072c3ec2564","src/unix/linux_like/android/b32/mod.rs":"7c173e03=
75119bf06a3081652faede95e5bcd6858e7576b7533d037978737c8f","src/unix/linux_l=
ike/android/b32/x86/align.rs":"812914e4241df82e32b12375ca3374615dc3a4bdd4cf=
31f0423c5815320c0dab","src/unix/linux_like/android/b32/x86/mod.rs":"e6d107e=
fbcd37b5b85dfa18f683300cbf768ffa0237997a9fa52b184a53323ac","src/unix/linux_=
like/android/b64/aarch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3ee2faf=
6fcae3770f9e505cddca35c7b","src/unix/linux_like/android/b64/aarch64/int128.=
rs":"1735f6f5c56770d20dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de","src=
/unix/linux_like/android/b64/aarch64/mod.rs":"10e963e29ff209703de6336c99cca=
96fd79789438d34c82a693eae56e8916c3c","src/unix/linux_like/android/b64/mod.r=
s":"71e4fcbe952bfa4a5f9022f3972e906917b38f729b9d8ef57cd5d179104894ac","src/=
unix/linux_like/android/b64/riscv64/align.rs":"0bf138f84e5327d8339bcd4adf07=
1a6832b516445e597552c82bbd881095e3a8","src/unix/linux_like/android/b64/risc=
v64/mod.rs":"19d4bf2237c47127eba9144e0b82e995bc079315e719179a91813b0ae7b0e4=
9d","src/unix/linux_like/android/b64/x86_64/align.rs":"7169d07a9fd4716f7512=
719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/android/=
b64/x86_64/mod.rs":"4ec2de11a9b65c4325b7b991f0b99a414975e0e61ba8668caca5d92=
1e9b314d1","src/unix/linux_like/android/mod.rs":"66a9e38a47493a42b3b1c32552=
4f3c944e74d1e3e8ecce3cc276ec08fecab13b","src/unix/linux_like/emscripten/ali=
gn.rs":"86c95cbed7a7161b1f23ee06843e7b0e2340ad92b2cb86fe2a8ef3e0e8c36216","=
src/unix/linux_like/emscripten/mod.rs":"67d6b90f539f746aa3290ea7f9d3f3f8d2d=
8a6557233584004ed5697f7821a50","src/unix/linux_like/emscripten/no_align.rs"=
:"0128e4aa721a9902754828b61b5ec7d8a86619983ed1e0544a85d35b1051fad6","src/un=
ix/linux_like/linux/align.rs":"bc5abcd38e2320171e0981e773c9c5fe3e0d5a66fdff=
049228f6a1acad80ef8b","src/unix/linux_like/linux/arch/generic/mod.rs":"fb5d=
e1368cabae03d3ea0152159b7685a9d91efdecee4c5b83efc085ffef8a73","src/unix/lin=
ux_like/linux/arch/mips/mod.rs":"75814e198d1a9a6808be3a5e5edb1bfdc57f75b063=
94e9040739be363c09d82f","src/unix/linux_like/linux/arch/mod.rs":"5bd5361f8a=
6ab4e18bbba6da9f92c164ae252b15a0ed10064812544aa1fdf198","src/unix/linux_lik=
e/linux/arch/powerpc/mod.rs":"bef6b7af9e5e2b4e5545c9c7e3e23a8b743277a0ed958=
53e7eddc38e44299f02","src/unix/linux_like/linux/arch/sparc/mod.rs":"91593ec=
0440f1dd8f8e612028f432c44c14089286e2aca50e10511ab942db8c3","src/unix/linux_=
like/linux/gnu/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec72519573=
15afa53a7b9f936","src/unix/linux_like/linux/gnu/b32/arm/align.rs":"6ec0eb3e=
e93f7ae99fd714b4deabfb5e97fbcefd8c26f5a45fb8e7150899cdeb","src/unix/linux_l=
ike/linux/gnu/b32/arm/mod.rs":"9ab3e97b579a9122690cd01026e14528862860346b70=
0aafbb755a7e04054f7f","src/unix/linux_like/linux/gnu/b32/csky/align.rs":"3f=
ed009dc9af3cc81be7087da9d2d7d1f39845e4497e290259c5cdbae25f039d","src/unix/l=
inux_like/linux/gnu/b32/csky/mod.rs":"4c21d6e7463bb22f00b984294893d12c84018=
d5d26ec661d6a30f4a9625ba639","src/unix/linux_like/linux/gnu/b32/m68k/align.=
rs":"8faa92f77a9232c035418d45331774e64a9a841d99c91791570a203bf2b45bcb","src=
/unix/linux_like/linux/gnu/b32/m68k/mod.rs":"6aab7f1b864e9691d14aa7d389f717=
c4077b8eed72a7f11e3b8c7fef245e4046","src/unix/linux_like/linux/gnu/b32/mips=
/align.rs":"429fb5e005cb7143602d430098b6ebfb7d360685b194f333dfd587472ae954e=
e","src/unix/linux_like/linux/gnu/b32/mips/mod.rs":"6b9a5dac6f937ddc1453e80=
8e3c43502c87143332df9e43ac64fb8b1eda6c116","src/unix/linux_like/linux/gnu/b=
32/mod.rs":"b56625dd20dd48a8699034d349ef089c540c0ddcbf8a3481d598d101f8b40b7=
8","src/unix/linux_like/linux/gnu/b32/powerpc.rs":"5c5d90326b54b57b98eff474=
5fe7a3fb02f053b2dc782241a73e807b491936a3","src/unix/linux_like/linux/gnu/b3=
2/riscv32/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd37543ef=
e86621b119","src/unix/linux_like/linux/gnu/b32/riscv32/mod.rs":"491a9a97cf7=
12985b75d3ad714691ef60898d88c78bc386a6917de0a6774cc26","src/unix/linux_like=
/linux/gnu/b32/sparc/align.rs":"21adbed27df73e2d1ed934aaf733a643003d7baf2bd=
e9c48ea440895bcca6d41","src/unix/linux_like/linux/gnu/b32/sparc/mod.rs":"80=
894eece66e9348f45d1b07ad37c757ea694bbd10ed49d3f920b34e9f51a9a3","src/unix/l=
inux_like/linux/gnu/b32/x86/align.rs":"e4bafdc4a519a7922a81b37a62bbfd1177a2=
f620890eef8f1fbc47162e9eb413","src/unix/linux_like/linux/gnu/b32/x86/mod.rs=
":"c703cc5e9de2dc31d9e5831bfb6f354d6e3518b2ae02263f68a9a70f1c0167e2","src/u=
nix/linux_like/linux/gnu/b64/aarch64/align.rs":"fdf1c72375a2167699157e0dd82=
5422690bb6719f7bc69515a2e5846d0431d7c","src/unix/linux_like/linux/gnu/b64/a=
arch64/fallback.rs":"832e7487249c1c0bb6e9911ce3f7d32ca22378e42392ab83c56915=
cbc59d8be3","src/unix/linux_like/linux/gnu/b64/aarch64/ilp32.rs":"bf4611b73=
7813deef6787babf6c01698605f3b75482269b8546318667bc68e29","src/unix/linux_li=
ke/linux/gnu/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426442f09724d9b2052=
b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/gnu/b64/aarch64/lp64=
.rs":"11a950697fdda0258c6e37c6b13993348c8de4134105ed4faa79358e53175072","sr=
c/unix/linux_like/linux/gnu/b64/aarch64/mod.rs":"172495fbfdf659b9b825148bff=
c2b62704f63fc872428617e868eb15802c9978","src/unix/linux_like/linux/gnu/b64/=
loongarch64/align.rs":"060aa33cc737966c691aab8511c5c5729e551458ce18d0e284e0=
d45f39beeb60","src/unix/linux_like/linux/gnu/b64/loongarch64/mod.rs":"18eda=
da8aa5d4127d9aa1bd81c62b5a4209f1efd8b2b2631e801c9e855ab1480","src/unix/linu=
x_like/linux/gnu/b64/mips64/align.rs":"7169d07a9fd4716f7512719aec9fda5d8bed=
306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/linux/gnu/b64/mips64/mod=
.rs":"628c410b9aaec3c8f43838a28616b577a1d6de60a9799b09bb884d80281f96eb","sr=
c/unix/linux_like/linux/gnu/b64/mod.rs":"6a160ef25439c4fecdb0e3bd0b81874226=
3c791364da874d4febd3aa644ec8e2","src/unix/linux_like/linux/gnu/b64/powerpc6=
4/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268130=
d9","src/unix/linux_like/linux/gnu/b64/powerpc64/mod.rs":"c778a136f06c2ffea=
cea19fa14ce79b828f91b67a002dec5ce87289bae36234e","src/unix/linux_like/linux=
/gnu/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd=
37543efe86621b119","src/unix/linux_like/linux/gnu/b64/riscv64/mod.rs":"c8f0=
7efc5ddd5d874f1ebc329cd6907818d132ac3e30f4f2a4b04be3fb388551","src/unix/lin=
ux_like/linux/gnu/b64/s390x.rs":"a2fd9277c2dcf76f7a16a3bcca745d5a9932c765c0=
dc2feb31c3641be25eb0aa","src/unix/linux_like/linux/gnu/b64/sparc64/align.rs=
":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268130d9","src/u=
nix/linux_like/linux/gnu/b64/sparc64/mod.rs":"e8047e9966a2b90063e0151a0278c=
54885e7b323286cf5ab55cbaf151fc772d3","src/unix/linux_like/linux/gnu/b64/x86=
_64/align.rs":"62e822478356db4a73b6bbd1b36d825b893939ab4b308ec11b0578bcc4b4=
9769","src/unix/linux_like/linux/gnu/b64/x86_64/mod.rs":"891e595d33714b9883=
b92f0554d1d361fba2b6c3f6cac09a288252f44c6ec667","src/unix/linux_like/linux/=
gnu/b64/x86_64/not_x32.rs":"38f74ce15d9662ce4818815a2b87be1618d5e45f190f7e4=
db84ff3285b4421fb","src/unix/linux_like/linux/gnu/b64/x86_64/x32.rs":"b2021=
8a11364a6dec87f96d6c0d8b19e660697ab09ad5ee0e9b3a9dafedaaebb","src/unix/linu=
x_like/linux/gnu/mod.rs":"47dd970aedda9c70429741d7c9892a0d5d264e9abcb1c41d5=
bb913a86f0a5362","src/unix/linux_like/linux/gnu/no_align.rs":"9cd223135de75=
315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/linux_like/l=
inux/mod.rs":"1582c09db7b752af0f796a4cba8aa2bb4ecea895c551a2219e76047bcce74=
a23","src/unix/linux_like/linux/musl/b32/arm/align.rs":"3e8ac052c1043764776=
b54c93ba4260e061df998631737a897d9d47d54f7b80c","src/unix/linux_like/linux/m=
usl/b32/arm/mod.rs":"de0473ef4455fa461c00442f041ec110e6667614b00bb23385f35a=
f95d24f668","src/unix/linux_like/linux/musl/b32/hexagon.rs":"4f9a5b3b45bc97=
0611597f40add2c489de0fa8ad9dd77629e4daa1755c5e2918","src/unix/linux_like/li=
nux/musl/b32/mips/align.rs":"429fb5e005cb7143602d430098b6ebfb7d360685b194f3=
33dfd587472ae954ee","src/unix/linux_like/linux/musl/b32/mips/mod.rs":"8c7de=
54a04495204772b4bd622b6d34696d27b73ea9e097eb53afa1a7806e31f","src/unix/linu=
x_like/linux/musl/b32/mod.rs":"31677597fd9544c4b1ec1477628288f6273fabbc06e3=
8f33da862ad55f019ce1","src/unix/linux_like/linux/musl/b32/powerpc.rs":"539d=
b45fb9de65bb498f9fab739404146428fd5ecd4b39ef5d6d8c4e8215fb29","src/unix/lin=
ux_like/linux/musl/b32/riscv32/align.rs":"efd2accf33b87de7c7547903359a5da89=
6edc33cd6c719552c7474b60d4a5d48","src/unix/linux_like/linux/musl/b32/riscv3=
2/mod.rs":"c91bb80655c91061d80dcd48be2e767b979a0a570dbd54fcf2094a9a1e31fad8=
","src/unix/linux_like/linux/musl/b32/x86/align.rs":"08e77fbd7435d7dec2ff56=
932433bece3f02e47ce810f89004a275a86d39cbe1","src/unix/linux_like/linux/musl=
/b32/x86/mod.rs":"2237891b538b0b601aca13dfd9bfd030cdf98479e813c3d195ec2639b=
e88ee14","src/unix/linux_like/linux/musl/b64/aarch64/align.rs":"6ba32725d24=
d7d8e6aa111f3b57aafa318f83b606abe96561329151829821133","src/unix/linux_like=
/linux/musl/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426442f09724d9b2052b=
46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/musl/b64/aarch64/mod.=
rs":"54331c1112bc89cf35c0ebe0a974cb219d5167869ddd347e97faf1ec8c54cfec","src=
/unix/linux_like/linux/musl/b64/mips64.rs":"f606383f7a3639c508172becb2f1d25=
51b86dbd9bfceeef18871f94a30ed8d80","src/unix/linux_like/linux/musl/b64/mod.=
rs":"8275e7a108c71f180de71b86f74baa1e35d9e915befb8ab8191d2a2fe76d3bb9","src=
/unix/linux_like/linux/musl/b64/powerpc64.rs":"6308c2d4b27deab7cc062ffdb1a0=
277126a1bc6ccea84f7276150f062df9f6a6","src/unix/linux_like/linux/musl/b64/r=
iscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd37543efe86=
621b119","src/unix/linux_like/linux/musl/b64/riscv64/mod.rs":"e6c51d3d20b7b=
409dec3d7f41256a8a0366eabc7cf4db32a237e0ac7c8aa78fa","src/unix/linux_like/l=
inux/musl/b64/s390x.rs":"fbf661b30015e315639b900a0eecf868c6fe50245460ac9389=
1e1e8f5c55835a","src/unix/linux_like/linux/musl/b64/x86_64/align.rs":"77309=
276ad7a42cbe59ca381f23590b7a143aded05555b34a5b307b808cbca6e","src/unix/linu=
x_like/linux/musl/b64/x86_64/mod.rs":"e5d18b648529b09b35d161120016283f5e2ff=
54e28f60c031c63139901fe713a","src/unix/linux_like/linux/musl/lfs64.rs":"3e4=
fb381f3a0756520bde0f1692d4fa45e4ae8133bf7d7c64b0e3fdd512f235f","src/unix/li=
nux_like/linux/musl/mod.rs":"452e8a1bd998c6a2d026b84e148506cae01706e632cdda=
286fb70cc58c0fa357","src/unix/linux_like/linux/no_align.rs":"62cdca0e011937=
aaf09a51ca86d9f0ee0fdb05f61ec3c058e6a5d5fa6357d784","src/unix/linux_like/li=
nux/non_exhaustive.rs":"181a05bf94fdb911db83ce793b993bd6548a4115b306a7ef3c1=
0f745a8fea3e9","src/unix/linux_like/linux/uclibc/align.rs":"9ed16138d8e439b=
d90930845a65eafa7ebd67366e6bf633936d44014f6e4c959","src/unix/linux_like/lin=
ux/uclibc/arm/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec725195731=
5afa53a7b9f936","src/unix/linux_like/linux/uclibc/arm/mod.rs":"50288ff9e411=
ab0966da24838f2c2a5618021bc19c422a04f577b2979ef4081e","src/unix/linux_like/=
linux/uclibc/arm/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c=
85a76f8316c86653db25","src/unix/linux_like/linux/uclibc/mips/mips32/align.r=
s":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936","src/=
unix/linux_like/linux/uclibc/mips/mips32/mod.rs":"d0c4434e2bf813372c418a8f5=
16c706cdccc9f7be2f0921b2207b0afdb66fe81","src/unix/linux_like/linux/uclibc/=
mips/mips32/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76=
f8316c86653db25","src/unix/linux_like/linux/uclibc/mips/mips64/align.rs":"a=
7bdcb18a37a2d91e64d5fad83ea3edc78f5412adb28f77ab077dbb26dd08b2d","src/unix/=
linux_like/linux/uclibc/mips/mips64/mod.rs":"3f38ee6a4690b9d7594be20d216467=
a34d955f7653c2c8ce1e6147daeb53f1e0","src/unix/linux_like/linux/uclibc/mips/=
mips64/no_align.rs":"4a18e3875698c85229599225ac3401a2a40da87e77b2ad4ef47c6f=
cd5a24ed30","src/unix/linux_like/linux/uclibc/mips/mod.rs":"a048fce1c2d9b1a=
d57305642e8ad05ca0f0c7e4753267a2e2d6b4fee5db3b072","src/unix/linux_like/lin=
ux/uclibc/mod.rs":"1c3d25cddcfefa2bd17bdc81550826be31a08eef235e13f825f169a5=
029c8bca","src/unix/linux_like/linux/uclibc/no_align.rs":"3f28637046524618a=
daa1012e26cb7ffe94b9396e6b518cccdc69d59f274d709","src/unix/linux_like/linux=
/uclibc/x86_64/l4re.rs":"024eba5753e852dbdd212427351affe7e83f9916c1864bce41=
4d7aa2618f192e","src/unix/linux_like/linux/uclibc/x86_64/mod.rs":"196d03aff=
befb85716937c15904831e731eb222ee906e05e42102d639a8152ea","src/unix/linux_li=
ke/linux/uclibc/x86_64/other.rs":"42c3f71e58cabba373f6a55a623f3c31b85049eb6=
4824c09c2b082b3b2d6a0a8","src/unix/linux_like/mod.rs":"45c98e7a0fad03b03c4c=
76f11a80e2423873f0a6563e35c60309a29b2c8ff44f","src/unix/mod.rs":"dd4ce377ba=
9517182e718848739a5c3f58cdbbcd4ee467eef9aaf8df5aed5053","src/unix/newlib/aa=
rch64/mod.rs":"bac93836a9a57b2c710f32f852e92a4d11ad6759ab0fb6ad33e71d60e532=
78af","src/unix/newlib/align.rs":"28aaf87fafbc6b312622719d472d8cf65f9e5467d=
15339df5f73e66d8502b28a","src/unix/newlib/arm/mod.rs":"cbba6b3e957eceb49680=
6e60de8725a23ff3fa0015983b4b4fa27b233732b526","src/unix/newlib/espidf/mod.r=
s":"816f235f4aa4baabba7f2606b31d0fdb03988c52194c966728de8690bf17299d","src/=
unix/newlib/generic.rs":"eab066d9f0a0f3eb53cc1073d01496bba0110989e1f6a59838=
afd19f870cd599","src/unix/newlib/horizon/mod.rs":"7cc5cc120437421db139bfa6a=
90b18168cd3070bdd0f5be96d40fe4c996f3ca1","src/unix/newlib/mod.rs":"9e36de3f=
d78e10cb6b9a59dc5ebe5a1b44a63ccb91433bb33653fb30d0c303c6","src/unix/newlib/=
no_align.rs":"e0743b2179495a9514bc3a4d1781e492878c4ec834ee0085d0891dd1712e8=
2fb","src/unix/newlib/powerpc/mod.rs":"0202ffd57caf75b6afa2c9717750ffb96e37=
5ac33df0ae9609a3f831be393b67","src/unix/newlib/vita/mod.rs":"68e0ce186b44e0=
b3031eb824710e7454dc2a9df98db98120840c3c6f4d885871","src/unix/no_align.rs":=
"c06e95373b9088266e0b14bba0954eef95f93fb2b01d951855e382d22de78e53","src/uni=
x/nto/aarch64.rs":"4709c9afdc8d583be876598e7c238499ee3e8da5bd2baa614d9c7dd4=
14851555","src/unix/nto/mod.rs":"59ab89a8fb6e0a6d22fa968ed4873c2bafa19a0f60=
a90c9a5148816cb7440889","src/unix/nto/neutrino.rs":"799bff4ab01a6424db6c5a2=
b76aa5679826d41495f9d13c63485bf13bc80026b","src/unix/nto/x86_64.rs":"a3e18e=
93c2999da1cd7a6f748a4b60c07aefb73d8ea2aafec19a84cfb040bc8e","src/unix/redox=
/mod.rs":"73658b0d28c82a122875aa2b45c489834f4de58c378add7932bbaf3ffb2ae789"=
,"src/unix/solarish/compat.rs":"00f1ee3faec9da69204e42f025f6735dd13d894071a=
154425dcc43ecbdd06e7f","src/unix/solarish/illumos.rs":"cd93c2d84722bbf9933a=
92842a8998eb0b2afc962f50bc2546ad127b82809fa7","src/unix/solarish/mod.rs":"b=
1660c631a599a3355116e7485b88ab2f8f2929c2e37851a763431387b902f14","src/unix/=
solarish/solaris.rs":"41b350a89ddf01cd12a10f93640f92be53be0b0d976021cdc08da=
17bf3e72edf","src/unix/solarish/x86.rs":"e86e806df0caed72765040eaa2f3c88319=
8d1aa91508540adf9b7008c77f522e","src/unix/solarish/x86_64.rs":"ec2b01f194eb=
8a6a27133c57681da195a949e03098f3ea1e847227a9c09ef5fc","src/unix/solarish/x8=
6_common.rs":"ac869d9c3c95645c22460468391eb1982023c3a8e02b9e06a72e3aef3d5f1=
eac","src/vxworks/aarch64.rs":"98f0afdc511cd02557e506c21fed6737585490a1dce7=
a9d4941d08c437762b99","src/vxworks/arm.rs":"acb7968ce99fe3f4abdf39d98f8133d=
21a4fba435b8ef7084777cb181d788e88","src/vxworks/mod.rs":"e4edcbcf43a325e738=
c9465507594d0c87abf3f0e2b9b046c1425f8d44bdad0f","src/vxworks/powerpc.rs":"a=
cb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788e88","src/vxwor=
ks/powerpc64.rs":"98f0afdc511cd02557e506c21fed6737585490a1dce7a9d4941d08c43=
7762b99","src/vxworks/x86.rs":"552f007f38317620b23889cb7c49d1d1158412524390=
60122f52f434fbc6e5ba","src/vxworks/x86_64.rs":"018d92be3ad628a129eff9f2f5df=
bc0883d8b8e5f2fa917b900a7f98ed6b514a","src/wasi.rs":"09ee3b3348b212b050f6ca=
8ae008a28679ea44a375674307a4e7c9ca0d3ed7d5","src/windows/gnu/align.rs":"b2c=
13ec1b9f3b39a75c452c80c951dff9d0215e31d77e883b4502afb31794647","src/windows=
/gnu/mod.rs":"3c8c7edb7cdf5d0c44af936db2a94869585c69dfabeef30571b4f4e383757=
67a","src/windows/mod.rs":"9fdc5e1c62c441abef7bc62a7343efb2041edc24db9ac0ef=
c0f74df55b69e249","src/windows/msvc/mod.rs":"c068271e00fca6b62bc4bf44bcf142=
cfc38caeded9b6c4e01d1ceef3ccf986f4","src/xous.rs":"eb0675f25ba01f73072d2b70=
907fb8abb1148facefe5a20756c49250f3d65fae","tests/const_fn.rs":"cb75a1f0864f=
926aebe79118fc34d51a0d1ade2c20a394e7774c7e545f21f1f4"},"package":"9cdc71e17=
332e86d2e1d38c1f99edcb6288ee11b815fb1a4b049eaa2114d369b"}
-\ No newline at end of file
diff --git a/meta/recipes-devtools/rust/files/0005-musl-Define-SOCK_SEQPACK=
ET-in-common-place.patch b/meta/recipes-devtools/rust/files/0005-musl-Defin=
e-SOCK_SEQPACKET-in-common-place.patch
deleted file mode 100644
index 4c88931d71f0..000000000000
--- a/meta/recipes-devtools/rust/files/0005-musl-Define-SOCK_SEQPACKET-in-c=
ommon-place.patch
+++ /dev/null
@@ -1,115 +0,0 @@
-From e955ae784b0f977979b44964e3fa19dd31469bde Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 8 Apr 2023 09:25:31 -0700
-Subject: [PATCH 5/5] musl: Define SOCK_SEQPACKET in common place
-
-This define is not architecture specific in musl [1]
-
-[1] https://git.musl-libc.org/cgit/musl/tree/include/sys/socket.h#n90
-Upstream-Status: Backport [https://github.com/rust-lang/libc/pull/3302/com=
mits/e955ae784b0f977979b44964e3fa19dd31469bde]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
----
- src/unix/linux_like/linux/musl/b32/arm/mod.rs  | 1 -
- src/unix/linux_like/linux/musl/b32/hexagon.rs  | 1 -
- src/unix/linux_like/linux/musl/b32/mips/mod.rs | 1 -
- src/unix/linux_like/linux/musl/b32/powerpc.rs  | 1 -
- src/unix/linux_like/linux/musl/b32/x86/mod.rs  | 1 -
- src/unix/linux_like/linux/musl/b64/mod.rs      | 2 --
- src/unix/linux_like/linux/musl/mod.rs          | 1 +
- 7 files changed, 1 insertion(+), 7 deletions(-)
-
-Index: rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/arm=
/mod.rs
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.74.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b32/a=
rm/mod.rs
-+++ rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/arm/mo=
d.rs
-@@ -324,7 +324,6 @@ pub const MAP_SYNC: ::c_int =3D 0x080000;
-=20
- pub const SOCK_STREAM: ::c_int =3D 1;
- pub const SOCK_DGRAM: ::c_int =3D 2;
--pub const SOCK_SEQPACKET: ::c_int =3D 5;
-=20
- pub const EDEADLK: ::c_int =3D 35;
- pub const ENAMETOOLONG: ::c_int =3D 36;
-Index: rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/hex=
agon.rs
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.74.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b32/h=
exagon.rs
-+++ rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/hexago=
n.rs
-@@ -292,7 +292,6 @@ pub const SIG_SETMASK: ::c_int =3D 2; // F
- pub const SIG_BLOCK: ::c_int =3D 0x000000;
- pub const SIG_UNBLOCK: ::c_int =3D 0x01;
- pub const SOCK_DGRAM: ::c_int =3D 2;
--pub const SOCK_SEQPACKET: ::c_int =3D 5;
- pub const SOCK_STREAM: ::c_int =3D 1;
- pub const SOL_CAIF: ::c_int =3D 278;
- pub const SOL_IUCV: ::c_int =3D 277;
-Index: rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/mip=
s/mod.rs
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.74.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b32/m=
ips/mod.rs
-+++ rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/mips/m=
od.rs
-@@ -349,7 +349,6 @@ pub const ERFKILL: ::c_int =3D 167;
-=20
- pub const SOCK_STREAM: ::c_int =3D 2;
- pub const SOCK_DGRAM: ::c_int =3D 1;
--pub const SOCK_SEQPACKET: ::c_int =3D 5;
-=20
- pub const SA_ONSTACK: ::c_int =3D 0x08000000;
- pub const SA_SIGINFO: ::c_int =3D 8;
-Index: rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/pow=
erpc.rs
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.74.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b32/p=
owerpc.rs
-+++ rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/powerp=
c.rs
-@@ -260,7 +260,6 @@ pub const PTRACE_SYSEMU_SINGLESTEP: ::c_
-=20
- pub const SOCK_STREAM: ::c_int =3D 1;
- pub const SOCK_DGRAM: ::c_int =3D 2;
--pub const SOCK_SEQPACKET: ::c_int =3D 5;
-=20
- pub const EDEADLK: ::c_int =3D 35;
- pub const ENAMETOOLONG: ::c_int =3D 36;
-Index: rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/x86=
/mod.rs
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.74.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b32/x=
86/mod.rs
-+++ rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/x86/mo=
d.rs
-@@ -313,7 +313,6 @@ pub const MAP_SYNC: ::c_int =3D 0x080000;
-=20
- pub const SOCK_STREAM: ::c_int =3D 1;
- pub const SOCK_DGRAM: ::c_int =3D 2;
--pub const SOCK_SEQPACKET: ::c_int =3D 5;
-=20
- pub const EDEADLK: ::c_int =3D 35;
- pub const ENAMETOOLONG: ::c_int =3D 36;
-Index: rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b64/mod=
.rs
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.74.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b64/m=
od.rs
-+++ rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b64/mod.rs
-@@ -134,8 +134,6 @@ pub const __SIZEOF_PTHREAD_RWLOCK_T: usi
- pub const __SIZEOF_PTHREAD_MUTEX_T: usize =3D 40;
- pub const __SIZEOF_PTHREAD_BARRIER_T: usize =3D 32;
-=20
--pub const SOCK_SEQPACKET: ::c_int =3D 5;
--
- extern "C" {
-     pub fn getrandom(buf: *mut ::c_void, buflen: ::size_t, flags: ::c_uin=
t) -> ::ssize_t;
- }
-Index: rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/mod.rs
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.74.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/mod.rs
-+++ rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/mod.rs
-@@ -545,6 +545,7 @@ pub const POSIX_MADV_DONTNEED: ::c_int =3D
-=20
- pub const MAP_ANONYMOUS: ::c_int =3D MAP_ANON;
-=20
-+pub const SOCK_SEQPACKET: ::c_int =3D 5;
- pub const SOCK_DCCP: ::c_int =3D 6;
- pub const SOCK_NONBLOCK: ::c_int =3D O_NONBLOCK;
- pub const SOCK_PACKET: ::c_int =3D 10;
-Index: rustc-1.74.0-src/vendor/libc/.cargo-checksum.json
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.74.0-src.orig/vendor/libc/.cargo-checksum.json
-+++ rustc-1.74.0-src/vendor/libc/.cargo-checksum.json
-@@ -1 +1 @@
--{"files":{"CONTRIBUTING.md":"bdc90b52cf803faac96e594069a86dd8ea150d5ba7fb=
3e6cadfc08dac4c7b0ce","Cargo.toml":"a58e58fa9bde015e08609ea2f17e56c5df7c82a=
a6f3fa1a144c02ee4715227b9","LICENSE-APACHE":"62c7a1e35f56406896d7aa7ca52d0c=
c0d272ac022b5d2796e7d6905db8a3636a","LICENSE-MIT":"a8d47ff51ca256f56a8932db=
a07660672dbfe3004257ca8de708aac1415937a1","README.md":"ecc47e284f8d007fc048=
666d5108dd41cdc440ab9eedfe8c47d1634613522787","build.rs":"9e94683e94db80e82=
82fce07549cf748d9037852fb06df1c7596bea2ed130d50","rustfmt.toml":"eaa2ea84fc=
1ba0359b77680804903e07bb38d257ab11986b95b158e460f787b2","src/fixed_width_in=
ts.rs":"7f986e5f5e68d25ef04d386fd2f640e8be8f15427a8d4a458ea01d26b8dca0ca","=
src/fuchsia/aarch64.rs":"893fcec48142d273063ffd814dca33fbec92205fd39ada9707=
5f85201d803996","src/fuchsia/align.rs":"ae1cf8f011a99737eabeb14ffff768e60f1=
3b13363d7646744dbb0f443dab3d6","src/fuchsia/mod.rs":"30f4dc83ef120300d61896=
696512436377c5f36f1431d98ab7e01e498c0c47d5","src/fuchsia/no_align.rs":"303f=
3f1b255e0088b5715094353cf00476131d8e94e6aebb3f469557771c8b8a","src/fuchsia/=
riscv64.rs":"617cd75e79e0e20f664db764a4dc2a396d9fd11a4d95371acd91ed4811293b=
11","src/fuchsia/x86_64.rs":"93a3632b5cf67d2a6bcb7dc0a558605252d5fe689e0f38=
d8aa2ec5852255ac87","src/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f3=
68ae10ceccefeed9debb3bbe08777fc682","src/hermit/mod.rs":"d3bfce41e4463d4be8=
020a2d063c9bfa8b665f45f1cc6cbf3163f5d01e7cb21f","src/hermit/x86_64.rs":"ab8=
32b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/lib.rs"=
:"24111461547739f3646f95bcb66c43f2ae679a727ff5938299434c522c02e458","src/ma=
cros.rs":"b457eb028b8e8ab3c24bb7292b874ad4e491edbb83594f6a3da024df5348c088"=
,"src/psp.rs":"dd31aabd46171d474ec5828372e28588935120e7355c90c105360d8fa926=
4c1c","src/sgx.rs":"16a95cdefc81c5ee00d8353a60db363c4cc3e0f75abcd5d0144723f=
2a306ed1b","src/solid/aarch64.rs":"a726e47f324adf73a4a0b67a2c183408d0cad105=
ae66acf36db37a42ab7f8707","src/solid/arm.rs":"e39a4f74ebbef3b97b8c95758ad74=
1123d84ed3eb48d9cf4f1f4872097fc27fe","src/solid/mod.rs":"5f4151dca5132e4b4e=
4c23ab9737e12856dddbdc0ca3f7dbc004328ef3c8acde","src/switch.rs":"9da3dd39b3=
de45a7928789926e8572d00e1e11a39e6f7289a1349aadce90edba","src/unix/aix/mod.r=
s":"54229b5e774669c16912112e8b50fa938db76f534971222a11723a05195a0948","src/=
unix/aix/powerpc64.rs":"cf374d81139d45f9d77c6a764f640bfbf7e0a5903689652c829=
6f8e10d55169b","src/unix/align.rs":"2cdc7c826ef7ae61f5171c5ae8c445a743d86f1=
a7f2d9d7e4ceeec56d6874f65","src/unix/bsd/apple/b32/align.rs":"ec833a747866f=
e19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b3=
2/mod.rs":"2546ad3eb6aecb95f916648bc63264117c92b4b4859532b34cb011e4c75a5a72=
","src/unix/bsd/apple/b64/aarch64/align.rs":"2eaf0f561a32bdcbf4e0477c8895d5=
e7bcb5cdebd5fef7b4df2ca8e38e144d94","src/unix/bsd/apple/b64/aarch64/mod.rs"=
:"44c217a4f263afe7a97435de9323d20a96c37836f899ca0925306d4b7e073c27","src/un=
ix/bsd/apple/b64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d1=
5fa68884c40b0e26c","src/unix/bsd/apple/b64/mod.rs":"f5e278a1af7fb358891d1c9=
be4eb7e815aaca0c5cb738d0c3604ba2208a856f7","src/unix/bsd/apple/b64/x86_64/a=
lign.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c"=
,"src/unix/bsd/apple/b64/x86_64/mod.rs":"8c87c5855038aae5d433c8f5eb3b29b0a1=
75879a0245342b3bfd83bdf4cfd936","src/unix/bsd/apple/long_array.rs":"3cf1f19=
b812e6d093c819dc65ce55b13491963e0780eda0d0bd1577603e81948","src/unix/bsd/ap=
ple/mod.rs":"0931fd351d585728e6384d7b952b8d816e9acdb9c86c172324445f3c33f692=
ca","src/unix/bsd/freebsdlike/dragonfly/errno.rs":"8295b8bb0dfd38d2cdb4d919=
2cdeeb534cc6c3b208170e64615fa3e0edb3e578","src/unix/bsd/freebsdlike/dragonf=
ly/mod.rs":"f2e78625fe1eb14f43e730a3987eba888cb8ac04c23008e7c2d2f7c72258b9e=
6","src/unix/bsd/freebsdlike/freebsd/aarch64.rs":"6c8e216385f53a4bf5f171749=
b57602fc34a4e4b160a44ca31c058cb0c8a2126","src/unix/bsd/freebsdlike/freebsd/=
arm.rs":"59d6a670eea562fb87686e243e0a84603d29a2028a3d4b3f99ccc01bd04d2f47",=
"src/unix/bsd/freebsdlike/freebsd/freebsd11/b64.rs":"9808d152c1196aa647f1b0=
f0cf84dac8c930da7d7f897a44975545e3d9d17681","src/unix/bsd/freebsdlike/freeb=
sd/freebsd11/mod.rs":"e243ae0e89623d4fa9f85afe14369cc5fd5f2028ea715773dbec7=
22ba80dac1f","src/unix/bsd/freebsdlike/freebsd/freebsd12/b64.rs":"61cbe45f8=
499bedb168106b686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/free=
bsdlike/freebsd/freebsd12/mod.rs":"bef9fae288a4f29e941ea369be1cd20b170040e6=
0665a4d49a4a9e79009b72d8","src/unix/bsd/freebsdlike/freebsd/freebsd12/x86_6=
4.rs":"2df36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","s=
rc/unix/bsd/freebsdlike/freebsd/freebsd13/b64.rs":"61cbe45f8499bedb168106b6=
86d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd=
/freebsd13/mod.rs":"3c514e037694ce22724abb3c9c4687defda7f0e3456b615ca73593e=
860e38b16","src/unix/bsd/freebsdlike/freebsd/freebsd13/x86_64.rs":"2df36a7f=
122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/fre=
ebsdlike/freebsd/freebsd14/b64.rs":"61cbe45f8499bedb168106b686d4f8239472f25=
c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd14/mod.=
rs":"318abe48bfdd1c74ecd6afbd6c9329c5c72ce4f7d420edd6be2fc12b223ae32f","src=
/unix/bsd/freebsdlike/freebsd/freebsd14/x86_64.rs":"e7b5863e222d6cc416b6b0f=
be71690fad909e899b4c4ae810bbca117e4fcb650","src/unix/bsd/freebsdlike/freebs=
d/mod.rs":"4c3cd57aaf7fbce072e28e0d2d285b5fda9702e924561d2fd01e49e6ee186a98=
","src/unix/bsd/freebsdlike/freebsd/powerpc.rs":"9ca3f82f88974e6db5569f2d76=
a5a3749b248a31747a6c0da5820492bdfeca42","src/unix/bsd/freebsdlike/freebsd/p=
owerpc64.rs":"2dae3ecc87eac3b11657aa98915def55fc4b5c0de11fe26aae23329a54628=
a9a","src/unix/bsd/freebsdlike/freebsd/riscv64.rs":"fa4bed4c58cad24ba339594=
1c7fa6b11e089551a04714f9561078e400f5b2b62","src/unix/bsd/freebsdlike/freebs=
d/x86.rs":"6766e2ce85e187b306cd3b0b8d7e15b8f4042c5cff81d89b3af69ecc99c70ab0=
","src/unix/bsd/freebsdlike/freebsd/x86_64/align.rs":"0e1f69a88fca1c32874b1=
daf5db3d446fefbe518dca497f096cc9168c39dde70","src/unix/bsd/freebsdlike/free=
bsd/x86_64/mod.rs":"51e4dd0c8ae247bb652feda5adad9333ea3bb30c750c3a3935e0b0e=
47d7803eb","src/unix/bsd/freebsdlike/mod.rs":"0eacafac87fb3a32ef1b85980fece=
2792e70eba9856af18a7407cc35be68ea57","src/unix/bsd/mod.rs":"dad51a24a524e92=
bfe9de3ac3b7d394d86058b9b8a1ccd4efa9bbb5c78e7fa1a","src/unix/bsd/netbsdlike=
/mod.rs":"0a66f7de43710e35a6a546e6c39066aa8b91a6efadb71db88738b0a577fd5537"=
,"src/unix/bsd/netbsdlike/netbsd/aarch64.rs":"65dcb58d11e8d8028401a9d07ca3e=
b4cb4f053e04249cc877353449d84ccc4cb","src/unix/bsd/netbsdlike/netbsd/arm.rs=
":"58cdbb70b0d6f536551f0f3bb3725d2d75c4690db12c26c034e7d6ec4a924452","src/u=
nix/bsd/netbsdlike/netbsd/mod.rs":"90dd33ef20dc3be8aef5bd152a6a06e7ab34f952=
7b3978487b593aaa16a907bd","src/unix/bsd/netbsdlike/netbsd/powerpc.rs":"ee7f=
f5d89d0ed22f531237b5059aa669df93a3b5c489fa641465ace8d405bf41","src/unix/bsd=
/netbsdlike/netbsd/sparc64.rs":"9489f4b3e4566f43bb12dfb92238960613dac7f6a45=
cc13068a8d152b902d7d9","src/unix/bsd/netbsdlike/netbsd/x86.rs":"20692320e36=
bfe028d1a34d16fe12ca77aa909cb02bda167376f98f1a09aefe7","src/unix/bsd/netbsd=
like/netbsd/x86_64.rs":"1afe5ef46b14397cdd68664b5b232e4f5b035b6db1d4cf411c8=
99d51ebca9f30","src/unix/bsd/netbsdlike/openbsd/aarch64.rs":"dd91931d373b7e=
caf6e2de25adadee10d16fa9b12c2cbacdff3eb291e1ba36af","src/unix/bsd/netbsdlik=
e/openbsd/arm.rs":"01580d261bc6447bb327a0d982181b7bdabfa066cee65a30373d3ced=
729ad307","src/unix/bsd/netbsdlike/openbsd/mips64.rs":"8532a189ae10c7d668d9=
d4065da8b05d124e09bd39442c9f74a7f231c43eca48","src/unix/bsd/netbsdlike/open=
bsd/mod.rs":"c27c6673bd3628549083a094219831fd9343129f91067b562781617d2a8871=
48","src/unix/bsd/netbsdlike/openbsd/powerpc.rs":"01580d261bc6447bb327a0d98=
2181b7bdabfa066cee65a30373d3ced729ad307","src/unix/bsd/netbsdlike/openbsd/p=
owerpc64.rs":"1dd5449dd1fd3d51e30ffdeeaece91d0aaf05c710e0ac699fecc5461cfa2c=
28e","src/unix/bsd/netbsdlike/openbsd/riscv64.rs":"1dd5449dd1fd3d51e30ffdee=
aece91d0aaf05c710e0ac699fecc5461cfa2c28e","src/unix/bsd/netbsdlike/openbsd/=
sparc64.rs":"d04fd287afbaa2c5df9d48c94e8374a532a3ba491b424ddf018270c7312f40=
85","src/unix/bsd/netbsdlike/openbsd/x86.rs":"6f7f5c4fde2a2259eb547890cbd86=
570cea04ef85347d7569e94e679448bec87","src/unix/bsd/netbsdlike/openbsd/x86_6=
4.rs":"d31db31630289c85af3339dbe357998a21ca584cbae31607448fe2cf7675a4e1","s=
rc/unix/haiku/b32.rs":"a2efdbf7158a6da341e1db9176b0ab193ba88b449616239ed95d=
ced11f54d87b","src/unix/haiku/b64.rs":"ff8115367d3d7d354f792d6176dfaaa26353=
f57056197b563bf4681f91ff7985","src/unix/haiku/mod.rs":"d7ec086b73db4f727991=
79627aa6330a513dcf786b06e19c75ff884d1235948e","src/unix/haiku/native.rs":"d=
bfcbf4954a79d1df2ff58e0590bbcb8c57dfc7a32392aa73ee4726b66bd6cc8","src/unix/=
haiku/x86_64.rs":"3ec3aeeb7ed208b8916f3e32d42bfd085ff5e16936a1a35d9a52789f0=
43b7237","src/unix/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae10=
ceccefeed9debb3bbe08777fc682","src/unix/hermit/mod.rs":"a1494a0bddf301cceb0=
d9b8529a84b5882fe855ceae77a1c4e8d6034e705e26c","src/unix/hermit/x86_64.rs":=
"ab832b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/uni=
x/linux_like/android/b32/arm.rs":"ce582de7e983a33d3bfad13075c53aac9016cee35=
f06ad8653ee9072c3ec2564","src/unix/linux_like/android/b32/mod.rs":"7c173e03=
75119bf06a3081652faede95e5bcd6858e7576b7533d037978737c8f","src/unix/linux_l=
ike/android/b32/x86/align.rs":"812914e4241df82e32b12375ca3374615dc3a4bdd4cf=
31f0423c5815320c0dab","src/unix/linux_like/android/b32/x86/mod.rs":"e6d107e=
fbcd37b5b85dfa18f683300cbf768ffa0237997a9fa52b184a53323ac","src/unix/linux_=
like/android/b64/aarch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3ee2faf=
6fcae3770f9e505cddca35c7b","src/unix/linux_like/android/b64/aarch64/int128.=
rs":"1735f6f5c56770d20dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de","src=
/unix/linux_like/android/b64/aarch64/mod.rs":"10e963e29ff209703de6336c99cca=
96fd79789438d34c82a693eae56e8916c3c","src/unix/linux_like/android/b64/mod.r=
s":"71e4fcbe952bfa4a5f9022f3972e906917b38f729b9d8ef57cd5d179104894ac","src/=
unix/linux_like/android/b64/riscv64/align.rs":"0bf138f84e5327d8339bcd4adf07=
1a6832b516445e597552c82bbd881095e3a8","src/unix/linux_like/android/b64/risc=
v64/mod.rs":"19d4bf2237c47127eba9144e0b82e995bc079315e719179a91813b0ae7b0e4=
9d","src/unix/linux_like/android/b64/x86_64/align.rs":"7169d07a9fd4716f7512=
719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/android/=
b64/x86_64/mod.rs":"4ec2de11a9b65c4325b7b991f0b99a414975e0e61ba8668caca5d92=
1e9b314d1","src/unix/linux_like/android/mod.rs":"66a9e38a47493a42b3b1c32552=
4f3c944e74d1e3e8ecce3cc276ec08fecab13b","src/unix/linux_like/emscripten/ali=
gn.rs":"86c95cbed7a7161b1f23ee06843e7b0e2340ad92b2cb86fe2a8ef3e0e8c36216","=
src/unix/linux_like/emscripten/mod.rs":"67d6b90f539f746aa3290ea7f9d3f3f8d2d=
8a6557233584004ed5697f7821a50","src/unix/linux_like/emscripten/no_align.rs"=
:"0128e4aa721a9902754828b61b5ec7d8a86619983ed1e0544a85d35b1051fad6","src/un=
ix/linux_like/linux/align.rs":"bc5abcd38e2320171e0981e773c9c5fe3e0d5a66fdff=
049228f6a1acad80ef8b","src/unix/linux_like/linux/arch/generic/mod.rs":"fb5d=
e1368cabae03d3ea0152159b7685a9d91efdecee4c5b83efc085ffef8a73","src/unix/lin=
ux_like/linux/arch/mips/mod.rs":"75814e198d1a9a6808be3a5e5edb1bfdc57f75b063=
94e9040739be363c09d82f","src/unix/linux_like/linux/arch/mod.rs":"5bd5361f8a=
6ab4e18bbba6da9f92c164ae252b15a0ed10064812544aa1fdf198","src/unix/linux_lik=
e/linux/arch/powerpc/mod.rs":"bef6b7af9e5e2b4e5545c9c7e3e23a8b743277a0ed958=
53e7eddc38e44299f02","src/unix/linux_like/linux/arch/sparc/mod.rs":"91593ec=
0440f1dd8f8e612028f432c44c14089286e2aca50e10511ab942db8c3","src/unix/linux_=
like/linux/gnu/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec72519573=
15afa53a7b9f936","src/unix/linux_like/linux/gnu/b32/arm/align.rs":"6ec0eb3e=
e93f7ae99fd714b4deabfb5e97fbcefd8c26f5a45fb8e7150899cdeb","src/unix/linux_l=
ike/linux/gnu/b32/arm/mod.rs":"9ab3e97b579a9122690cd01026e14528862860346b70=
0aafbb755a7e04054f7f","src/unix/linux_like/linux/gnu/b32/csky/align.rs":"3f=
ed009dc9af3cc81be7087da9d2d7d1f39845e4497e290259c5cdbae25f039d","src/unix/l=
inux_like/linux/gnu/b32/csky/mod.rs":"4c21d6e7463bb22f00b984294893d12c84018=
d5d26ec661d6a30f4a9625ba639","src/unix/linux_like/linux/gnu/b32/m68k/align.=
rs":"8faa92f77a9232c035418d45331774e64a9a841d99c91791570a203bf2b45bcb","src=
/unix/linux_like/linux/gnu/b32/m68k/mod.rs":"6aab7f1b864e9691d14aa7d389f717=
c4077b8eed72a7f11e3b8c7fef245e4046","src/unix/linux_like/linux/gnu/b32/mips=
/align.rs":"429fb5e005cb7143602d430098b6ebfb7d360685b194f333dfd587472ae954e=
e","src/unix/linux_like/linux/gnu/b32/mips/mod.rs":"6b9a5dac6f937ddc1453e80=
8e3c43502c87143332df9e43ac64fb8b1eda6c116","src/unix/linux_like/linux/gnu/b=
32/mod.rs":"b56625dd20dd48a8699034d349ef089c540c0ddcbf8a3481d598d101f8b40b7=
8","src/unix/linux_like/linux/gnu/b32/powerpc.rs":"5c5d90326b54b57b98eff474=
5fe7a3fb02f053b2dc782241a73e807b491936a3","src/unix/linux_like/linux/gnu/b3=
2/riscv32/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd37543ef=
e86621b119","src/unix/linux_like/linux/gnu/b32/riscv32/mod.rs":"491a9a97cf7=
12985b75d3ad714691ef60898d88c78bc386a6917de0a6774cc26","src/unix/linux_like=
/linux/gnu/b32/sparc/align.rs":"21adbed27df73e2d1ed934aaf733a643003d7baf2bd=
e9c48ea440895bcca6d41","src/unix/linux_like/linux/gnu/b32/sparc/mod.rs":"80=
894eece66e9348f45d1b07ad37c757ea694bbd10ed49d3f920b34e9f51a9a3","src/unix/l=
inux_like/linux/gnu/b32/x86/align.rs":"e4bafdc4a519a7922a81b37a62bbfd1177a2=
f620890eef8f1fbc47162e9eb413","src/unix/linux_like/linux/gnu/b32/x86/mod.rs=
":"c703cc5e9de2dc31d9e5831bfb6f354d6e3518b2ae02263f68a9a70f1c0167e2","src/u=
nix/linux_like/linux/gnu/b64/aarch64/align.rs":"fdf1c72375a2167699157e0dd82=
5422690bb6719f7bc69515a2e5846d0431d7c","src/unix/linux_like/linux/gnu/b64/a=
arch64/fallback.rs":"832e7487249c1c0bb6e9911ce3f7d32ca22378e42392ab83c56915=
cbc59d8be3","src/unix/linux_like/linux/gnu/b64/aarch64/ilp32.rs":"bf4611b73=
7813deef6787babf6c01698605f3b75482269b8546318667bc68e29","src/unix/linux_li=
ke/linux/gnu/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426442f09724d9b2052=
b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/gnu/b64/aarch64/lp64=
.rs":"11a950697fdda0258c6e37c6b13993348c8de4134105ed4faa79358e53175072","sr=
c/unix/linux_like/linux/gnu/b64/aarch64/mod.rs":"172495fbfdf659b9b825148bff=
c2b62704f63fc872428617e868eb15802c9978","src/unix/linux_like/linux/gnu/b64/=
loongarch64/align.rs":"060aa33cc737966c691aab8511c5c5729e551458ce18d0e284e0=
d45f39beeb60","src/unix/linux_like/linux/gnu/b64/loongarch64/mod.rs":"18eda=
da8aa5d4127d9aa1bd81c62b5a4209f1efd8b2b2631e801c9e855ab1480","src/unix/linu=
x_like/linux/gnu/b64/mips64/align.rs":"7169d07a9fd4716f7512719aec9fda5d8bed=
306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/linux/gnu/b64/mips64/mod=
.rs":"628c410b9aaec3c8f43838a28616b577a1d6de60a9799b09bb884d80281f96eb","sr=
c/unix/linux_like/linux/gnu/b64/mod.rs":"6a160ef25439c4fecdb0e3bd0b81874226=
3c791364da874d4febd3aa644ec8e2","src/unix/linux_like/linux/gnu/b64/powerpc6=
4/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268130=
d9","src/unix/linux_like/linux/gnu/b64/powerpc64/mod.rs":"c778a136f06c2ffea=
cea19fa14ce79b828f91b67a002dec5ce87289bae36234e","src/unix/linux_like/linux=
/gnu/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd=
37543efe86621b119","src/unix/linux_like/linux/gnu/b64/riscv64/mod.rs":"c8f0=
7efc5ddd5d874f1ebc329cd6907818d132ac3e30f4f2a4b04be3fb388551","src/unix/lin=
ux_like/linux/gnu/b64/s390x.rs":"a2fd9277c2dcf76f7a16a3bcca745d5a9932c765c0=
dc2feb31c3641be25eb0aa","src/unix/linux_like/linux/gnu/b64/sparc64/align.rs=
":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268130d9","src/u=
nix/linux_like/linux/gnu/b64/sparc64/mod.rs":"e8047e9966a2b90063e0151a0278c=
54885e7b323286cf5ab55cbaf151fc772d3","src/unix/linux_like/linux/gnu/b64/x86=
_64/align.rs":"62e822478356db4a73b6bbd1b36d825b893939ab4b308ec11b0578bcc4b4=
9769","src/unix/linux_like/linux/gnu/b64/x86_64/mod.rs":"891e595d33714b9883=
b92f0554d1d361fba2b6c3f6cac09a288252f44c6ec667","src/unix/linux_like/linux/=
gnu/b64/x86_64/not_x32.rs":"38f74ce15d9662ce4818815a2b87be1618d5e45f190f7e4=
db84ff3285b4421fb","src/unix/linux_like/linux/gnu/b64/x86_64/x32.rs":"b2021=
8a11364a6dec87f96d6c0d8b19e660697ab09ad5ee0e9b3a9dafedaaebb","src/unix/linu=
x_like/linux/gnu/mod.rs":"47dd970aedda9c70429741d7c9892a0d5d264e9abcb1c41d5=
bb913a86f0a5362","src/unix/linux_like/linux/gnu/no_align.rs":"9cd223135de75=
315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/linux_like/l=
inux/mod.rs":"1582c09db7b752af0f796a4cba8aa2bb4ecea895c551a2219e76047bcce74=
a23","src/unix/linux_like/linux/musl/b32/arm/align.rs":"3e8ac052c1043764776=
b54c93ba4260e061df998631737a897d9d47d54f7b80c","src/unix/linux_like/linux/m=
usl/b32/arm/mod.rs":"de0473ef4455fa461c00442f041ec110e6667614b00bb23385f35a=
f95d24f668","src/unix/linux_like/linux/musl/b32/hexagon.rs":"4f9a5b3b45bc97=
0611597f40add2c489de0fa8ad9dd77629e4daa1755c5e2918","src/unix/linux_like/li=
nux/musl/b32/mips/align.rs":"429fb5e005cb7143602d430098b6ebfb7d360685b194f3=
33dfd587472ae954ee","src/unix/linux_like/linux/musl/b32/mips/mod.rs":"8c7de=
54a04495204772b4bd622b6d34696d27b73ea9e097eb53afa1a7806e31f","src/unix/linu=
x_like/linux/musl/b32/mod.rs":"31677597fd9544c4b1ec1477628288f6273fabbc06e3=
8f33da862ad55f019ce1","src/unix/linux_like/linux/musl/b32/powerpc.rs":"539d=
b45fb9de65bb498f9fab739404146428fd5ecd4b39ef5d6d8c4e8215fb29","src/unix/lin=
ux_like/linux/musl/b32/riscv32/align.rs":"efd2accf33b87de7c7547903359a5da89=
6edc33cd6c719552c7474b60d4a5d48","src/unix/linux_like/linux/musl/b32/riscv3=
2/mod.rs":"c91bb80655c91061d80dcd48be2e767b979a0a570dbd54fcf2094a9a1e31fad8=
","src/unix/linux_like/linux/musl/b32/x86/align.rs":"08e77fbd7435d7dec2ff56=
932433bece3f02e47ce810f89004a275a86d39cbe1","src/unix/linux_like/linux/musl=
/b32/x86/mod.rs":"2237891b538b0b601aca13dfd9bfd030cdf98479e813c3d195ec2639b=
e88ee14","src/unix/linux_like/linux/musl/b64/aarch64/align.rs":"6ba32725d24=
d7d8e6aa111f3b57aafa318f83b606abe96561329151829821133","src/unix/linux_like=
/linux/musl/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426442f09724d9b2052b=
46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/musl/b64/aarch64/mod.=
rs":"54331c1112bc89cf35c0ebe0a974cb219d5167869ddd347e97faf1ec8c54cfec","src=
/unix/linux_like/linux/musl/b64/mips64.rs":"f606383f7a3639c508172becb2f1d25=
51b86dbd9bfceeef18871f94a30ed8d80","src/unix/linux_like/linux/musl/b64/mod.=
rs":"8275e7a108c71f180de71b86f74baa1e35d9e915befb8ab8191d2a2fe76d3bb9","src=
/unix/linux_like/linux/musl/b64/powerpc64.rs":"6308c2d4b27deab7cc062ffdb1a0=
277126a1bc6ccea84f7276150f062df9f6a6","src/unix/linux_like/linux/musl/b64/r=
iscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd37543efe86=
621b119","src/unix/linux_like/linux/musl/b64/riscv64/mod.rs":"e6c51d3d20b7b=
409dec3d7f41256a8a0366eabc7cf4db32a237e0ac7c8aa78fa","src/unix/linux_like/l=
inux/musl/b64/s390x.rs":"fbf661b30015e315639b900a0eecf868c6fe50245460ac9389=
1e1e8f5c55835a","src/unix/linux_like/linux/musl/b64/x86_64/align.rs":"77309=
276ad7a42cbe59ca381f23590b7a143aded05555b34a5b307b808cbca6e","src/unix/linu=
x_like/linux/musl/b64/x86_64/mod.rs":"e5d18b648529b09b35d161120016283f5e2ff=
54e28f60c031c63139901fe713a","src/unix/linux_like/linux/musl/lfs64.rs":"3e4=
fb381f3a0756520bde0f1692d4fa45e4ae8133bf7d7c64b0e3fdd512f235f","src/unix/li=
nux_like/linux/musl/mod.rs":"452e8a1bd998c6a2d026b84e148506cae01706e632cdda=
286fb70cc58c0fa357","src/unix/linux_like/linux/no_align.rs":"62cdca0e011937=
aaf09a51ca86d9f0ee0fdb05f61ec3c058e6a5d5fa6357d784","src/unix/linux_like/li=
nux/non_exhaustive.rs":"181a05bf94fdb911db83ce793b993bd6548a4115b306a7ef3c1=
0f745a8fea3e9","src/unix/linux_like/linux/uclibc/align.rs":"9ed16138d8e439b=
d90930845a65eafa7ebd67366e6bf633936d44014f6e4c959","src/unix/linux_like/lin=
ux/uclibc/arm/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec725195731=
5afa53a7b9f936","src/unix/linux_like/linux/uclibc/arm/mod.rs":"50288ff9e411=
ab0966da24838f2c2a5618021bc19c422a04f577b2979ef4081e","src/unix/linux_like/=
linux/uclibc/arm/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c=
85a76f8316c86653db25","src/unix/linux_like/linux/uclibc/mips/mips32/align.r=
s":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936","src/=
unix/linux_like/linux/uclibc/mips/mips32/mod.rs":"d0c4434e2bf813372c418a8f5=
16c706cdccc9f7be2f0921b2207b0afdb66fe81","src/unix/linux_like/linux/uclibc/=
mips/mips32/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76=
f8316c86653db25","src/unix/linux_like/linux/uclibc/mips/mips64/align.rs":"a=
7bdcb18a37a2d91e64d5fad83ea3edc78f5412adb28f77ab077dbb26dd08b2d","src/unix/=
linux_like/linux/uclibc/mips/mips64/mod.rs":"3f38ee6a4690b9d7594be20d216467=
a34d955f7653c2c8ce1e6147daeb53f1e0","src/unix/linux_like/linux/uclibc/mips/=
mips64/no_align.rs":"4a18e3875698c85229599225ac3401a2a40da87e77b2ad4ef47c6f=
cd5a24ed30","src/unix/linux_like/linux/uclibc/mips/mod.rs":"a048fce1c2d9b1a=
d57305642e8ad05ca0f0c7e4753267a2e2d6b4fee5db3b072","src/unix/linux_like/lin=
ux/uclibc/mod.rs":"1c3d25cddcfefa2bd17bdc81550826be31a08eef235e13f825f169a5=
029c8bca","src/unix/linux_like/linux/uclibc/no_align.rs":"3f28637046524618a=
daa1012e26cb7ffe94b9396e6b518cccdc69d59f274d709","src/unix/linux_like/linux=
/uclibc/x86_64/l4re.rs":"024eba5753e852dbdd212427351affe7e83f9916c1864bce41=
4d7aa2618f192e","src/unix/linux_like/linux/uclibc/x86_64/mod.rs":"196d03aff=
befb85716937c15904831e731eb222ee906e05e42102d639a8152ea","src/unix/linux_li=
ke/linux/uclibc/x86_64/other.rs":"42c3f71e58cabba373f6a55a623f3c31b85049eb6=
4824c09c2b082b3b2d6a0a8","src/unix/linux_like/mod.rs":"45c98e7a0fad03b03c4c=
76f11a80e2423873f0a6563e35c60309a29b2c8ff44f","src/unix/mod.rs":"dd4ce377ba=
9517182e718848739a5c3f58cdbbcd4ee467eef9aaf8df5aed5053","src/unix/newlib/aa=
rch64/mod.rs":"bac93836a9a57b2c710f32f852e92a4d11ad6759ab0fb6ad33e71d60e532=
78af","src/unix/newlib/align.rs":"28aaf87fafbc6b312622719d472d8cf65f9e5467d=
15339df5f73e66d8502b28a","src/unix/newlib/arm/mod.rs":"cbba6b3e957eceb49680=
6e60de8725a23ff3fa0015983b4b4fa27b233732b526","src/unix/newlib/espidf/mod.r=
s":"816f235f4aa4baabba7f2606b31d0fdb03988c52194c966728de8690bf17299d","src/=
unix/newlib/generic.rs":"eab066d9f0a0f3eb53cc1073d01496bba0110989e1f6a59838=
afd19f870cd599","src/unix/newlib/horizon/mod.rs":"7cc5cc120437421db139bfa6a=
90b18168cd3070bdd0f5be96d40fe4c996f3ca1","src/unix/newlib/mod.rs":"9e36de3f=
d78e10cb6b9a59dc5ebe5a1b44a63ccb91433bb33653fb30d0c303c6","src/unix/newlib/=
no_align.rs":"e0743b2179495a9514bc3a4d1781e492878c4ec834ee0085d0891dd1712e8=
2fb","src/unix/newlib/powerpc/mod.rs":"0202ffd57caf75b6afa2c9717750ffb96e37=
5ac33df0ae9609a3f831be393b67","src/unix/newlib/vita/mod.rs":"68e0ce186b44e0=
b3031eb824710e7454dc2a9df98db98120840c3c6f4d885871","src/unix/no_align.rs":=
"c06e95373b9088266e0b14bba0954eef95f93fb2b01d951855e382d22de78e53","src/uni=
x/nto/aarch64.rs":"4709c9afdc8d583be876598e7c238499ee3e8da5bd2baa614d9c7dd4=
14851555","src/unix/nto/mod.rs":"59ab89a8fb6e0a6d22fa968ed4873c2bafa19a0f60=
a90c9a5148816cb7440889","src/unix/nto/neutrino.rs":"799bff4ab01a6424db6c5a2=
b76aa5679826d41495f9d13c63485bf13bc80026b","src/unix/nto/x86_64.rs":"a3e18e=
93c2999da1cd7a6f748a4b60c07aefb73d8ea2aafec19a84cfb040bc8e","src/unix/redox=
/mod.rs":"73658b0d28c82a122875aa2b45c489834f4de58c378add7932bbaf3ffb2ae789"=
,"src/unix/solarish/compat.rs":"00f1ee3faec9da69204e42f025f6735dd13d894071a=
154425dcc43ecbdd06e7f","src/unix/solarish/illumos.rs":"cd93c2d84722bbf9933a=
92842a8998eb0b2afc962f50bc2546ad127b82809fa7","src/unix/solarish/mod.rs":"b=
1660c631a599a3355116e7485b88ab2f8f2929c2e37851a763431387b902f14","src/unix/=
solarish/solaris.rs":"41b350a89ddf01cd12a10f93640f92be53be0b0d976021cdc08da=
17bf3e72edf","src/unix/solarish/x86.rs":"e86e806df0caed72765040eaa2f3c88319=
8d1aa91508540adf9b7008c77f522e","src/unix/solarish/x86_64.rs":"ec2b01f194eb=
8a6a27133c57681da195a949e03098f3ea1e847227a9c09ef5fc","src/unix/solarish/x8=
6_common.rs":"ac869d9c3c95645c22460468391eb1982023c3a8e02b9e06a72e3aef3d5f1=
eac","src/vxworks/aarch64.rs":"98f0afdc511cd02557e506c21fed6737585490a1dce7=
a9d4941d08c437762b99","src/vxworks/arm.rs":"acb7968ce99fe3f4abdf39d98f8133d=
21a4fba435b8ef7084777cb181d788e88","src/vxworks/mod.rs":"e4edcbcf43a325e738=
c9465507594d0c87abf3f0e2b9b046c1425f8d44bdad0f","src/vxworks/powerpc.rs":"a=
cb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788e88","src/vxwor=
ks/powerpc64.rs":"98f0afdc511cd02557e506c21fed6737585490a1dce7a9d4941d08c43=
7762b99","src/vxworks/x86.rs":"552f007f38317620b23889cb7c49d1d1158412524390=
60122f52f434fbc6e5ba","src/vxworks/x86_64.rs":"018d92be3ad628a129eff9f2f5df=
bc0883d8b8e5f2fa917b900a7f98ed6b514a","src/wasi.rs":"09ee3b3348b212b050f6ca=
8ae008a28679ea44a375674307a4e7c9ca0d3ed7d5","src/windows/gnu/align.rs":"b2c=
13ec1b9f3b39a75c452c80c951dff9d0215e31d77e883b4502afb31794647","src/windows=
/gnu/mod.rs":"3c8c7edb7cdf5d0c44af936db2a94869585c69dfabeef30571b4f4e383757=
67a","src/windows/mod.rs":"9fdc5e1c62c441abef7bc62a7343efb2041edc24db9ac0ef=
c0f74df55b69e249","src/windows/msvc/mod.rs":"c068271e00fca6b62bc4bf44bcf142=
cfc38caeded9b6c4e01d1ceef3ccf986f4","src/xous.rs":"eb0675f25ba01f73072d2b70=
907fb8abb1148facefe5a20756c49250f3d65fae","tests/const_fn.rs":"cb75a1f0864f=
926aebe79118fc34d51a0d1ade2c20a394e7774c7e545f21f1f4"},"package":"9cdc71e17=
332e86d2e1d38c1f99edcb6288ee11b815fb1a4b049eaa2114d369b"}
-\ No newline at end of file
-+{"files":{"CONTRIBUTING.md":"bdc90b52cf803faac96e594069a86dd8ea150d5ba7fb=
3e6cadfc08dac4c7b0ce","Cargo.toml":"a58e58fa9bde015e08609ea2f17e56c5df7c82a=
a6f3fa1a144c02ee4715227b9","LICENSE-APACHE":"62c7a1e35f56406896d7aa7ca52d0c=
c0d272ac022b5d2796e7d6905db8a3636a","LICENSE-MIT":"a8d47ff51ca256f56a8932db=
a07660672dbfe3004257ca8de708aac1415937a1","README.md":"ecc47e284f8d007fc048=
666d5108dd41cdc440ab9eedfe8c47d1634613522787","build.rs":"9e94683e94db80e82=
82fce07549cf748d9037852fb06df1c7596bea2ed130d50","rustfmt.toml":"eaa2ea84fc=
1ba0359b77680804903e07bb38d257ab11986b95b158e460f787b2","src/fixed_width_in=
ts.rs":"7f986e5f5e68d25ef04d386fd2f640e8be8f15427a8d4a458ea01d26b8dca0ca","=
src/fuchsia/aarch64.rs":"893fcec48142d273063ffd814dca33fbec92205fd39ada9707=
5f85201d803996","src/fuchsia/align.rs":"ae1cf8f011a99737eabeb14ffff768e60f1=
3b13363d7646744dbb0f443dab3d6","src/fuchsia/mod.rs":"30f4dc83ef120300d61896=
696512436377c5f36f1431d98ab7e01e498c0c47d5","src/fuchsia/no_align.rs":"303f=
3f1b255e0088b5715094353cf00476131d8e94e6aebb3f469557771c8b8a","src/fuchsia/=
riscv64.rs":"617cd75e79e0e20f664db764a4dc2a396d9fd11a4d95371acd91ed4811293b=
11","src/fuchsia/x86_64.rs":"93a3632b5cf67d2a6bcb7dc0a558605252d5fe689e0f38=
d8aa2ec5852255ac87","src/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f3=
68ae10ceccefeed9debb3bbe08777fc682","src/hermit/mod.rs":"d3bfce41e4463d4be8=
020a2d063c9bfa8b665f45f1cc6cbf3163f5d01e7cb21f","src/hermit/x86_64.rs":"ab8=
32b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/lib.rs"=
:"24111461547739f3646f95bcb66c43f2ae679a727ff5938299434c522c02e458","src/ma=
cros.rs":"b457eb028b8e8ab3c24bb7292b874ad4e491edbb83594f6a3da024df5348c088"=
,"src/psp.rs":"dd31aabd46171d474ec5828372e28588935120e7355c90c105360d8fa926=
4c1c","src/sgx.rs":"16a95cdefc81c5ee00d8353a60db363c4cc3e0f75abcd5d0144723f=
2a306ed1b","src/solid/aarch64.rs":"a726e47f324adf73a4a0b67a2c183408d0cad105=
ae66acf36db37a42ab7f8707","src/solid/arm.rs":"e39a4f74ebbef3b97b8c95758ad74=
1123d84ed3eb48d9cf4f1f4872097fc27fe","src/solid/mod.rs":"5f4151dca5132e4b4e=
4c23ab9737e12856dddbdc0ca3f7dbc004328ef3c8acde","src/switch.rs":"9da3dd39b3=
de45a7928789926e8572d00e1e11a39e6f7289a1349aadce90edba","src/unix/aix/mod.r=
s":"54229b5e774669c16912112e8b50fa938db76f534971222a11723a05195a0948","src/=
unix/aix/powerpc64.rs":"cf374d81139d45f9d77c6a764f640bfbf7e0a5903689652c829=
6f8e10d55169b","src/unix/align.rs":"2cdc7c826ef7ae61f5171c5ae8c445a743d86f1=
a7f2d9d7e4ceeec56d6874f65","src/unix/bsd/apple/b32/align.rs":"ec833a747866f=
e19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b3=
2/mod.rs":"2546ad3eb6aecb95f916648bc63264117c92b4b4859532b34cb011e4c75a5a72=
","src/unix/bsd/apple/b64/aarch64/align.rs":"2eaf0f561a32bdcbf4e0477c8895d5=
e7bcb5cdebd5fef7b4df2ca8e38e144d94","src/unix/bsd/apple/b64/aarch64/mod.rs"=
:"44c217a4f263afe7a97435de9323d20a96c37836f899ca0925306d4b7e073c27","src/un=
ix/bsd/apple/b64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d1=
5fa68884c40b0e26c","src/unix/bsd/apple/b64/mod.rs":"f5e278a1af7fb358891d1c9=
be4eb7e815aaca0c5cb738d0c3604ba2208a856f7","src/unix/bsd/apple/b64/x86_64/a=
lign.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c"=
,"src/unix/bsd/apple/b64/x86_64/mod.rs":"8c87c5855038aae5d433c8f5eb3b29b0a1=
75879a0245342b3bfd83bdf4cfd936","src/unix/bsd/apple/long_array.rs":"3cf1f19=
b812e6d093c819dc65ce55b13491963e0780eda0d0bd1577603e81948","src/unix/bsd/ap=
ple/mod.rs":"0931fd351d585728e6384d7b952b8d816e9acdb9c86c172324445f3c33f692=
ca","src/unix/bsd/freebsdlike/dragonfly/errno.rs":"8295b8bb0dfd38d2cdb4d919=
2cdeeb534cc6c3b208170e64615fa3e0edb3e578","src/unix/bsd/freebsdlike/dragonf=
ly/mod.rs":"f2e78625fe1eb14f43e730a3987eba888cb8ac04c23008e7c2d2f7c72258b9e=
6","src/unix/bsd/freebsdlike/freebsd/aarch64.rs":"6c8e216385f53a4bf5f171749=
b57602fc34a4e4b160a44ca31c058cb0c8a2126","src/unix/bsd/freebsdlike/freebsd/=
arm.rs":"59d6a670eea562fb87686e243e0a84603d29a2028a3d4b3f99ccc01bd04d2f47",=
"src/unix/bsd/freebsdlike/freebsd/freebsd11/b64.rs":"9808d152c1196aa647f1b0=
f0cf84dac8c930da7d7f897a44975545e3d9d17681","src/unix/bsd/freebsdlike/freeb=
sd/freebsd11/mod.rs":"e243ae0e89623d4fa9f85afe14369cc5fd5f2028ea715773dbec7=
22ba80dac1f","src/unix/bsd/freebsdlike/freebsd/freebsd12/b64.rs":"61cbe45f8=
499bedb168106b686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/free=
bsdlike/freebsd/freebsd12/mod.rs":"bef9fae288a4f29e941ea369be1cd20b170040e6=
0665a4d49a4a9e79009b72d8","src/unix/bsd/freebsdlike/freebsd/freebsd12/x86_6=
4.rs":"2df36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","s=
rc/unix/bsd/freebsdlike/freebsd/freebsd13/b64.rs":"61cbe45f8499bedb168106b6=
86d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd=
/freebsd13/mod.rs":"3c514e037694ce22724abb3c9c4687defda7f0e3456b615ca73593e=
860e38b16","src/unix/bsd/freebsdlike/freebsd/freebsd13/x86_64.rs":"2df36a7f=
122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/fre=
ebsdlike/freebsd/freebsd14/b64.rs":"61cbe45f8499bedb168106b686d4f8239472f25=
c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd14/mod.=
rs":"318abe48bfdd1c74ecd6afbd6c9329c5c72ce4f7d420edd6be2fc12b223ae32f","src=
/unix/bsd/freebsdlike/freebsd/freebsd14/x86_64.rs":"e7b5863e222d6cc416b6b0f=
be71690fad909e899b4c4ae810bbca117e4fcb650","src/unix/bsd/freebsdlike/freebs=
d/mod.rs":"4c3cd57aaf7fbce072e28e0d2d285b5fda9702e924561d2fd01e49e6ee186a98=
","src/unix/bsd/freebsdlike/freebsd/powerpc.rs":"9ca3f82f88974e6db5569f2d76=
a5a3749b248a31747a6c0da5820492bdfeca42","src/unix/bsd/freebsdlike/freebsd/p=
owerpc64.rs":"2dae3ecc87eac3b11657aa98915def55fc4b5c0de11fe26aae23329a54628=
a9a","src/unix/bsd/freebsdlike/freebsd/riscv64.rs":"fa4bed4c58cad24ba339594=
1c7fa6b11e089551a04714f9561078e400f5b2b62","src/unix/bsd/freebsdlike/freebs=
d/x86.rs":"6766e2ce85e187b306cd3b0b8d7e15b8f4042c5cff81d89b3af69ecc99c70ab0=
","src/unix/bsd/freebsdlike/freebsd/x86_64/align.rs":"0e1f69a88fca1c32874b1=
daf5db3d446fefbe518dca497f096cc9168c39dde70","src/unix/bsd/freebsdlike/free=
bsd/x86_64/mod.rs":"51e4dd0c8ae247bb652feda5adad9333ea3bb30c750c3a3935e0b0e=
47d7803eb","src/unix/bsd/freebsdlike/mod.rs":"0eacafac87fb3a32ef1b85980fece=
2792e70eba9856af18a7407cc35be68ea57","src/unix/bsd/mod.rs":"dad51a24a524e92=
bfe9de3ac3b7d394d86058b9b8a1ccd4efa9bbb5c78e7fa1a","src/unix/bsd/netbsdlike=
/mod.rs":"0a66f7de43710e35a6a546e6c39066aa8b91a6efadb71db88738b0a577fd5537"=
,"src/unix/bsd/netbsdlike/netbsd/aarch64.rs":"65dcb58d11e8d8028401a9d07ca3e=
b4cb4f053e04249cc877353449d84ccc4cb","src/unix/bsd/netbsdlike/netbsd/arm.rs=
":"58cdbb70b0d6f536551f0f3bb3725d2d75c4690db12c26c034e7d6ec4a924452","src/u=
nix/bsd/netbsdlike/netbsd/mod.rs":"90dd33ef20dc3be8aef5bd152a6a06e7ab34f952=
7b3978487b593aaa16a907bd","src/unix/bsd/netbsdlike/netbsd/powerpc.rs":"ee7f=
f5d89d0ed22f531237b5059aa669df93a3b5c489fa641465ace8d405bf41","src/unix/bsd=
/netbsdlike/netbsd/sparc64.rs":"9489f4b3e4566f43bb12dfb92238960613dac7f6a45=
cc13068a8d152b902d7d9","src/unix/bsd/netbsdlike/netbsd/x86.rs":"20692320e36=
bfe028d1a34d16fe12ca77aa909cb02bda167376f98f1a09aefe7","src/unix/bsd/netbsd=
like/netbsd/x86_64.rs":"1afe5ef46b14397cdd68664b5b232e4f5b035b6db1d4cf411c8=
99d51ebca9f30","src/unix/bsd/netbsdlike/openbsd/aarch64.rs":"dd91931d373b7e=
caf6e2de25adadee10d16fa9b12c2cbacdff3eb291e1ba36af","src/unix/bsd/netbsdlik=
e/openbsd/arm.rs":"01580d261bc6447bb327a0d982181b7bdabfa066cee65a30373d3ced=
729ad307","src/unix/bsd/netbsdlike/openbsd/mips64.rs":"8532a189ae10c7d668d9=
d4065da8b05d124e09bd39442c9f74a7f231c43eca48","src/unix/bsd/netbsdlike/open=
bsd/mod.rs":"c27c6673bd3628549083a094219831fd9343129f91067b562781617d2a8871=
48","src/unix/bsd/netbsdlike/openbsd/powerpc.rs":"01580d261bc6447bb327a0d98=
2181b7bdabfa066cee65a30373d3ced729ad307","src/unix/bsd/netbsdlike/openbsd/p=
owerpc64.rs":"1dd5449dd1fd3d51e30ffdeeaece91d0aaf05c710e0ac699fecc5461cfa2c=
28e","src/unix/bsd/netbsdlike/openbsd/riscv64.rs":"1dd5449dd1fd3d51e30ffdee=
aece91d0aaf05c710e0ac699fecc5461cfa2c28e","src/unix/bsd/netbsdlike/openbsd/=
sparc64.rs":"d04fd287afbaa2c5df9d48c94e8374a532a3ba491b424ddf018270c7312f40=
85","src/unix/bsd/netbsdlike/openbsd/x86.rs":"6f7f5c4fde2a2259eb547890cbd86=
570cea04ef85347d7569e94e679448bec87","src/unix/bsd/netbsdlike/openbsd/x86_6=
4.rs":"d31db31630289c85af3339dbe357998a21ca584cbae31607448fe2cf7675a4e1","s=
rc/unix/haiku/b32.rs":"a2efdbf7158a6da341e1db9176b0ab193ba88b449616239ed95d=
ced11f54d87b","src/unix/haiku/b64.rs":"ff8115367d3d7d354f792d6176dfaaa26353=
f57056197b563bf4681f91ff7985","src/unix/haiku/mod.rs":"d7ec086b73db4f727991=
79627aa6330a513dcf786b06e19c75ff884d1235948e","src/unix/haiku/native.rs":"d=
bfcbf4954a79d1df2ff58e0590bbcb8c57dfc7a32392aa73ee4726b66bd6cc8","src/unix/=
haiku/x86_64.rs":"3ec3aeeb7ed208b8916f3e32d42bfd085ff5e16936a1a35d9a52789f0=
43b7237","src/unix/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae10=
ceccefeed9debb3bbe08777fc682","src/unix/hermit/mod.rs":"a1494a0bddf301cceb0=
d9b8529a84b5882fe855ceae77a1c4e8d6034e705e26c","src/unix/hermit/x86_64.rs":=
"ab832b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/uni=
x/linux_like/android/b32/arm.rs":"ce582de7e983a33d3bfad13075c53aac9016cee35=
f06ad8653ee9072c3ec2564","src/unix/linux_like/android/b32/mod.rs":"7c173e03=
75119bf06a3081652faede95e5bcd6858e7576b7533d037978737c8f","src/unix/linux_l=
ike/android/b32/x86/align.rs":"812914e4241df82e32b12375ca3374615dc3a4bdd4cf=
31f0423c5815320c0dab","src/unix/linux_like/android/b32/x86/mod.rs":"e6d107e=
fbcd37b5b85dfa18f683300cbf768ffa0237997a9fa52b184a53323ac","src/unix/linux_=
like/android/b64/aarch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3ee2faf=
6fcae3770f9e505cddca35c7b","src/unix/linux_like/android/b64/aarch64/int128.=
rs":"1735f6f5c56770d20dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de","src=
/unix/linux_like/android/b64/aarch64/mod.rs":"10e963e29ff209703de6336c99cca=
96fd79789438d34c82a693eae56e8916c3c","src/unix/linux_like/android/b64/mod.r=
s":"71e4fcbe952bfa4a5f9022f3972e906917b38f729b9d8ef57cd5d179104894ac","src/=
unix/linux_like/android/b64/riscv64/align.rs":"0bf138f84e5327d8339bcd4adf07=
1a6832b516445e597552c82bbd881095e3a8","src/unix/linux_like/android/b64/risc=
v64/mod.rs":"19d4bf2237c47127eba9144e0b82e995bc079315e719179a91813b0ae7b0e4=
9d","src/unix/linux_like/android/b64/x86_64/align.rs":"7169d07a9fd4716f7512=
719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/android/=
b64/x86_64/mod.rs":"4ec2de11a9b65c4325b7b991f0b99a414975e0e61ba8668caca5d92=
1e9b314d1","src/unix/linux_like/android/mod.rs":"66a9e38a47493a42b3b1c32552=
4f3c944e74d1e3e8ecce3cc276ec08fecab13b","src/unix/linux_like/emscripten/ali=
gn.rs":"86c95cbed7a7161b1f23ee06843e7b0e2340ad92b2cb86fe2a8ef3e0e8c36216","=
src/unix/linux_like/emscripten/mod.rs":"67d6b90f539f746aa3290ea7f9d3f3f8d2d=
8a6557233584004ed5697f7821a50","src/unix/linux_like/emscripten/no_align.rs"=
:"0128e4aa721a9902754828b61b5ec7d8a86619983ed1e0544a85d35b1051fad6","src/un=
ix/linux_like/linux/align.rs":"bc5abcd38e2320171e0981e773c9c5fe3e0d5a66fdff=
049228f6a1acad80ef8b","src/unix/linux_like/linux/arch/generic/mod.rs":"fb5d=
e1368cabae03d3ea0152159b7685a9d91efdecee4c5b83efc085ffef8a73","src/unix/lin=
ux_like/linux/arch/mips/mod.rs":"75814e198d1a9a6808be3a5e5edb1bfdc57f75b063=
94e9040739be363c09d82f","src/unix/linux_like/linux/arch/mod.rs":"5bd5361f8a=
6ab4e18bbba6da9f92c164ae252b15a0ed10064812544aa1fdf198","src/unix/linux_lik=
e/linux/arch/powerpc/mod.rs":"bef6b7af9e5e2b4e5545c9c7e3e23a8b743277a0ed958=
53e7eddc38e44299f02","src/unix/linux_like/linux/arch/sparc/mod.rs":"91593ec=
0440f1dd8f8e612028f432c44c14089286e2aca50e10511ab942db8c3","src/unix/linux_=
like/linux/gnu/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec72519573=
15afa53a7b9f936","src/unix/linux_like/linux/gnu/b32/arm/align.rs":"6ec0eb3e=
e93f7ae99fd714b4deabfb5e97fbcefd8c26f5a45fb8e7150899cdeb","src/unix/linux_l=
ike/linux/gnu/b32/arm/mod.rs":"9ab3e97b579a9122690cd01026e14528862860346b70=
0aafbb755a7e04054f7f","src/unix/linux_like/linux/gnu/b32/csky/align.rs":"3f=
ed009dc9af3cc81be7087da9d2d7d1f39845e4497e290259c5cdbae25f039d","src/unix/l=
inux_like/linux/gnu/b32/csky/mod.rs":"4c21d6e7463bb22f00b984294893d12c84018=
d5d26ec661d6a30f4a9625ba639","src/unix/linux_like/linux/gnu/b32/m68k/align.=
rs":"8faa92f77a9232c035418d45331774e64a9a841d99c91791570a203bf2b45bcb","src=
/unix/linux_like/linux/gnu/b32/m68k/mod.rs":"6aab7f1b864e9691d14aa7d389f717=
c4077b8eed72a7f11e3b8c7fef245e4046","src/unix/linux_like/linux/gnu/b32/mips=
/align.rs":"429fb5e005cb7143602d430098b6ebfb7d360685b194f333dfd587472ae954e=
e","src/unix/linux_like/linux/gnu/b32/mips/mod.rs":"6b9a5dac6f937ddc1453e80=
8e3c43502c87143332df9e43ac64fb8b1eda6c116","src/unix/linux_like/linux/gnu/b=
32/mod.rs":"b56625dd20dd48a8699034d349ef089c540c0ddcbf8a3481d598d101f8b40b7=
8","src/unix/linux_like/linux/gnu/b32/powerpc.rs":"5c5d90326b54b57b98eff474=
5fe7a3fb02f053b2dc782241a73e807b491936a3","src/unix/linux_like/linux/gnu/b3=
2/riscv32/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd37543ef=
e86621b119","src/unix/linux_like/linux/gnu/b32/riscv32/mod.rs":"491a9a97cf7=
12985b75d3ad714691ef60898d88c78bc386a6917de0a6774cc26","src/unix/linux_like=
/linux/gnu/b32/sparc/align.rs":"21adbed27df73e2d1ed934aaf733a643003d7baf2bd=
e9c48ea440895bcca6d41","src/unix/linux_like/linux/gnu/b32/sparc/mod.rs":"80=
894eece66e9348f45d1b07ad37c757ea694bbd10ed49d3f920b34e9f51a9a3","src/unix/l=
inux_like/linux/gnu/b32/x86/align.rs":"e4bafdc4a519a7922a81b37a62bbfd1177a2=
f620890eef8f1fbc47162e9eb413","src/unix/linux_like/linux/gnu/b32/x86/mod.rs=
":"c703cc5e9de2dc31d9e5831bfb6f354d6e3518b2ae02263f68a9a70f1c0167e2","src/u=
nix/linux_like/linux/gnu/b64/aarch64/align.rs":"fdf1c72375a2167699157e0dd82=
5422690bb6719f7bc69515a2e5846d0431d7c","src/unix/linux_like/linux/gnu/b64/a=
arch64/fallback.rs":"832e7487249c1c0bb6e9911ce3f7d32ca22378e42392ab83c56915=
cbc59d8be3","src/unix/linux_like/linux/gnu/b64/aarch64/ilp32.rs":"bf4611b73=
7813deef6787babf6c01698605f3b75482269b8546318667bc68e29","src/unix/linux_li=
ke/linux/gnu/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426442f09724d9b2052=
b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/gnu/b64/aarch64/lp64=
.rs":"11a950697fdda0258c6e37c6b13993348c8de4134105ed4faa79358e53175072","sr=
c/unix/linux_like/linux/gnu/b64/aarch64/mod.rs":"172495fbfdf659b9b825148bff=
c2b62704f63fc872428617e868eb15802c9978","src/unix/linux_like/linux/gnu/b64/=
loongarch64/align.rs":"060aa33cc737966c691aab8511c5c5729e551458ce18d0e284e0=
d45f39beeb60","src/unix/linux_like/linux/gnu/b64/loongarch64/mod.rs":"18eda=
da8aa5d4127d9aa1bd81c62b5a4209f1efd8b2b2631e801c9e855ab1480","src/unix/linu=
x_like/linux/gnu/b64/mips64/align.rs":"7169d07a9fd4716f7512719aec9fda5d8bed=
306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/linux/gnu/b64/mips64/mod=
.rs":"628c410b9aaec3c8f43838a28616b577a1d6de60a9799b09bb884d80281f96eb","sr=
c/unix/linux_like/linux/gnu/b64/mod.rs":"6a160ef25439c4fecdb0e3bd0b81874226=
3c791364da874d4febd3aa644ec8e2","src/unix/linux_like/linux/gnu/b64/powerpc6=
4/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268130=
d9","src/unix/linux_like/linux/gnu/b64/powerpc64/mod.rs":"c778a136f06c2ffea=
cea19fa14ce79b828f91b67a002dec5ce87289bae36234e","src/unix/linux_like/linux=
/gnu/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd=
37543efe86621b119","src/unix/linux_like/linux/gnu/b64/riscv64/mod.rs":"c8f0=
7efc5ddd5d874f1ebc329cd6907818d132ac3e30f4f2a4b04be3fb388551","src/unix/lin=
ux_like/linux/gnu/b64/s390x.rs":"a2fd9277c2dcf76f7a16a3bcca745d5a9932c765c0=
dc2feb31c3641be25eb0aa","src/unix/linux_like/linux/gnu/b64/sparc64/align.rs=
":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268130d9","src/u=
nix/linux_like/linux/gnu/b64/sparc64/mod.rs":"e8047e9966a2b90063e0151a0278c=
54885e7b323286cf5ab55cbaf151fc772d3","src/unix/linux_like/linux/gnu/b64/x86=
_64/align.rs":"62e822478356db4a73b6bbd1b36d825b893939ab4b308ec11b0578bcc4b4=
9769","src/unix/linux_like/linux/gnu/b64/x86_64/mod.rs":"891e595d33714b9883=
b92f0554d1d361fba2b6c3f6cac09a288252f44c6ec667","src/unix/linux_like/linux/=
gnu/b64/x86_64/not_x32.rs":"38f74ce15d9662ce4818815a2b87be1618d5e45f190f7e4=
db84ff3285b4421fb","src/unix/linux_like/linux/gnu/b64/x86_64/x32.rs":"b2021=
8a11364a6dec87f96d6c0d8b19e660697ab09ad5ee0e9b3a9dafedaaebb","src/unix/linu=
x_like/linux/gnu/mod.rs":"47dd970aedda9c70429741d7c9892a0d5d264e9abcb1c41d5=
bb913a86f0a5362","src/unix/linux_like/linux/gnu/no_align.rs":"9cd223135de75=
315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/linux_like/l=
inux/mod.rs":"1582c09db7b752af0f796a4cba8aa2bb4ecea895c551a2219e76047bcce74=
a23","src/unix/linux_like/linux/musl/b32/arm/align.rs":"3e8ac052c1043764776=
b54c93ba4260e061df998631737a897d9d47d54f7b80c","src/unix/linux_like/linux/m=
usl/b32/arm/mod.rs":"fb99d2d67179bbff887f7bb59eda848d267ec550e5b68703ee9af0=
ff616ba87f","src/unix/linux_like/linux/musl/b32/hexagon.rs":"017976cd5b722f=
1e283e187540a64eaa387163a0157ffbb99e0b5c5513c49522","src/unix/linux_like/li=
nux/musl/b32/mips/align.rs":"429fb5e005cb7143602d430098b6ebfb7d360685b194f3=
33dfd587472ae954ee","src/unix/linux_like/linux/musl/b32/mips/mod.rs":"367a0=
7c58875acc4565f67a2ff1ea028559ea627835911c239ee022c367550fb","src/unix/linu=
x_like/linux/musl/b32/mod.rs":"31677597fd9544c4b1ec1477628288f6273fabbc06e3=
8f33da862ad55f019ce1","src/unix/linux_like/linux/musl/b32/powerpc.rs":"c373=
735aa858760c045c882a7d11ab6a8c9f440b302e923719f991afb6595876","src/unix/lin=
ux_like/linux/musl/b32/riscv32/align.rs":"efd2accf33b87de7c7547903359a5da89=
6edc33cd6c719552c7474b60d4a5d48","src/unix/linux_like/linux/musl/b32/riscv3=
2/mod.rs":"c91bb80655c91061d80dcd48be2e767b979a0a570dbd54fcf2094a9a1e31fad8=
","src/unix/linux_like/linux/musl/b32/x86/align.rs":"08e77fbd7435d7dec2ff56=
932433bece3f02e47ce810f89004a275a86d39cbe1","src/unix/linux_like/linux/musl=
/b32/x86/mod.rs":"50a3a148363df651021707cf8c6bb12edc946a8dad6dcc6c4b0a29136=
d98992d","src/unix/linux_like/linux/musl/b64/aarch64/align.rs":"6ba32725d24=
d7d8e6aa111f3b57aafa318f83b606abe96561329151829821133","src/unix/linux_like=
/linux/musl/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426442f09724d9b2052b=
46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/musl/b64/aarch64/mod.=
rs":"54331c1112bc89cf35c0ebe0a974cb219d5167869ddd347e97faf1ec8c54cfec","src=
/unix/linux_like/linux/musl/b64/mips64.rs":"f606383f7a3639c508172becb2f1d25=
51b86dbd9bfceeef18871f94a30ed8d80","src/unix/linux_like/linux/musl/b64/mod.=
rs":"1a8391febf3e750185ffc5c69c9f9e411f4e8c53b5d994cb231df24480169686","src=
/unix/linux_like/linux/musl/b64/powerpc64.rs":"6308c2d4b27deab7cc062ffdb1a0=
277126a1bc6ccea84f7276150f062df9f6a6","src/unix/linux_like/linux/musl/b64/r=
iscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd37543efe86=
621b119","src/unix/linux_like/linux/musl/b64/riscv64/mod.rs":"e6c51d3d20b7b=
409dec3d7f41256a8a0366eabc7cf4db32a237e0ac7c8aa78fa","src/unix/linux_like/l=
inux/musl/b64/s390x.rs":"fbf661b30015e315639b900a0eecf868c6fe50245460ac9389=
1e1e8f5c55835a","src/unix/linux_like/linux/musl/b64/x86_64/align.rs":"77309=
276ad7a42cbe59ca381f23590b7a143aded05555b34a5b307b808cbca6e","src/unix/linu=
x_like/linux/musl/b64/x86_64/mod.rs":"e5d18b648529b09b35d161120016283f5e2ff=
54e28f60c031c63139901fe713a","src/unix/linux_like/linux/musl/lfs64.rs":"3e4=
fb381f3a0756520bde0f1692d4fa45e4ae8133bf7d7c64b0e3fdd512f235f","src/unix/li=
nux_like/linux/musl/mod.rs":"aa223e1cadb38c7f9db634064256d28174cbfbf0f9809b=
42e2706f12f13df075","src/unix/linux_like/linux/no_align.rs":"62cdca0e011937=
aaf09a51ca86d9f0ee0fdb05f61ec3c058e6a5d5fa6357d784","src/unix/linux_like/li=
nux/non_exhaustive.rs":"181a05bf94fdb911db83ce793b993bd6548a4115b306a7ef3c1=
0f745a8fea3e9","src/unix/linux_like/linux/uclibc/align.rs":"9ed16138d8e439b=
d90930845a65eafa7ebd67366e6bf633936d44014f6e4c959","src/unix/linux_like/lin=
ux/uclibc/arm/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec725195731=
5afa53a7b9f936","src/unix/linux_like/linux/uclibc/arm/mod.rs":"50288ff9e411=
ab0966da24838f2c2a5618021bc19c422a04f577b2979ef4081e","src/unix/linux_like/=
linux/uclibc/arm/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c=
85a76f8316c86653db25","src/unix/linux_like/linux/uclibc/mips/mips32/align.r=
s":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936","src/=
unix/linux_like/linux/uclibc/mips/mips32/mod.rs":"d0c4434e2bf813372c418a8f5=
16c706cdccc9f7be2f0921b2207b0afdb66fe81","src/unix/linux_like/linux/uclibc/=
mips/mips32/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76=
f8316c86653db25","src/unix/linux_like/linux/uclibc/mips/mips64/align.rs":"a=
7bdcb18a37a2d91e64d5fad83ea3edc78f5412adb28f77ab077dbb26dd08b2d","src/unix/=
linux_like/linux/uclibc/mips/mips64/mod.rs":"3f38ee6a4690b9d7594be20d216467=
a34d955f7653c2c8ce1e6147daeb53f1e0","src/unix/linux_like/linux/uclibc/mips/=
mips64/no_align.rs":"4a18e3875698c85229599225ac3401a2a40da87e77b2ad4ef47c6f=
cd5a24ed30","src/unix/linux_like/linux/uclibc/mips/mod.rs":"a048fce1c2d9b1a=
d57305642e8ad05ca0f0c7e4753267a2e2d6b4fee5db3b072","src/unix/linux_like/lin=
ux/uclibc/mod.rs":"1c3d25cddcfefa2bd17bdc81550826be31a08eef235e13f825f169a5=
029c8bca","src/unix/linux_like/linux/uclibc/no_align.rs":"3f28637046524618a=
daa1012e26cb7ffe94b9396e6b518cccdc69d59f274d709","src/unix/linux_like/linux=
/uclibc/x86_64/l4re.rs":"024eba5753e852dbdd212427351affe7e83f9916c1864bce41=
4d7aa2618f192e","src/unix/linux_like/linux/uclibc/x86_64/mod.rs":"196d03aff=
befb85716937c15904831e731eb222ee906e05e42102d639a8152ea","src/unix/linux_li=
ke/linux/uclibc/x86_64/other.rs":"42c3f71e58cabba373f6a55a623f3c31b85049eb6=
4824c09c2b082b3b2d6a0a8","src/unix/linux_like/mod.rs":"45c98e7a0fad03b03c4c=
76f11a80e2423873f0a6563e35c60309a29b2c8ff44f","src/unix/mod.rs":"dd4ce377ba=
9517182e718848739a5c3f58cdbbcd4ee467eef9aaf8df5aed5053","src/unix/newlib/aa=
rch64/mod.rs":"bac93836a9a57b2c710f32f852e92a4d11ad6759ab0fb6ad33e71d60e532=
78af","src/unix/newlib/align.rs":"28aaf87fafbc6b312622719d472d8cf65f9e5467d=
15339df5f73e66d8502b28a","src/unix/newlib/arm/mod.rs":"cbba6b3e957eceb49680=
6e60de8725a23ff3fa0015983b4b4fa27b233732b526","src/unix/newlib/espidf/mod.r=
s":"816f235f4aa4baabba7f2606b31d0fdb03988c52194c966728de8690bf17299d","src/=
unix/newlib/generic.rs":"eab066d9f0a0f3eb53cc1073d01496bba0110989e1f6a59838=
afd19f870cd599","src/unix/newlib/horizon/mod.rs":"7cc5cc120437421db139bfa6a=
90b18168cd3070bdd0f5be96d40fe4c996f3ca1","src/unix/newlib/mod.rs":"9e36de3f=
d78e10cb6b9a59dc5ebe5a1b44a63ccb91433bb33653fb30d0c303c6","src/unix/newlib/=
no_align.rs":"e0743b2179495a9514bc3a4d1781e492878c4ec834ee0085d0891dd1712e8=
2fb","src/unix/newlib/powerpc/mod.rs":"0202ffd57caf75b6afa2c9717750ffb96e37=
5ac33df0ae9609a3f831be393b67","src/unix/newlib/vita/mod.rs":"68e0ce186b44e0=
b3031eb824710e7454dc2a9df98db98120840c3c6f4d885871","src/unix/no_align.rs":=
"c06e95373b9088266e0b14bba0954eef95f93fb2b01d951855e382d22de78e53","src/uni=
x/nto/aarch64.rs":"4709c9afdc8d583be876598e7c238499ee3e8da5bd2baa614d9c7dd4=
14851555","src/unix/nto/mod.rs":"59ab89a8fb6e0a6d22fa968ed4873c2bafa19a0f60=
a90c9a5148816cb7440889","src/unix/nto/neutrino.rs":"799bff4ab01a6424db6c5a2=
b76aa5679826d41495f9d13c63485bf13bc80026b","src/unix/nto/x86_64.rs":"a3e18e=
93c2999da1cd7a6f748a4b60c07aefb73d8ea2aafec19a84cfb040bc8e","src/unix/redox=
/mod.rs":"73658b0d28c82a122875aa2b45c489834f4de58c378add7932bbaf3ffb2ae789"=
,"src/unix/solarish/compat.rs":"00f1ee3faec9da69204e42f025f6735dd13d894071a=
154425dcc43ecbdd06e7f","src/unix/solarish/illumos.rs":"cd93c2d84722bbf9933a=
92842a8998eb0b2afc962f50bc2546ad127b82809fa7","src/unix/solarish/mod.rs":"b=
1660c631a599a3355116e7485b88ab2f8f2929c2e37851a763431387b902f14","src/unix/=
solarish/solaris.rs":"41b350a89ddf01cd12a10f93640f92be53be0b0d976021cdc08da=
17bf3e72edf","src/unix/solarish/x86.rs":"e86e806df0caed72765040eaa2f3c88319=
8d1aa91508540adf9b7008c77f522e","src/unix/solarish/x86_64.rs":"ec2b01f194eb=
8a6a27133c57681da195a949e03098f3ea1e847227a9c09ef5fc","src/unix/solarish/x8=
6_common.rs":"ac869d9c3c95645c22460468391eb1982023c3a8e02b9e06a72e3aef3d5f1=
eac","src/vxworks/aarch64.rs":"98f0afdc511cd02557e506c21fed6737585490a1dce7=
a9d4941d08c437762b99","src/vxworks/arm.rs":"acb7968ce99fe3f4abdf39d98f8133d=
21a4fba435b8ef7084777cb181d788e88","src/vxworks/mod.rs":"e4edcbcf43a325e738=
c9465507594d0c87abf3f0e2b9b046c1425f8d44bdad0f","src/vxworks/powerpc.rs":"a=
cb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788e88","src/vxwor=
ks/powerpc64.rs":"98f0afdc511cd02557e506c21fed6737585490a1dce7a9d4941d08c43=
7762b99","src/vxworks/x86.rs":"552f007f38317620b23889cb7c49d1d1158412524390=
60122f52f434fbc6e5ba","src/vxworks/x86_64.rs":"018d92be3ad628a129eff9f2f5df=
bc0883d8b8e5f2fa917b900a7f98ed6b514a","src/wasi.rs":"09ee3b3348b212b050f6ca=
8ae008a28679ea44a375674307a4e7c9ca0d3ed7d5","src/windows/gnu/align.rs":"b2c=
13ec1b9f3b39a75c452c80c951dff9d0215e31d77e883b4502afb31794647","src/windows=
/gnu/mod.rs":"3c8c7edb7cdf5d0c44af936db2a94869585c69dfabeef30571b4f4e383757=
67a","src/windows/mod.rs":"9fdc5e1c62c441abef7bc62a7343efb2041edc24db9ac0ef=
c0f74df55b69e249","src/windows/msvc/mod.rs":"c068271e00fca6b62bc4bf44bcf142=
cfc38caeded9b6c4e01d1ceef3ccf986f4","src/xous.rs":"eb0675f25ba01f73072d2b70=
907fb8abb1148facefe5a20756c49250f3d65fae","tests/const_fn.rs":"cb75a1f0864f=
926aebe79118fc34d51a0d1ade2c20a394e7774c7e545f21f1f4"},"package":"9cdc71e17=
332e86d2e1d38c1f99edcb6288ee11b815fb1a4b049eaa2114d369b"}
-\ No newline at end of file
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.74.1.bb b/meta/recipes-=
devtools/rust/libstd-rs_1.75.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/libstd-rs_1.74.1.bb
rename to meta/recipes-devtools/rust/libstd-rs_1.75.0.bb
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.74.1.bb b/met=
a/recipes-devtools/rust/rust-cross-canadian_1.75.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-cross-canadian_1.74.1.bb
rename to meta/recipes-devtools/rust/rust-cross-canadian_1.75.0.bb
diff --git a/meta/recipes-devtools/rust/rust-llvm_1.74.1.bb b/meta/recipes-=
devtools/rust/rust-llvm_1.75.0.bb
similarity index 99%
rename from meta/recipes-devtools/rust/rust-llvm_1.74.1.bb
rename to meta/recipes-devtools/rust/rust-llvm_1.75.0.bb
index 5bfc1faea835..13bdadb5e7a5 100644
--- a/meta/recipes-devtools/rust/rust-llvm_1.74.1.bb
+++ b/meta/recipes-devtools/rust/rust-llvm_1.75.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE =3D "http://www.rust-lang.org"
=20
 # check src/llvm-project/llvm/CMakeLists.txt for llvm version in use
 #
-LLVM_RELEASE =3D "16.0.2"
+LLVM_RELEASE =3D "17.0.6"
=20
 require rust-source.inc
=20
diff --git a/meta/recipes-devtools/rust/rust-snapshot.inc b/meta/recipes-de=
vtools/rust/rust-snapshot.inc
index b67e42d27063..1f3c08b1662b 100644
--- a/meta/recipes-devtools/rust/rust-snapshot.inc
+++ b/meta/recipes-devtools/rust/rust-snapshot.inc
@@ -4,47 +4,47 @@
 ## The exact (previous) version that has been used is specified in the sou=
rce tarball.
 ## The version is replicated here.
=20
-SNAPSHOT_VERSION =3D "1.73.0"
+SNAPSHOT_VERSION =3D "1.74.0"
=20
-SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D "1195a1d37280802574d729cf00e=
0dadc63a7c9312a9ae3ef2cf99645f7be0a77"
-SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D "cbaa2549b3accc63b424251f=
adc3a66d922541df22e736a355246d81998f4252"
-SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D "628f57a45eb8143a7ac1acd5d6d=
01e3ae3cdf1ad11d151795ed765f6e5f3047e"
+SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D "a18dc9132cf76ccba90bcbb53b5=
6a4d37ebfb34845f61e79f7b5d4710a269647"
+SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D "c5ad01692bc08ce6f4db2ac8=
15be63498b45013380c71f22b3d33bf3be767270"
+SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D "a49bb365481913ead305658e7e9=
dc621da7895036b840fb57b1bc85c721d07e6"
=20
-SRC_URI[cargo-snapshot-i686.sha256sum] =3D "8780f10eb3565b47f2616ccc1616c1=
a491a12a055976a25de551cb29e7f50390"
-SRC_URI[rust-std-snapshot-i686.sha256sum] =3D "c46936bf3c921c90593b6ea77a0=
8b1ec8b240c8184b287fd89fea636ac437b25"
-SRC_URI[rustc-snapshot-i686.sha256sum] =3D "3d98a27c50ae79de7c7956506d649e=
169312e76b4fc2314a975b45ebd1dea5b9"
+SRC_URI[cargo-snapshot-i686.sha256sum] =3D "9f5b5226a69f95950a381ec5bb15dd=
e7a90865a6df8aa0b470082a40d42d9f38"
+SRC_URI[rust-std-snapshot-i686.sha256sum] =3D "69757b72def9c433753e8bb575c=
817fc1ba389cf1a9c25276db1491ec025e495"
+SRC_URI[rustc-snapshot-i686.sha256sum] =3D "7a2bc1bf7e51942d32e82f461eaceb=
e7f929c3eec210dcb7dc6624efd997d7da"
=20
-SRC_URI[cargo-snapshot-loongarch64.sha256sum] =3D "8e4766b19147d99670e5e34=
73981967d94465ad550c70c830ee86425260e1a05"
-SRC_URI[rust-std-snapshot-loongarch64.sha256sum] =3D "533d38377ea362ba83a3=
eba5008fb89466f4094b247cb1510d4752d0bbbcc070"
-SRC_URI[rustc-snapshot-loongarch64.sha256sum] =3D "0fee28452598859780cf871=
d3f5a809ca606a840c843a8735248c49dbbd32b1c"
+SRC_URI[cargo-snapshot-loongarch64.sha256sum] =3D "77d6d55122150d8fc56d31f=
b166fd1b2ae48bff7376459c1b0030727fc604998"
+SRC_URI[rust-std-snapshot-loongarch64.sha256sum] =3D "13b85a882e912d0d8b32=
28feb5c263d34ec353d483c9defbd3e6bba38935553b"
+SRC_URI[rustc-snapshot-loongarch64.sha256sum] =3D "703e8c81f9ca3100fc459db=
92fd5899de62cf77393f334f98159cd97feb11633"
=20
-SRC_URI[cargo-snapshot-powerpc.sha256sum] =3D "ffa30a6e480b3e20cf42ca32266=
edcfd0b8e4f1b84da450937e4bca7ec3e88e8"
-SRC_URI[rust-std-snapshot-powerpc.sha256sum] =3D "bed705726b356d318a0fc34b=
bf1a1bc4cacb61bfc20889bdfb77d3aaebbd406a"
-SRC_URI[rustc-snapshot-powerpc.sha256sum] =3D "2ed995d178158b8447b68c8642c=
ffed2402fc7502c0d5475b7c9fdfa895dd037"
+SRC_URI[cargo-snapshot-powerpc.sha256sum] =3D "08ea8a345839f34d26f21b94ed6=
d458e6a38513999f7ddc05175c371983e6deb"
+SRC_URI[rust-std-snapshot-powerpc.sha256sum] =3D "458ee056fbeccf1cf96c2050=
6654e5e9104c4e8f23d46cd4bb9b97ff5b3f4d55"
+SRC_URI[rustc-snapshot-powerpc.sha256sum] =3D "d4095cbe26ec197274dae9409e6=
8843653e8c08c0b79e8cd74e72d9907e99816"
=20
-SRC_URI[cargo-snapshot-powerpc64.sha256sum] =3D "35454cd3778dac739da6a3fbb=
e278a2b6818bc4ca95600412e0d51c13f3fdc1f"
-SRC_URI[rust-std-snapshot-powerpc64.sha256sum] =3D "c7bb65f4b7b59f65e4db8a=
0877192f59dce12021c866e2ef86014d99d18a23f5"
-SRC_URI[rustc-snapshot-powerpc64.sha256sum] =3D "9458ea1308e88ceb88dbc38d9=
d4918dc665d3c148a39789de417b0668fc45a3f"
+SRC_URI[cargo-snapshot-powerpc64.sha256sum] =3D "696863642318f139634e6856f=
5e946ea970318ce79d4d9b1595871a70a662a89"
+SRC_URI[rust-std-snapshot-powerpc64.sha256sum] =3D "7ec56629b7d887753ce3a8=
95fb73b77d2d395acac30207c2b69237ef63279872"
+SRC_URI[rustc-snapshot-powerpc64.sha256sum] =3D "ca162463db262df9d64668738=
6a1c19f15c8ca9bf1f29eea94f2a8a6d7a6102d"
=20
-SRC_URI[cargo-snapshot-powerpc64le.sha256sum] =3D "14f74b06ddeebbec4809882=
8d2de55e631ea4cacd7c7ebad8a96220d1a470e0a"
-SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] =3D "a74d300dbf1fbf2d4af8=
0995db19501211e2bd25572ab45748b48df4448d4656"
-SRC_URI[rustc-snapshot-powerpc64le.sha256sum] =3D "c52d6f28d370e7bd30e0765=
5d534a3aad21afc6c32f0c80e8a0f7249d2b86b29"
+SRC_URI[cargo-snapshot-powerpc64le.sha256sum] =3D "2eccd404aabe5137a8e45b6=
173c27d08862a0e674d5866be71aff1434f271d50"
+SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] =3D "785956d68855de18546c=
87d6d06cd2505cb8a10edba84327bf2b448420a31d55"
+SRC_URI[rustc-snapshot-powerpc64le.sha256sum] =3D "8727b1a92e88ac1ce05198e=
e185dac86553edd7f50b726781c9ab64544b59809"
=20
-SRC_URI[cargo-snapshot-riscv64gc.sha256sum] =3D "50d42893e2da56657a7c00ed1=
7498417628793d8b2bceab829be7b2575478879"
-SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] =3D "8b58ae17468f2f2768b470=
f532a1ba9668dc778c242cc9dfc022ea1ebc962f63"
-SRC_URI[rustc-snapshot-riscv64gc.sha256sum] =3D "fee4b06850574de4821d335e6=
22ca0607753e042848ba00ada826f8c8ca4b44a"
+SRC_URI[cargo-snapshot-riscv64gc.sha256sum] =3D "5b224e465e006b5fe959ad64d=
0df0540c4318ba4e39edd89794d520eef60b026"
+SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] =3D "2a500156825dde03a53c96=
5e5764a440b1ebce973b8a31f21e8bd8104271d56e"
+SRC_URI[rustc-snapshot-riscv64gc.sha256sum] =3D "f4f27f1c40208b61ea7e61f9e=
df2de1787aea78a1edb7fe15bceb20de5c7a4a3"
=20
-SRC_URI[cargo-snapshot-s390x.sha256sum] =3D "6035a925f3307c98d2caf0b1727fc=
401e7a64a09e6a7132a0cd882937720bda2"
-SRC_URI[rust-std-snapshot-s390x.sha256sum] =3D "545b97978470135f8726fb8297=
0acb882b9d57a724c2462ee90efee47429fc84"
-SRC_URI[rustc-snapshot-s390x.sha256sum] =3D "0ca1d450f10f2d87b630c5a19f3aa=
d13f0e39aec63f253654ad9f68c7bf1872e"
+SRC_URI[cargo-snapshot-s390x.sha256sum] =3D "06267377c811271d6e4ba6feea1d4=
b84a9f4c5c8d1dbd46092d0a0595f24e9b6"
+SRC_URI[rust-std-snapshot-s390x.sha256sum] =3D "35142541b88a1244c8225c64ee=
18585446d7e67841a9335ccaa95acf2d34dde5"
+SRC_URI[rustc-snapshot-s390x.sha256sum] =3D "41eae7788549aec58a6980ae6222d=
3330a01a37d1e7856d087a4e9c8a19aa890"
=20
-SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D "7c3ce5738d570eaea97dd3d213ea=
73c8beda4f0c61e7486f95e497b7b10c4e2d"
-SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D "96efb163a57b400152c357be0=
ea3a0dd902b56cc0df662b9ac951403c7c7b15b"
-SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D "14f383eb4d6e65ce01cc99f2c5cf=
5a78744239f29704f72fe84f11095af779f5"
+SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D "f219386d4569c40b660518e99267=
afff428c13bf980bda7a614c8d4038d013f6"
+SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D "548413213012e2f62b08ed8a9=
13a51210ae7402619027224580176031f2789ea"
+SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D "7d464be2ae0d6ce69f056d1ea9a8=
ce2b3b1d537418caea216fdd303903972181"
=20
-SRC_URI[rust-std-snapshot-i586.sha256sum] =3D "02cfcb9bae68c406b5cab9aad74=
ac8631fa4fdd9246aac2e4d4c0aeafbcad42a"
+SRC_URI[rust-std-snapshot-i586.sha256sum] =3D "bd4502462c5e2b2617b23f28862=
e544f14c4d02658f6d331f0cfbbba914aa4c0"
=20
-SRC_URI[rust-std-snapshot-sparc64.sha256sum] =3D "717846830d95a689fb44dbaf=
c4f4e09285bf7bc2c37bcc70f6d17785c21f4569"
+SRC_URI[rust-std-snapshot-sparc64.sha256sum] =3D "68e96875ca7fc6ed0e023fcf=
752f28b95e9cc7d9881af4e8e167259fdaec7168"
=20
 SRC_URI +=3D " \
     ${RUST_DIST_SERVER}/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=3Drust-std-s=
napshot-${RUST_BUILD_ARCH};subdir=3Drust-snapshot-components \
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devt=
ools/rust/rust-source.inc
index fdac009c6d20..f5be38a6c6b0 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -4,16 +4,12 @@ RUST_VERSION ?=3D "${@d.getVar('PV').split('-')[0]}"
=20
 SRC_URI +=3D "${RUST_DIST_SERVER}/dist/rustc-${RUST_VERSION}-src.tar.xz;na=
me=3Drust \
             file://hardcodepaths.patch;patchdir=3D${RUSTSRC} \
-            file://0001-Don-t-use-LFS64-symbols-on-musl.patch;patchdir=3D$=
{RUSTSRC} \
             file://zlib-off64_t.patch;patchdir=3D${RUSTSRC} \
-            file://0001-musl-Define-SOCK_NONBLOCK-with-O_NONBLOCK.patch;pa=
tchdir=3D${RUSTSRC} \
-            file://0002-musl-riscv32-Define-F_SETLK-F_SETLKW-and-fix-F_GET=
LK.patch;patchdir=3D${RUSTSRC} \
-            file://0003-musl-Move-F_OFD_GETLK-F_OFD_SETLK-and-F_OFD_SETLKW=
-t.patch;patchdir=3D${RUSTSRC} \
-            file://0004-musl-Define-O_LARGEFILE-for-riscv32.patch;patchdir=
=3D${RUSTSRC} \
-            file://0005-musl-Define-SOCK_SEQPACKET-in-common-place.patch;p=
atchdir=3D${RUSTSRC} \
             file://0001-Revert-Map-source-absolute-paths-to-OUT_DIR-as-rel=
at.patch;patchdir=3D${RUSTSRC} \
+            file://0001-Handle-non-existent-empty-CARGO_HOME-registry-src.=
patch;patchdir=3D${RUSTSRC} \
+            file://0002-Ignore-blank-RUSTC_DEBUGINFO_MAP-RUSTC_CARGO_REGIS=
TR.patch;patchdir=3D${RUSTSRC} \
 "
-SRC_URI[rust.sha256sum] =3D "b98c09d968529212fb29eec7d6d3e9bdaa869810679b7=
fb86a1ca69469d75f5e"
+SRC_URI[rust.sha256sum] =3D "4526f786d673e4859ff2afa0bab2ba13c918b796519a2=
5c1acce06dba9542340"
=20
 RUSTSRC =3D "${WORKDIR}/rustc-${RUST_VERSION}-src"
=20
diff --git a/meta/recipes-devtools/rust/rust_1.74.1.bb b/meta/recipes-devto=
ols/rust/rust_1.75.0.bb
similarity index 99%
rename from meta/recipes-devtools/rust/rust_1.74.1.bb
rename to meta/recipes-devtools/rust/rust_1.75.0.bb
index dd931a42717c..228451ec6bcd 100644
--- a/meta/recipes-devtools/rust/rust_1.74.1.bb
+++ b/meta/recipes-devtools/rust/rust_1.75.0.bb
@@ -175,7 +175,7 @@ python do_configure() {
     config.set("install", "sysconfdir",  e(d.getVar("D") + d.getVar("sysco=
nfdir")))
=20
     with open("config.toml", "w") as f:
-        f.write('changelog-seen =3D 2\n\n')
+        f.write('change-id =3D 116881\n\n')
         config.write(f)
=20
     # set up ${WORKDIR}/cargo_home
--=20
2.39.0


