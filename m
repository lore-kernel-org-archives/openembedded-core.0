Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 651D1C25B74
	for <webhook@archiver.kernel.org>; Sun, 19 May 2024 00:28:55 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.30342.1716078534114681232
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 May 2024 17:28:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WcAOncnx;
 spf=pass (domain: gmail.com, ip: 209.85.167.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5241b49c0daso634641e87.0
        for <openembedded-core@lists.openembedded.org>; Sat, 18 May 2024 17:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716078532; x=1716683332; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uQorRm+bhVlxMdS+r5JQLTec/fV91nP9Hym19Ce6VkU=;
        b=WcAOncnxdj76V02hBuS3CyY+iwr5UyuYF7rANoKf8DZfmQ14wbB3CSYvL7fZaiNgep
         0RhONeez8IAEVn54CJY83DvcH4qjj23kKVYLXv2ORkDqUrp5KUWvjelzeoTgP+2b62Ry
         ibfMdXbmvxvyZOpd9Q1QlsUrSWaSjq6cHf7+QnDOj0WyFQS1p58x/W7WsGXabSa52bzO
         y2BQzsHQGqpPiZVR9aCmXFUl7Ma+J4q/YthHiyeYTXt4k6Jr+qS5+UDgOQ0qLTyFr+dk
         7wffey6tHhFtNp4hWrrq6gczqa/hqVaDzjWEiUysF26k3Q1494ENGyNdwyXUhVqSJi64
         RVuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716078532; x=1716683332;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uQorRm+bhVlxMdS+r5JQLTec/fV91nP9Hym19Ce6VkU=;
        b=p89qdhOT1voJOWfH0vU5QwyNDZ0irpIsepaLPAMMhsLQFN+Q146eifpmCClbyvJo/A
         cSbBWuA9PGt1d8yiT+OXlxOCT/6fZcgeQMrFyKV3F4FfFtBJyruRvh9ORWUXBVX2WZqU
         0tciYvvBKcIhtE5abEINyzU5ZJ2RY5xsPSvXG7RU3gcaKv02Zn6p8Oozcd8n2gQtuloR
         KZN7DPec1B6hlrqDmFGr7EMQz/iz3qtooAUBcEbeF0PtRrjWzaocaetlaYY7dJilp/ik
         ORKUQ9Bei6suV75TFbnc58gBzXrstkJI8xVYTLbrXnZKWtcuN+h3tizk8BBf3+IifpIf
         Czfw==
X-Forwarded-Encrypted: i=1; AJvYcCVQaOkZtrZmiOAZ/8zvIjPWFy+DrQDkzj6Sjsoc6utAxs1untPXNSQ8vfjLak4XxZ6sYdRLXdWsH8FBg6HKTUkUplpAJCZYvH/0VXMkuiic/sBnyLsmTYX6
X-Gm-Message-State: AOJu0YxlZz3Mug/OeLMGVEIjWCF55ag91T5iiKIp+pauPYqASLklJgpk
	khXkGPeYy0H4vIH9z2hJ37o5gLHEWXEkS1mhyERwXpEBz4k+hAc//hs1K5hxNw4+kVy5OF6JpbJ
	Z35aGERUHzb0t2lQ6ngJf/eeX2dQ=
X-Google-Smtp-Source: AGHT+IFI3bM5qPDR7MH60P8dbQzYI85YMk+kQGdUDbbpHl9quy2MkjoLIpCq92R/GjYkZJGzMnYbVIIIyx9bZ+ve2VM=
X-Received: by 2002:a05:6512:2394:b0:523:4f64:828b with SMTP id
 2adb3069b0e04-5234f6482bbmr13592569e87.38.1716078531600; Sat, 18 May 2024
 17:28:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240516112111.2145436-1-alex.kanavin@gmail.com>
 <20240518215516883b453a@mail.local> <CANNYZj-JzL4Yxd8nkdheB-JBj+_FYMY3h+HE19bJ1oxbb71O7Q@mail.gmail.com>
In-Reply-To: <CANNYZj-JzL4Yxd8nkdheB-JBj+_FYMY3h+HE19bJ1oxbb71O7Q@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 19 May 2024 02:28:39 +0200
Message-ID: <CANNYZj8VqucHcZZ+P6U+MweX=XoNG4r-dif_z15atoSm8Rok8A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/4] rust: correctly link rust-snapshot into build/stage0
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Alexander Kanavin <alex@linutronix.de>, Randy MacLeod <randy.macleod@windriver.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004866c20618c3ab24"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 May 2024 00:28:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199543

--0000000000004866c20618c3ab24
Content-Type: text/plain; charset="UTF-8"

I can however resend with the text disabled so that existing patches can
stay in master-next.

Alex

On Sun 19. May 2024 at 2.27, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> This is intentional and known. The expectation is that fixes by
> maintainers of the test will come shortly.
>
> Alex
>
> On Sat 18. May 2024 at 23.55, Alexandre Belloni <
> alexandre.belloni@bootlin.com> wrote:
>
>> ello,
>>
>> The series broke the -tc builds as
>> rust.RustSelfTestSystemEmulated.test_rust is failing:
>>
>>
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/151/builds/1723/steps/12/logs/stdio
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/154/builds/1715/steps/12/logs/stdio
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/148/builds/1711/steps/12/logs/stdio
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/145/builds/1700/steps/12/logs/stdio
>>
>> On 16/05/2024 13:21:08+0200, Alexander Kanavin wrote:
>> > From: Alexander Kanavin <alex@linutronix.de>
>> >
>> > This does not seem to be used in regular builds, but is beneficial
>> > in rust selftest, where it allows dropping a custom patch
>> > that is unsuitable for upstream (and was rejected by them).
>> >
>> > Also remove an obsolete comment that seems related to the code
>> > but describes something that was resolved long time ago.
>> >
>> > I have confirmed that the rust selftest continues to pass with just
>> > this one commit on top of master (as the following changes do break
>> > the selftest).
>> >
>> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>> > ---
>> >  .../rust/files/cargo-path.patch               | 37 -------------------
>> >  meta/recipes-devtools/rust/rust-source.inc    |  1 -
>> >  meta/recipes-devtools/rust/rust_1.75.0.bb     |  6 +--
>> >  3 files changed, 2 insertions(+), 42 deletions(-)
>> >  delete mode 100644 meta/recipes-devtools/rust/files/cargo-path.patch
>> >
>> > diff --git a/meta/recipes-devtools/rust/files/cargo-path.patch
>> b/meta/recipes-devtools/rust/files/cargo-path.patch
>> > deleted file mode 100644
>> > index 9a50c402201..00000000000
>> > --- a/meta/recipes-devtools/rust/files/cargo-path.patch
>> > +++ /dev/null
>> > @@ -1,37 +0,0 @@
>> > -Fix the cargo binary path error and ensure that it is fetched
>> > -during rustc bootstrap in rust oe-selftest.
>> > -
>> > -======================================================================
>> > -ERROR: test_cargoflags (bootstrap_test.BuildBootstrap)
>> > -----------------------------------------------------------------------
>> > -Traceback (most recent call last):
>> > -  File
>> "/home/build-st/tmp/work/cortexa57-poky-linux/rust/1.74.1/rustc-1.74.1-src/src/bootstrap/bootstrap_test.py",
>> line 157, in test_cargoflags
>> > -    args, _ = self.build_args(env={"CARGOFLAGS": "--timings"})
>> > -  File
>> "/home/build-st/tmp/work/cortexa57-poky-linux/rust/1.74.1/rustc-1.74.1-src/src/bootstrap/bootstrap_test.py",
>> line 154, in build_args
>> > -    return build.build_bootstrap_cmd(env), env
>> > -  File
>> "/home/build-st/tmp/work/cortexa57-poky-linux/rust/1.74.1/rustc-1.74.1-src/src/bootstrap/bootstrap.py",
>> line 960, in build_bootstrap_cmd
>> > -    raise Exception("no cargo executable found at `{}`".format(
>> > -Exception: no cargo executable found at
>> `/home/build-st/tmp/work/cortexa57-poky-linux/rust/1.74.1/rustc-1.74.1-src/build/x86_64-unknown-linux-gnu/stage0/bin/cargo`
>> > -
>> > -Upstream-Status: Submitted [
>> https://github.com/rust-lang/rust/pull/120125]
>> > -
>> > -Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
>> > ----
>> > -diff --git a/src/bootstrap/bootstrap.py b/src/bootstrap/bootstrap.py
>> > ---- a/src/bootstrap/bootstrap.py
>> > -+++ b/src/bootstrap/bootstrap.py
>> > -@@ -954,9 +954,11 @@
>> > -         if "RUSTFLAGS_BOOTSTRAP" in env:
>> > -             env["RUSTFLAGS"] += " " + env["RUSTFLAGS_BOOTSTRAP"]
>> > -
>> > --        env["PATH"] = os.path.join(self.bin_root(), "bin") + \
>> > --            os.pathsep + env["PATH"]
>> > --        if not os.path.isfile(self.cargo()):
>> > -+        cargo_bin_path = os.path.join(self.bin_root(), "bin", "cargo")
>> > -+        if not os.path.isfile(cargo_bin_path):
>> > -+            cargo_bin_path = os.getenv("RUST_TARGET_PATH") +
>> "rust-snapshot/bin/cargo"
>> > -+            env["PATH"] = os.path.dirname(cargo_bin_path) +
>> os.pathsep + env["PATH"]
>> > -+        else:
>> > -             raise Exception("no cargo executable found at
>> `{}`".format(
>> > -                 self.cargo()))
>> > -         args = [self.cargo(), "build", "--manifest-path",
>> > diff --git a/meta/recipes-devtools/rust/rust-source.inc
>> b/meta/recipes-devtools/rust/rust-source.inc
>> > index b14221b6cb8..c83c8ec3a39 100644
>> > --- a/meta/recipes-devtools/rust/rust-source.inc
>> > +++ b/meta/recipes-devtools/rust/rust-source.inc
>> > @@ -7,7 +7,6 @@ SRC_URI += "
>> https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
>> >              file://rv32-missing-syscalls.patch;patchdir=${RUSTSRC} \
>> >              file://rv32-rustix-libc-backend.patch;patchdir=${RUSTSRC} \
>> >
>> file://rv32-cargo-rustix-0.38.19-fix.patch;patchdir=${RUSTSRC} \
>> > -            file://cargo-path.patch;patchdir=${RUSTSRC} \
>> >              file://custom-target-cfg.patch;patchdir=${RUSTSRC} \
>> >              file://rustc-bootstrap.patch;patchdir=${RUSTSRC} \
>> >              file://target-build-value.patch;patchdir=${RUSTSRC} \
>> > diff --git a/meta/recipes-devtools/rust/rust_1.75.0.bb
>> b/meta/recipes-devtools/rust/rust_1.75.0.bb
>> > index 76e1fe2d84a..8ef838ee90c 100644
>> > --- a/meta/recipes-devtools/rust/rust_1.75.0.bb
>> > +++ b/meta/recipes-devtools/rust/rust_1.75.0.bb
>> > @@ -35,8 +35,6 @@ RUST_ALTERNATE_EXE_PATH_NATIVE =
>> "${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-co
>> >  # own vendoring.
>> >  CARGO_DISABLE_BITBAKE_VENDORING = "1"
>> >
>> > -# We can't use RUST_BUILD_SYS here because that may be "musl" if
>> > -# TCLIBC="musl". Snapshots are always -unknown-linux-gnu
>> >  setup_cargo_environment () {
>> >      # The first step is to build bootstrap and some early stage tools,
>> >      # these are build for the same target as the snapshot, e.g.
>> > @@ -54,8 +52,8 @@ do_rust_setup_snapshot () {
>> >
>> >      # Some versions of rust (e.g. 1.18.0) tries to find cargo in
>> stage0/bin/cargo
>> >      # and fail without it there.
>> > -    mkdir -p ${RUSTSRC}/build/${BUILD_SYS}
>> > -    ln -sf ${WORKDIR}/rust-snapshot/
>> ${RUSTSRC}/build/${BUILD_SYS}/stage0
>> > +    mkdir -p ${RUSTSRC}/build/${RUST_BUILD_SYS}
>> > +    ln -sf ${WORKDIR}/rust-snapshot/
>> ${RUSTSRC}/build/${RUST_BUILD_SYS}/stage0
>> >
>> >      # Need to use uninative's loader if enabled/present since the
>> library paths
>> >      # are used internally by rust and result in symbol mismatches if
>> we don't
>> > --
>> > 2.39.2
>> >
>>
>> >
>> > -=-=-=-=-=-=-=-=-=-=-=-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#199464):
>> https://lists.openembedded.org/g/openembedded-core/message/199464
>> > Mute This Topic: https://lists.openembedded.org/mt/106132432/3617179
>> > Group Owner: openembedded-core+owner@lists.openembedded.org
>> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
>> alexandre.belloni@bootlin.com]
>> > -=-=-=-=-=-=-=-=-=-=-=-
>> >
>>
>>
>> --
>> Alexandre Belloni, co-owner and COO, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
>>
>

--0000000000004866c20618c3ab24
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I can however resend with the text disabled so that exist=
ing patches can stay in master-next.</div><div dir=3D"auto"><br></div><div =
dir=3D"auto">Alex</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Sun 19. May 2024 at 2.27, Alexander Kanavin &lt;<a=
 href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-=
left-color:rgb(204,204,204)"><div><div dir=3D"auto">This is intentional and=
 known. The expectation is that fixes by maintainers of the test will come =
shortly.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div></div=
><div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Sat 18. May 2024 at 23.55, Alexandre Belloni &lt;<a href=3D"mailto:=
alexandre.belloni@bootlin.com" target=3D"_blank">alexandre.belloni@bootlin.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-=
left:1ex;border-left-color:rgb(204,204,204)">ello,<br>
<br>
The series broke the -tc builds as<br>
rust.RustSelfTestSystemEmulated.test_rust is failing:<br>
<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/151/buil=
ds/1723/steps/12/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://a=
utobuilder.yoctoproject.org/typhoon/#/builders/151/builds/1723/steps/12/log=
s/stdio</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/154/buil=
ds/1715/steps/12/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://a=
utobuilder.yoctoproject.org/typhoon/#/builders/154/builds/1715/steps/12/log=
s/stdio</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/148/buil=
ds/1711/steps/12/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://a=
utobuilder.yoctoproject.org/typhoon/#/builders/148/builds/1711/steps/12/log=
s/stdio</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/145/buil=
ds/1700/steps/12/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://a=
utobuilder.yoctoproject.org/typhoon/#/builders/145/builds/1700/steps/12/log=
s/stdio</a><br>
<br>
On 16/05/2024 13:21:08+0200, Alexander Kanavin wrote:<br>
&gt; From: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de" targ=
et=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; <br>
&gt; This does not seem to be used in regular builds, but is beneficial<br>
&gt; in rust selftest, where it allows dropping a custom patch<br>
&gt; that is unsuitable for upstream (and was rejected by them).<br>
&gt; <br>
&gt; Also remove an obsolete comment that seems related to the code<br>
&gt; but describes something that was resolved long time ago.<br>
&gt; <br>
&gt; I have confirmed that the rust selftest continues to pass with just<br=
>
&gt; this one commit on top of master (as the following changes do break<br=
>
&gt; the selftest).<br>
&gt; <br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix=
.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../rust/files/cargo-path.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 37 -------------------<br>
&gt;=C2=A0 meta/recipes-devtools/rust/rust-source.inc=C2=A0 =C2=A0 |=C2=A0 =
1 -<br>
&gt;=C2=A0 meta/recipes-devtools/rust/<a href=3D"http://rust_1.75.0.bb" rel=
=3D"noreferrer" target=3D"_blank">rust_1.75.0.bb</a>=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 6 +--<br>
&gt;=C2=A0 3 files changed, 2 insertions(+), 42 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/rust/files/cargo-path.p=
atch<br>
&gt; <br>
&gt; diff --git a/meta/recipes-devtools/rust/files/cargo-path.patch b/meta/=
recipes-devtools/rust/files/cargo-path.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 9a50c402201..00000000000<br>
&gt; --- a/meta/recipes-devtools/rust/files/cargo-path.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,37 +0,0 @@<br>
&gt; -Fix the cargo binary path error and ensure that it is fetched<br>
&gt; -during rustc bootstrap in rust oe-selftest.<br>
&gt; -<br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; -ERROR: test_cargoflags (bootstrap_test.BuildBootstrap)<br>
&gt; ----------------------------------------------------------------------=
-<br>
&gt; -Traceback (most recent call last):<br>
&gt; -=C2=A0 File &quot;/home/build-st/tmp/work/cortexa57-poky-linux/rust/1=
.74.1/rustc-1.74.1-src/src/bootstrap/bootstrap_test.py&quot;, line 157, in =
test_cargoflags<br>
&gt; -=C2=A0 =C2=A0 args, _ =3D self.build_args(env=3D{&quot;CARGOFLAGS&quo=
t;: &quot;--timings&quot;})<br>
&gt; -=C2=A0 File &quot;/home/build-st/tmp/work/cortexa57-poky-linux/rust/1=
.74.1/rustc-1.74.1-src/src/bootstrap/bootstrap_test.py&quot;, line 154, in =
build_args<br>
&gt; -=C2=A0 =C2=A0 return build.build_bootstrap_cmd(env), env<br>
&gt; -=C2=A0 File &quot;/home/build-st/tmp/work/cortexa57-poky-linux/rust/1=
.74.1/rustc-1.74.1-src/src/bootstrap/bootstrap.py&quot;, line 960, in build=
_bootstrap_cmd<br>
&gt; -=C2=A0 =C2=A0 raise Exception(&quot;no cargo executable found at `{}`=
&quot;.format(<br>
&gt; -Exception: no cargo executable found at `/home/build-st/tmp/work/cort=
exa57-poky-linux/rust/1.74.1/rustc-1.74.1-src/build/x86_64-unknown-linux-gn=
u/stage0/bin/cargo`<br>
&gt; -<br>
&gt; -Upstream-Status: Submitted [<a href=3D"https://github.com/rust-lang/r=
ust/pull/120125" rel=3D"noreferrer" target=3D"_blank">https://github.com/ru=
st-lang/rust/pull/120125</a>]<br>
&gt; -<br>
&gt; -Signed-off-by: Yash Shinde &lt;<a href=3D"mailto:Yash.Shinde@windrive=
r.com" target=3D"_blank">Yash.Shinde@windriver.com</a>&gt;<br>
&gt; ----<br>
&gt; -diff --git a/src/bootstrap/bootstrap.py b/src/bootstrap/bootstrap.py<=
br>
&gt; ---- a/src/bootstrap/bootstrap.py<br>
&gt; -+++ b/src/bootstrap/bootstrap.py<br>
&gt; -@@ -954,9 +954,11 @@<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if &quot;RUSTFLAGS_BOOTSTRAP&quot; =
in env:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env[&quot;RUSTFLAGS&q=
uot;] +=3D &quot; &quot; + env[&quot;RUSTFLAGS_BOOTSTRAP&quot;]<br>
&gt; -<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 env[&quot;PATH&quot;] =3D os.path.join(s=
elf.bin_root(), &quot;bin&quot;) + \<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.pathsep + env[&quot;PAT=
H&quot;]<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not os.path.isfile(self.cargo()):<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cargo_bin_path =3D os.path.join(self.bin=
_root(), &quot;bin&quot;, &quot;cargo&quot;)<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if not os.path.isfile(cargo_bin_path):<b=
r>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cargo_bin_path =3D os.gete=
nv(&quot;RUST_TARGET_PATH&quot;) + &quot;rust-snapshot/bin/cargo&quot;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 env[&quot;PATH&quot;] =3D =
os.path.dirname(cargo_bin_path) + os.pathsep + env[&quot;PATH&quot;]<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise Exception(&quot=
;no cargo executable found at `{}`&quot;.format(<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.ca=
rgo()))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0args =3D [self.cargo(), &quot;build=
&quot;, &quot;--manifest-path&quot;,<br>
&gt; diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes=
-devtools/rust/rust-source.inc<br>
&gt; index b14221b6cb8..c83c8ec3a39 100644<br>
&gt; --- a/meta/recipes-devtools/rust/rust-source.inc<br>
&gt; +++ b/meta/recipes-devtools/rust/rust-source.inc<br>
&gt; @@ -7,7 +7,6 @@ SRC_URI +=3D &quot;<a href=3D"https://static.rust-lang=
.org/dist/rustc-$%7BRUST_VERSION%7D-src.tar.xz;n" rel=3D"noreferrer" target=
=3D"_blank">https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar=
.xz;n</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://rv32-missing-sy=
scalls.patch;patchdir=3D${RUSTSRC} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://rv32-rustix-lib=
c-backend.patch;patchdir=3D${RUSTSRC} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://rv32-cargo-rust=
ix-0.38.19-fix.patch;patchdir=3D${RUSTSRC} \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://cargo-path.patch;pat=
chdir=3D${RUSTSRC} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://custom-target-c=
fg.patch;patchdir=3D${RUSTSRC} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://rustc-bootstrap=
.patch;patchdir=3D${RUSTSRC} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://target-build-va=
lue.patch;patchdir=3D${RUSTSRC} \<br>
&gt; diff --git a/meta/recipes-devtools/rust/<a href=3D"http://rust_1.75.0.=
bb" rel=3D"noreferrer" target=3D"_blank">rust_1.75.0.bb</a> b/meta/recipes-=
devtools/rust/<a href=3D"http://rust_1.75.0.bb" rel=3D"noreferrer" target=
=3D"_blank">rust_1.75.0.bb</a><br>
&gt; index 76e1fe2d84a..8ef838ee90c 100644<br>
&gt; --- a/meta/recipes-devtools/rust/<a href=3D"http://rust_1.75.0.bb" rel=
=3D"noreferrer" target=3D"_blank">rust_1.75.0.bb</a><br>
&gt; +++ b/meta/recipes-devtools/rust/<a href=3D"http://rust_1.75.0.bb" rel=
=3D"noreferrer" target=3D"_blank">rust_1.75.0.bb</a><br>
&gt; @@ -35,8 +35,6 @@ RUST_ALTERNATE_EXE_PATH_NATIVE =3D &quot;${STAGING_L=
IBDIR_NATIVE}/llvm-rust/bin/llvm-co<br>
&gt;=C2=A0 # own vendoring.<br>
&gt;=C2=A0 CARGO_DISABLE_BITBAKE_VENDORING =3D &quot;1&quot;<br>
&gt;=C2=A0 <br>
&gt; -# We can&#39;t use RUST_BUILD_SYS here because that may be &quot;musl=
&quot; if<br>
&gt; -# TCLIBC=3D&quot;musl&quot;. Snapshots are always -unknown-linux-gnu<=
br>
&gt;=C2=A0 setup_cargo_environment () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # The first step is to build bootstrap and some ea=
rly stage tools,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # these are build for the same target as the snaps=
hot, e.g.<br>
&gt; @@ -54,8 +52,8 @@ do_rust_setup_snapshot () {<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 # Some versions of rust (e.g. 1.18.0) tries to fin=
d cargo in stage0/bin/cargo<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # and fail without it there.<br>
&gt; -=C2=A0 =C2=A0 mkdir -p ${RUSTSRC}/build/${BUILD_SYS}<br>
&gt; -=C2=A0 =C2=A0 ln -sf ${WORKDIR}/rust-snapshot/ ${RUSTSRC}/build/${BUI=
LD_SYS}/stage0<br>
&gt; +=C2=A0 =C2=A0 mkdir -p ${RUSTSRC}/build/${RUST_BUILD_SYS}<br>
&gt; +=C2=A0 =C2=A0 ln -sf ${WORKDIR}/rust-snapshot/ ${RUSTSRC}/build/${RUS=
T_BUILD_SYS}/stage0<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 # Need to use uninative&#39;s loader if enabled/pr=
esent since the library paths<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # are used internally by rust and result in symbol=
 mismatches if we don&#39;t<br>
&gt; -- <br>
&gt; 2.39.2<br>
&gt; <br>
<br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#199464): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/199464" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/199464</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10613243=
2/3617179" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/106132432/3617179</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alexandre.belloni@boo=
tlin.com" target=3D"_blank">alexandre.belloni@bootlin.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
<br>
-- <br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div></div>
</div>
</blockquote></div></div>

--0000000000004866c20618c3ab24--

