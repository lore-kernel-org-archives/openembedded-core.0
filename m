Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFB5AC27C7A
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 07:46:37 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.181820.1692258387572778710
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Aug 2023 00:46:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=n02DOOWq;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-4ff9121fd29so2422933e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 00:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692258386; x=1692863186;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=utLDQ75yLWc7iw6E/y+lCvlEOttRuwxQZbF0grriebk=;
        b=n02DOOWqrVgizsbctZ8Zm5RnRqcPfOYaRVWhFgns/d9KrVbQ0jzkQEfSXK//u/ImXP
         JwkiH045SQs5clDIQjiJFSDZ1J0Gz3cNwklyWu/Aqse/1o4uzDWxDWFw4XVAWhhB8ykp
         OYhW4sIG5caTeSks4s5v4HDhQLoRtl91fsezqal3AHhb8ADbKolgeCzPr3UJJGvZvMoB
         h3DGMBqw3FN/oT0cVnlwWlTe2vM40K4vai8cM5Ob1PcjCDyAA8PzX8HGBCyXEqFdjAcK
         R8qrb797juLkF50FdsjV6A5fVG+aESrrtrWMocDulfbwRNhk8/fWjM4J0+FCsqBhWCW/
         s+Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692258386; x=1692863186;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=utLDQ75yLWc7iw6E/y+lCvlEOttRuwxQZbF0grriebk=;
        b=ZbO5Zi3Sw7Rc4R6uy4EFNI/+wKGkiXRvzdp8lgDnvnhxTxTZ0oQq9oHS/17UxqjydR
         cmDV5f4C5scfVFTqGD34EPLm0wmDeR0el7jsdjEnSA7bXlB02AuqWWxTGTkmT4wVvoHW
         BM9j7Bz0V1dEd182plrnGNjbZ4BtFRVhddD8ePC1uKIOIC1sn/LQXX9KXDpjVQ7NMfeA
         /pLgRQW8zo817l9PCZuI8I0dUnZokvDoZEHYKamnftPlQOUhJQRzWkHUn9yAUfUGuP96
         Dj+LprQ09EXZLxf0blcXRO6ixPJqP9CSoK6AOzRC2XMiIjqUsaFlwY1j9JWiTAJO+i7/
         JDFw==
X-Gm-Message-State: AOJu0Ywm01cWAPRjzITbK0q2KESAfSgeHj8ESDVkv3uhP3Z8Fwe6CHwo
	pS7R7dOaXpMP8KFFd7j5C6Ua6hCEMN9gFOWIS7o=
X-Google-Smtp-Source: AGHT+IE2ORiOV7wnZ+Ha0sVHprbh0KentoPpC4yPP2gxtKOQl601IBxAVJb24/uEBH6AgY2/FTO5w3lc23GBwscStiQ=
X-Received: by 2002:a05:6512:1114:b0:4f8:d385:41bd with SMTP id
 l20-20020a056512111400b004f8d38541bdmr3931274lfg.8.1692258384370; Thu, 17 Aug
 2023 00:46:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230719063134.2831-1-alex.kiernan@gmail.com> <CBFA8483-1067-4E50-9FE2-18F4DDCE3640@arm.com>
 <CAO5Uq5QB7wLKtHvfbx57jE9=O195Q2afQGYrQkTgJQAV4=wx3Q@mail.gmail.com> <3848ca50-8562-d5f1-5178-69b55c8dcd8f@windriver.com>
In-Reply-To: <3848ca50-8562-d5f1-5178-69b55c8dcd8f@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 17 Aug 2023 09:46:11 +0200
Message-ID: <CANNYZj_WLs2V=DtsaG7XH862Xn2rJnn+bZZBbVd+5J=Wh_StXg@mail.gmail.com>
Subject: Re: [OE-Core][PATCH v2] rust: Upgrade 1.70.0 -> 1.71.0
To: randy.macleod@windriver.com
Cc: alex.kiernan@gmail.com, Ross Burton <Ross.Burton@arm.com>, 
	"Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 07:46:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186294

If you already have a patch it's better if you don't wait for new
versions. New version may require significant additional work, and by
then feature freeze is in place, and then we'll end up with no upgrade
at all.

Alex

On Thu, 17 Aug 2023 at 02:07, Randy MacLeod via lists.openembedded.org
<randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:
>
> On 2023-07-21 11:07, Alex Kiernan via lists.openembedded.org wrote:
>
> On Thu, Jul 20, 2023 at 5:08=E2=80=AFPM Ross Burton <Ross.Burton@arm.com>=
 wrote:
>
> Can you rebase this on top of the latest changes in master?
>
> I'll take a look next week, though my immediate impression was "ARGGGH!!!=
" :)
>
> Alex,
>
> Do you need someone to help out with this or should
> we wait a few days for 1.72 ?
>
> https://forge.rust-lang.org/
>
> ../Randy
>
> Thanks,
> Ross
>
> On 19 Jul 2023, at 07:31, Alex Kiernan via lists.openembedded.org <alex.k=
iernan=3Dgmail.com@lists.openembedded.org> wrote:
>
> Switch libstd-rs to use the dummy `sysroot` crate which represents the
> standard library crates. Target getrandom-open64.patch at 0.2.8 (merged
> for 0.2.9).
>
> https://blog.rust-lang.org/2023/07/13/Rust-1.71.0.html
>
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---
>
> Changes in v2:
> - Reinstate getrandom-open64.patch, but target the 0.2.8 version
> - Fix typo in libstd-rs `sysroot` comment
>
> meta/conf/distro/include/tcmode-default.inc   |  2 +-
> .../rust/{cargo_1.70.0.bb =3D> cargo_1.71.0.bb} |  0
> ...-Do-not-use-LFS64-on-linux-with-musl.patch | 26 ++++----
> ...efine-SOCK_SEQPACKET-in-common-place.patch | 56 ++++++++--------
> .../rust/files/getrandom-open64.patch         | 12 ++--
> .../rust/files/zlib-off64_t.patch             | 16 +++--
> ...ibstd-rs_1.70.0.bb =3D> libstd-rs_1.71.0.bb} |  9 +--
> ....70.0.bb =3D> rust-cross-canadian_1.71.0.bb} |  0
> ...ust-llvm_1.70.0.bb =3D> rust-llvm_1.71.0.bb} |  0
> meta/recipes-devtools/rust/rust-snapshot.inc  | 66 +++++++++----------
> meta/recipes-devtools/rust/rust-source.inc    |  2 +-
> .../rust/{rust_1.70.0.bb =3D> rust_1.71.0.bb}   |  0
> 12 files changed, 99 insertions(+), 90 deletions(-)
> rename meta/recipes-devtools/rust/{cargo_1.70.0.bb =3D> cargo_1.71.0.bb} =
(100%)
> rename meta/recipes-devtools/rust/{libstd-rs_1.70.0.bb =3D> libstd-rs_1.7=
1.0.bb} (87%)
> rename meta/recipes-devtools/rust/{rust-cross-canadian_1.70.0.bb =3D> rus=
t-cross-canadian_1.71.0.bb} (100%)
> rename meta/recipes-devtools/rust/{rust-llvm_1.70.0.bb =3D> rust-llvm_1.7=
1.0.bb} (100%)
> rename meta/recipes-devtools/rust/{rust_1.70.0.bb =3D> rust_1.71.0.bb} (1=
00%)
>
> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/dist=
ro/include/tcmode-default.inc
> index 18daf446e51a..25b3e0ee63ff 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -25,7 +25,7 @@ LINUXLIBCVERSION ?=3D "6.4%"
> QEMUVERSION ?=3D "8.0%"
> GOVERSION ?=3D "1.20%"
> LLVMVERSION ?=3D "16.%"
> -RUSTVERSION ?=3D "1.70%"
> +RUSTVERSION ?=3D "1.71%"
>
> PREFERRED_VERSION_gcc ?=3D "${GCCVERSION}"
> PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?=3D "${GCCVERSION}"
> diff --git a/meta/recipes-devtools/rust/cargo_1.70.0.bb b/meta/recipes-de=
vtools/rust/cargo_1.71.0.bb
> similarity index 100%
> rename from meta/recipes-devtools/rust/cargo_1.70.0.bb
> rename to meta/recipes-devtools/rust/cargo_1.71.0.bb
> diff --git a/meta/recipes-devtools/rust/files/0001-Do-not-use-LFS64-on-li=
nux-with-musl.patch b/meta/recipes-devtools/rust/files/0001-Do-not-use-LFS6=
4-on-linux-with-musl.patch
> index 7f8d62a25651..37cfe42df6f1 100644
> --- a/meta/recipes-devtools/rust/files/0001-Do-not-use-LFS64-on-linux-wit=
h-musl.patch
> +++ b/meta/recipes-devtools/rust/files/0001-Do-not-use-LFS64-on-linux-wit=
h-musl.patch
> @@ -19,10 +19,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  library/std/src/sys/unix/fs.rs | 27 ++++++++++++++++++++-------
>  3 files changed, 38 insertions(+), 12 deletions(-)
>
> -Index: rustc-1.70.0-src/library/std/src/os/linux/fs.rs
> +Index: rustc-1.71.0-src/library/std/src/os/linux/fs.rs
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- rustc-1.70.0-src.orig/library/std/src/os/linux/fs.rs
> -+++ rustc-1.70.0-src/library/std/src/os/linux/fs.rs
> +--- rustc-1.71.0-src.orig/library/std/src/os/linux/fs.rs
> ++++ rustc-1.71.0-src/library/std/src/os/linux/fs.rs
> @@ -329,7 +329,14 @@ pub trait MetadataExt {
>  impl MetadataExt for Metadata {
>      #[allow(deprecated)]
> @@ -39,11 +39,11 @@ Index: rustc-1.70.0-src/library/std/src/os/linux/fs.r=
s
>      }
>      fn st_dev(&self) -> u64 {
>          self.as_inner().as_inner().st_dev as u64
> -Index: rustc-1.70.0-src/library/std/src/sys/unix/fd.rs
> +Index: rustc-1.71.0-src/library/std/src/sys/unix/fd.rs
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- rustc-1.70.0-src.orig/library/std/src/sys/unix/fd.rs
> -+++ rustc-1.70.0-src/library/std/src/sys/unix/fd.rs
> -@@ -121,9 +121,12 @@ impl FileDesc {
> +--- rustc-1.71.0-src.orig/library/std/src/sys/unix/fd.rs
> ++++ rustc-1.71.0-src/library/std/src/sys/unix/fd.rs
> +@@ -122,9 +122,12 @@ impl FileDesc {
>      }
>
>      pub fn read_at(&self, buf: &mut [u8], offset: u64) -> io::Result<usi=
ze> {
> @@ -58,7 +58,7 @@ Index: rustc-1.70.0-src/library/std/src/sys/unix/fd.rs
>          use libc::pread64;
>
>          unsafe {
> -@@ -276,9 +279,12 @@ impl FileDesc {
> +@@ -277,9 +280,12 @@ impl FileDesc {
>      }
>
>      pub fn write_at(&self, buf: &[u8], offset: u64) -> io::Result<usize>=
 {
> @@ -73,10 +73,10 @@ Index: rustc-1.70.0-src/library/std/src/sys/unix/fd.r=
s
>          use libc::pwrite64;
>
>          unsafe {
> -Index: rustc-1.70.0-src/library/std/src/sys/unix/fs.rs
> +Index: rustc-1.71.0-src/library/std/src/sys/unix/fs.rs
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- rustc-1.70.0-src.orig/library/std/src/sys/unix/fs.rs
> -+++ rustc-1.70.0-src/library/std/src/sys/unix/fs.rs
> +--- rustc-1.71.0-src.orig/library/std/src/sys/unix/fs.rs
> ++++ rustc-1.71.0-src/library/std/src/sys/unix/fs.rs
> @@ -47,9 +47,13 @@ use libc::{c_int, mode_t};
>      all(target_os =3D "linux", target_env =3D "gnu")
>  ))]
> @@ -144,7 +144,7 @@ Index: rustc-1.70.0-src/library/std/src/sys/unix/fs.r=
s
>      target_os =3D "android",
>      target_os =3D "linux",
>      target_os =3D "solaris",
> -@@ -787,7 +800,7 @@ impl DirEntry {
> +@@ -805,7 +818,7 @@ impl DirEntry {
>      }
>
>      #[cfg(all(
> @@ -153,7 +153,7 @@ Index: rustc-1.70.0-src/library/std/src/sys/unix/fs.r=
s
>          not(miri)
>      ))]
>      pub fn metadata(&self) -> io::Result<FileAttr> {
> -@@ -811,7 +824,7 @@ impl DirEntry {
> +@@ -829,7 +842,7 @@ impl DirEntry {
>      }
>
>      #[cfg(any(
> diff --git a/meta/recipes-devtools/rust/files/0001-musl-Define-SOCK_SEQPA=
CKET-in-common-place.patch b/meta/recipes-devtools/rust/files/0001-musl-Def=
ine-SOCK_SEQPACKET-in-common-place.patch
> index 8723f552b631..c3aba98db45d 100644
> --- a/meta/recipes-devtools/rust/files/0001-musl-Define-SOCK_SEQPACKET-in=
-common-place.patch
> +++ b/meta/recipes-devtools/rust/files/0001-musl-Define-SOCK_SEQPACKET-in=
-common-place.patch
> @@ -19,10 +19,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  vendor/libc/src/unix/linux_like/linux/musl/mod.rs          | 1 +
>  7 files changed, 2 insertions(+), 7 deletions(-)
>
> -Index: rustc-1.70.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/a=
rm/mod.rs
> +Index: rustc-1.71.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/a=
rm/mod.rs
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- rustc-1.70.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b32=
/arm/mod.rs
> -+++ rustc-1.70.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/arm/=
mod.rs
> +--- rustc-1.71.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b32=
/arm/mod.rs
> ++++ rustc-1.71.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/arm/=
mod.rs
> @@ -326,7 +326,6 @@ pub const MAP_SYNC: ::c_int =3D 0x080000;
>
>  pub const SOCK_STREAM: ::c_int =3D 1;
> @@ -31,10 +31,10 @@ Index: rustc-1.70.0-src/vendor/libc/src/unix/linux_li=
ke/linux/musl/b32/arm/mod.r
>
>  pub const EDEADLK: ::c_int =3D 35;
>  pub const ENAMETOOLONG: ::c_int =3D 36;
> -Index: rustc-1.70.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/h=
exagon.rs
> +Index: rustc-1.71.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/h=
exagon.rs
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- rustc-1.70.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b32=
/hexagon.rs
> -+++ rustc-1.70.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/hexa=
gon.rs
> +--- rustc-1.71.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b32=
/hexagon.rs
> ++++ rustc-1.71.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/hexa=
gon.rs
> @@ -296,7 +296,6 @@ pub const SIG_BLOCK: ::c_int =3D 0x000000;
>  pub const SIG_UNBLOCK: ::c_int =3D 0x01;
>  pub const SOCK_DGRAM: ::c_int =3D 2;
> @@ -43,11 +43,11 @@ Index: rustc-1.70.0-src/vendor/libc/src/unix/linux_li=
ke/linux/musl/b32/hexagon.r
>  pub const SOCK_STREAM: ::c_int =3D 1;
>  pub const SOL_CAIF: ::c_int =3D 278;
>  pub const SOL_IUCV: ::c_int =3D 277;
> -Index: rustc-1.70.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/m=
ips/mod.rs
> +Index: rustc-1.71.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/m=
ips/mod.rs
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- rustc-1.70.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b32=
/mips/mod.rs
> -+++ rustc-1.70.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/mips=
/mod.rs
> -@@ -350,7 +350,6 @@ pub const ERFKILL: ::c_int =3D 167;
> +--- rustc-1.71.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b32=
/mips/mod.rs
> ++++ rustc-1.71.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/mips=
/mod.rs
> +@@ -351,7 +351,6 @@ pub const ERFKILL: ::c_int =3D 167;
>
>  pub const SOCK_STREAM: ::c_int =3D 2;
>  pub const SOCK_DGRAM: ::c_int =3D 1;
> @@ -55,11 +55,11 @@ Index: rustc-1.70.0-src/vendor/libc/src/unix/linux_li=
ke/linux/musl/b32/mips/mod.
>
>  pub const SA_ONSTACK: ::c_int =3D 0x08000000;
>  pub const SA_SIGINFO: ::c_int =3D 8;
> -Index: rustc-1.70.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/p=
owerpc.rs
> +Index: rustc-1.71.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/p=
owerpc.rs
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- rustc-1.70.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b32=
/powerpc.rs
> -+++ rustc-1.70.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/powe=
rpc.rs
> -@@ -257,7 +257,6 @@ pub const MAP_STACK: ::c_int =3D 0x020000;
> +--- rustc-1.71.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b32=
/powerpc.rs
> ++++ rustc-1.71.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/powe=
rpc.rs
> +@@ -259,7 +259,6 @@ pub const MAP_SYNC: ::c_int =3D 0x080000;
>
>  pub const SOCK_STREAM: ::c_int =3D 1;
>  pub const SOCK_DGRAM: ::c_int =3D 2;
> @@ -67,10 +67,10 @@ Index: rustc-1.70.0-src/vendor/libc/src/unix/linux_li=
ke/linux/musl/b32/powerpc.r
>
>  pub const EDEADLK: ::c_int =3D 35;
>  pub const ENAMETOOLONG: ::c_int =3D 36;
> -Index: rustc-1.70.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/x=
86/mod.rs
> +Index: rustc-1.71.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/x=
86/mod.rs
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- rustc-1.70.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b32=
/x86/mod.rs
> -+++ rustc-1.70.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/x86/=
mod.rs
> +--- rustc-1.71.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b32=
/x86/mod.rs
> ++++ rustc-1.71.0-src/vendor/libc/src/unix/linux_like/linux/musl/b32/x86/=
mod.rs
> @@ -315,7 +315,6 @@ pub const MAP_SYNC: ::c_int =3D 0x080000;
>
>  pub const SOCK_STREAM: ::c_int =3D 1;
> @@ -79,10 +79,10 @@ Index: rustc-1.70.0-src/vendor/libc/src/unix/linux_li=
ke/linux/musl/b32/x86/mod.r
>
>  pub const EDEADLK: ::c_int =3D 35;
>  pub const ENAMETOOLONG: ::c_int =3D 36;
> -Index: rustc-1.70.0-src/vendor/libc/src/unix/linux_like/linux/musl/b64/m=
od.rs
> +Index: rustc-1.71.0-src/vendor/libc/src/unix/linux_like/linux/musl/b64/m=
od.rs
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- rustc-1.70.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b64=
/mod.rs
> -+++ rustc-1.70.0-src/vendor/libc/src/unix/linux_like/linux/musl/b64/mod.=
rs
> +--- rustc-1.71.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/b64=
/mod.rs
> ++++ rustc-1.71.0-src/vendor/libc/src/unix/linux_like/linux/musl/b64/mod.=
rs
> @@ -136,8 +136,6 @@ pub const __SIZEOF_PTHREAD_BARRIER_T: us
>
>  pub const SOCK_NONBLOCK: ::c_int =3D 2048;
> @@ -92,10 +92,10 @@ Index: rustc-1.70.0-src/vendor/libc/src/unix/linux_li=
ke/linux/musl/b64/mod.rs
>  extern "C" {
>      pub fn getrandom(buf: *mut ::c_void, buflen: ::size_t, flags: ::c_ui=
nt) -> ::ssize_t;
>  }
> -Index: rustc-1.70.0-src/vendor/libc/src/unix/linux_like/linux/musl/mod.r=
s
> +Index: rustc-1.71.0-src/vendor/libc/src/unix/linux_like/linux/musl/mod.r=
s
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- rustc-1.70.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/mod=
.rs
> -+++ rustc-1.70.0-src/vendor/libc/src/unix/linux_like/linux/musl/mod.rs
> +--- rustc-1.71.0-src.orig/vendor/libc/src/unix/linux_like/linux/musl/mod=
.rs
> ++++ rustc-1.71.0-src/vendor/libc/src/unix/linux_like/linux/musl/mod.rs
> @@ -535,6 +535,7 @@ pub const POSIX_MADV_DONTNEED: ::c_int =3D
>
>  pub const MAP_ANONYMOUS: ::c_int =3D MAP_ANON;
> @@ -104,11 +104,11 @@ Index: rustc-1.70.0-src/vendor/libc/src/unix/linux_=
like/linux/musl/mod.rs
>  pub const SOCK_DCCP: ::c_int =3D 6;
>  pub const SOCK_PACKET: ::c_int =3D 10;
>
> -Index: rustc-1.70.0-src/vendor/libc/.cargo-checksum.json
> +Index: rustc-1.71.0-src/vendor/libc/.cargo-checksum.json
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- rustc-1.70.0-src.orig/vendor/libc/.cargo-checksum.json
> -+++ rustc-1.70.0-src/vendor/libc/.cargo-checksum.json
> +--- rustc-1.71.0-src.orig/vendor/libc/.cargo-checksum.json
> ++++ rustc-1.71.0-src/vendor/libc/.cargo-checksum.json
> @@ -1 +1 @@
> --{"files":{"CONTRIBUTING.md":"bdc90b52cf803faac96e594069a86dd8ea150d5ba7=
fb3e6cadfc08dac4c7b0ce","Cargo.toml":"96bf2f6d97a370699fa12dba540978a01b5cd=
84dd72fe6cff8a7700744e8122e","LICENSE-APACHE":"62c7a1e35f56406896d7aa7ca52d=
0cc0d272ac022b5d2796e7d6905db8a3636a","LICENSE-MIT":"a8d47ff51ca256f56a8932=
dba07660672dbfe3004257ca8de708aac1415937a1","README.md":"776affa26b66843a2b=
4f1a1c8f88d92f6461b74568911450fea717e9db6f877b","build.rs":"104ceb079ec13f0=
6d440a348a07974ff5a18dca1f74b9c2fde7be9e3074c25e7","rustfmt.toml":"eaa2ea84=
fc1ba0359b77680804903e07bb38d257ab11986b95b158e460f787b2","src/fixed_width_=
ints.rs":"7f986e5f5e68d25ef04d386fd2f640e8be8f15427a8d4a458ea01d26b8dca0ca"=
,"src/fuchsia/aarch64.rs":"378776a9e40766154a54c94c2a7b4675b5c302a38e6e42da=
99e67bfbaee60e56","src/fuchsia/align.rs":"ae1cf8f011a99737eabeb14ffff768e60=
f13b13363d7646744dbb0f443dab3d6","src/fuchsia/mod.rs":"68d860865d8ccc6c4939=
48c781105e0901fc3312cfa1337f0092c0668706200a","src/fuchsia/no_align.rs":"30=
3f3f1b255e0088b5715094353cf00476131d8e94e6aebb3f469557771c8b8a","src/fuchsi=
a/x86_64.rs":"93a3632b5cf67d2a6bcb7dc0a558605252d5fe689e0f38d8aa2ec5852255a=
c87","src/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae10ceccefeed=
9debb3bbe08777fc682","src/hermit/mod.rs":"d3bfce41e4463d4be8020a2d063c9bfa8=
b665f45f1cc6cbf3163f5d01e7cb21f","src/hermit/x86_64.rs":"ab832b7524e5fb15c4=
9ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/lib.rs":"2411146154773=
9f3646f95bcb66c43f2ae679a727ff5938299434c522c02e458","src/macros.rs":"b457e=
b028b8e8ab3c24bb7292b874ad4e491edbb83594f6a3da024df5348c088","src/psp.rs":"=
dd31aabd46171d474ec5828372e28588935120e7355c90c105360d8fa9264c1c","src/sgx.=
rs":"16a95cdefc81c5ee00d8353a60db363c4cc3e0f75abcd5d0144723f2a306ed1b","src=
/solid/aarch64.rs":"a726e47f324adf73a4a0b67a2c183408d0cad105ae66acf36db37a4=
2ab7f8707","src/solid/arm.rs":"e39a4f74ebbef3b97b8c95758ad741123d84ed3eb48d=
9cf4f1f4872097fc27fe","src/solid/mod.rs":"5f4151dca5132e4b4e4c23ab9737e1285=
6dddbdc0ca3f7dbc004328ef3c8acde","src/switch.rs":"9da3dd39b3de45a7928789926=
e8572d00e1e11a39e6f7289a1349aadce90edba","src/unix/aix/mod.rs":"55a5280c0e5=
498c1632b2772a7846bce0a130dde61a7fd59220d7971f9084b56","src/unix/aix/powerp=
c64.rs":"8c471cf7e4604da9f640db1be68d918303b326744e36e6ee159114040401d2cf",=
"src/unix/align.rs":"2cdc7c826ef7ae61f5171c5ae8c445a743d86f1a7f2d9d7e4ceeec=
56d6874f65","src/unix/bsd/apple/b32/align.rs":"ec833a747866fe19ca2d9b4d3c9f=
f0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b32/mod.rs":"2546=
ad3eb6aecb95f916648bc63264117c92b4b4859532b34cb011e4c75a5a72","src/unix/bsd=
/apple/b64/aarch64/align.rs":"e8eb38d064b5fefec6f37d42873820a0483e7c758ed33=
6cc59a7155455ca89c9","src/unix/bsd/apple/b64/aarch64/mod.rs":"44c217a4f263a=
fe7a97435de9323d20a96c37836f899ca0925306d4b7e073c27","src/unix/bsd/apple/b6=
4/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e2=
6c","src/unix/bsd/apple/b64/mod.rs":"f5e278a1af7fb358891d1c9be4eb7e815aaca0=
c5cb738d0c3604ba2208a856f7","src/unix/bsd/apple/b64/x86_64/align.rs":"ec833=
a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/=
apple/b64/x86_64/mod.rs":"8c87c5855038aae5d433c8f5eb3b29b0a175879a0245342b3=
bfd83bdf4cfd936","src/unix/bsd/apple/long_array.rs":"3cf1f19b812e6d093c819d=
c65ce55b13491963e0780eda0d0bd1577603e81948","src/unix/bsd/apple/mod.rs":"52=
b90d584e771447c3608079681adbb32367267021d12f5eb5940b7646f16f4a","src/unix/b=
sd/freebsdlike/dragonfly/errno.rs":"8295b8bb0dfd38d2cdb4d9192cdeeb534cc6c3b=
208170e64615fa3e0edb3e578","src/unix/bsd/freebsdlike/dragonfly/mod.rs":"898=
6a8c79bcadfbdb58ec1a72e1aff8ce9b341c9392d7b0b7449bddf6db59058","src/unix/bs=
d/freebsdlike/freebsd/aarch64.rs":"6c8e216385f53a4bf5f171749b57602fc34a4e4b=
160a44ca31c058cb0c8a2126","src/unix/bsd/freebsdlike/freebsd/arm.rs":"59d6a6=
70eea562fb87686e243e0a84603d29a2028a3d4b3f99ccc01bd04d2f47","src/unix/bsd/f=
reebsdlike/freebsd/freebsd11/b64.rs":"9808d152c1196aa647f1b0f0cf84dac8c930d=
a7d7f897a44975545e3d9d17681","src/unix/bsd/freebsdlike/freebsd/freebsd11/mo=
d.rs":"fa83dcd4597c6621b95228d80ea6250c37136463300f80a9961a09bdab5e25c3","s=
rc/unix/bsd/freebsdlike/freebsd/freebsd12/b64.rs":"61cbe45f8499bedb168106b6=
86d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd=
/freebsd12/mod.rs":"c7c574d65a8408f6eee32bd5d0cc40e33e41c7e61d98d338609ae5b=
eec72f390","src/unix/bsd/freebsdlike/freebsd/freebsd12/x86_64.rs":"2df36a7f=
122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/fre=
ebsdlike/freebsd/freebsd13/b64.rs":"61cbe45f8499bedb168106b686d4f8239472f25=
c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd13/mod.=
rs":"834ec71df759e8d38489986b7720f1b296ca774c23c8034e2d9b02b9f55ab781","src=
/unix/bsd/freebsdlike/freebsd/freebsd13/x86_64.rs":"2df36a7f122f6d6e5753cfb=
4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/freebsdlike/freebs=
d/freebsd14/b64.rs":"61cbe45f8499bedb168106b686d4f8239472f25c7553b069eec2af=
e197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd14/mod.rs":"58b7766136=
a22ace828c974f34240eb38feec2c8aa2ee8b6ca38e3b44a6fa348","src/unix/bsd/freeb=
sdlike/freebsd/freebsd14/x86_64.rs":"2df36a7f122f6d6e5753cfb4d22e915cc80f6b=
c91c0161b3daae55a481bfd052","src/unix/bsd/freebsdlike/freebsd/mod.rs":"cbfb=
50eeca94674f3e51992ab41cb020127d9405002eacf4b8bf7b2a0418f2ea","src/unix/bsd=
/freebsdlike/freebsd/powerpc.rs":"9ca3f82f88974e6db5569f2d76a5a3749b248a317=
47a6c0da5820492bdfeca42","src/unix/bsd/freebsdlike/freebsd/powerpc64.rs":"2=
dae3ecc87eac3b11657aa98915def55fc4b5c0de11fe26aae23329a54628a9a","src/unix/=
bsd/freebsdlike/freebsd/riscv64.rs":"fa4bed4c58cad24ba3395941c7fa6b11e08955=
1a04714f9561078e400f5b2b62","src/unix/bsd/freebsdlike/freebsd/x86.rs":"c500=
5e3249eb7c93cfbac72a9e9272320d80ce7983da990ceb05a447f59a02c5","src/unix/bsd=
/freebsdlike/freebsd/x86_64/align.rs":"0e1f69a88fca1c32874b1daf5db3d446fefb=
e518dca497f096cc9168c39dde70","src/unix/bsd/freebsdlike/freebsd/x86_64/mod.=
rs":"51e4dd0c8ae247bb652feda5adad9333ea3bb30c750c3a3935e0b0e47d7803eb","src=
/unix/bsd/freebsdlike/mod.rs":"f5ebb2f36dffd9c897b18b168cf28fbff9cc68983ae2=
d4910cb1ba9764693381","src/unix/bsd/mod.rs":"0c672b075b5616fca2cc56c00ee31c=
3f554dcbd2e88a7c2ba1437aa6e5604319","src/unix/bsd/netbsdlike/mod.rs":"0a66f=
7de43710e35a6a546e6c39066aa8b91a6efadb71db88738b0a577fd5537","src/unix/bsd/=
netbsdlike/netbsd/aarch64.rs":"65dcb58d11e8d8028401a9d07ca3eb4cb4f053e04249=
cc877353449d84ccc4cb","src/unix/bsd/netbsdlike/netbsd/arm.rs":"58cdbb70b0d6=
f536551f0f3bb3725d2d75c4690db12c26c034e7d6ec4a924452","src/unix/bsd/netbsdl=
ike/netbsd/mod.rs":"4493317993af390d8aafc2cb7ace4c349dfc9d2451fd666844f04a4=
fa1f47442","src/unix/bsd/netbsdlike/netbsd/powerpc.rs":"ee7ff5d89d0ed22f531=
237b5059aa669df93a3b5c489fa641465ace8d405bf41","src/unix/bsd/netbsdlike/net=
bsd/sparc64.rs":"9489f4b3e4566f43bb12dfb92238960613dac7f6a45cc13068a8d152b9=
02d7d9","src/unix/bsd/netbsdlike/netbsd/x86.rs":"20692320e36bfe028d1a34d16f=
e12ca77aa909cb02bda167376f98f1a09aefe7","src/unix/bsd/netbsdlike/netbsd/x86=
_64.rs":"1afe5ef46b14397cdd68664b5b232e4f5b035b6db1d4cf411c899d51ebca9f30",=
"src/unix/bsd/netbsdlike/openbsd/aarch64.rs":"dd91931d373b7ecaf6e2de25adade=
e10d16fa9b12c2cbacdff3eb291e1ba36af","src/unix/bsd/netbsdlike/openbsd/arm.r=
s":"01580d261bc6447bb327a0d982181b7bdabfa066cee65a30373d3ced729ad307","src/=
unix/bsd/netbsdlike/openbsd/mips64.rs":"8532a189ae10c7d668d9d4065da8b05d124=
e09bd39442c9f74a7f231c43eca48","src/unix/bsd/netbsdlike/openbsd/mod.rs":"c0=
f06c4af4dd3169b8bcd13a2fb7be6ac9dfa901e11bfd22058fff2aa6caed2e","src/unix/b=
sd/netbsdlike/openbsd/powerpc.rs":"01580d261bc6447bb327a0d982181b7bdabfa066=
cee65a30373d3ced729ad307","src/unix/bsd/netbsdlike/openbsd/powerpc64.rs":"1=
dd5449dd1fd3d51e30ffdeeaece91d0aaf05c710e0ac699fecc5461cfa2c28e","src/unix/=
bsd/netbsdlike/openbsd/riscv64.rs":"1dd5449dd1fd3d51e30ffdeeaece91d0aaf05c7=
10e0ac699fecc5461cfa2c28e","src/unix/bsd/netbsdlike/openbsd/sparc64.rs":"d0=
4fd287afbaa2c5df9d48c94e8374a532a3ba491b424ddf018270c7312f4085","src/unix/b=
sd/netbsdlike/openbsd/x86.rs":"6f7f5c4fde2a2259eb547890cbd86570cea04ef85347=
d7569e94e679448bec87","src/unix/bsd/netbsdlike/openbsd/x86_64.rs":"d31db316=
30289c85af3339dbe357998a21ca584cbae31607448fe2cf7675a4e1","src/unix/haiku/b=
32.rs":"a2efdbf7158a6da341e1db9176b0ab193ba88b449616239ed95dced11f54d87b","=
src/unix/haiku/b64.rs":"ff8115367d3d7d354f792d6176dfaaa26353f57056197b563bf=
4681f91ff7985","src/unix/haiku/mod.rs":"0b5a77da05582896e680e236ddd3d813a7b=
8a2ecfde21c1b72ec17883e2de6a7","src/unix/haiku/native.rs":"dbfcbf4954a79d1d=
f2ff58e0590bbcb8c57dfc7a32392aa73ee4726b66bd6cc8","src/unix/haiku/x86_64.rs=
":"3ec3aeeb7ed208b8916f3e32d42bfd085ff5e16936a1a35d9a52789f043b7237","src/u=
nix/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae10ceccefeed9debb3=
bbe08777fc682","src/unix/hermit/mod.rs":"a1494a0bddf301cceb0d9b8529a84b5882=
fe855ceae77a1c4e8d6034e705e26c","src/unix/hermit/x86_64.rs":"ab832b7524e5fb=
15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/unix/linux_like/an=
droid/b32/arm.rs":"ce582de7e983a33d3bfad13075c53aac9016cee35f06ad8653ee9072=
c3ec2564","src/unix/linux_like/android/b32/mod.rs":"7c173e0375119bf06a30816=
52faede95e5bcd6858e7576b7533d037978737c8f","src/unix/linux_like/android/b32=
/x86/align.rs":"812914e4241df82e32b12375ca3374615dc3a4bdd4cf31f0423c5815320=
c0dab","src/unix/linux_like/android/b32/x86/mod.rs":"e6d107efbcd37b5b85dfa1=
8f683300cbf768ffa0237997a9fa52b184a53323ac","src/unix/linux_like/android/b6=
4/aarch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3ee2faf6fcae3770f9e505=
cddca35c7b","src/unix/linux_like/android/b64/aarch64/int128.rs":"1735f6f5c5=
6770d20dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_lik=
e/android/b64/aarch64/mod.rs":"171f8c37a2d2e45065bd3547dfcec70b02aa3da34cd9=
9d259d150c753f620846","src/unix/linux_like/android/b64/mod.rs":"71e4fcbe952=
bfa4a5f9022f3972e906917b38f729b9d8ef57cd5d179104894ac","src/unix/linux_like=
/android/b64/riscv64/align.rs":"0bf138f84e5327d8339bcd4adf071a6832b516445e5=
97552c82bbd881095e3a8","src/unix/linux_like/android/b64/riscv64/mod.rs":"19=
d4bf2237c47127eba9144e0b82e995bc079315e719179a91813b0ae7b0e49d","src/unix/l=
inux_like/android/b64/x86_64/align.rs":"7169d07a9fd4716f7512719aec9fda5d8be=
d306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/android/b64/x86_64/mod.=
rs":"4ec2de11a9b65c4325b7b991f0b99a414975e0e61ba8668caca5d921e9b314d1","src=
/unix/linux_like/android/mod.rs":"21b1b70c1d398bd342794376b41975bfe3daf7512=
7c7a11d825cc4b839811153","src/unix/linux_like/emscripten/align.rs":"86c95cb=
ed7a7161b1f23ee06843e7b0e2340ad92b2cb86fe2a8ef3e0e8c36216","src/unix/linux_=
like/emscripten/mod.rs":"712c52856ee323b8057b9452e4ab484a0e652581a530b67c3d=
b25e819919d718","src/unix/linux_like/emscripten/no_align.rs":"0128e4aa721a9=
902754828b61b5ec7d8a86619983ed1e0544a85d35b1051fad6","src/unix/linux_like/l=
inux/align.rs":"28b2cd7c3eddc53c247aa11340da205d1d2e478f199493d330c61e75ec1=
6ee96","src/unix/linux_like/linux/arch/generic/mod.rs":"249387e62ce11dfe5a9=
3652699df6e5d8d29311d70d7a0e58fc1298a2ac8d750","src/unix/linux_like/linux/a=
rch/mips/mod.rs":"2d166054a586bb4bf6e4a4ba35f7574907b217225eff8f1a43adc4277=
e142460","src/unix/linux_like/linux/arch/mod.rs":"466a29622e47c6c7f1500682b=
2eb17f5566dd81b322cd6348f0fdd355cec593a","src/unix/linux_like/linux/arch/po=
werpc/mod.rs":"3f6da7b0fa7b394c7d4eea2bb3caa7a7729ab0d6c1491fef02206a912c41=
b815","src/unix/linux_like/linux/arch/sparc/mod.rs":"91593ec0440f1dd8f8e612=
028f432c44c14089286e2aca50e10511ab942db8c3","src/unix/linux_like/linux/gnu/=
align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936=
","src/unix/linux_like/linux/gnu/b32/arm/align.rs":"6ec0eb3ee93f7ae99fd714b=
4deabfb5e97fbcefd8c26f5a45fb8e7150899cdeb","src/unix/linux_like/linux/gnu/b=
32/arm/mod.rs":"45be81a806c55fed92c20a33c5e4cfb23b3933f7b4feff47db33d37dda3=
4e6d3","src/unix/linux_like/linux/gnu/b32/m68k/align.rs":"8faa92f77a9232c03=
5418d45331774e64a9a841d99c91791570a203bf2b45bcb","src/unix/linux_like/linux=
/gnu/b32/m68k/mod.rs":"6aab7f1b864e9691d14aa7d389f717c4077b8eed72a7f11e3b8c=
7fef245e4046","src/unix/linux_like/linux/gnu/b32/mips/align.rs":"429fb5e005=
cb7143602d430098b6ebfb7d360685b194f333dfd587472ae954ee","src/unix/linux_lik=
e/linux/gnu/b32/mips/mod.rs":"6b9a5dac6f937ddc1453e808e3c43502c87143332df9e=
43ac64fb8b1eda6c116","src/unix/linux_like/linux/gnu/b32/mod.rs":"caade9dc8b=
7179711102da342819bdf330c42c796b4587d0ed419550dab2e9ad","src/unix/linux_lik=
e/linux/gnu/b32/powerpc.rs":"5c5d90326b54b57b98eff4745fe7a3fb02f053b2dc7822=
41a73e807b491936a3","src/unix/linux_like/linux/gnu/b32/riscv32/align.rs":"d=
321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd37543efe86621b119","src/unix/=
linux_like/linux/gnu/b32/riscv32/mod.rs":"ca8bc84fff8c65ecda6c03421f4fe7689=
f199dce39f1ca382a45bf0b13a1cb00","src/unix/linux_like/linux/gnu/b32/sparc/a=
lign.rs":"21adbed27df73e2d1ed934aaf733a643003d7baf2bde9c48ea440895bcca6d41"=
,"src/unix/linux_like/linux/gnu/b32/sparc/mod.rs":"80894eece66e9348f45d1b07=
ad37c757ea694bbd10ed49d3f920b34e9f51a9a3","src/unix/linux_like/linux/gnu/b3=
2/x86/align.rs":"e4bafdc4a519a7922a81b37a62bbfd1177a2f620890eef8f1fbc47162e=
9eb413","src/unix/linux_like/linux/gnu/b32/x86/mod.rs":"c703cc5e9de2dc31d9e=
5831bfb6f354d6e3518b2ae02263f68a9a70f1c0167e2","src/unix/linux_like/linux/g=
nu/b64/aarch64/align.rs":"ea39d5fd8ca5a71314127d1e1f542bca34ac566eac9a95662=
076d91ea4bee548","src/unix/linux_like/linux/gnu/b64/aarch64/ilp32.rs":"bf46=
11b737813deef6787babf6c01698605f3b75482269b8546318667bc68e29","src/unix/lin=
ux_like/linux/gnu/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426442f09724d9=
b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/gnu/b64/aarch64=
/lp64.rs":"11a950697fdda0258c6e37c6b13993348c8de4134105ed4faa79358e53175072=
","src/unix/linux_like/linux/gnu/b64/aarch64/mod.rs":"d7be998105fc2f6248b7f=
dfcedb5a0519122d28625fcfd5dccf72617fb30c45e","src/unix/linux_like/linux/gnu=
/b64/loongarch64/align.rs":"6616c38bf8cab53034dce9f968adae8fb7771334445a938=
76d000cfd08f117a8","src/unix/linux_like/linux/gnu/b64/loongarch64/mod.rs":"=
9c39dfc3843e72bd8dba21aa5ef2795411cd8a0004a0cfe79c9b9f89ab92eb55","src/unix=
/linux_like/linux/gnu/b64/mips64/align.rs":"7169d07a9fd4716f7512719aec9fda5=
d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/linux/gnu/b64/mips6=
4/mod.rs":"628c410b9aaec3c8f43838a28616b577a1d6de60a9799b09bb884d80281f96eb=
","src/unix/linux_like/linux/gnu/b64/mod.rs":"3c6555f30a7a8852757b31a542ea7=
3fb6a16a6e27e838397e819278ad56e57a4","src/unix/linux_like/linux/gnu/b64/pow=
erpc64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f12=
68130d9","src/unix/linux_like/linux/gnu/b64/powerpc64/mod.rs":"c778a136f06c=
2ffeacea19fa14ce79b828f91b67a002dec5ce87289bae36234e","src/unix/linux_like/=
linux/gnu/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803=
f99cd37543efe86621b119","src/unix/linux_like/linux/gnu/b64/riscv64/mod.rs":=
"88bde5520c86793f2cf97062d66c1b3f4dd66206c453a601ebf9110d90abc6f8","src/uni=
x/linux_like/linux/gnu/b64/s390x.rs":"a2fd9277c2dcf76f7a16a3bcca745d5a9932c=
765c0dc2feb31c3641be25eb0aa","src/unix/linux_like/linux/gnu/b64/sparc64/ali=
gn.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268130d9","=
src/unix/linux_like/linux/gnu/b64/sparc64/mod.rs":"e8047e9966a2b90063e0151a=
0278c54885e7b323286cf5ab55cbaf151fc772d3","src/unix/linux_like/linux/gnu/b6=
4/x86_64/align.rs":"62e822478356db4a73b6bbd1b36d825b893939ab4b308ec11b0578b=
cc4b49769","src/unix/linux_like/linux/gnu/b64/x86_64/mod.rs":"891e595d33714=
b9883b92f0554d1d361fba2b6c3f6cac09a288252f44c6ec667","src/unix/linux_like/l=
inux/gnu/b64/x86_64/not_x32.rs":"38f74ce15d9662ce4818815a2b87be1618d5e45f19=
0f7e4db84ff3285b4421fb","src/unix/linux_like/linux/gnu/b64/x86_64/x32.rs":"=
b20218a11364a6dec87f96d6c0d8b19e660697ab09ad5ee0e9b3a9dafedaaebb","src/unix=
/linux_like/linux/gnu/mod.rs":"daf0eff7fddf6d7a2c15a5bc89e3a0dfe463a40f3888=
0fe3fb444105d0ae0f07","src/unix/linux_like/linux/gnu/no_align.rs":"9cd22313=
5de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/linux_l=
ike/linux/mod.rs":"f305c518fc8ef7e151b22a93d23ad304d1302e71ae7082b0c3676d54=
09ad6646","src/unix/linux_like/linux/musl/b32/arm/align.rs":"3e8ac052c10437=
64776b54c93ba4260e061df998631737a897d9d47d54f7b80c","src/unix/linux_like/li=
nux/musl/b32/arm/mod.rs":"f5b217a93f99c2852f7fd1459f529798372fa7df84ee0cfd3=
d8cdd5b2021b8cf","src/unix/linux_like/linux/musl/b32/hexagon.rs":"226a8b64c=
e9c75abbbee6d2dceb0b44f7b6c750c4102ebd4d015194afee6666e","src/unix/linux_li=
ke/linux/musl/b32/mips/align.rs":"429fb5e005cb7143602d430098b6ebfb7d360685b=
194f333dfd587472ae954ee","src/unix/linux_like/linux/musl/b32/mips/mod.rs":"=
16a7a03d998a5db11be9ee81525c7faec4623383260e8bc125b1c53a050fde75","src/unix=
/linux_like/linux/musl/b32/mod.rs":"31677597fd9544c4b1ec1477628288f6273fabb=
c06e38f33da862ad55f019ce1","src/unix/linux_like/linux/musl/b32/powerpc.rs":=
"dc52adc264c34bce80753d6bd064e8fc4b8237fa1e5c5315ccb6c72df74c2813","src/uni=
x/linux_like/linux/musl/b32/riscv32/align.rs":"efd2accf33b87de7c7547903359a=
5da896edc33cd6c719552c7474b60d4a5d48","src/unix/linux_like/linux/musl/b32/r=
iscv32/mod.rs":"b857ccbc8f0fbc8a6a5959f3496a4fd5a9a1dd986c15c8e716f3e2902c2=
5181c","src/unix/linux_like/linux/musl/b32/x86/align.rs":"08e77fbd7435d7dec=
2ff56932433bece3f02e47ce810f89004a275a86d39cbe1","src/unix/linux_like/linux=
/musl/b32/x86/mod.rs":"7a1586f77bb693f0b319ec720c35963da056287fc42f8e2ccf1d=
5b2bcccf4fd6","src/unix/linux_like/linux/musl/b64/aarch64/align.rs":"6ba327=
25d24d7d8e6aa111f3b57aafa318f83b606abe96561329151829821133","src/unix/linux=
_like/linux/musl/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426442f09724d9b=
2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/musl/b64/aarch64=
/mod.rs":"31e75179cbb4e26425b3f5b052e358f593153da662884655e60801d852e55dc2"=
,"src/unix/linux_like/linux/musl/b64/mips64.rs":"9a5d29f666332bb056d0e2951e=
9de989aa1dc016075f009db3f2f628e0cdda8c","src/unix/linux_like/linux/musl/b64=
/mod.rs":"884243eb5af7df963d858d5baf47e622b45f04e0ae701728b134e986191b614b"=
,"src/unix/linux_like/linux/musl/b64/powerpc64.rs":"455dc0ffa55afc1db6ffaf4=
61f6f2a7b49d31658bfebe0bb4efac5967a6f956c","src/unix/linux_like/linux/musl/=
b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd37543=
efe86621b119","src/unix/linux_like/linux/musl/b64/riscv64/mod.rs":"42d4b6d3=
6807f37759094a732a321080cccdf498b174d632cebba147051de294","src/unix/linux_l=
ike/linux/musl/b64/s390x.rs":"d8a4fdfea0960ec284cae4facb8b0fb342e8aa41544cf=
facdcaf08c5a92a43f8","src/unix/linux_like/linux/musl/b64/x86_64/align.rs":"=
77309276ad7a42cbe59ca381f23590b7a143aded05555b34a5b307b808cbca6e","src/unix=
/linux_like/linux/musl/b64/x86_64/mod.rs":"7a877cd23b64be66d28e6b8dddae32d5=
9a88d69115637539daf19381f4e39330","src/unix/linux_like/linux/musl/mod.rs":"=
8965596cc33a032f7495c74d0d25ff9169e425491b36c4563b291e9f12e2a1b6","src/unix=
/linux_like/linux/no_align.rs":"1a754a4af299894a79835aa092d8322d301179e2b20=
609defd6bb4bc880e6b4a","src/unix/linux_like/linux/non_exhaustive.rs":"181a0=
5bf94fdb911db83ce793b993bd6548a4115b306a7ef3c10f745a8fea3e9","src/unix/linu=
x_like/linux/uclibc/align.rs":"9ed16138d8e439bd90930845a65eafa7ebd67366e6bf=
633936d44014f6e4c959","src/unix/linux_like/linux/uclibc/arm/align.rs":"e4a3=
c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936","src/unix/lin=
ux_like/linux/uclibc/arm/mod.rs":"50288ff9e411ab0966da24838f2c2a5618021bc19=
c422a04f577b2979ef4081e","src/unix/linux_like/linux/uclibc/arm/no_align.rs"=
:"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/un=
ix/linux_like/linux/uclibc/mips/mips32/align.rs":"e4a3c27fe20a57b8d612c34cb=
05bc70646edb5cec7251957315afa53a7b9f936","src/unix/linux_like/linux/uclibc/=
mips/mips32/mod.rs":"d0c4434e2bf813372c418a8f516c706cdccc9f7be2f0921b2207b0=
afdb66fe81","src/unix/linux_like/linux/uclibc/mips/mips32/no_align.rs":"9cd=
223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/li=
nux_like/linux/uclibc/mips/mips64/align.rs":"a7bdcb18a37a2d91e64d5fad83ea3e=
dc78f5412adb28f77ab077dbb26dd08b2d","src/unix/linux_like/linux/uclibc/mips/=
mips64/mod.rs":"3f38ee6a4690b9d7594be20d216467a34d955f7653c2c8ce1e6147daeb5=
3f1e0","src/unix/linux_like/linux/uclibc/mips/mips64/no_align.rs":"4a18e387=
5698c85229599225ac3401a2a40da87e77b2ad4ef47c6fcd5a24ed30","src/unix/linux_l=
ike/linux/uclibc/mips/mod.rs":"a048fce1c2d9b1ad57305642e8ad05ca0f0c7e475326=
7a2e2d6b4fee5db3b072","src/unix/linux_like/linux/uclibc/mod.rs":"1c3d25cddc=
fefa2bd17bdc81550826be31a08eef235e13f825f169a5029c8bca","src/unix/linux_lik=
e/linux/uclibc/no_align.rs":"3f28637046524618adaa1012e26cb7ffe94b9396e6b518=
cccdc69d59f274d709","src/unix/linux_like/linux/uclibc/x86_64/l4re.rs":"024e=
ba5753e852dbdd212427351affe7e83f9916c1864bce414d7aa2618f192e","src/unix/lin=
ux_like/linux/uclibc/x86_64/mod.rs":"196d03affbefb85716937c15904831e731eb22=
2ee906e05e42102d639a8152ea","src/unix/linux_like/linux/uclibc/x86_64/other.=
rs":"42c3f71e58cabba373f6a55a623f3c31b85049eb64824c09c2b082b3b2d6a0a8","src=
/unix/linux_like/mod.rs":"adfa87d7f8790795f22576ab9b7064f7d0085b539d24d8223=
275e66edbab320d","src/unix/mod.rs":"362da723eaad726ae72664d801315f4cf70a042=
250de1231761bfd12390e27b8","src/unix/newlib/aarch64/mod.rs":"bac93836a9a57b=
2c710f32f852e92a4d11ad6759ab0fb6ad33e71d60e53278af","src/unix/newlib/align.=
rs":"28aaf87fafbc6b312622719d472d8cf65f9e5467d15339df5f73e66d8502b28a","src=
/unix/newlib/arm/mod.rs":"cbba6b3e957eceb496806e60de8725a23ff3fa0015983b4b4=
fa27b233732b526","src/unix/newlib/espidf/mod.rs":"816f235f4aa4baabba7f2606b=
31d0fdb03988c52194c966728de8690bf17299d","src/unix/newlib/generic.rs":"eab0=
66d9f0a0f3eb53cc1073d01496bba0110989e1f6a59838afd19f870cd599","src/unix/new=
lib/horizon/mod.rs":"7cc5cc120437421db139bfa6a90b18168cd3070bdd0f5be96d40fe=
4c996f3ca1","src/unix/newlib/mod.rs":"fcf8b307933cba5e9c485537499386326d665=
fe83b6fcfb9e9e1837f73332668","src/unix/newlib/no_align.rs":"e0743b2179495a9=
514bc3a4d1781e492878c4ec834ee0085d0891dd1712e82fb","src/unix/newlib/powerpc=
/mod.rs":"0202ffd57caf75b6afa2c9717750ffb96e375ac33df0ae9609a3f831be393b67"=
,"src/unix/no_align.rs":"c06e95373b9088266e0b14bba0954eef95f93fb2b01d951855=
e382d22de78e53","src/unix/nto/aarch64.rs":"4709c9afdc8d583be876598e7c238499=
ee3e8da5bd2baa614d9c7dd414851555","src/unix/nto/mod.rs":"44b74cd89794aecd7d=
b67aad1c4114273f70be8d2e4633e3965f144fe53a7b88","src/unix/nto/neutrino.rs":=
"62198d95ccc0fe7ece6f9d5c0b29fc22303ef458886efb5e09aad524eca2ab7b","src/uni=
x/nto/x86_64.rs":"a3e18e93c2999da1cd7a6f748a4b60c07aefb73d8ea2aafec19a84cfb=
040bc8e","src/unix/redox/mod.rs":"c8afea39f81e73ad4e9bf8a8f25138a200e616048=
e189debad80a6b7e08f710f","src/unix/solarish/compat.rs":"00f1ee3faec9da69204=
e42f025f6735dd13d894071a154425dcc43ecbdd06e7f","src/unix/solarish/illumos.r=
s":"cd93c2d84722bbf9933a92842a8998eb0b2afc962f50bc2546ad127b82809fa7","src/=
unix/solarish/mod.rs":"6442ed05eb390d44a03daa9800af1030f2ee3e61db98675262c2=
27b28de51937","src/unix/solarish/solaris.rs":"41b350a89ddf01cd12a10f93640f9=
2be53be0b0d976021cdc08da17bf3e72edf","src/unix/solarish/x86.rs":"e86e806df0=
caed72765040eaa2f3c883198d1aa91508540adf9b7008c77f522e","src/unix/solarish/=
x86_64.rs":"ec2b01f194eb8a6a27133c57681da195a949e03098f3ea1e847227a9c09ef5f=
c","src/unix/solarish/x86_common.rs":"ac869d9c3c95645c22460468391eb1982023c=
3a8e02b9e06a72e3aef3d5f1eac","src/vxworks/aarch64.rs":"98f0afdc511cd02557e5=
06c21fed6737585490a1dce7a9d4941d08c437762b99","src/vxworks/arm.rs":"acb7968=
ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788e88","src/vxworks/mod=
.rs":"ff063860fc4fe3bca6332742764e29c1506884added21aa7722144c1fb3f4018","sr=
c/vxworks/powerpc.rs":"acb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777=
cb181d788e88","src/vxworks/powerpc64.rs":"98f0afdc511cd02557e506c21fed67375=
85490a1dce7a9d4941d08c437762b99","src/vxworks/x86.rs":"552f007f38317620b238=
89cb7c49d1d115841252439060122f52f434fbc6e5ba","src/vxworks/x86_64.rs":"018d=
92be3ad628a129eff9f2f5dfbc0883d8b8e5f2fa917b900a7f98ed6b514a","src/wasi.rs"=
:"09ee3b3348b212b050f6ca8ae008a28679ea44a375674307a4e7c9ca0d3ed7d5","src/wi=
ndows/gnu/align.rs":"b2c13ec1b9f3b39a75c452c80c951dff9d0215e31d77e883b4502a=
fb31794647","src/windows/gnu/mod.rs":"3c8c7edb7cdf5d0c44af936db2a94869585c6=
9dfabeef30571b4f4e38375767a","src/windows/mod.rs":"5421b92f47cb69845f4323b1=
a14e533d8a17acc6412c58e67f4d41def749de2f","src/windows/msvc/mod.rs":"c06827=
1e00fca6b62bc4bf44bcf142cfc38caeded9b6c4e01d1ceef3ccf986f4","src/xous.rs":"=
eb0675f25ba01f73072d2b70907fb8abb1148facefe5a20756c49250f3d65fae","tests/co=
nst_fn.rs":"cb75a1f0864f926aebe79118fc34d51a0d1ade2c20a394e7774c7e545f21f1f=
4"},"package":"99227334921fae1a979cf0bfdfcc6b3e5ce376ef57e16fb6fb3ea2ed6095=
f80c"}
> +-{"files":{"CONTRIBUTING.md":"bdc90b52cf803faac96e594069a86dd8ea150d5ba7=
fb3e6cadfc08dac4c7b0ce","Cargo.toml":"bcbcb2d5d0952786b470930f12a959168ba4b=
5e5a0c5185beb032c8ea20a719b","LICENSE-APACHE":"62c7a1e35f56406896d7aa7ca52d=
0cc0d272ac022b5d2796e7d6905db8a3636a","LICENSE-MIT":"a8d47ff51ca256f56a8932=
dba07660672dbfe3004257ca8de708aac1415937a1","README.md":"776affa26b66843a2b=
4f1a1c8f88d92f6461b74568911450fea717e9db6f877b","build.rs":"5bd78d7e4e79b18=
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
.rs":"54229b5e774669c16912112e8b50fa938db76f534971222a11723a05195a0948","sr=
c/unix/aix/powerpc64.rs":"cf374d81139d45f9d77c6a764f640bfbf7e0a5903689652c8=
296f8e10d55169b","src/unix/align.rs":"2cdc7c826ef7ae61f5171c5ae8c445a743d86=
f1a7f2d9d7e4ceeec56d6874f65","src/unix/bsd/apple/b32/align.rs":"ec833a74786=
6fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/=
b32/mod.rs":"2546ad3eb6aecb95f916648bc63264117c92b4b4859532b34cb011e4c75a5a=
72","src/unix/bsd/apple/b64/aarch64/align.rs":"e8eb38d064b5fefec6f37d428738=
20a0483e7c758ed336cc59a7155455ca89c9","src/unix/bsd/apple/b64/aarch64/mod.r=
s":"44c217a4f263afe7a97435de9323d20a96c37836f899ca0925306d4b7e073c27","src/=
unix/bsd/apple/b64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0=
d15fa68884c40b0e26c","src/unix/bsd/apple/b64/mod.rs":"f5e278a1af7fb358891d1=
c9be4eb7e815aaca0c5cb738d0c3604ba2208a856f7","src/unix/bsd/apple/b64/x86_64=
/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26=
c","src/unix/bsd/apple/b64/x86_64/mod.rs":"8c87c5855038aae5d433c8f5eb3b29b0=
a175879a0245342b3bfd83bdf4cfd936","src/unix/bsd/apple/long_array.rs":"3cf1f=
19b812e6d093c819dc65ce55b13491963e0780eda0d0bd1577603e81948","src/unix/bsd/=
apple/mod.rs":"7ffbd4a92cdee46bc7fcd2a102d33d5acc5ba2df9a65030b5cfb7876885d=
1def","src/unix/bsd/freebsdlike/dragonfly/errno.rs":"8295b8bb0dfd38d2cdb4d9=
192cdeeb534cc6c3b208170e64615fa3e0edb3e578","src/unix/bsd/freebsdlike/drago=
nfly/mod.rs":"8b98b2e544b1303eb3efff36aa1f00d7bb608d507f07db035fd3ead8562bd=
ef0","src/unix/bsd/freebsdlike/freebsd/aarch64.rs":"6c8e216385f53a4bf5f1717=
49b57602fc34a4e4b160a44ca31c058cb0c8a2126","src/unix/bsd/freebsdlike/freebs=
d/arm.rs":"59d6a670eea562fb87686e243e0a84603d29a2028a3d4b3f99ccc01bd04d2f47=
","src/unix/bsd/freebsdlike/freebsd/freebsd11/b64.rs":"9808d152c1196aa647f1=
b0f0cf84dac8c930da7d7f897a44975545e3d9d17681","src/unix/bsd/freebsdlike/fre=
ebsd/freebsd11/mod.rs":"e243ae0e89623d4fa9f85afe14369cc5fd5f2028ea715773dbe=
c722ba80dac1f","src/unix/bsd/freebsdlike/freebsd/freebsd12/b64.rs":"61cbe45=
f8499bedb168106b686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/fr=
eebsdlike/freebsd/freebsd12/mod.rs":"bef9fae288a4f29e941ea369be1cd20b170040=
e60665a4d49a4a9e79009b72d8","src/unix/bsd/freebsdlike/freebsd/freebsd12/x86=
_64.rs":"2df36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052",=
"src/unix/bsd/freebsdlike/freebsd/freebsd13/b64.rs":"61cbe45f8499bedb168106=
b686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freeb=
sd/freebsd13/mod.rs":"3c514e037694ce22724abb3c9c4687defda7f0e3456b615ca7359=
3e860e38b16","src/unix/bsd/freebsdlike/freebsd/freebsd13/x86_64.rs":"2df36a=
7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/f=
reebsdlike/freebsd/freebsd14/b64.rs":"61cbe45f8499bedb168106b686d4f8239472f=
25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd14/mo=
d.rs":"318abe48bfdd1c74ecd6afbd6c9329c5c72ce4f7d420edd6be2fc12b223ae32f","s=
rc/unix/bsd/freebsdlike/freebsd/freebsd14/x86_64.rs":"e7b5863e222d6cc416b6b=
0fbe71690fad909e899b4c4ae810bbca117e4fcb650","src/unix/bsd/freebsdlike/free=
bsd/mod.rs":"6cd5a49c877ec4180ec200c9dcd0426c1054775ee557e4899c1c633158c7c8=
25","src/unix/bsd/freebsdlike/freebsd/powerpc.rs":"9ca3f82f88974e6db5569f2d=
76a5a3749b248a31747a6c0da5820492bdfeca42","src/unix/bsd/freebsdlike/freebsd=
/powerpc64.rs":"2dae3ecc87eac3b11657aa98915def55fc4b5c0de11fe26aae23329a546=
28a9a","src/unix/bsd/freebsdlike/freebsd/riscv64.rs":"fa4bed4c58cad24ba3395=
941c7fa6b11e089551a04714f9561078e400f5b2b62","src/unix/bsd/freebsdlike/free=
bsd/x86.rs":"6766e2ce85e187b306cd3b0b8d7e15b8f4042c5cff81d89b3af69ecc99c70a=
b0","src/unix/bsd/freebsdlike/freebsd/x86_64/align.rs":"0e1f69a88fca1c32874=
b1daf5db3d446fefbe518dca497f096cc9168c39dde70","src/unix/bsd/freebsdlike/fr=
eebsd/x86_64/mod.rs":"51e4dd0c8ae247bb652feda5adad9333ea3bb30c750c3a3935e0b=
0e47d7803eb","src/unix/bsd/freebsdlike/mod.rs":"e9bd293d0bcb317dcebd7d86efc=
8e9bed5d9f7c63b9edfd477f76bd2e32e6457","src/unix/bsd/mod.rs":"dad51a24a524e=
92bfe9de3ac3b7d394d86058b9b8a1ccd4efa9bbb5c78e7fa1a","src/unix/bsd/netbsdli=
ke/mod.rs":"0a66f7de43710e35a6a546e6c39066aa8b91a6efadb71db88738b0a577fd553=
7","src/unix/bsd/netbsdlike/netbsd/aarch64.rs":"65dcb58d11e8d8028401a9d07ca=
3eb4cb4f053e04249cc877353449d84ccc4cb","src/unix/bsd/netbsdlike/netbsd/arm.=
rs":"58cdbb70b0d6f536551f0f3bb3725d2d75c4690db12c26c034e7d6ec4a924452","src=
/unix/bsd/netbsdlike/netbsd/mod.rs":"247154ad4f5e5114a2bb572bff0d157ed3b937=
a373759146b7d0f2900203293b","src/unix/bsd/netbsdlike/netbsd/powerpc.rs":"ee=
7ff5d89d0ed22f531237b5059aa669df93a3b5c489fa641465ace8d405bf41","src/unix/b=
sd/netbsdlike/netbsd/sparc64.rs":"9489f4b3e4566f43bb12dfb92238960613dac7f6a=
45cc13068a8d152b902d7d9","src/unix/bsd/netbsdlike/netbsd/x86.rs":"20692320e=
36bfe028d1a34d16fe12ca77aa909cb02bda167376f98f1a09aefe7","src/unix/bsd/netb=
sdlike/netbsd/x86_64.rs":"1afe5ef46b14397cdd68664b5b232e4f5b035b6db1d4cf411=
c899d51ebca9f30","src/unix/bsd/netbsdlike/openbsd/aarch64.rs":"dd91931d373b=
7ecaf6e2de25adadee10d16fa9b12c2cbacdff3eb291e1ba36af","src/unix/bsd/netbsdl=
ike/openbsd/arm.rs":"01580d261bc6447bb327a0d982181b7bdabfa066cee65a30373d3c=
ed729ad307","src/unix/bsd/netbsdlike/openbsd/mips64.rs":"8532a189ae10c7d668=
d9d4065da8b05d124e09bd39442c9f74a7f231c43eca48","src/unix/bsd/netbsdlike/op=
enbsd/mod.rs":"a1632c0ea40681a22c3fa5834e566b900704f619192b0d46dd8ac7568230=
d751","src/unix/bsd/netbsdlike/openbsd/powerpc.rs":"01580d261bc6447bb327a0d=
982181b7bdabfa066cee65a30373d3ced729ad307","src/unix/bsd/netbsdlike/openbsd=
/powerpc64.rs":"1dd5449dd1fd3d51e30ffdeeaece91d0aaf05c710e0ac699fecc5461cfa=
2c28e","src/unix/bsd/netbsdlike/openbsd/riscv64.rs":"1dd5449dd1fd3d51e30ffd=
eeaece91d0aaf05c710e0ac699fecc5461cfa2c28e","src/unix/bsd/netbsdlike/openbs=
d/sparc64.rs":"d04fd287afbaa2c5df9d48c94e8374a532a3ba491b424ddf018270c7312f=
4085","src/unix/bsd/netbsdlike/openbsd/x86.rs":"6f7f5c4fde2a2259eb547890cbd=
86570cea04ef85347d7569e94e679448bec87","src/unix/bsd/netbsdlike/openbsd/x86=
_64.rs":"d31db31630289c85af3339dbe357998a21ca584cbae31607448fe2cf7675a4e1",=
"src/unix/haiku/b32.rs":"a2efdbf7158a6da341e1db9176b0ab193ba88b449616239ed9=
5dced11f54d87b","src/unix/haiku/b64.rs":"ff8115367d3d7d354f792d6176dfaaa263=
53f57056197b563bf4681f91ff7985","src/unix/haiku/mod.rs":"1a0cda453016c0e119=
2d735b83471b0042a9c7b5a3b76ecf4a623536923a727c","src/unix/haiku/native.rs":=
"dbfcbf4954a79d1df2ff58e0590bbcb8c57dfc7a32392aa73ee4726b66bd6cc8","src/uni=
x/haiku/x86_64.rs":"3ec3aeeb7ed208b8916f3e32d42bfd085ff5e16936a1a35d9a52789=
f043b7237","src/unix/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae=
10ceccefeed9debb3bbe08777fc682","src/unix/hermit/mod.rs":"a1494a0bddf301cce=
b0d9b8529a84b5882fe855ceae77a1c4e8d6034e705e26c","src/unix/hermit/x86_64.rs=
":"ab832b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/u=
nix/linux_like/android/b32/arm.rs":"ce582de7e983a33d3bfad13075c53aac9016cee=
35f06ad8653ee9072c3ec2564","src/unix/linux_like/android/b32/mod.rs":"7c173e=
0375119bf06a3081652faede95e5bcd6858e7576b7533d037978737c8f","src/unix/linux=
_like/android/b32/x86/align.rs":"812914e4241df82e32b12375ca3374615dc3a4bdd4=
cf31f0423c5815320c0dab","src/unix/linux_like/android/b32/x86/mod.rs":"e6d10=
7efbcd37b5b85dfa18f683300cbf768ffa0237997a9fa52b184a53323ac","src/unix/linu=
x_like/android/b64/aarch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3ee2f=
af6fcae3770f9e505cddca35c7b","src/unix/linux_like/android/b64/aarch64/int12=
8.rs":"1735f6f5c56770d20dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de","s=
rc/unix/linux_like/android/b64/aarch64/mod.rs":"171f8c37a2d2e45065bd3547dfc=
ec70b02aa3da34cd99d259d150c753f620846","src/unix/linux_like/android/b64/mod=
.rs":"71e4fcbe952bfa4a5f9022f3972e906917b38f729b9d8ef57cd5d179104894ac","sr=
c/unix/linux_like/android/b64/riscv64/align.rs":"0bf138f84e5327d8339bcd4adf=
071a6832b516445e597552c82bbd881095e3a8","src/unix/linux_like/android/b64/ri=
scv64/mod.rs":"19d4bf2237c47127eba9144e0b82e995bc079315e719179a91813b0ae7b0=
e49d","src/unix/linux_like/android/b64/x86_64/align.rs":"7169d07a9fd4716f75=
12719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/androi=
d/b64/x86_64/mod.rs":"4ec2de11a9b65c4325b7b991f0b99a414975e0e61ba8668caca5d=
921e9b314d1","src/unix/linux_like/android/mod.rs":"e6536383a652e1a9a755d350=
c5a60c2abcadea03e9cdc92e3cf7f7229fe8e2a5","src/unix/linux_like/emscripten/a=
lign.rs":"86c95cbed7a7161b1f23ee06843e7b0e2340ad92b2cb86fe2a8ef3e0e8c36216"=
,"src/unix/linux_like/emscripten/mod.rs":"712c52856ee323b8057b9452e4ab484a0=
e652581a530b67c3db25e819919d718","src/unix/linux_like/emscripten/no_align.r=
s":"0128e4aa721a9902754828b61b5ec7d8a86619983ed1e0544a85d35b1051fad6","src/=
unix/linux_like/linux/align.rs":"28b2cd7c3eddc53c247aa11340da205d1d2e478f19=
9493d330c61e75ec16ee96","src/unix/linux_like/linux/arch/generic/mod.rs":"77=
8742250aa456cb94efe67a4f8d0213827d90ab74eb5074f9afb9a30e6ea71c","src/unix/l=
inux_like/linux/arch/mips/mod.rs":"60ace1dd76aa88d6b3b5e52fef4bec7881d45278=
0dfff635474067b512e03df1","src/unix/linux_like/linux/arch/mod.rs":"466a2962=
2e47c6c7f1500682b2eb17f5566dd81b322cd6348f0fdd355cec593a","src/unix/linux_l=
ike/linux/arch/powerpc/mod.rs":"bef6b7af9e5e2b4e5545c9c7e3e23a8b743277a0ed9=
5853e7eddc38e44299f02","src/unix/linux_like/linux/arch/sparc/mod.rs":"91593=
ec0440f1dd8f8e612028f432c44c14089286e2aca50e10511ab942db8c3","src/unix/linu=
x_like/linux/gnu/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec725195=
7315afa53a7b9f936","src/unix/linux_like/linux/gnu/b32/arm/align.rs":"6ec0eb=
3ee93f7ae99fd714b4deabfb5e97fbcefd8c26f5a45fb8e7150899cdeb","src/unix/linux=
_like/linux/gnu/b32/arm/mod.rs":"9ab3e97b579a9122690cd01026e14528862860346b=
700aafbb755a7e04054f7f","src/unix/linux_like/linux/gnu/b32/m68k/align.rs":"=
8faa92f77a9232c035418d45331774e64a9a841d99c91791570a203bf2b45bcb","src/unix=
/linux_like/linux/gnu/b32/m68k/mod.rs":"6aab7f1b864e9691d14aa7d389f717c4077=
b8eed72a7f11e3b8c7fef245e4046","src/unix/linux_like/linux/gnu/b32/mips/alig=
n.rs":"429fb5e005cb7143602d430098b6ebfb7d360685b194f333dfd587472ae954ee","s=
rc/unix/linux_like/linux/gnu/b32/mips/mod.rs":"6b9a5dac6f937ddc1453e808e3c4=
3502c87143332df9e43ac64fb8b1eda6c116","src/unix/linux_like/linux/gnu/b32/mo=
d.rs":"caade9dc8b7179711102da342819bdf330c42c796b4587d0ed419550dab2e9ad","s=
rc/unix/linux_like/linux/gnu/b32/powerpc.rs":"5c5d90326b54b57b98eff4745fe7a=
3fb02f053b2dc782241a73e807b491936a3","src/unix/linux_like/linux/gnu/b32/ris=
cv32/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd37543efe8662=
1b119","src/unix/linux_like/linux/gnu/b32/riscv32/mod.rs":"491a9a97cf712985=
b75d3ad714691ef60898d88c78bc386a6917de0a6774cc26","src/unix/linux_like/linu=
x/gnu/b32/sparc/align.rs":"21adbed27df73e2d1ed934aaf733a643003d7baf2bde9c48=
ea440895bcca6d41","src/unix/linux_like/linux/gnu/b32/sparc/mod.rs":"80894ee=
ce66e9348f45d1b07ad37c757ea694bbd10ed49d3f920b34e9f51a9a3","src/unix/linux_=
like/linux/gnu/b32/x86/align.rs":"e4bafdc4a519a7922a81b37a62bbfd1177a2f6208=
90eef8f1fbc47162e9eb413","src/unix/linux_like/linux/gnu/b32/x86/mod.rs":"c7=
03cc5e9de2dc31d9e5831bfb6f354d6e3518b2ae02263f68a9a70f1c0167e2","src/unix/l=
inux_like/linux/gnu/b64/aarch64/align.rs":"ea39d5fd8ca5a71314127d1e1f542bca=
34ac566eac9a95662076d91ea4bee548","src/unix/linux_like/linux/gnu/b64/aarch6=
4/ilp32.rs":"bf4611b737813deef6787babf6c01698605f3b75482269b8546318667bc68e=
29","src/unix/linux_like/linux/gnu/b64/aarch64/int128.rs":"1735f6f5c56770d2=
0dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linu=
x/gnu/b64/aarch64/lp64.rs":"11a950697fdda0258c6e37c6b13993348c8de4134105ed4=
faa79358e53175072","src/unix/linux_like/linux/gnu/b64/aarch64/mod.rs":"d7be=
998105fc2f6248b7fdfcedb5a0519122d28625fcfd5dccf72617fb30c45e","src/unix/lin=
ux_like/linux/gnu/b64/loongarch64/align.rs":"6616c38bf8cab53034dce9f968adae=
8fb7771334445a93876d000cfd08f117a8","src/unix/linux_like/linux/gnu/b64/loon=
garch64/mod.rs":"9c39dfc3843e72bd8dba21aa5ef2795411cd8a0004a0cfe79c9b9f89ab=
92eb55","src/unix/linux_like/linux/gnu/b64/mips64/align.rs":"7169d07a9fd471=
6f7512719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/li=
nux/gnu/b64/mips64/mod.rs":"628c410b9aaec3c8f43838a28616b577a1d6de60a9799b0=
9bb884d80281f96eb","src/unix/linux_like/linux/gnu/b64/mod.rs":"3c6555f30a7a=
8852757b31a542ea73fb6a16a6e27e838397e819278ad56e57a4","src/unix/linux_like/=
linux/gnu/b64/powerpc64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468=
cc1dc9df83f002f1268130d9","src/unix/linux_like/linux/gnu/b64/powerpc64/mod.=
rs":"c778a136f06c2ffeacea19fa14ce79b828f91b67a002dec5ce87289bae36234e","src=
/unix/linux_like/linux/gnu/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc=
0111beb3a22e58803f99cd37543efe86621b119","src/unix/linux_like/linux/gnu/b64=
/riscv64/mod.rs":"c8f07efc5ddd5d874f1ebc329cd6907818d132ac3e30f4f2a4b04be3f=
b388551","src/unix/linux_like/linux/gnu/b64/s390x.rs":"a2fd9277c2dcf76f7a16=
a3bcca745d5a9932c765c0dc2feb31c3641be25eb0aa","src/unix/linux_like/linux/gn=
u/b64/sparc64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83=
f002f1268130d9","src/unix/linux_like/linux/gnu/b64/sparc64/mod.rs":"e8047e9=
966a2b90063e0151a0278c54885e7b323286cf5ab55cbaf151fc772d3","src/unix/linux_=
like/linux/gnu/b64/x86_64/align.rs":"62e822478356db4a73b6bbd1b36d825b893939=
ab4b308ec11b0578bcc4b49769","src/unix/linux_like/linux/gnu/b64/x86_64/mod.r=
s":"891e595d33714b9883b92f0554d1d361fba2b6c3f6cac09a288252f44c6ec667","src/=
unix/linux_like/linux/gnu/b64/x86_64/not_x32.rs":"38f74ce15d9662ce4818815a2=
b87be1618d5e45f190f7e4db84ff3285b4421fb","src/unix/linux_like/linux/gnu/b64=
/x86_64/x32.rs":"b20218a11364a6dec87f96d6c0d8b19e660697ab09ad5ee0e9b3a9dafe=
daaebb","src/unix/linux_like/linux/gnu/mod.rs":"882859b4b1bcb8b7c2a6fb8da7a=
2d9a429341fe2baacd77ec1a234ba3addd444","src/unix/linux_like/linux/gnu/no_al=
ign.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25",=
"src/unix/linux_like/linux/mod.rs":"443d3384ed7f4c490c82871f288f8c8a95a7ab4=
3a41449e8f4d400b62093af92","src/unix/linux_like/linux/musl/b32/arm/align.rs=
":"3e8ac052c1043764776b54c93ba4260e061df998631737a897d9d47d54f7b80c","src/u=
nix/linux_like/linux/musl/b32/arm/mod.rs":"f5b217a93f99c2852f7fd1459f529798=
372fa7df84ee0cfd3d8cdd5b2021b8cf","src/unix/linux_like/linux/musl/b32/hexag=
on.rs":"226a8b64ce9c75abbbee6d2dceb0b44f7b6c750c4102ebd4d015194afee6666e","=
src/unix/linux_like/linux/musl/b32/mips/align.rs":"429fb5e005cb7143602d4300=
98b6ebfb7d360685b194f333dfd587472ae954ee","src/unix/linux_like/linux/musl/b=
32/mips/mod.rs":"16f614dd59695497a01b542deacd1669335678bdd0b14d16dde482fb5c=
4e02f4","src/unix/linux_like/linux/musl/b32/mod.rs":"31677597fd9544c4b1ec14=
77628288f6273fabbc06e38f33da862ad55f019ce1","src/unix/linux_like/linux/musl=
/b32/powerpc.rs":"80479a91d817ac2bce7cbd62d0c5d20a949fb28b0c41cb765604313db=
a36829e","src/unix/linux_like/linux/musl/b32/riscv32/align.rs":"efd2accf33b=
87de7c7547903359a5da896edc33cd6c719552c7474b60d4a5d48","src/unix/linux_like=
/linux/musl/b32/riscv32/mod.rs":"b857ccbc8f0fbc8a6a5959f3496a4fd5a9a1dd986c=
15c8e716f3e2902c25181c","src/unix/linux_like/linux/musl/b32/x86/align.rs":"=
08e77fbd7435d7dec2ff56932433bece3f02e47ce810f89004a275a86d39cbe1","src/unix=
/linux_like/linux/musl/b32/x86/mod.rs":"7a1586f77bb693f0b319ec720c35963da05=
6287fc42f8e2ccf1d5b2bcccf4fd6","src/unix/linux_like/linux/musl/b64/aarch64/=
align.rs":"6ba32725d24d7d8e6aa111f3b57aafa318f83b606abe96561329151829821133=
","src/unix/linux_like/linux/musl/b64/aarch64/int128.rs":"1735f6f5c56770d20=
dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux=
/musl/b64/aarch64/mod.rs":"31e75179cbb4e26425b3f5b052e358f593153da662884655=
e60801d852e55dc2","src/unix/linux_like/linux/musl/b64/mips64.rs":"9a5d29f66=
6332bb056d0e2951e9de989aa1dc016075f009db3f2f628e0cdda8c","src/unix/linux_li=
ke/linux/musl/b64/mod.rs":"884243eb5af7df963d858d5baf47e622b45f04e0ae701728=
b134e986191b614b","src/unix/linux_like/linux/musl/b64/powerpc64.rs":"455dc0=
ffa55afc1db6ffaf461f6f2a7b49d31658bfebe0bb4efac5967a6f956c","src/unix/linux=
_like/linux/musl/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a2=
2e58803f99cd37543efe86621b119","src/unix/linux_like/linux/musl/b64/riscv64/=
mod.rs":"42d4b6d36807f37759094a732a321080cccdf498b174d632cebba147051de294",=
"src/unix/linux_like/linux/musl/b64/s390x.rs":"508d083cca50ca91042f01a96189=
09e890b755287ea4c7885cdab0fc0d75e1b3","src/unix/linux_like/linux/musl/b64/x=
86_64/align.rs":"77309276ad7a42cbe59ca381f23590b7a143aded05555b34a5b307b808=
cbca6e","src/unix/linux_like/linux/musl/b64/x86_64/mod.rs":"7a877cd23b64be6=
6d28e6b8dddae32d59a88d69115637539daf19381f4e39330","src/unix/linux_like/lin=
ux/musl/mod.rs":"8965596cc33a032f7495c74d0d25ff9169e425491b36c4563b291e9f12=
e2a1b6","src/unix/linux_like/linux/no_align.rs":"1a754a4af299894a79835aa092=
d8322d301179e2b20609defd6bb4bc880e6b4a","src/unix/linux_like/linux/non_exha=
ustive.rs":"181a05bf94fdb911db83ce793b993bd6548a4115b306a7ef3c10f745a8fea3e=
9","src/unix/linux_like/linux/uclibc/align.rs":"9ed16138d8e439bd90930845a65=
eafa7ebd67366e6bf633936d44014f6e4c959","src/unix/linux_like/linux/uclibc/ar=
m/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f9=
36","src/unix/linux_like/linux/uclibc/arm/mod.rs":"50288ff9e411ab0966da2483=
8f2c2a5618021bc19c422a04f577b2979ef4081e","src/unix/linux_like/linux/uclibc=
/arm/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c8=
6653db25","src/unix/linux_like/linux/uclibc/mips/mips32/align.rs":"e4a3c27f=
e20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936","src/unix/linux_l=
ike/linux/uclibc/mips/mips32/mod.rs":"d0c4434e2bf813372c418a8f516c706cdccc9=
f7be2f0921b2207b0afdb66fe81","src/unix/linux_like/linux/uclibc/mips/mips32/=
no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653d=
b25","src/unix/linux_like/linux/uclibc/mips/mips64/align.rs":"a7bdcb18a37a2=
d91e64d5fad83ea3edc78f5412adb28f77ab077dbb26dd08b2d","src/unix/linux_like/l=
inux/uclibc/mips/mips64/mod.rs":"3f38ee6a4690b9d7594be20d216467a34d955f7653=
c2c8ce1e6147daeb53f1e0","src/unix/linux_like/linux/uclibc/mips/mips64/no_al=
ign.rs":"4a18e3875698c85229599225ac3401a2a40da87e77b2ad4ef47c6fcd5a24ed30",=
"src/unix/linux_like/linux/uclibc/mips/mod.rs":"a048fce1c2d9b1ad57305642e8a=
d05ca0f0c7e4753267a2e2d6b4fee5db3b072","src/unix/linux_like/linux/uclibc/mo=
d.rs":"1c3d25cddcfefa2bd17bdc81550826be31a08eef235e13f825f169a5029c8bca","s=
rc/unix/linux_like/linux/uclibc/no_align.rs":"3f28637046524618adaa1012e26cb=
7ffe94b9396e6b518cccdc69d59f274d709","src/unix/linux_like/linux/uclibc/x86_=
64/l4re.rs":"024eba5753e852dbdd212427351affe7e83f9916c1864bce414d7aa2618f19=
2e","src/unix/linux_like/linux/uclibc/x86_64/mod.rs":"196d03affbefb85716937=
c15904831e731eb222ee906e05e42102d639a8152ea","src/unix/linux_like/linux/ucl=
ibc/x86_64/other.rs":"42c3f71e58cabba373f6a55a623f3c31b85049eb64824c09c2b08=
2b3b2d6a0a8","src/unix/linux_like/mod.rs":"08fa4c19c184adc12c775f1bd494d1c3=
3131b0f48455498ce550a3c44ab4db24","src/unix/mod.rs":"13d0eb3b15294623bb3c08=
b45aea89b06f14860675f5e777670aae42a0cc43a9","src/unix/newlib/aarch64/mod.rs=
":"bac93836a9a57b2c710f32f852e92a4d11ad6759ab0fb6ad33e71d60e53278af","src/u=
nix/newlib/align.rs":"28aaf87fafbc6b312622719d472d8cf65f9e5467d15339df5f73e=
66d8502b28a","src/unix/newlib/arm/mod.rs":"cbba6b3e957eceb496806e60de8725a2=
3ff3fa0015983b4b4fa27b233732b526","src/unix/newlib/espidf/mod.rs":"816f235f=
4aa4baabba7f2606b31d0fdb03988c52194c966728de8690bf17299d","src/unix/newlib/=
generic.rs":"eab066d9f0a0f3eb53cc1073d01496bba0110989e1f6a59838afd19f870cd5=
99","src/unix/newlib/horizon/mod.rs":"7cc5cc120437421db139bfa6a90b18168cd30=
70bdd0f5be96d40fe4c996f3ca1","src/unix/newlib/mod.rs":"83aea4ee8783761323ca=
91eeba25afee9b9e91d9b5d37ca03fe179c88dc9cde1","src/unix/newlib/no_align.rs"=
:"e0743b2179495a9514bc3a4d1781e492878c4ec834ee0085d0891dd1712e82fb","src/un=
ix/newlib/powerpc/mod.rs":"0202ffd57caf75b6afa2c9717750ffb96e375ac33df0ae96=
09a3f831be393b67","src/unix/newlib/vita/mod.rs":"d7642da66c2e76cf37d367d622=
acb6e27e46a6dbd721e088e8028608b3488b6f","src/unix/no_align.rs":"c06e95373b9=
088266e0b14bba0954eef95f93fb2b01d951855e382d22de78e53","src/unix/nto/aarch6=
4.rs":"4709c9afdc8d583be876598e7c238499ee3e8da5bd2baa614d9c7dd414851555","s=
rc/unix/nto/mod.rs":"8b8f5d0e5251f5385849c554629e9320c0f7ddf37078a458cc8767=
a9214392e9","src/unix/nto/neutrino.rs":"62198d95ccc0fe7ece6f9d5c0b29fc22303=
ef458886efb5e09aad524eca2ab7b","src/unix/nto/x86_64.rs":"a3e18e93c2999da1cd=
7a6f748a4b60c07aefb73d8ea2aafec19a84cfb040bc8e","src/unix/redox/mod.rs":"28=
0397beced934ba8e83d10b15b81dfb2d344fce420649bc529a26e4001c00b9","src/unix/s=
olarish/compat.rs":"00f1ee3faec9da69204e42f025f6735dd13d894071a154425dcc43e=
cbdd06e7f","src/unix/solarish/illumos.rs":"cd93c2d84722bbf9933a92842a8998eb=
0b2afc962f50bc2546ad127b82809fa7","src/unix/solarish/mod.rs":"55ce4624745e3=
1ad226b47fde177a46176a89da3fa5030663673a115102471f9","src/unix/solarish/sol=
aris.rs":"41b350a89ddf01cd12a10f93640f92be53be0b0d976021cdc08da17bf3e72edf"=
,"src/unix/solarish/x86.rs":"e86e806df0caed72765040eaa2f3c883198d1aa9150854=
0adf9b7008c77f522e","src/unix/solarish/x86_64.rs":"ec2b01f194eb8a6a27133c57=
681da195a949e03098f3ea1e847227a9c09ef5fc","src/unix/solarish/x86_common.rs"=
:"ac869d9c3c95645c22460468391eb1982023c3a8e02b9e06a72e3aef3d5f1eac","src/vx=
works/aarch64.rs":"98f0afdc511cd02557e506c21fed6737585490a1dce7a9d4941d08c4=
37762b99","src/vxworks/arm.rs":"acb7968ce99fe3f4abdf39d98f8133d21a4fba435b8=
ef7084777cb181d788e88","src/vxworks/mod.rs":"e4edcbcf43a325e738c9465507594d=
0c87abf3f0e2b9b046c1425f8d44bdad0f","src/vxworks/powerpc.rs":"acb7968ce99fe=
3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788e88","src/vxworks/powerpc64=
.rs":"98f0afdc511cd02557e506c21fed6737585490a1dce7a9d4941d08c437762b99","sr=
c/vxworks/x86.rs":"552f007f38317620b23889cb7c49d1d115841252439060122f52f434=
fbc6e5ba","src/vxworks/x86_64.rs":"018d92be3ad628a129eff9f2f5dfbc0883d8b8e5=
f2fa917b900a7f98ed6b514a","src/wasi.rs":"09ee3b3348b212b050f6ca8ae008a28679=
ea44a375674307a4e7c9ca0d3ed7d5","src/windows/gnu/align.rs":"b2c13ec1b9f3b39=
a75c452c80c951dff9d0215e31d77e883b4502afb31794647","src/windows/gnu/mod.rs"=
:"3c8c7edb7cdf5d0c44af936db2a94869585c69dfabeef30571b4f4e38375767a","src/wi=
ndows/mod.rs":"a9a95e9ebc0102c334650607351d4d4dbaff0eaf7730eed1c8020d20e9bb=
ebfd","src/windows/msvc/mod.rs":"c068271e00fca6b62bc4bf44bcf142cfc38caeded9=
b6c4e01d1ceef3ccf986f4","src/xous.rs":"eb0675f25ba01f73072d2b70907fb8abb114=
8facefe5a20756c49250f3d65fae","tests/const_fn.rs":"cb75a1f0864f926aebe79118=
fc34d51a0d1ade2c20a394e7774c7e545f21f1f4"},"package":"2b00cc1c228a6782d0f07=
6e7b232802e0c5689d41bb5df366f2a6b6621cfdfe1"}
> \ No newline at end of file
> -+{"files":{"CONTRIBUTING.md":"bdc90b52cf803faac96e594069a86dd8ea150d5ba7=
fb3e6cadfc08dac4c7b0ce","Cargo.toml":"96bf2f6d97a370699fa12dba540978a01b5cd=
84dd72fe6cff8a7700744e8122e","LICENSE-APACHE":"62c7a1e35f56406896d7aa7ca52d=
0cc0d272ac022b5d2796e7d6905db8a3636a","LICENSE-MIT":"a8d47ff51ca256f56a8932=
dba07660672dbfe3004257ca8de708aac1415937a1","README.md":"776affa26b66843a2b=
4f1a1c8f88d92f6461b74568911450fea717e9db6f877b","build.rs":"104ceb079ec13f0=
6d440a348a07974ff5a18dca1f74b9c2fde7be9e3074c25e7","rustfmt.toml":"eaa2ea84=
fc1ba0359b77680804903e07bb38d257ab11986b95b158e460f787b2","src/fixed_width_=
ints.rs":"7f986e5f5e68d25ef04d386fd2f640e8be8f15427a8d4a458ea01d26b8dca0ca"=
,"src/fuchsia/aarch64.rs":"378776a9e40766154a54c94c2a7b4675b5c302a38e6e42da=
99e67bfbaee60e56","src/fuchsia/align.rs":"ae1cf8f011a99737eabeb14ffff768e60=
f13b13363d7646744dbb0f443dab3d6","src/fuchsia/mod.rs":"68d860865d8ccc6c4939=
48c781105e0901fc3312cfa1337f0092c0668706200a","src/fuchsia/no_align.rs":"30=
3f3f1b255e0088b5715094353cf00476131d8e94e6aebb3f469557771c8b8a","src/fuchsi=
a/x86_64.rs":"93a3632b5cf67d2a6bcb7dc0a558605252d5fe689e0f38d8aa2ec5852255a=
c87","src/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae10ceccefeed=
9debb3bbe08777fc682","src/hermit/mod.rs":"d3bfce41e4463d4be8020a2d063c9bfa8=
b665f45f1cc6cbf3163f5d01e7cb21f","src/hermit/x86_64.rs":"ab832b7524e5fb15c4=
9ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/lib.rs":"2411146154773=
9f3646f95bcb66c43f2ae679a727ff5938299434c522c02e458","src/macros.rs":"b457e=
b028b8e8ab3c24bb7292b874ad4e491edbb83594f6a3da024df5348c088","src/psp.rs":"=
dd31aabd46171d474ec5828372e28588935120e7355c90c105360d8fa9264c1c","src/sgx.=
rs":"16a95cdefc81c5ee00d8353a60db363c4cc3e0f75abcd5d0144723f2a306ed1b","src=
/solid/aarch64.rs":"a726e47f324adf73a4a0b67a2c183408d0cad105ae66acf36db37a4=
2ab7f8707","src/solid/arm.rs":"e39a4f74ebbef3b97b8c95758ad741123d84ed3eb48d=
9cf4f1f4872097fc27fe","src/solid/mod.rs":"5f4151dca5132e4b4e4c23ab9737e1285=
6dddbdc0ca3f7dbc004328ef3c8acde","src/switch.rs":"9da3dd39b3de45a7928789926=
e8572d00e1e11a39e6f7289a1349aadce90edba","src/unix/aix/mod.rs":"55a5280c0e5=
498c1632b2772a7846bce0a130dde61a7fd59220d7971f9084b56","src/unix/aix/powerp=
c64.rs":"8c471cf7e4604da9f640db1be68d918303b326744e36e6ee159114040401d2cf",=
"src/unix/align.rs":"2cdc7c826ef7ae61f5171c5ae8c445a743d86f1a7f2d9d7e4ceeec=
56d6874f65","src/unix/bsd/apple/b32/align.rs":"ec833a747866fe19ca2d9b4d3c9f=
f0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b32/mod.rs":"2546=
ad3eb6aecb95f916648bc63264117c92b4b4859532b34cb011e4c75a5a72","src/unix/bsd=
/apple/b64/aarch64/align.rs":"e8eb38d064b5fefec6f37d42873820a0483e7c758ed33=
6cc59a7155455ca89c9","src/unix/bsd/apple/b64/aarch64/mod.rs":"44c217a4f263a=
fe7a97435de9323d20a96c37836f899ca0925306d4b7e073c27","src/unix/bsd/apple/b6=
4/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e2=
6c","src/unix/bsd/apple/b64/mod.rs":"f5e278a1af7fb358891d1c9be4eb7e815aaca0=
c5cb738d0c3604ba2208a856f7","src/unix/bsd/apple/b64/x86_64/align.rs":"ec833=
a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/=
apple/b64/x86_64/mod.rs":"8c87c5855038aae5d433c8f5eb3b29b0a175879a0245342b3=
bfd83bdf4cfd936","src/unix/bsd/apple/long_array.rs":"3cf1f19b812e6d093c819d=
c65ce55b13491963e0780eda0d0bd1577603e81948","src/unix/bsd/apple/mod.rs":"52=
b90d584e771447c3608079681adbb32367267021d12f5eb5940b7646f16f4a","src/unix/b=
sd/freebsdlike/dragonfly/errno.rs":"8295b8bb0dfd38d2cdb4d9192cdeeb534cc6c3b=
208170e64615fa3e0edb3e578","src/unix/bsd/freebsdlike/dragonfly/mod.rs":"898=
6a8c79bcadfbdb58ec1a72e1aff8ce9b341c9392d7b0b7449bddf6db59058","src/unix/bs=
d/freebsdlike/freebsd/aarch64.rs":"6c8e216385f53a4bf5f171749b57602fc34a4e4b=
160a44ca31c058cb0c8a2126","src/unix/bsd/freebsdlike/freebsd/arm.rs":"59d6a6=
70eea562fb87686e243e0a84603d29a2028a3d4b3f99ccc01bd04d2f47","src/unix/bsd/f=
reebsdlike/freebsd/freebsd11/b64.rs":"9808d152c1196aa647f1b0f0cf84dac8c930d=
a7d7f897a44975545e3d9d17681","src/unix/bsd/freebsdlike/freebsd/freebsd11/mo=
d.rs":"fa83dcd4597c6621b95228d80ea6250c37136463300f80a9961a09bdab5e25c3","s=
rc/unix/bsd/freebsdlike/freebsd/freebsd12/b64.rs":"61cbe45f8499bedb168106b6=
86d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd=
/freebsd12/mod.rs":"c7c574d65a8408f6eee32bd5d0cc40e33e41c7e61d98d338609ae5b=
eec72f390","src/unix/bsd/freebsdlike/freebsd/freebsd12/x86_64.rs":"2df36a7f=
122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/fre=
ebsdlike/freebsd/freebsd13/b64.rs":"61cbe45f8499bedb168106b686d4f8239472f25=
c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd13/mod.=
rs":"834ec71df759e8d38489986b7720f1b296ca774c23c8034e2d9b02b9f55ab781","src=
/unix/bsd/freebsdlike/freebsd/freebsd13/x86_64.rs":"2df36a7f122f6d6e5753cfb=
4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/freebsdlike/freebs=
d/freebsd14/b64.rs":"61cbe45f8499bedb168106b686d4f8239472f25c7553b069eec2af=
e197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd14/mod.rs":"58b7766136=
a22ace828c974f34240eb38feec2c8aa2ee8b6ca38e3b44a6fa348","src/unix/bsd/freeb=
sdlike/freebsd/freebsd14/x86_64.rs":"2df36a7f122f6d6e5753cfb4d22e915cc80f6b=
c91c0161b3daae55a481bfd052","src/unix/bsd/freebsdlike/freebsd/mod.rs":"cbfb=
50eeca94674f3e51992ab41cb020127d9405002eacf4b8bf7b2a0418f2ea","src/unix/bsd=
/freebsdlike/freebsd/powerpc.rs":"9ca3f82f88974e6db5569f2d76a5a3749b248a317=
47a6c0da5820492bdfeca42","src/unix/bsd/freebsdlike/freebsd/powerpc64.rs":"2=
dae3ecc87eac3b11657aa98915def55fc4b5c0de11fe26aae23329a54628a9a","src/unix/=
bsd/freebsdlike/freebsd/riscv64.rs":"fa4bed4c58cad24ba3395941c7fa6b11e08955=
1a04714f9561078e400f5b2b62","src/unix/bsd/freebsdlike/freebsd/x86.rs":"c500=
5e3249eb7c93cfbac72a9e9272320d80ce7983da990ceb05a447f59a02c5","src/unix/bsd=
/freebsdlike/freebsd/x86_64/align.rs":"0e1f69a88fca1c32874b1daf5db3d446fefb=
e518dca497f096cc9168c39dde70","src/unix/bsd/freebsdlike/freebsd/x86_64/mod.=
rs":"51e4dd0c8ae247bb652feda5adad9333ea3bb30c750c3a3935e0b0e47d7803eb","src=
/unix/bsd/freebsdlike/mod.rs":"f5ebb2f36dffd9c897b18b168cf28fbff9cc68983ae2=
d4910cb1ba9764693381","src/unix/bsd/mod.rs":"0c672b075b5616fca2cc56c00ee31c=
3f554dcbd2e88a7c2ba1437aa6e5604319","src/unix/bsd/netbsdlike/mod.rs":"0a66f=
7de43710e35a6a546e6c39066aa8b91a6efadb71db88738b0a577fd5537","src/unix/bsd/=
netbsdlike/netbsd/aarch64.rs":"65dcb58d11e8d8028401a9d07ca3eb4cb4f053e04249=
cc877353449d84ccc4cb","src/unix/bsd/netbsdlike/netbsd/arm.rs":"58cdbb70b0d6=
f536551f0f3bb3725d2d75c4690db12c26c034e7d6ec4a924452","src/unix/bsd/netbsdl=
ike/netbsd/mod.rs":"4493317993af390d8aafc2cb7ace4c349dfc9d2451fd666844f04a4=
fa1f47442","src/unix/bsd/netbsdlike/netbsd/powerpc.rs":"ee7ff5d89d0ed22f531=
237b5059aa669df93a3b5c489fa641465ace8d405bf41","src/unix/bsd/netbsdlike/net=
bsd/sparc64.rs":"9489f4b3e4566f43bb12dfb92238960613dac7f6a45cc13068a8d152b9=
02d7d9","src/unix/bsd/netbsdlike/netbsd/x86.rs":"20692320e36bfe028d1a34d16f=
e12ca77aa909cb02bda167376f98f1a09aefe7","src/unix/bsd/netbsdlike/netbsd/x86=
_64.rs":"1afe5ef46b14397cdd68664b5b232e4f5b035b6db1d4cf411c899d51ebca9f30",=
"src/unix/bsd/netbsdlike/openbsd/aarch64.rs":"dd91931d373b7ecaf6e2de25adade=
e10d16fa9b12c2cbacdff3eb291e1ba36af","src/unix/bsd/netbsdlike/openbsd/arm.r=
s":"01580d261bc6447bb327a0d982181b7bdabfa066cee65a30373d3ced729ad307","src/=
unix/bsd/netbsdlike/openbsd/mips64.rs":"8532a189ae10c7d668d9d4065da8b05d124=
e09bd39442c9f74a7f231c43eca48","src/unix/bsd/netbsdlike/openbsd/mod.rs":"c0=
f06c4af4dd3169b8bcd13a2fb7be6ac9dfa901e11bfd22058fff2aa6caed2e","src/unix/b=
sd/netbsdlike/openbsd/powerpc.rs":"01580d261bc6447bb327a0d982181b7bdabfa066=
cee65a30373d3ced729ad307","src/unix/bsd/netbsdlike/openbsd/powerpc64.rs":"1=
dd5449dd1fd3d51e30ffdeeaece91d0aaf05c710e0ac699fecc5461cfa2c28e","src/unix/=
bsd/netbsdlike/openbsd/riscv64.rs":"1dd5449dd1fd3d51e30ffdeeaece91d0aaf05c7=
10e0ac699fecc5461cfa2c28e","src/unix/bsd/netbsdlike/openbsd/sparc64.rs":"d0=
4fd287afbaa2c5df9d48c94e8374a532a3ba491b424ddf018270c7312f4085","src/unix/b=
sd/netbsdlike/openbsd/x86.rs":"6f7f5c4fde2a2259eb547890cbd86570cea04ef85347=
d7569e94e679448bec87","src/unix/bsd/netbsdlike/openbsd/x86_64.rs":"d31db316=
30289c85af3339dbe357998a21ca584cbae31607448fe2cf7675a4e1","src/unix/haiku/b=
32.rs":"a2efdbf7158a6da341e1db9176b0ab193ba88b449616239ed95dced11f54d87b","=
src/unix/haiku/b64.rs":"ff8115367d3d7d354f792d6176dfaaa26353f57056197b563bf=
4681f91ff7985","src/unix/haiku/mod.rs":"0b5a77da05582896e680e236ddd3d813a7b=
8a2ecfde21c1b72ec17883e2de6a7","src/unix/haiku/native.rs":"dbfcbf4954a79d1d=
f2ff58e0590bbcb8c57dfc7a32392aa73ee4726b66bd6cc8","src/unix/haiku/x86_64.rs=
":"3ec3aeeb7ed208b8916f3e32d42bfd085ff5e16936a1a35d9a52789f043b7237","src/u=
nix/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae10ceccefeed9debb3=
bbe08777fc682","src/unix/hermit/mod.rs":"a1494a0bddf301cceb0d9b8529a84b5882=
fe855ceae77a1c4e8d6034e705e26c","src/unix/hermit/x86_64.rs":"ab832b7524e5fb=
15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/unix/linux_like/an=
droid/b32/arm.rs":"ce582de7e983a33d3bfad13075c53aac9016cee35f06ad8653ee9072=
c3ec2564","src/unix/linux_like/android/b32/mod.rs":"7c173e0375119bf06a30816=
52faede95e5bcd6858e7576b7533d037978737c8f","src/unix/linux_like/android/b32=
/x86/align.rs":"812914e4241df82e32b12375ca3374615dc3a4bdd4cf31f0423c5815320=
c0dab","src/unix/linux_like/android/b32/x86/mod.rs":"e6d107efbcd37b5b85dfa1=
8f683300cbf768ffa0237997a9fa52b184a53323ac","src/unix/linux_like/android/b6=
4/aarch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3ee2faf6fcae3770f9e505=
cddca35c7b","src/unix/linux_like/android/b64/aarch64/int128.rs":"1735f6f5c5=
6770d20dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_lik=
e/android/b64/aarch64/mod.rs":"171f8c37a2d2e45065bd3547dfcec70b02aa3da34cd9=
9d259d150c753f620846","src/unix/linux_like/android/b64/mod.rs":"71e4fcbe952=
bfa4a5f9022f3972e906917b38f729b9d8ef57cd5d179104894ac","src/unix/linux_like=
/android/b64/riscv64/align.rs":"0bf138f84e5327d8339bcd4adf071a6832b516445e5=
97552c82bbd881095e3a8","src/unix/linux_like/android/b64/riscv64/mod.rs":"19=
d4bf2237c47127eba9144e0b82e995bc079315e719179a91813b0ae7b0e49d","src/unix/l=
inux_like/android/b64/x86_64/align.rs":"7169d07a9fd4716f7512719aec9fda5d8be=
d306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/android/b64/x86_64/mod.=
rs":"4ec2de11a9b65c4325b7b991f0b99a414975e0e61ba8668caca5d921e9b314d1","src=
/unix/linux_like/android/mod.rs":"21b1b70c1d398bd342794376b41975bfe3daf7512=
7c7a11d825cc4b839811153","src/unix/linux_like/emscripten/align.rs":"86c95cb=
ed7a7161b1f23ee06843e7b0e2340ad92b2cb86fe2a8ef3e0e8c36216","src/unix/linux_=
like/emscripten/mod.rs":"712c52856ee323b8057b9452e4ab484a0e652581a530b67c3d=
b25e819919d718","src/unix/linux_like/emscripten/no_align.rs":"0128e4aa721a9=
902754828b61b5ec7d8a86619983ed1e0544a85d35b1051fad6","src/unix/linux_like/l=
inux/align.rs":"28b2cd7c3eddc53c247aa11340da205d1d2e478f199493d330c61e75ec1=
6ee96","src/unix/linux_like/linux/arch/generic/mod.rs":"249387e62ce11dfe5a9=
3652699df6e5d8d29311d70d7a0e58fc1298a2ac8d750","src/unix/linux_like/linux/a=
rch/mips/mod.rs":"2d166054a586bb4bf6e4a4ba35f7574907b217225eff8f1a43adc4277=
e142460","src/unix/linux_like/linux/arch/mod.rs":"466a29622e47c6c7f1500682b=
2eb17f5566dd81b322cd6348f0fdd355cec593a","src/unix/linux_like/linux/arch/po=
werpc/mod.rs":"3f6da7b0fa7b394c7d4eea2bb3caa7a7729ab0d6c1491fef02206a912c41=
b815","src/unix/linux_like/linux/arch/sparc/mod.rs":"91593ec0440f1dd8f8e612=
028f432c44c14089286e2aca50e10511ab942db8c3","src/unix/linux_like/linux/gnu/=
align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936=
","src/unix/linux_like/linux/gnu/b32/arm/align.rs":"6ec0eb3ee93f7ae99fd714b=
4deabfb5e97fbcefd8c26f5a45fb8e7150899cdeb","src/unix/linux_like/linux/gnu/b=
32/arm/mod.rs":"45be81a806c55fed92c20a33c5e4cfb23b3933f7b4feff47db33d37dda3=
4e6d3","src/unix/linux_like/linux/gnu/b32/m68k/align.rs":"8faa92f77a9232c03=
5418d45331774e64a9a841d99c91791570a203bf2b45bcb","src/unix/linux_like/linux=
/gnu/b32/m68k/mod.rs":"6aab7f1b864e9691d14aa7d389f717c4077b8eed72a7f11e3b8c=
7fef245e4046","src/unix/linux_like/linux/gnu/b32/mips/align.rs":"429fb5e005=
cb7143602d430098b6ebfb7d360685b194f333dfd587472ae954ee","src/unix/linux_lik=
e/linux/gnu/b32/mips/mod.rs":"6b9a5dac6f937ddc1453e808e3c43502c87143332df9e=
43ac64fb8b1eda6c116","src/unix/linux_like/linux/gnu/b32/mod.rs":"caade9dc8b=
7179711102da342819bdf330c42c796b4587d0ed419550dab2e9ad","src/unix/linux_lik=
e/linux/gnu/b32/powerpc.rs":"5c5d90326b54b57b98eff4745fe7a3fb02f053b2dc7822=
41a73e807b491936a3","src/unix/linux_like/linux/gnu/b32/riscv32/align.rs":"d=
321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd37543efe86621b119","src/unix/=
linux_like/linux/gnu/b32/riscv32/mod.rs":"ca8bc84fff8c65ecda6c03421f4fe7689=
f199dce39f1ca382a45bf0b13a1cb00","src/unix/linux_like/linux/gnu/b32/sparc/a=
lign.rs":"21adbed27df73e2d1ed934aaf733a643003d7baf2bde9c48ea440895bcca6d41"=
,"src/unix/linux_like/linux/gnu/b32/sparc/mod.rs":"80894eece66e9348f45d1b07=
ad37c757ea694bbd10ed49d3f920b34e9f51a9a3","src/unix/linux_like/linux/gnu/b3=
2/x86/align.rs":"e4bafdc4a519a7922a81b37a62bbfd1177a2f620890eef8f1fbc47162e=
9eb413","src/unix/linux_like/linux/gnu/b32/x86/mod.rs":"c703cc5e9de2dc31d9e=
5831bfb6f354d6e3518b2ae02263f68a9a70f1c0167e2","src/unix/linux_like/linux/g=
nu/b64/aarch64/align.rs":"ea39d5fd8ca5a71314127d1e1f542bca34ac566eac9a95662=
076d91ea4bee548","src/unix/linux_like/linux/gnu/b64/aarch64/ilp32.rs":"bf46=
11b737813deef6787babf6c01698605f3b75482269b8546318667bc68e29","src/unix/lin=
ux_like/linux/gnu/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426442f09724d9=
b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/gnu/b64/aarch64=
/lp64.rs":"11a950697fdda0258c6e37c6b13993348c8de4134105ed4faa79358e53175072=
","src/unix/linux_like/linux/gnu/b64/aarch64/mod.rs":"d7be998105fc2f6248b7f=
dfcedb5a0519122d28625fcfd5dccf72617fb30c45e","src/unix/linux_like/linux/gnu=
/b64/loongarch64/align.rs":"6616c38bf8cab53034dce9f968adae8fb7771334445a938=
76d000cfd08f117a8","src/unix/linux_like/linux/gnu/b64/loongarch64/mod.rs":"=
9c39dfc3843e72bd8dba21aa5ef2795411cd8a0004a0cfe79c9b9f89ab92eb55","src/unix=
/linux_like/linux/gnu/b64/mips64/align.rs":"7169d07a9fd4716f7512719aec9fda5=
d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/linux/gnu/b64/mips6=
4/mod.rs":"628c410b9aaec3c8f43838a28616b577a1d6de60a9799b09bb884d80281f96eb=
","src/unix/linux_like/linux/gnu/b64/mod.rs":"3c6555f30a7a8852757b31a542ea7=
3fb6a16a6e27e838397e819278ad56e57a4","src/unix/linux_like/linux/gnu/b64/pow=
erpc64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f12=
68130d9","src/unix/linux_like/linux/gnu/b64/powerpc64/mod.rs":"c778a136f06c=
2ffeacea19fa14ce79b828f91b67a002dec5ce87289bae36234e","src/unix/linux_like/=
linux/gnu/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803=
f99cd37543efe86621b119","src/unix/linux_like/linux/gnu/b64/riscv64/mod.rs":=
"88bde5520c86793f2cf97062d66c1b3f4dd66206c453a601ebf9110d90abc6f8","src/uni=
x/linux_like/linux/gnu/b64/s390x.rs":"a2fd9277c2dcf76f7a16a3bcca745d5a9932c=
765c0dc2feb31c3641be25eb0aa","src/unix/linux_like/linux/gnu/b64/sparc64/ali=
gn.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268130d9","=
src/unix/linux_like/linux/gnu/b64/sparc64/mod.rs":"e8047e9966a2b90063e0151a=
0278c54885e7b323286cf5ab55cbaf151fc772d3","src/unix/linux_like/linux/gnu/b6=
4/x86_64/align.rs":"62e822478356db4a73b6bbd1b36d825b893939ab4b308ec11b0578b=
cc4b49769","src/unix/linux_like/linux/gnu/b64/x86_64/mod.rs":"891e595d33714=
b9883b92f0554d1d361fba2b6c3f6cac09a288252f44c6ec667","src/unix/linux_like/l=
inux/gnu/b64/x86_64/not_x32.rs":"38f74ce15d9662ce4818815a2b87be1618d5e45f19=
0f7e4db84ff3285b4421fb","src/unix/linux_like/linux/gnu/b64/x86_64/x32.rs":"=
b20218a11364a6dec87f96d6c0d8b19e660697ab09ad5ee0e9b3a9dafedaaebb","src/unix=
/linux_like/linux/gnu/mod.rs":"daf0eff7fddf6d7a2c15a5bc89e3a0dfe463a40f3888=
0fe3fb444105d0ae0f07","src/unix/linux_like/linux/gnu/no_align.rs":"9cd22313=
5de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/linux_l=
ike/linux/mod.rs":"f305c518fc8ef7e151b22a93d23ad304d1302e71ae7082b0c3676d54=
09ad6646","src/unix/linux_like/linux/musl/b32/arm/align.rs":"3e8ac052c10437=
64776b54c93ba4260e061df998631737a897d9d47d54f7b80c","src/unix/linux_like/li=
nux/musl/b32/arm/mod.rs":"923159f09820a7e3ca2340ef6adb4f3779ebfa9320a1f6a41=
027529d81d5f699","src/unix/linux_like/linux/musl/b32/hexagon.rs":"5625a3dfc=
d8fae8c43e6306172dd0c2f7ace8ce9a43a2c03909aef35d96cdaa8","src/unix/linux_li=
ke/linux/musl/b32/mips/align.rs":"429fb5e005cb7143602d430098b6ebfb7d360685b=
194f333dfd587472ae954ee","src/unix/linux_like/linux/musl/b32/mips/mod.rs":"=
bb5f45dd376e928a22282e1696989399b0e8d0a5fbc8309bb4238926d81e61e7","src/unix=
/linux_like/linux/musl/b32/mod.rs":"31677597fd9544c4b1ec1477628288f6273fabb=
c06e38f33da862ad55f019ce1","src/unix/linux_like/linux/musl/b32/powerpc.rs":=
"f23491f21f3eeac3e05a76b466567ea633b92a4830ab8b401cbb31c74ad1acab","src/uni=
x/linux_like/linux/musl/b32/riscv32/align.rs":"efd2accf33b87de7c7547903359a=
5da896edc33cd6c719552c7474b60d4a5d48","src/unix/linux_like/linux/musl/b32/r=
iscv32/mod.rs":"b857ccbc8f0fbc8a6a5959f3496a4fd5a9a1dd986c15c8e716f3e2902c2=
5181c","src/unix/linux_like/linux/musl/b32/x86/align.rs":"08e77fbd7435d7dec=
2ff56932433bece3f02e47ce810f89004a275a86d39cbe1","src/unix/linux_like/linux=
/musl/b32/x86/mod.rs":"5e58f759df421b4473f229da417cd5da080226afc0006d71d5dd=
578c62e27a50","src/unix/linux_like/linux/musl/b64/aarch64/align.rs":"6ba327=
25d24d7d8e6aa111f3b57aafa318f83b606abe96561329151829821133","src/unix/linux=
_like/linux/musl/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426442f09724d9b=
2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/musl/b64/aarch64=
/mod.rs":"31e75179cbb4e26425b3f5b052e358f593153da662884655e60801d852e55dc2"=
,"src/unix/linux_like/linux/musl/b64/mips64.rs":"9a5d29f666332bb056d0e2951e=
9de989aa1dc016075f009db3f2f628e0cdda8c","src/unix/linux_like/linux/musl/b64=
/mod.rs":"c349ade36cca16273918124d206493a2f8d0d3ecf359b80ae7ec0317c7ee5c98"=
,"src/unix/linux_like/linux/musl/b64/powerpc64.rs":"455dc0ffa55afc1db6ffaf4=
61f6f2a7b49d31658bfebe0bb4efac5967a6f956c","src/unix/linux_like/linux/musl/=
b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd37543=
efe86621b119","src/unix/linux_like/linux/musl/b64/riscv64/mod.rs":"42d4b6d3=
6807f37759094a732a321080cccdf498b174d632cebba147051de294","src/unix/linux_l=
ike/linux/musl/b64/s390x.rs":"d8a4fdfea0960ec284cae4facb8b0fb342e8aa41544cf=
facdcaf08c5a92a43f8","src/unix/linux_like/linux/musl/b64/x86_64/align.rs":"=
77309276ad7a42cbe59ca381f23590b7a143aded05555b34a5b307b808cbca6e","src/unix=
/linux_like/linux/musl/b64/x86_64/mod.rs":"7a877cd23b64be66d28e6b8dddae32d5=
9a88d69115637539daf19381f4e39330","src/unix/linux_like/linux/musl/mod.rs":"=
46b47255dd8ce2ae32443267f5f334e2e72341d58615edf50611218506a08082","src/unix=
/linux_like/linux/no_align.rs":"1a754a4af299894a79835aa092d8322d301179e2b20=
609defd6bb4bc880e6b4a","src/unix/linux_like/linux/non_exhaustive.rs":"181a0=
5bf94fdb911db83ce793b993bd6548a4115b306a7ef3c10f745a8fea3e9","src/unix/linu=
x_like/linux/uclibc/align.rs":"9ed16138d8e439bd90930845a65eafa7ebd67366e6bf=
633936d44014f6e4c959","src/unix/linux_like/linux/uclibc/arm/align.rs":"e4a3=
c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936","src/unix/lin=
ux_like/linux/uclibc/arm/mod.rs":"50288ff9e411ab0966da24838f2c2a5618021bc19=
c422a04f577b2979ef4081e","src/unix/linux_like/linux/uclibc/arm/no_align.rs"=
:"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/un=
ix/linux_like/linux/uclibc/mips/mips32/align.rs":"e4a3c27fe20a57b8d612c34cb=
05bc70646edb5cec7251957315afa53a7b9f936","src/unix/linux_like/linux/uclibc/=
mips/mips32/mod.rs":"d0c4434e2bf813372c418a8f516c706cdccc9f7be2f0921b2207b0=
afdb66fe81","src/unix/linux_like/linux/uclibc/mips/mips32/no_align.rs":"9cd=
223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/li=
nux_like/linux/uclibc/mips/mips64/align.rs":"a7bdcb18a37a2d91e64d5fad83ea3e=
dc78f5412adb28f77ab077dbb26dd08b2d","src/unix/linux_like/linux/uclibc/mips/=
mips64/mod.rs":"3f38ee6a4690b9d7594be20d216467a34d955f7653c2c8ce1e6147daeb5=
3f1e0","src/unix/linux_like/linux/uclibc/mips/mips64/no_align.rs":"4a18e387=
5698c85229599225ac3401a2a40da87e77b2ad4ef47c6fcd5a24ed30","src/unix/linux_l=
ike/linux/uclibc/mips/mod.rs":"a048fce1c2d9b1ad57305642e8ad05ca0f0c7e475326=
7a2e2d6b4fee5db3b072","src/unix/linux_like/linux/uclibc/mod.rs":"1c3d25cddc=
fefa2bd17bdc81550826be31a08eef235e13f825f169a5029c8bca","src/unix/linux_lik=
e/linux/uclibc/no_align.rs":"3f28637046524618adaa1012e26cb7ffe94b9396e6b518=
cccdc69d59f274d709","src/unix/linux_like/linux/uclibc/x86_64/l4re.rs":"024e=
ba5753e852dbdd212427351affe7e83f9916c1864bce414d7aa2618f192e","src/unix/lin=
ux_like/linux/uclibc/x86_64/mod.rs":"196d03affbefb85716937c15904831e731eb22=
2ee906e05e42102d639a8152ea","src/unix/linux_like/linux/uclibc/x86_64/other.=
rs":"42c3f71e58cabba373f6a55a623f3c31b85049eb64824c09c2b082b3b2d6a0a8","src=
/unix/linux_like/mod.rs":"adfa87d7f8790795f22576ab9b7064f7d0085b539d24d8223=
275e66edbab320d","src/unix/mod.rs":"362da723eaad726ae72664d801315f4cf70a042=
250de1231761bfd12390e27b8","src/unix/newlib/aarch64/mod.rs":"bac93836a9a57b=
2c710f32f852e92a4d11ad6759ab0fb6ad33e71d60e53278af","src/unix/newlib/align.=
rs":"28aaf87fafbc6b312622719d472d8cf65f9e5467d15339df5f73e66d8502b28a","src=
/unix/newlib/arm/mod.rs":"cbba6b3e957eceb496806e60de8725a23ff3fa0015983b4b4=
fa27b233732b526","src/unix/newlib/espidf/mod.rs":"816f235f4aa4baabba7f2606b=
31d0fdb03988c52194c966728de8690bf17299d","src/unix/newlib/generic.rs":"eab0=
66d9f0a0f3eb53cc1073d01496bba0110989e1f6a59838afd19f870cd599","src/unix/new=
lib/horizon/mod.rs":"7cc5cc120437421db139bfa6a90b18168cd3070bdd0f5be96d40fe=
4c996f3ca1","src/unix/newlib/mod.rs":"fcf8b307933cba5e9c485537499386326d665=
fe83b6fcfb9e9e1837f73332668","src/unix/newlib/no_align.rs":"e0743b2179495a9=
514bc3a4d1781e492878c4ec834ee0085d0891dd1712e82fb","src/unix/newlib/powerpc=
/mod.rs":"0202ffd57caf75b6afa2c9717750ffb96e375ac33df0ae9609a3f831be393b67"=
,"src/unix/no_align.rs":"c06e95373b9088266e0b14bba0954eef95f93fb2b01d951855=
e382d22de78e53","src/unix/nto/aarch64.rs":"4709c9afdc8d583be876598e7c238499=
ee3e8da5bd2baa614d9c7dd414851555","src/unix/nto/mod.rs":"44b74cd89794aecd7d=
b67aad1c4114273f70be8d2e4633e3965f144fe53a7b88","src/unix/nto/neutrino.rs":=
"62198d95ccc0fe7ece6f9d5c0b29fc22303ef458886efb5e09aad524eca2ab7b","src/uni=
x/nto/x86_64.rs":"a3e18e93c2999da1cd7a6f748a4b60c07aefb73d8ea2aafec19a84cfb=
040bc8e","src/unix/redox/mod.rs":"c8afea39f81e73ad4e9bf8a8f25138a200e616048=
e189debad80a6b7e08f710f","src/unix/solarish/compat.rs":"00f1ee3faec9da69204=
e42f025f6735dd13d894071a154425dcc43ecbdd06e7f","src/unix/solarish/illumos.r=
s":"cd93c2d84722bbf9933a92842a8998eb0b2afc962f50bc2546ad127b82809fa7","src/=
unix/solarish/mod.rs":"6442ed05eb390d44a03daa9800af1030f2ee3e61db98675262c2=
27b28de51937","src/unix/solarish/solaris.rs":"41b350a89ddf01cd12a10f93640f9=
2be53be0b0d976021cdc08da17bf3e72edf","src/unix/solarish/x86.rs":"e86e806df0=
caed72765040eaa2f3c883198d1aa91508540adf9b7008c77f522e","src/unix/solarish/=
x86_64.rs":"ec2b01f194eb8a6a27133c57681da195a949e03098f3ea1e847227a9c09ef5f=
c","src/unix/solarish/x86_common.rs":"ac869d9c3c95645c22460468391eb1982023c=
3a8e02b9e06a72e3aef3d5f1eac","src/vxworks/aarch64.rs":"98f0afdc511cd02557e5=
06c21fed6737585490a1dce7a9d4941d08c437762b99","src/vxworks/arm.rs":"acb7968=
ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788e88","src/vxworks/mod=
.rs":"ff063860fc4fe3bca6332742764e29c1506884added21aa7722144c1fb3f4018","sr=
c/vxworks/powerpc.rs":"acb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777=
cb181d788e88","src/vxworks/powerpc64.rs":"98f0afdc511cd02557e506c21fed67375=
85490a1dce7a9d4941d08c437762b99","src/vxworks/x86.rs":"552f007f38317620b238=
89cb7c49d1d115841252439060122f52f434fbc6e5ba","src/vxworks/x86_64.rs":"018d=
92be3ad628a129eff9f2f5dfbc0883d8b8e5f2fa917b900a7f98ed6b514a","src/wasi.rs"=
:"09ee3b3348b212b050f6ca8ae008a28679ea44a375674307a4e7c9ca0d3ed7d5","src/wi=
ndows/gnu/align.rs":"b2c13ec1b9f3b39a75c452c80c951dff9d0215e31d77e883b4502a=
fb31794647","src/windows/gnu/mod.rs":"3c8c7edb7cdf5d0c44af936db2a94869585c6=
9dfabeef30571b4f4e38375767a","src/windows/mod.rs":"5421b92f47cb69845f4323b1=
a14e533d8a17acc6412c58e67f4d41def749de2f","src/windows/msvc/mod.rs":"c06827=
1e00fca6b62bc4bf44bcf142cfc38caeded9b6c4e01d1ceef3ccf986f4","src/xous.rs":"=
eb0675f25ba01f73072d2b70907fb8abb1148facefe5a20756c49250f3d65fae","tests/co=
nst_fn.rs":"cb75a1f0864f926aebe79118fc34d51a0d1ade2c20a394e7774c7e545f21f1f=
4"},"package":"99227334921fae1a979cf0bfdfcc6b3e5ce376ef57e16fb6fb3ea2ed6095=
f80c"}
> ++{"files":{"CONTRIBUTING.md":"bdc90b52cf803faac96e594069a86dd8ea150d5ba7=
fb3e6cadfc08dac4c7b0ce","Cargo.toml":"bcbcb2d5d0952786b470930f12a959168ba4b=
5e5a0c5185beb032c8ea20a719b","LICENSE-APACHE":"62c7a1e35f56406896d7aa7ca52d=
0cc0d272ac022b5d2796e7d6905db8a3636a","LICENSE-MIT":"a8d47ff51ca256f56a8932=
dba07660672dbfe3004257ca8de708aac1415937a1","README.md":"776affa26b66843a2b=
4f1a1c8f88d92f6461b74568911450fea717e9db6f877b","build.rs":"5bd78d7e4e79b18=
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
.rs":"54229b5e774669c16912112e8b50fa938db76f534971222a11723a05195a0948","sr=
c/unix/aix/powerpc64.rs":"cf374d81139d45f9d77c6a764f640bfbf7e0a5903689652c8=
296f8e10d55169b","src/unix/align.rs":"2cdc7c826ef7ae61f5171c5ae8c445a743d86=
f1a7f2d9d7e4ceeec56d6874f65","src/unix/bsd/apple/b32/align.rs":"ec833a74786=
6fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/=
b32/mod.rs":"2546ad3eb6aecb95f916648bc63264117c92b4b4859532b34cb011e4c75a5a=
72","src/unix/bsd/apple/b64/aarch64/align.rs":"e8eb38d064b5fefec6f37d428738=
20a0483e7c758ed336cc59a7155455ca89c9","src/unix/bsd/apple/b64/aarch64/mod.r=
s":"44c217a4f263afe7a97435de9323d20a96c37836f899ca0925306d4b7e073c27","src/=
unix/bsd/apple/b64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0=
d15fa68884c40b0e26c","src/unix/bsd/apple/b64/mod.rs":"f5e278a1af7fb358891d1=
c9be4eb7e815aaca0c5cb738d0c3604ba2208a856f7","src/unix/bsd/apple/b64/x86_64=
/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26=
c","src/unix/bsd/apple/b64/x86_64/mod.rs":"8c87c5855038aae5d433c8f5eb3b29b0=
a175879a0245342b3bfd83bdf4cfd936","src/unix/bsd/apple/long_array.rs":"3cf1f=
19b812e6d093c819dc65ce55b13491963e0780eda0d0bd1577603e81948","src/unix/bsd/=
apple/mod.rs":"7ffbd4a92cdee46bc7fcd2a102d33d5acc5ba2df9a65030b5cfb7876885d=
1def","src/unix/bsd/freebsdlike/dragonfly/errno.rs":"8295b8bb0dfd38d2cdb4d9=
192cdeeb534cc6c3b208170e64615fa3e0edb3e578","src/unix/bsd/freebsdlike/drago=
nfly/mod.rs":"8b98b2e544b1303eb3efff36aa1f00d7bb608d507f07db035fd3ead8562bd=
ef0","src/unix/bsd/freebsdlike/freebsd/aarch64.rs":"6c8e216385f53a4bf5f1717=
49b57602fc34a4e4b160a44ca31c058cb0c8a2126","src/unix/bsd/freebsdlike/freebs=
d/arm.rs":"59d6a670eea562fb87686e243e0a84603d29a2028a3d4b3f99ccc01bd04d2f47=
","src/unix/bsd/freebsdlike/freebsd/freebsd11/b64.rs":"9808d152c1196aa647f1=
b0f0cf84dac8c930da7d7f897a44975545e3d9d17681","src/unix/bsd/freebsdlike/fre=
ebsd/freebsd11/mod.rs":"e243ae0e89623d4fa9f85afe14369cc5fd5f2028ea715773dbe=
c722ba80dac1f","src/unix/bsd/freebsdlike/freebsd/freebsd12/b64.rs":"61cbe45=
f8499bedb168106b686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/fr=
eebsdlike/freebsd/freebsd12/mod.rs":"bef9fae288a4f29e941ea369be1cd20b170040=
e60665a4d49a4a9e79009b72d8","src/unix/bsd/freebsdlike/freebsd/freebsd12/x86=
_64.rs":"2df36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052",=
"src/unix/bsd/freebsdlike/freebsd/freebsd13/b64.rs":"61cbe45f8499bedb168106=
b686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freeb=
sd/freebsd13/mod.rs":"3c514e037694ce22724abb3c9c4687defda7f0e3456b615ca7359=
3e860e38b16","src/unix/bsd/freebsdlike/freebsd/freebsd13/x86_64.rs":"2df36a=
7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/f=
reebsdlike/freebsd/freebsd14/b64.rs":"61cbe45f8499bedb168106b686d4f8239472f=
25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd14/mo=
d.rs":"318abe48bfdd1c74ecd6afbd6c9329c5c72ce4f7d420edd6be2fc12b223ae32f","s=
rc/unix/bsd/freebsdlike/freebsd/freebsd14/x86_64.rs":"e7b5863e222d6cc416b6b=
0fbe71690fad909e899b4c4ae810bbca117e4fcb650","src/unix/bsd/freebsdlike/free=
bsd/mod.rs":"6cd5a49c877ec4180ec200c9dcd0426c1054775ee557e4899c1c633158c7c8=
25","src/unix/bsd/freebsdlike/freebsd/powerpc.rs":"9ca3f82f88974e6db5569f2d=
76a5a3749b248a31747a6c0da5820492bdfeca42","src/unix/bsd/freebsdlike/freebsd=
/powerpc64.rs":"2dae3ecc87eac3b11657aa98915def55fc4b5c0de11fe26aae23329a546=
28a9a","src/unix/bsd/freebsdlike/freebsd/riscv64.rs":"fa4bed4c58cad24ba3395=
941c7fa6b11e089551a04714f9561078e400f5b2b62","src/unix/bsd/freebsdlike/free=
bsd/x86.rs":"6766e2ce85e187b306cd3b0b8d7e15b8f4042c5cff81d89b3af69ecc99c70a=
b0","src/unix/bsd/freebsdlike/freebsd/x86_64/align.rs":"0e1f69a88fca1c32874=
b1daf5db3d446fefbe518dca497f096cc9168c39dde70","src/unix/bsd/freebsdlike/fr=
eebsd/x86_64/mod.rs":"51e4dd0c8ae247bb652feda5adad9333ea3bb30c750c3a3935e0b=
0e47d7803eb","src/unix/bsd/freebsdlike/mod.rs":"e9bd293d0bcb317dcebd7d86efc=
8e9bed5d9f7c63b9edfd477f76bd2e32e6457","src/unix/bsd/mod.rs":"dad51a24a524e=
92bfe9de3ac3b7d394d86058b9b8a1ccd4efa9bbb5c78e7fa1a","src/unix/bsd/netbsdli=
ke/mod.rs":"0a66f7de43710e35a6a546e6c39066aa8b91a6efadb71db88738b0a577fd553=
7","src/unix/bsd/netbsdlike/netbsd/aarch64.rs":"65dcb58d11e8d8028401a9d07ca=
3eb4cb4f053e04249cc877353449d84ccc4cb","src/unix/bsd/netbsdlike/netbsd/arm.=
rs":"58cdbb70b0d6f536551f0f3bb3725d2d75c4690db12c26c034e7d6ec4a924452","src=
/unix/bsd/netbsdlike/netbsd/mod.rs":"247154ad4f5e5114a2bb572bff0d157ed3b937=
a373759146b7d0f2900203293b","src/unix/bsd/netbsdlike/netbsd/powerpc.rs":"ee=
7ff5d89d0ed22f531237b5059aa669df93a3b5c489fa641465ace8d405bf41","src/unix/b=
sd/netbsdlike/netbsd/sparc64.rs":"9489f4b3e4566f43bb12dfb92238960613dac7f6a=
45cc13068a8d152b902d7d9","src/unix/bsd/netbsdlike/netbsd/x86.rs":"20692320e=
36bfe028d1a34d16fe12ca77aa909cb02bda167376f98f1a09aefe7","src/unix/bsd/netb=
sdlike/netbsd/x86_64.rs":"1afe5ef46b14397cdd68664b5b232e4f5b035b6db1d4cf411=
c899d51ebca9f30","src/unix/bsd/netbsdlike/openbsd/aarch64.rs":"dd91931d373b=
7ecaf6e2de25adadee10d16fa9b12c2cbacdff3eb291e1ba36af","src/unix/bsd/netbsdl=
ike/openbsd/arm.rs":"01580d261bc6447bb327a0d982181b7bdabfa066cee65a30373d3c=
ed729ad307","src/unix/bsd/netbsdlike/openbsd/mips64.rs":"8532a189ae10c7d668=
d9d4065da8b05d124e09bd39442c9f74a7f231c43eca48","src/unix/bsd/netbsdlike/op=
enbsd/mod.rs":"a1632c0ea40681a22c3fa5834e566b900704f619192b0d46dd8ac7568230=
d751","src/unix/bsd/netbsdlike/openbsd/powerpc.rs":"01580d261bc6447bb327a0d=
982181b7bdabfa066cee65a30373d3ced729ad307","src/unix/bsd/netbsdlike/openbsd=
/powerpc64.rs":"1dd5449dd1fd3d51e30ffdeeaece91d0aaf05c710e0ac699fecc5461cfa=
2c28e","src/unix/bsd/netbsdlike/openbsd/riscv64.rs":"1dd5449dd1fd3d51e30ffd=
eeaece91d0aaf05c710e0ac699fecc5461cfa2c28e","src/unix/bsd/netbsdlike/openbs=
d/sparc64.rs":"d04fd287afbaa2c5df9d48c94e8374a532a3ba491b424ddf018270c7312f=
4085","src/unix/bsd/netbsdlike/openbsd/x86.rs":"6f7f5c4fde2a2259eb547890cbd=
86570cea04ef85347d7569e94e679448bec87","src/unix/bsd/netbsdlike/openbsd/x86=
_64.rs":"d31db31630289c85af3339dbe357998a21ca584cbae31607448fe2cf7675a4e1",=
"src/unix/haiku/b32.rs":"a2efdbf7158a6da341e1db9176b0ab193ba88b449616239ed9=
5dced11f54d87b","src/unix/haiku/b64.rs":"ff8115367d3d7d354f792d6176dfaaa263=
53f57056197b563bf4681f91ff7985","src/unix/haiku/mod.rs":"1a0cda453016c0e119=
2d735b83471b0042a9c7b5a3b76ecf4a623536923a727c","src/unix/haiku/native.rs":=
"dbfcbf4954a79d1df2ff58e0590bbcb8c57dfc7a32392aa73ee4726b66bd6cc8","src/uni=
x/haiku/x86_64.rs":"3ec3aeeb7ed208b8916f3e32d42bfd085ff5e16936a1a35d9a52789=
f043b7237","src/unix/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae=
10ceccefeed9debb3bbe08777fc682","src/unix/hermit/mod.rs":"a1494a0bddf301cce=
b0d9b8529a84b5882fe855ceae77a1c4e8d6034e705e26c","src/unix/hermit/x86_64.rs=
":"ab832b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/u=
nix/linux_like/android/b32/arm.rs":"ce582de7e983a33d3bfad13075c53aac9016cee=
35f06ad8653ee9072c3ec2564","src/unix/linux_like/android/b32/mod.rs":"7c173e=
0375119bf06a3081652faede95e5bcd6858e7576b7533d037978737c8f","src/unix/linux=
_like/android/b32/x86/align.rs":"812914e4241df82e32b12375ca3374615dc3a4bdd4=
cf31f0423c5815320c0dab","src/unix/linux_like/android/b32/x86/mod.rs":"e6d10=
7efbcd37b5b85dfa18f683300cbf768ffa0237997a9fa52b184a53323ac","src/unix/linu=
x_like/android/b64/aarch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3ee2f=
af6fcae3770f9e505cddca35c7b","src/unix/linux_like/android/b64/aarch64/int12=
8.rs":"1735f6f5c56770d20dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de","s=
rc/unix/linux_like/android/b64/aarch64/mod.rs":"171f8c37a2d2e45065bd3547dfc=
ec70b02aa3da34cd99d259d150c753f620846","src/unix/linux_like/android/b64/mod=
.rs":"71e4fcbe952bfa4a5f9022f3972e906917b38f729b9d8ef57cd5d179104894ac","sr=
c/unix/linux_like/android/b64/riscv64/align.rs":"0bf138f84e5327d8339bcd4adf=
071a6832b516445e597552c82bbd881095e3a8","src/unix/linux_like/android/b64/ri=
scv64/mod.rs":"19d4bf2237c47127eba9144e0b82e995bc079315e719179a91813b0ae7b0=
e49d","src/unix/linux_like/android/b64/x86_64/align.rs":"7169d07a9fd4716f75=
12719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/androi=
d/b64/x86_64/mod.rs":"4ec2de11a9b65c4325b7b991f0b99a414975e0e61ba8668caca5d=
921e9b314d1","src/unix/linux_like/android/mod.rs":"e6536383a652e1a9a755d350=
c5a60c2abcadea03e9cdc92e3cf7f7229fe8e2a5","src/unix/linux_like/emscripten/a=
lign.rs":"86c95cbed7a7161b1f23ee06843e7b0e2340ad92b2cb86fe2a8ef3e0e8c36216"=
,"src/unix/linux_like/emscripten/mod.rs":"712c52856ee323b8057b9452e4ab484a0=
e652581a530b67c3db25e819919d718","src/unix/linux_like/emscripten/no_align.r=
s":"0128e4aa721a9902754828b61b5ec7d8a86619983ed1e0544a85d35b1051fad6","src/=
unix/linux_like/linux/align.rs":"28b2cd7c3eddc53c247aa11340da205d1d2e478f19=
9493d330c61e75ec16ee96","src/unix/linux_like/linux/arch/generic/mod.rs":"77=
8742250aa456cb94efe67a4f8d0213827d90ab74eb5074f9afb9a30e6ea71c","src/unix/l=
inux_like/linux/arch/mips/mod.rs":"60ace1dd76aa88d6b3b5e52fef4bec7881d45278=
0dfff635474067b512e03df1","src/unix/linux_like/linux/arch/mod.rs":"466a2962=
2e47c6c7f1500682b2eb17f5566dd81b322cd6348f0fdd355cec593a","src/unix/linux_l=
ike/linux/arch/powerpc/mod.rs":"bef6b7af9e5e2b4e5545c9c7e3e23a8b743277a0ed9=
5853e7eddc38e44299f02","src/unix/linux_like/linux/arch/sparc/mod.rs":"91593=
ec0440f1dd8f8e612028f432c44c14089286e2aca50e10511ab942db8c3","src/unix/linu=
x_like/linux/gnu/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec725195=
7315afa53a7b9f936","src/unix/linux_like/linux/gnu/b32/arm/align.rs":"6ec0eb=
3ee93f7ae99fd714b4deabfb5e97fbcefd8c26f5a45fb8e7150899cdeb","src/unix/linux=
_like/linux/gnu/b32/arm/mod.rs":"9ab3e97b579a9122690cd01026e14528862860346b=
700aafbb755a7e04054f7f","src/unix/linux_like/linux/gnu/b32/m68k/align.rs":"=
8faa92f77a9232c035418d45331774e64a9a841d99c91791570a203bf2b45bcb","src/unix=
/linux_like/linux/gnu/b32/m68k/mod.rs":"6aab7f1b864e9691d14aa7d389f717c4077=
b8eed72a7f11e3b8c7fef245e4046","src/unix/linux_like/linux/gnu/b32/mips/alig=
n.rs":"429fb5e005cb7143602d430098b6ebfb7d360685b194f333dfd587472ae954ee","s=
rc/unix/linux_like/linux/gnu/b32/mips/mod.rs":"6b9a5dac6f937ddc1453e808e3c4=
3502c87143332df9e43ac64fb8b1eda6c116","src/unix/linux_like/linux/gnu/b32/mo=
d.rs":"caade9dc8b7179711102da342819bdf330c42c796b4587d0ed419550dab2e9ad","s=
rc/unix/linux_like/linux/gnu/b32/powerpc.rs":"5c5d90326b54b57b98eff4745fe7a=
3fb02f053b2dc782241a73e807b491936a3","src/unix/linux_like/linux/gnu/b32/ris=
cv32/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd37543efe8662=
1b119","src/unix/linux_like/linux/gnu/b32/riscv32/mod.rs":"491a9a97cf712985=
b75d3ad714691ef60898d88c78bc386a6917de0a6774cc26","src/unix/linux_like/linu=
x/gnu/b32/sparc/align.rs":"21adbed27df73e2d1ed934aaf733a643003d7baf2bde9c48=
ea440895bcca6d41","src/unix/linux_like/linux/gnu/b32/sparc/mod.rs":"80894ee=
ce66e9348f45d1b07ad37c757ea694bbd10ed49d3f920b34e9f51a9a3","src/unix/linux_=
like/linux/gnu/b32/x86/align.rs":"e4bafdc4a519a7922a81b37a62bbfd1177a2f6208=
90eef8f1fbc47162e9eb413","src/unix/linux_like/linux/gnu/b32/x86/mod.rs":"c7=
03cc5e9de2dc31d9e5831bfb6f354d6e3518b2ae02263f68a9a70f1c0167e2","src/unix/l=
inux_like/linux/gnu/b64/aarch64/align.rs":"ea39d5fd8ca5a71314127d1e1f542bca=
34ac566eac9a95662076d91ea4bee548","src/unix/linux_like/linux/gnu/b64/aarch6=
4/ilp32.rs":"bf4611b737813deef6787babf6c01698605f3b75482269b8546318667bc68e=
29","src/unix/linux_like/linux/gnu/b64/aarch64/int128.rs":"1735f6f5c56770d2=
0dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linu=
x/gnu/b64/aarch64/lp64.rs":"11a950697fdda0258c6e37c6b13993348c8de4134105ed4=
faa79358e53175072","src/unix/linux_like/linux/gnu/b64/aarch64/mod.rs":"d7be=
998105fc2f6248b7fdfcedb5a0519122d28625fcfd5dccf72617fb30c45e","src/unix/lin=
ux_like/linux/gnu/b64/loongarch64/align.rs":"6616c38bf8cab53034dce9f968adae=
8fb7771334445a93876d000cfd08f117a8","src/unix/linux_like/linux/gnu/b64/loon=
garch64/mod.rs":"9c39dfc3843e72bd8dba21aa5ef2795411cd8a0004a0cfe79c9b9f89ab=
92eb55","src/unix/linux_like/linux/gnu/b64/mips64/align.rs":"7169d07a9fd471=
6f7512719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/li=
nux/gnu/b64/mips64/mod.rs":"628c410b9aaec3c8f43838a28616b577a1d6de60a9799b0=
9bb884d80281f96eb","src/unix/linux_like/linux/gnu/b64/mod.rs":"3c6555f30a7a=
8852757b31a542ea73fb6a16a6e27e838397e819278ad56e57a4","src/unix/linux_like/=
linux/gnu/b64/powerpc64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468=
cc1dc9df83f002f1268130d9","src/unix/linux_like/linux/gnu/b64/powerpc64/mod.=
rs":"c778a136f06c2ffeacea19fa14ce79b828f91b67a002dec5ce87289bae36234e","src=
/unix/linux_like/linux/gnu/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc=
0111beb3a22e58803f99cd37543efe86621b119","src/unix/linux_like/linux/gnu/b64=
/riscv64/mod.rs":"c8f07efc5ddd5d874f1ebc329cd6907818d132ac3e30f4f2a4b04be3f=
b388551","src/unix/linux_like/linux/gnu/b64/s390x.rs":"a2fd9277c2dcf76f7a16=
a3bcca745d5a9932c765c0dc2feb31c3641be25eb0aa","src/unix/linux_like/linux/gn=
u/b64/sparc64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83=
f002f1268130d9","src/unix/linux_like/linux/gnu/b64/sparc64/mod.rs":"e8047e9=
966a2b90063e0151a0278c54885e7b323286cf5ab55cbaf151fc772d3","src/unix/linux_=
like/linux/gnu/b64/x86_64/align.rs":"62e822478356db4a73b6bbd1b36d825b893939=
ab4b308ec11b0578bcc4b49769","src/unix/linux_like/linux/gnu/b64/x86_64/mod.r=
s":"891e595d33714b9883b92f0554d1d361fba2b6c3f6cac09a288252f44c6ec667","src/=
unix/linux_like/linux/gnu/b64/x86_64/not_x32.rs":"38f74ce15d9662ce4818815a2=
b87be1618d5e45f190f7e4db84ff3285b4421fb","src/unix/linux_like/linux/gnu/b64=
/x86_64/x32.rs":"b20218a11364a6dec87f96d6c0d8b19e660697ab09ad5ee0e9b3a9dafe=
daaebb","src/unix/linux_like/linux/gnu/mod.rs":"882859b4b1bcb8b7c2a6fb8da7a=
2d9a429341fe2baacd77ec1a234ba3addd444","src/unix/linux_like/linux/gnu/no_al=
ign.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25",=
"src/unix/linux_like/linux/mod.rs":"443d3384ed7f4c490c82871f288f8c8a95a7ab4=
3a41449e8f4d400b62093af92","src/unix/linux_like/linux/musl/b32/arm/align.rs=
":"3e8ac052c1043764776b54c93ba4260e061df998631737a897d9d47d54f7b80c","src/u=
nix/linux_like/linux/musl/b32/arm/mod.rs":"923159f09820a7e3ca2340ef6adb4f37=
79ebfa9320a1f6a41027529d81d5f699","src/unix/linux_like/linux/musl/b32/hexag=
on.rs":"5625a3dfcd8fae8c43e6306172dd0c2f7ace8ce9a43a2c03909aef35d96cdaa8","=
src/unix/linux_like/linux/musl/b32/mips/align.rs":"429fb5e005cb7143602d4300=
98b6ebfb7d360685b194f333dfd587472ae954ee","src/unix/linux_like/linux/musl/b=
32/mips/mod.rs":"7956dae471300c810f596cb6d6cc122640527c139219cc9f2a86117a41=
67a941","src/unix/linux_like/linux/musl/b32/mod.rs":"31677597fd9544c4b1ec14=
77628288f6273fabbc06e38f33da862ad55f019ce1","src/unix/linux_like/linux/musl=
/b32/powerpc.rs":"c3678a942c166aa205dae207a767a358c1f5d7b16939d175eda8dc99f=
8fcfa96","src/unix/linux_like/linux/musl/b32/riscv32/align.rs":"efd2accf33b=
87de7c7547903359a5da896edc33cd6c719552c7474b60d4a5d48","src/unix/linux_like=
/linux/musl/b32/riscv32/mod.rs":"b857ccbc8f0fbc8a6a5959f3496a4fd5a9a1dd986c=
15c8e716f3e2902c25181c","src/unix/linux_like/linux/musl/b32/x86/align.rs":"=
08e77fbd7435d7dec2ff56932433bece3f02e47ce810f89004a275a86d39cbe1","src/unix=
/linux_like/linux/musl/b32/x86/mod.rs":"5e58f759df421b4473f229da417cd5da080=
226afc0006d71d5dd578c62e27a50","src/unix/linux_like/linux/musl/b64/aarch64/=
align.rs":"6ba32725d24d7d8e6aa111f3b57aafa318f83b606abe96561329151829821133=
","src/unix/linux_like/linux/musl/b64/aarch64/int128.rs":"1735f6f5c56770d20=
dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux=
/musl/b64/aarch64/mod.rs":"31e75179cbb4e26425b3f5b052e358f593153da662884655=
e60801d852e55dc2","src/unix/linux_like/linux/musl/b64/mips64.rs":"9a5d29f66=
6332bb056d0e2951e9de989aa1dc016075f009db3f2f628e0cdda8c","src/unix/linux_li=
ke/linux/musl/b64/mod.rs":"c349ade36cca16273918124d206493a2f8d0d3ecf359b80a=
e7ec0317c7ee5c98","src/unix/linux_like/linux/musl/b64/powerpc64.rs":"455dc0=
ffa55afc1db6ffaf461f6f2a7b49d31658bfebe0bb4efac5967a6f956c","src/unix/linux=
_like/linux/musl/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a2=
2e58803f99cd37543efe86621b119","src/unix/linux_like/linux/musl/b64/riscv64/=
mod.rs":"42d4b6d36807f37759094a732a321080cccdf498b174d632cebba147051de294",=
"src/unix/linux_like/linux/musl/b64/s390x.rs":"508d083cca50ca91042f01a96189=
09e890b755287ea4c7885cdab0fc0d75e1b3","src/unix/linux_like/linux/musl/b64/x=
86_64/align.rs":"77309276ad7a42cbe59ca381f23590b7a143aded05555b34a5b307b808=
cbca6e","src/unix/linux_like/linux/musl/b64/x86_64/mod.rs":"7a877cd23b64be6=
6d28e6b8dddae32d59a88d69115637539daf19381f4e39330","src/unix/linux_like/lin=
ux/musl/mod.rs":"46b47255dd8ce2ae32443267f5f334e2e72341d58615edf50611218506=
a08082","src/unix/linux_like/linux/no_align.rs":"1a754a4af299894a79835aa092=
d8322d301179e2b20609defd6bb4bc880e6b4a","src/unix/linux_like/linux/non_exha=
ustive.rs":"181a05bf94fdb911db83ce793b993bd6548a4115b306a7ef3c10f745a8fea3e=
9","src/unix/linux_like/linux/uclibc/align.rs":"9ed16138d8e439bd90930845a65=
eafa7ebd67366e6bf633936d44014f6e4c959","src/unix/linux_like/linux/uclibc/ar=
m/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f9=
36","src/unix/linux_like/linux/uclibc/arm/mod.rs":"50288ff9e411ab0966da2483=
8f2c2a5618021bc19c422a04f577b2979ef4081e","src/unix/linux_like/linux/uclibc=
/arm/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c8=
6653db25","src/unix/linux_like/linux/uclibc/mips/mips32/align.rs":"e4a3c27f=
e20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936","src/unix/linux_l=
ike/linux/uclibc/mips/mips32/mod.rs":"d0c4434e2bf813372c418a8f516c706cdccc9=
f7be2f0921b2207b0afdb66fe81","src/unix/linux_like/linux/uclibc/mips/mips32/=
no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653d=
b25","src/unix/linux_like/linux/uclibc/mips/mips64/align.rs":"a7bdcb18a37a2=
d91e64d5fad83ea3edc78f5412adb28f77ab077dbb26dd08b2d","src/unix/linux_like/l=
inux/uclibc/mips/mips64/mod.rs":"3f38ee6a4690b9d7594be20d216467a34d955f7653=
c2c8ce1e6147daeb53f1e0","src/unix/linux_like/linux/uclibc/mips/mips64/no_al=
ign.rs":"4a18e3875698c85229599225ac3401a2a40da87e77b2ad4ef47c6fcd5a24ed30",=
"src/unix/linux_like/linux/uclibc/mips/mod.rs":"a048fce1c2d9b1ad57305642e8a=
d05ca0f0c7e4753267a2e2d6b4fee5db3b072","src/unix/linux_like/linux/uclibc/mo=
d.rs":"1c3d25cddcfefa2bd17bdc81550826be31a08eef235e13f825f169a5029c8bca","s=
rc/unix/linux_like/linux/uclibc/no_align.rs":"3f28637046524618adaa1012e26cb=
7ffe94b9396e6b518cccdc69d59f274d709","src/unix/linux_like/linux/uclibc/x86_=
64/l4re.rs":"024eba5753e852dbdd212427351affe7e83f9916c1864bce414d7aa2618f19=
2e","src/unix/linux_like/linux/uclibc/x86_64/mod.rs":"196d03affbefb85716937=
c15904831e731eb222ee906e05e42102d639a8152ea","src/unix/linux_like/linux/ucl=
ibc/x86_64/other.rs":"42c3f71e58cabba373f6a55a623f3c31b85049eb64824c09c2b08=
2b3b2d6a0a8","src/unix/linux_like/mod.rs":"08fa4c19c184adc12c775f1bd494d1c3=
3131b0f48455498ce550a3c44ab4db24","src/unix/mod.rs":"13d0eb3b15294623bb3c08=
b45aea89b06f14860675f5e777670aae42a0cc43a9","src/unix/newlib/aarch64/mod.rs=
":"bac93836a9a57b2c710f32f852e92a4d11ad6759ab0fb6ad33e71d60e53278af","src/u=
nix/newlib/align.rs":"28aaf87fafbc6b312622719d472d8cf65f9e5467d15339df5f73e=
66d8502b28a","src/unix/newlib/arm/mod.rs":"cbba6b3e957eceb496806e60de8725a2=
3ff3fa0015983b4b4fa27b233732b526","src/unix/newlib/espidf/mod.rs":"816f235f=
4aa4baabba7f2606b31d0fdb03988c52194c966728de8690bf17299d","src/unix/newlib/=
generic.rs":"eab066d9f0a0f3eb53cc1073d01496bba0110989e1f6a59838afd19f870cd5=
99","src/unix/newlib/horizon/mod.rs":"7cc5cc120437421db139bfa6a90b18168cd30=
70bdd0f5be96d40fe4c996f3ca1","src/unix/newlib/mod.rs":"83aea4ee8783761323ca=
91eeba25afee9b9e91d9b5d37ca03fe179c88dc9cde1","src/unix/newlib/no_align.rs"=
:"e0743b2179495a9514bc3a4d1781e492878c4ec834ee0085d0891dd1712e82fb","src/un=
ix/newlib/powerpc/mod.rs":"0202ffd57caf75b6afa2c9717750ffb96e375ac33df0ae96=
09a3f831be393b67","src/unix/newlib/vita/mod.rs":"d7642da66c2e76cf37d367d622=
acb6e27e46a6dbd721e088e8028608b3488b6f","src/unix/no_align.rs":"c06e95373b9=
088266e0b14bba0954eef95f93fb2b01d951855e382d22de78e53","src/unix/nto/aarch6=
4.rs":"4709c9afdc8d583be876598e7c238499ee3e8da5bd2baa614d9c7dd414851555","s=
rc/unix/nto/mod.rs":"8b8f5d0e5251f5385849c554629e9320c0f7ddf37078a458cc8767=
a9214392e9","src/unix/nto/neutrino.rs":"62198d95ccc0fe7ece6f9d5c0b29fc22303=
ef458886efb5e09aad524eca2ab7b","src/unix/nto/x86_64.rs":"a3e18e93c2999da1cd=
7a6f748a4b60c07aefb73d8ea2aafec19a84cfb040bc8e","src/unix/redox/mod.rs":"28=
0397beced934ba8e83d10b15b81dfb2d344fce420649bc529a26e4001c00b9","src/unix/s=
olarish/compat.rs":"00f1ee3faec9da69204e42f025f6735dd13d894071a154425dcc43e=
cbdd06e7f","src/unix/solarish/illumos.rs":"cd93c2d84722bbf9933a92842a8998eb=
0b2afc962f50bc2546ad127b82809fa7","src/unix/solarish/mod.rs":"55ce4624745e3=
1ad226b47fde177a46176a89da3fa5030663673a115102471f9","src/unix/solarish/sol=
aris.rs":"41b350a89ddf01cd12a10f93640f92be53be0b0d976021cdc08da17bf3e72edf"=
,"src/unix/solarish/x86.rs":"e86e806df0caed72765040eaa2f3c883198d1aa9150854=
0adf9b7008c77f522e","src/unix/solarish/x86_64.rs":"ec2b01f194eb8a6a27133c57=
681da195a949e03098f3ea1e847227a9c09ef5fc","src/unix/solarish/x86_common.rs"=
:"ac869d9c3c95645c22460468391eb1982023c3a8e02b9e06a72e3aef3d5f1eac","src/vx=
works/aarch64.rs":"98f0afdc511cd02557e506c21fed6737585490a1dce7a9d4941d08c4=
37762b99","src/vxworks/arm.rs":"acb7968ce99fe3f4abdf39d98f8133d21a4fba435b8=
ef7084777cb181d788e88","src/vxworks/mod.rs":"e4edcbcf43a325e738c9465507594d=
0c87abf3f0e2b9b046c1425f8d44bdad0f","src/vxworks/powerpc.rs":"acb7968ce99fe=
3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788e88","src/vxworks/powerpc64=
.rs":"98f0afdc511cd02557e506c21fed6737585490a1dce7a9d4941d08c437762b99","sr=
c/vxworks/x86.rs":"552f007f38317620b23889cb7c49d1d115841252439060122f52f434=
fbc6e5ba","src/vxworks/x86_64.rs":"018d92be3ad628a129eff9f2f5dfbc0883d8b8e5=
f2fa917b900a7f98ed6b514a","src/wasi.rs":"09ee3b3348b212b050f6ca8ae008a28679=
ea44a375674307a4e7c9ca0d3ed7d5","src/windows/gnu/align.rs":"b2c13ec1b9f3b39=
a75c452c80c951dff9d0215e31d77e883b4502afb31794647","src/windows/gnu/mod.rs"=
:"3c8c7edb7cdf5d0c44af936db2a94869585c69dfabeef30571b4f4e38375767a","src/wi=
ndows/mod.rs":"a9a95e9ebc0102c334650607351d4d4dbaff0eaf7730eed1c8020d20e9bb=
ebfd","src/windows/msvc/mod.rs":"c068271e00fca6b62bc4bf44bcf142cfc38caeded9=
b6c4e01d1ceef3ccf986f4","src/xous.rs":"eb0675f25ba01f73072d2b70907fb8abb114=
8facefe5a20756c49250f3d65fae","tests/const_fn.rs":"cb75a1f0864f926aebe79118=
fc34d51a0d1ade2c20a394e7774c7e545f21f1f4"},"package":"2b00cc1c228a6782d0f07=
6e7b232802e0c5689d41bb5df366f2a6b6621cfdfe1"}
> diff --git a/meta/recipes-devtools/rust/files/getrandom-open64.patch b/me=
ta/recipes-devtools/rust/files/getrandom-open64.patch
> index b35195e837e4..02c049c36c1f 100644
> --- a/meta/recipes-devtools/rust/files/getrandom-open64.patch
> +++ b/meta/recipes-devtools/rust/files/getrandom-open64.patch
> @@ -14,15 +14,19 @@ for opening device files and not real files
> Upstream-Status: Backport [https://github.com/rust-random/getrandom/commi=
t/7f73e3ccc1f53bfc419e4ddcfd343766aa5837b6]
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> ---- a/vendor/getrandom/.cargo-checksum.json
> -+++ b/vendor/getrandom/.cargo-checksum.json
> +Index: rustc-1.71.0-src/vendor/getrandom-0.2.8/.cargo-checksum.json
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- rustc-1.71.0-src.orig/vendor/getrandom-0.2.8/.cargo-checksum.json
> ++++ rustc-1.71.0-src/vendor/getrandom-0.2.8/.cargo-checksum.json
> @@ -1 +1 @@
> -{"files":{"CHANGELOG.md":"cb054908f44d0e7f229dcc4580bcc4f2c3e2da198c8429=
2710f730b33cc3d5f6","Cargo.toml":"708a5d9c89443b937aa50260e26a01f9ebfdd50a7=
ae312956795834e3187baf3","LICENSE-APACHE":"aaff376532ea30a0cd5330b9502ad4a4=
c8bf769c539c87ffe78819d188a18ebf","LICENSE-MIT":"209fbbe0ad52d9235e37badf9c=
adfe4dbdc87203179c0899e738b39ade42177b","README.md":"7ae74633326a22fd6298d7=
f209fb14884277bd98049795f444945acbb2b0dfbd","benches/mod.rs":"c01b05c6d690a=
4b8937d25252f1385a6bff378517318ce832ea520036aabd571","src/3ds.rs":"0f48fc15=
f89b518fb92e06aaa4838b62dc073598e8f288df56ad1e5a9251af1e","src/bsd_arandom.=
rs":"d90c419d4def20f83e7535cd3f5ec07035045011a50c3652951d196a120c5d3e","src=
/custom.rs":"ce4640776d36872dbbd5e194bf29f6bcda3ef4549ca04fe59f5aeab1dea1d8=
21","src/dragonfly.rs":"47f933eac189f6ea48ecf021efd0747ebce1b43d1bece6bbf72=
a951bab705987","src/error.rs":"ff09a7e02d7aff3e45eca6bbef6c686cc46f3c2371a0=
897a856e4dec4b942e46","src/error_impls.rs":"9c34832ebb99cd5e31bc5c8ffc5beb5=
b3fa6f7ff0226aaa1cdf8e10e6d64b324","src/espidf.rs":"19f101486584fde6dad962f=
4d9792de168658047312106641a5caf6866a5bbcf","src/fuchsia.rs":"470d8509deb5b0=
6fa6417f294c0a49e0e35a580249a5d8944c3be5aa746f64ea","src/ios.rs":"4bad4f5c0=
96a50338b86aeac91a937c18bc55b9555e6f34806ad13732e64523d","src/js.rs":"37061=
0a19045012c87c986279aad6b150cd728a44015dcc5779256e4a2e6629b","src/lib.rs":"=
8e5c2c8edcbdbf2cee46b86d96d951cc6d5c00f7c11cfc9c27de27e756b5c4cc","src/linu=
x_android.rs":"ec24575aa4ae71b6991290dadfdea931b05397c3faababf24bd794f1a962=
4835","src/macos.rs":"6c09827ad5292cd022e063efa79523bfdb50ed08b9867ebaa007c=
d321b8d218e","src/openbsd.rs":"450a23ead462d4a840fee4aa0bfdab1e3d88c8f48e4b=
b608d457429ddeca69c0","src/rdrand.rs":"79d23183b1905d61bd9df9729dc798505a2e=
d750d3339e342ab144e1709827e4","src/solaris_illumos.rs":"d52fee9dd7d661f960c=
01894edd563c1ff8a512c111f7803092d9aa2ff98718e","src/solid.rs":"997035d54c97=
62d22a5a14f54e7fbed4dd266cdeacbdf6aab7d8aee05537e8ba","src/use_file.rs":"16=
e42eb0a56e375c330c1ca8eb58c444e82ef3ad35230b961fdba96a02a68804","src/util.r=
s":"da6964dc1523f1cb8d26365fa6a8ece46360587e6974931624b271f0c72cda8b","src/=
util_libc.rs":"2a63ac0e6dab16b85c4728b79a16e0640301e8b876f151b0a1db0b4394fa=
219f","src/vxworks.rs":"a5aa0e40f890e0f35626458bb656a3340b8af3111e4bacd2e12=
505a8d50a3505","src/wasi.rs":"dfdd0a870581948bd03abe64d49ca4295d9cfa26e09b9=
7a526fd5e17148ad9ca","src/windows.rs":"d0b4f2afd1959660aa9abcd9477764bd7dc0=
b7d7048aee748804b37963c77c6f","tests/common/mod.rs":"b6beee8f535d2d094a6571=
1fe0af91a6fc220aa09729ed7269fe33cafdc9177f","tests/custom.rs":"9f2c0193193f=
6bcf641116ca0b3653b33d2015e0e98ce107ee1d1f60c5eeae3a","tests/normal.rs":"9e=
1c4b1e468a09ed0225370dfb6608f8b8135e0fabb09bbc1a718105164aade6","tests/rdra=
nd.rs":"4474ccebf9d33c89288862a7e367018405968dddc55c7c6f97e21b5fe2264601"},=
"package":"c05aeb6a22b8f62540c194aac980f2115af067bfe15a0734d7277a768d396b31=
"}
> \ No newline at end of file
> +{"files":{"CHANGELOG.md":"cb054908f44d0e7f229dcc4580bcc4f2c3e2da198c8429=
2710f730b33cc3d5f6","Cargo.toml":"708a5d9c89443b937aa50260e26a01f9ebfdd50a7=
ae312956795834e3187baf3","LICENSE-APACHE":"aaff376532ea30a0cd5330b9502ad4a4=
c8bf769c539c87ffe78819d188a18ebf","LICENSE-MIT":"209fbbe0ad52d9235e37badf9c=
adfe4dbdc87203179c0899e738b39ade42177b","README.md":"7ae74633326a22fd6298d7=
f209fb14884277bd98049795f444945acbb2b0dfbd","benches/mod.rs":"c01b05c6d690a=
4b8937d25252f1385a6bff378517318ce832ea520036aabd571","src/3ds.rs":"0f48fc15=
f89b518fb92e06aaa4838b62dc073598e8f288df56ad1e5a9251af1e","src/bsd_arandom.=
rs":"d90c419d4def20f83e7535cd3f5ec07035045011a50c3652951d196a120c5d3e","src=
/custom.rs":"ce4640776d36872dbbd5e194bf29f6bcda3ef4549ca04fe59f5aeab1dea1d8=
21","src/dragonfly.rs":"47f933eac189f6ea48ecf021efd0747ebce1b43d1bece6bbf72=
a951bab705987","src/error.rs":"ff09a7e02d7aff3e45eca6bbef6c686cc46f3c2371a0=
897a856e4dec4b942e46","src/error_impls.rs":"9c34832ebb99cd5e31bc5c8ffc5beb5=
b3fa6f7ff0226aaa1cdf8e10e6d64b324","src/espidf.rs":"19f101486584fde6dad962f=
4d9792de168658047312106641a5caf6866a5bbcf","src/fuchsia.rs":"470d8509deb5b0=
6fa6417f294c0a49e0e35a580249a5d8944c3be5aa746f64ea","src/ios.rs":"4bad4f5c0=
96a50338b86aeac91a937c18bc55b9555e6f34806ad13732e64523d","src/js.rs":"37061=
0a19045012c87c986279aad6b150cd728a44015dcc5779256e4a2e6629b","src/lib.rs":"=
8e5c2c8edcbdbf2cee46b86d96d951cc6d5c00f7c11cfc9c27de27e756b5c4cc","src/linu=
x_android.rs":"ec24575aa4ae71b6991290dadfdea931b05397c3faababf24bd794f1a962=
4835","src/macos.rs":"6c09827ad5292cd022e063efa79523bfdb50ed08b9867ebaa007c=
d321b8d218e","src/openbsd.rs":"450a23ead462d4a840fee4aa0bfdab1e3d88c8f48e4b=
b608d457429ddeca69c0","src/rdrand.rs":"79d23183b1905d61bd9df9729dc798505a2e=
d750d3339e342ab144e1709827e4","src/solaris_illumos.rs":"d52fee9dd7d661f960c=
01894edd563c1ff8a512c111f7803092d9aa2ff98718e","src/solid.rs":"997035d54c97=
62d22a5a14f54e7fbed4dd266cdeacbdf6aab7d8aee05537e8ba","src/use_file.rs":"16=
e42eb0a56e375c330c1ca8eb58c444e82ef3ad35230b961fdba96a02a68804","src/util.r=
s":"da6964dc1523f1cb8d26365fa6a8ece46360587e6974931624b271f0c72cda8b","src/=
util_libc.rs":"a47b20e73637fed248405650f56358f3339e511b217b7ba80e32011d8ee2=
ca22","src/vxworks.rs":"a5aa0e40f890e0f35626458bb656a3340b8af3111e4bacd2e12=
505a8d50a3505","src/wasi.rs":"dfdd0a870581948bd03abe64d49ca4295d9cfa26e09b9=
7a526fd5e17148ad9ca","src/windows.rs":"d0b4f2afd1959660aa9abcd9477764bd7dc0=
b7d7048aee748804b37963c77c6f","tests/common/mod.rs":"b6beee8f535d2d094a6571=
1fe0af91a6fc220aa09729ed7269fe33cafdc9177f","tests/custom.rs":"9f2c0193193f=
6bcf641116ca0b3653b33d2015e0e98ce107ee1d1f60c5eeae3a","tests/normal.rs":"9e=
1c4b1e468a09ed0225370dfb6608f8b8135e0fabb09bbc1a718105164aade6","tests/rdra=
nd.rs":"4474ccebf9d33c89288862a7e367018405968dddc55c7c6f97e21b5fe2264601"},=
"package":"c05aeb6a22b8f62540c194aac980f2115af067bfe15a0734d7277a768d396b31=
"}
> \ No newline at end of file
> ---- a/vendor/getrandom/src/util_libc.rs
> -+++ b/vendor/getrandom/src/util_libc.rs
> +Index: rustc-1.71.0-src/vendor/getrandom-0.2.8/src/util_libc.rs
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- rustc-1.71.0-src.orig/vendor/getrandom-0.2.8/src/util_libc.rs
> ++++ rustc-1.71.0-src/vendor/getrandom-0.2.8/src/util_libc.rs
> @@ -135,19 +135,11 @@ impl Weak {
>      }
>  }
> diff --git a/meta/recipes-devtools/rust/files/zlib-off64_t.patch b/meta/r=
ecipes-devtools/rust/files/zlib-off64_t.patch
> index 78c8a2a1fb4c..baa9daa7afee 100644
> --- a/meta/recipes-devtools/rust/files/zlib-off64_t.patch
> +++ b/meta/recipes-devtools/rust/files/zlib-off64_t.patch
> @@ -5,8 +5,10 @@ it needs 64 bit off_t
>
> Upstream-Status: Submitted [https://github.com/madler/zlib/pull/764]
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---- a/vendor/libz-sys/src/zlib/gzguts.h
> -+++ b/vendor/libz-sys/src/zlib/gzguts.h
> +Index: rustc-1.71.0-src/vendor/libz-sys/src/zlib/gzguts.h
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- rustc-1.71.0-src.orig/vendor/libz-sys/src/zlib/gzguts.h
> ++++ rustc-1.71.0-src/vendor/libz-sys/src/zlib/gzguts.h
> @@ -3,15 +3,6 @@
>   * For conditions of distribution and use, see copyright notice in zlib.=
h
>   */
> @@ -23,9 +25,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  #ifdef HAVE_HIDDEN
>  #  define ZLIB_INTERNAL __attribute__((visibility ("hidden")))
>  #else
> ---- a/vendor/libz-sys/.cargo-checksum.json
> -+++ b/vendor/libz-sys/.cargo-checksum.json
> +Index: rustc-1.71.0-src/vendor/libz-sys/.cargo-checksum.json
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- rustc-1.71.0-src.orig/vendor/libz-sys/.cargo-checksum.json
> ++++ rustc-1.71.0-src/vendor/libz-sys/.cargo-checksum.json
> @@ -1 +1 @@
> --{"files":{"Cargo.toml":"ce67ce7c1f3c4ad7832d58ed198b8dd745abacc620738d5=
75c4b1a9ac9e79449","LICENSE-APACHE":"a60eea817514531668d7e00765731449fe14d0=
59d3249e0bc93b36de45f759f2","LICENSE-MIT":"34c467b6945a22696d060b8fdd2379d4=
64acb3408d4c599d3dc5fe4fa1b4c84f","README.md":"b23e18bdce29fabc3d34e8857621=
9f50d1d735a355e427e6d6ebc09254138070","build.rs":"e034f7828ff43a0bb0f7b690e=
8e99b09b8f4e1ae0560b6fb4008006e9cd4d9dd","ci/Dockerfile":"4d479ea63b9e384b3=
864fa1204894bfae4890017d6bf03486274457fe2c26cf8","ci/run-docker.sh":"0ea7a4=
fdc9f6026110e20fa2e25dbadfc1e6dafed9ded5981ae36772ad207e26","ci/set_rust_ve=
rsion.bash":"4284f86ac3923a73dd79e89bef2d0b136c6d104d6dae92e24b4a96eaffa288=
90","ci/test.bash":"73a936768549eedf96a7cddb350ada128e058d5d9004244ebf3d993=
363b69599","src/lib.rs":"40476f4e896c936c21f908396255c7a4951ef8bf93788858ad=
e6cace2539927b","src/smoke.c":"10607c81b73811bfcb9718767312bf97ba2ccf7048ea=
2f18a2085aa06ad7f91b","src/zlib-ng/CMakeLists.txt":"60b836817b51e5893b1e320=
3adaf57a98678af17957eccaef679bd96bcf5d90b","src/zlib-ng/FAQ.zlib":"d1777aa0=
57caeef50fc291aac7a414363b2186bb3d65bb0f8bfa2bfd61cf0ad5","src/zlib-ng/INDE=
X.md":"989545e90d8e9ac149034f762ce78ed8976ebf9324326228dea37ca190154609","s=
rc/zlib-ng/LICENSE.md":"d3c80be055d94d798eaa786116e84fa0b010bc11420b5d2060d=
978ea77845436","src/zlib-ng/Makefile.in":"15027511a77e76b423eccf10ebfe66398=
ea96862cbce2415e5ebac7c7cbb6ab6","src/zlib-ng/PORTING.md":"5cff8c878c7958f6=
a4bada5a403dcc88961c9607826faece1aef202b5d95c550","src/zlib-ng/README.md":"=
9cac4a98ecf45f50adf5030d4dc58b3cf9f3ae8e3ec78d30fdae4a99a2b4b8d9","src/zlib=
-ng/adler32.c":"82ffa1b4fc4b198ba8004135f79b8819d9f2b28e851c30c0ab41e6d32df=
bf70d","src/zlib-ng/adler32_p.h":"f56915c59a345baf4558374447385a317e29365a4=
db2fbb38af4de3e1a1a0201","src/zlib-ng/arch/arm/Makefile.in":"95464884ba75a7=
b12c9ceda5845d8d68d5a7d7dac8a8dc24b27beb2192e5b97b","src/zlib-ng/arch/arm/a=
dler32_neon.c":"3990b8d5570b12c2162218fe0e9bc723a03f1c89b5ed3ba70a74a989762=
60ee7","src/zlib-ng/arch/arm/arm.h":"855adbb02d7b9a5714a17d9dcff493610e7cd2=
b9a1f4e58e1c99626ab536e868","src/zlib-ng/arch/arm/armfeature.c":"dd09ad2712=
b037e8d52173402f39cc2be1bc89d47fc10259ef81b4c64aef7110","src/zlib-ng/arch/a=
rm/chunkset_neon.c":"65b70014888e9fbdb89bfbfa52f23b8953dc015466577da292d478=
0b55c5d95a","src/zlib-ng/arch/arm/crc32_acle.c":"5a96afc594697d1399870d1bfb=
0623a03869eff42caae74013f147cec4aa982e","src/zlib-ng/arch/arm/ctzl.h":"feb7=
0d55e66025fff806e30e48002b35cfff79533d352585cfa5f118edbc90b1","src/zlib-ng/=
arch/arm/insert_string_acle.c":"d1b1dae5aeada70f2b03c2cbf3112ce55a92401c2d8=
7709081b04dcf5992e1ad","src/zlib-ng/arch/arm/slide_neon.c":"19d8cf5c742ac6b=
82164c7a183538ad1129f9f17e9b8bce8b40daac3820fb6c4","src/zlib-ng/arch/generi=
c/Makefile.in":"f41a34839986eac8dd52cf91fada0efff4171c059ab5d7db6347c91bd6d=
9db09","src/zlib-ng/arch/power/Makefile.in":"69644d1a0ff8e7f38005c0a55cdbaf=
3f0d87f42abf8fc4f4136271c4fedfb846","src/zlib-ng/arch/power/adler32_power8.=
c":"79b75e98ad3a62facbbdd8c0b178d3f993b57f6e34d320bf47eca33aa8c330a1","src/=
zlib-ng/arch/power/power.c":"0647afb3b3b7ce2a19b4815ec8fdeee0b37c759413e5ef=
0a668a2dba22d94803","src/zlib-ng/arch/power/power.h":"f3f15f94fed98a2f7dd5d=
4568c5172e597228be4141d6895062703c3f70024da","src/zlib-ng/arch/power/slide_=
hash_power8.c":"932ea533d25e2f5478afe0c47830e7ef24276cad0d75fd91f2d8c799bd4=
b5d36","src/zlib-ng/arch/s390/Makefile.in":"eef6c3169723f089b0b5f852423ec55=
bf0364caeddd7cda991f2e76bc1682107","src/zlib-ng/arch/s390/README.md":"4f501=
8cb7c8ee217710a90193088889a15f1675d205a104140f6a1ac07ce412c","src/zlib-ng/a=
rch/s390/dfltcc_common.c":"6771ec4457da9f4b00c74bcc0828735e21c74b9162cb3738=
3c297c3b5028cddf","src/zlib-ng/arch/s390/dfltcc_common.h":"ed339007feae58d1=
879e096addb30ed86cd5cf11222db22c45f48b47328cf6db","src/zlib-ng/arch/s390/df=
ltcc_deflate.c":"7b3dec7be4055c7748defc626dc91db99787c9f3b70b7d7b40282558bb=
b478e9","src/zlib-ng/arch/s390/dfltcc_deflate.h":"c4c411f221cc0f6b218326e97=
3fef05c65840ba49878aff052dac0bb38121cbd","src/zlib-ng/arch/s390/dfltcc_deta=
il.h":"01dbdfaf5e8ccf522663b4daa76e9138dde514292c35a623be4bcbbf4b82dea2","s=
rc/zlib-ng/arch/s390/dfltcc_inflate.c":"a96226eba3538d3904893cfe1b08395668e=
6a722b56f28d5b5debb3176161b4b","src/zlib-ng/arch/s390/dfltcc_inflate.h":"d7=
a4a5ae79abd1a5456521926b918becfe86c253a4fc23723fbc09f7c3303128","src/zlib-n=
g/arch/x86/INDEX.md":"c12f9bf0d66743a6472fb756bf46def8eea1dd235be7fca994dcb=
22f693a3524","src/zlib-ng/arch/x86/Makefile.in":"9f6fe7567a99e81aaa3bef8ccf=
a1ad40f524efc285cf8dfe0f497a1530f8016c","src/zlib-ng/arch/x86/adler32_avx.c=
":"99056732c7bd5d53dc108f282811a40bf21570926781af5dc7b17cb9218963de","src/z=
lib-ng/arch/x86/adler32_ssse3.c":"883a5520b4481225d097c90c5359106a3c8eb7b92=
1499c94276e999b7c39adc5","src/zlib-ng/arch/x86/chunkset_avx.c":"15060e7ee48=
7fb1daef9be25343ae387392276933921e4b4db0c67831dc0854f","src/zlib-ng/arch/x8=
6/chunkset_sse.c":"f7ccb55b67101ddb9def951a6d6f9dd4cb108fdd9e65f0f21d82723d=
1b093a22","src/zlib-ng/arch/x86/compare258_avx.c":"8b2838d168de4608327f25fe=
52d53763a82413ee911d87947d3fcd72c7f9bf26","src/zlib-ng/arch/x86/compare258_=
sse.c":"b5049722ffd4a43a96868eeba5e000271cfc5fcbf3c2657026ead15b1df28a10","=
src/zlib-ng/arch/x86/crc_folding.c":"75199cdd06ec2f8f43bf38583b2c4d98bbbbd9=
24e659267fdc1fa5134f1472eb","src/zlib-ng/arch/x86/crc_folding.h":"939212546=
611917e9e066e8ed30cdda95680ec1f5fe0890cc4865b4e6d7fc215","src/zlib-ng/arch/=
x86/insert_string_sse.c":"9e84a75b6a565422eb105261b6729d2a02b89133bd14372c9=
49d5381b5deed3e","src/zlib-ng/arch/x86/slide_avx.c":"5e448e439ac24e7cb10eee=
176ca37f2c63f73c135c0a2af040e232bad490997d","src/zlib-ng/arch/x86/slide_sse=
.c":"1946cabb634c905fddef0a22b2fad19dfd99110169567c3beceef71145b2e316","src=
/zlib-ng/arch/x86/x86.c":"1af56e27b2e951e1ad1344e62c2f7a8c49a776fcdd1cb0f4e=
a9d6152118a479e","src/zlib-ng/arch/x86/x86.h":"4d2d20ea0087089141e250e77bb3=
d419954b9092810028b151581b9115a5fe8c","src/zlib-ng/chunkset.c":"c0dbc7abbda=
d5137a9efb2b0a76a212e77d4bf44beebe721c68359fa83002ff2","src/zlib-ng/chunkse=
t_tpl.h":"35d15e97bd72d4e03dcec3ee804a08ea6a74faac2ef835caecc0e38bc9daf0c0"=
,"src/zlib-ng/cmake/detect-arch.c":"a9509327c2f4395955466b0acce453c29592d46=
86022714cb9e8b411d7e60c29","src/zlib-ng/cmake/detect-arch.cmake":"9cbb09b29=
7f79e94b55fffb9acbafbee8d6761e854d818f1a0c686e3fcddf574","src/zlib-ng/cmake=
/detect-coverage.cmake":"e4e372991ba80a16ad47df2716708a56013cc628aa7ed01573=
a2360c60610125","src/zlib-ng/cmake/detect-install-dirs.cmake":"87031a40428a=
104f5cf38ecdb8a5028d8c679cfa772a58adde8380c809b34eff","src/zlib-ng/cmake/de=
tect-sanitizer.cmake":"5e6fe6d2d877540811313f0c8e9884adb21a9ace2e24f23190f0=
fac1d52dd2b8","src/zlib-ng/cmake/run-and-compare.cmake":"dc45eeb6d3e4854049=
834ec1ec2891342646c7fb803a0b6c2644d6316f89b668","src/zlib-ng/cmake/run-and-=
redirect.cmake":"2de9c784da3e04331465a3c56125b9c7d8e74b898b4cf85353aca196f9=
0ea9bb","src/zlib-ng/cmake/test-compress.cmake":"3f37319963a80a31f752fca1c8=
2571d552fd4701326bc40fdb02b54ec3f7a3f0","src/zlib-ng/cmake/test-tools.cmake=
":"4dcf099245085ee2b6d8ec41620bca3f7b718365dbb9bb0ad23931e83bf36aeb","src/z=
lib-ng/cmake/toolchain-aarch64.cmake":"8d7ba07ee1cb9fbc7817da1c5e74ce6c85ff=
81c10962a33941f0e24471956e59","src/zlib-ng/cmake/toolchain-arm.cmake":"0b0a=
b2b1093ef851c3dbd6fe53f855628df0778841a488aaef85d2c70f04a257","src/zlib-ng/=
cmake/toolchain-mingw-i686.cmake":"6551576324fed6ccedffcfe8da762402dc863c20=
a2789a9b0030b9d32e15a15f","src/zlib-ng/cmake/toolchain-mingw-x86_64.cmake":=
"ec7bf5c8640fb61d2e30f8db7b588ca9b66da92d4a59e88ce16c5fc7f9ce02b6","src/zli=
b-ng/cmake/toolchain-powerpc.cmake":"6373abe883a99616aa51422a9b714894dc5212=
11be49502463576f58d3d26b2a","src/zlib-ng/cmake/toolchain-powerpc64.cmake":"=
328d1ea039a30e03ee9a552858b9f180b3da2614b712f618da1a0fa98f30a53b","src/zlib=
-ng/cmake/toolchain-powerpc64le.cmake":"ec90270bd1f4aa649abddddd2618168d399=
d58a1c1c35b3d8d909e570eb9be1c","src/zlib-ng/cmake/toolchain-s390x.cmake":"c=
b634252c21c4f55d06cdc49ce522a5546aae592daa0f12aa4282c0aef323828","src/zlib-=
ng/cmake/toolchain-sparc64.cmake":"d70d39760a23886ebd1c5a1a87651bfb47a9b24d=
ef9e7955ee1cbec60b40925b","src/zlib-ng/compare258.c":"56bfd48d5ff9ca422fbb7=
28df7a373436c73796561dff118c7d4039fe70d29e2","src/zlib-ng/compress.c":"1abf=
5b13e3e805becc14f4f16dad9bf816f4fe41754b1abf75f670dcc84567cc","src/zlib-ng/=
configure":"681d5b1303aab0523334c90ff049757e7ee6b2683f2411204b7245ba4adca4b=
2","src/zlib-ng/crc32.c":"98440be8a99381151a2d740f2e2228e8c1b23b9193c3642c5=
2a4e34799506336","src/zlib-ng/crc32_comb.c":"78cd1a3d31963bfa5bd9d476250b2b=
b7777b12b6ebe0475acf021ca794757165","src/zlib-ng/crc32_comb_tbl.h":"d6615d2=
09d6c7d5248c6f7fe4e5dbded13c0eb87997b37693032c2902927407d","src/zlib-ng/crc=
32_p.h":"1fa91375a18e090c0a0dfda39de3df36346a0b1be36c808be6b6c29c32eba922",=
"src/zlib-ng/crc32_tbl.h":"d629378ba38ff5775095b64e277bcd41c4b89fab9b5647a9=
fb29e15da0db0161","src/zlib-ng/deflate.c":"1a5ff34bf68b88e30f578ce7b15dd996=
c05fed7bf42f58f4616af470ee18f103","src/zlib-ng/deflate.h":"a074e9a5dd5d689d=
b63655251d6a0948e7a7c0c4a4f6d0ca60bfe18291f3c34f","src/zlib-ng/deflate_fast=
.c":"b3b261b3a02b089599fcd9448965ef5d8e8b0e8e9556857357c9632930c7c748","src=
/zlib-ng/deflate_medium.c":"1c3d95cbac76052d39595ea750c5536541c18302b9abb39=
8c27b58955318bba8","src/zlib-ng/deflate_p.h":"95026b1b48aa78204381b32617dd4=
4e8c820c9bb21b415ebfcb33e6b5255233e","src/zlib-ng/deflate_quick.c":"280905a=
191d2b2a7274f2453ac537e01a0fb6e7540a0b212c1514bfb8c9415ea","src/zlib-ng/def=
late_slow.c":"a2c66723e1e71ffd6ff856407459ab311a4c6546ecf50285081fc7afcd0cc=
d2e","src/zlib-ng/doc/algorithm.txt":"992590931e982c0765286c2d83f6e9ff0a95a=
abb08e28c30c52bae3e8c4bd5ad","src/zlib-ng/doc/rfc1950.txt":"8f0475a5c984657=
bf26277f73df9456c9b97f175084f0c1748f1eb1f0b9b10b9","src/zlib-ng/doc/rfc1951=
.txt":"5ebf4b5b7fe1c3a0c0ab9aa3ac8c0f3853a7dc484905e76e03b0b0f301350009","s=
rc/zlib-ng/doc/rfc1952.txt":"164ef0897b4cbec63abf1b57f069f3599bd0fb7c72c2a4=
dee21bd7e03ec9af67","src/zlib-ng/doc/txtvsbin.txt":"47c273bb22c9773248d3805=
49a330e5c262266b1292154b0d3014f731cc73f47","src/zlib-ng/fallback_builtins.h=
":"f07e83c5c444554577c4240ff7722057ea2a689f6baa0f9e8bda32b9a46888ca","src/z=
lib-ng/functable.c":"d3747a4674ddbc903ab1d06efe63a1c4b52bf42f7dd38cde3701fa=
82b1d953f0","src/zlib-ng/functable.h":"e5a2d0c10411d23f04295bcb9ddb98893889=
74b723caef65aa5c4ea4739f4aa7","src/zlib-ng/gzguts.h":"cbf2afc8a6183002254a7=
3cabe8376e54b1aea2ba042e36138f292c9cdb95d5c","src/zlib-ng/gzlib.c":"5b5bea4=
f319e5d0a96b92aa431fb33926686cd20686c90d75e42e1481872bbcf","src/zlib-ng/gzr=
ead.c":"fc4a187ba45ceb7b4b50f4f8dedc7685fe8687e6f034638a6437bebf71d51a13","=
src/zlib-ng/gzwrite.c":"7c86058ae23f856c099e2663a5676c97cfa4fb5df9b92893c94=
076ba4aa9a56b","src/zlib-ng/infback.c":"97a35de1a3d3bec50e112853e03bf1628cb=
ed3b0fb84459cc423e3f9f61fbea7","src/zlib-ng/inffast.c":"701519ee11d39cdf4e8=
08395722415c42ff2be9445f66408fd879370f3242b57","src/zlib-ng/inffast.h":"42e=
74a92b496ab0726be317e8497a12bf3c3cf3d0d533440ce65befd3929c71c","src/zlib-ng=
/inffixed_tbl.h":"a94225335396245e9f0ccb2e9b4b334fe7ee0111ed8e32a26bcd52187=
f364314","src/zlib-ng/inflate.c":"a665bf717ee257a16a8ab993241f2cf9e71d49882=
addddb9518b88186f82a5cf","src/zlib-ng/inflate.h":"eb25527d1bdedaa45167926dc=
e4c39d9aaa3147b0f4a95f38f5916528c30a09b","src/zlib-ng/inflate_p.h":"4a94c51=
194da119770cf662ef289994f0c78d95184d54d6ae5d50a393e8f5a62","src/zlib-ng/inf=
trees.c":"d1d88f98f9129c87f3ce1d6de5bea3ec867de23b1b2bdd585257d231aac82a4f"=
,"src/zlib-ng/inftrees.h":"624c6653a454447c6274adf922430a19c96ef73c7687e455=
9d247ff48970bab5","src/zlib-ng/insert_string.c":"aa22ba53a1e75821499809277f=
9ca0e5ef92b07a618136dd11ae1734e233b7c9","src/zlib-ng/insert_string_tpl.h":"=
1ceba9903324d10aad6e1d83653c4d534a5b06fd09076414a06215482be00bac","src/zlib=
-ng/match_tpl.h":"eeab4c6eea8511a7579738e622af062ad16f4016312e93ad34bc5903d=
8b3c4a1","src/zlib-ng/test/CVE-2002-0059/test.gz":"60bf96b8f433bd7e057ce349=
6aceaccd70ec80f596a4aa8bcc7786056705ce66","src/zlib-ng/test/CVE-2003-0107.c=
":"1bfbc88dc501cd92b8b26bd8944af6b150b376ebfe7241d90e2b93109be3d68c","src/z=
lib-ng/test/CVE-2004-0797/test.gz":"38caae524705f676bde13a8df9fc8c7d2fe105b=
a6bdbab62a405b0276fd3aa2e","src/zlib-ng/test/CVE-2005-1849/test.gz":"e4d5a6=
0617df4b5dd44eda94751ce1eacdb325792bba6e3cc4676719a3adf742","src/zlib-ng/te=
st/CVE-2005-2096/test.gz":"8f702d4861aa3ec98ac03a59ff26b430939630cb5cd4266d=
2658d3b836d576f9","src/zlib-ng/test/GH-361/test.txt":"358497d0a7251ea42101d=
c77b02337f46fd89af09643a8288e2a3082e5d24128","src/zlib-ng/test/GH-364/test.=
bin":"af5570f5a1810b7af78caf4bc70a660f0df51e42baf91d4de5b2328de0e83dfc","sr=
c/zlib-ng/test/GH-382/defneg3.dat":"b22bef6b7392401c9e7b079402c4a4074053d7a=
914d050400e37fd7af6fe26d5","src/zlib-ng/test/GH-751/test.txt":"b83d833803b7=
bc3124fb2a0034081f0b999ad10c33a8dfa3bfd181dc078ae3ee","src/zlib-ng/test/Mak=
efile.in":"c3b6a1ec62838c140a78bc361448d5739756bbfa3bbbf1ffa64c342599949701=
","src/zlib-ng/test/README.md":"fc485cfaaede6b3d3dc61fdd17cc7eee715c35d6f62=
e6e502f9251fd1b5edac9","src/zlib-ng/test/abi/ignore":"02aa87f77656dbc1fbddd=
23f436cd15465a92df0722da4055cae1bc8bf013097","src/zlib-ng/test/abi/zlib-v1.=
2.11-arm-linux-gnueabihf.abi":"f5e91f25b558a891fecbeb6e2e9575698630ab700d05=
5a38f3bc4fe66257f513","src/zlib-ng/test/abi/zlib-v1.2.11-x86_64-linux-gnu.a=
bi":"038337383cf780587d810cf5400d632f3a1f8517e63ac4a71b6e5224db8b1413","src=
/zlib-ng/test/abicheck.md":"fa5d6d33ff0fd95eefb7c6c0c7f67351282e6eda20c4e38=
842235a610cc10382","src/zlib-ng/test/abicheck.sh":"b23ee3678acb24caf36fc840=
2a07452de73c50640ebe641f185c7f9d5ea257e7","src/zlib-ng/test/adler32_test.c"=
:"db3e8ad9a4e2ecce0c052b0bfe19834d3ff2fb2e9239cc3438a2c95db00b1d21","src/zl=
ib-ng/test/data/fireworks.jpg":"93b986ce7d7e361f0d3840f9d531b5f40fb6ca8c14d=
6d74364150e255f126512","src/zlib-ng/test/data/lcet10.txt":"938e69e61b3411d8=
a9e2e630f4265000d810f3dbf66bac58cac19493753526ec","src/zlib-ng/test/data/pa=
per-100k.pdf":"60f73a051b7ca35bfec44734b2eed7736cb5c0b7f728beb7b97ade6c5e44=
849b","src/zlib-ng/test/deflate_quick_bi_valid.c":"0e00da0e048c46204c39aff4=
b8fb79890274d3c6183a9409aefd5c93e4e92a48","src/zlib-ng/test/deflate_quick_b=
lock_open.c":"455bd347bb88debdfacb409846170274991ec9ba71c52b8fd0e526daf5726=
5eb","src/zlib-ng/test/example.c":"8bfad1221a8df5b6202e11f6be4bae5dbccd8a24=
fb7bbd8dd88e7ecd318907e7","src/zlib-ng/test/fuzz/checksum_fuzzer.c":"3a1547=
9f2cb40b6c5760dadb246328fab7315f3e3b8e28c1bc246c9b9a867c69","src/zlib-ng/te=
st/fuzz/compress_fuzzer.c":"1ab70608075c4bc60f89aa2f327cff88362ee7b1d31da88=
ed54ca51e5f99e5c9","src/zlib-ng/test/fuzz/example_dict_fuzzer.c":"042621053=
050f0fde90a0428cd1afabda8cc7c3fa59e3e0a55c43ab1e03d3988","src/zlib-ng/test/=
fuzz/example_flush_fuzzer.c":"f12246a184dcfe0a19a98cdc742a1fe8da388ad20b406=
635d63f1fa10d45b9ca","src/zlib-ng/test/fuzz/example_large_fuzzer.c":"f490ab=
cd332fb4e7921292adf6876d38d7f71c8d2443212c781ba88957ff9303","src/zlib-ng/te=
st/fuzz/example_small_fuzzer.c":"a9b3436b291ace821b6013311a1100e19a9e1c67fe=
fd3f97dbd60688f9bf22b1","src/zlib-ng/test/fuzz/minigzip_fuzzer.c":"7b0e7da9=
b6c60f3b3a13f140cc445050d9e8958d4f59cbb9a498c08f3a53adab","src/zlib-ng/test=
/fuzz/standalone_fuzz_target_runner.c":"306e8ac4e08ea72d18ffae8c908abfef8c6=
feedf83b068a7ec675ade6a5791a8","src/zlib-ng/test/hash_head_0.c":"d88105a80e=
756b7206a20c7b2490a2e7e743a2ceb1f20d3e433ce9848f054e1b","src/zlib-ng/test/i=
nfcover.c":"b9acffc102fdd140941073ca47e30c938aa937b4929061500c36ffba12c8644=
9","src/zlib-ng/test/minideflate.c":"93de8ffcbe7c414abf3ea36acdf729bcedb403=
93ec7bd10b356ebe225406e173","src/zlib-ng/test/minigzip.c":"291e2ea30778a3e8=
29b96cb47211e89494ece036cd74591178710b4276c9b48f","src/zlib-ng/test/pkgchec=
k.sh":"75b3155125f235e27ee434d76b6f72bd825899b55f6d59ef2d032fe67a2896ed","s=
rc/zlib-ng/test/switchlevels.c":"c30ae3d27ce6041934532553719622e7ed473541aa=
7bdad8d11d0c55e5220f14","src/zlib-ng/test/testCVEinputs.sh":"5de6198444c167=
26f8e0a8f2beb5b89c5ae7e7e3736ce760b9fbc719493e7e4f","src/zlib-ng/tools/code=
cov-upload.sh":"ec7a8f1405820810e486e3d7e2fda7eb958c17877b0000b93abdf09d877=
32a2f","src/zlib-ng/tools/config.sub":"32186cfeb5db62c99e1dfbfb07f24c1a5097=
7447b4c26d2907021c74422a70d2","src/zlib-ng/tools/makecrct.c":"55c8f7b8e2939=
3e95988a29de8cb1a1bdf2738a69d53627bd0f9d7bf169bf0a8","src/zlib-ng/tools/mak=
efixed.c":"bffd02540231304f9bcc755b8cb9ae5cfbc48975857bbb4547f1d6acce21ef57=
","src/zlib-ng/tools/maketrees.c":"2dbfe34691dde327618be496b380fc91daaa3047=
4352815773a8b70114b0541a","src/zlib-ng/trees.c":"956ce5b3f3330320cb5baadbf7=
721572259ec41edc4d8c132a20888b7f6f60c3","src/zlib-ng/trees.h":"24174f3543b0=
1ee1ef370bbf6d15551a21871cded18b2aadf09a71e7904b6f99","src/zlib-ng/trees_em=
it.h":"f68904e04caee0482c72ea92cc775cabe35a0bf7cffce85566c15ace27666af4","s=
rc/zlib-ng/trees_tbl.h":"35f4fd0ec080c1ade342e2dd1b0f5cdc7e9f18990faa48d7a8=
a69bc318ebe607","src/zlib-ng/uncompr.c":"4ebb486b27930f8a6ec4a3cc90a207d0bc=
f8a4779d1dbf3b2184a2b2a5735cd1","src/zlib-ng/win32/DLL_FAQ.txt":"d2ec63cb4a=
51886e0813f75bca49a051bede364d855f938e1a7992ab97a79800","src/zlib-ng/win32/=
Makefile.a64":"775d6902373d1583430b5d7467f001746be323610c89be27e02bbfe02059=
94f3","src/zlib-ng/win32/Makefile.arm":"7535e022f482920c3fa7a267e84e39ad790=
d150f72e5c30414baa156c2fdd9b6","src/zlib-ng/win32/Makefile.msc":"deee44d562=
4890e692d87db311216075e967c3ac8aeea6ffcdcac3d03eea260b","src/zlib-ng/win32/=
README-WIN32.txt":"a8c2d052960b963a49cee5a2ad891f2ff7b34db038f00985eba4eefc=
99966261","src/zlib-ng/win32/zlib-ng.def":"f240276caf805a10d024fc6a66efe915=
c435734c69732818d92fb04d08ab350c","src/zlib-ng/win32/zlib-ng1.rc":"b567a276=
407998bae40aacd48a50beba87c0bfbae470d28e66331ac99eb575c8","src/zlib-ng/win3=
2/zlib.def":"d9c371ff2677567350386441a2e3d0258010d6502290bbac5ac42ea168bd52=
12","src/zlib-ng/win32/zlib1.rc":"d7f269379144d65bcd1b67c1065e5d4120579f14c=
e54ecf246eaba394fa989a5","src/zlib-ng/win32/zlibcompat.def":"73728b9df4379d=
c70ebd9b2a9f20d6e4ed7c031fa1f351cdeae1de7d1db05bd1","src/zlib-ng/zbuild.h":=
"f73424f5f10370ffe8f45f6e3dc52dd095ea778153832461d712a838e3a01098","src/zli=
b-ng/zconf-ng.h.in":"708106f26c4a0d877e2ea644320a2b48b144524b61429c7490e2e7=
42a0c0c1e4","src/zlib-ng/zconf.h.in":"dacec2360fd9607f85bdf651409fa3831dd26=
f74414d242e812b06c3b9c9926d","src/zlib-ng/zendian.h":"f5cfa865281d2c5d0b097=
d318500f27daeec346e7882de68e279486d79c52e77","src/zlib-ng/zlib-ng.h":"7a15b=
da0297b2611da695f895cc57ce44c284b030fe98817281e868a1a86ae35","src/zlib-ng/z=
lib-ng.map":"e8202981574d814cb2a9f06bca7900d0959c24766bd86681bd3843ab0e71f8=
ef","src/zlib-ng/zlib.h":"703bead0c02381c8df8d14d805fde913973b2960811f35e2d=
e4f4aaf29ad905c","src/zlib-ng/zlib.map":"e3549810f821d433d57f921ca2fceb8674=
574f778485255a7dc691bf26b5281b","src/zlib-ng/zlib.pc.cmakein":"17668e07edbe=
5971043bea26a2f2b92c4c7cf4724620f1156f3ea1436d2aac93","src/zlib-ng/zlib.pc.=
in":"cf94c9aa44878a62e27c2f75354c08326b3bb5250a9b11496855cf59691177bb","src=
/zlib-ng/zutil.c":"7544aa2d2cfce4693d4e2a639f0631c3e8b3e7d0d846313be0e250c4=
77e6812c","src/zlib-ng/zutil.h":"c0e9152d078ca1774c93910fd84531b2f593b3a6b1=
035e4d97a0d28b720ec98b","src/zlib-ng/zutil_p.h":"1e5a2fb8d15212ad094e9a5d5f=
607f11f8191498b54e0af48d722f92d9c71ffd","src/zlib/CMakeLists.txt":"b8727573=
1cc3ebdfea144187875cea204f555c343279c0f35f2d46d661bfe34a","src/zlib/ChangeL=
og":"4c9f1a65b9b4be8bf164a97775ef50e4db4e02ea8c9933fdbe629a640691375e","src=
/zlib/FAQ":"1e8a0078be0ff1b60d57561a9e4a8cad72892318a8831946cba1abd30d65521=
c","src/zlib/INDEX":"3b4e325d47ae66456d43fcf143ba21ab67a02a4f81be7ef2da480b=
a30d774266","src/zlib/Makefile":"ef23b08ce01239843f1ded3f373bfc432627a477d6=
2f945cbf63b2ac03db118a","src/zlib/Makefile.in":"5021b2bac4164f48b17c91c8a2e=
3c225be7ad31d8bfab1bbaadd90370afe9991","src/zlib/README":"7960b6b1cc63e619a=
bb77acaea5427159605afee8c8b362664f4effc7d7f7d15","src/zlib/adler32.c":"d7f1=
b6e44fee20ab41cef1d650776a039a2348935eb96bcbd294a4096139be3a","src/zlib/ami=
ga/Makefile.pup":"a65cb3cd40b1b8ec77e288974dd9dc53d91ed78bbe495e94ccc84ddd4=
23edf1f","src/zlib/amiga/Makefile.sas":"0e63cf88b505a1a04327bb666af3a985c5e=
11835c0c00aed4058c0dcc315d60e","src/zlib/compress.c":"5c11e1fc22e219cb986f6=
fa9e4ba939315227e84aef042737d38ec668b89b6d2","src/zlib/configure":"86b38f27=
f31d2fec76d9355872550dc63cb3949774473fd6313c5a3fd1def0e2","src/zlib/contrib=
/README.contrib":"ca39b78bd7ad84f1df7b0da90770c5b3fa4c8e2c75d132e9222812fac=
8839630","src/zlib/contrib/ada/buffer_demo.adb":"469cf566a6965767fee6b987a2=
39ed8cedcc66614940d45a9b434331fbb435ce","src/zlib/contrib/ada/mtest.adb":"4=
1b6f31684770334afdc4375871eb1408542f37a823a073556fdbfdb63753160","src/zlib/=
contrib/ada/read.adb":"fa5b989aef0c5715a3fcb15de93985f7f10aeb0a7f5716745c95=
ed820eb9af9c","src/zlib/contrib/ada/readme.txt":"8fe9e5303f2e8e8b746c78250e=
74b7c4aeb7ce6212fdce751fc3a0ce56a47fe2","src/zlib/contrib/ada/test.adb":"5e=
3abe79b387e09a9a42bd0543105e228f39a335240cffc33d71f0ba66ff2511","src/zlib/c=
ontrib/ada/zlib-streams.adb":"f45988e2bac76eb25a0dc981f46576e7432c35dde1790=
bbc2b650f0090b7fa72","src/zlib/contrib/ada/zlib-streams.ads":"969e8edb06118=
10fb52159dcb7c40228f4e5da810a7a3576b778116a93038c6b","src/zlib/contrib/ada/=
zlib-thin.adb":"03d89244ee5ec9771d9b5050e586c609f851af551b2e64eb151f1d5be0b=
63ae9","src/zlib/contrib/ada/zlib-thin.ads":"631ef170bde16c3ca8d412b54a0e51=
9815b80197d208f8f393e6fe017bb0968e","src/zlib/contrib/ada/zlib.adb":"c9ca5d=
c34fbcdf06e2dc777b7e9dcd0ba31085b772b440eb0e12421323ab672c","src/zlib/contr=
ib/ada/zlib.ads":"02634bec0d5e4c69d8d2859124380074a57de8d8bd928398379bfacc5=
14236d2","src/zlib/contrib/ada/zlib.gpr":"859bb69dce38dbe9dca06753cf7ae7bd1=
6d48f4fece8b87582dab8e30681d3de","src/zlib/contrib/amd64/amd64-match.S":"16=
6007f7e9adb58fe8b83d85bbfe823f5e05858ba1d06edf637b78886caa2c69","src/zlib/c=
ontrib/asm686/README.686":"c21cc7147c956ecae17dd084cb41a206b086216fa5210128=
71fb07fafd203c6d","src/zlib/contrib/asm686/match.S":"873799062495629f21cd3f=
779ea4b927add7aae0144e32d3594d9ce70185e99d","src/zlib/contrib/blast/Makefil=
e":"17d5d26c24bf51cad51045a38ffb73cc3539d29e89885aa249fcfd45a8659d5c","src/=
zlib/contrib/blast/README":"baa763ae03d88ef7ece6eb80d9a099b43d0b57639d6d281=
e1c7c6ca79d81daba","src/zlib/contrib/blast/blast.c":"1ab3e479d342bfc144167b=
808fb00142264bc50f24a110ca88cc774e351c218e","src/zlib/contrib/blast/blast.h=
":"4d4e3e6f893316f0be77bfd642c857a77f1fa2925acb5df9753e543d35aa3a6a","src/z=
lib/contrib/blast/test.pk":"5f5c262c545574a5c221132d5ef832478d222d70b015341=
795b3860204140d7c","src/zlib/contrib/blast/test.txt":"9679b2c98e1283222d078=
2b25a1c198dc64ba9ebd1addd6dc6f643a45947cda3","src/zlib/contrib/delphi/ZLib.=
pas":"1b20e173443a68c189cdaa4795620fb1ac165d9e61a27a1ed2cf690f13530d6f","sr=
c/zlib/contrib/delphi/ZLibConst.pas":"84bcc580bdf397e570f86f3f5a5b8c7bf5378=
28f30b4b72648b81911f6bf5095","src/zlib/contrib/delphi/readme.txt":"f7420ed2=
de77d4b498eefbbe6402a1d17dc2d411735289c78a265c7f10fdaee5","src/zlib/contrib=
/delphi/zlibd32.mak":"850e91b6c9ea05de61a411cbda16fa0f10118cd88bb32c4b72269=
88776f8d511","src/zlib/contrib/dotzlib/DotZLib.build":"b96137097669644ecb9f=
42cdd3399d1fce9c512788374609303f7e50abf597f0","src/zlib/contrib/dotzlib/Dot=
ZLib.chm":"20d0e3edd57f849143255a7f0df1cd59d41db464a72c0d5ab42846438a729579=
","src/zlib/contrib/dotzlib/DotZLib.sln":"a979198c5b8d144c1ac8f993bfb6f4085=
d135aa58ca9dcf63ebabf52b5c695f7","src/zlib/contrib/dotzlib/DotZLib/Assembly=
Info.cs":"314afcfb339ea95f5431047b7ab24631b11c3532c7ce5dc2094ed0cf80a7c16d"=
,"src/zlib/contrib/dotzlib/DotZLib/ChecksumImpl.cs":"e7c047a2c3bcf88d3d002e=
e3d2d05af414acf53cb4451efacc0f2e95a474ea0f","src/zlib/contrib/dotzlib/DotZL=
ib/CircularBuffer.cs":"be84c9736fe7bdc2bfae70466d8fff582504e928d5b5e110fd75=
8090090c8cb7","src/zlib/contrib/dotzlib/DotZLib/CodecBase.cs":"259bdda1b7d6=
052134e631fa24bfd9dca6e2362563496c8b85257b56c848908c","src/zlib/contrib/dot=
zlib/DotZLib/Deflater.cs":"06ba6696a3c15c53ba5fd5a1c2bf50b51f217010228fc1e4=
c8495ee578f480de","src/zlib/contrib/dotzlib/DotZLib/DotZLib.cs":"9837fe993f=
d631233cc5e53ff084d86754b97f05ec77c54b0764c2706f186134","src/zlib/contrib/d=
otzlib/DotZLib/DotZLib.csproj":"21606db31dfef6410dd438b73f1db68856eacabcce6=
c0f0411fc4f17e17001f3","src/zlib/contrib/dotzlib/DotZLib/GZipStream.cs":"8d=
1de9755c77046b4ac71340a0a54434ebf4fd11b085c44454d7663a9b4df1c5","src/zlib/c=
ontrib/dotzlib/DotZLib/Inflater.cs":"9016ca73818f5b6a28791abc3af6da7c4d2773=
b6a3804f593f6d5737a62b99ad","src/zlib/contrib/dotzlib/DotZLib/UnitTests.cs"=
:"ad66ac08de34d253e9615b96a745f3dfeda93f4a978d65d5d3ddb9d0d9b3e099","src/zl=
ib/contrib/dotzlib/LICENSE_1_0.txt":"36266a8fd073568394cb81cdb2b124f7fdae2c=
64c1a7ed09db34b4d22efa2951","src/zlib/contrib/dotzlib/readme.txt":"d04972a9=
1b1563fb4b7acab4b9ff2b84e57368953cc0596d5f5ea17d97315fd0","src/zlib/contrib=
/gcc_gvmat64/gvmat64.S":"22ff411b8b1d1b04aeaa8418b68245400267dc43c6f44104f6=
ccd37f0daee89f","src/zlib/contrib/infback9/README":"890288f02bb3b1f9cc654b8=
7a07fcea695f90f6b9bd672d25bf6be1da2ec1688","src/zlib/contrib/infback9/infba=
ck9.c":"0a715c85a1ce3bb8b5a18d60941ffabc0186a886bcc66ba2ee0c4115a8e274e9","=
src/zlib/contrib/infback9/infback9.h":"dda2302f28157fe43a6143f84802af174039=
3572c2766559593996fd7a5a3245","src/zlib/contrib/infback9/inffix9.h":"84a2ba=
4727767c18af6505f0e81d9c814489c8b9ed330a25dad433db72997e43","src/zlib/contr=
ib/infback9/inflate9.h":"32a907676cc36e27d0fdc0d99adb83a0b23f20ab6189626921=
6d40fecf08d349","src/zlib/contrib/infback9/inftree9.c":"0c7f10396703b230c50=
4207fe1595a2f2f8ba9c43158c4bd79d5b22ca36e04e0","src/zlib/contrib/infback9/i=
nftree9.h":"8ae61d52e50d2dbdb0378548ecc54fcd88f108c8b6fc30562a3ebec1ca6a599=
e","src/zlib/contrib/inflate86/inffas86.c":"6f266f3c7e0faca653256d0189c0f00=
d7dc0b062d02e25df4e1202e49369595c","src/zlib/contrib/inflate86/inffast.S":"=
70777bd21526680005fc34f086d108af49e2668ad86d1749e8e8100a81bfb288","src/zlib=
/contrib/iostream/test.cpp":"0f3c77e013949eb9c91e6b690ea894e19d97944d6b0885=
b82806fc3ad99680cf","src/zlib/contrib/iostream/zfstream.cpp":"8ebb9b3d521cc=
3392953f27658cf1f6dcb763216079f69a1518ec5ca0e42a63b","src/zlib/contrib/iost=
ream/zfstream.h":"4369c35e66f63f52ca4a5e1759bf720507ccabb8f3f132e2f18e68686=
c812401","src/zlib/contrib/iostream2/zstream.h":"d0343e0c57ff58008b6f29643d=
289c72713aa2d653fe3dcd2e939fc77e7e20b6","src/zlib/contrib/iostream2/zstream=
_test.cpp":"f789df183cc58b78751985466380c656308490a9036eb48a7ef79704c3d3f22=
9","src/zlib/contrib/iostream3/README":"43ec48ecbd95a8c45db20b107fac73b740b=
b11595a4737329188f06b713972cc","src/zlib/contrib/iostream3/TODO":"af5ebc83f=
b88f69706c8af896733784753dead147687e1c046f410c0997fd88b","src/zlib/contrib/=
iostream3/test.cc":"8e17fc48dfdbc6e268838b8b427491b5843b6d18bc97caa6924de9f=
ad7abe3da","src/zlib/contrib/iostream3/zfstream.cc":"8cdd67ed0b13c192c11e5e=
a90e9d5782d6627eb303fbc4aa5ebda2531ec00ff8","src/zlib/contrib/iostream3/zfs=
tream.h":"1bd74778fac45ee090dfc0f182a23e8a849152deb630606884b2635987b357b1"=
,"src/zlib/contrib/masmx64/bld_ml64.bat":"1c0561908a07ebdff271b12ed757241e1=
813d3db0f3551501b2595c23f0833aa","src/zlib/contrib/masmx64/gvmat64.asm":"39=
0c1e6d63cb615b5ba042842738953f9cdc688b2fe35aaca981fd3fae213f3f","src/zlib/c=
ontrib/masmx64/inffas8664.c":"f6c585e43e6e524107566b1f10104949d0ef902159ac8=
203e1d98e50d4bedd62","src/zlib/contrib/masmx64/inffasx64.asm":"8448d0041fe6=
e8f4188fe5916181a1b274c6d35d75cfb28da60cf4f1edde44ec","src/zlib/contrib/mas=
mx64/readme.txt":"9bb66b5028100855683853f12da0be479c7bccf74365fdbf37da2542e=
dff9927","src/zlib/contrib/masmx86/bld_ml32.bat":"b0b05b62715d4a81a7db5b7ca=
4a372d109ec95634c9d3bef9e0041ff52de22fc","src/zlib/contrib/masmx86/inffas32=
.asm":"78d2cc88f8ed0e32ef960efc987c257bc1688afe7d031a8ba18761e95a6a7c3f","s=
rc/zlib/contrib/masmx86/match686.asm":"9e9bea3b5517b089da7d39caded07982746a=
33f94f0907ca7e8afefed7be36b6","src/zlib/contrib/masmx86/readme.txt":"1f29a0=
4e0227b74e20ba1b7c764b3ca5bf596dd2c06e89bc19a05fb8f9689778","src/zlib/contr=
ib/minizip/Makefile":"087034de3dc0223b29e64bb3a4fc3eda7b948e93d2a9ff154aecf=
9fed2a1eb5b","src/zlib/contrib/minizip/Makefile.am":"2313a3480a2c3745fa7ce2=
16829cd0367058907d3a0902e5832c66c84a2fdfc6","src/zlib/contrib/minizip/MiniZ=
ip64_Changes.txt":"302c62b328647f5472fb7755249a83459be7f8ffb1fae07e8ba318fc=
e8f4126c","src/zlib/contrib/minizip/MiniZip64_info.txt":"122719c32ef1763a5f=
6ba9c8cdefc1d78a76f7156b09e7b6f69b73f968e0dac3","src/zlib/contrib/minizip/c=
onfigure.ac":"35330dc0c6188127afd339829d91b19739d23bf3b7301bfb04f775a6fcbbd=
ad7","src/zlib/contrib/minizip/crypt.h":"8e872b60255b8447da99885c7159c2e1f1=
bb8143523bdbe71784e60f98bfd67b","src/zlib/contrib/minizip/ioapi.c":"66b39c2=
7042f6ad12cc12efb0c82cdf100c6640b5fa959b8b866e252966113a9","src/zlib/contri=
b/minizip/ioapi.h":"8655408534b78dc0889a45f9359fc6d2d5c8e8d8443b81ede596f95=
4c720ef48","src/zlib/contrib/minizip/iowin32.c":"2c05bc374d3d847c6a9f29eac9=
d674abba7659d1e91e34e172248fcb5c274d51","src/zlib/contrib/minizip/iowin32.h=
":"586f22b9c3c64da253ce2b518e0fad61f19a7b47b289fc704cc9708242294c49","src/z=
lib/contrib/minizip/make_vms.com":"65736d9c4888f2373d3db0a13864d150c5040453=
f5bc2a5c8784379a7ea67590","src/zlib/contrib/minizip/miniunz.c":"ced49f20c62=
536a8ffb270b35cfa4994a1dcdce45f8cf059b941c94ca0022666","src/zlib/contrib/mi=
nizip/miniunzip.1":"66d8684392167091ef0fe01598d6a0daa26e7e448e2df6c3cb25748=
7735b83f7","src/zlib/contrib/minizip/minizip.1":"5404596e8e5587a52f56390611=
9f32ceee30a6d97a966afa5c7afbe4d373e210","src/zlib/contrib/minizip/minizip.c=
":"fdfcf83979ef2324c1455d369e8add8678c804939d412ce53f8b024578ceabad","src/z=
lib/contrib/minizip/minizip.pc.in":"8b6670b42d8e5e519e1cc89db093efc07ba23cb=
1ddfedd3c93ff2df08c3ce8ac","src/zlib/contrib/minizip/mztools.c":"cd887c4af6=
d20823bd15f24008b10acf01969b4165d7848656bde843a92428d7","src/zlib/contrib/m=
inizip/mztools.h":"6f82c52279e8f79165f4446be652e5741a49992ac58632470335aa34=
c564072a","src/zlib/contrib/minizip/unzip.c":"497adf676b1cae2a7afa834e4aba8=
6383f7b697f5fdd03a8179ea9024a431cf9","src/zlib/contrib/minizip/unzip.h":"d8=
dc58fc0121b6a4b98f3028205bb253f956b1ddf791e9ced3cf44892502a01f","src/zlib/c=
ontrib/minizip/zip.c":"00f403cb7810578b4b2687dd55fb132c850c3630fba2f3704a8a=
b896fcc8209a","src/zlib/contrib/minizip/zip.h":"96163fc140e4bf08752e014d20a=
1eac3f5adcdc408366f6d79c1895f2599cf08","src/zlib/contrib/pascal/example.pas=
":"d842d456ecb6ff80e34cee2da31deb2072cc69ca837497bea8b8bee203403474","src/z=
lib/contrib/pascal/readme.txt":"02f997c37991ddae0cb986039f7b4f6fc816b3fd0ff=
d332cad371d04c12cf1b9","src/zlib/contrib/pascal/zlibd32.mak":"850e91b6c9ea0=
5de61a411cbda16fa0f10118cd88bb32c4b7226988776f8d511","src/zlib/contrib/pasc=
al/zlibpas.pas":"28b90aeeb3da8d1f6a98ab9f5f1603d08aba5bfabc50827d3f15e66126=
8a51cf","src/zlib/contrib/puff/Makefile":"d9d738030464aaae354196c14fd928adf=
591832fce7d71ac1977c1d8d4923a4b","src/zlib/contrib/puff/README":"aceca4bc1b=
ce7d9445b8bc9b6640c672d95708185f6070d3a3baae7a9d102caf","src/zlib/contrib/p=
uff/puff.c":"6d0eef92e115a42e570b79d8b07a04af5ccbd6b3f3fbca9cbc61c49db9c9df=
43","src/zlib/contrib/puff/puff.h":"969b7be2a930db0cdcb19b0e5b29ae6741f5a8f=
663b6dba6d647e12ec60cfa8e","src/zlib/contrib/puff/pufftest.c":"8ee0da78a122=
1a3c2036e22eed06c2faa27a671a46565a60e10111d4ee9c30ee","src/zlib/contrib/puf=
f/zeros.raw":"b7b0887089f7af1f6d1e0b4c0a1e8eddd10223b23554299455c6c9be71b65=
3a3","src/zlib/contrib/testzlib/testzlib.c":"c6c37b35c6ecc9986a9041f86d879c=
c37a9e4d8315af9d725071eb3b2cade0c5","src/zlib/contrib/testzlib/testzlib.txt=
":"2359bbdc84eb8a04e0f1cd16cd81a2896e957f2ad58dab3ca78ef55b7d0dc577","src/z=
lib/contrib/untgz/Makefile":"8f5ab1564813e091cea8f1bb63da32fd80ac763d029277=
b0cabf50f60aceefe1","src/zlib/contrib/untgz/Makefile.msc":"d0f537de11d9e0e3=
6e2a98b3971c537265f4b533b4c48797094365ad9ae8388b","src/zlib/contrib/untgz/u=
ntgz.c":"9a12d774301d252dcd38bba07ac369319da4c04c4fef8a50fcbf40aebf29c2a1",=
"src/zlib/contrib/vstudio/readme.txt":"2a9ca40b68274f4d37649dfab9e5e867a000=
883592b4ab8fdaec8425a63052c3","src/zlib/contrib/vstudio/vc10/miniunz.vcxpro=
j":"dd607d43c64581172c20c22112821924dfe862f56b2e5eb8780bdd0714d9527b","src/=
zlib/contrib/vstudio/vc10/miniunz.vcxproj.filters":"c3db9f97952683e688ad83c=
13bb94c816ac3e6b5f277fdea545b0650c125aa6d","src/zlib/contrib/vstudio/vc10/m=
inizip.vcxproj":"af73f2cf8ae51e65e85342faeb40849a2310c97bc77def42b38d707046=
0a6cf0","src/zlib/contrib/vstudio/vc10/minizip.vcxproj.filters":"83db58d87f=
5d7ca84b6087aa1f62b15cbc296194c8cf76e47a271f9077b4f3bd","src/zlib/contrib/v=
studio/vc10/testzlib.vcxproj":"1525ed0893db56db44ec68675c8da3c229dc7867166d=
fc0428816783d16ad43b","src/zlib/contrib/vstudio/vc10/testzlib.vcxproj.filte=
rs":"d7e04ffa467d417dfa3c0f1c64234cadc84882101bbae483f0a0f5d3d6b566a7","src=
/zlib/contrib/vstudio/vc10/testzlibdll.vcxproj":"3f317d8964f17901c3e68bff5d=
eaec10b6ccc50a572235999e8097292692984c","src/zlib/contrib/vstudio/vc10/test=
zlibdll.vcxproj.filters":"682a485f0184aabba94e12e1b284499195f37c176d43ecee0=
484f31e4d636f6f","src/zlib/contrib/vstudio/vc10/zlib.rc":"e8b581eb16930e021=
3d37143a5f17868839b22c758b23981a29484e17093c494","src/zlib/contrib/vstudio/=
vc10/zlibstat.vcxproj":"2a38222d6c034d7e0b843c3f0540dc6c53dd48f942ae29f3162=
0ca0327248c8e","src/zlib/contrib/vstudio/vc10/zlibstat.vcxproj.filters":"d9=
a2c381e51e4d6f027f3517db7db81656e43cec02ed9abf267a0fde6f360180","src/zlib/c=
ontrib/vstudio/vc10/zlibvc.def":"0124fea28bfee49c8a19dad0ed5a49277d451018b4=
affda5a389e64ad15f44d7","src/zlib/contrib/vstudio/vc10/zlibvc.sln":"e659860=
f705f31b87ea9139a3cb4ebe1561e120bce495383a54614fc82b49990","src/zlib/contri=
b/vstudio/vc10/zlibvc.vcxproj":"3108badf710e2f4a64eab4e7deae6642fb68cc0d940=
18e537149f1761e215133","src/zlib/contrib/vstudio/vc10/zlibvc.vcxproj.filter=
s":"58404ba7703c68025bec64b8a17ff1fc7f3a35d15d17ae3bcc4fa753f1348425","src/=
zlib/contrib/vstudio/vc11/miniunz.vcxproj":"746e4c11fb8af4bcd6a9d68ba81ed1d=
c366a5de3bed56b291ee969ad733a7bb0","src/zlib/contrib/vstudio/vc11/minizip.v=
cxproj":"340617cae9cf4fcb003308021d3782ec3639e60d62d79a3aafc0a50bb55b061e",=
"src/zlib/contrib/vstudio/vc11/testzlib.vcxproj":"589eec6ef6d818564ead938a6=
29fda50abb6cbf8054b9f66ea780765c1a1b3db","src/zlib/contrib/vstudio/vc11/tes=
tzlibdll.vcxproj":"583bdef522b0176829f0d8139ea2a88b9cbc14379d1334f3a863989e=
d3df9b67","src/zlib/contrib/vstudio/vc11/zlib.rc":"e8b581eb16930e0213d37143=
a5f17868839b22c758b23981a29484e17093c494","src/zlib/contrib/vstudio/vc11/zl=
ibstat.vcxproj":"51aa752698d96df065a9ece02e293492f681b59a8077f036a5a60367dc=
621e87","src/zlib/contrib/vstudio/vc11/zlibvc.def":"0124fea28bfee49c8a19dad=
0ed5a49277d451018b4affda5a389e64ad15f44d7","src/zlib/contrib/vstudio/vc11/z=
libvc.sln":"27389b515997defd080519f95aff87e89fcbe8b26d73c5ebb73c544cfef4d60=
e","src/zlib/contrib/vstudio/vc11/zlibvc.vcxproj":"c3dd05e56159aba411475b83=
656275872524cb3c2fd24d690397d8b634e7e0ed","src/zlib/contrib/vstudio/vc12/mi=
niunz.vcxproj":"1494af54570f6e93852932956d49a8c25e57b5abc1ac979945605ca9143=
df9f8","src/zlib/contrib/vstudio/vc12/minizip.vcxproj":"9bf128ed6760ca5f019=
006f178b1c65f4c7ff122dba8d297b64b0eb72feeb120","src/zlib/contrib/vstudio/vc=
12/testzlib.vcxproj":"367a06caa399bd09f6b9cb60706820943dd6a6cf05794275baaf4=
21da9c2a0b7","src/zlib/contrib/vstudio/vc12/testzlibdll.vcxproj":"934165102=
56935d79625dc9fd349cfce6968c062d42a138bec404a26b2f92f5e","src/zlib/contrib/=
vstudio/vc12/zlib.rc":"92d5d3a4938a6350395934153416a7eb74353cdfb2321f45b9ee=
0b9b16257f39","src/zlib/contrib/vstudio/vc12/zlibstat.vcxproj":"744ff6ac0d4=
e2dcdf74c7d33b979fbfd2b18550947eb99bfd46dc6a73eb1c68d","src/zlib/contrib/vs=
tudio/vc12/zlibvc.def":"0124fea28bfee49c8a19dad0ed5a49277d451018b4affda5a38=
9e64ad15f44d7","src/zlib/contrib/vstudio/vc12/zlibvc.sln":"162e0faa80a56d89=
eea71a0b89377708eec2faa0dc72091cc0abb07fbdea49a0","src/zlib/contrib/vstudio=
/vc12/zlibvc.vcxproj":"754671c59d8996a846241af76082cc8be1aa5fc079eff530d91a=
9ab15a0bee5b","src/zlib/contrib/vstudio/vc14/miniunz.vcxproj":"0312511d4a30=
cea979c4e36edf994a537ed8a9d924f6b5c536cbcd094773c11f","src/zlib/contrib/vst=
udio/vc14/minizip.vcxproj":"9e7bb7a6ac723e4b2db900627c366f9bb93a351381995d9=
c69a50c0126f64233","src/zlib/contrib/vstudio/vc14/testzlib.vcxproj":"c3a936=
9670af4ebea13d036b452be7418591fbb4c03a675699facac5d8dff5d0","src/zlib/contr=
ib/vstudio/vc14/testzlibdll.vcxproj":"69f544898b4275cd3d8e19b8f1f8cb39c1cb9=
8a30cdb033242e4b94c57bfa150","src/zlib/contrib/vstudio/vc14/zlib.rc":"92d5d=
3a4938a6350395934153416a7eb74353cdfb2321f45b9ee0b9b16257f39","src/zlib/cont=
rib/vstudio/vc14/zlibstat.vcxproj":"9c7c096b47e7875412c98525efcd16db62e0942=
15f0011b9cd739a33ab35d48c","src/zlib/contrib/vstudio/vc14/zlibvc.def":"0124=
fea28bfee49c8a19dad0ed5a49277d451018b4affda5a389e64ad15f44d7","src/zlib/con=
trib/vstudio/vc14/zlibvc.sln":"47a50bbde8ca6336cecd8c0e4b65e515fc46ae84c7b6=
1008ac9864162f777286","src/zlib/contrib/vstudio/vc14/zlibvc.vcxproj":"71fb6=
ef3b079bfdf4182af17e74c3361ead757467edfc591d9cbe303ccc47b52","src/zlib/cont=
rib/vstudio/vc9/miniunz.vcproj":"b2b53bd9e704bfbe769b863acdc2a3368692ca149c=
4b4ed2a0761b0cd16c6726","src/zlib/contrib/vstudio/vc9/minizip.vcproj":"80a7=
01fb41a61871ce1d25f6b03e571edb6c3abf0aa45375554b6fac52115eb6","src/zlib/con=
trib/vstudio/vc9/testzlib.vcproj":"05fc5a87682b17690d199f424f57f6ad7767b8da=
bb29a1039bfcb88bca1b302f","src/zlib/contrib/vstudio/vc9/testzlibdll.vcproj"=
:"25c1cc5319f1c4b7dbdb595c3cfd6ec3ba217818b03b7055ef5ef440b575a43d","src/zl=
ib/contrib/vstudio/vc9/zlib.rc":"e8b581eb16930e0213d37143a5f17868839b22c758=
b23981a29484e17093c494","src/zlib/contrib/vstudio/vc9/zlibstat.vcproj":"e86=
53eea37f3bef097eec2caa55e1f698c3c74c959689bc4e97568e88d2bbc60","src/zlib/co=
ntrib/vstudio/vc9/zlibvc.def":"0124fea28bfee49c8a19dad0ed5a49277d451018b4af=
fda5a389e64ad15f44d7","src/zlib/contrib/vstudio/vc9/zlibvc.sln":"26e58d4b2c=
fcd941c367fb2a18537b3b9f002f2ac1278b700ea1129c50501452","src/zlib/contrib/v=
studio/vc9/zlibvc.vcproj":"86aa6e33db104c0a0ed4a9f21f0db8572cc7755170217aef=
18219fdd74b75e9d","src/zlib/crc32.c":"a04af273e83ecc351bf3794974ab2098d8d96=
0df4044b7b44734c41443ee26d0","src/zlib/crc32.h":"407af59d0abfea84a6507c603e=
b29809411797f98249614fe76a661def783ce1","src/zlib/deflate.c":"11fd6b0328b65=
c4ad4b5c204d892a97a9083628a7e77dc47836c8e0c799f8da0","src/zlib/deflate.h":"=
0ca7fb0cf1dd63001c6e9e4ff93c8dbff2fe521199be51a4dda38a11b44919f6","src/zlib=
/doc/algorithm.txt":"992590931e982c0765286c2d83f6e9ff0a95aabb08e28c30c52bae=
3e8c4bd5ad","src/zlib/doc/rfc1950.txt":"8f0475a5c984657bf26277f73df9456c9b9=
7f175084f0c1748f1eb1f0b9b10b9","src/zlib/doc/rfc1951.txt":"5ebf4b5b7fe1c3a0=
c0ab9aa3ac8c0f3853a7dc484905e76e03b0b0f301350009","src/zlib/doc/rfc1952.txt=
":"164ef0897b4cbec63abf1b57f069f3599bd0fb7c72c2a4dee21bd7e03ec9af67","src/z=
lib/doc/txtvsbin.txt":"47c273bb22c9773248d380549a330e5c262266b1292154b0d301=
4f731cc73f47","src/zlib/examples/README.examples":"402d72eb69c2e03a25034f4b=
3c02b110f0f67149ecfa4fa0e4b2bf0ceb49a8b3","src/zlib/examples/enough.c":"704=
e273f65b62c5d2eb06d5bb10c4ccffba56544aa477f0e3957e2296c501b78","src/zlib/ex=
amples/fitblk.c":"950769163c41aff897ee41746a8685d9aa41073b1307f42da19dabe9d=
3fc8b85","src/zlib/examples/gun.c":"d60ca6eb0a3e62ee7fb4a1ab69e8d1525ff06b0=
6ce46889cbdfc13fb8f7534c2","src/zlib/examples/gzappend.c":"4182d38bf97ffbdf=
1110df7f65c0e8fab0b28b1ea36ebba8621c14e8e76f1caa","src/zlib/examples/gzjoin=
.c":"90b9d6c39a5fc91cf1cc9b96b025a508a8015dc502cd9374c754b44078593f57","src=
/zlib/examples/gzlog.c":"433d34b71b4e769ece1cceb8bd7d902d2c0a24ccd7550ab185=
6a5ba87f84f835","src/zlib/examples/gzlog.h":"309556e2d7d39250924946b78e2cce=
0ac927857d6e1a02cab64e438f533c20c3","src/zlib/examples/zlib_how.html":"80fb=
647be8450bd7a07d8495244e1f061dfbdbdb53172ca24e7ffff8ace9c72f","src/zlib/exa=
mples/zpipe.c":"68140a82582ede938159630bca0fb13a93b4bf1cb2e85b08943c26242cf=
8f3a6","src/zlib/examples/zran.c":"840ebeb058cd0ca9e92dcb1db665932462a4695f=
c649b34e865b8d1ad7c5bf77","src/zlib/gzclose.c":"94446cf8cde67c30e64d0a335b0=
c941fd3fbad2e77f30180d12e61f9c2a5a6b8","src/zlib/gzguts.h":"1ef4741cf10441f=
eeca5c8dde2b6c754f0cbd96fcae697d54a604757289a5e9b","src/zlib/gzlib.c":"5daf=
11e44149e0aba2956d35f73f04f35dca99c3dfa43f5ad43ec20b336e4a1b","src/zlib/gzr=
ead.c":"6f928512cb1792cfeab31a51ff0b211814d2e455bc75290eb31079dc1e5ad2ec","=
src/zlib/gzwrite.c":"ba3b7b7ad2ff7ef0c19319b8408c333491a4cd495da55d0b156bc7=
3d9ddb4df4","src/zlib/infback.c":"abe44873b5af2ea68ea1d281d915b2800f1832f84=
6d2c05442a4711adbe6f269","src/zlib/inffast.c":"4d496ab2a3d29df5fadc3dbff606=
7e039806aaceae6cfcd09ea77d46c2b848fd","src/zlib/inffast.h":"7d8c1c873ce9bc3=
46ad6005bb9d75cce5c6352aaf7395385be216a9452a34908","src/zlib/inffixed.h":"2=
37ba710f090e432b62ebf963bee8b302867e9691406b2d3f8ee89ee7bfef9b0","src/zlib/=
inflate.c":"8b6c599c3563c14c447c47db0d7dc9a16e8c246a078ec95a169ddcebaaebd81=
1","src/zlib/inflate.h":"8ec9ac297790276f7e46a961d4c6f9f944fb1dec92401339ec=
2666973cc5983c","src/zlib/inftrees.c":"1960ca67384376f65b6ce8c08fdb501f8eb3=
3923e11ef5f61a855708c6cb0a8a","src/zlib/inftrees.h":"c510b36402784b1f898be3=
b049b923469aa92701de2d9195aed19f6b65c0dce2","src/zlib/make_vms.com":"3064eb=
153a7684115f1494364f80759bc5a2c227799fdf08df7b9e6e50884720","src/zlib/msdos=
/Makefile.bor":"292ab363f7ffbc4ae84d37cd9bdffd2dac1003bee52d223a8489844870f=
20702","src/zlib/msdos/Makefile.dj2":"9208450c2ae6dcbfcc25560b5b9ca763f461e=
7246e37b0552474edf8fa898906","src/zlib/msdos/Makefile.emx":"c749d6ec7f88e8e=
639d4f03bdbdcbbe9d1c304210be4c4be621ceb22961d3d64","src/zlib/msdos/Makefile=
.msc":"0e021a6f42212415b060e4ad468eb415d0a8c1f343137fb9dff2cb8f9ead3027","s=
rc/zlib/msdos/Makefile.tc":"2ae12ee2a3e62f7c5a0520d0fbe4adee772bc07fe816002=
b07ccb43db3daa76a","src/zlib/nintendods/Makefile":"ea5823efe6830132294eddf2=
f56dbd7db8712244c210bb4968c431b1a91bd066","src/zlib/nintendods/README":"e36=
2426c47b39ff6a7d6c75c6660b20abf076cdfa5e1e421716dc629a71aef95","src/zlib/ol=
d/Makefile.emx":"d811f032272aae50123a889297af3a02fbd60d1e42bbef11466462f627=
ff7b5b","src/zlib/old/Makefile.riscos":"d1a488b160fbfd53272b68a913283a4be08=
ba9d490796b196dddb2ba535b41e0","src/zlib/old/README":"551a0f4d91fe0f827a31c=
bdfbb4a71d1f3dc4d06564d80a3f526b749dd104d11","src/zlib/old/descrip.mms":"8f=
f08c35c056df9c986f23c09cf8936db63ccf12c3c42f7d18a48b36f060cff7","src/zlib/o=
ld/os2/Makefile.os2":"6ad247c00f00ff42fd2d62555e86251cef06e4079378241b5f320=
c227507d51d","src/zlib/old/os2/zlib.def":"ea9c61876d2e20b67ef2d9495991a3279=
8eb40d13ede95859a2f4f03b65b9b61","src/zlib/old/visual-basic.txt":"1727650ac=
bde9a9e6aec9438896377e46a12699cca5d46c5399cef524dedc614","src/zlib/os400/RE=
ADME400":"6f95a1beb0fbf943a3312eaa3dd2c279f1cef93062bebbff63dd37ac9e2aa8d6"=
,"src/zlib/os400/bndsrc":"cfe00b1528d5c27813cd6b1ad7aa34b493fd63d615623fb21=
fd1a7bf99d2255e","src/zlib/os400/make.sh":"143394d1e3876c61c29078c0e47310e7=
26e1f5bd42739fe92df9ece65711655f","src/zlib/os400/zlib.inc":"c501c522185ba1=
f0506caf90d72f1088b34b2addc169471e949e443ab65e8a75","src/zlib/qnx/package.q=
pg":"90b5c8364d9dc5ef67405b352c19710ebad2905f3f20b9e56ded74661f96743b","src=
/zlib/test/example.c":"520799662a8286725540d6d5a356efe6f595618e5fe2e5919724=
91d719bd99aa","src/zlib/test/infcover.c":"f654f3fcc74b33bd95cda63d13fe0ce58=
9bcfe965544e0c17ee597d75efbd090","src/zlib/test/minigzip.c":"91089b21e69279=
7bb6208b2b45eeb90f5f1f1e4f6b67b99dea5676f51b811193","src/zlib/treebuild.xml=
":"d816c764c8ec2d5b2ebfa7f053f747097926c13fce7fa8628c5d14c991411421","src/z=
lib/trees.c":"f2a5f949ea70dde7c23a54c793aeed630a03df4bb72417cd3aa008000c446=
99b","src/zlib/trees.h":"bb0a9d3ca88ee00c81adb7c636e73b97085f6ef1b52d6d58ed=
be2b6dc3adeb4d","src/zlib/uncompr.c":"31922aa982ee12fd28d1ce5fe6a94a3f07c2a=
941c821b566a881ca21845cdfaf","src/zlib/watcom/watcom_f.mak":"7e039b912f9cff=
aa40835281430bb284fa9042b0a0d12f6b34700a06bca6576e","src/zlib/watcom/watcom=
_l.mak":"d11b4064604a034725860e63e3f6d347056372e4b1675b183e20a93533b20cc9",=
"src/zlib/win32/DLL_FAQ.txt":"9e00778319381e6275691dd3a89410c99065b8c0c5db9=
6473abe8c859cbdefd8","src/zlib/win32/Makefile.bor":"e878fed2313417db085fea6=
21c110889f6a32233b5b6db46e3c4e824c1d0ed6b","src/zlib/win32/Makefile.gcc":"e=
a8feddce7b9707253b9bf86623cf7ebe5294d7aea2b3b0b1b1c1b8cfd73009d","src/zlib/=
win32/Makefile.msc":"7c495d63c5afea1d77d162a41b73bab89cee952c12e4647e9684a7=
ac79bfc3f5","src/zlib/win32/README-WIN32.txt":"b71f1f4e4760812c3a11b2bae6f4=
0d1066741a90e6646010a32ce50a0e348cde","src/zlib/win32/VisualC.txt":"9ec0bab=
d46eaa012371dee2d3a8a55d9c7130f7895512c3371c737e4a7f6a997","src/zlib/win32/=
zlib.def":"24fa6dd00f3f4c0d14507a03ddbfa42707a04e3901bb9ff6f90096037a75185a=
","src/zlib/win32/zlib1.rc":"8fc5f2b5abee40ad66e6d6cfc9f926c2f446e13a7c9ee7=
df8bf58a266d8cade5","src/zlib/zconf.h":"9c0087f31cd45fe4bfa0ca79b51df2c69d6=
7c44f2fbb2223d7cf9ab8d971c360","src/zlib/zconf.h.cmakein":"d740b750e9c98e6a=
4b4529cc2a857a3fa8001514b1ce91e0e1d9d293652bf388","src/zlib/zconf.h.in":"9c=
0087f31cd45fe4bfa0ca79b51df2c69d67c44f2fbb2223d7cf9ab8d971c360","src/zlib/z=
lib.3":"5abef003e545566e5599e5ab2e7528e978be59d54546b19d763d062f7a69bac7","=
src/zlib/zlib.3.pdf":"7f0f633641d782e360eff9fe831716c5767faf1000e38382a8a8c=
65b0b67f374","src/zlib/zlib.h":"4ddc82b4af931ab55f44d977bde81bfbc4151b5dcdc=
cc03142831a301b5ec3c8","src/zlib/zlib.map":"7eb1070ba6bf12e6895e5da06b84a92=
af683827587afaa72bdd45e80b9d8e4e9","src/zlib/zlib.pc.cmakein":"2f1d0b18ce37=
c2af415a469857f02aee2c41a58877aff21d29e9c6db32b55cb7","src/zlib/zlib.pc.in"=
:"04c01cc2e1a0ed123518b5855f585c93a24526dd88982c414111ea1fc9f07997","src/zl=
ib/zlib2ansi":"d316e3e79054f5f9fe921d35f4bbf4bf0a37b859d29d2b34ae4d7d92afc3=
e55c","src/zlib/zutil.c":"f7fdc9ef326a2683eb33c794face54e83c751ec17f3d1ba58=
1847a62af36ddcd","src/zlib/zutil.h":"9a63f6690fac1620aa3cecee5752af618806da=
438a256b4a047fbcd289cac159"},"package":"de5435b8549c16d423ed0c03dbaafe57cf6=
c3344744f1242520d59c9d8ecec66"}
> +-{"files":{"Cargo.toml":"2f23b1493e2aa56abce67ae714f4ba088ac6b30b55c19c1=
56477e1788f515701","LICENSE-APACHE":"a60eea817514531668d7e00765731449fe14d0=
59d3249e0bc93b36de45f759f2","LICENSE-MIT":"34c467b6945a22696d060b8fdd2379d4=
64acb3408d4c599d3dc5fe4fa1b4c84f","README-zng.md":"237e65a2b90c6533e346d838=
e857572a82fe498753500fe04b7054dc261ca5a9","README.md":"97923429b45c95f22292=
b41d116452a4ce3df98d6960c89af30b3ec64c68b7bf","build.rs":"0b57c3a2c98c2cc12=
2ae00d7b45610e4f568f6960c823f23b69ef0682cc7fb33","build_zng.rs":"b7768e19f0=
bf876f29eabb6ad6511f530e61d8aa92bfbe89a7cf3818e4824ce7","src/lib.rs":"7c4a3=
394e17e6250c1f4f2067efecc56b1850827596432ad0ce75e5eea800446","src/smoke.c":=
"10607c81b73811bfcb9718767312bf97ba2ccf7048ea2f18a2085aa06ad7f91b","src/zli=
b-ng/CMakeLists.txt":"c3ccdac791fd8d34c720b336b60370545dfd66c642e78b2033eec=
c2273c160d9","src/zlib-ng/FAQ.zlib":"c524f4f86d336b3de71dd6977afddffa9c02fd=
a5c26db4dfefae44959e7614a2","src/zlib-ng/INDEX.md":"989545e90d8e9ac149034f7=
62ce78ed8976ebf9324326228dea37ca190154609","src/zlib-ng/LICENSE.md":"d3c80b=
e055d94d798eaa786116e84fa0b010bc11420b5d2060d978ea77845436","src/zlib-ng/Ma=
kefile.in":"774c8462cccbe6b30fc34d68490bba8e352e460c8ee2c3775d4d0767e228219=
2","src/zlib-ng/PORTING.md":"10d59c3195ee8c631bb29fbe75e7e11a84d3daf7ab9e2b=
e12287661ffd8fe1b6","src/zlib-ng/README.md":"c9f247270ce0fa8c823ce047e82365=
59127933fc83b16dc9a6863bbc983b6dbe","src/zlib-ng/adler32.c":"52fbdc52a7bf5c=
64baf5a7fe76f7255348c280c5b1bbb9bb674ced04a01d8fb2","src/zlib-ng/adler32_fo=
ld.c":"9ba56a7bbcf64ede61d8fa84de9f81d751ece311dc9a3e12470f794a6103316b","s=
rc/zlib-ng/adler32_fold.h":"c40114c2c742b6410e54b58ea02533fe6e9ae0ca62d3453=
e5d2a1725d33e2be4","src/zlib-ng/adler32_p.h":"3d44f3d9296dfcdf203b5c4e4a8b0=
da0551365970ceb882715c7140ad061a90a","src/zlib-ng/arch/arm/Makefile.in":"e5=
23b6c87b928e2dddcd04793bc79b5829304cf51ead713d743af740ca131b37","src/zlib-n=
g/arch/arm/adler32_neon.c":"60608f4cc48bcebced93947ba7a75f128876352fbfc2b15=
21d25ae00b692c244","src/zlib-ng/arch/arm/arm_features.c":"bc8a5f0b1f80a05bb=
a51b851a4be941c75c38e4800840b96097eae57cb7a5bdd","src/zlib-ng/arch/arm/arm_=
features.h":"7534eb55b3551123c9a51ca8dcf771da0c1bb21be07e0c00292d156d96d552=
38","src/zlib-ng/arch/arm/chunkset_neon.c":"bad43fd303a538ae5b7d41f8f2b0c84=
915492ebb32abd7528d074501a637cf83","src/zlib-ng/arch/arm/compare256_neon.c"=
:"d87660d69cfc4bdace50cc9f08ffd42fec71e3281566b9b58c1d83008e6fe6f3","src/zl=
ib-ng/arch/arm/crc32_acle.c":"921f1278e2130bf69b7572ed5bda13df3ba472948e390=
b1dbf330a1daad1736e","src/zlib-ng/arch/arm/ctzl.h":"feb70d55e66025fff806e30=
e48002b35cfff79533d352585cfa5f118edbc90b1","src/zlib-ng/arch/arm/insert_str=
ing_acle.c":"337e420632ac14620dba851923c35a882e532bc445a9b10330f3a8dc6ee32e=
c8","src/zlib-ng/arch/arm/slide_hash_neon.c":"b455b2ee60899d97844317f4c80f5=
22a9f611258b9500e6de810e94433e933bc","src/zlib-ng/arch/generic/Makefile.in"=
:"f41a34839986eac8dd52cf91fada0efff4171c059ab5d7db6347c91bd6d9db09","src/zl=
ib-ng/arch/power/Makefile.in":"292f34d0dabe1658a9cac8c7f303b3d311b0d18a0cb3=
8b7fc69abd9d95075df0","src/zlib-ng/arch/power/adler32_power8.c":"f39c4c5f0a=
ded59e2b4986c151b70edc32f976c2c82185540164af52e2158bb2","src/zlib-ng/arch/p=
ower/adler32_vmx.c":"f6f9fa89366b742b27bad122a6a96948efd6fb95a4de3238fbabe3=
613e6f9251","src/zlib-ng/arch/power/chunkset_power8.c":"4f3df226e8969f472e5=
17274c0b940ea0a6cf3980326d2d85cd09b325f37502f","src/zlib-ng/arch/power/comp=
are256_power9.c":"d136d4eb79d9b67cab11048c56439531755da9c292fa13373a8dc0a40=
239368d","src/zlib-ng/arch/power/crc32_constants.h":"d73e3b9025de9fade7fa3b=
a2bbf5f56a1499a84c53d8ca7f5e744a0714d8599b","src/zlib-ng/arch/power/crc32_p=
ower8.c":"88919c3c14bd8124c112bfb6bafb2d526870740cb2828f14ccde3a9b866308aa"=
,"src/zlib-ng/arch/power/fallback_builtins.h":"78a8da60bad8ba01278e49548210=
8adabf9e96bdb214e869b61ab1f63f518c9b","src/zlib-ng/arch/power/power_feature=
s.c":"369683c1e792f783f91d72f4046d24623f9bc015edc13146476ff04fb030ca44","sr=
c/zlib-ng/arch/power/power_features.h":"d755ee6ca0e804ddff2639d098e355a5201=
d01c8bee8e1bd9e98bf6be7774cf1","src/zlib-ng/arch/power/slide_hash_power8.c"=
:"05a858c9a35d58c933becb3e1848310a0bf50899d6d8829127789747fb0931fb","src/zl=
ib-ng/arch/power/slide_hash_vmx.c":"e8bde875deff4d61e777d7e56853ef7b3a71897=
97ade5c6dfef9fb202930294e","src/zlib-ng/arch/power/slide_ppc_tpl.h":"c8900c=
594591e1aba3188f97c374e5561fe1e96f653c668352b25647e449f4c0","src/zlib-ng/ar=
ch/s390/Makefile.in":"e20982f40349d7b0725c5b908acb9a7f3a4c45dc4f329fab80b56=
b1538a2b7bd","src/zlib-ng/arch/s390/README.md":"892908181f6bafde706e70a64c3=
12ccf18a300a56045ea1010d6b6bd04ea1d1b","src/zlib-ng/arch/s390/crc32-vx.c":"=
353355c8a1819064ff8db1e53ac0906c5ea7e0bdc303e200382a85a299ef209c","src/zlib=
-ng/arch/s390/dfltcc_common.c":"cc90250cd04e74c432496e0658e94708fe267b1a799=
df8c2cbc1f6b5d6d23a9e","src/zlib-ng/arch/s390/dfltcc_common.h":"c17edda79dc=
82aaab399cc14c3a7c2dfc021e152286d3841272a337d6c404df9","src/zlib-ng/arch/s3=
90/dfltcc_deflate.c":"9cb59560fcfc7828139372d3ff27386f85acb12595274e6ce99f8=
c4d9a4abbd4","src/zlib-ng/arch/s390/dfltcc_deflate.h":"e8077ba0f7097438ee43=
d7d514bfb323069bd979aa15c1f708ce1cee69ed6980","src/zlib-ng/arch/s390/dfltcc=
_detail.h":"859e72e270c1f6da668aa199f331b328df65d5d86410ba5c1e6ef8442263d6e=
c","src/zlib-ng/arch/s390/dfltcc_inflate.c":"7b0a443f7aef6044c3180166cb228e=
4c4d1a1026ce085b3ec7e8f1d2128ca777","src/zlib-ng/arch/s390/dfltcc_inflate.h=
":"478dd9d731441a91fbb287dfb31e37ba8f7d358a18f9a46a5c3a2d7a65022157","src/z=
lib-ng/arch/s390/s390_features.c":"92e420580f060d570e0b0362a7d6e80dfcadddfb=
e4ebbade263cc9a561434785","src/zlib-ng/arch/s390/s390_features.h":"4147b506=
1f4376d85256673c8ff0492b8efd69add35c345cdbb47d9194b13b91","src/zlib-ng/arch=
/s390/self-hosted-builder/actions-runner.Dockerfile":"ae43b34a5d4d75acb392a=
974de1af1561e55424bed0dfa19a2cca7bd38dafa8e","src/zlib-ng/arch/s390/self-ho=
sted-builder/actions-runner.service":"62a19075adeddb3bee57bbac81c7acadacbf9=
c288e2b497e36ff7f2b3daa7558","src/zlib-ng/arch/s390/self-hosted-builder/fs/=
usr/bin/actions-runner":"f647e18728ea15fe927ac9f8cba83a5b343654a0e91b5ebe65=
3bae7af7375110","src/zlib-ng/arch/s390/self-hosted-builder/fs/usr/bin/entry=
point":"add4ebdc4f06ed15bb1de12a8c9ceb370a60baebb0932a1026a75433940ad3df","=
src/zlib-ng/arch/s390/self-hosted-builder/qemu-user-static.service":"545510=
49f6181da88700a2a944a72b0af3b8abde876fa28e1348deb5eb96c91b","src/zlib-ng/ar=
ch/x86/Makefile.in":"0a681b0a6d396cea593bd8c4a854c5d1bb742217958e2a6a663a4c=
ca051cc9e5","src/zlib-ng/arch/x86/adler32_avx2.c":"7d653cfa7d363c37c93b065f=
9155939ffcaf58ef34a1a3b1d26a7f6c7de3829e","src/zlib-ng/arch/x86/adler32_avx=
2_p.h":"21790ad0c770a93f8bccec160310b55a322418bed79f51d054d509925f316cc3","=
src/zlib-ng/arch/x86/adler32_avx2_tpl.h":"28f7889e7f77ac7a43376a5a93bf84da7=
596762b8dc5eaa941fb3b0a7273ba27","src/zlib-ng/arch/x86/adler32_avx512.c":"2=
7f3a767de2529b03173d5e8ffe9cae61c3e0807aabcfc9c5c92047a576b6a1c","src/zlib-=
ng/arch/x86/adler32_avx512_p.h":"1b4beda11693ac03e4b20e054a765df427f845a279=
bce547b8208d20f5a302bb","src/zlib-ng/arch/x86/adler32_avx512_tpl.h":"e7ccc2=
59237a1f59bae475db8c00fc82f2c8fbb581273265a7dec5b394d97124","src/zlib-ng/ar=
ch/x86/adler32_avx512_vnni.c":"1dbc4d42f2af3912f2c42d0c8fe454fd953a07dd70ae=
105e07a09442b506fd0d","src/zlib-ng/arch/x86/adler32_sse42.c":"d5ed7a9f9100c=
bf0c7dd7b893e8b2425a890bd991fcc1cf63cd3a0e24093fcae","src/zlib-ng/arch/x86/=
adler32_ssse3.c":"0eb8c72796a96dcec4080423ce9b467e9047eaabc7a0eeffe1155e93b=
2e73d1b","src/zlib-ng/arch/x86/adler32_ssse3_p.h":"c6e22c4998c80bf2b3c489ab=
d60e819a17a8c5ec2411a6d2d5c5396484f1dce2","src/zlib-ng/arch/x86/chunk_permu=
te_table.h":"566181353c16e929fcd25621ee629dcac23477fdd2862eea3a7239b7637065=
3d","src/zlib-ng/arch/x86/chunkset_avx.c":"dad1bdae1c7d004ee750391f25489c7f=
b78276dac25f2e2990cbb40c3cc6052b","src/zlib-ng/arch/x86/chunkset_sse2.c":"2=
695d3f92eccafb4401afaabfc84717aca693cc04fd6d85988f3b8592a831b70","src/zlib-=
ng/arch/x86/chunkset_sse41.c":"25398da25f5b8f7dfadf80e2a9af58674942720b6f46=
f46854548e3d68e68000","src/zlib-ng/arch/x86/compare256_avx2.c":"2516d00faa6=
939e61dbb0978a9c4c81f9e3a42fd053b2a2241673da7cf4fc781","src/zlib-ng/arch/x8=
6/compare256_sse2.c":"3b983708034f33b5da49f6f5041351a2e66358c76645c552f6e4d=
c37fb890a80","src/zlib-ng/arch/x86/crc32_fold_pclmulqdq.c":"9cc84730392139b=
0cb50f4b51a6391cb1da3cc2b200a7b5dbef638706d1e0866","src/zlib-ng/arch/x86/cr=
c32_fold_vpclmulqdq.c":"439559e134b7a7366d05f8850f1974a9caffea7036356562973=
acd72050d1d58","src/zlib-ng/arch/x86/insert_string_sse42.c":"1f093e32f3b717=
04f2bad3468adf790741870398634647b7aa0bc1b3430ef970","src/zlib-ng/arch/x86/s=
lide_hash_avx2.c":"9740a36bb4dd90f40394344026be9a13f3acb6e85e6b7681c30fd7f7=
cbf8e28e","src/zlib-ng/arch/x86/slide_hash_sse2.c":"fa009305a1c82708638dff2=
5e037067656350303b25f5774489417e096c30ecb","src/zlib-ng/arch/x86/x86_featur=
es.c":"05d9cd4164771147bf5a75754cf60ba05083c3b9842c590ea527c8ae44f1ca85","s=
rc/zlib-ng/arch/x86/x86_features.h":"76df96d3b077fb9697f2d0a8598fe657688025=
faa849e4c12d717c4966efb4ca","src/zlib-ng/chunkset.c":"534acd20990af9ed52fe9=
effcf1a6aeb1d5c5a3226c38dee9c007bf5aa7e7266","src/zlib-ng/chunkset_tpl.h":"=
563f55a12daf6b921df8ebdda8d0e5818e1ce532efbd81faaf37a7a275c2a4c4","src/zlib=
-ng/cmake/detect-arch.c":"4fff00beb2b207c87dbff81619583858dbb4120b86c114b7d=
a8f48979f687bb1","src/zlib-ng/cmake/detect-arch.cmake":"27fa8da497b39ac70d8=
81e2d345749611dae4c30f7b7a9c9e32f2c042672189a","src/zlib-ng/cmake/detect-co=
verage.cmake":"4664d51152d51282ae50621f4d510ab72cf8978b266c614b7c5361750db6=
d1a9","src/zlib-ng/cmake/detect-install-dirs.cmake":"87031a40428a104f5cf38e=
cdb8a5028d8c679cfa772a58adde8380c809b34eff","src/zlib-ng/cmake/detect-intri=
nsics.cmake":"4c7101c25c2cc8c724682caa6525a9ddfd74b71ad96ea0e6bfae09ded86af=
a57","src/zlib-ng/cmake/detect-sanitizer.cmake":"a40650743dfd0b56c2afbfadb5=
3e5d1470ef48852f2fcdf51084b6485534f87a","src/zlib-ng/cmake/fallback-macros.=
cmake":"a8c8f70e5483177280cbebf99f929a7cf5ffe2b79fedb79eed570ecafc78effc","=
src/zlib-ng/cmake/run-and-compare.cmake":"13d85c12c9d6c7b1b148bd0c5a5b4faa6=
a4b56f3823bf03c4f8d914c9c5949d8","src/zlib-ng/cmake/run-and-redirect.cmake"=
:"7f08d18c09aa58113882ec760735a62a1723a5bfcae9f73bd3713a4dbaeab898","src/zl=
ib-ng/cmake/test-compress.cmake":"612f70af2d51b33f70f8c9e0655915a5648803a6f=
c36f138f9daafdec248a77a","src/zlib-ng/cmake/test-tools.cmake":"63aabfffd539=
70b8e145870b2a1c03bffa3595f7df04bd86f94e97b6f2a387e7","src/zlib-ng/cmake/to=
olchain-aarch64.cmake":"46be0bf580a49a528c72005484655afad1de3705b39a66a7b0c=
213b0fa81cee6","src/zlib-ng/cmake/toolchain-arm.cmake":"05e38076fd6ffb9785f=
f9844ccecd26436c9dc4c25b7777b62e5f52e788c3882","src/zlib-ng/cmake/toolchain=
-armhf.cmake":"1a2029163a57415eec9a5dd5f45d3254d349e97b1beb5d16876b74171767=
3341","src/zlib-ng/cmake/toolchain-mingw-i686.cmake":"b6c48f9d4e4c28480336d=
65ad43a2bef6625df342ed09dad043ee7dc50292851","src/zlib-ng/cmake/toolchain-m=
ingw-x86_64.cmake":"e9d16d3730e48cb27f4d9845f0de6f864231908cbe7c851011a3441=
8e34dc646","src/zlib-ng/cmake/toolchain-powerpc.cmake":"9bd6fc58ce5b7060365=
7f2c195c4a5cf52fae96ad63ac787978831c5858f762c","src/zlib-ng/cmake/toolchain=
-powerpc64.cmake":"917fc5eef84921d8b38f43c2b4f60870965b4eecc8f018c7b3499e11=
42c715af","src/zlib-ng/cmake/toolchain-powerpc64le.cmake":"5b2edd36d62de513=
db2d32bfbf779979d81ac527b981cc3379a4e933fc5a94d1","src/zlib-ng/cmake/toolch=
ain-s390x.cmake":"cf52cecea7bd2a9d1ff5fd8edcb03c531e3b404bbcd15a15dec2e0e19=
936f2ac","src/zlib-ng/cmake/toolchain-sparc64.cmake":"e543062485d06a7e0fec8=
135887c5e73363517fa4babc23ef7b780916d75afda","src/zlib-ng/compare256.c":"a4=
a56d315a5756463d2cd9d76b1abf01fa3e323b6627a08bdfde97387d98e0b7","src/zlib-n=
g/compress.c":"a4f9aaeee845630db7adc7655850e904338a4426286884eb16ffd50956b0=
83ac","src/zlib-ng/configure":"a2e86f4361d97bf15faaeab23bc3e58f1ee91305c7bf=
2ea411c07d91350f1bab","src/zlib-ng/cpu_features.c":"067cae566bfcc42129b89b3=
110a6783f206afbc6b085efa9e012f0d18ea749e0","src/zlib-ng/cpu_features.h":"ba=
ba2e5301d4a0da588195eeae4f6f92bcca5af61f2ac9340a091c2723de71be","src/zlib-n=
g/crc32_braid.c":"4fee7f46585a9f5d664418d7f62de919716c19748cf14177da844448c=
76dae89","src/zlib-ng/crc32_braid_comb.c":"ebcf0b2ea5080afe155020c2541f3fdc=
15173484211851c8acc903ba83ecf0c4","src/zlib-ng/crc32_braid_comb_p.h":"6c803=
5e05d30a6241be55467fc59e4d7deda6b618b955a11339ffee08a39c75a","src/zlib-ng/c=
rc32_braid_p.h":"4953f9c0100d0a435f3237e3a46b826fecbd8b0a50acdd6fab2270d0eb=
bcbbaf","src/zlib-ng/crc32_braid_tbl.h":"e22af112e3c1c8bb4065d39fe678eba71d=
d08893eb06f9414b02f4cf5a6f46de","src/zlib-ng/crc32_fold.c":"04aab2780ff42ce=
133613a3d92b151561e2a5d4d447cebc57c4fdde3cd11949a","src/zlib-ng/crc32_fold.=
h":"4799db97dbdbbbdf9757d1b0263998d88676678211b22fec59e8416980090e9b","src/=
zlib-ng/deflate.c":"d442202e7f63a9eab0f33223697c8091196c56e1a392ce20dd48d71=
b73928987","src/zlib-ng/deflate.h":"79f6002f4765507a82f77576a0b2ced6dde776f=
e2882f402a29b060a8798b956","src/zlib-ng/deflate_fast.c":"9d87443601e57ef180=
fa1e11a788f1f8cf85af363f6db38c2ce2cc27e0d113fe","src/zlib-ng/deflate_huff.c=
":"9bb6b2e3d84831bb00f53f1a0a588f8c066bbed59a07f7d96f186627cb22092e","src/z=
lib-ng/deflate_medium.c":"1f53407841a4a3f489ff6a447703965df1dc18f28a6791953=
7702d2f269c7e8d","src/zlib-ng/deflate_p.h":"f53d2a6c3c5e0fa5be89dc054d4b7e9=
b49a3e95646fac6500c1e824d79dcfd62","src/zlib-ng/deflate_quick.c":"a7a80b9c1=
d0214974407b15df42d2863c21dedbd79254ee834fd85fe0b952fa1","src/zlib-ng/defla=
te_rle.c":"657e5988b88209169768fe6a7ae5e1ad768cbea550b37b360d9cacdc2ae31385=
","src/zlib-ng/deflate_slow.c":"e4c78f7a57e3ccd91cd45b7af44bd45d564872796de=
89f6f2538ff7493448c2a","src/zlib-ng/deflate_stored.c":"7ec2694ca9f6b40f7c2f=
876f80e5f0d7d911bf59f9a8e5d401dfbe204a258ff6","src/zlib-ng/doc/algorithm.tx=
t":"0d21a0a4c47e512743389628d1385a831a5e5ff716491095a382b923287f4223","src/=
zlib-ng/doc/crc-doc.1.0.pdf":"064f9252d6e2e15ea56c2bd18e160e5c9c84bcd137c11=
a7af497aaa511ace998","src/zlib-ng/doc/rfc1950.txt":"8f0475a5c984657bf26277f=
73df9456c9b97f175084f0c1748f1eb1f0b9b10b9","src/zlib-ng/doc/rfc1951.txt":"5=
ebf4b5b7fe1c3a0c0ab9aa3ac8c0f3853a7dc484905e76e03b0b0f301350009","src/zlib-=
ng/doc/rfc1952.txt":"f7c810fd9d719d002d605207a9b880600f71d039b9626c5b4b03f2=
122438dd2d","src/zlib-ng/doc/txtvsbin.txt":"47c273bb22c9773248d380549a330e5=
c262266b1292154b0d3014f731cc73f47","src/zlib-ng/fallback_builtins.h":"6864b=
7d0d11bad111895c812ef499c63ad4aa8b7fe86b16d0252d945534ee988","src/zlib-ng/f=
unctable.c":"2be51a15f7424225a6164ec3e736a4c56191645eebcea95b19e16f070e45a8=
7d","src/zlib-ng/functable.h":"d82fc549205db848e74f5d23c91ae4d00114edae6559=
0475ca15ec845a49059a","src/zlib-ng/gzguts.h":"8f7a66046f75e3c5f36fd8ccf2b2d=
95eafd0d2cdecba145612ca776b8eeac460","src/zlib-ng/gzlib.c":"7e6ad5d9d32e642=
9d56a5303e2c6e6870d69c023d6647a52fb95902828de4011","src/zlib-ng/gzread.c.in=
":"9c20e0435055175ccebfa5dec217b22210637ed8cc06b53e21d02025f3a0ffd1","src/z=
lib-ng/gzwrite.c":"f8650a2d2a9daa2f523c53ee8ccc420f0f3521b8d44c6829a5805da1=
f59afaf0","src/zlib-ng/infback.c":"5f6446584e95d961de0d75b4e04b9452ec03e957=
47fa7d79a53db71c900dd90c","src/zlib-ng/inffast.c":"dd20040aae76a1e857f27cfe=
55460e9a7c16df0719b2e0ca241af8ff4967a2f7","src/zlib-ng/inffast.h":"42e74a92=
b496ab0726be317e8497a12bf3c3cf3d0d533440ce65befd3929c71c","src/zlib-ng/inff=
ixed_tbl.h":"a94225335396245e9f0ccb2e9b4b334fe7ee0111ed8e32a26bcd52187f3643=
14","src/zlib-ng/inflate.c":"861d7a20ef1da8b8d9835585a29ddaac1e99ff31a1a36f=
3079c240772ef953a3","src/zlib-ng/inflate.h":"c82dff42121e0f0e6e0fab1f9bc9e8=
c43b60bb38ec10a3aa15f0417e54c791b2","src/zlib-ng/inflate_p.h":"3dbb8bf4f6c9=
5a51718533851730b1d0d79bfec301102f8a9fd9f903426b297a","src/zlib-ng/inftrees=
.c":"4afec770066911de89f90c1525f87883ea0a9eda672ae9758144ee1839d93f50","src=
/zlib-ng/inftrees.h":"fa80eb11c2290b345470a03cb861843e2cb1365135233ea8243e9=
fd79d3618a1","src/zlib-ng/insert_string.c":"7a9455cbb3ca8fe6e7111471b9f4c0a=
32fb49a6d0ec589b027dc2cb2b65c8dce","src/zlib-ng/insert_string_roll.c":"4d05=
f19591a5c29d2da398e10e9d0b050d738cc8838d8dda4beb1cc7281ede07","src/zlib-ng/=
insert_string_tpl.h":"45889b69063592591a55d246cb418a50f8891cc7bdb86b21b46b2=
03bc175d60e","src/zlib-ng/match_tpl.h":"03783f06ae132ea36d23420c3348e4a5152=
d8014159da6849ef77a1de96a99c4","src/zlib-ng/slide_hash.c":"97ec270b4c744a9d=
ee638081e47807bc7340f859f9aa22e4acf4599fdb45f39f","src/zlib-ng/test/CMakeLi=
sts.txt":"8c36c775277a6e8dabc7e256ac4631308d5c0af2f585212f904d686d0d0c6bde"=
,"src/zlib-ng/test/CVE-2002-0059/test.gz":"60bf96b8f433bd7e057ce3496aceaccd=
70ec80f596a4aa8bcc7786056705ce66","src/zlib-ng/test/CVE-2004-0797/test.gz":=
"38caae524705f676bde13a8df9fc8c7d2fe105ba6bdbab62a405b0276fd3aa2e","src/zli=
b-ng/test/CVE-2005-1849/test.gz":"e4d5a60617df4b5dd44eda94751ce1eacdb325792=
bba6e3cc4676719a3adf742","src/zlib-ng/test/CVE-2005-2096/test.gz":"8f702d48=
61aa3ec98ac03a59ff26b430939630cb5cd4266d2658d3b836d576f9","src/zlib-ng/test=
/CVE-2018-25032/default.txt":"d7f8278db331c47bd1208bf41e7903cbddee4f7b47c66=
6c40afdd3c96237752e","src/zlib-ng/test/CVE-2018-25032/fixed.txt":"3b27a98ed=
d2f3f580033f9add11d3469d7808c969a1128ee00c18ac7a12cef57","src/zlib-ng/test/=
GH-361/test.txt":"358497d0a7251ea42101dc77b02337f46fd89af09643a8288e2a3082e=
5d24128","src/zlib-ng/test/GH-364/test.bin":"af5570f5a1810b7af78caf4bc70a66=
0f0df51e42baf91d4de5b2328de0e83dfc","src/zlib-ng/test/GH-382/defneg3.dat":"=
b22bef6b7392401c9e7b079402c4a4074053d7a914d050400e37fd7af6fe26d5","src/zlib=
-ng/test/GH-751/test.txt":"b83d833803b7bc3124fb2a0034081f0b999ad10c33a8dfa3=
bfd181dc078ae3ee","src/zlib-ng/test/GH-979/pigz-2.6.tar.gz":"2eed7b0d7449d1=
d70903f2a62cd6005d262eb3a8c9e98687bc8cbb5809db2a7d","src/zlib-ng/test/Makef=
ile.in":"a6b0a02967a93d78f88d705cdebeaec7e3ce85ff2bc65e30e80324ccff29f7c7",=
"src/zlib-ng/test/README.md":"6a34f8fc7a0144958cc9a0cded46fc38a7e15aba3dfa5=
bf56d8d86c3fb72d82c","src/zlib-ng/test/abi/ignore":"02aa87f77656dbc1fbddd23=
f436cd15465a92df0722da4055cae1bc8bf013097","src/zlib-ng/test/abi/zlib-v1.2.=
11-arm-linux-gnueabihf.abi":"f5e91f25b558a891fecbeb6e2e9575698630ab700d055a=
38f3bc4fe66257f513","src/zlib-ng/test/abi/zlib-v1.2.11-x86_64-linux-gnu.abi=
":"038337383cf780587d810cf5400d632f3a1f8517e63ac4a71b6e5224db8b1413","src/z=
lib-ng/test/abicheck.md":"d960023cd80e04b2d4dcec8cdd3315c7292229d45a3301a5d=
c5213058ba22185","src/zlib-ng/test/abicheck.sh":"7be2e4774543a1c018c6024fa6=
85de2ee3cdcf06ee6419e04b23249e0fcd6645","src/zlib-ng/test/benchmarks/CMakeL=
ists.txt":"0eeacc3b19579d75fbd6a50cc1ad980a6daafd99e92474b156ae2e57b235039a=
","src/zlib-ng/test/benchmarks/README.md":"2976b327e44b0066ae197b15bc0201f4=
e43375019718714f05acf50f9245f9da","src/zlib-ng/test/benchmarks/benchmark_ad=
ler32.cc":"65d98c8fa2b24bc9fe2335159d030c2f8cbd0a4af38bbb9e823b3fafaaa93c65=
","src/zlib-ng/test/benchmarks/benchmark_adler32_copy.cc":"6a5cd0ab97ff46c5=
b67e85abed05b28a4a8d7d5be50e8b8aa66bf47ab49acc06","src/zlib-ng/test/benchma=
rks/benchmark_compare256.cc":"faf9dd6246d453005c7a14638abb9833db40f06011025=
4eb5ff1739fba170e3c","src/zlib-ng/test/benchmarks/benchmark_crc32.cc":"33e1=
4b97607f17069c64351564baff8d8d86c969baae98073491d986f0731a99","src/zlib-ng/=
test/benchmarks/benchmark_main.cc":"b23f1419d7c6f6dadd63fe69afcd54d4821aaf9=
5782145f3feb65d5d8564233a","src/zlib-ng/test/benchmarks/benchmark_png_decod=
e.cc":"e9485de5e722ef1b62131a27a98d2cfe668ee8becbd5fc9938972022e07c8d60","s=
rc/zlib-ng/test/benchmarks/benchmark_png_encode.cc":"4b2203af2ef58f95773ca6=
d82569f747f2cfb3c4116334871cfb255a0d7741e1","src/zlib-ng/test/benchmarks/be=
nchmark_png_shared.h":"23427ba4e9865ee362990c22a1aa88e868a1ac1f4024892c6b6c=
2a3102566a93","src/zlib-ng/test/benchmarks/benchmark_slidehash.cc":"061d803=
01e2c016f0e29b04e545b7785eadc5106c6ec431ab1a721628d8c8cd9","src/zlib-ng/tes=
t/data/fireworks.jpg":"93b986ce7d7e361f0d3840f9d531b5f40fb6ca8c14d6d7436415=
0e255f126512","src/zlib-ng/test/data/lcet10.txt":"1eb5d7bddb1c3cb68064d5b5f=
7f27814949674b6702564ff7025ced60795a6d9","src/zlib-ng/test/data/paper-100k.=
pdf":"60f73a051b7ca35bfec44734b2eed7736cb5c0b7f728beb7b97ade6c5e44849b","sr=
c/zlib-ng/test/example.c":"f84aed9043e995123728c6fccab2d9b2da0439962b590277=
5c9e29a9b06806a3","src/zlib-ng/test/fuzz/CMakeLists.txt":"e9d833705121d8f6c=
79efb5dc3b8a8acf909837c70f3b3fe610228575ea72b0e","src/zlib-ng/test/fuzz/fuz=
zer_checksum.c":"68ed79ec1d7fefa548f4d32ab7885479442520cdf53ad59eadfae13e4b=
15efe0","src/zlib-ng/test/fuzz/fuzzer_compress.c":"3f507a18710fb2a1d87fde5c=
f3affc74b53a689e9d2ce6f887ee64eb778e568b","src/zlib-ng/test/fuzz/fuzzer_exa=
mple_dict.c":"46541ed3ef9bb7378120d47133f18b4194e955e7a84a439647205de68e745=
c08","src/zlib-ng/test/fuzz/fuzzer_example_flush.c":"393e7872825bb1ca366d0d=
8552b94442511ed4a557db6ece16540b79b7e9cbdf","src/zlib-ng/test/fuzz/fuzzer_e=
xample_large.c":"e3b91b1ced83dfe538e8ae5262f1756181a7785e8c2ab38ac2881456bd=
562277","src/zlib-ng/test/fuzz/fuzzer_example_small.c":"de9f5dc318240575034=
1a0f44c37bd8ba4f21d993284456ba8e6ce3e36d6b9b3","src/zlib-ng/test/fuzz/fuzze=
r_minigzip.c":"a02628aa452d9eb0ea42bf3c01b005a6569da50c832b78f90a1dec425bf3=
c677","src/zlib-ng/test/fuzz/standalone_fuzz_target_runner.c":"e6170b744faa=
68bf2a414e99fc87accf4db2a5e0eb58b17aded5c692ea493604","src/zlib-ng/test/gh1=
235.c":"8310ef780dc483a1708750cd7c120b8e9cc0e1614767d24c01869e529074e981","=
src/zlib-ng/test/infcover.c":"b4a4b659b2180fbfe0178940235eb9773508a7794f9d2=
7c758e0ee8f7971d85a","src/zlib-ng/test/minideflate.c":"56d3f2a8b72cbce8f58e=
4d26591cceafed58c5441a1efffc619c3baf27be8e13","src/zlib-ng/test/minigzip.c"=
:"3c2a2bfd67c1bffe9cf55ef2e15648aab7a209a6546beeb4df0c27f6cc7cae53","src/zl=
ib-ng/test/pigz/CMakeLists.txt":"aa70f1025adc004985bfe0accee9b7a80e04786d82=
705e27c377a5e8d4ecbaaa","src/zlib-ng/test/pkgcheck.sh":"75b3155125f235e27ee=
434d76b6f72bd825899b55f6d59ef2d032fe67a2896ed","src/zlib-ng/test/switchleve=
ls.c":"f4c482766b2e85ebdfe74ab488b16a4e807d5894dce2cfc5a0501c347db211fe","s=
rc/zlib-ng/test/test_adler32.cc":"1b53271b0317c4ac435fb7f1c430fbcce00413645=
96b8658b2d4ef4ced04a28c","src/zlib-ng/test/test_aligned_alloc.cc":"2728bb53=
528f280830b63ad5abf2674227cce8ae7840b5a4c4841c73d95ec09d","src/zlib-ng/test=
/test_compare256.cc":"1068f9f8d20660429a224392112dcbfc45fca5eb5116d31e61fb9=
8a9d3f28389","src/zlib-ng/test/test_compress.cc":"2e0b0c8435ca89dbf827f4c1e=
00874ad52743703644143dc8823ac5699507a36","src/zlib-ng/test/test_compress_bo=
und.cc":"6cf532aba78cfad2b453a6be96de3afa1e1ff49f062d376615e6f7028cfed14e",=
"src/zlib-ng/test/test_crc32.cc":"c111ceb33473a2514e6df5fb0abc4f495e13f7a8e=
37255476ae0ef3d7e75decf","src/zlib-ng/test/test_cve-2003-0107.cc":"629f1fe6=
59558c9deb767b3fbbb615539b0458f8b67a405ece924cac6bebb531","src/zlib-ng/test=
/test_deflate_bound.cc":"5bd722e6749612b714bef7dc8dc183759b629e8afa8f068415=
378e7ff7ac12d9","src/zlib-ng/test/test_deflate_copy.cc":"1a286ba7772bb1a6d0=
6233b075a83f3f1814bab2fd7d3757c090f5db25db90f1","src/zlib-ng/test/test_defl=
ate_dict.cc":"344613040cb70d9f6ba6a3c40c0ef452644f9656c43f1e0969b84f487e4e3=
db1","src/zlib-ng/test/test_deflate_hash_head_0.cc":"3144479b7d5b9f3d4ad2ff=
2d43dbce5b3e7043acd1ae5b06d6ce8db6e98c8573","src/zlib-ng/test/test_deflate_=
header.cc":"93bf9a4099540d47fe01c07afeb8dbc37a5551076c98df1dca2b9b5e96aa813=
1","src/zlib-ng/test/test_deflate_params.cc":"3701da15960c0984373cde19d1459=
6c26911679e0b95e5261cb8515f65150b65","src/zlib-ng/test/test_deflate_pending=
.cc":"faeeaf37a8aa2512e8551084a20c41181910335021961728be26f568c7f68cf2","sr=
c/zlib-ng/test/test_deflate_prime.cc":"6c83e5563d00d05bf62ce0e7bc1ccb78cd08=
0c1627b2a3bc878fa2c2b11986aa","src/zlib-ng/test/test_deflate_quick_bi_valid=
.cc":"9706d0bf9d844b21f1655498bf0f9901c7dfc272cdef37f2d1af238c71df611c","sr=
c/zlib-ng/test/test_deflate_quick_block_open.cc":"30e81885917d8414faea99f74=
ed178790ed7c2884ef231d7f144f9fa32f993c1","src/zlib-ng/test/test_deflate_tun=
e.cc":"dad52ad7941aca761ff177877a0d60f1b68b3a6d28a8f4bd382005f3c04bad64","s=
rc/zlib-ng/test/test_dict.cc":"2bb6c32ec0ea76561172e0b5e8c6a7bf4f64efc2b415=
34b42ec1d6c3d0990897","src/zlib-ng/test/test_gzio.cc":"2b811ed1927015decb44=
70073b59f85f6e405559eae044b5eeab545b8a492bbf","src/zlib-ng/test/test_inflat=
e_adler32.cc":"f4c1e9f88cdbbd672cff8bef2eab8c01ddb598494d1ade07d3f3630d1916=
9f6a","src/zlib-ng/test/test_inflate_sync.cc":"fbb1121ea5b5448723c6d6d86921=
10c7362e6833fae22afcd46909d4ecb1289b","src/zlib-ng/test/test_large_buffers.=
cc":"168eff24816cb28e2b49188012cfec9ac474b01e83c5bf8ae602f010f100fb61","src=
/zlib-ng/test/test_main.cc":"62e058cb2a411010796c5e69e55759fccadd8ce49fcef6=
884a9cd9b035d054e8","src/zlib-ng/test/test_shared.h":"c11e53b07ade7065e83bc=
92e812a0af56d6202b40bcadf1f4473cabc152e2579","src/zlib-ng/test/test_small_b=
uffers.cc":"680ba24dc58c7dd05e8dab2e430a8e0c99b946cbc341a5fb39c4b4b921b6fb3=
3","src/zlib-ng/test/test_version.cc":"8599eca8dd63a96962a5c8ac01a3172d203f=
9065e228867928ed4bce61cf6009","src/zlib-ng/tools/config.sub":"32186cfeb5db6=
2c99e1dfbfb07f24c1a50977447b4c26d2907021c74422a70d2","src/zlib-ng/tools/mak=
ecrct.c":"6194908f8f810a626f3183c379b067e9b1897b88276ecf9011590a21a43a1a78"=
,"src/zlib-ng/tools/makefixed.c":"bffd02540231304f9bcc755b8cb9ae5cfbc489758=
57bbb4547f1d6acce21ef57","src/zlib-ng/tools/maketrees.c":"3ea81e69ac0767e47=
9e7065662e4f6a4e6f528acb78c86968945017357f802fb","src/zlib-ng/trees.c":"e4e=
ac691fe9e535e2d0582f326d5f0cd8c216265716e848b6b9d5f94e881781a","src/zlib-ng=
/trees.h":"24174f3543b01ee1ef370bbf6d15551a21871cded18b2aadf09a71e7904b6f99=
","src/zlib-ng/trees_emit.h":"6c541dcf01eecf393d4eab7800bc558ad524114bb5a8d=
eb86f13376fbef88754","src/zlib-ng/trees_tbl.h":"022736ff3362ef3591d1f8fc3b7=
fede5927c0d25ab0813d7ef8cd95efd6ea242","src/zlib-ng/uncompr.c":"1656c770b8f=
7455bd5ed3cee78d226b010a56ce9c6a4ce66b4f65df1c19cfef4","src/zlib-ng/win32/M=
akefile.a64":"115fe42cf85877e66137893c02fde21e9010848b34965544a57b5540b4601=
a48","src/zlib-ng/win32/Makefile.arm":"1ced9c213d47e451f5dc21c4eb4cd05e6c02=
1cb2d2e36d60d6f8dd69fbfc519f","src/zlib-ng/win32/Makefile.msc":"fbbf3fe93bd=
be11ac1e79d471d862fd6dfa6874501bc682d2b084cdb3f3c2425","src/zlib-ng/win32/r=
eplace.vbs":"0ecd6d2f42f4f49d835acbf7b89a79cbdf17fed29d5931eeb3b40da6d31339=
46","src/zlib-ng/win32/zlib-ng.def.in":"3d1167b8b9db56bf3ae5e4b569af743b5d0=
08d012f4ac2ce5e4b6f951b9a71bd","src/zlib-ng/win32/zlib-ng1.rc":"98b6d62f427=
509c4fd22c2288541f99455e1f1f7a9a349e859cc2f7e1d438ea1","src/zlib-ng/win32/z=
lib.def.in":"ec69c79c2a5612a5c4dc9de08c930c9b251f2455e4bca8781f70c05f7170fb=
3a","src/zlib-ng/win32/zlib1.rc":"66fa46294e779c0c7182d2d01abee6b112ae5e05d=
91726e3684925df7d8433df","src/zlib-ng/win32/zlibcompat.def.in":"c4dff5ac2cf=
e629155c7de5b0f139fb1c962fb01addbc032c3cf35110921eb27","src/zlib-ng/zbuild.=
h":"2f336c4af4c1445029b31d55db1ddad65ef78b3db0026d910aa3c3b20cf58e66","src/=
zlib-ng/zconf-ng.h.in":"91893ca925182a08fe11bd728b77dd818bb0af15ab5abe9a39d=
8d01e2e114d08","src/zlib-ng/zconf.h.in":"2816eef7bb70d874d8be00cdf984ecc804=
a8213a0d47454e7feabde2bdadf9a4","src/zlib-ng/zendian.h":"f5cfa865281d2c5d0b=
097d318500f27daeec346e7882de68e279486d79c52e77","src/zlib-ng/zlib-ng.h.in":=
"cd139e1dea10683be03cb6be6847980c0595d026474076866b952fae3709ecb6","src/zli=
b-ng/zlib-ng.map":"03ef4439594619e215dbb1717f8c13e16159308ef3817761ba1a3cca=
7f7834df","src/zlib-ng/zlib.h.in":"3261ec4605c45a065d5270bd1ab225639ff5a953=
053e830347f82eb0f919860b","src/zlib-ng/zlib.map":"9997aa913dec6da106ab2089d=
2a72ca5e1b7fafe0807ac0bc1318ce8c8defab9","src/zlib-ng/zlib.pc.cmakein":"4e2=
5f45fe7522c3f444a27dbc68ca595447ee4f73be6d0fdcf7abccac67cda09","src/zlib-ng=
/zlib.pc.in":"e7964018e5293e5221573c129e73b379499dd5aa8b9739db1782fdfa24bbd=
ff7","src/zlib-ng/zlib_name_mangling-ng.h.in":"474b5cadd2deba6c78084aed9b87=
2e95c3888ffcdba153b934fca4f88dd1c36e","src/zlib-ng/zlib_name_mangling.h.emp=
ty":"38e51a846d6c2bd6100298c55328dba4437c08fa1dceda4eb2e06ecb1d142058","src=
/zlib-ng/zlib_name_mangling.h.in":"00c1b07fdbcb52c43f3b11ae5a4c98f66918049f=
53918607e698b992a46024fa","src/zlib-ng/zutil.c":"64ecee4e622d6fe4d00ca94bd3=
02b27beb03178129d4be4b2d12c1823a73a27f","src/zlib-ng/zutil.h":"59cc0ffe4c13=
662d9729e28ed098803e6f1c6d36fd8b0654da9bca53eebc3b4f","src/zlib-ng/zutil_p.=
h":"ddf2e95f2e7462a1ae4d330b26d454a394684cbfddf74af3d3e4ceff5db85275","src/=
zlib/CMakeLists.txt":"b87275731cc3ebdfea144187875cea204f555c343279c0f35f2d4=
6d661bfe34a","src/zlib/ChangeLog":"4c9f1a65b9b4be8bf164a97775ef50e4db4e02ea=
8c9933fdbe629a640691375e","src/zlib/FAQ":"1e8a0078be0ff1b60d57561a9e4a8cad7=
2892318a8831946cba1abd30d65521c","src/zlib/INDEX":"3b4e325d47ae66456d43fcf1=
43ba21ab67a02a4f81be7ef2da480ba30d774266","src/zlib/Makefile":"ef23b08ce012=
39843f1ded3f373bfc432627a477d62f945cbf63b2ac03db118a","src/zlib/Makefile.in=
":"5021b2bac4164f48b17c91c8a2e3c225be7ad31d8bfab1bbaadd90370afe9991","src/z=
lib/README":"7960b6b1cc63e619abb77acaea5427159605afee8c8b362664f4effc7d7f7d=
15","src/zlib/adler32.c":"d7f1b6e44fee20ab41cef1d650776a039a2348935eb96bcbd=
294a4096139be3a","src/zlib/amiga/Makefile.pup":"a65cb3cd40b1b8ec77e288974dd=
9dc53d91ed78bbe495e94ccc84ddd423edf1f","src/zlib/amiga/Makefile.sas":"0e63c=
f88b505a1a04327bb666af3a985c5e11835c0c00aed4058c0dcc315d60e","src/zlib/comp=
ress.c":"5c11e1fc22e219cb986f6fa9e4ba939315227e84aef042737d38ec668b89b6d2",=
"src/zlib/configure":"86b38f27f31d2fec76d9355872550dc63cb3949774473fd6313c5=
a3fd1def0e2","src/zlib/contrib/README.contrib":"ca39b78bd7ad84f1df7b0da9077=
0c5b3fa4c8e2c75d132e9222812fac8839630","src/zlib/contrib/ada/buffer_demo.ad=
b":"469cf566a6965767fee6b987a239ed8cedcc66614940d45a9b434331fbb435ce","src/=
zlib/contrib/ada/mtest.adb":"41b6f31684770334afdc4375871eb1408542f37a823a07=
3556fdbfdb63753160","src/zlib/contrib/ada/read.adb":"fa5b989aef0c5715a3fcb1=
5de93985f7f10aeb0a7f5716745c95ed820eb9af9c","src/zlib/contrib/ada/readme.tx=
t":"8fe9e5303f2e8e8b746c78250e74b7c4aeb7ce6212fdce751fc3a0ce56a47fe2","src/=
zlib/contrib/ada/test.adb":"5e3abe79b387e09a9a42bd0543105e228f39a335240cffc=
33d71f0ba66ff2511","src/zlib/contrib/ada/zlib-streams.adb":"f45988e2bac76eb=
25a0dc981f46576e7432c35dde1790bbc2b650f0090b7fa72","src/zlib/contrib/ada/zl=
ib-streams.ads":"969e8edb0611810fb52159dcb7c40228f4e5da810a7a3576b778116a93=
038c6b","src/zlib/contrib/ada/zlib-thin.adb":"03d89244ee5ec9771d9b5050e586c=
609f851af551b2e64eb151f1d5be0b63ae9","src/zlib/contrib/ada/zlib-thin.ads":"=
631ef170bde16c3ca8d412b54a0e519815b80197d208f8f393e6fe017bb0968e","src/zlib=
/contrib/ada/zlib.adb":"c9ca5dc34fbcdf06e2dc777b7e9dcd0ba31085b772b440eb0e1=
2421323ab672c","src/zlib/contrib/ada/zlib.ads":"02634bec0d5e4c69d8d28591243=
80074a57de8d8bd928398379bfacc514236d2","src/zlib/contrib/ada/zlib.gpr":"859=
bb69dce38dbe9dca06753cf7ae7bd16d48f4fece8b87582dab8e30681d3de","src/zlib/co=
ntrib/amd64/amd64-match.S":"166007f7e9adb58fe8b83d85bbfe823f5e05858ba1d06ed=
f637b78886caa2c69","src/zlib/contrib/asm686/README.686":"c21cc7147c956ecae1=
7dd084cb41a206b086216fa521012871fb07fafd203c6d","src/zlib/contrib/asm686/ma=
tch.S":"873799062495629f21cd3f779ea4b927add7aae0144e32d3594d9ce70185e99d","=
src/zlib/contrib/blast/Makefile":"17d5d26c24bf51cad51045a38ffb73cc3539d29e8=
9885aa249fcfd45a8659d5c","src/zlib/contrib/blast/README":"baa763ae03d88ef7e=
ce6eb80d9a099b43d0b57639d6d281e1c7c6ca79d81daba","src/zlib/contrib/blast/bl=
ast.c":"1ab3e479d342bfc144167b808fb00142264bc50f24a110ca88cc774e351c218e","=
src/zlib/contrib/blast/blast.h":"4d4e3e6f893316f0be77bfd642c857a77f1fa2925a=
cb5df9753e543d35aa3a6a","src/zlib/contrib/blast/test.pk":"5f5c262c545574a5c=
221132d5ef832478d222d70b015341795b3860204140d7c","src/zlib/contrib/blast/te=
st.txt":"9679b2c98e1283222d0782b25a1c198dc64ba9ebd1addd6dc6f643a45947cda3",=
"src/zlib/contrib/delphi/ZLib.pas":"1b20e173443a68c189cdaa4795620fb1ac165d9=
e61a27a1ed2cf690f13530d6f","src/zlib/contrib/delphi/ZLibConst.pas":"84bcc58=
0bdf397e570f86f3f5a5b8c7bf537828f30b4b72648b81911f6bf5095","src/zlib/contri=
b/delphi/readme.txt":"f7420ed2de77d4b498eefbbe6402a1d17dc2d411735289c78a265=
c7f10fdaee5","src/zlib/contrib/delphi/zlibd32.mak":"850e91b6c9ea05de61a411c=
bda16fa0f10118cd88bb32c4b7226988776f8d511","src/zlib/contrib/dotzlib/DotZLi=
b.build":"b96137097669644ecb9f42cdd3399d1fce9c512788374609303f7e50abf597f0"=
,"src/zlib/contrib/dotzlib/DotZLib.chm":"20d0e3edd57f849143255a7f0df1cd59d4=
1db464a72c0d5ab42846438a729579","src/zlib/contrib/dotzlib/DotZLib.sln":"a97=
9198c5b8d144c1ac8f993bfb6f4085d135aa58ca9dcf63ebabf52b5c695f7","src/zlib/co=
ntrib/dotzlib/DotZLib/AssemblyInfo.cs":"314afcfb339ea95f5431047b7ab24631b11=
c3532c7ce5dc2094ed0cf80a7c16d","src/zlib/contrib/dotzlib/DotZLib/ChecksumIm=
pl.cs":"e7c047a2c3bcf88d3d002ee3d2d05af414acf53cb4451efacc0f2e95a474ea0f","=
src/zlib/contrib/dotzlib/DotZLib/CircularBuffer.cs":"be84c9736fe7bdc2bfae70=
466d8fff582504e928d5b5e110fd758090090c8cb7","src/zlib/contrib/dotzlib/DotZL=
ib/CodecBase.cs":"259bdda1b7d6052134e631fa24bfd9dca6e2362563496c8b85257b56c=
848908c","src/zlib/contrib/dotzlib/DotZLib/Deflater.cs":"06ba6696a3c15c53ba=
5fd5a1c2bf50b51f217010228fc1e4c8495ee578f480de","src/zlib/contrib/dotzlib/D=
otZLib/DotZLib.cs":"9837fe993fd631233cc5e53ff084d86754b97f05ec77c54b0764c27=
06f186134","src/zlib/contrib/dotzlib/DotZLib/DotZLib.csproj":"21606db31dfef=
6410dd438b73f1db68856eacabcce6c0f0411fc4f17e17001f3","src/zlib/contrib/dotz=
lib/DotZLib/GZipStream.cs":"8d1de9755c77046b4ac71340a0a54434ebf4fd11b085c44=
454d7663a9b4df1c5","src/zlib/contrib/dotzlib/DotZLib/Inflater.cs":"9016ca73=
818f5b6a28791abc3af6da7c4d2773b6a3804f593f6d5737a62b99ad","src/zlib/contrib=
/dotzlib/DotZLib/UnitTests.cs":"ad66ac08de34d253e9615b96a745f3dfeda93f4a978=
d65d5d3ddb9d0d9b3e099","src/zlib/contrib/dotzlib/LICENSE_1_0.txt":"36266a8f=
d073568394cb81cdb2b124f7fdae2c64c1a7ed09db34b4d22efa2951","src/zlib/contrib=
/dotzlib/readme.txt":"d04972a91b1563fb4b7acab4b9ff2b84e57368953cc0596d5f5ea=
17d97315fd0","src/zlib/contrib/gcc_gvmat64/gvmat64.S":"22ff411b8b1d1b04aeaa=
8418b68245400267dc43c6f44104f6ccd37f0daee89f","src/zlib/contrib/infback9/RE=
ADME":"890288f02bb3b1f9cc654b87a07fcea695f90f6b9bd672d25bf6be1da2ec1688","s=
rc/zlib/contrib/infback9/infback9.c":"0a715c85a1ce3bb8b5a18d60941ffabc0186a=
886bcc66ba2ee0c4115a8e274e9","src/zlib/contrib/infback9/infback9.h":"dda230=
2f28157fe43a6143f84802af1740393572c2766559593996fd7a5a3245","src/zlib/contr=
ib/infback9/inffix9.h":"84a2ba4727767c18af6505f0e81d9c814489c8b9ed330a25dad=
433db72997e43","src/zlib/contrib/infback9/inflate9.h":"32a907676cc36e27d0fd=
c0d99adb83a0b23f20ab61896269216d40fecf08d349","src/zlib/contrib/infback9/in=
ftree9.c":"0c7f10396703b230c504207fe1595a2f2f8ba9c43158c4bd79d5b22ca36e04e0=
","src/zlib/contrib/infback9/inftree9.h":"8ae61d52e50d2dbdb0378548ecc54fcd8=
8f108c8b6fc30562a3ebec1ca6a599e","src/zlib/contrib/inflate86/inffas86.c":"6=
f266f3c7e0faca653256d0189c0f00d7dc0b062d02e25df4e1202e49369595c","src/zlib/=
contrib/inflate86/inffast.S":"70777bd21526680005fc34f086d108af49e2668ad86d1=
749e8e8100a81bfb288","src/zlib/contrib/iostream/test.cpp":"0f3c77e013949eb9=
c91e6b690ea894e19d97944d6b0885b82806fc3ad99680cf","src/zlib/contrib/iostrea=
m/zfstream.cpp":"8ebb9b3d521cc3392953f27658cf1f6dcb763216079f69a1518ec5ca0e=
42a63b","src/zlib/contrib/iostream/zfstream.h":"4369c35e66f63f52ca4a5e1759b=
f720507ccabb8f3f132e2f18e68686c812401","src/zlib/contrib/iostream2/zstream.=
h":"d0343e0c57ff58008b6f29643d289c72713aa2d653fe3dcd2e939fc77e7e20b6","src/=
zlib/contrib/iostream2/zstream_test.cpp":"f789df183cc58b78751985466380c6563=
08490a9036eb48a7ef79704c3d3f229","src/zlib/contrib/iostream3/README":"43ec4=
8ecbd95a8c45db20b107fac73b740bb11595a4737329188f06b713972cc","src/zlib/cont=
rib/iostream3/TODO":"af5ebc83fb88f69706c8af896733784753dead147687e1c046f410=
c0997fd88b","src/zlib/contrib/iostream3/test.cc":"8e17fc48dfdbc6e268838b8b4=
27491b5843b6d18bc97caa6924de9fad7abe3da","src/zlib/contrib/iostream3/zfstre=
am.cc":"8cdd67ed0b13c192c11e5ea90e9d5782d6627eb303fbc4aa5ebda2531ec00ff8","=
src/zlib/contrib/iostream3/zfstream.h":"1bd74778fac45ee090dfc0f182a23e8a849=
152deb630606884b2635987b357b1","src/zlib/contrib/masmx64/bld_ml64.bat":"1c0=
561908a07ebdff271b12ed757241e1813d3db0f3551501b2595c23f0833aa","src/zlib/co=
ntrib/masmx64/gvmat64.asm":"390c1e6d63cb615b5ba042842738953f9cdc688b2fe35aa=
ca981fd3fae213f3f","src/zlib/contrib/masmx64/inffas8664.c":"f6c585e43e6e524=
107566b1f10104949d0ef902159ac8203e1d98e50d4bedd62","src/zlib/contrib/masmx6=
4/inffasx64.asm":"8448d0041fe6e8f4188fe5916181a1b274c6d35d75cfb28da60cf4f1e=
dde44ec","src/zlib/contrib/masmx64/readme.txt":"9bb66b5028100855683853f12da=
0be479c7bccf74365fdbf37da2542edff9927","src/zlib/contrib/masmx86/bld_ml32.b=
at":"b0b05b62715d4a81a7db5b7ca4a372d109ec95634c9d3bef9e0041ff52de22fc","src=
/zlib/contrib/masmx86/inffas32.asm":"78d2cc88f8ed0e32ef960efc987c257bc1688a=
fe7d031a8ba18761e95a6a7c3f","src/zlib/contrib/masmx86/match686.asm":"9e9bea=
3b5517b089da7d39caded07982746a33f94f0907ca7e8afefed7be36b6","src/zlib/contr=
ib/masmx86/readme.txt":"1f29a04e0227b74e20ba1b7c764b3ca5bf596dd2c06e89bc19a=
05fb8f9689778","src/zlib/contrib/minizip/Makefile":"087034de3dc0223b29e64bb=
3a4fc3eda7b948e93d2a9ff154aecf9fed2a1eb5b","src/zlib/contrib/minizip/Makefi=
le.am":"2313a3480a2c3745fa7ce216829cd0367058907d3a0902e5832c66c84a2fdfc6","=
src/zlib/contrib/minizip/MiniZip64_Changes.txt":"302c62b328647f5472fb775524=
9a83459be7f8ffb1fae07e8ba318fce8f4126c","src/zlib/contrib/minizip/MiniZip64=
_info.txt":"122719c32ef1763a5f6ba9c8cdefc1d78a76f7156b09e7b6f69b73f968e0dac=
3","src/zlib/contrib/minizip/configure.ac":"35330dc0c6188127afd339829d91b19=
739d23bf3b7301bfb04f775a6fcbbdad7","src/zlib/contrib/minizip/crypt.h":"8e87=
2b60255b8447da99885c7159c2e1f1bb8143523bdbe71784e60f98bfd67b","src/zlib/con=
trib/minizip/ioapi.c":"66b39c27042f6ad12cc12efb0c82cdf100c6640b5fa959b8b866=
e252966113a9","src/zlib/contrib/minizip/ioapi.h":"8655408534b78dc0889a45f93=
59fc6d2d5c8e8d8443b81ede596f954c720ef48","src/zlib/contrib/minizip/iowin32.=
c":"2c05bc374d3d847c6a9f29eac9d674abba7659d1e91e34e172248fcb5c274d51","src/=
zlib/contrib/minizip/iowin32.h":"586f22b9c3c64da253ce2b518e0fad61f19a7b47b2=
89fc704cc9708242294c49","src/zlib/contrib/minizip/make_vms.com":"65736d9c48=
88f2373d3db0a13864d150c5040453f5bc2a5c8784379a7ea67590","src/zlib/contrib/m=
inizip/miniunz.c":"ced49f20c62536a8ffb270b35cfa4994a1dcdce45f8cf059b941c94c=
a0022666","src/zlib/contrib/minizip/miniunzip.1":"66d8684392167091ef0fe0159=
8d6a0daa26e7e448e2df6c3cb257487735b83f7","src/zlib/contrib/minizip/minizip.=
1":"5404596e8e5587a52f563906119f32ceee30a6d97a966afa5c7afbe4d373e210","src/=
zlib/contrib/minizip/minizip.c":"fdfcf83979ef2324c1455d369e8add8678c804939d=
412ce53f8b024578ceabad","src/zlib/contrib/minizip/minizip.pc.in":"8b6670b42=
d8e5e519e1cc89db093efc07ba23cb1ddfedd3c93ff2df08c3ce8ac","src/zlib/contrib/=
minizip/mztools.c":"cd887c4af6d20823bd15f24008b10acf01969b4165d7848656bde84=
3a92428d7","src/zlib/contrib/minizip/mztools.h":"6f82c52279e8f79165f4446be6=
52e5741a49992ac58632470335aa34c564072a","src/zlib/contrib/minizip/unzip.c":=
"497adf676b1cae2a7afa834e4aba86383f7b697f5fdd03a8179ea9024a431cf9","src/zli=
b/contrib/minizip/unzip.h":"d8dc58fc0121b6a4b98f3028205bb253f956b1ddf791e9c=
ed3cf44892502a01f","src/zlib/contrib/minizip/zip.c":"00f403cb7810578b4b2687=
dd55fb132c850c3630fba2f3704a8ab896fcc8209a","src/zlib/contrib/minizip/zip.h=
":"96163fc140e4bf08752e014d20a1eac3f5adcdc408366f6d79c1895f2599cf08","src/z=
lib/contrib/pascal/example.pas":"d842d456ecb6ff80e34cee2da31deb2072cc69ca83=
7497bea8b8bee203403474","src/zlib/contrib/pascal/readme.txt":"02f997c37991d=
dae0cb986039f7b4f6fc816b3fd0ffd332cad371d04c12cf1b9","src/zlib/contrib/pasc=
al/zlibd32.mak":"850e91b6c9ea05de61a411cbda16fa0f10118cd88bb32c4b7226988776=
f8d511","src/zlib/contrib/pascal/zlibpas.pas":"28b90aeeb3da8d1f6a98ab9f5f16=
03d08aba5bfabc50827d3f15e661268a51cf","src/zlib/contrib/puff/Makefile":"d9d=
738030464aaae354196c14fd928adf591832fce7d71ac1977c1d8d4923a4b","src/zlib/co=
ntrib/puff/README":"aceca4bc1bce7d9445b8bc9b6640c672d95708185f6070d3a3baae7=
a9d102caf","src/zlib/contrib/puff/puff.c":"6d0eef92e115a42e570b79d8b07a04af=
5ccbd6b3f3fbca9cbc61c49db9c9df43","src/zlib/contrib/puff/puff.h":"969b7be2a=
930db0cdcb19b0e5b29ae6741f5a8f663b6dba6d647e12ec60cfa8e","src/zlib/contrib/=
puff/pufftest.c":"8ee0da78a1221a3c2036e22eed06c2faa27a671a46565a60e10111d4e=
e9c30ee","src/zlib/contrib/puff/zeros.raw":"b7b0887089f7af1f6d1e0b4c0a1e8ed=
dd10223b23554299455c6c9be71b653a3","src/zlib/contrib/testzlib/testzlib.c":"=
c6c37b35c6ecc9986a9041f86d879cc37a9e4d8315af9d725071eb3b2cade0c5","src/zlib=
/contrib/testzlib/testzlib.txt":"2359bbdc84eb8a04e0f1cd16cd81a2896e957f2ad5=
8dab3ca78ef55b7d0dc577","src/zlib/contrib/untgz/Makefile":"8f5ab1564813e091=
cea8f1bb63da32fd80ac763d029277b0cabf50f60aceefe1","src/zlib/contrib/untgz/M=
akefile.msc":"d0f537de11d9e0e36e2a98b3971c537265f4b533b4c48797094365ad9ae83=
88b","src/zlib/contrib/untgz/untgz.c":"9a12d774301d252dcd38bba07ac369319da4=
c04c4fef8a50fcbf40aebf29c2a1","src/zlib/contrib/vstudio/readme.txt":"2a9ca4=
0b68274f4d37649dfab9e5e867a000883592b4ab8fdaec8425a63052c3","src/zlib/contr=
ib/vstudio/vc10/miniunz.vcxproj":"dd607d43c64581172c20c22112821924dfe862f56=
b2e5eb8780bdd0714d9527b","src/zlib/contrib/vstudio/vc10/miniunz.vcxproj.fil=
ters":"c3db9f97952683e688ad83c13bb94c816ac3e6b5f277fdea545b0650c125aa6d","s=
rc/zlib/contrib/vstudio/vc10/minizip.vcxproj":"af73f2cf8ae51e65e85342faeb40=
849a2310c97bc77def42b38d7070460a6cf0","src/zlib/contrib/vstudio/vc10/minizi=
p.vcxproj.filters":"83db58d87f5d7ca84b6087aa1f62b15cbc296194c8cf76e47a271f9=
077b4f3bd","src/zlib/contrib/vstudio/vc10/testzlib.vcxproj":"1525ed0893db56=
db44ec68675c8da3c229dc7867166dfc0428816783d16ad43b","src/zlib/contrib/vstud=
io/vc10/testzlib.vcxproj.filters":"d7e04ffa467d417dfa3c0f1c64234cadc8488210=
1bbae483f0a0f5d3d6b566a7","src/zlib/contrib/vstudio/vc10/testzlibdll.vcxpro=
j":"3f317d8964f17901c3e68bff5deaec10b6ccc50a572235999e8097292692984c","src/=
zlib/contrib/vstudio/vc10/testzlibdll.vcxproj.filters":"682a485f0184aabba94=
e12e1b284499195f37c176d43ecee0484f31e4d636f6f","src/zlib/contrib/vstudio/vc=
10/zlib.rc":"e8b581eb16930e0213d37143a5f17868839b22c758b23981a29484e17093c4=
94","src/zlib/contrib/vstudio/vc10/zlibstat.vcxproj":"2a38222d6c034d7e0b843=
c3f0540dc6c53dd48f942ae29f31620ca0327248c8e","src/zlib/contrib/vstudio/vc10=
/zlibstat.vcxproj.filters":"d9a2c381e51e4d6f027f3517db7db81656e43cec02ed9ab=
f267a0fde6f360180","src/zlib/contrib/vstudio/vc10/zlibvc.def":"0124fea28bfe=
e49c8a19dad0ed5a49277d451018b4affda5a389e64ad15f44d7","src/zlib/contrib/vst=
udio/vc10/zlibvc.sln":"e659860f705f31b87ea9139a3cb4ebe1561e120bce495383a546=
14fc82b49990","src/zlib/contrib/vstudio/vc10/zlibvc.vcxproj":"3108badf710e2=
f4a64eab4e7deae6642fb68cc0d94018e537149f1761e215133","src/zlib/contrib/vstu=
dio/vc10/zlibvc.vcxproj.filters":"58404ba7703c68025bec64b8a17ff1fc7f3a35d15=
d17ae3bcc4fa753f1348425","src/zlib/contrib/vstudio/vc11/miniunz.vcxproj":"7=
46e4c11fb8af4bcd6a9d68ba81ed1dc366a5de3bed56b291ee969ad733a7bb0","src/zlib/=
contrib/vstudio/vc11/minizip.vcxproj":"340617cae9cf4fcb003308021d3782ec3639=
e60d62d79a3aafc0a50bb55b061e","src/zlib/contrib/vstudio/vc11/testzlib.vcxpr=
oj":"589eec6ef6d818564ead938a629fda50abb6cbf8054b9f66ea780765c1a1b3db","src=
/zlib/contrib/vstudio/vc11/testzlibdll.vcxproj":"583bdef522b0176829f0d8139e=
a2a88b9cbc14379d1334f3a863989ed3df9b67","src/zlib/contrib/vstudio/vc11/zlib=
.rc":"e8b581eb16930e0213d37143a5f17868839b22c758b23981a29484e17093c494","sr=
c/zlib/contrib/vstudio/vc11/zlibstat.vcxproj":"51aa752698d96df065a9ece02e29=
3492f681b59a8077f036a5a60367dc621e87","src/zlib/contrib/vstudio/vc11/zlibvc=
.def":"0124fea28bfee49c8a19dad0ed5a49277d451018b4affda5a389e64ad15f44d7","s=
rc/zlib/contrib/vstudio/vc11/zlibvc.sln":"27389b515997defd080519f95aff87e89=
fcbe8b26d73c5ebb73c544cfef4d60e","src/zlib/contrib/vstudio/vc11/zlibvc.vcxp=
roj":"c3dd05e56159aba411475b83656275872524cb3c2fd24d690397d8b634e7e0ed","sr=
c/zlib/contrib/vstudio/vc12/miniunz.vcxproj":"1494af54570f6e93852932956d49a=
8c25e57b5abc1ac979945605ca9143df9f8","src/zlib/contrib/vstudio/vc12/minizip=
.vcxproj":"9bf128ed6760ca5f019006f178b1c65f4c7ff122dba8d297b64b0eb72feeb120=
","src/zlib/contrib/vstudio/vc12/testzlib.vcxproj":"367a06caa399bd09f6b9cb6=
0706820943dd6a6cf05794275baaf421da9c2a0b7","src/zlib/contrib/vstudio/vc12/t=
estzlibdll.vcxproj":"93416510256935d79625dc9fd349cfce6968c062d42a138bec404a=
26b2f92f5e","src/zlib/contrib/vstudio/vc12/zlib.rc":"92d5d3a4938a6350395934=
153416a7eb74353cdfb2321f45b9ee0b9b16257f39","src/zlib/contrib/vstudio/vc12/=
zlibstat.vcxproj":"744ff6ac0d4e2dcdf74c7d33b979fbfd2b18550947eb99bfd46dc6a7=
3eb1c68d","src/zlib/contrib/vstudio/vc12/zlibvc.def":"0124fea28bfee49c8a19d=
ad0ed5a49277d451018b4affda5a389e64ad15f44d7","src/zlib/contrib/vstudio/vc12=
/zlibvc.sln":"162e0faa80a56d89eea71a0b89377708eec2faa0dc72091cc0abb07fbdea4=
9a0","src/zlib/contrib/vstudio/vc12/zlibvc.vcxproj":"754671c59d8996a846241a=
f76082cc8be1aa5fc079eff530d91a9ab15a0bee5b","src/zlib/contrib/vstudio/vc14/=
miniunz.vcxproj":"0312511d4a30cea979c4e36edf994a537ed8a9d924f6b5c536cbcd094=
773c11f","src/zlib/contrib/vstudio/vc14/minizip.vcxproj":"9e7bb7a6ac723e4b2=
db900627c366f9bb93a351381995d9c69a50c0126f64233","src/zlib/contrib/vstudio/=
vc14/testzlib.vcxproj":"c3a9369670af4ebea13d036b452be7418591fbb4c03a675699f=
acac5d8dff5d0","src/zlib/contrib/vstudio/vc14/testzlibdll.vcxproj":"69f5448=
98b4275cd3d8e19b8f1f8cb39c1cb98a30cdb033242e4b94c57bfa150","src/zlib/contri=
b/vstudio/vc14/zlib.rc":"92d5d3a4938a6350395934153416a7eb74353cdfb2321f45b9=
ee0b9b16257f39","src/zlib/contrib/vstudio/vc14/zlibstat.vcxproj":"9c7c096b4=
7e7875412c98525efcd16db62e094215f0011b9cd739a33ab35d48c","src/zlib/contrib/=
vstudio/vc14/zlibvc.def":"0124fea28bfee49c8a19dad0ed5a49277d451018b4affda5a=
389e64ad15f44d7","src/zlib/contrib/vstudio/vc14/zlibvc.sln":"47a50bbde8ca63=
36cecd8c0e4b65e515fc46ae84c7b61008ac9864162f777286","src/zlib/contrib/vstud=
io/vc14/zlibvc.vcxproj":"71fb6ef3b079bfdf4182af17e74c3361ead757467edfc591d9=
cbe303ccc47b52","src/zlib/contrib/vstudio/vc9/miniunz.vcproj":"b2b53bd9e704=
bfbe769b863acdc2a3368692ca149c4b4ed2a0761b0cd16c6726","src/zlib/contrib/vst=
udio/vc9/minizip.vcproj":"80a701fb41a61871ce1d25f6b03e571edb6c3abf0aa453755=
54b6fac52115eb6","src/zlib/contrib/vstudio/vc9/testzlib.vcproj":"05fc5a8768=
2b17690d199f424f57f6ad7767b8dabb29a1039bfcb88bca1b302f","src/zlib/contrib/v=
studio/vc9/testzlibdll.vcproj":"25c1cc5319f1c4b7dbdb595c3cfd6ec3ba217818b03=
b7055ef5ef440b575a43d","src/zlib/contrib/vstudio/vc9/zlib.rc":"e8b581eb1693=
0e0213d37143a5f17868839b22c758b23981a29484e17093c494","src/zlib/contrib/vst=
udio/vc9/zlibstat.vcproj":"e8653eea37f3bef097eec2caa55e1f698c3c74c959689bc4=
e97568e88d2bbc60","src/zlib/contrib/vstudio/vc9/zlibvc.def":"0124fea28bfee4=
9c8a19dad0ed5a49277d451018b4affda5a389e64ad15f44d7","src/zlib/contrib/vstud=
io/vc9/zlibvc.sln":"26e58d4b2cfcd941c367fb2a18537b3b9f002f2ac1278b700ea1129=
c50501452","src/zlib/contrib/vstudio/vc9/zlibvc.vcproj":"86aa6e33db104c0a0e=
d4a9f21f0db8572cc7755170217aef18219fdd74b75e9d","src/zlib/crc32.c":"a04af27=
3e83ecc351bf3794974ab2098d8d960df4044b7b44734c41443ee26d0","src/zlib/crc32.=
h":"407af59d0abfea84a6507c603eb29809411797f98249614fe76a661def783ce1","src/=
zlib/deflate.c":"11fd6b0328b65c4ad4b5c204d892a97a9083628a7e77dc47836c8e0c79=
9f8da0","src/zlib/deflate.h":"0ca7fb0cf1dd63001c6e9e4ff93c8dbff2fe521199be5=
1a4dda38a11b44919f6","src/zlib/doc/algorithm.txt":"992590931e982c0765286c2d=
83f6e9ff0a95aabb08e28c30c52bae3e8c4bd5ad","src/zlib/doc/rfc1950.txt":"8f047=
5a5c984657bf26277f73df9456c9b97f175084f0c1748f1eb1f0b9b10b9","src/zlib/doc/=
rfc1951.txt":"5ebf4b5b7fe1c3a0c0ab9aa3ac8c0f3853a7dc484905e76e03b0b0f301350=
009","src/zlib/doc/rfc1952.txt":"164ef0897b4cbec63abf1b57f069f3599bd0fb7c72=
c2a4dee21bd7e03ec9af67","src/zlib/doc/txtvsbin.txt":"47c273bb22c9773248d380=
549a330e5c262266b1292154b0d3014f731cc73f47","src/zlib/examples/README.examp=
les":"402d72eb69c2e03a25034f4b3c02b110f0f67149ecfa4fa0e4b2bf0ceb49a8b3","sr=
c/zlib/examples/enough.c":"704e273f65b62c5d2eb06d5bb10c4ccffba56544aa477f0e=
3957e2296c501b78","src/zlib/examples/fitblk.c":"950769163c41aff897ee41746a8=
685d9aa41073b1307f42da19dabe9d3fc8b85","src/zlib/examples/gun.c":"d60ca6eb0=
a3e62ee7fb4a1ab69e8d1525ff06b06ce46889cbdfc13fb8f7534c2","src/zlib/examples=
/gzappend.c":"4182d38bf97ffbdf1110df7f65c0e8fab0b28b1ea36ebba8621c14e8e76f1=
caa","src/zlib/examples/gzjoin.c":"90b9d6c39a5fc91cf1cc9b96b025a508a8015dc5=
02cd9374c754b44078593f57","src/zlib/examples/gzlog.c":"433d34b71b4e769ece1c=
ceb8bd7d902d2c0a24ccd7550ab1856a5ba87f84f835","src/zlib/examples/gzlog.h":"=
309556e2d7d39250924946b78e2cce0ac927857d6e1a02cab64e438f533c20c3","src/zlib=
/examples/zlib_how.html":"80fb647be8450bd7a07d8495244e1f061dfbdbdb53172ca24=
e7ffff8ace9c72f","src/zlib/examples/zpipe.c":"68140a82582ede938159630bca0fb=
13a93b4bf1cb2e85b08943c26242cf8f3a6","src/zlib/examples/zran.c":"840ebeb058=
cd0ca9e92dcb1db665932462a4695fc649b34e865b8d1ad7c5bf77","src/zlib/gzclose.c=
":"94446cf8cde67c30e64d0a335b0c941fd3fbad2e77f30180d12e61f9c2a5a6b8","src/z=
lib/gzguts.h":"1ef4741cf10441feeca5c8dde2b6c754f0cbd96fcae697d54a604757289a=
5e9b","src/zlib/gzlib.c":"5daf11e44149e0aba2956d35f73f04f35dca99c3dfa43f5ad=
43ec20b336e4a1b","src/zlib/gzread.c":"6f928512cb1792cfeab31a51ff0b211814d2e=
455bc75290eb31079dc1e5ad2ec","src/zlib/gzwrite.c":"ba3b7b7ad2ff7ef0c19319b8=
408c333491a4cd495da55d0b156bc73d9ddb4df4","src/zlib/infback.c":"abe44873b5a=
f2ea68ea1d281d915b2800f1832f846d2c05442a4711adbe6f269","src/zlib/inffast.c"=
:"4d496ab2a3d29df5fadc3dbff6067e039806aaceae6cfcd09ea77d46c2b848fd","src/zl=
ib/inffast.h":"7d8c1c873ce9bc346ad6005bb9d75cce5c6352aaf7395385be216a9452a3=
4908","src/zlib/inffixed.h":"237ba710f090e432b62ebf963bee8b302867e9691406b2=
d3f8ee89ee7bfef9b0","src/zlib/inflate.c":"8b6c599c3563c14c447c47db0d7dc9a16=
e8c246a078ec95a169ddcebaaebd811","src/zlib/inflate.h":"8ec9ac297790276f7e46=
a961d4c6f9f944fb1dec92401339ec2666973cc5983c","src/zlib/inftrees.c":"1960ca=
67384376f65b6ce8c08fdb501f8eb33923e11ef5f61a855708c6cb0a8a","src/zlib/inftr=
ees.h":"c510b36402784b1f898be3b049b923469aa92701de2d9195aed19f6b65c0dce2","=
src/zlib/make_vms.com":"3064eb153a7684115f1494364f80759bc5a2c227799fdf08df7=
b9e6e50884720","src/zlib/msdos/Makefile.bor":"292ab363f7ffbc4ae84d37cd9bdff=
d2dac1003bee52d223a8489844870f20702","src/zlib/msdos/Makefile.dj2":"9208450=
c2ae6dcbfcc25560b5b9ca763f461e7246e37b0552474edf8fa898906","src/zlib/msdos/=
Makefile.emx":"c749d6ec7f88e8e639d4f03bdbdcbbe9d1c304210be4c4be621ceb22961d=
3d64","src/zlib/msdos/Makefile.msc":"0e021a6f42212415b060e4ad468eb415d0a8c1=
f343137fb9dff2cb8f9ead3027","src/zlib/msdos/Makefile.tc":"2ae12ee2a3e62f7c5=
a0520d0fbe4adee772bc07fe816002b07ccb43db3daa76a","src/zlib/nintendods/Makef=
ile":"ea5823efe6830132294eddf2f56dbd7db8712244c210bb4968c431b1a91bd066","sr=
c/zlib/nintendods/README":"e362426c47b39ff6a7d6c75c6660b20abf076cdfa5e1e421=
716dc629a71aef95","src/zlib/old/Makefile.emx":"d811f032272aae50123a889297af=
3a02fbd60d1e42bbef11466462f627ff7b5b","src/zlib/old/Makefile.riscos":"d1a48=
8b160fbfd53272b68a913283a4be08ba9d490796b196dddb2ba535b41e0","src/zlib/old/=
README":"551a0f4d91fe0f827a31cbdfbb4a71d1f3dc4d06564d80a3f526b749dd104d11",=
"src/zlib/old/descrip.mms":"8ff08c35c056df9c986f23c09cf8936db63ccf12c3c42f7=
d18a48b36f060cff7","src/zlib/old/os2/Makefile.os2":"6ad247c00f00ff42fd2d625=
55e86251cef06e4079378241b5f320c227507d51d","src/zlib/old/os2/zlib.def":"ea9=
c61876d2e20b67ef2d9495991a32798eb40d13ede95859a2f4f03b65b9b61","src/zlib/ol=
d/visual-basic.txt":"1727650acbde9a9e6aec9438896377e46a12699cca5d46c5399cef=
524dedc614","src/zlib/os400/README400":"6f95a1beb0fbf943a3312eaa3dd2c279f1c=
ef93062bebbff63dd37ac9e2aa8d6","src/zlib/os400/bndsrc":"cfe00b1528d5c27813c=
d6b1ad7aa34b493fd63d615623fb21fd1a7bf99d2255e","src/zlib/os400/make.sh":"14=
3394d1e3876c61c29078c0e47310e726e1f5bd42739fe92df9ece65711655f","src/zlib/o=
s400/zlib.inc":"c501c522185ba1f0506caf90d72f1088b34b2addc169471e949e443ab65=
e8a75","src/zlib/qnx/package.qpg":"90b5c8364d9dc5ef67405b352c19710ebad2905f=
3f20b9e56ded74661f96743b","src/zlib/test/example.c":"520799662a8286725540d6=
d5a356efe6f595618e5fe2e591972491d719bd99aa","src/zlib/test/infcover.c":"f65=
4f3fcc74b33bd95cda63d13fe0ce589bcfe965544e0c17ee597d75efbd090","src/zlib/te=
st/minigzip.c":"91089b21e692797bb6208b2b45eeb90f5f1f1e4f6b67b99dea5676f51b8=
11193","src/zlib/treebuild.xml":"d816c764c8ec2d5b2ebfa7f053f747097926c13fce=
7fa8628c5d14c991411421","src/zlib/trees.c":"f2a5f949ea70dde7c23a54c793aeed6=
30a03df4bb72417cd3aa008000c44699b","src/zlib/trees.h":"bb0a9d3ca88ee00c81ad=
b7c636e73b97085f6ef1b52d6d58edbe2b6dc3adeb4d","src/zlib/uncompr.c":"31922aa=
982ee12fd28d1ce5fe6a94a3f07c2a941c821b566a881ca21845cdfaf","src/zlib/watcom=
/watcom_f.mak":"7e039b912f9cffaa40835281430bb284fa9042b0a0d12f6b34700a06bca=
6576e","src/zlib/watcom/watcom_l.mak":"d11b4064604a034725860e63e3f6d3470563=
72e4b1675b183e20a93533b20cc9","src/zlib/win32/DLL_FAQ.txt":"9e00778319381e6=
275691dd3a89410c99065b8c0c5db96473abe8c859cbdefd8","src/zlib/win32/Makefile=
.bor":"e878fed2313417db085fea621c110889f6a32233b5b6db46e3c4e824c1d0ed6b","s=
rc/zlib/win32/Makefile.gcc":"ea8feddce7b9707253b9bf86623cf7ebe5294d7aea2b3b=
0b1b1c1b8cfd73009d","src/zlib/win32/Makefile.msc":"7c495d63c5afea1d77d162a4=
1b73bab89cee952c12e4647e9684a7ac79bfc3f5","src/zlib/win32/README-WIN32.txt"=
:"b71f1f4e4760812c3a11b2bae6f40d1066741a90e6646010a32ce50a0e348cde","src/zl=
ib/win32/VisualC.txt":"9ec0babd46eaa012371dee2d3a8a55d9c7130f7895512c3371c7=
37e4a7f6a997","src/zlib/win32/zlib.def":"24fa6dd00f3f4c0d14507a03ddbfa42707=
a04e3901bb9ff6f90096037a75185a","src/zlib/win32/zlib1.rc":"8fc5f2b5abee40ad=
66e6d6cfc9f926c2f446e13a7c9ee7df8bf58a266d8cade5","src/zlib/zconf.h":"9c008=
7f31cd45fe4bfa0ca79b51df2c69d67c44f2fbb2223d7cf9ab8d971c360","src/zlib/zcon=
f.h.cmakein":"d740b750e9c98e6a4b4529cc2a857a3fa8001514b1ce91e0e1d9d293652bf=
388","src/zlib/zconf.h.in":"9c0087f31cd45fe4bfa0ca79b51df2c69d67c44f2fbb222=
3d7cf9ab8d971c360","src/zlib/zlib.3":"5abef003e545566e5599e5ab2e7528e978be5=
9d54546b19d763d062f7a69bac7","src/zlib/zlib.3.pdf":"7f0f633641d782e360eff9f=
e831716c5767faf1000e38382a8a8c65b0b67f374","src/zlib/zlib.h":"4ddc82b4af931=
ab55f44d977bde81bfbc4151b5dcdccc03142831a301b5ec3c8","src/zlib/zlib.map":"7=
eb1070ba6bf12e6895e5da06b84a92af683827587afaa72bdd45e80b9d8e4e9","src/zlib/=
zlib.pc.cmakein":"2f1d0b18ce37c2af415a469857f02aee2c41a58877aff21d29e9c6db3=
2b55cb7","src/zlib/zlib.pc.in":"04c01cc2e1a0ed123518b5855f585c93a24526dd889=
82c414111ea1fc9f07997","src/zlib/zlib2ansi":"d316e3e79054f5f9fe921d35f4bbf4=
bf0a37b859d29d2b34ae4d7d92afc3e55c","src/zlib/zutil.c":"f7fdc9ef326a2683eb3=
3c794face54e83c751ec17f3d1ba581847a62af36ddcd","src/zlib/zutil.h":"9a63f669=
0fac1620aa3cecee5752af618806da438a256b4a047fbcd289cac159"},"package":"97027=
61c3935f8cc2f101793272e202c72b99da8f4224a19ddcf1279a6450bbf"}
> \ No newline at end of file
> -+{"files":{"Cargo.toml":"ce67ce7c1f3c4ad7832d58ed198b8dd745abacc620738d5=
75c4b1a9ac9e79449","LICENSE-APACHE":"a60eea817514531668d7e00765731449fe14d0=
59d3249e0bc93b36de45f759f2","LICENSE-MIT":"34c467b6945a22696d060b8fdd2379d4=
64acb3408d4c599d3dc5fe4fa1b4c84f","README.md":"b23e18bdce29fabc3d34e8857621=
9f50d1d735a355e427e6d6ebc09254138070","build.rs":"e034f7828ff43a0bb0f7b690e=
8e99b09b8f4e1ae0560b6fb4008006e9cd4d9dd","ci/Dockerfile":"4d479ea63b9e384b3=
864fa1204894bfae4890017d6bf03486274457fe2c26cf8","ci/run-docker.sh":"0ea7a4=
fdc9f6026110e20fa2e25dbadfc1e6dafed9ded5981ae36772ad207e26","ci/set_rust_ve=
rsion.bash":"4284f86ac3923a73dd79e89bef2d0b136c6d104d6dae92e24b4a96eaffa288=
90","ci/test.bash":"73a936768549eedf96a7cddb350ada128e058d5d9004244ebf3d993=
363b69599","src/lib.rs":"40476f4e896c936c21f908396255c7a4951ef8bf93788858ad=
e6cace2539927b","src/smoke.c":"10607c81b73811bfcb9718767312bf97ba2ccf7048ea=
2f18a2085aa06ad7f91b","src/zlib-ng/CMakeLists.txt":"60b836817b51e5893b1e320=
3adaf57a98678af17957eccaef679bd96bcf5d90b","src/zlib-ng/FAQ.zlib":"d1777aa0=
57caeef50fc291aac7a414363b2186bb3d65bb0f8bfa2bfd61cf0ad5","src/zlib-ng/INDE=
X.md":"989545e90d8e9ac149034f762ce78ed8976ebf9324326228dea37ca190154609","s=
rc/zlib-ng/LICENSE.md":"d3c80be055d94d798eaa786116e84fa0b010bc11420b5d2060d=
978ea77845436","src/zlib-ng/Makefile.in":"15027511a77e76b423eccf10ebfe66398=
ea96862cbce2415e5ebac7c7cbb6ab6","src/zlib-ng/PORTING.md":"5cff8c878c7958f6=
a4bada5a403dcc88961c9607826faece1aef202b5d95c550","src/zlib-ng/README.md":"=
9cac4a98ecf45f50adf5030d4dc58b3cf9f3ae8e3ec78d30fdae4a99a2b4b8d9","src/zlib=
-ng/adler32.c":"82ffa1b4fc4b198ba8004135f79b8819d9f2b28e851c30c0ab41e6d32df=
bf70d","src/zlib-ng/adler32_p.h":"f56915c59a345baf4558374447385a317e29365a4=
db2fbb38af4de3e1a1a0201","src/zlib-ng/arch/arm/Makefile.in":"95464884ba75a7=
b12c9ceda5845d8d68d5a7d7dac8a8dc24b27beb2192e5b97b","src/zlib-ng/arch/arm/a=
dler32_neon.c":"3990b8d5570b12c2162218fe0e9bc723a03f1c89b5ed3ba70a74a989762=
60ee7","src/zlib-ng/arch/arm/arm.h":"855adbb02d7b9a5714a17d9dcff493610e7cd2=
b9a1f4e58e1c99626ab536e868","src/zlib-ng/arch/arm/armfeature.c":"dd09ad2712=
b037e8d52173402f39cc2be1bc89d47fc10259ef81b4c64aef7110","src/zlib-ng/arch/a=
rm/chunkset_neon.c":"65b70014888e9fbdb89bfbfa52f23b8953dc015466577da292d478=
0b55c5d95a","src/zlib-ng/arch/arm/crc32_acle.c":"5a96afc594697d1399870d1bfb=
0623a03869eff42caae74013f147cec4aa982e","src/zlib-ng/arch/arm/ctzl.h":"feb7=
0d55e66025fff806e30e48002b35cfff79533d352585cfa5f118edbc90b1","src/zlib-ng/=
arch/arm/insert_string_acle.c":"d1b1dae5aeada70f2b03c2cbf3112ce55a92401c2d8=
7709081b04dcf5992e1ad","src/zlib-ng/arch/arm/slide_neon.c":"19d8cf5c742ac6b=
82164c7a183538ad1129f9f17e9b8bce8b40daac3820fb6c4","src/zlib-ng/arch/generi=
c/Makefile.in":"f41a34839986eac8dd52cf91fada0efff4171c059ab5d7db6347c91bd6d=
9db09","src/zlib-ng/arch/power/Makefile.in":"69644d1a0ff8e7f38005c0a55cdbaf=
3f0d87f42abf8fc4f4136271c4fedfb846","src/zlib-ng/arch/power/adler32_power8.=
c":"79b75e98ad3a62facbbdd8c0b178d3f993b57f6e34d320bf47eca33aa8c330a1","src/=
zlib-ng/arch/power/power.c":"0647afb3b3b7ce2a19b4815ec8fdeee0b37c759413e5ef=
0a668a2dba22d94803","src/zlib-ng/arch/power/power.h":"f3f15f94fed98a2f7dd5d=
4568c5172e597228be4141d6895062703c3f70024da","src/zlib-ng/arch/power/slide_=
hash_power8.c":"932ea533d25e2f5478afe0c47830e7ef24276cad0d75fd91f2d8c799bd4=
b5d36","src/zlib-ng/arch/s390/Makefile.in":"eef6c3169723f089b0b5f852423ec55=
bf0364caeddd7cda991f2e76bc1682107","src/zlib-ng/arch/s390/README.md":"4f501=
8cb7c8ee217710a90193088889a15f1675d205a104140f6a1ac07ce412c","src/zlib-ng/a=
rch/s390/dfltcc_common.c":"6771ec4457da9f4b00c74bcc0828735e21c74b9162cb3738=
3c297c3b5028cddf","src/zlib-ng/arch/s390/dfltcc_common.h":"ed339007feae58d1=
879e096addb30ed86cd5cf11222db22c45f48b47328cf6db","src/zlib-ng/arch/s390/df=
ltcc_deflate.c":"7b3dec7be4055c7748defc626dc91db99787c9f3b70b7d7b40282558bb=
b478e9","src/zlib-ng/arch/s390/dfltcc_deflate.h":"c4c411f221cc0f6b218326e97=
3fef05c65840ba49878aff052dac0bb38121cbd","src/zlib-ng/arch/s390/dfltcc_deta=
il.h":"01dbdfaf5e8ccf522663b4daa76e9138dde514292c35a623be4bcbbf4b82dea2","s=
rc/zlib-ng/arch/s390/dfltcc_inflate.c":"a96226eba3538d3904893cfe1b08395668e=
6a722b56f28d5b5debb3176161b4b","src/zlib-ng/arch/s390/dfltcc_inflate.h":"d7=
a4a5ae79abd1a5456521926b918becfe86c253a4fc23723fbc09f7c3303128","src/zlib-n=
g/arch/x86/INDEX.md":"c12f9bf0d66743a6472fb756bf46def8eea1dd235be7fca994dcb=
22f693a3524","src/zlib-ng/arch/x86/Makefile.in":"9f6fe7567a99e81aaa3bef8ccf=
a1ad40f524efc285cf8dfe0f497a1530f8016c","src/zlib-ng/arch/x86/adler32_avx.c=
":"99056732c7bd5d53dc108f282811a40bf21570926781af5dc7b17cb9218963de","src/z=
lib-ng/arch/x86/adler32_ssse3.c":"883a5520b4481225d097c90c5359106a3c8eb7b92=
1499c94276e999b7c39adc5","src/zlib-ng/arch/x86/chunkset_avx.c":"15060e7ee48=
7fb1daef9be25343ae387392276933921e4b4db0c67831dc0854f","src/zlib-ng/arch/x8=
6/chunkset_sse.c":"f7ccb55b67101ddb9def951a6d6f9dd4cb108fdd9e65f0f21d82723d=
1b093a22","src/zlib-ng/arch/x86/compare258_avx.c":"8b2838d168de4608327f25fe=
52d53763a82413ee911d87947d3fcd72c7f9bf26","src/zlib-ng/arch/x86/compare258_=
sse.c":"b5049722ffd4a43a96868eeba5e000271cfc5fcbf3c2657026ead15b1df28a10","=
src/zlib-ng/arch/x86/crc_folding.c":"75199cdd06ec2f8f43bf38583b2c4d98bbbbd9=
24e659267fdc1fa5134f1472eb","src/zlib-ng/arch/x86/crc_folding.h":"939212546=
611917e9e066e8ed30cdda95680ec1f5fe0890cc4865b4e6d7fc215","src/zlib-ng/arch/=
x86/insert_string_sse.c":"9e84a75b6a565422eb105261b6729d2a02b89133bd14372c9=
49d5381b5deed3e","src/zlib-ng/arch/x86/slide_avx.c":"5e448e439ac24e7cb10eee=
176ca37f2c63f73c135c0a2af040e232bad490997d","src/zlib-ng/arch/x86/slide_sse=
.c":"1946cabb634c905fddef0a22b2fad19dfd99110169567c3beceef71145b2e316","src=
/zlib-ng/arch/x86/x86.c":"1af56e27b2e951e1ad1344e62c2f7a8c49a776fcdd1cb0f4e=
a9d6152118a479e","src/zlib-ng/arch/x86/x86.h":"4d2d20ea0087089141e250e77bb3=
d419954b9092810028b151581b9115a5fe8c","src/zlib-ng/chunkset.c":"c0dbc7abbda=
d5137a9efb2b0a76a212e77d4bf44beebe721c68359fa83002ff2","src/zlib-ng/chunkse=
t_tpl.h":"35d15e97bd72d4e03dcec3ee804a08ea6a74faac2ef835caecc0e38bc9daf0c0"=
,"src/zlib-ng/cmake/detect-arch.c":"a9509327c2f4395955466b0acce453c29592d46=
86022714cb9e8b411d7e60c29","src/zlib-ng/cmake/detect-arch.cmake":"9cbb09b29=
7f79e94b55fffb9acbafbee8d6761e854d818f1a0c686e3fcddf574","src/zlib-ng/cmake=
/detect-coverage.cmake":"e4e372991ba80a16ad47df2716708a56013cc628aa7ed01573=
a2360c60610125","src/zlib-ng/cmake/detect-install-dirs.cmake":"87031a40428a=
104f5cf38ecdb8a5028d8c679cfa772a58adde8380c809b34eff","src/zlib-ng/cmake/de=
tect-sanitizer.cmake":"5e6fe6d2d877540811313f0c8e9884adb21a9ace2e24f23190f0=
fac1d52dd2b8","src/zlib-ng/cmake/run-and-compare.cmake":"dc45eeb6d3e4854049=
834ec1ec2891342646c7fb803a0b6c2644d6316f89b668","src/zlib-ng/cmake/run-and-=
redirect.cmake":"2de9c784da3e04331465a3c56125b9c7d8e74b898b4cf85353aca196f9=
0ea9bb","src/zlib-ng/cmake/test-compress.cmake":"3f37319963a80a31f752fca1c8=
2571d552fd4701326bc40fdb02b54ec3f7a3f0","src/zlib-ng/cmake/test-tools.cmake=
":"4dcf099245085ee2b6d8ec41620bca3f7b718365dbb9bb0ad23931e83bf36aeb","src/z=
lib-ng/cmake/toolchain-aarch64.cmake":"8d7ba07ee1cb9fbc7817da1c5e74ce6c85ff=
81c10962a33941f0e24471956e59","src/zlib-ng/cmake/toolchain-arm.cmake":"0b0a=
b2b1093ef851c3dbd6fe53f855628df0778841a488aaef85d2c70f04a257","src/zlib-ng/=
cmake/toolchain-mingw-i686.cmake":"6551576324fed6ccedffcfe8da762402dc863c20=
a2789a9b0030b9d32e15a15f","src/zlib-ng/cmake/toolchain-mingw-x86_64.cmake":=
"ec7bf5c8640fb61d2e30f8db7b588ca9b66da92d4a59e88ce16c5fc7f9ce02b6","src/zli=
b-ng/cmake/toolchain-powerpc.cmake":"6373abe883a99616aa51422a9b714894dc5212=
11be49502463576f58d3d26b2a","src/zlib-ng/cmake/toolchain-powerpc64.cmake":"=
328d1ea039a30e03ee9a552858b9f180b3da2614b712f618da1a0fa98f30a53b","src/zlib=
-ng/cmake/toolchain-powerpc64le.cmake":"ec90270bd1f4aa649abddddd2618168d399=
d58a1c1c35b3d8d909e570eb9be1c","src/zlib-ng/cmake/toolchain-s390x.cmake":"c=
b634252c21c4f55d06cdc49ce522a5546aae592daa0f12aa4282c0aef323828","src/zlib-=
ng/cmake/toolchain-sparc64.cmake":"d70d39760a23886ebd1c5a1a87651bfb47a9b24d=
ef9e7955ee1cbec60b40925b","src/zlib-ng/compare258.c":"56bfd48d5ff9ca422fbb7=
28df7a373436c73796561dff118c7d4039fe70d29e2","src/zlib-ng/compress.c":"1abf=
5b13e3e805becc14f4f16dad9bf816f4fe41754b1abf75f670dcc84567cc","src/zlib-ng/=
configure":"681d5b1303aab0523334c90ff049757e7ee6b2683f2411204b7245ba4adca4b=
2","src/zlib-ng/crc32.c":"98440be8a99381151a2d740f2e2228e8c1b23b9193c3642c5=
2a4e34799506336","src/zlib-ng/crc32_comb.c":"78cd1a3d31963bfa5bd9d476250b2b=
b7777b12b6ebe0475acf021ca794757165","src/zlib-ng/crc32_comb_tbl.h":"d6615d2=
09d6c7d5248c6f7fe4e5dbded13c0eb87997b37693032c2902927407d","src/zlib-ng/crc=
32_p.h":"1fa91375a18e090c0a0dfda39de3df36346a0b1be36c808be6b6c29c32eba922",=
"src/zlib-ng/crc32_tbl.h":"d629378ba38ff5775095b64e277bcd41c4b89fab9b5647a9=
fb29e15da0db0161","src/zlib-ng/deflate.c":"1a5ff34bf68b88e30f578ce7b15dd996=
c05fed7bf42f58f4616af470ee18f103","src/zlib-ng/deflate.h":"a074e9a5dd5d689d=
b63655251d6a0948e7a7c0c4a4f6d0ca60bfe18291f3c34f","src/zlib-ng/deflate_fast=
.c":"b3b261b3a02b089599fcd9448965ef5d8e8b0e8e9556857357c9632930c7c748","src=
/zlib-ng/deflate_medium.c":"1c3d95cbac76052d39595ea750c5536541c18302b9abb39=
8c27b58955318bba8","src/zlib-ng/deflate_p.h":"95026b1b48aa78204381b32617dd4=
4e8c820c9bb21b415ebfcb33e6b5255233e","src/zlib-ng/deflate_quick.c":"280905a=
191d2b2a7274f2453ac537e01a0fb6e7540a0b212c1514bfb8c9415ea","src/zlib-ng/def=
late_slow.c":"a2c66723e1e71ffd6ff856407459ab311a4c6546ecf50285081fc7afcd0cc=
d2e","src/zlib-ng/doc/algorithm.txt":"992590931e982c0765286c2d83f6e9ff0a95a=
abb08e28c30c52bae3e8c4bd5ad","src/zlib-ng/doc/rfc1950.txt":"8f0475a5c984657=
bf26277f73df9456c9b97f175084f0c1748f1eb1f0b9b10b9","src/zlib-ng/doc/rfc1951=
.txt":"5ebf4b5b7fe1c3a0c0ab9aa3ac8c0f3853a7dc484905e76e03b0b0f301350009","s=
rc/zlib-ng/doc/rfc1952.txt":"164ef0897b4cbec63abf1b57f069f3599bd0fb7c72c2a4=
dee21bd7e03ec9af67","src/zlib-ng/doc/txtvsbin.txt":"47c273bb22c9773248d3805=
49a330e5c262266b1292154b0d3014f731cc73f47","src/zlib-ng/fallback_builtins.h=
":"f07e83c5c444554577c4240ff7722057ea2a689f6baa0f9e8bda32b9a46888ca","src/z=
lib-ng/functable.c":"d3747a4674ddbc903ab1d06efe63a1c4b52bf42f7dd38cde3701fa=
82b1d953f0","src/zlib-ng/functable.h":"e5a2d0c10411d23f04295bcb9ddb98893889=
74b723caef65aa5c4ea4739f4aa7","src/zlib-ng/gzguts.h":"cbf2afc8a6183002254a7=
3cabe8376e54b1aea2ba042e36138f292c9cdb95d5c","src/zlib-ng/gzlib.c":"5b5bea4=
f319e5d0a96b92aa431fb33926686cd20686c90d75e42e1481872bbcf","src/zlib-ng/gzr=
ead.c":"fc4a187ba45ceb7b4b50f4f8dedc7685fe8687e6f034638a6437bebf71d51a13","=
src/zlib-ng/gzwrite.c":"7c86058ae23f856c099e2663a5676c97cfa4fb5df9b92893c94=
076ba4aa9a56b","src/zlib-ng/infback.c":"97a35de1a3d3bec50e112853e03bf1628cb=
ed3b0fb84459cc423e3f9f61fbea7","src/zlib-ng/inffast.c":"701519ee11d39cdf4e8=
08395722415c42ff2be9445f66408fd879370f3242b57","src/zlib-ng/inffast.h":"42e=
74a92b496ab0726be317e8497a12bf3c3cf3d0d533440ce65befd3929c71c","src/zlib-ng=
/inffixed_tbl.h":"a94225335396245e9f0ccb2e9b4b334fe7ee0111ed8e32a26bcd52187=
f364314","src/zlib-ng/inflate.c":"a665bf717ee257a16a8ab993241f2cf9e71d49882=
addddb9518b88186f82a5cf","src/zlib-ng/inflate.h":"eb25527d1bdedaa45167926dc=
e4c39d9aaa3147b0f4a95f38f5916528c30a09b","src/zlib-ng/inflate_p.h":"4a94c51=
194da119770cf662ef289994f0c78d95184d54d6ae5d50a393e8f5a62","src/zlib-ng/inf=
trees.c":"d1d88f98f9129c87f3ce1d6de5bea3ec867de23b1b2bdd585257d231aac82a4f"=
,"src/zlib-ng/inftrees.h":"624c6653a454447c6274adf922430a19c96ef73c7687e455=
9d247ff48970bab5","src/zlib-ng/insert_string.c":"aa22ba53a1e75821499809277f=
9ca0e5ef92b07a618136dd11ae1734e233b7c9","src/zlib-ng/insert_string_tpl.h":"=
1ceba9903324d10aad6e1d83653c4d534a5b06fd09076414a06215482be00bac","src/zlib=
-ng/match_tpl.h":"eeab4c6eea8511a7579738e622af062ad16f4016312e93ad34bc5903d=
8b3c4a1","src/zlib-ng/test/CVE-2002-0059/test.gz":"60bf96b8f433bd7e057ce349=
6aceaccd70ec80f596a4aa8bcc7786056705ce66","src/zlib-ng/test/CVE-2003-0107.c=
":"1bfbc88dc501cd92b8b26bd8944af6b150b376ebfe7241d90e2b93109be3d68c","src/z=
lib-ng/test/CVE-2004-0797/test.gz":"38caae524705f676bde13a8df9fc8c7d2fe105b=
a6bdbab62a405b0276fd3aa2e","src/zlib-ng/test/CVE-2005-1849/test.gz":"e4d5a6=
0617df4b5dd44eda94751ce1eacdb325792bba6e3cc4676719a3adf742","src/zlib-ng/te=
st/CVE-2005-2096/test.gz":"8f702d4861aa3ec98ac03a59ff26b430939630cb5cd4266d=
2658d3b836d576f9","src/zlib-ng/test/GH-361/test.txt":"358497d0a7251ea42101d=
c77b02337f46fd89af09643a8288e2a3082e5d24128","src/zlib-ng/test/GH-364/test.=
bin":"af5570f5a1810b7af78caf4bc70a660f0df51e42baf91d4de5b2328de0e83dfc","sr=
c/zlib-ng/test/GH-382/defneg3.dat":"b22bef6b7392401c9e7b079402c4a4074053d7a=
914d050400e37fd7af6fe26d5","src/zlib-ng/test/GH-751/test.txt":"b83d833803b7=
bc3124fb2a0034081f0b999ad10c33a8dfa3bfd181dc078ae3ee","src/zlib-ng/test/Mak=
efile.in":"c3b6a1ec62838c140a78bc361448d5739756bbfa3bbbf1ffa64c342599949701=
","src/zlib-ng/test/README.md":"fc485cfaaede6b3d3dc61fdd17cc7eee715c35d6f62=
e6e502f9251fd1b5edac9","src/zlib-ng/test/abi/ignore":"02aa87f77656dbc1fbddd=
23f436cd15465a92df0722da4055cae1bc8bf013097","src/zlib-ng/test/abi/zlib-v1.=
2.11-arm-linux-gnueabihf.abi":"f5e91f25b558a891fecbeb6e2e9575698630ab700d05=
5a38f3bc4fe66257f513","src/zlib-ng/test/abi/zlib-v1.2.11-x86_64-linux-gnu.a=
bi":"038337383cf780587d810cf5400d632f3a1f8517e63ac4a71b6e5224db8b1413","src=
/zlib-ng/test/abicheck.md":"fa5d6d33ff0fd95eefb7c6c0c7f67351282e6eda20c4e38=
842235a610cc10382","src/zlib-ng/test/abicheck.sh":"b23ee3678acb24caf36fc840=
2a07452de73c50640ebe641f185c7f9d5ea257e7","src/zlib-ng/test/adler32_test.c"=
:"db3e8ad9a4e2ecce0c052b0bfe19834d3ff2fb2e9239cc3438a2c95db00b1d21","src/zl=
ib-ng/test/data/fireworks.jpg":"93b986ce7d7e361f0d3840f9d531b5f40fb6ca8c14d=
6d74364150e255f126512","src/zlib-ng/test/data/lcet10.txt":"938e69e61b3411d8=
a9e2e630f4265000d810f3dbf66bac58cac19493753526ec","src/zlib-ng/test/data/pa=
per-100k.pdf":"60f73a051b7ca35bfec44734b2eed7736cb5c0b7f728beb7b97ade6c5e44=
849b","src/zlib-ng/test/deflate_quick_bi_valid.c":"0e00da0e048c46204c39aff4=
b8fb79890274d3c6183a9409aefd5c93e4e92a48","src/zlib-ng/test/deflate_quick_b=
lock_open.c":"455bd347bb88debdfacb409846170274991ec9ba71c52b8fd0e526daf5726=
5eb","src/zlib-ng/test/example.c":"8bfad1221a8df5b6202e11f6be4bae5dbccd8a24=
fb7bbd8dd88e7ecd318907e7","src/zlib-ng/test/fuzz/checksum_fuzzer.c":"3a1547=
9f2cb40b6c5760dadb246328fab7315f3e3b8e28c1bc246c9b9a867c69","src/zlib-ng/te=
st/fuzz/compress_fuzzer.c":"1ab70608075c4bc60f89aa2f327cff88362ee7b1d31da88=
ed54ca51e5f99e5c9","src/zlib-ng/test/fuzz/example_dict_fuzzer.c":"042621053=
050f0fde90a0428cd1afabda8cc7c3fa59e3e0a55c43ab1e03d3988","src/zlib-ng/test/=
fuzz/example_flush_fuzzer.c":"f12246a184dcfe0a19a98cdc742a1fe8da388ad20b406=
635d63f1fa10d45b9ca","src/zlib-ng/test/fuzz/example_large_fuzzer.c":"f490ab=
cd332fb4e7921292adf6876d38d7f71c8d2443212c781ba88957ff9303","src/zlib-ng/te=
st/fuzz/example_small_fuzzer.c":"a9b3436b291ace821b6013311a1100e19a9e1c67fe=
fd3f97dbd60688f9bf22b1","src/zlib-ng/test/fuzz/minigzip_fuzzer.c":"7b0e7da9=
b6c60f3b3a13f140cc445050d9e8958d4f59cbb9a498c08f3a53adab","src/zlib-ng/test=
/fuzz/standalone_fuzz_target_runner.c":"306e8ac4e08ea72d18ffae8c908abfef8c6=
feedf83b068a7ec675ade6a5791a8","src/zlib-ng/test/hash_head_0.c":"d88105a80e=
756b7206a20c7b2490a2e7e743a2ceb1f20d3e433ce9848f054e1b","src/zlib-ng/test/i=
nfcover.c":"b9acffc102fdd140941073ca47e30c938aa937b4929061500c36ffba12c8644=
9","src/zlib-ng/test/minideflate.c":"93de8ffcbe7c414abf3ea36acdf729bcedb403=
93ec7bd10b356ebe225406e173","src/zlib-ng/test/minigzip.c":"291e2ea30778a3e8=
29b96cb47211e89494ece036cd74591178710b4276c9b48f","src/zlib-ng/test/pkgchec=
k.sh":"75b3155125f235e27ee434d76b6f72bd825899b55f6d59ef2d032fe67a2896ed","s=
rc/zlib-ng/test/switchlevels.c":"c30ae3d27ce6041934532553719622e7ed473541aa=
7bdad8d11d0c55e5220f14","src/zlib-ng/test/testCVEinputs.sh":"5de6198444c167=
26f8e0a8f2beb5b89c5ae7e7e3736ce760b9fbc719493e7e4f","src/zlib-ng/tools/code=
cov-upload.sh":"ec7a8f1405820810e486e3d7e2fda7eb958c17877b0000b93abdf09d877=
32a2f","src/zlib-ng/tools/config.sub":"32186cfeb5db62c99e1dfbfb07f24c1a5097=
7447b4c26d2907021c74422a70d2","src/zlib-ng/tools/makecrct.c":"55c8f7b8e2939=
3e95988a29de8cb1a1bdf2738a69d53627bd0f9d7bf169bf0a8","src/zlib-ng/tools/mak=
efixed.c":"bffd02540231304f9bcc755b8cb9ae5cfbc48975857bbb4547f1d6acce21ef57=
","src/zlib-ng/tools/maketrees.c":"2dbfe34691dde327618be496b380fc91daaa3047=
4352815773a8b70114b0541a","src/zlib-ng/trees.c":"956ce5b3f3330320cb5baadbf7=
721572259ec41edc4d8c132a20888b7f6f60c3","src/zlib-ng/trees.h":"24174f3543b0=
1ee1ef370bbf6d15551a21871cded18b2aadf09a71e7904b6f99","src/zlib-ng/trees_em=
it.h":"f68904e04caee0482c72ea92cc775cabe35a0bf7cffce85566c15ace27666af4","s=
rc/zlib-ng/trees_tbl.h":"35f4fd0ec080c1ade342e2dd1b0f5cdc7e9f18990faa48d7a8=
a69bc318ebe607","src/zlib-ng/uncompr.c":"4ebb486b27930f8a6ec4a3cc90a207d0bc=
f8a4779d1dbf3b2184a2b2a5735cd1","src/zlib-ng/win32/DLL_FAQ.txt":"d2ec63cb4a=
51886e0813f75bca49a051bede364d855f938e1a7992ab97a79800","src/zlib-ng/win32/=
Makefile.a64":"775d6902373d1583430b5d7467f001746be323610c89be27e02bbfe02059=
94f3","src/zlib-ng/win32/Makefile.arm":"7535e022f482920c3fa7a267e84e39ad790=
d150f72e5c30414baa156c2fdd9b6","src/zlib-ng/win32/Makefile.msc":"deee44d562=
4890e692d87db311216075e967c3ac8aeea6ffcdcac3d03eea260b","src/zlib-ng/win32/=
README-WIN32.txt":"a8c2d052960b963a49cee5a2ad891f2ff7b34db038f00985eba4eefc=
99966261","src/zlib-ng/win32/zlib-ng.def":"f240276caf805a10d024fc6a66efe915=
c435734c69732818d92fb04d08ab350c","src/zlib-ng/win32/zlib-ng1.rc":"b567a276=
407998bae40aacd48a50beba87c0bfbae470d28e66331ac99eb575c8","src/zlib-ng/win3=
2/zlib.def":"d9c371ff2677567350386441a2e3d0258010d6502290bbac5ac42ea168bd52=
12","src/zlib-ng/win32/zlib1.rc":"d7f269379144d65bcd1b67c1065e5d4120579f14c=
e54ecf246eaba394fa989a5","src/zlib-ng/win32/zlibcompat.def":"73728b9df4379d=
c70ebd9b2a9f20d6e4ed7c031fa1f351cdeae1de7d1db05bd1","src/zlib-ng/zbuild.h":=
"f73424f5f10370ffe8f45f6e3dc52dd095ea778153832461d712a838e3a01098","src/zli=
b-ng/zconf-ng.h.in":"708106f26c4a0d877e2ea644320a2b48b144524b61429c7490e2e7=
42a0c0c1e4","src/zlib-ng/zconf.h.in":"dacec2360fd9607f85bdf651409fa3831dd26=
f74414d242e812b06c3b9c9926d","src/zlib-ng/zendian.h":"f5cfa865281d2c5d0b097=
d318500f27daeec346e7882de68e279486d79c52e77","src/zlib-ng/zlib-ng.h":"7a15b=
da0297b2611da695f895cc57ce44c284b030fe98817281e868a1a86ae35","src/zlib-ng/z=
lib-ng.map":"e8202981574d814cb2a9f06bca7900d0959c24766bd86681bd3843ab0e71f8=
ef","src/zlib-ng/zlib.h":"703bead0c02381c8df8d14d805fde913973b2960811f35e2d=
e4f4aaf29ad905c","src/zlib-ng/zlib.map":"e3549810f821d433d57f921ca2fceb8674=
574f778485255a7dc691bf26b5281b","src/zlib-ng/zlib.pc.cmakein":"17668e07edbe=
5971043bea26a2f2b92c4c7cf4724620f1156f3ea1436d2aac93","src/zlib-ng/zlib.pc.=
in":"cf94c9aa44878a62e27c2f75354c08326b3bb5250a9b11496855cf59691177bb","src=
/zlib-ng/zutil.c":"7544aa2d2cfce4693d4e2a639f0631c3e8b3e7d0d846313be0e250c4=
77e6812c","src/zlib-ng/zutil.h":"c0e9152d078ca1774c93910fd84531b2f593b3a6b1=
035e4d97a0d28b720ec98b","src/zlib-ng/zutil_p.h":"1e5a2fb8d15212ad094e9a5d5f=
607f11f8191498b54e0af48d722f92d9c71ffd","src/zlib/CMakeLists.txt":"b8727573=
1cc3ebdfea144187875cea204f555c343279c0f35f2d46d661bfe34a","src/zlib/ChangeL=
og":"4c9f1a65b9b4be8bf164a97775ef50e4db4e02ea8c9933fdbe629a640691375e","src=
/zlib/FAQ":"1e8a0078be0ff1b60d57561a9e4a8cad72892318a8831946cba1abd30d65521=
c","src/zlib/INDEX":"3b4e325d47ae66456d43fcf143ba21ab67a02a4f81be7ef2da480b=
a30d774266","src/zlib/Makefile":"ef23b08ce01239843f1ded3f373bfc432627a477d6=
2f945cbf63b2ac03db118a","src/zlib/Makefile.in":"5021b2bac4164f48b17c91c8a2e=
3c225be7ad31d8bfab1bbaadd90370afe9991","src/zlib/README":"7960b6b1cc63e619a=
bb77acaea5427159605afee8c8b362664f4effc7d7f7d15","src/zlib/adler32.c":"d7f1=
b6e44fee20ab41cef1d650776a039a2348935eb96bcbd294a4096139be3a","src/zlib/ami=
ga/Makefile.pup":"a65cb3cd40b1b8ec77e288974dd9dc53d91ed78bbe495e94ccc84ddd4=
23edf1f","src/zlib/amiga/Makefile.sas":"0e63cf88b505a1a04327bb666af3a985c5e=
11835c0c00aed4058c0dcc315d60e","src/zlib/compress.c":"5c11e1fc22e219cb986f6=
fa9e4ba939315227e84aef042737d38ec668b89b6d2","src/zlib/configure":"86b38f27=
f31d2fec76d9355872550dc63cb3949774473fd6313c5a3fd1def0e2","src/zlib/contrib=
/README.contrib":"ca39b78bd7ad84f1df7b0da90770c5b3fa4c8e2c75d132e9222812fac=
8839630","src/zlib/contrib/ada/buffer_demo.adb":"469cf566a6965767fee6b987a2=
39ed8cedcc66614940d45a9b434331fbb435ce","src/zlib/contrib/ada/mtest.adb":"4=
1b6f31684770334afdc4375871eb1408542f37a823a073556fdbfdb63753160","src/zlib/=
contrib/ada/read.adb":"fa5b989aef0c5715a3fcb15de93985f7f10aeb0a7f5716745c95=
ed820eb9af9c","src/zlib/contrib/ada/readme.txt":"8fe9e5303f2e8e8b746c78250e=
74b7c4aeb7ce6212fdce751fc3a0ce56a47fe2","src/zlib/contrib/ada/test.adb":"5e=
3abe79b387e09a9a42bd0543105e228f39a335240cffc33d71f0ba66ff2511","src/zlib/c=
ontrib/ada/zlib-streams.adb":"f45988e2bac76eb25a0dc981f46576e7432c35dde1790=
bbc2b650f0090b7fa72","src/zlib/contrib/ada/zlib-streams.ads":"969e8edb06118=
10fb52159dcb7c40228f4e5da810a7a3576b778116a93038c6b","src/zlib/contrib/ada/=
zlib-thin.adb":"03d89244ee5ec9771d9b5050e586c609f851af551b2e64eb151f1d5be0b=
63ae9","src/zlib/contrib/ada/zlib-thin.ads":"631ef170bde16c3ca8d412b54a0e51=
9815b80197d208f8f393e6fe017bb0968e","src/zlib/contrib/ada/zlib.adb":"c9ca5d=
c34fbcdf06e2dc777b7e9dcd0ba31085b772b440eb0e12421323ab672c","src/zlib/contr=
ib/ada/zlib.ads":"02634bec0d5e4c69d8d2859124380074a57de8d8bd928398379bfacc5=
14236d2","src/zlib/contrib/ada/zlib.gpr":"859bb69dce38dbe9dca06753cf7ae7bd1=
6d48f4fece8b87582dab8e30681d3de","src/zlib/contrib/amd64/amd64-match.S":"16=
6007f7e9adb58fe8b83d85bbfe823f5e05858ba1d06edf637b78886caa2c69","src/zlib/c=
ontrib/asm686/README.686":"c21cc7147c956ecae17dd084cb41a206b086216fa5210128=
71fb07fafd203c6d","src/zlib/contrib/asm686/match.S":"873799062495629f21cd3f=
779ea4b927add7aae0144e32d3594d9ce70185e99d","src/zlib/contrib/blast/Makefil=
e":"17d5d26c24bf51cad51045a38ffb73cc3539d29e89885aa249fcfd45a8659d5c","src/=
zlib/contrib/blast/README":"baa763ae03d88ef7ece6eb80d9a099b43d0b57639d6d281=
e1c7c6ca79d81daba","src/zlib/contrib/blast/blast.c":"1ab3e479d342bfc144167b=
808fb00142264bc50f24a110ca88cc774e351c218e","src/zlib/contrib/blast/blast.h=
":"4d4e3e6f893316f0be77bfd642c857a77f1fa2925acb5df9753e543d35aa3a6a","src/z=
lib/contrib/blast/test.pk":"5f5c262c545574a5c221132d5ef832478d222d70b015341=
795b3860204140d7c","src/zlib/contrib/blast/test.txt":"9679b2c98e1283222d078=
2b25a1c198dc64ba9ebd1addd6dc6f643a45947cda3","src/zlib/contrib/delphi/ZLib.=
pas":"1b20e173443a68c189cdaa4795620fb1ac165d9e61a27a1ed2cf690f13530d6f","sr=
c/zlib/contrib/delphi/ZLibConst.pas":"84bcc580bdf397e570f86f3f5a5b8c7bf5378=
28f30b4b72648b81911f6bf5095","src/zlib/contrib/delphi/readme.txt":"f7420ed2=
de77d4b498eefbbe6402a1d17dc2d411735289c78a265c7f10fdaee5","src/zlib/contrib=
/delphi/zlibd32.mak":"850e91b6c9ea05de61a411cbda16fa0f10118cd88bb32c4b72269=
88776f8d511","src/zlib/contrib/dotzlib/DotZLib.build":"b96137097669644ecb9f=
42cdd3399d1fce9c512788374609303f7e50abf597f0","src/zlib/contrib/dotzlib/Dot=
ZLib.chm":"20d0e3edd57f849143255a7f0df1cd59d41db464a72c0d5ab42846438a729579=
","src/zlib/contrib/dotzlib/DotZLib.sln":"a979198c5b8d144c1ac8f993bfb6f4085=
d135aa58ca9dcf63ebabf52b5c695f7","src/zlib/contrib/dotzlib/DotZLib/Assembly=
Info.cs":"314afcfb339ea95f5431047b7ab24631b11c3532c7ce5dc2094ed0cf80a7c16d"=
,"src/zlib/contrib/dotzlib/DotZLib/ChecksumImpl.cs":"e7c047a2c3bcf88d3d002e=
e3d2d05af414acf53cb4451efacc0f2e95a474ea0f","src/zlib/contrib/dotzlib/DotZL=
ib/CircularBuffer.cs":"be84c9736fe7bdc2bfae70466d8fff582504e928d5b5e110fd75=
8090090c8cb7","src/zlib/contrib/dotzlib/DotZLib/CodecBase.cs":"259bdda1b7d6=
052134e631fa24bfd9dca6e2362563496c8b85257b56c848908c","src/zlib/contrib/dot=
zlib/DotZLib/Deflater.cs":"06ba6696a3c15c53ba5fd5a1c2bf50b51f217010228fc1e4=
c8495ee578f480de","src/zlib/contrib/dotzlib/DotZLib/DotZLib.cs":"9837fe993f=
d631233cc5e53ff084d86754b97f05ec77c54b0764c2706f186134","src/zlib/contrib/d=
otzlib/DotZLib/DotZLib.csproj":"21606db31dfef6410dd438b73f1db68856eacabcce6=
c0f0411fc4f17e17001f3","src/zlib/contrib/dotzlib/DotZLib/GZipStream.cs":"8d=
1de9755c77046b4ac71340a0a54434ebf4fd11b085c44454d7663a9b4df1c5","src/zlib/c=
ontrib/dotzlib/DotZLib/Inflater.cs":"9016ca73818f5b6a28791abc3af6da7c4d2773=
b6a3804f593f6d5737a62b99ad","src/zlib/contrib/dotzlib/DotZLib/UnitTests.cs"=
:"ad66ac08de34d253e9615b96a745f3dfeda93f4a978d65d5d3ddb9d0d9b3e099","src/zl=
ib/contrib/dotzlib/LICENSE_1_0.txt":"36266a8fd073568394cb81cdb2b124f7fdae2c=
64c1a7ed09db34b4d22efa2951","src/zlib/contrib/dotzlib/readme.txt":"d04972a9=
1b1563fb4b7acab4b9ff2b84e57368953cc0596d5f5ea17d97315fd0","src/zlib/contrib=
/gcc_gvmat64/gvmat64.S":"22ff411b8b1d1b04aeaa8418b68245400267dc43c6f44104f6=
ccd37f0daee89f","src/zlib/contrib/infback9/README":"890288f02bb3b1f9cc654b8=
7a07fcea695f90f6b9bd672d25bf6be1da2ec1688","src/zlib/contrib/infback9/infba=
ck9.c":"0a715c85a1ce3bb8b5a18d60941ffabc0186a886bcc66ba2ee0c4115a8e274e9","=
src/zlib/contrib/infback9/infback9.h":"dda2302f28157fe43a6143f84802af174039=
3572c2766559593996fd7a5a3245","src/zlib/contrib/infback9/inffix9.h":"84a2ba=
4727767c18af6505f0e81d9c814489c8b9ed330a25dad433db72997e43","src/zlib/contr=
ib/infback9/inflate9.h":"32a907676cc36e27d0fdc0d99adb83a0b23f20ab6189626921=
6d40fecf08d349","src/zlib/contrib/infback9/inftree9.c":"0c7f10396703b230c50=
4207fe1595a2f2f8ba9c43158c4bd79d5b22ca36e04e0","src/zlib/contrib/infback9/i=
nftree9.h":"8ae61d52e50d2dbdb0378548ecc54fcd88f108c8b6fc30562a3ebec1ca6a599=
e","src/zlib/contrib/inflate86/inffas86.c":"6f266f3c7e0faca653256d0189c0f00=
d7dc0b062d02e25df4e1202e49369595c","src/zlib/contrib/inflate86/inffast.S":"=
70777bd21526680005fc34f086d108af49e2668ad86d1749e8e8100a81bfb288","src/zlib=
/contrib/iostream/test.cpp":"0f3c77e013949eb9c91e6b690ea894e19d97944d6b0885=
b82806fc3ad99680cf","src/zlib/contrib/iostream/zfstream.cpp":"8ebb9b3d521cc=
3392953f27658cf1f6dcb763216079f69a1518ec5ca0e42a63b","src/zlib/contrib/iost=
ream/zfstream.h":"4369c35e66f63f52ca4a5e1759bf720507ccabb8f3f132e2f18e68686=
c812401","src/zlib/contrib/iostream2/zstream.h":"d0343e0c57ff58008b6f29643d=
289c72713aa2d653fe3dcd2e939fc77e7e20b6","src/zlib/contrib/iostream2/zstream=
_test.cpp":"f789df183cc58b78751985466380c656308490a9036eb48a7ef79704c3d3f22=
9","src/zlib/contrib/iostream3/README":"43ec48ecbd95a8c45db20b107fac73b740b=
b11595a4737329188f06b713972cc","src/zlib/contrib/iostream3/TODO":"af5ebc83f=
b88f69706c8af896733784753dead147687e1c046f410c0997fd88b","src/zlib/contrib/=
iostream3/test.cc":"8e17fc48dfdbc6e268838b8b427491b5843b6d18bc97caa6924de9f=
ad7abe3da","src/zlib/contrib/iostream3/zfstream.cc":"8cdd67ed0b13c192c11e5e=
a90e9d5782d6627eb303fbc4aa5ebda2531ec00ff8","src/zlib/contrib/iostream3/zfs=
tream.h":"1bd74778fac45ee090dfc0f182a23e8a849152deb630606884b2635987b357b1"=
,"src/zlib/contrib/masmx64/bld_ml64.bat":"1c0561908a07ebdff271b12ed757241e1=
813d3db0f3551501b2595c23f0833aa","src/zlib/contrib/masmx64/gvmat64.asm":"39=
0c1e6d63cb615b5ba042842738953f9cdc688b2fe35aaca981fd3fae213f3f","src/zlib/c=
ontrib/masmx64/inffas8664.c":"f6c585e43e6e524107566b1f10104949d0ef902159ac8=
203e1d98e50d4bedd62","src/zlib/contrib/masmx64/inffasx64.asm":"8448d0041fe6=
e8f4188fe5916181a1b274c6d35d75cfb28da60cf4f1edde44ec","src/zlib/contrib/mas=
mx64/readme.txt":"9bb66b5028100855683853f12da0be479c7bccf74365fdbf37da2542e=
dff9927","src/zlib/contrib/masmx86/bld_ml32.bat":"b0b05b62715d4a81a7db5b7ca=
4a372d109ec95634c9d3bef9e0041ff52de22fc","src/zlib/contrib/masmx86/inffas32=
.asm":"78d2cc88f8ed0e32ef960efc987c257bc1688afe7d031a8ba18761e95a6a7c3f","s=
rc/zlib/contrib/masmx86/match686.asm":"9e9bea3b5517b089da7d39caded07982746a=
33f94f0907ca7e8afefed7be36b6","src/zlib/contrib/masmx86/readme.txt":"1f29a0=
4e0227b74e20ba1b7c764b3ca5bf596dd2c06e89bc19a05fb8f9689778","src/zlib/contr=
ib/minizip/Makefile":"087034de3dc0223b29e64bb3a4fc3eda7b948e93d2a9ff154aecf=
9fed2a1eb5b","src/zlib/contrib/minizip/Makefile.am":"2313a3480a2c3745fa7ce2=
16829cd0367058907d3a0902e5832c66c84a2fdfc6","src/zlib/contrib/minizip/MiniZ=
ip64_Changes.txt":"302c62b328647f5472fb7755249a83459be7f8ffb1fae07e8ba318fc=
e8f4126c","src/zlib/contrib/minizip/MiniZip64_info.txt":"122719c32ef1763a5f=
6ba9c8cdefc1d78a76f7156b09e7b6f69b73f968e0dac3","src/zlib/contrib/minizip/c=
onfigure.ac":"35330dc0c6188127afd339829d91b19739d23bf3b7301bfb04f775a6fcbbd=
ad7","src/zlib/contrib/minizip/crypt.h":"8e872b60255b8447da99885c7159c2e1f1=
bb8143523bdbe71784e60f98bfd67b","src/zlib/contrib/minizip/ioapi.c":"66b39c2=
7042f6ad12cc12efb0c82cdf100c6640b5fa959b8b866e252966113a9","src/zlib/contri=
b/minizip/ioapi.h":"8655408534b78dc0889a45f9359fc6d2d5c8e8d8443b81ede596f95=
4c720ef48","src/zlib/contrib/minizip/iowin32.c":"2c05bc374d3d847c6a9f29eac9=
d674abba7659d1e91e34e172248fcb5c274d51","src/zlib/contrib/minizip/iowin32.h=
":"586f22b9c3c64da253ce2b518e0fad61f19a7b47b289fc704cc9708242294c49","src/z=
lib/contrib/minizip/make_vms.com":"65736d9c4888f2373d3db0a13864d150c5040453=
f5bc2a5c8784379a7ea67590","src/zlib/contrib/minizip/miniunz.c":"ced49f20c62=
536a8ffb270b35cfa4994a1dcdce45f8cf059b941c94ca0022666","src/zlib/contrib/mi=
nizip/miniunzip.1":"66d8684392167091ef0fe01598d6a0daa26e7e448e2df6c3cb25748=
7735b83f7","src/zlib/contrib/minizip/minizip.1":"5404596e8e5587a52f56390611=
9f32ceee30a6d97a966afa5c7afbe4d373e210","src/zlib/contrib/minizip/minizip.c=
":"fdfcf83979ef2324c1455d369e8add8678c804939d412ce53f8b024578ceabad","src/z=
lib/contrib/minizip/minizip.pc.in":"8b6670b42d8e5e519e1cc89db093efc07ba23cb=
1ddfedd3c93ff2df08c3ce8ac","src/zlib/contrib/minizip/mztools.c":"cd887c4af6=
d20823bd15f24008b10acf01969b4165d7848656bde843a92428d7","src/zlib/contrib/m=
inizip/mztools.h":"6f82c52279e8f79165f4446be652e5741a49992ac58632470335aa34=
c564072a","src/zlib/contrib/minizip/unzip.c":"497adf676b1cae2a7afa834e4aba8=
6383f7b697f5fdd03a8179ea9024a431cf9","src/zlib/contrib/minizip/unzip.h":"d8=
dc58fc0121b6a4b98f3028205bb253f956b1ddf791e9ced3cf44892502a01f","src/zlib/c=
ontrib/minizip/zip.c":"00f403cb7810578b4b2687dd55fb132c850c3630fba2f3704a8a=
b896fcc8209a","src/zlib/contrib/minizip/zip.h":"96163fc140e4bf08752e014d20a=
1eac3f5adcdc408366f6d79c1895f2599cf08","src/zlib/contrib/pascal/example.pas=
":"d842d456ecb6ff80e34cee2da31deb2072cc69ca837497bea8b8bee203403474","src/z=
lib/contrib/pascal/readme.txt":"02f997c37991ddae0cb986039f7b4f6fc816b3fd0ff=
d332cad371d04c12cf1b9","src/zlib/contrib/pascal/zlibd32.mak":"850e91b6c9ea0=
5de61a411cbda16fa0f10118cd88bb32c4b7226988776f8d511","src/zlib/contrib/pasc=
al/zlibpas.pas":"28b90aeeb3da8d1f6a98ab9f5f1603d08aba5bfabc50827d3f15e66126=
8a51cf","src/zlib/contrib/puff/Makefile":"d9d738030464aaae354196c14fd928adf=
591832fce7d71ac1977c1d8d4923a4b","src/zlib/contrib/puff/README":"aceca4bc1b=
ce7d9445b8bc9b6640c672d95708185f6070d3a3baae7a9d102caf","src/zlib/contrib/p=
uff/puff.c":"6d0eef92e115a42e570b79d8b07a04af5ccbd6b3f3fbca9cbc61c49db9c9df=
43","src/zlib/contrib/puff/puff.h":"969b7be2a930db0cdcb19b0e5b29ae6741f5a8f=
663b6dba6d647e12ec60cfa8e","src/zlib/contrib/puff/pufftest.c":"8ee0da78a122=
1a3c2036e22eed06c2faa27a671a46565a60e10111d4ee9c30ee","src/zlib/contrib/puf=
f/zeros.raw":"b7b0887089f7af1f6d1e0b4c0a1e8eddd10223b23554299455c6c9be71b65=
3a3","src/zlib/contrib/testzlib/testzlib.c":"c6c37b35c6ecc9986a9041f86d879c=
c37a9e4d8315af9d725071eb3b2cade0c5","src/zlib/contrib/testzlib/testzlib.txt=
":"2359bbdc84eb8a04e0f1cd16cd81a2896e957f2ad58dab3ca78ef55b7d0dc577","src/z=
lib/contrib/untgz/Makefile":"8f5ab1564813e091cea8f1bb63da32fd80ac763d029277=
b0cabf50f60aceefe1","src/zlib/contrib/untgz/Makefile.msc":"d0f537de11d9e0e3=
6e2a98b3971c537265f4b533b4c48797094365ad9ae8388b","src/zlib/contrib/untgz/u=
ntgz.c":"9a12d774301d252dcd38bba07ac369319da4c04c4fef8a50fcbf40aebf29c2a1",=
"src/zlib/contrib/vstudio/readme.txt":"2a9ca40b68274f4d37649dfab9e5e867a000=
883592b4ab8fdaec8425a63052c3","src/zlib/contrib/vstudio/vc10/miniunz.vcxpro=
j":"dd607d43c64581172c20c22112821924dfe862f56b2e5eb8780bdd0714d9527b","src/=
zlib/contrib/vstudio/vc10/miniunz.vcxproj.filters":"c3db9f97952683e688ad83c=
13bb94c816ac3e6b5f277fdea545b0650c125aa6d","src/zlib/contrib/vstudio/vc10/m=
inizip.vcxproj":"af73f2cf8ae51e65e85342faeb40849a2310c97bc77def42b38d707046=
0a6cf0","src/zlib/contrib/vstudio/vc10/minizip.vcxproj.filters":"83db58d87f=
5d7ca84b6087aa1f62b15cbc296194c8cf76e47a271f9077b4f3bd","src/zlib/contrib/v=
studio/vc10/testzlib.vcxproj":"1525ed0893db56db44ec68675c8da3c229dc7867166d=
fc0428816783d16ad43b","src/zlib/contrib/vstudio/vc10/testzlib.vcxproj.filte=
rs":"d7e04ffa467d417dfa3c0f1c64234cadc84882101bbae483f0a0f5d3d6b566a7","src=
/zlib/contrib/vstudio/vc10/testzlibdll.vcxproj":"3f317d8964f17901c3e68bff5d=
eaec10b6ccc50a572235999e8097292692984c","src/zlib/contrib/vstudio/vc10/test=
zlibdll.vcxproj.filters":"682a485f0184aabba94e12e1b284499195f37c176d43ecee0=
484f31e4d636f6f","src/zlib/contrib/vstudio/vc10/zlib.rc":"e8b581eb16930e021=
3d37143a5f17868839b22c758b23981a29484e17093c494","src/zlib/contrib/vstudio/=
vc10/zlibstat.vcxproj":"2a38222d6c034d7e0b843c3f0540dc6c53dd48f942ae29f3162=
0ca0327248c8e","src/zlib/contrib/vstudio/vc10/zlibstat.vcxproj.filters":"d9=
a2c381e51e4d6f027f3517db7db81656e43cec02ed9abf267a0fde6f360180","src/zlib/c=
ontrib/vstudio/vc10/zlibvc.def":"0124fea28bfee49c8a19dad0ed5a49277d451018b4=
affda5a389e64ad15f44d7","src/zlib/contrib/vstudio/vc10/zlibvc.sln":"e659860=
f705f31b87ea9139a3cb4ebe1561e120bce495383a54614fc82b49990","src/zlib/contri=
b/vstudio/vc10/zlibvc.vcxproj":"3108badf710e2f4a64eab4e7deae6642fb68cc0d940=
18e537149f1761e215133","src/zlib/contrib/vstudio/vc10/zlibvc.vcxproj.filter=
s":"58404ba7703c68025bec64b8a17ff1fc7f3a35d15d17ae3bcc4fa753f1348425","src/=
zlib/contrib/vstudio/vc11/miniunz.vcxproj":"746e4c11fb8af4bcd6a9d68ba81ed1d=
c366a5de3bed56b291ee969ad733a7bb0","src/zlib/contrib/vstudio/vc11/minizip.v=
cxproj":"340617cae9cf4fcb003308021d3782ec3639e60d62d79a3aafc0a50bb55b061e",=
"src/zlib/contrib/vstudio/vc11/testzlib.vcxproj":"589eec6ef6d818564ead938a6=
29fda50abb6cbf8054b9f66ea780765c1a1b3db","src/zlib/contrib/vstudio/vc11/tes=
tzlibdll.vcxproj":"583bdef522b0176829f0d8139ea2a88b9cbc14379d1334f3a863989e=
d3df9b67","src/zlib/contrib/vstudio/vc11/zlib.rc":"e8b581eb16930e0213d37143=
a5f17868839b22c758b23981a29484e17093c494","src/zlib/contrib/vstudio/vc11/zl=
ibstat.vcxproj":"51aa752698d96df065a9ece02e293492f681b59a8077f036a5a60367dc=
621e87","src/zlib/contrib/vstudio/vc11/zlibvc.def":"0124fea28bfee49c8a19dad=
0ed5a49277d451018b4affda5a389e64ad15f44d7","src/zlib/contrib/vstudio/vc11/z=
libvc.sln":"27389b515997defd080519f95aff87e89fcbe8b26d73c5ebb73c544cfef4d60=
e","src/zlib/contrib/vstudio/vc11/zlibvc.vcxproj":"c3dd05e56159aba411475b83=
656275872524cb3c2fd24d690397d8b634e7e0ed","src/zlib/contrib/vstudio/vc12/mi=
niunz.vcxproj":"1494af54570f6e93852932956d49a8c25e57b5abc1ac979945605ca9143=
df9f8","src/zlib/contrib/vstudio/vc12/minizip.vcxproj":"9bf128ed6760ca5f019=
006f178b1c65f4c7ff122dba8d297b64b0eb72feeb120","src/zlib/contrib/vstudio/vc=
12/testzlib.vcxproj":"367a06caa399bd09f6b9cb60706820943dd6a6cf05794275baaf4=
21da9c2a0b7","src/zlib/contrib/vstudio/vc12/testzlibdll.vcxproj":"934165102=
56935d79625dc9fd349cfce6968c062d42a138bec404a26b2f92f5e","src/zlib/contrib/=
vstudio/vc12/zlib.rc":"92d5d3a4938a6350395934153416a7eb74353cdfb2321f45b9ee=
0b9b16257f39","src/zlib/contrib/vstudio/vc12/zlibstat.vcxproj":"744ff6ac0d4=
e2dcdf74c7d33b979fbfd2b18550947eb99bfd46dc6a73eb1c68d","src/zlib/contrib/vs=
tudio/vc12/zlibvc.def":"0124fea28bfee49c8a19dad0ed5a49277d451018b4affda5a38=
9e64ad15f44d7","src/zlib/contrib/vstudio/vc12/zlibvc.sln":"162e0faa80a56d89=
eea71a0b89377708eec2faa0dc72091cc0abb07fbdea49a0","src/zlib/contrib/vstudio=
/vc12/zlibvc.vcxproj":"754671c59d8996a846241af76082cc8be1aa5fc079eff530d91a=
9ab15a0bee5b","src/zlib/contrib/vstudio/vc14/miniunz.vcxproj":"0312511d4a30=
cea979c4e36edf994a537ed8a9d924f6b5c536cbcd094773c11f","src/zlib/contrib/vst=
udio/vc14/minizip.vcxproj":"9e7bb7a6ac723e4b2db900627c366f9bb93a351381995d9=
c69a50c0126f64233","src/zlib/contrib/vstudio/vc14/testzlib.vcxproj":"c3a936=
9670af4ebea13d036b452be7418591fbb4c03a675699facac5d8dff5d0","src/zlib/contr=
ib/vstudio/vc14/testzlibdll.vcxproj":"69f544898b4275cd3d8e19b8f1f8cb39c1cb9=
8a30cdb033242e4b94c57bfa150","src/zlib/contrib/vstudio/vc14/zlib.rc":"92d5d=
3a4938a6350395934153416a7eb74353cdfb2321f45b9ee0b9b16257f39","src/zlib/cont=
rib/vstudio/vc14/zlibstat.vcxproj":"9c7c096b47e7875412c98525efcd16db62e0942=
15f0011b9cd739a33ab35d48c","src/zlib/contrib/vstudio/vc14/zlibvc.def":"0124=
fea28bfee49c8a19dad0ed5a49277d451018b4affda5a389e64ad15f44d7","src/zlib/con=
trib/vstudio/vc14/zlibvc.sln":"47a50bbde8ca6336cecd8c0e4b65e515fc46ae84c7b6=
1008ac9864162f777286","src/zlib/contrib/vstudio/vc14/zlibvc.vcxproj":"71fb6=
ef3b079bfdf4182af17e74c3361ead757467edfc591d9cbe303ccc47b52","src/zlib/cont=
rib/vstudio/vc9/miniunz.vcproj":"b2b53bd9e704bfbe769b863acdc2a3368692ca149c=
4b4ed2a0761b0cd16c6726","src/zlib/contrib/vstudio/vc9/minizip.vcproj":"80a7=
01fb41a61871ce1d25f6b03e571edb6c3abf0aa45375554b6fac52115eb6","src/zlib/con=
trib/vstudio/vc9/testzlib.vcproj":"05fc5a87682b17690d199f424f57f6ad7767b8da=
bb29a1039bfcb88bca1b302f","src/zlib/contrib/vstudio/vc9/testzlibdll.vcproj"=
:"25c1cc5319f1c4b7dbdb595c3cfd6ec3ba217818b03b7055ef5ef440b575a43d","src/zl=
ib/contrib/vstudio/vc9/zlib.rc":"e8b581eb16930e0213d37143a5f17868839b22c758=
b23981a29484e17093c494","src/zlib/contrib/vstudio/vc9/zlibstat.vcproj":"e86=
53eea37f3bef097eec2caa55e1f698c3c74c959689bc4e97568e88d2bbc60","src/zlib/co=
ntrib/vstudio/vc9/zlibvc.def":"0124fea28bfee49c8a19dad0ed5a49277d451018b4af=
fda5a389e64ad15f44d7","src/zlib/contrib/vstudio/vc9/zlibvc.sln":"26e58d4b2c=
fcd941c367fb2a18537b3b9f002f2ac1278b700ea1129c50501452","src/zlib/contrib/v=
studio/vc9/zlibvc.vcproj":"86aa6e33db104c0a0ed4a9f21f0db8572cc7755170217aef=
18219fdd74b75e9d","src/zlib/crc32.c":"a04af273e83ecc351bf3794974ab2098d8d96=
0df4044b7b44734c41443ee26d0","src/zlib/crc32.h":"407af59d0abfea84a6507c603e=
b29809411797f98249614fe76a661def783ce1","src/zlib/deflate.c":"11fd6b0328b65=
c4ad4b5c204d892a97a9083628a7e77dc47836c8e0c799f8da0","src/zlib/deflate.h":"=
0ca7fb0cf1dd63001c6e9e4ff93c8dbff2fe521199be51a4dda38a11b44919f6","src/zlib=
/doc/algorithm.txt":"992590931e982c0765286c2d83f6e9ff0a95aabb08e28c30c52bae=
3e8c4bd5ad","src/zlib/doc/rfc1950.txt":"8f0475a5c984657bf26277f73df9456c9b9=
7f175084f0c1748f1eb1f0b9b10b9","src/zlib/doc/rfc1951.txt":"5ebf4b5b7fe1c3a0=
c0ab9aa3ac8c0f3853a7dc484905e76e03b0b0f301350009","src/zlib/doc/rfc1952.txt=
":"164ef0897b4cbec63abf1b57f069f3599bd0fb7c72c2a4dee21bd7e03ec9af67","src/z=
lib/doc/txtvsbin.txt":"47c273bb22c9773248d380549a330e5c262266b1292154b0d301=
4f731cc73f47","src/zlib/examples/README.examples":"402d72eb69c2e03a25034f4b=
3c02b110f0f67149ecfa4fa0e4b2bf0ceb49a8b3","src/zlib/examples/enough.c":"704=
e273f65b62c5d2eb06d5bb10c4ccffba56544aa477f0e3957e2296c501b78","src/zlib/ex=
amples/fitblk.c":"950769163c41aff897ee41746a8685d9aa41073b1307f42da19dabe9d=
3fc8b85","src/zlib/examples/gun.c":"d60ca6eb0a3e62ee7fb4a1ab69e8d1525ff06b0=
6ce46889cbdfc13fb8f7534c2","src/zlib/examples/gzappend.c":"4182d38bf97ffbdf=
1110df7f65c0e8fab0b28b1ea36ebba8621c14e8e76f1caa","src/zlib/examples/gzjoin=
.c":"90b9d6c39a5fc91cf1cc9b96b025a508a8015dc502cd9374c754b44078593f57","src=
/zlib/examples/gzlog.c":"433d34b71b4e769ece1cceb8bd7d902d2c0a24ccd7550ab185=
6a5ba87f84f835","src/zlib/examples/gzlog.h":"309556e2d7d39250924946b78e2cce=
0ac927857d6e1a02cab64e438f533c20c3","src/zlib/examples/zlib_how.html":"80fb=
647be8450bd7a07d8495244e1f061dfbdbdb53172ca24e7ffff8ace9c72f","src/zlib/exa=
mples/zpipe.c":"68140a82582ede938159630bca0fb13a93b4bf1cb2e85b08943c26242cf=
8f3a6","src/zlib/examples/zran.c":"840ebeb058cd0ca9e92dcb1db665932462a4695f=
c649b34e865b8d1ad7c5bf77","src/zlib/gzclose.c":"94446cf8cde67c30e64d0a335b0=
c941fd3fbad2e77f30180d12e61f9c2a5a6b8","src/zlib/gzguts.h":"6a54a06d269245d=
73201e76280c0f11c282dc6ec51729ccd9051fe6c9907e851","src/zlib/gzlib.c":"5daf=
11e44149e0aba2956d35f73f04f35dca99c3dfa43f5ad43ec20b336e4a1b","src/zlib/gzr=
ead.c":"6f928512cb1792cfeab31a51ff0b211814d2e455bc75290eb31079dc1e5ad2ec","=
src/zlib/gzwrite.c":"ba3b7b7ad2ff7ef0c19319b8408c333491a4cd495da55d0b156bc7=
3d9ddb4df4","src/zlib/infback.c":"abe44873b5af2ea68ea1d281d915b2800f1832f84=
6d2c05442a4711adbe6f269","src/zlib/inffast.c":"4d496ab2a3d29df5fadc3dbff606=
7e039806aaceae6cfcd09ea77d46c2b848fd","src/zlib/inffast.h":"7d8c1c873ce9bc3=
46ad6005bb9d75cce5c6352aaf7395385be216a9452a34908","src/zlib/inffixed.h":"2=
37ba710f090e432b62ebf963bee8b302867e9691406b2d3f8ee89ee7bfef9b0","src/zlib/=
inflate.c":"8b6c599c3563c14c447c47db0d7dc9a16e8c246a078ec95a169ddcebaaebd81=
1","src/zlib/inflate.h":"8ec9ac297790276f7e46a961d4c6f9f944fb1dec92401339ec=
2666973cc5983c","src/zlib/inftrees.c":"1960ca67384376f65b6ce8c08fdb501f8eb3=
3923e11ef5f61a855708c6cb0a8a","src/zlib/inftrees.h":"c510b36402784b1f898be3=
b049b923469aa92701de2d9195aed19f6b65c0dce2","src/zlib/make_vms.com":"3064eb=
153a7684115f1494364f80759bc5a2c227799fdf08df7b9e6e50884720","src/zlib/msdos=
/Makefile.bor":"292ab363f7ffbc4ae84d37cd9bdffd2dac1003bee52d223a8489844870f=
20702","src/zlib/msdos/Makefile.dj2":"9208450c2ae6dcbfcc25560b5b9ca763f461e=
7246e37b0552474edf8fa898906","src/zlib/msdos/Makefile.emx":"c749d6ec7f88e8e=
639d4f03bdbdcbbe9d1c304210be4c4be621ceb22961d3d64","src/zlib/msdos/Makefile=
.msc":"0e021a6f42212415b060e4ad468eb415d0a8c1f343137fb9dff2cb8f9ead3027","s=
rc/zlib/msdos/Makefile.tc":"2ae12ee2a3e62f7c5a0520d0fbe4adee772bc07fe816002=
b07ccb43db3daa76a","src/zlib/nintendods/Makefile":"ea5823efe6830132294eddf2=
f56dbd7db8712244c210bb4968c431b1a91bd066","src/zlib/nintendods/README":"e36=
2426c47b39ff6a7d6c75c6660b20abf076cdfa5e1e421716dc629a71aef95","src/zlib/ol=
d/Makefile.emx":"d811f032272aae50123a889297af3a02fbd60d1e42bbef11466462f627=
ff7b5b","src/zlib/old/Makefile.riscos":"d1a488b160fbfd53272b68a913283a4be08=
ba9d490796b196dddb2ba535b41e0","src/zlib/old/README":"551a0f4d91fe0f827a31c=
bdfbb4a71d1f3dc4d06564d80a3f526b749dd104d11","src/zlib/old/descrip.mms":"8f=
f08c35c056df9c986f23c09cf8936db63ccf12c3c42f7d18a48b36f060cff7","src/zlib/o=
ld/os2/Makefile.os2":"6ad247c00f00ff42fd2d62555e86251cef06e4079378241b5f320=
c227507d51d","src/zlib/old/os2/zlib.def":"ea9c61876d2e20b67ef2d9495991a3279=
8eb40d13ede95859a2f4f03b65b9b61","src/zlib/old/visual-basic.txt":"1727650ac=
bde9a9e6aec9438896377e46a12699cca5d46c5399cef524dedc614","src/zlib/os400/RE=
ADME400":"6f95a1beb0fbf943a3312eaa3dd2c279f1cef93062bebbff63dd37ac9e2aa8d6"=
,"src/zlib/os400/bndsrc":"cfe00b1528d5c27813cd6b1ad7aa34b493fd63d615623fb21=
fd1a7bf99d2255e","src/zlib/os400/make.sh":"143394d1e3876c61c29078c0e47310e7=
26e1f5bd42739fe92df9ece65711655f","src/zlib/os400/zlib.inc":"c501c522185ba1=
f0506caf90d72f1088b34b2addc169471e949e443ab65e8a75","src/zlib/qnx/package.q=
pg":"90b5c8364d9dc5ef67405b352c19710ebad2905f3f20b9e56ded74661f96743b","src=
/zlib/test/example.c":"520799662a8286725540d6d5a356efe6f595618e5fe2e5919724=
91d719bd99aa","src/zlib/test/infcover.c":"f654f3fcc74b33bd95cda63d13fe0ce58=
9bcfe965544e0c17ee597d75efbd090","src/zlib/test/minigzip.c":"91089b21e69279=
7bb6208b2b45eeb90f5f1f1e4f6b67b99dea5676f51b811193","src/zlib/treebuild.xml=
":"d816c764c8ec2d5b2ebfa7f053f747097926c13fce7fa8628c5d14c991411421","src/z=
lib/trees.c":"f2a5f949ea70dde7c23a54c793aeed630a03df4bb72417cd3aa008000c446=
99b","src/zlib/trees.h":"bb0a9d3ca88ee00c81adb7c636e73b97085f6ef1b52d6d58ed=
be2b6dc3adeb4d","src/zlib/uncompr.c":"31922aa982ee12fd28d1ce5fe6a94a3f07c2a=
941c821b566a881ca21845cdfaf","src/zlib/watcom/watcom_f.mak":"7e039b912f9cff=
aa40835281430bb284fa9042b0a0d12f6b34700a06bca6576e","src/zlib/watcom/watcom=
_l.mak":"d11b4064604a034725860e63e3f6d347056372e4b1675b183e20a93533b20cc9",=
"src/zlib/win32/DLL_FAQ.txt":"9e00778319381e6275691dd3a89410c99065b8c0c5db9=
6473abe8c859cbdefd8","src/zlib/win32/Makefile.bor":"e878fed2313417db085fea6=
21c110889f6a32233b5b6db46e3c4e824c1d0ed6b","src/zlib/win32/Makefile.gcc":"e=
a8feddce7b9707253b9bf86623cf7ebe5294d7aea2b3b0b1b1c1b8cfd73009d","src/zlib/=
win32/Makefile.msc":"7c495d63c5afea1d77d162a41b73bab89cee952c12e4647e9684a7=
ac79bfc3f5","src/zlib/win32/README-WIN32.txt":"b71f1f4e4760812c3a11b2bae6f4=
0d1066741a90e6646010a32ce50a0e348cde","src/zlib/win32/VisualC.txt":"9ec0bab=
d46eaa012371dee2d3a8a55d9c7130f7895512c3371c737e4a7f6a997","src/zlib/win32/=
zlib.def":"24fa6dd00f3f4c0d14507a03ddbfa42707a04e3901bb9ff6f90096037a75185a=
","src/zlib/win32/zlib1.rc":"8fc5f2b5abee40ad66e6d6cfc9f926c2f446e13a7c9ee7=
df8bf58a266d8cade5","src/zlib/zconf.h":"9c0087f31cd45fe4bfa0ca79b51df2c69d6=
7c44f2fbb2223d7cf9ab8d971c360","src/zlib/zconf.h.cmakein":"d740b750e9c98e6a=
4b4529cc2a857a3fa8001514b1ce91e0e1d9d293652bf388","src/zlib/zconf.h.in":"9c=
0087f31cd45fe4bfa0ca79b51df2c69d67c44f2fbb2223d7cf9ab8d971c360","src/zlib/z=
lib.3":"5abef003e545566e5599e5ab2e7528e978be59d54546b19d763d062f7a69bac7","=
src/zlib/zlib.3.pdf":"7f0f633641d782e360eff9fe831716c5767faf1000e38382a8a8c=
65b0b67f374","src/zlib/zlib.h":"4ddc82b4af931ab55f44d977bde81bfbc4151b5dcdc=
cc03142831a301b5ec3c8","src/zlib/zlib.map":"7eb1070ba6bf12e6895e5da06b84a92=
af683827587afaa72bdd45e80b9d8e4e9","src/zlib/zlib.pc.cmakein":"2f1d0b18ce37=
c2af415a469857f02aee2c41a58877aff21d29e9c6db32b55cb7","src/zlib/zlib.pc.in"=
:"04c01cc2e1a0ed123518b5855f585c93a24526dd88982c414111ea1fc9f07997","src/zl=
ib/zlib2ansi":"d316e3e79054f5f9fe921d35f4bbf4bf0a37b859d29d2b34ae4d7d92afc3=
e55c","src/zlib/zutil.c":"f7fdc9ef326a2683eb33c794face54e83c751ec17f3d1ba58=
1847a62af36ddcd","src/zlib/zutil.h":"9a63f6690fac1620aa3cecee5752af618806da=
438a256b4a047fbcd289cac159"},"package":"de5435b8549c16d423ed0c03dbaafe57cf6=
c3344744f1242520d59c9d8ecec66"}
> ++{"files":{"Cargo.toml":"2f23b1493e2aa56abce67ae714f4ba088ac6b30b55c19c1=
56477e1788f515701","LICENSE-APACHE":"a60eea817514531668d7e00765731449fe14d0=
59d3249e0bc93b36de45f759f2","LICENSE-MIT":"34c467b6945a22696d060b8fdd2379d4=
64acb3408d4c599d3dc5fe4fa1b4c84f","README-zng.md":"237e65a2b90c6533e346d838=
e857572a82fe498753500fe04b7054dc261ca5a9","README.md":"97923429b45c95f22292=
b41d116452a4ce3df98d6960c89af30b3ec64c68b7bf","build.rs":"0b57c3a2c98c2cc12=
2ae00d7b45610e4f568f6960c823f23b69ef0682cc7fb33","build_zng.rs":"b7768e19f0=
bf876f29eabb6ad6511f530e61d8aa92bfbe89a7cf3818e4824ce7","src/lib.rs":"7c4a3=
394e17e6250c1f4f2067efecc56b1850827596432ad0ce75e5eea800446","src/smoke.c":=
"10607c81b73811bfcb9718767312bf97ba2ccf7048ea2f18a2085aa06ad7f91b","src/zli=
b-ng/CMakeLists.txt":"c3ccdac791fd8d34c720b336b60370545dfd66c642e78b2033eec=
c2273c160d9","src/zlib-ng/FAQ.zlib":"c524f4f86d336b3de71dd6977afddffa9c02fd=
a5c26db4dfefae44959e7614a2","src/zlib-ng/INDEX.md":"989545e90d8e9ac149034f7=
62ce78ed8976ebf9324326228dea37ca190154609","src/zlib-ng/LICENSE.md":"d3c80b=
e055d94d798eaa786116e84fa0b010bc11420b5d2060d978ea77845436","src/zlib-ng/Ma=
kefile.in":"774c8462cccbe6b30fc34d68490bba8e352e460c8ee2c3775d4d0767e228219=
2","src/zlib-ng/PORTING.md":"10d59c3195ee8c631bb29fbe75e7e11a84d3daf7ab9e2b=
e12287661ffd8fe1b6","src/zlib-ng/README.md":"c9f247270ce0fa8c823ce047e82365=
59127933fc83b16dc9a6863bbc983b6dbe","src/zlib-ng/adler32.c":"52fbdc52a7bf5c=
64baf5a7fe76f7255348c280c5b1bbb9bb674ced04a01d8fb2","src/zlib-ng/adler32_fo=
ld.c":"9ba56a7bbcf64ede61d8fa84de9f81d751ece311dc9a3e12470f794a6103316b","s=
rc/zlib-ng/adler32_fold.h":"c40114c2c742b6410e54b58ea02533fe6e9ae0ca62d3453=
e5d2a1725d33e2be4","src/zlib-ng/adler32_p.h":"3d44f3d9296dfcdf203b5c4e4a8b0=
da0551365970ceb882715c7140ad061a90a","src/zlib-ng/arch/arm/Makefile.in":"e5=
23b6c87b928e2dddcd04793bc79b5829304cf51ead713d743af740ca131b37","src/zlib-n=
g/arch/arm/adler32_neon.c":"60608f4cc48bcebced93947ba7a75f128876352fbfc2b15=
21d25ae00b692c244","src/zlib-ng/arch/arm/arm_features.c":"bc8a5f0b1f80a05bb=
a51b851a4be941c75c38e4800840b96097eae57cb7a5bdd","src/zlib-ng/arch/arm/arm_=
features.h":"7534eb55b3551123c9a51ca8dcf771da0c1bb21be07e0c00292d156d96d552=
38","src/zlib-ng/arch/arm/chunkset_neon.c":"bad43fd303a538ae5b7d41f8f2b0c84=
915492ebb32abd7528d074501a637cf83","src/zlib-ng/arch/arm/compare256_neon.c"=
:"d87660d69cfc4bdace50cc9f08ffd42fec71e3281566b9b58c1d83008e6fe6f3","src/zl=
ib-ng/arch/arm/crc32_acle.c":"921f1278e2130bf69b7572ed5bda13df3ba472948e390=
b1dbf330a1daad1736e","src/zlib-ng/arch/arm/ctzl.h":"feb70d55e66025fff806e30=
e48002b35cfff79533d352585cfa5f118edbc90b1","src/zlib-ng/arch/arm/insert_str=
ing_acle.c":"337e420632ac14620dba851923c35a882e532bc445a9b10330f3a8dc6ee32e=
c8","src/zlib-ng/arch/arm/slide_hash_neon.c":"b455b2ee60899d97844317f4c80f5=
22a9f611258b9500e6de810e94433e933bc","src/zlib-ng/arch/generic/Makefile.in"=
:"f41a34839986eac8dd52cf91fada0efff4171c059ab5d7db6347c91bd6d9db09","src/zl=
ib-ng/arch/power/Makefile.in":"292f34d0dabe1658a9cac8c7f303b3d311b0d18a0cb3=
8b7fc69abd9d95075df0","src/zlib-ng/arch/power/adler32_power8.c":"f39c4c5f0a=
ded59e2b4986c151b70edc32f976c2c82185540164af52e2158bb2","src/zlib-ng/arch/p=
ower/adler32_vmx.c":"f6f9fa89366b742b27bad122a6a96948efd6fb95a4de3238fbabe3=
613e6f9251","src/zlib-ng/arch/power/chunkset_power8.c":"4f3df226e8969f472e5=
17274c0b940ea0a6cf3980326d2d85cd09b325f37502f","src/zlib-ng/arch/power/comp=
are256_power9.c":"d136d4eb79d9b67cab11048c56439531755da9c292fa13373a8dc0a40=
239368d","src/zlib-ng/arch/power/crc32_constants.h":"d73e3b9025de9fade7fa3b=
a2bbf5f56a1499a84c53d8ca7f5e744a0714d8599b","src/zlib-ng/arch/power/crc32_p=
ower8.c":"88919c3c14bd8124c112bfb6bafb2d526870740cb2828f14ccde3a9b866308aa"=
,"src/zlib-ng/arch/power/fallback_builtins.h":"78a8da60bad8ba01278e49548210=
8adabf9e96bdb214e869b61ab1f63f518c9b","src/zlib-ng/arch/power/power_feature=
s.c":"369683c1e792f783f91d72f4046d24623f9bc015edc13146476ff04fb030ca44","sr=
c/zlib-ng/arch/power/power_features.h":"d755ee6ca0e804ddff2639d098e355a5201=
d01c8bee8e1bd9e98bf6be7774cf1","src/zlib-ng/arch/power/slide_hash_power8.c"=
:"05a858c9a35d58c933becb3e1848310a0bf50899d6d8829127789747fb0931fb","src/zl=
ib-ng/arch/power/slide_hash_vmx.c":"e8bde875deff4d61e777d7e56853ef7b3a71897=
97ade5c6dfef9fb202930294e","src/zlib-ng/arch/power/slide_ppc_tpl.h":"c8900c=
594591e1aba3188f97c374e5561fe1e96f653c668352b25647e449f4c0","src/zlib-ng/ar=
ch/s390/Makefile.in":"e20982f40349d7b0725c5b908acb9a7f3a4c45dc4f329fab80b56=
b1538a2b7bd","src/zlib-ng/arch/s390/README.md":"892908181f6bafde706e70a64c3=
12ccf18a300a56045ea1010d6b6bd04ea1d1b","src/zlib-ng/arch/s390/crc32-vx.c":"=
353355c8a1819064ff8db1e53ac0906c5ea7e0bdc303e200382a85a299ef209c","src/zlib=
-ng/arch/s390/dfltcc_common.c":"cc90250cd04e74c432496e0658e94708fe267b1a799=
df8c2cbc1f6b5d6d23a9e","src/zlib-ng/arch/s390/dfltcc_common.h":"c17edda79dc=
82aaab399cc14c3a7c2dfc021e152286d3841272a337d6c404df9","src/zlib-ng/arch/s3=
90/dfltcc_deflate.c":"9cb59560fcfc7828139372d3ff27386f85acb12595274e6ce99f8=
c4d9a4abbd4","src/zlib-ng/arch/s390/dfltcc_deflate.h":"e8077ba0f7097438ee43=
d7d514bfb323069bd979aa15c1f708ce1cee69ed6980","src/zlib-ng/arch/s390/dfltcc=
_detail.h":"859e72e270c1f6da668aa199f331b328df65d5d86410ba5c1e6ef8442263d6e=
c","src/zlib-ng/arch/s390/dfltcc_inflate.c":"7b0a443f7aef6044c3180166cb228e=
4c4d1a1026ce085b3ec7e8f1d2128ca777","src/zlib-ng/arch/s390/dfltcc_inflate.h=
":"478dd9d731441a91fbb287dfb31e37ba8f7d358a18f9a46a5c3a2d7a65022157","src/z=
lib-ng/arch/s390/s390_features.c":"92e420580f060d570e0b0362a7d6e80dfcadddfb=
e4ebbade263cc9a561434785","src/zlib-ng/arch/s390/s390_features.h":"4147b506=
1f4376d85256673c8ff0492b8efd69add35c345cdbb47d9194b13b91","src/zlib-ng/arch=
/s390/self-hosted-builder/actions-runner.Dockerfile":"ae43b34a5d4d75acb392a=
974de1af1561e55424bed0dfa19a2cca7bd38dafa8e","src/zlib-ng/arch/s390/self-ho=
sted-builder/actions-runner.service":"62a19075adeddb3bee57bbac81c7acadacbf9=
c288e2b497e36ff7f2b3daa7558","src/zlib-ng/arch/s390/self-hosted-builder/fs/=
usr/bin/actions-runner":"f647e18728ea15fe927ac9f8cba83a5b343654a0e91b5ebe65=
3bae7af7375110","src/zlib-ng/arch/s390/self-hosted-builder/fs/usr/bin/entry=
point":"add4ebdc4f06ed15bb1de12a8c9ceb370a60baebb0932a1026a75433940ad3df","=
src/zlib-ng/arch/s390/self-hosted-builder/qemu-user-static.service":"545510=
49f6181da88700a2a944a72b0af3b8abde876fa28e1348deb5eb96c91b","src/zlib-ng/ar=
ch/x86/Makefile.in":"0a681b0a6d396cea593bd8c4a854c5d1bb742217958e2a6a663a4c=
ca051cc9e5","src/zlib-ng/arch/x86/adler32_avx2.c":"7d653cfa7d363c37c93b065f=
9155939ffcaf58ef34a1a3b1d26a7f6c7de3829e","src/zlib-ng/arch/x86/adler32_avx=
2_p.h":"21790ad0c770a93f8bccec160310b55a322418bed79f51d054d509925f316cc3","=
src/zlib-ng/arch/x86/adler32_avx2_tpl.h":"28f7889e7f77ac7a43376a5a93bf84da7=
596762b8dc5eaa941fb3b0a7273ba27","src/zlib-ng/arch/x86/adler32_avx512.c":"2=
7f3a767de2529b03173d5e8ffe9cae61c3e0807aabcfc9c5c92047a576b6a1c","src/zlib-=
ng/arch/x86/adler32_avx512_p.h":"1b4beda11693ac03e4b20e054a765df427f845a279=
bce547b8208d20f5a302bb","src/zlib-ng/arch/x86/adler32_avx512_tpl.h":"e7ccc2=
59237a1f59bae475db8c00fc82f2c8fbb581273265a7dec5b394d97124","src/zlib-ng/ar=
ch/x86/adler32_avx512_vnni.c":"1dbc4d42f2af3912f2c42d0c8fe454fd953a07dd70ae=
105e07a09442b506fd0d","src/zlib-ng/arch/x86/adler32_sse42.c":"d5ed7a9f9100c=
bf0c7dd7b893e8b2425a890bd991fcc1cf63cd3a0e24093fcae","src/zlib-ng/arch/x86/=
adler32_ssse3.c":"0eb8c72796a96dcec4080423ce9b467e9047eaabc7a0eeffe1155e93b=
2e73d1b","src/zlib-ng/arch/x86/adler32_ssse3_p.h":"c6e22c4998c80bf2b3c489ab=
d60e819a17a8c5ec2411a6d2d5c5396484f1dce2","src/zlib-ng/arch/x86/chunk_permu=
te_table.h":"566181353c16e929fcd25621ee629dcac23477fdd2862eea3a7239b7637065=
3d","src/zlib-ng/arch/x86/chunkset_avx.c":"dad1bdae1c7d004ee750391f25489c7f=
b78276dac25f2e2990cbb40c3cc6052b","src/zlib-ng/arch/x86/chunkset_sse2.c":"2=
695d3f92eccafb4401afaabfc84717aca693cc04fd6d85988f3b8592a831b70","src/zlib-=
ng/arch/x86/chunkset_sse41.c":"25398da25f5b8f7dfadf80e2a9af58674942720b6f46=
f46854548e3d68e68000","src/zlib-ng/arch/x86/compare256_avx2.c":"2516d00faa6=
939e61dbb0978a9c4c81f9e3a42fd053b2a2241673da7cf4fc781","src/zlib-ng/arch/x8=
6/compare256_sse2.c":"3b983708034f33b5da49f6f5041351a2e66358c76645c552f6e4d=
c37fb890a80","src/zlib-ng/arch/x86/crc32_fold_pclmulqdq.c":"9cc84730392139b=
0cb50f4b51a6391cb1da3cc2b200a7b5dbef638706d1e0866","src/zlib-ng/arch/x86/cr=
c32_fold_vpclmulqdq.c":"439559e134b7a7366d05f8850f1974a9caffea7036356562973=
acd72050d1d58","src/zlib-ng/arch/x86/insert_string_sse42.c":"1f093e32f3b717=
04f2bad3468adf790741870398634647b7aa0bc1b3430ef970","src/zlib-ng/arch/x86/s=
lide_hash_avx2.c":"9740a36bb4dd90f40394344026be9a13f3acb6e85e6b7681c30fd7f7=
cbf8e28e","src/zlib-ng/arch/x86/slide_hash_sse2.c":"fa009305a1c82708638dff2=
5e037067656350303b25f5774489417e096c30ecb","src/zlib-ng/arch/x86/x86_featur=
es.c":"05d9cd4164771147bf5a75754cf60ba05083c3b9842c590ea527c8ae44f1ca85","s=
rc/zlib-ng/arch/x86/x86_features.h":"76df96d3b077fb9697f2d0a8598fe657688025=
faa849e4c12d717c4966efb4ca","src/zlib-ng/chunkset.c":"534acd20990af9ed52fe9=
effcf1a6aeb1d5c5a3226c38dee9c007bf5aa7e7266","src/zlib-ng/chunkset_tpl.h":"=
563f55a12daf6b921df8ebdda8d0e5818e1ce532efbd81faaf37a7a275c2a4c4","src/zlib=
-ng/cmake/detect-arch.c":"4fff00beb2b207c87dbff81619583858dbb4120b86c114b7d=
a8f48979f687bb1","src/zlib-ng/cmake/detect-arch.cmake":"27fa8da497b39ac70d8=
81e2d345749611dae4c30f7b7a9c9e32f2c042672189a","src/zlib-ng/cmake/detect-co=
verage.cmake":"4664d51152d51282ae50621f4d510ab72cf8978b266c614b7c5361750db6=
d1a9","src/zlib-ng/cmake/detect-install-dirs.cmake":"87031a40428a104f5cf38e=
cdb8a5028d8c679cfa772a58adde8380c809b34eff","src/zlib-ng/cmake/detect-intri=
nsics.cmake":"4c7101c25c2cc8c724682caa6525a9ddfd74b71ad96ea0e6bfae09ded86af=
a57","src/zlib-ng/cmake/detect-sanitizer.cmake":"a40650743dfd0b56c2afbfadb5=
3e5d1470ef48852f2fcdf51084b6485534f87a","src/zlib-ng/cmake/fallback-macros.=
cmake":"a8c8f70e5483177280cbebf99f929a7cf5ffe2b79fedb79eed570ecafc78effc","=
src/zlib-ng/cmake/run-and-compare.cmake":"13d85c12c9d6c7b1b148bd0c5a5b4faa6=
a4b56f3823bf03c4f8d914c9c5949d8","src/zlib-ng/cmake/run-and-redirect.cmake"=
:"7f08d18c09aa58113882ec760735a62a1723a5bfcae9f73bd3713a4dbaeab898","src/zl=
ib-ng/cmake/test-compress.cmake":"612f70af2d51b33f70f8c9e0655915a5648803a6f=
c36f138f9daafdec248a77a","src/zlib-ng/cmake/test-tools.cmake":"63aabfffd539=
70b8e145870b2a1c03bffa3595f7df04bd86f94e97b6f2a387e7","src/zlib-ng/cmake/to=
olchain-aarch64.cmake":"46be0bf580a49a528c72005484655afad1de3705b39a66a7b0c=
213b0fa81cee6","src/zlib-ng/cmake/toolchain-arm.cmake":"05e38076fd6ffb9785f=
f9844ccecd26436c9dc4c25b7777b62e5f52e788c3882","src/zlib-ng/cmake/toolchain=
-armhf.cmake":"1a2029163a57415eec9a5dd5f45d3254d349e97b1beb5d16876b74171767=
3341","src/zlib-ng/cmake/toolchain-mingw-i686.cmake":"b6c48f9d4e4c28480336d=
65ad43a2bef6625df342ed09dad043ee7dc50292851","src/zlib-ng/cmake/toolchain-m=
ingw-x86_64.cmake":"e9d16d3730e48cb27f4d9845f0de6f864231908cbe7c851011a3441=
8e34dc646","src/zlib-ng/cmake/toolchain-powerpc.cmake":"9bd6fc58ce5b7060365=
7f2c195c4a5cf52fae96ad63ac787978831c5858f762c","src/zlib-ng/cmake/toolchain=
-powerpc64.cmake":"917fc5eef84921d8b38f43c2b4f60870965b4eecc8f018c7b3499e11=
42c715af","src/zlib-ng/cmake/toolchain-powerpc64le.cmake":"5b2edd36d62de513=
db2d32bfbf779979d81ac527b981cc3379a4e933fc5a94d1","src/zlib-ng/cmake/toolch=
ain-s390x.cmake":"cf52cecea7bd2a9d1ff5fd8edcb03c531e3b404bbcd15a15dec2e0e19=
936f2ac","src/zlib-ng/cmake/toolchain-sparc64.cmake":"e543062485d06a7e0fec8=
135887c5e73363517fa4babc23ef7b780916d75afda","src/zlib-ng/compare256.c":"a4=
a56d315a5756463d2cd9d76b1abf01fa3e323b6627a08bdfde97387d98e0b7","src/zlib-n=
g/compress.c":"a4f9aaeee845630db7adc7655850e904338a4426286884eb16ffd50956b0=
83ac","src/zlib-ng/configure":"a2e86f4361d97bf15faaeab23bc3e58f1ee91305c7bf=
2ea411c07d91350f1bab","src/zlib-ng/cpu_features.c":"067cae566bfcc42129b89b3=
110a6783f206afbc6b085efa9e012f0d18ea749e0","src/zlib-ng/cpu_features.h":"ba=
ba2e5301d4a0da588195eeae4f6f92bcca5af61f2ac9340a091c2723de71be","src/zlib-n=
g/crc32_braid.c":"4fee7f46585a9f5d664418d7f62de919716c19748cf14177da844448c=
76dae89","src/zlib-ng/crc32_braid_comb.c":"ebcf0b2ea5080afe155020c2541f3fdc=
15173484211851c8acc903ba83ecf0c4","src/zlib-ng/crc32_braid_comb_p.h":"6c803=
5e05d30a6241be55467fc59e4d7deda6b618b955a11339ffee08a39c75a","src/zlib-ng/c=
rc32_braid_p.h":"4953f9c0100d0a435f3237e3a46b826fecbd8b0a50acdd6fab2270d0eb=
bcbbaf","src/zlib-ng/crc32_braid_tbl.h":"e22af112e3c1c8bb4065d39fe678eba71d=
d08893eb06f9414b02f4cf5a6f46de","src/zlib-ng/crc32_fold.c":"04aab2780ff42ce=
133613a3d92b151561e2a5d4d447cebc57c4fdde3cd11949a","src/zlib-ng/crc32_fold.=
h":"4799db97dbdbbbdf9757d1b0263998d88676678211b22fec59e8416980090e9b","src/=
zlib-ng/deflate.c":"d442202e7f63a9eab0f33223697c8091196c56e1a392ce20dd48d71=
b73928987","src/zlib-ng/deflate.h":"79f6002f4765507a82f77576a0b2ced6dde776f=
e2882f402a29b060a8798b956","src/zlib-ng/deflate_fast.c":"9d87443601e57ef180=
fa1e11a788f1f8cf85af363f6db38c2ce2cc27e0d113fe","src/zlib-ng/deflate_huff.c=
":"9bb6b2e3d84831bb00f53f1a0a588f8c066bbed59a07f7d96f186627cb22092e","src/z=
lib-ng/deflate_medium.c":"1f53407841a4a3f489ff6a447703965df1dc18f28a6791953=
7702d2f269c7e8d","src/zlib-ng/deflate_p.h":"f53d2a6c3c5e0fa5be89dc054d4b7e9=
b49a3e95646fac6500c1e824d79dcfd62","src/zlib-ng/deflate_quick.c":"a7a80b9c1=
d0214974407b15df42d2863c21dedbd79254ee834fd85fe0b952fa1","src/zlib-ng/defla=
te_rle.c":"657e5988b88209169768fe6a7ae5e1ad768cbea550b37b360d9cacdc2ae31385=
","src/zlib-ng/deflate_slow.c":"e4c78f7a57e3ccd91cd45b7af44bd45d564872796de=
89f6f2538ff7493448c2a","src/zlib-ng/deflate_stored.c":"7ec2694ca9f6b40f7c2f=
876f80e5f0d7d911bf59f9a8e5d401dfbe204a258ff6","src/zlib-ng/doc/algorithm.tx=
t":"0d21a0a4c47e512743389628d1385a831a5e5ff716491095a382b923287f4223","src/=
zlib-ng/doc/crc-doc.1.0.pdf":"064f9252d6e2e15ea56c2bd18e160e5c9c84bcd137c11=
a7af497aaa511ace998","src/zlib-ng/doc/rfc1950.txt":"8f0475a5c984657bf26277f=
73df9456c9b97f175084f0c1748f1eb1f0b9b10b9","src/zlib-ng/doc/rfc1951.txt":"5=
ebf4b5b7fe1c3a0c0ab9aa3ac8c0f3853a7dc484905e76e03b0b0f301350009","src/zlib-=
ng/doc/rfc1952.txt":"f7c810fd9d719d002d605207a9b880600f71d039b9626c5b4b03f2=
122438dd2d","src/zlib-ng/doc/txtvsbin.txt":"47c273bb22c9773248d380549a330e5=
c262266b1292154b0d3014f731cc73f47","src/zlib-ng/fallback_builtins.h":"6864b=
7d0d11bad111895c812ef499c63ad4aa8b7fe86b16d0252d945534ee988","src/zlib-ng/f=
unctable.c":"2be51a15f7424225a6164ec3e736a4c56191645eebcea95b19e16f070e45a8=
7d","src/zlib-ng/functable.h":"d82fc549205db848e74f5d23c91ae4d00114edae6559=
0475ca15ec845a49059a","src/zlib-ng/gzguts.h":"8f7a66046f75e3c5f36fd8ccf2b2d=
95eafd0d2cdecba145612ca776b8eeac460","src/zlib-ng/gzlib.c":"7e6ad5d9d32e642=
9d56a5303e2c6e6870d69c023d6647a52fb95902828de4011","src/zlib-ng/gzread.c.in=
":"9c20e0435055175ccebfa5dec217b22210637ed8cc06b53e21d02025f3a0ffd1","src/z=
lib-ng/gzwrite.c":"f8650a2d2a9daa2f523c53ee8ccc420f0f3521b8d44c6829a5805da1=
f59afaf0","src/zlib-ng/infback.c":"5f6446584e95d961de0d75b4e04b9452ec03e957=
47fa7d79a53db71c900dd90c","src/zlib-ng/inffast.c":"dd20040aae76a1e857f27cfe=
55460e9a7c16df0719b2e0ca241af8ff4967a2f7","src/zlib-ng/inffast.h":"42e74a92=
b496ab0726be317e8497a12bf3c3cf3d0d533440ce65befd3929c71c","src/zlib-ng/inff=
ixed_tbl.h":"a94225335396245e9f0ccb2e9b4b334fe7ee0111ed8e32a26bcd52187f3643=
14","src/zlib-ng/inflate.c":"861d7a20ef1da8b8d9835585a29ddaac1e99ff31a1a36f=
3079c240772ef953a3","src/zlib-ng/inflate.h":"c82dff42121e0f0e6e0fab1f9bc9e8=
c43b60bb38ec10a3aa15f0417e54c791b2","src/zlib-ng/inflate_p.h":"3dbb8bf4f6c9=
5a51718533851730b1d0d79bfec301102f8a9fd9f903426b297a","src/zlib-ng/inftrees=
.c":"4afec770066911de89f90c1525f87883ea0a9eda672ae9758144ee1839d93f50","src=
/zlib-ng/inftrees.h":"fa80eb11c2290b345470a03cb861843e2cb1365135233ea8243e9=
fd79d3618a1","src/zlib-ng/insert_string.c":"7a9455cbb3ca8fe6e7111471b9f4c0a=
32fb49a6d0ec589b027dc2cb2b65c8dce","src/zlib-ng/insert_string_roll.c":"4d05=
f19591a5c29d2da398e10e9d0b050d738cc8838d8dda4beb1cc7281ede07","src/zlib-ng/=
insert_string_tpl.h":"45889b69063592591a55d246cb418a50f8891cc7bdb86b21b46b2=
03bc175d60e","src/zlib-ng/match_tpl.h":"03783f06ae132ea36d23420c3348e4a5152=
d8014159da6849ef77a1de96a99c4","src/zlib-ng/slide_hash.c":"97ec270b4c744a9d=
ee638081e47807bc7340f859f9aa22e4acf4599fdb45f39f","src/zlib-ng/test/CMakeLi=
sts.txt":"8c36c775277a6e8dabc7e256ac4631308d5c0af2f585212f904d686d0d0c6bde"=
,"src/zlib-ng/test/CVE-2002-0059/test.gz":"60bf96b8f433bd7e057ce3496aceaccd=
70ec80f596a4aa8bcc7786056705ce66","src/zlib-ng/test/CVE-2004-0797/test.gz":=
"38caae524705f676bde13a8df9fc8c7d2fe105ba6bdbab62a405b0276fd3aa2e","src/zli=
b-ng/test/CVE-2005-1849/test.gz":"e4d5a60617df4b5dd44eda94751ce1eacdb325792=
bba6e3cc4676719a3adf742","src/zlib-ng/test/CVE-2005-2096/test.gz":"8f702d48=
61aa3ec98ac03a59ff26b430939630cb5cd4266d2658d3b836d576f9","src/zlib-ng/test=
/CVE-2018-25032/default.txt":"d7f8278db331c47bd1208bf41e7903cbddee4f7b47c66=
6c40afdd3c96237752e","src/zlib-ng/test/CVE-2018-25032/fixed.txt":"3b27a98ed=
d2f3f580033f9add11d3469d7808c969a1128ee00c18ac7a12cef57","src/zlib-ng/test/=
GH-361/test.txt":"358497d0a7251ea42101dc77b02337f46fd89af09643a8288e2a3082e=
5d24128","src/zlib-ng/test/GH-364/test.bin":"af5570f5a1810b7af78caf4bc70a66=
0f0df51e42baf91d4de5b2328de0e83dfc","src/zlib-ng/test/GH-382/defneg3.dat":"=
b22bef6b7392401c9e7b079402c4a4074053d7a914d050400e37fd7af6fe26d5","src/zlib=
-ng/test/GH-751/test.txt":"b83d833803b7bc3124fb2a0034081f0b999ad10c33a8dfa3=
bfd181dc078ae3ee","src/zlib-ng/test/GH-979/pigz-2.6.tar.gz":"2eed7b0d7449d1=
d70903f2a62cd6005d262eb3a8c9e98687bc8cbb5809db2a7d","src/zlib-ng/test/Makef=
ile.in":"a6b0a02967a93d78f88d705cdebeaec7e3ce85ff2bc65e30e80324ccff29f7c7",=
"src/zlib-ng/test/README.md":"6a34f8fc7a0144958cc9a0cded46fc38a7e15aba3dfa5=
bf56d8d86c3fb72d82c","src/zlib-ng/test/abi/ignore":"02aa87f77656dbc1fbddd23=
f436cd15465a92df0722da4055cae1bc8bf013097","src/zlib-ng/test/abi/zlib-v1.2.=
11-arm-linux-gnueabihf.abi":"f5e91f25b558a891fecbeb6e2e9575698630ab700d055a=
38f3bc4fe66257f513","src/zlib-ng/test/abi/zlib-v1.2.11-x86_64-linux-gnu.abi=
":"038337383cf780587d810cf5400d632f3a1f8517e63ac4a71b6e5224db8b1413","src/z=
lib-ng/test/abicheck.md":"d960023cd80e04b2d4dcec8cdd3315c7292229d45a3301a5d=
c5213058ba22185","src/zlib-ng/test/abicheck.sh":"7be2e4774543a1c018c6024fa6=
85de2ee3cdcf06ee6419e04b23249e0fcd6645","src/zlib-ng/test/benchmarks/CMakeL=
ists.txt":"0eeacc3b19579d75fbd6a50cc1ad980a6daafd99e92474b156ae2e57b235039a=
","src/zlib-ng/test/benchmarks/README.md":"2976b327e44b0066ae197b15bc0201f4=
e43375019718714f05acf50f9245f9da","src/zlib-ng/test/benchmarks/benchmark_ad=
ler32.cc":"65d98c8fa2b24bc9fe2335159d030c2f8cbd0a4af38bbb9e823b3fafaaa93c65=
","src/zlib-ng/test/benchmarks/benchmark_adler32_copy.cc":"6a5cd0ab97ff46c5=
b67e85abed05b28a4a8d7d5be50e8b8aa66bf47ab49acc06","src/zlib-ng/test/benchma=
rks/benchmark_compare256.cc":"faf9dd6246d453005c7a14638abb9833db40f06011025=
4eb5ff1739fba170e3c","src/zlib-ng/test/benchmarks/benchmark_crc32.cc":"33e1=
4b97607f17069c64351564baff8d8d86c969baae98073491d986f0731a99","src/zlib-ng/=
test/benchmarks/benchmark_main.cc":"b23f1419d7c6f6dadd63fe69afcd54d4821aaf9=
5782145f3feb65d5d8564233a","src/zlib-ng/test/benchmarks/benchmark_png_decod=
e.cc":"e9485de5e722ef1b62131a27a98d2cfe668ee8becbd5fc9938972022e07c8d60","s=
rc/zlib-ng/test/benchmarks/benchmark_png_encode.cc":"4b2203af2ef58f95773ca6=
d82569f747f2cfb3c4116334871cfb255a0d7741e1","src/zlib-ng/test/benchmarks/be=
nchmark_png_shared.h":"23427ba4e9865ee362990c22a1aa88e868a1ac1f4024892c6b6c=
2a3102566a93","src/zlib-ng/test/benchmarks/benchmark_slidehash.cc":"061d803=
01e2c016f0e29b04e545b7785eadc5106c6ec431ab1a721628d8c8cd9","src/zlib-ng/tes=
t/data/fireworks.jpg":"93b986ce7d7e361f0d3840f9d531b5f40fb6ca8c14d6d7436415=
0e255f126512","src/zlib-ng/test/data/lcet10.txt":"1eb5d7bddb1c3cb68064d5b5f=
7f27814949674b6702564ff7025ced60795a6d9","src/zlib-ng/test/data/paper-100k.=
pdf":"60f73a051b7ca35bfec44734b2eed7736cb5c0b7f728beb7b97ade6c5e44849b","sr=
c/zlib-ng/test/example.c":"f84aed9043e995123728c6fccab2d9b2da0439962b590277=
5c9e29a9b06806a3","src/zlib-ng/test/fuzz/CMakeLists.txt":"e9d833705121d8f6c=
79efb5dc3b8a8acf909837c70f3b3fe610228575ea72b0e","src/zlib-ng/test/fuzz/fuz=
zer_checksum.c":"68ed79ec1d7fefa548f4d32ab7885479442520cdf53ad59eadfae13e4b=
15efe0","src/zlib-ng/test/fuzz/fuzzer_compress.c":"3f507a18710fb2a1d87fde5c=
f3affc74b53a689e9d2ce6f887ee64eb778e568b","src/zlib-ng/test/fuzz/fuzzer_exa=
mple_dict.c":"46541ed3ef9bb7378120d47133f18b4194e955e7a84a439647205de68e745=
c08","src/zlib-ng/test/fuzz/fuzzer_example_flush.c":"393e7872825bb1ca366d0d=
8552b94442511ed4a557db6ece16540b79b7e9cbdf","src/zlib-ng/test/fuzz/fuzzer_e=
xample_large.c":"e3b91b1ced83dfe538e8ae5262f1756181a7785e8c2ab38ac2881456bd=
562277","src/zlib-ng/test/fuzz/fuzzer_example_small.c":"de9f5dc318240575034=
1a0f44c37bd8ba4f21d993284456ba8e6ce3e36d6b9b3","src/zlib-ng/test/fuzz/fuzze=
r_minigzip.c":"a02628aa452d9eb0ea42bf3c01b005a6569da50c832b78f90a1dec425bf3=
c677","src/zlib-ng/test/fuzz/standalone_fuzz_target_runner.c":"e6170b744faa=
68bf2a414e99fc87accf4db2a5e0eb58b17aded5c692ea493604","src/zlib-ng/test/gh1=
235.c":"8310ef780dc483a1708750cd7c120b8e9cc0e1614767d24c01869e529074e981","=
src/zlib-ng/test/infcover.c":"b4a4b659b2180fbfe0178940235eb9773508a7794f9d2=
7c758e0ee8f7971d85a","src/zlib-ng/test/minideflate.c":"56d3f2a8b72cbce8f58e=
4d26591cceafed58c5441a1efffc619c3baf27be8e13","src/zlib-ng/test/minigzip.c"=
:"3c2a2bfd67c1bffe9cf55ef2e15648aab7a209a6546beeb4df0c27f6cc7cae53","src/zl=
ib-ng/test/pigz/CMakeLists.txt":"aa70f1025adc004985bfe0accee9b7a80e04786d82=
705e27c377a5e8d4ecbaaa","src/zlib-ng/test/pkgcheck.sh":"75b3155125f235e27ee=
434d76b6f72bd825899b55f6d59ef2d032fe67a2896ed","src/zlib-ng/test/switchleve=
ls.c":"f4c482766b2e85ebdfe74ab488b16a4e807d5894dce2cfc5a0501c347db211fe","s=
rc/zlib-ng/test/test_adler32.cc":"1b53271b0317c4ac435fb7f1c430fbcce00413645=
96b8658b2d4ef4ced04a28c","src/zlib-ng/test/test_aligned_alloc.cc":"2728bb53=
528f280830b63ad5abf2674227cce8ae7840b5a4c4841c73d95ec09d","src/zlib-ng/test=
/test_compare256.cc":"1068f9f8d20660429a224392112dcbfc45fca5eb5116d31e61fb9=
8a9d3f28389","src/zlib-ng/test/test_compress.cc":"2e0b0c8435ca89dbf827f4c1e=
00874ad52743703644143dc8823ac5699507a36","src/zlib-ng/test/test_compress_bo=
und.cc":"6cf532aba78cfad2b453a6be96de3afa1e1ff49f062d376615e6f7028cfed14e",=
"src/zlib-ng/test/test_crc32.cc":"c111ceb33473a2514e6df5fb0abc4f495e13f7a8e=
37255476ae0ef3d7e75decf","src/zlib-ng/test/test_cve-2003-0107.cc":"629f1fe6=
59558c9deb767b3fbbb615539b0458f8b67a405ece924cac6bebb531","src/zlib-ng/test=
/test_deflate_bound.cc":"5bd722e6749612b714bef7dc8dc183759b629e8afa8f068415=
378e7ff7ac12d9","src/zlib-ng/test/test_deflate_copy.cc":"1a286ba7772bb1a6d0=
6233b075a83f3f1814bab2fd7d3757c090f5db25db90f1","src/zlib-ng/test/test_defl=
ate_dict.cc":"344613040cb70d9f6ba6a3c40c0ef452644f9656c43f1e0969b84f487e4e3=
db1","src/zlib-ng/test/test_deflate_hash_head_0.cc":"3144479b7d5b9f3d4ad2ff=
2d43dbce5b3e7043acd1ae5b06d6ce8db6e98c8573","src/zlib-ng/test/test_deflate_=
header.cc":"93bf9a4099540d47fe01c07afeb8dbc37a5551076c98df1dca2b9b5e96aa813=
1","src/zlib-ng/test/test_deflate_params.cc":"3701da15960c0984373cde19d1459=
6c26911679e0b95e5261cb8515f65150b65","src/zlib-ng/test/test_deflate_pending=
.cc":"faeeaf37a8aa2512e8551084a20c41181910335021961728be26f568c7f68cf2","sr=
c/zlib-ng/test/test_deflate_prime.cc":"6c83e5563d00d05bf62ce0e7bc1ccb78cd08=
0c1627b2a3bc878fa2c2b11986aa","src/zlib-ng/test/test_deflate_quick_bi_valid=
.cc":"9706d0bf9d844b21f1655498bf0f9901c7dfc272cdef37f2d1af238c71df611c","sr=
c/zlib-ng/test/test_deflate_quick_block_open.cc":"30e81885917d8414faea99f74=
ed178790ed7c2884ef231d7f144f9fa32f993c1","src/zlib-ng/test/test_deflate_tun=
e.cc":"dad52ad7941aca761ff177877a0d60f1b68b3a6d28a8f4bd382005f3c04bad64","s=
rc/zlib-ng/test/test_dict.cc":"2bb6c32ec0ea76561172e0b5e8c6a7bf4f64efc2b415=
34b42ec1d6c3d0990897","src/zlib-ng/test/test_gzio.cc":"2b811ed1927015decb44=
70073b59f85f6e405559eae044b5eeab545b8a492bbf","src/zlib-ng/test/test_inflat=
e_adler32.cc":"f4c1e9f88cdbbd672cff8bef2eab8c01ddb598494d1ade07d3f3630d1916=
9f6a","src/zlib-ng/test/test_inflate_sync.cc":"fbb1121ea5b5448723c6d6d86921=
10c7362e6833fae22afcd46909d4ecb1289b","src/zlib-ng/test/test_large_buffers.=
cc":"168eff24816cb28e2b49188012cfec9ac474b01e83c5bf8ae602f010f100fb61","src=
/zlib-ng/test/test_main.cc":"62e058cb2a411010796c5e69e55759fccadd8ce49fcef6=
884a9cd9b035d054e8","src/zlib-ng/test/test_shared.h":"c11e53b07ade7065e83bc=
92e812a0af56d6202b40bcadf1f4473cabc152e2579","src/zlib-ng/test/test_small_b=
uffers.cc":"680ba24dc58c7dd05e8dab2e430a8e0c99b946cbc341a5fb39c4b4b921b6fb3=
3","src/zlib-ng/test/test_version.cc":"8599eca8dd63a96962a5c8ac01a3172d203f=
9065e228867928ed4bce61cf6009","src/zlib-ng/tools/config.sub":"32186cfeb5db6=
2c99e1dfbfb07f24c1a50977447b4c26d2907021c74422a70d2","src/zlib-ng/tools/mak=
ecrct.c":"6194908f8f810a626f3183c379b067e9b1897b88276ecf9011590a21a43a1a78"=
,"src/zlib-ng/tools/makefixed.c":"bffd02540231304f9bcc755b8cb9ae5cfbc489758=
57bbb4547f1d6acce21ef57","src/zlib-ng/tools/maketrees.c":"3ea81e69ac0767e47=
9e7065662e4f6a4e6f528acb78c86968945017357f802fb","src/zlib-ng/trees.c":"e4e=
ac691fe9e535e2d0582f326d5f0cd8c216265716e848b6b9d5f94e881781a","src/zlib-ng=
/trees.h":"24174f3543b01ee1ef370bbf6d15551a21871cded18b2aadf09a71e7904b6f99=
","src/zlib-ng/trees_emit.h":"6c541dcf01eecf393d4eab7800bc558ad524114bb5a8d=
eb86f13376fbef88754","src/zlib-ng/trees_tbl.h":"022736ff3362ef3591d1f8fc3b7=
fede5927c0d25ab0813d7ef8cd95efd6ea242","src/zlib-ng/uncompr.c":"1656c770b8f=
7455bd5ed3cee78d226b010a56ce9c6a4ce66b4f65df1c19cfef4","src/zlib-ng/win32/M=
akefile.a64":"115fe42cf85877e66137893c02fde21e9010848b34965544a57b5540b4601=
a48","src/zlib-ng/win32/Makefile.arm":"1ced9c213d47e451f5dc21c4eb4cd05e6c02=
1cb2d2e36d60d6f8dd69fbfc519f","src/zlib-ng/win32/Makefile.msc":"fbbf3fe93bd=
be11ac1e79d471d862fd6dfa6874501bc682d2b084cdb3f3c2425","src/zlib-ng/win32/r=
eplace.vbs":"0ecd6d2f42f4f49d835acbf7b89a79cbdf17fed29d5931eeb3b40da6d31339=
46","src/zlib-ng/win32/zlib-ng.def.in":"3d1167b8b9db56bf3ae5e4b569af743b5d0=
08d012f4ac2ce5e4b6f951b9a71bd","src/zlib-ng/win32/zlib-ng1.rc":"98b6d62f427=
509c4fd22c2288541f99455e1f1f7a9a349e859cc2f7e1d438ea1","src/zlib-ng/win32/z=
lib.def.in":"ec69c79c2a5612a5c4dc9de08c930c9b251f2455e4bca8781f70c05f7170fb=
3a","src/zlib-ng/win32/zlib1.rc":"66fa46294e779c0c7182d2d01abee6b112ae5e05d=
91726e3684925df7d8433df","src/zlib-ng/win32/zlibcompat.def.in":"c4dff5ac2cf=
e629155c7de5b0f139fb1c962fb01addbc032c3cf35110921eb27","src/zlib-ng/zbuild.=
h":"2f336c4af4c1445029b31d55db1ddad65ef78b3db0026d910aa3c3b20cf58e66","src/=
zlib-ng/zconf-ng.h.in":"91893ca925182a08fe11bd728b77dd818bb0af15ab5abe9a39d=
8d01e2e114d08","src/zlib-ng/zconf.h.in":"2816eef7bb70d874d8be00cdf984ecc804=
a8213a0d47454e7feabde2bdadf9a4","src/zlib-ng/zendian.h":"f5cfa865281d2c5d0b=
097d318500f27daeec346e7882de68e279486d79c52e77","src/zlib-ng/zlib-ng.h.in":=
"cd139e1dea10683be03cb6be6847980c0595d026474076866b952fae3709ecb6","src/zli=
b-ng/zlib-ng.map":"03ef4439594619e215dbb1717f8c13e16159308ef3817761ba1a3cca=
7f7834df","src/zlib-ng/zlib.h.in":"3261ec4605c45a065d5270bd1ab225639ff5a953=
053e830347f82eb0f919860b","src/zlib-ng/zlib.map":"9997aa913dec6da106ab2089d=
2a72ca5e1b7fafe0807ac0bc1318ce8c8defab9","src/zlib-ng/zlib.pc.cmakein":"4e2=
5f45fe7522c3f444a27dbc68ca595447ee4f73be6d0fdcf7abccac67cda09","src/zlib-ng=
/zlib.pc.in":"e7964018e5293e5221573c129e73b379499dd5aa8b9739db1782fdfa24bbd=
ff7","src/zlib-ng/zlib_name_mangling-ng.h.in":"474b5cadd2deba6c78084aed9b87=
2e95c3888ffcdba153b934fca4f88dd1c36e","src/zlib-ng/zlib_name_mangling.h.emp=
ty":"38e51a846d6c2bd6100298c55328dba4437c08fa1dceda4eb2e06ecb1d142058","src=
/zlib-ng/zlib_name_mangling.h.in":"00c1b07fdbcb52c43f3b11ae5a4c98f66918049f=
53918607e698b992a46024fa","src/zlib-ng/zutil.c":"64ecee4e622d6fe4d00ca94bd3=
02b27beb03178129d4be4b2d12c1823a73a27f","src/zlib-ng/zutil.h":"59cc0ffe4c13=
662d9729e28ed098803e6f1c6d36fd8b0654da9bca53eebc3b4f","src/zlib-ng/zutil_p.=
h":"ddf2e95f2e7462a1ae4d330b26d454a394684cbfddf74af3d3e4ceff5db85275","src/=
zlib/CMakeLists.txt":"b87275731cc3ebdfea144187875cea204f555c343279c0f35f2d4=
6d661bfe34a","src/zlib/ChangeLog":"4c9f1a65b9b4be8bf164a97775ef50e4db4e02ea=
8c9933fdbe629a640691375e","src/zlib/FAQ":"1e8a0078be0ff1b60d57561a9e4a8cad7=
2892318a8831946cba1abd30d65521c","src/zlib/INDEX":"3b4e325d47ae66456d43fcf1=
43ba21ab67a02a4f81be7ef2da480ba30d774266","src/zlib/Makefile":"ef23b08ce012=
39843f1ded3f373bfc432627a477d62f945cbf63b2ac03db118a","src/zlib/Makefile.in=
":"5021b2bac4164f48b17c91c8a2e3c225be7ad31d8bfab1bbaadd90370afe9991","src/z=
lib/README":"7960b6b1cc63e619abb77acaea5427159605afee8c8b362664f4effc7d7f7d=
15","src/zlib/adler32.c":"d7f1b6e44fee20ab41cef1d650776a039a2348935eb96bcbd=
294a4096139be3a","src/zlib/amiga/Makefile.pup":"a65cb3cd40b1b8ec77e288974dd=
9dc53d91ed78bbe495e94ccc84ddd423edf1f","src/zlib/amiga/Makefile.sas":"0e63c=
f88b505a1a04327bb666af3a985c5e11835c0c00aed4058c0dcc315d60e","src/zlib/comp=
ress.c":"5c11e1fc22e219cb986f6fa9e4ba939315227e84aef042737d38ec668b89b6d2",=
"src/zlib/configure":"86b38f27f31d2fec76d9355872550dc63cb3949774473fd6313c5=
a3fd1def0e2","src/zlib/contrib/README.contrib":"ca39b78bd7ad84f1df7b0da9077=
0c5b3fa4c8e2c75d132e9222812fac8839630","src/zlib/contrib/ada/buffer_demo.ad=
b":"469cf566a6965767fee6b987a239ed8cedcc66614940d45a9b434331fbb435ce","src/=
zlib/contrib/ada/mtest.adb":"41b6f31684770334afdc4375871eb1408542f37a823a07=
3556fdbfdb63753160","src/zlib/contrib/ada/read.adb":"fa5b989aef0c5715a3fcb1=
5de93985f7f10aeb0a7f5716745c95ed820eb9af9c","src/zlib/contrib/ada/readme.tx=
t":"8fe9e5303f2e8e8b746c78250e74b7c4aeb7ce6212fdce751fc3a0ce56a47fe2","src/=
zlib/contrib/ada/test.adb":"5e3abe79b387e09a9a42bd0543105e228f39a335240cffc=
33d71f0ba66ff2511","src/zlib/contrib/ada/zlib-streams.adb":"f45988e2bac76eb=
25a0dc981f46576e7432c35dde1790bbc2b650f0090b7fa72","src/zlib/contrib/ada/zl=
ib-streams.ads":"969e8edb0611810fb52159dcb7c40228f4e5da810a7a3576b778116a93=
038c6b","src/zlib/contrib/ada/zlib-thin.adb":"03d89244ee5ec9771d9b5050e586c=
609f851af551b2e64eb151f1d5be0b63ae9","src/zlib/contrib/ada/zlib-thin.ads":"=
631ef170bde16c3ca8d412b54a0e519815b80197d208f8f393e6fe017bb0968e","src/zlib=
/contrib/ada/zlib.adb":"c9ca5dc34fbcdf06e2dc777b7e9dcd0ba31085b772b440eb0e1=
2421323ab672c","src/zlib/contrib/ada/zlib.ads":"02634bec0d5e4c69d8d28591243=
80074a57de8d8bd928398379bfacc514236d2","src/zlib/contrib/ada/zlib.gpr":"859=
bb69dce38dbe9dca06753cf7ae7bd16d48f4fece8b87582dab8e30681d3de","src/zlib/co=
ntrib/amd64/amd64-match.S":"166007f7e9adb58fe8b83d85bbfe823f5e05858ba1d06ed=
f637b78886caa2c69","src/zlib/contrib/asm686/README.686":"c21cc7147c956ecae1=
7dd084cb41a206b086216fa521012871fb07fafd203c6d","src/zlib/contrib/asm686/ma=
tch.S":"873799062495629f21cd3f779ea4b927add7aae0144e32d3594d9ce70185e99d","=
src/zlib/contrib/blast/Makefile":"17d5d26c24bf51cad51045a38ffb73cc3539d29e8=
9885aa249fcfd45a8659d5c","src/zlib/contrib/blast/README":"baa763ae03d88ef7e=
ce6eb80d9a099b43d0b57639d6d281e1c7c6ca79d81daba","src/zlib/contrib/blast/bl=
ast.c":"1ab3e479d342bfc144167b808fb00142264bc50f24a110ca88cc774e351c218e","=
src/zlib/contrib/blast/blast.h":"4d4e3e6f893316f0be77bfd642c857a77f1fa2925a=
cb5df9753e543d35aa3a6a","src/zlib/contrib/blast/test.pk":"5f5c262c545574a5c=
221132d5ef832478d222d70b015341795b3860204140d7c","src/zlib/contrib/blast/te=
st.txt":"9679b2c98e1283222d0782b25a1c198dc64ba9ebd1addd6dc6f643a45947cda3",=
"src/zlib/contrib/delphi/ZLib.pas":"1b20e173443a68c189cdaa4795620fb1ac165d9=
e61a27a1ed2cf690f13530d6f","src/zlib/contrib/delphi/ZLibConst.pas":"84bcc58=
0bdf397e570f86f3f5a5b8c7bf537828f30b4b72648b81911f6bf5095","src/zlib/contri=
b/delphi/readme.txt":"f7420ed2de77d4b498eefbbe6402a1d17dc2d411735289c78a265=
c7f10fdaee5","src/zlib/contrib/delphi/zlibd32.mak":"850e91b6c9ea05de61a411c=
bda16fa0f10118cd88bb32c4b7226988776f8d511","src/zlib/contrib/dotzlib/DotZLi=
b.build":"b96137097669644ecb9f42cdd3399d1fce9c512788374609303f7e50abf597f0"=
,"src/zlib/contrib/dotzlib/DotZLib.chm":"20d0e3edd57f849143255a7f0df1cd59d4=
1db464a72c0d5ab42846438a729579","src/zlib/contrib/dotzlib/DotZLib.sln":"a97=
9198c5b8d144c1ac8f993bfb6f4085d135aa58ca9dcf63ebabf52b5c695f7","src/zlib/co=
ntrib/dotzlib/DotZLib/AssemblyInfo.cs":"314afcfb339ea95f5431047b7ab24631b11=
c3532c7ce5dc2094ed0cf80a7c16d","src/zlib/contrib/dotzlib/DotZLib/ChecksumIm=
pl.cs":"e7c047a2c3bcf88d3d002ee3d2d05af414acf53cb4451efacc0f2e95a474ea0f","=
src/zlib/contrib/dotzlib/DotZLib/CircularBuffer.cs":"be84c9736fe7bdc2bfae70=
466d8fff582504e928d5b5e110fd758090090c8cb7","src/zlib/contrib/dotzlib/DotZL=
ib/CodecBase.cs":"259bdda1b7d6052134e631fa24bfd9dca6e2362563496c8b85257b56c=
848908c","src/zlib/contrib/dotzlib/DotZLib/Deflater.cs":"06ba6696a3c15c53ba=
5fd5a1c2bf50b51f217010228fc1e4c8495ee578f480de","src/zlib/contrib/dotzlib/D=
otZLib/DotZLib.cs":"9837fe993fd631233cc5e53ff084d86754b97f05ec77c54b0764c27=
06f186134","src/zlib/contrib/dotzlib/DotZLib/DotZLib.csproj":"21606db31dfef=
6410dd438b73f1db68856eacabcce6c0f0411fc4f17e17001f3","src/zlib/contrib/dotz=
lib/DotZLib/GZipStream.cs":"8d1de9755c77046b4ac71340a0a54434ebf4fd11b085c44=
454d7663a9b4df1c5","src/zlib/contrib/dotzlib/DotZLib/Inflater.cs":"9016ca73=
818f5b6a28791abc3af6da7c4d2773b6a3804f593f6d5737a62b99ad","src/zlib/contrib=
/dotzlib/DotZLib/UnitTests.cs":"ad66ac08de34d253e9615b96a745f3dfeda93f4a978=
d65d5d3ddb9d0d9b3e099","src/zlib/contrib/dotzlib/LICENSE_1_0.txt":"36266a8f=
d073568394cb81cdb2b124f7fdae2c64c1a7ed09db34b4d22efa2951","src/zlib/contrib=
/dotzlib/readme.txt":"d04972a91b1563fb4b7acab4b9ff2b84e57368953cc0596d5f5ea=
17d97315fd0","src/zlib/contrib/gcc_gvmat64/gvmat64.S":"22ff411b8b1d1b04aeaa=
8418b68245400267dc43c6f44104f6ccd37f0daee89f","src/zlib/contrib/infback9/RE=
ADME":"890288f02bb3b1f9cc654b87a07fcea695f90f6b9bd672d25bf6be1da2ec1688","s=
rc/zlib/contrib/infback9/infback9.c":"0a715c85a1ce3bb8b5a18d60941ffabc0186a=
886bcc66ba2ee0c4115a8e274e9","src/zlib/contrib/infback9/infback9.h":"dda230=
2f28157fe43a6143f84802af1740393572c2766559593996fd7a5a3245","src/zlib/contr=
ib/infback9/inffix9.h":"84a2ba4727767c18af6505f0e81d9c814489c8b9ed330a25dad=
433db72997e43","src/zlib/contrib/infback9/inflate9.h":"32a907676cc36e27d0fd=
c0d99adb83a0b23f20ab61896269216d40fecf08d349","src/zlib/contrib/infback9/in=
ftree9.c":"0c7f10396703b230c504207fe1595a2f2f8ba9c43158c4bd79d5b22ca36e04e0=
","src/zlib/contrib/infback9/inftree9.h":"8ae61d52e50d2dbdb0378548ecc54fcd8=
8f108c8b6fc30562a3ebec1ca6a599e","src/zlib/contrib/inflate86/inffas86.c":"6=
f266f3c7e0faca653256d0189c0f00d7dc0b062d02e25df4e1202e49369595c","src/zlib/=
contrib/inflate86/inffast.S":"70777bd21526680005fc34f086d108af49e2668ad86d1=
749e8e8100a81bfb288","src/zlib/contrib/iostream/test.cpp":"0f3c77e013949eb9=
c91e6b690ea894e19d97944d6b0885b82806fc3ad99680cf","src/zlib/contrib/iostrea=
m/zfstream.cpp":"8ebb9b3d521cc3392953f27658cf1f6dcb763216079f69a1518ec5ca0e=
42a63b","src/zlib/contrib/iostream/zfstream.h":"4369c35e66f63f52ca4a5e1759b=
f720507ccabb8f3f132e2f18e68686c812401","src/zlib/contrib/iostream2/zstream.=
h":"d0343e0c57ff58008b6f29643d289c72713aa2d653fe3dcd2e939fc77e7e20b6","src/=
zlib/contrib/iostream2/zstream_test.cpp":"f789df183cc58b78751985466380c6563=
08490a9036eb48a7ef79704c3d3f229","src/zlib/contrib/iostream3/README":"43ec4=
8ecbd95a8c45db20b107fac73b740bb11595a4737329188f06b713972cc","src/zlib/cont=
rib/iostream3/TODO":"af5ebc83fb88f69706c8af896733784753dead147687e1c046f410=
c0997fd88b","src/zlib/contrib/iostream3/test.cc":"8e17fc48dfdbc6e268838b8b4=
27491b5843b6d18bc97caa6924de9fad7abe3da","src/zlib/contrib/iostream3/zfstre=
am.cc":"8cdd67ed0b13c192c11e5ea90e9d5782d6627eb303fbc4aa5ebda2531ec00ff8","=
src/zlib/contrib/iostream3/zfstream.h":"1bd74778fac45ee090dfc0f182a23e8a849=
152deb630606884b2635987b357b1","src/zlib/contrib/masmx64/bld_ml64.bat":"1c0=
561908a07ebdff271b12ed757241e1813d3db0f3551501b2595c23f0833aa","src/zlib/co=
ntrib/masmx64/gvmat64.asm":"390c1e6d63cb615b5ba042842738953f9cdc688b2fe35aa=
ca981fd3fae213f3f","src/zlib/contrib/masmx64/inffas8664.c":"f6c585e43e6e524=
107566b1f10104949d0ef902159ac8203e1d98e50d4bedd62","src/zlib/contrib/masmx6=
4/inffasx64.asm":"8448d0041fe6e8f4188fe5916181a1b274c6d35d75cfb28da60cf4f1e=
dde44ec","src/zlib/contrib/masmx64/readme.txt":"9bb66b5028100855683853f12da=
0be479c7bccf74365fdbf37da2542edff9927","src/zlib/contrib/masmx86/bld_ml32.b=
at":"b0b05b62715d4a81a7db5b7ca4a372d109ec95634c9d3bef9e0041ff52de22fc","src=
/zlib/contrib/masmx86/inffas32.asm":"78d2cc88f8ed0e32ef960efc987c257bc1688a=
fe7d031a8ba18761e95a6a7c3f","src/zlib/contrib/masmx86/match686.asm":"9e9bea=
3b5517b089da7d39caded07982746a33f94f0907ca7e8afefed7be36b6","src/zlib/contr=
ib/masmx86/readme.txt":"1f29a04e0227b74e20ba1b7c764b3ca5bf596dd2c06e89bc19a=
05fb8f9689778","src/zlib/contrib/minizip/Makefile":"087034de3dc0223b29e64bb=
3a4fc3eda7b948e93d2a9ff154aecf9fed2a1eb5b","src/zlib/contrib/minizip/Makefi=
le.am":"2313a3480a2c3745fa7ce216829cd0367058907d3a0902e5832c66c84a2fdfc6","=
src/zlib/contrib/minizip/MiniZip64_Changes.txt":"302c62b328647f5472fb775524=
9a83459be7f8ffb1fae07e8ba318fce8f4126c","src/zlib/contrib/minizip/MiniZip64=
_info.txt":"122719c32ef1763a5f6ba9c8cdefc1d78a76f7156b09e7b6f69b73f968e0dac=
3","src/zlib/contrib/minizip/configure.ac":"35330dc0c6188127afd339829d91b19=
739d23bf3b7301bfb04f775a6fcbbdad7","src/zlib/contrib/minizip/crypt.h":"8e87=
2b60255b8447da99885c7159c2e1f1bb8143523bdbe71784e60f98bfd67b","src/zlib/con=
trib/minizip/ioapi.c":"66b39c27042f6ad12cc12efb0c82cdf100c6640b5fa959b8b866=
e252966113a9","src/zlib/contrib/minizip/ioapi.h":"8655408534b78dc0889a45f93=
59fc6d2d5c8e8d8443b81ede596f954c720ef48","src/zlib/contrib/minizip/iowin32.=
c":"2c05bc374d3d847c6a9f29eac9d674abba7659d1e91e34e172248fcb5c274d51","src/=
zlib/contrib/minizip/iowin32.h":"586f22b9c3c64da253ce2b518e0fad61f19a7b47b2=
89fc704cc9708242294c49","src/zlib/contrib/minizip/make_vms.com":"65736d9c48=
88f2373d3db0a13864d150c5040453f5bc2a5c8784379a7ea67590","src/zlib/contrib/m=
inizip/miniunz.c":"ced49f20c62536a8ffb270b35cfa4994a1dcdce45f8cf059b941c94c=
a0022666","src/zlib/contrib/minizip/miniunzip.1":"66d8684392167091ef0fe0159=
8d6a0daa26e7e448e2df6c3cb257487735b83f7","src/zlib/contrib/minizip/minizip.=
1":"5404596e8e5587a52f563906119f32ceee30a6d97a966afa5c7afbe4d373e210","src/=
zlib/contrib/minizip/minizip.c":"fdfcf83979ef2324c1455d369e8add8678c804939d=
412ce53f8b024578ceabad","src/zlib/contrib/minizip/minizip.pc.in":"8b6670b42=
d8e5e519e1cc89db093efc07ba23cb1ddfedd3c93ff2df08c3ce8ac","src/zlib/contrib/=
minizip/mztools.c":"cd887c4af6d20823bd15f24008b10acf01969b4165d7848656bde84=
3a92428d7","src/zlib/contrib/minizip/mztools.h":"6f82c52279e8f79165f4446be6=
52e5741a49992ac58632470335aa34c564072a","src/zlib/contrib/minizip/unzip.c":=
"497adf676b1cae2a7afa834e4aba86383f7b697f5fdd03a8179ea9024a431cf9","src/zli=
b/contrib/minizip/unzip.h":"d8dc58fc0121b6a4b98f3028205bb253f956b1ddf791e9c=
ed3cf44892502a01f","src/zlib/contrib/minizip/zip.c":"00f403cb7810578b4b2687=
dd55fb132c850c3630fba2f3704a8ab896fcc8209a","src/zlib/contrib/minizip/zip.h=
":"96163fc140e4bf08752e014d20a1eac3f5adcdc408366f6d79c1895f2599cf08","src/z=
lib/contrib/pascal/example.pas":"d842d456ecb6ff80e34cee2da31deb2072cc69ca83=
7497bea8b8bee203403474","src/zlib/contrib/pascal/readme.txt":"02f997c37991d=
dae0cb986039f7b4f6fc816b3fd0ffd332cad371d04c12cf1b9","src/zlib/contrib/pasc=
al/zlibd32.mak":"850e91b6c9ea05de61a411cbda16fa0f10118cd88bb32c4b7226988776=
f8d511","src/zlib/contrib/pascal/zlibpas.pas":"28b90aeeb3da8d1f6a98ab9f5f16=
03d08aba5bfabc50827d3f15e661268a51cf","src/zlib/contrib/puff/Makefile":"d9d=
738030464aaae354196c14fd928adf591832fce7d71ac1977c1d8d4923a4b","src/zlib/co=
ntrib/puff/README":"aceca4bc1bce7d9445b8bc9b6640c672d95708185f6070d3a3baae7=
a9d102caf","src/zlib/contrib/puff/puff.c":"6d0eef92e115a42e570b79d8b07a04af=
5ccbd6b3f3fbca9cbc61c49db9c9df43","src/zlib/contrib/puff/puff.h":"969b7be2a=
930db0cdcb19b0e5b29ae6741f5a8f663b6dba6d647e12ec60cfa8e","src/zlib/contrib/=
puff/pufftest.c":"8ee0da78a1221a3c2036e22eed06c2faa27a671a46565a60e10111d4e=
e9c30ee","src/zlib/contrib/puff/zeros.raw":"b7b0887089f7af1f6d1e0b4c0a1e8ed=
dd10223b23554299455c6c9be71b653a3","src/zlib/contrib/testzlib/testzlib.c":"=
c6c37b35c6ecc9986a9041f86d879cc37a9e4d8315af9d725071eb3b2cade0c5","src/zlib=
/contrib/testzlib/testzlib.txt":"2359bbdc84eb8a04e0f1cd16cd81a2896e957f2ad5=
8dab3ca78ef55b7d0dc577","src/zlib/contrib/untgz/Makefile":"8f5ab1564813e091=
cea8f1bb63da32fd80ac763d029277b0cabf50f60aceefe1","src/zlib/contrib/untgz/M=
akefile.msc":"d0f537de11d9e0e36e2a98b3971c537265f4b533b4c48797094365ad9ae83=
88b","src/zlib/contrib/untgz/untgz.c":"9a12d774301d252dcd38bba07ac369319da4=
c04c4fef8a50fcbf40aebf29c2a1","src/zlib/contrib/vstudio/readme.txt":"2a9ca4=
0b68274f4d37649dfab9e5e867a000883592b4ab8fdaec8425a63052c3","src/zlib/contr=
ib/vstudio/vc10/miniunz.vcxproj":"dd607d43c64581172c20c22112821924dfe862f56=
b2e5eb8780bdd0714d9527b","src/zlib/contrib/vstudio/vc10/miniunz.vcxproj.fil=
ters":"c3db9f97952683e688ad83c13bb94c816ac3e6b5f277fdea545b0650c125aa6d","s=
rc/zlib/contrib/vstudio/vc10/minizip.vcxproj":"af73f2cf8ae51e65e85342faeb40=
849a2310c97bc77def42b38d7070460a6cf0","src/zlib/contrib/vstudio/vc10/minizi=
p.vcxproj.filters":"83db58d87f5d7ca84b6087aa1f62b15cbc296194c8cf76e47a271f9=
077b4f3bd","src/zlib/contrib/vstudio/vc10/testzlib.vcxproj":"1525ed0893db56=
db44ec68675c8da3c229dc7867166dfc0428816783d16ad43b","src/zlib/contrib/vstud=
io/vc10/testzlib.vcxproj.filters":"d7e04ffa467d417dfa3c0f1c64234cadc8488210=
1bbae483f0a0f5d3d6b566a7","src/zlib/contrib/vstudio/vc10/testzlibdll.vcxpro=
j":"3f317d8964f17901c3e68bff5deaec10b6ccc50a572235999e8097292692984c","src/=
zlib/contrib/vstudio/vc10/testzlibdll.vcxproj.filters":"682a485f0184aabba94=
e12e1b284499195f37c176d43ecee0484f31e4d636f6f","src/zlib/contrib/vstudio/vc=
10/zlib.rc":"e8b581eb16930e0213d37143a5f17868839b22c758b23981a29484e17093c4=
94","src/zlib/contrib/vstudio/vc10/zlibstat.vcxproj":"2a38222d6c034d7e0b843=
c3f0540dc6c53dd48f942ae29f31620ca0327248c8e","src/zlib/contrib/vstudio/vc10=
/zlibstat.vcxproj.filters":"d9a2c381e51e4d6f027f3517db7db81656e43cec02ed9ab=
f267a0fde6f360180","src/zlib/contrib/vstudio/vc10/zlibvc.def":"0124fea28bfe=
e49c8a19dad0ed5a49277d451018b4affda5a389e64ad15f44d7","src/zlib/contrib/vst=
udio/vc10/zlibvc.sln":"e659860f705f31b87ea9139a3cb4ebe1561e120bce495383a546=
14fc82b49990","src/zlib/contrib/vstudio/vc10/zlibvc.vcxproj":"3108badf710e2=
f4a64eab4e7deae6642fb68cc0d94018e537149f1761e215133","src/zlib/contrib/vstu=
dio/vc10/zlibvc.vcxproj.filters":"58404ba7703c68025bec64b8a17ff1fc7f3a35d15=
d17ae3bcc4fa753f1348425","src/zlib/contrib/vstudio/vc11/miniunz.vcxproj":"7=
46e4c11fb8af4bcd6a9d68ba81ed1dc366a5de3bed56b291ee969ad733a7bb0","src/zlib/=
contrib/vstudio/vc11/minizip.vcxproj":"340617cae9cf4fcb003308021d3782ec3639=
e60d62d79a3aafc0a50bb55b061e","src/zlib/contrib/vstudio/vc11/testzlib.vcxpr=
oj":"589eec6ef6d818564ead938a629fda50abb6cbf8054b9f66ea780765c1a1b3db","src=
/zlib/contrib/vstudio/vc11/testzlibdll.vcxproj":"583bdef522b0176829f0d8139e=
a2a88b9cbc14379d1334f3a863989ed3df9b67","src/zlib/contrib/vstudio/vc11/zlib=
.rc":"e8b581eb16930e0213d37143a5f17868839b22c758b23981a29484e17093c494","sr=
c/zlib/contrib/vstudio/vc11/zlibstat.vcxproj":"51aa752698d96df065a9ece02e29=
3492f681b59a8077f036a5a60367dc621e87","src/zlib/contrib/vstudio/vc11/zlibvc=
.def":"0124fea28bfee49c8a19dad0ed5a49277d451018b4affda5a389e64ad15f44d7","s=
rc/zlib/contrib/vstudio/vc11/zlibvc.sln":"27389b515997defd080519f95aff87e89=
fcbe8b26d73c5ebb73c544cfef4d60e","src/zlib/contrib/vstudio/vc11/zlibvc.vcxp=
roj":"c3dd05e56159aba411475b83656275872524cb3c2fd24d690397d8b634e7e0ed","sr=
c/zlib/contrib/vstudio/vc12/miniunz.vcxproj":"1494af54570f6e93852932956d49a=
8c25e57b5abc1ac979945605ca9143df9f8","src/zlib/contrib/vstudio/vc12/minizip=
.vcxproj":"9bf128ed6760ca5f019006f178b1c65f4c7ff122dba8d297b64b0eb72feeb120=
","src/zlib/contrib/vstudio/vc12/testzlib.vcxproj":"367a06caa399bd09f6b9cb6=
0706820943dd6a6cf05794275baaf421da9c2a0b7","src/zlib/contrib/vstudio/vc12/t=
estzlibdll.vcxproj":"93416510256935d79625dc9fd349cfce6968c062d42a138bec404a=
26b2f92f5e","src/zlib/contrib/vstudio/vc12/zlib.rc":"92d5d3a4938a6350395934=
153416a7eb74353cdfb2321f45b9ee0b9b16257f39","src/zlib/contrib/vstudio/vc12/=
zlibstat.vcxproj":"744ff6ac0d4e2dcdf74c7d33b979fbfd2b18550947eb99bfd46dc6a7=
3eb1c68d","src/zlib/contrib/vstudio/vc12/zlibvc.def":"0124fea28bfee49c8a19d=
ad0ed5a49277d451018b4affda5a389e64ad15f44d7","src/zlib/contrib/vstudio/vc12=
/zlibvc.sln":"162e0faa80a56d89eea71a0b89377708eec2faa0dc72091cc0abb07fbdea4=
9a0","src/zlib/contrib/vstudio/vc12/zlibvc.vcxproj":"754671c59d8996a846241a=
f76082cc8be1aa5fc079eff530d91a9ab15a0bee5b","src/zlib/contrib/vstudio/vc14/=
miniunz.vcxproj":"0312511d4a30cea979c4e36edf994a537ed8a9d924f6b5c536cbcd094=
773c11f","src/zlib/contrib/vstudio/vc14/minizip.vcxproj":"9e7bb7a6ac723e4b2=
db900627c366f9bb93a351381995d9c69a50c0126f64233","src/zlib/contrib/vstudio/=
vc14/testzlib.vcxproj":"c3a9369670af4ebea13d036b452be7418591fbb4c03a675699f=
acac5d8dff5d0","src/zlib/contrib/vstudio/vc14/testzlibdll.vcxproj":"69f5448=
98b4275cd3d8e19b8f1f8cb39c1cb98a30cdb033242e4b94c57bfa150","src/zlib/contri=
b/vstudio/vc14/zlib.rc":"92d5d3a4938a6350395934153416a7eb74353cdfb2321f45b9=
ee0b9b16257f39","src/zlib/contrib/vstudio/vc14/zlibstat.vcxproj":"9c7c096b4=
7e7875412c98525efcd16db62e094215f0011b9cd739a33ab35d48c","src/zlib/contrib/=
vstudio/vc14/zlibvc.def":"0124fea28bfee49c8a19dad0ed5a49277d451018b4affda5a=
389e64ad15f44d7","src/zlib/contrib/vstudio/vc14/zlibvc.sln":"47a50bbde8ca63=
36cecd8c0e4b65e515fc46ae84c7b61008ac9864162f777286","src/zlib/contrib/vstud=
io/vc14/zlibvc.vcxproj":"71fb6ef3b079bfdf4182af17e74c3361ead757467edfc591d9=
cbe303ccc47b52","src/zlib/contrib/vstudio/vc9/miniunz.vcproj":"b2b53bd9e704=
bfbe769b863acdc2a3368692ca149c4b4ed2a0761b0cd16c6726","src/zlib/contrib/vst=
udio/vc9/minizip.vcproj":"80a701fb41a61871ce1d25f6b03e571edb6c3abf0aa453755=
54b6fac52115eb6","src/zlib/contrib/vstudio/vc9/testzlib.vcproj":"05fc5a8768=
2b17690d199f424f57f6ad7767b8dabb29a1039bfcb88bca1b302f","src/zlib/contrib/v=
studio/vc9/testzlibdll.vcproj":"25c1cc5319f1c4b7dbdb595c3cfd6ec3ba217818b03=
b7055ef5ef440b575a43d","src/zlib/contrib/vstudio/vc9/zlib.rc":"e8b581eb1693=
0e0213d37143a5f17868839b22c758b23981a29484e17093c494","src/zlib/contrib/vst=
udio/vc9/zlibstat.vcproj":"e8653eea37f3bef097eec2caa55e1f698c3c74c959689bc4=
e97568e88d2bbc60","src/zlib/contrib/vstudio/vc9/zlibvc.def":"0124fea28bfee4=
9c8a19dad0ed5a49277d451018b4affda5a389e64ad15f44d7","src/zlib/contrib/vstud=
io/vc9/zlibvc.sln":"26e58d4b2cfcd941c367fb2a18537b3b9f002f2ac1278b700ea1129=
c50501452","src/zlib/contrib/vstudio/vc9/zlibvc.vcproj":"86aa6e33db104c0a0e=
d4a9f21f0db8572cc7755170217aef18219fdd74b75e9d","src/zlib/crc32.c":"a04af27=
3e83ecc351bf3794974ab2098d8d960df4044b7b44734c41443ee26d0","src/zlib/crc32.=
h":"407af59d0abfea84a6507c603eb29809411797f98249614fe76a661def783ce1","src/=
zlib/deflate.c":"11fd6b0328b65c4ad4b5c204d892a97a9083628a7e77dc47836c8e0c79=
9f8da0","src/zlib/deflate.h":"0ca7fb0cf1dd63001c6e9e4ff93c8dbff2fe521199be5=
1a4dda38a11b44919f6","src/zlib/doc/algorithm.txt":"992590931e982c0765286c2d=
83f6e9ff0a95aabb08e28c30c52bae3e8c4bd5ad","src/zlib/doc/rfc1950.txt":"8f047=
5a5c984657bf26277f73df9456c9b97f175084f0c1748f1eb1f0b9b10b9","src/zlib/doc/=
rfc1951.txt":"5ebf4b5b7fe1c3a0c0ab9aa3ac8c0f3853a7dc484905e76e03b0b0f301350=
009","src/zlib/doc/rfc1952.txt":"164ef0897b4cbec63abf1b57f069f3599bd0fb7c72=
c2a4dee21bd7e03ec9af67","src/zlib/doc/txtvsbin.txt":"47c273bb22c9773248d380=
549a330e5c262266b1292154b0d3014f731cc73f47","src/zlib/examples/README.examp=
les":"402d72eb69c2e03a25034f4b3c02b110f0f67149ecfa4fa0e4b2bf0ceb49a8b3","sr=
c/zlib/examples/enough.c":"704e273f65b62c5d2eb06d5bb10c4ccffba56544aa477f0e=
3957e2296c501b78","src/zlib/examples/fitblk.c":"950769163c41aff897ee41746a8=
685d9aa41073b1307f42da19dabe9d3fc8b85","src/zlib/examples/gun.c":"d60ca6eb0=
a3e62ee7fb4a1ab69e8d1525ff06b06ce46889cbdfc13fb8f7534c2","src/zlib/examples=
/gzappend.c":"4182d38bf97ffbdf1110df7f65c0e8fab0b28b1ea36ebba8621c14e8e76f1=
caa","src/zlib/examples/gzjoin.c":"90b9d6c39a5fc91cf1cc9b96b025a508a8015dc5=
02cd9374c754b44078593f57","src/zlib/examples/gzlog.c":"433d34b71b4e769ece1c=
ceb8bd7d902d2c0a24ccd7550ab1856a5ba87f84f835","src/zlib/examples/gzlog.h":"=
309556e2d7d39250924946b78e2cce0ac927857d6e1a02cab64e438f533c20c3","src/zlib=
/examples/zlib_how.html":"80fb647be8450bd7a07d8495244e1f061dfbdbdb53172ca24=
e7ffff8ace9c72f","src/zlib/examples/zpipe.c":"68140a82582ede938159630bca0fb=
13a93b4bf1cb2e85b08943c26242cf8f3a6","src/zlib/examples/zran.c":"840ebeb058=
cd0ca9e92dcb1db665932462a4695fc649b34e865b8d1ad7c5bf77","src/zlib/gzclose.c=
":"94446cf8cde67c30e64d0a335b0c941fd3fbad2e77f30180d12e61f9c2a5a6b8","src/z=
lib/gzguts.h":"6a54a06d269245d73201e76280c0f11c282dc6ec51729ccd9051fe6c9907=
e851","src/zlib/gzlib.c":"5daf11e44149e0aba2956d35f73f04f35dca99c3dfa43f5ad=
43ec20b336e4a1b","src/zlib/gzread.c":"6f928512cb1792cfeab31a51ff0b211814d2e=
455bc75290eb31079dc1e5ad2ec","src/zlib/gzwrite.c":"ba3b7b7ad2ff7ef0c19319b8=
408c333491a4cd495da55d0b156bc73d9ddb4df4","src/zlib/infback.c":"abe44873b5a=
f2ea68ea1d281d915b2800f1832f846d2c05442a4711adbe6f269","src/zlib/inffast.c"=
:"4d496ab2a3d29df5fadc3dbff6067e039806aaceae6cfcd09ea77d46c2b848fd","src/zl=
ib/inffast.h":"7d8c1c873ce9bc346ad6005bb9d75cce5c6352aaf7395385be216a9452a3=
4908","src/zlib/inffixed.h":"237ba710f090e432b62ebf963bee8b302867e9691406b2=
d3f8ee89ee7bfef9b0","src/zlib/inflate.c":"8b6c599c3563c14c447c47db0d7dc9a16=
e8c246a078ec95a169ddcebaaebd811","src/zlib/inflate.h":"8ec9ac297790276f7e46=
a961d4c6f9f944fb1dec92401339ec2666973cc5983c","src/zlib/inftrees.c":"1960ca=
67384376f65b6ce8c08fdb501f8eb33923e11ef5f61a855708c6cb0a8a","src/zlib/inftr=
ees.h":"c510b36402784b1f898be3b049b923469aa92701de2d9195aed19f6b65c0dce2","=
src/zlib/make_vms.com":"3064eb153a7684115f1494364f80759bc5a2c227799fdf08df7=
b9e6e50884720","src/zlib/msdos/Makefile.bor":"292ab363f7ffbc4ae84d37cd9bdff=
d2dac1003bee52d223a8489844870f20702","src/zlib/msdos/Makefile.dj2":"9208450=
c2ae6dcbfcc25560b5b9ca763f461e7246e37b0552474edf8fa898906","src/zlib/msdos/=
Makefile.emx":"c749d6ec7f88e8e639d4f03bdbdcbbe9d1c304210be4c4be621ceb22961d=
3d64","src/zlib/msdos/Makefile.msc":"0e021a6f42212415b060e4ad468eb415d0a8c1=
f343137fb9dff2cb8f9ead3027","src/zlib/msdos/Makefile.tc":"2ae12ee2a3e62f7c5=
a0520d0fbe4adee772bc07fe816002b07ccb43db3daa76a","src/zlib/nintendods/Makef=
ile":"ea5823efe6830132294eddf2f56dbd7db8712244c210bb4968c431b1a91bd066","sr=
c/zlib/nintendods/README":"e362426c47b39ff6a7d6c75c6660b20abf076cdfa5e1e421=
716dc629a71aef95","src/zlib/old/Makefile.emx":"d811f032272aae50123a889297af=
3a02fbd60d1e42bbef11466462f627ff7b5b","src/zlib/old/Makefile.riscos":"d1a48=
8b160fbfd53272b68a913283a4be08ba9d490796b196dddb2ba535b41e0","src/zlib/old/=
README":"551a0f4d91fe0f827a31cbdfbb4a71d1f3dc4d06564d80a3f526b749dd104d11",=
"src/zlib/old/descrip.mms":"8ff08c35c056df9c986f23c09cf8936db63ccf12c3c42f7=
d18a48b36f060cff7","src/zlib/old/os2/Makefile.os2":"6ad247c00f00ff42fd2d625=
55e86251cef06e4079378241b5f320c227507d51d","src/zlib/old/os2/zlib.def":"ea9=
c61876d2e20b67ef2d9495991a32798eb40d13ede95859a2f4f03b65b9b61","src/zlib/ol=
d/visual-basic.txt":"1727650acbde9a9e6aec9438896377e46a12699cca5d46c5399cef=
524dedc614","src/zlib/os400/README400":"6f95a1beb0fbf943a3312eaa3dd2c279f1c=
ef93062bebbff63dd37ac9e2aa8d6","src/zlib/os400/bndsrc":"cfe00b1528d5c27813c=
d6b1ad7aa34b493fd63d615623fb21fd1a7bf99d2255e","src/zlib/os400/make.sh":"14=
3394d1e3876c61c29078c0e47310e726e1f5bd42739fe92df9ece65711655f","src/zlib/o=
s400/zlib.inc":"c501c522185ba1f0506caf90d72f1088b34b2addc169471e949e443ab65=
e8a75","src/zlib/qnx/package.qpg":"90b5c8364d9dc5ef67405b352c19710ebad2905f=
3f20b9e56ded74661f96743b","src/zlib/test/example.c":"520799662a8286725540d6=
d5a356efe6f595618e5fe2e591972491d719bd99aa","src/zlib/test/infcover.c":"f65=
4f3fcc74b33bd95cda63d13fe0ce589bcfe965544e0c17ee597d75efbd090","src/zlib/te=
st/minigzip.c":"91089b21e692797bb6208b2b45eeb90f5f1f1e4f6b67b99dea5676f51b8=
11193","src/zlib/treebuild.xml":"d816c764c8ec2d5b2ebfa7f053f747097926c13fce=
7fa8628c5d14c991411421","src/zlib/trees.c":"f2a5f949ea70dde7c23a54c793aeed6=
30a03df4bb72417cd3aa008000c44699b","src/zlib/trees.h":"bb0a9d3ca88ee00c81ad=
b7c636e73b97085f6ef1b52d6d58edbe2b6dc3adeb4d","src/zlib/uncompr.c":"31922aa=
982ee12fd28d1ce5fe6a94a3f07c2a941c821b566a881ca21845cdfaf","src/zlib/watcom=
/watcom_f.mak":"7e039b912f9cffaa40835281430bb284fa9042b0a0d12f6b34700a06bca=
6576e","src/zlib/watcom/watcom_l.mak":"d11b4064604a034725860e63e3f6d3470563=
72e4b1675b183e20a93533b20cc9","src/zlib/win32/DLL_FAQ.txt":"9e00778319381e6=
275691dd3a89410c99065b8c0c5db96473abe8c859cbdefd8","src/zlib/win32/Makefile=
.bor":"e878fed2313417db085fea621c110889f6a32233b5b6db46e3c4e824c1d0ed6b","s=
rc/zlib/win32/Makefile.gcc":"ea8feddce7b9707253b9bf86623cf7ebe5294d7aea2b3b=
0b1b1c1b8cfd73009d","src/zlib/win32/Makefile.msc":"7c495d63c5afea1d77d162a4=
1b73bab89cee952c12e4647e9684a7ac79bfc3f5","src/zlib/win32/README-WIN32.txt"=
:"b71f1f4e4760812c3a11b2bae6f40d1066741a90e6646010a32ce50a0e348cde","src/zl=
ib/win32/VisualC.txt":"9ec0babd46eaa012371dee2d3a8a55d9c7130f7895512c3371c7=
37e4a7f6a997","src/zlib/win32/zlib.def":"24fa6dd00f3f4c0d14507a03ddbfa42707=
a04e3901bb9ff6f90096037a75185a","src/zlib/win32/zlib1.rc":"8fc5f2b5abee40ad=
66e6d6cfc9f926c2f446e13a7c9ee7df8bf58a266d8cade5","src/zlib/zconf.h":"9c008=
7f31cd45fe4bfa0ca79b51df2c69d67c44f2fbb2223d7cf9ab8d971c360","src/zlib/zcon=
f.h.cmakein":"d740b750e9c98e6a4b4529cc2a857a3fa8001514b1ce91e0e1d9d293652bf=
388","src/zlib/zconf.h.in":"9c0087f31cd45fe4bfa0ca79b51df2c69d67c44f2fbb222=
3d7cf9ab8d971c360","src/zlib/zlib.3":"5abef003e545566e5599e5ab2e7528e978be5=
9d54546b19d763d062f7a69bac7","src/zlib/zlib.3.pdf":"7f0f633641d782e360eff9f=
e831716c5767faf1000e38382a8a8c65b0b67f374","src/zlib/zlib.h":"4ddc82b4af931=
ab55f44d977bde81bfbc4151b5dcdccc03142831a301b5ec3c8","src/zlib/zlib.map":"7=
eb1070ba6bf12e6895e5da06b84a92af683827587afaa72bdd45e80b9d8e4e9","src/zlib/=
zlib.pc.cmakein":"2f1d0b18ce37c2af415a469857f02aee2c41a58877aff21d29e9c6db3=
2b55cb7","src/zlib/zlib.pc.in":"04c01cc2e1a0ed123518b5855f585c93a24526dd889=
82c414111ea1fc9f07997","src/zlib/zlib2ansi":"d316e3e79054f5f9fe921d35f4bbf4=
bf0a37b859d29d2b34ae4d7d92afc3e55c","src/zlib/zutil.c":"f7fdc9ef326a2683eb3=
3c794face54e83c751ec17f3d1ba581847a62af36ddcd","src/zlib/zutil.h":"9a63f669=
0fac1620aa3cecee5752af618806da438a256b4a047fbcd289cac159"},"package":"97027=
61c3935f8cc2f101793272e202c72b99da8f4224a19ddcf1279a6450bbf"}
> diff --git a/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb b/meta/recipe=
s-devtools/rust/libstd-rs_1.71.0.bb
> similarity index 87%
> rename from meta/recipes-devtools/rust/libstd-rs_1.70.0.bb
> rename to meta/recipes-devtools/rust/libstd-rs_1.71.0.bb
> index f23db797333e..d2bf266f9dd4 100644
> --- a/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb
> +++ b/meta/recipes-devtools/rust/libstd-rs_1.71.0.bb
> @@ -6,10 +6,11 @@ LIC_FILES_CHKSUM =3D "file://../../COPYRIGHT;md5=3Dc2cc=
cf560306876da3913d79062a54b9"
>
> require rust-source.inc
>
> -# Building with library/std omits proc_macro from the sysroot. Using
> -# library/test causes that to be installed which then allows cargo to
> -# build (https://github.com/meta-rust/meta-rust/issues/266)
> -S =3D "${RUSTSRC}/library/test"
> +# The dummy crate named `sysroot` represents the standard library target=
.
> +#
> +# See fd4c81f4c19e ("Add a `sysroot` crate to represent the standard lib=
rary crates")
> +# https://github.com/rust-lang/rust/pull/108865/
> +S =3D "${RUSTSRC}/library/sysroot"
>
> RUSTLIB_DEP =3D ""
> inherit cargo
> diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.70.0.bb b/m=
eta/recipes-devtools/rust/rust-cross-canadian_1.71.0.bb
> similarity index 100%
> rename from meta/recipes-devtools/rust/rust-cross-canadian_1.70.0.bb
> rename to meta/recipes-devtools/rust/rust-cross-canadian_1.71.0.bb
> diff --git a/meta/recipes-devtools/rust/rust-llvm_1.70.0.bb b/meta/recipe=
s-devtools/rust/rust-llvm_1.71.0.bb
> similarity index 100%
> rename from meta/recipes-devtools/rust/rust-llvm_1.70.0.bb
> rename to meta/recipes-devtools/rust/rust-llvm_1.71.0.bb
> diff --git a/meta/recipes-devtools/rust/rust-snapshot.inc b/meta/recipes-=
devtools/rust/rust-snapshot.inc
> index e31a699d2e0e..020528918072 100644
> --- a/meta/recipes-devtools/rust/rust-snapshot.inc
> +++ b/meta/recipes-devtools/rust/rust-snapshot.inc
> @@ -4,51 +4,51 @@
> ## The exact (previous) version that has been used is specified in the so=
urce tarball.
> ## The version is replicated here.
>
> -SNAPSHOT_VERSION =3D "1.69.0"
> +SNAPSHOT_VERSION =3D "1.70.0"
>
> -SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D "b0ffb368d4e66a5808f96659c=
c598030761cb06966ae8d5299596b14fbc09364"
> -SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D "c3c5346b1e95ea9bd806b0=
dd9ff9aa618976fb38f4f3a615af4964bb4dd15633"
> -SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D "d14166fa0b2832dd87b3f35c0=
8d0bc829f83aa01a539b45df3d923469ee119be"
> +SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D "8fd2d9806f0601feab1485f79=
e46d1441af2158c68abf56788ff355d5c6b4ab5"
> +SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D "966e85187b6b76dc520b23=
aadc886c5fe54b209a21c68f959ff00ef8542b7f9f"
> +SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D "71698cf444eef74050db821dc=
4df996c0f268615230099cde836e685e5b5465d"
>
> -SRC_URI[cargo-snapshot-i686.sha256sum] =3D "4c9b1b2fb692bb0c81e524df6368=
723f061c8bb0d21a1f487eb8e5c2bdf323ab"
> -SRC_URI[rust-std-snapshot-i686.sha256sum] =3D "bef330af5bfb381a01349186e=
05402983495a3e2d4d1c35723a8443039d19a2d"
> -SRC_URI[rustc-snapshot-i686.sha256sum] =3D "788ff61555857680d5ea7cf76023=
f74a7f4820dd1c26abf76536561d4de3cbe6"
> +SRC_URI[cargo-snapshot-i686.sha256sum] =3D "5d20e9b8e56f641c3ef4aef96556=
3806aa220044397485ec56f784657451a329"
> +SRC_URI[rust-std-snapshot-i686.sha256sum] =3D "0e5543c35196ca5b08f1b7e49=
fa3f3b671444d75648504cdbcfd854e2e7efd2d"
> +SRC_URI[rustc-snapshot-i686.sha256sum] =3D "f89c90f80864f68e42b70d9c1498=
4195629ed9894bb5cfe6c8a0f1140f7816ff"
>
> -SRC_URI[cargo-snapshot-mips.sha256sum] =3D "bdaef2f95b0485dc2a5cde74c08b=
d269174bbbb553226c5b5d2287e52841b061"
> -SRC_URI[rust-std-snapshot-mips.sha256sum] =3D "89849b93af9d4922554c938bc=
1c7641498d13c3a8b2b464f3bb7a060eae7a580"
> -SRC_URI[rustc-snapshot-mips.sha256sum] =3D "ef17b364df355f7322c1fdd3b4cc=
4296d2d5d489b58fdd4b12374a1f2975a455"
> +SRC_URI[cargo-snapshot-mips.sha256sum] =3D "a272a2a34f03a89e1bc89d9bb11e=
c0dee08428f43b5103785a587091b3911c60"
> +SRC_URI[rust-std-snapshot-mips.sha256sum] =3D "0cd85a53e328b1c445a8ec13a=
f87f74280c1d344744076b102227f626456caec"
> +SRC_URI[rustc-snapshot-mips.sha256sum] =3D "c1f51717bcec5a9c799d57d8c80e=
ff7760c11fc5af383700fb22c3508dd9450e"
>
> -SRC_URI[cargo-snapshot-mipsel.sha256sum] =3D "df114ac589fb50fcc3027e26c6=
e201fc530aadef1bcc8f6396c761a457ba7bbb"
> -SRC_URI[rust-std-snapshot-mipsel.sha256sum] =3D "22bb266cf4e6da4d6867144=
873579b0da47e59c8ec9cb1a329ee8a7f418e8ee3"
> -SRC_URI[rustc-snapshot-mipsel.sha256sum] =3D "9df4110f716a309323a776952f=
cf0dccaae878e7abf0d148c14a2a03c5170850"
> +SRC_URI[cargo-snapshot-mipsel.sha256sum] =3D "25d2aaad531403359c60ed3035=
005db782ba041549fdb60d3ef1a5b5a04b2970"
> +SRC_URI[rust-std-snapshot-mipsel.sha256sum] =3D "58bf8a6407d92cd4786991f=
1cbdec7380001e07c057c3a8946c2e54593bb7f8c"
> +SRC_URI[rustc-snapshot-mipsel.sha256sum] =3D "0a6cf0eef9f1b67415ca5bbde1=
832cd3cd79560762251f3fb1b6f317ed5109bd"
>
> -SRC_URI[cargo-snapshot-powerpc.sha256sum] =3D "26c774db5e21ddf66107b677d=
5c6612d50611186feaa68ff11c34a61e4d5a57e"
> -SRC_URI[rust-std-snapshot-powerpc.sha256sum] =3D "6303fc2be557467af0f1ff=
9cc756fd14ae2b9db7f17f42a1d2238ed934351e56"
> -SRC_URI[rustc-snapshot-powerpc.sha256sum] =3D "716e790b7658206c59dc8019c=
1b603f230c5ce945229463367fade862cea60b9"
> +SRC_URI[cargo-snapshot-powerpc.sha256sum] =3D "314ed27bbf7eed16f6ac0092b=
076a82782630c65927a241db921d1eff8b04759"
> +SRC_URI[rust-std-snapshot-powerpc.sha256sum] =3D "101f358b08381b9c37c2f0=
61bac1ff3e60c6036be20059c451f322a55f72376b"
> +SRC_URI[rustc-snapshot-powerpc.sha256sum] =3D "4e4fe3a8b2c0ea1f82e99a30c=
193b848464b7ac1ed802fddc100c11814a7b2ba"
>
> -SRC_URI[cargo-snapshot-powerpc64.sha256sum] =3D "160692a0fc5fe1b48b617e0=
63c6ce1d4546e108b32c0049dbde95602a30af133"
> -SRC_URI[rust-std-snapshot-powerpc64.sha256sum] =3D "6a4b8b5307141c8207ed=
67d4fbaf9345c42fb3662e389b9dd3d9a4086c1b6efe"
> -SRC_URI[rustc-snapshot-powerpc64.sha256sum] =3D "313d0944a1fc41c1c5ce0a0=
54b3cebccd6f471ce8e8272e5e68f36b8d08e5bb1"
> +SRC_URI[cargo-snapshot-powerpc64.sha256sum] =3D "ccb5b4c03f4d359cbeb1739=
ba27b725b0fc9d0d55b22837b0d3904e778a7fdc9"
> +SRC_URI[rust-std-snapshot-powerpc64.sha256sum] =3D "468672f84e5b140269e1=
88b836ec82494d65c18bda8b7cf1f9bf6fce19f222ab"
> +SRC_URI[rustc-snapshot-powerpc64.sha256sum] =3D "7891593a85ba231ca915057=
20a3535e9cff22700ee1f3e122bc33a5f10ddf705"
>
> -SRC_URI[cargo-snapshot-powerpc64le.sha256sum] =3D "9a3fe155d763b382ea187=
53133cb0e2186993e2850568134e2f7e468f2d07197"
> -SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] =3D "c44bcf91a9d13412a5=
9ba75e7f8bd14c7f60d44cdb7b21916e502c90b4b378ce"
> -SRC_URI[rustc-snapshot-powerpc64le.sha256sum] =3D "1781b5be30fa4fadf7608=
cc9cd3a2de93b3671a09adfa98ae4d975f789ba2275"
> +SRC_URI[cargo-snapshot-powerpc64le.sha256sum] =3D "5f1751ab8d44a9c9e083d=
32a8039980d699a1224654e3f5aa0dfffbc4407f1c0"
> +SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] =3D "bbd882f9ec7f01a732=
ecc60cf50b7d8a10cd52c3de41c205f62938b6dc2b4dbc"
> +SRC_URI[rustc-snapshot-powerpc64le.sha256sum] =3D "7152b111cf91a2cfa1e7b=
eb51d3c737561095ebdf75ec7e032ab1118639ea4ca"
>
> -SRC_URI[cargo-snapshot-riscv64gc.sha256sum] =3D "9bc29f493c353313b968243=
fbdf5147c9ca401f7f8205aed63f180b5757161e2"
> -SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] =3D "8c32a848e2688b2900c3=
e073da8814ce5649ce6e0362be30d53517d7a9ef21ff"
> -SRC_URI[rustc-snapshot-riscv64gc.sha256sum] =3D "03606f1ad3fd196e73e0d25=
5ab6342e4e8fef2edaa1afcc577411aa8a68f0133"
> +SRC_URI[cargo-snapshot-riscv64gc.sha256sum] =3D "55c3a5c06b14c954df53180=
73c38a5b4b0ace3f9a32a24f0ef5514941f7c9502"
> +SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] =3D "cdecf32e245898306a27=
a0b164451b2ee9a2122176ce3a65f2ec73c200986dc3"
> +SRC_URI[rustc-snapshot-riscv64gc.sha256sum] =3D "7fa4de4b7f8ab8b23a0f2ef=
3dc4886658d3bf90a97f6b215146b75b445a6131b"
>
> -SRC_URI[cargo-snapshot-s390x.sha256sum] =3D "812907846a454a182b05eab7665=
8b49eabd8d06d2b5e8df56f29d73971f91b03"
> -SRC_URI[rust-std-snapshot-s390x.sha256sum] =3D "5c98653199b89bff6f368bed=
61fca7860f7179364ce9e9474c90af38e2629baf"
> -SRC_URI[rustc-snapshot-s390x.sha256sum] =3D "3cef208c0761bc83d156a14a5a9=
4821cc9421772f0f376ea54765a6d00842b21"
> +SRC_URI[cargo-snapshot-s390x.sha256sum] =3D "dc4104e9e4b82dff14ffb20233d=
412ff57cea27e7bb2064b6a7e660fee6d2c4d"
> +SRC_URI[rust-std-snapshot-s390x.sha256sum] =3D "7084afbe9fb1a0e8a0c3e760=
f45475ebba400b72030ae8359bdccef67cb48992"
> +SRC_URI[rustc-snapshot-s390x.sha256sum] =3D "2c8421d95d575d33545b969ed5d=
200bbcbc69a2ae80d0ffeba4c516fc8a91356"
>
> -SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D "336eeabf231a7665c26c127a37=
b8aefffe28cb087c5c8d4ba0460419f5f8eff2"
> -SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D "4c95739e6f0f1d4defd937f=
6d60360b566e051dfb2fa71879d0f9751392f3709"
> -SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D "70e97ab5b9600328b977268fc9=
2ca4aa53064e4e97468df35215d4396e509279"
> +SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D "650e7a890a52869cd14e230565=
2bff775aec7fc2cf47fc62cf4a89ff07242333"
> +SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D "0c0129717da1e27ccf2c56d=
a950d2fe56973f71beec9e80ae6904b282d2f0ee9"
> +SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D "7d891d3e9bc4f1151545c83cbe=
3bc6af9ed234388c45ca2e19641262f48615e2"
>
> -SRC_URI[rust-std-snapshot-i586.sha256sum] =3D "a8125d72e06f2d866472a7aca=
3bd20a247160171d23a75c4207761a05e00ed5b"
> +SRC_URI[rust-std-snapshot-i586.sha256sum] =3D "f52e3ac35157e90f86e5ca6c1=
77a43774425c24a51b15655ed61f6209c7db6f0"
>
> -SRC_URI[rust-std-snapshot-sparc64.sha256sum] =3D "7d50ff8499d8925ea973aa=
659e1a88190547615b3cfecb79e776ef8de953b755"
> +SRC_URI[rust-std-snapshot-sparc64.sha256sum] =3D "b06933f6f94cd30e1c2415=
b37db97a94533a727aa5d32a34ee80c6742ee418d2"
>
> SRC_URI +=3D " \
>     ${RUST_DIST_SERVER}/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=3Drust-std-=
snapshot-${RUST_BUILD_ARCH};subdir=3Drust-snapshot-components \
> diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-de=
vtools/rust/rust-source.inc
> index a0a788f3601b..9c473caa0d46 100644
> --- a/meta/recipes-devtools/rust/rust-source.inc
> +++ b/meta/recipes-devtools/rust/rust-source.inc
> @@ -7,7 +7,7 @@ SRC_URI +=3D "https://static.rust-lang.org/dist/rustc-${R=
UST_VERSION}-src.tar.xz;n
>             file://zlib-off64_t.patch;patchdir=3D${RUSTSRC} \
>             file://0001-musl-Define-SOCK_SEQPACKET-in-common-place.patch;=
patchdir=3D${RUSTSRC} \
> "
> -SRC_URI[rust.sha256sum] =3D "bb8e9c564566b2d3228d95de9063a9254182446a161=
353f1d843bfbaf5c34639"
> +SRC_URI[rust.sha256sum] =3D "5814699031aafdcc2e2f71fc9b389678cd7042350d1=
583da061463d8e88681c7"
>
> RUSTSRC =3D "${WORKDIR}/rustc-${RUST_VERSION}-src"
>
> diff --git a/meta/recipes-devtools/rust/rust_1.70.0.bb b/meta/recipes-dev=
tools/rust/rust_1.71.0.bb
> similarity index 100%
> rename from meta/recipes-devtools/rust/rust_1.70.0.bb
> rename to meta/recipes-devtools/rust/rust_1.71.0.bb
> --
> 2.39.0
>
>
>
>
>
>
>
> --
> # Randy MacLeod
> # Wind River Linux
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186264): https://lists.openembedded.org/g/openembedde=
d-core/message/186264
> Mute This Topic: https://lists.openembedded.org/mt/100230901/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

