Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 196E6CFD2F6
	for <webhook@archiver.kernel.org>; Thu, 27 Nov 2025 18:22:34 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1088.1764267745084794835
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Nov 2025 10:22:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=WUq1BUyD;
 spf=pass (domain: snapchat.com, ip: 209.85.218.46, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b739ef3f739so224652366b.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 10:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1764267743; x=1764872543; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1nSFhYWRxYa0hPE0YCLqW/+4W306Luw9NVnEaVjM2ZI=;
        b=WUq1BUyDolkFiqOVi8yni7kaYPTvHYPGuodkennj3MlTjLVrcFFvMS0GaXtrlHjCDd
         q9VRc1wbnh/4dKRuGhnbhYRPwkFYIHy/7ZQPO05Bh9/Fz0yvJlStejo57ssqO+i43VMy
         Cv1/r/51mOjmJvn3UiZ66AqySQ5wvLZ6NPgnY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764267743; x=1764872543;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1nSFhYWRxYa0hPE0YCLqW/+4W306Luw9NVnEaVjM2ZI=;
        b=J6ujFuw3plZ2ECXUzi+FduYjaR0pK59vq1xPfboiMWzBrMsHMDYe6mDY3SJX58ToMm
         UeEAzUICa3B8HUTPe4rZvVbLqkHEv5MNk02wl83Lv4wLOxyL8OyCroPjav3xlYT5alPb
         KfUdk17Nk+Dc6BkVaVkCWqNA8wu9taniO4Knm2vkhzGN1+319pcSuwK2126XxsMSV1Ut
         xOyc3Pn03/MjLHazRRkmOiF+WeewoJ37YppeWpE13gBoGzetcTYghcodmeID4I482fro
         ztq8KRjNBo35fvFYNbI+U0gUkekaPjeRwFPhKIPHld9+jLVPw+Q4FgNrKfTKnxH1nPoj
         rTlw==
X-Gm-Message-State: AOJu0YwNQUF6fALO3mRyUxOs3m/nxd1yCfkDDOodTh7rcBZOFz381Iee
	F98er87m6/wC0JG3m68Jdf2OtClXVU5vDoA8x1KvNVsXXyZok5NlRBmFy8NNAP2c7cai7AjQV8W
	BKc43zhDxO071AvjLxilNydG5NCyjJ8eCTga2tzwliQ==
X-Gm-Gg: ASbGncubFxZo1pEtfbBPN9oae6KiXyEPJ9Z+/TwX6L9h5u/V7BL7+JSNDHPFJAd3LpX
	Yj8ftmVlr9uX9xImkLW9jI1f3gDER4gaP2jZJOSicvM2xjSLcUmAEjRfrhhH9jVuYmOfwDV2U3M
	UlTUMT0oxSRRJ4/YOaFDOeY/2j5c4qz59E6uFvB2QR2F0LH1s2ws5foVuTS1yXMwrlmm2rxzWkW
	qvK9hSaBcFrwb9lyiyqPYClwPiy71sCnvMDw21SluSJ4vgvOo8JWk0bc9VtSPjBC8et/W/sW9tX
	kVB/zXkqUmoMAHo/YUwHHoDiOAxV
X-Google-Smtp-Source: AGHT+IFKRDvDzhKykVlmDSc9AxcU40gnZXmvfGcyORs5gHJOxQysaoeBK8o1JilcMHqObsFy79QukcE2APZAqOyhwCk=
X-Received: by 2002:a17:907:6d1c:b0:b73:5936:77fc with SMTP id
 a640c23a62f3a-b76c54b85b0mr1251694666b.13.1764267743269; Thu, 27 Nov 2025
 10:22:23 -0800 (PST)
MIME-Version: 1.0
References: <20251127174140.906490-1-skandigraun@gmail.com>
In-Reply-To: <20251127174140.906490-1-skandigraun@gmail.com>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Thu, 27 Nov 2025 19:22:11 +0100
X-Gm-Features: AWmQ_blZo2l-KI5NuER1s_nytQim1ZLtFhFM0Db3uP1p-vrlXv8_MImgVH-gJjs
Message-ID: <CAHUKmYaChMBkis0gG8voSntJeC+xPM0+5D2Bk=de2_QdwOXmDw@mail.gmail.com>
Subject: Re: [PATCH] opkg: enable ACL only when present in DISTRO_FEATURES
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000020753b064497983b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 18:22:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226865

--00000000000020753b064497983b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Gyorgy,
I have sent a patch to opkg upstream to fix this issue (
https://lists.yoctoproject.org/g/opkg/message/175 ).
I think it would be better to either:
- add my opkg patch to oe-core and not merge yours
- or to keep your patch and not add mine, but at least add those lines as
os-core patch:

--- a/libopkg/opkg_archive.c
+++ b/libopkg/opkg_archive.c
@@ -914,11 +914,11 @@ struct opkg_ar *ar_open_pkg_data_archive(const char
*filename)
     ar->extract_flags =3D ARCHIVE_EXTRACT_OWNER | ARCHIVE_EXTRACT_PERM |
         ARCHIVE_EXTRACT_TIME | ARCHIVE_EXTRACT_UNLINK |
ARCHIVE_EXTRACT_NO_OVERWRITE;

-#ifdef USE_ACL
+#if USE_ACL
     ar->extract_flags |=3D ARCHIVE_EXTRACT_ACL;
 #endif

What do you think?

=C3=89tienne

On Thu, Nov 27, 2025 at 6:41=E2=80=AFPM Gyorgy Sarvari <skandigraun@gmail.c=
om>
wrote:

> During the last opkg update the application's ACL feature was
> enabled by default, which requires acl recipe as a dependency,
> however it wasn't enabled in the recipe, making compilation
> fail when libacl wasn't in the sysroot.
>
> This change adds a PACKAGECONFIG that makes acl an optional
> dependency, and it is only enabled automatically if "acl"
> is present in DISTRO_FEATURES.
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  meta/recipes-devtools/opkg/opkg_0.9.0.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/opkg/opkg_0.9.0.bb
> b/meta/recipes-devtools/opkg/opkg_0.9.0.bb
> index ed2f36d636..0b3bb3d24c 100644
> --- a/meta/recipes-devtools/opkg/opkg_0.9.0.bb
> +++ b/meta/recipes-devtools/opkg/opkg_0.9.0.bb
> @@ -31,7 +31,7 @@ inherit cmake pkgconfig ptest
>  target_localstatedir :=3D "${localstatedir}"
>  OPKGLIBDIR ??=3D "${target_localstatedir}/lib"
>
> -PACKAGECONFIG ??=3D "libsolv"
> +PACKAGECONFIG ??=3D "libsolv ${@bb.utils.filter('DISTRO_FEATURES', 'acl'=
,
> d)}"
>
>  PACKAGECONFIG[gpg] =3D "-DWITH_GPGME=3DON,-DWITH_GPGME=3DOFF,\
>      gnupg gpgme libgpg-error,\
> @@ -41,6 +41,7 @@ PACKAGECONFIG[curl] =3D
> "-DWITH_CURL=3DON,-DWITH_CURL=3DOFF,curl"
>  PACKAGECONFIG[ssl-curl] =3D "-DWITH_SSLCURL=3DON,-DWITH_SSLCURL=3DOFF,cu=
rl
> openssl"
>  PACKAGECONFIG[sha256] =3D "-DWITH_SHA256=3DON,-DWITH_SHA256=3DOFF"
>  PACKAGECONFIG[libsolv] =3D
> "-DUSE_SOLVER_LIBSOLV=3DON,-DUSE_SOLVER_LIBSOLV=3DOFF,libsolv"
> +PACKAGECONFIG[acl] =3D "-DUSE_ACL=3DON, -DUSE_ACL=3DOFF, acl"
>
>  EXTRA_OECMAKE =3D "-DWITH_ZSTD=3DON"
>  EXTRA_OECMAKE:append:class-native =3D "
> -DVARDIR=3D/${@os.path.relpath('${localstatedir}', '${STAGING_DIR_NATIVE}=
')}
> -DSYSCONFDIR=3D/${@os.path.relpath('${sysconfdir}', '${STAGING_DIR_NATIVE=
}')}"
>

--00000000000020753b064497983b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Gyorgy,<br>I have sent a patch to opkg upstream to fix =
this=C2=A0issue (=C2=A0<a href=3D"https://lists.yoctoproject.org/g/opkg/mes=
sage/175" target=3D"_blank">https://lists.yoctoproject.org/g/opkg/message/1=
75</a> ).<br>I think it would be better to either:<br>- add my opkg patch t=
o oe-core and not merge yours<br>- or to keep your patch and not add mine, =
but at least add those lines as os-core patch:=C2=A0<br><br>--- a/libopkg/o=
pkg_archive.c<br>+++ b/libopkg/opkg_archive.c<br>@@ -914,11 +914,11 @@ stru=
ct opkg_ar *ar_open_pkg_data_archive(const char *filename)<br>=C2=A0 =C2=A0=
 =C2=A0ar-&gt;extract_flags =3D ARCHIVE_EXTRACT_OWNER | ARCHIVE_EXTRACT_PER=
M |<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ARCHIVE_EXTRACT_TIME | ARCHIVE_EXT=
RACT_UNLINK | ARCHIVE_EXTRACT_NO_OVERWRITE;<br>=C2=A0<br>-#ifdef USE_ACL<br=
>+#if USE_ACL<br>=C2=A0 =C2=A0 =C2=A0ar-&gt;extract_flags |=3D ARCHIVE_EXTR=
ACT_ACL;<br>=C2=A0#endif<br><br>What do you think?<br><br>=C3=89tienne</div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Th=
u, Nov 27, 2025 at 6:41=E2=80=AFPM Gyorgy Sarvari &lt;<a href=3D"mailto:ska=
ndigraun@gmail.com" target=3D"_blank">skandigraun@gmail.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">During the last =
opkg update the application&#39;s ACL feature was<br>
enabled by default, which requires acl recipe as a dependency,<br>
however it wasn&#39;t enabled in the recipe, making compilation<br>
fail when libacl wasn&#39;t in the sysroot.<br>
<br>
This change adds a PACKAGECONFIG that makes acl an optional<br>
dependency, and it is only enabled automatically if &quot;acl&quot;<br>
is present in DISTRO_FEATURES.<br>
<br>
Signed-off-by: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com" =
target=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.9.0.bb" rel=3D"no=
referrer" target=3D"_blank">opkg_0.9.0.bb</a> | 3 ++-<br>
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.9.0.bb" re=
l=3D"noreferrer" target=3D"_blank">opkg_0.9.0.bb</a> b/meta/recipes-devtool=
s/opkg/<a href=3D"http://opkg_0.9.0.bb" rel=3D"noreferrer" target=3D"_blank=
">opkg_0.9.0.bb</a><br>
index ed2f36d636..0b3bb3d24c 100644<br>
--- a/meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.9.0.bb" rel=3D"no=
referrer" target=3D"_blank">opkg_0.9.0.bb</a><br>
+++ b/meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.9.0.bb" rel=3D"no=
referrer" target=3D"_blank">opkg_0.9.0.bb</a><br>
@@ -31,7 +31,7 @@ inherit cmake pkgconfig ptest<br>
=C2=A0target_localstatedir :=3D &quot;${localstatedir}&quot;<br>
=C2=A0OPKGLIBDIR ??=3D &quot;${target_localstatedir}/lib&quot;<br>
<br>
-PACKAGECONFIG ??=3D &quot;libsolv&quot;<br>
+PACKAGECONFIG ??=3D &quot;libsolv ${@bb.utils.filter(&#39;DISTRO_FEATURES&=
#39;, &#39;acl&#39;, d)}&quot;<br>
<br>
=C2=A0PACKAGECONFIG[gpg] =3D &quot;-DWITH_GPGME=3DON,-DWITH_GPGME=3DOFF,\<b=
r>
=C2=A0 =C2=A0 =C2=A0gnupg gpgme libgpg-error,\<br>
@@ -41,6 +41,7 @@ PACKAGECONFIG[curl] =3D &quot;-DWITH_CURL=3DON,-DWITH_CUR=
L=3DOFF,curl&quot;<br>
=C2=A0PACKAGECONFIG[ssl-curl] =3D &quot;-DWITH_SSLCURL=3DON,-DWITH_SSLCURL=
=3DOFF,curl openssl&quot;<br>
=C2=A0PACKAGECONFIG[sha256] =3D &quot;-DWITH_SHA256=3DON,-DWITH_SHA256=3DOF=
F&quot;<br>
=C2=A0PACKAGECONFIG[libsolv] =3D &quot;-DUSE_SOLVER_LIBSOLV=3DON,-DUSE_SOLV=
ER_LIBSOLV=3DOFF,libsolv&quot;<br>
+PACKAGECONFIG[acl] =3D &quot;-DUSE_ACL=3DON, -DUSE_ACL=3DOFF, acl&quot;<br=
>
<br>
=C2=A0EXTRA_OECMAKE =3D &quot;-DWITH_ZSTD=3DON&quot;<br>
=C2=A0EXTRA_OECMAKE:append:class-native =3D &quot; -DVARDIR=3D/${@os.path.r=
elpath(&#39;${localstatedir}&#39;, &#39;${STAGING_DIR_NATIVE}&#39;)} -DSYSC=
ONFDIR=3D/${@os.path.relpath(&#39;${sysconfdir}&#39;, &#39;${STAGING_DIR_NA=
TIVE}&#39;)}&quot;<br>
</blockquote></div>

--00000000000020753b064497983b--

