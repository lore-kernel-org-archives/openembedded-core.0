Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AC72C282D1
	for <webhook@archiver.kernel.org>; Thu,  6 Mar 2025 23:24:57 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web11.2213.1741303493036412268
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Mar 2025 15:24:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h63AczOQ;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3f422d6e3b0so367517b6e.1
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Mar 2025 15:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741303492; x=1741908292; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ux8VBTVas/EXUJlYWMlF8RTDYusWt4sqjyGIm58k4nk=;
        b=h63AczOQIe0irb2S2Xy8qjIerb33lcjc5wJHbqR23kY/6pBN1UqPCozWC18U3TdTGi
         XdZ5yTg1RpLY8gQrAStE4za3ABECWrr2p9bflgKepbOCQhcPFr6rCIlWvRr+3F5S92IW
         GCKApytdwN4b8eyCkVCOXay19+LqpkZIE6W+rvu/xyhKogOUnCBIf3MjJRSd67RRTWMR
         CtmhjwqGvQf4P8CRH07WHW7DUmhzRftrPEFmNLauWc8zfQrcUFTaKSabutiLCFrEEVvL
         /IGowI8yQhG3X2XemWVTqk2e/S4EhH8udxId6ru9SIDZS8EEoZTVltfb/3OrBTiR12IG
         cSBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741303492; x=1741908292;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ux8VBTVas/EXUJlYWMlF8RTDYusWt4sqjyGIm58k4nk=;
        b=p7JPBfdnT2Q7rn5upJAY1cqzLWOfmewO3hBNHtMWGbD229d+RFwAsolHToJOynynxT
         ++sBi5SQ41iuX09ikwhFX+GOz339UnDu2seoC+MfHkJE8xDP+ponIAZ2mMpS2M5cC3ND
         jB+kvRcVCT/4SBD1MOAdIdTOCSikqXhad+h0LNuncWKx3OSax4cYClJQwo8iOSBIFAOw
         9qcbZ+7GiE7OODu8yhjKwwpfINWu1/D5H1Uvvoq0DwoBTj7bs5/O1PoMZrd6/BaxEX9w
         1KRRjOu64yIjymsMvy3Rt1OfcnUlIU5cDnDbI0vHQ9rpYZfjU2ARIUKIbJJhFbYc1uAG
         zBlw==
X-Gm-Message-State: AOJu0YytwcGXdkuu18YHy/TK9t8zRzSyr6dL5+Sqf0zu6mtzRQ4uv6kT
	FnwpEPKUG4NCQsh4euQ89RdeiRvhKSsQQF6axbQsqvRBk8KHvhuFJ8Za9hzmbXPUWipJXaUOW2u
	5wOO1LvHVwzzJyRoLx/uc3/UxlIg=
X-Gm-Gg: ASbGncvu2EOZNOo+8yGlHtXiK4kTylQysdhVSkP78mMkvNMIVPYdZz5k9WR7eUAibsh
	J5YfQzf8amQ7qSwpsrAogrT1TJbla1D63IlHjUz3VtfDXKferBDH2HiwmfNwGGewkvCztoUnZGs
	Px6shMi9UL2YpDAHRN1VM6adb8ODvkOq06mkQWlZksH1Ssjmw5GOSohDv02w5h
X-Google-Smtp-Source: AGHT+IFGLm4MWppis5boYdVG+rgWVi8MUlhMUVw1I55MacHbvLt4dC75x+6Cl0jhM7A0Zthf7jdM4QdFGH5/TSfwl28=
X-Received: by 2002:a05:6808:211e:b0:3f6:6cbc:9326 with SMTP id
 5614622812f47-3f697bf2c0cmr759740b6e.29.1741303492248; Thu, 06 Mar 2025
 15:24:52 -0800 (PST)
MIME-Version: 1.0
References: <20250306185551.1758417-1-Randy.MacLeod@windriver.com>
In-Reply-To: <20250306185551.1758417-1-Randy.MacLeod@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 6 Mar 2025 18:24:39 -0500
X-Gm-Features: AQ5f1Jpaimeudd_rt_D15OR2iNwsAoNqJ2ZK5lEkfm-eYof1Cfjayg7K-rgeoPM
Message-ID: <CAMKF1sp=ovCd8xsQ=LLcYpENio=rP7sgecnUBrhjYKc3gRqYCg@mail.gmail.com>
Subject: Re: [PATCH 1/2] tcmode-default: eliminate needless gdb, qemu defaults
To: Randy.MacLeod@windriver.com
Cc: openembedded-core@lists.openembedded.org, bruce.ashfield@gmail.com
Content-Type: multipart/alternative; boundary="0000000000001a1431062fb4d03d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Mar 2025 23:24:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212406

--0000000000001a1431062fb4d03d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Are we sure that we don=E2=80=99t have external toolchains feeding gdb thes=
e days

On Thu, Mar 6, 2025 at 1:55=E2=80=AFPM <Randy.MacLeod@windriver.com> wrote:

> From: Randy MacLeod <Randy.MacLeod@windriver.com>
>
> Manually setting preferred version/provider is not required so remove
> that for gdb and qemu as a first step of cleaning up this file.
>
> This PREFERRED_VERSION list dates back to 2006, which is an era where
> several versions of a given recipe was a common occurence.
>
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>  meta/conf/distro/include/tcmode-default.inc | 11 -----------
>  1 file changed, 11 deletions(-)
>
> diff --git a/meta/conf/distro/include/tcmode-default.inc
> b/meta/conf/distro/include/tcmode-default.inc
> index 079a7ca3ea..ce0c8235e4 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -6,18 +6,14 @@ PREFERRED_PROVIDER_virtual/cross-binutils =3D
> "${MLPREFIX}binutils-cross-${TARGET_
>  PREFERRED_PROVIDER_virtual/cross-binutils:class-nativesdk ?=3D
> "binutils-crosssdk-${SDK_SYS}"
>  PREFERRED_PROVIDER_virtual/nativesdk-cross-binutils ?=3D
> "binutils-crosssdk-${SDK_SYS}"
>
> -PREFERRED_PROVIDER_gdb =3D "gdb"
> -
>  # Default libc config
>  PREFERRED_PROVIDER_virtual/gettext ??=3D "gettext"
>
>  GCCVERSION ?=3D "14.%"
>  SDKGCCVERSION ?=3D "${GCCVERSION}"
>  BINUVERSION ?=3D "2.44%"
> -GDBVERSION ?=3D "16.%"
>  GLIBCVERSION ?=3D "2.41%"
>  LINUXLIBCVERSION ?=3D "6.12%"
> -QEMUVERSION ?=3D "9.2%"
>  GOVERSION ?=3D "1.24%"
>  RUSTVERSION ?=3D "1.83%"
>
> @@ -40,9 +36,6 @@ PREFERRED_VERSION_binutils-native ?=3D "${BINUVERSION}"
>  PREFERRED_VERSION_binutils-cross-${TARGET_ARCH} ?=3D "${BINUVERSION}"
>  PREFERRED_VERSION_binutils-crosssdk-${SDK_SYS} ?=3D "${BINUVERSION}"
>  PREFERRED_VERSION_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} ?=3D
> "${BINUVERSION}"
> -PREFERRED_VERSION_gdb ?=3D "${GDBVERSION}"
> -PREFERRED_VERSION_gdb-cross-${TARGET_ARCH} ?=3D "${GDBVERSION}"
> -PREFERRED_VERSION_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} ?=3D
> "${GDBVERSION}"
>
>  PREFERRED_VERSION_linux-libc-headers ?=3D "${LINUXLIBCVERSION}"
>  PREFERRED_VERSION_nativesdk-linux-libc-headers ?=3D "${LINUXLIBCVERSION}=
"
> @@ -53,10 +46,6 @@ PREFERRED_VERSION_glibc-scripts            ?=3D
> "${GLIBCVERSION}"
>  PREFERRED_VERSION_nativesdk-glibc          ?=3D "${GLIBCVERSION}"
>  PREFERRED_VERSION_cross-localedef-native   ?=3D "${GLIBCVERSION}"
>
> -PREFERRED_VERSION_qemu ?=3D "${QEMUVERSION}"
> -PREFERRED_VERSION_qemu-native ?=3D "${QEMUVERSION}"
> -PREFERRED_VERSION_nativesdk-qemu ?=3D "${QEMUVERSION}"
> -
>  # Bootstrap Go using a binary release from golang.org.  If you want to
> bootstrap
>  # from source using the C-implemented Go 1.4 (only supports x86-64 hosts=
)
> then use
>  # go-native.
> --
> 2.34.1
>
>

--0000000000001a1431062fb4d03d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Are we sure that we don=E2=80=99t have external toolchain=
s feeding gdb these days=C2=A0</div><div><br><div class=3D"gmail_quote gmai=
l_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 6, 202=
5 at 1:55=E2=80=AFPM &lt;<a href=3D"mailto:Randy.MacLeod@windriver.com">Ran=
dy.MacLeod@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left=
-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)">From: Ran=
dy MacLeod &lt;<a href=3D"mailto:Randy.MacLeod@windriver.com" target=3D"_bl=
ank">Randy.MacLeod@windriver.com</a>&gt;<br>
<br>
Manually setting preferred version/provider is not required so remove<br>
that for gdb and qemu as a first step of cleaning up this file.<br>
<br>
This PREFERRED_VERSION list dates back to 2006, which is an era where<br>
several versions of a given recipe was a common occurence.<br>
<br>
Signed-off-by: Randy MacLeod &lt;<a href=3D"mailto:Randy.MacLeod@windriver.=
com" target=3D"_blank">Randy.MacLeod@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/distro/include/tcmode-default.inc | 11 -----------<br>
=C2=A01 file changed, 11 deletions(-)<br>
<br>
diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro=
/include/tcmode-default.inc<br>
index 079a7ca3ea..ce0c8235e4 100644<br>
--- a/meta/conf/distro/include/tcmode-default.inc<br>
+++ b/meta/conf/distro/include/tcmode-default.inc<br>
@@ -6,18 +6,14 @@ PREFERRED_PROVIDER_virtual/cross-binutils =3D &quot;${MLP=
REFIX}binutils-cross-${TARGET_<br>
=C2=A0PREFERRED_PROVIDER_virtual/cross-binutils:class-nativesdk ?=3D &quot;=
binutils-crosssdk-${SDK_SYS}&quot;<br>
=C2=A0PREFERRED_PROVIDER_virtual/nativesdk-cross-binutils ?=3D &quot;binuti=
ls-crosssdk-${SDK_SYS}&quot;<br>
<br>
-PREFERRED_PROVIDER_gdb =3D &quot;gdb&quot;<br>
-<br>
=C2=A0# Default libc config<br>
=C2=A0PREFERRED_PROVIDER_virtual/gettext ??=3D &quot;gettext&quot;<br>
<br>
=C2=A0GCCVERSION ?=3D &quot;14.%&quot;<br>
=C2=A0SDKGCCVERSION ?=3D &quot;${GCCVERSION}&quot;<br>
=C2=A0BINUVERSION ?=3D &quot;2.44%&quot;<br>
-GDBVERSION ?=3D &quot;16.%&quot;<br>
=C2=A0GLIBCVERSION ?=3D &quot;2.41%&quot;<br>
=C2=A0LINUXLIBCVERSION ?=3D &quot;6.12%&quot;<br>
-QEMUVERSION ?=3D &quot;9.2%&quot;<br>
=C2=A0GOVERSION ?=3D &quot;1.24%&quot;<br>
=C2=A0RUSTVERSION ?=3D &quot;1.83%&quot;<br>
<br>
@@ -40,9 +36,6 @@ PREFERRED_VERSION_binutils-native ?=3D &quot;${BINUVERSIO=
N}&quot;<br>
=C2=A0PREFERRED_VERSION_binutils-cross-${TARGET_ARCH} ?=3D &quot;${BINUVERS=
ION}&quot;<br>
=C2=A0PREFERRED_VERSION_binutils-crosssdk-${SDK_SYS} ?=3D &quot;${BINUVERSI=
ON}&quot;<br>
=C2=A0PREFERRED_VERSION_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} ?=
=3D &quot;${BINUVERSION}&quot;<br>
-PREFERRED_VERSION_gdb ?=3D &quot;${GDBVERSION}&quot;<br>
-PREFERRED_VERSION_gdb-cross-${TARGET_ARCH} ?=3D &quot;${GDBVERSION}&quot;<=
br>
-PREFERRED_VERSION_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} ?=3D &quot;=
${GDBVERSION}&quot;<br>
<br>
=C2=A0PREFERRED_VERSION_linux-libc-headers ?=3D &quot;${LINUXLIBCVERSION}&q=
uot;<br>
=C2=A0PREFERRED_VERSION_nativesdk-linux-libc-headers ?=3D &quot;${LINUXLIBC=
VERSION}&quot;<br>
@@ -53,10 +46,6 @@ PREFERRED_VERSION_glibc-scripts=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ?=3D &quot;${GLIBCVERSION}&quot;<br>
=C2=A0PREFERRED_VERSION_nativesdk-glibc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ?=
=3D &quot;${GLIBCVERSION}&quot;<br>
=C2=A0PREFERRED_VERSION_cross-localedef-native=C2=A0 =C2=A0?=3D &quot;${GLI=
BCVERSION}&quot;<br>
<br>
-PREFERRED_VERSION_qemu ?=3D &quot;${QEMUVERSION}&quot;<br>
-PREFERRED_VERSION_qemu-native ?=3D &quot;${QEMUVERSION}&quot;<br>
-PREFERRED_VERSION_nativesdk-qemu ?=3D &quot;${QEMUVERSION}&quot;<br>
-<br>
=C2=A0# Bootstrap Go using a binary release from <a href=3D"http://golang.o=
rg" rel=3D"noreferrer" target=3D"_blank">golang.org</a>.=C2=A0 If you want =
to bootstrap<br>
=C2=A0# from source using the C-implemented Go 1.4 (only supports x86-64 ho=
sts) then use<br>
=C2=A0# go-native.<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div></div>

--0000000000001a1431062fb4d03d--

