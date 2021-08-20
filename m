Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
 by mx.groups.io with SMTP id smtpd.web10.84765.1629467304379052009
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Aug 2021 06:48:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rykiMdnT;
 spf=pass (domain: gmail.com, ip: 209.85.222.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f43.google.com with SMTP id f25so4151201uam.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Aug 2021 06:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/+SwQ+O8auENB3RSTS6IFRtUWqfe7qf2Q5cvtOVZNhE=;
        b=rykiMdnTi+AHjVnJlHyEgZByelPxcwhcBSwKZtERR4NSSRdf7uYY5RDN2znlzQHuYV
         z8x8jdGqVXq0AlPnvF9QYoJb3gi6zRAHzwJdGSlg6Si+JZ/c8Uz0R55eSs9kuZ/fKXh9
         9EzvhjzGeJHW+xza/7dDJTyK3OROYlzkbCxoQfR+h2G9MjoNU3bcX5IjrP7wPRUi4HIp
         Jj05miQIpfH6Rt9keUOt+AuJYvtjlHVaRvG2Ge0qCrJwK2N0mNX2GFgkK1m6xpBSRMoo
         X8/CE0LW/amVuJFCwmbw3yf5LwRTXiM1GkwgCihe3ZM9vjSfdyZGGeNQ37RBiu0DCwRE
         UgRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/+SwQ+O8auENB3RSTS6IFRtUWqfe7qf2Q5cvtOVZNhE=;
        b=ZRuyCDezT5bIljdqtzgI/5AcDp2pVDVFpAZXsH82seNWO1WKJQR/r6VBlQgOVisllo
         rQqrPaBXZ02jwiKoUboC5heB8f61U4xmEvKVwRAxYkbRKe4qt90Rw/ivBymHGRE8bJtl
         nWdOUxqW82JRpiTH/nMVVtffudl/tswebVrG+K6PaQxcWmavsVHPoq5PkHdjmeE51rmw
         3rX+V6NC73nqn5Pjoq5Gc6q9uLTe+FuW2AJ9qPB52BryzYtL8H7HWE2fu0dE1dDbpW7x
         TVUdxHn96ZkiNeM5vj857Mls5veFHCWkYaeQ01JTCjVSudBmqLg+nkoSKk9Sajo3s5+X
         IHwA==
X-Gm-Message-State: AOAM533YShSsG8DzttwGbd7tC0IimYitSGVMXDzExb/o90HmNKWAk4EP
	Ab1wKlt+XfnB/CEvT7kte8jzk8gytXinOTp3j9M=
X-Google-Smtp-Source: ABdhPJxiXYw7Ad4C9UdSehaXyFd2c0y1rV+OC+YMPt0U9lXyz/Lp31b3t+AzeEWeZrYGlmpREgft97bQLT0GjhNnWTQ=
X-Received: by 2002:ab0:3314:: with SMTP id r20mr15519671uao.89.1629467303470;
 Fri, 20 Aug 2021 06:48:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210818165033.3935964-1-richard.purdie@linuxfoundation.org> <20210818165033.3935964-5-richard.purdie@linuxfoundation.org>
In-Reply-To: <20210818165033.3935964-5-richard.purdie@linuxfoundation.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Fri, 20 Aug 2021 15:48:11 +0200
Message-ID: <CANNYZj9x++ScjHm8KsUrftkN4o4as25=YSws_Lemn2TKLOSRxA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 5/5] elfutils: Fix ptest dependencies
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000cbeaf805c9fdebbf"

--000000000000cbeaf805c9fdebbf
Content-Type: text/plain; charset="UTF-8"

I think this is breaking meta-gpl2 somehow?

https://autobuilder.yoctoproject.org/typhoon/#/builders/75/builds/3855

Alex

On Wed, 18 Aug 2021 at 18:50, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> The elfutils ptests require debug symbols for the libc to be available,
> else
> we see failures such as those on the autobuilder for the fast ptest image
> on arm (the dbg symbols are pulled in by other recipes in other images).
>
> Also fix various test skips/error messages due to missing gcc/ld and
> development headers.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-devtools/elfutils/elfutils_0.185.bb | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/elfutils/elfutils_0.185.bb
> b/meta/recipes-devtools/elfutils/elfutils_0.185.bb
> index 3d103c7c48e..9ea4de8e407 100644
> --- a/meta/recipes-devtools/elfutils/elfutils_0.185.bb
> +++ b/meta/recipes-devtools/elfutils/elfutils_0.185.bb
> @@ -50,11 +50,12 @@ PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd"
>  PACKAGECONFIG[libdebuginfod] =
> "--enable-libdebuginfod,--disable-libdebuginfod,curl"
>  PACKAGECONFIG[debuginfod] =
> "--enable-debuginfod,--disable-debuginfod,libarchive sqlite3 libmicrohttpd"
>
> -RDEPENDS:${PN}-ptest += "libasm libelf bash make coreutils ${PN}-binutils
> iproute2-ss bsdtar"
> +RDEPENDS:${PN}-ptest += "libasm libelf bash make coreutils ${PN}-binutils
> iproute2-ss bsdtar gcc-symlinks binutils-symlinks libgcc-dev"
>
>  EXTRA_OECONF:append:class-target = " --disable-tests-rpath"
>
> -RDEPENDS:${PN}-ptest:append:libc-glibc = " glibc-utils"
> +RDEPENDS:${PN}-ptest:append:libc-glibc = " glibc-utils glibc-dbg
> glibc-dev"
> +INSANE_SKIP:${PN}-ptest = "debug-deps dev-deps"
>
>  do_compile_ptest() {
>         cd ${B}/tests
> --
> 2.30.2
>
>
> 
>
>

--000000000000cbeaf805c9fdebbf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I think this is breaking meta-gpl2 somehow?</div><div=
><br></div><div><a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/b=
uilders/75/builds/3855">https://autobuilder.yoctoproject.org/typhoon/#/buil=
ders/75/builds/3855</a></div><div><br></div><div>Alex<br></div></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 18 A=
ug 2021 at 18:50, Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linux=
foundation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">The elfutils ptests requi=
re debug symbols for the libc to be available, else<br>
we see failures such as those on the autobuilder for the fast ptest image<b=
r>
on arm (the dbg symbols are pulled in by other recipes in other images).<br=
>
<br>
Also fix various test skips/error messages due to missing gcc/ld and<br>
development headers.<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<b=
r>
---<br>
=C2=A0meta/recipes-devtools/elfutils/<a href=3D"http://elfutils_0.185.bb" r=
el=3D"noreferrer" target=3D"_blank">elfutils_0.185.bb</a> | 5 +++--<br>
=C2=A01 file changed, 3 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-devtools/elfutils/<a href=3D"http://elfutils_0.18=
5.bb" rel=3D"noreferrer" target=3D"_blank">elfutils_0.185.bb</a> b/meta/rec=
ipes-devtools/elfutils/<a href=3D"http://elfutils_0.185.bb" rel=3D"noreferr=
er" target=3D"_blank">elfutils_0.185.bb</a><br>
index 3d103c7c48e..9ea4de8e407 100644<br>
--- a/meta/recipes-devtools/elfutils/<a href=3D"http://elfutils_0.185.bb" r=
el=3D"noreferrer" target=3D"_blank">elfutils_0.185.bb</a><br>
+++ b/meta/recipes-devtools/elfutils/<a href=3D"http://elfutils_0.185.bb" r=
el=3D"noreferrer" target=3D"_blank">elfutils_0.185.bb</a><br>
@@ -50,11 +50,12 @@ PACKAGECONFIG[zstd] =3D &quot;--with-zstd,--without-zst=
d,zstd&quot;<br>
=C2=A0PACKAGECONFIG[libdebuginfod] =3D &quot;--enable-libdebuginfod,--disab=
le-libdebuginfod,curl&quot;<br>
=C2=A0PACKAGECONFIG[debuginfod] =3D &quot;--enable-debuginfod,--disable-deb=
uginfod,libarchive sqlite3 libmicrohttpd&quot;<br>
<br>
-RDEPENDS:${PN}-ptest +=3D &quot;libasm libelf bash make coreutils ${PN}-bi=
nutils iproute2-ss bsdtar&quot;<br>
+RDEPENDS:${PN}-ptest +=3D &quot;libasm libelf bash make coreutils ${PN}-bi=
nutils iproute2-ss bsdtar gcc-symlinks binutils-symlinks libgcc-dev&quot;<b=
r>
<br>
=C2=A0EXTRA_OECONF:append:class-target =3D &quot; --disable-tests-rpath&quo=
t;<br>
<br>
-RDEPENDS:${PN}-ptest:append:libc-glibc =3D &quot; glibc-utils&quot;<br>
+RDEPENDS:${PN}-ptest:append:libc-glibc =3D &quot; glibc-utils glibc-dbg gl=
ibc-dev&quot;<br>
+INSANE_SKIP:${PN}-ptest =3D &quot;debug-deps dev-deps&quot;<br>
<br>
=C2=A0do_compile_ptest() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cd ${B}/tests<br>
-- <br>
2.30.2<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000cbeaf805c9fdebbf--
