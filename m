Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web09.12839.1614267010827431882
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Feb 2021 07:30:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IzxTyG9L;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: kergoth@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id c6so7456959ede.0
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Feb 2021 07:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AIq1ImVINe//2Yq/4NhOk5HwQYgQEZfhInoUupjAUAo=;
        b=IzxTyG9LVy+/gsC+OnEqy+k9aygcTn7KfkdQw1v1TE6W3Ii4HDEgd/gMCJYiY1u4UW
         Sof4jdx+b8TwFSdlenEgtk8R7zaEx9X86fB+YBq1gONJVXrVz//Q8/22Vjzz9Xoie3vB
         PNOW4eeoq/ln4qLCQfbOIHySs0S665SMd/vhB6KNDDjlOlm7Ve5netMvwImxHDiPOCL3
         rxe6q32xtKSY5DFxXZBnv63cwQHVjXSAxywGGITghy9lQgfxmwV92+/LgzdK96MD+Qxp
         X+gv9NAaFHPhqyrCTA7IDuHCDHD3bKAm3sEKOdasLLyi3BVzxFlCRuwAvPUgB+wvOWhT
         n7BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AIq1ImVINe//2Yq/4NhOk5HwQYgQEZfhInoUupjAUAo=;
        b=ktubLbU4jyBX4gV0r35ziY99k0bGdUtDvzkPLYxA6V/WFUhmatijBSJ7wGUhoHPRPn
         FiKu5RwmGG7hNbwQ5dQW3E1bYJlKhsTunqdP3kehHfzrjhCD3DuiF+8TBDnpf9Se+t7L
         hPgn8vbWs/69mfuxyFPuG/dlDCCr/pbX0K7nqb8HVltNa62gs44ytAeZr3W1Gm+mTW2Z
         55k7DBfo3iSOY2ugAN4DY1KCF2IzWTrj9TvOb9cH9+KFhA+4v0a2AziDHskQnQcNHoQR
         f7J9k4SwumZXNiA8k4X8DYtDHeA+/dXaTZMfqfnFeDtOKQCsc8fJ15oxeZlOcEdXm0Xs
         NUjg==
X-Gm-Message-State: AOAM532LbpY6lKkPuS8p4IT+nkQIiYOOHOc/2PnyizAEYVzCrczinNcP
	svLrXprK9ZY4+YBpJGJWo9VJAqkU6K6zXAr4Ixw=
X-Google-Smtp-Source: ABdhPJxUeP/9tpJYhLIqppoWF3fPvgriw8WmivJ5YBw/dzYZKSCQlMAMtQ+k/4jV1pIugw0DTtcmQL+nUr8luRVewj4=
X-Received: by 2002:a05:6402:b31:: with SMTP id bo17mr2216893edb.113.1614267009293;
 Thu, 25 Feb 2021 07:30:09 -0800 (PST)
MIME-Version: 1.0
References: <20210225055914.34860-1-kai.kang@windriver.com>
In-Reply-To: <20210225055914.34860-1-kai.kang@windriver.com>
From: "Christopher Larson" <kergoth@gmail.com>
Date: Thu, 25 Feb 2021 08:29:58 -0700
Message-ID: <CABcZANm-+8uOoAskLz7GM4DDGrYM4c2O4NZyAz2WuHhdiH7jMg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] toolchain-scripts.bbclass: customize prompt string for SDKs
To: kai <kai.kang@windriver.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a9620b05bc2ad3c7"

--000000000000a9620b05bc2ad3c7
Content-Type: text/plain; charset="UTF-8"

Are we sure we want to completely override it rather than adding to it? I'd
be rather irritated if this blows away my prompt without my asking for it.
I think either it should append or have a variable controlling whether this
is enabled when building the SDK.

On Wed, Feb 24, 2021 at 10:59 PM kai <kai.kang@windriver.com> wrote:

> From: Kai Kang <kai.kang@windriver.com>
>
> Introduce a new variable SDK_PS1 to customize prompt string for SDKs
> when source script environment-setup-script.
>
> The default prompt string of SDKs looks like:
>
> SDK-poky-glibc-x86_64--cortexa57-qemuarm64$
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
> v2: not set PS1 for buildtools-tarball
>
>  meta/classes/toolchain-scripts.bbclass | 1 +
>  meta/conf/bitbake.conf                 | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/meta/classes/toolchain-scripts.bbclass
> b/meta/classes/toolchain-scripts.bbclass
> index db1d3215ef..88df373d0b 100644
> --- a/meta/classes/toolchain-scripts.bbclass
> +++ b/meta/classes/toolchain-scripts.bbclass
> @@ -45,6 +45,7 @@ toolchain_create_sdk_env_script () {
>
> EXTRAPATH="$EXTRAPATH:$sdkpathnative$bindir/${TARGET_ARCH}${TARGET_VENDOR}-$i"
>         done
>         echo "export
> PATH=$sdkpathnative$bindir:$sdkpathnative$sbindir:$sdkpathnative$base_bindir:$sdkpathnative$base_sbindir:$sdkpathnative$bindir/../${HOST_SYS}/bin:$sdkpathnative$bindir/${TARGET_SYS}"$EXTRAPATH':$PATH'
> >> $script
> +       echo 'export PS1="${SDK_PS1}"' >>$script
>         echo 'export PKG_CONFIG_SYSROOT_DIR=$SDKTARGETSYSROOT' >> $script
>         echo 'export
> PKG_CONFIG_PATH=$SDKTARGETSYSROOT'"$libdir"'/pkgconfig:$SDKTARGETSYSROOT'"$prefix"'/share/pkgconfig'
> >> $script
>         echo 'export
> CONFIG_SITE=${SDKPATH}/site-config-'"${multimach_target_sys}" >> $script
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 48af17fbf7..6075749a5e 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -422,6 +422,7 @@ PKGDATA_DIR = "${TMPDIR}/pkgdata/${MACHINE}"
>
>  SDK_NAME_PREFIX ?= "oecore"
>  SDK_NAME = "${SDK_NAME_PREFIX}-${SDK_ARCH}-${TUNE_PKGARCH}"
> +SDK_PS1 ?= "SDK-${SDK_NAME}:\\\\$ "
>  SDKPATH = "/usr/local/${SDK_NAME_PREFIX}-${SDK_ARCH}"
>  SDKPATHNATIVE = "${SDKPATH}/sysroots/${SDK_SYS}"
>
> --
> 2.17.1
>
>
> 
>
>

-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--000000000000a9620b05bc2ad3c7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Are we sure we want to completely override it rather than =
adding to it? I&#39;d be rather irritated if this blows away my prompt with=
out my asking for it. I think either it should append or have a variable co=
ntrolling whether this is enabled when building the SDK.</div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 24, 202=
1 at 10:59 PM kai &lt;<a href=3D"mailto:kai.kang@windriver.com">kai.kang@wi=
ndriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">From: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com" ta=
rget=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
<br>
Introduce a new variable SDK_PS1 to customize prompt string for SDKs<br>
when source script environment-setup-script.<br>
<br>
The default prompt string of SDKs looks like:<br>
<br>
SDK-poky-glibc-x86_64--cortexa57-qemuarm64$<br>
<br>
Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com" targ=
et=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
---<br>
v2: not set PS1 for buildtools-tarball<br>
<br>
=C2=A0meta/classes/toolchain-scripts.bbclass | 1 +<br>
=C2=A0meta/conf/bitbake.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 1 +<br>
=C2=A02 files changed, 2 insertions(+)<br>
<br>
diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolcha=
in-scripts.bbclass<br>
index db1d3215ef..88df373d0b 100644<br>
--- a/meta/classes/toolchain-scripts.bbclass<br>
+++ b/meta/classes/toolchain-scripts.bbclass<br>
@@ -45,6 +45,7 @@ toolchain_create_sdk_env_script () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 EXTRAPATH=3D&quot;=
$EXTRAPATH:$sdkpathnative$bindir/${TARGET_ARCH}${TARGET_VENDOR}-$i&quot;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;export PATH=3D$sdkpathnative$bindir=
:$sdkpathnative$sbindir:$sdkpathnative$base_bindir:$sdkpathnative$base_sbin=
dir:$sdkpathnative$bindir/../${HOST_SYS}/bin:$sdkpathnative$bindir/${TARGET=
_SYS}&quot;$EXTRAPATH&#39;:$PATH&#39; &gt;&gt; $script<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0echo &#39;export PS1=3D&quot;${SDK_PS1}&quot;&=
#39; &gt;&gt;$script<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &#39;export PKG_CONFIG_SYSROOT_DIR=3D$SDK=
TARGETSYSROOT&#39; &gt;&gt; $script<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &#39;export PKG_CONFIG_PATH=3D$SDKTARGETS=
YSROOT&#39;&quot;$libdir&quot;&#39;/pkgconfig:$SDKTARGETSYSROOT&#39;&quot;$=
prefix&quot;&#39;/share/pkgconfig&#39; &gt;&gt; $script<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &#39;export CONFIG_SITE=3D${SDKPATH}/site=
-config-&#39;&quot;${multimach_target_sys}&quot; &gt;&gt; $script<br>
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
index 48af17fbf7..6075749a5e 100644<br>
--- a/meta/conf/bitbake.conf<br>
+++ b/meta/conf/bitbake.conf<br>
@@ -422,6 +422,7 @@ PKGDATA_DIR =3D &quot;${TMPDIR}/pkgdata/${MACHINE}&quo=
t;<br>
<br>
=C2=A0SDK_NAME_PREFIX ?=3D &quot;oecore&quot;<br>
=C2=A0SDK_NAME =3D &quot;${SDK_NAME_PREFIX}-${SDK_ARCH}-${TUNE_PKGARCH}&qu=
ot;<br>
+SDK_PS1 ?=3D &quot;SDK-${SDK_NAME}:\\\\$ &quot;<br>
=C2=A0SDKPATH =3D &quot;/usr/local/${SDK_NAME_PREFIX}-${SDK_ARCH}&quot;<br=
>
=C2=A0SDKPATHNATIVE =3D &quot;${SDKPATH}/sysroots/${SDK_SYS}&quot;<br>
<br>
-- <br>
2.17.1<br>
<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">Christop=
her Larson<br>kergoth at gmail dot com<br>Founder - BitBake, OpenEmbedded, =
OpenZaurus<br>Senior Software Engineer, Mentor Graphics</div></div></div></=
div>

--000000000000a9620b05bc2ad3c7--
