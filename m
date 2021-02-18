Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
 by mx.groups.io with SMTP id smtpd.web11.9185.1613664119890369275
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Feb 2021 08:02:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PEu/qrT5;
 spf=pass (domain: gmail.com, ip: 209.85.222.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f44.google.com with SMTP id c44so821903uad.12
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Feb 2021 08:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4l+YP8N4ydi2SsjEgegP7VHxHGijHkEyDPw8CVipCI0=;
        b=PEu/qrT5MEfCMWQ3XvnOETcoG0pMqvlGjePEV5pD61v1C4M2DRfV36aN6P0sAzNiB1
         4ZV2hyjw0FuMVvionejx2jz4Y26zLAVUQ1LyXsQpS6ID4EHTS/YUfIaC9TvRec106dIL
         o83f6X0m2J5GCPgKsp6tmcCsVPHprAINV5cUKhko0PtM8t00D0wIGNtBIsN2pVQjm5lf
         rQ277GwGlyxwOQhZvHAEKYezXA/lzHFhn1fMsAmchFx+pVYBvHqeVkTS1CY25QydyLzy
         k/V0p936LpSS2XwrnJXhnlzYju4EyXrUj4DRjMZXPrcSDRGHTEWA9ogxCkcSn639zsE8
         b01w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4l+YP8N4ydi2SsjEgegP7VHxHGijHkEyDPw8CVipCI0=;
        b=kT9SSFtYDWlzVixO8Tf83IXzom2q8bpaEW7Aa8zutL7JD4ry0Jc53evWuGhB9RadC2
         4tmiaxhtSKPwiIdlHBrYbwqFXr3BoG2+fil5Vftdc4q+4cE/niF2GmQ9FpbBq87rMj8V
         BbdKdhLiV2xhwQE5Sq17ul1bpNp3hAi7LlLKzEodMB19ulN1lRoqno5PX8FFI62rAn6o
         OrVpJrKoxOsFgqQiAPTLwLi6GzoVf8I3KFOzrbe5B/ZwRDAqITfH+HRc+ePbiZfIxSQD
         DjBj0snrRecTxzJJZjtv40jtxf5VTR1SQwLgICCvjkWW7gxJPAOXNo7YBaNimOUhBtkt
         3TjA==
X-Gm-Message-State: AOAM5307Z///Ml0ha5nGMyLPXOvrMvNjt2DXNp3T6p4OogfUdFFl7UBu
	u5dD7EixSsbKFcHyUFGHk/37+mkb9h5PbU0HPpM=
X-Google-Smtp-Source: ABdhPJyCFwnWsvV8c/vgXIxi5OxcnmUlz/pST0XjK6/dTQSW2JDBV0/fbyCit5zsZmWQGWXfmQu27OLJP4EPtrrMZto=
X-Received: by 2002:a9f:2c0f:: with SMTP id r15mr3925462uaj.93.1613664119075;
 Thu, 18 Feb 2021 08:01:59 -0800 (PST)
MIME-Version: 1.0
References: <20210218001126.39215-1-jatedev@gmail.com>
In-Reply-To: <20210218001126.39215-1-jatedev@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 18 Feb 2021 17:01:47 +0100
Message-ID: <CANNYZj-5HPZ3yEQ3yvPMn1ynsfybHNNL6G7bnE8YOpk69B8N4Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] iputils: Use STAGING_DIR_NATIVE for setcap detection
To: Jate Sujjavanich <jatedev@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000009ab88e05bb9e7484"

--0000000000009ab88e05bb9e7484
Content-Type: text/plain; charset="UTF-8"

0001-Add-support-for-setcap-in-STAGING_DIR_NATIVE.patch seems missing?

Alex

On Thu, 18 Feb 2021 at 01:11, Jate Sujjavanich <jatedev@gmail.com> wrote:

> Search for setcap in STAGING_DIR_NATIVE to avoid host contamination. Add
> DEPENDS for libcap-native to supply this if we select libcap for
> PACKAGECONFIG.
>
> The previous setting of NO_SETCAP_OR_SUID broke setuid or setcap of
> /bin/ping
>
> Signed-off-by: Jate Sujjavanich <jatedev@gmail.com>
> ---
>  meta/recipes-extended/iputils/iputils_s20200821.bb | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-extended/iputils/iputils_s20200821.bb
> b/meta/recipes-extended/iputils/iputils_s20200821.bb
> index 8b63a23c61..feb97d5086 100644
> --- a/meta/recipes-extended/iputils/iputils_s20200821.bb
> +++ b/meta/recipes-extended/iputils/iputils_s20200821.bb
> @@ -12,6 +12,7 @@ DEPENDS = "gnutls"
>
>  SRC_URI = "git://github.com/iputils/iputils \
>             file://0001-rarpd-rdisc-Drop-PrivateUsers.patch \
> +           file://0001-Add-support-for-setcap-in-STAGING_DIR_NATIVE.patch
> \
>             "
>  SRCREV = "23c3782ae0c7f9c6ae59dbed8ad9204f8758542b"
>
> @@ -26,7 +27,7 @@ CVE_CHECK_WHITELIST += "CVE-2000-1213 CVE-2000-1214"
>  PACKAGECONFIG ??= "libcap rarpd \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6',
> 'ninfod traceroute6', '', d)} \
>                     ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
> -PACKAGECONFIG[libcap] = "-DUSE_CAP=true, -DUSE_CAP=false, libcap"
> +PACKAGECONFIG[libcap] = "-DUSE_CAP=true, -DUSE_CAP=false, libcap
> libcap-native"
>  PACKAGECONFIG[libidn] = "-DUSE_IDN=true, -DUSE_IDN=false, libidn2"
>  PACKAGECONFIG[gettext] = "-DUSE_GETTEXT=true, -DUSE_GETTEXT=false,
> gettext"
>  PACKAGECONFIG[ninfod] = "-DBUILD_NINFOD=true,-DBUILD_NINFOD=false,"
> @@ -38,7 +39,7 @@ PACKAGECONFIG[docs] = "-DBUILD_HTML_MANS=true
> -DBUILD_MANS=true,-DBUILD_HTML_MAN
>
>  inherit meson systemd update-alternatives
>
> -EXTRA_OEMESON += "--prefix=${root_prefix}/"
> +EXTRA_OEMESON += "--prefix=${root_prefix}/
> -Dstagingdirnative=${STAGING_DIR_NATIVE}"
>
>  ALTERNATIVE_PRIORITY = "100"
>
> --
> 2.25.1
>
>
> 
>
>

--0000000000009ab88e05bb9e7484
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>0001-Add-support-for-setcap-in-STAGING_DIR_NATIVE.pat=
ch seems missing?</div><div><br></div><div>Alex</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 18 Feb 2021=
 at 01:11, Jate Sujjavanich &lt;<a href=3D"mailto:jatedev@gmail.com">jatede=
v@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">Search for setcap in STAGING_DIR_NATIVE to avoid host contamina=
tion. Add<br>
DEPENDS for libcap-native to supply this if we select libcap for<br>
PACKAGECONFIG.<br>
<br>
The previous setting of NO_SETCAP_OR_SUID broke setuid or setcap of<br>
/bin/ping<br>
<br>
Signed-off-by: Jate Sujjavanich &lt;<a href=3D"mailto:jatedev@gmail.com" t=
arget=3D"_blank">jatedev@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-extended/iputils/<a href=3D"http://iputils_s20200821.bb=
" rel=3D"noreferrer" target=3D"_blank">iputils_s20200821.bb</a> | 5 +++--<b=
r>
=C2=A01 file changed, 3 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-extended/iputils/<a href=3D"http://iputils_s2020=
0821.bb" rel=3D"noreferrer" target=3D"_blank">iputils_s20200821.bb</a> b/me=
ta/recipes-extended/iputils/<a href=3D"http://iputils_s20200821.bb" rel=3D"=
noreferrer" target=3D"_blank">iputils_s20200821.bb</a><br>
index 8b63a23c61..feb97d5086 100644<br>
--- a/meta/recipes-extended/iputils/<a href=3D"http://iputils_s20200821.bb=
" rel=3D"noreferrer" target=3D"_blank">iputils_s20200821.bb</a><br>
+++ b/meta/recipes-extended/iputils/<a href=3D"http://iputils_s20200821.bb=
" rel=3D"noreferrer" target=3D"_blank">iputils_s20200821.bb</a><br>
@@ -12,6 +12,7 @@ DEPENDS =3D &quot;gnutls&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/iputils/iputils=
" rel=3D"noreferrer" target=3D"_blank">github.com/iputils/iputils</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-rarpd-rdisc-Drop-Pri=
vateUsers.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Add-support-for-setc=
ap-in-STAGING_DIR_NATIVE.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRCREV =3D &quot;23c3782ae0c7f9c6ae59dbed8ad9204f8758542b&quot;<br>
<br>
@@ -26,7 +27,7 @@ CVE_CHECK_WHITELIST +=3D &quot;CVE-2000-1213 CVE-2000-12=
14&quot;<br>
=C2=A0PACKAGECONFIG ??=3D &quot;libcap rarpd \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@b=
b.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;ipv6&#39;, &#39;ninfod tra=
ceroute6&#39;, &#39;&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@b=
b.utils.filter(&#39;DISTRO_FEATURES&#39;, &#39;systemd&#39;, d)}&quot;<br>
-PACKAGECONFIG[libcap] =3D &quot;-DUSE_CAP=3Dtrue, -DUSE_CAP=3Dfalse, libc=
ap&quot;<br>
+PACKAGECONFIG[libcap] =3D &quot;-DUSE_CAP=3Dtrue, -DUSE_CAP=3Dfalse, libc=
ap libcap-native&quot;<br>
=C2=A0PACKAGECONFIG[libidn] =3D &quot;-DUSE_IDN=3Dtrue, -DUSE_IDN=3Dfalse,=
 libidn2&quot;<br>
=C2=A0PACKAGECONFIG[gettext] =3D &quot;-DUSE_GETTEXT=3Dtrue, -DUSE_GETTEXT=
=
=3Dfalse, gettext&quot;<br>
=C2=A0PACKAGECONFIG[ninfod] =3D &quot;-DBUILD_NINFOD=3Dtrue,-DBUILD_NINFOD=
=
=3Dfalse,&quot;<br>
@@ -38,7 +39,7 @@ PACKAGECONFIG[docs] =3D &quot;-DBUILD_HTML_MANS=3Dtrue -=
DBUILD_MANS=3Dtrue,-DBUILD_HTML_MAN<br>
<br>
=C2=A0inherit meson systemd update-alternatives<br>
<br>
-EXTRA_OEMESON +=3D &quot;--prefix=3D${root_prefix}/&quot;<br>
+EXTRA_OEMESON +=3D &quot;--prefix=3D${root_prefix}/ -Dstagingdirnative=3D=
${STAGING_DIR_NATIVE}&quot;<br>
<br>
=C2=A0ALTERNATIVE_PRIORITY =3D &quot;100&quot;<br>
<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000009ab88e05bb9e7484--
