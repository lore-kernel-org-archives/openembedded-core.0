Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web09.1134.1619399732592835090
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 18:15:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cDYK03em;
 spf=pass (domain: gmail.com, ip: 209.85.160.177, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id 18so27110250qtz.6
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Apr 2021 18:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BasOz8LbuGqvPl5/U3QLYEZOPzubsw2bZevERV5LrYM=;
        b=cDYK03emfVPwi3W8/1jcR+JOATmpxzXHxIAmKaewJwHCPOh9w3EeLb1/G+36wMm35l
         pvcBoh9MgpwjJEewweyBjOvXqeQM88X3g98pYGqVQ0rpDsybDxU2a3atFMJnZVyH6cUd
         4AQP8PSqT5tIcpKw8p910eG1zPr2Z5xjDrWiWvvpf0nDkmxMPLKSbAxmRqRpuc+IjNlb
         4i5PMqcPzpNG0c58moizG9tzm7KqJ41sACh3m1tFk6Yth/sarbokT3umRDdrcM7YglaY
         rp1dGUxXXAylat6l5EyJJuKj0GD31ziqkFRZscmuCnf9GnMNpirjR3ti0BGuKDhrGT31
         fjNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BasOz8LbuGqvPl5/U3QLYEZOPzubsw2bZevERV5LrYM=;
        b=pCi35Rv3reZZ1yp1nakK1JBZfSxFzLa27e5nRGy93PFV3Ndg+GNpXg1IVyp9xTYQDC
         SRWJXZir+KdNL8md65fAnBtDBctAb0HynQGTETMip0rPqQ4jr/u/0KMl4LsZ6R31L758
         BAmVzwfWR/ECT6yTLi1XsHdmcFceyRRH4FB7b1/TnMUiHPMDYhCtuxirV6FH/c3WmUJJ
         WXI20OZ3kRPnWofJK70GynYGUivlRLSYP/hDrADqKUOE+OTDpvJAq1t75iv7p3a5jrp/
         k5IjBqGnoGgn4g8TnJc8aXN8IjxlJ4dw6JCAVLDqX+JNXkV8EOvwD4YvzClylgjK92CJ
         1yKA==
X-Gm-Message-State: AOAM532OGAviB+78D/04Eae2eN6M/pQ98BaqNUw4K10WZUU0wQEEI+9t
	39UnqjauKOzAS+WEm57PMD3nXEoCRbXP9aWRDUg=
X-Google-Smtp-Source: ABdhPJy6yNTvryJ/1L0lwECLZN6c6bzd/gFyBDsuDZw0BGFFossTz+iM+mwNcbWisQwQfMxRhf/Z7Yhxkhvy0PPfHMU=
X-Received: by 2002:ac8:534a:: with SMTP id d10mr14115624qto.299.1619399731623;
 Sun, 25 Apr 2021 18:15:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210425165840.1671595-1-richard.purdie@linuxfoundation.org> <20210425165840.1671595-2-richard.purdie@linuxfoundation.org>
In-Reply-To: <20210425165840.1671595-2-richard.purdie@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 25 Apr 2021 18:15:20 -0700
Message-ID: <CAMKF1sot-RDEi2zgdjRWP=7Nd-PxHaCA_N8QAGz+W0dyVvN9NQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] apt: Disable libseccomp
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c0bbda05c0d5e125"

--000000000000c0bbda05c0d5e125
Content-Type: text/plain; charset="UTF-8"

On Sun, Apr 25, 2021 at 9:59 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> This isn't in DEPENDS and isn't configured. It can detect the library when
> pulled in via other dependencies meaning the build isn't deterministic.
>
> Ultimately this could become a PACKAGECONFIG. It doesn't build on musl
> so disable it for now until someone fixes and sorts this out properly


I think it will be better to check for seccomp distro feature to set this
option that will make it deterministic and for musl I have sent a fix
already


> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-devtools/apt/apt_2.2.2.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-devtools/apt/apt_2.2.2.bb
> b/meta/recipes-devtools/apt/apt_2.2.2.bb
> index 7d1bce558d1..326f691ec03 100644
> --- a/meta/recipes-devtools/apt/apt_2.2.2.bb
> +++ b/meta/recipes-devtools/apt/apt_2.2.2.bb
> @@ -45,6 +45,7 @@ EXTRA_OECMAKE_append = " -DCURRENT_VENDOR=debian
> -DWITH_DOC=False \
>      -DDPKG_DATADIR=${datadir}/dpkg \
>      -DTRIEHASH_EXECUTABLE=${WORKDIR}/triehash \
>      -DCMAKE_DISABLE_FIND_PACKAGE_ZSTD=True \
> +    -DCMAKE_DISABLE_FIND_PACKAGE_SECCOMP=True \
>      -DWITH_TESTS=False \
>  "
>
> --
> 2.30.2
>
>
> 
>
>

--000000000000c0bbda05c0d5e125
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Apr 25, 2021 at 9:59 AM Richard Purdie &lt;<a href=
=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundat=
ion.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"=
>This isn&#39;t in DEPENDS and isn&#39;t configured. It can detect the libr=
ary when<br>
pulled in via other dependencies meaning the build isn&#39;t deterministic=
.<br>
<br>
Ultimately this could become a PACKAGECONFIG. It doesn&#39;t build on musl=
<br>
so disable it for now until someone fixes and sorts this out properly</blo=
ckquote><div dir=3D"auto"><br></div><div dir=3D"auto">I think it will be be=
tter to check for seccomp distro feature to set this option that will make =
it deterministic and for musl I have sent a fix already=C2=A0</div><div dir=
=
=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfo=
undation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<=
br>
---<br>
=C2=A0meta/recipes-devtools/apt/<a href=3D"http://apt_2.2.2.bb" rel=3D"nor=
eferrer" target=3D"_blank">apt_2.2.2.bb</a> | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/recipes-devtools/apt/<a href=3D"http://apt_2.2.2.bb" rel=
=
=3D"noreferrer" target=3D"_blank">apt_2.2.2.bb</a> b/meta/recipes-devtools=
/apt/<a href=3D"http://apt_2.2.2.bb" rel=3D"noreferrer" target=3D"_blank">a=
pt_2.2.2.bb</a><br>
index 7d1bce558d1..326f691ec03 100644<br>
--- a/meta/recipes-devtools/apt/<a href=3D"http://apt_2.2.2.bb" rel=3D"nor=
eferrer" target=3D"_blank">apt_2.2.2.bb</a><br>
+++ b/meta/recipes-devtools/apt/<a href=3D"http://apt_2.2.2.bb" rel=3D"nor=
eferrer" target=3D"_blank">apt_2.2.2.bb</a><br>
@@ -45,6 +45,7 @@ EXTRA_OECMAKE_append =3D &quot; -DCURRENT_VENDOR=3Ddebia=
n -DWITH_DOC=3DFalse \<br>
=C2=A0 =C2=A0 =C2=A0-DDPKG_DATADIR=3D${datadir}/dpkg \<br>
=C2=A0 =C2=A0 =C2=A0-DTRIEHASH_EXECUTABLE=3D${WORKDIR}/triehash \<br>
=C2=A0 =C2=A0 =C2=A0-DCMAKE_DISABLE_FIND_PACKAGE_ZSTD=3DTrue \<br>
+=C2=A0 =C2=A0 -DCMAKE_DISABLE_FIND_PACKAGE_SECCOMP=3DTrue \<br>
=C2=A0 =C2=A0 =C2=A0-DWITH_TESTS=3DFalse \<br>
=C2=A0&quot;<br>
<br>
-- <br>
2.30.2<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--000000000000c0bbda05c0d5e125--
