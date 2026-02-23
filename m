Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A8C3EC1110
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 17:01:57 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40215.1771866108662816733
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 09:01:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BTC7SFpm;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a7d98c1879so29522095ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 09:01:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771866108; cv=none;
        d=google.com; s=arc-20240605;
        b=K8V5I56ocCXT7nYggXCxiHZQt1aGYi+CvGRVXvZHgxzMR5t3mwZqlqKNhOAnJ5Ay4M
         9fZZcdsmPlWPGZTvOrlEPvqZK3gY08daX5st2EAOqPDSbPFXbH9/ib9s1X8WisDpzH2p
         ZS4JRv+HNhCxbHnu5BI/lH4sCMiMxcfxDjRBLNMje2wMZ4MFXqm0BrFypHECQGwClhde
         kKcG7vBvWtmyZDjdmuHb5Wisl9uEt9tO72jX0vuPnEgKcqnNlZbPSDtH/B/uO+dH+EIy
         ukvpUPiEA31w/4M3xNdjMJ6PtN8Fzsehp8453d3pixTRlpZ6Z5b8mhsTgoAgy6gSvXR1
         UGAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XFt7kuBy0Tfa5QoNIy30sxYwaeJGF9/syx1naYPDRcw=;
        fh=Ab5QchtAs08eZNSFiBl6MfJNprT6k/vVQ8w3IX57Q1U=;
        b=k3V9gJHtbLem6Uu1kwsuPqXA92R88v18vTLJnJssZnwCpAD8QvwMu0+UiaHXECRM8E
         73CeKktX3i8yVi61OSX13hDB/B2KWn6b+DuozDsmObmmjK1JPbBfgqUUU2zAgkxGV5nW
         xY/XzpL6FSFbER3US7ONpnLdGt05jD6hnh5syFvtkYNfcreguBRnbPoYTazrITCiYNYC
         LmcOzSPU8hNLAP/mXUEBRd3hyydNqWxg7L5SJB7IdsyxFNtanKpBBmNmCL2Jcj9AHnMB
         mjF2G9Eaf8k784BW49z6yov7tgybj9FBrIC2Ozyi1C2GVD5hcMU1FFwzy7DGCLwXKAfP
         CRWg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771866108; x=1772470908; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XFt7kuBy0Tfa5QoNIy30sxYwaeJGF9/syx1naYPDRcw=;
        b=BTC7SFpmG1l3Zd7KgDwAp781pmVSBss/beO6xxYQZJJyVljluWn5OVlUBoj3159wB1
         a4f9qXuQRM/8tM0W90hxiZoFg8N6NmxzbzaxdMT/jAhS1f1Q2Uc12i6Sw5eQcf0O6eNX
         4Ny28z5fTuCh7TgU0fIKwxuhDc1GzNikhByv030nysT+WkumNdrXgIPPw6KpmdNv+Sqm
         FM3vPqy8CsI4wm5beGLYLy2CZS2v/Ivrpn2rB/t/TVrSRq2pcWvd3g1Krn0DgcG/4pVV
         aeKhuwzCwrYrCz8Yyzk7DaQOpXOmAN4zd2JQIOw7PIefPigTIrYzv9GhHflETMqG3i1W
         hG5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771866108; x=1772470908;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XFt7kuBy0Tfa5QoNIy30sxYwaeJGF9/syx1naYPDRcw=;
        b=xEYlZ9EAFautyInIt4YVfZr6zbqB8DTFGV6sV4IoqSK6UpVn7nsi64ZuUKa/wSM9Rv
         7WGdBjIJTOQIkgDjL8Qex+uHCax3qpwev9eY4ByAqNvdb8u3bNFGWuvV0stU8BEMuy7f
         tAW/nDpCn/7nFXVEXGGTgAZUHI96lSfqulfeK1c6sAF/UUTN+HYy6O/THkMt/j4j+Kvz
         EZJzIatWKY6/BCSx3vpmqkq/05nuTcdYmgzlBR8izltmkAIaPiWjckQjZ0dqT4cSxdJJ
         OHHdZ2Hjez3aClIJSuDC4ipISqeVnX1P91HejGKaQL2FCm0+JoLqbn78Bj2ZKMml2QT1
         Kiug==
X-Gm-Message-State: AOJu0YxgMNFI2KWZzS/5QFZALCnFB+HMO6DWlIaIs4cCDaOxC142gMis
	TEPyB3Wu3mjkcKVZLk9o9qpKo/1LTrOdKmbQ3oE4Te3k3I4pNceb42UtHWib5EWvV/zzwkqPe0l
	KrivzYBZvy49DMgYkmfnzJ+4EeErbvM8=
X-Gm-Gg: ATEYQzxFFbplPHkbBsuS4KXQP4Fb4c16OlVKUF57Eu/92+/z1Nw7xIP8kTn0JKWOEZH
	/2KdtrXVY+pL4uvyh5O1jziDYgP1KYvWCYlZPATSQeRcPaMA6DSayeZHoOavDsOVQZHG0z6gSti
	X2XEgZCXcgVX+Z8N8tjAkaukpYFBEvhDxCxpg7WP4Si32/EuC+0n/VPsZqgfP9LGJaRkjeYZVyl
	hp+cx1vlCWM9CxGqyVwhuimVRbldYFAUzPIkDKMygVZPjNL5Sd30TmjGg4H0p/D+nx+PSYM+r/b
	zDsGaV+7HQRluFFBs6ipbsOyf9FDXEOCexOJh0DS3aLD7XvZ54s=
X-Received: by 2002:a17:902:e747:b0:2a9:30d4:2af3 with SMTP id
 d9443c01a7336-2ad7456c0admr83987455ad.49.1771866106419; Mon, 23 Feb 2026
 09:01:46 -0800 (PST)
MIME-Version: 1.0
References: <20260209125628.640221-1-ross.burton@arm.com> <20260209125628.640221-9-ross.burton@arm.com>
In-Reply-To: <20260209125628.640221-9-ross.burton@arm.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 23 Feb 2026 12:01:34 -0500
X-Gm-Features: AaiRm518RPCLQAYcKf5BMAfgVI5yPFAWdLjebxTtCuScBBKOmSpwVDzJvzBFMUM
Message-ID: <CADkTA4PJwhOrRvwWFY_aOZNjTgsjAv_HYHTWrd0yGX0-s8SC3Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 9/9] kernel: remove pkg-config variables for
 old (<5.15) kernels
To: ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000dcdcb8064b80b9ae"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 17:01:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231683

--000000000000dcdcb8064b80b9ae
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 9, 2026 at 7:56=E2=80=AFAM Ross Burton via lists.openembedded.o=
rg
<ross.burton=3Darm.com@lists.openembedded.org> wrote:

> The kernel has supported setting an alternative binary for pkg-config
> with a variable since 5.19 (in 2022[1]) and we set that to
> pkg-config-native, so there is no longer any need to also manually set
> the PKG_CONFIG_* variables.
>
> The relevant commit was backported and is present in 5.15.91 onwards,
> but is not yet in 5.10.x.
>
>
Ross and I had spoken about this before he sent the series, no
concerns on my end.

Acked-by: Bruce Ashfield <bruce.ashfield@gmail.com>



> [1] linux d5ea4fece450 ("kbuild: Allow kernel installation packaging to
> override pkg-config")
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/classes-recipe/kernel.bbclass        | 9 ---------
>  meta/recipes-kernel/linux/linux-yocto.inc | 7 ++-----
>  2 files changed, 2 insertions(+), 14 deletions(-)
>
> diff --git a/meta/classes-recipe/kernel.bbclass
> b/meta/classes-recipe/kernel.bbclass
> index b43b4ff4fb..1ebf027281 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -251,7 +251,6 @@ KERNEL_EXTRA_ARGS ?=3D ""
>  EXTRA_OEMAKE +=3D ' CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}"
> OBJCOPY=3D"${KERNEL_OBJCOPY}" STRIP=3D"${KERNEL_STRIP}"'
>  EXTRA_OEMAKE +=3D ' HOSTCC=3D"${BUILD_CC}" HOSTCFLAGS=3D"${BUILD_CFLAGS}=
"
> HOSTLDFLAGS=3D"${BUILD_LDFLAGS}" HOSTCPP=3D"${BUILD_CPP}"'
>  EXTRA_OEMAKE +=3D ' HOSTCXX=3D"${BUILD_CXX}" HOSTCXXFLAGS=3D"${BUILD_CXX=
FLAGS}"'
> -# Only for newer kernels (5.19+), native pkg-config variables are set fo=
r
> older kernels when building kernel and modules
>  EXTRA_OEMAKE +=3D ' HOSTPKG_CONFIG=3D"pkg-config-native"'
>
>  KERNEL_ALT_IMAGETYPE ??=3D ""
> @@ -364,10 +363,6 @@ KERNEL_DEBUG_TIMESTAMPS ??=3D "0"
>  kernel_do_compile() {
>         unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
>
> -       # setup native pkg-config variables (kconfig scripts call
> pkg-config directly, cannot generically be overriden to pkg-config-native=
)
> -       export
> PKG_CONFIG_LIBDIR=3D"${STAGING_LIBDIR_NATIVE}/pkgconfig:${STAGING_DATADIR=
_NATIVE}/pkgconfig"
> -       export PKG_CONFIG_SYSROOT_DIR=3D""
> -
>         if [ "${KERNEL_DEBUG_TIMESTAMPS}" !=3D "1" ]; then
>                 # kernel sources do not use do_unpack, so
> SOURCE_DATE_EPOCH may not
>                 # be set....
> @@ -418,10 +413,6 @@ addtask transform_kernel after do_compile before
> do_install
>  do_compile_kernelmodules() {
>         unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
>
> -       # setup native pkg-config variables (kconfig scripts call
> pkg-config directly, cannot generically be overriden to pkg-config-native=
)
> -       export
> PKG_CONFIG_LIBDIR=3D"${STAGING_LIBDIR_NATIVE}/pkgconfig:${STAGING_DATADIR=
_NATIVE}/pkgconfig"
> -       export PKG_CONFIG_SYSROOT_DIR=3D""
> -
>         if [ "${KERNEL_DEBUG_TIMESTAMPS}" !=3D "1" ]; then
>                 # kernel sources do not use do_unpack, so
> SOURCE_DATE_EPOCH may not
>                 # be set....
> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc
> b/meta/recipes-kernel/linux/linux-yocto.inc
> index d57c1aae25..4e230d405a 100644
> --- a/meta/recipes-kernel/linux/linux-yocto.inc
> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> @@ -88,9 +88,6 @@ do_kernel_configme[depends] +=3D
> '${@bb.utils.contains("KERNEL_DEBUG", "True", "pa
>  EXTRA_OEMAKE +=3D '${@bb.utils.contains("KERNEL_DEBUG", "True", "",
> "PAHOLE=3Dfalse", d)}'
>
>  do_devshell:prepend() {
> -    # setup native pkg-config variables (kconfig scripts call pkg-config
> directly, cannot generically be overriden to pkg-config-native)
> -    d.setVar("PKG_CONFIG_PATH", "")
> -    d.setVar("PKG_CONFIG_LIBDIR",
> "${STAGING_LIBDIR_NATIVE}/pkgconfig:${STAGING_DATADIR_NATIVE}/pkgconfig")
> -    d.setVarFlag("PKG_CONFIG_SYSROOT_DIR", "unexport", "1")
> -    d.appendVar("OE_TERMINAL_EXPORTS", " PKG_CONFIG_PATH
> PKG_CONFIG_LIBDIR PKG_CONFIG_SYSROOT_DIR")
> +    d.setVar("HOSTPKG_CONFIG", "pkg-config-native")
> +    d.appendVar("OE_TERMINAL_EXPORTS", " HOSTPKG_CONFIG")
>  }
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#230796):
> https://lists.openembedded.org/g/openembedded-core/message/230796
> Mute This Topic: https://lists.openembedded.org/mt/117718171/1050810
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

--000000000000dcdcb8064b80b9ae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 9, 2026 at 7:56=
=E2=80=AFAM Ross Burton via <a href=3D"http://lists.openembedded.org">lists=
.openembedded.org</a> &lt;ross.burton=3D<a href=3D"mailto:arm.com@lists.ope=
nembedded.org">arm.com@lists.openembedded.org</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">The kernel has supported setti=
ng an alternative binary for pkg-config<br>
with a variable since 5.19 (in 2022[1]) and we set that to<br>
pkg-config-native, so there is no longer any need to also manually set<br>
the PKG_CONFIG_* variables.<br>
<br>
The relevant commit was backported and is present in 5.15.91 onwards,<br>
but is not yet in 5.10.x.<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">Ross and I had spoken about this before he sent the series=
, no</div><div class=3D"gmail_default" style=3D"font-size:small">concerns o=
n my end.</div><div class=3D"gmail_default" style=3D"font-size:small"><br><=
/div><div class=3D"gmail_default" style=3D"font-size:small">Acked-by: Bruce=
 Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gm=
ail.com</a>&gt;</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
[1] linux d5ea4fece450 (&quot;kbuild: Allow kernel installation packaging t=
o override pkg-config&quot;)<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targe=
t=3D"_blank">ross.burton@arm.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/kernel.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 9 ---=
------<br>
=C2=A0meta/recipes-kernel/linux/linux-yocto.inc | 7 ++-----<br>
=C2=A02 files changed, 2 insertions(+), 14 deletions(-)<br>
<br>
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kerne=
l.bbclass<br>
index b43b4ff4fb..1ebf027281 100644<br>
--- a/meta/classes-recipe/kernel.bbclass<br>
+++ b/meta/classes-recipe/kernel.bbclass<br>
@@ -251,7 +251,6 @@ KERNEL_EXTRA_ARGS ?=3D &quot;&quot;<br>
=C2=A0EXTRA_OEMAKE +=3D &#39; CC=3D&quot;${KERNEL_CC}&quot; LD=3D&quot;${KE=
RNEL_LD}&quot; OBJCOPY=3D&quot;${KERNEL_OBJCOPY}&quot; STRIP=3D&quot;${KERN=
EL_STRIP}&quot;&#39;<br>
=C2=A0EXTRA_OEMAKE +=3D &#39; HOSTCC=3D&quot;${BUILD_CC}&quot; HOSTCFLAGS=
=3D&quot;${BUILD_CFLAGS}&quot; HOSTLDFLAGS=3D&quot;${BUILD_LDFLAGS}&quot; H=
OSTCPP=3D&quot;${BUILD_CPP}&quot;&#39;<br>
=C2=A0EXTRA_OEMAKE +=3D &#39; HOSTCXX=3D&quot;${BUILD_CXX}&quot; HOSTCXXFLA=
GS=3D&quot;${BUILD_CXXFLAGS}&quot;&#39;<br>
-# Only for newer kernels (5.19+), native pkg-config variables are set for =
older kernels when building kernel and modules<br>
=C2=A0EXTRA_OEMAKE +=3D &#39; HOSTPKG_CONFIG=3D&quot;pkg-config-native&quot=
;&#39;<br>
<br>
=C2=A0KERNEL_ALT_IMAGETYPE ??=3D &quot;&quot;<br>
@@ -364,10 +363,6 @@ KERNEL_DEBUG_TIMESTAMPS ??=3D &quot;0&quot;<br>
=C2=A0kernel_do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE<=
br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# setup native pkg-config variables (kconfig sc=
ripts call pkg-config directly, cannot generically be overriden to pkg-conf=
ig-native)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export PKG_CONFIG_LIBDIR=3D&quot;${STAGING_LIBD=
IR_NATIVE}/pkgconfig:${STAGING_DATADIR_NATIVE}/pkgconfig&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export PKG_CONFIG_SYSROOT_DIR=3D&quot;&quot;<br=
>
-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;${KERNEL_DEBUG_TIMESTAMPS}&quot; !=
=3D &quot;1&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # kernel sources do=
 not use do_unpack, so SOURCE_DATE_EPOCH may not<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # be set....<br>
@@ -418,10 +413,6 @@ addtask transform_kernel after do_compile before do_in=
stall<br>
=C2=A0do_compile_kernelmodules() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE<=
br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# setup native pkg-config variables (kconfig sc=
ripts call pkg-config directly, cannot generically be overriden to pkg-conf=
ig-native)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export PKG_CONFIG_LIBDIR=3D&quot;${STAGING_LIBD=
IR_NATIVE}/pkgconfig:${STAGING_DATADIR_NATIVE}/pkgconfig&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export PKG_CONFIG_SYSROOT_DIR=3D&quot;&quot;<br=
>
-<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;${KERNEL_DEBUG_TIMESTAMPS}&quot; !=
=3D &quot;1&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # kernel sources do=
 not use do_unpack, so SOURCE_DATE_EPOCH may not<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # be set....<br>
diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kerne=
l/linux/linux-yocto.inc<br>
index d57c1aae25..4e230d405a 100644<br>
--- a/meta/recipes-kernel/linux/linux-yocto.inc<br>
+++ b/meta/recipes-kernel/linux/linux-yocto.inc<br>
@@ -88,9 +88,6 @@ do_kernel_configme[depends] +=3D &#39;${@bb.utils.contain=
s(&quot;KERNEL_DEBUG&quot;, &quot;True&quot;, &quot;pa<br>
=C2=A0EXTRA_OEMAKE +=3D &#39;${@bb.utils.contains(&quot;KERNEL_DEBUG&quot;,=
 &quot;True&quot;, &quot;&quot;, &quot;PAHOLE=3Dfalse&quot;, d)}&#39;<br>
<br>
=C2=A0do_devshell:prepend() {<br>
-=C2=A0 =C2=A0 # setup native pkg-config variables (kconfig scripts call pk=
g-config directly, cannot generically be overriden to pkg-config-native)<br=
>
-=C2=A0 =C2=A0 d.setVar(&quot;PKG_CONFIG_PATH&quot;, &quot;&quot;)<br>
-=C2=A0 =C2=A0 d.setVar(&quot;PKG_CONFIG_LIBDIR&quot;, &quot;${STAGING_LIBD=
IR_NATIVE}/pkgconfig:${STAGING_DATADIR_NATIVE}/pkgconfig&quot;)<br>
-=C2=A0 =C2=A0 d.setVarFlag(&quot;PKG_CONFIG_SYSROOT_DIR&quot;, &quot;unexp=
ort&quot;, &quot;1&quot;)<br>
-=C2=A0 =C2=A0 d.appendVar(&quot;OE_TERMINAL_EXPORTS&quot;, &quot; PKG_CONF=
IG_PATH PKG_CONFIG_LIBDIR PKG_CONFIG_SYSROOT_DIR&quot;)<br>
+=C2=A0 =C2=A0 d.setVar(&quot;HOSTPKG_CONFIG&quot;, &quot;pkg-config-native=
&quot;)<br>
+=C2=A0 =C2=A0 d.appendVar(&quot;OE_TERMINAL_EXPORTS&quot;, &quot; HOSTPKG_=
CONFIG&quot;)<br>
=C2=A0}<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#230796): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/230796" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/230796</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117718171/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117718171/1050810</a><br>
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

--000000000000dcdcb8064b80b9ae--

