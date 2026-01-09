Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38682D16809
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 10:47:17 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7574.1767955631871397975
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jan 2026 02:47:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=qrYtL+oa;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-430f2ee2f00so2262490f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Jan 2026 02:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1767955630; x=1768560430; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vlEmDeIoBuXbSBjT8mdGFbZzzFMH7wttsnbQe1YBets=;
        b=qrYtL+oalVBkdBAigPOTTYHLaokRfZj0Fejx5UffbxOeacAuhD4Z/TGk35c8jyX7zP
         9OfQEBfZlXolkB4mVK/CZKFk/HIFwnUXx3gLPFE0agGibswvuciPzQtqyLP0MIW+QuAl
         THXnCMjthg2PPnFhwIVh5I7P+SK8aWykHJ7gA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767955630; x=1768560430;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vlEmDeIoBuXbSBjT8mdGFbZzzFMH7wttsnbQe1YBets=;
        b=rohhLrcTTR09d5mh9C8H1vKwnvwIw9nV6CpvyfnBqY2IsUcHW7qMy5UoXifwWOB6Wq
         X+R4W4jR90L8ZGQUGffC/6DaFoir/5QbOLNSJoBrjpcabGTW87GeYUQPm6b4BURzuVuW
         w5vJ3YbJmsYYN71PNMNSdR9zpFdZhMK/pdWGJDIWKrQZuHTfSSCNKK2RnpIk5nlKF5v7
         sFyJjTED6sEq4wBSJB/WYXm0XxHk5UStsegne/gHyKq4sUXC2P0Exh9LCqEyKVH7JCL3
         Vzns/VGI+KtWJEifsQtSpJfzZPGLM+WIZKyyvSPxiO5YPCnVuYZWGA59gDetCMVS+JQ5
         ESQA==
X-Gm-Message-State: AOJu0Yw/VSnZnF7J4Xo1QoXFp1JZXAp+y6VvXQ8ssRwjVKmb6B9ZRa+7
	Psd1vImFZM6ZFxTTpwknpF549TisNEwuU8BCbqUBDlGRAvofe9O020s3Lv6ZZj6Qcv9gtz4JLax
	TDYsLmWj8P5oVnSVlhv2tLijPJ9lQ28Auez/zCmYcew==
X-Gm-Gg: AY/fxX7pmdpc7aV8G5dpfJprEA1hhowHu9eQf7q9wu1z4Iy/KJFSihqgj+mLBr4t9hr
	+Fd2FkVjMMuRK/dnWHUzyAT1U8TCnxYYpo/O0MZJrnxLWphG8mHONp8cijk8nwY/2yXiGwFuh1M
	ajn0n+d7emAWGIVf2MUuvxV4JRCMNpdfrWfqEPgdSYmbK4XBOWDB8/qUlZNBY0huTWxpTRIOQSQ
	EdEr8Z+Vv2lu68ZLDzhGFC2dyi0k71WP7K42hzKN+s9j0zDpagmqf3pn0tJdmYR1VmJV8qAmWw9
	vvkgGafwddv1XlFd0A687P1Up/LfbA==
X-Google-Smtp-Source: AGHT+IFn3q5/inJ6C1pIqxJ9vaZQXW1UDSiiLbhDvrEv3Hw650ax2i/GavTNx5tz1JKq1AGumBw4lTnxUhVeJuYi4bE=
X-Received: by 2002:a05:6000:24c6:b0:430:f182:788f with SMTP id
 ffacd0b85a97d-432c377c603mr10384460f8f.21.1767955629909; Fri, 09 Jan 2026
 02:47:09 -0800 (PST)
MIME-Version: 1.0
References: <20260109045447.1933604-1-alistair.francis@wdc.com>
In-Reply-To: <20260109045447.1933604-1-alistair.francis@wdc.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Fri, 9 Jan 2026 11:46:43 +0100
X-Gm-Features: AZwV_Qh8AY-X3sbPuEk7_2ZEb5DN1TV3BiaC6cTqurXAUiPJ2mruMmgIEKShxzo
Message-ID: <CAMSfU+4nuN3cEPQroCLO8-2xLCm5nSA7QAdANaeJAX0Ms0qm5A@mail.gmail.com>
Subject: Re: [OE-Core][PATCH 1/2] rust: Install the Rust source
To: alistair23@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Alistair Francis <alistair.francis@wdc.com>
Content-Type: multipart/alternative; boundary="0000000000004cbbad0647f23f15"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jan 2026 10:47:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229101

--0000000000004cbbad0647f23f15
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 9 janv. 2026 =C3=A0 05:55, Alistair Francis via lists.openembedded.=
org
<alistair23=3Dgmail.com@lists.openembedded.org> a =C3=A9crit :

> From: Alistair Francis <alistair.francis@wdc.com>
>
> When building the Linux kernel with Rust support enabled the kernel
> expects to find the Rust source as the kernel build system will cross
> compile the core library.
>
> This patch uses the Rust tooling to install the Rust source when we
> install the compiller as well.
>

Hello,

FYI, there is currently a whole series about enabling rust in the
linux-yocto kernel :
https://lore.kernel.org/openembedded-core/20251230141540.1974380-1-Harish.S=
adineni@windriver.com/
How does your series interact with it? If both do the same thing, maybe you
can help reviewing Harish's one?

Also, the patch you add only mentions adding the *doc* why does that help
with linux-yocto searching for rust *code*?

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  ...-host-documentation-is-built-before-.patch | 60 +++++++++++++++++++
>  meta/recipes-devtools/rust/rust-source.inc    |  1 +
>  meta/recipes-devtools/rust/rust_1.92.0.bb     |  4 +-
>  3 files changed, 64 insertions(+), 1 deletion(-)
>  create mode 100644
> meta/recipes-devtools/rust/files/0001-bootstrap-Ensure-host-documentation=
-is-built-before-.patch
>
> diff --git
> a/meta/recipes-devtools/rust/files/0001-bootstrap-Ensure-host-documentati=
on-is-built-before-.patch
> b/meta/recipes-devtools/rust/files/0001-bootstrap-Ensure-host-documentati=
on-is-built-before-.patch
> new file mode 100644
> index 0000000000..e561266d70
> --- /dev/null
> +++
> b/meta/recipes-devtools/rust/files/0001-bootstrap-Ensure-host-documentati=
on-is-built-before-.patch
> @@ -0,0 +1,60 @@
> +From 2e89bf7969ac6d77b7c6a38265b1eabc8ec6df7a Mon Sep 17 00:00:00 2001
> +From: Alistair Francis <alistair.francis@wdc.com>
> +Date: Fri, 9 Jan 2026 08:35:43 +1000
> +Subject: [PATCH] bootstrap: Ensure host documentation is built before
> tarball
> + is created
> +
> +`run_default_doc_steps()` is called to ensure the documentation is built
> +by `Docs::run()` and it should build the documentation if it isn't
> +already built.
> +
> +When running the `install src` command I'm seeing failures as the
> +`builder.doc_out(host)` directory does not exist. This is because
> +`match_paths_to_steps_and_run()` doesn't actually build any
> +documentation as the `paths.is_empty()` causes an early return. This
> +results in install failures as the `*/doc` src directory doesn't exist.
> +
> +This patch passes the paths to `run_host_step_descriptions()` when
> building
> +documentation to ensure it is correctly built.
> +
> +This fixes installing the Rust source code in OpenEmbedded.
> +
> +Upstream-Status: Submitted [https://github.com/rust-lang/rust/pull/15084=
5
> ]
> +Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> +---
> + src/bootstrap/src/core/build_steps/dist.rs | 2 +-
> + src/bootstrap/src/core/builder/mod.rs      | 5 +++++
> + 2 files changed, 6 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/bootstrap/src/core/build_steps/dist.rs
> b/src/bootstrap/src/core/build_steps/dist.rs
> +index f47b0c0b007..2fbb068632e 100644
> +--- a/src/bootstrap/src/core/build_steps/dist.rs
> ++++ b/src/bootstrap/src/core/build_steps/dist.rs
> +@@ -83,7 +83,7 @@ fn run(self, builder: &Builder<'_>) ->
> Option<GeneratedTarball> {
> +         // FIXME: explicitly enumerate the steps that should be execute=
d
> here, and gather their
> +         // documentation, rather than running all default steps and the=
n
> read their output
> +         // from a shared directory.
> +-        builder.run_default_doc_steps();
> ++        builder.run_host_default_doc_steps();
> +
> +         let dest =3D "share/doc/rust/html";
> +
> +diff --git a/src/bootstrap/src/core/builder/mod.rs
> b/src/bootstrap/src/core/builder/mod.rs
> +index 4a04b97c549..16c1c324be0 100644
> +--- a/src/bootstrap/src/core/builder/mod.rs
> ++++ b/src/bootstrap/src/core/builder/mod.rs
> +@@ -1117,6 +1117,11 @@ pub fn execute_cli(&self) {
> +
>  self.run_step_descriptions(&Builder::get_step_descriptions(self.kind),
> &self.paths);
> +     }
> +
> ++    /// Run all default documentation steps to build documentation.
> ++    pub fn run_host_default_doc_steps(&self) {
> ++
> self.run_step_descriptions(&Builder::get_step_descriptions(Kind::Doc),
> &self.paths);
> ++    }
> ++
> +     /// Run all default documentation steps to build documentation.
> +     pub fn run_default_doc_steps(&self) {
> +
>  self.run_step_descriptions(&Builder::get_step_descriptions(Kind::Doc),
> &[]);
> +--
> +2.52.0
> +
> diff --git a/meta/recipes-devtools/rust/rust-source.inc
> b/meta/recipes-devtools/rust/rust-source.inc
> index d7d44510e4..8a22d484c1 100644
> --- a/meta/recipes-devtools/rust/rust-source.inc
> +++ b/meta/recipes-devtools/rust/rust-source.inc
> @@ -8,6 +8,7 @@ SRC_URI +=3D "
> https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
>
>  file://0001-src-core-build_steps-tool.rs-switch-off-lto-for-rust.patch;p=
atchdir=3D${RUSTSRC}
> \
>
>  file://revert-link-std-statically-in-rustc_driver-feature.patch;patchdir=
=3D${RUSTSRC}
> \
>
>  file://0001-riscv32-Define-plain-syscalls-as-their-time64-varian.patch;p=
atchdir=3D${RUSTSRC}
> \
> +
> file://0001-bootstrap-Ensure-host-documentation-is-built-before-.patch \
>  "
>  SRC_URI[rust.sha256sum] =3D
> "ebee170bfe4c4dfc59521a101de651e5534f4dae889756a5c97ca9ea40d0c307"
>
> diff --git a/meta/recipes-devtools/rust/rust_1.92.0.bb
> b/meta/recipes-devtools/rust/rust_1.92.0.bb
> index a25f65f674..306661b6e4 100644
> --- a/meta/recipes-devtools/rust/rust_1.92.0.bb
> +++ b/meta/recipes-devtools/rust/rust_1.92.0.bb
> @@ -6,8 +6,9 @@ LIC_FILES_CHKSUM =3D
> "file://COPYRIGHT;md5=3D11a3899825f4376896e438c8c753f8dc"
>
>  inherit rust
>  inherit cargo_common
> +inherit pkgconfig
>
> -DEPENDS +=3D "llvm"
> +DEPENDS +=3D "llvm openssl"
>

This new dependency should be explained in the commit message.


>  # native rust uses cargo/rustc from binary snapshots to bootstrap
>  # but everything else should use our native builds
>  DEPENDS:append:class-target =3D " cargo-native rust-native"
> @@ -282,6 +283,7 @@ do_install () {
>
>  rust_do_install() {
>      rust_runx install
> +    rust_runx install src
>  }
>
>  rust_do_install:class-nativesdk() {
> --
> 2.52.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#229091):
> https://lists.openembedded.org/g/openembedded-core/message/229091
> Mute This Topic: https://lists.openembedded.org/mt/117170671/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--0000000000004cbbad0647f23f15
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">Le=C2=A0ven. 9 janv. 2026 =C3=A0=C2=A005:55, =
Alistair Francis via <a href=3D"http://lists.openembedded.org">lists.openem=
bedded.org</a> &lt;alistair23=3D<a href=3D"mailto:gmail.com@lists.openembed=
ded.org">gmail.com@lists.openembedded.org</a>&gt; a =C3=A9crit=C2=A0:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">From: Alistair Franci=
s &lt;<a href=3D"mailto:alistair.francis@wdc.com" target=3D"_blank">alistai=
r.francis@wdc.com</a>&gt;<br>
<br>
When building the Linux kernel with Rust support enabled the kernel<br>
expects to find the Rust source as the kernel build system will cross<br>
compile the core library.<br>
<br>
This patch uses the Rust tooling to install the Rust source when we<br>
install the compiller as well.<br></blockquote><div><br></div><div>Hello,</=
div><div><br></div><div>FYI, there is currently a whole series about enabli=
ng rust in the linux-yocto kernel :=C2=A0<a href=3D"https://lore.kernel.org=
/openembedded-core/20251230141540.1974380-1-Harish.Sadineni@windriver.com/"=
>https://lore.kernel.org/openembedded-core/20251230141540.1974380-1-Harish.=
Sadineni@windriver.com/</a></div><div>How does your series interact with it=
? If both do the same thing, maybe you can help reviewing Harish&#39;s one?=
</div><div><br></div><div>Also, the patch you add only mentions adding the =
*doc* why does that help with linux-yocto searching for rust *code*?</div><=
div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Signed-off-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.=
com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
---<br>
=C2=A0...-host-documentation-is-built-before-.patch | 60 ++++++++++++++++++=
+<br>
=C2=A0meta/recipes-devtools/rust/rust-source.inc=C2=A0 =C2=A0 |=C2=A0 1 +<b=
r>
=C2=A0meta/recipes-devtools/rust/<a href=3D"http://rust_1.92.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">rust_1.92.0.bb</a>=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
4 +-<br>
=C2=A03 files changed, 64 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta/recipes-devtools/rust/files/0001-bootstrap-En=
sure-host-documentation-is-built-before-.patch<br>
<br>
diff --git a/meta/recipes-devtools/rust/files/0001-bootstrap-Ensure-host-do=
cumentation-is-built-before-.patch b/meta/recipes-devtools/rust/files/0001-=
bootstrap-Ensure-host-documentation-is-built-before-.patch<br>
new file mode 100644<br>
index 0000000000..e561266d70<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/rust/files/0001-bootstrap-Ensure-host-documenta=
tion-is-built-before-.patch<br>
@@ -0,0 +1,60 @@<br>
+From 2e89bf7969ac6d77b7c6a38265b1eabc8ec6df7a Mon Sep 17 00:00:00 2001<br>
+From: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc.com" tar=
get=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
+Date: Fri, 9 Jan 2026 08:35:43 +1000<br>
+Subject: [PATCH] bootstrap: Ensure host documentation is built before tarb=
all<br>
+ is created<br>
+<br>
+`run_default_doc_steps()` is called to ensure the documentation is built<b=
r>
+by `Docs::run()` and it should build the documentation if it isn&#39;t<br>
+already built.<br>
+<br>
+When running the `install src` command I&#39;m seeing failures as the<br>
+`builder.doc_out(host)` directory does not exist. This is because<br>
+`match_paths_to_steps_and_run()` doesn&#39;t actually build any<br>
+documentation as the `paths.is_empty()` causes an early return. This<br>
+results in install failures as the `*/doc` src directory doesn&#39;t exist=
.<br>
+<br>
+This patch passes the paths to `run_host_step_descriptions()` when buildin=
g<br>
+documentation to ensure it is correctly built.<br>
+<br>
+This fixes installing the Rust source code in OpenEmbedded.<br>
+<br>
+Upstream-Status: Submitted [<a href=3D"https://github.com/rust-lang/rust/p=
ull/150845" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-la=
ng/rust/pull/150845</a>]<br>
+Signed-off-by: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@wdc=
.com" target=3D"_blank">alistair.francis@wdc.com</a>&gt;<br>
+---<br>
+ src/bootstrap/src/core/build_steps/<a href=3D"http://dist.rs" rel=3D"nore=
ferrer" target=3D"_blank">dist.rs</a> | 2 +-<br>
+ src/bootstrap/src/core/builder/<a href=3D"http://mod.rs" rel=3D"noreferre=
r" target=3D"_blank">mod.rs</a>=C2=A0 =C2=A0 =C2=A0 | 5 +++++<br>
+ 2 files changed, 6 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/src/bootstrap/src/core/build_steps/<a href=3D"http://dist.rs"=
 rel=3D"noreferrer" target=3D"_blank">dist.rs</a> b/src/bootstrap/src/core/=
build_steps/<a href=3D"http://dist.rs" rel=3D"noreferrer" target=3D"_blank"=
>dist.rs</a><br>
+index f47b0c0b007..2fbb068632e 100644<br>
+--- a/src/bootstrap/src/core/build_steps/<a href=3D"http://dist.rs" rel=3D=
"noreferrer" target=3D"_blank">dist.rs</a><br>
++++ b/src/bootstrap/src/core/build_steps/<a href=3D"http://dist.rs" rel=3D=
"noreferrer" target=3D"_blank">dist.rs</a><br>
+@@ -83,7 +83,7 @@ fn run(self, builder: &amp;Builder&lt;&#39;_&gt;) -&gt; =
Option&lt;GeneratedTarball&gt; {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// FIXME: explicitly enumerate the steps=
 that should be executed here, and gather their<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// documentation, rather than running al=
l default steps and then read their output<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0// from a shared directory.<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 builder.run_default_doc_steps();<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 builder.run_host_default_doc_steps();<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0let dest =3D &quot;share/doc/rust/html&q=
uot;;<br>
+ <br>
+diff --git a/src/bootstrap/src/core/builder/<a href=3D"http://mod.rs" rel=
=3D"noreferrer" target=3D"_blank">mod.rs</a> b/src/bootstrap/src/core/build=
er/<a href=3D"http://mod.rs" rel=3D"noreferrer" target=3D"_blank">mod.rs</a=
><br>
+index 4a04b97c549..16c1c324be0 100644<br>
+--- a/src/bootstrap/src/core/builder/<a href=3D"http://mod.rs" rel=3D"nore=
ferrer" target=3D"_blank">mod.rs</a><br>
++++ b/src/bootstrap/src/core/builder/<a href=3D"http://mod.rs" rel=3D"nore=
ferrer" target=3D"_blank">mod.rs</a><br>
+@@ -1117,6 +1117,11 @@ pub fn execute_cli(&amp;self) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.run_step_descriptions(&amp;Builder:=
:get_step_descriptions(self.kind), &amp;self.paths);<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
++=C2=A0 =C2=A0 /// Run all default documentation steps to build documentat=
ion.<br>
++=C2=A0 =C2=A0 pub fn run_host_default_doc_steps(&amp;self) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.run_step_descriptions(&amp;Builder::get_=
step_descriptions(Kind::Doc), &amp;self.paths);<br>
++=C2=A0 =C2=A0 }<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0/// Run all default documentation steps to build docum=
entation.<br>
+=C2=A0 =C2=A0 =C2=A0pub fn run_default_doc_steps(&amp;self) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.run_step_descriptions(&amp;Builder:=
:get_step_descriptions(Kind::Doc), &amp;[]);<br>
+-- <br>
+2.52.0<br>
+<br>
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devt=
ools/rust/rust-source.inc<br>
index d7d44510e4..8a22d484c1 100644<br>
--- a/meta/recipes-devtools/rust/rust-source.inc<br>
+++ b/meta/recipes-devtools/rust/rust-source.inc<br>
@@ -8,6 +8,7 @@ SRC_URI +=3D &quot;<a href=3D"https://static.rust-lang.org/=
dist/rustc-$%7BRUST_VERSION%7D-src.tar.xz;n" rel=3D"noreferrer" target=3D"_=
blank">https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n=
</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-src-core-build_=
steps-tool.rs-switch-off-lto-for-rust.patch;patchdir=3D${RUSTSRC} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://revert-link-std-stat=
ically-in-rustc_driver-feature.patch;patchdir=3D${RUSTSRC} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-riscv32-Define-=
plain-syscalls-as-their-time64-varian.patch;patchdir=3D${RUSTSRC} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-bootstrap-Ensure-hos=
t-documentation-is-built-before-.patch \<br>
=C2=A0&quot;<br>
=C2=A0SRC_URI[rust.sha256sum] =3D &quot;ebee170bfe4c4dfc59521a101de651e5534=
f4dae889756a5c97ca9ea40d0c307&quot;<br>
<br>
diff --git a/meta/recipes-devtools/rust/<a href=3D"http://rust_1.92.0.bb" r=
el=3D"noreferrer" target=3D"_blank">rust_1.92.0.bb</a> b/meta/recipes-devto=
ols/rust/<a href=3D"http://rust_1.92.0.bb" rel=3D"noreferrer" target=3D"_bl=
ank">rust_1.92.0.bb</a><br>
index a25f65f674..306661b6e4 100644<br>
--- a/meta/recipes-devtools/rust/<a href=3D"http://rust_1.92.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">rust_1.92.0.bb</a><br>
+++ b/meta/recipes-devtools/rust/<a href=3D"http://rust_1.92.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">rust_1.92.0.bb</a><br>
@@ -6,8 +6,9 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYRIGHT;md5=3D11a389982=
5f4376896e438c8c753f8dc&quot;<br>
<br>
=C2=A0inherit rust<br>
=C2=A0inherit cargo_common<br>
+inherit pkgconfig<br>
<br>
-DEPENDS +=3D &quot;llvm&quot;<br>
+DEPENDS +=3D &quot;llvm openssl&quot;<br></blockquote><div><br></div><div>=
This new dependency should be explained in the commit message.=C2=A0</div><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0# native rust uses cargo/rustc from binary snapshots to bootstrap<br>
=C2=A0# but everything else should use our native builds<br>
=C2=A0DEPENDS:append:class-target =3D &quot; cargo-native rust-native&quot;=
<br>
@@ -282,6 +283,7 @@ do_install () {<br>
<br>
=C2=A0rust_do_install() {<br>
=C2=A0 =C2=A0 =C2=A0rust_runx install<br>
+=C2=A0 =C2=A0 rust_runx install src<br>
=C2=A0}<br>
<br>
=C2=A0rust_do_install:class-nativesdk() {<br>
-- <br>
2.52.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#229091): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/229091" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/229091</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117170671/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117170671/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" tar=
get=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--0000000000004cbbad0647f23f15--

