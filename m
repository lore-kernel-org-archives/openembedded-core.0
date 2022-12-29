Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A12EC3DA79
	for <webhook@archiver.kernel.org>; Thu, 29 Dec 2022 07:12:40 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.199610.1672297955447449409
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Dec 2022 23:12:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cgFLRu3s;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id p4so18415694pjk.2
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 23:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=12j+/0ZBcegtxApdFKR+TgyLyqC1/yOXmhYSLVoOCsg=;
        b=cgFLRu3sqzhTqW6xo5Ka1VZO6CZjYPIj2jGZWUKzKAtlZrD2fw5fzFqOVonX4u87bZ
         qxwajbVby3BFKR7Ni4Y6iWCYsBj1zxIABs1HqLCioQOGUO94yNEf0vtTrp/GfMfjbRQk
         bmhFxx5JI+d6kn44VRp32D2vw0h4BOLUPZaEwyYZE48v+z5f2bmm48jS8lcsLv5CurDi
         2aBJL92e8fZ6i/Sftbahu2Hc9EpxZ9vZCZ5jFu2+S3MGDWYHL5D3zxw50P8GH1oJAeS6
         x6LNXfji13PQIlEA6d2T3vDlvC6peZjqd42W7zLkw6IbAz25IuMLIWr+58/xQh2NiS/A
         CdeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=12j+/0ZBcegtxApdFKR+TgyLyqC1/yOXmhYSLVoOCsg=;
        b=cw9Chu7xk6BGWiEj7/z2eqy35YyabiCc8hp573ChsMIh0ysnDlKFUKS3a6IqrqxGDo
         D9kPM5a/FwqJ3LE+8rnQCT2pqWYHbTai+RuNejrjTQ/4NFKpDHXIo4Cp/h3VG35C/rtc
         +ATtOwPrk5vNIX3CZvA/gOxIPFGEX+G/OuWAGWVjFk0Kqbsi2jDnPu1+YPGEmu7CslD3
         /bSgqRqJEEa357LWe2wN8hFjVyg86W6TEu8PO1Zpj6MGsBlpHmXOqv5RHgLTaV7p/moh
         xeOxHlPl6jzD9PIc45lnO4icBeExCHLuiiv9LHDw/9PW74XNGaKevdrFoMLUlQDCU/7r
         1GEw==
X-Gm-Message-State: AFqh2koS939V4QUDtlEktE89HEKGgnWtpTWPEuVTlN6RelczLM+76J2V
	svvCPQih7Fc9PYKW6X11ZLW18LeMJLU=
X-Google-Smtp-Source: AMrXdXuBjj+xpv/xLFcEMaJVPjcOXzUOP2v8rFCzilPlv+CKQxuOUgXLj4ypT6nQtpvyFcBAiDKzgw==
X-Received: by 2002:a05:6a20:c491:b0:a2:df6d:e56b with SMTP id eo17-20020a056a20c49100b000a2df6de56bmr28410035pzb.14.1672297954525;
        Wed, 28 Dec 2022 23:12:34 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::bccc])
        by smtp.gmail.com with ESMTPSA id n16-20020a63ee50000000b004812f798a37sm10398347pgk.60.2022.12.28.23.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 23:12:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/3] rust,libstd-rs: Fix build with latest musl
Date: Wed, 28 Dec 2022 23:12:30 -0800
Message-Id: <20221229071231.4107849-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221229071231.4107849-1-raj.khem@gmail.com>
References: <20221229071231.4107849-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 07:12:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175092

newer musl do not provide lfs64 functions anymore since off_t is always
64bit on musl using normal functions would suffice

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-Do-not-use-LFS64-on-linux-with-musl.patch | 168 ++++++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |   5 +
 2 files changed, 173 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/0001-Do-not-use-LFS64-on-linux-with-musl.patch

diff --git a/meta/recipes-devtools/rust/files/0001-Do-not-use-LFS64-on-linux-with-musl.patch b/meta/recipes-devtools/rust/files/0001-Do-not-use-LFS64-on-linux-with-musl.patch
new file mode 100644
index 0000000000..da72665bbd
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/0001-Do-not-use-LFS64-on-linux-with-musl.patch
@@ -0,0 +1,168 @@
+From 3ecce665198e3420d70139d86ed22e74804c9379 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 28 Dec 2022 22:35:55 -0800
+Subject: [PATCH] Do not use LFS64 on linux with musl
+
+glibc is providing open64 and other lfs64 functions but musl aliases
+them to normal equivalents since off_t is always 64-bit on musl,
+therefore check for target env along when target OS is linux before
+using open64, this is more available. Latest Musl has made these
+namespace changes [1]
+
+[1] https://git.musl-libc.org/cgit/musl/commit/?id=246f1c811448f37a44b41cd8df8d0ef9736d95f4
+
+Upstream-Status: Submitted [https://github.com/rust-lang/rust/pull/106246]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ library/std/src/os/linux/fs.rs |  9 ++++++++-
+ library/std/src/sys/unix/fd.rs | 14 ++++++++++----
+ library/std/src/sys/unix/fs.rs | 27 ++++++++++++++++++++-------
+ 3 files changed, 38 insertions(+), 12 deletions(-)
+
+diff --git a/library/std/src/os/linux/fs.rs b/library/std/src/os/linux/fs.rs
+index 479bbcc17a8..ab0b2a3eda3 100644
+--- a/library/std/src/os/linux/fs.rs
++++ b/library/std/src/os/linux/fs.rs
+@@ -329,7 +329,14 @@ pub trait MetadataExt {
+ impl MetadataExt for Metadata {
+     #[allow(deprecated)]
+     fn as_raw_stat(&self) -> &raw::stat {
+-        unsafe { &*(self.as_inner().as_inner() as *const libc::stat64 as *const raw::stat) }
++        #[cfg(target_env = "musl")]
++        unsafe {
++            &*(self.as_inner().as_inner() as *const libc::stat as *const raw::stat)
++        }
++        #[cfg(not(target_env = "musl"))]
++        unsafe {
++            &*(self.as_inner().as_inner() as *const libc::stat64 as *const raw::stat)
++        }
+     }
+     fn st_dev(&self) -> u64 {
+         self.as_inner().as_inner().st_dev as u64
+diff --git a/library/std/src/sys/unix/fd.rs b/library/std/src/sys/unix/fd.rs
+index dbaa3c33e2e..5d31557bd11 100644
+--- a/library/std/src/sys/unix/fd.rs
++++ b/library/std/src/sys/unix/fd.rs
+@@ -115,9 +115,12 @@ pub fn read_to_end(&self, buf: &mut Vec<u8>) -> io::Result<usize> {
+     }
+ 
+     pub fn read_at(&self, buf: &mut [u8], offset: u64) -> io::Result<usize> {
+-        #[cfg(not(any(target_os = "linux", target_os = "android")))]
++        #[cfg(not(any(
++            all(target_os = "linux", not(target_env = "musl")),
++            target_os = "android"
++        )))]
+         use libc::pread as pread64;
+-        #[cfg(any(target_os = "linux", target_os = "android"))]
++        #[cfg(any(all(target_os = "linux", not(target_env = "musl")), target_os = "android"))]
+         use libc::pread64;
+ 
+         unsafe {
+@@ -181,9 +184,12 @@ pub fn is_write_vectored(&self) -> bool {
+     }
+ 
+     pub fn write_at(&self, buf: &[u8], offset: u64) -> io::Result<usize> {
+-        #[cfg(not(any(target_os = "linux", target_os = "android")))]
++        #[cfg(not(any(
++            all(target_os = "linux", not(target_env = "musl")),
++            target_os = "android"
++        )))]
+         use libc::pwrite as pwrite64;
+-        #[cfg(any(target_os = "linux", target_os = "android"))]
++        #[cfg(any(all(target_os = "linux", not(target_env = "musl")), target_os = "android"))]
+         use libc::pwrite64;
+ 
+         unsafe {
+diff --git a/library/std/src/sys/unix/fs.rs b/library/std/src/sys/unix/fs.rs
+index aea0c26ee8b..e7be4729ca6 100644
+--- a/library/std/src/sys/unix/fs.rs
++++ b/library/std/src/sys/unix/fs.rs
+@@ -45,19 +45,24 @@
+     all(target_os = "linux", target_env = "gnu")
+ ))]
+ use libc::c_char;
+-#[cfg(any(target_os = "linux", target_os = "emscripten", target_os = "android"))]
++#[cfg(any(
++    all(target_os = "linux", not(target_env = "musl")),
++    target_os = "emscripten",
++    target_os = "android"
++))]
+ use libc::dirfd;
+-#[cfg(any(target_os = "linux", target_os = "emscripten"))]
++#[cfg(any(not(target_env = "musl"), target_os = "emscripten"))]
+ use libc::fstatat64;
+ #[cfg(any(
+     target_os = "android",
+     target_os = "solaris",
+     target_os = "fuchsia",
+     target_os = "redox",
+-    target_os = "illumos"
++    target_os = "illumos",
++    target_env = "musl"
+ ))]
+ use libc::readdir as readdir64;
+-#[cfg(target_os = "linux")]
++#[cfg(all(target_os = "linux", not(target_env = "musl")))]
+ use libc::readdir64;
+ #[cfg(any(target_os = "emscripten", target_os = "l4re"))]
+ use libc::readdir64_r;
+@@ -77,7 +82,13 @@
+     dirent as dirent64, fstat as fstat64, fstatat as fstatat64, ftruncate64, lseek64,
+     lstat as lstat64, off64_t, open as open64, stat as stat64,
+ };
++#[cfg(target_env = "musl")]
++use libc::{
++    dirent as dirent64, fstat as fstat64, ftruncate as ftruncate64, lseek as lseek64,
++    lstat as lstat64, off_t as off64_t, open as open64, stat as stat64,
++};
+ #[cfg(not(any(
++    target_env = "musl",
+     target_os = "linux",
+     target_os = "emscripten",
+     target_os = "l4re",
+@@ -87,7 +98,7 @@
+     dirent as dirent64, fstat as fstat64, ftruncate as ftruncate64, lseek as lseek64,
+     lstat as lstat64, off_t as off64_t, open as open64, stat as stat64,
+ };
+-#[cfg(any(target_os = "linux", target_os = "emscripten", target_os = "l4re"))]
++#[cfg(any(not(target_env = "musl"), target_os = "emscripten", target_os = "l4re"))]
+ use libc::{dirent64, fstat64, ftruncate64, lseek64, lstat64, off64_t, open64, stat64};
+ 
+ pub use crate::sys_common::fs::try_exists;
+@@ -260,6 +271,7 @@ unsafe impl Sync for Dir {}
+ #[cfg(any(
+     target_os = "android",
+     target_os = "linux",
++    not(target_env = "musl"),
+     target_os = "solaris",
+     target_os = "illumos",
+     target_os = "fuchsia",
+@@ -292,6 +304,7 @@ struct dirent64_min {
+ }
+ 
+ #[cfg(not(any(
++    target_env = "musl",
+     target_os = "android",
+     target_os = "linux",
+     target_os = "solaris",
+@@ -745,7 +758,7 @@ pub fn file_name(&self) -> OsString {
+     }
+ 
+     #[cfg(all(
+-        any(target_os = "linux", target_os = "emscripten", target_os = "android"),
++        any(not(target_env = "musl"), target_os = "emscripten", target_os = "android"),
+         not(miri)
+     ))]
+     pub fn metadata(&self) -> io::Result<FileAttr> {
+@@ -769,7 +782,7 @@ pub fn metadata(&self) -> io::Result<FileAttr> {
+     }
+ 
+     #[cfg(any(
+-        not(any(target_os = "linux", target_os = "emscripten", target_os = "android")),
++        not(any(not(target_env = "musl"), target_os = "emscripten", target_os = "android")),
+         miri
+     ))]
+     pub fn metadata(&self) -> io::Result<FileAttr> {
+-- 
+2.39.0
+
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index f94d616d26..643494b37e 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -2,8 +2,13 @@ RUST_VERSION ?= "${@d.getVar('PV').split('-')[0]}"
 SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;name=rust"
 SRC_URI[rust.sha256sum] = "0dc176e34fae9871f855a6ba4cb30fa19d69c5b4428d29281a07419c4950715c"
 
+SRC_URI:append:class-target:pn-libstd-rs = "\
+    file://0001-Do-not-use-LFS64-on-linux-with-musl.patch;patchdir=../.. \
+"
+
 SRC_URI:append:class-target:pn-rust = " \
     file://getrandom-open64.patch \
+    file://0001-Do-not-use-LFS64-on-linux-with-musl.patch \
     file://hardcodepaths.patch \
     file://crossbeam_atomic.patch"
 SRC_URI:append:class-nativesdk:pn-nativesdk-rust = " file://hardcodepaths.patch"
-- 
2.39.0


