Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AD74C2BA18
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 09:41:24 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.52391.1718617281251539894
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jun 2024 02:41:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m3n+gqqg;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ead2c6b50bso45984261fa.0
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 02:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718617279; x=1719222079; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RcBbsJ/eUuP2GplA7HZd3VvWWqHOh8fQ9evzCRGOWkw=;
        b=m3n+gqqg3p1jpbLlHAzGQWDNUein8JGiJEwN8fYa0HdGGZMK5xbzrbHV00/4PRWhDl
         04LFC3A4HEbZ+JCSBwQ/rYzhx6g7Gm/0lHohEfjptzM7dh2EFoDHL3CXIkE8/nGSUBHK
         RKOlkXaEMECrfwBOSquKIpWhjGrvdEaydPBtkEQLd7/XTdsMusR7SXGeZYudw9kncyrk
         T+dVDxRrv5b2jzAbd4Aex6OF4lKEtqv5dRrJSWIaMuWr0OwZvFD6GU+l3dm8ycWseaex
         UhMLi5PbHsgssyD7h3LANJfntRtaKTyuF4+zVNXAu52waBgp+28SvbjmmcM9kzqO+Fcm
         i1dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718617279; x=1719222079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RcBbsJ/eUuP2GplA7HZd3VvWWqHOh8fQ9evzCRGOWkw=;
        b=RKJckociaG7CvsmeLlD3gNk3yPwT8K/fJfZXK1d368FUoble29qWyphkbMqMYsoKjm
         dsqD0+Cxr5Fiwak/vfBuz71I5BYxfuI3PY1NOuvDJ8fq8DlppozlE5P1AlJ2wL4RfmnU
         L70LD8lvJgR6tsvgtaFeQKE1SfHYQ5JIxlDdz4RSb7L9MkDtTf4CW6kozV5H2EuUikR4
         Qk+RVrGJbLYbuzeuac9vlMGX1f4lBi9qaqRffD46BAh4jbr82x8nX4QxHl9hiUekqyY0
         TJPwSMkGA1SXIx/X5bB7DrfFkxoDIPO6auU1wNiURL2PHnArQoh990tcjNRe85p1rlaN
         XBdw==
X-Gm-Message-State: AOJu0YwsoZ2ymLx45cxck1r+YLiqW7PF8m/bp2mhLXJpTxBIuKagQ4Vd
	9qd+XSIvYjXHe8HxiaEpGVMMkpz0Wjfu6T/rcP4Rn1UywwUQ40MjZQgT763d9HboAurG32X0Kyt
	TtIMQDaRTe6249Uv1Yrpy4U05S7Ip3w==
X-Google-Smtp-Source: AGHT+IFwOcqDZlD8HTsW/z5G8Fogz0yJ8zkixSe0Pm8J5B2ZG+g73s/D6G5Wi+oRmBN/wWQCQ3NpSpcEM1wzkRrMuOw=
X-Received: by 2002:a2e:9784:0:b0:2eb:e49c:8207 with SMTP id
 38308e7fff4ca-2ec0e60d960mr57299631fa.53.1718617279129; Mon, 17 Jun 2024
 02:41:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240615160415.3457966-1-Yash.Shinde@windriver.com> <20240615160415.3457966-3-Yash.Shinde@windriver.com>
In-Reply-To: <20240615160415.3457966-3-Yash.Shinde@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 17 Jun 2024 11:41:16 +0200
Message-ID: <CANNYZj-9DUTn5EN1j6xKF6MB4boRqrhEjGZ76FOFcYk+e0moVw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] rust: reproducibility issue fix with v1.76
To: Yash.Shinde@windriver.com
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com, 
	Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 09:41:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200798

This does not address my previous comment. This needs a link to
upstream report or patch submission.

Alex

On Sat, 15 Jun 2024 at 18:05, <Yash.Shinde@windriver.com> wrote:
>
> From: Yash Shinde <Yash.Shinde@windriver.com>
>
> A few crates are using the updated version of the 'cc' crate and
> this is causing the generated object file names containing a unique hashm=
ap id.
> The hashmap addition to generated files is reverted here.
>
> Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
> Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
> ---
>  ...epro-issue-fix-with-cc-crate-hashmap.patch | 59 +++++++++++++++++++
>  meta/recipes-devtools/rust/rust-source.inc    |  1 +
>  2 files changed, 60 insertions(+)
>  create mode 100644 meta/recipes-devtools/rust/files/repro-issue-fix-with=
-cc-crate-hashmap.patch
>
> diff --git a/meta/recipes-devtools/rust/files/repro-issue-fix-with-cc-cra=
te-hashmap.patch b/meta/recipes-devtools/rust/files/repro-issue-fix-with-cc=
-crate-hashmap.patch
> new file mode 100644
> index 0000000000..20d7e3fc15
> --- /dev/null
> +++ b/meta/recipes-devtools/rust/files/repro-issue-fix-with-cc-crate-hash=
map.patch
> @@ -0,0 +1,59 @@
> +rust: reproducibility issue fix with v1.76
> +
> +A few crates are using the updated version of the 'cc' crate and this is=
 causing the generated object file names containing a unique hashmap id.
> +The hashmap addition to generated files is reverted here.
> +
> +
> +Upstream-Status: Inappropriate [patches need rework]
> +Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
> +---
> +--- a/vendor/cc-1.0.79/src/lib.rs
> ++++ b/vendor/cc-1.0.79/src/lib.rs
> +@@ -56,12 +56,11 @@
> + #![allow(deprecated)]
> + #![deny(missing_docs)]
> +
> +-use std::collections::{hash_map, HashMap};
> ++use std::collections::HashMap;
> + use std::env;
> + use std::ffi::{OsStr, OsString};
> + use std::fmt::{self, Display, Formatter};
> + use std::fs;
> +-use std::hash::Hasher;
> + use std::io::{self, BufRead, BufReader, Read, Write};
> + use std::path::{Component, Path, PathBuf};
> + use std::process::{Child, Command, Stdio};
> +@@ -1037,24 +1036,7 @@
> +
> +         let mut objects =3D Vec::new();
> +         for file in self.files.iter() {
> +-            let obj =3D if file.has_root() {
> +-                // If `file` is an absolute path, prefix the `basename`
> +-                // with the `dirname`'s hash to ensure name uniqueness.
> +-                let basename =3D file
> +-                    .file_name()
> +-                    .ok_or_else(|| Error::new(ErrorKind::InvalidArgumen=
t, "file_name() failure"))?
> +-                    .to_string_lossy();
> +-                let dirname =3D file
> +-                    .parent()
> +-                    .ok_or_else(|| Error::new(ErrorKind::InvalidArgumen=
t, "parent() failure"))?
> +-                    .to_string_lossy();
> +-                let mut hasher =3D hash_map::DefaultHasher::new();
> +-                hasher.write(dirname.to_string().as_bytes());
> +-                dst.join(format!("{:016x}-{}", hasher.finish(), basenam=
e))
> +-                    .with_extension("o")
> +-            } else {
> +-                dst.join(file).with_extension("o")
> +-            };
> ++            let obj =3D dst.join(file).with_extension("o");
> +             let obj =3D if !obj.starts_with(&dst) {
> +                 dst.join(obj.file_name().ok_or_else(|| {
> +                     Error::new(ErrorKind::IOError, "Getting object file=
 details failed.")
> +Index: rustc-1.77.0-src/vendor/cc-1.0.79/.cargo-checksum.json
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- a/vendor/cc-1.0.79/.cargo-checksum.json
> ++++ b/vendor/cc-1.0.79/.cargo-checksum.json
> +@@ -1 +1 @@
> +-{"files":{"Cargo.lock":"dddb9c49058d411a098e98dc1c06e3bc89f859a2080d96c=
11b11aec67394bb8c","Cargo.toml":"1953a8bc4b98e351fe75917c151b1e08a46531d562=
aebba25a90add4aadecac2","LICENSE-APACHE":"a60eea817514531668d7e00765731449f=
e14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"378f5840b258e2779c39418f3f2=
d7b2ba96f1c7917dd6be0713f88305dbda397","README.md":"58af5106352aafa62175a90=
f8a5f25fa114028bf909220dc0735d79745999ec1","src/bin/gcc-shim.rs":"36dc4e447=
428e73c548cc7106ca1e8f282c098463b014e13a729a44445de4880","src/com.rs":"29d0=
dee08a656ab1a4cc3e5fe24542e0fab5c1373cbc9b05059f7572cf9b8313","src/lib.rs":=
"17a4659710aa290c4ed9c23063c7b202c5bcf2a84de33aa1f01fc6fded69a1f8","src/reg=
istry.rs":"98ae2b71781acc49297e5544fa0cf059f735636f8f1338edef8dbf7232443945=
","src/setup_config.rs":"72deaf1927c0b713fd5c2b2d5b8f0ea3a303a00fda15794278=
95cac26a94122d","src/vs_instances.rs":"2d3f8278a803b0e7052f4eeb1979b29f963d=
d0143f4458e2cb5f33c4e5f0963b","src/winapi.rs":"e128e95b2d39ae7a02f54a7e25d3=
3c488c14759b9f1a50a449e10545856950c3","src/windows_registry.rs":"1f973f804b=
4b451e48ff6d98ce660355772f164dfdf79a6ae514645c7c764005","tests/cc_env.rs":"=
e02b3b0824ad039b47e4462c5ef6dbe6c824c28e7953af94a0f28f7b5158042e","tests/cf=
lags.rs":"57f06eb5ce1557e5b4a032d0c4673e18fbe6f8d26c1deb153126e368b96b41b3"=
,"tests/cxxflags.rs":"c2c6c6d8a0d7146616fa1caed26876ee7bc9fcfffd525eb474359=
3cade5f3371","tests/support/mod.rs":"a3c8d116973bb16066bf6ec4de5143183f97de=
7aad085d85f8118a2eaac3e1e0","tests/test.rs":"61fb35ae6dd5cf506ada000bdd82c9=
2e9f8eac9cc053b63e83d3f897436fbf8f"},"package":"50d30906286121d95be3d479533=
b458f87493b30a4b5f79a607db8f5d11aa91f"}
> +\ No newline at end of file
> ++{"files":{"Cargo.lock":"dddb9c49058d411a098e98dc1c06e3bc89f859a2080d96c=
11b11aec67394bb8c","Cargo.toml":"1953a8bc4b98e351fe75917c151b1e08a46531d562=
aebba25a90add4aadecac2","LICENSE-APACHE":"a60eea817514531668d7e00765731449f=
e14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"378f5840b258e2779c39418f3f2=
d7b2ba96f1c7917dd6be0713f88305dbda397","README.md":"58af5106352aafa62175a90=
f8a5f25fa114028bf909220dc0735d79745999ec1","src/bin/gcc-shim.rs":"36dc4e447=
428e73c548cc7106ca1e8f282c098463b014e13a729a44445de4880","src/com.rs":"29d0=
dee08a656ab1a4cc3e5fe24542e0fab5c1373cbc9b05059f7572cf9b8313","src/lib.rs":=
"dfb36b17362e9a5b266cb19a229d982e8c0bba784b1e99769f690692b0cd5c4e","src/reg=
istry.rs":"98ae2b71781acc49297e5544fa0cf059f735636f8f1338edef8dbf7232443945=
","src/setup_config.rs":"72deaf1927c0b713fd5c2b2d5b8f0ea3a303a00fda15794278=
95cac26a94122d","src/vs_instances.rs":"2d3f8278a803b0e7052f4eeb1979b29f963d=
d0143f4458e2cb5f33c4e5f0963b","src/winapi.rs":"e128e95b2d39ae7a02f54a7e25d3=
3c488c14759b9f1a50a449e10545856950c3","src/windows_registry.rs":"1f973f804b=
4b451e48ff6d98ce660355772f164dfdf79a6ae514645c7c764005","tests/cc_env.rs":"=
e02b3b0824ad039b47e4462c5ef6dbe6c824c28e7953af94a0f28f7b5158042e","tests/cf=
lags.rs":"57f06eb5ce1557e5b4a032d0c4673e18fbe6f8d26c1deb153126e368b96b41b3"=
,"tests/cxxflags.rs":"c2c6c6d8a0d7146616fa1caed26876ee7bc9fcfffd525eb474359=
3cade5f3371","tests/support/mod.rs":"a3c8d116973bb16066bf6ec4de5143183f97de=
7aad085d85f8118a2eaac3e1e0","tests/test.rs":"61fb35ae6dd5cf506ada000bdd82c9=
2e9f8eac9cc053b63e83d3f897436fbf8f"},"package":"50d30906286121d95be3d479533=
b458f87493b30a4b5f79a607db8f5d11aa91f"}
> diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-de=
vtools/rust/rust-source.inc
> index 6b7414b5c1..e68bc18c9f 100644
> --- a/meta/recipes-devtools/rust/rust-source.inc
> +++ b/meta/recipes-devtools/rust/rust-source.inc
> @@ -10,6 +10,7 @@ SRC_URI +=3D "https://static.rust-lang.org/dist/rustc-$=
{RUST_VERSION}-src.tar.xz;n
>              file://repro-issue-fix-with-v175.patch;patchdir=3D${RUSTSRC}=
 \
>              file://0001-cargo-do-not-write-host-information-into-compila=
tion.patch;patchdir=3D${RUSTSRC} \
>              file://rust-oe-selftest.patch;patchdir=3D${RUSTSRC} \
> +            file://repro-issue-fix-with-cc-crate-hashmap.patch;patchdir=
=3D${RUSTSRC} \
>  "
>  SRC_URI[rust.sha256sum] =3D "805482b436442a6786d270cacbab8f00529e06141b2=
7b7fb01909b97ce4f3464"
>
> --
> 2.43.0
>

