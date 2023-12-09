Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A355C4167B
	for <webhook@archiver.kernel.org>; Sat,  9 Dec 2023 12:18:54 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.8393.1702124328801609010
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Dec 2023 04:18:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=UTIfKeEY;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 290B61C0002;
	Sat,  9 Dec 2023 12:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702124326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7Ho4BHHlGFAdGVeQxPsP+w0JHrtbpLxCMJdNLCC01XE=;
	b=UTIfKeEYi+bRiInw0BIYZjtp1Pj5rsGswIEV5LcbAxoAx9CZQw1oE26apk0HjiiljJ7/9g
	0IDXDkIU8sWupl7v770pvJEnDFWMY/YlSsV3Zlg+HU25hSoqJK7P1csv1qKoH9FbFiRpJx
	myT2xrRN9EWVB68W+JXVNxqyyc+ni1pqA+tIWbM3P00BS/d4j2vl2a7sLYzP5J9LsxKjaB
	ESfKonnzwJJVY9Sk4RBQdXF8GNTLdmp4Ok/B2VoW40jr2ipv/knQqvFsn10pL23YxfUPZP
	reNEQhJ6pnHz3LfLWAkqlOtyiLznysHxt4QMLJB70p3wSzusXqwPOXyssTB23Q==
Date: Sat, 9 Dec 2023 13:18:45 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-Core][PATCH 7/7] rust: Upgrade 1.73.0 -> 1.74.0
Message-ID: <20231209121845ed0bfb0d@mail.local>
References: <20231208140349.3576-1-alex.kiernan@gmail.com>
 <20231208140349.3576-7-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231208140349.3576-7-alex.kiernan@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 Dec 2023 12:18:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192101

Hello Alex,

rust 1.74.0 is not reproducible:
https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20231208-rfbpro=
j4/packages/diff-html/

I believe it also causes:
https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/6161/step=
s/14/logs/stdio

On 08/12/2023 14:03:49+0000, Alex Kiernan wrote:
> Replace musl fixes with backports from upstream.
>=20
> Add sysconfdir to config.toml to fix:
>=20
> | thread 'main' panicked at install.rs:92:9:
> | User doesn't have write access on `install.sysconfdir` path in `config.=
toml`.
>=20
> https://blog.rust-lang.org/2023/11/16/Rust-1.74.0.html
>=20
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
>=20
>  meta/conf/distro/include/tcmode-default.inc   |   2 +-
>  .../rust/{cargo_1.73.0.bb =3D> cargo_1.74.0.bb} |   0
>  ...-Do-not-use-LFS64-on-linux-with-musl.patch | 169 ---------------
>  ...0001-Don-t-use-LFS64-symbols-on-musl.patch | 163 ++++++++++++++
>  ...Define-SOCK_NONBLOCK-with-O_NONBLOCK.patch | 122 +++++++++++
>  ...efine-SOCK_SEQPACKET-in-common-place.patch | 115 ----------
>  ...ine-F_SETLK-F_SETLKW-and-fix-F_GETLK.patch |  41 ++++
>  ...GETLK-F_OFD_SETLK-and-F_OFD_SETLKW-t.patch | 205 ++++++++++++++++++
>  ...-musl-Define-O_LARGEFILE-for-riscv32.patch |  32 +++
>  ...efine-SOCK_SEQPACKET-in-common-place.patch | 115 ++++++++++
>  .../rust/files/hardcodepaths.patch            |  16 +-
>  ...ibstd-rs_1.73.0.bb =3D> libstd-rs_1.74.0.bb} |   0
>  ....73.0.bb =3D> rust-cross-canadian_1.74.0.bb} |   0
>  ...ust-llvm_1.73.0.bb =3D> rust-llvm_1.74.0.bb} |   0
>  meta/recipes-devtools/rust/rust-snapshot.inc  |  60 ++---
>  meta/recipes-devtools/rust/rust-source.inc    |  10 +-
>  .../rust/{rust_1.73.0.bb =3D> rust_1.74.0.bb}   |   1 +
>  17 files changed, 725 insertions(+), 326 deletions(-)
>  rename meta/recipes-devtools/rust/{cargo_1.73.0.bb =3D> cargo_1.74.0.bb}=
 (100%)
>  delete mode 100644 meta/recipes-devtools/rust/files/0001-Do-not-use-LFS6=
4-on-linux-with-musl.patch
>  create mode 100644 meta/recipes-devtools/rust/files/0001-Don-t-use-LFS64=
-symbols-on-musl.patch
>  create mode 100644 meta/recipes-devtools/rust/files/0001-musl-Define-SOC=
K_NONBLOCK-with-O_NONBLOCK.patch
>  delete mode 100644 meta/recipes-devtools/rust/files/0001-musl-Define-SOC=
K_SEQPACKET-in-common-place.patch
>  create mode 100644 meta/recipes-devtools/rust/files/0002-musl-riscv32-De=
fine-F_SETLK-F_SETLKW-and-fix-F_GETLK.patch
>  create mode 100644 meta/recipes-devtools/rust/files/0003-musl-Move-F_OFD=
_GETLK-F_OFD_SETLK-and-F_OFD_SETLKW-t.patch
>  create mode 100644 meta/recipes-devtools/rust/files/0004-musl-Define-O_L=
ARGEFILE-for-riscv32.patch
>  create mode 100644 meta/recipes-devtools/rust/files/0005-musl-Define-SOC=
K_SEQPACKET-in-common-place.patch
>  rename meta/recipes-devtools/rust/{libstd-rs_1.73.0.bb =3D> libstd-rs_1.=
74.0.bb} (100%)
>  rename meta/recipes-devtools/rust/{rust-cross-canadian_1.73.0.bb =3D> ru=
st-cross-canadian_1.74.0.bb} (100%)
>  rename meta/recipes-devtools/rust/{rust-llvm_1.73.0.bb =3D> rust-llvm_1.=
74.0.bb} (100%)
>  rename meta/recipes-devtools/rust/{rust_1.73.0.bb =3D> rust_1.74.0.bb} (=
99%)
>=20
> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/dist=
ro/include/tcmode-default.inc
> index 4219a9b56823..07e5f4a8d812 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -25,7 +25,7 @@ LINUXLIBCVERSION ?=3D "6.5%"
>  QEMUVERSION ?=3D "8.1%"
>  GOVERSION ?=3D "1.20%"
>  LLVMVERSION ?=3D "17.%"
> -RUSTVERSION ?=3D "1.73%"
> +RUSTVERSION ?=3D "1.74%"
> =20
>  PREFERRED_VERSION_gcc ?=3D "${GCCVERSION}"
>  PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?=3D "${GCCVERSION}"
> diff --git a/meta/recipes-devtools/rust/cargo_1.73.0.bb b/meta/recipes-de=
vtools/rust/cargo_1.74.0.bb
> similarity index 100%
> rename from meta/recipes-devtools/rust/cargo_1.73.0.bb
> rename to meta/recipes-devtools/rust/cargo_1.74.0.bb
> diff --git a/meta/recipes-devtools/rust/files/0001-Do-not-use-LFS64-on-li=
nux-with-musl.patch b/meta/recipes-devtools/rust/files/0001-Do-not-use-LFS6=
4-on-linux-with-musl.patch
> deleted file mode 100644
> index 794ad804f0dc..000000000000
> --- a/meta/recipes-devtools/rust/files/0001-Do-not-use-LFS64-on-linux-wit=
h-musl.patch
> +++ /dev/null
> @@ -1,169 +0,0 @@
> -From 3ecce665198e3420d70139d86ed22e74804c9379 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Wed, 28 Dec 2022 22:35:55 -0800
> -Subject: [PATCH] Do not use LFS64 on linux with musl
> -
> -glibc is providing open64 and other lfs64 functions but musl aliases
> -them to normal equivalents since off_t is always 64-bit on musl,
> -therefore check for target env along when target OS is linux before
> -using open64, this is more available. Latest Musl has made these
> -namespace changes [1]
> -
> -[1] https://git.musl-libc.org/cgit/musl/commit/?id=3D246f1c811448f37a44b=
41cd8df8d0ef9736d95f4
> -
> -Upstream-Status: Submitted [https://github.com/rust-lang/rust/pull/10624=
6]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - library/std/src/os/linux/fs.rs |  9 ++++++++-
> - library/std/src/sys/unix/fd.rs | 14 ++++++++++----
> - library/std/src/sys/unix/fs.rs | 27 ++++++++++++++++++++-------
> - 3 files changed, 38 insertions(+), 12 deletions(-)
> -
> -Index: rustc-1.73.0-src/library/std/src/os/linux/fs.rs
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- rustc-1.73.0-src.orig/library/std/src/os/linux/fs.rs
> -+++ rustc-1.73.0-src/library/std/src/os/linux/fs.rs
> -@@ -329,7 +329,14 @@ pub trait MetadataExt {
> - impl MetadataExt for Metadata {
> -     #[allow(deprecated)]
> -     fn as_raw_stat(&self) -> &raw::stat {
> --        unsafe { &*(self.as_inner().as_inner() as *const libc::stat64 a=
s *const raw::stat) }
> -+        #[cfg(target_env =3D "musl")]
> -+        unsafe {
> -+            &*(self.as_inner().as_inner() as *const libc::stat as *cons=
t raw::stat)
> -+        }
> -+        #[cfg(not(target_env =3D "musl"))]
> -+        unsafe {
> -+            &*(self.as_inner().as_inner() as *const libc::stat64 as *co=
nst raw::stat)
> -+        }
> -     }
> -     fn st_dev(&self) -> u64 {
> -         self.as_inner().as_inner().st_dev as u64
> -Index: rustc-1.73.0-src/library/std/src/sys/unix/fd.rs
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- rustc-1.73.0-src.orig/library/std/src/sys/unix/fd.rs
> -+++ rustc-1.73.0-src/library/std/src/sys/unix/fd.rs
> -@@ -124,9 +124,12 @@ impl FileDesc {
> -     }
> -=20
> -     pub fn read_at(&self, buf: &mut [u8], offset: u64) -> io::Result<us=
ize> {
> --        #[cfg(not(any(target_os =3D "linux", target_os =3D "android")))]
> -+        #[cfg(not(any(
> -+            all(target_os =3D "linux", not(target_env =3D "musl")),
> -+            target_os =3D "android"
> -+        )))]
> -         use libc::pread as pread64;
> --        #[cfg(any(target_os =3D "linux", target_os =3D "android"))]
> -+        #[cfg(any(all(target_os =3D "linux", not(target_env =3D "musl")=
), target_os =3D "android"))]
> -         use libc::pread64;
> -=20
> -         unsafe {
> -@@ -281,9 +284,12 @@ impl FileDesc {
> -     }
> -=20
> -     pub fn write_at(&self, buf: &[u8], offset: u64) -> io::Result<usize=
> {
> --        #[cfg(not(any(target_os =3D "linux", target_os =3D "android")))]
> -+        #[cfg(not(any(
> -+            all(target_os =3D "linux", not(target_env =3D "musl")),
> -+            target_os =3D "android"
> -+        )))]
> -         use libc::pwrite as pwrite64;
> --        #[cfg(any(target_os =3D "linux", target_os =3D "android"))]
> -+        #[cfg(any(all(target_os =3D "linux", not(target_env =3D "musl")=
), target_os =3D "android"))]
> -         use libc::pwrite64;
> -=20
> -         unsafe {
> -Index: rustc-1.73.0-src/library/std/src/sys/unix/fs.rs
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- rustc-1.73.0-src.orig/library/std/src/sys/unix/fs.rs
> -+++ rustc-1.73.0-src/library/std/src/sys/unix/fs.rs
> -@@ -39,9 +39,13 @@ use libc::{c_int, mode_t};
> -     all(target_os =3D "linux", target_env =3D "gnu")
> - ))]
> - use libc::c_char;
> --#[cfg(any(target_os =3D "linux", target_os =3D "emscripten", target_os =
=3D "android"))]
> -+#[cfg(any(
> -+    all(target_os =3D "linux", not(target_env =3D "musl")),
> -+    target_os =3D "emscripten",
> -+    target_os =3D "android"
> -+))]
> - use libc::dirfd;
> --#[cfg(any(target_os =3D "linux", target_os =3D "emscripten"))]
> -+#[cfg(any(not(target_env =3D "musl"), target_os =3D "emscripten"))]
> - use libc::fstatat64;
> - #[cfg(any(
> -     target_os =3D "android",
> -@@ -53,7 +57,7 @@ use libc::fstatat64;
> -     target_os =3D "vita",
> - ))]
> - use libc::readdir as readdir64;
> --#[cfg(target_os =3D "linux")]
> -+#[cfg(all(target_os =3D "linux", not(target_env =3D "musl")))]
> - use libc::readdir64;
> - #[cfg(any(target_os =3D "emscripten", target_os =3D "l4re"))]
> - use libc::readdir64_r;
> -@@ -68,6 +72,7 @@ use libc::readdir64_r;
> -     target_os =3D "redox",
> -     target_os =3D "nto",
> -     target_os =3D "vita",
> -+    target_env =3D "musl",
> - )))]
> - use libc::readdir_r as readdir64_r;
> - #[cfg(target_os =3D "android")]
> -@@ -75,7 +80,13 @@ use libc::{
> -     dirent as dirent64, fstat as fstat64, fstatat as fstatat64, ftrunca=
te64, lseek64,
> -     lstat as lstat64, off64_t, open as open64, stat as stat64,
> - };
> -+#[cfg(target_env =3D "musl")]
> -+use libc::{
> -+    dirent as dirent64, fstat as fstat64, ftruncate as ftruncate64, lse=
ek as lseek64,
> -+    lstat as lstat64, off_t as off64_t, open as open64, stat as stat64,
> -+};
> - #[cfg(not(any(
> -+    target_env =3D "musl",
> -     target_os =3D "linux",
> -     target_os =3D "emscripten",
> -     target_os =3D "l4re",
> -@@ -85,7 +96,7 @@ use libc::{
> -     dirent as dirent64, fstat as fstat64, ftruncate as ftruncate64, lse=
ek as lseek64,
> -     lstat as lstat64, off_t as off64_t, open as open64, stat as stat64,
> - };
> --#[cfg(any(target_os =3D "linux", target_os =3D "emscripten", target_os =
=3D "l4re"))]
> -+#[cfg(any(not(target_env =3D "musl"), target_os =3D "emscripten", targe=
t_os =3D "l4re"))]
> - use libc::{dirent64, fstat64, ftruncate64, lseek64, lstat64, off64_t, o=
pen64, stat64};
> -=20
> - pub use crate::sys_common::fs::try_exists;
> -@@ -272,6 +283,7 @@ unsafe impl Sync for Dir {}
> - #[cfg(any(
> -     target_os =3D "android",
> -     target_os =3D "linux",
> -+    not(target_env =3D "musl"),
> -     target_os =3D "solaris",
> -     target_os =3D "illumos",
> -     target_os =3D "fuchsia",
> -@@ -313,6 +325,7 @@ struct dirent64_min {
> - }
> -=20
> - #[cfg(not(any(
> -+    target_env =3D "musl",
> -     target_os =3D "android",
> -     target_os =3D "linux",
> -     target_os =3D "solaris",
> -@@ -809,7 +822,7 @@ impl DirEntry {
> -     }
> -=20
> -     #[cfg(all(
> --        any(target_os =3D "linux", target_os =3D "emscripten", target_o=
s =3D "android"),
> -+        any(not(target_env =3D "musl"), target_os =3D "emscripten", tar=
get_os =3D "android"),
> -         not(miri)
> -     ))]
> -     pub fn metadata(&self) -> io::Result<FileAttr> {
> -@@ -833,7 +846,7 @@ impl DirEntry {
> -     }
> -=20
> -     #[cfg(any(
> --        not(any(target_os =3D "linux", target_os =3D "emscripten", targ=
et_os =3D "android")),
> -+        not(any(not(target_env =3D "musl"), target_os =3D "emscripten",=
 target_os =3D "android")),
> -         miri
> -     ))]
> -     pub fn metadata(&self) -> io::Result<FileAttr> {
> diff --git a/meta/recipes-devtools/rust/files/0001-Don-t-use-LFS64-symbol=
s-on-musl.patch b/meta/recipes-devtools/rust/files/0001-Don-t-use-LFS64-sym=
bols-on-musl.patch
> new file mode 100644
> index 000000000000..ddad684e578a
> --- /dev/null
> +++ b/meta/recipes-devtools/rust/files/0001-Don-t-use-LFS64-symbols-on-mu=
sl.patch
> @@ -0,0 +1,163 @@
> +From df423041e070dc30b835ecfea7181914e834e33d Mon Sep 17 00:00:00 2001
> +From: git-bruh <e817509a-8ee9-4332-b0ad-3a6bdf9ab63f@aleeas.com>
> +Date: Tue, 19 Sep 2023 19:47:50 +0530
> +Subject: [PATCH] Don't use LFS64 symbols on musl
> +
> +Simplify #[cfg] blocks
> +
> +fmt
> +
> +don't try to use the more appropriate direntry on musl
> +
> +Upstream-Status: Backport [https://github.com/rust-lang/rust/pull/115968=
/commits/7a504cc68a56bfaa7855016c81ced9e6b1320fc5]
> +Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> +---
> + library/std/src/os/linux/fs.rs |  9 ++++++++-
> + library/std/src/sys/unix/fd.rs | 24 ++++++++++++++++++++----
> + library/std/src/sys/unix/fs.rs | 23 ++++++++++++++---------
> + 3 files changed, 42 insertions(+), 14 deletions(-)
> +
> +diff --git a/library/std/src/os/linux/fs.rs b/library/std/src/os/linux/f=
s.rs
> +index 479bbcc17a89..ab0b2a3eda3f 100644
> +--- a/library/std/src/os/linux/fs.rs
> ++++ b/library/std/src/os/linux/fs.rs
> +@@ -329,7 +329,14 @@ pub trait MetadataExt {
> + impl MetadataExt for Metadata {
> +     #[allow(deprecated)]
> +     fn as_raw_stat(&self) -> &raw::stat {
> +-        unsafe { &*(self.as_inner().as_inner() as *const libc::stat64 a=
s *const raw::stat) }
> ++        #[cfg(target_env =3D "musl")]
> ++        unsafe {
> ++            &*(self.as_inner().as_inner() as *const libc::stat as *cons=
t raw::stat)
> ++        }
> ++        #[cfg(not(target_env =3D "musl"))]
> ++        unsafe {
> ++            &*(self.as_inner().as_inner() as *const libc::stat64 as *co=
nst raw::stat)
> ++        }
> +     }
> +     fn st_dev(&self) -> u64 {
> +         self.as_inner().as_inner().st_dev as u64
> +diff --git a/library/std/src/sys/unix/fd.rs b/library/std/src/sys/unix/f=
d.rs
> +index 6c4f408426a9..bf1fb3123c4c 100644
> +--- a/library/std/src/sys/unix/fd.rs
> ++++ b/library/std/src/sys/unix/fd.rs
> +@@ -126,9 +126,17 @@ pub fn read_to_end(&self, buf: &mut Vec<u8>) -> io:=
:Result<usize> {
> +     }
> +=20
> +     pub fn read_at(&self, buf: &mut [u8], offset: u64) -> io::Result<us=
ize> {
> +-        #[cfg(not(any(target_os =3D "linux", target_os =3D "android", t=
arget_os =3D "hurd")))]
> ++        #[cfg(not(any(
> ++            all(target_os =3D "linux", not(target_env =3D "musl")),
> ++            target_os =3D "android",
> ++            target_os =3D "hurd"
> ++        )))]
> +         use libc::pread as pread64;
> +-        #[cfg(any(target_os =3D "linux", target_os =3D "android", targe=
t_os =3D "hurd"))]
> ++        #[cfg(any(
> ++            all(target_os =3D "linux", not(target_env =3D "musl")),
> ++            target_os =3D "android",
> ++            target_os =3D "hurd"
> ++        ))]
> +         use libc::pread64;
> +=20
> +         unsafe {
> +@@ -285,9 +293,17 @@ pub fn is_write_vectored(&self) -> bool {
> +     }
> +=20
> +     pub fn write_at(&self, buf: &[u8], offset: u64) -> io::Result<usize=
> {
> +-        #[cfg(not(any(target_os =3D "linux", target_os =3D "android", t=
arget_os =3D "hurd")))]
> ++        #[cfg(not(any(
> ++            all(target_os =3D "linux", not(target_env =3D "musl")),
> ++            target_os =3D "android",
> ++            target_os =3D "hurd"
> ++        )))]
> +         use libc::pwrite as pwrite64;
> +-        #[cfg(any(target_os =3D "linux", target_os =3D "android", targe=
t_os =3D "hurd"))]
> ++        #[cfg(any(
> ++            all(target_os =3D "linux", not(target_env =3D "musl")),
> ++            target_os =3D "android",
> ++            target_os =3D "hurd"
> ++        ))]
> +         use libc::pwrite64;
> +=20
> +         unsafe {
> +diff --git a/library/std/src/sys/unix/fs.rs b/library/std/src/sys/unix/f=
s.rs
> +index 764e1f257901..b61554098531 100644
> +--- a/library/std/src/sys/unix/fs.rs
> ++++ b/library/std/src/sys/unix/fs.rs
> +@@ -40,13 +40,17 @@
> + ))]
> + use libc::c_char;
> + #[cfg(any(
> +-    target_os =3D "linux",
> ++    all(target_os =3D "linux", not(target_env =3D "musl")),
> +     target_os =3D "emscripten",
> +     target_os =3D "android",
> +-    target_os =3D "hurd",
> ++    target_os =3D "hurd"
> + ))]
> + use libc::dirfd;
> +-#[cfg(any(target_os =3D "linux", target_os =3D "emscripten", target_os =
=3D "hurd"))]
> ++#[cfg(any(
> ++    all(target_os =3D "linux", not(target_env =3D "musl")),
> ++    target_os =3D "emscripten",
> ++    target_os =3D "hurd"
> ++))]
> + use libc::fstatat64;
> + #[cfg(any(
> +     target_os =3D "android",
> +@@ -56,9 +60,10 @@
> +     target_os =3D "illumos",
> +     target_os =3D "nto",
> +     target_os =3D "vita",
> ++    all(target_os =3D "linux", target_env =3D "musl"),
> + ))]
> + use libc::readdir as readdir64;
> +-#[cfg(any(target_os =3D "linux", target_os =3D "hurd"))]
> ++#[cfg(any(all(target_os =3D "linux", not(target_env =3D "musl")), targe=
t_os =3D "hurd"))]
> + use libc::readdir64;
> + #[cfg(any(target_os =3D "emscripten", target_os =3D "l4re"))]
> + use libc::readdir64_r;
> +@@ -82,7 +87,7 @@
> +     lstat as lstat64, off64_t, open as open64, stat as stat64,
> + };
> + #[cfg(not(any(
> +-    target_os =3D "linux",
> ++    all(target_os =3D "linux", not(target_env =3D "musl")),
> +     target_os =3D "emscripten",
> +     target_os =3D "l4re",
> +     target_os =3D "android",
> +@@ -93,7 +98,7 @@
> +     lstat as lstat64, off_t as off64_t, open as open64, stat as stat64,
> + };
> + #[cfg(any(
> +-    target_os =3D "linux",
> ++    all(target_os =3D "linux", not(target_env =3D "musl")),
> +     target_os =3D "emscripten",
> +     target_os =3D "l4re",
> +     target_os =3D "hurd"
> +@@ -829,10 +834,10 @@ pub fn file_name(&self) -> OsString {
> +=20
> +     #[cfg(all(
> +         any(
> +-            target_os =3D "linux",
> ++            all(target_os =3D "linux", not(target_env =3D "musl")),
> +             target_os =3D "emscripten",
> +             target_os =3D "android",
> +-            target_os =3D "hurd",
> ++            target_os =3D "hurd"
> +         ),
> +         not(miri)
> +     ))]
> +@@ -858,7 +863,7 @@ pub fn metadata(&self) -> io::Result<FileAttr> {
> +=20
> +     #[cfg(any(
> +         not(any(
> +-            target_os =3D "linux",
> ++            all(target_os =3D "linux", not(target_env =3D "musl")),
> +             target_os =3D "emscripten",
> +             target_os =3D "android",
> +             target_os =3D "hurd",
> +--=20
> +2.39.0
> +
> diff --git a/meta/recipes-devtools/rust/files/0001-musl-Define-SOCK_NONBL=
OCK-with-O_NONBLOCK.patch b/meta/recipes-devtools/rust/files/0001-musl-Defi=
ne-SOCK_NONBLOCK-with-O_NONBLOCK.patch
> new file mode 100644
> index 000000000000..a50f5ef464db
> --- /dev/null
> +++ b/meta/recipes-devtools/rust/files/0001-musl-Define-SOCK_NONBLOCK-wit=
h-O_NONBLOCK.patch
> @@ -0,0 +1,122 @@
> +From 5ab4734092ccb875d8cd1eb3c7ba7228f559c8c1 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sat, 8 Apr 2023 08:25:46 -0700
> +Subject: [PATCH 1/5] musl: Define SOCK_NONBLOCK with O_NONBLOCK
> +
> +Much like glibc, these defines are same on musl [1] [2]
> +therefore consolidate the definition in one place
> +for SOCK_NONBLOCK
> +
> +[1] https://github.com/search?q=3Drepo%3Abminor%2Fmusl++%22%23define+SOC=
K_NONBLOCK%22&type=3Dcode
> +[2] https://github.com/search?q=3Drepo%3Abminor%2Fmusl++%22%23define+O_N=
ONBLOCK%22&type=3Dcode
> +
> +Upstream-Status: Backport [https://github.com/rust-lang/libc/pull/3302/c=
ommits/5ab4734092ccb875d8cd1eb3c7ba7228f559c8c1]
> +Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> +---
> + src/unix/linux_like/linux/musl/b32/arm/mod.rs  | 2 --
> + src/unix/linux_like/linux/musl/b32/hexagon.rs  | 1 -
> + src/unix/linux_like/linux/musl/b32/mips/mod.rs | 2 --
> + src/unix/linux_like/linux/musl/b32/powerpc.rs  | 2 --
> + src/unix/linux_like/linux/musl/b32/x86/mod.rs  | 2 --
> + src/unix/linux_like/linux/musl/b64/mod.rs      | 2 --
> + src/unix/linux_like/linux/musl/mod.rs          | 1 +
> + 7 files changed, 1 insertion(+), 11 deletions(-)
> +
> +Index: rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/a=
rm/mod.rs
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- rustc-1.74.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b32=
/arm/mod.rs
> ++++ rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/arm/=
mod.rs
> +@@ -311,8 +311,6 @@ pub const O_SYNC: ::c_int =3D 1052672;
> + pub const O_RSYNC: ::c_int =3D 1052672;
> + pub const O_DSYNC: ::c_int =3D 4096;
> +=20
> +-pub const SOCK_NONBLOCK: ::c_int =3D 2048;
> +-
> + pub const MAP_ANON: ::c_int =3D 0x0020;
> + pub const MAP_GROWSDOWN: ::c_int =3D 0x0100;
> + pub const MAP_DENYWRITE: ::c_int =3D 0x0800;
> +Index: rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/h=
exagon.rs
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- rustc-1.74.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b32=
/hexagon.rs
> ++++ rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/hexa=
gon.rs
> +@@ -295,7 +295,6 @@ pub const SIG_SETMASK: ::c_int =3D 2; // F
> + pub const SIG_BLOCK: ::c_int =3D 0x000000;
> + pub const SIG_UNBLOCK: ::c_int =3D 0x01;
> + pub const SOCK_DGRAM: ::c_int =3D 2;
> +-pub const SOCK_NONBLOCK: ::c_int =3D 2048;
> + pub const SOCK_SEQPACKET: ::c_int =3D 5;
> + pub const SOCK_STREAM: ::c_int =3D 1;
> + pub const SOL_CAIF: ::c_int =3D 278;
> +Index: rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/m=
ips/mod.rs
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- rustc-1.74.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b32=
/mips/mod.rs
> ++++ rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/mips=
/mod.rs
> +@@ -250,8 +250,6 @@ pub const O_SYNC: ::c_int =3D 0o40020;
> + pub const O_RSYNC: ::c_int =3D 0o40020;
> + pub const O_DSYNC: ::c_int =3D 0o020;
> +=20
> +-pub const SOCK_NONBLOCK: ::c_int =3D 0o200;
> +-
> + pub const MAP_ANON: ::c_int =3D 0x800;
> + pub const MAP_GROWSDOWN: ::c_int =3D 0x1000;
> + pub const MAP_DENYWRITE: ::c_int =3D 0x2000;
> +Index: rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/p=
owerpc.rs
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- rustc-1.74.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b32=
/powerpc.rs
> ++++ rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/powe=
rpc.rs
> +@@ -243,8 +243,6 @@ pub const O_SYNC: ::c_int =3D 1052672;
> + pub const O_RSYNC: ::c_int =3D 1052672;
> + pub const O_DSYNC: ::c_int =3D 4096;
> +=20
> +-pub const SOCK_NONBLOCK: ::c_int =3D 2048;
> +-
> + pub const MAP_ANON: ::c_int =3D 0x0020;
> + pub const MAP_GROWSDOWN: ::c_int =3D 0x0100;
> + pub const MAP_DENYWRITE: ::c_int =3D 0x0800;
> +Index: rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/x=
86/mod.rs
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- rustc-1.74.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b32=
/x86/mod.rs
> ++++ rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/x86/=
mod.rs
> +@@ -300,8 +300,6 @@ pub const O_SYNC: ::c_int =3D 1052672;
> + pub const O_RSYNC: ::c_int =3D 1052672;
> + pub const O_DSYNC: ::c_int =3D 4096;
> +=20
> +-pub const SOCK_NONBLOCK: ::c_int =3D 2048;
> +-
> + pub const MAP_ANON: ::c_int =3D 0x0020;
> + pub const MAP_GROWSDOWN: ::c_int =3D 0x0100;
> + pub const MAP_DENYWRITE: ::c_int =3D 0x0800;
> +Index: rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b64/m=
od.rs
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- rustc-1.74.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b64=
/mod.rs
> ++++ rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b64/mod.=
rs
> +@@ -134,8 +134,6 @@ pub const __SIZEOF_PTHREAD_RWLOCK_T: usi
> + pub const __SIZEOF_PTHREAD_MUTEX_T: usize =3D 40;
> + pub const __SIZEOF_PTHREAD_BARRIER_T: usize =3D 32;
> +=20
> +-pub const SOCK_NONBLOCK: ::c_int =3D 2048;
> +-
> + pub const SOCK_SEQPACKET: ::c_int =3D 5;
> +=20
> + extern "C" {
> +Index: rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/mod.rs
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- rustc-1.74.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/mod=
=2Ers
> ++++ rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/mod.rs
> +@@ -542,6 +542,7 @@ pub const POSIX_MADV_DONTNEED: ::c_int =3D
> + pub const MAP_ANONYMOUS: ::c_int =3D MAP_ANON;
> +=20
> + pub const SOCK_DCCP: ::c_int =3D 6;
> ++pub const SOCK_NONBLOCK: ::c_int =3D O_NONBLOCK;
> + pub const SOCK_PACKET: ::c_int =3D 10;
> +=20
> + pub const SOMAXCONN: ::c_int =3D 128;
> +Index: rustc-1.74.0-src/vendor/libc/.cargo-checksum.json
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- rustc-1.74.0-src.orig/vendor/libc/.cargo-checksum.json
> ++++ rustc-1.74.0-src/vendor/libc/.cargo-checksum.json
> +@@ -1 +1 @@
> +-{"files":{"CONTRIBUTING.md":"bdc90b52cf803faac96e594069a86dd8ea150d5ba7=
fb3e6cadfc08dac4c7b0ce","Cargo.toml":"a58e58fa9bde015e08609ea2f17e56c5df7c8=
2aa6f3fa1a144c02ee4715227b9","LICENSE-APACHE":"62c7a1e35f56406896d7aa7ca52d=
0cc0d272ac022b5d2796e7d6905db8a3636a","LICENSE-MIT":"a8d47ff51ca256f56a8932=
dba07660672dbfe3004257ca8de708aac1415937a1","README.md":"ecc47e284f8d007fc0=
48666d5108dd41cdc440ab9eedfe8c47d1634613522787","build.rs":"9e94683e94db80e=
8282fce07549cf748d9037852fb06df1c7596bea2ed130d50","rustfmt.toml":"eaa2ea84=
fc1ba0359b77680804903e07bb38d257ab11986b95b158e460f787b2","src/fixed_width_=
ints.rs":"7f986e5f5e68d25ef04d386fd2f640e8be8f15427a8d4a458ea01d26b8dca0ca"=
,"src/fuchsia/aarch64.rs":"893fcec48142d273063ffd814dca33fbec92205fd39ada97=
075f85201d803996","src/fuchsia/align.rs":"ae1cf8f011a99737eabeb14ffff768e60=
f13b13363d7646744dbb0f443dab3d6","src/fuchsia/mod.rs":"30f4dc83ef120300d618=
96696512436377c5f36f1431d98ab7e01e498c0c47d5","src/fuchsia/no_align.rs":"30=
3f3f1b255e0088b5715094353cf00476131d8e94e6aebb3f469557771c8b8a","src/fuchsi=
a/riscv64.rs":"617cd75e79e0e20f664db764a4dc2a396d9fd11a4d95371acd91ed481129=
3b11","src/fuchsia/x86_64.rs":"93a3632b5cf67d2a6bcb7dc0a558605252d5fe689e0f=
38d8aa2ec5852255ac87","src/hermit/aarch64.rs":"86048676e335944c37a63d0083d0=
f368ae10ceccefeed9debb3bbe08777fc682","src/hermit/mod.rs":"d3bfce41e4463d4b=
e8020a2d063c9bfa8b665f45f1cc6cbf3163f5d01e7cb21f","src/hermit/x86_64.rs":"a=
b832b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/lib.r=
s":"24111461547739f3646f95bcb66c43f2ae679a727ff5938299434c522c02e458","src/=
macros.rs":"b457eb028b8e8ab3c24bb7292b874ad4e491edbb83594f6a3da024df5348c08=
8","src/psp.rs":"dd31aabd46171d474ec5828372e28588935120e7355c90c105360d8fa9=
264c1c","src/sgx.rs":"16a95cdefc81c5ee00d8353a60db363c4cc3e0f75abcd5d014472=
3f2a306ed1b","src/solid/aarch64.rs":"a726e47f324adf73a4a0b67a2c183408d0cad1=
05ae66acf36db37a42ab7f8707","src/solid/arm.rs":"e39a4f74ebbef3b97b8c95758ad=
741123d84ed3eb48d9cf4f1f4872097fc27fe","src/solid/mod.rs":"5f4151dca5132e4b=
4e4c23ab9737e12856dddbdc0ca3f7dbc004328ef3c8acde","src/switch.rs":"9da3dd39=
b3de45a7928789926e8572d00e1e11a39e6f7289a1349aadce90edba","src/unix/aix/mod=
=2Ers":"54229b5e774669c16912112e8b50fa938db76f534971222a11723a05195a0948","=
src/unix/aix/powerpc64.rs":"cf374d81139d45f9d77c6a764f640bfbf7e0a5903689652=
c8296f8e10d55169b","src/unix/align.rs":"2cdc7c826ef7ae61f5171c5ae8c445a743d=
86f1a7f2d9d7e4ceeec56d6874f65","src/unix/bsd/apple/b32/align.rs":"ec833a747=
866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/appl=
e/b32/mod.rs":"2546ad3eb6aecb95f916648bc63264117c92b4b4859532b34cb011e4c75a=
5a72","src/unix/bsd/apple/b64/aarch64/align.rs":"2eaf0f561a32bdcbf4e0477c88=
95d5e7bcb5cdebd5fef7b4df2ca8e38e144d94","src/unix/bsd/apple/b64/aarch64/mod=
=2Ers":"44c217a4f263afe7a97435de9323d20a96c37836f899ca0925306d4b7e073c27","=
src/unix/bsd/apple/b64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf=
4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b64/mod.rs":"f5e278a1af7fb3588=
91d1c9be4eb7e815aaca0c5cb738d0c3604ba2208a856f7","src/unix/bsd/apple/b64/x8=
6_64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b=
0e26c","src/unix/bsd/apple/b64/x86_64/mod.rs":"8c87c5855038aae5d433c8f5eb3b=
29b0a175879a0245342b3bfd83bdf4cfd936","src/unix/bsd/apple/long_array.rs":"3=
cf1f19b812e6d093c819dc65ce55b13491963e0780eda0d0bd1577603e81948","src/unix/=
bsd/apple/mod.rs":"0931fd351d585728e6384d7b952b8d816e9acdb9c86c172324445f3c=
33f692ca","src/unix/bsd/freebsdlike/dragonfly/errno.rs":"8295b8bb0dfd38d2cd=
b4d9192cdeeb534cc6c3b208170e64615fa3e0edb3e578","src/unix/bsd/freebsdlike/d=
ragonfly/mod.rs":"f2e78625fe1eb14f43e730a3987eba888cb8ac04c23008e7c2d2f7c72=
258b9e6","src/unix/bsd/freebsdlike/freebsd/aarch64.rs":"6c8e216385f53a4bf5f=
171749b57602fc34a4e4b160a44ca31c058cb0c8a2126","src/unix/bsd/freebsdlike/fr=
eebsd/arm.rs":"59d6a670eea562fb87686e243e0a84603d29a2028a3d4b3f99ccc01bd04d=
2f47","src/unix/bsd/freebsdlike/freebsd/freebsd11/b64.rs":"9808d152c1196aa6=
47f1b0f0cf84dac8c930da7d7f897a44975545e3d9d17681","src/unix/bsd/freebsdlike=
/freebsd/freebsd11/mod.rs":"e243ae0e89623d4fa9f85afe14369cc5fd5f2028ea71577=
3dbec722ba80dac1f","src/unix/bsd/freebsdlike/freebsd/freebsd12/b64.rs":"61c=
be45f8499bedb168106b686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bs=
d/freebsdlike/freebsd/freebsd12/mod.rs":"bef9fae288a4f29e941ea369be1cd20b17=
0040e60665a4d49a4a9e79009b72d8","src/unix/bsd/freebsdlike/freebsd/freebsd12=
/x86_64.rs":"2df36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd0=
52","src/unix/bsd/freebsdlike/freebsd/freebsd13/b64.rs":"61cbe45f8499bedb16=
8106b686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/f=
reebsd/freebsd13/mod.rs":"3c514e037694ce22724abb3c9c4687defda7f0e3456b615ca=
73593e860e38b16","src/unix/bsd/freebsdlike/freebsd/freebsd13/x86_64.rs":"2d=
f36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/b=
sd/freebsdlike/freebsd/freebsd14/b64.rs":"61cbe45f8499bedb168106b686d4f8239=
472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd1=
4/mod.rs":"318abe48bfdd1c74ecd6afbd6c9329c5c72ce4f7d420edd6be2fc12b223ae32f=
","src/unix/bsd/freebsdlike/freebsd/freebsd14/x86_64.rs":"e7b5863e222d6cc41=
6b6b0fbe71690fad909e899b4c4ae810bbca117e4fcb650","src/unix/bsd/freebsdlike/=
freebsd/mod.rs":"4c3cd57aaf7fbce072e28e0d2d285b5fda9702e924561d2fd01e49e6ee=
186a98","src/unix/bsd/freebsdlike/freebsd/powerpc.rs":"9ca3f82f88974e6db556=
9f2d76a5a3749b248a31747a6c0da5820492bdfeca42","src/unix/bsd/freebsdlike/fre=
ebsd/powerpc64.rs":"2dae3ecc87eac3b11657aa98915def55fc4b5c0de11fe26aae23329=
a54628a9a","src/unix/bsd/freebsdlike/freebsd/riscv64.rs":"fa4bed4c58cad24ba=
3395941c7fa6b11e089551a04714f9561078e400f5b2b62","src/unix/bsd/freebsdlike/=
freebsd/x86.rs":"6766e2ce85e187b306cd3b0b8d7e15b8f4042c5cff81d89b3af69ecc99=
c70ab0","src/unix/bsd/freebsdlike/freebsd/x86_64/align.rs":"0e1f69a88fca1c3=
2874b1daf5db3d446fefbe518dca497f096cc9168c39dde70","src/unix/bsd/freebsdlik=
e/freebsd/x86_64/mod.rs":"51e4dd0c8ae247bb652feda5adad9333ea3bb30c750c3a393=
5e0b0e47d7803eb","src/unix/bsd/freebsdlike/mod.rs":"0eacafac87fb3a32ef1b859=
80fece2792e70eba9856af18a7407cc35be68ea57","src/unix/bsd/mod.rs":"dad51a24a=
524e92bfe9de3ac3b7d394d86058b9b8a1ccd4efa9bbb5c78e7fa1a","src/unix/bsd/netb=
sdlike/mod.rs":"0a66f7de43710e35a6a546e6c39066aa8b91a6efadb71db88738b0a577f=
d5537","src/unix/bsd/netbsdlike/netbsd/aarch64.rs":"65dcb58d11e8d8028401a9d=
07ca3eb4cb4f053e04249cc877353449d84ccc4cb","src/unix/bsd/netbsdlike/netbsd/=
arm.rs":"58cdbb70b0d6f536551f0f3bb3725d2d75c4690db12c26c034e7d6ec4a924452",=
"src/unix/bsd/netbsdlike/netbsd/mod.rs":"90dd33ef20dc3be8aef5bd152a6a06e7ab=
34f9527b3978487b593aaa16a907bd","src/unix/bsd/netbsdlike/netbsd/powerpc.rs"=
:"ee7ff5d89d0ed22f531237b5059aa669df93a3b5c489fa641465ace8d405bf41","src/un=
ix/bsd/netbsdlike/netbsd/sparc64.rs":"9489f4b3e4566f43bb12dfb92238960613dac=
7f6a45cc13068a8d152b902d7d9","src/unix/bsd/netbsdlike/netbsd/x86.rs":"20692=
320e36bfe028d1a34d16fe12ca77aa909cb02bda167376f98f1a09aefe7","src/unix/bsd/=
netbsdlike/netbsd/x86_64.rs":"1afe5ef46b14397cdd68664b5b232e4f5b035b6db1d4c=
f411c899d51ebca9f30","src/unix/bsd/netbsdlike/openbsd/aarch64.rs":"dd91931d=
373b7ecaf6e2de25adadee10d16fa9b12c2cbacdff3eb291e1ba36af","src/unix/bsd/net=
bsdlike/openbsd/arm.rs":"01580d261bc6447bb327a0d982181b7bdabfa066cee65a3037=
3d3ced729ad307","src/unix/bsd/netbsdlike/openbsd/mips64.rs":"8532a189ae10c7=
d668d9d4065da8b05d124e09bd39442c9f74a7f231c43eca48","src/unix/bsd/netbsdlik=
e/openbsd/mod.rs":"c27c6673bd3628549083a094219831fd9343129f91067b562781617d=
2a887148","src/unix/bsd/netbsdlike/openbsd/powerpc.rs":"01580d261bc6447bb32=
7a0d982181b7bdabfa066cee65a30373d3ced729ad307","src/unix/bsd/netbsdlike/ope=
nbsd/powerpc64.rs":"1dd5449dd1fd3d51e30ffdeeaece91d0aaf05c710e0ac699fecc546=
1cfa2c28e","src/unix/bsd/netbsdlike/openbsd/riscv64.rs":"1dd5449dd1fd3d51e3=
0ffdeeaece91d0aaf05c710e0ac699fecc5461cfa2c28e","src/unix/bsd/netbsdlike/op=
enbsd/sparc64.rs":"d04fd287afbaa2c5df9d48c94e8374a532a3ba491b424ddf018270c7=
312f4085","src/unix/bsd/netbsdlike/openbsd/x86.rs":"6f7f5c4fde2a2259eb54789=
0cbd86570cea04ef85347d7569e94e679448bec87","src/unix/bsd/netbsdlike/openbsd=
/x86_64.rs":"d31db31630289c85af3339dbe357998a21ca584cbae31607448fe2cf7675a4=
e1","src/unix/haiku/b32.rs":"a2efdbf7158a6da341e1db9176b0ab193ba88b44961623=
9ed95dced11f54d87b","src/unix/haiku/b64.rs":"ff8115367d3d7d354f792d6176dfaa=
a26353f57056197b563bf4681f91ff7985","src/unix/haiku/mod.rs":"d7ec086b73db4f=
72799179627aa6330a513dcf786b06e19c75ff884d1235948e","src/unix/haiku/native.=
rs":"dbfcbf4954a79d1df2ff58e0590bbcb8c57dfc7a32392aa73ee4726b66bd6cc8","src=
/unix/haiku/x86_64.rs":"3ec3aeeb7ed208b8916f3e32d42bfd085ff5e16936a1a35d9a5=
2789f043b7237","src/unix/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f3=
68ae10ceccefeed9debb3bbe08777fc682","src/unix/hermit/mod.rs":"a1494a0bddf30=
1cceb0d9b8529a84b5882fe855ceae77a1c4e8d6034e705e26c","src/unix/hermit/x86_6=
4.rs":"ab832b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","s=
rc/unix/linux_like/android/b32/arm.rs":"ce582de7e983a33d3bfad13075c53aac901=
6cee35f06ad8653ee9072c3ec2564","src/unix/linux_like/android/b32/mod.rs":"7c=
173e0375119bf06a3081652faede95e5bcd6858e7576b7533d037978737c8f","src/unix/l=
inux_like/android/b32/x86/align.rs":"812914e4241df82e32b12375ca3374615dc3a4=
bdd4cf31f0423c5815320c0dab","src/unix/linux_like/android/b32/x86/mod.rs":"e=
6d107efbcd37b5b85dfa18f683300cbf768ffa0237997a9fa52b184a53323ac","src/unix/=
linux_like/android/b64/aarch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3=
ee2faf6fcae3770f9e505cddca35c7b","src/unix/linux_like/android/b64/aarch64/i=
nt128.rs":"1735f6f5c56770d20dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de=
","src/unix/linux_like/android/b64/aarch64/mod.rs":"10e963e29ff209703de6336=
c99cca96fd79789438d34c82a693eae56e8916c3c","src/unix/linux_like/android/b64=
/mod.rs":"71e4fcbe952bfa4a5f9022f3972e906917b38f729b9d8ef57cd5d179104894ac"=
,"src/unix/linux_like/android/b64/riscv64/align.rs":"0bf138f84e5327d8339bcd=
4adf071a6832b516445e597552c82bbd881095e3a8","src/unix/linux_like/android/b6=
4/riscv64/mod.rs":"19d4bf2237c47127eba9144e0b82e995bc079315e719179a91813b0a=
e7b0e49d","src/unix/linux_like/android/b64/x86_64/align.rs":"7169d07a9fd471=
6f7512719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/an=
droid/b64/x86_64/mod.rs":"4ec2de11a9b65c4325b7b991f0b99a414975e0e61ba8668ca=
ca5d921e9b314d1","src/unix/linux_like/android/mod.rs":"66a9e38a47493a42b3b1=
c325524f3c944e74d1e3e8ecce3cc276ec08fecab13b","src/unix/linux_like/emscript=
en/align.rs":"86c95cbed7a7161b1f23ee06843e7b0e2340ad92b2cb86fe2a8ef3e0e8c36=
216","src/unix/linux_like/emscripten/mod.rs":"67d6b90f539f746aa3290ea7f9d3f=
3f8d2d8a6557233584004ed5697f7821a50","src/unix/linux_like/emscripten/no_ali=
gn.rs":"0128e4aa721a9902754828b61b5ec7d8a86619983ed1e0544a85d35b1051fad6","=
src/unix/linux_like/linux/align.rs":"bc5abcd38e2320171e0981e773c9c5fe3e0d5a=
66fdff049228f6a1acad80ef8b","src/unix/linux_like/linux/arch/generic/mod.rs"=
:"fb5de1368cabae03d3ea0152159b7685a9d91efdecee4c5b83efc085ffef8a73","src/un=
ix/linux_like/linux/arch/mips/mod.rs":"75814e198d1a9a6808be3a5e5edb1bfdc57f=
75b06394e9040739be363c09d82f","src/unix/linux_like/linux/arch/mod.rs":"5bd5=
361f8a6ab4e18bbba6da9f92c164ae252b15a0ed10064812544aa1fdf198","src/unix/lin=
ux_like/linux/arch/powerpc/mod.rs":"bef6b7af9e5e2b4e5545c9c7e3e23a8b743277a=
0ed95853e7eddc38e44299f02","src/unix/linux_like/linux/arch/sparc/mod.rs":"9=
1593ec0440f1dd8f8e612028f432c44c14089286e2aca50e10511ab942db8c3","src/unix/=
linux_like/linux/gnu/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec72=
51957315afa53a7b9f936","src/unix/linux_like/linux/gnu/b32/arm/align.rs":"6e=
c0eb3ee93f7ae99fd714b4deabfb5e97fbcefd8c26f5a45fb8e7150899cdeb","src/unix/l=
inux_like/linux/gnu/b32/arm/mod.rs":"9ab3e97b579a9122690cd01026e14528862860=
346b700aafbb755a7e04054f7f","src/unix/linux_like/linux/gnu/b32/csky/align.r=
s":"3fed009dc9af3cc81be7087da9d2d7d1f39845e4497e290259c5cdbae25f039d","src/=
unix/linux_like/linux/gnu/b32/csky/mod.rs":"4c21d6e7463bb22f00b984294893d12=
c84018d5d26ec661d6a30f4a9625ba639","src/unix/linux_like/linux/gnu/b32/m68k/=
align.rs":"8faa92f77a9232c035418d45331774e64a9a841d99c91791570a203bf2b45bcb=
","src/unix/linux_like/linux/gnu/b32/m68k/mod.rs":"6aab7f1b864e9691d14aa7d3=
89f717c4077b8eed72a7f11e3b8c7fef245e4046","src/unix/linux_like/linux/gnu/b3=
2/mips/align.rs":"429fb5e005cb7143602d430098b6ebfb7d360685b194f333dfd587472=
ae954ee","src/unix/linux_like/linux/gnu/b32/mips/mod.rs":"6b9a5dac6f937ddc1=
453e808e3c43502c87143332df9e43ac64fb8b1eda6c116","src/unix/linux_like/linux=
/gnu/b32/mod.rs":"b56625dd20dd48a8699034d349ef089c540c0ddcbf8a3481d598d101f=
8b40b78","src/unix/linux_like/linux/gnu/b32/powerpc.rs":"5c5d90326b54b57b98=
eff4745fe7a3fb02f053b2dc782241a73e807b491936a3","src/unix/linux_like/linux/=
gnu/b32/riscv32/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd3=
7543efe86621b119","src/unix/linux_like/linux/gnu/b32/riscv32/mod.rs":"491a9=
a97cf712985b75d3ad714691ef60898d88c78bc386a6917de0a6774cc26","src/unix/linu=
x_like/linux/gnu/b32/sparc/align.rs":"21adbed27df73e2d1ed934aaf733a643003d7=
baf2bde9c48ea440895bcca6d41","src/unix/linux_like/linux/gnu/b32/sparc/mod.r=
s":"80894eece66e9348f45d1b07ad37c757ea694bbd10ed49d3f920b34e9f51a9a3","src/=
unix/linux_like/linux/gnu/b32/x86/align.rs":"e4bafdc4a519a7922a81b37a62bbfd=
1177a2f620890eef8f1fbc47162e9eb413","src/unix/linux_like/linux/gnu/b32/x86/=
mod.rs":"c703cc5e9de2dc31d9e5831bfb6f354d6e3518b2ae02263f68a9a70f1c0167e2",=
"src/unix/linux_like/linux/gnu/b64/aarch64/align.rs":"fdf1c72375a2167699157=
e0dd825422690bb6719f7bc69515a2e5846d0431d7c","src/unix/linux_like/linux/gnu=
/b64/aarch64/fallback.rs":"832e7487249c1c0bb6e9911ce3f7d32ca22378e42392ab83=
c56915cbc59d8be3","src/unix/linux_like/linux/gnu/b64/aarch64/ilp32.rs":"bf4=
611b737813deef6787babf6c01698605f3b75482269b8546318667bc68e29","src/unix/li=
nux_like/linux/gnu/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426442f09724d=
9b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/gnu/b64/aarch6=
4/lp64.rs":"11a950697fdda0258c6e37c6b13993348c8de4134105ed4faa79358e5317507=
2","src/unix/linux_like/linux/gnu/b64/aarch64/mod.rs":"172495fbfdf659b9b825=
148bffc2b62704f63fc872428617e868eb15802c9978","src/unix/linux_like/linux/gn=
u/b64/loongarch64/align.rs":"060aa33cc737966c691aab8511c5c5729e551458ce18d0=
e284e0d45f39beeb60","src/unix/linux_like/linux/gnu/b64/loongarch64/mod.rs":=
"18edada8aa5d4127d9aa1bd81c62b5a4209f1efd8b2b2631e801c9e855ab1480","src/uni=
x/linux_like/linux/gnu/b64/mips64/align.rs":"7169d07a9fd4716f7512719aec9fda=
5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/linux/gnu/b64/mips=
64/mod.rs":"628c410b9aaec3c8f43838a28616b577a1d6de60a9799b09bb884d80281f96e=
b","src/unix/linux_like/linux/gnu/b64/mod.rs":"6a160ef25439c4fecdb0e3bd0b81=
8742263c791364da874d4febd3aa644ec8e2","src/unix/linux_like/linux/gnu/b64/po=
werpc64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1=
268130d9","src/unix/linux_like/linux/gnu/b64/powerpc64/mod.rs":"c778a136f06=
c2ffeacea19fa14ce79b828f91b67a002dec5ce87289bae36234e","src/unix/linux_like=
/linux/gnu/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e5880=
3f99cd37543efe86621b119","src/unix/linux_like/linux/gnu/b64/riscv64/mod.rs"=
:"c8f07efc5ddd5d874f1ebc329cd6907818d132ac3e30f4f2a4b04be3fb388551","src/un=
ix/linux_like/linux/gnu/b64/s390x.rs":"a2fd9277c2dcf76f7a16a3bcca745d5a9932=
c765c0dc2feb31c3641be25eb0aa","src/unix/linux_like/linux/gnu/b64/sparc64/al=
ign.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268130d9",=
"src/unix/linux_like/linux/gnu/b64/sparc64/mod.rs":"e8047e9966a2b90063e0151=
a0278c54885e7b323286cf5ab55cbaf151fc772d3","src/unix/linux_like/linux/gnu/b=
64/x86_64/align.rs":"62e822478356db4a73b6bbd1b36d825b893939ab4b308ec11b0578=
bcc4b49769","src/unix/linux_like/linux/gnu/b64/x86_64/mod.rs":"891e595d3371=
4b9883b92f0554d1d361fba2b6c3f6cac09a288252f44c6ec667","src/unix/linux_like/=
linux/gnu/b64/x86_64/not_x32.rs":"38f74ce15d9662ce4818815a2b87be1618d5e45f1=
90f7e4db84ff3285b4421fb","src/unix/linux_like/linux/gnu/b64/x86_64/x32.rs":=
"b20218a11364a6dec87f96d6c0d8b19e660697ab09ad5ee0e9b3a9dafedaaebb","src/uni=
x/linux_like/linux/gnu/mod.rs":"47dd970aedda9c70429741d7c9892a0d5d264e9abcb=
1c41d5bb913a86f0a5362","src/unix/linux_like/linux/gnu/no_align.rs":"9cd2231=
35de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/linux_=
like/linux/mod.rs":"1582c09db7b752af0f796a4cba8aa2bb4ecea895c551a2219e76047=
bcce74a23","src/unix/linux_like/linux/musl/b32/arm/align.rs":"3e8ac052c1043=
764776b54c93ba4260e061df998631737a897d9d47d54f7b80c","src/unix/linux_like/l=
inux/musl/b32/arm/mod.rs":"f5b217a93f99c2852f7fd1459f529798372fa7df84ee0cfd=
3d8cdd5b2021b8cf","src/unix/linux_like/linux/musl/b32/hexagon.rs":"226a8b64=
ce9c75abbbee6d2dceb0b44f7b6c750c4102ebd4d015194afee6666e","src/unix/linux_l=
ike/linux/musl/b32/mips/align.rs":"429fb5e005cb7143602d430098b6ebfb7d360685=
b194f333dfd587472ae954ee","src/unix/linux_like/linux/musl/b32/mips/mod.rs":=
"16f614dd59695497a01b542deacd1669335678bdd0b14d16dde482fb5c4e02f4","src/uni=
x/linux_like/linux/musl/b32/mod.rs":"31677597fd9544c4b1ec1477628288f6273fab=
bc06e38f33da862ad55f019ce1","src/unix/linux_like/linux/musl/b32/powerpc.rs"=
:"ebf73f570b11512adc4a7b513aedff02a55125ead167fe5dbd45c39afb87cddb","src/un=
ix/linux_like/linux/musl/b32/riscv32/align.rs":"efd2accf33b87de7c7547903359=
a5da896edc33cd6c719552c7474b60d4a5d48","src/unix/linux_like/linux/musl/b32/=
riscv32/mod.rs":"7b067c7989a80e35daa9987af799d97dd1fb3df71ef82285137f51fbad=
2354d9","src/unix/linux_like/linux/musl/b32/x86/align.rs":"08e77fbd7435d7de=
c2ff56932433bece3f02e47ce810f89004a275a86d39cbe1","src/unix/linux_like/linu=
x/musl/b32/x86/mod.rs":"de632ac323bd2bb4f83d4826d6eb7e29d4b0e6293aa0c4cb9c9=
9ef0fcabc71b7","src/unix/linux_like/linux/musl/b64/aarch64/align.rs":"6ba32=
725d24d7d8e6aa111f3b57aafa318f83b606abe96561329151829821133","src/unix/linu=
x_like/linux/musl/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426442f09724d9=
b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/musl/b64/aarch6=
4/mod.rs":"31e75179cbb4e26425b3f5b052e358f593153da662884655e60801d852e55dc2=
","src/unix/linux_like/linux/musl/b64/mips64.rs":"9a5d29f666332bb056d0e2951=
e9de989aa1dc016075f009db3f2f628e0cdda8c","src/unix/linux_like/linux/musl/b6=
4/mod.rs":"884243eb5af7df963d858d5baf47e622b45f04e0ae701728b134e986191b614b=
","src/unix/linux_like/linux/musl/b64/powerpc64.rs":"e77f4cf5d65320023043e4=
354725397f6b079c1b7b6b3cef2c3293350b46b303","src/unix/linux_like/linux/musl=
/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd3754=
3efe86621b119","src/unix/linux_like/linux/musl/b64/riscv64/mod.rs":"a80b181=
3148dec8bc396c02638978c0b4e5e040edafd56d98f8683fe2ae51ab5","src/unix/linux_=
like/linux/musl/b64/s390x.rs":"80a92e54e47016d051c7bd55bee9580cbedd29816419=
9d71a67d49167e744432","src/unix/linux_like/linux/musl/b64/x86_64/align.rs":=
"77309276ad7a42cbe59ca381f23590b7a143aded05555b34a5b307b808cbca6e","src/uni=
x/linux_like/linux/musl/b64/x86_64/mod.rs":"032863c74d3ca73cb75483218f9bd77=
4ae1ae7d3646d2ffb21e4cc7d4b5e0e3d","src/unix/linux_like/linux/musl/lfs64.rs=
":"3e4fb381f3a0756520bde0f1692d4fa45e4ae8133bf7d7c64b0e3fdd512f235f","src/u=
nix/linux_like/linux/musl/mod.rs":"f79e4d7bef14f422c6a77f1573ff503a82305bfa=
5ac3e4c6f571c09212b75620","src/unix/linux_like/linux/no_align.rs":"62cdca0e=
011937aaf09a51ca86d9f0ee0fdb05f61ec3c058e6a5d5fa6357d784","src/unix/linux_l=
ike/linux/non_exhaustive.rs":"181a05bf94fdb911db83ce793b993bd6548a4115b306a=
7ef3c10f745a8fea3e9","src/unix/linux_like/linux/uclibc/align.rs":"9ed16138d=
8e439bd90930845a65eafa7ebd67366e6bf633936d44014f6e4c959","src/unix/linux_li=
ke/linux/uclibc/arm/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec725=
1957315afa53a7b9f936","src/unix/linux_like/linux/uclibc/arm/mod.rs":"50288f=
f9e411ab0966da24838f2c2a5618021bc19c422a04f577b2979ef4081e","src/unix/linux=
_like/linux/uclibc/arm/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632=
b96b5c85a76f8316c86653db25","src/unix/linux_like/linux/uclibc/mips/mips32/a=
lign.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936"=
,"src/unix/linux_like/linux/uclibc/mips/mips32/mod.rs":"d0c4434e2bf813372c4=
18a8f516c706cdccc9f7be2f0921b2207b0afdb66fe81","src/unix/linux_like/linux/u=
clibc/mips/mips32/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5=
c85a76f8316c86653db25","src/unix/linux_like/linux/uclibc/mips/mips64/align.=
rs":"a7bdcb18a37a2d91e64d5fad83ea3edc78f5412adb28f77ab077dbb26dd08b2d","src=
/unix/linux_like/linux/uclibc/mips/mips64/mod.rs":"3f38ee6a4690b9d7594be20d=
216467a34d955f7653c2c8ce1e6147daeb53f1e0","src/unix/linux_like/linux/uclibc=
/mips/mips64/no_align.rs":"4a18e3875698c85229599225ac3401a2a40da87e77b2ad4e=
f47c6fcd5a24ed30","src/unix/linux_like/linux/uclibc/mips/mod.rs":"a048fce1c=
2d9b1ad57305642e8ad05ca0f0c7e4753267a2e2d6b4fee5db3b072","src/unix/linux_li=
ke/linux/uclibc/mod.rs":"1c3d25cddcfefa2bd17bdc81550826be31a08eef235e13f825=
f169a5029c8bca","src/unix/linux_like/linux/uclibc/no_align.rs":"3f286370465=
24618adaa1012e26cb7ffe94b9396e6b518cccdc69d59f274d709","src/unix/linux_like=
/linux/uclibc/x86_64/l4re.rs":"024eba5753e852dbdd212427351affe7e83f9916c186=
4bce414d7aa2618f192e","src/unix/linux_like/linux/uclibc/x86_64/mod.rs":"196=
d03affbefb85716937c15904831e731eb222ee906e05e42102d639a8152ea","src/unix/li=
nux_like/linux/uclibc/x86_64/other.rs":"42c3f71e58cabba373f6a55a623f3c31b85=
049eb64824c09c2b082b3b2d6a0a8","src/unix/linux_like/mod.rs":"45c98e7a0fad03=
b03c4c76f11a80e2423873f0a6563e35c60309a29b2c8ff44f","src/unix/mod.rs":"dd4c=
e377ba9517182e718848739a5c3f58cdbbcd4ee467eef9aaf8df5aed5053","src/unix/new=
lib/aarch64/mod.rs":"bac93836a9a57b2c710f32f852e92a4d11ad6759ab0fb6ad33e71d=
60e53278af","src/unix/newlib/align.rs":"28aaf87fafbc6b312622719d472d8cf65f9=
e5467d15339df5f73e66d8502b28a","src/unix/newlib/arm/mod.rs":"cbba6b3e957ece=
b496806e60de8725a23ff3fa0015983b4b4fa27b233732b526","src/unix/newlib/espidf=
/mod.rs":"816f235f4aa4baabba7f2606b31d0fdb03988c52194c966728de8690bf17299d"=
,"src/unix/newlib/generic.rs":"eab066d9f0a0f3eb53cc1073d01496bba0110989e1f6=
a59838afd19f870cd599","src/unix/newlib/horizon/mod.rs":"7cc5cc120437421db13=
9bfa6a90b18168cd3070bdd0f5be96d40fe4c996f3ca1","src/unix/newlib/mod.rs":"9e=
36de3fd78e10cb6b9a59dc5ebe5a1b44a63ccb91433bb33653fb30d0c303c6","src/unix/n=
ewlib/no_align.rs":"e0743b2179495a9514bc3a4d1781e492878c4ec834ee0085d0891dd=
1712e82fb","src/unix/newlib/powerpc/mod.rs":"0202ffd57caf75b6afa2c9717750ff=
b96e375ac33df0ae9609a3f831be393b67","src/unix/newlib/vita/mod.rs":"68e0ce18=
6b44e0b3031eb824710e7454dc2a9df98db98120840c3c6f4d885871","src/unix/no_alig=
n.rs":"c06e95373b9088266e0b14bba0954eef95f93fb2b01d951855e382d22de78e53","s=
rc/unix/nto/aarch64.rs":"4709c9afdc8d583be876598e7c238499ee3e8da5bd2baa614d=
9c7dd414851555","src/unix/nto/mod.rs":"59ab89a8fb6e0a6d22fa968ed4873c2bafa1=
9a0f60a90c9a5148816cb7440889","src/unix/nto/neutrino.rs":"799bff4ab01a6424d=
b6c5a2b76aa5679826d41495f9d13c63485bf13bc80026b","src/unix/nto/x86_64.rs":"=
a3e18e93c2999da1cd7a6f748a4b60c07aefb73d8ea2aafec19a84cfb040bc8e","src/unix=
/redox/mod.rs":"73658b0d28c82a122875aa2b45c489834f4de58c378add7932bbaf3ffb2=
ae789","src/unix/solarish/compat.rs":"00f1ee3faec9da69204e42f025f6735dd13d8=
94071a154425dcc43ecbdd06e7f","src/unix/solarish/illumos.rs":"cd93c2d84722bb=
f9933a92842a8998eb0b2afc962f50bc2546ad127b82809fa7","src/unix/solarish/mod.=
rs":"b1660c631a599a3355116e7485b88ab2f8f2929c2e37851a763431387b902f14","src=
/unix/solarish/solaris.rs":"41b350a89ddf01cd12a10f93640f92be53be0b0d976021c=
dc08da17bf3e72edf","src/unix/solarish/x86.rs":"e86e806df0caed72765040eaa2f3=
c883198d1aa91508540adf9b7008c77f522e","src/unix/solarish/x86_64.rs":"ec2b01=
f194eb8a6a27133c57681da195a949e03098f3ea1e847227a9c09ef5fc","src/unix/solar=
ish/x86_common.rs":"ac869d9c3c95645c22460468391eb1982023c3a8e02b9e06a72e3ae=
f3d5f1eac","src/vxworks/aarch64.rs":"98f0afdc511cd02557e506c21fed6737585490=
a1dce7a9d4941d08c437762b99","src/vxworks/arm.rs":"acb7968ce99fe3f4abdf39d98=
f8133d21a4fba435b8ef7084777cb181d788e88","src/vxworks/mod.rs":"e4edcbcf43a3=
25e738c9465507594d0c87abf3f0e2b9b046c1425f8d44bdad0f","src/vxworks/powerpc.=
rs":"acb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788e88","src=
/vxworks/powerpc64.rs":"98f0afdc511cd02557e506c21fed6737585490a1dce7a9d4941=
d08c437762b99","src/vxworks/x86.rs":"552f007f38317620b23889cb7c49d1d1158412=
52439060122f52f434fbc6e5ba","src/vxworks/x86_64.rs":"018d92be3ad628a129eff9=
f2f5dfbc0883d8b8e5f2fa917b900a7f98ed6b514a","src/wasi.rs":"09ee3b3348b212b0=
50f6ca8ae008a28679ea44a375674307a4e7c9ca0d3ed7d5","src/windows/gnu/align.rs=
":"b2c13ec1b9f3b39a75c452c80c951dff9d0215e31d77e883b4502afb31794647","src/w=
indows/gnu/mod.rs":"3c8c7edb7cdf5d0c44af936db2a94869585c69dfabeef30571b4f4e=
38375767a","src/windows/mod.rs":"9fdc5e1c62c441abef7bc62a7343efb2041edc24db=
9ac0efc0f74df55b69e249","src/windows/msvc/mod.rs":"c068271e00fca6b62bc4bf44=
bcf142cfc38caeded9b6c4e01d1ceef3ccf986f4","src/xous.rs":"eb0675f25ba01f7307=
2d2b70907fb8abb1148facefe5a20756c49250f3d65fae","tests/const_fn.rs":"cb75a1=
f0864f926aebe79118fc34d51a0d1ade2c20a394e7774c7e545f21f1f4"},"package":"9cd=
c71e17332e86d2e1d38c1f99edcb6288ee11b815fb1a4b049eaa2114d369b"}
> +\ No newline at end of file
> ++{"files":{"CONTRIBUTING.md":"bdc90b52cf803faac96e594069a86dd8ea150d5ba7=
fb3e6cadfc08dac4c7b0ce","Cargo.toml":"a58e58fa9bde015e08609ea2f17e56c5df7c8=
2aa6f3fa1a144c02ee4715227b9","LICENSE-APACHE":"62c7a1e35f56406896d7aa7ca52d=
0cc0d272ac022b5d2796e7d6905db8a3636a","LICENSE-MIT":"a8d47ff51ca256f56a8932=
dba07660672dbfe3004257ca8de708aac1415937a1","README.md":"ecc47e284f8d007fc0=
48666d5108dd41cdc440ab9eedfe8c47d1634613522787","build.rs":"9e94683e94db80e=
8282fce07549cf748d9037852fb06df1c7596bea2ed130d50","rustfmt.toml":"eaa2ea84=
fc1ba0359b77680804903e07bb38d257ab11986b95b158e460f787b2","src/fixed_width_=
ints.rs":"7f986e5f5e68d25ef04d386fd2f640e8be8f15427a8d4a458ea01d26b8dca0ca"=
,"src/fuchsia/aarch64.rs":"893fcec48142d273063ffd814dca33fbec92205fd39ada97=
075f85201d803996","src/fuchsia/align.rs":"ae1cf8f011a99737eabeb14ffff768e60=
f13b13363d7646744dbb0f443dab3d6","src/fuchsia/mod.rs":"30f4dc83ef120300d618=
96696512436377c5f36f1431d98ab7e01e498c0c47d5","src/fuchsia/no_align.rs":"30=
3f3f1b255e0088b5715094353cf00476131d8e94e6aebb3f469557771c8b8a","src/fuchsi=
a/riscv64.rs":"617cd75e79e0e20f664db764a4dc2a396d9fd11a4d95371acd91ed481129=
3b11","src/fuchsia/x86_64.rs":"93a3632b5cf67d2a6bcb7dc0a558605252d5fe689e0f=
38d8aa2ec5852255ac87","src/hermit/aarch64.rs":"86048676e335944c37a63d0083d0=
f368ae10ceccefeed9debb3bbe08777fc682","src/hermit/mod.rs":"d3bfce41e4463d4b=
e8020a2d063c9bfa8b665f45f1cc6cbf3163f5d01e7cb21f","src/hermit/x86_64.rs":"a=
b832b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/lib.r=
s":"24111461547739f3646f95bcb66c43f2ae679a727ff5938299434c522c02e458","src/=
macros.rs":"b457eb028b8e8ab3c24bb7292b874ad4e491edbb83594f6a3da024df5348c08=
8","src/psp.rs":"dd31aabd46171d474ec5828372e28588935120e7355c90c105360d8fa9=
264c1c","src/sgx.rs":"16a95cdefc81c5ee00d8353a60db363c4cc3e0f75abcd5d014472=
3f2a306ed1b","src/solid/aarch64.rs":"a726e47f324adf73a4a0b67a2c183408d0cad1=
05ae66acf36db37a42ab7f8707","src/solid/arm.rs":"e39a4f74ebbef3b97b8c95758ad=
741123d84ed3eb48d9cf4f1f4872097fc27fe","src/solid/mod.rs":"5f4151dca5132e4b=
4e4c23ab9737e12856dddbdc0ca3f7dbc004328ef3c8acde","src/switch.rs":"9da3dd39=
b3de45a7928789926e8572d00e1e11a39e6f7289a1349aadce90edba","src/unix/aix/mod=
=2Ers":"54229b5e774669c16912112e8b50fa938db76f534971222a11723a05195a0948","=
src/unix/aix/powerpc64.rs":"cf374d81139d45f9d77c6a764f640bfbf7e0a5903689652=
c8296f8e10d55169b","src/unix/align.rs":"2cdc7c826ef7ae61f5171c5ae8c445a743d=
86f1a7f2d9d7e4ceeec56d6874f65","src/unix/bsd/apple/b32/align.rs":"ec833a747=
866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/appl=
e/b32/mod.rs":"2546ad3eb6aecb95f916648bc63264117c92b4b4859532b34cb011e4c75a=
5a72","src/unix/bsd/apple/b64/aarch64/align.rs":"2eaf0f561a32bdcbf4e0477c88=
95d5e7bcb5cdebd5fef7b4df2ca8e38e144d94","src/unix/bsd/apple/b64/aarch64/mod=
=2Ers":"44c217a4f263afe7a97435de9323d20a96c37836f899ca0925306d4b7e073c27","=
src/unix/bsd/apple/b64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf=
4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b64/mod.rs":"f5e278a1af7fb3588=
91d1c9be4eb7e815aaca0c5cb738d0c3604ba2208a856f7","src/unix/bsd/apple/b64/x8=
6_64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b=
0e26c","src/unix/bsd/apple/b64/x86_64/mod.rs":"8c87c5855038aae5d433c8f5eb3b=
29b0a175879a0245342b3bfd83bdf4cfd936","src/unix/bsd/apple/long_array.rs":"3=
cf1f19b812e6d093c819dc65ce55b13491963e0780eda0d0bd1577603e81948","src/unix/=
bsd/apple/mod.rs":"0931fd351d585728e6384d7b952b8d816e9acdb9c86c172324445f3c=
33f692ca","src/unix/bsd/freebsdlike/dragonfly/errno.rs":"8295b8bb0dfd38d2cd=
b4d9192cdeeb534cc6c3b208170e64615fa3e0edb3e578","src/unix/bsd/freebsdlike/d=
ragonfly/mod.rs":"f2e78625fe1eb14f43e730a3987eba888cb8ac04c23008e7c2d2f7c72=
258b9e6","src/unix/bsd/freebsdlike/freebsd/aarch64.rs":"6c8e216385f53a4bf5f=
171749b57602fc34a4e4b160a44ca31c058cb0c8a2126","src/unix/bsd/freebsdlike/fr=
eebsd/arm.rs":"59d6a670eea562fb87686e243e0a84603d29a2028a3d4b3f99ccc01bd04d=
2f47","src/unix/bsd/freebsdlike/freebsd/freebsd11/b64.rs":"9808d152c1196aa6=
47f1b0f0cf84dac8c930da7d7f897a44975545e3d9d17681","src/unix/bsd/freebsdlike=
/freebsd/freebsd11/mod.rs":"e243ae0e89623d4fa9f85afe14369cc5fd5f2028ea71577=
3dbec722ba80dac1f","src/unix/bsd/freebsdlike/freebsd/freebsd12/b64.rs":"61c=
be45f8499bedb168106b686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bs=
d/freebsdlike/freebsd/freebsd12/mod.rs":"bef9fae288a4f29e941ea369be1cd20b17=
0040e60665a4d49a4a9e79009b72d8","src/unix/bsd/freebsdlike/freebsd/freebsd12=
/x86_64.rs":"2df36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd0=
52","src/unix/bsd/freebsdlike/freebsd/freebsd13/b64.rs":"61cbe45f8499bedb16=
8106b686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/f=
reebsd/freebsd13/mod.rs":"3c514e037694ce22724abb3c9c4687defda7f0e3456b615ca=
73593e860e38b16","src/unix/bsd/freebsdlike/freebsd/freebsd13/x86_64.rs":"2d=
f36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/b=
sd/freebsdlike/freebsd/freebsd14/b64.rs":"61cbe45f8499bedb168106b686d4f8239=
472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd1=
4/mod.rs":"318abe48bfdd1c74ecd6afbd6c9329c5c72ce4f7d420edd6be2fc12b223ae32f=
","src/unix/bsd/freebsdlike/freebsd/freebsd14/x86_64.rs":"e7b5863e222d6cc41=
6b6b0fbe71690fad909e899b4c4ae810bbca117e4fcb650","src/unix/bsd/freebsdlike/=
freebsd/mod.rs":"4c3cd57aaf7fbce072e28e0d2d285b5fda9702e924561d2fd01e49e6ee=
186a98","src/unix/bsd/freebsdlike/freebsd/powerpc.rs":"9ca3f82f88974e6db556=
9f2d76a5a3749b248a31747a6c0da5820492bdfeca42","src/unix/bsd/freebsdlike/fre=
ebsd/powerpc64.rs":"2dae3ecc87eac3b11657aa98915def55fc4b5c0de11fe26aae23329=
a54628a9a","src/unix/bsd/freebsdlike/freebsd/riscv64.rs":"fa4bed4c58cad24ba=
3395941c7fa6b11e089551a04714f9561078e400f5b2b62","src/unix/bsd/freebsdlike/=
freebsd/x86.rs":"6766e2ce85e187b306cd3b0b8d7e15b8f4042c5cff81d89b3af69ecc99=
c70ab0","src/unix/bsd/freebsdlike/freebsd/x86_64/align.rs":"0e1f69a88fca1c3=
2874b1daf5db3d446fefbe518dca497f096cc9168c39dde70","src/unix/bsd/freebsdlik=
e/freebsd/x86_64/mod.rs":"51e4dd0c8ae247bb652feda5adad9333ea3bb30c750c3a393=
5e0b0e47d7803eb","src/unix/bsd/freebsdlike/mod.rs":"0eacafac87fb3a32ef1b859=
80fece2792e70eba9856af18a7407cc35be68ea57","src/unix/bsd/mod.rs":"dad51a24a=
524e92bfe9de3ac3b7d394d86058b9b8a1ccd4efa9bbb5c78e7fa1a","src/unix/bsd/netb=
sdlike/mod.rs":"0a66f7de43710e35a6a546e6c39066aa8b91a6efadb71db88738b0a577f=
d5537","src/unix/bsd/netbsdlike/netbsd/aarch64.rs":"65dcb58d11e8d8028401a9d=
07ca3eb4cb4f053e04249cc877353449d84ccc4cb","src/unix/bsd/netbsdlike/netbsd/=
arm.rs":"58cdbb70b0d6f536551f0f3bb3725d2d75c4690db12c26c034e7d6ec4a924452",=
"src/unix/bsd/netbsdlike/netbsd/mod.rs":"90dd33ef20dc3be8aef5bd152a6a06e7ab=
34f9527b3978487b593aaa16a907bd","src/unix/bsd/netbsdlike/netbsd/powerpc.rs"=
:"ee7ff5d89d0ed22f531237b5059aa669df93a3b5c489fa641465ace8d405bf41","src/un=
ix/bsd/netbsdlike/netbsd/sparc64.rs":"9489f4b3e4566f43bb12dfb92238960613dac=
7f6a45cc13068a8d152b902d7d9","src/unix/bsd/netbsdlike/netbsd/x86.rs":"20692=
320e36bfe028d1a34d16fe12ca77aa909cb02bda167376f98f1a09aefe7","src/unix/bsd/=
netbsdlike/netbsd/x86_64.rs":"1afe5ef46b14397cdd68664b5b232e4f5b035b6db1d4c=
f411c899d51ebca9f30","src/unix/bsd/netbsdlike/openbsd/aarch64.rs":"dd91931d=
373b7ecaf6e2de25adadee10d16fa9b12c2cbacdff3eb291e1ba36af","src/unix/bsd/net=
bsdlike/openbsd/arm.rs":"01580d261bc6447bb327a0d982181b7bdabfa066cee65a3037=
3d3ced729ad307","src/unix/bsd/netbsdlike/openbsd/mips64.rs":"8532a189ae10c7=
d668d9d4065da8b05d124e09bd39442c9f74a7f231c43eca48","src/unix/bsd/netbsdlik=
e/openbsd/mod.rs":"c27c6673bd3628549083a094219831fd9343129f91067b562781617d=
2a887148","src/unix/bsd/netbsdlike/openbsd/powerpc.rs":"01580d261bc6447bb32=
7a0d982181b7bdabfa066cee65a30373d3ced729ad307","src/unix/bsd/netbsdlike/ope=
nbsd/powerpc64.rs":"1dd5449dd1fd3d51e30ffdeeaece91d0aaf05c710e0ac699fecc546=
1cfa2c28e","src/unix/bsd/netbsdlike/openbsd/riscv64.rs":"1dd5449dd1fd3d51e3=
0ffdeeaece91d0aaf05c710e0ac699fecc5461cfa2c28e","src/unix/bsd/netbsdlike/op=
enbsd/sparc64.rs":"d04fd287afbaa2c5df9d48c94e8374a532a3ba491b424ddf018270c7=
312f4085","src/unix/bsd/netbsdlike/openbsd/x86.rs":"6f7f5c4fde2a2259eb54789=
0cbd86570cea04ef85347d7569e94e679448bec87","src/unix/bsd/netbsdlike/openbsd=
/x86_64.rs":"d31db31630289c85af3339dbe357998a21ca584cbae31607448fe2cf7675a4=
e1","src/unix/haiku/b32.rs":"a2efdbf7158a6da341e1db9176b0ab193ba88b44961623=
9ed95dced11f54d87b","src/unix/haiku/b64.rs":"ff8115367d3d7d354f792d6176dfaa=
a26353f57056197b563bf4681f91ff7985","src/unix/haiku/mod.rs":"d7ec086b73db4f=
72799179627aa6330a513dcf786b06e19c75ff884d1235948e","src/unix/haiku/native.=
rs":"dbfcbf4954a79d1df2ff58e0590bbcb8c57dfc7a32392aa73ee4726b66bd6cc8","src=
/unix/haiku/x86_64.rs":"3ec3aeeb7ed208b8916f3e32d42bfd085ff5e16936a1a35d9a5=
2789f043b7237","src/unix/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f3=
68ae10ceccefeed9debb3bbe08777fc682","src/unix/hermit/mod.rs":"a1494a0bddf30=
1cceb0d9b8529a84b5882fe855ceae77a1c4e8d6034e705e26c","src/unix/hermit/x86_6=
4.rs":"ab832b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","s=
rc/unix/linux_like/android/b32/arm.rs":"ce582de7e983a33d3bfad13075c53aac901=
6cee35f06ad8653ee9072c3ec2564","src/unix/linux_like/android/b32/mod.rs":"7c=
173e0375119bf06a3081652faede95e5bcd6858e7576b7533d037978737c8f","src/unix/l=
inux_like/android/b32/x86/align.rs":"812914e4241df82e32b12375ca3374615dc3a4=
bdd4cf31f0423c5815320c0dab","src/unix/linux_like/android/b32/x86/mod.rs":"e=
6d107efbcd37b5b85dfa18f683300cbf768ffa0237997a9fa52b184a53323ac","src/unix/=
linux_like/android/b64/aarch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3=
ee2faf6fcae3770f9e505cddca35c7b","src/unix/linux_like/android/b64/aarch64/i=
nt128.rs":"1735f6f5c56770d20dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de=
","src/unix/linux_like/android/b64/aarch64/mod.rs":"10e963e29ff209703de6336=
c99cca96fd79789438d34c82a693eae56e8916c3c","src/unix/linux_like/android/b64=
/mod.rs":"71e4fcbe952bfa4a5f9022f3972e906917b38f729b9d8ef57cd5d179104894ac"=
,"src/unix/linux_like/android/b64/riscv64/align.rs":"0bf138f84e5327d8339bcd=
4adf071a6832b516445e597552c82bbd881095e3a8","src/unix/linux_like/android/b6=
4/riscv64/mod.rs":"19d4bf2237c47127eba9144e0b82e995bc079315e719179a91813b0a=
e7b0e49d","src/unix/linux_like/android/b64/x86_64/align.rs":"7169d07a9fd471=
6f7512719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/an=
droid/b64/x86_64/mod.rs":"4ec2de11a9b65c4325b7b991f0b99a414975e0e61ba8668ca=
ca5d921e9b314d1","src/unix/linux_like/android/mod.rs":"66a9e38a47493a42b3b1=
c325524f3c944e74d1e3e8ecce3cc276ec08fecab13b","src/unix/linux_like/emscript=
en/align.rs":"86c95cbed7a7161b1f23ee06843e7b0e2340ad92b2cb86fe2a8ef3e0e8c36=
216","src/unix/linux_like/emscripten/mod.rs":"67d6b90f539f746aa3290ea7f9d3f=
3f8d2d8a6557233584004ed5697f7821a50","src/unix/linux_like/emscripten/no_ali=
gn.rs":"0128e4aa721a9902754828b61b5ec7d8a86619983ed1e0544a85d35b1051fad6","=
src/unix/linux_like/linux/align.rs":"bc5abcd38e2320171e0981e773c9c5fe3e0d5a=
66fdff049228f6a1acad80ef8b","src/unix/linux_like/linux/arch/generic/mod.rs"=
:"fb5de1368cabae03d3ea0152159b7685a9d91efdecee4c5b83efc085ffef8a73","src/un=
ix/linux_like/linux/arch/mips/mod.rs":"75814e198d1a9a6808be3a5e5edb1bfdc57f=
75b06394e9040739be363c09d82f","src/unix/linux_like/linux/arch/mod.rs":"5bd5=
361f8a6ab4e18bbba6da9f92c164ae252b15a0ed10064812544aa1fdf198","src/unix/lin=
ux_like/linux/arch/powerpc/mod.rs":"bef6b7af9e5e2b4e5545c9c7e3e23a8b743277a=
0ed95853e7eddc38e44299f02","src/unix/linux_like/linux/arch/sparc/mod.rs":"9=
1593ec0440f1dd8f8e612028f432c44c14089286e2aca50e10511ab942db8c3","src/unix/=
linux_like/linux/gnu/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec72=
51957315afa53a7b9f936","src/unix/linux_like/linux/gnu/b32/arm/align.rs":"6e=
c0eb3ee93f7ae99fd714b4deabfb5e97fbcefd8c26f5a45fb8e7150899cdeb","src/unix/l=
inux_like/linux/gnu/b32/arm/mod.rs":"9ab3e97b579a9122690cd01026e14528862860=
346b700aafbb755a7e04054f7f","src/unix/linux_like/linux/gnu/b32/csky/align.r=
s":"3fed009dc9af3cc81be7087da9d2d7d1f39845e4497e290259c5cdbae25f039d","src/=
unix/linux_like/linux/gnu/b32/csky/mod.rs":"4c21d6e7463bb22f00b984294893d12=
c84018d5d26ec661d6a30f4a9625ba639","src/unix/linux_like/linux/gnu/b32/m68k/=
align.rs":"8faa92f77a9232c035418d45331774e64a9a841d99c91791570a203bf2b45bcb=
","src/unix/linux_like/linux/gnu/b32/m68k/mod.rs":"6aab7f1b864e9691d14aa7d3=
89f717c4077b8eed72a7f11e3b8c7fef245e4046","src/unix/linux_like/linux/gnu/b3=
2/mips/align.rs":"429fb5e005cb7143602d430098b6ebfb7d360685b194f333dfd587472=
ae954ee","src/unix/linux_like/linux/gnu/b32/mips/mod.rs":"6b9a5dac6f937ddc1=
453e808e3c43502c87143332df9e43ac64fb8b1eda6c116","src/unix/linux_like/linux=
/gnu/b32/mod.rs":"b56625dd20dd48a8699034d349ef089c540c0ddcbf8a3481d598d101f=
8b40b78","src/unix/linux_like/linux/gnu/b32/powerpc.rs":"5c5d90326b54b57b98=
eff4745fe7a3fb02f053b2dc782241a73e807b491936a3","src/unix/linux_like/linux/=
gnu/b32/riscv32/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd3=
7543efe86621b119","src/unix/linux_like/linux/gnu/b32/riscv32/mod.rs":"491a9=
a97cf712985b75d3ad714691ef60898d88c78bc386a6917de0a6774cc26","src/unix/linu=
x_like/linux/gnu/b32/sparc/align.rs":"21adbed27df73e2d1ed934aaf733a643003d7=
baf2bde9c48ea440895bcca6d41","src/unix/linux_like/linux/gnu/b32/sparc/mod.r=
s":"80894eece66e9348f45d1b07ad37c757ea694bbd10ed49d3f920b34e9f51a9a3","src/=
unix/linux_like/linux/gnu/b32/x86/align.rs":"e4bafdc4a519a7922a81b37a62bbfd=
1177a2f620890eef8f1fbc47162e9eb413","src/unix/linux_like/linux/gnu/b32/x86/=
mod.rs":"c703cc5e9de2dc31d9e5831bfb6f354d6e3518b2ae02263f68a9a70f1c0167e2",=
"src/unix/linux_like/linux/gnu/b64/aarch64/align.rs":"fdf1c72375a2167699157=
e0dd825422690bb6719f7bc69515a2e5846d0431d7c","src/unix/linux_like/linux/gnu=
/b64/aarch64/fallback.rs":"832e7487249c1c0bb6e9911ce3f7d32ca22378e42392ab83=
c56915cbc59d8be3","src/unix/linux_like/linux/gnu/b64/aarch64/ilp32.rs":"bf4=
611b737813deef6787babf6c01698605f3b75482269b8546318667bc68e29","src/unix/li=
nux_like/linux/gnu/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426442f09724d=
9b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/gnu/b64/aarch6=
4/lp64.rs":"11a950697fdda0258c6e37c6b13993348c8de4134105ed4faa79358e5317507=
2","src/unix/linux_like/linux/gnu/b64/aarch64/mod.rs":"172495fbfdf659b9b825=
148bffc2b62704f63fc872428617e868eb15802c9978","src/unix/linux_like/linux/gn=
u/b64/loongarch64/align.rs":"060aa33cc737966c691aab8511c5c5729e551458ce18d0=
e284e0d45f39beeb60","src/unix/linux_like/linux/gnu/b64/loongarch64/mod.rs":=
"18edada8aa5d4127d9aa1bd81c62b5a4209f1efd8b2b2631e801c9e855ab1480","src/uni=
x/linux_like/linux/gnu/b64/mips64/align.rs":"7169d07a9fd4716f7512719aec9fda=
5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/linux/gnu/b64/mips=
64/mod.rs":"628c410b9aaec3c8f43838a28616b577a1d6de60a9799b09bb884d80281f96e=
b","src/unix/linux_like/linux/gnu/b64/mod.rs":"6a160ef25439c4fecdb0e3bd0b81=
8742263c791364da874d4febd3aa644ec8e2","src/unix/linux_like/linux/gnu/b64/po=
werpc64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1=
268130d9","src/unix/linux_like/linux/gnu/b64/powerpc64/mod.rs":"c778a136f06=
c2ffeacea19fa14ce79b828f91b67a002dec5ce87289bae36234e","src/unix/linux_like=
/linux/gnu/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e5880=
3f99cd37543efe86621b119","src/unix/linux_like/linux/gnu/b64/riscv64/mod.rs"=
:"c8f07efc5ddd5d874f1ebc329cd6907818d132ac3e30f4f2a4b04be3fb388551","src/un=
ix/linux_like/linux/gnu/b64/s390x.rs":"a2fd9277c2dcf76f7a16a3bcca745d5a9932=
c765c0dc2feb31c3641be25eb0aa","src/unix/linux_like/linux/gnu/b64/sparc64/al=
ign.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268130d9",=
"src/unix/linux_like/linux/gnu/b64/sparc64/mod.rs":"e8047e9966a2b90063e0151=
a0278c54885e7b323286cf5ab55cbaf151fc772d3","src/unix/linux_like/linux/gnu/b=
64/x86_64/align.rs":"62e822478356db4a73b6bbd1b36d825b893939ab4b308ec11b0578=
bcc4b49769","src/unix/linux_like/linux/gnu/b64/x86_64/mod.rs":"891e595d3371=
4b9883b92f0554d1d361fba2b6c3f6cac09a288252f44c6ec667","src/unix/linux_like/=
linux/gnu/b64/x86_64/not_x32.rs":"38f74ce15d9662ce4818815a2b87be1618d5e45f1=
90f7e4db84ff3285b4421fb","src/unix/linux_like/linux/gnu/b64/x86_64/x32.rs":=
"b20218a11364a6dec87f96d6c0d8b19e660697ab09ad5ee0e9b3a9dafedaaebb","src/uni=
x/linux_like/linux/gnu/mod.rs":"47dd970aedda9c70429741d7c9892a0d5d264e9abcb=
1c41d5bb913a86f0a5362","src/unix/linux_like/linux/gnu/no_align.rs":"9cd2231=
35de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/linux_=
like/linux/mod.rs":"1582c09db7b752af0f796a4cba8aa2bb4ecea895c551a2219e76047=
bcce74a23","src/unix/linux_like/linux/musl/b32/arm/align.rs":"3e8ac052c1043=
764776b54c93ba4260e061df998631737a897d9d47d54f7b80c","src/unix/linux_like/l=
inux/musl/b32/arm/mod.rs":"b63a21b02ff1f55e3aca71af51a054d61fd2b4b452ccbf9f=
34acb431c51d00ea","src/unix/linux_like/linux/musl/b32/hexagon.rs":"f0b9505a=
5935f5fd163eebaa14d4c18ff948c4b199b03e5b88c91f99d4b0fce6","src/unix/linux_l=
ike/linux/musl/b32/mips/align.rs":"429fb5e005cb7143602d430098b6ebfb7d360685=
b194f333dfd587472ae954ee","src/unix/linux_like/linux/musl/b32/mips/mod.rs":=
"9b6dfc603accb6ef68010573f30b015868a1da1e1fc3ea2dc0337f33b4015ec6","src/uni=
x/linux_like/linux/musl/b32/mod.rs":"31677597fd9544c4b1ec1477628288f6273fab=
bc06e38f33da862ad55f019ce1","src/unix/linux_like/linux/musl/b32/powerpc.rs"=
:"0ebe9c42bb746583360d990d5a63a407075be3c7bdd260e5345e8aeac4d060cc","src/un=
ix/linux_like/linux/musl/b32/riscv32/align.rs":"efd2accf33b87de7c7547903359=
a5da896edc33cd6c719552c7474b60d4a5d48","src/unix/linux_like/linux/musl/b32/=
riscv32/mod.rs":"7b067c7989a80e35daa9987af799d97dd1fb3df71ef82285137f51fbad=
2354d9","src/unix/linux_like/linux/musl/b32/x86/align.rs":"08e77fbd7435d7de=
c2ff56932433bece3f02e47ce810f89004a275a86d39cbe1","src/unix/linux_like/linu=
x/musl/b32/x86/mod.rs":"9283e5d343aa668a6c2e520fb7db2548f344f1f5adf63ec7961=
954b61e6f6fad","src/unix/linux_like/linux/musl/b64/aarch64/align.rs":"6ba32=
725d24d7d8e6aa111f3b57aafa318f83b606abe96561329151829821133","src/unix/linu=
x_like/linux/musl/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426442f09724d9=
b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/musl/b64/aarch6=
4/mod.rs":"31e75179cbb4e26425b3f5b052e358f593153da662884655e60801d852e55dc2=
","src/unix/linux_like/linux/musl/b64/mips64.rs":"9a5d29f666332bb056d0e2951=
e9de989aa1dc016075f009db3f2f628e0cdda8c","src/unix/linux_like/linux/musl/b6=
4/mod.rs":"8275e7a108c71f180de71b86f74baa1e35d9e915befb8ab8191d2a2fe76d3bb9=
","src/unix/linux_like/linux/musl/b64/powerpc64.rs":"e77f4cf5d65320023043e4=
354725397f6b079c1b7b6b3cef2c3293350b46b303","src/unix/linux_like/linux/musl=
/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd3754=
3efe86621b119","src/unix/linux_like/linux/musl/b64/riscv64/mod.rs":"a80b181=
3148dec8bc396c02638978c0b4e5e040edafd56d98f8683fe2ae51ab5","src/unix/linux_=
like/linux/musl/b64/s390x.rs":"80a92e54e47016d051c7bd55bee9580cbedd29816419=
9d71a67d49167e744432","src/unix/linux_like/linux/musl/b64/x86_64/align.rs":=
"77309276ad7a42cbe59ca381f23590b7a143aded05555b34a5b307b808cbca6e","src/uni=
x/linux_like/linux/musl/b64/x86_64/mod.rs":"032863c74d3ca73cb75483218f9bd77=
4ae1ae7d3646d2ffb21e4cc7d4b5e0e3d","src/unix/linux_like/linux/musl/lfs64.rs=
":"3e4fb381f3a0756520bde0f1692d4fa45e4ae8133bf7d7c64b0e3fdd512f235f","src/u=
nix/linux_like/linux/musl/mod.rs":"9bfa05126ad26ecaecb29ba01b6d768e0b5d72e6=
cfc7054e13f0d9365eb5735c","src/unix/linux_like/linux/no_align.rs":"62cdca0e=
011937aaf09a51ca86d9f0ee0fdb05f61ec3c058e6a5d5fa6357d784","src/unix/linux_l=
ike/linux/non_exhaustive.rs":"181a05bf94fdb911db83ce793b993bd6548a4115b306a=
7ef3c10f745a8fea3e9","src/unix/linux_like/linux/uclibc/align.rs":"9ed16138d=
8e439bd90930845a65eafa7ebd67366e6bf633936d44014f6e4c959","src/unix/linux_li=
ke/linux/uclibc/arm/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec725=
1957315afa53a7b9f936","src/unix/linux_like/linux/uclibc/arm/mod.rs":"50288f=
f9e411ab0966da24838f2c2a5618021bc19c422a04f577b2979ef4081e","src/unix/linux=
_like/linux/uclibc/arm/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632=
b96b5c85a76f8316c86653db25","src/unix/linux_like/linux/uclibc/mips/mips32/a=
lign.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936"=
,"src/unix/linux_like/linux/uclibc/mips/mips32/mod.rs":"d0c4434e2bf813372c4=
18a8f516c706cdccc9f7be2f0921b2207b0afdb66fe81","src/unix/linux_like/linux/u=
clibc/mips/mips32/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5=
c85a76f8316c86653db25","src/unix/linux_like/linux/uclibc/mips/mips64/align.=
rs":"a7bdcb18a37a2d91e64d5fad83ea3edc78f5412adb28f77ab077dbb26dd08b2d","src=
/unix/linux_like/linux/uclibc/mips/mips64/mod.rs":"3f38ee6a4690b9d7594be20d=
216467a34d955f7653c2c8ce1e6147daeb53f1e0","src/unix/linux_like/linux/uclibc=
/mips/mips64/no_align.rs":"4a18e3875698c85229599225ac3401a2a40da87e77b2ad4e=
f47c6fcd5a24ed30","src/unix/linux_like/linux/uclibc/mips/mod.rs":"a048fce1c=
2d9b1ad57305642e8ad05ca0f0c7e4753267a2e2d6b4fee5db3b072","src/unix/linux_li=
ke/linux/uclibc/mod.rs":"1c3d25cddcfefa2bd17bdc81550826be31a08eef235e13f825=
f169a5029c8bca","src/unix/linux_like/linux/uclibc/no_align.rs":"3f286370465=
24618adaa1012e26cb7ffe94b9396e6b518cccdc69d59f274d709","src/unix/linux_like=
/linux/uclibc/x86_64/l4re.rs":"024eba5753e852dbdd212427351affe7e83f9916c186=
4bce414d7aa2618f192e","src/unix/linux_like/linux/uclibc/x86_64/mod.rs":"196=
d03affbefb85716937c15904831e731eb222ee906e05e42102d639a8152ea","src/unix/li=
nux_like/linux/uclibc/x86_64/other.rs":"42c3f71e58cabba373f6a55a623f3c31b85=
049eb64824c09c2b082b3b2d6a0a8","src/unix/linux_like/mod.rs":"45c98e7a0fad03=
b03c4c76f11a80e2423873f0a6563e35c60309a29b2c8ff44f","src/unix/mod.rs":"dd4c=
e377ba9517182e718848739a5c3f58cdbbcd4ee467eef9aaf8df5aed5053","src/unix/new=
lib/aarch64/mod.rs":"bac93836a9a57b2c710f32f852e92a4d11ad6759ab0fb6ad33e71d=
60e53278af","src/unix/newlib/align.rs":"28aaf87fafbc6b312622719d472d8cf65f9=
e5467d15339df5f73e66d8502b28a","src/unix/newlib/arm/mod.rs":"cbba6b3e957ece=
b496806e60de8725a23ff3fa0015983b4b4fa27b233732b526","src/unix/newlib/espidf=
/mod.rs":"816f235f4aa4baabba7f2606b31d0fdb03988c52194c966728de8690bf17299d"=
,"src/unix/newlib/generic.rs":"eab066d9f0a0f3eb53cc1073d01496bba0110989e1f6=
a59838afd19f870cd599","src/unix/newlib/horizon/mod.rs":"7cc5cc120437421db13=
9bfa6a90b18168cd3070bdd0f5be96d40fe4c996f3ca1","src/unix/newlib/mod.rs":"9e=
36de3fd78e10cb6b9a59dc5ebe5a1b44a63ccb91433bb33653fb30d0c303c6","src/unix/n=
ewlib/no_align.rs":"e0743b2179495a9514bc3a4d1781e492878c4ec834ee0085d0891dd=
1712e82fb","src/unix/newlib/powerpc/mod.rs":"0202ffd57caf75b6afa2c9717750ff=
b96e375ac33df0ae9609a3f831be393b67","src/unix/newlib/vita/mod.rs":"68e0ce18=
6b44e0b3031eb824710e7454dc2a9df98db98120840c3c6f4d885871","src/unix/no_alig=
n.rs":"c06e95373b9088266e0b14bba0954eef95f93fb2b01d951855e382d22de78e53","s=
rc/unix/nto/aarch64.rs":"4709c9afdc8d583be876598e7c238499ee3e8da5bd2baa614d=
9c7dd414851555","src/unix/nto/mod.rs":"59ab89a8fb6e0a6d22fa968ed4873c2bafa1=
9a0f60a90c9a5148816cb7440889","src/unix/nto/neutrino.rs":"799bff4ab01a6424d=
b6c5a2b76aa5679826d41495f9d13c63485bf13bc80026b","src/unix/nto/x86_64.rs":"=
a3e18e93c2999da1cd7a6f748a4b60c07aefb73d8ea2aafec19a84cfb040bc8e","src/unix=
/redox/mod.rs":"73658b0d28c82a122875aa2b45c489834f4de58c378add7932bbaf3ffb2=
ae789","src/unix/solarish/compat.rs":"00f1ee3faec9da69204e42f025f6735dd13d8=
94071a154425dcc43ecbdd06e7f","src/unix/solarish/illumos.rs":"cd93c2d84722bb=
f9933a92842a8998eb0b2afc962f50bc2546ad127b82809fa7","src/unix/solarish/mod.=
rs":"b1660c631a599a3355116e7485b88ab2f8f2929c2e37851a763431387b902f14","src=
/unix/solarish/solaris.rs":"41b350a89ddf01cd12a10f93640f92be53be0b0d976021c=
dc08da17bf3e72edf","src/unix/solarish/x86.rs":"e86e806df0caed72765040eaa2f3=
c883198d1aa91508540adf9b7008c77f522e","src/unix/solarish/x86_64.rs":"ec2b01=
f194eb8a6a27133c57681da195a949e03098f3ea1e847227a9c09ef5fc","src/unix/solar=
ish/x86_common.rs":"ac869d9c3c95645c22460468391eb1982023c3a8e02b9e06a72e3ae=
f3d5f1eac","src/vxworks/aarch64.rs":"98f0afdc511cd02557e506c21fed6737585490=
a1dce7a9d4941d08c437762b99","src/vxworks/arm.rs":"acb7968ce99fe3f4abdf39d98=
f8133d21a4fba435b8ef7084777cb181d788e88","src/vxworks/mod.rs":"e4edcbcf43a3=
25e738c9465507594d0c87abf3f0e2b9b046c1425f8d44bdad0f","src/vxworks/powerpc.=
rs":"acb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788e88","src=
/vxworks/powerpc64.rs":"98f0afdc511cd02557e506c21fed6737585490a1dce7a9d4941=
d08c437762b99","src/vxworks/x86.rs":"552f007f38317620b23889cb7c49d1d1158412=
52439060122f52f434fbc6e5ba","src/vxworks/x86_64.rs":"018d92be3ad628a129eff9=
f2f5dfbc0883d8b8e5f2fa917b900a7f98ed6b514a","src/wasi.rs":"09ee3b3348b212b0=
50f6ca8ae008a28679ea44a375674307a4e7c9ca0d3ed7d5","src/windows/gnu/align.rs=
":"b2c13ec1b9f3b39a75c452c80c951dff9d0215e31d77e883b4502afb31794647","src/w=
indows/gnu/mod.rs":"3c8c7edb7cdf5d0c44af936db2a94869585c69dfabeef30571b4f4e=
38375767a","src/windows/mod.rs":"9fdc5e1c62c441abef7bc62a7343efb2041edc24db=
9ac0efc0f74df55b69e249","src/windows/msvc/mod.rs":"c068271e00fca6b62bc4bf44=
bcf142cfc38caeded9b6c4e01d1ceef3ccf986f4","src/xous.rs":"eb0675f25ba01f7307=
2d2b70907fb8abb1148facefe5a20756c49250f3d65fae","tests/const_fn.rs":"cb75a1=
f0864f926aebe79118fc34d51a0d1ade2c20a394e7774c7e545f21f1f4"},"package":"9cd=
c71e17332e86d2e1d38c1f99edcb6288ee11b815fb1a4b049eaa2114d369b"}
> +\ No newline at end of file
> diff --git a/meta/recipes-devtools/rust/files/0001-musl-Define-SOCK_SEQPA=
CKET-in-common-place.patch b/meta/recipes-devtools/rust/files/0001-musl-Def=
ine-SOCK_SEQPACKET-in-common-place.patch
> deleted file mode 100644
> index 12ac614af30b..000000000000
> --- a/meta/recipes-devtools/rust/files/0001-musl-Define-SOCK_SEQPACKET-in=
-common-place.patch
> +++ /dev/null
> @@ -1,115 +0,0 @@
> -From 359bfce3da3f47517001bed4a3ab7338faa564f7 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sat, 8 Apr 2023 09:25:31 -0700
> -Subject: [PATCH] musl: Define SOCK_SEQPACKET in common place
> -
> -This define is not architecture specific in musl [1]
> -
> -[1] https://git.musl-libc.org/cgit/musl/tree/include/sys/socket.h#n90
> -
> -Upstream-Status: Submitted [https://github.com/rust-lang/libc/pull/3191]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - vendor/libc/src/unix/linux_like/linux/musl/b32/arm/mod.rs  | 1 -
> - vendor/libc/src/unix/linux_like/linux/musl/b32/hexagon.rs  | 2 +-
> - vendor/libc/src/unix/linux_like/linux/musl/b32/mips/mod.rs | 1 -
> - vendor/libc/src/unix/linux_like/linux/musl/b32/powerpc.rs  | 1 -
> - vendor/libc/src/unix/linux_like/linux/musl/b32/x86/mod.rs  | 1 -
> - vendor/libc/src/unix/linux_like/linux/musl/b64/mod.rs      | 2 --
> - vendor/libc/src/unix/linux_like/linux/musl/mod.rs          | 1 +
> - 7 files changed, 2 insertions(+), 7 deletions(-)
> -
> -Index: rustc-1.72.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/a=
rm/mod.rs
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- rustc-1.72.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b32=
/arm/mod.rs
> -+++ rustc-1.72.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/arm/=
mod.rs
> -@@ -326,7 +326,6 @@ pub const MAP_SYNC: ::c_int =3D 0x080000;
> -=20
> - pub const SOCK_STREAM: ::c_int =3D 1;
> - pub const SOCK_DGRAM: ::c_int =3D 2;
> --pub const SOCK_SEQPACKET: ::c_int =3D 5;
> -=20
> - pub const EDEADLK: ::c_int =3D 35;
> - pub const ENAMETOOLONG: ::c_int =3D 36;
> -Index: rustc-1.72.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/h=
exagon.rs
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- rustc-1.72.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b32=
/hexagon.rs
> -+++ rustc-1.72.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/hexa=
gon.rs
> -@@ -296,7 +296,6 @@ pub const SIG_BLOCK: ::c_int =3D 0x000000;
> - pub const SIG_UNBLOCK: ::c_int =3D 0x01;
> - pub const SOCK_DGRAM: ::c_int =3D 2;
> - pub const SOCK_NONBLOCK: ::c_int =3D 2048;
> --pub const SOCK_SEQPACKET: ::c_int =3D 5;
> - pub const SOCK_STREAM: ::c_int =3D 1;
> - pub const SOL_CAIF: ::c_int =3D 278;
> - pub const SOL_IUCV: ::c_int =3D 277;
> -Index: rustc-1.72.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/m=
ips/mod.rs
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- rustc-1.72.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b32=
/mips/mod.rs
> -+++ rustc-1.72.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/mips=
/mod.rs
> -@@ -351,7 +351,6 @@ pub const ERFKILL: ::c_int =3D 167;
> -=20
> - pub const SOCK_STREAM: ::c_int =3D 2;
> - pub const SOCK_DGRAM: ::c_int =3D 1;
> --pub const SOCK_SEQPACKET: ::c_int =3D 5;
> -=20
> - pub const SA_ONSTACK: ::c_int =3D 0x08000000;
> - pub const SA_SIGINFO: ::c_int =3D 8;
> -Index: rustc-1.72.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/p=
owerpc.rs
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- rustc-1.72.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b32=
/powerpc.rs
> -+++ rustc-1.72.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/powe=
rpc.rs
> -@@ -262,7 +262,6 @@ pub const PTRACE_SYSEMU_SINGLESTEP: ::c_
> -=20
> - pub const SOCK_STREAM: ::c_int =3D 1;
> - pub const SOCK_DGRAM: ::c_int =3D 2;
> --pub const SOCK_SEQPACKET: ::c_int =3D 5;
> -=20
> - pub const EDEADLK: ::c_int =3D 35;
> - pub const ENAMETOOLONG: ::c_int =3D 36;
> -Index: rustc-1.72.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/x=
86/mod.rs
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- rustc-1.72.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b32=
/x86/mod.rs
> -+++ rustc-1.72.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/x86/=
mod.rs
> -@@ -315,7 +315,6 @@ pub const MAP_SYNC: ::c_int =3D 0x080000;
> -=20
> - pub const SOCK_STREAM: ::c_int =3D 1;
> - pub const SOCK_DGRAM: ::c_int =3D 2;
> --pub const SOCK_SEQPACKET: ::c_int =3D 5;
> -=20
> - pub const EDEADLK: ::c_int =3D 35;
> - pub const ENAMETOOLONG: ::c_int =3D 36;
> -Index: rustc-1.72.0-src/vendor/libc/src/unix/linux_like/linux/musl/b64/m=
od.rs
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- rustc-1.72.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b64=
/mod.rs
> -+++ rustc-1.72.0-src/vendor/libc/src/unix/linux_like/linux/musl/b64/mod.=
rs
> -@@ -136,8 +136,6 @@ pub const __SIZEOF_PTHREAD_BARRIER_T: us
> -=20
> - pub const SOCK_NONBLOCK: ::c_int =3D 2048;
> -=20
> --pub const SOCK_SEQPACKET: ::c_int =3D 5;
> --
> - extern "C" {
> -     pub fn getrandom(buf: *mut ::c_void, buflen: ::size_t, flags: ::c_u=
int) -> ::ssize_t;
> - }
> -Index: rustc-1.72.0-src/vendor/libc/src/unix/linux_like/linux/musl/mod.rs
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- rustc-1.72.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/mod=
=2Ers
> -+++ rustc-1.72.0-src/vendor/libc/src/unix/linux_like/linux/musl/mod.rs
> -@@ -541,6 +541,7 @@ pub const POSIX_MADV_DONTNEED: ::c_int =3D
> -=20
> - pub const MAP_ANONYMOUS: ::c_int =3D MAP_ANON;
> -=20
> -+pub const SOCK_SEQPACKET: ::c_int =3D 5;
> - pub const SOCK_DCCP: ::c_int =3D 6;
> - pub const SOCK_PACKET: ::c_int =3D 10;
> -=20
> -Index: rustc-1.72.0-src/vendor/libc/.cargo-checksum.json
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- rustc-1.72.0-src.orig/vendor/libc/.cargo-checksum.json
> -+++ rustc-1.72.0-src/vendor/libc/.cargo-checksum.json
> -@@ -1 +1 @@
> --{"files":{"CONTRIBUTING.md":"bdc90b52cf803faac96e594069a86dd8ea150d5ba7=
fb3e6cadfc08dac4c7b0ce","Cargo.toml":"a1d4350481d43c600687f1921083036db242f=
3a9e5bc9906d4d469fdfe588d48","LICENSE-APACHE":"62c7a1e35f56406896d7aa7ca52d=
0cc0d272ac022b5d2796e7d6905db8a3636a","LICENSE-MIT":"a8d47ff51ca256f56a8932=
dba07660672dbfe3004257ca8de708aac1415937a1","README.md":"ecc47e284f8d007fc0=
48666d5108dd41cdc440ab9eedfe8c47d1634613522787","build.rs":"5bd78d7e4e79b18=
3fb1dab92cd640a611330131d54c479c69adbe87cbdc95ae3","rustfmt.toml":"eaa2ea84=
fc1ba0359b77680804903e07bb38d257ab11986b95b158e460f787b2","src/fixed_width_=
ints.rs":"7f986e5f5e68d25ef04d386fd2f640e8be8f15427a8d4a458ea01d26b8dca0ca"=
,"src/fuchsia/aarch64.rs":"893fcec48142d273063ffd814dca33fbec92205fd39ada97=
075f85201d803996","src/fuchsia/align.rs":"ae1cf8f011a99737eabeb14ffff768e60=
f13b13363d7646744dbb0f443dab3d6","src/fuchsia/mod.rs":"30f4dc83ef120300d618=
96696512436377c5f36f1431d98ab7e01e498c0c47d5","src/fuchsia/no_align.rs":"30=
3f3f1b255e0088b5715094353cf00476131d8e94e6aebb3f469557771c8b8a","src/fuchsi=
a/riscv64.rs":"617cd75e79e0e20f664db764a4dc2a396d9fd11a4d95371acd91ed481129=
3b11","src/fuchsia/x86_64.rs":"93a3632b5cf67d2a6bcb7dc0a558605252d5fe689e0f=
38d8aa2ec5852255ac87","src/hermit/aarch64.rs":"86048676e335944c37a63d0083d0=
f368ae10ceccefeed9debb3bbe08777fc682","src/hermit/mod.rs":"d3bfce41e4463d4b=
e8020a2d063c9bfa8b665f45f1cc6cbf3163f5d01e7cb21f","src/hermit/x86_64.rs":"a=
b832b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/lib.r=
s":"24111461547739f3646f95bcb66c43f2ae679a727ff5938299434c522c02e458","src/=
macros.rs":"b457eb028b8e8ab3c24bb7292b874ad4e491edbb83594f6a3da024df5348c08=
8","src/psp.rs":"dd31aabd46171d474ec5828372e28588935120e7355c90c105360d8fa9=
264c1c","src/sgx.rs":"16a95cdefc81c5ee00d8353a60db363c4cc3e0f75abcd5d014472=
3f2a306ed1b","src/solid/aarch64.rs":"a726e47f324adf73a4a0b67a2c183408d0cad1=
05ae66acf36db37a42ab7f8707","src/solid/arm.rs":"e39a4f74ebbef3b97b8c95758ad=
741123d84ed3eb48d9cf4f1f4872097fc27fe","src/solid/mod.rs":"5f4151dca5132e4b=
4e4c23ab9737e12856dddbdc0ca3f7dbc004328ef3c8acde","src/switch.rs":"9da3dd39=
b3de45a7928789926e8572d00e1e11a39e6f7289a1349aadce90edba","src/unix/aix/mod=
=2Ers":"54229b5e774669c16912112e8b50fa938db76f534971222a11723a05195a0948","=
src/unix/aix/powerpc64.rs":"cf374d81139d45f9d77c6a764f640bfbf7e0a5903689652=
c8296f8e10d55169b","src/unix/align.rs":"2cdc7c826ef7ae61f5171c5ae8c445a743d=
86f1a7f2d9d7e4ceeec56d6874f65","src/unix/bsd/apple/b32/align.rs":"ec833a747=
866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/appl=
e/b32/mod.rs":"2546ad3eb6aecb95f916648bc63264117c92b4b4859532b34cb011e4c75a=
5a72","src/unix/bsd/apple/b64/aarch64/align.rs":"e8eb38d064b5fefec6f37d4287=
3820a0483e7c758ed336cc59a7155455ca89c9","src/unix/bsd/apple/b64/aarch64/mod=
=2Ers":"44c217a4f263afe7a97435de9323d20a96c37836f899ca0925306d4b7e073c27","=
src/unix/bsd/apple/b64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf=
4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b64/mod.rs":"f5e278a1af7fb3588=
91d1c9be4eb7e815aaca0c5cb738d0c3604ba2208a856f7","src/unix/bsd/apple/b64/x8=
6_64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b=
0e26c","src/unix/bsd/apple/b64/x86_64/mod.rs":"8c87c5855038aae5d433c8f5eb3b=
29b0a175879a0245342b3bfd83bdf4cfd936","src/unix/bsd/apple/long_array.rs":"3=
cf1f19b812e6d093c819dc65ce55b13491963e0780eda0d0bd1577603e81948","src/unix/=
bsd/apple/mod.rs":"a6662488273ffff2a097403281db6b5f4cd1a325f7a1582264bb8da0=
b553a822","src/unix/bsd/freebsdlike/dragonfly/errno.rs":"8295b8bb0dfd38d2cd=
b4d9192cdeeb534cc6c3b208170e64615fa3e0edb3e578","src/unix/bsd/freebsdlike/d=
ragonfly/mod.rs":"f2e78625fe1eb14f43e730a3987eba888cb8ac04c23008e7c2d2f7c72=
258b9e6","src/unix/bsd/freebsdlike/freebsd/aarch64.rs":"6c8e216385f53a4bf5f=
171749b57602fc34a4e4b160a44ca31c058cb0c8a2126","src/unix/bsd/freebsdlike/fr=
eebsd/arm.rs":"59d6a670eea562fb87686e243e0a84603d29a2028a3d4b3f99ccc01bd04d=
2f47","src/unix/bsd/freebsdlike/freebsd/freebsd11/b64.rs":"9808d152c1196aa6=
47f1b0f0cf84dac8c930da7d7f897a44975545e3d9d17681","src/unix/bsd/freebsdlike=
/freebsd/freebsd11/mod.rs":"e243ae0e89623d4fa9f85afe14369cc5fd5f2028ea71577=
3dbec722ba80dac1f","src/unix/bsd/freebsdlike/freebsd/freebsd12/b64.rs":"61c=
be45f8499bedb168106b686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bs=
d/freebsdlike/freebsd/freebsd12/mod.rs":"bef9fae288a4f29e941ea369be1cd20b17=
0040e60665a4d49a4a9e79009b72d8","src/unix/bsd/freebsdlike/freebsd/freebsd12=
/x86_64.rs":"2df36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd0=
52","src/unix/bsd/freebsdlike/freebsd/freebsd13/b64.rs":"61cbe45f8499bedb16=
8106b686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/f=
reebsd/freebsd13/mod.rs":"3c514e037694ce22724abb3c9c4687defda7f0e3456b615ca=
73593e860e38b16","src/unix/bsd/freebsdlike/freebsd/freebsd13/x86_64.rs":"2d=
f36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/b=
sd/freebsdlike/freebsd/freebsd14/b64.rs":"61cbe45f8499bedb168106b686d4f8239=
472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd1=
4/mod.rs":"318abe48bfdd1c74ecd6afbd6c9329c5c72ce4f7d420edd6be2fc12b223ae32f=
","src/unix/bsd/freebsdlike/freebsd/freebsd14/x86_64.rs":"e7b5863e222d6cc41=
6b6b0fbe71690fad909e899b4c4ae810bbca117e4fcb650","src/unix/bsd/freebsdlike/=
freebsd/mod.rs":"4c3cd57aaf7fbce072e28e0d2d285b5fda9702e924561d2fd01e49e6ee=
186a98","src/unix/bsd/freebsdlike/freebsd/powerpc.rs":"9ca3f82f88974e6db556=
9f2d76a5a3749b248a31747a6c0da5820492bdfeca42","src/unix/bsd/freebsdlike/fre=
ebsd/powerpc64.rs":"2dae3ecc87eac3b11657aa98915def55fc4b5c0de11fe26aae23329=
a54628a9a","src/unix/bsd/freebsdlike/freebsd/riscv64.rs":"fa4bed4c58cad24ba=
3395941c7fa6b11e089551a04714f9561078e400f5b2b62","src/unix/bsd/freebsdlike/=
freebsd/x86.rs":"6766e2ce85e187b306cd3b0b8d7e15b8f4042c5cff81d89b3af69ecc99=
c70ab0","src/unix/bsd/freebsdlike/freebsd/x86_64/align.rs":"0e1f69a88fca1c3=
2874b1daf5db3d446fefbe518dca497f096cc9168c39dde70","src/unix/bsd/freebsdlik=
e/freebsd/x86_64/mod.rs":"51e4dd0c8ae247bb652feda5adad9333ea3bb30c750c3a393=
5e0b0e47d7803eb","src/unix/bsd/freebsdlike/mod.rs":"0eacafac87fb3a32ef1b859=
80fece2792e70eba9856af18a7407cc35be68ea57","src/unix/bsd/mod.rs":"dad51a24a=
524e92bfe9de3ac3b7d394d86058b9b8a1ccd4efa9bbb5c78e7fa1a","src/unix/bsd/netb=
sdlike/mod.rs":"0a66f7de43710e35a6a546e6c39066aa8b91a6efadb71db88738b0a577f=
d5537","src/unix/bsd/netbsdlike/netbsd/aarch64.rs":"65dcb58d11e8d8028401a9d=
07ca3eb4cb4f053e04249cc877353449d84ccc4cb","src/unix/bsd/netbsdlike/netbsd/=
arm.rs":"58cdbb70b0d6f536551f0f3bb3725d2d75c4690db12c26c034e7d6ec4a924452",=
"src/unix/bsd/netbsdlike/netbsd/mod.rs":"90dd33ef20dc3be8aef5bd152a6a06e7ab=
34f9527b3978487b593aaa16a907bd","src/unix/bsd/netbsdlike/netbsd/powerpc.rs"=
:"ee7ff5d89d0ed22f531237b5059aa669df93a3b5c489fa641465ace8d405bf41","src/un=
ix/bsd/netbsdlike/netbsd/sparc64.rs":"9489f4b3e4566f43bb12dfb92238960613dac=
7f6a45cc13068a8d152b902d7d9","src/unix/bsd/netbsdlike/netbsd/x86.rs":"20692=
320e36bfe028d1a34d16fe12ca77aa909cb02bda167376f98f1a09aefe7","src/unix/bsd/=
netbsdlike/netbsd/x86_64.rs":"1afe5ef46b14397cdd68664b5b232e4f5b035b6db1d4c=
f411c899d51ebca9f30","src/unix/bsd/netbsdlike/openbsd/aarch64.rs":"dd91931d=
373b7ecaf6e2de25adadee10d16fa9b12c2cbacdff3eb291e1ba36af","src/unix/bsd/net=
bsdlike/openbsd/arm.rs":"01580d261bc6447bb327a0d982181b7bdabfa066cee65a3037=
3d3ced729ad307","src/unix/bsd/netbsdlike/openbsd/mips64.rs":"8532a189ae10c7=
d668d9d4065da8b05d124e09bd39442c9f74a7f231c43eca48","src/unix/bsd/netbsdlik=
e/openbsd/mod.rs":"892e0b409ced2dfd81d98cbe9630eb83979c1668d323b304a91be13a=
a711d5db","src/unix/bsd/netbsdlike/openbsd/powerpc.rs":"01580d261bc6447bb32=
7a0d982181b7bdabfa066cee65a30373d3ced729ad307","src/unix/bsd/netbsdlike/ope=
nbsd/powerpc64.rs":"1dd5449dd1fd3d51e30ffdeeaece91d0aaf05c710e0ac699fecc546=
1cfa2c28e","src/unix/bsd/netbsdlike/openbsd/riscv64.rs":"1dd5449dd1fd3d51e3=
0ffdeeaece91d0aaf05c710e0ac699fecc5461cfa2c28e","src/unix/bsd/netbsdlike/op=
enbsd/sparc64.rs":"d04fd287afbaa2c5df9d48c94e8374a532a3ba491b424ddf018270c7=
312f4085","src/unix/bsd/netbsdlike/openbsd/x86.rs":"6f7f5c4fde2a2259eb54789=
0cbd86570cea04ef85347d7569e94e679448bec87","src/unix/bsd/netbsdlike/openbsd=
/x86_64.rs":"d31db31630289c85af3339dbe357998a21ca584cbae31607448fe2cf7675a4=
e1","src/unix/haiku/b32.rs":"a2efdbf7158a6da341e1db9176b0ab193ba88b44961623=
9ed95dced11f54d87b","src/unix/haiku/b64.rs":"ff8115367d3d7d354f792d6176dfaa=
a26353f57056197b563bf4681f91ff7985","src/unix/haiku/mod.rs":"d7ec086b73db4f=
72799179627aa6330a513dcf786b06e19c75ff884d1235948e","src/unix/haiku/native.=
rs":"dbfcbf4954a79d1df2ff58e0590bbcb8c57dfc7a32392aa73ee4726b66bd6cc8","src=
/unix/haiku/x86_64.rs":"3ec3aeeb7ed208b8916f3e32d42bfd085ff5e16936a1a35d9a5=
2789f043b7237","src/unix/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f3=
68ae10ceccefeed9debb3bbe08777fc682","src/unix/hermit/mod.rs":"a1494a0bddf30=
1cceb0d9b8529a84b5882fe855ceae77a1c4e8d6034e705e26c","src/unix/hermit/x86_6=
4.rs":"ab832b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","s=
rc/unix/linux_like/android/b32/arm.rs":"ce582de7e983a33d3bfad13075c53aac901=
6cee35f06ad8653ee9072c3ec2564","src/unix/linux_like/android/b32/mod.rs":"7c=
173e0375119bf06a3081652faede95e5bcd6858e7576b7533d037978737c8f","src/unix/l=
inux_like/android/b32/x86/align.rs":"812914e4241df82e32b12375ca3374615dc3a4=
bdd4cf31f0423c5815320c0dab","src/unix/linux_like/android/b32/x86/mod.rs":"e=
6d107efbcd37b5b85dfa18f683300cbf768ffa0237997a9fa52b184a53323ac","src/unix/=
linux_like/android/b64/aarch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3=
ee2faf6fcae3770f9e505cddca35c7b","src/unix/linux_like/android/b64/aarch64/i=
nt128.rs":"1735f6f5c56770d20dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de=
","src/unix/linux_like/android/b64/aarch64/mod.rs":"171f8c37a2d2e45065bd354=
7dfcec70b02aa3da34cd99d259d150c753f620846","src/unix/linux_like/android/b64=
/mod.rs":"71e4fcbe952bfa4a5f9022f3972e906917b38f729b9d8ef57cd5d179104894ac"=
,"src/unix/linux_like/android/b64/riscv64/align.rs":"0bf138f84e5327d8339bcd=
4adf071a6832b516445e597552c82bbd881095e3a8","src/unix/linux_like/android/b6=
4/riscv64/mod.rs":"19d4bf2237c47127eba9144e0b82e995bc079315e719179a91813b0a=
e7b0e49d","src/unix/linux_like/android/b64/x86_64/align.rs":"7169d07a9fd471=
6f7512719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/an=
droid/b64/x86_64/mod.rs":"4ec2de11a9b65c4325b7b991f0b99a414975e0e61ba8668ca=
ca5d921e9b314d1","src/unix/linux_like/android/mod.rs":"fe4c4015cdafc40b5376=
19c9325168f519249ee5acc00cc43b9f0aa5fb95f331","src/unix/linux_like/emscript=
en/align.rs":"86c95cbed7a7161b1f23ee06843e7b0e2340ad92b2cb86fe2a8ef3e0e8c36=
216","src/unix/linux_like/emscripten/mod.rs":"712c52856ee323b8057b9452e4ab4=
84a0e652581a530b67c3db25e819919d718","src/unix/linux_like/emscripten/no_ali=
gn.rs":"0128e4aa721a9902754828b61b5ec7d8a86619983ed1e0544a85d35b1051fad6","=
src/unix/linux_like/linux/align.rs":"87401c80ff504def5cd4309a53a63fdd481642=
980b9daaa7fee0164a807c2c61","src/unix/linux_like/linux/arch/generic/mod.rs"=
:"778742250aa456cb94efe67a4f8d0213827d90ab74eb5074f9afb9a30e6ea71c","src/un=
ix/linux_like/linux/arch/mips/mod.rs":"60ace1dd76aa88d6b3b5e52fef4bec7881d4=
52780dfff635474067b512e03df1","src/unix/linux_like/linux/arch/mod.rs":"466a=
29622e47c6c7f1500682b2eb17f5566dd81b322cd6348f0fdd355cec593a","src/unix/lin=
ux_like/linux/arch/powerpc/mod.rs":"bef6b7af9e5e2b4e5545c9c7e3e23a8b743277a=
0ed95853e7eddc38e44299f02","src/unix/linux_like/linux/arch/sparc/mod.rs":"9=
1593ec0440f1dd8f8e612028f432c44c14089286e2aca50e10511ab942db8c3","src/unix/=
linux_like/linux/gnu/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec72=
51957315afa53a7b9f936","src/unix/linux_like/linux/gnu/b32/arm/align.rs":"6e=
c0eb3ee93f7ae99fd714b4deabfb5e97fbcefd8c26f5a45fb8e7150899cdeb","src/unix/l=
inux_like/linux/gnu/b32/arm/mod.rs":"9ab3e97b579a9122690cd01026e14528862860=
346b700aafbb755a7e04054f7f","src/unix/linux_like/linux/gnu/b32/m68k/align.r=
s":"8faa92f77a9232c035418d45331774e64a9a841d99c91791570a203bf2b45bcb","src/=
unix/linux_like/linux/gnu/b32/m68k/mod.rs":"6aab7f1b864e9691d14aa7d389f717c=
4077b8eed72a7f11e3b8c7fef245e4046","src/unix/linux_like/linux/gnu/b32/mips/=
align.rs":"429fb5e005cb7143602d430098b6ebfb7d360685b194f333dfd587472ae954ee=
","src/unix/linux_like/linux/gnu/b32/mips/mod.rs":"6b9a5dac6f937ddc1453e808=
e3c43502c87143332df9e43ac64fb8b1eda6c116","src/unix/linux_like/linux/gnu/b3=
2/mod.rs":"caade9dc8b7179711102da342819bdf330c42c796b4587d0ed419550dab2e9ad=
","src/unix/linux_like/linux/gnu/b32/powerpc.rs":"5c5d90326b54b57b98eff4745=
fe7a3fb02f053b2dc782241a73e807b491936a3","src/unix/linux_like/linux/gnu/b32=
/riscv32/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd37543efe=
86621b119","src/unix/linux_like/linux/gnu/b32/riscv32/mod.rs":"491a9a97cf71=
2985b75d3ad714691ef60898d88c78bc386a6917de0a6774cc26","src/unix/linux_like/=
linux/gnu/b32/sparc/align.rs":"21adbed27df73e2d1ed934aaf733a643003d7baf2bde=
9c48ea440895bcca6d41","src/unix/linux_like/linux/gnu/b32/sparc/mod.rs":"808=
94eece66e9348f45d1b07ad37c757ea694bbd10ed49d3f920b34e9f51a9a3","src/unix/li=
nux_like/linux/gnu/b32/x86/align.rs":"e4bafdc4a519a7922a81b37a62bbfd1177a2f=
620890eef8f1fbc47162e9eb413","src/unix/linux_like/linux/gnu/b32/x86/mod.rs"=
:"c703cc5e9de2dc31d9e5831bfb6f354d6e3518b2ae02263f68a9a70f1c0167e2","src/un=
ix/linux_like/linux/gnu/b64/aarch64/align.rs":"ea39d5fd8ca5a71314127d1e1f54=
2bca34ac566eac9a95662076d91ea4bee548","src/unix/linux_like/linux/gnu/b64/aa=
rch64/ilp32.rs":"bf4611b737813deef6787babf6c01698605f3b75482269b8546318667b=
c68e29","src/unix/linux_like/linux/gnu/b64/aarch64/int128.rs":"1735f6f5c567=
70d20dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/=
linux/gnu/b64/aarch64/lp64.rs":"11a950697fdda0258c6e37c6b13993348c8de413410=
5ed4faa79358e53175072","src/unix/linux_like/linux/gnu/b64/aarch64/mod.rs":"=
d7be998105fc2f6248b7fdfcedb5a0519122d28625fcfd5dccf72617fb30c45e","src/unix=
/linux_like/linux/gnu/b64/loongarch64/align.rs":"060aa33cc737966c691aab8511=
c5c5729e551458ce18d0e284e0d45f39beeb60","src/unix/linux_like/linux/gnu/b64/=
loongarch64/mod.rs":"18edada8aa5d4127d9aa1bd81c62b5a4209f1efd8b2b2631e801c9=
e855ab1480","src/unix/linux_like/linux/gnu/b64/mips64/align.rs":"7169d07a9f=
d4716f7512719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_lik=
e/linux/gnu/b64/mips64/mod.rs":"628c410b9aaec3c8f43838a28616b577a1d6de60a97=
99b09bb884d80281f96eb","src/unix/linux_like/linux/gnu/b64/mod.rs":"3c6555f3=
0a7a8852757b31a542ea73fb6a16a6e27e838397e819278ad56e57a4","src/unix/linux_l=
ike/linux/gnu/b64/powerpc64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78=
a468cc1dc9df83f002f1268130d9","src/unix/linux_like/linux/gnu/b64/powerpc64/=
mod.rs":"c778a136f06c2ffeacea19fa14ce79b828f91b67a002dec5ce87289bae36234e",=
"src/unix/linux_like/linux/gnu/b64/riscv64/align.rs":"d321491612be8d5c61b6e=
c2dc0111beb3a22e58803f99cd37543efe86621b119","src/unix/linux_like/linux/gnu=
/b64/riscv64/mod.rs":"c8f07efc5ddd5d874f1ebc329cd6907818d132ac3e30f4f2a4b04=
be3fb388551","src/unix/linux_like/linux/gnu/b64/s390x.rs":"a2fd9277c2dcf76f=
7a16a3bcca745d5a9932c765c0dc2feb31c3641be25eb0aa","src/unix/linux_like/linu=
x/gnu/b64/sparc64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9=
df83f002f1268130d9","src/unix/linux_like/linux/gnu/b64/sparc64/mod.rs":"e80=
47e9966a2b90063e0151a0278c54885e7b323286cf5ab55cbaf151fc772d3","src/unix/li=
nux_like/linux/gnu/b64/x86_64/align.rs":"62e822478356db4a73b6bbd1b36d825b89=
3939ab4b308ec11b0578bcc4b49769","src/unix/linux_like/linux/gnu/b64/x86_64/m=
od.rs":"891e595d33714b9883b92f0554d1d361fba2b6c3f6cac09a288252f44c6ec667","=
src/unix/linux_like/linux/gnu/b64/x86_64/not_x32.rs":"38f74ce15d9662ce48188=
15a2b87be1618d5e45f190f7e4db84ff3285b4421fb","src/unix/linux_like/linux/gnu=
/b64/x86_64/x32.rs":"b20218a11364a6dec87f96d6c0d8b19e660697ab09ad5ee0e9b3a9=
dafedaaebb","src/unix/linux_like/linux/gnu/mod.rs":"a105e27dac14401935ad2ac=
b60618c0d0c078f65d5bc06c92940d6ab93659b96","src/unix/linux_like/linux/gnu/n=
o_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db=
25","src/unix/linux_like/linux/mod.rs":"657a86280094d5ce31e1f85d116c95637cb=
994baeb724b78dcbd7684b9be1b96","src/unix/linux_like/linux/musl/b32/arm/alig=
n.rs":"3e8ac052c1043764776b54c93ba4260e061df998631737a897d9d47d54f7b80c","s=
rc/unix/linux_like/linux/musl/b32/arm/mod.rs":"f5b217a93f99c2852f7fd1459f52=
9798372fa7df84ee0cfd3d8cdd5b2021b8cf","src/unix/linux_like/linux/musl/b32/h=
exagon.rs":"226a8b64ce9c75abbbee6d2dceb0b44f7b6c750c4102ebd4d015194afee6666=
e","src/unix/linux_like/linux/musl/b32/mips/align.rs":"429fb5e005cb7143602d=
430098b6ebfb7d360685b194f333dfd587472ae954ee","src/unix/linux_like/linux/mu=
sl/b32/mips/mod.rs":"16f614dd59695497a01b542deacd1669335678bdd0b14d16dde482=
fb5c4e02f4","src/unix/linux_like/linux/musl/b32/mod.rs":"31677597fd9544c4b1=
ec1477628288f6273fabbc06e38f33da862ad55f019ce1","src/unix/linux_like/linux/=
musl/b32/powerpc.rs":"69e3ab4471f876055215a7fccabe514e69299ecfe2fa95d989e4d=
799e03f43e9","src/unix/linux_like/linux/musl/b32/riscv32/align.rs":"efd2acc=
f33b87de7c7547903359a5da896edc33cd6c719552c7474b60d4a5d48","src/unix/linux_=
like/linux/musl/b32/riscv32/mod.rs":"7b067c7989a80e35daa9987af799d97dd1fb3d=
f71ef82285137f51fbad2354d9","src/unix/linux_like/linux/musl/b32/x86/align.r=
s":"08e77fbd7435d7dec2ff56932433bece3f02e47ce810f89004a275a86d39cbe1","src/=
unix/linux_like/linux/musl/b32/x86/mod.rs":"de632ac323bd2bb4f83d4826d6eb7e2=
9d4b0e6293aa0c4cb9c99ef0fcabc71b7","src/unix/linux_like/linux/musl/b64/aarc=
h64/align.rs":"6ba32725d24d7d8e6aa111f3b57aafa318f83b606abe9656132915182982=
1133","src/unix/linux_like/linux/musl/b64/aarch64/int128.rs":"1735f6f5c5677=
0d20dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/l=
inux/musl/b64/aarch64/mod.rs":"31e75179cbb4e26425b3f5b052e358f593153da66288=
4655e60801d852e55dc2","src/unix/linux_like/linux/musl/b64/mips64.rs":"9a5d2=
9f666332bb056d0e2951e9de989aa1dc016075f009db3f2f628e0cdda8c","src/unix/linu=
x_like/linux/musl/b64/mod.rs":"884243eb5af7df963d858d5baf47e622b45f04e0ae70=
1728b134e986191b614b","src/unix/linux_like/linux/musl/b64/powerpc64.rs":"e7=
7f4cf5d65320023043e4354725397f6b079c1b7b6b3cef2c3293350b46b303","src/unix/l=
inux_like/linux/musl/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111be=
b3a22e58803f99cd37543efe86621b119","src/unix/linux_like/linux/musl/b64/risc=
v64/mod.rs":"a80b1813148dec8bc396c02638978c0b4e5e040edafd56d98f8683fe2ae51a=
b5","src/unix/linux_like/linux/musl/b64/s390x.rs":"80a92e54e47016d051c7bd55=
bee9580cbedd298164199d71a67d49167e744432","src/unix/linux_like/linux/musl/b=
64/x86_64/align.rs":"77309276ad7a42cbe59ca381f23590b7a143aded05555b34a5b307=
b808cbca6e","src/unix/linux_like/linux/musl/b64/x86_64/mod.rs":"032863c74d3=
ca73cb75483218f9bd774ae1ae7d3646d2ffb21e4cc7d4b5e0e3d","src/unix/linux_like=
/linux/musl/lfs64.rs":"3e4fb381f3a0756520bde0f1692d4fa45e4ae8133bf7d7c64b0e=
3fdd512f235f","src/unix/linux_like/linux/musl/mod.rs":"f79e4d7bef14f422c6a7=
7f1573ff503a82305bfa5ac3e4c6f571c09212b75620","src/unix/linux_like/linux/no=
_align.rs":"1a754a4af299894a79835aa092d8322d301179e2b20609defd6bb4bc880e6b4=
a","src/unix/linux_like/linux/non_exhaustive.rs":"181a05bf94fdb911db83ce793=
b993bd6548a4115b306a7ef3c10f745a8fea3e9","src/unix/linux_like/linux/uclibc/=
align.rs":"9ed16138d8e439bd90930845a65eafa7ebd67366e6bf633936d44014f6e4c959=
","src/unix/linux_like/linux/uclibc/arm/align.rs":"e4a3c27fe20a57b8d612c34c=
b05bc70646edb5cec7251957315afa53a7b9f936","src/unix/linux_like/linux/uclibc=
/arm/mod.rs":"50288ff9e411ab0966da24838f2c2a5618021bc19c422a04f577b2979ef40=
81e","src/unix/linux_like/linux/uclibc/arm/no_align.rs":"9cd223135de7531584=
0ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/linux_like/linux/=
uclibc/mips/mips32/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251=
957315afa53a7b9f936","src/unix/linux_like/linux/uclibc/mips/mips32/mod.rs":=
"d0c4434e2bf813372c418a8f516c706cdccc9f7be2f0921b2207b0afdb66fe81","src/uni=
x/linux_like/linux/uclibc/mips/mips32/no_align.rs":"9cd223135de75315840ff9c=
3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/linux_like/linux/uclib=
c/mips/mips64/align.rs":"a7bdcb18a37a2d91e64d5fad83ea3edc78f5412adb28f77ab0=
77dbb26dd08b2d","src/unix/linux_like/linux/uclibc/mips/mips64/mod.rs":"3f38=
ee6a4690b9d7594be20d216467a34d955f7653c2c8ce1e6147daeb53f1e0","src/unix/lin=
ux_like/linux/uclibc/mips/mips64/no_align.rs":"4a18e3875698c85229599225ac34=
01a2a40da87e77b2ad4ef47c6fcd5a24ed30","src/unix/linux_like/linux/uclibc/mip=
s/mod.rs":"a048fce1c2d9b1ad57305642e8ad05ca0f0c7e4753267a2e2d6b4fee5db3b072=
","src/unix/linux_like/linux/uclibc/mod.rs":"1c3d25cddcfefa2bd17bdc81550826=
be31a08eef235e13f825f169a5029c8bca","src/unix/linux_like/linux/uclibc/no_al=
ign.rs":"3f28637046524618adaa1012e26cb7ffe94b9396e6b518cccdc69d59f274d709",=
"src/unix/linux_like/linux/uclibc/x86_64/l4re.rs":"024eba5753e852dbdd212427=
351affe7e83f9916c1864bce414d7aa2618f192e","src/unix/linux_like/linux/uclibc=
/x86_64/mod.rs":"196d03affbefb85716937c15904831e731eb222ee906e05e42102d639a=
8152ea","src/unix/linux_like/linux/uclibc/x86_64/other.rs":"42c3f71e58cabba=
373f6a55a623f3c31b85049eb64824c09c2b082b3b2d6a0a8","src/unix/linux_like/mod=
=2Ers":"45c98e7a0fad03b03c4c76f11a80e2423873f0a6563e35c60309a29b2c8ff44f","=
src/unix/mod.rs":"dd4ce377ba9517182e718848739a5c3f58cdbbcd4ee467eef9aaf8df5=
aed5053","src/unix/newlib/aarch64/mod.rs":"bac93836a9a57b2c710f32f852e92a4d=
11ad6759ab0fb6ad33e71d60e53278af","src/unix/newlib/align.rs":"28aaf87fafbc6=
b312622719d472d8cf65f9e5467d15339df5f73e66d8502b28a","src/unix/newlib/arm/m=
od.rs":"cbba6b3e957eceb496806e60de8725a23ff3fa0015983b4b4fa27b233732b526","=
src/unix/newlib/espidf/mod.rs":"816f235f4aa4baabba7f2606b31d0fdb03988c52194=
c966728de8690bf17299d","src/unix/newlib/generic.rs":"eab066d9f0a0f3eb53cc10=
73d01496bba0110989e1f6a59838afd19f870cd599","src/unix/newlib/horizon/mod.rs=
":"7cc5cc120437421db139bfa6a90b18168cd3070bdd0f5be96d40fe4c996f3ca1","src/u=
nix/newlib/mod.rs":"9e36de3fd78e10cb6b9a59dc5ebe5a1b44a63ccb91433bb33653fb3=
0d0c303c6","src/unix/newlib/no_align.rs":"e0743b2179495a9514bc3a4d1781e4928=
78c4ec834ee0085d0891dd1712e82fb","src/unix/newlib/powerpc/mod.rs":"0202ffd5=
7caf75b6afa2c9717750ffb96e375ac33df0ae9609a3f831be393b67","src/unix/newlib/=
vita/mod.rs":"68e0ce186b44e0b3031eb824710e7454dc2a9df98db98120840c3c6f4d885=
871","src/unix/no_align.rs":"c06e95373b9088266e0b14bba0954eef95f93fb2b01d95=
1855e382d22de78e53","src/unix/nto/aarch64.rs":"4709c9afdc8d583be876598e7c23=
8499ee3e8da5bd2baa614d9c7dd414851555","src/unix/nto/mod.rs":"59ab89a8fb6e0a=
6d22fa968ed4873c2bafa19a0f60a90c9a5148816cb7440889","src/unix/nto/neutrino.=
rs":"799bff4ab01a6424db6c5a2b76aa5679826d41495f9d13c63485bf13bc80026b","src=
/unix/nto/x86_64.rs":"a3e18e93c2999da1cd7a6f748a4b60c07aefb73d8ea2aafec19a8=
4cfb040bc8e","src/unix/redox/mod.rs":"73658b0d28c82a122875aa2b45c489834f4de=
58c378add7932bbaf3ffb2ae789","src/unix/solarish/compat.rs":"00f1ee3faec9da6=
9204e42f025f6735dd13d894071a154425dcc43ecbdd06e7f","src/unix/solarish/illum=
os.rs":"cd93c2d84722bbf9933a92842a8998eb0b2afc962f50bc2546ad127b82809fa7","=
src/unix/solarish/mod.rs":"55ce4624745e31ad226b47fde177a46176a89da3fa503066=
3673a115102471f9","src/unix/solarish/solaris.rs":"41b350a89ddf01cd12a10f936=
40f92be53be0b0d976021cdc08da17bf3e72edf","src/unix/solarish/x86.rs":"e86e80=
6df0caed72765040eaa2f3c883198d1aa91508540adf9b7008c77f522e","src/unix/solar=
ish/x86_64.rs":"ec2b01f194eb8a6a27133c57681da195a949e03098f3ea1e847227a9c09=
ef5fc","src/unix/solarish/x86_common.rs":"ac869d9c3c95645c22460468391eb1982=
023c3a8e02b9e06a72e3aef3d5f1eac","src/vxworks/aarch64.rs":"98f0afdc511cd025=
57e506c21fed6737585490a1dce7a9d4941d08c437762b99","src/vxworks/arm.rs":"acb=
7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788e88","src/vxworks=
/mod.rs":"e4edcbcf43a325e738c9465507594d0c87abf3f0e2b9b046c1425f8d44bdad0f"=
,"src/vxworks/powerpc.rs":"acb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef708=
4777cb181d788e88","src/vxworks/powerpc64.rs":"98f0afdc511cd02557e506c21fed6=
737585490a1dce7a9d4941d08c437762b99","src/vxworks/x86.rs":"552f007f38317620=
b23889cb7c49d1d115841252439060122f52f434fbc6e5ba","src/vxworks/x86_64.rs":"=
018d92be3ad628a129eff9f2f5dfbc0883d8b8e5f2fa917b900a7f98ed6b514a","src/wasi=
=2Ers":"09ee3b3348b212b050f6ca8ae008a28679ea44a375674307a4e7c9ca0d3ed7d5","=
src/windows/gnu/align.rs":"b2c13ec1b9f3b39a75c452c80c951dff9d0215e31d77e883=
b4502afb31794647","src/windows/gnu/mod.rs":"3c8c7edb7cdf5d0c44af936db2a9486=
9585c69dfabeef30571b4f4e38375767a","src/windows/mod.rs":"a9a95e9ebc0102c334=
650607351d4d4dbaff0eaf7730eed1c8020d20e9bbebfd","src/windows/msvc/mod.rs":"=
c068271e00fca6b62bc4bf44bcf142cfc38caeded9b6c4e01d1ceef3ccf986f4","src/xous=
=2Ers":"eb0675f25ba01f73072d2b70907fb8abb1148facefe5a20756c49250f3d65fae","=
tests/const_fn.rs":"cb75a1f0864f926aebe79118fc34d51a0d1ade2c20a394e7774c7e5=
45f21f1f4"},"package":"b4668fb0ea861c1df094127ac5f1da3409a82116a4ba74fca2e5=
8ef927159bb3"}
> -\ No newline at end of file
> -+{"files":{"CONTRIBUTING.md":"bdc90b52cf803faac96e594069a86dd8ea150d5ba7=
fb3e6cadfc08dac4c7b0ce","Cargo.toml":"a1d4350481d43c600687f1921083036db242f=
3a9e5bc9906d4d469fdfe588d48","LICENSE-APACHE":"62c7a1e35f56406896d7aa7ca52d=
0cc0d272ac022b5d2796e7d6905db8a3636a","LICENSE-MIT":"a8d47ff51ca256f56a8932=
dba07660672dbfe3004257ca8de708aac1415937a1","README.md":"ecc47e284f8d007fc0=
48666d5108dd41cdc440ab9eedfe8c47d1634613522787","build.rs":"5bd78d7e4e79b18=
3fb1dab92cd640a611330131d54c479c69adbe87cbdc95ae3","rustfmt.toml":"eaa2ea84=
fc1ba0359b77680804903e07bb38d257ab11986b95b158e460f787b2","src/fixed_width_=
ints.rs":"7f986e5f5e68d25ef04d386fd2f640e8be8f15427a8d4a458ea01d26b8dca0ca"=
,"src/fuchsia/aarch64.rs":"893fcec48142d273063ffd814dca33fbec92205fd39ada97=
075f85201d803996","src/fuchsia/align.rs":"ae1cf8f011a99737eabeb14ffff768e60=
f13b13363d7646744dbb0f443dab3d6","src/fuchsia/mod.rs":"30f4dc83ef120300d618=
96696512436377c5f36f1431d98ab7e01e498c0c47d5","src/fuchsia/no_align.rs":"30=
3f3f1b255e0088b5715094353cf00476131d8e94e6aebb3f469557771c8b8a","src/fuchsi=
a/riscv64.rs":"617cd75e79e0e20f664db764a4dc2a396d9fd11a4d95371acd91ed481129=
3b11","src/fuchsia/x86_64.rs":"93a3632b5cf67d2a6bcb7dc0a558605252d5fe689e0f=
38d8aa2ec5852255ac87","src/hermit/aarch64.rs":"86048676e335944c37a63d0083d0=
f368ae10ceccefeed9debb3bbe08777fc682","src/hermit/mod.rs":"d3bfce41e4463d4b=
e8020a2d063c9bfa8b665f45f1cc6cbf3163f5d01e7cb21f","src/hermit/x86_64.rs":"a=
b832b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/lib.r=
s":"24111461547739f3646f95bcb66c43f2ae679a727ff5938299434c522c02e458","src/=
macros.rs":"b457eb028b8e8ab3c24bb7292b874ad4e491edbb83594f6a3da024df5348c08=
8","src/psp.rs":"dd31aabd46171d474ec5828372e28588935120e7355c90c105360d8fa9=
264c1c","src/sgx.rs":"16a95cdefc81c5ee00d8353a60db363c4cc3e0f75abcd5d014472=
3f2a306ed1b","src/solid/aarch64.rs":"a726e47f324adf73a4a0b67a2c183408d0cad1=
05ae66acf36db37a42ab7f8707","src/solid/arm.rs":"e39a4f74ebbef3b97b8c95758ad=
741123d84ed3eb48d9cf4f1f4872097fc27fe","src/solid/mod.rs":"5f4151dca5132e4b=
4e4c23ab9737e12856dddbdc0ca3f7dbc004328ef3c8acde","src/switch.rs":"9da3dd39=
b3de45a7928789926e8572d00e1e11a39e6f7289a1349aadce90edba","src/unix/aix/mod=
=2Ers":"54229b5e774669c16912112e8b50fa938db76f534971222a11723a05195a0948","=
src/unix/aix/powerpc64.rs":"cf374d81139d45f9d77c6a764f640bfbf7e0a5903689652=
c8296f8e10d55169b","src/unix/align.rs":"2cdc7c826ef7ae61f5171c5ae8c445a743d=
86f1a7f2d9d7e4ceeec56d6874f65","src/unix/bsd/apple/b32/align.rs":"ec833a747=
866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/appl=
e/b32/mod.rs":"2546ad3eb6aecb95f916648bc63264117c92b4b4859532b34cb011e4c75a=
5a72","src/unix/bsd/apple/b64/aarch64/align.rs":"e8eb38d064b5fefec6f37d4287=
3820a0483e7c758ed336cc59a7155455ca89c9","src/unix/bsd/apple/b64/aarch64/mod=
=2Ers":"44c217a4f263afe7a97435de9323d20a96c37836f899ca0925306d4b7e073c27","=
src/unix/bsd/apple/b64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf=
4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b64/mod.rs":"f5e278a1af7fb3588=
91d1c9be4eb7e815aaca0c5cb738d0c3604ba2208a856f7","src/unix/bsd/apple/b64/x8=
6_64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b=
0e26c","src/unix/bsd/apple/b64/x86_64/mod.rs":"8c87c5855038aae5d433c8f5eb3b=
29b0a175879a0245342b3bfd83bdf4cfd936","src/unix/bsd/apple/long_array.rs":"3=
cf1f19b812e6d093c819dc65ce55b13491963e0780eda0d0bd1577603e81948","src/unix/=
bsd/apple/mod.rs":"a6662488273ffff2a097403281db6b5f4cd1a325f7a1582264bb8da0=
b553a822","src/unix/bsd/freebsdlike/dragonfly/errno.rs":"8295b8bb0dfd38d2cd=
b4d9192cdeeb534cc6c3b208170e64615fa3e0edb3e578","src/unix/bsd/freebsdlike/d=
ragonfly/mod.rs":"f2e78625fe1eb14f43e730a3987eba888cb8ac04c23008e7c2d2f7c72=
258b9e6","src/unix/bsd/freebsdlike/freebsd/aarch64.rs":"6c8e216385f53a4bf5f=
171749b57602fc34a4e4b160a44ca31c058cb0c8a2126","src/unix/bsd/freebsdlike/fr=
eebsd/arm.rs":"59d6a670eea562fb87686e243e0a84603d29a2028a3d4b3f99ccc01bd04d=
2f47","src/unix/bsd/freebsdlike/freebsd/freebsd11/b64.rs":"9808d152c1196aa6=
47f1b0f0cf84dac8c930da7d7f897a44975545e3d9d17681","src/unix/bsd/freebsdlike=
/freebsd/freebsd11/mod.rs":"e243ae0e89623d4fa9f85afe14369cc5fd5f2028ea71577=
3dbec722ba80dac1f","src/unix/bsd/freebsdlike/freebsd/freebsd12/b64.rs":"61c=
be45f8499bedb168106b686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bs=
d/freebsdlike/freebsd/freebsd12/mod.rs":"bef9fae288a4f29e941ea369be1cd20b17=
0040e60665a4d49a4a9e79009b72d8","src/unix/bsd/freebsdlike/freebsd/freebsd12=
/x86_64.rs":"2df36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd0=
52","src/unix/bsd/freebsdlike/freebsd/freebsd13/b64.rs":"61cbe45f8499bedb16=
8106b686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/f=
reebsd/freebsd13/mod.rs":"3c514e037694ce22724abb3c9c4687defda7f0e3456b615ca=
73593e860e38b16","src/unix/bsd/freebsdlike/freebsd/freebsd13/x86_64.rs":"2d=
f36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/b=
sd/freebsdlike/freebsd/freebsd14/b64.rs":"61cbe45f8499bedb168106b686d4f8239=
472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd1=
4/mod.rs":"318abe48bfdd1c74ecd6afbd6c9329c5c72ce4f7d420edd6be2fc12b223ae32f=
","src/unix/bsd/freebsdlike/freebsd/freebsd14/x86_64.rs":"e7b5863e222d6cc41=
6b6b0fbe71690fad909e899b4c4ae810bbca117e4fcb650","src/unix/bsd/freebsdlike/=
freebsd/mod.rs":"4c3cd57aaf7fbce072e28e0d2d285b5fda9702e924561d2fd01e49e6ee=
186a98","src/unix/bsd/freebsdlike/freebsd/powerpc.rs":"9ca3f82f88974e6db556=
9f2d76a5a3749b248a31747a6c0da5820492bdfeca42","src/unix/bsd/freebsdlike/fre=
ebsd/powerpc64.rs":"2dae3ecc87eac3b11657aa98915def55fc4b5c0de11fe26aae23329=
a54628a9a","src/unix/bsd/freebsdlike/freebsd/riscv64.rs":"fa4bed4c58cad24ba=
3395941c7fa6b11e089551a04714f9561078e400f5b2b62","src/unix/bsd/freebsdlike/=
freebsd/x86.rs":"6766e2ce85e187b306cd3b0b8d7e15b8f4042c5cff81d89b3af69ecc99=
c70ab0","src/unix/bsd/freebsdlike/freebsd/x86_64/align.rs":"0e1f69a88fca1c3=
2874b1daf5db3d446fefbe518dca497f096cc9168c39dde70","src/unix/bsd/freebsdlik=
e/freebsd/x86_64/mod.rs":"51e4dd0c8ae247bb652feda5adad9333ea3bb30c750c3a393=
5e0b0e47d7803eb","src/unix/bsd/freebsdlike/mod.rs":"0eacafac87fb3a32ef1b859=
80fece2792e70eba9856af18a7407cc35be68ea57","src/unix/bsd/mod.rs":"dad51a24a=
524e92bfe9de3ac3b7d394d86058b9b8a1ccd4efa9bbb5c78e7fa1a","src/unix/bsd/netb=
sdlike/mod.rs":"0a66f7de43710e35a6a546e6c39066aa8b91a6efadb71db88738b0a577f=
d5537","src/unix/bsd/netbsdlike/netbsd/aarch64.rs":"65dcb58d11e8d8028401a9d=
07ca3eb4cb4f053e04249cc877353449d84ccc4cb","src/unix/bsd/netbsdlike/netbsd/=
arm.rs":"58cdbb70b0d6f536551f0f3bb3725d2d75c4690db12c26c034e7d6ec4a924452",=
"src/unix/bsd/netbsdlike/netbsd/mod.rs":"90dd33ef20dc3be8aef5bd152a6a06e7ab=
34f9527b3978487b593aaa16a907bd","src/unix/bsd/netbsdlike/netbsd/powerpc.rs"=
:"ee7ff5d89d0ed22f531237b5059aa669df93a3b5c489fa641465ace8d405bf41","src/un=
ix/bsd/netbsdlike/netbsd/sparc64.rs":"9489f4b3e4566f43bb12dfb92238960613dac=
7f6a45cc13068a8d152b902d7d9","src/unix/bsd/netbsdlike/netbsd/x86.rs":"20692=
320e36bfe028d1a34d16fe12ca77aa909cb02bda167376f98f1a09aefe7","src/unix/bsd/=
netbsdlike/netbsd/x86_64.rs":"1afe5ef46b14397cdd68664b5b232e4f5b035b6db1d4c=
f411c899d51ebca9f30","src/unix/bsd/netbsdlike/openbsd/aarch64.rs":"dd91931d=
373b7ecaf6e2de25adadee10d16fa9b12c2cbacdff3eb291e1ba36af","src/unix/bsd/net=
bsdlike/openbsd/arm.rs":"01580d261bc6447bb327a0d982181b7bdabfa066cee65a3037=
3d3ced729ad307","src/unix/bsd/netbsdlike/openbsd/mips64.rs":"8532a189ae10c7=
d668d9d4065da8b05d124e09bd39442c9f74a7f231c43eca48","src/unix/bsd/netbsdlik=
e/openbsd/mod.rs":"892e0b409ced2dfd81d98cbe9630eb83979c1668d323b304a91be13a=
a711d5db","src/unix/bsd/netbsdlike/openbsd/powerpc.rs":"01580d261bc6447bb32=
7a0d982181b7bdabfa066cee65a30373d3ced729ad307","src/unix/bsd/netbsdlike/ope=
nbsd/powerpc64.rs":"1dd5449dd1fd3d51e30ffdeeaece91d0aaf05c710e0ac699fecc546=
1cfa2c28e","src/unix/bsd/netbsdlike/openbsd/riscv64.rs":"1dd5449dd1fd3d51e3=
0ffdeeaece91d0aaf05c710e0ac699fecc5461cfa2c28e","src/unix/bsd/netbsdlike/op=
enbsd/sparc64.rs":"d04fd287afbaa2c5df9d48c94e8374a532a3ba491b424ddf018270c7=
312f4085","src/unix/bsd/netbsdlike/openbsd/x86.rs":"6f7f5c4fde2a2259eb54789=
0cbd86570cea04ef85347d7569e94e679448bec87","src/unix/bsd/netbsdlike/openbsd=
/x86_64.rs":"d31db31630289c85af3339dbe357998a21ca584cbae31607448fe2cf7675a4=
e1","src/unix/haiku/b32.rs":"a2efdbf7158a6da341e1db9176b0ab193ba88b44961623=
9ed95dced11f54d87b","src/unix/haiku/b64.rs":"ff8115367d3d7d354f792d6176dfaa=
a26353f57056197b563bf4681f91ff7985","src/unix/haiku/mod.rs":"d7ec086b73db4f=
72799179627aa6330a513dcf786b06e19c75ff884d1235948e","src/unix/haiku/native.=
rs":"dbfcbf4954a79d1df2ff58e0590bbcb8c57dfc7a32392aa73ee4726b66bd6cc8","src=
/unix/haiku/x86_64.rs":"3ec3aeeb7ed208b8916f3e32d42bfd085ff5e16936a1a35d9a5=
2789f043b7237","src/unix/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f3=
68ae10ceccefeed9debb3bbe08777fc682","src/unix/hermit/mod.rs":"a1494a0bddf30=
1cceb0d9b8529a84b5882fe855ceae77a1c4e8d6034e705e26c","src/unix/hermit/x86_6=
4.rs":"ab832b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","s=
rc/unix/linux_like/android/b32/arm.rs":"ce582de7e983a33d3bfad13075c53aac901=
6cee35f06ad8653ee9072c3ec2564","src/unix/linux_like/android/b32/mod.rs":"7c=
173e0375119bf06a3081652faede95e5bcd6858e7576b7533d037978737c8f","src/unix/l=
inux_like/android/b32/x86/align.rs":"812914e4241df82e32b12375ca3374615dc3a4=
bdd4cf31f0423c5815320c0dab","src/unix/linux_like/android/b32/x86/mod.rs":"e=
6d107efbcd37b5b85dfa18f683300cbf768ffa0237997a9fa52b184a53323ac","src/unix/=
linux_like/android/b64/aarch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3=
ee2faf6fcae3770f9e505cddca35c7b","src/unix/linux_like/android/b64/aarch64/i=
nt128.rs":"1735f6f5c56770d20dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de=
","src/unix/linux_like/android/b64/aarch64/mod.rs":"171f8c37a2d2e45065bd354=
7dfcec70b02aa3da34cd99d259d150c753f620846","src/unix/linux_like/android/b64=
/mod.rs":"71e4fcbe952bfa4a5f9022f3972e906917b38f729b9d8ef57cd5d179104894ac"=
,"src/unix/linux_like/android/b64/riscv64/align.rs":"0bf138f84e5327d8339bcd=
4adf071a6832b516445e597552c82bbd881095e3a8","src/unix/linux_like/android/b6=
4/riscv64/mod.rs":"19d4bf2237c47127eba9144e0b82e995bc079315e719179a91813b0a=
e7b0e49d","src/unix/linux_like/android/b64/x86_64/align.rs":"7169d07a9fd471=
6f7512719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/an=
droid/b64/x86_64/mod.rs":"4ec2de11a9b65c4325b7b991f0b99a414975e0e61ba8668ca=
ca5d921e9b314d1","src/unix/linux_like/android/mod.rs":"fe4c4015cdafc40b5376=
19c9325168f519249ee5acc00cc43b9f0aa5fb95f331","src/unix/linux_like/emscript=
en/align.rs":"86c95cbed7a7161b1f23ee06843e7b0e2340ad92b2cb86fe2a8ef3e0e8c36=
216","src/unix/linux_like/emscripten/mod.rs":"712c52856ee323b8057b9452e4ab4=
84a0e652581a530b67c3db25e819919d718","src/unix/linux_like/emscripten/no_ali=
gn.rs":"0128e4aa721a9902754828b61b5ec7d8a86619983ed1e0544a85d35b1051fad6","=
src/unix/linux_like/linux/align.rs":"87401c80ff504def5cd4309a53a63fdd481642=
980b9daaa7fee0164a807c2c61","src/unix/linux_like/linux/arch/generic/mod.rs"=
:"778742250aa456cb94efe67a4f8d0213827d90ab74eb5074f9afb9a30e6ea71c","src/un=
ix/linux_like/linux/arch/mips/mod.rs":"60ace1dd76aa88d6b3b5e52fef4bec7881d4=
52780dfff635474067b512e03df1","src/unix/linux_like/linux/arch/mod.rs":"466a=
29622e47c6c7f1500682b2eb17f5566dd81b322cd6348f0fdd355cec593a","src/unix/lin=
ux_like/linux/arch/powerpc/mod.rs":"bef6b7af9e5e2b4e5545c9c7e3e23a8b743277a=
0ed95853e7eddc38e44299f02","src/unix/linux_like/linux/arch/sparc/mod.rs":"9=
1593ec0440f1dd8f8e612028f432c44c14089286e2aca50e10511ab942db8c3","src/unix/=
linux_like/linux/gnu/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec72=
51957315afa53a7b9f936","src/unix/linux_like/linux/gnu/b32/arm/align.rs":"6e=
c0eb3ee93f7ae99fd714b4deabfb5e97fbcefd8c26f5a45fb8e7150899cdeb","src/unix/l=
inux_like/linux/gnu/b32/arm/mod.rs":"9ab3e97b579a9122690cd01026e14528862860=
346b700aafbb755a7e04054f7f","src/unix/linux_like/linux/gnu/b32/m68k/align.r=
s":"8faa92f77a9232c035418d45331774e64a9a841d99c91791570a203bf2b45bcb","src/=
unix/linux_like/linux/gnu/b32/m68k/mod.rs":"6aab7f1b864e9691d14aa7d389f717c=
4077b8eed72a7f11e3b8c7fef245e4046","src/unix/linux_like/linux/gnu/b32/mips/=
align.rs":"429fb5e005cb7143602d430098b6ebfb7d360685b194f333dfd587472ae954ee=
","src/unix/linux_like/linux/gnu/b32/mips/mod.rs":"6b9a5dac6f937ddc1453e808=
e3c43502c87143332df9e43ac64fb8b1eda6c116","src/unix/linux_like/linux/gnu/b3=
2/mod.rs":"caade9dc8b7179711102da342819bdf330c42c796b4587d0ed419550dab2e9ad=
","src/unix/linux_like/linux/gnu/b32/powerpc.rs":"5c5d90326b54b57b98eff4745=
fe7a3fb02f053b2dc782241a73e807b491936a3","src/unix/linux_like/linux/gnu/b32=
/riscv32/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd37543efe=
86621b119","src/unix/linux_like/linux/gnu/b32/riscv32/mod.rs":"491a9a97cf71=
2985b75d3ad714691ef60898d88c78bc386a6917de0a6774cc26","src/unix/linux_like/=
linux/gnu/b32/sparc/align.rs":"21adbed27df73e2d1ed934aaf733a643003d7baf2bde=
9c48ea440895bcca6d41","src/unix/linux_like/linux/gnu/b32/sparc/mod.rs":"808=
94eece66e9348f45d1b07ad37c757ea694bbd10ed49d3f920b34e9f51a9a3","src/unix/li=
nux_like/linux/gnu/b32/x86/align.rs":"e4bafdc4a519a7922a81b37a62bbfd1177a2f=
620890eef8f1fbc47162e9eb413","src/unix/linux_like/linux/gnu/b32/x86/mod.rs"=
:"c703cc5e9de2dc31d9e5831bfb6f354d6e3518b2ae02263f68a9a70f1c0167e2","src/un=
ix/linux_like/linux/gnu/b64/aarch64/align.rs":"ea39d5fd8ca5a71314127d1e1f54=
2bca34ac566eac9a95662076d91ea4bee548","src/unix/linux_like/linux/gnu/b64/aa=
rch64/ilp32.rs":"bf4611b737813deef6787babf6c01698605f3b75482269b8546318667b=
c68e29","src/unix/linux_like/linux/gnu/b64/aarch64/int128.rs":"1735f6f5c567=
70d20dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/=
linux/gnu/b64/aarch64/lp64.rs":"11a950697fdda0258c6e37c6b13993348c8de413410=
5ed4faa79358e53175072","src/unix/linux_like/linux/gnu/b64/aarch64/mod.rs":"=
d7be998105fc2f6248b7fdfcedb5a0519122d28625fcfd5dccf72617fb30c45e","src/unix=
/linux_like/linux/gnu/b64/loongarch64/align.rs":"060aa33cc737966c691aab8511=
c5c5729e551458ce18d0e284e0d45f39beeb60","src/unix/linux_like/linux/gnu/b64/=
loongarch64/mod.rs":"18edada8aa5d4127d9aa1bd81c62b5a4209f1efd8b2b2631e801c9=
e855ab1480","src/unix/linux_like/linux/gnu/b64/mips64/align.rs":"7169d07a9f=
d4716f7512719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_lik=
e/linux/gnu/b64/mips64/mod.rs":"628c410b9aaec3c8f43838a28616b577a1d6de60a97=
99b09bb884d80281f96eb","src/unix/linux_like/linux/gnu/b64/mod.rs":"3c6555f3=
0a7a8852757b31a542ea73fb6a16a6e27e838397e819278ad56e57a4","src/unix/linux_l=
ike/linux/gnu/b64/powerpc64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78=
a468cc1dc9df83f002f1268130d9","src/unix/linux_like/linux/gnu/b64/powerpc64/=
mod.rs":"c778a136f06c2ffeacea19fa14ce79b828f91b67a002dec5ce87289bae36234e",=
"src/unix/linux_like/linux/gnu/b64/riscv64/align.rs":"d321491612be8d5c61b6e=
c2dc0111beb3a22e58803f99cd37543efe86621b119","src/unix/linux_like/linux/gnu=
/b64/riscv64/mod.rs":"c8f07efc5ddd5d874f1ebc329cd6907818d132ac3e30f4f2a4b04=
be3fb388551","src/unix/linux_like/linux/gnu/b64/s390x.rs":"a2fd9277c2dcf76f=
7a16a3bcca745d5a9932c765c0dc2feb31c3641be25eb0aa","src/unix/linux_like/linu=
x/gnu/b64/sparc64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9=
df83f002f1268130d9","src/unix/linux_like/linux/gnu/b64/sparc64/mod.rs":"e80=
47e9966a2b90063e0151a0278c54885e7b323286cf5ab55cbaf151fc772d3","src/unix/li=
nux_like/linux/gnu/b64/x86_64/align.rs":"62e822478356db4a73b6bbd1b36d825b89=
3939ab4b308ec11b0578bcc4b49769","src/unix/linux_like/linux/gnu/b64/x86_64/m=
od.rs":"891e595d33714b9883b92f0554d1d361fba2b6c3f6cac09a288252f44c6ec667","=
src/unix/linux_like/linux/gnu/b64/x86_64/not_x32.rs":"38f74ce15d9662ce48188=
15a2b87be1618d5e45f190f7e4db84ff3285b4421fb","src/unix/linux_like/linux/gnu=
/b64/x86_64/x32.rs":"b20218a11364a6dec87f96d6c0d8b19e660697ab09ad5ee0e9b3a9=
dafedaaebb","src/unix/linux_like/linux/gnu/mod.rs":"a105e27dac14401935ad2ac=
b60618c0d0c078f65d5bc06c92940d6ab93659b96","src/unix/linux_like/linux/gnu/n=
o_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db=
25","src/unix/linux_like/linux/mod.rs":"657a86280094d5ce31e1f85d116c95637cb=
994baeb724b78dcbd7684b9be1b96","src/unix/linux_like/linux/musl/b32/arm/alig=
n.rs":"3e8ac052c1043764776b54c93ba4260e061df998631737a897d9d47d54f7b80c","s=
rc/unix/linux_like/linux/musl/b32/arm/mod.rs":"923159f09820a7e3ca2340ef6adb=
4f3779ebfa9320a1f6a41027529d81d5f699","src/unix/linux_like/linux/musl/b32/h=
exagon.rs":"5625a3dfcd8fae8c43e6306172dd0c2f7ace8ce9a43a2c03909aef35d96cdaa=
8","src/unix/linux_like/linux/musl/b32/mips/align.rs":"429fb5e005cb7143602d=
430098b6ebfb7d360685b194f333dfd587472ae954ee","src/unix/linux_like/linux/mu=
sl/b32/mips/mod.rs":"7956dae471300c810f596cb6d6cc122640527c139219cc9f2a8611=
7a4167a941","src/unix/linux_like/linux/musl/b32/mod.rs":"31677597fd9544c4b1=
ec1477628288f6273fabbc06e38f33da862ad55f019ce1","src/unix/linux_like/linux/=
musl/b32/powerpc.rs":"61b2e40db3e86fa077b0bdb0ff64643403680a96029b531ffc16b=
a1977caf880","src/unix/linux_like/linux/musl/b32/riscv32/align.rs":"efd2acc=
f33b87de7c7547903359a5da896edc33cd6c719552c7474b60d4a5d48","src/unix/linux_=
like/linux/musl/b32/riscv32/mod.rs":"7b067c7989a80e35daa9987af799d97dd1fb3d=
f71ef82285137f51fbad2354d9","src/unix/linux_like/linux/musl/b32/x86/align.r=
s":"08e77fbd7435d7dec2ff56932433bece3f02e47ce810f89004a275a86d39cbe1","src/=
unix/linux_like/linux/musl/b32/x86/mod.rs":"aea0853415d103a6580909b35b9f596=
25504f8c52be79a143060e19897b5316e","src/unix/linux_like/linux/musl/b64/aarc=
h64/align.rs":"6ba32725d24d7d8e6aa111f3b57aafa318f83b606abe9656132915182982=
1133","src/unix/linux_like/linux/musl/b64/aarch64/int128.rs":"1735f6f5c5677=
0d20dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/l=
inux/musl/b64/aarch64/mod.rs":"31e75179cbb4e26425b3f5b052e358f593153da66288=
4655e60801d852e55dc2","src/unix/linux_like/linux/musl/b64/mips64.rs":"9a5d2=
9f666332bb056d0e2951e9de989aa1dc016075f009db3f2f628e0cdda8c","src/unix/linu=
x_like/linux/musl/b64/mod.rs":"c349ade36cca16273918124d206493a2f8d0d3ecf359=
b80ae7ec0317c7ee5c98","src/unix/linux_like/linux/musl/b64/powerpc64.rs":"e7=
7f4cf5d65320023043e4354725397f6b079c1b7b6b3cef2c3293350b46b303","src/unix/l=
inux_like/linux/musl/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111be=
b3a22e58803f99cd37543efe86621b119","src/unix/linux_like/linux/musl/b64/risc=
v64/mod.rs":"a80b1813148dec8bc396c02638978c0b4e5e040edafd56d98f8683fe2ae51a=
b5","src/unix/linux_like/linux/musl/b64/s390x.rs":"80a92e54e47016d051c7bd55=
bee9580cbedd298164199d71a67d49167e744432","src/unix/linux_like/linux/musl/b=
64/x86_64/align.rs":"77309276ad7a42cbe59ca381f23590b7a143aded05555b34a5b307=
b808cbca6e","src/unix/linux_like/linux/musl/b64/x86_64/mod.rs":"032863c74d3=
ca73cb75483218f9bd774ae1ae7d3646d2ffb21e4cc7d4b5e0e3d","src/unix/linux_like=
/linux/musl/lfs64.rs":"3e4fb381f3a0756520bde0f1692d4fa45e4ae8133bf7d7c64b0e=
3fdd512f235f","src/unix/linux_like/linux/musl/mod.rs":"137ffaafdb825095f701=
2a7d55487d0a5cda54fd498999f6db0c4b3e82433f8f","src/unix/linux_like/linux/no=
_align.rs":"1a754a4af299894a79835aa092d8322d301179e2b20609defd6bb4bc880e6b4=
a","src/unix/linux_like/linux/non_exhaustive.rs":"181a05bf94fdb911db83ce793=
b993bd6548a4115b306a7ef3c10f745a8fea3e9","src/unix/linux_like/linux/uclibc/=
align.rs":"9ed16138d8e439bd90930845a65eafa7ebd67366e6bf633936d44014f6e4c959=
","src/unix/linux_like/linux/uclibc/arm/align.rs":"e4a3c27fe20a57b8d612c34c=
b05bc70646edb5cec7251957315afa53a7b9f936","src/unix/linux_like/linux/uclibc=
/arm/mod.rs":"50288ff9e411ab0966da24838f2c2a5618021bc19c422a04f577b2979ef40=
81e","src/unix/linux_like/linux/uclibc/arm/no_align.rs":"9cd223135de7531584=
0ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/linux_like/linux/=
uclibc/mips/mips32/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251=
957315afa53a7b9f936","src/unix/linux_like/linux/uclibc/mips/mips32/mod.rs":=
"d0c4434e2bf813372c418a8f516c706cdccc9f7be2f0921b2207b0afdb66fe81","src/uni=
x/linux_like/linux/uclibc/mips/mips32/no_align.rs":"9cd223135de75315840ff9c=
3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/linux_like/linux/uclib=
c/mips/mips64/align.rs":"a7bdcb18a37a2d91e64d5fad83ea3edc78f5412adb28f77ab0=
77dbb26dd08b2d","src/unix/linux_like/linux/uclibc/mips/mips64/mod.rs":"3f38=
ee6a4690b9d7594be20d216467a34d955f7653c2c8ce1e6147daeb53f1e0","src/unix/lin=
ux_like/linux/uclibc/mips/mips64/no_align.rs":"4a18e3875698c85229599225ac34=
01a2a40da87e77b2ad4ef47c6fcd5a24ed30","src/unix/linux_like/linux/uclibc/mip=
s/mod.rs":"a048fce1c2d9b1ad57305642e8ad05ca0f0c7e4753267a2e2d6b4fee5db3b072=
","src/unix/linux_like/linux/uclibc/mod.rs":"1c3d25cddcfefa2bd17bdc81550826=
be31a08eef235e13f825f169a5029c8bca","src/unix/linux_like/linux/uclibc/no_al=
ign.rs":"3f28637046524618adaa1012e26cb7ffe94b9396e6b518cccdc69d59f274d709",=
"src/unix/linux_like/linux/uclibc/x86_64/l4re.rs":"024eba5753e852dbdd212427=
351affe7e83f9916c1864bce414d7aa2618f192e","src/unix/linux_like/linux/uclibc=
/x86_64/mod.rs":"196d03affbefb85716937c15904831e731eb222ee906e05e42102d639a=
8152ea","src/unix/linux_like/linux/uclibc/x86_64/other.rs":"42c3f71e58cabba=
373f6a55a623f3c31b85049eb64824c09c2b082b3b2d6a0a8","src/unix/linux_like/mod=
=2Ers":"45c98e7a0fad03b03c4c76f11a80e2423873f0a6563e35c60309a29b2c8ff44f","=
src/unix/mod.rs":"dd4ce377ba9517182e718848739a5c3f58cdbbcd4ee467eef9aaf8df5=
aed5053","src/unix/newlib/aarch64/mod.rs":"bac93836a9a57b2c710f32f852e92a4d=
11ad6759ab0fb6ad33e71d60e53278af","src/unix/newlib/align.rs":"28aaf87fafbc6=
b312622719d472d8cf65f9e5467d15339df5f73e66d8502b28a","src/unix/newlib/arm/m=
od.rs":"cbba6b3e957eceb496806e60de8725a23ff3fa0015983b4b4fa27b233732b526","=
src/unix/newlib/espidf/mod.rs":"816f235f4aa4baabba7f2606b31d0fdb03988c52194=
c966728de8690bf17299d","src/unix/newlib/generic.rs":"eab066d9f0a0f3eb53cc10=
73d01496bba0110989e1f6a59838afd19f870cd599","src/unix/newlib/horizon/mod.rs=
":"7cc5cc120437421db139bfa6a90b18168cd3070bdd0f5be96d40fe4c996f3ca1","src/u=
nix/newlib/mod.rs":"9e36de3fd78e10cb6b9a59dc5ebe5a1b44a63ccb91433bb33653fb3=
0d0c303c6","src/unix/newlib/no_align.rs":"e0743b2179495a9514bc3a4d1781e4928=
78c4ec834ee0085d0891dd1712e82fb","src/unix/newlib/powerpc/mod.rs":"0202ffd5=
7caf75b6afa2c9717750ffb96e375ac33df0ae9609a3f831be393b67","src/unix/newlib/=
vita/mod.rs":"68e0ce186b44e0b3031eb824710e7454dc2a9df98db98120840c3c6f4d885=
871","src/unix/no_align.rs":"c06e95373b9088266e0b14bba0954eef95f93fb2b01d95=
1855e382d22de78e53","src/unix/nto/aarch64.rs":"4709c9afdc8d583be876598e7c23=
8499ee3e8da5bd2baa614d9c7dd414851555","src/unix/nto/mod.rs":"59ab89a8fb6e0a=
6d22fa968ed4873c2bafa19a0f60a90c9a5148816cb7440889","src/unix/nto/neutrino.=
rs":"799bff4ab01a6424db6c5a2b76aa5679826d41495f9d13c63485bf13bc80026b","src=
/unix/nto/x86_64.rs":"a3e18e93c2999da1cd7a6f748a4b60c07aefb73d8ea2aafec19a8=
4cfb040bc8e","src/unix/redox/mod.rs":"73658b0d28c82a122875aa2b45c489834f4de=
58c378add7932bbaf3ffb2ae789","src/unix/solarish/compat.rs":"00f1ee3faec9da6=
9204e42f025f6735dd13d894071a154425dcc43ecbdd06e7f","src/unix/solarish/illum=
os.rs":"cd93c2d84722bbf9933a92842a8998eb0b2afc962f50bc2546ad127b82809fa7","=
src/unix/solarish/mod.rs":"55ce4624745e31ad226b47fde177a46176a89da3fa503066=
3673a115102471f9","src/unix/solarish/solaris.rs":"41b350a89ddf01cd12a10f936=
40f92be53be0b0d976021cdc08da17bf3e72edf","src/unix/solarish/x86.rs":"e86e80=
6df0caed72765040eaa2f3c883198d1aa91508540adf9b7008c77f522e","src/unix/solar=
ish/x86_64.rs":"ec2b01f194eb8a6a27133c57681da195a949e03098f3ea1e847227a9c09=
ef5fc","src/unix/solarish/x86_common.rs":"ac869d9c3c95645c22460468391eb1982=
023c3a8e02b9e06a72e3aef3d5f1eac","src/vxworks/aarch64.rs":"98f0afdc511cd025=
57e506c21fed6737585490a1dce7a9d4941d08c437762b99","src/vxworks/arm.rs":"acb=
7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788e88","src/vxworks=
/mod.rs":"e4edcbcf43a325e738c9465507594d0c87abf3f0e2b9b046c1425f8d44bdad0f"=
,"src/vxworks/powerpc.rs":"acb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef708=
4777cb181d788e88","src/vxworks/powerpc64.rs":"98f0afdc511cd02557e506c21fed6=
737585490a1dce7a9d4941d08c437762b99","src/vxworks/x86.rs":"552f007f38317620=
b23889cb7c49d1d115841252439060122f52f434fbc6e5ba","src/vxworks/x86_64.rs":"=
018d92be3ad628a129eff9f2f5dfbc0883d8b8e5f2fa917b900a7f98ed6b514a","src/wasi=
=2Ers":"09ee3b3348b212b050f6ca8ae008a28679ea44a375674307a4e7c9ca0d3ed7d5","=
src/windows/gnu/align.rs":"b2c13ec1b9f3b39a75c452c80c951dff9d0215e31d77e883=
b4502afb31794647","src/windows/gnu/mod.rs":"3c8c7edb7cdf5d0c44af936db2a9486=
9585c69dfabeef30571b4f4e38375767a","src/windows/mod.rs":"a9a95e9ebc0102c334=
650607351d4d4dbaff0eaf7730eed1c8020d20e9bbebfd","src/windows/msvc/mod.rs":"=
c068271e00fca6b62bc4bf44bcf142cfc38caeded9b6c4e01d1ceef3ccf986f4","src/xous=
=2Ers":"eb0675f25ba01f73072d2b70907fb8abb1148facefe5a20756c49250f3d65fae","=
tests/const_fn.rs":"cb75a1f0864f926aebe79118fc34d51a0d1ade2c20a394e7774c7e5=
45f21f1f4"},"package":"b4668fb0ea861c1df094127ac5f1da3409a82116a4ba74fca2e5=
8ef927159bb3"}
> -\ No newline at end of file
> diff --git a/meta/recipes-devtools/rust/files/0002-musl-riscv32-Define-F_=
SETLK-F_SETLKW-and-fix-F_GETLK.patch b/meta/recipes-devtools/rust/files/000=
2-musl-riscv32-Define-F_SETLK-F_SETLKW-and-fix-F_GETLK.patch
> new file mode 100644
> index 000000000000..257a83796054
> --- /dev/null
> +++ b/meta/recipes-devtools/rust/files/0002-musl-riscv32-Define-F_SETLK-F=
_SETLKW-and-fix-F_GETLK.patch
> @@ -0,0 +1,41 @@
> +From 36ef860159989c86fbdbb98cbd3827c9a96be6ce Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sat, 8 Apr 2023 08:51:02 -0700
> +Subject: [PATCH 2/5] musl/riscv32: Define F_SETLK, F_SETLKW and fix F_GE=
TLK
> +
> +F_SETLK and F_SETLKW were not defined therefore define them
> +and F_GETLK value was not matching the musl port hence fixed
> +
> +Upstream-Status: Backport [https://github.com/rust-lang/libc/pull/3302/c=
ommits/36ef860159989c86fbdbb98cbd3827c9a96be6ce]
> +Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> +---
> + src/unix/linux_like/linux/musl/b32/riscv32/mod.rs | 6 ++++--
> + 1 file changed, 4 insertions(+), 2 deletions(-)
> +
> +Index: rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/r=
iscv32/mod.rs
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- rustc-1.74.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b32=
/riscv32/mod.rs
> ++++ rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/risc=
v32/mod.rs
> +@@ -323,9 +323,11 @@ pub const POLLWRBAND: ::c_short =3D 512;
> + pub const O_ASYNC: ::c_int =3D 8192;
> + pub const O_NDELAY: ::c_int =3D 2048;
> + pub const EFD_NONBLOCK: ::c_int =3D 2048;
> +-pub const F_GETLK: ::c_int =3D 5;
> +-pub const F_GETOWN: ::c_int =3D 9;
> + pub const F_SETOWN: ::c_int =3D 8;
> ++pub const F_GETOWN: ::c_int =3D 9;
> ++pub const F_GETLK: ::c_int =3D 12;
> ++pub const F_SETLK: ::c_int =3D 13;
> ++pub const F_SETLKW: ::c_int =3D 14;
> + pub const SFD_NONBLOCK: ::c_int =3D 2048;
> + pub const TCSANOW: ::c_int =3D 0;
> + pub const TCSADRAIN: ::c_int =3D 1;
> +Index: rustc-1.74.0-src/vendor/libc/.cargo-checksum.json
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- rustc-1.74.0-src.orig/vendor/libc/.cargo-checksum.json
> ++++ rustc-1.74.0-src/vendor/libc/.cargo-checksum.json
> +@@ -1 +1 @@
> +-{"files":{"CONTRIBUTING.md":"bdc90b52cf803faac96e594069a86dd8ea150d5ba7=
fb3e6cadfc08dac4c7b0ce","Cargo.toml":"a58e58fa9bde015e08609ea2f17e56c5df7c8=
2aa6f3fa1a144c02ee4715227b9","LICENSE-APACHE":"62c7a1e35f56406896d7aa7ca52d=
0cc0d272ac022b5d2796e7d6905db8a3636a","LICENSE-MIT":"a8d47ff51ca256f56a8932=
dba07660672dbfe3004257ca8de708aac1415937a1","README.md":"ecc47e284f8d007fc0=
48666d5108dd41cdc440ab9eedfe8c47d1634613522787","build.rs":"9e94683e94db80e=
8282fce07549cf748d9037852fb06df1c7596bea2ed130d50","rustfmt.toml":"eaa2ea84=
fc1ba0359b77680804903e07bb38d257ab11986b95b158e460f787b2","src/fixed_width_=
ints.rs":"7f986e5f5e68d25ef04d386fd2f640e8be8f15427a8d4a458ea01d26b8dca0ca"=
,"src/fuchsia/aarch64.rs":"893fcec48142d273063ffd814dca33fbec92205fd39ada97=
075f85201d803996","src/fuchsia/align.rs":"ae1cf8f011a99737eabeb14ffff768e60=
f13b13363d7646744dbb0f443dab3d6","src/fuchsia/mod.rs":"30f4dc83ef120300d618=
96696512436377c5f36f1431d98ab7e01e498c0c47d5","src/fuchsia/no_align.rs":"30=
3f3f1b255e0088b5715094353cf00476131d8e94e6aebb3f469557771c8b8a","src/fuchsi=
a/riscv64.rs":"617cd75e79e0e20f664db764a4dc2a396d9fd11a4d95371acd91ed481129=
3b11","src/fuchsia/x86_64.rs":"93a3632b5cf67d2a6bcb7dc0a558605252d5fe689e0f=
38d8aa2ec5852255ac87","src/hermit/aarch64.rs":"86048676e335944c37a63d0083d0=
f368ae10ceccefeed9debb3bbe08777fc682","src/hermit/mod.rs":"d3bfce41e4463d4b=
e8020a2d063c9bfa8b665f45f1cc6cbf3163f5d01e7cb21f","src/hermit/x86_64.rs":"a=
b832b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/lib.r=
s":"24111461547739f3646f95bcb66c43f2ae679a727ff5938299434c522c02e458","src/=
macros.rs":"b457eb028b8e8ab3c24bb7292b874ad4e491edbb83594f6a3da024df5348c08=
8","src/psp.rs":"dd31aabd46171d474ec5828372e28588935120e7355c90c105360d8fa9=
264c1c","src/sgx.rs":"16a95cdefc81c5ee00d8353a60db363c4cc3e0f75abcd5d014472=
3f2a306ed1b","src/solid/aarch64.rs":"a726e47f324adf73a4a0b67a2c183408d0cad1=
05ae66acf36db37a42ab7f8707","src/solid/arm.rs":"e39a4f74ebbef3b97b8c95758ad=
741123d84ed3eb48d9cf4f1f4872097fc27fe","src/solid/mod.rs":"5f4151dca5132e4b=
4e4c23ab9737e12856dddbdc0ca3f7dbc004328ef3c8acde","src/switch.rs":"9da3dd39=
b3de45a7928789926e8572d00e1e11a39e6f7289a1349aadce90edba","src/unix/aix/mod=
=2Ers":"54229b5e774669c16912112e8b50fa938db76f534971222a11723a05195a0948","=
src/unix/aix/powerpc64.rs":"cf374d81139d45f9d77c6a764f640bfbf7e0a5903689652=
c8296f8e10d55169b","src/unix/align.rs":"2cdc7c826ef7ae61f5171c5ae8c445a743d=
86f1a7f2d9d7e4ceeec56d6874f65","src/unix/bsd/apple/b32/align.rs":"ec833a747=
866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/appl=
e/b32/mod.rs":"2546ad3eb6aecb95f916648bc63264117c92b4b4859532b34cb011e4c75a=
5a72","src/unix/bsd/apple/b64/aarch64/align.rs":"2eaf0f561a32bdcbf4e0477c88=
95d5e7bcb5cdebd5fef7b4df2ca8e38e144d94","src/unix/bsd/apple/b64/aarch64/mod=
=2Ers":"44c217a4f263afe7a97435de9323d20a96c37836f899ca0925306d4b7e073c27","=
src/unix/bsd/apple/b64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf=
4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b64/mod.rs":"f5e278a1af7fb3588=
91d1c9be4eb7e815aaca0c5cb738d0c3604ba2208a856f7","src/unix/bsd/apple/b64/x8=
6_64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b=
0e26c","src/unix/bsd/apple/b64/x86_64/mod.rs":"8c87c5855038aae5d433c8f5eb3b=
29b0a175879a0245342b3bfd83bdf4cfd936","src/unix/bsd/apple/long_array.rs":"3=
cf1f19b812e6d093c819dc65ce55b13491963e0780eda0d0bd1577603e81948","src/unix/=
bsd/apple/mod.rs":"0931fd351d585728e6384d7b952b8d816e9acdb9c86c172324445f3c=
33f692ca","src/unix/bsd/freebsdlike/dragonfly/errno.rs":"8295b8bb0dfd38d2cd=
b4d9192cdeeb534cc6c3b208170e64615fa3e0edb3e578","src/unix/bsd/freebsdlike/d=
ragonfly/mod.rs":"f2e78625fe1eb14f43e730a3987eba888cb8ac04c23008e7c2d2f7c72=
258b9e6","src/unix/bsd/freebsdlike/freebsd/aarch64.rs":"6c8e216385f53a4bf5f=
171749b57602fc34a4e4b160a44ca31c058cb0c8a2126","src/unix/bsd/freebsdlike/fr=
eebsd/arm.rs":"59d6a670eea562fb87686e243e0a84603d29a2028a3d4b3f99ccc01bd04d=
2f47","src/unix/bsd/freebsdlike/freebsd/freebsd11/b64.rs":"9808d152c1196aa6=
47f1b0f0cf84dac8c930da7d7f897a44975545e3d9d17681","src/unix/bsd/freebsdlike=
/freebsd/freebsd11/mod.rs":"e243ae0e89623d4fa9f85afe14369cc5fd5f2028ea71577=
3dbec722ba80dac1f","src/unix/bsd/freebsdlike/freebsd/freebsd12/b64.rs":"61c=
be45f8499bedb168106b686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bs=
d/freebsdlike/freebsd/freebsd12/mod.rs":"bef9fae288a4f29e941ea369be1cd20b17=
0040e60665a4d49a4a9e79009b72d8","src/unix/bsd/freebsdlike/freebsd/freebsd12=
/x86_64.rs":"2df36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd0=
52","src/unix/bsd/freebsdlike/freebsd/freebsd13/b64.rs":"61cbe45f8499bedb16=
8106b686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/f=
reebsd/freebsd13/mod.rs":"3c514e037694ce22724abb3c9c4687defda7f0e3456b615ca=
73593e860e38b16","src/unix/bsd/freebsdlike/freebsd/freebsd13/x86_64.rs":"2d=
f36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/b=
sd/freebsdlike/freebsd/freebsd14/b64.rs":"61cbe45f8499bedb168106b686d4f8239=
472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd1=
4/mod.rs":"318abe48bfdd1c74ecd6afbd6c9329c5c72ce4f7d420edd6be2fc12b223ae32f=
","src/unix/bsd/freebsdlike/freebsd/freebsd14/x86_64.rs":"e7b5863e222d6cc41=
6b6b0fbe71690fad909e899b4c4ae810bbca117e4fcb650","src/unix/bsd/freebsdlike/=
freebsd/mod.rs":"4c3cd57aaf7fbce072e28e0d2d285b5fda9702e924561d2fd01e49e6ee=
186a98","src/unix/bsd/freebsdlike/freebsd/powerpc.rs":"9ca3f82f88974e6db556=
9f2d76a5a3749b248a31747a6c0da5820492bdfeca42","src/unix/bsd/freebsdlike/fre=
ebsd/powerpc64.rs":"2dae3ecc87eac3b11657aa98915def55fc4b5c0de11fe26aae23329=
a54628a9a","src/unix/bsd/freebsdlike/freebsd/riscv64.rs":"fa4bed4c58cad24ba=
3395941c7fa6b11e089551a04714f9561078e400f5b2b62","src/unix/bsd/freebsdlike/=
freebsd/x86.rs":"6766e2ce85e187b306cd3b0b8d7e15b8f4042c5cff81d89b3af69ecc99=
c70ab0","src/unix/bsd/freebsdlike/freebsd/x86_64/align.rs":"0e1f69a88fca1c3=
2874b1daf5db3d446fefbe518dca497f096cc9168c39dde70","src/unix/bsd/freebsdlik=
e/freebsd/x86_64/mod.rs":"51e4dd0c8ae247bb652feda5adad9333ea3bb30c750c3a393=
5e0b0e47d7803eb","src/unix/bsd/freebsdlike/mod.rs":"0eacafac87fb3a32ef1b859=
80fece2792e70eba9856af18a7407cc35be68ea57","src/unix/bsd/mod.rs":"dad51a24a=
524e92bfe9de3ac3b7d394d86058b9b8a1ccd4efa9bbb5c78e7fa1a","src/unix/bsd/netb=
sdlike/mod.rs":"0a66f7de43710e35a6a546e6c39066aa8b91a6efadb71db88738b0a577f=
d5537","src/unix/bsd/netbsdlike/netbsd/aarch64.rs":"65dcb58d11e8d8028401a9d=
07ca3eb4cb4f053e04249cc877353449d84ccc4cb","src/unix/bsd/netbsdlike/netbsd/=
arm.rs":"58cdbb70b0d6f536551f0f3bb3725d2d75c4690db12c26c034e7d6ec4a924452",=
"src/unix/bsd/netbsdlike/netbsd/mod.rs":"90dd33ef20dc3be8aef5bd152a6a06e7ab=
34f9527b3978487b593aaa16a907bd","src/unix/bsd/netbsdlike/netbsd/powerpc.rs"=
:"ee7ff5d89d0ed22f531237b5059aa669df93a3b5c489fa641465ace8d405bf41","src/un=
ix/bsd/netbsdlike/netbsd/sparc64.rs":"9489f4b3e4566f43bb12dfb92238960613dac=
7f6a45cc13068a8d152b902d7d9","src/unix/bsd/netbsdlike/netbsd/x86.rs":"20692=
320e36bfe028d1a34d16fe12ca77aa909cb02bda167376f98f1a09aefe7","src/unix/bsd/=
netbsdlike/netbsd/x86_64.rs":"1afe5ef46b14397cdd68664b5b232e4f5b035b6db1d4c=
f411c899d51ebca9f30","src/unix/bsd/netbsdlike/openbsd/aarch64.rs":"dd91931d=
373b7ecaf6e2de25adadee10d16fa9b12c2cbacdff3eb291e1ba36af","src/unix/bsd/net=
bsdlike/openbsd/arm.rs":"01580d261bc6447bb327a0d982181b7bdabfa066cee65a3037=
3d3ced729ad307","src/unix/bsd/netbsdlike/openbsd/mips64.rs":"8532a189ae10c7=
d668d9d4065da8b05d124e09bd39442c9f74a7f231c43eca48","src/unix/bsd/netbsdlik=
e/openbsd/mod.rs":"c27c6673bd3628549083a094219831fd9343129f91067b562781617d=
2a887148","src/unix/bsd/netbsdlike/openbsd/powerpc.rs":"01580d261bc6447bb32=
7a0d982181b7bdabfa066cee65a30373d3ced729ad307","src/unix/bsd/netbsdlike/ope=
nbsd/powerpc64.rs":"1dd5449dd1fd3d51e30ffdeeaece91d0aaf05c710e0ac699fecc546=
1cfa2c28e","src/unix/bsd/netbsdlike/openbsd/riscv64.rs":"1dd5449dd1fd3d51e3=
0ffdeeaece91d0aaf05c710e0ac699fecc5461cfa2c28e","src/unix/bsd/netbsdlike/op=
enbsd/sparc64.rs":"d04fd287afbaa2c5df9d48c94e8374a532a3ba491b424ddf018270c7=
312f4085","src/unix/bsd/netbsdlike/openbsd/x86.rs":"6f7f5c4fde2a2259eb54789=
0cbd86570cea04ef85347d7569e94e679448bec87","src/unix/bsd/netbsdlike/openbsd=
/x86_64.rs":"d31db31630289c85af3339dbe357998a21ca584cbae31607448fe2cf7675a4=
e1","src/unix/haiku/b32.rs":"a2efdbf7158a6da341e1db9176b0ab193ba88b44961623=
9ed95dced11f54d87b","src/unix/haiku/b64.rs":"ff8115367d3d7d354f792d6176dfaa=
a26353f57056197b563bf4681f91ff7985","src/unix/haiku/mod.rs":"d7ec086b73db4f=
72799179627aa6330a513dcf786b06e19c75ff884d1235948e","src/unix/haiku/native.=
rs":"dbfcbf4954a79d1df2ff58e0590bbcb8c57dfc7a32392aa73ee4726b66bd6cc8","src=
/unix/haiku/x86_64.rs":"3ec3aeeb7ed208b8916f3e32d42bfd085ff5e16936a1a35d9a5=
2789f043b7237","src/unix/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f3=
68ae10ceccefeed9debb3bbe08777fc682","src/unix/hermit/mod.rs":"a1494a0bddf30=
1cceb0d9b8529a84b5882fe855ceae77a1c4e8d6034e705e26c","src/unix/hermit/x86_6=
4.rs":"ab832b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","s=
rc/unix/linux_like/android/b32/arm.rs":"ce582de7e983a33d3bfad13075c53aac901=
6cee35f06ad8653ee9072c3ec2564","src/unix/linux_like/android/b32/mod.rs":"7c=
173e0375119bf06a3081652faede95e5bcd6858e7576b7533d037978737c8f","src/unix/l=
inux_like/android/b32/x86/align.rs":"812914e4241df82e32b12375ca3374615dc3a4=
bdd4cf31f0423c5815320c0dab","src/unix/linux_like/android/b32/x86/mod.rs":"e=
6d107efbcd37b5b85dfa18f683300cbf768ffa0237997a9fa52b184a53323ac","src/unix/=
linux_like/android/b64/aarch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3=
ee2faf6fcae3770f9e505cddca35c7b","src/unix/linux_like/android/b64/aarch64/i=
nt128.rs":"1735f6f5c56770d20dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de=
","src/unix/linux_like/android/b64/aarch64/mod.rs":"10e963e29ff209703de6336=
c99cca96fd79789438d34c82a693eae56e8916c3c","src/unix/linux_like/android/b64=
/mod.rs":"71e4fcbe952bfa4a5f9022f3972e906917b38f729b9d8ef57cd5d179104894ac"=
,"src/unix/linux_like/android/b64/riscv64/align.rs":"0bf138f84e5327d8339bcd=
4adf071a6832b516445e597552c82bbd881095e3a8","src/unix/linux_like/android/b6=
4/riscv64/mod.rs":"19d4bf2237c47127eba9144e0b82e995bc079315e719179a91813b0a=
e7b0e49d","src/unix/linux_like/android/b64/x86_64/align.rs":"7169d07a9fd471=
6f7512719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/an=
droid/b64/x86_64/mod.rs":"4ec2de11a9b65c4325b7b991f0b99a414975e0e61ba8668ca=
ca5d921e9b314d1","src/unix/linux_like/android/mod.rs":"66a9e38a47493a42b3b1=
c325524f3c944e74d1e3e8ecce3cc276ec08fecab13b","src/unix/linux_like/emscript=
en/align.rs":"86c95cbed7a7161b1f23ee06843e7b0e2340ad92b2cb86fe2a8ef3e0e8c36=
216","src/unix/linux_like/emscripten/mod.rs":"67d6b90f539f746aa3290ea7f9d3f=
3f8d2d8a6557233584004ed5697f7821a50","src/unix/linux_like/emscripten/no_ali=
gn.rs":"0128e4aa721a9902754828b61b5ec7d8a86619983ed1e0544a85d35b1051fad6","=
src/unix/linux_like/linux/align.rs":"bc5abcd38e2320171e0981e773c9c5fe3e0d5a=
66fdff049228f6a1acad80ef8b","src/unix/linux_like/linux/arch/generic/mod.rs"=
:"fb5de1368cabae03d3ea0152159b7685a9d91efdecee4c5b83efc085ffef8a73","src/un=
ix/linux_like/linux/arch/mips/mod.rs":"75814e198d1a9a6808be3a5e5edb1bfdc57f=
75b06394e9040739be363c09d82f","src/unix/linux_like/linux/arch/mod.rs":"5bd5=
361f8a6ab4e18bbba6da9f92c164ae252b15a0ed10064812544aa1fdf198","src/unix/lin=
ux_like/linux/arch/powerpc/mod.rs":"bef6b7af9e5e2b4e5545c9c7e3e23a8b743277a=
0ed95853e7eddc38e44299f02","src/unix/linux_like/linux/arch/sparc/mod.rs":"9=
1593ec0440f1dd8f8e612028f432c44c14089286e2aca50e10511ab942db8c3","src/unix/=
linux_like/linux/gnu/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec72=
51957315afa53a7b9f936","src/unix/linux_like/linux/gnu/b32/arm/align.rs":"6e=
c0eb3ee93f7ae99fd714b4deabfb5e97fbcefd8c26f5a45fb8e7150899cdeb","src/unix/l=
inux_like/linux/gnu/b32/arm/mod.rs":"9ab3e97b579a9122690cd01026e14528862860=
346b700aafbb755a7e04054f7f","src/unix/linux_like/linux/gnu/b32/csky/align.r=
s":"3fed009dc9af3cc81be7087da9d2d7d1f39845e4497e290259c5cdbae25f039d","src/=
unix/linux_like/linux/gnu/b32/csky/mod.rs":"4c21d6e7463bb22f00b984294893d12=
c84018d5d26ec661d6a30f4a9625ba639","src/unix/linux_like/linux/gnu/b32/m68k/=
align.rs":"8faa92f77a9232c035418d45331774e64a9a841d99c91791570a203bf2b45bcb=
","src/unix/linux_like/linux/gnu/b32/m68k/mod.rs":"6aab7f1b864e9691d14aa7d3=
89f717c4077b8eed72a7f11e3b8c7fef245e4046","src/unix/linux_like/linux/gnu/b3=
2/mips/align.rs":"429fb5e005cb7143602d430098b6ebfb7d360685b194f333dfd587472=
ae954ee","src/unix/linux_like/linux/gnu/b32/mips/mod.rs":"6b9a5dac6f937ddc1=
453e808e3c43502c87143332df9e43ac64fb8b1eda6c116","src/unix/linux_like/linux=
/gnu/b32/mod.rs":"b56625dd20dd48a8699034d349ef089c540c0ddcbf8a3481d598d101f=
8b40b78","src/unix/linux_like/linux/gnu/b32/powerpc.rs":"5c5d90326b54b57b98=
eff4745fe7a3fb02f053b2dc782241a73e807b491936a3","src/unix/linux_like/linux/=
gnu/b32/riscv32/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd3=
7543efe86621b119","src/unix/linux_like/linux/gnu/b32/riscv32/mod.rs":"491a9=
a97cf712985b75d3ad714691ef60898d88c78bc386a6917de0a6774cc26","src/unix/linu=
x_like/linux/gnu/b32/sparc/align.rs":"21adbed27df73e2d1ed934aaf733a643003d7=
baf2bde9c48ea440895bcca6d41","src/unix/linux_like/linux/gnu/b32/sparc/mod.r=
s":"80894eece66e9348f45d1b07ad37c757ea694bbd10ed49d3f920b34e9f51a9a3","src/=
unix/linux_like/linux/gnu/b32/x86/align.rs":"e4bafdc4a519a7922a81b37a62bbfd=
1177a2f620890eef8f1fbc47162e9eb413","src/unix/linux_like/linux/gnu/b32/x86/=
mod.rs":"c703cc5e9de2dc31d9e5831bfb6f354d6e3518b2ae02263f68a9a70f1c0167e2",=
"src/unix/linux_like/linux/gnu/b64/aarch64/align.rs":"fdf1c72375a2167699157=
e0dd825422690bb6719f7bc69515a2e5846d0431d7c","src/unix/linux_like/linux/gnu=
/b64/aarch64/fallback.rs":"832e7487249c1c0bb6e9911ce3f7d32ca22378e42392ab83=
c56915cbc59d8be3","src/unix/linux_like/linux/gnu/b64/aarch64/ilp32.rs":"bf4=
611b737813deef6787babf6c01698605f3b75482269b8546318667bc68e29","src/unix/li=
nux_like/linux/gnu/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426442f09724d=
9b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/gnu/b64/aarch6=
4/lp64.rs":"11a950697fdda0258c6e37c6b13993348c8de4134105ed4faa79358e5317507=
2","src/unix/linux_like/linux/gnu/b64/aarch64/mod.rs":"172495fbfdf659b9b825=
148bffc2b62704f63fc872428617e868eb15802c9978","src/unix/linux_like/linux/gn=
u/b64/loongarch64/align.rs":"060aa33cc737966c691aab8511c5c5729e551458ce18d0=
e284e0d45f39beeb60","src/unix/linux_like/linux/gnu/b64/loongarch64/mod.rs":=
"18edada8aa5d4127d9aa1bd81c62b5a4209f1efd8b2b2631e801c9e855ab1480","src/uni=
x/linux_like/linux/gnu/b64/mips64/align.rs":"7169d07a9fd4716f7512719aec9fda=
5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/linux/gnu/b64/mips=
64/mod.rs":"628c410b9aaec3c8f43838a28616b577a1d6de60a9799b09bb884d80281f96e=
b","src/unix/linux_like/linux/gnu/b64/mod.rs":"6a160ef25439c4fecdb0e3bd0b81=
8742263c791364da874d4febd3aa644ec8e2","src/unix/linux_like/linux/gnu/b64/po=
werpc64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1=
268130d9","src/unix/linux_like/linux/gnu/b64/powerpc64/mod.rs":"c778a136f06=
c2ffeacea19fa14ce79b828f91b67a002dec5ce87289bae36234e","src/unix/linux_like=
/linux/gnu/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e5880=
3f99cd37543efe86621b119","src/unix/linux_like/linux/gnu/b64/riscv64/mod.rs"=
:"c8f07efc5ddd5d874f1ebc329cd6907818d132ac3e30f4f2a4b04be3fb388551","src/un=
ix/linux_like/linux/gnu/b64/s390x.rs":"a2fd9277c2dcf76f7a16a3bcca745d5a9932=
c765c0dc2feb31c3641be25eb0aa","src/unix/linux_like/linux/gnu/b64/sparc64/al=
ign.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268130d9",=
"src/unix/linux_like/linux/gnu/b64/sparc64/mod.rs":"e8047e9966a2b90063e0151=
a0278c54885e7b323286cf5ab55cbaf151fc772d3","src/unix/linux_like/linux/gnu/b=
64/x86_64/align.rs":"62e822478356db4a73b6bbd1b36d825b893939ab4b308ec11b0578=
bcc4b49769","src/unix/linux_like/linux/gnu/b64/x86_64/mod.rs":"891e595d3371=
4b9883b92f0554d1d361fba2b6c3f6cac09a288252f44c6ec667","src/unix/linux_like/=
linux/gnu/b64/x86_64/not_x32.rs":"38f74ce15d9662ce4818815a2b87be1618d5e45f1=
90f7e4db84ff3285b4421fb","src/unix/linux_like/linux/gnu/b64/x86_64/x32.rs":=
"b20218a11364a6dec87f96d6c0d8b19e660697ab09ad5ee0e9b3a9dafedaaebb","src/uni=
x/linux_like/linux/gnu/mod.rs":"47dd970aedda9c70429741d7c9892a0d5d264e9abcb=
1c41d5bb913a86f0a5362","src/unix/linux_like/linux/gnu/no_align.rs":"9cd2231=
35de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/linux_=
like/linux/mod.rs":"1582c09db7b752af0f796a4cba8aa2bb4ecea895c551a2219e76047=
bcce74a23","src/unix/linux_like/linux/musl/b32/arm/align.rs":"3e8ac052c1043=
764776b54c93ba4260e061df998631737a897d9d47d54f7b80c","src/unix/linux_like/l=
inux/musl/b32/arm/mod.rs":"b63a21b02ff1f55e3aca71af51a054d61fd2b4b452ccbf9f=
34acb431c51d00ea","src/unix/linux_like/linux/musl/b32/hexagon.rs":"f0b9505a=
5935f5fd163eebaa14d4c18ff948c4b199b03e5b88c91f99d4b0fce6","src/unix/linux_l=
ike/linux/musl/b32/mips/align.rs":"429fb5e005cb7143602d430098b6ebfb7d360685=
b194f333dfd587472ae954ee","src/unix/linux_like/linux/musl/b32/mips/mod.rs":=
"9b6dfc603accb6ef68010573f30b015868a1da1e1fc3ea2dc0337f33b4015ec6","src/uni=
x/linux_like/linux/musl/b32/mod.rs":"31677597fd9544c4b1ec1477628288f6273fab=
bc06e38f33da862ad55f019ce1","src/unix/linux_like/linux/musl/b32/powerpc.rs"=
:"0ebe9c42bb746583360d990d5a63a407075be3c7bdd260e5345e8aeac4d060cc","src/un=
ix/linux_like/linux/musl/b32/riscv32/align.rs":"efd2accf33b87de7c7547903359=
a5da896edc33cd6c719552c7474b60d4a5d48","src/unix/linux_like/linux/musl/b32/=
riscv32/mod.rs":"7b067c7989a80e35daa9987af799d97dd1fb3df71ef82285137f51fbad=
2354d9","src/unix/linux_like/linux/musl/b32/x86/align.rs":"08e77fbd7435d7de=
c2ff56932433bece3f02e47ce810f89004a275a86d39cbe1","src/unix/linux_like/linu=
x/musl/b32/x86/mod.rs":"9283e5d343aa668a6c2e520fb7db2548f344f1f5adf63ec7961=
954b61e6f6fad","src/unix/linux_like/linux/musl/b64/aarch64/align.rs":"6ba32=
725d24d7d8e6aa111f3b57aafa318f83b606abe96561329151829821133","src/unix/linu=
x_like/linux/musl/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426442f09724d9=
b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/musl/b64/aarch6=
4/mod.rs":"31e75179cbb4e26425b3f5b052e358f593153da662884655e60801d852e55dc2=
","src/unix/linux_like/linux/musl/b64/mips64.rs":"9a5d29f666332bb056d0e2951=
e9de989aa1dc016075f009db3f2f628e0cdda8c","src/unix/linux_like/linux/musl/b6=
4/mod.rs":"8275e7a108c71f180de71b86f74baa1e35d9e915befb8ab8191d2a2fe76d3bb9=
","src/unix/linux_like/linux/musl/b64/powerpc64.rs":"e77f4cf5d65320023043e4=
354725397f6b079c1b7b6b3cef2c3293350b46b303","src/unix/linux_like/linux/musl=
/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd3754=
3efe86621b119","src/unix/linux_like/linux/musl/b64/riscv64/mod.rs":"a80b181=
3148dec8bc396c02638978c0b4e5e040edafd56d98f8683fe2ae51ab5","src/unix/linux_=
like/linux/musl/b64/s390x.rs":"80a92e54e47016d051c7bd55bee9580cbedd29816419=
9d71a67d49167e744432","src/unix/linux_like/linux/musl/b64/x86_64/align.rs":=
"77309276ad7a42cbe59ca381f23590b7a143aded05555b34a5b307b808cbca6e","src/uni=
x/linux_like/linux/musl/b64/x86_64/mod.rs":"032863c74d3ca73cb75483218f9bd77=
4ae1ae7d3646d2ffb21e4cc7d4b5e0e3d","src/unix/linux_like/linux/musl/lfs64.rs=
":"3e4fb381f3a0756520bde0f1692d4fa45e4ae8133bf7d7c64b0e3fdd512f235f","src/u=
nix/linux_like/linux/musl/mod.rs":"9bfa05126ad26ecaecb29ba01b6d768e0b5d72e6=
cfc7054e13f0d9365eb5735c","src/unix/linux_like/linux/no_align.rs":"62cdca0e=
011937aaf09a51ca86d9f0ee0fdb05f61ec3c058e6a5d5fa6357d784","src/unix/linux_l=
ike/linux/non_exhaustive.rs":"181a05bf94fdb911db83ce793b993bd6548a4115b306a=
7ef3c10f745a8fea3e9","src/unix/linux_like/linux/uclibc/align.rs":"9ed16138d=
8e439bd90930845a65eafa7ebd67366e6bf633936d44014f6e4c959","src/unix/linux_li=
ke/linux/uclibc/arm/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec725=
1957315afa53a7b9f936","src/unix/linux_like/linux/uclibc/arm/mod.rs":"50288f=
f9e411ab0966da24838f2c2a5618021bc19c422a04f577b2979ef4081e","src/unix/linux=
_like/linux/uclibc/arm/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632=
b96b5c85a76f8316c86653db25","src/unix/linux_like/linux/uclibc/mips/mips32/a=
lign.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936"=
,"src/unix/linux_like/linux/uclibc/mips/mips32/mod.rs":"d0c4434e2bf813372c4=
18a8f516c706cdccc9f7be2f0921b2207b0afdb66fe81","src/unix/linux_like/linux/u=
clibc/mips/mips32/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5=
c85a76f8316c86653db25","src/unix/linux_like/linux/uclibc/mips/mips64/align.=
rs":"a7bdcb18a37a2d91e64d5fad83ea3edc78f5412adb28f77ab077dbb26dd08b2d","src=
/unix/linux_like/linux/uclibc/mips/mips64/mod.rs":"3f38ee6a4690b9d7594be20d=
216467a34d955f7653c2c8ce1e6147daeb53f1e0","src/unix/linux_like/linux/uclibc=
/mips/mips64/no_align.rs":"4a18e3875698c85229599225ac3401a2a40da87e77b2ad4e=
f47c6fcd5a24ed30","src/unix/linux_like/linux/uclibc/mips/mod.rs":"a048fce1c=
2d9b1ad57305642e8ad05ca0f0c7e4753267a2e2d6b4fee5db3b072","src/unix/linux_li=
ke/linux/uclibc/mod.rs":"1c3d25cddcfefa2bd17bdc81550826be31a08eef235e13f825=
f169a5029c8bca","src/unix/linux_like/linux/uclibc/no_align.rs":"3f286370465=
24618adaa1012e26cb7ffe94b9396e6b518cccdc69d59f274d709","src/unix/linux_like=
/linux/uclibc/x86_64/l4re.rs":"024eba5753e852dbdd212427351affe7e83f9916c186=
4bce414d7aa2618f192e","src/unix/linux_like/linux/uclibc/x86_64/mod.rs":"196=
d03affbefb85716937c15904831e731eb222ee906e05e42102d639a8152ea","src/unix/li=
nux_like/linux/uclibc/x86_64/other.rs":"42c3f71e58cabba373f6a55a623f3c31b85=
049eb64824c09c2b082b3b2d6a0a8","src/unix/linux_like/mod.rs":"45c98e7a0fad03=
b03c4c76f11a80e2423873f0a6563e35c60309a29b2c8ff44f","src/unix/mod.rs":"dd4c=
e377ba9517182e718848739a5c3f58cdbbcd4ee467eef9aaf8df5aed5053","src/unix/new=
lib/aarch64/mod.rs":"bac93836a9a57b2c710f32f852e92a4d11ad6759ab0fb6ad33e71d=
60e53278af","src/unix/newlib/align.rs":"28aaf87fafbc6b312622719d472d8cf65f9=
e5467d15339df5f73e66d8502b28a","src/unix/newlib/arm/mod.rs":"cbba6b3e957ece=
b496806e60de8725a23ff3fa0015983b4b4fa27b233732b526","src/unix/newlib/espidf=
/mod.rs":"816f235f4aa4baabba7f2606b31d0fdb03988c52194c966728de8690bf17299d"=
,"src/unix/newlib/generic.rs":"eab066d9f0a0f3eb53cc1073d01496bba0110989e1f6=
a59838afd19f870cd599","src/unix/newlib/horizon/mod.rs":"7cc5cc120437421db13=
9bfa6a90b18168cd3070bdd0f5be96d40fe4c996f3ca1","src/unix/newlib/mod.rs":"9e=
36de3fd78e10cb6b9a59dc5ebe5a1b44a63ccb91433bb33653fb30d0c303c6","src/unix/n=
ewlib/no_align.rs":"e0743b2179495a9514bc3a4d1781e492878c4ec834ee0085d0891dd=
1712e82fb","src/unix/newlib/powerpc/mod.rs":"0202ffd57caf75b6afa2c9717750ff=
b96e375ac33df0ae9609a3f831be393b67","src/unix/newlib/vita/mod.rs":"68e0ce18=
6b44e0b3031eb824710e7454dc2a9df98db98120840c3c6f4d885871","src/unix/no_alig=
n.rs":"c06e95373b9088266e0b14bba0954eef95f93fb2b01d951855e382d22de78e53","s=
rc/unix/nto/aarch64.rs":"4709c9afdc8d583be876598e7c238499ee3e8da5bd2baa614d=
9c7dd414851555","src/unix/nto/mod.rs":"59ab89a8fb6e0a6d22fa968ed4873c2bafa1=
9a0f60a90c9a5148816cb7440889","src/unix/nto/neutrino.rs":"799bff4ab01a6424d=
b6c5a2b76aa5679826d41495f9d13c63485bf13bc80026b","src/unix/nto/x86_64.rs":"=
a3e18e93c2999da1cd7a6f748a4b60c07aefb73d8ea2aafec19a84cfb040bc8e","src/unix=
/redox/mod.rs":"73658b0d28c82a122875aa2b45c489834f4de58c378add7932bbaf3ffb2=
ae789","src/unix/solarish/compat.rs":"00f1ee3faec9da69204e42f025f6735dd13d8=
94071a154425dcc43ecbdd06e7f","src/unix/solarish/illumos.rs":"cd93c2d84722bb=
f9933a92842a8998eb0b2afc962f50bc2546ad127b82809fa7","src/unix/solarish/mod.=
rs":"b1660c631a599a3355116e7485b88ab2f8f2929c2e37851a763431387b902f14","src=
/unix/solarish/solaris.rs":"41b350a89ddf01cd12a10f93640f92be53be0b0d976021c=
dc08da17bf3e72edf","src/unix/solarish/x86.rs":"e86e806df0caed72765040eaa2f3=
c883198d1aa91508540adf9b7008c77f522e","src/unix/solarish/x86_64.rs":"ec2b01=
f194eb8a6a27133c57681da195a949e03098f3ea1e847227a9c09ef5fc","src/unix/solar=
ish/x86_common.rs":"ac869d9c3c95645c22460468391eb1982023c3a8e02b9e06a72e3ae=
f3d5f1eac","src/vxworks/aarch64.rs":"98f0afdc511cd02557e506c21fed6737585490=
a1dce7a9d4941d08c437762b99","src/vxworks/arm.rs":"acb7968ce99fe3f4abdf39d98=
f8133d21a4fba435b8ef7084777cb181d788e88","src/vxworks/mod.rs":"e4edcbcf43a3=
25e738c9465507594d0c87abf3f0e2b9b046c1425f8d44bdad0f","src/vxworks/powerpc.=
rs":"acb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788e88","src=
/vxworks/powerpc64.rs":"98f0afdc511cd02557e506c21fed6737585490a1dce7a9d4941=
d08c437762b99","src/vxworks/x86.rs":"552f007f38317620b23889cb7c49d1d1158412=
52439060122f52f434fbc6e5ba","src/vxworks/x86_64.rs":"018d92be3ad628a129eff9=
f2f5dfbc0883d8b8e5f2fa917b900a7f98ed6b514a","src/wasi.rs":"09ee3b3348b212b0=
50f6ca8ae008a28679ea44a375674307a4e7c9ca0d3ed7d5","src/windows/gnu/align.rs=
":"b2c13ec1b9f3b39a75c452c80c951dff9d0215e31d77e883b4502afb31794647","src/w=
indows/gnu/mod.rs":"3c8c7edb7cdf5d0c44af936db2a94869585c69dfabeef30571b4f4e=
38375767a","src/windows/mod.rs":"9fdc5e1c62c441abef7bc62a7343efb2041edc24db=
9ac0efc0f74df55b69e249","src/windows/msvc/mod.rs":"c068271e00fca6b62bc4bf44=
bcf142cfc38caeded9b6c4e01d1ceef3ccf986f4","src/xous.rs":"eb0675f25ba01f7307=
2d2b70907fb8abb1148facefe5a20756c49250f3d65fae","tests/const_fn.rs":"cb75a1=
f0864f926aebe79118fc34d51a0d1ade2c20a394e7774c7e545f21f1f4"},"package":"9cd=
c71e17332e86d2e1d38c1f99edcb6288ee11b815fb1a4b049eaa2114d369b"}
> +\ No newline at end of file
> ++{"files":{"CONTRIBUTING.md":"bdc90b52cf803faac96e594069a86dd8ea150d5ba7=
fb3e6cadfc08dac4c7b0ce","Cargo.toml":"a58e58fa9bde015e08609ea2f17e56c5df7c8=
2aa6f3fa1a144c02ee4715227b9","LICENSE-APACHE":"62c7a1e35f56406896d7aa7ca52d=
0cc0d272ac022b5d2796e7d6905db8a3636a","LICENSE-MIT":"a8d47ff51ca256f56a8932=
dba07660672dbfe3004257ca8de708aac1415937a1","README.md":"ecc47e284f8d007fc0=
48666d5108dd41cdc440ab9eedfe8c47d1634613522787","build.rs":"9e94683e94db80e=
8282fce07549cf748d9037852fb06df1c7596bea2ed130d50","rustfmt.toml":"eaa2ea84=
fc1ba0359b77680804903e07bb38d257ab11986b95b158e460f787b2","src/fixed_width_=
ints.rs":"7f986e5f5e68d25ef04d386fd2f640e8be8f15427a8d4a458ea01d26b8dca0ca"=
,"src/fuchsia/aarch64.rs":"893fcec48142d273063ffd814dca33fbec92205fd39ada97=
075f85201d803996","src/fuchsia/align.rs":"ae1cf8f011a99737eabeb14ffff768e60=
f13b13363d7646744dbb0f443dab3d6","src/fuchsia/mod.rs":"30f4dc83ef120300d618=
96696512436377c5f36f1431d98ab7e01e498c0c47d5","src/fuchsia/no_align.rs":"30=
3f3f1b255e0088b5715094353cf00476131d8e94e6aebb3f469557771c8b8a","src/fuchsi=
a/riscv64.rs":"617cd75e79e0e20f664db764a4dc2a396d9fd11a4d95371acd91ed481129=
3b11","src/fuchsia/x86_64.rs":"93a3632b5cf67d2a6bcb7dc0a558605252d5fe689e0f=
38d8aa2ec5852255ac87","src/hermit/aarch64.rs":"86048676e335944c37a63d0083d0=
f368ae10ceccefeed9debb3bbe08777fc682","src/hermit/mod.rs":"d3bfce41e4463d4b=
e8020a2d063c9bfa8b665f45f1cc6cbf3163f5d01e7cb21f","src/hermit/x86_64.rs":"a=
b832b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/lib.r=
s":"24111461547739f3646f95bcb66c43f2ae679a727ff5938299434c522c02e458","src/=
macros.rs":"b457eb028b8e8ab3c24bb7292b874ad4e491edbb83594f6a3da024df5348c08=
8","src/psp.rs":"dd31aabd46171d474ec5828372e28588935120e7355c90c105360d8fa9=
264c1c","src/sgx.rs":"16a95cdefc81c5ee00d8353a60db363c4cc3e0f75abcd5d014472=
3f2a306ed1b","src/solid/aarch64.rs":"a726e47f324adf73a4a0b67a2c183408d0cad1=
05ae66acf36db37a42ab7f8707","src/solid/arm.rs":"e39a4f74ebbef3b97b8c95758ad=
741123d84ed3eb48d9cf4f1f4872097fc27fe","src/solid/mod.rs":"5f4151dca5132e4b=
4e4c23ab9737e12856dddbdc0ca3f7dbc004328ef3c8acde","src/switch.rs":"9da3dd39=
b3de45a7928789926e8572d00e1e11a39e6f7289a1349aadce90edba","src/unix/aix/mod=
=2Ers":"54229b5e774669c16912112e8b50fa938db76f534971222a11723a05195a0948","=
src/unix/aix/powerpc64.rs":"cf374d81139d45f9d77c6a764f640bfbf7e0a5903689652=
c8296f8e10d55169b","src/unix/align.rs":"2cdc7c826ef7ae61f5171c5ae8c445a743d=
86f1a7f2d9d7e4ceeec56d6874f65","src/unix/bsd/apple/b32/align.rs":"ec833a747=
866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/appl=
e/b32/mod.rs":"2546ad3eb6aecb95f916648bc63264117c92b4b4859532b34cb011e4c75a=
5a72","src/unix/bsd/apple/b64/aarch64/align.rs":"2eaf0f561a32bdcbf4e0477c88=
95d5e7bcb5cdebd5fef7b4df2ca8e38e144d94","src/unix/bsd/apple/b64/aarch64/mod=
=2Ers":"44c217a4f263afe7a97435de9323d20a96c37836f899ca0925306d4b7e073c27","=
src/unix/bsd/apple/b64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf=
4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b64/mod.rs":"f5e278a1af7fb3588=
91d1c9be4eb7e815aaca0c5cb738d0c3604ba2208a856f7","src/unix/bsd/apple/b64/x8=
6_64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b=
0e26c","src/unix/bsd/apple/b64/x86_64/mod.rs":"8c87c5855038aae5d433c8f5eb3b=
29b0a175879a0245342b3bfd83bdf4cfd936","src/unix/bsd/apple/long_array.rs":"3=
cf1f19b812e6d093c819dc65ce55b13491963e0780eda0d0bd1577603e81948","src/unix/=
bsd/apple/mod.rs":"0931fd351d585728e6384d7b952b8d816e9acdb9c86c172324445f3c=
33f692ca","src/unix/bsd/freebsdlike/dragonfly/errno.rs":"8295b8bb0dfd38d2cd=
b4d9192cdeeb534cc6c3b208170e64615fa3e0edb3e578","src/unix/bsd/freebsdlike/d=
ragonfly/mod.rs":"f2e78625fe1eb14f43e730a3987eba888cb8ac04c23008e7c2d2f7c72=
258b9e6","src/unix/bsd/freebsdlike/freebsd/aarch64.rs":"6c8e216385f53a4bf5f=
171749b57602fc34a4e4b160a44ca31c058cb0c8a2126","src/unix/bsd/freebsdlike/fr=
eebsd/arm.rs":"59d6a670eea562fb87686e243e0a84603d29a2028a3d4b3f99ccc01bd04d=
2f47","src/unix/bsd/freebsdlike/freebsd/freebsd11/b64.rs":"9808d152c1196aa6=
47f1b0f0cf84dac8c930da7d7f897a44975545e3d9d17681","src/unix/bsd/freebsdlike=
/freebsd/freebsd11/mod.rs":"e243ae0e89623d4fa9f85afe14369cc5fd5f2028ea71577=
3dbec722ba80dac1f","src/unix/bsd/freebsdlike/freebsd/freebsd12/b64.rs":"61c=
be45f8499bedb168106b686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bs=
d/freebsdlike/freebsd/freebsd12/mod.rs":"bef9fae288a4f29e941ea369be1cd20b17=
0040e60665a4d49a4a9e79009b72d8","src/unix/bsd/freebsdlike/freebsd/freebsd12=
/x86_64.rs":"2df36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd0=
52","src/unix/bsd/freebsdlike/freebsd/freebsd13/b64.rs":"61cbe45f8499bedb16=
8106b686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/f=
reebsd/freebsd13/mod.rs":"3c514e037694ce22724abb3c9c4687defda7f0e3456b615ca=
73593e860e38b16","src/unix/bsd/freebsdlike/freebsd/freebsd13/x86_64.rs":"2d=
f36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/b=
sd/freebsdlike/freebsd/freebsd14/b64.rs":"61cbe45f8499bedb168106b686d4f8239=
472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd1=
4/mod.rs":"318abe48bfdd1c74ecd6afbd6c9329c5c72ce4f7d420edd6be2fc12b223ae32f=
","src/unix/bsd/freebsdlike/freebsd/freebsd14/x86_64.rs":"e7b5863e222d6cc41=
6b6b0fbe71690fad909e899b4c4ae810bbca117e4fcb650","src/unix/bsd/freebsdlike/=
freebsd/mod.rs":"4c3cd57aaf7fbce072e28e0d2d285b5fda9702e924561d2fd01e49e6ee=
186a98","src/unix/bsd/freebsdlike/freebsd/powerpc.rs":"9ca3f82f88974e6db556=
9f2d76a5a3749b248a31747a6c0da5820492bdfeca42","src/unix/bsd/freebsdlike/fre=
ebsd/powerpc64.rs":"2dae3ecc87eac3b11657aa98915def55fc4b5c0de11fe26aae23329=
a54628a9a","src/unix/bsd/freebsdlike/freebsd/riscv64.rs":"fa4bed4c58cad24ba=
3395941c7fa6b11e089551a04714f9561078e400f5b2b62","src/unix/bsd/freebsdlike/=
freebsd/x86.rs":"6766e2ce85e187b306cd3b0b8d7e15b8f4042c5cff81d89b3af69ecc99=
c70ab0","src/unix/bsd/freebsdlike/freebsd/x86_64/align.rs":"0e1f69a88fca1c3=
2874b1daf5db3d446fefbe518dca497f096cc9168c39dde70","src/unix/bsd/freebsdlik=
e/freebsd/x86_64/mod.rs":"51e4dd0c8ae247bb652feda5adad9333ea3bb30c750c3a393=
5e0b0e47d7803eb","src/unix/bsd/freebsdlike/mod.rs":"0eacafac87fb3a32ef1b859=
80fece2792e70eba9856af18a7407cc35be68ea57","src/unix/bsd/mod.rs":"dad51a24a=
524e92bfe9de3ac3b7d394d86058b9b8a1ccd4efa9bbb5c78e7fa1a","src/unix/bsd/netb=
sdlike/mod.rs":"0a66f7de43710e35a6a546e6c39066aa8b91a6efadb71db88738b0a577f=
d5537","src/unix/bsd/netbsdlike/netbsd/aarch64.rs":"65dcb58d11e8d8028401a9d=
07ca3eb4cb4f053e04249cc877353449d84ccc4cb","src/unix/bsd/netbsdlike/netbsd/=
arm.rs":"58cdbb70b0d6f536551f0f3bb3725d2d75c4690db12c26c034e7d6ec4a924452",=
"src/unix/bsd/netbsdlike/netbsd/mod.rs":"90dd33ef20dc3be8aef5bd152a6a06e7ab=
34f9527b3978487b593aaa16a907bd","src/unix/bsd/netbsdlike/netbsd/powerpc.rs"=
:"ee7ff5d89d0ed22f531237b5059aa669df93a3b5c489fa641465ace8d405bf41","src/un=
ix/bsd/netbsdlike/netbsd/sparc64.rs":"9489f4b3e4566f43bb12dfb92238960613dac=
7f6a45cc13068a8d152b902d7d9","src/unix/bsd/netbsdlike/netbsd/x86.rs":"20692=
320e36bfe028d1a34d16fe12ca77aa909cb02bda167376f98f1a09aefe7","src/unix/bsd/=
netbsdlike/netbsd/x86_64.rs":"1afe5ef46b14397cdd68664b5b232e4f5b035b6db1d4c=
f411c899d51ebca9f30","src/unix/bsd/netbsdlike/openbsd/aarch64.rs":"dd91931d=
373b7ecaf6e2de25adadee10d16fa9b12c2cbacdff3eb291e1ba36af","src/unix/bsd/net=
bsdlike/openbsd/arm.rs":"01580d261bc6447bb327a0d982181b7bdabfa066cee65a3037=
3d3ced729ad307","src/unix/bsd/netbsdlike/openbsd/mips64.rs":"8532a189ae10c7=
d668d9d4065da8b05d124e09bd39442c9f74a7f231c43eca48","src/unix/bsd/netbsdlik=
e/openbsd/mod.rs":"c27c6673bd3628549083a094219831fd9343129f91067b562781617d=
2a887148","src/unix/bsd/netbsdlike/openbsd/powerpc.rs":"01580d261bc6447bb32=
7a0d982181b7bdabfa066cee65a30373d3ced729ad307","src/unix/bsd/netbsdlike/ope=
nbsd/powerpc64.rs":"1dd5449dd1fd3d51e30ffdeeaece91d0aaf05c710e0ac699fecc546=
1cfa2c28e","src/unix/bsd/netbsdlike/openbsd/riscv64.rs":"1dd5449dd1fd3d51e3=
0ffdeeaece91d0aaf05c710e0ac699fecc5461cfa2c28e","src/unix/bsd/netbsdlike/op=
enbsd/sparc64.rs":"d04fd287afbaa2c5df9d48c94e8374a532a3ba491b424ddf018270c7=
312f4085","src/unix/bsd/netbsdlike/openbsd/x86.rs":"6f7f5c4fde2a2259eb54789=
0cbd86570cea04ef85347d7569e94e679448bec87","src/unix/bsd/netbsdlike/openbsd=
/x86_64.rs":"d31db31630289c85af3339dbe357998a21ca584cbae31607448fe2cf7675a4=
e1","src/unix/haiku/b32.rs":"a2efdbf7158a6da341e1db9176b0ab193ba88b44961623=
9ed95dced11f54d87b","src/unix/haiku/b64.rs":"ff8115367d3d7d354f792d6176dfaa=
a26353f57056197b563bf4681f91ff7985","src/unix/haiku/mod.rs":"d7ec086b73db4f=
72799179627aa6330a513dcf786b06e19c75ff884d1235948e","src/unix/haiku/native.=
rs":"dbfcbf4954a79d1df2ff58e0590bbcb8c57dfc7a32392aa73ee4726b66bd6cc8","src=
/unix/haiku/x86_64.rs":"3ec3aeeb7ed208b8916f3e32d42bfd085ff5e16936a1a35d9a5=
2789f043b7237","src/unix/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f3=
68ae10ceccefeed9debb3bbe08777fc682","src/unix/hermit/mod.rs":"a1494a0bddf30=
1cceb0d9b8529a84b5882fe855ceae77a1c4e8d6034e705e26c","src/unix/hermit/x86_6=
4.rs":"ab832b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","s=
rc/unix/linux_like/android/b32/arm.rs":"ce582de7e983a33d3bfad13075c53aac901=
6cee35f06ad8653ee9072c3ec2564","src/unix/linux_like/android/b32/mod.rs":"7c=
173e0375119bf06a3081652faede95e5bcd6858e7576b7533d037978737c8f","src/unix/l=
inux_like/android/b32/x86/align.rs":"812914e4241df82e32b12375ca3374615dc3a4=
bdd4cf31f0423c5815320c0dab","src/unix/linux_like/android/b32/x86/mod.rs":"e=
6d107efbcd37b5b85dfa18f683300cbf768ffa0237997a9fa52b184a53323ac","src/unix/=
linux_like/android/b64/aarch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3=
ee2faf6fcae3770f9e505cddca35c7b","src/unix/linux_like/android/b64/aarch64/i=
nt128.rs":"1735f6f5c56770d20dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de=
","src/unix/linux_like/android/b64/aarch64/mod.rs":"10e963e29ff209703de6336=
c99cca96fd79789438d34c82a693eae56e8916c3c","src/unix/linux_like/android/b64=
/mod.rs":"71e4fcbe952bfa4a5f9022f3972e906917b38f729b9d8ef57cd5d179104894ac"=
,"src/unix/linux_like/android/b64/riscv64/align.rs":"0bf138f84e5327d8339bcd=
4adf071a6832b516445e597552c82bbd881095e3a8","src/unix/linux_like/android/b6=
4/riscv64/mod.rs":"19d4bf2237c47127eba9144e0b82e995bc079315e719179a91813b0a=
e7b0e49d","src/unix/linux_like/android/b64/x86_64/align.rs":"7169d07a9fd471=
6f7512719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/an=
droid/b64/x86_64/mod.rs":"4ec2de11a9b65c4325b7b991f0b99a414975e0e61ba8668ca=
ca5d921e9b314d1","src/unix/linux_like/android/mod.rs":"66a9e38a47493a42b3b1=
c325524f3c944e74d1e3e8ecce3cc276ec08fecab13b","src/unix/linux_like/emscript=
en/align.rs":"86c95cbed7a7161b1f23ee06843e7b0e2340ad92b2cb86fe2a8ef3e0e8c36=
216","src/unix/linux_like/emscripten/mod.rs":"67d6b90f539f746aa3290ea7f9d3f=
3f8d2d8a6557233584004ed5697f7821a50","src/unix/linux_like/emscripten/no_ali=
gn.rs":"0128e4aa721a9902754828b61b5ec7d8a86619983ed1e0544a85d35b1051fad6","=
src/unix/linux_like/linux/align.rs":"bc5abcd38e2320171e0981e773c9c5fe3e0d5a=
66fdff049228f6a1acad80ef8b","src/unix/linux_like/linux/arch/generic/mod.rs"=
:"fb5de1368cabae03d3ea0152159b7685a9d91efdecee4c5b83efc085ffef8a73","src/un=
ix/linux_like/linux/arch/mips/mod.rs":"75814e198d1a9a6808be3a5e5edb1bfdc57f=
75b06394e9040739be363c09d82f","src/unix/linux_like/linux/arch/mod.rs":"5bd5=
361f8a6ab4e18bbba6da9f92c164ae252b15a0ed10064812544aa1fdf198","src/unix/lin=
ux_like/linux/arch/powerpc/mod.rs":"bef6b7af9e5e2b4e5545c9c7e3e23a8b743277a=
0ed95853e7eddc38e44299f02","src/unix/linux_like/linux/arch/sparc/mod.rs":"9=
1593ec0440f1dd8f8e612028f432c44c14089286e2aca50e10511ab942db8c3","src/unix/=
linux_like/linux/gnu/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec72=
51957315afa53a7b9f936","src/unix/linux_like/linux/gnu/b32/arm/align.rs":"6e=
c0eb3ee93f7ae99fd714b4deabfb5e97fbcefd8c26f5a45fb8e7150899cdeb","src/unix/l=
inux_like/linux/gnu/b32/arm/mod.rs":"9ab3e97b579a9122690cd01026e14528862860=
346b700aafbb755a7e04054f7f","src/unix/linux_like/linux/gnu/b32/csky/align.r=
s":"3fed009dc9af3cc81be7087da9d2d7d1f39845e4497e290259c5cdbae25f039d","src/=
unix/linux_like/linux/gnu/b32/csky/mod.rs":"4c21d6e7463bb22f00b984294893d12=
c84018d5d26ec661d6a30f4a9625ba639","src/unix/linux_like/linux/gnu/b32/m68k/=
align.rs":"8faa92f77a9232c035418d45331774e64a9a841d99c91791570a203bf2b45bcb=
","src/unix/linux_like/linux/gnu/b32/m68k/mod.rs":"6aab7f1b864e9691d14aa7d3=
89f717c4077b8eed72a7f11e3b8c7fef245e4046","src/unix/linux_like/linux/gnu/b3=
2/mips/align.rs":"429fb5e005cb7143602d430098b6ebfb7d360685b194f333dfd587472=
ae954ee","src/unix/linux_like/linux/gnu/b32/mips/mod.rs":"6b9a5dac6f937ddc1=
453e808e3c43502c87143332df9e43ac64fb8b1eda6c116","src/unix/linux_like/linux=
/gnu/b32/mod.rs":"b56625dd20dd48a8699034d349ef089c540c0ddcbf8a3481d598d101f=
8b40b78","src/unix/linux_like/linux/gnu/b32/powerpc.rs":"5c5d90326b54b57b98=
eff4745fe7a3fb02f053b2dc782241a73e807b491936a3","src/unix/linux_like/linux/=
gnu/b32/riscv32/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd3=
7543efe86621b119","src/unix/linux_like/linux/gnu/b32/riscv32/mod.rs":"491a9=
a97cf712985b75d3ad714691ef60898d88c78bc386a6917de0a6774cc26","src/unix/linu=
x_like/linux/gnu/b32/sparc/align.rs":"21adbed27df73e2d1ed934aaf733a643003d7=
baf2bde9c48ea440895bcca6d41","src/unix/linux_like/linux/gnu/b32/sparc/mod.r=
s":"80894eece66e9348f45d1b07ad37c757ea694bbd10ed49d3f920b34e9f51a9a3","src/=
unix/linux_like/linux/gnu/b32/x86/align.rs":"e4bafdc4a519a7922a81b37a62bbfd=
1177a2f620890eef8f1fbc47162e9eb413","src/unix/linux_like/linux/gnu/b32/x86/=
mod.rs":"c703cc5e9de2dc31d9e5831bfb6f354d6e3518b2ae02263f68a9a70f1c0167e2",=
"src/unix/linux_like/linux/gnu/b64/aarch64/align.rs":"fdf1c72375a2167699157=
e0dd825422690bb6719f7bc69515a2e5846d0431d7c","src/unix/linux_like/linux/gnu=
/b64/aarch64/fallback.rs":"832e7487249c1c0bb6e9911ce3f7d32ca22378e42392ab83=
c56915cbc59d8be3","src/unix/linux_like/linux/gnu/b64/aarch64/ilp32.rs":"bf4=
611b737813deef6787babf6c01698605f3b75482269b8546318667bc68e29","src/unix/li=
nux_like/linux/gnu/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426442f09724d=
9b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/gnu/b64/aarch6=
4/lp64.rs":"11a950697fdda0258c6e37c6b13993348c8de4134105ed4faa79358e5317507=
2","src/unix/linux_like/linux/gnu/b64/aarch64/mod.rs":"172495fbfdf659b9b825=
148bffc2b62704f63fc872428617e868eb15802c9978","src/unix/linux_like/linux/gn=
u/b64/loongarch64/align.rs":"060aa33cc737966c691aab8511c5c5729e551458ce18d0=
e284e0d45f39beeb60","src/unix/linux_like/linux/gnu/b64/loongarch64/mod.rs":=
"18edada8aa5d4127d9aa1bd81c62b5a4209f1efd8b2b2631e801c9e855ab1480","src/uni=
x/linux_like/linux/gnu/b64/mips64/align.rs":"7169d07a9fd4716f7512719aec9fda=
5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/linux/gnu/b64/mips=
64/mod.rs":"628c410b9aaec3c8f43838a28616b577a1d6de60a9799b09bb884d80281f96e=
b","src/unix/linux_like/linux/gnu/b64/mod.rs":"6a160ef25439c4fecdb0e3bd0b81=
8742263c791364da874d4febd3aa644ec8e2","src/unix/linux_like/linux/gnu/b64/po=
werpc64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1=
268130d9","src/unix/linux_like/linux/gnu/b64/powerpc64/mod.rs":"c778a136f06=
c2ffeacea19fa14ce79b828f91b67a002dec5ce87289bae36234e","src/unix/linux_like=
/linux/gnu/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e5880=
3f99cd37543efe86621b119","src/unix/linux_like/linux/gnu/b64/riscv64/mod.rs"=
:"c8f07efc5ddd5d874f1ebc329cd6907818d132ac3e30f4f2a4b04be3fb388551","src/un=
ix/linux_like/linux/gnu/b64/s390x.rs":"a2fd9277c2dcf76f7a16a3bcca745d5a9932=
c765c0dc2feb31c3641be25eb0aa","src/unix/linux_like/linux/gnu/b64/sparc64/al=
ign.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268130d9",=
"src/unix/linux_like/linux/gnu/b64/sparc64/mod.rs":"e8047e9966a2b90063e0151=
a0278c54885e7b323286cf5ab55cbaf151fc772d3","src/unix/linux_like/linux/gnu/b=
64/x86_64/align.rs":"62e822478356db4a73b6bbd1b36d825b893939ab4b308ec11b0578=
bcc4b49769","src/unix/linux_like/linux/gnu/b64/x86_64/mod.rs":"891e595d3371=
4b9883b92f0554d1d361fba2b6c3f6cac09a288252f44c6ec667","src/unix/linux_like/=
linux/gnu/b64/x86_64/not_x32.rs":"38f74ce15d9662ce4818815a2b87be1618d5e45f1=
90f7e4db84ff3285b4421fb","src/unix/linux_like/linux/gnu/b64/x86_64/x32.rs":=
"b20218a11364a6dec87f96d6c0d8b19e660697ab09ad5ee0e9b3a9dafedaaebb","src/uni=
x/linux_like/linux/gnu/mod.rs":"47dd970aedda9c70429741d7c9892a0d5d264e9abcb=
1c41d5bb913a86f0a5362","src/unix/linux_like/linux/gnu/no_align.rs":"9cd2231=
35de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/linux_=
like/linux/mod.rs":"1582c09db7b752af0f796a4cba8aa2bb4ecea895c551a2219e76047=
bcce74a23","src/unix/linux_like/linux/musl/b32/arm/align.rs":"3e8ac052c1043=
764776b54c93ba4260e061df998631737a897d9d47d54f7b80c","src/unix/linux_like/l=
inux/musl/b32/arm/mod.rs":"b63a21b02ff1f55e3aca71af51a054d61fd2b4b452ccbf9f=
34acb431c51d00ea","src/unix/linux_like/linux/musl/b32/hexagon.rs":"f0b9505a=
5935f5fd163eebaa14d4c18ff948c4b199b03e5b88c91f99d4b0fce6","src/unix/linux_l=
ike/linux/musl/b32/mips/align.rs":"429fb5e005cb7143602d430098b6ebfb7d360685=
b194f333dfd587472ae954ee","src/unix/linux_like/linux/musl/b32/mips/mod.rs":=
"9b6dfc603accb6ef68010573f30b015868a1da1e1fc3ea2dc0337f33b4015ec6","src/uni=
x/linux_like/linux/musl/b32/mod.rs":"31677597fd9544c4b1ec1477628288f6273fab=
bc06e38f33da862ad55f019ce1","src/unix/linux_like/linux/musl/b32/powerpc.rs"=
:"0ebe9c42bb746583360d990d5a63a407075be3c7bdd260e5345e8aeac4d060cc","src/un=
ix/linux_like/linux/musl/b32/riscv32/align.rs":"efd2accf33b87de7c7547903359=
a5da896edc33cd6c719552c7474b60d4a5d48","src/unix/linux_like/linux/musl/b32/=
riscv32/mod.rs":"0576807c1dd05e2114c3d0c819ae5a99fb5668262de6f9eabbda73d974=
a6fd29","src/unix/linux_like/linux/musl/b32/x86/align.rs":"08e77fbd7435d7de=
c2ff56932433bece3f02e47ce810f89004a275a86d39cbe1","src/unix/linux_like/linu=
x/musl/b32/x86/mod.rs":"9283e5d343aa668a6c2e520fb7db2548f344f1f5adf63ec7961=
954b61e6f6fad","src/unix/linux_like/linux/musl/b64/aarch64/align.rs":"6ba32=
725d24d7d8e6aa111f3b57aafa318f83b606abe96561329151829821133","src/unix/linu=
x_like/linux/musl/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426442f09724d9=
b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/musl/b64/aarch6=
4/mod.rs":"31e75179cbb4e26425b3f5b052e358f593153da662884655e60801d852e55dc2=
","src/unix/linux_like/linux/musl/b64/mips64.rs":"9a5d29f666332bb056d0e2951=
e9de989aa1dc016075f009db3f2f628e0cdda8c","src/unix/linux_like/linux/musl/b6=
4/mod.rs":"8275e7a108c71f180de71b86f74baa1e35d9e915befb8ab8191d2a2fe76d3bb9=
","src/unix/linux_like/linux/musl/b64/powerpc64.rs":"e77f4cf5d65320023043e4=
354725397f6b079c1b7b6b3cef2c3293350b46b303","src/unix/linux_like/linux/musl=
/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd3754=
3efe86621b119","src/unix/linux_like/linux/musl/b64/riscv64/mod.rs":"a80b181=
3148dec8bc396c02638978c0b4e5e040edafd56d98f8683fe2ae51ab5","src/unix/linux_=
like/linux/musl/b64/s390x.rs":"80a92e54e47016d051c7bd55bee9580cbedd29816419=
9d71a67d49167e744432","src/unix/linux_like/linux/musl/b64/x86_64/align.rs":=
"77309276ad7a42cbe59ca381f23590b7a143aded05555b34a5b307b808cbca6e","src/uni=
x/linux_like/linux/musl/b64/x86_64/mod.rs":"032863c74d3ca73cb75483218f9bd77=
4ae1ae7d3646d2ffb21e4cc7d4b5e0e3d","src/unix/linux_like/linux/musl/lfs64.rs=
":"3e4fb381f3a0756520bde0f1692d4fa45e4ae8133bf7d7c64b0e3fdd512f235f","src/u=
nix/linux_like/linux/musl/mod.rs":"9bfa05126ad26ecaecb29ba01b6d768e0b5d72e6=
cfc7054e13f0d9365eb5735c","src/unix/linux_like/linux/no_align.rs":"62cdca0e=
011937aaf09a51ca86d9f0ee0fdb05f61ec3c058e6a5d5fa6357d784","src/unix/linux_l=
ike/linux/non_exhaustive.rs":"181a05bf94fdb911db83ce793b993bd6548a4115b306a=
7ef3c10f745a8fea3e9","src/unix/linux_like/linux/uclibc/align.rs":"9ed16138d=
8e439bd90930845a65eafa7ebd67366e6bf633936d44014f6e4c959","src/unix/linux_li=
ke/linux/uclibc/arm/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec725=
1957315afa53a7b9f936","src/unix/linux_like/linux/uclibc/arm/mod.rs":"50288f=
f9e411ab0966da24838f2c2a5618021bc19c422a04f577b2979ef4081e","src/unix/linux=
_like/linux/uclibc/arm/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632=
b96b5c85a76f8316c86653db25","src/unix/linux_like/linux/uclibc/mips/mips32/a=
lign.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936"=
,"src/unix/linux_like/linux/uclibc/mips/mips32/mod.rs":"d0c4434e2bf813372c4=
18a8f516c706cdccc9f7be2f0921b2207b0afdb66fe81","src/unix/linux_like/linux/u=
clibc/mips/mips32/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5=
c85a76f8316c86653db25","src/unix/linux_like/linux/uclibc/mips/mips64/align.=
rs":"a7bdcb18a37a2d91e64d5fad83ea3edc78f5412adb28f77ab077dbb26dd08b2d","src=
/unix/linux_like/linux/uclibc/mips/mips64/mod.rs":"3f38ee6a4690b9d7594be20d=
216467a34d955f7653c2c8ce1e6147daeb53f1e0","src/unix/linux_like/linux/uclibc=
/mips/mips64/no_align.rs":"4a18e3875698c85229599225ac3401a2a40da87e77b2ad4e=
f47c6fcd5a24ed30","src/unix/linux_like/linux/uclibc/mips/mod.rs":"a048fce1c=
2d9b1ad57305642e8ad05ca0f0c7e4753267a2e2d6b4fee5db3b072","src/unix/linux_li=
ke/linux/uclibc/mod.rs":"1c3d25cddcfefa2bd17bdc81550826be31a08eef235e13f825=
f169a5029c8bca","src/unix/linux_like/linux/uclibc/no_align.rs":"3f286370465=
24618adaa1012e26cb7ffe94b9396e6b518cccdc69d59f274d709","src/unix/linux_like=
/linux/uclibc/x86_64/l4re.rs":"024eba5753e852dbdd212427351affe7e83f9916c186=
4bce414d7aa2618f192e","src/unix/linux_like/linux/uclibc/x86_64/mod.rs":"196=
d03affbefb85716937c15904831e731eb222ee906e05e42102d639a8152ea","src/unix/li=
nux_like/linux/uclibc/x86_64/other.rs":"42c3f71e58cabba373f6a55a623f3c31b85=
049eb64824c09c2b082b3b2d6a0a8","src/unix/linux_like/mod.rs":"45c98e7a0fad03=
b03c4c76f11a80e2423873f0a6563e35c60309a29b2c8ff44f","src/unix/mod.rs":"dd4c=
e377ba9517182e718848739a5c3f58cdbbcd4ee467eef9aaf8df5aed5053","src/unix/new=
lib/aarch64/mod.rs":"bac93836a9a57b2c710f32f852e92a4d11ad6759ab0fb6ad33e71d=
60e53278af","src/unix/newlib/align.rs":"28aaf87fafbc6b312622719d472d8cf65f9=
e5467d15339df5f73e66d8502b28a","src/unix/newlib/arm/mod.rs":"cbba6b3e957ece=
b496806e60de8725a23ff3fa0015983b4b4fa27b233732b526","src/unix/newlib/espidf=
/mod.rs":"816f235f4aa4baabba7f2606b31d0fdb03988c52194c966728de8690bf17299d"=
,"src/unix/newlib/generic.rs":"eab066d9f0a0f3eb53cc1073d01496bba0110989e1f6=
a59838afd19f870cd599","src/unix/newlib/horizon/mod.rs":"7cc5cc120437421db13=
9bfa6a90b18168cd3070bdd0f5be96d40fe4c996f3ca1","src/unix/newlib/mod.rs":"9e=
36de3fd78e10cb6b9a59dc5ebe5a1b44a63ccb91433bb33653fb30d0c303c6","src/unix/n=
ewlib/no_align.rs":"e0743b2179495a9514bc3a4d1781e492878c4ec834ee0085d0891dd=
1712e82fb","src/unix/newlib/powerpc/mod.rs":"0202ffd57caf75b6afa2c9717750ff=
b96e375ac33df0ae9609a3f831be393b67","src/unix/newlib/vita/mod.rs":"68e0ce18=
6b44e0b3031eb824710e7454dc2a9df98db98120840c3c6f4d885871","src/unix/no_alig=
n.rs":"c06e95373b9088266e0b14bba0954eef95f93fb2b01d951855e382d22de78e53","s=
rc/unix/nto/aarch64.rs":"4709c9afdc8d583be876598e7c238499ee3e8da5bd2baa614d=
9c7dd414851555","src/unix/nto/mod.rs":"59ab89a8fb6e0a6d22fa968ed4873c2bafa1=
9a0f60a90c9a5148816cb7440889","src/unix/nto/neutrino.rs":"799bff4ab01a6424d=
b6c5a2b76aa5679826d41495f9d13c63485bf13bc80026b","src/unix/nto/x86_64.rs":"=
a3e18e93c2999da1cd7a6f748a4b60c07aefb73d8ea2aafec19a84cfb040bc8e","src/unix=
/redox/mod.rs":"73658b0d28c82a122875aa2b45c489834f4de58c378add7932bbaf3ffb2=
ae789","src/unix/solarish/compat.rs":"00f1ee3faec9da69204e42f025f6735dd13d8=
94071a154425dcc43ecbdd06e7f","src/unix/solarish/illumos.rs":"cd93c2d84722bb=
f9933a92842a8998eb0b2afc962f50bc2546ad127b82809fa7","src/unix/solarish/mod.=
rs":"b1660c631a599a3355116e7485b88ab2f8f2929c2e37851a763431387b902f14","src=
/unix/solarish/solaris.rs":"41b350a89ddf01cd12a10f93640f92be53be0b0d976021c=
dc08da17bf3e72edf","src/unix/solarish/x86.rs":"e86e806df0caed72765040eaa2f3=
c883198d1aa91508540adf9b7008c77f522e","src/unix/solarish/x86_64.rs":"ec2b01=
f194eb8a6a27133c57681da195a949e03098f3ea1e847227a9c09ef5fc","src/unix/solar=
ish/x86_common.rs":"ac869d9c3c95645c22460468391eb1982023c3a8e02b9e06a72e3ae=
f3d5f1eac","src/vxworks/aarch64.rs":"98f0afdc511cd02557e506c21fed6737585490=
a1dce7a9d4941d08c437762b99","src/vxworks/arm.rs":"acb7968ce99fe3f4abdf39d98=
f8133d21a4fba435b8ef7084777cb181d788e88","src/vxworks/mod.rs":"e4edcbcf43a3=
25e738c9465507594d0c87abf3f0e2b9b046c1425f8d44bdad0f","src/vxworks/powerpc.=
rs":"acb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788e88","src=
/vxworks/powerpc64.rs":"98f0afdc511cd02557e506c21fed6737585490a1dce7a9d4941=
d08c437762b99","src/vxworks/x86.rs":"552f007f38317620b23889cb7c49d1d1158412=
52439060122f52f434fbc6e5ba","src/vxworks/x86_64.rs":"018d92be3ad628a129eff9=
f2f5dfbc0883d8b8e5f2fa917b900a7f98ed6b514a","src/wasi.rs":"09ee3b3348b212b0=
50f6ca8ae008a28679ea44a375674307a4e7c9ca0d3ed7d5","src/windows/gnu/align.rs=
":"b2c13ec1b9f3b39a75c452c80c951dff9d0215e31d77e883b4502afb31794647","src/w=
indows/gnu/mod.rs":"3c8c7edb7cdf5d0c44af936db2a94869585c69dfabeef30571b4f4e=
38375767a","src/windows/mod.rs":"9fdc5e1c62c441abef7bc62a7343efb2041edc24db=
9ac0efc0f74df55b69e249","src/windows/msvc/mod.rs":"c068271e00fca6b62bc4bf44=
bcf142cfc38caeded9b6c4e01d1ceef3ccf986f4","src/xous.rs":"eb0675f25ba01f7307=
2d2b70907fb8abb1148facefe5a20756c49250f3d65fae","tests/const_fn.rs":"cb75a1=
f0864f926aebe79118fc34d51a0d1ade2c20a394e7774c7e545f21f1f4"},"package":"9cd=
c71e17332e86d2e1d38c1f99edcb6288ee11b815fb1a4b049eaa2114d369b"}
> +\ No newline at end of file
> diff --git a/meta/recipes-devtools/rust/files/0003-musl-Move-F_OFD_GETLK-=
F_OFD_SETLK-and-F_OFD_SETLKW-t.patch b/meta/recipes-devtools/rust/files/000=
3-musl-Move-F_OFD_GETLK-F_OFD_SETLK-and-F_OFD_SETLKW-t.patch
> new file mode 100644
> index 000000000000..dfe20368a02f
> --- /dev/null
> +++ b/meta/recipes-devtools/rust/files/0003-musl-Move-F_OFD_GETLK-F_OFD_S=
ETLK-and-F_OFD_SETLKW-t.patch
> @@ -0,0 +1,205 @@
> +From 518f6e476531987a91a5273d81fbd0d5df77a19b Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sat, 8 Apr 2023 09:01:54 -0700
> +Subject: [PATCH 3/5] musl: Move F_OFD_GETLK, F_OFD_SETLK and F_OFD_SETLK=
W to
> + common location
> +
> +These defines are not architecture specific in musl [1] therefore move t=
hem
> +to be common
> +
> +[1] https://git.musl-libc.org/cgit/musl/tree/include/fcntl.h#n48
> +Upstream-Status: Backport [https://github.com/rust-lang/libc/pull/3302/c=
ommits/518f6e476531987a91a5273d81fbd0d5df77a19b]
> +Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> +---
> + src/unix/linux_like/linux/musl/b32/arm/mod.rs     | 3 ---
> + src/unix/linux_like/linux/musl/b32/hexagon.rs     | 3 ---
> + src/unix/linux_like/linux/musl/b32/mips/mod.rs    | 3 ---
> + src/unix/linux_like/linux/musl/b32/powerpc.rs     | 3 ---
> + src/unix/linux_like/linux/musl/b32/x86/mod.rs     | 3 ---
> + src/unix/linux_like/linux/musl/b64/aarch64/mod.rs | 3 ---
> + src/unix/linux_like/linux/musl/b64/mips64.rs      | 3 ---
> + src/unix/linux_like/linux/musl/b64/powerpc64.rs   | 3 ---
> + src/unix/linux_like/linux/musl/b64/riscv64/mod.rs | 3 ---
> + src/unix/linux_like/linux/musl/b64/s390x.rs       | 3 ---
> + src/unix/linux_like/linux/musl/b64/x86_64/mod.rs  | 3 ---
> + src/unix/linux_like/linux/musl/mod.rs             | 4 ++++
> + 12 files changed, 4 insertions(+), 33 deletions(-)
> +
> +Index: rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/a=
rm/mod.rs
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- rustc-1.74.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b32=
/arm/mod.rs
> ++++ rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/arm/=
mod.rs
> +@@ -449,9 +449,6 @@ pub const F_GETOWN: ::c_int =3D 9;
> + pub const F_SETLK: ::c_int =3D 13;
> + pub const F_SETLKW: ::c_int =3D 14;
> + pub const F_SETOWN: ::c_int =3D 8;
> +-pub const F_OFD_GETLK: ::c_int =3D 36;
> +-pub const F_OFD_SETLK: ::c_int =3D 37;
> +-pub const F_OFD_SETLKW: ::c_int =3D 38;
> +=20
> + pub const VEOF: usize =3D 4;
> + pub const VEOL: usize =3D 11;
> +Index: rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/h=
exagon.rs
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- rustc-1.74.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b32=
/hexagon.rs
> ++++ rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/hexa=
gon.rs
> +@@ -225,9 +225,6 @@ pub const F_GETOWN_EX: ::c_int =3D 16;
> + pub const F_GETSIG: ::c_int =3D 11;
> + pub const F_LINUX_SPECIFIC_BASE: ::c_int =3D 1024;
> + pub const FLUSHO: ::c_int =3D 4096;
> +-pub const F_OFD_GETLK: ::c_int =3D 36;
> +-pub const F_OFD_SETLK: ::c_int =3D 37;
> +-pub const F_OFD_SETLKW: ::c_int =3D 38;
> + pub const F_OWNER_PGRP: ::c_int =3D 2;
> + pub const F_OWNER_PID: ::c_int =3D 1;
> + pub const F_OWNER_TID: ::c_int =3D 0;
> +Index: rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/m=
ips/mod.rs
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- rustc-1.74.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b32=
/mips/mod.rs
> ++++ rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/mips=
/mod.rs
> +@@ -386,9 +386,6 @@ pub const F_GETOWN: ::c_int =3D 23;
> + pub const F_SETLK: ::c_int =3D 34;
> + pub const F_SETLKW: ::c_int =3D 35;
> + pub const F_SETOWN: ::c_int =3D 24;
> +-pub const F_OFD_GETLK: ::c_int =3D 36;
> +-pub const F_OFD_SETLK: ::c_int =3D 37;
> +-pub const F_OFD_SETLKW: ::c_int =3D 38;
> +=20
> + pub const VEOF: usize =3D 16;
> + pub const VEOL: usize =3D 17;
> +Index: rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/p=
owerpc.rs
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- rustc-1.74.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b32=
/powerpc.rs
> ++++ rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/powe=
rpc.rs
> +@@ -383,9 +383,6 @@ pub const F_GETOWN: ::c_int =3D 9;
> + pub const F_SETLK: ::c_int =3D 13;
> + pub const F_SETLKW: ::c_int =3D 14;
> + pub const F_SETOWN: ::c_int =3D 8;
> +-pub const F_OFD_GETLK: ::c_int =3D 36;
> +-pub const F_OFD_SETLK: ::c_int =3D 37;
> +-pub const F_OFD_SETLKW: ::c_int =3D 38;
> +=20
> + pub const VEOF: usize =3D 4;
> + pub const VEOL: usize =3D 6;
> +Index: rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/x=
86/mod.rs
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- rustc-1.74.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b32=
/x86/mod.rs
> ++++ rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/x86/=
mod.rs
> +@@ -439,9 +439,6 @@ pub const F_GETOWN: ::c_int =3D 9;
> + pub const F_SETLK: ::c_int =3D 13;
> + pub const F_SETLKW: ::c_int =3D 14;
> + pub const F_SETOWN: ::c_int =3D 8;
> +-pub const F_OFD_GETLK: ::c_int =3D 36;
> +-pub const F_OFD_SETLK: ::c_int =3D 37;
> +-pub const F_OFD_SETLKW: ::c_int =3D 38;
> +=20
> + pub const VEOF: usize =3D 4;
> + pub const VEOL: usize =3D 11;
> +Index: rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b64/a=
arch64/mod.rs
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- rustc-1.74.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b64=
/aarch64/mod.rs
> ++++ rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b64/aarc=
h64/mod.rs
> +@@ -250,9 +250,6 @@ pub const F_GETOWN: ::c_int =3D 9;
> + pub const F_SETLK: ::c_int =3D 6;
> + pub const F_SETLKW: ::c_int =3D 7;
> + pub const F_SETOWN: ::c_int =3D 8;
> +-pub const F_OFD_GETLK: ::c_int =3D 36;
> +-pub const F_OFD_SETLK: ::c_int =3D 37;
> +-pub const F_OFD_SETLKW: ::c_int =3D 38;
> +=20
> + pub const VEOF: usize =3D 4;
> +=20
> +Index: rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b64/m=
ips64.rs
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- rustc-1.74.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b64=
/mips64.rs
> ++++ rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b64/mips=
64.rs
> +@@ -612,9 +612,6 @@ pub const F_GETOWN: ::c_int =3D 23;
> + pub const F_SETOWN: ::c_int =3D 24;
> + pub const F_SETLK: ::c_int =3D 6;
> + pub const F_SETLKW: ::c_int =3D 7;
> +-pub const F_OFD_GETLK: ::c_int =3D 36;
> +-pub const F_OFD_SETLK: ::c_int =3D 37;
> +-pub const F_OFD_SETLKW: ::c_int =3D 38;
> +=20
> + pub const MCL_CURRENT: ::c_int =3D 0x0001;
> + pub const MCL_FUTURE: ::c_int =3D 0x0002;
> +Index: rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b64/p=
owerpc64.rs
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- rustc-1.74.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b64=
/powerpc64.rs
> ++++ rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b64/powe=
rpc64.rs
> +@@ -212,9 +212,6 @@ pub const F_GETOWN: ::c_int =3D 9;
> + pub const F_SETLK: ::c_int =3D 6;
> + pub const F_SETLKW: ::c_int =3D 7;
> + pub const F_SETOWN: ::c_int =3D 8;
> +-pub const F_OFD_GETLK: ::c_int =3D 36;
> +-pub const F_OFD_SETLK: ::c_int =3D 37;
> +-pub const F_OFD_SETLKW: ::c_int =3D 38;
> +=20
> + pub const VEOF: usize =3D 4;
> +=20
> +Index: rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b64/r=
iscv64/mod.rs
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- rustc-1.74.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b64=
/riscv64/mod.rs
> ++++ rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b64/risc=
v64/mod.rs
> +@@ -604,9 +604,6 @@ pub const F_GETOWN: ::c_int =3D 9;
> + pub const F_SETLK: ::c_int =3D 6;
> + pub const F_SETLKW: ::c_int =3D 7;
> + pub const F_SETOWN: ::c_int =3D 8;
> +-pub const F_OFD_GETLK: ::c_int =3D 36;
> +-pub const F_OFD_SETLK: ::c_int =3D 37;
> +-pub const F_OFD_SETLKW: ::c_int =3D 38;
> +=20
> + pub const VEOF: usize =3D 4;
> +=20
> +Index: rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b64/s=
390x.rs
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- rustc-1.74.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b64=
/s390x.rs
> ++++ rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b64/s390=
x.rs
> +@@ -296,9 +296,6 @@ pub const F_GETOWN: ::c_int =3D 9;
> + pub const F_SETOWN: ::c_int =3D 8;
> + pub const F_SETLK: ::c_int =3D 6;
> + pub const F_SETLKW: ::c_int =3D 7;
> +-pub const F_OFD_GETLK: ::c_int =3D 36;
> +-pub const F_OFD_SETLK: ::c_int =3D 37;
> +-pub const F_OFD_SETLKW: ::c_int =3D 38;
> +=20
> + pub const VTIME: usize =3D 5;
> + pub const VSWTC: usize =3D 7;
> +Index: rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b64/x=
86_64/mod.rs
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- rustc-1.74.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b64=
/x86_64/mod.rs
> ++++ rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b64/x86_=
64/mod.rs
> +@@ -805,9 +805,6 @@ pub const F_GETOWN: ::c_int =3D 9;
> + pub const F_SETLK: ::c_int =3D 6;
> + pub const F_SETLKW: ::c_int =3D 7;
> + pub const F_SETOWN: ::c_int =3D 8;
> +-pub const F_OFD_GETLK: ::c_int =3D 36;
> +-pub const F_OFD_SETLK: ::c_int =3D 37;
> +-pub const F_OFD_SETLKW: ::c_int =3D 38;
> +=20
> + pub const VEOF: usize =3D 4;
> +=20
> +Index: rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/mod.rs
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- rustc-1.74.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/mod=
=2Ers
> ++++ rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/mod.rs
> +@@ -512,6 +512,10 @@ pub const ECOMM: ::c_int =3D 70;
> + pub const EPROTO: ::c_int =3D 71;
> + pub const EDOTDOT: ::c_int =3D 73;
> +=20
> ++pub const F_OFD_GETLK: ::c_int =3D 36;
> ++pub const F_OFD_SETLK: ::c_int =3D 37;
> ++pub const F_OFD_SETLKW: ::c_int =3D 38;
> ++
> + pub const F_RDLCK: ::c_int =3D 0;
> + pub const F_WRLCK: ::c_int =3D 1;
> + pub const F_UNLCK: ::c_int =3D 2;
> +Index: rustc-1.74.0-src/vendor/libc/.cargo-checksum.json
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- rustc-1.74.0-src.orig/vendor/libc/.cargo-checksum.json
> ++++ rustc-1.74.0-src/vendor/libc/.cargo-checksum.json
> +@@ -1 +1 @@
> +-{"files":{"CONTRIBUTING.md":"bdc90b52cf803faac96e594069a86dd8ea150d5ba7=
fb3e6cadfc08dac4c7b0ce","Cargo.toml":"a58e58fa9bde015e08609ea2f17e56c5df7c8=
2aa6f3fa1a144c02ee4715227b9","LICENSE-APACHE":"62c7a1e35f56406896d7aa7ca52d=
0cc0d272ac022b5d2796e7d6905db8a3636a","LICENSE-MIT":"a8d47ff51ca256f56a8932=
dba07660672dbfe3004257ca8de708aac1415937a1","README.md":"ecc47e284f8d007fc0=
48666d5108dd41cdc440ab9eedfe8c47d1634613522787","build.rs":"9e94683e94db80e=
8282fce07549cf748d9037852fb06df1c7596bea2ed130d50","rustfmt.toml":"eaa2ea84=
fc1ba0359b77680804903e07bb38d257ab11986b95b158e460f787b2","src/fixed_width_=
ints.rs":"7f986e5f5e68d25ef04d386fd2f640e8be8f15427a8d4a458ea01d26b8dca0ca"=
,"src/fuchsia/aarch64.rs":"893fcec48142d273063ffd814dca33fbec92205fd39ada97=
075f85201d803996","src/fuchsia/align.rs":"ae1cf8f011a99737eabeb14ffff768e60=
f13b13363d7646744dbb0f443dab3d6","src/fuchsia/mod.rs":"30f4dc83ef120300d618=
96696512436377c5f36f1431d98ab7e01e498c0c47d5","src/fuchsia/no_align.rs":"30=
3f3f1b255e0088b5715094353cf00476131d8e94e6aebb3f469557771c8b8a","src/fuchsi=
a/riscv64.rs":"617cd75e79e0e20f664db764a4dc2a396d9fd11a4d95371acd91ed481129=
3b11","src/fuchsia/x86_64.rs":"93a3632b5cf67d2a6bcb7dc0a558605252d5fe689e0f=
38d8aa2ec5852255ac87","src/hermit/aarch64.rs":"86048676e335944c37a63d0083d0=
f368ae10ceccefeed9debb3bbe08777fc682","src/hermit/mod.rs":"d3bfce41e4463d4b=
e8020a2d063c9bfa8b665f45f1cc6cbf3163f5d01e7cb21f","src/hermit/x86_64.rs":"a=
b832b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/lib.r=
s":"24111461547739f3646f95bcb66c43f2ae679a727ff5938299434c522c02e458","src/=
macros.rs":"b457eb028b8e8ab3c24bb7292b874ad4e491edbb83594f6a3da024df5348c08=
8","src/psp.rs":"dd31aabd46171d474ec5828372e28588935120e7355c90c105360d8fa9=
264c1c","src/sgx.rs":"16a95cdefc81c5ee00d8353a60db363c4cc3e0f75abcd5d014472=
3f2a306ed1b","src/solid/aarch64.rs":"a726e47f324adf73a4a0b67a2c183408d0cad1=
05ae66acf36db37a42ab7f8707","src/solid/arm.rs":"e39a4f74ebbef3b97b8c95758ad=
741123d84ed3eb48d9cf4f1f4872097fc27fe","src/solid/mod.rs":"5f4151dca5132e4b=
4e4c23ab9737e12856dddbdc0ca3f7dbc004328ef3c8acde","src/switch.rs":"9da3dd39=
b3de45a7928789926e8572d00e1e11a39e6f7289a1349aadce90edba","src/unix/aix/mod=
=2Ers":"54229b5e774669c16912112e8b50fa938db76f534971222a11723a05195a0948","=
src/unix/aix/powerpc64.rs":"cf374d81139d45f9d77c6a764f640bfbf7e0a5903689652=
c8296f8e10d55169b","src/unix/align.rs":"2cdc7c826ef7ae61f5171c5ae8c445a743d=
86f1a7f2d9d7e4ceeec56d6874f65","src/unix/bsd/apple/b32/align.rs":"ec833a747=
866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/appl=
e/b32/mod.rs":"2546ad3eb6aecb95f916648bc63264117c92b4b4859532b34cb011e4c75a=
5a72","src/unix/bsd/apple/b64/aarch64/align.rs":"2eaf0f561a32bdcbf4e0477c88=
95d5e7bcb5cdebd5fef7b4df2ca8e38e144d94","src/unix/bsd/apple/b64/aarch64/mod=
=2Ers":"44c217a4f263afe7a97435de9323d20a96c37836f899ca0925306d4b7e073c27","=
src/unix/bsd/apple/b64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf=
4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b64/mod.rs":"f5e278a1af7fb3588=
91d1c9be4eb7e815aaca0c5cb738d0c3604ba2208a856f7","src/unix/bsd/apple/b64/x8=
6_64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b=
0e26c","src/unix/bsd/apple/b64/x86_64/mod.rs":"8c87c5855038aae5d433c8f5eb3b=
29b0a175879a0245342b3bfd83bdf4cfd936","src/unix/bsd/apple/long_array.rs":"3=
cf1f19b812e6d093c819dc65ce55b13491963e0780eda0d0bd1577603e81948","src/unix/=
bsd/apple/mod.rs":"0931fd351d585728e6384d7b952b8d816e9acdb9c86c172324445f3c=
33f692ca","src/unix/bsd/freebsdlike/dragonfly/errno.rs":"8295b8bb0dfd38d2cd=
b4d9192cdeeb534cc6c3b208170e64615fa3e0edb3e578","src/unix/bsd/freebsdlike/d=
ragonfly/mod.rs":"f2e78625fe1eb14f43e730a3987eba888cb8ac04c23008e7c2d2f7c72=
258b9e6","src/unix/bsd/freebsdlike/freebsd/aarch64.rs":"6c8e216385f53a4bf5f=
171749b57602fc34a4e4b160a44ca31c058cb0c8a2126","src/unix/bsd/freebsdlike/fr=
eebsd/arm.rs":"59d6a670eea562fb87686e243e0a84603d29a2028a3d4b3f99ccc01bd04d=
2f47","src/unix/bsd/freebsdlike/freebsd/freebsd11/b64.rs":"9808d152c1196aa6=
47f1b0f0cf84dac8c930da7d7f897a44975545e3d9d17681","src/unix/bsd/freebsdlike=
/freebsd/freebsd11/mod.rs":"e243ae0e89623d4fa9f85afe14369cc5fd5f2028ea71577=
3dbec722ba80dac1f","src/unix/bsd/freebsdlike/freebsd/freebsd12/b64.rs":"61c=
be45f8499bedb168106b686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bs=
d/freebsdlike/freebsd/freebsd12/mod.rs":"bef9fae288a4f29e941ea369be1cd20b17=
0040e60665a4d49a4a9e79009b72d8","src/unix/bsd/freebsdlike/freebsd/freebsd12=
/x86_64.rs":"2df36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd0=
52","src/unix/bsd/freebsdlike/freebsd/freebsd13/b64.rs":"61cbe45f8499bedb16=
8106b686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/f=
reebsd/freebsd13/mod.rs":"3c514e037694ce22724abb3c9c4687defda7f0e3456b615ca=
73593e860e38b16","src/unix/bsd/freebsdlike/freebsd/freebsd13/x86_64.rs":"2d=
f36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/b=
sd/freebsdlike/freebsd/freebsd14/b64.rs":"61cbe45f8499bedb168106b686d4f8239=
472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd1=
4/mod.rs":"318abe48bfdd1c74ecd6afbd6c9329c5c72ce4f7d420edd6be2fc12b223ae32f=
","src/unix/bsd/freebsdlike/freebsd/freebsd14/x86_64.rs":"e7b5863e222d6cc41=
6b6b0fbe71690fad909e899b4c4ae810bbca117e4fcb650","src/unix/bsd/freebsdlike/=
freebsd/mod.rs":"4c3cd57aaf7fbce072e28e0d2d285b5fda9702e924561d2fd01e49e6ee=
186a98","src/unix/bsd/freebsdlike/freebsd/powerpc.rs":"9ca3f82f88974e6db556=
9f2d76a5a3749b248a31747a6c0da5820492bdfeca42","src/unix/bsd/freebsdlike/fre=
ebsd/powerpc64.rs":"2dae3ecc87eac3b11657aa98915def55fc4b5c0de11fe26aae23329=
a54628a9a","src/unix/bsd/freebsdlike/freebsd/riscv64.rs":"fa4bed4c58cad24ba=
3395941c7fa6b11e089551a04714f9561078e400f5b2b62","src/unix/bsd/freebsdlike/=
freebsd/x86.rs":"6766e2ce85e187b306cd3b0b8d7e15b8f4042c5cff81d89b3af69ecc99=
c70ab0","src/unix/bsd/freebsdlike/freebsd/x86_64/align.rs":"0e1f69a88fca1c3=
2874b1daf5db3d446fefbe518dca497f096cc9168c39dde70","src/unix/bsd/freebsdlik=
e/freebsd/x86_64/mod.rs":"51e4dd0c8ae247bb652feda5adad9333ea3bb30c750c3a393=
5e0b0e47d7803eb","src/unix/bsd/freebsdlike/mod.rs":"0eacafac87fb3a32ef1b859=
80fece2792e70eba9856af18a7407cc35be68ea57","src/unix/bsd/mod.rs":"dad51a24a=
524e92bfe9de3ac3b7d394d86058b9b8a1ccd4efa9bbb5c78e7fa1a","src/unix/bsd/netb=
sdlike/mod.rs":"0a66f7de43710e35a6a546e6c39066aa8b91a6efadb71db88738b0a577f=
d5537","src/unix/bsd/netbsdlike/netbsd/aarch64.rs":"65dcb58d11e8d8028401a9d=
07ca3eb4cb4f053e04249cc877353449d84ccc4cb","src/unix/bsd/netbsdlike/netbsd/=
arm.rs":"58cdbb70b0d6f536551f0f3bb3725d2d75c4690db12c26c034e7d6ec4a924452",=
"src/unix/bsd/netbsdlike/netbsd/mod.rs":"90dd33ef20dc3be8aef5bd152a6a06e7ab=
34f9527b3978487b593aaa16a907bd","src/unix/bsd/netbsdlike/netbsd/powerpc.rs"=
:"ee7ff5d89d0ed22f531237b5059aa669df93a3b5c489fa641465ace8d405bf41","src/un=
ix/bsd/netbsdlike/netbsd/sparc64.rs":"9489f4b3e4566f43bb12dfb92238960613dac=
7f6a45cc13068a8d152b902d7d9","src/unix/bsd/netbsdlike/netbsd/x86.rs":"20692=
320e36bfe028d1a34d16fe12ca77aa909cb02bda167376f98f1a09aefe7","src/unix/bsd/=
netbsdlike/netbsd/x86_64.rs":"1afe5ef46b14397cdd68664b5b232e4f5b035b6db1d4c=
f411c899d51ebca9f30","src/unix/bsd/netbsdlike/openbsd/aarch64.rs":"dd91931d=
373b7ecaf6e2de25adadee10d16fa9b12c2cbacdff3eb291e1ba36af","src/unix/bsd/net=
bsdlike/openbsd/arm.rs":"01580d261bc6447bb327a0d982181b7bdabfa066cee65a3037=
3d3ced729ad307","src/unix/bsd/netbsdlike/openbsd/mips64.rs":"8532a189ae10c7=
d668d9d4065da8b05d124e09bd39442c9f74a7f231c43eca48","src/unix/bsd/netbsdlik=
e/openbsd/mod.rs":"c27c6673bd3628549083a094219831fd9343129f91067b562781617d=
2a887148","src/unix/bsd/netbsdlike/openbsd/powerpc.rs":"01580d261bc6447bb32=
7a0d982181b7bdabfa066cee65a30373d3ced729ad307","src/unix/bsd/netbsdlike/ope=
nbsd/powerpc64.rs":"1dd5449dd1fd3d51e30ffdeeaece91d0aaf05c710e0ac699fecc546=
1cfa2c28e","src/unix/bsd/netbsdlike/openbsd/riscv64.rs":"1dd5449dd1fd3d51e3=
0ffdeeaece91d0aaf05c710e0ac699fecc5461cfa2c28e","src/unix/bsd/netbsdlike/op=
enbsd/sparc64.rs":"d04fd287afbaa2c5df9d48c94e8374a532a3ba491b424ddf018270c7=
312f4085","src/unix/bsd/netbsdlike/openbsd/x86.rs":"6f7f5c4fde2a2259eb54789=
0cbd86570cea04ef85347d7569e94e679448bec87","src/unix/bsd/netbsdlike/openbsd=
/x86_64.rs":"d31db31630289c85af3339dbe357998a21ca584cbae31607448fe2cf7675a4=
e1","src/unix/haiku/b32.rs":"a2efdbf7158a6da341e1db9176b0ab193ba88b44961623=
9ed95dced11f54d87b","src/unix/haiku/b64.rs":"ff8115367d3d7d354f792d6176dfaa=
a26353f57056197b563bf4681f91ff7985","src/unix/haiku/mod.rs":"d7ec086b73db4f=
72799179627aa6330a513dcf786b06e19c75ff884d1235948e","src/unix/haiku/native.=
rs":"dbfcbf4954a79d1df2ff58e0590bbcb8c57dfc7a32392aa73ee4726b66bd6cc8","src=
/unix/haiku/x86_64.rs":"3ec3aeeb7ed208b8916f3e32d42bfd085ff5e16936a1a35d9a5=
2789f043b7237","src/unix/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f3=
68ae10ceccefeed9debb3bbe08777fc682","src/unix/hermit/mod.rs":"a1494a0bddf30=
1cceb0d9b8529a84b5882fe855ceae77a1c4e8d6034e705e26c","src/unix/hermit/x86_6=
4.rs":"ab832b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","s=
rc/unix/linux_like/android/b32/arm.rs":"ce582de7e983a33d3bfad13075c53aac901=
6cee35f06ad8653ee9072c3ec2564","src/unix/linux_like/android/b32/mod.rs":"7c=
173e0375119bf06a3081652faede95e5bcd6858e7576b7533d037978737c8f","src/unix/l=
inux_like/android/b32/x86/align.rs":"812914e4241df82e32b12375ca3374615dc3a4=
bdd4cf31f0423c5815320c0dab","src/unix/linux_like/android/b32/x86/mod.rs":"e=
6d107efbcd37b5b85dfa18f683300cbf768ffa0237997a9fa52b184a53323ac","src/unix/=
linux_like/android/b64/aarch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3=
ee2faf6fcae3770f9e505cddca35c7b","src/unix/linux_like/android/b64/aarch64/i=
nt128.rs":"1735f6f5c56770d20dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de=
","src/unix/linux_like/android/b64/aarch64/mod.rs":"10e963e29ff209703de6336=
c99cca96fd79789438d34c82a693eae56e8916c3c","src/unix/linux_like/android/b64=
/mod.rs":"71e4fcbe952bfa4a5f9022f3972e906917b38f729b9d8ef57cd5d179104894ac"=
,"src/unix/linux_like/android/b64/riscv64/align.rs":"0bf138f84e5327d8339bcd=
4adf071a6832b516445e597552c82bbd881095e3a8","src/unix/linux_like/android/b6=
4/riscv64/mod.rs":"19d4bf2237c47127eba9144e0b82e995bc079315e719179a91813b0a=
e7b0e49d","src/unix/linux_like/android/b64/x86_64/align.rs":"7169d07a9fd471=
6f7512719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/an=
droid/b64/x86_64/mod.rs":"4ec2de11a9b65c4325b7b991f0b99a414975e0e61ba8668ca=
ca5d921e9b314d1","src/unix/linux_like/android/mod.rs":"66a9e38a47493a42b3b1=
c325524f3c944e74d1e3e8ecce3cc276ec08fecab13b","src/unix/linux_like/emscript=
en/align.rs":"86c95cbed7a7161b1f23ee06843e7b0e2340ad92b2cb86fe2a8ef3e0e8c36=
216","src/unix/linux_like/emscripten/mod.rs":"67d6b90f539f746aa3290ea7f9d3f=
3f8d2d8a6557233584004ed5697f7821a50","src/unix/linux_like/emscripten/no_ali=
gn.rs":"0128e4aa721a9902754828b61b5ec7d8a86619983ed1e0544a85d35b1051fad6","=
src/unix/linux_like/linux/align.rs":"bc5abcd38e2320171e0981e773c9c5fe3e0d5a=
66fdff049228f6a1acad80ef8b","src/unix/linux_like/linux/arch/generic/mod.rs"=
:"fb5de1368cabae03d3ea0152159b7685a9d91efdecee4c5b83efc085ffef8a73","src/un=
ix/linux_like/linux/arch/mips/mod.rs":"75814e198d1a9a6808be3a5e5edb1bfdc57f=
75b06394e9040739be363c09d82f","src/unix/linux_like/linux/arch/mod.rs":"5bd5=
361f8a6ab4e18bbba6da9f92c164ae252b15a0ed10064812544aa1fdf198","src/unix/lin=
ux_like/linux/arch/powerpc/mod.rs":"bef6b7af9e5e2b4e5545c9c7e3e23a8b743277a=
0ed95853e7eddc38e44299f02","src/unix/linux_like/linux/arch/sparc/mod.rs":"9=
1593ec0440f1dd8f8e612028f432c44c14089286e2aca50e10511ab942db8c3","src/unix/=
linux_like/linux/gnu/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec72=
51957315afa53a7b9f936","src/unix/linux_like/linux/gnu/b32/arm/align.rs":"6e=
c0eb3ee93f7ae99fd714b4deabfb5e97fbcefd8c26f5a45fb8e7150899cdeb","src/unix/l=
inux_like/linux/gnu/b32/arm/mod.rs":"9ab3e97b579a9122690cd01026e14528862860=
346b700aafbb755a7e04054f7f","src/unix/linux_like/linux/gnu/b32/csky/align.r=
s":"3fed009dc9af3cc81be7087da9d2d7d1f39845e4497e290259c5cdbae25f039d","src/=
unix/linux_like/linux/gnu/b32/csky/mod.rs":"4c21d6e7463bb22f00b984294893d12=
c84018d5d26ec661d6a30f4a9625ba639","src/unix/linux_like/linux/gnu/b32/m68k/=
align.rs":"8faa92f77a9232c035418d45331774e64a9a841d99c91791570a203bf2b45bcb=
","src/unix/linux_like/linux/gnu/b32/m68k/mod.rs":"6aab7f1b864e9691d14aa7d3=
89f717c4077b8eed72a7f11e3b8c7fef245e4046","src/unix/linux_like/linux/gnu/b3=
2/mips/align.rs":"429fb5e005cb7143602d430098b6ebfb7d360685b194f333dfd587472=
ae954ee","src/unix/linux_like/linux/gnu/b32/mips/mod.rs":"6b9a5dac6f937ddc1=
453e808e3c43502c87143332df9e43ac64fb8b1eda6c116","src/unix/linux_like/linux=
/gnu/b32/mod.rs":"b56625dd20dd48a8699034d349ef089c540c0ddcbf8a3481d598d101f=
8b40b78","src/unix/linux_like/linux/gnu/b32/powerpc.rs":"5c5d90326b54b57b98=
eff4745fe7a3fb02f053b2dc782241a73e807b491936a3","src/unix/linux_like/linux/=
gnu/b32/riscv32/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd3=
7543efe86621b119","src/unix/linux_like/linux/gnu/b32/riscv32/mod.rs":"491a9=
a97cf712985b75d3ad714691ef60898d88c78bc386a6917de0a6774cc26","src/unix/linu=
x_like/linux/gnu/b32/sparc/align.rs":"21adbed27df73e2d1ed934aaf733a643003d7=
baf2bde9c48ea440895bcca6d41","src/unix/linux_like/linux/gnu/b32/sparc/mod.r=
s":"80894eece66e9348f45d1b07ad37c757ea694bbd10ed49d3f920b34e9f51a9a3","src/=
unix/linux_like/linux/gnu/b32/x86/align.rs":"e4bafdc4a519a7922a81b37a62bbfd=
1177a2f620890eef8f1fbc47162e9eb413","src/unix/linux_like/linux/gnu/b32/x86/=
mod.rs":"c703cc5e9de2dc31d9e5831bfb6f354d6e3518b2ae02263f68a9a70f1c0167e2",=
"src/unix/linux_like/linux/gnu/b64/aarch64/align.rs":"fdf1c72375a2167699157=
e0dd825422690bb6719f7bc69515a2e5846d0431d7c","src/unix/linux_like/linux/gnu=
/b64/aarch64/fallback.rs":"832e7487249c1c0bb6e9911ce3f7d32ca22378e42392ab83=
c56915cbc59d8be3","src/unix/linux_like/linux/gnu/b64/aarch64/ilp32.rs":"bf4=
611b737813deef6787babf6c01698605f3b75482269b8546318667bc68e29","src/unix/li=
nux_like/linux/gnu/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426442f09724d=
9b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/gnu/b64/aarch6=
4/lp64.rs":"11a950697fdda0258c6e37c6b13993348c8de4134105ed4faa79358e5317507=
2","src/unix/linux_like/linux/gnu/b64/aarch64/mod.rs":"172495fbfdf659b9b825=
148bffc2b62704f63fc872428617e868eb15802c9978","src/unix/linux_like/linux/gn=
u/b64/loongarch64/align.rs":"060aa33cc737966c691aab8511c5c5729e551458ce18d0=
e284e0d45f39beeb60","src/unix/linux_like/linux/gnu/b64/loongarch64/mod.rs":=
"18edada8aa5d4127d9aa1bd81c62b5a4209f1efd8b2b2631e801c9e855ab1480","src/uni=
x/linux_like/linux/gnu/b64/mips64/align.rs":"7169d07a9fd4716f7512719aec9fda=
5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/linux/gnu/b64/mips=
64/mod.rs":"628c410b9aaec3c8f43838a28616b577a1d6de60a9799b09bb884d80281f96e=
b","src/unix/linux_like/linux/gnu/b64/mod.rs":"6a160ef25439c4fecdb0e3bd0b81=
8742263c791364da874d4febd3aa644ec8e2","src/unix/linux_like/linux/gnu/b64/po=
werpc64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1=
268130d9","src/unix/linux_like/linux/gnu/b64/powerpc64/mod.rs":"c778a136f06=
c2ffeacea19fa14ce79b828f91b67a002dec5ce87289bae36234e","src/unix/linux_like=
/linux/gnu/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e5880=
3f99cd37543efe86621b119","src/unix/linux_like/linux/gnu/b64/riscv64/mod.rs"=
:"c8f07efc5ddd5d874f1ebc329cd6907818d132ac3e30f4f2a4b04be3fb388551","src/un=
ix/linux_like/linux/gnu/b64/s390x.rs":"a2fd9277c2dcf76f7a16a3bcca745d5a9932=
c765c0dc2feb31c3641be25eb0aa","src/unix/linux_like/linux/gnu/b64/sparc64/al=
ign.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268130d9",=
"src/unix/linux_like/linux/gnu/b64/sparc64/mod.rs":"e8047e9966a2b90063e0151=
a0278c54885e7b323286cf5ab55cbaf151fc772d3","src/unix/linux_like/linux/gnu/b=
64/x86_64/align.rs":"62e822478356db4a73b6bbd1b36d825b893939ab4b308ec11b0578=
bcc4b49769","src/unix/linux_like/linux/gnu/b64/x86_64/mod.rs":"891e595d3371=
4b9883b92f0554d1d361fba2b6c3f6cac09a288252f44c6ec667","src/unix/linux_like/=
linux/gnu/b64/x86_64/not_x32.rs":"38f74ce15d9662ce4818815a2b87be1618d5e45f1=
90f7e4db84ff3285b4421fb","src/unix/linux_like/linux/gnu/b64/x86_64/x32.rs":=
"b20218a11364a6dec87f96d6c0d8b19e660697ab09ad5ee0e9b3a9dafedaaebb","src/uni=
x/linux_like/linux/gnu/mod.rs":"47dd970aedda9c70429741d7c9892a0d5d264e9abcb=
1c41d5bb913a86f0a5362","src/unix/linux_like/linux/gnu/no_align.rs":"9cd2231=
35de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/linux_=
like/linux/mod.rs":"1582c09db7b752af0f796a4cba8aa2bb4ecea895c551a2219e76047=
bcce74a23","src/unix/linux_like/linux/musl/b32/arm/align.rs":"3e8ac052c1043=
764776b54c93ba4260e061df998631737a897d9d47d54f7b80c","src/unix/linux_like/l=
inux/musl/b32/arm/mod.rs":"b63a21b02ff1f55e3aca71af51a054d61fd2b4b452ccbf9f=
34acb431c51d00ea","src/unix/linux_like/linux/musl/b32/hexagon.rs":"f0b9505a=
5935f5fd163eebaa14d4c18ff948c4b199b03e5b88c91f99d4b0fce6","src/unix/linux_l=
ike/linux/musl/b32/mips/align.rs":"429fb5e005cb7143602d430098b6ebfb7d360685=
b194f333dfd587472ae954ee","src/unix/linux_like/linux/musl/b32/mips/mod.rs":=
"9b6dfc603accb6ef68010573f30b015868a1da1e1fc3ea2dc0337f33b4015ec6","src/uni=
x/linux_like/linux/musl/b32/mod.rs":"31677597fd9544c4b1ec1477628288f6273fab=
bc06e38f33da862ad55f019ce1","src/unix/linux_like/linux/musl/b32/powerpc.rs"=
:"0ebe9c42bb746583360d990d5a63a407075be3c7bdd260e5345e8aeac4d060cc","src/un=
ix/linux_like/linux/musl/b32/riscv32/align.rs":"efd2accf33b87de7c7547903359=
a5da896edc33cd6c719552c7474b60d4a5d48","src/unix/linux_like/linux/musl/b32/=
riscv32/mod.rs":"0576807c1dd05e2114c3d0c819ae5a99fb5668262de6f9eabbda73d974=
a6fd29","src/unix/linux_like/linux/musl/b32/x86/align.rs":"08e77fbd7435d7de=
c2ff56932433bece3f02e47ce810f89004a275a86d39cbe1","src/unix/linux_like/linu=
x/musl/b32/x86/mod.rs":"9283e5d343aa668a6c2e520fb7db2548f344f1f5adf63ec7961=
954b61e6f6fad","src/unix/linux_like/linux/musl/b64/aarch64/align.rs":"6ba32=
725d24d7d8e6aa111f3b57aafa318f83b606abe96561329151829821133","src/unix/linu=
x_like/linux/musl/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426442f09724d9=
b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/musl/b64/aarch6=
4/mod.rs":"31e75179cbb4e26425b3f5b052e358f593153da662884655e60801d852e55dc2=
","src/unix/linux_like/linux/musl/b64/mips64.rs":"9a5d29f666332bb056d0e2951=
e9de989aa1dc016075f009db3f2f628e0cdda8c","src/unix/linux_like/linux/musl/b6=
4/mod.rs":"8275e7a108c71f180de71b86f74baa1e35d9e915befb8ab8191d2a2fe76d3bb9=
","src/unix/linux_like/linux/musl/b64/powerpc64.rs":"e77f4cf5d65320023043e4=
354725397f6b079c1b7b6b3cef2c3293350b46b303","src/unix/linux_like/linux/musl=
/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd3754=
3efe86621b119","src/unix/linux_like/linux/musl/b64/riscv64/mod.rs":"a80b181=
3148dec8bc396c02638978c0b4e5e040edafd56d98f8683fe2ae51ab5","src/unix/linux_=
like/linux/musl/b64/s390x.rs":"80a92e54e47016d051c7bd55bee9580cbedd29816419=
9d71a67d49167e744432","src/unix/linux_like/linux/musl/b64/x86_64/align.rs":=
"77309276ad7a42cbe59ca381f23590b7a143aded05555b34a5b307b808cbca6e","src/uni=
x/linux_like/linux/musl/b64/x86_64/mod.rs":"032863c74d3ca73cb75483218f9bd77=
4ae1ae7d3646d2ffb21e4cc7d4b5e0e3d","src/unix/linux_like/linux/musl/lfs64.rs=
":"3e4fb381f3a0756520bde0f1692d4fa45e4ae8133bf7d7c64b0e3fdd512f235f","src/u=
nix/linux_like/linux/musl/mod.rs":"9bfa05126ad26ecaecb29ba01b6d768e0b5d72e6=
cfc7054e13f0d9365eb5735c","src/unix/linux_like/linux/no_align.rs":"62cdca0e=
011937aaf09a51ca86d9f0ee0fdb05f61ec3c058e6a5d5fa6357d784","src/unix/linux_l=
ike/linux/non_exhaustive.rs":"181a05bf94fdb911db83ce793b993bd6548a4115b306a=
7ef3c10f745a8fea3e9","src/unix/linux_like/linux/uclibc/align.rs":"9ed16138d=
8e439bd90930845a65eafa7ebd67366e6bf633936d44014f6e4c959","src/unix/linux_li=
ke/linux/uclibc/arm/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec725=
1957315afa53a7b9f936","src/unix/linux_like/linux/uclibc/arm/mod.rs":"50288f=
f9e411ab0966da24838f2c2a5618021bc19c422a04f577b2979ef4081e","src/unix/linux=
_like/linux/uclibc/arm/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632=
b96b5c85a76f8316c86653db25","src/unix/linux_like/linux/uclibc/mips/mips32/a=
lign.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936"=
,"src/unix/linux_like/linux/uclibc/mips/mips32/mod.rs":"d0c4434e2bf813372c4=
18a8f516c706cdccc9f7be2f0921b2207b0afdb66fe81","src/unix/linux_like/linux/u=
clibc/mips/mips32/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5=
c85a76f8316c86653db25","src/unix/linux_like/linux/uclibc/mips/mips64/align.=
rs":"a7bdcb18a37a2d91e64d5fad83ea3edc78f5412adb28f77ab077dbb26dd08b2d","src=
/unix/linux_like/linux/uclibc/mips/mips64/mod.rs":"3f38ee6a4690b9d7594be20d=
216467a34d955f7653c2c8ce1e6147daeb53f1e0","src/unix/linux_like/linux/uclibc=
/mips/mips64/no_align.rs":"4a18e3875698c85229599225ac3401a2a40da87e77b2ad4e=
f47c6fcd5a24ed30","src/unix/linux_like/linux/uclibc/mips/mod.rs":"a048fce1c=
2d9b1ad57305642e8ad05ca0f0c7e4753267a2e2d6b4fee5db3b072","src/unix/linux_li=
ke/linux/uclibc/mod.rs":"1c3d25cddcfefa2bd17bdc81550826be31a08eef235e13f825=
f169a5029c8bca","src/unix/linux_like/linux/uclibc/no_align.rs":"3f286370465=
24618adaa1012e26cb7ffe94b9396e6b518cccdc69d59f274d709","src/unix/linux_like=
/linux/uclibc/x86_64/l4re.rs":"024eba5753e852dbdd212427351affe7e83f9916c186=
4bce414d7aa2618f192e","src/unix/linux_like/linux/uclibc/x86_64/mod.rs":"196=
d03affbefb85716937c15904831e731eb222ee906e05e42102d639a8152ea","src/unix/li=
nux_like/linux/uclibc/x86_64/other.rs":"42c3f71e58cabba373f6a55a623f3c31b85=
049eb64824c09c2b082b3b2d6a0a8","src/unix/linux_like/mod.rs":"45c98e7a0fad03=
b03c4c76f11a80e2423873f0a6563e35c60309a29b2c8ff44f","src/unix/mod.rs":"dd4c=
e377ba9517182e718848739a5c3f58cdbbcd4ee467eef9aaf8df5aed5053","src/unix/new=
lib/aarch64/mod.rs":"bac93836a9a57b2c710f32f852e92a4d11ad6759ab0fb6ad33e71d=
60e53278af","src/unix/newlib/align.rs":"28aaf87fafbc6b312622719d472d8cf65f9=
e5467d15339df5f73e66d8502b28a","src/unix/newlib/arm/mod.rs":"cbba6b3e957ece=
b496806e60de8725a23ff3fa0015983b4b4fa27b233732b526","src/unix/newlib/espidf=
/mod.rs":"816f235f4aa4baabba7f2606b31d0fdb03988c52194c966728de8690bf17299d"=
,"src/unix/newlib/generic.rs":"eab066d9f0a0f3eb53cc1073d01496bba0110989e1f6=
a59838afd19f870cd599","src/unix/newlib/horizon/mod.rs":"7cc5cc120437421db13=
9bfa6a90b18168cd3070bdd0f5be96d40fe4c996f3ca1","src/unix/newlib/mod.rs":"9e=
36de3fd78e10cb6b9a59dc5ebe5a1b44a63ccb91433bb33653fb30d0c303c6","src/unix/n=
ewlib/no_align.rs":"e0743b2179495a9514bc3a4d1781e492878c4ec834ee0085d0891dd=
1712e82fb","src/unix/newlib/powerpc/mod.rs":"0202ffd57caf75b6afa2c9717750ff=
b96e375ac33df0ae9609a3f831be393b67","src/unix/newlib/vita/mod.rs":"68e0ce18=
6b44e0b3031eb824710e7454dc2a9df98db98120840c3c6f4d885871","src/unix/no_alig=
n.rs":"c06e95373b9088266e0b14bba0954eef95f93fb2b01d951855e382d22de78e53","s=
rc/unix/nto/aarch64.rs":"4709c9afdc8d583be876598e7c238499ee3e8da5bd2baa614d=
9c7dd414851555","src/unix/nto/mod.rs":"59ab89a8fb6e0a6d22fa968ed4873c2bafa1=
9a0f60a90c9a5148816cb7440889","src/unix/nto/neutrino.rs":"799bff4ab01a6424d=
b6c5a2b76aa5679826d41495f9d13c63485bf13bc80026b","src/unix/nto/x86_64.rs":"=
a3e18e93c2999da1cd7a6f748a4b60c07aefb73d8ea2aafec19a84cfb040bc8e","src/unix=
/redox/mod.rs":"73658b0d28c82a122875aa2b45c489834f4de58c378add7932bbaf3ffb2=
ae789","src/unix/solarish/compat.rs":"00f1ee3faec9da69204e42f025f6735dd13d8=
94071a154425dcc43ecbdd06e7f","src/unix/solarish/illumos.rs":"cd93c2d84722bb=
f9933a92842a8998eb0b2afc962f50bc2546ad127b82809fa7","src/unix/solarish/mod.=
rs":"b1660c631a599a3355116e7485b88ab2f8f2929c2e37851a763431387b902f14","src=
/unix/solarish/solaris.rs":"41b350a89ddf01cd12a10f93640f92be53be0b0d976021c=
dc08da17bf3e72edf","src/unix/solarish/x86.rs":"e86e806df0caed72765040eaa2f3=
c883198d1aa91508540adf9b7008c77f522e","src/unix/solarish/x86_64.rs":"ec2b01=
f194eb8a6a27133c57681da195a949e03098f3ea1e847227a9c09ef5fc","src/unix/solar=
ish/x86_common.rs":"ac869d9c3c95645c22460468391eb1982023c3a8e02b9e06a72e3ae=
f3d5f1eac","src/vxworks/aarch64.rs":"98f0afdc511cd02557e506c21fed6737585490=
a1dce7a9d4941d08c437762b99","src/vxworks/arm.rs":"acb7968ce99fe3f4abdf39d98=
f8133d21a4fba435b8ef7084777cb181d788e88","src/vxworks/mod.rs":"e4edcbcf43a3=
25e738c9465507594d0c87abf3f0e2b9b046c1425f8d44bdad0f","src/vxworks/powerpc.=
rs":"acb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788e88","src=
/vxworks/powerpc64.rs":"98f0afdc511cd02557e506c21fed6737585490a1dce7a9d4941=
d08c437762b99","src/vxworks/x86.rs":"552f007f38317620b23889cb7c49d1d1158412=
52439060122f52f434fbc6e5ba","src/vxworks/x86_64.rs":"018d92be3ad628a129eff9=
f2f5dfbc0883d8b8e5f2fa917b900a7f98ed6b514a","src/wasi.rs":"09ee3b3348b212b0=
50f6ca8ae008a28679ea44a375674307a4e7c9ca0d3ed7d5","src/windows/gnu/align.rs=
":"b2c13ec1b9f3b39a75c452c80c951dff9d0215e31d77e883b4502afb31794647","src/w=
indows/gnu/mod.rs":"3c8c7edb7cdf5d0c44af936db2a94869585c69dfabeef30571b4f4e=
38375767a","src/windows/mod.rs":"9fdc5e1c62c441abef7bc62a7343efb2041edc24db=
9ac0efc0f74df55b69e249","src/windows/msvc/mod.rs":"c068271e00fca6b62bc4bf44=
bcf142cfc38caeded9b6c4e01d1ceef3ccf986f4","src/xous.rs":"eb0675f25ba01f7307=
2d2b70907fb8abb1148facefe5a20756c49250f3d65fae","tests/const_fn.rs":"cb75a1=
f0864f926aebe79118fc34d51a0d1ade2c20a394e7774c7e545f21f1f4"},"package":"9cd=
c71e17332e86d2e1d38c1f99edcb6288ee11b815fb1a4b049eaa2114d369b"}
> +\ No newline at end of file
> ++{"files":{"CONTRIBUTING.md":"bdc90b52cf803faac96e594069a86dd8ea150d5ba7=
fb3e6cadfc08dac4c7b0ce","Cargo.toml":"a58e58fa9bde015e08609ea2f17e56c5df7c8=
2aa6f3fa1a144c02ee4715227b9","LICENSE-APACHE":"62c7a1e35f56406896d7aa7ca52d=
0cc0d272ac022b5d2796e7d6905db8a3636a","LICENSE-MIT":"a8d47ff51ca256f56a8932=
dba07660672dbfe3004257ca8de708aac1415937a1","README.md":"ecc47e284f8d007fc0=
48666d5108dd41cdc440ab9eedfe8c47d1634613522787","build.rs":"9e94683e94db80e=
8282fce07549cf748d9037852fb06df1c7596bea2ed130d50","rustfmt.toml":"eaa2ea84=
fc1ba0359b77680804903e07bb38d257ab11986b95b158e460f787b2","src/fixed_width_=
ints.rs":"7f986e5f5e68d25ef04d386fd2f640e8be8f15427a8d4a458ea01d26b8dca0ca"=
,"src/fuchsia/aarch64.rs":"893fcec48142d273063ffd814dca33fbec92205fd39ada97=
075f85201d803996","src/fuchsia/align.rs":"ae1cf8f011a99737eabeb14ffff768e60=
f13b13363d7646744dbb0f443dab3d6","src/fuchsia/mod.rs":"30f4dc83ef120300d618=
96696512436377c5f36f1431d98ab7e01e498c0c47d5","src/fuchsia/no_align.rs":"30=
3f3f1b255e0088b5715094353cf00476131d8e94e6aebb3f469557771c8b8a","src/fuchsi=
a/riscv64.rs":"617cd75e79e0e20f664db764a4dc2a396d9fd11a4d95371acd91ed481129=
3b11","src/fuchsia/x86_64.rs":"93a3632b5cf67d2a6bcb7dc0a558605252d5fe689e0f=
38d8aa2ec5852255ac87","src/hermit/aarch64.rs":"86048676e335944c37a63d0083d0=
f368ae10ceccefeed9debb3bbe08777fc682","src/hermit/mod.rs":"d3bfce41e4463d4b=
e8020a2d063c9bfa8b665f45f1cc6cbf3163f5d01e7cb21f","src/hermit/x86_64.rs":"a=
b832b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/lib.r=
s":"24111461547739f3646f95bcb66c43f2ae679a727ff5938299434c522c02e458","src/=
macros.rs":"b457eb028b8e8ab3c24bb7292b874ad4e491edbb83594f6a3da024df5348c08=
8","src/psp.rs":"dd31aabd46171d474ec5828372e28588935120e7355c90c105360d8fa9=
264c1c","src/sgx.rs":"16a95cdefc81c5ee00d8353a60db363c4cc3e0f75abcd5d014472=
3f2a306ed1b","src/solid/aarch64.rs":"a726e47f324adf73a4a0b67a2c183408d0cad1=
05ae66acf36db37a42ab7f8707","src/solid/arm.rs":"e39a4f74ebbef3b97b8c95758ad=
741123d84ed3eb48d9cf4f1f4872097fc27fe","src/solid/mod.rs":"5f4151dca5132e4b=
4e4c23ab9737e12856dddbdc0ca3f7dbc004328ef3c8acde","src/switch.rs":"9da3dd39=
b3de45a7928789926e8572d00e1e11a39e6f7289a1349aadce90edba","src/unix/aix/mod=
=2Ers":"54229b5e774669c16912112e8b50fa938db76f534971222a11723a05195a0948","=
src/unix/aix/powerpc64.rs":"cf374d81139d45f9d77c6a764f640bfbf7e0a5903689652=
c8296f8e10d55169b","src/unix/align.rs":"2cdc7c826ef7ae61f5171c5ae8c445a743d=
86f1a7f2d9d7e4ceeec56d6874f65","src/unix/bsd/apple/b32/align.rs":"ec833a747=
866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/appl=
e/b32/mod.rs":"2546ad3eb6aecb95f916648bc63264117c92b4b4859532b34cb011e4c75a=
5a72","src/unix/bsd/apple/b64/aarch64/align.rs":"2eaf0f561a32bdcbf4e0477c88=
95d5e7bcb5cdebd5fef7b4df2ca8e38e144d94","src/unix/bsd/apple/b64/aarch64/mod=
=2Ers":"44c217a4f263afe7a97435de9323d20a96c37836f899ca0925306d4b7e073c27","=
src/unix/bsd/apple/b64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf=
4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b64/mod.rs":"f5e278a1af7fb3588=
91d1c9be4eb7e815aaca0c5cb738d0c3604ba2208a856f7","src/unix/bsd/apple/b64/x8=
6_64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b=
0e26c","src/unix/bsd/apple/b64/x86_64/mod.rs":"8c87c5855038aae5d433c8f5eb3b=
29b0a175879a0245342b3bfd83bdf4cfd936","src/unix/bsd/apple/long_array.rs":"3=
cf1f19b812e6d093c819dc65ce55b13491963e0780eda0d0bd1577603e81948","src/unix/=
bsd/apple/mod.rs":"0931fd351d585728e6384d7b952b8d816e9acdb9c86c172324445f3c=
33f692ca","src/unix/bsd/freebsdlike/dragonfly/errno.rs":"8295b8bb0dfd38d2cd=
b4d9192cdeeb534cc6c3b208170e64615fa3e0edb3e578","src/unix/bsd/freebsdlike/d=
ragonfly/mod.rs":"f2e78625fe1eb14f43e730a3987eba888cb8ac04c23008e7c2d2f7c72=
258b9e6","src/unix/bsd/freebsdlike/freebsd/aarch64.rs":"6c8e216385f53a4bf5f=
171749b57602fc34a4e4b160a44ca31c058cb0c8a2126","src/unix/bsd/freebsdlike/fr=
eebsd/arm.rs":"59d6a670eea562fb87686e243e0a84603d29a2028a3d4b3f99ccc01bd04d=
2f47","src/unix/bsd/freebsdlike/freebsd/freebsd11/b64.rs":"9808d152c1196aa6=
47f1b0f0cf84dac8c930da7d7f897a44975545e3d9d17681","src/unix/bsd/freebsdlike=
/freebsd/freebsd11/mod.rs":"e243ae0e89623d4fa9f85afe14369cc5fd5f2028ea71577=
3dbec722ba80dac1f","src/unix/bsd/freebsdlike/freebsd/freebsd12/b64.rs":"61c=
be45f8499bedb168106b686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bs=
d/freebsdlike/freebsd/freebsd12/mod.rs":"bef9fae288a4f29e941ea369be1cd20b17=
0040e60665a4d49a4a9e79009b72d8","src/unix/bsd/freebsdlike/freebsd/freebsd12=
/x86_64.rs":"2df36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd0=
52","src/unix/bsd/freebsdlike/freebsd/freebsd13/b64.rs":"61cbe45f8499bedb16=
8106b686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/f=
reebsd/freebsd13/mod.rs":"3c514e037694ce22724abb3c9c4687defda7f0e3456b615ca=
73593e860e38b16","src/unix/bsd/freebsdlike/freebsd/freebsd13/x86_64.rs":"2d=
f36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/b=
sd/freebsdlike/freebsd/freebsd14/b64.rs":"61cbe45f8499bedb168106b686d4f8239=
472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd1=
4/mod.rs":"318abe48bfdd1c74ecd6afbd6c9329c5c72ce4f7d420edd6be2fc12b223ae32f=
","src/unix/bsd/freebsdlike/freebsd/freebsd14/x86_64.rs":"e7b5863e222d6cc41=
6b6b0fbe71690fad909e899b4c4ae810bbca117e4fcb650","src/unix/bsd/freebsdlike/=
freebsd/mod.rs":"4c3cd57aaf7fbce072e28e0d2d285b5fda9702e924561d2fd01e49e6ee=
186a98","src/unix/bsd/freebsdlike/freebsd/powerpc.rs":"9ca3f82f88974e6db556=
9f2d76a5a3749b248a31747a6c0da5820492bdfeca42","src/unix/bsd/freebsdlike/fre=
ebsd/powerpc64.rs":"2dae3ecc87eac3b11657aa98915def55fc4b5c0de11fe26aae23329=
a54628a9a","src/unix/bsd/freebsdlike/freebsd/riscv64.rs":"fa4bed4c58cad24ba=
3395941c7fa6b11e089551a04714f9561078e400f5b2b62","src/unix/bsd/freebsdlike/=
freebsd/x86.rs":"6766e2ce85e187b306cd3b0b8d7e15b8f4042c5cff81d89b3af69ecc99=
c70ab0","src/unix/bsd/freebsdlike/freebsd/x86_64/align.rs":"0e1f69a88fca1c3=
2874b1daf5db3d446fefbe518dca497f096cc9168c39dde70","src/unix/bsd/freebsdlik=
e/freebsd/x86_64/mod.rs":"51e4dd0c8ae247bb652feda5adad9333ea3bb30c750c3a393=
5e0b0e47d7803eb","src/unix/bsd/freebsdlike/mod.rs":"0eacafac87fb3a32ef1b859=
80fece2792e70eba9856af18a7407cc35be68ea57","src/unix/bsd/mod.rs":"dad51a24a=
524e92bfe9de3ac3b7d394d86058b9b8a1ccd4efa9bbb5c78e7fa1a","src/unix/bsd/netb=
sdlike/mod.rs":"0a66f7de43710e35a6a546e6c39066aa8b91a6efadb71db88738b0a577f=
d5537","src/unix/bsd/netbsdlike/netbsd/aarch64.rs":"65dcb58d11e8d8028401a9d=
07ca3eb4cb4f053e04249cc877353449d84ccc4cb","src/unix/bsd/netbsdlike/netbsd/=
arm.rs":"58cdbb70b0d6f536551f0f3bb3725d2d75c4690db12c26c034e7d6ec4a924452",=
"src/unix/bsd/netbsdlike/netbsd/mod.rs":"90dd33ef20dc3be8aef5bd152a6a06e7ab=
34f9527b3978487b593aaa16a907bd","src/unix/bsd/netbsdlike/netbsd/powerpc.rs"=
:"ee7ff5d89d0ed22f531237b5059aa669df93a3b5c489fa641465ace8d405bf41","src/un=
ix/bsd/netbsdlike/netbsd/sparc64.rs":"9489f4b3e4566f43bb12dfb92238960613dac=
7f6a45cc13068a8d152b902d7d9","src/unix/bsd/netbsdlike/netbsd/x86.rs":"20692=
320e36bfe028d1a34d16fe12ca77aa909cb02bda167376f98f1a09aefe7","src/unix/bsd/=
netbsdlike/netbsd/x86_64.rs":"1afe5ef46b14397cdd68664b5b232e4f5b035b6db1d4c=
f411c899d51ebca9f30","src/unix/bsd/netbsdlike/openbsd/aarch64.rs":"dd91931d=
373b7ecaf6e2de25adadee10d16fa9b12c2cbacdff3eb291e1ba36af","src/unix/bsd/net=
bsdlike/openbsd/arm.rs":"01580d261bc6447bb327a0d982181b7bdabfa066cee65a3037=
3d3ced729ad307","src/unix/bsd/netbsdlike/openbsd/mips64.rs":"8532a189ae10c7=
d668d9d4065da8b05d124e09bd39442c9f74a7f231c43eca48","src/unix/bsd/netbsdlik=
e/openbsd/mod.rs":"c27c6673bd3628549083a094219831fd9343129f91067b562781617d=
2a887148","src/unix/bsd/netbsdlike/openbsd/powerpc.rs":"01580d261bc6447bb32=
7a0d982181b7bdabfa066cee65a30373d3ced729ad307","src/unix/bsd/netbsdlike/ope=
nbsd/powerpc64.rs":"1dd5449dd1fd3d51e30ffdeeaece91d0aaf05c710e0ac699fecc546=
1cfa2c28e","src/unix/bsd/netbsdlike/openbsd/riscv64.rs":"1dd5449dd1fd3d51e3=
0ffdeeaece91d0aaf05c710e0ac699fecc5461cfa2c28e","src/unix/bsd/netbsdlike/op=
enbsd/sparc64.rs":"d04fd287afbaa2c5df9d48c94e8374a532a3ba491b424ddf018270c7=
312f4085","src/unix/bsd/netbsdlike/openbsd/x86.rs":"6f7f5c4fde2a2259eb54789=
0cbd86570cea04ef85347d7569e94e679448bec87","src/unix/bsd/netbsdlike/openbsd=
/x86_64.rs":"d31db31630289c85af3339dbe357998a21ca584cbae31607448fe2cf7675a4=
e1","src/unix/haiku/b32.rs":"a2efdbf7158a6da341e1db9176b0ab193ba88b44961623=
9ed95dced11f54d87b","src/unix/haiku/b64.rs":"ff8115367d3d7d354f792d6176dfaa=
a26353f57056197b563bf4681f91ff7985","src/unix/haiku/mod.rs":"d7ec086b73db4f=
72799179627aa6330a513dcf786b06e19c75ff884d1235948e","src/unix/haiku/native.=
rs":"dbfcbf4954a79d1df2ff58e0590bbcb8c57dfc7a32392aa73ee4726b66bd6cc8","src=
/unix/haiku/x86_64.rs":"3ec3aeeb7ed208b8916f3e32d42bfd085ff5e16936a1a35d9a5=
2789f043b7237","src/unix/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f3=
68ae10ceccefeed9debb3bbe08777fc682","src/unix/hermit/mod.rs":"a1494a0bddf30=
1cceb0d9b8529a84b5882fe855ceae77a1c4e8d6034e705e26c","src/unix/hermit/x86_6=
4.rs":"ab832b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","s=
rc/unix/linux_like/android/b32/arm.rs":"ce582de7e983a33d3bfad13075c53aac901=
6cee35f06ad8653ee9072c3ec2564","src/unix/linux_like/android/b32/mod.rs":"7c=
173e0375119bf06a3081652faede95e5bcd6858e7576b7533d037978737c8f","src/unix/l=
inux_like/android/b32/x86/align.rs":"812914e4241df82e32b12375ca3374615dc3a4=
bdd4cf31f0423c5815320c0dab","src/unix/linux_like/android/b32/x86/mod.rs":"e=
6d107efbcd37b5b85dfa18f683300cbf768ffa0237997a9fa52b184a53323ac","src/unix/=
linux_like/android/b64/aarch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3=
ee2faf6fcae3770f9e505cddca35c7b","src/unix/linux_like/android/b64/aarch64/i=
nt128.rs":"1735f6f5c56770d20dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de=
","src/unix/linux_like/android/b64/aarch64/mod.rs":"10e963e29ff209703de6336=
c99cca96fd79789438d34c82a693eae56e8916c3c","src/unix/linux_like/android/b64=
/mod.rs":"71e4fcbe952bfa4a5f9022f3972e906917b38f729b9d8ef57cd5d179104894ac"=
,"src/unix/linux_like/android/b64/riscv64/align.rs":"0bf138f84e5327d8339bcd=
4adf071a6832b516445e597552c82bbd881095e3a8","src/unix/linux_like/android/b6=
4/riscv64/mod.rs":"19d4bf2237c47127eba9144e0b82e995bc079315e719179a91813b0a=
e7b0e49d","src/unix/linux_like/android/b64/x86_64/align.rs":"7169d07a9fd471=
6f7512719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/an=
droid/b64/x86_64/mod.rs":"4ec2de11a9b65c4325b7b991f0b99a414975e0e61ba8668ca=
ca5d921e9b314d1","src/unix/linux_like/android/mod.rs":"66a9e38a47493a42b3b1=
c325524f3c944e74d1e3e8ecce3cc276ec08fecab13b","src/unix/linux_like/emscript=
en/align.rs":"86c95cbed7a7161b1f23ee06843e7b0e2340ad92b2cb86fe2a8ef3e0e8c36=
216","src/unix/linux_like/emscripten/mod.rs":"67d6b90f539f746aa3290ea7f9d3f=
3f8d2d8a6557233584004ed5697f7821a50","src/unix/linux_like/emscripten/no_ali=
gn.rs":"0128e4aa721a9902754828b61b5ec7d8a86619983ed1e0544a85d35b1051fad6","=
src/unix/linux_like/linux/align.rs":"bc5abcd38e2320171e0981e773c9c5fe3e0d5a=
66fdff049228f6a1acad80ef8b","src/unix/linux_like/linux/arch/generic/mod.rs"=
:"fb5de1368cabae03d3ea0152159b7685a9d91efdecee4c5b83efc085ffef8a73","src/un=
ix/linux_like/linux/arch/mips/mod.rs":"75814e198d1a9a6808be3a5e5edb1bfdc57f=
75b06394e9040739be363c09d82f","src/unix/linux_like/linux/arch/mod.rs":"5bd5=
361f8a6ab4e18bbba6da9f92c164ae252b15a0ed10064812544aa1fdf198","src/unix/lin=
ux_like/linux/arch/powerpc/mod.rs":"bef6b7af9e5e2b4e5545c9c7e3e23a8b743277a=
0ed95853e7eddc38e44299f02","src/unix/linux_like/linux/arch/sparc/mod.rs":"9=
1593ec0440f1dd8f8e612028f432c44c14089286e2aca50e10511ab942db8c3","src/unix/=
linux_like/linux/gnu/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec72=
51957315afa53a7b9f936","src/unix/linux_like/linux/gnu/b32/arm/align.rs":"6e=
c0eb3ee93f7ae99fd714b4deabfb5e97fbcefd8c26f5a45fb8e7150899cdeb","src/unix/l=
inux_like/linux/gnu/b32/arm/mod.rs":"9ab3e97b579a9122690cd01026e14528862860=
346b700aafbb755a7e04054f7f","src/unix/linux_like/linux/gnu/b32/csky/align.r=
s":"3fed009dc9af3cc81be7087da9d2d7d1f39845e4497e290259c5cdbae25f039d","src/=
unix/linux_like/linux/gnu/b32/csky/mod.rs":"4c21d6e7463bb22f00b984294893d12=
c84018d5d26ec661d6a30f4a9625ba639","src/unix/linux_like/linux/gnu/b32/m68k/=
align.rs":"8faa92f77a9232c035418d45331774e64a9a841d99c91791570a203bf2b45bcb=
","src/unix/linux_like/linux/gnu/b32/m68k/mod.rs":"6aab7f1b864e9691d14aa7d3=
89f717c4077b8eed72a7f11e3b8c7fef245e4046","src/unix/linux_like/linux/gnu/b3=
2/mips/align.rs":"429fb5e005cb7143602d430098b6ebfb7d360685b194f333dfd587472=
ae954ee","src/unix/linux_like/linux/gnu/b32/mips/mod.rs":"6b9a5dac6f937ddc1=
453e808e3c43502c87143332df9e43ac64fb8b1eda6c116","src/unix/linux_like/linux=
/gnu/b32/mod.rs":"b56625dd20dd48a8699034d349ef089c540c0ddcbf8a3481d598d101f=
8b40b78","src/unix/linux_like/linux/gnu/b32/powerpc.rs":"5c5d90326b54b57b98=
eff4745fe7a3fb02f053b2dc782241a73e807b491936a3","src/unix/linux_like/linux/=
gnu/b32/riscv32/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd3=
7543efe86621b119","src/unix/linux_like/linux/gnu/b32/riscv32/mod.rs":"491a9=
a97cf712985b75d3ad714691ef60898d88c78bc386a6917de0a6774cc26","src/unix/linu=
x_like/linux/gnu/b32/sparc/align.rs":"21adbed27df73e2d1ed934aaf733a643003d7=
baf2bde9c48ea440895bcca6d41","src/unix/linux_like/linux/gnu/b32/sparc/mod.r=
s":"80894eece66e9348f45d1b07ad37c757ea694bbd10ed49d3f920b34e9f51a9a3","src/=
unix/linux_like/linux/gnu/b32/x86/align.rs":"e4bafdc4a519a7922a81b37a62bbfd=
1177a2f620890eef8f1fbc47162e9eb413","src/unix/linux_like/linux/gnu/b32/x86/=
mod.rs":"c703cc5e9de2dc31d9e5831bfb6f354d6e3518b2ae02263f68a9a70f1c0167e2",=
"src/unix/linux_like/linux/gnu/b64/aarch64/align.rs":"fdf1c72375a2167699157=
e0dd825422690bb6719f7bc69515a2e5846d0431d7c","src/unix/linux_like/linux/gnu=
/b64/aarch64/fallback.rs":"832e7487249c1c0bb6e9911ce3f7d32ca22378e42392ab83=
c56915cbc59d8be3","src/unix/linux_like/linux/gnu/b64/aarch64/ilp32.rs":"bf4=
611b737813deef6787babf6c01698605f3b75482269b8546318667bc68e29","src/unix/li=
nux_like/linux/gnu/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426442f09724d=
9b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/gnu/b64/aarch6=
4/lp64.rs":"11a950697fdda0258c6e37c6b13993348c8de4134105ed4faa79358e5317507=
2","src/unix/linux_like/linux/gnu/b64/aarch64/mod.rs":"172495fbfdf659b9b825=
148bffc2b62704f63fc872428617e868eb15802c9978","src/unix/linux_like/linux/gn=
u/b64/loongarch64/align.rs":"060aa33cc737966c691aab8511c5c5729e551458ce18d0=
e284e0d45f39beeb60","src/unix/linux_like/linux/gnu/b64/loongarch64/mod.rs":=
"18edada8aa5d4127d9aa1bd81c62b5a4209f1efd8b2b2631e801c9e855ab1480","src/uni=
x/linux_like/linux/gnu/b64/mips64/align.rs":"7169d07a9fd4716f7512719aec9fda=
5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/linux/gnu/b64/mips=
64/mod.rs":"628c410b9aaec3c8f43838a28616b577a1d6de60a9799b09bb884d80281f96e=
b","src/unix/linux_like/linux/gnu/b64/mod.rs":"6a160ef25439c4fecdb0e3bd0b81=
8742263c791364da874d4febd3aa644ec8e2","src/unix/linux_like/linux/gnu/b64/po=
werpc64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1=
268130d9","src/unix/linux_like/linux/gnu/b64/powerpc64/mod.rs":"c778a136f06=
c2ffeacea19fa14ce79b828f91b67a002dec5ce87289bae36234e","src/unix/linux_like=
/linux/gnu/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e5880=
3f99cd37543efe86621b119","src/unix/linux_like/linux/gnu/b64/riscv64/mod.rs"=
:"c8f07efc5ddd5d874f1ebc329cd6907818d132ac3e30f4f2a4b04be3fb388551","src/un=
ix/linux_like/linux/gnu/b64/s390x.rs":"a2fd9277c2dcf76f7a16a3bcca745d5a9932=
c765c0dc2feb31c3641be25eb0aa","src/unix/linux_like/linux/gnu/b64/sparc64/al=
ign.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268130d9",=
"src/unix/linux_like/linux/gnu/b64/sparc64/mod.rs":"e8047e9966a2b90063e0151=
a0278c54885e7b323286cf5ab55cbaf151fc772d3","src/unix/linux_like/linux/gnu/b=
64/x86_64/align.rs":"62e822478356db4a73b6bbd1b36d825b893939ab4b308ec11b0578=
bcc4b49769","src/unix/linux_like/linux/gnu/b64/x86_64/mod.rs":"891e595d3371=
4b9883b92f0554d1d361fba2b6c3f6cac09a288252f44c6ec667","src/unix/linux_like/=
linux/gnu/b64/x86_64/not_x32.rs":"38f74ce15d9662ce4818815a2b87be1618d5e45f1=
90f7e4db84ff3285b4421fb","src/unix/linux_like/linux/gnu/b64/x86_64/x32.rs":=
"b20218a11364a6dec87f96d6c0d8b19e660697ab09ad5ee0e9b3a9dafedaaebb","src/uni=
x/linux_like/linux/gnu/mod.rs":"47dd970aedda9c70429741d7c9892a0d5d264e9abcb=
1c41d5bb913a86f0a5362","src/unix/linux_like/linux/gnu/no_align.rs":"9cd2231=
35de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/linux_=
like/linux/mod.rs":"1582c09db7b752af0f796a4cba8aa2bb4ecea895c551a2219e76047=
bcce74a23","src/unix/linux_like/linux/musl/b32/arm/align.rs":"3e8ac052c1043=
764776b54c93ba4260e061df998631737a897d9d47d54f7b80c","src/unix/linux_like/l=
inux/musl/b32/arm/mod.rs":"de0473ef4455fa461c00442f041ec110e6667614b00bb233=
85f35af95d24f668","src/unix/linux_like/linux/musl/b32/hexagon.rs":"4f9a5b3b=
45bc970611597f40add2c489de0fa8ad9dd77629e4daa1755c5e2918","src/unix/linux_l=
ike/linux/musl/b32/mips/align.rs":"429fb5e005cb7143602d430098b6ebfb7d360685=
b194f333dfd587472ae954ee","src/unix/linux_like/linux/musl/b32/mips/mod.rs":=
"8c7de54a04495204772b4bd622b6d34696d27b73ea9e097eb53afa1a7806e31f","src/uni=
x/linux_like/linux/musl/b32/mod.rs":"31677597fd9544c4b1ec1477628288f6273fab=
bc06e38f33da862ad55f019ce1","src/unix/linux_like/linux/musl/b32/powerpc.rs"=
:"539db45fb9de65bb498f9fab739404146428fd5ecd4b39ef5d6d8c4e8215fb29","src/un=
ix/linux_like/linux/musl/b32/riscv32/align.rs":"efd2accf33b87de7c7547903359=
a5da896edc33cd6c719552c7474b60d4a5d48","src/unix/linux_like/linux/musl/b32/=
riscv32/mod.rs":"0576807c1dd05e2114c3d0c819ae5a99fb5668262de6f9eabbda73d974=
a6fd29","src/unix/linux_like/linux/musl/b32/x86/align.rs":"08e77fbd7435d7de=
c2ff56932433bece3f02e47ce810f89004a275a86d39cbe1","src/unix/linux_like/linu=
x/musl/b32/x86/mod.rs":"2237891b538b0b601aca13dfd9bfd030cdf98479e813c3d195e=
c2639be88ee14","src/unix/linux_like/linux/musl/b64/aarch64/align.rs":"6ba32=
725d24d7d8e6aa111f3b57aafa318f83b606abe96561329151829821133","src/unix/linu=
x_like/linux/musl/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426442f09724d9=
b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/musl/b64/aarch6=
4/mod.rs":"54331c1112bc89cf35c0ebe0a974cb219d5167869ddd347e97faf1ec8c54cfec=
","src/unix/linux_like/linux/musl/b64/mips64.rs":"f606383f7a3639c508172becb=
2f1d2551b86dbd9bfceeef18871f94a30ed8d80","src/unix/linux_like/linux/musl/b6=
4/mod.rs":"8275e7a108c71f180de71b86f74baa1e35d9e915befb8ab8191d2a2fe76d3bb9=
","src/unix/linux_like/linux/musl/b64/powerpc64.rs":"6308c2d4b27deab7cc062f=
fdb1a0277126a1bc6ccea84f7276150f062df9f6a6","src/unix/linux_like/linux/musl=
/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd3754=
3efe86621b119","src/unix/linux_like/linux/musl/b64/riscv64/mod.rs":"e6c51d3=
d20b7b409dec3d7f41256a8a0366eabc7cf4db32a237e0ac7c8aa78fa","src/unix/linux_=
like/linux/musl/b64/s390x.rs":"fbf661b30015e315639b900a0eecf868c6fe50245460=
ac93891e1e8f5c55835a","src/unix/linux_like/linux/musl/b64/x86_64/align.rs":=
"77309276ad7a42cbe59ca381f23590b7a143aded05555b34a5b307b808cbca6e","src/uni=
x/linux_like/linux/musl/b64/x86_64/mod.rs":"e5d18b648529b09b35d161120016283=
f5e2ff54e28f60c031c63139901fe713a","src/unix/linux_like/linux/musl/lfs64.rs=
":"3e4fb381f3a0756520bde0f1692d4fa45e4ae8133bf7d7c64b0e3fdd512f235f","src/u=
nix/linux_like/linux/musl/mod.rs":"452e8a1bd998c6a2d026b84e148506cae01706e6=
32cdda286fb70cc58c0fa357","src/unix/linux_like/linux/no_align.rs":"62cdca0e=
011937aaf09a51ca86d9f0ee0fdb05f61ec3c058e6a5d5fa6357d784","src/unix/linux_l=
ike/linux/non_exhaustive.rs":"181a05bf94fdb911db83ce793b993bd6548a4115b306a=
7ef3c10f745a8fea3e9","src/unix/linux_like/linux/uclibc/align.rs":"9ed16138d=
8e439bd90930845a65eafa7ebd67366e6bf633936d44014f6e4c959","src/unix/linux_li=
ke/linux/uclibc/arm/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec725=
1957315afa53a7b9f936","src/unix/linux_like/linux/uclibc/arm/mod.rs":"50288f=
f9e411ab0966da24838f2c2a5618021bc19c422a04f577b2979ef4081e","src/unix/linux=
_like/linux/uclibc/arm/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632=
b96b5c85a76f8316c86653db25","src/unix/linux_like/linux/uclibc/mips/mips32/a=
lign.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936"=
,"src/unix/linux_like/linux/uclibc/mips/mips32/mod.rs":"d0c4434e2bf813372c4=
18a8f516c706cdccc9f7be2f0921b2207b0afdb66fe81","src/unix/linux_like/linux/u=
clibc/mips/mips32/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5=
c85a76f8316c86653db25","src/unix/linux_like/linux/uclibc/mips/mips64/align.=
rs":"a7bdcb18a37a2d91e64d5fad83ea3edc78f5412adb28f77ab077dbb26dd08b2d","src=
/unix/linux_like/linux/uclibc/mips/mips64/mod.rs":"3f38ee6a4690b9d7594be20d=
216467a34d955f7653c2c8ce1e6147daeb53f1e0","src/unix/linux_like/linux/uclibc=
/mips/mips64/no_align.rs":"4a18e3875698c85229599225ac3401a2a40da87e77b2ad4e=
f47c6fcd5a24ed30","src/unix/linux_like/linux/uclibc/mips/mod.rs":"a048fce1c=
2d9b1ad57305642e8ad05ca0f0c7e4753267a2e2d6b4fee5db3b072","src/unix/linux_li=
ke/linux/uclibc/mod.rs":"1c3d25cddcfefa2bd17bdc81550826be31a08eef235e13f825=
f169a5029c8bca","src/unix/linux_like/linux/uclibc/no_align.rs":"3f286370465=
24618adaa1012e26cb7ffe94b9396e6b518cccdc69d59f274d709","src/unix/linux_like=
/linux/uclibc/x86_64/l4re.rs":"024eba5753e852dbdd212427351affe7e83f9916c186=
4bce414d7aa2618f192e","src/unix/linux_like/linux/uclibc/x86_64/mod.rs":"196=
d03affbefb85716937c15904831e731eb222ee906e05e42102d639a8152ea","src/unix/li=
nux_like/linux/uclibc/x86_64/other.rs":"42c3f71e58cabba373f6a55a623f3c31b85=
049eb64824c09c2b082b3b2d6a0a8","src/unix/linux_like/mod.rs":"45c98e7a0fad03=
b03c4c76f11a80e2423873f0a6563e35c60309a29b2c8ff44f","src/unix/mod.rs":"dd4c=
e377ba9517182e718848739a5c3f58cdbbcd4ee467eef9aaf8df5aed5053","src/unix/new=
lib/aarch64/mod.rs":"bac93836a9a57b2c710f32f852e92a4d11ad6759ab0fb6ad33e71d=
60e53278af","src/unix/newlib/align.rs":"28aaf87fafbc6b312622719d472d8cf65f9=
e5467d15339df5f73e66d8502b28a","src/unix/newlib/arm/mod.rs":"cbba6b3e957ece=
b496806e60de8725a23ff3fa0015983b4b4fa27b233732b526","src/unix/newlib/espidf=
/mod.rs":"816f235f4aa4baabba7f2606b31d0fdb03988c52194c966728de8690bf17299d"=
,"src/unix/newlib/generic.rs":"eab066d9f0a0f3eb53cc1073d01496bba0110989e1f6=
a59838afd19f870cd599","src/unix/newlib/horizon/mod.rs":"7cc5cc120437421db13=
9bfa6a90b18168cd3070bdd0f5be96d40fe4c996f3ca1","src/unix/newlib/mod.rs":"9e=
36de3fd78e10cb6b9a59dc5ebe5a1b44a63ccb91433bb33653fb30d0c303c6","src/unix/n=
ewlib/no_align.rs":"e0743b2179495a9514bc3a4d1781e492878c4ec834ee0085d0891dd=
1712e82fb","src/unix/newlib/powerpc/mod.rs":"0202ffd57caf75b6afa2c9717750ff=
b96e375ac33df0ae9609a3f831be393b67","src/unix/newlib/vita/mod.rs":"68e0ce18=
6b44e0b3031eb824710e7454dc2a9df98db98120840c3c6f4d885871","src/unix/no_alig=
n.rs":"c06e95373b9088266e0b14bba0954eef95f93fb2b01d951855e382d22de78e53","s=
rc/unix/nto/aarch64.rs":"4709c9afdc8d583be876598e7c238499ee3e8da5bd2baa614d=
9c7dd414851555","src/unix/nto/mod.rs":"59ab89a8fb6e0a6d22fa968ed4873c2bafa1=
9a0f60a90c9a5148816cb7440889","src/unix/nto/neutrino.rs":"799bff4ab01a6424d=
b6c5a2b76aa5679826d41495f9d13c63485bf13bc80026b","src/unix/nto/x86_64.rs":"=
a3e18e93c2999da1cd7a6f748a4b60c07aefb73d8ea2aafec19a84cfb040bc8e","src/unix=
/redox/mod.rs":"73658b0d28c82a122875aa2b45c489834f4de58c378add7932bbaf3ffb2=
ae789","src/unix/solarish/compat.rs":"00f1ee3faec9da69204e42f025f6735dd13d8=
94071a154425dcc43ecbdd06e7f","src/unix/solarish/illumos.rs":"cd93c2d84722bb=
f9933a92842a8998eb0b2afc962f50bc2546ad127b82809fa7","src/unix/solarish/mod.=
rs":"b1660c631a599a3355116e7485b88ab2f8f2929c2e37851a763431387b902f14","src=
/unix/solarish/solaris.rs":"41b350a89ddf01cd12a10f93640f92be53be0b0d976021c=
dc08da17bf3e72edf","src/unix/solarish/x86.rs":"e86e806df0caed72765040eaa2f3=
c883198d1aa91508540adf9b7008c77f522e","src/unix/solarish/x86_64.rs":"ec2b01=
f194eb8a6a27133c57681da195a949e03098f3ea1e847227a9c09ef5fc","src/unix/solar=
ish/x86_common.rs":"ac869d9c3c95645c22460468391eb1982023c3a8e02b9e06a72e3ae=
f3d5f1eac","src/vxworks/aarch64.rs":"98f0afdc511cd02557e506c21fed6737585490=
a1dce7a9d4941d08c437762b99","src/vxworks/arm.rs":"acb7968ce99fe3f4abdf39d98=
f8133d21a4fba435b8ef7084777cb181d788e88","src/vxworks/mod.rs":"e4edcbcf43a3=
25e738c9465507594d0c87abf3f0e2b9b046c1425f8d44bdad0f","src/vxworks/powerpc.=
rs":"acb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788e88","src=
/vxworks/powerpc64.rs":"98f0afdc511cd02557e506c21fed6737585490a1dce7a9d4941=
d08c437762b99","src/vxworks/x86.rs":"552f007f38317620b23889cb7c49d1d1158412=
52439060122f52f434fbc6e5ba","src/vxworks/x86_64.rs":"018d92be3ad628a129eff9=
f2f5dfbc0883d8b8e5f2fa917b900a7f98ed6b514a","src/wasi.rs":"09ee3b3348b212b0=
50f6ca8ae008a28679ea44a375674307a4e7c9ca0d3ed7d5","src/windows/gnu/align.rs=
":"b2c13ec1b9f3b39a75c452c80c951dff9d0215e31d77e883b4502afb31794647","src/w=
indows/gnu/mod.rs":"3c8c7edb7cdf5d0c44af936db2a94869585c69dfabeef30571b4f4e=
38375767a","src/windows/mod.rs":"9fdc5e1c62c441abef7bc62a7343efb2041edc24db=
9ac0efc0f74df55b69e249","src/windows/msvc/mod.rs":"c068271e00fca6b62bc4bf44=
bcf142cfc38caeded9b6c4e01d1ceef3ccf986f4","src/xous.rs":"eb0675f25ba01f7307=
2d2b70907fb8abb1148facefe5a20756c49250f3d65fae","tests/const_fn.rs":"cb75a1=
f0864f926aebe79118fc34d51a0d1ade2c20a394e7774c7e545f21f1f4"},"package":"9cd=
c71e17332e86d2e1d38c1f99edcb6288ee11b815fb1a4b049eaa2114d369b"}
> +\ No newline at end of file
> diff --git a/meta/recipes-devtools/rust/files/0004-musl-Define-O_LARGEFIL=
E-for-riscv32.patch b/meta/recipes-devtools/rust/files/0004-musl-Define-O_L=
ARGEFILE-for-riscv32.patch
> new file mode 100644
> index 000000000000..fe7de706c2f3
> --- /dev/null
> +++ b/meta/recipes-devtools/rust/files/0004-musl-Define-O_LARGEFILE-for-r=
iscv32.patch
> @@ -0,0 +1,32 @@
> +From b042f5da5e35c55e90832ad19edd4e23217f3eb0 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sat, 8 Apr 2023 09:19:53 -0700
> +Subject: [PATCH 4/5] musl: Define O_LARGEFILE for riscv32
> +
> +Upstream-Status: Backport [https://github.com/rust-lang/libc/pull/3302/c=
ommits/b042f5da5e35c55e90832ad19edd4e23217f3eb0]
> +Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> +---
> + src/unix/linux_like/linux/musl/b32/riscv32/mod.rs | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +Index: rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/r=
iscv32/mod.rs
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- rustc-1.74.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b32=
/riscv32/mod.rs
> ++++ rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/risc=
v32/mod.rs
> +@@ -355,6 +355,7 @@ pub const __SIZEOF_PTHREAD_MUTEXATTR_T:
> + pub const __SIZEOF_PTHREAD_BARRIERATTR_T: usize =3D 4;
> + pub const O_DIRECT: ::c_int =3D 16384;
> + pub const O_DIRECTORY: ::c_int =3D 65536;
> ++pub const O_LARGEFILE: ::c_int =3D 0o0100000;
> + pub const O_NOFOLLOW: ::c_int =3D 131072;
> + pub const MAP_HUGETLB: ::c_int =3D 262144;
> + pub const MAP_LOCKED: ::c_int =3D 8192;
> +Index: rustc-1.74.0-src/vendor/libc/.cargo-checksum.json
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- rustc-1.74.0-src.orig/vendor/libc/.cargo-checksum.json
> ++++ rustc-1.74.0-src/vendor/libc/.cargo-checksum.json
> +@@ -1 +1 @@
> +-{"files":{"CONTRIBUTING.md":"bdc90b52cf803faac96e594069a86dd8ea150d5ba7=
fb3e6cadfc08dac4c7b0ce","Cargo.toml":"a58e58fa9bde015e08609ea2f17e56c5df7c8=
2aa6f3fa1a144c02ee4715227b9","LICENSE-APACHE":"62c7a1e35f56406896d7aa7ca52d=
0cc0d272ac022b5d2796e7d6905db8a3636a","LICENSE-MIT":"a8d47ff51ca256f56a8932=
dba07660672dbfe3004257ca8de708aac1415937a1","README.md":"ecc47e284f8d007fc0=
48666d5108dd41cdc440ab9eedfe8c47d1634613522787","build.rs":"9e94683e94db80e=
8282fce07549cf748d9037852fb06df1c7596bea2ed130d50","rustfmt.toml":"eaa2ea84=
fc1ba0359b77680804903e07bb38d257ab11986b95b158e460f787b2","src/fixed_width_=
ints.rs":"7f986e5f5e68d25ef04d386fd2f640e8be8f15427a8d4a458ea01d26b8dca0ca"=
,"src/fuchsia/aarch64.rs":"893fcec48142d273063ffd814dca33fbec92205fd39ada97=
075f85201d803996","src/fuchsia/align.rs":"ae1cf8f011a99737eabeb14ffff768e60=
f13b13363d7646744dbb0f443dab3d6","src/fuchsia/mod.rs":"30f4dc83ef120300d618=
96696512436377c5f36f1431d98ab7e01e498c0c47d5","src/fuchsia/no_align.rs":"30=
3f3f1b255e0088b5715094353cf00476131d8e94e6aebb3f469557771c8b8a","src/fuchsi=
a/riscv64.rs":"617cd75e79e0e20f664db764a4dc2a396d9fd11a4d95371acd91ed481129=
3b11","src/fuchsia/x86_64.rs":"93a3632b5cf67d2a6bcb7dc0a558605252d5fe689e0f=
38d8aa2ec5852255ac87","src/hermit/aarch64.rs":"86048676e335944c37a63d0083d0=
f368ae10ceccefeed9debb3bbe08777fc682","src/hermit/mod.rs":"d3bfce41e4463d4b=
e8020a2d063c9bfa8b665f45f1cc6cbf3163f5d01e7cb21f","src/hermit/x86_64.rs":"a=
b832b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/lib.r=
s":"24111461547739f3646f95bcb66c43f2ae679a727ff5938299434c522c02e458","src/=
macros.rs":"b457eb028b8e8ab3c24bb7292b874ad4e491edbb83594f6a3da024df5348c08=
8","src/psp.rs":"dd31aabd46171d474ec5828372e28588935120e7355c90c105360d8fa9=
264c1c","src/sgx.rs":"16a95cdefc81c5ee00d8353a60db363c4cc3e0f75abcd5d014472=
3f2a306ed1b","src/solid/aarch64.rs":"a726e47f324adf73a4a0b67a2c183408d0cad1=
05ae66acf36db37a42ab7f8707","src/solid/arm.rs":"e39a4f74ebbef3b97b8c95758ad=
741123d84ed3eb48d9cf4f1f4872097fc27fe","src/solid/mod.rs":"5f4151dca5132e4b=
4e4c23ab9737e12856dddbdc0ca3f7dbc004328ef3c8acde","src/switch.rs":"9da3dd39=
b3de45a7928789926e8572d00e1e11a39e6f7289a1349aadce90edba","src/unix/aix/mod=
=2Ers":"54229b5e774669c16912112e8b50fa938db76f534971222a11723a05195a0948","=
src/unix/aix/powerpc64.rs":"cf374d81139d45f9d77c6a764f640bfbf7e0a5903689652=
c8296f8e10d55169b","src/unix/align.rs":"2cdc7c826ef7ae61f5171c5ae8c445a743d=
86f1a7f2d9d7e4ceeec56d6874f65","src/unix/bsd/apple/b32/align.rs":"ec833a747=
866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/appl=
e/b32/mod.rs":"2546ad3eb6aecb95f916648bc63264117c92b4b4859532b34cb011e4c75a=
5a72","src/unix/bsd/apple/b64/aarch64/align.rs":"2eaf0f561a32bdcbf4e0477c88=
95d5e7bcb5cdebd5fef7b4df2ca8e38e144d94","src/unix/bsd/apple/b64/aarch64/mod=
=2Ers":"44c217a4f263afe7a97435de9323d20a96c37836f899ca0925306d4b7e073c27","=
src/unix/bsd/apple/b64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf=
4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b64/mod.rs":"f5e278a1af7fb3588=
91d1c9be4eb7e815aaca0c5cb738d0c3604ba2208a856f7","src/unix/bsd/apple/b64/x8=
6_64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b=
0e26c","src/unix/bsd/apple/b64/x86_64/mod.rs":"8c87c5855038aae5d433c8f5eb3b=
29b0a175879a0245342b3bfd83bdf4cfd936","src/unix/bsd/apple/long_array.rs":"3=
cf1f19b812e6d093c819dc65ce55b13491963e0780eda0d0bd1577603e81948","src/unix/=
bsd/apple/mod.rs":"0931fd351d585728e6384d7b952b8d816e9acdb9c86c172324445f3c=
33f692ca","src/unix/bsd/freebsdlike/dragonfly/errno.rs":"8295b8bb0dfd38d2cd=
b4d9192cdeeb534cc6c3b208170e64615fa3e0edb3e578","src/unix/bsd/freebsdlike/d=
ragonfly/mod.rs":"f2e78625fe1eb14f43e730a3987eba888cb8ac04c23008e7c2d2f7c72=
258b9e6","src/unix/bsd/freebsdlike/freebsd/aarch64.rs":"6c8e216385f53a4bf5f=
171749b57602fc34a4e4b160a44ca31c058cb0c8a2126","src/unix/bsd/freebsdlike/fr=
eebsd/arm.rs":"59d6a670eea562fb87686e243e0a84603d29a2028a3d4b3f99ccc01bd04d=
2f47","src/unix/bsd/freebsdlike/freebsd/freebsd11/b64.rs":"9808d152c1196aa6=
47f1b0f0cf84dac8c930da7d7f897a44975545e3d9d17681","src/unix/bsd/freebsdlike=
/freebsd/freebsd11/mod.rs":"e243ae0e89623d4fa9f85afe14369cc5fd5f2028ea71577=
3dbec722ba80dac1f","src/unix/bsd/freebsdlike/freebsd/freebsd12/b64.rs":"61c=
be45f8499bedb168106b686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bs=
d/freebsdlike/freebsd/freebsd12/mod.rs":"bef9fae288a4f29e941ea369be1cd20b17=
0040e60665a4d49a4a9e79009b72d8","src/unix/bsd/freebsdlike/freebsd/freebsd12=
/x86_64.rs":"2df36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd0=
52","src/unix/bsd/freebsdlike/freebsd/freebsd13/b64.rs":"61cbe45f8499bedb16=
8106b686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/f=
reebsd/freebsd13/mod.rs":"3c514e037694ce22724abb3c9c4687defda7f0e3456b615ca=
73593e860e38b16","src/unix/bsd/freebsdlike/freebsd/freebsd13/x86_64.rs":"2d=
f36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/b=
sd/freebsdlike/freebsd/freebsd14/b64.rs":"61cbe45f8499bedb168106b686d4f8239=
472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd1=
4/mod.rs":"318abe48bfdd1c74ecd6afbd6c9329c5c72ce4f7d420edd6be2fc12b223ae32f=
","src/unix/bsd/freebsdlike/freebsd/freebsd14/x86_64.rs":"e7b5863e222d6cc41=
6b6b0fbe71690fad909e899b4c4ae810bbca117e4fcb650","src/unix/bsd/freebsdlike/=
freebsd/mod.rs":"4c3cd57aaf7fbce072e28e0d2d285b5fda9702e924561d2fd01e49e6ee=
186a98","src/unix/bsd/freebsdlike/freebsd/powerpc.rs":"9ca3f82f88974e6db556=
9f2d76a5a3749b248a31747a6c0da5820492bdfeca42","src/unix/bsd/freebsdlike/fre=
ebsd/powerpc64.rs":"2dae3ecc87eac3b11657aa98915def55fc4b5c0de11fe26aae23329=
a54628a9a","src/unix/bsd/freebsdlike/freebsd/riscv64.rs":"fa4bed4c58cad24ba=
3395941c7fa6b11e089551a04714f9561078e400f5b2b62","src/unix/bsd/freebsdlike/=
freebsd/x86.rs":"6766e2ce85e187b306cd3b0b8d7e15b8f4042c5cff81d89b3af69ecc99=
c70ab0","src/unix/bsd/freebsdlike/freebsd/x86_64/align.rs":"0e1f69a88fca1c3=
2874b1daf5db3d446fefbe518dca497f096cc9168c39dde70","src/unix/bsd/freebsdlik=
e/freebsd/x86_64/mod.rs":"51e4dd0c8ae247bb652feda5adad9333ea3bb30c750c3a393=
5e0b0e47d7803eb","src/unix/bsd/freebsdlike/mod.rs":"0eacafac87fb3a32ef1b859=
80fece2792e70eba9856af18a7407cc35be68ea57","src/unix/bsd/mod.rs":"dad51a24a=
524e92bfe9de3ac3b7d394d86058b9b8a1ccd4efa9bbb5c78e7fa1a","src/unix/bsd/netb=
sdlike/mod.rs":"0a66f7de43710e35a6a546e6c39066aa8b91a6efadb71db88738b0a577f=
d5537","src/unix/bsd/netbsdlike/netbsd/aarch64.rs":"65dcb58d11e8d8028401a9d=
07ca3eb4cb4f053e04249cc877353449d84ccc4cb","src/unix/bsd/netbsdlike/netbsd/=
arm.rs":"58cdbb70b0d6f536551f0f3bb3725d2d75c4690db12c26c034e7d6ec4a924452",=
"src/unix/bsd/netbsdlike/netbsd/mod.rs":"90dd33ef20dc3be8aef5bd152a6a06e7ab=
34f9527b3978487b593aaa16a907bd","src/unix/bsd/netbsdlike/netbsd/powerpc.rs"=
:"ee7ff5d89d0ed22f531237b5059aa669df93a3b5c489fa641465ace8d405bf41","src/un=
ix/bsd/netbsdlike/netbsd/sparc64.rs":"9489f4b3e4566f43bb12dfb92238960613dac=
7f6a45cc13068a8d152b902d7d9","src/unix/bsd/netbsdlike/netbsd/x86.rs":"20692=
320e36bfe028d1a34d16fe12ca77aa909cb02bda167376f98f1a09aefe7","src/unix/bsd/=
netbsdlike/netbsd/x86_64.rs":"1afe5ef46b14397cdd68664b5b232e4f5b035b6db1d4c=
f411c899d51ebca9f30","src/unix/bsd/netbsdlike/openbsd/aarch64.rs":"dd91931d=
373b7ecaf6e2de25adadee10d16fa9b12c2cbacdff3eb291e1ba36af","src/unix/bsd/net=
bsdlike/openbsd/arm.rs":"01580d261bc6447bb327a0d982181b7bdabfa066cee65a3037=
3d3ced729ad307","src/unix/bsd/netbsdlike/openbsd/mips64.rs":"8532a189ae10c7=
d668d9d4065da8b05d124e09bd39442c9f74a7f231c43eca48","src/unix/bsd/netbsdlik=
e/openbsd/mod.rs":"c27c6673bd3628549083a094219831fd9343129f91067b562781617d=
2a887148","src/unix/bsd/netbsdlike/openbsd/powerpc.rs":"01580d261bc6447bb32=
7a0d982181b7bdabfa066cee65a30373d3ced729ad307","src/unix/bsd/netbsdlike/ope=
nbsd/powerpc64.rs":"1dd5449dd1fd3d51e30ffdeeaece91d0aaf05c710e0ac699fecc546=
1cfa2c28e","src/unix/bsd/netbsdlike/openbsd/riscv64.rs":"1dd5449dd1fd3d51e3=
0ffdeeaece91d0aaf05c710e0ac699fecc5461cfa2c28e","src/unix/bsd/netbsdlike/op=
enbsd/sparc64.rs":"d04fd287afbaa2c5df9d48c94e8374a532a3ba491b424ddf018270c7=
312f4085","src/unix/bsd/netbsdlike/openbsd/x86.rs":"6f7f5c4fde2a2259eb54789=
0cbd86570cea04ef85347d7569e94e679448bec87","src/unix/bsd/netbsdlike/openbsd=
/x86_64.rs":"d31db31630289c85af3339dbe357998a21ca584cbae31607448fe2cf7675a4=
e1","src/unix/haiku/b32.rs":"a2efdbf7158a6da341e1db9176b0ab193ba88b44961623=
9ed95dced11f54d87b","src/unix/haiku/b64.rs":"ff8115367d3d7d354f792d6176dfaa=
a26353f57056197b563bf4681f91ff7985","src/unix/haiku/mod.rs":"d7ec086b73db4f=
72799179627aa6330a513dcf786b06e19c75ff884d1235948e","src/unix/haiku/native.=
rs":"dbfcbf4954a79d1df2ff58e0590bbcb8c57dfc7a32392aa73ee4726b66bd6cc8","src=
/unix/haiku/x86_64.rs":"3ec3aeeb7ed208b8916f3e32d42bfd085ff5e16936a1a35d9a5=
2789f043b7237","src/unix/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f3=
68ae10ceccefeed9debb3bbe08777fc682","src/unix/hermit/mod.rs":"a1494a0bddf30=
1cceb0d9b8529a84b5882fe855ceae77a1c4e8d6034e705e26c","src/unix/hermit/x86_6=
4.rs":"ab832b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","s=
rc/unix/linux_like/android/b32/arm.rs":"ce582de7e983a33d3bfad13075c53aac901=
6cee35f06ad8653ee9072c3ec2564","src/unix/linux_like/android/b32/mod.rs":"7c=
173e0375119bf06a3081652faede95e5bcd6858e7576b7533d037978737c8f","src/unix/l=
inux_like/android/b32/x86/align.rs":"812914e4241df82e32b12375ca3374615dc3a4=
bdd4cf31f0423c5815320c0dab","src/unix/linux_like/android/b32/x86/mod.rs":"e=
6d107efbcd37b5b85dfa18f683300cbf768ffa0237997a9fa52b184a53323ac","src/unix/=
linux_like/android/b64/aarch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3=
ee2faf6fcae3770f9e505cddca35c7b","src/unix/linux_like/android/b64/aarch64/i=
nt128.rs":"1735f6f5c56770d20dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de=
","src/unix/linux_like/android/b64/aarch64/mod.rs":"10e963e29ff209703de6336=
c99cca96fd79789438d34c82a693eae56e8916c3c","src/unix/linux_like/android/b64=
/mod.rs":"71e4fcbe952bfa4a5f9022f3972e906917b38f729b9d8ef57cd5d179104894ac"=
,"src/unix/linux_like/android/b64/riscv64/align.rs":"0bf138f84e5327d8339bcd=
4adf071a6832b516445e597552c82bbd881095e3a8","src/unix/linux_like/android/b6=
4/riscv64/mod.rs":"19d4bf2237c47127eba9144e0b82e995bc079315e719179a91813b0a=
e7b0e49d","src/unix/linux_like/android/b64/x86_64/align.rs":"7169d07a9fd471=
6f7512719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/an=
droid/b64/x86_64/mod.rs":"4ec2de11a9b65c4325b7b991f0b99a414975e0e61ba8668ca=
ca5d921e9b314d1","src/unix/linux_like/android/mod.rs":"66a9e38a47493a42b3b1=
c325524f3c944e74d1e3e8ecce3cc276ec08fecab13b","src/unix/linux_like/emscript=
en/align.rs":"86c95cbed7a7161b1f23ee06843e7b0e2340ad92b2cb86fe2a8ef3e0e8c36=
216","src/unix/linux_like/emscripten/mod.rs":"67d6b90f539f746aa3290ea7f9d3f=
3f8d2d8a6557233584004ed5697f7821a50","src/unix/linux_like/emscripten/no_ali=
gn.rs":"0128e4aa721a9902754828b61b5ec7d8a86619983ed1e0544a85d35b1051fad6","=
src/unix/linux_like/linux/align.rs":"bc5abcd38e2320171e0981e773c9c5fe3e0d5a=
66fdff049228f6a1acad80ef8b","src/unix/linux_like/linux/arch/generic/mod.rs"=
:"fb5de1368cabae03d3ea0152159b7685a9d91efdecee4c5b83efc085ffef8a73","src/un=
ix/linux_like/linux/arch/mips/mod.rs":"75814e198d1a9a6808be3a5e5edb1bfdc57f=
75b06394e9040739be363c09d82f","src/unix/linux_like/linux/arch/mod.rs":"5bd5=
361f8a6ab4e18bbba6da9f92c164ae252b15a0ed10064812544aa1fdf198","src/unix/lin=
ux_like/linux/arch/powerpc/mod.rs":"bef6b7af9e5e2b4e5545c9c7e3e23a8b743277a=
0ed95853e7eddc38e44299f02","src/unix/linux_like/linux/arch/sparc/mod.rs":"9=
1593ec0440f1dd8f8e612028f432c44c14089286e2aca50e10511ab942db8c3","src/unix/=
linux_like/linux/gnu/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec72=
51957315afa53a7b9f936","src/unix/linux_like/linux/gnu/b32/arm/align.rs":"6e=
c0eb3ee93f7ae99fd714b4deabfb5e97fbcefd8c26f5a45fb8e7150899cdeb","src/unix/l=
inux_like/linux/gnu/b32/arm/mod.rs":"9ab3e97b579a9122690cd01026e14528862860=
346b700aafbb755a7e04054f7f","src/unix/linux_like/linux/gnu/b32/csky/align.r=
s":"3fed009dc9af3cc81be7087da9d2d7d1f39845e4497e290259c5cdbae25f039d","src/=
unix/linux_like/linux/gnu/b32/csky/mod.rs":"4c21d6e7463bb22f00b984294893d12=
c84018d5d26ec661d6a30f4a9625ba639","src/unix/linux_like/linux/gnu/b32/m68k/=
align.rs":"8faa92f77a9232c035418d45331774e64a9a841d99c91791570a203bf2b45bcb=
","src/unix/linux_like/linux/gnu/b32/m68k/mod.rs":"6aab7f1b864e9691d14aa7d3=
89f717c4077b8eed72a7f11e3b8c7fef245e4046","src/unix/linux_like/linux/gnu/b3=
2/mips/align.rs":"429fb5e005cb7143602d430098b6ebfb7d360685b194f333dfd587472=
ae954ee","src/unix/linux_like/linux/gnu/b32/mips/mod.rs":"6b9a5dac6f937ddc1=
453e808e3c43502c87143332df9e43ac64fb8b1eda6c116","src/unix/linux_like/linux=
/gnu/b32/mod.rs":"b56625dd20dd48a8699034d349ef089c540c0ddcbf8a3481d598d101f=
8b40b78","src/unix/linux_like/linux/gnu/b32/powerpc.rs":"5c5d90326b54b57b98=
eff4745fe7a3fb02f053b2dc782241a73e807b491936a3","src/unix/linux_like/linux/=
gnu/b32/riscv32/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd3=
7543efe86621b119","src/unix/linux_like/linux/gnu/b32/riscv32/mod.rs":"491a9=
a97cf712985b75d3ad714691ef60898d88c78bc386a6917de0a6774cc26","src/unix/linu=
x_like/linux/gnu/b32/sparc/align.rs":"21adbed27df73e2d1ed934aaf733a643003d7=
baf2bde9c48ea440895bcca6d41","src/unix/linux_like/linux/gnu/b32/sparc/mod.r=
s":"80894eece66e9348f45d1b07ad37c757ea694bbd10ed49d3f920b34e9f51a9a3","src/=
unix/linux_like/linux/gnu/b32/x86/align.rs":"e4bafdc4a519a7922a81b37a62bbfd=
1177a2f620890eef8f1fbc47162e9eb413","src/unix/linux_like/linux/gnu/b32/x86/=
mod.rs":"c703cc5e9de2dc31d9e5831bfb6f354d6e3518b2ae02263f68a9a70f1c0167e2",=
"src/unix/linux_like/linux/gnu/b64/aarch64/align.rs":"fdf1c72375a2167699157=
e0dd825422690bb6719f7bc69515a2e5846d0431d7c","src/unix/linux_like/linux/gnu=
/b64/aarch64/fallback.rs":"832e7487249c1c0bb6e9911ce3f7d32ca22378e42392ab83=
c56915cbc59d8be3","src/unix/linux_like/linux/gnu/b64/aarch64/ilp32.rs":"bf4=
611b737813deef6787babf6c01698605f3b75482269b8546318667bc68e29","src/unix/li=
nux_like/linux/gnu/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426442f09724d=
9b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/gnu/b64/aarch6=
4/lp64.rs":"11a950697fdda0258c6e37c6b13993348c8de4134105ed4faa79358e5317507=
2","src/unix/linux_like/linux/gnu/b64/aarch64/mod.rs":"172495fbfdf659b9b825=
148bffc2b62704f63fc872428617e868eb15802c9978","src/unix/linux_like/linux/gn=
u/b64/loongarch64/align.rs":"060aa33cc737966c691aab8511c5c5729e551458ce18d0=
e284e0d45f39beeb60","src/unix/linux_like/linux/gnu/b64/loongarch64/mod.rs":=
"18edada8aa5d4127d9aa1bd81c62b5a4209f1efd8b2b2631e801c9e855ab1480","src/uni=
x/linux_like/linux/gnu/b64/mips64/align.rs":"7169d07a9fd4716f7512719aec9fda=
5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/linux/gnu/b64/mips=
64/mod.rs":"628c410b9aaec3c8f43838a28616b577a1d6de60a9799b09bb884d80281f96e=
b","src/unix/linux_like/linux/gnu/b64/mod.rs":"6a160ef25439c4fecdb0e3bd0b81=
8742263c791364da874d4febd3aa644ec8e2","src/unix/linux_like/linux/gnu/b64/po=
werpc64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1=
268130d9","src/unix/linux_like/linux/gnu/b64/powerpc64/mod.rs":"c778a136f06=
c2ffeacea19fa14ce79b828f91b67a002dec5ce87289bae36234e","src/unix/linux_like=
/linux/gnu/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e5880=
3f99cd37543efe86621b119","src/unix/linux_like/linux/gnu/b64/riscv64/mod.rs"=
:"c8f07efc5ddd5d874f1ebc329cd6907818d132ac3e30f4f2a4b04be3fb388551","src/un=
ix/linux_like/linux/gnu/b64/s390x.rs":"a2fd9277c2dcf76f7a16a3bcca745d5a9932=
c765c0dc2feb31c3641be25eb0aa","src/unix/linux_like/linux/gnu/b64/sparc64/al=
ign.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268130d9",=
"src/unix/linux_like/linux/gnu/b64/sparc64/mod.rs":"e8047e9966a2b90063e0151=
a0278c54885e7b323286cf5ab55cbaf151fc772d3","src/unix/linux_like/linux/gnu/b=
64/x86_64/align.rs":"62e822478356db4a73b6bbd1b36d825b893939ab4b308ec11b0578=
bcc4b49769","src/unix/linux_like/linux/gnu/b64/x86_64/mod.rs":"891e595d3371=
4b9883b92f0554d1d361fba2b6c3f6cac09a288252f44c6ec667","src/unix/linux_like/=
linux/gnu/b64/x86_64/not_x32.rs":"38f74ce15d9662ce4818815a2b87be1618d5e45f1=
90f7e4db84ff3285b4421fb","src/unix/linux_like/linux/gnu/b64/x86_64/x32.rs":=
"b20218a11364a6dec87f96d6c0d8b19e660697ab09ad5ee0e9b3a9dafedaaebb","src/uni=
x/linux_like/linux/gnu/mod.rs":"47dd970aedda9c70429741d7c9892a0d5d264e9abcb=
1c41d5bb913a86f0a5362","src/unix/linux_like/linux/gnu/no_align.rs":"9cd2231=
35de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/linux_=
like/linux/mod.rs":"1582c09db7b752af0f796a4cba8aa2bb4ecea895c551a2219e76047=
bcce74a23","src/unix/linux_like/linux/musl/b32/arm/align.rs":"3e8ac052c1043=
764776b54c93ba4260e061df998631737a897d9d47d54f7b80c","src/unix/linux_like/l=
inux/musl/b32/arm/mod.rs":"de0473ef4455fa461c00442f041ec110e6667614b00bb233=
85f35af95d24f668","src/unix/linux_like/linux/musl/b32/hexagon.rs":"4f9a5b3b=
45bc970611597f40add2c489de0fa8ad9dd77629e4daa1755c5e2918","src/unix/linux_l=
ike/linux/musl/b32/mips/align.rs":"429fb5e005cb7143602d430098b6ebfb7d360685=
b194f333dfd587472ae954ee","src/unix/linux_like/linux/musl/b32/mips/mod.rs":=
"8c7de54a04495204772b4bd622b6d34696d27b73ea9e097eb53afa1a7806e31f","src/uni=
x/linux_like/linux/musl/b32/mod.rs":"31677597fd9544c4b1ec1477628288f6273fab=
bc06e38f33da862ad55f019ce1","src/unix/linux_like/linux/musl/b32/powerpc.rs"=
:"539db45fb9de65bb498f9fab739404146428fd5ecd4b39ef5d6d8c4e8215fb29","src/un=
ix/linux_like/linux/musl/b32/riscv32/align.rs":"efd2accf33b87de7c7547903359=
a5da896edc33cd6c719552c7474b60d4a5d48","src/unix/linux_like/linux/musl/b32/=
riscv32/mod.rs":"0576807c1dd05e2114c3d0c819ae5a99fb5668262de6f9eabbda73d974=
a6fd29","src/unix/linux_like/linux/musl/b32/x86/align.rs":"08e77fbd7435d7de=
c2ff56932433bece3f02e47ce810f89004a275a86d39cbe1","src/unix/linux_like/linu=
x/musl/b32/x86/mod.rs":"2237891b538b0b601aca13dfd9bfd030cdf98479e813c3d195e=
c2639be88ee14","src/unix/linux_like/linux/musl/b64/aarch64/align.rs":"6ba32=
725d24d7d8e6aa111f3b57aafa318f83b606abe96561329151829821133","src/unix/linu=
x_like/linux/musl/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426442f09724d9=
b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/musl/b64/aarch6=
4/mod.rs":"54331c1112bc89cf35c0ebe0a974cb219d5167869ddd347e97faf1ec8c54cfec=
","src/unix/linux_like/linux/musl/b64/mips64.rs":"f606383f7a3639c508172becb=
2f1d2551b86dbd9bfceeef18871f94a30ed8d80","src/unix/linux_like/linux/musl/b6=
4/mod.rs":"8275e7a108c71f180de71b86f74baa1e35d9e915befb8ab8191d2a2fe76d3bb9=
","src/unix/linux_like/linux/musl/b64/powerpc64.rs":"6308c2d4b27deab7cc062f=
fdb1a0277126a1bc6ccea84f7276150f062df9f6a6","src/unix/linux_like/linux/musl=
/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd3754=
3efe86621b119","src/unix/linux_like/linux/musl/b64/riscv64/mod.rs":"e6c51d3=
d20b7b409dec3d7f41256a8a0366eabc7cf4db32a237e0ac7c8aa78fa","src/unix/linux_=
like/linux/musl/b64/s390x.rs":"fbf661b30015e315639b900a0eecf868c6fe50245460=
ac93891e1e8f5c55835a","src/unix/linux_like/linux/musl/b64/x86_64/align.rs":=
"77309276ad7a42cbe59ca381f23590b7a143aded05555b34a5b307b808cbca6e","src/uni=
x/linux_like/linux/musl/b64/x86_64/mod.rs":"e5d18b648529b09b35d161120016283=
f5e2ff54e28f60c031c63139901fe713a","src/unix/linux_like/linux/musl/lfs64.rs=
":"3e4fb381f3a0756520bde0f1692d4fa45e4ae8133bf7d7c64b0e3fdd512f235f","src/u=
nix/linux_like/linux/musl/mod.rs":"452e8a1bd998c6a2d026b84e148506cae01706e6=
32cdda286fb70cc58c0fa357","src/unix/linux_like/linux/no_align.rs":"62cdca0e=
011937aaf09a51ca86d9f0ee0fdb05f61ec3c058e6a5d5fa6357d784","src/unix/linux_l=
ike/linux/non_exhaustive.rs":"181a05bf94fdb911db83ce793b993bd6548a4115b306a=
7ef3c10f745a8fea3e9","src/unix/linux_like/linux/uclibc/align.rs":"9ed16138d=
8e439bd90930845a65eafa7ebd67366e6bf633936d44014f6e4c959","src/unix/linux_li=
ke/linux/uclibc/arm/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec725=
1957315afa53a7b9f936","src/unix/linux_like/linux/uclibc/arm/mod.rs":"50288f=
f9e411ab0966da24838f2c2a5618021bc19c422a04f577b2979ef4081e","src/unix/linux=
_like/linux/uclibc/arm/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632=
b96b5c85a76f8316c86653db25","src/unix/linux_like/linux/uclibc/mips/mips32/a=
lign.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936"=
,"src/unix/linux_like/linux/uclibc/mips/mips32/mod.rs":"d0c4434e2bf813372c4=
18a8f516c706cdccc9f7be2f0921b2207b0afdb66fe81","src/unix/linux_like/linux/u=
clibc/mips/mips32/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5=
c85a76f8316c86653db25","src/unix/linux_like/linux/uclibc/mips/mips64/align.=
rs":"a7bdcb18a37a2d91e64d5fad83ea3edc78f5412adb28f77ab077dbb26dd08b2d","src=
/unix/linux_like/linux/uclibc/mips/mips64/mod.rs":"3f38ee6a4690b9d7594be20d=
216467a34d955f7653c2c8ce1e6147daeb53f1e0","src/unix/linux_like/linux/uclibc=
/mips/mips64/no_align.rs":"4a18e3875698c85229599225ac3401a2a40da87e77b2ad4e=
f47c6fcd5a24ed30","src/unix/linux_like/linux/uclibc/mips/mod.rs":"a048fce1c=
2d9b1ad57305642e8ad05ca0f0c7e4753267a2e2d6b4fee5db3b072","src/unix/linux_li=
ke/linux/uclibc/mod.rs":"1c3d25cddcfefa2bd17bdc81550826be31a08eef235e13f825=
f169a5029c8bca","src/unix/linux_like/linux/uclibc/no_align.rs":"3f286370465=
24618adaa1012e26cb7ffe94b9396e6b518cccdc69d59f274d709","src/unix/linux_like=
/linux/uclibc/x86_64/l4re.rs":"024eba5753e852dbdd212427351affe7e83f9916c186=
4bce414d7aa2618f192e","src/unix/linux_like/linux/uclibc/x86_64/mod.rs":"196=
d03affbefb85716937c15904831e731eb222ee906e05e42102d639a8152ea","src/unix/li=
nux_like/linux/uclibc/x86_64/other.rs":"42c3f71e58cabba373f6a55a623f3c31b85=
049eb64824c09c2b082b3b2d6a0a8","src/unix/linux_like/mod.rs":"45c98e7a0fad03=
b03c4c76f11a80e2423873f0a6563e35c60309a29b2c8ff44f","src/unix/mod.rs":"dd4c=
e377ba9517182e718848739a5c3f58cdbbcd4ee467eef9aaf8df5aed5053","src/unix/new=
lib/aarch64/mod.rs":"bac93836a9a57b2c710f32f852e92a4d11ad6759ab0fb6ad33e71d=
60e53278af","src/unix/newlib/align.rs":"28aaf87fafbc6b312622719d472d8cf65f9=
e5467d15339df5f73e66d8502b28a","src/unix/newlib/arm/mod.rs":"cbba6b3e957ece=
b496806e60de8725a23ff3fa0015983b4b4fa27b233732b526","src/unix/newlib/espidf=
/mod.rs":"816f235f4aa4baabba7f2606b31d0fdb03988c52194c966728de8690bf17299d"=
,"src/unix/newlib/generic.rs":"eab066d9f0a0f3eb53cc1073d01496bba0110989e1f6=
a59838afd19f870cd599","src/unix/newlib/horizon/mod.rs":"7cc5cc120437421db13=
9bfa6a90b18168cd3070bdd0f5be96d40fe4c996f3ca1","src/unix/newlib/mod.rs":"9e=
36de3fd78e10cb6b9a59dc5ebe5a1b44a63ccb91433bb33653fb30d0c303c6","src/unix/n=
ewlib/no_align.rs":"e0743b2179495a9514bc3a4d1781e492878c4ec834ee0085d0891dd=
1712e82fb","src/unix/newlib/powerpc/mod.rs":"0202ffd57caf75b6afa2c9717750ff=
b96e375ac33df0ae9609a3f831be393b67","src/unix/newlib/vita/mod.rs":"68e0ce18=
6b44e0b3031eb824710e7454dc2a9df98db98120840c3c6f4d885871","src/unix/no_alig=
n.rs":"c06e95373b9088266e0b14bba0954eef95f93fb2b01d951855e382d22de78e53","s=
rc/unix/nto/aarch64.rs":"4709c9afdc8d583be876598e7c238499ee3e8da5bd2baa614d=
9c7dd414851555","src/unix/nto/mod.rs":"59ab89a8fb6e0a6d22fa968ed4873c2bafa1=
9a0f60a90c9a5148816cb7440889","src/unix/nto/neutrino.rs":"799bff4ab01a6424d=
b6c5a2b76aa5679826d41495f9d13c63485bf13bc80026b","src/unix/nto/x86_64.rs":"=
a3e18e93c2999da1cd7a6f748a4b60c07aefb73d8ea2aafec19a84cfb040bc8e","src/unix=
/redox/mod.rs":"73658b0d28c82a122875aa2b45c489834f4de58c378add7932bbaf3ffb2=
ae789","src/unix/solarish/compat.rs":"00f1ee3faec9da69204e42f025f6735dd13d8=
94071a154425dcc43ecbdd06e7f","src/unix/solarish/illumos.rs":"cd93c2d84722bb=
f9933a92842a8998eb0b2afc962f50bc2546ad127b82809fa7","src/unix/solarish/mod.=
rs":"b1660c631a599a3355116e7485b88ab2f8f2929c2e37851a763431387b902f14","src=
/unix/solarish/solaris.rs":"41b350a89ddf01cd12a10f93640f92be53be0b0d976021c=
dc08da17bf3e72edf","src/unix/solarish/x86.rs":"e86e806df0caed72765040eaa2f3=
c883198d1aa91508540adf9b7008c77f522e","src/unix/solarish/x86_64.rs":"ec2b01=
f194eb8a6a27133c57681da195a949e03098f3ea1e847227a9c09ef5fc","src/unix/solar=
ish/x86_common.rs":"ac869d9c3c95645c22460468391eb1982023c3a8e02b9e06a72e3ae=
f3d5f1eac","src/vxworks/aarch64.rs":"98f0afdc511cd02557e506c21fed6737585490=
a1dce7a9d4941d08c437762b99","src/vxworks/arm.rs":"acb7968ce99fe3f4abdf39d98=
f8133d21a4fba435b8ef7084777cb181d788e88","src/vxworks/mod.rs":"e4edcbcf43a3=
25e738c9465507594d0c87abf3f0e2b9b046c1425f8d44bdad0f","src/vxworks/powerpc.=
rs":"acb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788e88","src=
/vxworks/powerpc64.rs":"98f0afdc511cd02557e506c21fed6737585490a1dce7a9d4941=
d08c437762b99","src/vxworks/x86.rs":"552f007f38317620b23889cb7c49d1d1158412=
52439060122f52f434fbc6e5ba","src/vxworks/x86_64.rs":"018d92be3ad628a129eff9=
f2f5dfbc0883d8b8e5f2fa917b900a7f98ed6b514a","src/wasi.rs":"09ee3b3348b212b0=
50f6ca8ae008a28679ea44a375674307a4e7c9ca0d3ed7d5","src/windows/gnu/align.rs=
":"b2c13ec1b9f3b39a75c452c80c951dff9d0215e31d77e883b4502afb31794647","src/w=
indows/gnu/mod.rs":"3c8c7edb7cdf5d0c44af936db2a94869585c69dfabeef30571b4f4e=
38375767a","src/windows/mod.rs":"9fdc5e1c62c441abef7bc62a7343efb2041edc24db=
9ac0efc0f74df55b69e249","src/windows/msvc/mod.rs":"c068271e00fca6b62bc4bf44=
bcf142cfc38caeded9b6c4e01d1ceef3ccf986f4","src/xous.rs":"eb0675f25ba01f7307=
2d2b70907fb8abb1148facefe5a20756c49250f3d65fae","tests/const_fn.rs":"cb75a1=
f0864f926aebe79118fc34d51a0d1ade2c20a394e7774c7e545f21f1f4"},"package":"9cd=
c71e17332e86d2e1d38c1f99edcb6288ee11b815fb1a4b049eaa2114d369b"}
> +\ No newline at end of file
> ++{"files":{"CONTRIBUTING.md":"bdc90b52cf803faac96e594069a86dd8ea150d5ba7=
fb3e6cadfc08dac4c7b0ce","Cargo.toml":"a58e58fa9bde015e08609ea2f17e56c5df7c8=
2aa6f3fa1a144c02ee4715227b9","LICENSE-APACHE":"62c7a1e35f56406896d7aa7ca52d=
0cc0d272ac022b5d2796e7d6905db8a3636a","LICENSE-MIT":"a8d47ff51ca256f56a8932=
dba07660672dbfe3004257ca8de708aac1415937a1","README.md":"ecc47e284f8d007fc0=
48666d5108dd41cdc440ab9eedfe8c47d1634613522787","build.rs":"9e94683e94db80e=
8282fce07549cf748d9037852fb06df1c7596bea2ed130d50","rustfmt.toml":"eaa2ea84=
fc1ba0359b77680804903e07bb38d257ab11986b95b158e460f787b2","src/fixed_width_=
ints.rs":"7f986e5f5e68d25ef04d386fd2f640e8be8f15427a8d4a458ea01d26b8dca0ca"=
,"src/fuchsia/aarch64.rs":"893fcec48142d273063ffd814dca33fbec92205fd39ada97=
075f85201d803996","src/fuchsia/align.rs":"ae1cf8f011a99737eabeb14ffff768e60=
f13b13363d7646744dbb0f443dab3d6","src/fuchsia/mod.rs":"30f4dc83ef120300d618=
96696512436377c5f36f1431d98ab7e01e498c0c47d5","src/fuchsia/no_align.rs":"30=
3f3f1b255e0088b5715094353cf00476131d8e94e6aebb3f469557771c8b8a","src/fuchsi=
a/riscv64.rs":"617cd75e79e0e20f664db764a4dc2a396d9fd11a4d95371acd91ed481129=
3b11","src/fuchsia/x86_64.rs":"93a3632b5cf67d2a6bcb7dc0a558605252d5fe689e0f=
38d8aa2ec5852255ac87","src/hermit/aarch64.rs":"86048676e335944c37a63d0083d0=
f368ae10ceccefeed9debb3bbe08777fc682","src/hermit/mod.rs":"d3bfce41e4463d4b=
e8020a2d063c9bfa8b665f45f1cc6cbf3163f5d01e7cb21f","src/hermit/x86_64.rs":"a=
b832b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/lib.r=
s":"24111461547739f3646f95bcb66c43f2ae679a727ff5938299434c522c02e458","src/=
macros.rs":"b457eb028b8e8ab3c24bb7292b874ad4e491edbb83594f6a3da024df5348c08=
8","src/psp.rs":"dd31aabd46171d474ec5828372e28588935120e7355c90c105360d8fa9=
264c1c","src/sgx.rs":"16a95cdefc81c5ee00d8353a60db363c4cc3e0f75abcd5d014472=
3f2a306ed1b","src/solid/aarch64.rs":"a726e47f324adf73a4a0b67a2c183408d0cad1=
05ae66acf36db37a42ab7f8707","src/solid/arm.rs":"e39a4f74ebbef3b97b8c95758ad=
741123d84ed3eb48d9cf4f1f4872097fc27fe","src/solid/mod.rs":"5f4151dca5132e4b=
4e4c23ab9737e12856dddbdc0ca3f7dbc004328ef3c8acde","src/switch.rs":"9da3dd39=
b3de45a7928789926e8572d00e1e11a39e6f7289a1349aadce90edba","src/unix/aix/mod=
=2Ers":"54229b5e774669c16912112e8b50fa938db76f534971222a11723a05195a0948","=
src/unix/aix/powerpc64.rs":"cf374d81139d45f9d77c6a764f640bfbf7e0a5903689652=
c8296f8e10d55169b","src/unix/align.rs":"2cdc7c826ef7ae61f5171c5ae8c445a743d=
86f1a7f2d9d7e4ceeec56d6874f65","src/unix/bsd/apple/b32/align.rs":"ec833a747=
866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/appl=
e/b32/mod.rs":"2546ad3eb6aecb95f916648bc63264117c92b4b4859532b34cb011e4c75a=
5a72","src/unix/bsd/apple/b64/aarch64/align.rs":"2eaf0f561a32bdcbf4e0477c88=
95d5e7bcb5cdebd5fef7b4df2ca8e38e144d94","src/unix/bsd/apple/b64/aarch64/mod=
=2Ers":"44c217a4f263afe7a97435de9323d20a96c37836f899ca0925306d4b7e073c27","=
src/unix/bsd/apple/b64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf=
4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b64/mod.rs":"f5e278a1af7fb3588=
91d1c9be4eb7e815aaca0c5cb738d0c3604ba2208a856f7","src/unix/bsd/apple/b64/x8=
6_64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b=
0e26c","src/unix/bsd/apple/b64/x86_64/mod.rs":"8c87c5855038aae5d433c8f5eb3b=
29b0a175879a0245342b3bfd83bdf4cfd936","src/unix/bsd/apple/long_array.rs":"3=
cf1f19b812e6d093c819dc65ce55b13491963e0780eda0d0bd1577603e81948","src/unix/=
bsd/apple/mod.rs":"0931fd351d585728e6384d7b952b8d816e9acdb9c86c172324445f3c=
33f692ca","src/unix/bsd/freebsdlike/dragonfly/errno.rs":"8295b8bb0dfd38d2cd=
b4d9192cdeeb534cc6c3b208170e64615fa3e0edb3e578","src/unix/bsd/freebsdlike/d=
ragonfly/mod.rs":"f2e78625fe1eb14f43e730a3987eba888cb8ac04c23008e7c2d2f7c72=
258b9e6","src/unix/bsd/freebsdlike/freebsd/aarch64.rs":"6c8e216385f53a4bf5f=
171749b57602fc34a4e4b160a44ca31c058cb0c8a2126","src/unix/bsd/freebsdlike/fr=
eebsd/arm.rs":"59d6a670eea562fb87686e243e0a84603d29a2028a3d4b3f99ccc01bd04d=
2f47","src/unix/bsd/freebsdlike/freebsd/freebsd11/b64.rs":"9808d152c1196aa6=
47f1b0f0cf84dac8c930da7d7f897a44975545e3d9d17681","src/unix/bsd/freebsdlike=
/freebsd/freebsd11/mod.rs":"e243ae0e89623d4fa9f85afe14369cc5fd5f2028ea71577=
3dbec722ba80dac1f","src/unix/bsd/freebsdlike/freebsd/freebsd12/b64.rs":"61c=
be45f8499bedb168106b686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bs=
d/freebsdlike/freebsd/freebsd12/mod.rs":"bef9fae288a4f29e941ea369be1cd20b17=
0040e60665a4d49a4a9e79009b72d8","src/unix/bsd/freebsdlike/freebsd/freebsd12=
/x86_64.rs":"2df36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd0=
52","src/unix/bsd/freebsdlike/freebsd/freebsd13/b64.rs":"61cbe45f8499bedb16=
8106b686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/f=
reebsd/freebsd13/mod.rs":"3c514e037694ce22724abb3c9c4687defda7f0e3456b615ca=
73593e860e38b16","src/unix/bsd/freebsdlike/freebsd/freebsd13/x86_64.rs":"2d=
f36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/b=
sd/freebsdlike/freebsd/freebsd14/b64.rs":"61cbe45f8499bedb168106b686d4f8239=
472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd1=
4/mod.rs":"318abe48bfdd1c74ecd6afbd6c9329c5c72ce4f7d420edd6be2fc12b223ae32f=
","src/unix/bsd/freebsdlike/freebsd/freebsd14/x86_64.rs":"e7b5863e222d6cc41=
6b6b0fbe71690fad909e899b4c4ae810bbca117e4fcb650","src/unix/bsd/freebsdlike/=
freebsd/mod.rs":"4c3cd57aaf7fbce072e28e0d2d285b5fda9702e924561d2fd01e49e6ee=
186a98","src/unix/bsd/freebsdlike/freebsd/powerpc.rs":"9ca3f82f88974e6db556=
9f2d76a5a3749b248a31747a6c0da5820492bdfeca42","src/unix/bsd/freebsdlike/fre=
ebsd/powerpc64.rs":"2dae3ecc87eac3b11657aa98915def55fc4b5c0de11fe26aae23329=
a54628a9a","src/unix/bsd/freebsdlike/freebsd/riscv64.rs":"fa4bed4c58cad24ba=
3395941c7fa6b11e089551a04714f9561078e400f5b2b62","src/unix/bsd/freebsdlike/=
freebsd/x86.rs":"6766e2ce85e187b306cd3b0b8d7e15b8f4042c5cff81d89b3af69ecc99=
c70ab0","src/unix/bsd/freebsdlike/freebsd/x86_64/align.rs":"0e1f69a88fca1c3=
2874b1daf5db3d446fefbe518dca497f096cc9168c39dde70","src/unix/bsd/freebsdlik=
e/freebsd/x86_64/mod.rs":"51e4dd0c8ae247bb652feda5adad9333ea3bb30c750c3a393=
5e0b0e47d7803eb","src/unix/bsd/freebsdlike/mod.rs":"0eacafac87fb3a32ef1b859=
80fece2792e70eba9856af18a7407cc35be68ea57","src/unix/bsd/mod.rs":"dad51a24a=
524e92bfe9de3ac3b7d394d86058b9b8a1ccd4efa9bbb5c78e7fa1a","src/unix/bsd/netb=
sdlike/mod.rs":"0a66f7de43710e35a6a546e6c39066aa8b91a6efadb71db88738b0a577f=
d5537","src/unix/bsd/netbsdlike/netbsd/aarch64.rs":"65dcb58d11e8d8028401a9d=
07ca3eb4cb4f053e04249cc877353449d84ccc4cb","src/unix/bsd/netbsdlike/netbsd/=
arm.rs":"58cdbb70b0d6f536551f0f3bb3725d2d75c4690db12c26c034e7d6ec4a924452",=
"src/unix/bsd/netbsdlike/netbsd/mod.rs":"90dd33ef20dc3be8aef5bd152a6a06e7ab=
34f9527b3978487b593aaa16a907bd","src/unix/bsd/netbsdlike/netbsd/powerpc.rs"=
:"ee7ff5d89d0ed22f531237b5059aa669df93a3b5c489fa641465ace8d405bf41","src/un=
ix/bsd/netbsdlike/netbsd/sparc64.rs":"9489f4b3e4566f43bb12dfb92238960613dac=
7f6a45cc13068a8d152b902d7d9","src/unix/bsd/netbsdlike/netbsd/x86.rs":"20692=
320e36bfe028d1a34d16fe12ca77aa909cb02bda167376f98f1a09aefe7","src/unix/bsd/=
netbsdlike/netbsd/x86_64.rs":"1afe5ef46b14397cdd68664b5b232e4f5b035b6db1d4c=
f411c899d51ebca9f30","src/unix/bsd/netbsdlike/openbsd/aarch64.rs":"dd91931d=
373b7ecaf6e2de25adadee10d16fa9b12c2cbacdff3eb291e1ba36af","src/unix/bsd/net=
bsdlike/openbsd/arm.rs":"01580d261bc6447bb327a0d982181b7bdabfa066cee65a3037=
3d3ced729ad307","src/unix/bsd/netbsdlike/openbsd/mips64.rs":"8532a189ae10c7=
d668d9d4065da8b05d124e09bd39442c9f74a7f231c43eca48","src/unix/bsd/netbsdlik=
e/openbsd/mod.rs":"c27c6673bd3628549083a094219831fd9343129f91067b562781617d=
2a887148","src/unix/bsd/netbsdlike/openbsd/powerpc.rs":"01580d261bc6447bb32=
7a0d982181b7bdabfa066cee65a30373d3ced729ad307","src/unix/bsd/netbsdlike/ope=
nbsd/powerpc64.rs":"1dd5449dd1fd3d51e30ffdeeaece91d0aaf05c710e0ac699fecc546=
1cfa2c28e","src/unix/bsd/netbsdlike/openbsd/riscv64.rs":"1dd5449dd1fd3d51e3=
0ffdeeaece91d0aaf05c710e0ac699fecc5461cfa2c28e","src/unix/bsd/netbsdlike/op=
enbsd/sparc64.rs":"d04fd287afbaa2c5df9d48c94e8374a532a3ba491b424ddf018270c7=
312f4085","src/unix/bsd/netbsdlike/openbsd/x86.rs":"6f7f5c4fde2a2259eb54789=
0cbd86570cea04ef85347d7569e94e679448bec87","src/unix/bsd/netbsdlike/openbsd=
/x86_64.rs":"d31db31630289c85af3339dbe357998a21ca584cbae31607448fe2cf7675a4=
e1","src/unix/haiku/b32.rs":"a2efdbf7158a6da341e1db9176b0ab193ba88b44961623=
9ed95dced11f54d87b","src/unix/haiku/b64.rs":"ff8115367d3d7d354f792d6176dfaa=
a26353f57056197b563bf4681f91ff7985","src/unix/haiku/mod.rs":"d7ec086b73db4f=
72799179627aa6330a513dcf786b06e19c75ff884d1235948e","src/unix/haiku/native.=
rs":"dbfcbf4954a79d1df2ff58e0590bbcb8c57dfc7a32392aa73ee4726b66bd6cc8","src=
/unix/haiku/x86_64.rs":"3ec3aeeb7ed208b8916f3e32d42bfd085ff5e16936a1a35d9a5=
2789f043b7237","src/unix/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f3=
68ae10ceccefeed9debb3bbe08777fc682","src/unix/hermit/mod.rs":"a1494a0bddf30=
1cceb0d9b8529a84b5882fe855ceae77a1c4e8d6034e705e26c","src/unix/hermit/x86_6=
4.rs":"ab832b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","s=
rc/unix/linux_like/android/b32/arm.rs":"ce582de7e983a33d3bfad13075c53aac901=
6cee35f06ad8653ee9072c3ec2564","src/unix/linux_like/android/b32/mod.rs":"7c=
173e0375119bf06a3081652faede95e5bcd6858e7576b7533d037978737c8f","src/unix/l=
inux_like/android/b32/x86/align.rs":"812914e4241df82e32b12375ca3374615dc3a4=
bdd4cf31f0423c5815320c0dab","src/unix/linux_like/android/b32/x86/mod.rs":"e=
6d107efbcd37b5b85dfa18f683300cbf768ffa0237997a9fa52b184a53323ac","src/unix/=
linux_like/android/b64/aarch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3=
ee2faf6fcae3770f9e505cddca35c7b","src/unix/linux_like/android/b64/aarch64/i=
nt128.rs":"1735f6f5c56770d20dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de=
","src/unix/linux_like/android/b64/aarch64/mod.rs":"10e963e29ff209703de6336=
c99cca96fd79789438d34c82a693eae56e8916c3c","src/unix/linux_like/android/b64=
/mod.rs":"71e4fcbe952bfa4a5f9022f3972e906917b38f729b9d8ef57cd5d179104894ac"=
,"src/unix/linux_like/android/b64/riscv64/align.rs":"0bf138f84e5327d8339bcd=
4adf071a6832b516445e597552c82bbd881095e3a8","src/unix/linux_like/android/b6=
4/riscv64/mod.rs":"19d4bf2237c47127eba9144e0b82e995bc079315e719179a91813b0a=
e7b0e49d","src/unix/linux_like/android/b64/x86_64/align.rs":"7169d07a9fd471=
6f7512719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/an=
droid/b64/x86_64/mod.rs":"4ec2de11a9b65c4325b7b991f0b99a414975e0e61ba8668ca=
ca5d921e9b314d1","src/unix/linux_like/android/mod.rs":"66a9e38a47493a42b3b1=
c325524f3c944e74d1e3e8ecce3cc276ec08fecab13b","src/unix/linux_like/emscript=
en/align.rs":"86c95cbed7a7161b1f23ee06843e7b0e2340ad92b2cb86fe2a8ef3e0e8c36=
216","src/unix/linux_like/emscripten/mod.rs":"67d6b90f539f746aa3290ea7f9d3f=
3f8d2d8a6557233584004ed5697f7821a50","src/unix/linux_like/emscripten/no_ali=
gn.rs":"0128e4aa721a9902754828b61b5ec7d8a86619983ed1e0544a85d35b1051fad6","=
src/unix/linux_like/linux/align.rs":"bc5abcd38e2320171e0981e773c9c5fe3e0d5a=
66fdff049228f6a1acad80ef8b","src/unix/linux_like/linux/arch/generic/mod.rs"=
:"fb5de1368cabae03d3ea0152159b7685a9d91efdecee4c5b83efc085ffef8a73","src/un=
ix/linux_like/linux/arch/mips/mod.rs":"75814e198d1a9a6808be3a5e5edb1bfdc57f=
75b06394e9040739be363c09d82f","src/unix/linux_like/linux/arch/mod.rs":"5bd5=
361f8a6ab4e18bbba6da9f92c164ae252b15a0ed10064812544aa1fdf198","src/unix/lin=
ux_like/linux/arch/powerpc/mod.rs":"bef6b7af9e5e2b4e5545c9c7e3e23a8b743277a=
0ed95853e7eddc38e44299f02","src/unix/linux_like/linux/arch/sparc/mod.rs":"9=
1593ec0440f1dd8f8e612028f432c44c14089286e2aca50e10511ab942db8c3","src/unix/=
linux_like/linux/gnu/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec72=
51957315afa53a7b9f936","src/unix/linux_like/linux/gnu/b32/arm/align.rs":"6e=
c0eb3ee93f7ae99fd714b4deabfb5e97fbcefd8c26f5a45fb8e7150899cdeb","src/unix/l=
inux_like/linux/gnu/b32/arm/mod.rs":"9ab3e97b579a9122690cd01026e14528862860=
346b700aafbb755a7e04054f7f","src/unix/linux_like/linux/gnu/b32/csky/align.r=
s":"3fed009dc9af3cc81be7087da9d2d7d1f39845e4497e290259c5cdbae25f039d","src/=
unix/linux_like/linux/gnu/b32/csky/mod.rs":"4c21d6e7463bb22f00b984294893d12=
c84018d5d26ec661d6a30f4a9625ba639","src/unix/linux_like/linux/gnu/b32/m68k/=
align.rs":"8faa92f77a9232c035418d45331774e64a9a841d99c91791570a203bf2b45bcb=
","src/unix/linux_like/linux/gnu/b32/m68k/mod.rs":"6aab7f1b864e9691d14aa7d3=
89f717c4077b8eed72a7f11e3b8c7fef245e4046","src/unix/linux_like/linux/gnu/b3=
2/mips/align.rs":"429fb5e005cb7143602d430098b6ebfb7d360685b194f333dfd587472=
ae954ee","src/unix/linux_like/linux/gnu/b32/mips/mod.rs":"6b9a5dac6f937ddc1=
453e808e3c43502c87143332df9e43ac64fb8b1eda6c116","src/unix/linux_like/linux=
/gnu/b32/mod.rs":"b56625dd20dd48a8699034d349ef089c540c0ddcbf8a3481d598d101f=
8b40b78","src/unix/linux_like/linux/gnu/b32/powerpc.rs":"5c5d90326b54b57b98=
eff4745fe7a3fb02f053b2dc782241a73e807b491936a3","src/unix/linux_like/linux/=
gnu/b32/riscv32/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd3=
7543efe86621b119","src/unix/linux_like/linux/gnu/b32/riscv32/mod.rs":"491a9=
a97cf712985b75d3ad714691ef60898d88c78bc386a6917de0a6774cc26","src/unix/linu=
x_like/linux/gnu/b32/sparc/align.rs":"21adbed27df73e2d1ed934aaf733a643003d7=
baf2bde9c48ea440895bcca6d41","src/unix/linux_like/linux/gnu/b32/sparc/mod.r=
s":"80894eece66e9348f45d1b07ad37c757ea694bbd10ed49d3f920b34e9f51a9a3","src/=
unix/linux_like/linux/gnu/b32/x86/align.rs":"e4bafdc4a519a7922a81b37a62bbfd=
1177a2f620890eef8f1fbc47162e9eb413","src/unix/linux_like/linux/gnu/b32/x86/=
mod.rs":"c703cc5e9de2dc31d9e5831bfb6f354d6e3518b2ae02263f68a9a70f1c0167e2",=
"src/unix/linux_like/linux/gnu/b64/aarch64/align.rs":"fdf1c72375a2167699157=
e0dd825422690bb6719f7bc69515a2e5846d0431d7c","src/unix/linux_like/linux/gnu=
/b64/aarch64/fallback.rs":"832e7487249c1c0bb6e9911ce3f7d32ca22378e42392ab83=
c56915cbc59d8be3","src/unix/linux_like/linux/gnu/b64/aarch64/ilp32.rs":"bf4=
611b737813deef6787babf6c01698605f3b75482269b8546318667bc68e29","src/unix/li=
nux_like/linux/gnu/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426442f09724d=
9b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/gnu/b64/aarch6=
4/lp64.rs":"11a950697fdda0258c6e37c6b13993348c8de4134105ed4faa79358e5317507=
2","src/unix/linux_like/linux/gnu/b64/aarch64/mod.rs":"172495fbfdf659b9b825=
148bffc2b62704f63fc872428617e868eb15802c9978","src/unix/linux_like/linux/gn=
u/b64/loongarch64/align.rs":"060aa33cc737966c691aab8511c5c5729e551458ce18d0=
e284e0d45f39beeb60","src/unix/linux_like/linux/gnu/b64/loongarch64/mod.rs":=
"18edada8aa5d4127d9aa1bd81c62b5a4209f1efd8b2b2631e801c9e855ab1480","src/uni=
x/linux_like/linux/gnu/b64/mips64/align.rs":"7169d07a9fd4716f7512719aec9fda=
5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/linux/gnu/b64/mips=
64/mod.rs":"628c410b9aaec3c8f43838a28616b577a1d6de60a9799b09bb884d80281f96e=
b","src/unix/linux_like/linux/gnu/b64/mod.rs":"6a160ef25439c4fecdb0e3bd0b81=
8742263c791364da874d4febd3aa644ec8e2","src/unix/linux_like/linux/gnu/b64/po=
werpc64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1=
268130d9","src/unix/linux_like/linux/gnu/b64/powerpc64/mod.rs":"c778a136f06=
c2ffeacea19fa14ce79b828f91b67a002dec5ce87289bae36234e","src/unix/linux_like=
/linux/gnu/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e5880=
3f99cd37543efe86621b119","src/unix/linux_like/linux/gnu/b64/riscv64/mod.rs"=
:"c8f07efc5ddd5d874f1ebc329cd6907818d132ac3e30f4f2a4b04be3fb388551","src/un=
ix/linux_like/linux/gnu/b64/s390x.rs":"a2fd9277c2dcf76f7a16a3bcca745d5a9932=
c765c0dc2feb31c3641be25eb0aa","src/unix/linux_like/linux/gnu/b64/sparc64/al=
ign.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268130d9",=
"src/unix/linux_like/linux/gnu/b64/sparc64/mod.rs":"e8047e9966a2b90063e0151=
a0278c54885e7b323286cf5ab55cbaf151fc772d3","src/unix/linux_like/linux/gnu/b=
64/x86_64/align.rs":"62e822478356db4a73b6bbd1b36d825b893939ab4b308ec11b0578=
bcc4b49769","src/unix/linux_like/linux/gnu/b64/x86_64/mod.rs":"891e595d3371=
4b9883b92f0554d1d361fba2b6c3f6cac09a288252f44c6ec667","src/unix/linux_like/=
linux/gnu/b64/x86_64/not_x32.rs":"38f74ce15d9662ce4818815a2b87be1618d5e45f1=
90f7e4db84ff3285b4421fb","src/unix/linux_like/linux/gnu/b64/x86_64/x32.rs":=
"b20218a11364a6dec87f96d6c0d8b19e660697ab09ad5ee0e9b3a9dafedaaebb","src/uni=
x/linux_like/linux/gnu/mod.rs":"47dd970aedda9c70429741d7c9892a0d5d264e9abcb=
1c41d5bb913a86f0a5362","src/unix/linux_like/linux/gnu/no_align.rs":"9cd2231=
35de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/linux_=
like/linux/mod.rs":"1582c09db7b752af0f796a4cba8aa2bb4ecea895c551a2219e76047=
bcce74a23","src/unix/linux_like/linux/musl/b32/arm/align.rs":"3e8ac052c1043=
764776b54c93ba4260e061df998631737a897d9d47d54f7b80c","src/unix/linux_like/l=
inux/musl/b32/arm/mod.rs":"de0473ef4455fa461c00442f041ec110e6667614b00bb233=
85f35af95d24f668","src/unix/linux_like/linux/musl/b32/hexagon.rs":"4f9a5b3b=
45bc970611597f40add2c489de0fa8ad9dd77629e4daa1755c5e2918","src/unix/linux_l=
ike/linux/musl/b32/mips/align.rs":"429fb5e005cb7143602d430098b6ebfb7d360685=
b194f333dfd587472ae954ee","src/unix/linux_like/linux/musl/b32/mips/mod.rs":=
"8c7de54a04495204772b4bd622b6d34696d27b73ea9e097eb53afa1a7806e31f","src/uni=
x/linux_like/linux/musl/b32/mod.rs":"31677597fd9544c4b1ec1477628288f6273fab=
bc06e38f33da862ad55f019ce1","src/unix/linux_like/linux/musl/b32/powerpc.rs"=
:"539db45fb9de65bb498f9fab739404146428fd5ecd4b39ef5d6d8c4e8215fb29","src/un=
ix/linux_like/linux/musl/b32/riscv32/align.rs":"efd2accf33b87de7c7547903359=
a5da896edc33cd6c719552c7474b60d4a5d48","src/unix/linux_like/linux/musl/b32/=
riscv32/mod.rs":"c91bb80655c91061d80dcd48be2e767b979a0a570dbd54fcf2094a9a1e=
31fad8","src/unix/linux_like/linux/musl/b32/x86/align.rs":"08e77fbd7435d7de=
c2ff56932433bece3f02e47ce810f89004a275a86d39cbe1","src/unix/linux_like/linu=
x/musl/b32/x86/mod.rs":"2237891b538b0b601aca13dfd9bfd030cdf98479e813c3d195e=
c2639be88ee14","src/unix/linux_like/linux/musl/b64/aarch64/align.rs":"6ba32=
725d24d7d8e6aa111f3b57aafa318f83b606abe96561329151829821133","src/unix/linu=
x_like/linux/musl/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426442f09724d9=
b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/musl/b64/aarch6=
4/mod.rs":"54331c1112bc89cf35c0ebe0a974cb219d5167869ddd347e97faf1ec8c54cfec=
","src/unix/linux_like/linux/musl/b64/mips64.rs":"f606383f7a3639c508172becb=
2f1d2551b86dbd9bfceeef18871f94a30ed8d80","src/unix/linux_like/linux/musl/b6=
4/mod.rs":"8275e7a108c71f180de71b86f74baa1e35d9e915befb8ab8191d2a2fe76d3bb9=
","src/unix/linux_like/linux/musl/b64/powerpc64.rs":"6308c2d4b27deab7cc062f=
fdb1a0277126a1bc6ccea84f7276150f062df9f6a6","src/unix/linux_like/linux/musl=
/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd3754=
3efe86621b119","src/unix/linux_like/linux/musl/b64/riscv64/mod.rs":"e6c51d3=
d20b7b409dec3d7f41256a8a0366eabc7cf4db32a237e0ac7c8aa78fa","src/unix/linux_=
like/linux/musl/b64/s390x.rs":"fbf661b30015e315639b900a0eecf868c6fe50245460=
ac93891e1e8f5c55835a","src/unix/linux_like/linux/musl/b64/x86_64/align.rs":=
"77309276ad7a42cbe59ca381f23590b7a143aded05555b34a5b307b808cbca6e","src/uni=
x/linux_like/linux/musl/b64/x86_64/mod.rs":"e5d18b648529b09b35d161120016283=
f5e2ff54e28f60c031c63139901fe713a","src/unix/linux_like/linux/musl/lfs64.rs=
":"3e4fb381f3a0756520bde0f1692d4fa45e4ae8133bf7d7c64b0e3fdd512f235f","src/u=
nix/linux_like/linux/musl/mod.rs":"452e8a1bd998c6a2d026b84e148506cae01706e6=
32cdda286fb70cc58c0fa357","src/unix/linux_like/linux/no_align.rs":"62cdca0e=
011937aaf09a51ca86d9f0ee0fdb05f61ec3c058e6a5d5fa6357d784","src/unix/linux_l=
ike/linux/non_exhaustive.rs":"181a05bf94fdb911db83ce793b993bd6548a4115b306a=
7ef3c10f745a8fea3e9","src/unix/linux_like/linux/uclibc/align.rs":"9ed16138d=
8e439bd90930845a65eafa7ebd67366e6bf633936d44014f6e4c959","src/unix/linux_li=
ke/linux/uclibc/arm/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec725=
1957315afa53a7b9f936","src/unix/linux_like/linux/uclibc/arm/mod.rs":"50288f=
f9e411ab0966da24838f2c2a5618021bc19c422a04f577b2979ef4081e","src/unix/linux=
_like/linux/uclibc/arm/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632=
b96b5c85a76f8316c86653db25","src/unix/linux_like/linux/uclibc/mips/mips32/a=
lign.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936"=
,"src/unix/linux_like/linux/uclibc/mips/mips32/mod.rs":"d0c4434e2bf813372c4=
18a8f516c706cdccc9f7be2f0921b2207b0afdb66fe81","src/unix/linux_like/linux/u=
clibc/mips/mips32/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5=
c85a76f8316c86653db25","src/unix/linux_like/linux/uclibc/mips/mips64/align.=
rs":"a7bdcb18a37a2d91e64d5fad83ea3edc78f5412adb28f77ab077dbb26dd08b2d","src=
/unix/linux_like/linux/uclibc/mips/mips64/mod.rs":"3f38ee6a4690b9d7594be20d=
216467a34d955f7653c2c8ce1e6147daeb53f1e0","src/unix/linux_like/linux/uclibc=
/mips/mips64/no_align.rs":"4a18e3875698c85229599225ac3401a2a40da87e77b2ad4e=
f47c6fcd5a24ed30","src/unix/linux_like/linux/uclibc/mips/mod.rs":"a048fce1c=
2d9b1ad57305642e8ad05ca0f0c7e4753267a2e2d6b4fee5db3b072","src/unix/linux_li=
ke/linux/uclibc/mod.rs":"1c3d25cddcfefa2bd17bdc81550826be31a08eef235e13f825=
f169a5029c8bca","src/unix/linux_like/linux/uclibc/no_align.rs":"3f286370465=
24618adaa1012e26cb7ffe94b9396e6b518cccdc69d59f274d709","src/unix/linux_like=
/linux/uclibc/x86_64/l4re.rs":"024eba5753e852dbdd212427351affe7e83f9916c186=
4bce414d7aa2618f192e","src/unix/linux_like/linux/uclibc/x86_64/mod.rs":"196=
d03affbefb85716937c15904831e731eb222ee906e05e42102d639a8152ea","src/unix/li=
nux_like/linux/uclibc/x86_64/other.rs":"42c3f71e58cabba373f6a55a623f3c31b85=
049eb64824c09c2b082b3b2d6a0a8","src/unix/linux_like/mod.rs":"45c98e7a0fad03=
b03c4c76f11a80e2423873f0a6563e35c60309a29b2c8ff44f","src/unix/mod.rs":"dd4c=
e377ba9517182e718848739a5c3f58cdbbcd4ee467eef9aaf8df5aed5053","src/unix/new=
lib/aarch64/mod.rs":"bac93836a9a57b2c710f32f852e92a4d11ad6759ab0fb6ad33e71d=
60e53278af","src/unix/newlib/align.rs":"28aaf87fafbc6b312622719d472d8cf65f9=
e5467d15339df5f73e66d8502b28a","src/unix/newlib/arm/mod.rs":"cbba6b3e957ece=
b496806e60de8725a23ff3fa0015983b4b4fa27b233732b526","src/unix/newlib/espidf=
/mod.rs":"816f235f4aa4baabba7f2606b31d0fdb03988c52194c966728de8690bf17299d"=
,"src/unix/newlib/generic.rs":"eab066d9f0a0f3eb53cc1073d01496bba0110989e1f6=
a59838afd19f870cd599","src/unix/newlib/horizon/mod.rs":"7cc5cc120437421db13=
9bfa6a90b18168cd3070bdd0f5be96d40fe4c996f3ca1","src/unix/newlib/mod.rs":"9e=
36de3fd78e10cb6b9a59dc5ebe5a1b44a63ccb91433bb33653fb30d0c303c6","src/unix/n=
ewlib/no_align.rs":"e0743b2179495a9514bc3a4d1781e492878c4ec834ee0085d0891dd=
1712e82fb","src/unix/newlib/powerpc/mod.rs":"0202ffd57caf75b6afa2c9717750ff=
b96e375ac33df0ae9609a3f831be393b67","src/unix/newlib/vita/mod.rs":"68e0ce18=
6b44e0b3031eb824710e7454dc2a9df98db98120840c3c6f4d885871","src/unix/no_alig=
n.rs":"c06e95373b9088266e0b14bba0954eef95f93fb2b01d951855e382d22de78e53","s=
rc/unix/nto/aarch64.rs":"4709c9afdc8d583be876598e7c238499ee3e8da5bd2baa614d=
9c7dd414851555","src/unix/nto/mod.rs":"59ab89a8fb6e0a6d22fa968ed4873c2bafa1=
9a0f60a90c9a5148816cb7440889","src/unix/nto/neutrino.rs":"799bff4ab01a6424d=
b6c5a2b76aa5679826d41495f9d13c63485bf13bc80026b","src/unix/nto/x86_64.rs":"=
a3e18e93c2999da1cd7a6f748a4b60c07aefb73d8ea2aafec19a84cfb040bc8e","src/unix=
/redox/mod.rs":"73658b0d28c82a122875aa2b45c489834f4de58c378add7932bbaf3ffb2=
ae789","src/unix/solarish/compat.rs":"00f1ee3faec9da69204e42f025f6735dd13d8=
94071a154425dcc43ecbdd06e7f","src/unix/solarish/illumos.rs":"cd93c2d84722bb=
f9933a92842a8998eb0b2afc962f50bc2546ad127b82809fa7","src/unix/solarish/mod.=
rs":"b1660c631a599a3355116e7485b88ab2f8f2929c2e37851a763431387b902f14","src=
/unix/solarish/solaris.rs":"41b350a89ddf01cd12a10f93640f92be53be0b0d976021c=
dc08da17bf3e72edf","src/unix/solarish/x86.rs":"e86e806df0caed72765040eaa2f3=
c883198d1aa91508540adf9b7008c77f522e","src/unix/solarish/x86_64.rs":"ec2b01=
f194eb8a6a27133c57681da195a949e03098f3ea1e847227a9c09ef5fc","src/unix/solar=
ish/x86_common.rs":"ac869d9c3c95645c22460468391eb1982023c3a8e02b9e06a72e3ae=
f3d5f1eac","src/vxworks/aarch64.rs":"98f0afdc511cd02557e506c21fed6737585490=
a1dce7a9d4941d08c437762b99","src/vxworks/arm.rs":"acb7968ce99fe3f4abdf39d98=
f8133d21a4fba435b8ef7084777cb181d788e88","src/vxworks/mod.rs":"e4edcbcf43a3=
25e738c9465507594d0c87abf3f0e2b9b046c1425f8d44bdad0f","src/vxworks/powerpc.=
rs":"acb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788e88","src=
/vxworks/powerpc64.rs":"98f0afdc511cd02557e506c21fed6737585490a1dce7a9d4941=
d08c437762b99","src/vxworks/x86.rs":"552f007f38317620b23889cb7c49d1d1158412=
52439060122f52f434fbc6e5ba","src/vxworks/x86_64.rs":"018d92be3ad628a129eff9=
f2f5dfbc0883d8b8e5f2fa917b900a7f98ed6b514a","src/wasi.rs":"09ee3b3348b212b0=
50f6ca8ae008a28679ea44a375674307a4e7c9ca0d3ed7d5","src/windows/gnu/align.rs=
":"b2c13ec1b9f3b39a75c452c80c951dff9d0215e31d77e883b4502afb31794647","src/w=
indows/gnu/mod.rs":"3c8c7edb7cdf5d0c44af936db2a94869585c69dfabeef30571b4f4e=
38375767a","src/windows/mod.rs":"9fdc5e1c62c441abef7bc62a7343efb2041edc24db=
9ac0efc0f74df55b69e249","src/windows/msvc/mod.rs":"c068271e00fca6b62bc4bf44=
bcf142cfc38caeded9b6c4e01d1ceef3ccf986f4","src/xous.rs":"eb0675f25ba01f7307=
2d2b70907fb8abb1148facefe5a20756c49250f3d65fae","tests/const_fn.rs":"cb75a1=
f0864f926aebe79118fc34d51a0d1ade2c20a394e7774c7e545f21f1f4"},"package":"9cd=
c71e17332e86d2e1d38c1f99edcb6288ee11b815fb1a4b049eaa2114d369b"}
> +\ No newline at end of file
> diff --git a/meta/recipes-devtools/rust/files/0005-musl-Define-SOCK_SEQPA=
CKET-in-common-place.patch b/meta/recipes-devtools/rust/files/0005-musl-Def=
ine-SOCK_SEQPACKET-in-common-place.patch
> new file mode 100644
> index 000000000000..4c88931d71f0
> --- /dev/null
> +++ b/meta/recipes-devtools/rust/files/0005-musl-Define-SOCK_SEQPACKET-in=
-common-place.patch
> @@ -0,0 +1,115 @@
> +From e955ae784b0f977979b44964e3fa19dd31469bde Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sat, 8 Apr 2023 09:25:31 -0700
> +Subject: [PATCH 5/5] musl: Define SOCK_SEQPACKET in common place
> +
> +This define is not architecture specific in musl [1]
> +
> +[1] https://git.musl-libc.org/cgit/musl/tree/include/sys/socket.h#n90
> +Upstream-Status: Backport [https://github.com/rust-lang/libc/pull/3302/c=
ommits/e955ae784b0f977979b44964e3fa19dd31469bde]
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> +---
> + src/unix/linux_like/linux/musl/b32/arm/mod.rs  | 1 -
> + src/unix/linux_like/linux/musl/b32/hexagon.rs  | 1 -
> + src/unix/linux_like/linux/musl/b32/mips/mod.rs | 1 -
> + src/unix/linux_like/linux/musl/b32/powerpc.rs  | 1 -
> + src/unix/linux_like/linux/musl/b32/x86/mod.rs  | 1 -
> + src/unix/linux_like/linux/musl/b64/mod.rs      | 2 --
> + src/unix/linux_like/linux/musl/mod.rs          | 1 +
> + 7 files changed, 1 insertion(+), 7 deletions(-)
> +
> +Index: rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/a=
rm/mod.rs
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- rustc-1.74.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b32=
/arm/mod.rs
> ++++ rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/arm/=
mod.rs
> +@@ -324,7 +324,6 @@ pub const MAP_SYNC: ::c_int =3D 0x080000;
> +=20
> + pub const SOCK_STREAM: ::c_int =3D 1;
> + pub const SOCK_DGRAM: ::c_int =3D 2;
> +-pub const SOCK_SEQPACKET: ::c_int =3D 5;
> +=20
> + pub const EDEADLK: ::c_int =3D 35;
> + pub const ENAMETOOLONG: ::c_int =3D 36;
> +Index: rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/h=
exagon.rs
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- rustc-1.74.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b32=
/hexagon.rs
> ++++ rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/hexa=
gon.rs
> +@@ -292,7 +292,6 @@ pub const SIG_SETMASK: ::c_int =3D 2; // F
> + pub const SIG_BLOCK: ::c_int =3D 0x000000;
> + pub const SIG_UNBLOCK: ::c_int =3D 0x01;
> + pub const SOCK_DGRAM: ::c_int =3D 2;
> +-pub const SOCK_SEQPACKET: ::c_int =3D 5;
> + pub const SOCK_STREAM: ::c_int =3D 1;
> + pub const SOL_CAIF: ::c_int =3D 278;
> + pub const SOL_IUCV: ::c_int =3D 277;
> +Index: rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/m=
ips/mod.rs
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- rustc-1.74.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b32=
/mips/mod.rs
> ++++ rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/mips=
/mod.rs
> +@@ -349,7 +349,6 @@ pub const ERFKILL: ::c_int =3D 167;
> +=20
> + pub const SOCK_STREAM: ::c_int =3D 2;
> + pub const SOCK_DGRAM: ::c_int =3D 1;
> +-pub const SOCK_SEQPACKET: ::c_int =3D 5;
> +=20
> + pub const SA_ONSTACK: ::c_int =3D 0x08000000;
> + pub const SA_SIGINFO: ::c_int =3D 8;
> +Index: rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/p=
owerpc.rs
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- rustc-1.74.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b32=
/powerpc.rs
> ++++ rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/powe=
rpc.rs
> +@@ -260,7 +260,6 @@ pub const PTRACE_SYSEMU_SINGLESTEP: ::c_
> +=20
> + pub const SOCK_STREAM: ::c_int =3D 1;
> + pub const SOCK_DGRAM: ::c_int =3D 2;
> +-pub const SOCK_SEQPACKET: ::c_int =3D 5;
> +=20
> + pub const EDEADLK: ::c_int =3D 35;
> + pub const ENAMETOOLONG: ::c_int =3D 36;
> +Index: rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/x=
86/mod.rs
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- rustc-1.74.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b32=
/x86/mod.rs
> ++++ rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/x86/=
mod.rs
> +@@ -313,7 +313,6 @@ pub const MAP_SYNC: ::c_int =3D 0x080000;
> +=20
> + pub const SOCK_STREAM: ::c_int =3D 1;
> + pub const SOCK_DGRAM: ::c_int =3D 2;
> +-pub const SOCK_SEQPACKET: ::c_int =3D 5;
> +=20
> + pub const EDEADLK: ::c_int =3D 35;
> + pub const ENAMETOOLONG: ::c_int =3D 36;
> +Index: rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b64/m=
od.rs
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- rustc-1.74.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b64=
/mod.rs
> ++++ rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/b64/mod.=
rs
> +@@ -134,8 +134,6 @@ pub const __SIZEOF_PTHREAD_RWLOCK_T: usi
> + pub const __SIZEOF_PTHREAD_MUTEX_T: usize =3D 40;
> + pub const __SIZEOF_PTHREAD_BARRIER_T: usize =3D 32;
> +=20
> +-pub const SOCK_SEQPACKET: ::c_int =3D 5;
> +-
> + extern "C" {
> +     pub fn getrandom(buf: *mut ::c_void, buflen: ::size_t, flags: ::c_u=
int) -> ::ssize_t;
> + }
> +Index: rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/mod.rs
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- rustc-1.74.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/mod=
=2Ers
> ++++ rustc-1.74.0-src/vendor/libc/src/unix/linux_like/linux/musl/mod.rs
> +@@ -545,6 +545,7 @@ pub const POSIX_MADV_DONTNEED: ::c_int =3D
> +=20
> + pub const MAP_ANONYMOUS: ::c_int =3D MAP_ANON;
> +=20
> ++pub const SOCK_SEQPACKET: ::c_int =3D 5;
> + pub const SOCK_DCCP: ::c_int =3D 6;
> + pub const SOCK_NONBLOCK: ::c_int =3D O_NONBLOCK;
> + pub const SOCK_PACKET: ::c_int =3D 10;
> +Index: rustc-1.74.0-src/vendor/libc/.cargo-checksum.json
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- rustc-1.74.0-src.orig/vendor/libc/.cargo-checksum.json
> ++++ rustc-1.74.0-src/vendor/libc/.cargo-checksum.json
> +@@ -1 +1 @@
> +-{"files":{"CONTRIBUTING.md":"bdc90b52cf803faac96e594069a86dd8ea150d5ba7=
fb3e6cadfc08dac4c7b0ce","Cargo.toml":"a58e58fa9bde015e08609ea2f17e56c5df7c8=
2aa6f3fa1a144c02ee4715227b9","LICENSE-APACHE":"62c7a1e35f56406896d7aa7ca52d=
0cc0d272ac022b5d2796e7d6905db8a3636a","LICENSE-MIT":"a8d47ff51ca256f56a8932=
dba07660672dbfe3004257ca8de708aac1415937a1","README.md":"ecc47e284f8d007fc0=
48666d5108dd41cdc440ab9eedfe8c47d1634613522787","build.rs":"9e94683e94db80e=
8282fce07549cf748d9037852fb06df1c7596bea2ed130d50","rustfmt.toml":"eaa2ea84=
fc1ba0359b77680804903e07bb38d257ab11986b95b158e460f787b2","src/fixed_width_=
ints.rs":"7f986e5f5e68d25ef04d386fd2f640e8be8f15427a8d4a458ea01d26b8dca0ca"=
,"src/fuchsia/aarch64.rs":"893fcec48142d273063ffd814dca33fbec92205fd39ada97=
075f85201d803996","src/fuchsia/align.rs":"ae1cf8f011a99737eabeb14ffff768e60=
f13b13363d7646744dbb0f443dab3d6","src/fuchsia/mod.rs":"30f4dc83ef120300d618=
96696512436377c5f36f1431d98ab7e01e498c0c47d5","src/fuchsia/no_align.rs":"30=
3f3f1b255e0088b5715094353cf00476131d8e94e6aebb3f469557771c8b8a","src/fuchsi=
a/riscv64.rs":"617cd75e79e0e20f664db764a4dc2a396d9fd11a4d95371acd91ed481129=
3b11","src/fuchsia/x86_64.rs":"93a3632b5cf67d2a6bcb7dc0a558605252d5fe689e0f=
38d8aa2ec5852255ac87","src/hermit/aarch64.rs":"86048676e335944c37a63d0083d0=
f368ae10ceccefeed9debb3bbe08777fc682","src/hermit/mod.rs":"d3bfce41e4463d4b=
e8020a2d063c9bfa8b665f45f1cc6cbf3163f5d01e7cb21f","src/hermit/x86_64.rs":"a=
b832b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/lib.r=
s":"24111461547739f3646f95bcb66c43f2ae679a727ff5938299434c522c02e458","src/=
macros.rs":"b457eb028b8e8ab3c24bb7292b874ad4e491edbb83594f6a3da024df5348c08=
8","src/psp.rs":"dd31aabd46171d474ec5828372e28588935120e7355c90c105360d8fa9=
264c1c","src/sgx.rs":"16a95cdefc81c5ee00d8353a60db363c4cc3e0f75abcd5d014472=
3f2a306ed1b","src/solid/aarch64.rs":"a726e47f324adf73a4a0b67a2c183408d0cad1=
05ae66acf36db37a42ab7f8707","src/solid/arm.rs":"e39a4f74ebbef3b97b8c95758ad=
741123d84ed3eb48d9cf4f1f4872097fc27fe","src/solid/mod.rs":"5f4151dca5132e4b=
4e4c23ab9737e12856dddbdc0ca3f7dbc004328ef3c8acde","src/switch.rs":"9da3dd39=
b3de45a7928789926e8572d00e1e11a39e6f7289a1349aadce90edba","src/unix/aix/mod=
=2Ers":"54229b5e774669c16912112e8b50fa938db76f534971222a11723a05195a0948","=
src/unix/aix/powerpc64.rs":"cf374d81139d45f9d77c6a764f640bfbf7e0a5903689652=
c8296f8e10d55169b","src/unix/align.rs":"2cdc7c826ef7ae61f5171c5ae8c445a743d=
86f1a7f2d9d7e4ceeec56d6874f65","src/unix/bsd/apple/b32/align.rs":"ec833a747=
866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/appl=
e/b32/mod.rs":"2546ad3eb6aecb95f916648bc63264117c92b4b4859532b34cb011e4c75a=
5a72","src/unix/bsd/apple/b64/aarch64/align.rs":"2eaf0f561a32bdcbf4e0477c88=
95d5e7bcb5cdebd5fef7b4df2ca8e38e144d94","src/unix/bsd/apple/b64/aarch64/mod=
=2Ers":"44c217a4f263afe7a97435de9323d20a96c37836f899ca0925306d4b7e073c27","=
src/unix/bsd/apple/b64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf=
4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b64/mod.rs":"f5e278a1af7fb3588=
91d1c9be4eb7e815aaca0c5cb738d0c3604ba2208a856f7","src/unix/bsd/apple/b64/x8=
6_64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b=
0e26c","src/unix/bsd/apple/b64/x86_64/mod.rs":"8c87c5855038aae5d433c8f5eb3b=
29b0a175879a0245342b3bfd83bdf4cfd936","src/unix/bsd/apple/long_array.rs":"3=
cf1f19b812e6d093c819dc65ce55b13491963e0780eda0d0bd1577603e81948","src/unix/=
bsd/apple/mod.rs":"0931fd351d585728e6384d7b952b8d816e9acdb9c86c172324445f3c=
33f692ca","src/unix/bsd/freebsdlike/dragonfly/errno.rs":"8295b8bb0dfd38d2cd=
b4d9192cdeeb534cc6c3b208170e64615fa3e0edb3e578","src/unix/bsd/freebsdlike/d=
ragonfly/mod.rs":"f2e78625fe1eb14f43e730a3987eba888cb8ac04c23008e7c2d2f7c72=
258b9e6","src/unix/bsd/freebsdlike/freebsd/aarch64.rs":"6c8e216385f53a4bf5f=
171749b57602fc34a4e4b160a44ca31c058cb0c8a2126","src/unix/bsd/freebsdlike/fr=
eebsd/arm.rs":"59d6a670eea562fb87686e243e0a84603d29a2028a3d4b3f99ccc01bd04d=
2f47","src/unix/bsd/freebsdlike/freebsd/freebsd11/b64.rs":"9808d152c1196aa6=
47f1b0f0cf84dac8c930da7d7f897a44975545e3d9d17681","src/unix/bsd/freebsdlike=
/freebsd/freebsd11/mod.rs":"e243ae0e89623d4fa9f85afe14369cc5fd5f2028ea71577=
3dbec722ba80dac1f","src/unix/bsd/freebsdlike/freebsd/freebsd12/b64.rs":"61c=
be45f8499bedb168106b686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bs=
d/freebsdlike/freebsd/freebsd12/mod.rs":"bef9fae288a4f29e941ea369be1cd20b17=
0040e60665a4d49a4a9e79009b72d8","src/unix/bsd/freebsdlike/freebsd/freebsd12=
/x86_64.rs":"2df36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd0=
52","src/unix/bsd/freebsdlike/freebsd/freebsd13/b64.rs":"61cbe45f8499bedb16=
8106b686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/f=
reebsd/freebsd13/mod.rs":"3c514e037694ce22724abb3c9c4687defda7f0e3456b615ca=
73593e860e38b16","src/unix/bsd/freebsdlike/freebsd/freebsd13/x86_64.rs":"2d=
f36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/b=
sd/freebsdlike/freebsd/freebsd14/b64.rs":"61cbe45f8499bedb168106b686d4f8239=
472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd1=
4/mod.rs":"318abe48bfdd1c74ecd6afbd6c9329c5c72ce4f7d420edd6be2fc12b223ae32f=
","src/unix/bsd/freebsdlike/freebsd/freebsd14/x86_64.rs":"e7b5863e222d6cc41=
6b6b0fbe71690fad909e899b4c4ae810bbca117e4fcb650","src/unix/bsd/freebsdlike/=
freebsd/mod.rs":"4c3cd57aaf7fbce072e28e0d2d285b5fda9702e924561d2fd01e49e6ee=
186a98","src/unix/bsd/freebsdlike/freebsd/powerpc.rs":"9ca3f82f88974e6db556=
9f2d76a5a3749b248a31747a6c0da5820492bdfeca42","src/unix/bsd/freebsdlike/fre=
ebsd/powerpc64.rs":"2dae3ecc87eac3b11657aa98915def55fc4b5c0de11fe26aae23329=
a54628a9a","src/unix/bsd/freebsdlike/freebsd/riscv64.rs":"fa4bed4c58cad24ba=
3395941c7fa6b11e089551a04714f9561078e400f5b2b62","src/unix/bsd/freebsdlike/=
freebsd/x86.rs":"6766e2ce85e187b306cd3b0b8d7e15b8f4042c5cff81d89b3af69ecc99=
c70ab0","src/unix/bsd/freebsdlike/freebsd/x86_64/align.rs":"0e1f69a88fca1c3=
2874b1daf5db3d446fefbe518dca497f096cc9168c39dde70","src/unix/bsd/freebsdlik=
e/freebsd/x86_64/mod.rs":"51e4dd0c8ae247bb652feda5adad9333ea3bb30c750c3a393=
5e0b0e47d7803eb","src/unix/bsd/freebsdlike/mod.rs":"0eacafac87fb3a32ef1b859=
80fece2792e70eba9856af18a7407cc35be68ea57","src/unix/bsd/mod.rs":"dad51a24a=
524e92bfe9de3ac3b7d394d86058b9b8a1ccd4efa9bbb5c78e7fa1a","src/unix/bsd/netb=
sdlike/mod.rs":"0a66f7de43710e35a6a546e6c39066aa8b91a6efadb71db88738b0a577f=
d5537","src/unix/bsd/netbsdlike/netbsd/aarch64.rs":"65dcb58d11e8d8028401a9d=
07ca3eb4cb4f053e04249cc877353449d84ccc4cb","src/unix/bsd/netbsdlike/netbsd/=
arm.rs":"58cdbb70b0d6f536551f0f3bb3725d2d75c4690db12c26c034e7d6ec4a924452",=
"src/unix/bsd/netbsdlike/netbsd/mod.rs":"90dd33ef20dc3be8aef5bd152a6a06e7ab=
34f9527b3978487b593aaa16a907bd","src/unix/bsd/netbsdlike/netbsd/powerpc.rs"=
:"ee7ff5d89d0ed22f531237b5059aa669df93a3b5c489fa641465ace8d405bf41","src/un=
ix/bsd/netbsdlike/netbsd/sparc64.rs":"9489f4b3e4566f43bb12dfb92238960613dac=
7f6a45cc13068a8d152b902d7d9","src/unix/bsd/netbsdlike/netbsd/x86.rs":"20692=
320e36bfe028d1a34d16fe12ca77aa909cb02bda167376f98f1a09aefe7","src/unix/bsd/=
netbsdlike/netbsd/x86_64.rs":"1afe5ef46b14397cdd68664b5b232e4f5b035b6db1d4c=
f411c899d51ebca9f30","src/unix/bsd/netbsdlike/openbsd/aarch64.rs":"dd91931d=
373b7ecaf6e2de25adadee10d16fa9b12c2cbacdff3eb291e1ba36af","src/unix/bsd/net=
bsdlike/openbsd/arm.rs":"01580d261bc6447bb327a0d982181b7bdabfa066cee65a3037=
3d3ced729ad307","src/unix/bsd/netbsdlike/openbsd/mips64.rs":"8532a189ae10c7=
d668d9d4065da8b05d124e09bd39442c9f74a7f231c43eca48","src/unix/bsd/netbsdlik=
e/openbsd/mod.rs":"c27c6673bd3628549083a094219831fd9343129f91067b562781617d=
2a887148","src/unix/bsd/netbsdlike/openbsd/powerpc.rs":"01580d261bc6447bb32=
7a0d982181b7bdabfa066cee65a30373d3ced729ad307","src/unix/bsd/netbsdlike/ope=
nbsd/powerpc64.rs":"1dd5449dd1fd3d51e30ffdeeaece91d0aaf05c710e0ac699fecc546=
1cfa2c28e","src/unix/bsd/netbsdlike/openbsd/riscv64.rs":"1dd5449dd1fd3d51e3=
0ffdeeaece91d0aaf05c710e0ac699fecc5461cfa2c28e","src/unix/bsd/netbsdlike/op=
enbsd/sparc64.rs":"d04fd287afbaa2c5df9d48c94e8374a532a3ba491b424ddf018270c7=
312f4085","src/unix/bsd/netbsdlike/openbsd/x86.rs":"6f7f5c4fde2a2259eb54789=
0cbd86570cea04ef85347d7569e94e679448bec87","src/unix/bsd/netbsdlike/openbsd=
/x86_64.rs":"d31db31630289c85af3339dbe357998a21ca584cbae31607448fe2cf7675a4=
e1","src/unix/haiku/b32.rs":"a2efdbf7158a6da341e1db9176b0ab193ba88b44961623=
9ed95dced11f54d87b","src/unix/haiku/b64.rs":"ff8115367d3d7d354f792d6176dfaa=
a26353f57056197b563bf4681f91ff7985","src/unix/haiku/mod.rs":"d7ec086b73db4f=
72799179627aa6330a513dcf786b06e19c75ff884d1235948e","src/unix/haiku/native.=
rs":"dbfcbf4954a79d1df2ff58e0590bbcb8c57dfc7a32392aa73ee4726b66bd6cc8","src=
/unix/haiku/x86_64.rs":"3ec3aeeb7ed208b8916f3e32d42bfd085ff5e16936a1a35d9a5=
2789f043b7237","src/unix/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f3=
68ae10ceccefeed9debb3bbe08777fc682","src/unix/hermit/mod.rs":"a1494a0bddf30=
1cceb0d9b8529a84b5882fe855ceae77a1c4e8d6034e705e26c","src/unix/hermit/x86_6=
4.rs":"ab832b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","s=
rc/unix/linux_like/android/b32/arm.rs":"ce582de7e983a33d3bfad13075c53aac901=
6cee35f06ad8653ee9072c3ec2564","src/unix/linux_like/android/b32/mod.rs":"7c=
173e0375119bf06a3081652faede95e5bcd6858e7576b7533d037978737c8f","src/unix/l=
inux_like/android/b32/x86/align.rs":"812914e4241df82e32b12375ca3374615dc3a4=
bdd4cf31f0423c5815320c0dab","src/unix/linux_like/android/b32/x86/mod.rs":"e=
6d107efbcd37b5b85dfa18f683300cbf768ffa0237997a9fa52b184a53323ac","src/unix/=
linux_like/android/b64/aarch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3=
ee2faf6fcae3770f9e505cddca35c7b","src/unix/linux_like/android/b64/aarch64/i=
nt128.rs":"1735f6f5c56770d20dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de=
","src/unix/linux_like/android/b64/aarch64/mod.rs":"10e963e29ff209703de6336=
c99cca96fd79789438d34c82a693eae56e8916c3c","src/unix/linux_like/android/b64=
/mod.rs":"71e4fcbe952bfa4a5f9022f3972e906917b38f729b9d8ef57cd5d179104894ac"=
,"src/unix/linux_like/android/b64/riscv64/align.rs":"0bf138f84e5327d8339bcd=
4adf071a6832b516445e597552c82bbd881095e3a8","src/unix/linux_like/android/b6=
4/riscv64/mod.rs":"19d4bf2237c47127eba9144e0b82e995bc079315e719179a91813b0a=
e7b0e49d","src/unix/linux_like/android/b64/x86_64/align.rs":"7169d07a9fd471=
6f7512719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/an=
droid/b64/x86_64/mod.rs":"4ec2de11a9b65c4325b7b991f0b99a414975e0e61ba8668ca=
ca5d921e9b314d1","src/unix/linux_like/android/mod.rs":"66a9e38a47493a42b3b1=
c325524f3c944e74d1e3e8ecce3cc276ec08fecab13b","src/unix/linux_like/emscript=
en/align.rs":"86c95cbed7a7161b1f23ee06843e7b0e2340ad92b2cb86fe2a8ef3e0e8c36=
216","src/unix/linux_like/emscripten/mod.rs":"67d6b90f539f746aa3290ea7f9d3f=
3f8d2d8a6557233584004ed5697f7821a50","src/unix/linux_like/emscripten/no_ali=
gn.rs":"0128e4aa721a9902754828b61b5ec7d8a86619983ed1e0544a85d35b1051fad6","=
src/unix/linux_like/linux/align.rs":"bc5abcd38e2320171e0981e773c9c5fe3e0d5a=
66fdff049228f6a1acad80ef8b","src/unix/linux_like/linux/arch/generic/mod.rs"=
:"fb5de1368cabae03d3ea0152159b7685a9d91efdecee4c5b83efc085ffef8a73","src/un=
ix/linux_like/linux/arch/mips/mod.rs":"75814e198d1a9a6808be3a5e5edb1bfdc57f=
75b06394e9040739be363c09d82f","src/unix/linux_like/linux/arch/mod.rs":"5bd5=
361f8a6ab4e18bbba6da9f92c164ae252b15a0ed10064812544aa1fdf198","src/unix/lin=
ux_like/linux/arch/powerpc/mod.rs":"bef6b7af9e5e2b4e5545c9c7e3e23a8b743277a=
0ed95853e7eddc38e44299f02","src/unix/linux_like/linux/arch/sparc/mod.rs":"9=
1593ec0440f1dd8f8e612028f432c44c14089286e2aca50e10511ab942db8c3","src/unix/=
linux_like/linux/gnu/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec72=
51957315afa53a7b9f936","src/unix/linux_like/linux/gnu/b32/arm/align.rs":"6e=
c0eb3ee93f7ae99fd714b4deabfb5e97fbcefd8c26f5a45fb8e7150899cdeb","src/unix/l=
inux_like/linux/gnu/b32/arm/mod.rs":"9ab3e97b579a9122690cd01026e14528862860=
346b700aafbb755a7e04054f7f","src/unix/linux_like/linux/gnu/b32/csky/align.r=
s":"3fed009dc9af3cc81be7087da9d2d7d1f39845e4497e290259c5cdbae25f039d","src/=
unix/linux_like/linux/gnu/b32/csky/mod.rs":"4c21d6e7463bb22f00b984294893d12=
c84018d5d26ec661d6a30f4a9625ba639","src/unix/linux_like/linux/gnu/b32/m68k/=
align.rs":"8faa92f77a9232c035418d45331774e64a9a841d99c91791570a203bf2b45bcb=
","src/unix/linux_like/linux/gnu/b32/m68k/mod.rs":"6aab7f1b864e9691d14aa7d3=
89f717c4077b8eed72a7f11e3b8c7fef245e4046","src/unix/linux_like/linux/gnu/b3=
2/mips/align.rs":"429fb5e005cb7143602d430098b6ebfb7d360685b194f333dfd587472=
ae954ee","src/unix/linux_like/linux/gnu/b32/mips/mod.rs":"6b9a5dac6f937ddc1=
453e808e3c43502c87143332df9e43ac64fb8b1eda6c116","src/unix/linux_like/linux=
/gnu/b32/mod.rs":"b56625dd20dd48a8699034d349ef089c540c0ddcbf8a3481d598d101f=
8b40b78","src/unix/linux_like/linux/gnu/b32/powerpc.rs":"5c5d90326b54b57b98=
eff4745fe7a3fb02f053b2dc782241a73e807b491936a3","src/unix/linux_like/linux/=
gnu/b32/riscv32/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd3=
7543efe86621b119","src/unix/linux_like/linux/gnu/b32/riscv32/mod.rs":"491a9=
a97cf712985b75d3ad714691ef60898d88c78bc386a6917de0a6774cc26","src/unix/linu=
x_like/linux/gnu/b32/sparc/align.rs":"21adbed27df73e2d1ed934aaf733a643003d7=
baf2bde9c48ea440895bcca6d41","src/unix/linux_like/linux/gnu/b32/sparc/mod.r=
s":"80894eece66e9348f45d1b07ad37c757ea694bbd10ed49d3f920b34e9f51a9a3","src/=
unix/linux_like/linux/gnu/b32/x86/align.rs":"e4bafdc4a519a7922a81b37a62bbfd=
1177a2f620890eef8f1fbc47162e9eb413","src/unix/linux_like/linux/gnu/b32/x86/=
mod.rs":"c703cc5e9de2dc31d9e5831bfb6f354d6e3518b2ae02263f68a9a70f1c0167e2",=
"src/unix/linux_like/linux/gnu/b64/aarch64/align.rs":"fdf1c72375a2167699157=
e0dd825422690bb6719f7bc69515a2e5846d0431d7c","src/unix/linux_like/linux/gnu=
/b64/aarch64/fallback.rs":"832e7487249c1c0bb6e9911ce3f7d32ca22378e42392ab83=
c56915cbc59d8be3","src/unix/linux_like/linux/gnu/b64/aarch64/ilp32.rs":"bf4=
611b737813deef6787babf6c01698605f3b75482269b8546318667bc68e29","src/unix/li=
nux_like/linux/gnu/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426442f09724d=
9b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/gnu/b64/aarch6=
4/lp64.rs":"11a950697fdda0258c6e37c6b13993348c8de4134105ed4faa79358e5317507=
2","src/unix/linux_like/linux/gnu/b64/aarch64/mod.rs":"172495fbfdf659b9b825=
148bffc2b62704f63fc872428617e868eb15802c9978","src/unix/linux_like/linux/gn=
u/b64/loongarch64/align.rs":"060aa33cc737966c691aab8511c5c5729e551458ce18d0=
e284e0d45f39beeb60","src/unix/linux_like/linux/gnu/b64/loongarch64/mod.rs":=
"18edada8aa5d4127d9aa1bd81c62b5a4209f1efd8b2b2631e801c9e855ab1480","src/uni=
x/linux_like/linux/gnu/b64/mips64/align.rs":"7169d07a9fd4716f7512719aec9fda=
5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/linux/gnu/b64/mips=
64/mod.rs":"628c410b9aaec3c8f43838a28616b577a1d6de60a9799b09bb884d80281f96e=
b","src/unix/linux_like/linux/gnu/b64/mod.rs":"6a160ef25439c4fecdb0e3bd0b81=
8742263c791364da874d4febd3aa644ec8e2","src/unix/linux_like/linux/gnu/b64/po=
werpc64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1=
268130d9","src/unix/linux_like/linux/gnu/b64/powerpc64/mod.rs":"c778a136f06=
c2ffeacea19fa14ce79b828f91b67a002dec5ce87289bae36234e","src/unix/linux_like=
/linux/gnu/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e5880=
3f99cd37543efe86621b119","src/unix/linux_like/linux/gnu/b64/riscv64/mod.rs"=
:"c8f07efc5ddd5d874f1ebc329cd6907818d132ac3e30f4f2a4b04be3fb388551","src/un=
ix/linux_like/linux/gnu/b64/s390x.rs":"a2fd9277c2dcf76f7a16a3bcca745d5a9932=
c765c0dc2feb31c3641be25eb0aa","src/unix/linux_like/linux/gnu/b64/sparc64/al=
ign.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268130d9",=
"src/unix/linux_like/linux/gnu/b64/sparc64/mod.rs":"e8047e9966a2b90063e0151=
a0278c54885e7b323286cf5ab55cbaf151fc772d3","src/unix/linux_like/linux/gnu/b=
64/x86_64/align.rs":"62e822478356db4a73b6bbd1b36d825b893939ab4b308ec11b0578=
bcc4b49769","src/unix/linux_like/linux/gnu/b64/x86_64/mod.rs":"891e595d3371=
4b9883b92f0554d1d361fba2b6c3f6cac09a288252f44c6ec667","src/unix/linux_like/=
linux/gnu/b64/x86_64/not_x32.rs":"38f74ce15d9662ce4818815a2b87be1618d5e45f1=
90f7e4db84ff3285b4421fb","src/unix/linux_like/linux/gnu/b64/x86_64/x32.rs":=
"b20218a11364a6dec87f96d6c0d8b19e660697ab09ad5ee0e9b3a9dafedaaebb","src/uni=
x/linux_like/linux/gnu/mod.rs":"47dd970aedda9c70429741d7c9892a0d5d264e9abcb=
1c41d5bb913a86f0a5362","src/unix/linux_like/linux/gnu/no_align.rs":"9cd2231=
35de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/linux_=
like/linux/mod.rs":"1582c09db7b752af0f796a4cba8aa2bb4ecea895c551a2219e76047=
bcce74a23","src/unix/linux_like/linux/musl/b32/arm/align.rs":"3e8ac052c1043=
764776b54c93ba4260e061df998631737a897d9d47d54f7b80c","src/unix/linux_like/l=
inux/musl/b32/arm/mod.rs":"de0473ef4455fa461c00442f041ec110e6667614b00bb233=
85f35af95d24f668","src/unix/linux_like/linux/musl/b32/hexagon.rs":"4f9a5b3b=
45bc970611597f40add2c489de0fa8ad9dd77629e4daa1755c5e2918","src/unix/linux_l=
ike/linux/musl/b32/mips/align.rs":"429fb5e005cb7143602d430098b6ebfb7d360685=
b194f333dfd587472ae954ee","src/unix/linux_like/linux/musl/b32/mips/mod.rs":=
"8c7de54a04495204772b4bd622b6d34696d27b73ea9e097eb53afa1a7806e31f","src/uni=
x/linux_like/linux/musl/b32/mod.rs":"31677597fd9544c4b1ec1477628288f6273fab=
bc06e38f33da862ad55f019ce1","src/unix/linux_like/linux/musl/b32/powerpc.rs"=
:"539db45fb9de65bb498f9fab739404146428fd5ecd4b39ef5d6d8c4e8215fb29","src/un=
ix/linux_like/linux/musl/b32/riscv32/align.rs":"efd2accf33b87de7c7547903359=
a5da896edc33cd6c719552c7474b60d4a5d48","src/unix/linux_like/linux/musl/b32/=
riscv32/mod.rs":"c91bb80655c91061d80dcd48be2e767b979a0a570dbd54fcf2094a9a1e=
31fad8","src/unix/linux_like/linux/musl/b32/x86/align.rs":"08e77fbd7435d7de=
c2ff56932433bece3f02e47ce810f89004a275a86d39cbe1","src/unix/linux_like/linu=
x/musl/b32/x86/mod.rs":"2237891b538b0b601aca13dfd9bfd030cdf98479e813c3d195e=
c2639be88ee14","src/unix/linux_like/linux/musl/b64/aarch64/align.rs":"6ba32=
725d24d7d8e6aa111f3b57aafa318f83b606abe96561329151829821133","src/unix/linu=
x_like/linux/musl/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426442f09724d9=
b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/musl/b64/aarch6=
4/mod.rs":"54331c1112bc89cf35c0ebe0a974cb219d5167869ddd347e97faf1ec8c54cfec=
","src/unix/linux_like/linux/musl/b64/mips64.rs":"f606383f7a3639c508172becb=
2f1d2551b86dbd9bfceeef18871f94a30ed8d80","src/unix/linux_like/linux/musl/b6=
4/mod.rs":"8275e7a108c71f180de71b86f74baa1e35d9e915befb8ab8191d2a2fe76d3bb9=
","src/unix/linux_like/linux/musl/b64/powerpc64.rs":"6308c2d4b27deab7cc062f=
fdb1a0277126a1bc6ccea84f7276150f062df9f6a6","src/unix/linux_like/linux/musl=
/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd3754=
3efe86621b119","src/unix/linux_like/linux/musl/b64/riscv64/mod.rs":"e6c51d3=
d20b7b409dec3d7f41256a8a0366eabc7cf4db32a237e0ac7c8aa78fa","src/unix/linux_=
like/linux/musl/b64/s390x.rs":"fbf661b30015e315639b900a0eecf868c6fe50245460=
ac93891e1e8f5c55835a","src/unix/linux_like/linux/musl/b64/x86_64/align.rs":=
"77309276ad7a42cbe59ca381f23590b7a143aded05555b34a5b307b808cbca6e","src/uni=
x/linux_like/linux/musl/b64/x86_64/mod.rs":"e5d18b648529b09b35d161120016283=
f5e2ff54e28f60c031c63139901fe713a","src/unix/linux_like/linux/musl/lfs64.rs=
":"3e4fb381f3a0756520bde0f1692d4fa45e4ae8133bf7d7c64b0e3fdd512f235f","src/u=
nix/linux_like/linux/musl/mod.rs":"452e8a1bd998c6a2d026b84e148506cae01706e6=
32cdda286fb70cc58c0fa357","src/unix/linux_like/linux/no_align.rs":"62cdca0e=
011937aaf09a51ca86d9f0ee0fdb05f61ec3c058e6a5d5fa6357d784","src/unix/linux_l=
ike/linux/non_exhaustive.rs":"181a05bf94fdb911db83ce793b993bd6548a4115b306a=
7ef3c10f745a8fea3e9","src/unix/linux_like/linux/uclibc/align.rs":"9ed16138d=
8e439bd90930845a65eafa7ebd67366e6bf633936d44014f6e4c959","src/unix/linux_li=
ke/linux/uclibc/arm/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec725=
1957315afa53a7b9f936","src/unix/linux_like/linux/uclibc/arm/mod.rs":"50288f=
f9e411ab0966da24838f2c2a5618021bc19c422a04f577b2979ef4081e","src/unix/linux=
_like/linux/uclibc/arm/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632=
b96b5c85a76f8316c86653db25","src/unix/linux_like/linux/uclibc/mips/mips32/a=
lign.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936"=
,"src/unix/linux_like/linux/uclibc/mips/mips32/mod.rs":"d0c4434e2bf813372c4=
18a8f516c706cdccc9f7be2f0921b2207b0afdb66fe81","src/unix/linux_like/linux/u=
clibc/mips/mips32/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5=
c85a76f8316c86653db25","src/unix/linux_like/linux/uclibc/mips/mips64/align.=
rs":"a7bdcb18a37a2d91e64d5fad83ea3edc78f5412adb28f77ab077dbb26dd08b2d","src=
/unix/linux_like/linux/uclibc/mips/mips64/mod.rs":"3f38ee6a4690b9d7594be20d=
216467a34d955f7653c2c8ce1e6147daeb53f1e0","src/unix/linux_like/linux/uclibc=
/mips/mips64/no_align.rs":"4a18e3875698c85229599225ac3401a2a40da87e77b2ad4e=
f47c6fcd5a24ed30","src/unix/linux_like/linux/uclibc/mips/mod.rs":"a048fce1c=
2d9b1ad57305642e8ad05ca0f0c7e4753267a2e2d6b4fee5db3b072","src/unix/linux_li=
ke/linux/uclibc/mod.rs":"1c3d25cddcfefa2bd17bdc81550826be31a08eef235e13f825=
f169a5029c8bca","src/unix/linux_like/linux/uclibc/no_align.rs":"3f286370465=
24618adaa1012e26cb7ffe94b9396e6b518cccdc69d59f274d709","src/unix/linux_like=
/linux/uclibc/x86_64/l4re.rs":"024eba5753e852dbdd212427351affe7e83f9916c186=
4bce414d7aa2618f192e","src/unix/linux_like/linux/uclibc/x86_64/mod.rs":"196=
d03affbefb85716937c15904831e731eb222ee906e05e42102d639a8152ea","src/unix/li=
nux_like/linux/uclibc/x86_64/other.rs":"42c3f71e58cabba373f6a55a623f3c31b85=
049eb64824c09c2b082b3b2d6a0a8","src/unix/linux_like/mod.rs":"45c98e7a0fad03=
b03c4c76f11a80e2423873f0a6563e35c60309a29b2c8ff44f","src/unix/mod.rs":"dd4c=
e377ba9517182e718848739a5c3f58cdbbcd4ee467eef9aaf8df5aed5053","src/unix/new=
lib/aarch64/mod.rs":"bac93836a9a57b2c710f32f852e92a4d11ad6759ab0fb6ad33e71d=
60e53278af","src/unix/newlib/align.rs":"28aaf87fafbc6b312622719d472d8cf65f9=
e5467d15339df5f73e66d8502b28a","src/unix/newlib/arm/mod.rs":"cbba6b3e957ece=
b496806e60de8725a23ff3fa0015983b4b4fa27b233732b526","src/unix/newlib/espidf=
/mod.rs":"816f235f4aa4baabba7f2606b31d0fdb03988c52194c966728de8690bf17299d"=
,"src/unix/newlib/generic.rs":"eab066d9f0a0f3eb53cc1073d01496bba0110989e1f6=
a59838afd19f870cd599","src/unix/newlib/horizon/mod.rs":"7cc5cc120437421db13=
9bfa6a90b18168cd3070bdd0f5be96d40fe4c996f3ca1","src/unix/newlib/mod.rs":"9e=
36de3fd78e10cb6b9a59dc5ebe5a1b44a63ccb91433bb33653fb30d0c303c6","src/unix/n=
ewlib/no_align.rs":"e0743b2179495a9514bc3a4d1781e492878c4ec834ee0085d0891dd=
1712e82fb","src/unix/newlib/powerpc/mod.rs":"0202ffd57caf75b6afa2c9717750ff=
b96e375ac33df0ae9609a3f831be393b67","src/unix/newlib/vita/mod.rs":"68e0ce18=
6b44e0b3031eb824710e7454dc2a9df98db98120840c3c6f4d885871","src/unix/no_alig=
n.rs":"c06e95373b9088266e0b14bba0954eef95f93fb2b01d951855e382d22de78e53","s=
rc/unix/nto/aarch64.rs":"4709c9afdc8d583be876598e7c238499ee3e8da5bd2baa614d=
9c7dd414851555","src/unix/nto/mod.rs":"59ab89a8fb6e0a6d22fa968ed4873c2bafa1=
9a0f60a90c9a5148816cb7440889","src/unix/nto/neutrino.rs":"799bff4ab01a6424d=
b6c5a2b76aa5679826d41495f9d13c63485bf13bc80026b","src/unix/nto/x86_64.rs":"=
a3e18e93c2999da1cd7a6f748a4b60c07aefb73d8ea2aafec19a84cfb040bc8e","src/unix=
/redox/mod.rs":"73658b0d28c82a122875aa2b45c489834f4de58c378add7932bbaf3ffb2=
ae789","src/unix/solarish/compat.rs":"00f1ee3faec9da69204e42f025f6735dd13d8=
94071a154425dcc43ecbdd06e7f","src/unix/solarish/illumos.rs":"cd93c2d84722bb=
f9933a92842a8998eb0b2afc962f50bc2546ad127b82809fa7","src/unix/solarish/mod.=
rs":"b1660c631a599a3355116e7485b88ab2f8f2929c2e37851a763431387b902f14","src=
/unix/solarish/solaris.rs":"41b350a89ddf01cd12a10f93640f92be53be0b0d976021c=
dc08da17bf3e72edf","src/unix/solarish/x86.rs":"e86e806df0caed72765040eaa2f3=
c883198d1aa91508540adf9b7008c77f522e","src/unix/solarish/x86_64.rs":"ec2b01=
f194eb8a6a27133c57681da195a949e03098f3ea1e847227a9c09ef5fc","src/unix/solar=
ish/x86_common.rs":"ac869d9c3c95645c22460468391eb1982023c3a8e02b9e06a72e3ae=
f3d5f1eac","src/vxworks/aarch64.rs":"98f0afdc511cd02557e506c21fed6737585490=
a1dce7a9d4941d08c437762b99","src/vxworks/arm.rs":"acb7968ce99fe3f4abdf39d98=
f8133d21a4fba435b8ef7084777cb181d788e88","src/vxworks/mod.rs":"e4edcbcf43a3=
25e738c9465507594d0c87abf3f0e2b9b046c1425f8d44bdad0f","src/vxworks/powerpc.=
rs":"acb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788e88","src=
/vxworks/powerpc64.rs":"98f0afdc511cd02557e506c21fed6737585490a1dce7a9d4941=
d08c437762b99","src/vxworks/x86.rs":"552f007f38317620b23889cb7c49d1d1158412=
52439060122f52f434fbc6e5ba","src/vxworks/x86_64.rs":"018d92be3ad628a129eff9=
f2f5dfbc0883d8b8e5f2fa917b900a7f98ed6b514a","src/wasi.rs":"09ee3b3348b212b0=
50f6ca8ae008a28679ea44a375674307a4e7c9ca0d3ed7d5","src/windows/gnu/align.rs=
":"b2c13ec1b9f3b39a75c452c80c951dff9d0215e31d77e883b4502afb31794647","src/w=
indows/gnu/mod.rs":"3c8c7edb7cdf5d0c44af936db2a94869585c69dfabeef30571b4f4e=
38375767a","src/windows/mod.rs":"9fdc5e1c62c441abef7bc62a7343efb2041edc24db=
9ac0efc0f74df55b69e249","src/windows/msvc/mod.rs":"c068271e00fca6b62bc4bf44=
bcf142cfc38caeded9b6c4e01d1ceef3ccf986f4","src/xous.rs":"eb0675f25ba01f7307=
2d2b70907fb8abb1148facefe5a20756c49250f3d65fae","tests/const_fn.rs":"cb75a1=
f0864f926aebe79118fc34d51a0d1ade2c20a394e7774c7e545f21f1f4"},"package":"9cd=
c71e17332e86d2e1d38c1f99edcb6288ee11b815fb1a4b049eaa2114d369b"}
> +\ No newline at end of file
> ++{"files":{"CONTRIBUTING.md":"bdc90b52cf803faac96e594069a86dd8ea150d5ba7=
fb3e6cadfc08dac4c7b0ce","Cargo.toml":"a58e58fa9bde015e08609ea2f17e56c5df7c8=
2aa6f3fa1a144c02ee4715227b9","LICENSE-APACHE":"62c7a1e35f56406896d7aa7ca52d=
0cc0d272ac022b5d2796e7d6905db8a3636a","LICENSE-MIT":"a8d47ff51ca256f56a8932=
dba07660672dbfe3004257ca8de708aac1415937a1","README.md":"ecc47e284f8d007fc0=
48666d5108dd41cdc440ab9eedfe8c47d1634613522787","build.rs":"9e94683e94db80e=
8282fce07549cf748d9037852fb06df1c7596bea2ed130d50","rustfmt.toml":"eaa2ea84=
fc1ba0359b77680804903e07bb38d257ab11986b95b158e460f787b2","src/fixed_width_=
ints.rs":"7f986e5f5e68d25ef04d386fd2f640e8be8f15427a8d4a458ea01d26b8dca0ca"=
,"src/fuchsia/aarch64.rs":"893fcec48142d273063ffd814dca33fbec92205fd39ada97=
075f85201d803996","src/fuchsia/align.rs":"ae1cf8f011a99737eabeb14ffff768e60=
f13b13363d7646744dbb0f443dab3d6","src/fuchsia/mod.rs":"30f4dc83ef120300d618=
96696512436377c5f36f1431d98ab7e01e498c0c47d5","src/fuchsia/no_align.rs":"30=
3f3f1b255e0088b5715094353cf00476131d8e94e6aebb3f469557771c8b8a","src/fuchsi=
a/riscv64.rs":"617cd75e79e0e20f664db764a4dc2a396d9fd11a4d95371acd91ed481129=
3b11","src/fuchsia/x86_64.rs":"93a3632b5cf67d2a6bcb7dc0a558605252d5fe689e0f=
38d8aa2ec5852255ac87","src/hermit/aarch64.rs":"86048676e335944c37a63d0083d0=
f368ae10ceccefeed9debb3bbe08777fc682","src/hermit/mod.rs":"d3bfce41e4463d4b=
e8020a2d063c9bfa8b665f45f1cc6cbf3163f5d01e7cb21f","src/hermit/x86_64.rs":"a=
b832b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/lib.r=
s":"24111461547739f3646f95bcb66c43f2ae679a727ff5938299434c522c02e458","src/=
macros.rs":"b457eb028b8e8ab3c24bb7292b874ad4e491edbb83594f6a3da024df5348c08=
8","src/psp.rs":"dd31aabd46171d474ec5828372e28588935120e7355c90c105360d8fa9=
264c1c","src/sgx.rs":"16a95cdefc81c5ee00d8353a60db363c4cc3e0f75abcd5d014472=
3f2a306ed1b","src/solid/aarch64.rs":"a726e47f324adf73a4a0b67a2c183408d0cad1=
05ae66acf36db37a42ab7f8707","src/solid/arm.rs":"e39a4f74ebbef3b97b8c95758ad=
741123d84ed3eb48d9cf4f1f4872097fc27fe","src/solid/mod.rs":"5f4151dca5132e4b=
4e4c23ab9737e12856dddbdc0ca3f7dbc004328ef3c8acde","src/switch.rs":"9da3dd39=
b3de45a7928789926e8572d00e1e11a39e6f7289a1349aadce90edba","src/unix/aix/mod=
=2Ers":"54229b5e774669c16912112e8b50fa938db76f534971222a11723a05195a0948","=
src/unix/aix/powerpc64.rs":"cf374d81139d45f9d77c6a764f640bfbf7e0a5903689652=
c8296f8e10d55169b","src/unix/align.rs":"2cdc7c826ef7ae61f5171c5ae8c445a743d=
86f1a7f2d9d7e4ceeec56d6874f65","src/unix/bsd/apple/b32/align.rs":"ec833a747=
866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/appl=
e/b32/mod.rs":"2546ad3eb6aecb95f916648bc63264117c92b4b4859532b34cb011e4c75a=
5a72","src/unix/bsd/apple/b64/aarch64/align.rs":"2eaf0f561a32bdcbf4e0477c88=
95d5e7bcb5cdebd5fef7b4df2ca8e38e144d94","src/unix/bsd/apple/b64/aarch64/mod=
=2Ers":"44c217a4f263afe7a97435de9323d20a96c37836f899ca0925306d4b7e073c27","=
src/unix/bsd/apple/b64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf=
4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b64/mod.rs":"f5e278a1af7fb3588=
91d1c9be4eb7e815aaca0c5cb738d0c3604ba2208a856f7","src/unix/bsd/apple/b64/x8=
6_64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b=
0e26c","src/unix/bsd/apple/b64/x86_64/mod.rs":"8c87c5855038aae5d433c8f5eb3b=
29b0a175879a0245342b3bfd83bdf4cfd936","src/unix/bsd/apple/long_array.rs":"3=
cf1f19b812e6d093c819dc65ce55b13491963e0780eda0d0bd1577603e81948","src/unix/=
bsd/apple/mod.rs":"0931fd351d585728e6384d7b952b8d816e9acdb9c86c172324445f3c=
33f692ca","src/unix/bsd/freebsdlike/dragonfly/errno.rs":"8295b8bb0dfd38d2cd=
b4d9192cdeeb534cc6c3b208170e64615fa3e0edb3e578","src/unix/bsd/freebsdlike/d=
ragonfly/mod.rs":"f2e78625fe1eb14f43e730a3987eba888cb8ac04c23008e7c2d2f7c72=
258b9e6","src/unix/bsd/freebsdlike/freebsd/aarch64.rs":"6c8e216385f53a4bf5f=
171749b57602fc34a4e4b160a44ca31c058cb0c8a2126","src/unix/bsd/freebsdlike/fr=
eebsd/arm.rs":"59d6a670eea562fb87686e243e0a84603d29a2028a3d4b3f99ccc01bd04d=
2f47","src/unix/bsd/freebsdlike/freebsd/freebsd11/b64.rs":"9808d152c1196aa6=
47f1b0f0cf84dac8c930da7d7f897a44975545e3d9d17681","src/unix/bsd/freebsdlike=
/freebsd/freebsd11/mod.rs":"e243ae0e89623d4fa9f85afe14369cc5fd5f2028ea71577=
3dbec722ba80dac1f","src/unix/bsd/freebsdlike/freebsd/freebsd12/b64.rs":"61c=
be45f8499bedb168106b686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bs=
d/freebsdlike/freebsd/freebsd12/mod.rs":"bef9fae288a4f29e941ea369be1cd20b17=
0040e60665a4d49a4a9e79009b72d8","src/unix/bsd/freebsdlike/freebsd/freebsd12=
/x86_64.rs":"2df36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd0=
52","src/unix/bsd/freebsdlike/freebsd/freebsd13/b64.rs":"61cbe45f8499bedb16=
8106b686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/f=
reebsd/freebsd13/mod.rs":"3c514e037694ce22724abb3c9c4687defda7f0e3456b615ca=
73593e860e38b16","src/unix/bsd/freebsdlike/freebsd/freebsd13/x86_64.rs":"2d=
f36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/b=
sd/freebsdlike/freebsd/freebsd14/b64.rs":"61cbe45f8499bedb168106b686d4f8239=
472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd1=
4/mod.rs":"318abe48bfdd1c74ecd6afbd6c9329c5c72ce4f7d420edd6be2fc12b223ae32f=
","src/unix/bsd/freebsdlike/freebsd/freebsd14/x86_64.rs":"e7b5863e222d6cc41=
6b6b0fbe71690fad909e899b4c4ae810bbca117e4fcb650","src/unix/bsd/freebsdlike/=
freebsd/mod.rs":"4c3cd57aaf7fbce072e28e0d2d285b5fda9702e924561d2fd01e49e6ee=
186a98","src/unix/bsd/freebsdlike/freebsd/powerpc.rs":"9ca3f82f88974e6db556=
9f2d76a5a3749b248a31747a6c0da5820492bdfeca42","src/unix/bsd/freebsdlike/fre=
ebsd/powerpc64.rs":"2dae3ecc87eac3b11657aa98915def55fc4b5c0de11fe26aae23329=
a54628a9a","src/unix/bsd/freebsdlike/freebsd/riscv64.rs":"fa4bed4c58cad24ba=
3395941c7fa6b11e089551a04714f9561078e400f5b2b62","src/unix/bsd/freebsdlike/=
freebsd/x86.rs":"6766e2ce85e187b306cd3b0b8d7e15b8f4042c5cff81d89b3af69ecc99=
c70ab0","src/unix/bsd/freebsdlike/freebsd/x86_64/align.rs":"0e1f69a88fca1c3=
2874b1daf5db3d446fefbe518dca497f096cc9168c39dde70","src/unix/bsd/freebsdlik=
e/freebsd/x86_64/mod.rs":"51e4dd0c8ae247bb652feda5adad9333ea3bb30c750c3a393=
5e0b0e47d7803eb","src/unix/bsd/freebsdlike/mod.rs":"0eacafac87fb3a32ef1b859=
80fece2792e70eba9856af18a7407cc35be68ea57","src/unix/bsd/mod.rs":"dad51a24a=
524e92bfe9de3ac3b7d394d86058b9b8a1ccd4efa9bbb5c78e7fa1a","src/unix/bsd/netb=
sdlike/mod.rs":"0a66f7de43710e35a6a546e6c39066aa8b91a6efadb71db88738b0a577f=
d5537","src/unix/bsd/netbsdlike/netbsd/aarch64.rs":"65dcb58d11e8d8028401a9d=
07ca3eb4cb4f053e04249cc877353449d84ccc4cb","src/unix/bsd/netbsdlike/netbsd/=
arm.rs":"58cdbb70b0d6f536551f0f3bb3725d2d75c4690db12c26c034e7d6ec4a924452",=
"src/unix/bsd/netbsdlike/netbsd/mod.rs":"90dd33ef20dc3be8aef5bd152a6a06e7ab=
34f9527b3978487b593aaa16a907bd","src/unix/bsd/netbsdlike/netbsd/powerpc.rs"=
:"ee7ff5d89d0ed22f531237b5059aa669df93a3b5c489fa641465ace8d405bf41","src/un=
ix/bsd/netbsdlike/netbsd/sparc64.rs":"9489f4b3e4566f43bb12dfb92238960613dac=
7f6a45cc13068a8d152b902d7d9","src/unix/bsd/netbsdlike/netbsd/x86.rs":"20692=
320e36bfe028d1a34d16fe12ca77aa909cb02bda167376f98f1a09aefe7","src/unix/bsd/=
netbsdlike/netbsd/x86_64.rs":"1afe5ef46b14397cdd68664b5b232e4f5b035b6db1d4c=
f411c899d51ebca9f30","src/unix/bsd/netbsdlike/openbsd/aarch64.rs":"dd91931d=
373b7ecaf6e2de25adadee10d16fa9b12c2cbacdff3eb291e1ba36af","src/unix/bsd/net=
bsdlike/openbsd/arm.rs":"01580d261bc6447bb327a0d982181b7bdabfa066cee65a3037=
3d3ced729ad307","src/unix/bsd/netbsdlike/openbsd/mips64.rs":"8532a189ae10c7=
d668d9d4065da8b05d124e09bd39442c9f74a7f231c43eca48","src/unix/bsd/netbsdlik=
e/openbsd/mod.rs":"c27c6673bd3628549083a094219831fd9343129f91067b562781617d=
2a887148","src/unix/bsd/netbsdlike/openbsd/powerpc.rs":"01580d261bc6447bb32=
7a0d982181b7bdabfa066cee65a30373d3ced729ad307","src/unix/bsd/netbsdlike/ope=
nbsd/powerpc64.rs":"1dd5449dd1fd3d51e30ffdeeaece91d0aaf05c710e0ac699fecc546=
1cfa2c28e","src/unix/bsd/netbsdlike/openbsd/riscv64.rs":"1dd5449dd1fd3d51e3=
0ffdeeaece91d0aaf05c710e0ac699fecc5461cfa2c28e","src/unix/bsd/netbsdlike/op=
enbsd/sparc64.rs":"d04fd287afbaa2c5df9d48c94e8374a532a3ba491b424ddf018270c7=
312f4085","src/unix/bsd/netbsdlike/openbsd/x86.rs":"6f7f5c4fde2a2259eb54789=
0cbd86570cea04ef85347d7569e94e679448bec87","src/unix/bsd/netbsdlike/openbsd=
/x86_64.rs":"d31db31630289c85af3339dbe357998a21ca584cbae31607448fe2cf7675a4=
e1","src/unix/haiku/b32.rs":"a2efdbf7158a6da341e1db9176b0ab193ba88b44961623=
9ed95dced11f54d87b","src/unix/haiku/b64.rs":"ff8115367d3d7d354f792d6176dfaa=
a26353f57056197b563bf4681f91ff7985","src/unix/haiku/mod.rs":"d7ec086b73db4f=
72799179627aa6330a513dcf786b06e19c75ff884d1235948e","src/unix/haiku/native.=
rs":"dbfcbf4954a79d1df2ff58e0590bbcb8c57dfc7a32392aa73ee4726b66bd6cc8","src=
/unix/haiku/x86_64.rs":"3ec3aeeb7ed208b8916f3e32d42bfd085ff5e16936a1a35d9a5=
2789f043b7237","src/unix/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f3=
68ae10ceccefeed9debb3bbe08777fc682","src/unix/hermit/mod.rs":"a1494a0bddf30=
1cceb0d9b8529a84b5882fe855ceae77a1c4e8d6034e705e26c","src/unix/hermit/x86_6=
4.rs":"ab832b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","s=
rc/unix/linux_like/android/b32/arm.rs":"ce582de7e983a33d3bfad13075c53aac901=
6cee35f06ad8653ee9072c3ec2564","src/unix/linux_like/android/b32/mod.rs":"7c=
173e0375119bf06a3081652faede95e5bcd6858e7576b7533d037978737c8f","src/unix/l=
inux_like/android/b32/x86/align.rs":"812914e4241df82e32b12375ca3374615dc3a4=
bdd4cf31f0423c5815320c0dab","src/unix/linux_like/android/b32/x86/mod.rs":"e=
6d107efbcd37b5b85dfa18f683300cbf768ffa0237997a9fa52b184a53323ac","src/unix/=
linux_like/android/b64/aarch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3=
ee2faf6fcae3770f9e505cddca35c7b","src/unix/linux_like/android/b64/aarch64/i=
nt128.rs":"1735f6f5c56770d20dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de=
","src/unix/linux_like/android/b64/aarch64/mod.rs":"10e963e29ff209703de6336=
c99cca96fd79789438d34c82a693eae56e8916c3c","src/unix/linux_like/android/b64=
/mod.rs":"71e4fcbe952bfa4a5f9022f3972e906917b38f729b9d8ef57cd5d179104894ac"=
,"src/unix/linux_like/android/b64/riscv64/align.rs":"0bf138f84e5327d8339bcd=
4adf071a6832b516445e597552c82bbd881095e3a8","src/unix/linux_like/android/b6=
4/riscv64/mod.rs":"19d4bf2237c47127eba9144e0b82e995bc079315e719179a91813b0a=
e7b0e49d","src/unix/linux_like/android/b64/x86_64/align.rs":"7169d07a9fd471=
6f7512719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/an=
droid/b64/x86_64/mod.rs":"4ec2de11a9b65c4325b7b991f0b99a414975e0e61ba8668ca=
ca5d921e9b314d1","src/unix/linux_like/android/mod.rs":"66a9e38a47493a42b3b1=
c325524f3c944e74d1e3e8ecce3cc276ec08fecab13b","src/unix/linux_like/emscript=
en/align.rs":"86c95cbed7a7161b1f23ee06843e7b0e2340ad92b2cb86fe2a8ef3e0e8c36=
216","src/unix/linux_like/emscripten/mod.rs":"67d6b90f539f746aa3290ea7f9d3f=
3f8d2d8a6557233584004ed5697f7821a50","src/unix/linux_like/emscripten/no_ali=
gn.rs":"0128e4aa721a9902754828b61b5ec7d8a86619983ed1e0544a85d35b1051fad6","=
src/unix/linux_like/linux/align.rs":"bc5abcd38e2320171e0981e773c9c5fe3e0d5a=
66fdff049228f6a1acad80ef8b","src/unix/linux_like/linux/arch/generic/mod.rs"=
:"fb5de1368cabae03d3ea0152159b7685a9d91efdecee4c5b83efc085ffef8a73","src/un=
ix/linux_like/linux/arch/mips/mod.rs":"75814e198d1a9a6808be3a5e5edb1bfdc57f=
75b06394e9040739be363c09d82f","src/unix/linux_like/linux/arch/mod.rs":"5bd5=
361f8a6ab4e18bbba6da9f92c164ae252b15a0ed10064812544aa1fdf198","src/unix/lin=
ux_like/linux/arch/powerpc/mod.rs":"bef6b7af9e5e2b4e5545c9c7e3e23a8b743277a=
0ed95853e7eddc38e44299f02","src/unix/linux_like/linux/arch/sparc/mod.rs":"9=
1593ec0440f1dd8f8e612028f432c44c14089286e2aca50e10511ab942db8c3","src/unix/=
linux_like/linux/gnu/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec72=
51957315afa53a7b9f936","src/unix/linux_like/linux/gnu/b32/arm/align.rs":"6e=
c0eb3ee93f7ae99fd714b4deabfb5e97fbcefd8c26f5a45fb8e7150899cdeb","src/unix/l=
inux_like/linux/gnu/b32/arm/mod.rs":"9ab3e97b579a9122690cd01026e14528862860=
346b700aafbb755a7e04054f7f","src/unix/linux_like/linux/gnu/b32/csky/align.r=
s":"3fed009dc9af3cc81be7087da9d2d7d1f39845e4497e290259c5cdbae25f039d","src/=
unix/linux_like/linux/gnu/b32/csky/mod.rs":"4c21d6e7463bb22f00b984294893d12=
c84018d5d26ec661d6a30f4a9625ba639","src/unix/linux_like/linux/gnu/b32/m68k/=
align.rs":"8faa92f77a9232c035418d45331774e64a9a841d99c91791570a203bf2b45bcb=
","src/unix/linux_like/linux/gnu/b32/m68k/mod.rs":"6aab7f1b864e9691d14aa7d3=
89f717c4077b8eed72a7f11e3b8c7fef245e4046","src/unix/linux_like/linux/gnu/b3=
2/mips/align.rs":"429fb5e005cb7143602d430098b6ebfb7d360685b194f333dfd587472=
ae954ee","src/unix/linux_like/linux/gnu/b32/mips/mod.rs":"6b9a5dac6f937ddc1=
453e808e3c43502c87143332df9e43ac64fb8b1eda6c116","src/unix/linux_like/linux=
/gnu/b32/mod.rs":"b56625dd20dd48a8699034d349ef089c540c0ddcbf8a3481d598d101f=
8b40b78","src/unix/linux_like/linux/gnu/b32/powerpc.rs":"5c5d90326b54b57b98=
eff4745fe7a3fb02f053b2dc782241a73e807b491936a3","src/unix/linux_like/linux/=
gnu/b32/riscv32/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd3=
7543efe86621b119","src/unix/linux_like/linux/gnu/b32/riscv32/mod.rs":"491a9=
a97cf712985b75d3ad714691ef60898d88c78bc386a6917de0a6774cc26","src/unix/linu=
x_like/linux/gnu/b32/sparc/align.rs":"21adbed27df73e2d1ed934aaf733a643003d7=
baf2bde9c48ea440895bcca6d41","src/unix/linux_like/linux/gnu/b32/sparc/mod.r=
s":"80894eece66e9348f45d1b07ad37c757ea694bbd10ed49d3f920b34e9f51a9a3","src/=
unix/linux_like/linux/gnu/b32/x86/align.rs":"e4bafdc4a519a7922a81b37a62bbfd=
1177a2f620890eef8f1fbc47162e9eb413","src/unix/linux_like/linux/gnu/b32/x86/=
mod.rs":"c703cc5e9de2dc31d9e5831bfb6f354d6e3518b2ae02263f68a9a70f1c0167e2",=
"src/unix/linux_like/linux/gnu/b64/aarch64/align.rs":"fdf1c72375a2167699157=
e0dd825422690bb6719f7bc69515a2e5846d0431d7c","src/unix/linux_like/linux/gnu=
/b64/aarch64/fallback.rs":"832e7487249c1c0bb6e9911ce3f7d32ca22378e42392ab83=
c56915cbc59d8be3","src/unix/linux_like/linux/gnu/b64/aarch64/ilp32.rs":"bf4=
611b737813deef6787babf6c01698605f3b75482269b8546318667bc68e29","src/unix/li=
nux_like/linux/gnu/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426442f09724d=
9b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/gnu/b64/aarch6=
4/lp64.rs":"11a950697fdda0258c6e37c6b13993348c8de4134105ed4faa79358e5317507=
2","src/unix/linux_like/linux/gnu/b64/aarch64/mod.rs":"172495fbfdf659b9b825=
148bffc2b62704f63fc872428617e868eb15802c9978","src/unix/linux_like/linux/gn=
u/b64/loongarch64/align.rs":"060aa33cc737966c691aab8511c5c5729e551458ce18d0=
e284e0d45f39beeb60","src/unix/linux_like/linux/gnu/b64/loongarch64/mod.rs":=
"18edada8aa5d4127d9aa1bd81c62b5a4209f1efd8b2b2631e801c9e855ab1480","src/uni=
x/linux_like/linux/gnu/b64/mips64/align.rs":"7169d07a9fd4716f7512719aec9fda=
5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/linux/gnu/b64/mips=
64/mod.rs":"628c410b9aaec3c8f43838a28616b577a1d6de60a9799b09bb884d80281f96e=
b","src/unix/linux_like/linux/gnu/b64/mod.rs":"6a160ef25439c4fecdb0e3bd0b81=
8742263c791364da874d4febd3aa644ec8e2","src/unix/linux_like/linux/gnu/b64/po=
werpc64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1=
268130d9","src/unix/linux_like/linux/gnu/b64/powerpc64/mod.rs":"c778a136f06=
c2ffeacea19fa14ce79b828f91b67a002dec5ce87289bae36234e","src/unix/linux_like=
/linux/gnu/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e5880=
3f99cd37543efe86621b119","src/unix/linux_like/linux/gnu/b64/riscv64/mod.rs"=
:"c8f07efc5ddd5d874f1ebc329cd6907818d132ac3e30f4f2a4b04be3fb388551","src/un=
ix/linux_like/linux/gnu/b64/s390x.rs":"a2fd9277c2dcf76f7a16a3bcca745d5a9932=
c765c0dc2feb31c3641be25eb0aa","src/unix/linux_like/linux/gnu/b64/sparc64/al=
ign.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268130d9",=
"src/unix/linux_like/linux/gnu/b64/sparc64/mod.rs":"e8047e9966a2b90063e0151=
a0278c54885e7b323286cf5ab55cbaf151fc772d3","src/unix/linux_like/linux/gnu/b=
64/x86_64/align.rs":"62e822478356db4a73b6bbd1b36d825b893939ab4b308ec11b0578=
bcc4b49769","src/unix/linux_like/linux/gnu/b64/x86_64/mod.rs":"891e595d3371=
4b9883b92f0554d1d361fba2b6c3f6cac09a288252f44c6ec667","src/unix/linux_like/=
linux/gnu/b64/x86_64/not_x32.rs":"38f74ce15d9662ce4818815a2b87be1618d5e45f1=
90f7e4db84ff3285b4421fb","src/unix/linux_like/linux/gnu/b64/x86_64/x32.rs":=
"b20218a11364a6dec87f96d6c0d8b19e660697ab09ad5ee0e9b3a9dafedaaebb","src/uni=
x/linux_like/linux/gnu/mod.rs":"47dd970aedda9c70429741d7c9892a0d5d264e9abcb=
1c41d5bb913a86f0a5362","src/unix/linux_like/linux/gnu/no_align.rs":"9cd2231=
35de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/linux_=
like/linux/mod.rs":"1582c09db7b752af0f796a4cba8aa2bb4ecea895c551a2219e76047=
bcce74a23","src/unix/linux_like/linux/musl/b32/arm/align.rs":"3e8ac052c1043=
764776b54c93ba4260e061df998631737a897d9d47d54f7b80c","src/unix/linux_like/l=
inux/musl/b32/arm/mod.rs":"fb99d2d67179bbff887f7bb59eda848d267ec550e5b68703=
ee9af0ff616ba87f","src/unix/linux_like/linux/musl/b32/hexagon.rs":"017976cd=
5b722f1e283e187540a64eaa387163a0157ffbb99e0b5c5513c49522","src/unix/linux_l=
ike/linux/musl/b32/mips/align.rs":"429fb5e005cb7143602d430098b6ebfb7d360685=
b194f333dfd587472ae954ee","src/unix/linux_like/linux/musl/b32/mips/mod.rs":=
"367a07c58875acc4565f67a2ff1ea028559ea627835911c239ee022c367550fb","src/uni=
x/linux_like/linux/musl/b32/mod.rs":"31677597fd9544c4b1ec1477628288f6273fab=
bc06e38f33da862ad55f019ce1","src/unix/linux_like/linux/musl/b32/powerpc.rs"=
:"c373735aa858760c045c882a7d11ab6a8c9f440b302e923719f991afb6595876","src/un=
ix/linux_like/linux/musl/b32/riscv32/align.rs":"efd2accf33b87de7c7547903359=
a5da896edc33cd6c719552c7474b60d4a5d48","src/unix/linux_like/linux/musl/b32/=
riscv32/mod.rs":"c91bb80655c91061d80dcd48be2e767b979a0a570dbd54fcf2094a9a1e=
31fad8","src/unix/linux_like/linux/musl/b32/x86/align.rs":"08e77fbd7435d7de=
c2ff56932433bece3f02e47ce810f89004a275a86d39cbe1","src/unix/linux_like/linu=
x/musl/b32/x86/mod.rs":"50a3a148363df651021707cf8c6bb12edc946a8dad6dcc6c4b0=
a29136d98992d","src/unix/linux_like/linux/musl/b64/aarch64/align.rs":"6ba32=
725d24d7d8e6aa111f3b57aafa318f83b606abe96561329151829821133","src/unix/linu=
x_like/linux/musl/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426442f09724d9=
b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/musl/b64/aarch6=
4/mod.rs":"54331c1112bc89cf35c0ebe0a974cb219d5167869ddd347e97faf1ec8c54cfec=
","src/unix/linux_like/linux/musl/b64/mips64.rs":"f606383f7a3639c508172becb=
2f1d2551b86dbd9bfceeef18871f94a30ed8d80","src/unix/linux_like/linux/musl/b6=
4/mod.rs":"1a8391febf3e750185ffc5c69c9f9e411f4e8c53b5d994cb231df24480169686=
","src/unix/linux_like/linux/musl/b64/powerpc64.rs":"6308c2d4b27deab7cc062f=
fdb1a0277126a1bc6ccea84f7276150f062df9f6a6","src/unix/linux_like/linux/musl=
/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd3754=
3efe86621b119","src/unix/linux_like/linux/musl/b64/riscv64/mod.rs":"e6c51d3=
d20b7b409dec3d7f41256a8a0366eabc7cf4db32a237e0ac7c8aa78fa","src/unix/linux_=
like/linux/musl/b64/s390x.rs":"fbf661b30015e315639b900a0eecf868c6fe50245460=
ac93891e1e8f5c55835a","src/unix/linux_like/linux/musl/b64/x86_64/align.rs":=
"77309276ad7a42cbe59ca381f23590b7a143aded05555b34a5b307b808cbca6e","src/uni=
x/linux_like/linux/musl/b64/x86_64/mod.rs":"e5d18b648529b09b35d161120016283=
f5e2ff54e28f60c031c63139901fe713a","src/unix/linux_like/linux/musl/lfs64.rs=
":"3e4fb381f3a0756520bde0f1692d4fa45e4ae8133bf7d7c64b0e3fdd512f235f","src/u=
nix/linux_like/linux/musl/mod.rs":"aa223e1cadb38c7f9db634064256d28174cbfbf0=
f9809b42e2706f12f13df075","src/unix/linux_like/linux/no_align.rs":"62cdca0e=
011937aaf09a51ca86d9f0ee0fdb05f61ec3c058e6a5d5fa6357d784","src/unix/linux_l=
ike/linux/non_exhaustive.rs":"181a05bf94fdb911db83ce793b993bd6548a4115b306a=
7ef3c10f745a8fea3e9","src/unix/linux_like/linux/uclibc/align.rs":"9ed16138d=
8e439bd90930845a65eafa7ebd67366e6bf633936d44014f6e4c959","src/unix/linux_li=
ke/linux/uclibc/arm/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec725=
1957315afa53a7b9f936","src/unix/linux_like/linux/uclibc/arm/mod.rs":"50288f=
f9e411ab0966da24838f2c2a5618021bc19c422a04f577b2979ef4081e","src/unix/linux=
_like/linux/uclibc/arm/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632=
b96b5c85a76f8316c86653db25","src/unix/linux_like/linux/uclibc/mips/mips32/a=
lign.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936"=
,"src/unix/linux_like/linux/uclibc/mips/mips32/mod.rs":"d0c4434e2bf813372c4=
18a8f516c706cdccc9f7be2f0921b2207b0afdb66fe81","src/unix/linux_like/linux/u=
clibc/mips/mips32/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5=
c85a76f8316c86653db25","src/unix/linux_like/linux/uclibc/mips/mips64/align.=
rs":"a7bdcb18a37a2d91e64d5fad83ea3edc78f5412adb28f77ab077dbb26dd08b2d","src=
/unix/linux_like/linux/uclibc/mips/mips64/mod.rs":"3f38ee6a4690b9d7594be20d=
216467a34d955f7653c2c8ce1e6147daeb53f1e0","src/unix/linux_like/linux/uclibc=
/mips/mips64/no_align.rs":"4a18e3875698c85229599225ac3401a2a40da87e77b2ad4e=
f47c6fcd5a24ed30","src/unix/linux_like/linux/uclibc/mips/mod.rs":"a048fce1c=
2d9b1ad57305642e8ad05ca0f0c7e4753267a2e2d6b4fee5db3b072","src/unix/linux_li=
ke/linux/uclibc/mod.rs":"1c3d25cddcfefa2bd17bdc81550826be31a08eef235e13f825=
f169a5029c8bca","src/unix/linux_like/linux/uclibc/no_align.rs":"3f286370465=
24618adaa1012e26cb7ffe94b9396e6b518cccdc69d59f274d709","src/unix/linux_like=
/linux/uclibc/x86_64/l4re.rs":"024eba5753e852dbdd212427351affe7e83f9916c186=
4bce414d7aa2618f192e","src/unix/linux_like/linux/uclibc/x86_64/mod.rs":"196=
d03affbefb85716937c15904831e731eb222ee906e05e42102d639a8152ea","src/unix/li=
nux_like/linux/uclibc/x86_64/other.rs":"42c3f71e58cabba373f6a55a623f3c31b85=
049eb64824c09c2b082b3b2d6a0a8","src/unix/linux_like/mod.rs":"45c98e7a0fad03=
b03c4c76f11a80e2423873f0a6563e35c60309a29b2c8ff44f","src/unix/mod.rs":"dd4c=
e377ba9517182e718848739a5c3f58cdbbcd4ee467eef9aaf8df5aed5053","src/unix/new=
lib/aarch64/mod.rs":"bac93836a9a57b2c710f32f852e92a4d11ad6759ab0fb6ad33e71d=
60e53278af","src/unix/newlib/align.rs":"28aaf87fafbc6b312622719d472d8cf65f9=
e5467d15339df5f73e66d8502b28a","src/unix/newlib/arm/mod.rs":"cbba6b3e957ece=
b496806e60de8725a23ff3fa0015983b4b4fa27b233732b526","src/unix/newlib/espidf=
/mod.rs":"816f235f4aa4baabba7f2606b31d0fdb03988c52194c966728de8690bf17299d"=
,"src/unix/newlib/generic.rs":"eab066d9f0a0f3eb53cc1073d01496bba0110989e1f6=
a59838afd19f870cd599","src/unix/newlib/horizon/mod.rs":"7cc5cc120437421db13=
9bfa6a90b18168cd3070bdd0f5be96d40fe4c996f3ca1","src/unix/newlib/mod.rs":"9e=
36de3fd78e10cb6b9a59dc5ebe5a1b44a63ccb91433bb33653fb30d0c303c6","src/unix/n=
ewlib/no_align.rs":"e0743b2179495a9514bc3a4d1781e492878c4ec834ee0085d0891dd=
1712e82fb","src/unix/newlib/powerpc/mod.rs":"0202ffd57caf75b6afa2c9717750ff=
b96e375ac33df0ae9609a3f831be393b67","src/unix/newlib/vita/mod.rs":"68e0ce18=
6b44e0b3031eb824710e7454dc2a9df98db98120840c3c6f4d885871","src/unix/no_alig=
n.rs":"c06e95373b9088266e0b14bba0954eef95f93fb2b01d951855e382d22de78e53","s=
rc/unix/nto/aarch64.rs":"4709c9afdc8d583be876598e7c238499ee3e8da5bd2baa614d=
9c7dd414851555","src/unix/nto/mod.rs":"59ab89a8fb6e0a6d22fa968ed4873c2bafa1=
9a0f60a90c9a5148816cb7440889","src/unix/nto/neutrino.rs":"799bff4ab01a6424d=
b6c5a2b76aa5679826d41495f9d13c63485bf13bc80026b","src/unix/nto/x86_64.rs":"=
a3e18e93c2999da1cd7a6f748a4b60c07aefb73d8ea2aafec19a84cfb040bc8e","src/unix=
/redox/mod.rs":"73658b0d28c82a122875aa2b45c489834f4de58c378add7932bbaf3ffb2=
ae789","src/unix/solarish/compat.rs":"00f1ee3faec9da69204e42f025f6735dd13d8=
94071a154425dcc43ecbdd06e7f","src/unix/solarish/illumos.rs":"cd93c2d84722bb=
f9933a92842a8998eb0b2afc962f50bc2546ad127b82809fa7","src/unix/solarish/mod.=
rs":"b1660c631a599a3355116e7485b88ab2f8f2929c2e37851a763431387b902f14","src=
/unix/solarish/solaris.rs":"41b350a89ddf01cd12a10f93640f92be53be0b0d976021c=
dc08da17bf3e72edf","src/unix/solarish/x86.rs":"e86e806df0caed72765040eaa2f3=
c883198d1aa91508540adf9b7008c77f522e","src/unix/solarish/x86_64.rs":"ec2b01=
f194eb8a6a27133c57681da195a949e03098f3ea1e847227a9c09ef5fc","src/unix/solar=
ish/x86_common.rs":"ac869d9c3c95645c22460468391eb1982023c3a8e02b9e06a72e3ae=
f3d5f1eac","src/vxworks/aarch64.rs":"98f0afdc511cd02557e506c21fed6737585490=
a1dce7a9d4941d08c437762b99","src/vxworks/arm.rs":"acb7968ce99fe3f4abdf39d98=
f8133d21a4fba435b8ef7084777cb181d788e88","src/vxworks/mod.rs":"e4edcbcf43a3=
25e738c9465507594d0c87abf3f0e2b9b046c1425f8d44bdad0f","src/vxworks/powerpc.=
rs":"acb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788e88","src=
/vxworks/powerpc64.rs":"98f0afdc511cd02557e506c21fed6737585490a1dce7a9d4941=
d08c437762b99","src/vxworks/x86.rs":"552f007f38317620b23889cb7c49d1d1158412=
52439060122f52f434fbc6e5ba","src/vxworks/x86_64.rs":"018d92be3ad628a129eff9=
f2f5dfbc0883d8b8e5f2fa917b900a7f98ed6b514a","src/wasi.rs":"09ee3b3348b212b0=
50f6ca8ae008a28679ea44a375674307a4e7c9ca0d3ed7d5","src/windows/gnu/align.rs=
":"b2c13ec1b9f3b39a75c452c80c951dff9d0215e31d77e883b4502afb31794647","src/w=
indows/gnu/mod.rs":"3c8c7edb7cdf5d0c44af936db2a94869585c69dfabeef30571b4f4e=
38375767a","src/windows/mod.rs":"9fdc5e1c62c441abef7bc62a7343efb2041edc24db=
9ac0efc0f74df55b69e249","src/windows/msvc/mod.rs":"c068271e00fca6b62bc4bf44=
bcf142cfc38caeded9b6c4e01d1ceef3ccf986f4","src/xous.rs":"eb0675f25ba01f7307=
2d2b70907fb8abb1148facefe5a20756c49250f3d65fae","tests/const_fn.rs":"cb75a1=
f0864f926aebe79118fc34d51a0d1ade2c20a394e7774c7e545f21f1f4"},"package":"9cd=
c71e17332e86d2e1d38c1f99edcb6288ee11b815fb1a4b049eaa2114d369b"}
> +\ No newline at end of file
> diff --git a/meta/recipes-devtools/rust/files/hardcodepaths.patch b/meta/=
recipes-devtools/rust/files/hardcodepaths.patch
> index 6eb091461fc9..a043095f6247 100644
> --- a/meta/recipes-devtools/rust/files/hardcodepaths.patch
> +++ b/meta/recipes-devtools/rust/files/hardcodepaths.patch
> @@ -1,4 +1,4 @@
> -When building for the target, some build paths end up embedded in the bi=
naries.=20
> +When building for the target, some build paths end up embedded in the bi=
naries.
>  These changes remove that. Further investigation is needed to work out t=
he way
>  to resolve these issues properly upstream.
> =20
> @@ -6,19 +6,19 @@ Upstream-Status: Inappropriate [patches need rework]
>  Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>  Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> =20
> -Index: rustc-1.73.0-src/compiler/rustc_codegen_llvm/src/context.rs
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- rustc-1.73.0-src.orig/compiler/rustc_codegen_llvm/src/context.rs
> -+++ rustc-1.73.0-src/compiler/rustc_codegen_llvm/src/context.rs
> -@@ -157,46 +157,6 @@ pub unsafe fn create_module<'ll>(
> +diff --git a/compiler/rustc_codegen_llvm/src/context.rs b/compiler/rustc=
_codegen_llvm/src/context.rs
> +index b4b2ab1e1f8a..8bb3e3f0557c 100644
> +--- a/compiler/rustc_codegen_llvm/src/context.rs
> ++++ b/compiler/rustc_codegen_llvm/src/context.rs
> +@@ -158,46 +158,6 @@ pub unsafe fn create_module<'ll>(
>           }
>       }
>  =20
>  -    // Ensure the data-layout values hardcoded remain the defaults.
>  -    if sess.target.is_builtin {
> +-        // tm is disposed by its drop impl
>  -        let tm =3D crate::back::write::create_informational_target_mach=
ine(tcx.sess);
> --        llvm::LLVMRustSetDataLayoutFromTargetMachine(llmod, tm);
> --        llvm::LLVMRustDisposeTargetMachine(tm);
> +-        llvm::LLVMRustSetDataLayoutFromTargetMachine(llmod, &tm);
>  -
>  -        let llvm_data_layout =3D llvm::LLVMGetDataLayoutStr(llmod);
>  -        let llvm_data_layout =3D str::from_utf8(CStr::from_ptr(llvm_dat=
a_layout).to_bytes())
> diff --git a/meta/recipes-devtools/rust/libstd-rs_1.73.0.bb b/meta/recipe=
s-devtools/rust/libstd-rs_1.74.0.bb
> similarity index 100%
> rename from meta/recipes-devtools/rust/libstd-rs_1.73.0.bb
> rename to meta/recipes-devtools/rust/libstd-rs_1.74.0.bb
> diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.73.0.bb b/m=
eta/recipes-devtools/rust/rust-cross-canadian_1.74.0.bb
> similarity index 100%
> rename from meta/recipes-devtools/rust/rust-cross-canadian_1.73.0.bb
> rename to meta/recipes-devtools/rust/rust-cross-canadian_1.74.0.bb
> diff --git a/meta/recipes-devtools/rust/rust-llvm_1.73.0.bb b/meta/recipe=
s-devtools/rust/rust-llvm_1.74.0.bb
> similarity index 100%
> rename from meta/recipes-devtools/rust/rust-llvm_1.73.0.bb
> rename to meta/recipes-devtools/rust/rust-llvm_1.74.0.bb
> diff --git a/meta/recipes-devtools/rust/rust-snapshot.inc b/meta/recipes-=
devtools/rust/rust-snapshot.inc
> index 38d735db41cb..ffc1aed2957c 100644
> --- a/meta/recipes-devtools/rust/rust-snapshot.inc
> +++ b/meta/recipes-devtools/rust/rust-snapshot.inc
> @@ -4,47 +4,47 @@
>  ## The exact (previous) version that has been used is specified in the s=
ource tarball.
>  ## The version is replicated here.
> =20
> -SNAPSHOT_VERSION =3D "1.72.0"
> +SNAPSHOT_VERSION =3D "1.73.0"
> =20
> -SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D "95741a4cd2073adbd74a7c559=
6bb912abf4b2dfe00d70a9919cba4a836b7a0ff"
> -SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D "41d259c6f84280fd0e7719=
fea03a7583ba54e33e8ac32a2a7b703ffb0aebb7d9"
> -SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D "1948a80453956d494457dcced=
1942e2e204fb26d4e57e718ef1c7aa378efbedb"
> +SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D "1195a1d37280802574d729cf0=
0e0dadc63a7c9312a9ae3ef2cf99645f7be0a77"
> +SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D "cbaa2549b3accc63b42425=
1fadc3a66d922541df22e736a355246d81998f4252"
> +SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D "628f57a45eb8143a7ac1acd5d=
6d01e3ae3cdf1ad11d151795ed765f6e5f3047e"
> =20
> -SRC_URI[cargo-snapshot-i686.sha256sum] =3D "549eda5cda44750b0b2e6d3ce3f9=
c90c3a133b695e4882b4c6b93e54d6e8a73a"
> -SRC_URI[rust-std-snapshot-i686.sha256sum] =3D "536c5ec1403b55045a502af1d=
6f8af192b560fbf9a24874bce6d59163fb8a38a"
> -SRC_URI[rustc-snapshot-i686.sha256sum] =3D "53c0e2045078326fd2ac9e77900a=
34b4ced1545a489b2a438deaebd2150cf543"
> +SRC_URI[cargo-snapshot-i686.sha256sum] =3D "8780f10eb3565b47f2616ccc1616=
c1a491a12a055976a25de551cb29e7f50390"
> +SRC_URI[rust-std-snapshot-i686.sha256sum] =3D "c46936bf3c921c90593b6ea77=
a08b1ec8b240c8184b287fd89fea636ac437b25"
> +SRC_URI[rustc-snapshot-i686.sha256sum] =3D "3d98a27c50ae79de7c7956506d64=
9e169312e76b4fc2314a975b45ebd1dea5b9"
> =20
> -SRC_URI[cargo-snapshot-loongarch64.sha256sum] =3D "216a9ccbfab10778f977b=
62416c17cf94a374e84a7acf3f50a11cf0b8b88940c"
> -SRC_URI[rust-std-snapshot-loongarch64.sha256sum] =3D "116065f0bb6d8e1372=
5b974f057709e12ed85d93217a0feb16581850db7a0ede"
> -SRC_URI[rustc-snapshot-loongarch64.sha256sum] =3D "73633f52ff12c448d2523=
409967d8d5d1e0b664c5a3a214395d10a9be7cc020d"
> +SRC_URI[cargo-snapshot-loongarch64.sha256sum] =3D "8e4766b19147d99670e5e=
3473981967d94465ad550c70c830ee86425260e1a05"
> +SRC_URI[rust-std-snapshot-loongarch64.sha256sum] =3D "533d38377ea362ba83=
a3eba5008fb89466f4094b247cb1510d4752d0bbbcc070"
> +SRC_URI[rustc-snapshot-loongarch64.sha256sum] =3D "0fee28452598859780cf8=
71d3f5a809ca606a840c843a8735248c49dbbd32b1c"
> =20
> -SRC_URI[cargo-snapshot-powerpc.sha256sum] =3D "8a6452262e062be0e7eef92b2=
aafaa06caf0853b264a3fd337e92079a43f0a24"
> -SRC_URI[rust-std-snapshot-powerpc.sha256sum] =3D "cca2897f091227cc53d63f=
3eefcfcb65f42d9e24a04a1b37a0d3ee36b7f84b5b"
> -SRC_URI[rustc-snapshot-powerpc.sha256sum] =3D "3a8f0f115ae2d599e1de12d38=
cb47bd7f9b508e213bf2f9a41efc136021c49a2"
> +SRC_URI[cargo-snapshot-powerpc.sha256sum] =3D "ffa30a6e480b3e20cf42ca322=
66edcfd0b8e4f1b84da450937e4bca7ec3e88e8"
> +SRC_URI[rust-std-snapshot-powerpc.sha256sum] =3D "bed705726b356d318a0fc3=
4bbf1a1bc4cacb61bfc20889bdfb77d3aaebbd406a"
> +SRC_URI[rustc-snapshot-powerpc.sha256sum] =3D "2ed995d178158b8447b68c864=
2cffed2402fc7502c0d5475b7c9fdfa895dd037"
> =20
> -SRC_URI[cargo-snapshot-powerpc64.sha256sum] =3D "a24a385d9f403e0800adb4d=
8364e663e40a04663a18df8d8704a5156d4232a1b"
> -SRC_URI[rust-std-snapshot-powerpc64.sha256sum] =3D "4aa7b7e80a5c45825f01=
aee96a88c5bcd56317c66298c4bd4ce99c80095e492e"
> -SRC_URI[rustc-snapshot-powerpc64.sha256sum] =3D "f1863c033fa88ebb9628f38=
988da54fadd16075b06765dc93abcd8b4f58f557b"
> +SRC_URI[cargo-snapshot-powerpc64.sha256sum] =3D "35454cd3778dac739da6a3f=
bbe278a2b6818bc4ca95600412e0d51c13f3fdc1f"
> +SRC_URI[rust-std-snapshot-powerpc64.sha256sum] =3D "c7bb65f4b7b59f65e4db=
8a0877192f59dce12021c866e2ef86014d99d18a23f5"
> +SRC_URI[rustc-snapshot-powerpc64.sha256sum] =3D "9458ea1308e88ceb88dbc38=
d9d4918dc665d3c148a39789de417b0668fc45a3f"
> =20
> -SRC_URI[cargo-snapshot-powerpc64le.sha256sum] =3D "f659bf3ab70c376c736b7=
d7112d1fcee32a56dbfa66f6ef4fc039652f66c99e7"
> -SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] =3D "b6ef684ebf77063dbc=
1ff0abfe1316651fa73bbb95b023255b301b415867ff8b"
> -SRC_URI[rustc-snapshot-powerpc64le.sha256sum] =3D "20ed9ec0599e6582a218d=
ae544566ddf7e2af46341705f35de874c90d7eecc0c"
> +SRC_URI[cargo-snapshot-powerpc64le.sha256sum] =3D "14f74b06ddeebbec48098=
828d2de55e631ea4cacd7c7ebad8a96220d1a470e0a"
> +SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] =3D "a74d300dbf1fbf2d4a=
f80995db19501211e2bd25572ab45748b48df4448d4656"
> +SRC_URI[rustc-snapshot-powerpc64le.sha256sum] =3D "c52d6f28d370e7bd30e07=
655d534a3aad21afc6c32f0c80e8a0f7249d2b86b29"
> =20
> -SRC_URI[cargo-snapshot-riscv64gc.sha256sum] =3D "43c89f16832e16fff0b2c51=
b953c8295db97bc5623cb1bf0164d992a7f29af03"
> -SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] =3D "0208dd644f6e266cc7c0=
7695889f1280e04be06672cb172a401a444b54ffa9e9"
> -SRC_URI[rustc-snapshot-riscv64gc.sha256sum] =3D "3a5a1dddf679720fec5c7af=
9e38f3ed5d7fe134c430458fae98f116da01becf6"
> +SRC_URI[cargo-snapshot-riscv64gc.sha256sum] =3D "50d42893e2da56657a7c00e=
d17498417628793d8b2bceab829be7b2575478879"
> +SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] =3D "8b58ae17468f2f2768b4=
70f532a1ba9668dc778c242cc9dfc022ea1ebc962f63"
> +SRC_URI[rustc-snapshot-riscv64gc.sha256sum] =3D "fee4b06850574de4821d335=
e622ca0607753e042848ba00ada826f8c8ca4b44a"
> =20
> -SRC_URI[cargo-snapshot-s390x.sha256sum] =3D "f2ce1bfc373efe162ca5b8ccfdb=
366dd526710fac305c61ed0b582b9185d68e9"
> -SRC_URI[rust-std-snapshot-s390x.sha256sum] =3D "9ebe880ea998fc13d3ed9cbe=
71d26c69dd93859be8a8e582a8ddc5393400d4e5"
> -SRC_URI[rustc-snapshot-s390x.sha256sum] =3D "41a958bc4313fb0c0446376c844=
76818820cfe75937675a9594823b63dc9e219"
> +SRC_URI[cargo-snapshot-s390x.sha256sum] =3D "6035a925f3307c98d2caf0b1727=
fc401e7a64a09e6a7132a0cd882937720bda2"
> +SRC_URI[rust-std-snapshot-s390x.sha256sum] =3D "545b97978470135f8726fb82=
970acb882b9d57a724c2462ee90efee47429fc84"
> +SRC_URI[rustc-snapshot-s390x.sha256sum] =3D "0ca1d450f10f2d87b630c5a19f3=
aad13f0e39aec63f253654ad9f68c7bf1872e"
> =20
> -SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D "4a401dfe7b3056dc0d42acbcd3=
80b2b90f936577706ca74ef5327af0f5abd0a0"
> -SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D "36f27513a6e4381f15b0cd1=
4097c885af537f990cb6193cec3337c429367bf23"
> -SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D "5b5d7854a0d73368f15146c1aa=
47e4dbccf12762c93282f410a09a605929ce09"
> +SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D "7c3ce5738d570eaea97dd3d213=
ea73c8beda4f0c61e7486f95e497b7b10c4e2d"
> +SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D "96efb163a57b400152c357b=
e0ea3a0dd902b56cc0df662b9ac951403c7c7b15b"
> +SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D "14f383eb4d6e65ce01cc99f2c5=
cf5a78744239f29704f72fe84f11095af779f5"
> =20
> -SRC_URI[rust-std-snapshot-i586.sha256sum] =3D "57df2bdcfb659cb34bcb19940=
0e84eb09d564fc390e5f8d3b011a15955241266"
> +SRC_URI[rust-std-snapshot-i586.sha256sum] =3D "02cfcb9bae68c406b5cab9aad=
74ac8631fa4fdd9246aac2e4d4c0aeafbcad42a"
> =20
> -SRC_URI[rust-std-snapshot-sparc64.sha256sum] =3D "b39c5d31ad61c5670a09dc=
4c8020f888e9b5be2dd0deec90899a7ed14b759488"
> +SRC_URI[rust-std-snapshot-sparc64.sha256sum] =3D "717846830d95a689fb44db=
afc4f4e09285bf7bc2c37bcc70f6d17785c21f4569"
> =20
>  SRC_URI +=3D " \
>      ${RUST_DIST_SERVER}/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=3Drust-std=
-snapshot-${RUST_BUILD_ARCH};subdir=3Drust-snapshot-components \
> diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-de=
vtools/rust/rust-source.inc
> index a8f4c7fb15f7..4b780d3aecb4 100644
> --- a/meta/recipes-devtools/rust/rust-source.inc
> +++ b/meta/recipes-devtools/rust/rust-source.inc
> @@ -2,11 +2,15 @@ RUST_VERSION ?=3D "${@d.getVar('PV').split('-')[0]}"
> =20
>  SRC_URI +=3D "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-sr=
c.tar.xz;name=3Drust \
>              file://hardcodepaths.patch;patchdir=3D${RUSTSRC} \
> -            file://0001-Do-not-use-LFS64-on-linux-with-musl.patch;patchd=
ir=3D${RUSTSRC} \
> +            file://0001-Don-t-use-LFS64-symbols-on-musl.patch;patchdir=
=3D${RUSTSRC} \
>              file://zlib-off64_t.patch;patchdir=3D${RUSTSRC} \
> -            file://0001-musl-Define-SOCK_SEQPACKET-in-common-place.patch=
;patchdir=3D${RUSTSRC} \
> +            file://0001-musl-Define-SOCK_NONBLOCK-with-O_NONBLOCK.patch;=
patchdir=3D${RUSTSRC} \
> +            file://0002-musl-riscv32-Define-F_SETLK-F_SETLKW-and-fix-F_G=
ETLK.patch;patchdir=3D${RUSTSRC} \
> +            file://0003-musl-Move-F_OFD_GETLK-F_OFD_SETLK-and-F_OFD_SETL=
KW-t.patch;patchdir=3D${RUSTSRC} \
> +            file://0004-musl-Define-O_LARGEFILE-for-riscv32.patch;patchd=
ir=3D${RUSTSRC} \
> +            file://0005-musl-Define-SOCK_SEQPACKET-in-common-place.patch=
;patchdir=3D${RUSTSRC} \
>  "
> -SRC_URI[rust.sha256sum] =3D "6eaf672dbea2e6596af8c999f5e6924b9af4bb8b021=
66bfe0b928e68aa75ae62"
> +SRC_URI[rust.sha256sum] =3D "23705e38c1a37acfd7fbb921c5dd8772619476e80d0=
b3b39ac8eb45bc0c33187"
> =20
>  RUSTSRC =3D "${WORKDIR}/rustc-${RUST_VERSION}-src"
> =20
> diff --git a/meta/recipes-devtools/rust/rust_1.73.0.bb b/meta/recipes-dev=
tools/rust/rust_1.74.0.bb
> similarity index 99%
> rename from meta/recipes-devtools/rust/rust_1.73.0.bb
> rename to meta/recipes-devtools/rust/rust_1.74.0.bb
> index 3d176e54c15c..ab1ec5d4f84b 100644
> --- a/meta/recipes-devtools/rust/rust_1.73.0.bb
> +++ b/meta/recipes-devtools/rust/rust_1.74.0.bb
> @@ -171,6 +171,7 @@ python do_configure() {
>      config.set("install", "libdir",  e(d.getVar("D") + d.getVar("libdir"=
)))
>      config.set("install", "datadir", e(d.getVar("D") + d.getVar("datadir=
")))
>      config.set("install", "mandir",  e(d.getVar("D") + d.getVar("mandir"=
)))
> +    config.set("install", "sysconfdir",  e(d.getVar("D") + d.getVar("sys=
confdir")))
> =20
>      with open("config.toml", "w") as f:
>          f.write('changelog-seen =3D 2\n\n')
> --=20
> 2.39.0
>=20

>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192069): https://lists.openembedded.org/g/openembedde=
d-core/message/192069
> Mute This Topic: https://lists.openembedded.org/mt/103055169/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
exandre.belloni@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=20
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

