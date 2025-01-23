Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2E85C02182
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 15:49:51 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.13493.1737647385643296376
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jan 2025 07:49:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=uNJ+CRUn;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-385df53e559so803581f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Jan 2025 07:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1737647384; x=1738252184; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vjgWHHDtbwZ+VF7Bbys1xUXnENT7lbsgWn8liyU8M08=;
        b=uNJ+CRUnIeXLo3UdH0B1Am98V4h7uPhvzNZP5Arnrz5GjQ8CYA7lIONE8NIAtV8mlp
         GeEb2p3YcW2Pj35yeaiSRE8xbZP+pwCeWCTn8evSo1iUGGjb8XZBpsQXf8JU7Nj42yna
         fsoad8k07uGXVIdvAgylNb3pH1pHnsUzLiv0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737647384; x=1738252184;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vjgWHHDtbwZ+VF7Bbys1xUXnENT7lbsgWn8liyU8M08=;
        b=kZ9UctNyy0BOd+RNOG7ReRCE8unTWntSqSQA0Qzb39VcFXn+bYCAcvA7QE7Htcqo3t
         CzL04AqdPGEDXOzq45g8gHkdQPeXy5fgMOsv2Ws33yfI6Wzo0JGmColrCDkg3VhC1Nwa
         VkmomChTp/gV2QNLb866M9TCivl/a9ZNe6FJdXQcCAigSO3+Sk3H2B+BcIGSTSRFUaaO
         ifN8NEewHcxWxY4uMKfAkSQwadun7pqx5+0TQijILO2Zq4f1orYQ9VGC/uw16o5IquKY
         sn3AXOrhnIAL3F23WMUN2Cd8GfNWgJGlJXRg1uGJ5aKwArD+1bUvGNHQLYdeYi7NGGnG
         5CmQ==
X-Gm-Message-State: AOJu0Yw+jGj98X9pXw7V7n1UFzsM6rin2Z79hwnqi/W65hTXRgG2+zyO
	A/YPHfti69DPJTFlXPctjZvkgEH3kdDnKP6jSAOvbaPiJk1JkfE1ihObKz5dtUGs0y5cO0er0pP
	JRXfGakfTSezb0O8Vg/xsO12i3dYF36okHEHZUw==
X-Gm-Gg: ASbGncuiXK8ii2TLCrdYaGGEPJMey/6+r9vqD9Ch2Il2hNupfO5j1NGwFJnSip7Ad4T
	mv2k6HYflTkWIKRXrUOyG/RiyAgEIo0HD0tiv6pjSsntylfgWbsIbOIQ9+iNGrJvt
X-Google-Smtp-Source: AGHT+IH0CwKHGlg5s8gfzQRMJNnZlnii/VQKZ3UhV4UE5w3+zgZ2GzKEWbxsj775Iqf03Pi9lDFS02809ApVZ4AGPAI=
X-Received: by 2002:a05:6000:2c5:b0:37d:4647:154e with SMTP id
 ffacd0b85a97d-38bf5655bd3mr22721954f8f.9.1737647382300; Thu, 23 Jan 2025
 07:49:42 -0800 (PST)
MIME-Version: 1.0
References: <20250121085526.1370937-7-hongxu.jia@windriver.com> <20250123045339.2443875-1-hongxu.jia@windriver.com>
In-Reply-To: <20250123045339.2443875-1-hongxu.jia@windriver.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 23 Jan 2025 16:49:14 +0100
X-Gm-Features: AWEUYZm9-h7YjZ8q-QzaxsbyqY7qkSA8H4oMobYRtO824zc_meuPVBFZEgJ3dk4
Message-ID: <CAMSfU+6UiZFzjj26FBjTJan-u+2K7LvVQjQVfsDf2bFYdYFMcw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 7/9] gcc-configure-common.inc: add multlib
 support for i686/i586/x86_64 nativesdk gcc
To: hongxu.jia@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f7b054062c618e43"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jan 2025 15:49:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210199

--000000000000f7b054062c618e43
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Le jeu. 23 janv. 2025 =C3=A0 05:53, hongxu via lists.openembedded.org
<hongxu.jia=3Deng.windriver.com@lists.openembedded.org> a =C3=A9crit :

> We have patch 0016-handle-sysroot-support-for-nativesdk-gcc.patch to hand=
le
> sysroot support for nativesdk-gcc, and add %r target_relocatable_prefix
> into spec file for nativesdk-gcc relocation. It was used for injected
> paths SYSTEMLIBS_DIR
>
> Due to the supported SDKMACHINE includes:
>
>   aarch64, i586, i686, loongarch64, ppc64, ppc64le, riscv64, x86_64
>
> Only i586 and x86_64, i686 and x86_64 have multilib relationship,
> for i586,i686 and x86_64, this commit:
>
> - Tweak target_relocatable_prefix, set ${root_prefix} to it , and tweak
> libdir32 based on ${root_prefix} prefix with "/lib" suffix
>
> - For i686 and i586, hard code `lib' to 32bit osdirname, `lib64' to
> libdir64 and 64bit osdirname, whether multlib or not
>
> - For x86_64, use variable baselib to set libdir64 and 64bit osdirnames,
> baselib is set to `lib64' for multilib, and `lib' for non multilib
>
> Above setting also covers gcc-nativesdk without multilib
>
> For other situation, the configuration is the same as usual
>
> [ YOCTO #15722 ]
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
> Changed in v2,
> Fix `cargo build' failded in SDK, the interpreter of dynamical loader
> is not right
>
> $ rustc build.rs
> $ ./build
> ./build: cannot execute: required file not found
> $ file build
> build: ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV),
> dynamically linked, interpreter
> sdk-path-to/sysroots/x86_64-pokysdk-linux/lib64/ld-linux-x86-64.so.2, for
> GNU/Linux 3.2.0, BuildID[sha1]=3D4e012c629e30ebc91c3252eb0fd40358cc5b2dfa=
,
> not stripped
> $ ls sdk-path-to/sysroots/x86_64-pokysdk-linux/lib/ld-linux-x86-64.so.2
> sdk-path-to/sysroots/x86_64-pokysdk-linux/lib/ld-linux-x86-64.so.2
>
> For x86_64, use variable baselib to set libdir64 and 64bit osdirnames,
> baselib is set to `lib64' for multilib, and `lib' for non multilib
>

This is the v2 of single patch in the middle of a patch series. Can you sen=
d
version iteration of the full series?

Thanks!


>  meta/recipes-devtools/gcc/gcc-configure-common.inc    |  9 +++++++++
>  meta/recipes-devtools/gcc/gcc-multilib-config.inc     | 11 +++++++++++
>  ...016-handle-sysroot-support-for-nativesdk-gcc.patch |  2 +-
>  3 files changed, 21 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc
> b/meta/recipes-devtools/gcc/gcc-configure-common.inc
> index 5c79936242..bd5c953334 100644
> --- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
> +++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
> @@ -73,6 +73,14 @@ SYSTEMHEADERS =3D "${target_includedir}"
>  SYSTEMLIBS =3D "${target_base_libdir}/"
>  SYSTEMLIBS1 =3D "${target_libdir}/"
>
> +def tune_target_relocatable_prefix(d):
> +    if d.getVar("SDK_ARCH") in ["x86_64", "i686", "i586"]:
> +        return d.getVar("root_prefix")
> +    else:
> +        return d.getVar("SYSTEMLIBS")
> +TARGET_RELOCATE_PREFIX =3D "${SYSTEMLIBS}"
> +TARGET_RELOCATE_PREFIX:class-nativesdk =3D
> "${@tune_target_relocatable_prefix(d)}"
> +
>  do_configure:prepend () {
>         # teach gcc to find correct target includedir when checking libc
> ssp support
>         mkdir -p ${B}/gcc
> @@ -83,6 +91,7 @@ do_configure:prepend () {
>  #define STANDARD_STARTFILE_PREFIX_1 "${SYSTEMLIBS}"
>  #define STANDARD_STARTFILE_PREFIX_2 "${SYSTEMLIBS1}"
>  #define SYSTEMLIBS_DIR "${SYSTEMLIBS}"
> +#define TARGET_RELOCATE_PREFIX "${TARGET_RELOCATE_PREFIX}"
>  #endif /* ! GCC_DEFAULTS_H */
>  _EOF
>         mv ${B}/gcc/defaults.h.new ${B}/gcc/defaults.h
> diff --git a/meta/recipes-devtools/gcc/gcc-multilib-config.inc
> b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
> index 2dbbc23c94..997bb6029b 100644
> --- a/meta/recipes-devtools/gcc/gcc-multilib-config.inc
> +++ b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
> @@ -172,6 +172,17 @@ python gcc_multilib_setup() {
>      target_arch =3D (d.getVar('TARGET_ARCH_MULTILIB_ORIGINAL') if mlpref=
ix
>                      else d.getVar('TARGET_ARCH'))
>      if pn =3D=3D "nativesdk-gcc":
> +        sdk_arch =3D d.getVar('SDK_ARCH')
> +        if sdk_arch in ['x86_64', 'i686', 'i586']:
> +            libdir32 =3D '%r/lib'
> +            if sdk_arch =3D=3D 'x86_64':
> +                libdir64 =3D '%r/' + d.getVar('baselib')
> +                osdirnames =3D ['../'+d.getVar('baselib') ,'../lib']
> +            else:
> +                libdir64 =3D '%r/lib64'
> +                osdirnames =3D ['../lib64', '../lib']
> +            target_config_files =3D
> gcc_target_config_files[d.getVar("SDK_ARCH")]
> +            write_config(builddir, target_config_files, ['m64', 'm32'],
> ['64', '32'], osdirnames)
>          header_config_files =3D
> gcc_header_config_files[d.getVar("SDK_ARCH")]
>          write_headers(builddir, header_config_files, libdir32, libdir64,
> libdirx32, libdirn32)
>          return
> diff --git
> a/meta/recipes-devtools/gcc/gcc/0016-handle-sysroot-support-for-nativesdk=
-gcc.patch
> b/meta/recipes-devtools/gcc/gcc/0016-handle-sysroot-support-for-nativesdk=
-gcc.patch
> index edd100ee46..7d96a42027 100644
> ---
> a/meta/recipes-devtools/gcc/gcc/0016-handle-sysroot-support-for-nativesdk=
-gcc.patch
> +++
> b/meta/recipes-devtools/gcc/gcc/0016-handle-sysroot-support-for-nativesdk=
-gcc.patch
> @@ -389,7 +389,7 @@ index e3e9374d1cc..b080609341b 100644
>   #endif
>   static const char *target_system_root =3D DEFAULT_TARGET_SYSTEM_ROOT;
>
> -+static char target_relocatable_prefix[4096] __attribute__ ((section
> (".gccrelocprefix"))) =3D SYSTEMLIBS_DIR;
> ++static char target_relocatable_prefix[4096] __attribute__ ((section
> (".gccrelocprefix"))) =3D TARGET_RELOCATE_PREFIX;
>  +
>   /* Nonzero means pass the updated target_system_root to the compiler.  =
*/
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#210174):
> https://lists.openembedded.org/g/openembedded-core/message/210174
> Mute This Topic: https://lists.openembedded.org/mt/110767332/4316185
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS - Tech expert

--000000000000f7b054062c618e43
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,<br></div><br><div class=3D"gmail_quote gmail_q=
uote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 23 janv.=
 2025 =C3=A0=C2=A005:53, hongxu via <a href=3D"http://lists.openembedded.or=
g">lists.openembedded.org</a> &lt;hongxu.jia=3D<a href=3D"mailto:eng.windri=
ver.com@lists.openembedded.org">eng.windriver.com@lists.openembedded.org</a=
>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">We have patch 0016-handle-sysroot-support-for-nativesdk-gcc.patc=
h to handle<br>
sysroot support for nativesdk-gcc, and add %r target_relocatable_prefix<br>
into spec file for nativesdk-gcc relocation. It was used for injected<br>
paths SYSTEMLIBS_DIR<br>
<br>
Due to the supported SDKMACHINE includes:<br>
<br>
=C2=A0 aarch64, i586, i686, loongarch64, ppc64, ppc64le, riscv64, x86_64<br=
>
<br>
Only i586 and x86_64, i686 and x86_64 have multilib relationship,<br>
for i586,i686 and x86_64, this commit:<br>
<br>
- Tweak target_relocatable_prefix, set ${root_prefix} to it , and tweak<br>
libdir32 based on ${root_prefix} prefix with &quot;/lib&quot; suffix<br>
<br>
- For i686 and i586, hard code `lib&#39; to 32bit osdirname, `lib64&#39; to=
<br>
libdir64 and 64bit osdirname, whether multlib or not<br>
<br>
- For x86_64, use variable baselib to set libdir64 and 64bit osdirnames,<br=
>
baselib is set to `lib64&#39; for multilib, and `lib&#39; for non multilib<=
br>
<br>
Above setting also covers gcc-nativesdk without multilib<br>
<br>
For other situation, the configuration is the same as usual<br>
<br>
[ YOCTO #15722 ]<br>
<br>
Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" t=
arget=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
---<br>
Changed in v2, <br>
Fix `cargo build&#39; failded in SDK, the interpreter of dynamical loader<b=
r>
is not right<br>
<br>
$ rustc <a href=3D"http://build.rs" rel=3D"noreferrer" target=3D"_blank">bu=
ild.rs</a><br>
$ ./build<br>
./build: cannot execute: required file not found<br>
$ file build<br>
build: ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically=
 linked, interpreter sdk-path-to/sysroots/x86_64-pokysdk-linux/lib64/ld-lin=
ux-x86-64.so.2, for GNU/Linux 3.2.0, BuildID[sha1]=3D4e012c629e30ebc91c3252=
eb0fd40358cc5b2dfa, not stripped<br>
$ ls sdk-path-to/sysroots/x86_64-pokysdk-linux/lib/ld-linux-x86-64.so.2<br>
sdk-path-to/sysroots/x86_64-pokysdk-linux/lib/ld-linux-x86-64.so.2<br>
<br>
For x86_64, use variable baselib to set libdir64 and 64bit osdirnames,<br>
baselib is set to `lib64&#39; for multilib, and `lib&#39; for non multilib<=
br></blockquote><div><br></div><div>This is the v2 of single patch in the m=
iddle of a patch series. Can you <span class=3D"gmail-Lm gmail-ng">send ver=
sion</span> <span class=3D"gmail-Lm gmail-ng">iteration of</span> the full =
series?</div><div><br></div><div>Thanks!<br></div><div>=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
=C2=A0meta/recipes-devtools/gcc/gcc-configure-common.inc=C2=A0 =C2=A0 |=C2=
=A0 9 +++++++++<br>
=C2=A0meta/recipes-devtools/gcc/gcc-multilib-config.inc=C2=A0 =C2=A0 =C2=A0=
| 11 +++++++++++<br>
=C2=A0...016-handle-sysroot-support-for-nativesdk-gcc.patch |=C2=A0 2 +-<br=
>
=C2=A03 files changed, 21 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/reci=
pes-devtools/gcc/gcc-configure-common.inc<br>
index 5c79936242..bd5c953334 100644<br>
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc<br>
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc<br>
@@ -73,6 +73,14 @@ SYSTEMHEADERS =3D &quot;${target_includedir}&quot;<br>
=C2=A0SYSTEMLIBS =3D &quot;${target_base_libdir}/&quot;<br>
=C2=A0SYSTEMLIBS1 =3D &quot;${target_libdir}/&quot;<br>
<br>
+def tune_target_relocatable_prefix(d):<br>
+=C2=A0 =C2=A0 if d.getVar(&quot;SDK_ARCH&quot;) in [&quot;x86_64&quot;, &q=
uot;i686&quot;, &quot;i586&quot;]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return d.getVar(&quot;root_prefix&quot;)<br>
+=C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return d.getVar(&quot;SYSTEMLIBS&quot;)<br>
+TARGET_RELOCATE_PREFIX =3D &quot;${SYSTEMLIBS}&quot;<br>
+TARGET_RELOCATE_PREFIX:class-nativesdk =3D &quot;${@tune_target_relocatabl=
e_prefix(d)}&quot;<br>
+<br>
=C2=A0do_configure:prepend () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # teach gcc to find correct target includedir w=
hen checking libc ssp support<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p ${B}/gcc<br>
@@ -83,6 +91,7 @@ do_configure:prepend () {<br>
=C2=A0#define STANDARD_STARTFILE_PREFIX_1 &quot;${SYSTEMLIBS}&quot;<br>
=C2=A0#define STANDARD_STARTFILE_PREFIX_2 &quot;${SYSTEMLIBS1}&quot;<br>
=C2=A0#define SYSTEMLIBS_DIR &quot;${SYSTEMLIBS}&quot;<br>
+#define TARGET_RELOCATE_PREFIX &quot;${TARGET_RELOCATE_PREFIX}&quot;<br>
=C2=A0#endif /* ! GCC_DEFAULTS_H */<br>
=C2=A0_EOF<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mv ${B}/gcc/defaults.h.new ${B}/gcc/defaults.h<=
br>
diff --git a/meta/recipes-devtools/gcc/gcc-multilib-config.inc b/meta/recip=
es-devtools/gcc/gcc-multilib-config.inc<br>
index 2dbbc23c94..997bb6029b 100644<br>
--- a/meta/recipes-devtools/gcc/gcc-multilib-config.inc<br>
+++ b/meta/recipes-devtools/gcc/gcc-multilib-config.inc<br>
@@ -172,6 +172,17 @@ python gcc_multilib_setup() {<br>
=C2=A0 =C2=A0 =C2=A0target_arch =3D (d.getVar(&#39;TARGET_ARCH_MULTILIB_ORI=
GINAL&#39;) if mlprefix<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0else d.getVar(&#39;TARGET_ARCH&#39;))<br>
=C2=A0 =C2=A0 =C2=A0if pn =3D=3D &quot;nativesdk-gcc&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sdk_arch =3D d.getVar(&#39;SDK_ARCH&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if sdk_arch in [&#39;x86_64&#39;, &#39;i686&#3=
9;, &#39;i586&#39;]:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libdir32 =3D &#39;%r/lib&#39;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if sdk_arch =3D=3D &#39;x86_64&#=
39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libdir64 =3D &#39;=
%r/&#39; + d.getVar(&#39;baselib&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 osdirnames =3D [&#=
39;../&#39;+d.getVar(&#39;baselib&#39;) ,&#39;../lib&#39;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libdir64 =3D &#39;=
%r/lib64&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 osdirnames =3D [&#=
39;../lib64&#39;, &#39;../lib&#39;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_config_files =3D gcc_targ=
et_config_files[d.getVar(&quot;SDK_ARCH&quot;)]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 write_config(builddir, target_co=
nfig_files, [&#39;m64&#39;, &#39;m32&#39;], [&#39;64&#39;, &#39;32&#39;], o=
sdirnames)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0header_config_files =3D gcc_header_config=
_files[d.getVar(&quot;SDK_ARCH&quot;)]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_headers(builddir, header_config_fil=
es, libdir32, libdir64, libdirx32, libdirn32)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
diff --git a/meta/recipes-devtools/gcc/gcc/0016-handle-sysroot-support-for-=
nativesdk-gcc.patch b/meta/recipes-devtools/gcc/gcc/0016-handle-sysroot-sup=
port-for-nativesdk-gcc.patch<br>
index edd100ee46..7d96a42027 100644<br>
--- a/meta/recipes-devtools/gcc/gcc/0016-handle-sysroot-support-for-natives=
dk-gcc.patch<br>
+++ b/meta/recipes-devtools/gcc/gcc/0016-handle-sysroot-support-for-natives=
dk-gcc.patch<br>
@@ -389,7 +389,7 @@ index e3e9374d1cc..b080609341b 100644<br>
=C2=A0 #endif<br>
=C2=A0 static const char *target_system_root =3D DEFAULT_TARGET_SYSTEM_ROOT=
;<br>
<br>
-+static char target_relocatable_prefix[4096] __attribute__ ((section (&quo=
t;.gccrelocprefix&quot;))) =3D SYSTEMLIBS_DIR;<br>
++static char target_relocatable_prefix[4096] __attribute__ ((section (&quo=
t;.gccrelocprefix&quot;))) =3D TARGET_RELOCATE_PREFIX;<br>
=C2=A0+<br>
=C2=A0 /* Nonzero means pass the updated target_system_root to the compiler=
.=C2=A0 */<br>
<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#210174): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/210174" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/210174</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/110767332/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/110767332/4316185</a><br>
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
t face=3D"Raleway, regular">Smile ECS - Tech expert<br></font></div></div><=
/div></div>

--000000000000f7b054062c618e43--

