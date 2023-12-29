Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B5A4C47255
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 11:44:56 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.144935.1703850293882394836
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Dec 2023 03:44:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Cz+7Qrh5;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40d4a7f0c4dso60194895e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 03:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703850292; x=1704455092; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RlWV5hUGIfrJYBuH4bf4uFxM2jZsmZ51++PXsM7YGrw=;
        b=Cz+7Qrh57Q50zGHn9CQjyykqAwuhja426CkUDwAPh9pXa9k3il7MP+CJHPTDw58AXw
         r1hQUxrlNG45ZX9tIlmEEFQ2IQ3Qddx7h4ZRDX4ADHdA3WG0uNMftA5i0CoG3RLUqtEM
         vXFzS+0yT6oDx+zxecqlFqyvcmRlFJwQ3+/Xfdiod40mex1LDjfHKjgjg2nD3U+jFEvN
         Px80tJxsopAkFUR9nJ3P7J2Zc9SvWeWBqxT5961WRpTgqhLFOBqVdepRpZ0F86Qz6XtM
         JnXrc0yirrR/zLIivDHRSCb0DLhPQA0iKXzWPIJpraTA9l9hw8P2+T4eYMt0HrF88bbN
         Zakw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703850292; x=1704455092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RlWV5hUGIfrJYBuH4bf4uFxM2jZsmZ51++PXsM7YGrw=;
        b=SFbp1JhmF9ktJnwVHTmaiJpbk5BqeOFt3uLIVRaDJVXf6l9zqKLsvXWf9Weovk+DnF
         iJZ3ougNicFdiSgzN4QjhqY+OqJri0jcAx6t2aL3/Ilh6WoJ9lk3RDdbSUqdt5ymjW/X
         ql/X4a/gWXZ7iVWZ51yEXJcczA8V96ekJzECWdIK25c0TVcMwSJ4FkyUG1Zy0ljvDaD1
         ouvTqi8a8qmr8mGlpwgyDcMtAuvrPedCxqoqHXcfIl4a5sDTep4jJZ6GbyIgdGwFwnKZ
         FnR0SdN34UW0VphtofWcOPyerwsO045mgME9+wD1HH8jrSH2wQvpHAuOyCpw2qK9Zyll
         dJ8w==
X-Gm-Message-State: AOJu0Yzl/1MH7MRWvMcja2EySfFHGWXgJpaYcfmBAareiC0LM2rfF6WC
	8PrlITjQ/0WeqqNYLK4WH+1NKVDsW70=
X-Google-Smtp-Source: AGHT+IHAnGCq0QEHLjHdLyYm4HkceEN760IwrSUo+6jg3k10ublMl8nb0XBh9nd2uVMKBMzlaIScvg==
X-Received: by 2002:a05:600c:cc9:b0:40d:5324:6da5 with SMTP id fk9-20020a05600c0cc900b0040d53246da5mr4555109wmb.70.1703850292016;
        Fri, 29 Dec 2023 03:44:52 -0800 (PST)
Received: from Zuma-000004PC.lan (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id l2-20020adfe582000000b003366cf8bda4sm19035525wrm.41.2023.12.29.03.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 03:44:50 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Frederic Martinsons <frederic.martinsons@gmail.com>,
	Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v4 08/10] rust: Upgrade 1.72.1 -> 1.73.0
Date: Fri, 29 Dec 2023 11:44:33 +0000
Message-Id: <20231229114435.27810-9-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20231229114435.27810-1-alex.kiernan@gmail.com>
References: <20231229114435.27810-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 11:44:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193011

https://blog.rust-lang.org/2023/10/05/Rust-1.73.0.html

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

(no changes since v1)

 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 .../rust/{cargo_1.72.1.bb => cargo_1.73.0.bb} |  0
 ...-Do-not-use-LFS64-on-linux-with-musl.patch | 36 +++++-----
 .../rust/files/hardcodepaths.patch            |  8 ++-
 ...ibstd-rs_1.72.1.bb => libstd-rs_1.73.0.bb} |  0
 ....72.1.bb => rust-cross-canadian_1.73.0.bb} |  0
 ...ust-llvm_1.72.1.bb => rust-llvm_1.73.0.bb} |  0
 meta/recipes-devtools/rust/rust-snapshot.inc  | 68 ++++++++-----------
 meta/recipes-devtools/rust/rust-source.inc    |  2 +-
 .../rust/{rust_1.72.1.bb => rust_1.73.0.bb}   |  0
 10 files changed, 55 insertions(+), 61 deletions(-)
 rename meta/recipes-devtools/rust/{cargo_1.72.1.bb => cargo_1.73.0.bb} (100%)
 rename meta/recipes-devtools/rust/{libstd-rs_1.72.1.bb => libstd-rs_1.73.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.72.1.bb => rust-cross-canadian_1.73.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-llvm_1.72.1.bb => rust-llvm_1.73.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust_1.72.1.bb => rust_1.73.0.bb} (100%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index f67b7be39c60..8960d9e0144e 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -25,7 +25,7 @@ LINUXLIBCVERSION ?= "6.5%"
 QEMUVERSION ?= "8.1%"
 GOVERSION ?= "1.20%"
 LLVMVERSION ?= "17.%"
-RUSTVERSION ?= "1.72%"
+RUSTVERSION ?= "1.73%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?= "${GCCVERSION}"
diff --git a/meta/recipes-devtools/rust/cargo_1.72.1.bb b/meta/recipes-devtools/rust/cargo_1.73.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/cargo_1.72.1.bb
rename to meta/recipes-devtools/rust/cargo_1.73.0.bb
diff --git a/meta/recipes-devtools/rust/files/0001-Do-not-use-LFS64-on-linux-with-musl.patch b/meta/recipes-devtools/rust/files/0001-Do-not-use-LFS64-on-linux-with-musl.patch
index dd23d09101ef..794ad804f0dc 100644
--- a/meta/recipes-devtools/rust/files/0001-Do-not-use-LFS64-on-linux-with-musl.patch
+++ b/meta/recipes-devtools/rust/files/0001-Do-not-use-LFS64-on-linux-with-musl.patch
@@ -19,10 +19,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  library/std/src/sys/unix/fs.rs | 27 ++++++++++++++++++++-------
  3 files changed, 38 insertions(+), 12 deletions(-)
 
-Index: rustc-1.72.0-src/library/std/src/os/linux/fs.rs
+Index: rustc-1.73.0-src/library/std/src/os/linux/fs.rs
 ===================================================================
---- rustc-1.72.0-src.orig/library/std/src/os/linux/fs.rs
-+++ rustc-1.72.0-src/library/std/src/os/linux/fs.rs
+--- rustc-1.73.0-src.orig/library/std/src/os/linux/fs.rs
++++ rustc-1.73.0-src/library/std/src/os/linux/fs.rs
 @@ -329,7 +329,14 @@ pub trait MetadataExt {
  impl MetadataExt for Metadata {
      #[allow(deprecated)]
@@ -39,10 +39,10 @@ Index: rustc-1.72.0-src/library/std/src/os/linux/fs.rs
      }
      fn st_dev(&self) -> u64 {
          self.as_inner().as_inner().st_dev as u64
-Index: rustc-1.72.0-src/library/std/src/sys/unix/fd.rs
+Index: rustc-1.73.0-src/library/std/src/sys/unix/fd.rs
 ===================================================================
---- rustc-1.72.0-src.orig/library/std/src/sys/unix/fd.rs
-+++ rustc-1.72.0-src/library/std/src/sys/unix/fd.rs
+--- rustc-1.73.0-src.orig/library/std/src/sys/unix/fd.rs
++++ rustc-1.73.0-src/library/std/src/sys/unix/fd.rs
 @@ -124,9 +124,12 @@ impl FileDesc {
      }
  
@@ -73,11 +73,11 @@ Index: rustc-1.72.0-src/library/std/src/sys/unix/fd.rs
          use libc::pwrite64;
  
          unsafe {
-Index: rustc-1.72.0-src/library/std/src/sys/unix/fs.rs
+Index: rustc-1.73.0-src/library/std/src/sys/unix/fs.rs
 ===================================================================
---- rustc-1.72.0-src.orig/library/std/src/sys/unix/fs.rs
-+++ rustc-1.72.0-src/library/std/src/sys/unix/fs.rs
-@@ -50,9 +50,13 @@ use libc::{c_int, mode_t};
+--- rustc-1.73.0-src.orig/library/std/src/sys/unix/fs.rs
++++ rustc-1.73.0-src/library/std/src/sys/unix/fs.rs
+@@ -39,9 +39,13 @@ use libc::{c_int, mode_t};
      all(target_os = "linux", target_env = "gnu")
  ))]
  use libc::c_char;
@@ -93,7 +93,7 @@ Index: rustc-1.72.0-src/library/std/src/sys/unix/fs.rs
  use libc::fstatat64;
  #[cfg(any(
      target_os = "android",
-@@ -64,7 +68,7 @@ use libc::fstatat64;
+@@ -53,7 +57,7 @@ use libc::fstatat64;
      target_os = "vita",
  ))]
  use libc::readdir as readdir64;
@@ -102,7 +102,7 @@ Index: rustc-1.72.0-src/library/std/src/sys/unix/fs.rs
  use libc::readdir64;
  #[cfg(any(target_os = "emscripten", target_os = "l4re"))]
  use libc::readdir64_r;
-@@ -79,6 +83,7 @@ use libc::readdir64_r;
+@@ -68,6 +72,7 @@ use libc::readdir64_r;
      target_os = "redox",
      target_os = "nto",
      target_os = "vita",
@@ -110,7 +110,7 @@ Index: rustc-1.72.0-src/library/std/src/sys/unix/fs.rs
  )))]
  use libc::readdir_r as readdir64_r;
  #[cfg(target_os = "android")]
-@@ -86,7 +91,13 @@ use libc::{
+@@ -75,7 +80,13 @@ use libc::{
      dirent as dirent64, fstat as fstat64, fstatat as fstatat64, ftruncate64, lseek64,
      lstat as lstat64, off64_t, open as open64, stat as stat64,
  };
@@ -124,7 +124,7 @@ Index: rustc-1.72.0-src/library/std/src/sys/unix/fs.rs
      target_os = "linux",
      target_os = "emscripten",
      target_os = "l4re",
-@@ -96,7 +107,7 @@ use libc::{
+@@ -85,7 +96,7 @@ use libc::{
      dirent as dirent64, fstat as fstat64, ftruncate as ftruncate64, lseek as lseek64,
      lstat as lstat64, off_t as off64_t, open as open64, stat as stat64,
  };
@@ -133,7 +133,7 @@ Index: rustc-1.72.0-src/library/std/src/sys/unix/fs.rs
  use libc::{dirent64, fstat64, ftruncate64, lseek64, lstat64, off64_t, open64, stat64};
  
  pub use crate::sys_common::fs::try_exists;
-@@ -283,6 +294,7 @@ unsafe impl Sync for Dir {}
+@@ -272,6 +283,7 @@ unsafe impl Sync for Dir {}
  #[cfg(any(
      target_os = "android",
      target_os = "linux",
@@ -141,7 +141,7 @@ Index: rustc-1.72.0-src/library/std/src/sys/unix/fs.rs
      target_os = "solaris",
      target_os = "illumos",
      target_os = "fuchsia",
-@@ -324,6 +336,7 @@ struct dirent64_min {
+@@ -313,6 +325,7 @@ struct dirent64_min {
  }
  
  #[cfg(not(any(
@@ -149,7 +149,7 @@ Index: rustc-1.72.0-src/library/std/src/sys/unix/fs.rs
      target_os = "android",
      target_os = "linux",
      target_os = "solaris",
-@@ -832,7 +845,7 @@ impl DirEntry {
+@@ -809,7 +822,7 @@ impl DirEntry {
      }
  
      #[cfg(all(
@@ -158,7 +158,7 @@ Index: rustc-1.72.0-src/library/std/src/sys/unix/fs.rs
          not(miri)
      ))]
      pub fn metadata(&self) -> io::Result<FileAttr> {
-@@ -856,7 +869,7 @@ impl DirEntry {
+@@ -833,7 +846,7 @@ impl DirEntry {
      }
  
      #[cfg(any(
diff --git a/meta/recipes-devtools/rust/files/hardcodepaths.patch b/meta/recipes-devtools/rust/files/hardcodepaths.patch
index 19c494ad9a4f..6eb091461fc9 100644
--- a/meta/recipes-devtools/rust/files/hardcodepaths.patch
+++ b/meta/recipes-devtools/rust/files/hardcodepaths.patch
@@ -6,9 +6,11 @@ Upstream-Status: Inappropriate [patches need rework]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
 
---- rustc-1.69.0-src/compiler/rustc_codegen_llvm/src/context.rs.orig	2023-04-21 08:38:23.092458478 +0100
-+++ rustc-1.69.0-src/compiler/rustc_codegen_llvm/src/context.rs	2023-04-21 08:39:00.266819755 +0100
-@@ -156,46 +156,6 @@
+Index: rustc-1.73.0-src/compiler/rustc_codegen_llvm/src/context.rs
+===================================================================
+--- rustc-1.73.0-src.orig/compiler/rustc_codegen_llvm/src/context.rs
++++ rustc-1.73.0-src/compiler/rustc_codegen_llvm/src/context.rs
+@@ -157,46 +157,6 @@ pub unsafe fn create_module<'ll>(
          }
      }
  
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.72.1.bb b/meta/recipes-devtools/rust/libstd-rs_1.73.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/libstd-rs_1.72.1.bb
rename to meta/recipes-devtools/rust/libstd-rs_1.73.0.bb
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.72.1.bb b/meta/recipes-devtools/rust/rust-cross-canadian_1.73.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-cross-canadian_1.72.1.bb
rename to meta/recipes-devtools/rust/rust-cross-canadian_1.73.0.bb
diff --git a/meta/recipes-devtools/rust/rust-llvm_1.72.1.bb b/meta/recipes-devtools/rust/rust-llvm_1.73.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-llvm_1.72.1.bb
rename to meta/recipes-devtools/rust/rust-llvm_1.73.0.bb
diff --git a/meta/recipes-devtools/rust/rust-snapshot.inc b/meta/recipes-devtools/rust/rust-snapshot.inc
index e8f97cf03173..38d735db41cb 100644
--- a/meta/recipes-devtools/rust/rust-snapshot.inc
+++ b/meta/recipes-devtools/rust/rust-snapshot.inc
@@ -4,55 +4,47 @@
 ## The exact (previous) version that has been used is specified in the source tarball.
 ## The version is replicated here.
 
-SNAPSHOT_VERSION = "1.71.0"
+SNAPSHOT_VERSION = "1.72.0"
 
-SRC_URI[cargo-snapshot-aarch64.sha256sum] = "13e8ff23d6af976a45f3ab451bf698e318a8d1823d588ff8a989555096f894a8"
-SRC_URI[rust-std-snapshot-aarch64.sha256sum] = "58542a0ab1162ce05a45eb751793782dc24c5bf8eb9a7467317f254260305ea6"
-SRC_URI[rustc-snapshot-aarch64.sha256sum] = "e61b6e34df8c3a002798a9f627c4da701d66f9fc066a70264e354b03d06e6722"
+SRC_URI[cargo-snapshot-aarch64.sha256sum] = "95741a4cd2073adbd74a7c5596bb912abf4b2dfe00d70a9919cba4a836b7a0ff"
+SRC_URI[rust-std-snapshot-aarch64.sha256sum] = "41d259c6f84280fd0e7719fea03a7583ba54e33e8ac32a2a7b703ffb0aebb7d9"
+SRC_URI[rustc-snapshot-aarch64.sha256sum] = "1948a80453956d494457dcced1942e2e204fb26d4e57e718ef1c7aa378efbedb"
 
-SRC_URI[cargo-snapshot-i686.sha256sum] = "ee836c079c53e8e2ed5b2cbad849f991f2142b0b47b593a29b5cb39a76ee910e"
-SRC_URI[rust-std-snapshot-i686.sha256sum] = "46976bf8297efc65556ccddfec395d5327fbe303f9dabffd104628a37cb1de6d"
-SRC_URI[rustc-snapshot-i686.sha256sum] = "e7c9c943b727de4f978cc9366e5c42536992d52ad418ffb9015e836723fd75ca"
+SRC_URI[cargo-snapshot-i686.sha256sum] = "549eda5cda44750b0b2e6d3ce3f9c90c3a133b695e4882b4c6b93e54d6e8a73a"
+SRC_URI[rust-std-snapshot-i686.sha256sum] = "536c5ec1403b55045a502af1d6f8af192b560fbf9a24874bce6d59163fb8a38a"
+SRC_URI[rustc-snapshot-i686.sha256sum] = "53c0e2045078326fd2ac9e77900a34b4ced1545a489b2a438deaebd2150cf543"
 
-SRC_URI[cargo-snapshot-loongarch64.sha256sum] = "33dd282f63a2ccf0251baec5fa8d989276b1735528fe4b5153319038cedbe115"
-SRC_URI[rust-std-snapshot-loongarch64.sha256sum] = "1a7c473cb50248a505a0e08dc05df49291e48a302a7b138e3ce396b0d0df9dbb"
-SRC_URI[rustc-snapshot-loongarch64.sha256sum] = "fbb21fefc8dee4c73f151b15f175caaabf10c3e122974d3fea3f3e2fbe916822"
+SRC_URI[cargo-snapshot-loongarch64.sha256sum] = "216a9ccbfab10778f977b62416c17cf94a374e84a7acf3f50a11cf0b8b88940c"
+SRC_URI[rust-std-snapshot-loongarch64.sha256sum] = "116065f0bb6d8e13725b974f057709e12ed85d93217a0feb16581850db7a0ede"
+SRC_URI[rustc-snapshot-loongarch64.sha256sum] = "73633f52ff12c448d2523409967d8d5d1e0b664c5a3a214395d10a9be7cc020d"
 
-SRC_URI[cargo-snapshot-mips.sha256sum] = "ad068f683e44dbf539ab28d9a1ad1508d22b932aaa81ab0f77df2237817ef1e8"
-SRC_URI[rust-std-snapshot-mips.sha256sum] = "a259bddfc3ee36279b016ebd2682fc5b4d1b93c63bed6e4f57b5a2963d661dc9"
-SRC_URI[rustc-snapshot-mips.sha256sum] = "10d663c3b6cbf1d2166c2d544a2567c83bd8fb110c80064263393b89f025204c"
+SRC_URI[cargo-snapshot-powerpc.sha256sum] = "8a6452262e062be0e7eef92b2aafaa06caf0853b264a3fd337e92079a43f0a24"
+SRC_URI[rust-std-snapshot-powerpc.sha256sum] = "cca2897f091227cc53d63f3eefcfcb65f42d9e24a04a1b37a0d3ee36b7f84b5b"
+SRC_URI[rustc-snapshot-powerpc.sha256sum] = "3a8f0f115ae2d599e1de12d38cb47bd7f9b508e213bf2f9a41efc136021c49a2"
 
-SRC_URI[cargo-snapshot-mipsel.sha256sum] = "c7973b800cadb67f6c5a4b938e03bb9e891ca5ab153da10a7913d9c3e18c9371"
-SRC_URI[rust-std-snapshot-mipsel.sha256sum] = "ad91d662c93e5092367048c8e717f64a5096b876623e5fbc3c791b2d1f868dfb"
-SRC_URI[rustc-snapshot-mipsel.sha256sum] = "05d15f51fc33439582967dfc8f19364e67e8b5050abefbdd8913984e8a7be84e"
+SRC_URI[cargo-snapshot-powerpc64.sha256sum] = "a24a385d9f403e0800adb4d8364e663e40a04663a18df8d8704a5156d4232a1b"
+SRC_URI[rust-std-snapshot-powerpc64.sha256sum] = "4aa7b7e80a5c45825f01aee96a88c5bcd56317c66298c4bd4ce99c80095e492e"
+SRC_URI[rustc-snapshot-powerpc64.sha256sum] = "f1863c033fa88ebb9628f38988da54fadd16075b06765dc93abcd8b4f58f557b"
 
-SRC_URI[cargo-snapshot-powerpc.sha256sum] = "38d0a67429bbbe5e56ba30110c77d8dab3ebe96f8159de1d973da74e5bcbbc71"
-SRC_URI[rust-std-snapshot-powerpc.sha256sum] = "fac6cc57d8a922423db2f0239b8484df3b029d0b58a63676868de682680bbf87"
-SRC_URI[rustc-snapshot-powerpc.sha256sum] = "1961433bbe12e84f2a01daa713779cb4a3fc53b856447047efee3ad02e596164"
+SRC_URI[cargo-snapshot-powerpc64le.sha256sum] = "f659bf3ab70c376c736b7d7112d1fcee32a56dbfa66f6ef4fc039652f66c99e7"
+SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] = "b6ef684ebf77063dbc1ff0abfe1316651fa73bbb95b023255b301b415867ff8b"
+SRC_URI[rustc-snapshot-powerpc64le.sha256sum] = "20ed9ec0599e6582a218dae544566ddf7e2af46341705f35de874c90d7eecc0c"
 
-SRC_URI[cargo-snapshot-powerpc64.sha256sum] = "a8f7d55c8e17db9737fad863b0b9327d79acf2baad2159d099b6d79e40ae79a5"
-SRC_URI[rust-std-snapshot-powerpc64.sha256sum] = "628957fbe1f8665578167c6814486941f7b04417dce8a499cababa3284a2260a"
-SRC_URI[rustc-snapshot-powerpc64.sha256sum] = "0b14c621f0144d454fbe6093a31171e91163ea2a566092f35364817f5c77a96b"
+SRC_URI[cargo-snapshot-riscv64gc.sha256sum] = "43c89f16832e16fff0b2c51b953c8295db97bc5623cb1bf0164d992a7f29af03"
+SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] = "0208dd644f6e266cc7c07695889f1280e04be06672cb172a401a444b54ffa9e9"
+SRC_URI[rustc-snapshot-riscv64gc.sha256sum] = "3a5a1dddf679720fec5c7af9e38f3ed5d7fe134c430458fae98f116da01becf6"
 
-SRC_URI[cargo-snapshot-powerpc64le.sha256sum] = "9e6e184ad1836f52e5863b6ed72619926bb2e8c7ccf2b3c96bf86d7783f19673"
-SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] = "3ce73e032232522cd7c37e64b1e8895f16ddcef02b1646d078f67bb36b6c1494"
-SRC_URI[rustc-snapshot-powerpc64le.sha256sum] = "9c4e3d5740e48265ab59888090013793777a526ecf5541c0fb055f9f0a13f409"
+SRC_URI[cargo-snapshot-s390x.sha256sum] = "f2ce1bfc373efe162ca5b8ccfdb366dd526710fac305c61ed0b582b9185d68e9"
+SRC_URI[rust-std-snapshot-s390x.sha256sum] = "9ebe880ea998fc13d3ed9cbe71d26c69dd93859be8a8e582a8ddc5393400d4e5"
+SRC_URI[rustc-snapshot-s390x.sha256sum] = "41a958bc4313fb0c0446376c84476818820cfe75937675a9594823b63dc9e219"
 
-SRC_URI[cargo-snapshot-riscv64gc.sha256sum] = "bb78d8d09c8bb34d47a11276bc5566565a1dd075e1a5f4388347c767ba2b06a2"
-SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] = "bf692cee46d6c04c3993795633fdc5d4c1dffa7e4d4924227fa3e044872440a4"
-SRC_URI[rustc-snapshot-riscv64gc.sha256sum] = "1941967619e0a3b6b8d6c3175bd5530c8b1bf30a7044c071f1b1808a56532ea7"
+SRC_URI[cargo-snapshot-x86_64.sha256sum] = "4a401dfe7b3056dc0d42acbcd380b2b90f936577706ca74ef5327af0f5abd0a0"
+SRC_URI[rust-std-snapshot-x86_64.sha256sum] = "36f27513a6e4381f15b0cd14097c885af537f990cb6193cec3337c429367bf23"
+SRC_URI[rustc-snapshot-x86_64.sha256sum] = "5b5d7854a0d73368f15146c1aa47e4dbccf12762c93282f410a09a605929ce09"
 
-SRC_URI[cargo-snapshot-s390x.sha256sum] = "6ab6597d7e42e7a94246ec6679b6a5479e95ca84e76cc952544514ff901da605"
-SRC_URI[rust-std-snapshot-s390x.sha256sum] = "4ceab97a7c15e1235aa099306798e1eb8620aad5477b7123dc9e343bb9a6fcfe"
-SRC_URI[rustc-snapshot-s390x.sha256sum] = "b94e7db76f3a0b13b8bc6f51f65f3a66ac3694ab2cf63b03c3f56ba6e7cce841"
+SRC_URI[rust-std-snapshot-i586.sha256sum] = "57df2bdcfb659cb34bcb199400e84eb09d564fc390e5f8d3b011a15955241266"
 
-SRC_URI[cargo-snapshot-x86_64.sha256sum] = "fe6fb520f59966300ee661d18b37c36cb3e614877c4c01dfedf987b8a9c577e9"
-SRC_URI[rust-std-snapshot-x86_64.sha256sum] = "98ae6530c3a41167e9d93d11ea078be98a02f6d809a06d0d51af3ce0f73150d7"
-SRC_URI[rustc-snapshot-x86_64.sha256sum] = "c293d906769671d1cd18e945671bbd14e0b8a41df5075c47f33e6086fc8a1558"
-
-SRC_URI[rust-std-snapshot-i586.sha256sum] = "5878f641f4e5a12ced79d2f0d5d9a9d5b0b97b56967684cf09357162c3e6a7b7"
-
-SRC_URI[rust-std-snapshot-sparc64.sha256sum] = "679ef3ee4a3876f071e08539734de2fabfcc3410977e8c20ba685bc9f40a693b"
+SRC_URI[rust-std-snapshot-sparc64.sha256sum] = "b39c5d31ad61c5670a09dc4c8020f888e9b5be2dd0deec90899a7ed14b759488"
 
 SRC_URI += " \
     ${RUST_DIST_SERVER}/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=rust-std-snapshot-${RUST_BUILD_ARCH};subdir=rust-snapshot-components \
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index ca3fcf9e884d..c2a64c061a83 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -7,7 +7,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://0001-musl-Define-SOCK_SEQPACKET-in-common-place.patch;patchdir=${RUSTSRC} \
             file://0001-Revert-Map-source-absolute-paths-to-OUT_DIR-as-relat.patch;patchdir=${RUSTSRC} \
 "
-SRC_URI[rust.sha256sum] = "aea58d962ff1c19521b9f587aad88285f0fd35b6b6738b031a7a15bb1b70a7c3"
+SRC_URI[rust.sha256sum] = "6eaf672dbea2e6596af8c999f5e6924b9af4bb8b02166bfe0b928e68aa75ae62"
 
 RUSTSRC = "${WORKDIR}/rustc-${RUST_VERSION}-src"
 
diff --git a/meta/recipes-devtools/rust/rust_1.72.1.bb b/meta/recipes-devtools/rust/rust_1.73.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust_1.72.1.bb
rename to meta/recipes-devtools/rust/rust_1.73.0.bb
-- 
2.39.0


