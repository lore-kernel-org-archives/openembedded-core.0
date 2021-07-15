Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
 by mx.groups.io with SMTP id smtpd.web12.5080.1626336815504923933
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jul 2021 01:13:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sumXAm3m;
 spf=pass (domain: gmail.com, ip: 209.85.221.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f177.google.com with SMTP id s74so1105702vka.11
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jul 2021 01:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/h7InVhQoq+HhdSoWP7uEWMAp8qv2FX1E6GZUSeAkYg=;
        b=sumXAm3mWewUtyQl4znOFaP5xPurY35bvXRJM3LZJjdTtwzcaLqtJ3vRhA9vMZnHw9
         lNcflxReMPq1OXGcnlc5uxKQafPCZFSkmAD1ez1KqB0MDu09TD6v9OQp5wGLuf0P2/o1
         F0QxD3h2bJ7gu1GMiF+INv+osgx+Qh9RjaD+1WYCAKej+cqKNnIz6NxzA4yUOu24ZGsr
         mhMcX9UYRv0MimnG0TzMgocXOvN04bgDjKtjUhlCh5HeBTc+UOUzZmD/WFYNPcZk7IFt
         NeeHt7t9gwF46sSS1TGY29i+2c3oFmZw/EUQcZLHahE2fJKb90BJPn82SFVzWaKGCkzT
         DDTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/h7InVhQoq+HhdSoWP7uEWMAp8qv2FX1E6GZUSeAkYg=;
        b=ku7HWVeZujy3nweE4lPlyWpZmn2PVh6CJ6Fhnao8eUoOPdRkpaZnOg+rhiK1/ao857
         2x43duXUpdKsiWpBXzc+vm4hWJRQgAP3zIdaM/XXJqV5Cc8cbxjSrUZYJVrjRw4fc0b4
         Y+J+zWBFq5gU+5z56i+75xt/nKWPUXqtwmnNKhB8t5tDu7wo2diKD0IB+ZsDz762qYRg
         LxoSs6QQ9wXjrYPoO8eLgItDzCPV0VJUvJavMe3GAQ/hV/iEnkZ++6Og8fBEe5aIQRdE
         rOhDqXUNOzp8j5UsJUVQ7zdiwt6RThM5vfpr3fRvA3ahNu0Zrwvz7tQ38UGRk3yK6bL8
         cSnA==
X-Gm-Message-State: AOAM531RFca2BB0YurxjTxZGhxJekSa//HLgJSe1iYtAu0Cn7jCCcRn4
	ECO1sBYd+4TwH+EQ8Ee3g/EXkq4KjfO621Kr9Ew=
X-Google-Smtp-Source: ABdhPJx6yIlHQ97/KQo/BsZYUGeI4yT5EKsCI+Spt5xxGp+qaLK0XU5fRinX1QFTJv4h5GF3/ZQiL5TU0LXZX7OvHq8=
X-Received: by 2002:a1f:acd7:: with SMTP id v206mr3363629vke.10.1626336814483;
 Thu, 15 Jul 2021 01:13:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210714141432.610106-1-alex.kanavin@gmail.com>
 <bd224e1b93a24ec261502e4311ac4cb7252ed27e.camel@linuxfoundation.org> <fe6b791f-77e6-c756-4c21-84a469fc3744@gmail.com>
In-Reply-To: <fe6b791f-77e6-c756-4c21-84a469fc3744@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 15 Jul 2021 10:13:23 +0200
Message-ID: <CANNYZj86Yz-ZowOaYRZsBN3gMgLeHYV6_NfW83dxuGX_XViM7A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] tcmode-default.inc: do not set PREFERRED_VERSION for toolchain items
To: Khem Raj <raj.khem@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000001cced605c7250c6d"

--0000000000001cced605c7250c6d
Content-Type: text/plain; charset="UTF-8"

LLVMVERSION itself wasn't being dropped, only the PREFERRED_VERSION setting
that uses it.

But I'd agree with the broader point; it's better for devtool to print a
warning on upgrades that PREFERRED_VERSION needs to be adjusted (if it's
set) before any further steps.

Alex

On Wed, 14 Jul 2021 at 19:36, Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On 7/14/21 9:26 AM, Richard Purdie wrote:
> > On Wed, 2021-07-14 at 16:14 +0200, Alexander Kanavin wrote:
> >> oe-core has not been providing multiple versions for any of these items
> >> for a long time, it's not likely to change anytime soon, and it makes
> >> automated (or semi-automated) versions updates with devtool impossible,
> >> as PREFERRED_VERSION masks the updated recipe in devtool workspace.
> >>
> >> Specifically, this was prompted by investigating why automated llvm
> update
> >> doesn't work; it does now.
> >>
> >> v2: GCC is excluded as overriding the version through GCCVERSION is used
> >> across several layers, and the list of things to override is large.
> >>
> >> v3: exclude linux-libc-headers too, as that is using a separate update
> >> process without involving devtool.
> >>
> >> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> >> ---
> >>   meta/conf/distro/include/tcmode-default.inc | 36 ---------------------
> >>   1 file changed, 36 deletions(-)
> >>
> >> diff --git a/meta/conf/distro/include/tcmode-default.inc
> b/meta/conf/distro/include/tcmode-default.inc
> >> index 1d4aa1e11f..e655bd85ce 100644
> >> --- a/meta/conf/distro/include/tcmode-default.inc
> >> +++ b/meta/conf/distro/include/tcmode-default.inc
> >> @@ -18,12 +18,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
> >>
> >>
> >>
> >>
> >>   GCCVERSION ?= "11.%"
> >>   SDKGCCVERSION ?= "${GCCVERSION}"
> >> -BINUVERSION ?= "2.36%"
> >> -GDBVERSION ?= "10.%"
> >> -GLIBCVERSION ?= "2.33"
> >>   LINUXLIBCVERSION ?= "5.13%"
> >> -QEMUVERSION ?= "6.0%"
> >> -GOVERSION ?= "1.16%"
> >>   # This can not use wildcards like 8.0.% since it is also used in mesa
> to denote
> >>   # llvm version being used, so always bump it with llvm recipe version
> bump
> >>   LLVMVERSION ?= "12.0.1"
> >> @@ -42,42 +37,11 @@ PREFERRED_VERSION_libgfortran ?= "${GCCVERSION}"
> >>   PREFERRED_VERSION_nativesdk-gcc ?= "${SDKGCCVERSION}"
> >>   PREFERRED_VERSION_nativesdk-libgcc ?= "${SDKGCCVERSION}"
> >>   PREFERRED_VERSION_nativesdk-libgcc-initial ?= "${SDKGCCVERSION}"
> >> -PREFERRED_VERSION_binutils ?= "${BINUVERSION}"
> >> -PREFERRED_VERSION_binutils-native ?= "${BINUVERSION}"
> >> -PREFERRED_VERSION_binutils-cross-${TARGET_ARCH} ?= "${BINUVERSION}"
> >> -PREFERRED_VERSION_binutils-crosssdk-${SDK_SYS} ?= "${BINUVERSION}"
> >> -PREFERRED_VERSION_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} ?=
> "${BINUVERSION}"
> >> -PREFERRED_VERSION_gdb ?= "${GDBVERSION}"
> >> -PREFERRED_VERSION_gdb-cross-${TARGET_ARCH} ?= "${GDBVERSION}"
> >> -PREFERRED_VERSION_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} ?=
> "${GDBVERSION}"
> >>
> >>
> >>
> >>
> >>   PREFERRED_VERSION_linux-libc-headers ?= "${LINUXLIBCVERSION}"
> >>   PREFERRED_VERSION_nativesdk-linux-libc-headers ?=
> "${LINUXLIBCVERSION}"
> >> -PREFERRED_VERSION_glibc                    ?= "${GLIBCVERSION}"
> >> -PREFERRED_VERSION_glibc-locale             ?= "${GLIBCVERSION}"
> >> -PREFERRED_VERSION_glibc-mtrace             ?= "${GLIBCVERSION}"
> >> -PREFERRED_VERSION_glibc-scripts            ?= "${GLIBCVERSION}"
> >> -PREFERRED_VERSION_nativesdk-glibc          ?= "${GLIBCVERSION}"
> >> -PREFERRED_VERSION_cross-localedef-native   ?= "${GLIBCVERSION}"
> >> -
> >> -PREFERRED_VERSION_qemu ?= "${QEMUVERSION}"
> >> -PREFERRED_VERSION_qemu-native ?= "${QEMUVERSION}"
> >> -PREFERRED_VERSION_nativesdk-qemu ?= "${QEMUVERSION}"
> >>
> >>
> >>
> >>
> >>   # Bootstrap Go using a binary release from golang.org.  If you want
> to bootstrap
> >>   # from source using the C-implemented Go 1.4 (only supports x86-64
> hosts) then use
> >>   # go-native.
> >>   PREFERRED_PROVIDER_go-native ?= "go-binary-native"
> >> -PREFERRED_VERSION_virtual/${TARGET_PREFIX}go ?= "${GOVERSION}"
> >> -PREFERRED_VERSION_go-cross-${TUNE_PKGARCH} ?= "${GOVERSION}"
> >> -PREFERRED_VERSION_go-crosssdk-${SDK_ARCH} ?= "${GOVERSION}"
> >> -PREFERRED_VERSION_go-cross-canadian-${TRANSLATED_TARGET_ARCH} ?=
> "${GOVERSION}"
> >> -PREFERRED_VERSION_go ?= "${GOVERSION}"
> >> -PREFERRED_VERSION_go-native ?= "${GOVERSION}"
> >> -PREFERRED_VERSION_go-runtime ?= "${GOVERSION}"
> >> -PREFERRED_VERSION_nativesdk-go ?= "${GOVERSION}"
> >> -PREFERRED_VERSION_nativesdk-go-runtime ?= "${GOVERSION}"
> >> -
> >> -PREFERRED_VERSION_llvm = "${LLVMVERSION}"
> >> -PREFERRED_VERSION_llvm-native = "${LLVMVERSION}"
> >> -PREFERRED_VERSION_nativesdk-llvm = "${LLVMVERSION}"
> >
> > $ grep LLVMVERSION * -R
> > classes/meson.bbclass.orig:llvm-config = 'llvm-config${LLVMVERSION}'
> > classes/meson.bbclass:llvm-config = 'llvm-config${LLVMVERSION}'
> >
> > which is why we have LLVMVERSION. I'm sure some other layer breaks if we
> > don't do this.
> >
> > To be honest I think this starts to look like we can drop qemu and
> > not much else, the rest have many different related providers and
> > are pretty toolchain like where it is hard to guess what the form the
> > variables should take. That was the design purpose of the tcmode
> > include file. Most of those components wouldn't likely work with
> > devtool upgrade anyway and would need more careful handling.
> >
>
> honestly, this will cause more pain than what it is solving, eg.
> meta-clang also uses LLVMVERSION to override oe-core provided version
> and mesa depends on it too. The purpose of these variables was to let
> users swap out toolchains which are consisting of multiple different
> components/recipes and they may not know the whole chain that needs to
> be replaced. This patch takes us back to where we were few years ago. I
> would like to understand what issue does this patch solve that we are
> willing to break external layers for.
>
> > Cheers,
> >
> > Richard
> >
> >
> >
> > 
> >
>

--0000000000001cced605c7250c6d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>LLVMVERSION itself wasn&#39;t being dropped, only the=
 PREFERRED_VERSION setting that uses it.</div><div><br></div><div>But I&#39=
;d agree with the broader point; it&#39;s better for devtool to print a war=
ning on upgrades that PREFERRED_VERSION needs to be adjusted (if it&#39;s s=
et) before any further steps.</div><div><br></div><div>Alex<br></div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed=
, 14 Jul 2021 at 19:36, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">=
raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><br>
<br>
On 7/14/21 9:26 AM, Richard Purdie wrote:<br>
&gt; On Wed, 2021-07-14 at 16:14 +0200, Alexander Kanavin wrote:<br>
&gt;&gt; oe-core has not been providing multiple versions for any of these=
 items<br>
&gt;&gt; for a long time, it&#39;s not likely to change anytime soon, and =
it makes<br>
&gt;&gt; automated (or semi-automated) versions updates with devtool impos=
sible,<br>
&gt;&gt; as PREFERRED_VERSION masks the updated recipe in devtool workspac=
e.<br>
&gt;&gt;<br>
&gt;&gt; Specifically, this was prompted by investigating why automated ll=
vm update<br>
&gt;&gt; doesn&#39;t work; it does now.<br>
&gt;&gt;<br>
&gt;&gt; v2: GCC is excluded as overriding the version through GCCVERSION =
is used<br>
&gt;&gt; across several layers, and the list of things to override is larg=
e.<br>
&gt;&gt;<br>
&gt;&gt; v3: exclude linux-libc-headers too, as that is using a separate u=
pdate<br>
&gt;&gt; process without involving devtool.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanav=
in@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0meta/conf/distro/include/tcmode-default.inc | 36 ----=
-----------------<br>
&gt;&gt;=C2=A0 =C2=A01 file changed, 36 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/c=
onf/distro/include/tcmode-default.inc<br>
&gt;&gt; index 1d4aa1e11f..e655bd85ce 100644<br>
&gt;&gt; --- a/meta/conf/distro/include/tcmode-default.inc<br>
&gt;&gt; +++ b/meta/conf/distro/include/tcmode-default.inc<br>
&gt;&gt; @@ -18,12 +18,7 @@ PREFERRED_PROVIDER_virtual/gettext ??=3D &quot=
;gettext&quot;<br>
&gt;&gt;=C2=A0 =C2=A0<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0GCCVERSION ?=3D &quot;11.%&quot;<br>
&gt;&gt;=C2=A0 =C2=A0SDKGCCVERSION ?=3D &quot;${GCCVERSION}&quot;<br>
&gt;&gt; -BINUVERSION ?=3D &quot;2.36%&quot;<br>
&gt;&gt; -GDBVERSION ?=3D &quot;10.%&quot;<br>
&gt;&gt; -GLIBCVERSION ?=3D &quot;2.33&quot;<br>
&gt;&gt;=C2=A0 =C2=A0LINUXLIBCVERSION ?=3D &quot;5.13%&quot;<br>
&gt;&gt; -QEMUVERSION ?=3D &quot;6.0%&quot;<br>
&gt;&gt; -GOVERSION ?=3D &quot;1.16%&quot;<br>
&gt;&gt;=C2=A0 =C2=A0# This can not use wildcards like 8.0.% since it is a=
lso used in mesa to denote<br>
&gt;&gt;=C2=A0 =C2=A0# llvm version being used, so always bump it with llv=
m recipe version bump<br>
&gt;&gt;=C2=A0 =C2=A0LLVMVERSION ?=3D &quot;12.0.1&quot;<br>
&gt;&gt; @@ -42,42 +37,11 @@ PREFERRED_VERSION_libgfortran ?=3D &quot;${GC=
CVERSION}&quot;<br>
&gt;&gt;=C2=A0 =C2=A0PREFERRED_VERSION_nativesdk-gcc ?=3D &quot;${SDKGCCVE=
RSION}&quot;<br>
&gt;&gt;=C2=A0 =C2=A0PREFERRED_VERSION_nativesdk-libgcc ?=3D &quot;${SDKGC=
CVERSION}&quot;<br>
&gt;&gt;=C2=A0 =C2=A0PREFERRED_VERSION_nativesdk-libgcc-initial ?=3D &quot=
;${SDKGCCVERSION}&quot;<br>
&gt;&gt; -PREFERRED_VERSION_binutils ?=3D &quot;${BINUVERSION}&quot;<br>
&gt;&gt; -PREFERRED_VERSION_binutils-native ?=3D &quot;${BINUVERSION}&quot=
;<br>
&gt;&gt; -PREFERRED_VERSION_binutils-cross-${TARGET_ARCH} ?=3D &quot;${BIN=
UVERSION}&quot;<br>
&gt;&gt; -PREFERRED_VERSION_binutils-crosssdk-${SDK_SYS} ?=3D &quot;${BINU=
VERSION}&quot;<br>
&gt;&gt; -PREFERRED_VERSION_binutils-cross-canadian-${TRANSLATED_TARGET_AR=
CH} ?=3D &quot;${BINUVERSION}&quot;<br>
&gt;&gt; -PREFERRED_VERSION_gdb ?=3D &quot;${GDBVERSION}&quot;<br>
&gt;&gt; -PREFERRED_VERSION_gdb-cross-${TARGET_ARCH} ?=3D &quot;${GDBVERSI=
ON}&quot;<br>
&gt;&gt; -PREFERRED_VERSION_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} ?=
=
=3D &quot;${GDBVERSION}&quot;<br>
&gt;&gt;=C2=A0 =C2=A0<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0PREFERRED_VERSION_linux-libc-headers ?=3D &quot;${LIN=
UXLIBCVERSION}&quot;<br>
&gt;&gt;=C2=A0 =C2=A0PREFERRED_VERSION_nativesdk-linux-libc-headers ?=3D &=
quot;${LINUXLIBCVERSION}&quot;<br>
&gt;&gt; -PREFERRED_VERSION_glibc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ?=3D &quot;${GLIBCVERSION}&quot;<br>
&gt;&gt; -PREFERRED_VERSION_glibc-locale=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0?=3D &quot;${GLIBCVERSION}&quot;<br>
&gt;&gt; -PREFERRED_VERSION_glibc-mtrace=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0?=3D &quot;${GLIBCVERSION}&quot;<br>
&gt;&gt; -PREFERRED_VERSION_glibc-scripts=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ?=3D &quot;${GLIBCVERSION}&quot;<br>
&gt;&gt; -PREFERRED_VERSION_nativesdk-glibc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 ?=3D &quot;${GLIBCVERSION}&quot;<br>
&gt;&gt; -PREFERRED_VERSION_cross-localedef-native=C2=A0 =C2=A0?=3D &quot;=
${GLIBCVERSION}&quot;<br>
&gt;&gt; -<br>
&gt;&gt; -PREFERRED_VERSION_qemu ?=3D &quot;${QEMUVERSION}&quot;<br>
&gt;&gt; -PREFERRED_VERSION_qemu-native ?=3D &quot;${QEMUVERSION}&quot;<br=
>
&gt;&gt; -PREFERRED_VERSION_nativesdk-qemu ?=3D &quot;${QEMUVERSION}&quot;=
<br>
&gt;&gt;=C2=A0 =C2=A0<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0# Bootstrap Go using a binary release from <a href=3D=
"http://golang.org" rel=3D"noreferrer" target=3D"_blank">golang.org</a>.=C2=
=
=A0 If you want to bootstrap<br>
&gt;&gt;=C2=A0 =C2=A0# from source using the C-implemented Go 1.4 (only su=
pports x86-64 hosts) then use<br>
&gt;&gt;=C2=A0 =C2=A0# go-native.<br>
&gt;&gt;=C2=A0 =C2=A0PREFERRED_PROVIDER_go-native ?=3D &quot;go-binary-nat=
ive&quot;<br>
&gt;&gt; -PREFERRED_VERSION_virtual/${TARGET_PREFIX}go ?=3D &quot;${GOVERS=
ION}&quot;<br>
&gt;&gt; -PREFERRED_VERSION_go-cross-${TUNE_PKGARCH} ?=3D &quot;${GOVERSIO=
N}&quot;<br>
&gt;&gt; -PREFERRED_VERSION_go-crosssdk-${SDK_ARCH} ?=3D &quot;${GOVERSION=
}&quot;<br>
&gt;&gt; -PREFERRED_VERSION_go-cross-canadian-${TRANSLATED_TARGET_ARCH} ?=
=3D &quot;${GOVERSION}&quot;<br>
&gt;&gt; -PREFERRED_VERSION_go ?=3D &quot;${GOVERSION}&quot;<br>
&gt;&gt; -PREFERRED_VERSION_go-native ?=3D &quot;${GOVERSION}&quot;<br>
&gt;&gt; -PREFERRED_VERSION_go-runtime ?=3D &quot;${GOVERSION}&quot;<br>
&gt;&gt; -PREFERRED_VERSION_nativesdk-go ?=3D &quot;${GOVERSION}&quot;<br>
&gt;&gt; -PREFERRED_VERSION_nativesdk-go-runtime ?=3D &quot;${GOVERSION}&q=
uot;<br>
&gt;&gt; -<br>
&gt;&gt; -PREFERRED_VERSION_llvm =3D &quot;${LLVMVERSION}&quot;<br>
&gt;&gt; -PREFERRED_VERSION_llvm-native =3D &quot;${LLVMVERSION}&quot;<br>
&gt;&gt; -PREFERRED_VERSION_nativesdk-llvm =3D &quot;${LLVMVERSION}&quot;<=
br>
&gt; <br>
&gt; $ grep LLVMVERSION * -R<br>
&gt; classes/meson.bbclass.orig:llvm-config =3D &#39;llvm-config${LLVMVERS=
ION}&#39;<br>
&gt; classes/meson.bbclass:llvm-config =3D &#39;llvm-config${LLVMVERSION}&=
#39;<br>
&gt; <br>
&gt; which is why we have LLVMVERSION. I&#39;m sure some other layer break=
s if we<br>
&gt; don&#39;t do this.<br>
&gt; <br>
&gt; To be honest I think this starts to look like we can drop qemu and<br=
>
&gt; not much else, the rest have many different related providers and<br>
&gt; are pretty toolchain like where it is hard to guess what the form the=
<br>
&gt; variables should take. That was the design purpose of the tcmode<br>
&gt; include file. Most of those components wouldn&#39;t likely work with<=
br>
&gt; devtool upgrade anyway and would need more careful handling.<br>
&gt; <br>
<br>
honestly, this will cause more pain than what it is solving, eg. <br>
meta-clang also uses LLVMVERSION to override oe-core provided version <br>
and mesa depends on it too. The purpose of these variables was to let <br>
users swap out toolchains which are consisting of multiple different <br>
components/recipes and they may not know the whole chain that needs to <br=
>
be replaced. This patch takes us back to where we were few years ago. I <b=
r>
would like to understand what issue does this patch solve that we are <br>
willing to break external layers for.<br>
<br>
&gt; Cheers,<br>
&gt; <br>
&gt; Richard<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
</blockquote></div>

--0000000000001cced605c7250c6d--
