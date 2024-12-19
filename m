Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37B71E77184
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 09:17:12 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web10.125833.1734599829382149256
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Dec 2024 01:17:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FEHAICrQ;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ffd6b7d77aso7386861fa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 01:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734599827; x=1735204627; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/fmUZV9uPymiKXu6rCdyfk8+DbQgYEjhznQN2XK0OKg=;
        b=FEHAICrQEMdOsbXXd9qqrU5vKa6d/o5ZnIwPd7Z8z+srpqV8Pjo2mFlto7rw8zq+LT
         7jjVDcC9b2kQJTdwfFjefZvRLbXlOxj2zV5gvBL5blDpStuou+I8a22cKEHr7wFtT8tf
         w5oK7xdpbbePjroqYCsxjjO3RSdBcGq4OHLaT3XpK6DuC/rWwNDT8HjZhXr+oUr4oFxk
         7oCA7soy0WciUyTIWy36iaonhhruCoOu5BKcfUZRENT05uLaRnwx+MdVDQJPxaMYjOT7
         VJQOwXawil6WuKmmzSKDAlYXfBQuMajhRjwNVtg1Rxv7tZaeBpsBRgCUYOFW1H9WyZ5y
         I1kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734599827; x=1735204627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/fmUZV9uPymiKXu6rCdyfk8+DbQgYEjhznQN2XK0OKg=;
        b=W67Sk30BHadSan/vNlpSLmce6Tu4xSnkJuL+azH8LtqUtBeCKxDV9tKKJOjhUXrV4P
         McA9l+B6ISIu0EFJJqmaEWydM5P+Q6Mzhzb/MPLusEMFpFgFOkkjHDJPaNoB/r+71Pu0
         903xw7N5jwqicvaLGYtqoz3m8Y+Q9r6KfzB9uucdx6i3GYGTSnZ0th74sR0IVIiijfht
         HxCo4m00AplF8CIL+TNddfzw4/p1QxWgWbr6yeyLpsnu/DQK63TCOrlw4U7XSuirTpXt
         hYE9XA+AfEYnmFNGkIQWGyxKicFgz9O16gtsQa/NZYx128VxsYv5N9hUqBzAbOfyk0HR
         2Kiw==
X-Gm-Message-State: AOJu0YzsU4cvnltxoerWS4csF4kJyF7Z3MiQ5gVUsNQsd/iz7RC9GA+R
	ae8zAOJeN0CIjw1i1XriN3UXkiA9Cnf3PPPV2J4BX4Tnca3yJGIB1QSIFo3fB5ehyL9q5hsUorl
	WRbegMQ4EHRysGXfcL4jSzHTwtngoHK6b
X-Gm-Gg: ASbGncvwZg8dOpXDVvp3toknINAU9l0Srls44mVfqWq4OWwmAXmfYZYls6/W5JU6pKi
	TF4fA7KCe4IWN4q+yJNdSgt+WvUgcLmfsYk08EaOy
X-Google-Smtp-Source: AGHT+IEkWbjgJpyahatNFtpRhh/nHr49tSss6ekHGyd0+To4soJrh8RDJClWyzEbSiT74mef3Xc6VTzROoanNYpmNfM=
X-Received: by 2002:a2e:bc12:0:b0:302:3ff6:c8c6 with SMTP id
 38308e7fff4ca-3044db68d6dmr21469651fa.33.1734599827118; Thu, 19 Dec 2024
 01:17:07 -0800 (PST)
MIME-Version: 1.0
References: <cover.1734553652.git.steve@sakoman.com> <d87597ebbafa1ec77c21c72c9d3183e00ad9985b.1734553652.git.steve@sakoman.com>
In-Reply-To: <d87597ebbafa1ec77c21c72c9d3183e00ad9985b.1734553652.git.steve@sakoman.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 19 Dec 2024 10:16:52 +0100
Message-ID: <CA+chaQdGJn3tm3Cs_aG0un2HgHOXqEvM7YG5z9pA+HTrAUbb3Q@mail.gmail.com>
Subject: Re: [OE-core][scarthgap 10/10] rust: add reproducibility patch to
 eliminate host leakage
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 09:17:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208901

Small reminder for people doing incremental builds and having
similarly short memory as me.

This might cause errors like:

error[E0464]: multiple candidates for `rmeta` dependency `core` found
  |
  =3D note: candidate #1:
lib32-python3-bcrypt/4.1.2/lib32-recipe-sysroot/usr/lib/rustlib/armv7-webos=
mllib32-linux-gnueabi/lib/libcore-0efa44efb479c482.rmeta
  =3D note: candidate #2:
lib32-python3-bcrypt/4.1.2/lib32-recipe-sysroot/usr/lib/rustlib/armv7-webos=
mllib32-linux-gnueabi/lib/libcore-6dc2d356d81e0fd8.rmeta

in all recipes using rust.

If you see this, then easiest work around is to cleansstate libstd-rs
(lib32-libstd-rs with multilib) and all failing recipes and start
again. Ideally help to fix it properly.

From:
#yocto/2024-05-29.log

13:24 < JaMa> anyone seeing "error[E0464]: multiple candidates for
`rmeta` dependency `core` found" for various dependencies in rust
recipes (after the update from yesterday), libstd-rs now provides
multiple versions in incremental build (unless you explicitly rebuild
from scratch after -c cleansstate) kanavin_ have you seen this before?
13:24 < JaMa> buildhistory-diff -p buildhistory
13:24 < JaMa> packages/raspberrypi4_64-webos-linux/libstd-rs/libstd-rs-dev:
PKGSIZE changed from 304061571 to 160359626 (-47%)
13:24 < kanavin_> JaMa, incremental builds in rust are broken
13:25 < JaMa> whole buildhistory-diff after rebuilding with
cleansstate https://dpaste.com/EZGZ4PAYT
13:25 < kanavin_> it doesn't clean itself properly
13:25 < JaMa> ok, haven't seen this one before, so I guess I was lucky, tha=
nks
13:36 < RP> kanavin_: do we know what isn't cleaned properly in the rust bu=
ilds?
13:42 < kanavin_> RP: I'm not sure. If JaMa can provide a reproducer I
can take a look.
14:07 < JaMa> in my case today it was libstd-rs (I had to cleansstate
all its users as well after rebuilding it, but the culprint was
duplicated files installed and staged by libstd-rs)
14:08 < RP> I've seen this kind of issue before but couldn't reproduce it :=
/
14:09 < JaMa> I'll try, because I'm pretty sure I've built libstd-rs
from scratch yesterday and today it was rebuilt because of the last 4
commits currently in master (so I guess if I checkout HEAD~5, build
libstd-rs, checkout master, build it again than I might see the issue)
14:28 < JaMa> hmm this trivial reproducer didn't work
14:29 < JaMa> libstd-rs-1.75.0-r0 was rebuilt from do_fetch after
updating oe-core (and cleaning dirs while doing so)
14:58 < RP> JaMa: sounds like what I ran into last time :/

Cheers,

On Wed, Dec 18, 2024 at 11:03=E2=80=AFPM Steve Sakoman via
lists.openembedded.org <steve=3Dsakoman.com@lists.openembedded.org>
wrote:
>
> From: Alexander Kanavin <alex@linutronix.de>
>
> [YOCTO #15185]
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 924df18b47e9a69fa295bafe37bdb39d8eaea2bb)
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  ...te-host-information-into-compilation.patch | 51 +++++++++++++++++++
>  meta/recipes-devtools/rust/rust-source.inc    |  1 +
>  2 files changed, 52 insertions(+)
>  create mode 100644 meta/recipes-devtools/rust/files/0001-cargo-do-not-wr=
ite-host-information-into-compilation.patch
>
> diff --git a/meta/recipes-devtools/rust/files/0001-cargo-do-not-write-hos=
t-information-into-compilation.patch b/meta/recipes-devtools/rust/files/000=
1-cargo-do-not-write-host-information-into-compilation.patch
> new file mode 100644
> index 0000000000..a6ee867605
> --- /dev/null
> +++ b/meta/recipes-devtools/rust/files/0001-cargo-do-not-write-host-infor=
mation-into-compilation.patch
> @@ -0,0 +1,51 @@
> +From 065d7c263091118437465d714d8a29dbb6296921 Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex@linutronix.de>
> +Date: Mon, 13 May 2024 14:57:54 +0200
> +Subject: [PATCH] cargo: do not write host information into compilation u=
nit
> + hashes
> +
> +This breaks reproducibility in cross-builds where the cross-target
> +can be the same, but build hosts are different, as seen with
> +"rustc --version -v":
> +...
> +host: x86_64-unknown-linux-gnu
> +
> +vs.
> +
> +host: aarch64-unknown-linux-gnu
> +
> +This can possibly be improved by only hashing host info if the build
> +is a native one (e.g. there's no --target option passed to cargo
> +invocation) but I'm not sure how.
> +
> +Upstream-Status: Inappropriate [reported at https://github.com/rust-lang=
/cargo/issues/13922]
> +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> +---
> + .../src/cargo/core/compiler/context/compilation_files.rs      | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/tools/cargo/src/cargo/core/compiler/context/compilation=
_files.rs b/src/tools/cargo/src/cargo/core/compiler/context/compilation_fil=
es.rs
> +index d83dbf10c..b2ad8d9f3 100644
> +--- a/src/tools/cargo/src/cargo/core/compiler/context/compilation_files.=
rs
> ++++ b/src/tools/cargo/src/cargo/core/compiler/context/compilation_files.=
rs
> +@@ -652,7 +652,7 @@ fn hash_rustc_version(bcx: &BuildContext<'_, '_>, ha=
sher: &mut StableHasher) {
> +     if vers.pre.is_empty() || bcx.config.cli_unstable().separate_nightl=
ies {
> +         // For stable, keep the artifacts separate. This helps if someo=
ne is
> +         // testing multiple versions, to avoid recompiles.
> +-        bcx.rustc().verbose_version.hash(hasher);
> ++        //bcx.rustc().verbose_version.hash(hasher);
> +         return;
> +     }
> +     // On "nightly"/"beta"/"dev"/etc, keep each "channel" separate. Don=
't hash
> +@@ -665,7 +665,7 @@ fn hash_rustc_version(bcx: &BuildContext<'_, '_>, ha=
sher: &mut StableHasher) {
> +     // Keep "host" since some people switch hosts to implicitly change
> +     // targets, (like gnu vs musl or gnu vs msvc). In the future, we ma=
y want
> +     // to consider hashing `unit.kind.short_name()` instead.
> +-    bcx.rustc().host.hash(hasher);
> ++    //bcx.rustc().host.hash(hasher);
> +     // None of the other lines are important. Currently they are:
> +     // binary: rustc  <-- or "rustdoc"
> +     // commit-hash: 38114ff16e7856f98b2b4be7ab4cd29b38bed59a
> +--
> +2.39.2
> +
> diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-de=
vtools/rust/rust-source.inc
> index 8a8e48b8ca..55ea1b77e6 100644
> --- a/meta/recipes-devtools/rust/rust-source.inc
> +++ b/meta/recipes-devtools/rust/rust-source.inc
> @@ -13,6 +13,7 @@ SRC_URI +=3D "https://static.rust-lang.org/dist/rustc-$=
{RUST_VERSION}-src.tar.xz;n
>              file://target-build-value.patch;patchdir=3D${RUSTSRC} \
>              file://0001-Handle-vendored-sources-when-remapping-paths.pat=
ch;patchdir=3D${RUSTSRC} \
>              file://repro-issue-fix-with-v175.patch;patchdir=3D${RUSTSRC}=
 \
> +            file://0001-cargo-do-not-write-host-information-into-compila=
tion.patch;patchdir=3D${RUSTSRC} \
>  "
>  SRC_URI[rust.sha256sum] =3D "4526f786d673e4859ff2afa0bab2ba13c918b796519=
a25c1acce06dba9542340"
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#208890): https://lists.openembedded.org/g/openembedde=
d-core/message/208890
> Mute This Topic: https://lists.openembedded.org/mt/110188795/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

