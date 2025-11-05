Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B983DCCFA19
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 13:23:06 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9222.1762348985018370293
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 05:23:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nbdLgptn;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-29470bc80ceso11562895ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 05:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762348984; x=1762953784; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uLiNxuX9cLGb+/+qFFldMSiz+y9QmRFo5zQI+YSY+lo=;
        b=nbdLgptngoZka+hy87Pcz3Mif5+RVxH4/IQudLBw3FqYhKenIn4WPC9P/BRtuwIKVc
         zr6Rw1j2hkVRIhozNz7T8haSolRtsTjWIn8/wYoKtZ/f+eG+y54bFDRevQa2zlRA+L96
         ub/vixz1fifBNobkQvkIxL0yGtdjUtKwivLv7qRFPWALL+ELAvr8sK2zeOO/wp5kGn22
         SHhCGY21Q7RQsLvG238RQxHYv1y0EmficrzbN8E7PyE0Hwj/8B5lBXak2glEzf3B8mXg
         8AaCxca+oblLOWmFV10BTIGmCcJQ4HsFHY25sinwA9HWsc+dzYmCP0usEG2H75QcDYh+
         k5GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762348984; x=1762953784;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uLiNxuX9cLGb+/+qFFldMSiz+y9QmRFo5zQI+YSY+lo=;
        b=BenUx1UB0veDDA39hr4xAf49SCXntLwUmiNBsCjRS8rfXmDzn6UGPev2I16bXCJtLj
         ZlkdMQyLNnFM6AjwOMQ753LWN855BXBBbC3P9q07StmWBxgffQTrFuqI+TKh5YKiz0He
         OQIS02ZnG8ghJXhbL2zFjm50/Vr0JhwAib9ElMRvLFBYZJfHqZltMSKnd3InfReW4a8i
         fdcE5IOHhH4IB1Gu5qin2qoOzute+1UvnREY20DPlCJKk6ApaLH5Q8RP133FGo7J8APp
         SJFwobnsTPzKnjmmpTkXVeJucedY83kMKoarj4iD3y6gWIBT+fKOsaQ+UMk3sXcHD4wF
         XwqQ==
X-Gm-Message-State: AOJu0Yy+ChCf/gjh2Zwj77LPHpfJP1/np5XFHJrly4lT//NlkIP0n4EP
	L9+YlXZxPAe1S9ydy3ax3WDVDHdLISVS7MFR80EulyrxyRexXCWFnq0MxQxUQxAGflCeIYtE7Ho
	xLQ2K3kLh+ocLuzp30OkpvGTVLe3Pros=
X-Gm-Gg: ASbGncs3m+WUjqSlEUUfi+XrqnRXo9p+Mn0mSm/EfoSPKvEN6vyVTr4dpsHrb64kOyJ
	CWRt2kuZGkdixyrpnDJBvtKc3kMS0uyQE/aS1som9TELwYztzq/8+ykmBPdPnpwEQBDqajhvu59
	g9tsgHrViDEEfn0lwSxxOsiducgKYmTZR/IwNPkljb2CQZY2VS5Pb2n8Ia0hG31215aUCesaRJd
	FIcYTWYhSa0tU7Ivq6TW03nkZnkxuiyyckuXAF3/mwf3em99E0OWMBMWxkhsg==
X-Google-Smtp-Source: AGHT+IGmQhgKpFZfD0/VOn4bD/ue7C88VTAwxtaGjRszjP0Gm7v1lYrsQqyTjGH1+eqzp+pw1YU9pTt7rt44FDI5gGA=
X-Received: by 2002:a17:902:d48f:b0:295:557e:7468 with SMTP id
 d9443c01a7336-2962addf8e6mr55492525ad.28.1762348984018; Wed, 05 Nov 2025
 05:23:04 -0800 (PST)
MIME-Version: 1.0
References: <20251104171611.2227798-1-elmehdi.younes@smile.fr> <20251104171611.2227798-2-elmehdi.younes@smile.fr>
In-Reply-To: <20251104171611.2227798-2-elmehdi.younes@smile.fr>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 5 Nov 2025 08:22:52 -0500
X-Gm-Features: AWmQ_bk_HARyi-d7Xl7kIsiUakpZc-bidjmkO7J6KE2NLpDV-txgNxa5sqKDZsM
Message-ID: <CADkTA4NEUxGQ7-z1kkGwmPh-ovAFgO=Zr89zD9JDhUmOn8mXGg@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 1/4] kernel-yocto.bbclass: Add integrated
 support for Rust-for-Linux
To: elmehdi.younes@smile.fr
Cc: openembedded-core@lists.openembedded.org, yoann.congal@smile.fr
Content-Type: multipart/alternative; boundary="00000000000029bd040642d8d976"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 13:23:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225766

--00000000000029bd040642d8d976
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 4, 2025 at 12:15=E2=80=AFPM El Mehdi YOUNES via lists.openembed=
ded.org
<elmehdi.younes=3Dsmile.fr@lists.openembedded.org> wrote:

> This change introduces a comprehensive solution to build Rust-enabled
> kernels cleanly, controlled by a new DISTRO_FEATURE named 'rust-kernel'.
>
> When this feature is enabled, the class performs the following actions:
>
> 1.  Appends the necessary native toolchain dependencies (rust-native,
>     bindgen-native, etc.) to the kernel recipe's DEPENDS.
>
> 2.  Implements a solution for reproducible builds to fix the [buildpaths]
>     QA failures.
>     To solve this, the rustc flag --remap-path-prefix is used. This
>     flag instructs the compiler to replace build-specific path prefixes
>     with generic ones in all output, including debug metadata. The offici=
al
>     documentation for this flag is here:
>     https://doc.rust-lang.org/nightly/rustc/remap-source-paths.html
>
>     To apply this flag cleanly, the rust-common class is inherited to
>     use its RUST_DEBUG_REMAP variable. This commit extends
>     RUST_DEBUG_REMAP with the specific paths for the kernel source (${S})=
,
>     the build directory (${B}), and the native sysroot
> (${STAGING_DIR_NATIVE}).
>     The resulting flags are then passed to the kernel's Makefile via the
>     KRUSTFLAGS variable.
>
> Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
> ---
>  meta/classes-recipe/kernel-yocto.bbclass | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/meta/classes-recipe/kernel-yocto.bbclass
> b/meta/classes-recipe/kernel-yocto.bbclass
> index e53bf15194..e722a7a81d 100644
> --- a/meta/classes-recipe/kernel-yocto.bbclass
> +++ b/meta/classes-recipe/kernel-yocto.bbclass
> @@ -463,6 +463,7 @@ do_kernel_configme[depends] +=3D
> "virtual/cross-binutils:do_populate_sysroot"
>  do_kernel_configme[depends] +=3D "virtual/cross-cc:do_populate_sysroot"
>  do_kernel_configme[depends] +=3D "bc-native:do_populate_sysroot
> bison-native:do_populate_sysroot"
>  do_kernel_configme[depends] +=3D "kern-tools-native:do_populate_sysroot"
> +do_kernel_configme[depends] +=3D "${@bb.utils.contains('DISTRO_FEATURES'=
,
> 'rust-kernel', ' rust-native:do_populate_sysroot
> clang-native:do_populate_sysroot bindgen-cli-native:do_populate_sysroot',
> '', d)}"
>  do_kernel_configme[dirs] +=3D "${S} ${B}"
>  do_kernel_configme() {
>         do_kernel_metadata config
> @@ -491,6 +492,16 @@ do_kernel_configme() {
>                 bberror "${configs}"
>                 bbfatal_log "Could not find configuration queue
> (${meta_dir}/config.queue)"
>         fi
> +        # Run the kernel's 'make rustavailable' check.
> +        # This is a critical step for getting a clear error message.
> +        # Without this check, if the Rust toolchain is incomplete
> +        # (e.g., missing sources), Kbuild just silently disables
> +        # CONFIG_RUST=3Dy. The build would then succeed *without* Rust
> +        # support, which is very difficult to debug.
> +        # This command forces an explicit failure if the toolchain is no=
t
> ready.
> +        if ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'true'=
,
> 'false', d)}; then
> +            oe_runmake -C ${S} O=3D${B} rustavailable
> +        fi
>
>         CFLAGS=3D"${CFLAGS} ${TOOLCHAIN_OPTIONS}" HOSTCC=3D"${BUILD_CC}
> ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP=3D"${BUILD_CPP}" CC=3D"${KERNEL=
_CC}"
> LD=3D"${KERNEL_LD}" OBJCOPY=3D"${KERNEL_OBJCOPY}" STRIP=3D"${KERNEL_STRIP=
}"
> ARCH=3D${ARCH} merge_config.sh -O ${B} ${config_flags} ${configs} >
> ${meta_dir}/cfg/merge_config_build.log 2>&1
>         if [ $? -ne 0 -o ! -f ${B}/.config ]; then
> @@ -776,3 +787,11 @@ python () {
>  addtask kernel_version_sanity_check after do_kernel_metadata
> do_kernel_checkout before do_compile
>  addtask validate_branches before do_patch after do_kernel_checkout
>  addtask kernel_configcheck after do_configure before do_compile
> +
> +INHERIT:append =3D " ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kerne=
l',
> ' rust-common', '', d)}"
> +KERNEL_EXTRA_DEPENDS_RUST =3D "rust-native cargo-native clang-native
> llvm-native bindgen-cli-native"
>

There's limited value in assigning this to a variable without using ?=3D in
that assignment, since
there's no "clean" way to override it from a bbappend.


> +DEPENDS:append =3D " ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kerne=
l',
> ' ${KERNEL_EXTRA_DEPENDS_RUST}', '', d)}"
> +RUST_KERNEL_OEMAKE_VARS =3D "KRUSTFLAGS=3D\"${RUST_DEBUG_REMAP}\""
>

Same here, should be ?=3D


> +EXTRA_OEMAKE:append =3D " ${@bb.utils.contains('DISTRO_FEATURES',
> 'rust-kernel', ' ${RUST_KERNEL_OEMAKE_VARS}', '', d)}"
> +RUST_DEBUG_REMAP:append =3D "${@bb.utils.contains('DISTRO_FEATURES',
> 'rust-kernel', ' --remap-path-prefix=3D${S}=3D${TARGET_DBGSRC_DIR}/kernel
> --remap-path-prefix=3D${STAGING_DIR_NATIVE}=3D${TARGET_DBGSRC_DIR}/rustc
> --remap-path-prefix=3D${B}=3D${TARGET_DBGSRC_DIR}/build', '', d)}"
> +
>

To keep everything consistent, those rust debug flags should be assigned to
a variable, versus
being inlined in the python.

Bruce



>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#225737):
> https://lists.openembedded.org/g/openembedded-core/message/225737
> Mute This Topic: https://lists.openembedded.org/mt/116120516/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000029bd040642d8d976
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 4, 2025 at 12:15=
=E2=80=AFPM El Mehdi YOUNES via <a href=3D"http://lists.openembedded.org">l=
ists.openembedded.org</a> &lt;elmehdi.younes=3D<a href=3D"mailto:smile.fr@l=
ists.openembedded.org">smile.fr@lists.openembedded.org</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">This change introduce=
s a comprehensive solution to build Rust-enabled<br>
kernels cleanly, controlled by a new DISTRO_FEATURE named &#39;rust-kernel&=
#39;.<br>
<br>
When this feature is enabled, the class performs the following actions:<br>
<br>
1.=C2=A0 Appends the necessary native toolchain dependencies (rust-native,<=
br>
=C2=A0 =C2=A0 bindgen-native, etc.) to the kernel recipe&#39;s DEPENDS.<br>
<br>
2.=C2=A0 Implements a solution for reproducible builds to fix the [buildpat=
hs]<br>
=C2=A0 =C2=A0 QA failures.<br>
=C2=A0 =C2=A0 To solve this, the rustc flag --remap-path-prefix is used. Th=
is<br>
=C2=A0 =C2=A0 flag instructs the compiler to replace build-specific path pr=
efixes<br>
=C2=A0 =C2=A0 with generic ones in all output, including debug metadata. Th=
e official<br>
=C2=A0 =C2=A0 documentation for this flag is here:<br>
=C2=A0 =C2=A0 <a href=3D"https://doc.rust-lang.org/nightly/rustc/remap-sour=
ce-paths.html" rel=3D"noreferrer" target=3D"_blank">https://doc.rust-lang.o=
rg/nightly/rustc/remap-source-paths.html</a><br>
<br>
=C2=A0 =C2=A0 To apply this flag cleanly, the rust-common class is inherite=
d to<br>
=C2=A0 =C2=A0 use its RUST_DEBUG_REMAP variable. This commit extends<br>
=C2=A0 =C2=A0 RUST_DEBUG_REMAP with the specific paths for the kernel sourc=
e (${S}),<br>
=C2=A0 =C2=A0 the build directory (${B}), and the native sysroot (${STAGING=
_DIR_NATIVE}).<br>
=C2=A0 =C2=A0 The resulting flags are then passed to the kernel&#39;s Makef=
ile via the<br>
=C2=A0 =C2=A0 KRUSTFLAGS variable.<br>
<br>
Signed-off-by: El Mehdi YOUNES &lt;<a href=3D"mailto:elmehdi.younes@smile.f=
r" target=3D"_blank">elmehdi.younes@smile.fr</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/kernel-yocto.bbclass | 19 +++++++++++++++++++<br>
=C2=A01 file changed, 19 insertions(+)<br>
<br>
diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe=
/kernel-yocto.bbclass<br>
index e53bf15194..e722a7a81d 100644<br>
--- a/meta/classes-recipe/kernel-yocto.bbclass<br>
+++ b/meta/classes-recipe/kernel-yocto.bbclass<br>
@@ -463,6 +463,7 @@ do_kernel_configme[depends] +=3D &quot;virtual/cross-bi=
nutils:do_populate_sysroot&quot;<br>
=C2=A0do_kernel_configme[depends] +=3D &quot;virtual/cross-cc:do_populate_s=
ysroot&quot;<br>
=C2=A0do_kernel_configme[depends] +=3D &quot;bc-native:do_populate_sysroot =
bison-native:do_populate_sysroot&quot;<br>
=C2=A0do_kernel_configme[depends] +=3D &quot;kern-tools-native:do_populate_=
sysroot&quot;<br>
+do_kernel_configme[depends] +=3D &quot;${@bb.utils.contains(&#39;DISTRO_FE=
ATURES&#39;, &#39;rust-kernel&#39;, &#39; rust-native:do_populate_sysroot c=
lang-native:do_populate_sysroot bindgen-cli-native:do_populate_sysroot&#39;=
, &#39;&#39;, d)}&quot;<br>
=C2=A0do_kernel_configme[dirs] +=3D &quot;${S} ${B}&quot;<br>
=C2=A0do_kernel_configme() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 do_kernel_metadata config<br>
@@ -491,6 +492,16 @@ do_kernel_configme() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bberror &quot;${con=
figs}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bbfatal_log &quot;C=
ould not find configuration queue (${meta_dir}/config.queue)&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Run the kernel&#39;s &#39;make rustavailable=
&#39; check.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # This is a critical step for getting a clear =
error message.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Without this check, if the Rust toolchain is=
 incomplete<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # (e.g., missing sources), Kbuild just silentl=
y disables<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # CONFIG_RUST=3Dy. The build would then succee=
d *without* Rust<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # support, which is very difficult to debug.<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # This command forces an explicit failure if t=
he toolchain is not ready.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ${@bb.utils.contains(&#39;DISTRO_FEATURES&#=
39;, &#39;rust-kernel&#39;, &#39;true&#39;, &#39;false&#39;, d)}; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake -C ${S} O=3D${B} rust=
available<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 CFLAGS=3D&quot;${CFLAGS} ${TOOLCHAIN_OPTIONS}&q=
uot; HOSTCC=3D&quot;${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}&quot; HOST=
CPP=3D&quot;${BUILD_CPP}&quot; CC=3D&quot;${KERNEL_CC}&quot; LD=3D&quot;${K=
ERNEL_LD}&quot; OBJCOPY=3D&quot;${KERNEL_OBJCOPY}&quot; STRIP=3D&quot;${KER=
NEL_STRIP}&quot; ARCH=3D${ARCH} merge_config.sh -O ${B} ${config_flags} ${c=
onfigs} &gt; ${meta_dir}/cfg/merge_config_build.log 2&gt;&amp;1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ $? -ne 0 -o ! -f ${B}/.config ]; then<br>
@@ -776,3 +787,11 @@ python () {<br>
=C2=A0addtask kernel_version_sanity_check after do_kernel_metadata do_kerne=
l_checkout before do_compile<br>
=C2=A0addtask validate_branches before do_patch after do_kernel_checkout<br=
>
=C2=A0addtask kernel_configcheck after do_configure before do_compile<br>
+<br>
+INHERIT:append =3D &quot; ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, =
&#39;rust-kernel&#39;, &#39; rust-common&#39;, &#39;&#39;, d)}&quot;<br>
+KERNEL_EXTRA_DEPENDS_RUST =3D &quot;rust-native cargo-native clang-native =
llvm-native bindgen-cli-native&quot;<br></blockquote><div><br></div><div><d=
iv class=3D"gmail_default" style=3D"font-size:small">There&#39;s limited va=
lue in assigning this to a variable without using ?=3D in that assignment, =
since</div><div class=3D"gmail_default" style=3D"font-size:small">there&#39=
;s no &quot;clean&quot; way to override it from a bbappend.</div></div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+DEPENDS:append =3D &quot; ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, =
&#39;rust-kernel&#39;, &#39; ${KERNEL_EXTRA_DEPENDS_RUST}&#39;, &#39;&#39;,=
 d)}&quot;<br>
+RUST_KERNEL_OEMAKE_VARS =3D &quot;KRUSTFLAGS=3D\&quot;${RUST_DEBUG_REMAP}\=
&quot;&quot;<br></blockquote><div><br></div><div><div class=3D"gmail_defaul=
t" style=3D"font-size:small">Same here, should be ?=3D</div></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+EXTRA_OEMAKE:append =3D &quot; ${@bb.utils.contains(&#39;DISTRO_FEATURES&#=
39;, &#39;rust-kernel&#39;, &#39; ${RUST_KERNEL_OEMAKE_VARS}&#39;, &#39;&#3=
9;, d)}&quot;<br>
+RUST_DEBUG_REMAP:append =3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURE=
S&#39;, &#39;rust-kernel&#39;, &#39; --remap-path-prefix=3D${S}=3D${TARGET_=
DBGSRC_DIR}/kernel --remap-path-prefix=3D${STAGING_DIR_NATIVE}=3D${TARGET_D=
BGSRC_DIR}/rustc --remap-path-prefix=3D${B}=3D${TARGET_DBGSRC_DIR}/build&#3=
9;, &#39;&#39;, d)}&quot;<br>
+<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D=
"font-size:small">To keep everything consistent, those rust debug flags sho=
uld be assigned to a variable, versus</div><div class=3D"gmail_default" sty=
le=3D"font-size:small">being inlined in the python.</div><div class=3D"gmai=
l_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default"=
 style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#225737): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/225737" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/225737</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116120516/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116120516/1050810</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.com" =
target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--00000000000029bd040642d8d976--

