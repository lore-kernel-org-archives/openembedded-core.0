Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com [209.85.222.67])
 by mx.groups.io with SMTP id smtpd.web10.926.1597441470583336860
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Aug 2020 14:44:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BaT6/g0n;
 spf=pass (domain: gmail.com, ip: 209.85.222.67, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f67.google.com with SMTP id z12so3060637uam.12
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2020 14:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UO1t6dxk9xxDsT/UsLBR8PrK7CA711XnWft4tgL+mdQ=;
        b=BaT6/g0nuAMmDiBiF1JhuVQuB30pPRfFqZ81VkZEWvg/MpzAvo+mIn4WSwUgVUPjNg
         +6bEVndv85ZSNa7E1OJNr3DCAOzpqxq4FIjcYAvkwQPFVxGU+zMomzEaTT/SRglpK4a0
         0SlQICnQwV2uY9+OWSbGZOlNys/M7v3aWzCvD8OHspC3xUFzuhbqdaIL27Pb+6dKM2xC
         swXE6h2XQdo1J4YF3gWDjC7jXJan6xo+kBY90D7tB+ZE0pptPUZYn+gSJbjWx4iovWNO
         WpqtJyChiVlnirG0FY2evmMMzFdhhlMmkOMP4tvytnOFLq12trdsvYUbk85Sq8E1BNWd
         ipRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UO1t6dxk9xxDsT/UsLBR8PrK7CA711XnWft4tgL+mdQ=;
        b=WV+SGyO8uJt5kJj4FfSUDktviXSM+ukrdJExYOg2JMJIzuBVPxgPMjbgyJ+7tXT5gf
         ap6hZl4kzZ2n7VLSygDkyxZWvyY/34nnFnF9i/K3k6FjhGicmZ5cfHqIaMPrEqFxoyre
         KDXLbgX2kvH05EVZMoglbg8FZme2RrT7NPxIjiEnFjbzPpHawscrd5UEPkS/9123tVkW
         Rbr8UVznX7J4j9+lwRTtwli8vldAGAdqxWNDfSXRPhWsXQ3WrcgJGsnZQEvfuFsNPKJm
         p8gDp4gD2VXMuaPN9mQFCZZrcESPQe29E0H1okABTGLQr95PtEo7lvc2ViFULNyW4u3R
         xHqQ==
X-Gm-Message-State: AOAM531T86GSq014C+pv6F7+eBWv1aMkccW3VSYfUrqWa2bPD3xTqK+2
	MQ6YJgVxRsYDppEooEa4SkPMlW59AYtHwo3bKbOhfu+f
X-Google-Smtp-Source: ABdhPJxzRw6eJAAchXcaH2GvsbBEX4HObOKeKdZbxmjptPLJLIdzMiAoH99IPU9/GYGd3KdDoJiwnCgsZ7dFHRM/TyU=
X-Received: by 2002:ab0:6950:: with SMTP id c16mr2584877uas.71.1597441469616;
 Fri, 14 Aug 2020 14:44:29 -0700 (PDT)
MIME-Version: 1.0
References: <1597438000-20251-1-git-send-email-leon@sidebranch.com>
In-Reply-To: <1597438000-20251-1-git-send-email-leon@sidebranch.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Fri, 14 Aug 2020 23:44:17 +0200
Message-ID: <CANNYZj9i+s2ORHFtJDZDHJUQ2pfFHAbJdK+vp3cFSp5ZHNuitg@mail.gmail.com>
Subject: Re: [OE-core] [dunfell] [PATCH] cmake-native: Use cmake-provided zstd library; supported host distro zstd may be too old.
To: Leon Woestenberg <leon@sidebranch.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000058953605acdd53db"

--00000000000058953605acdd53db
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This needs to go to master first probably?

Alex

On Fri, 14 Aug 2020 at 22:46, Leon Woestenberg <leon@sidebranch.com> wrote=
:

> cmake-native uses the system provided libraries due to:
>
> CMAKE_EXTRACONF =3D "<...> -DCMAKE_USE_SYSTEM_LIBRARIES=3D1 <...>"
>
> Now, iff the libzstd(-dev) is installed but too old, which can happen on
> Ubuntu 16.04:
>
> dpkg -l | grep zstd
> ii  libzstd-dev  0.5.1-1
> ii  libzstd0 0.5.1-1
>
> cmake configure will use the zstd system library:
>
> cat ./tmp/work/x86_64-linux/cmake-native/3.15.3-r0/temp/log.do_configure=
 |
> grep -i ZSTD
> -- Using system-installed ZSTD
> -- Found ZSTD: /usr/lib/x86_64-linux-gnu/libzstd.so
>
> but will fail to compile due to:
>
> <...>/tmp/work/x86_64-linux/cmake-native/3.15.3-r0/cmake-3.15.3/Utilitie=
s/cmlibarchive/libarchive/archive_read_support_filter_zstd.c:59:2:
> error: unknown type name =E2=80=98ZSTD_DStream=E2=80=99
> |   ZSTD_DStream *dstream;
> |   ^
>
> The library does not contain that datatype:
>
> grep -rne ZSTD_DStream /usr/include/zstd.h
> <no output>
>
> Apparently the cmake-native library check is not checking the library
> version or features.
>
> This fix is to not depend on the system library and use the zstd library
> provided with cmake.
>
> CMAKE_EXTRACONF =3D "\
> <...>
>     -DCMAKE_USE_SYSTEM_LIBRARY_ZSTD=3D0 \
> <...>
>
> Signed-off-by: Leon Woestenberg <leon@sidebranch.com>
> ---
>  meta/recipes-devtools/cmake/cmake-native_3.16.5.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-devtools/cmake/cmake-native_3.16.5.bb
> b/meta/recipes-devtools/cmake/cmake-native_3.16.5.bb
> index b2952ee..e0ac3f8 100644
> --- a/meta/recipes-devtools/cmake/cmake-native_3.16.5.bb
> +++ b/meta/recipes-devtools/cmake/cmake-native_3.16.5.bb
> @@ -21,6 +21,7 @@ CMAKE_EXTRACONF =3D "\
>      -DCMAKE_USE_SYSTEM_LIBRARY_LIBARCHIVE=3D0 \
>      -DCMAKE_USE_SYSTEM_LIBRARY_LIBUV=3D0 \
>      -DCMAKE_USE_SYSTEM_LIBRARY_LIBRHASH=3D0 \
> +    -DCMAKE_USE_SYSTEM_LIBRARY_ZSTD=3D0 \
>      -DENABLE_ACL=3D0 -DHAVE_ACL_LIBACL_H=3D0 \
>      -DHAVE_SYS_ACL_H=3D0 \
>  "
> --
> 2.7.4
>
>=20
>

--00000000000058953605acdd53db
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This needs to go to master first probably?</div><div>=
<br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, 14 Aug 2020 at 22:46, Leon Woestenbe=
rg &lt;<a href=3D"mailto:leon@sidebranch.com">leon@sidebranch.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">cmake-nati=
ve uses the system provided libraries due to:<br>
<br>
CMAKE_EXTRACONF =3D &quot;&lt;...&gt; -DCMAKE_USE_SYSTEM_LIBRARIES=3D1 &lt=
;...&gt;&quot;<br>
<br>
Now, iff the libzstd(-dev) is installed but too old, which can happen on U=
buntu 16.04:<br>
<br>
dpkg -l | grep zstd<br>
ii=C2=A0 libzstd-dev=C2=A0 0.5.1-1<br>
ii=C2=A0 libzstd0 0.5.1-1<br>
<br>
cmake configure will use the zstd system library:<br>
<br>
cat ./tmp/work/x86_64-linux/cmake-native/3.15.3-r0/temp/log.do_configure |=
 grep -i ZSTD<br>
-- Using system-installed ZSTD<br>
-- Found ZSTD: /usr/lib/x86_64-linux-gnu/libzstd.so<br>
<br>
but will fail to compile due to:<br>
<br>
&lt;...&gt;/tmp/work/x86_64-linux/cmake-native/3.15.3-r0/cmake-3.15.3/Util=
ities/cmlibarchive/libarchive/archive_read_support_filter_zstd.c:59:2: erro=
r: unknown type name =E2=80=98ZSTD_DStream=E2=80=99<br>
|=C2=A0 =C2=A0ZSTD_DStream *dstream;<br>
|=C2=A0 =C2=A0^<br>
<br>
The library does not contain that datatype:<br>
<br>
grep -rne ZSTD_DStream /usr/include/zstd.h<br>
&lt;no output&gt;<br>
<br>
Apparently the cmake-native library check is not checking the library vers=
ion or features.<br>
<br>
This fix is to not depend on the system library and use the zstd library p=
rovided with cmake.<br>
<br>
CMAKE_EXTRACONF =3D &quot;\<br>
&lt;...&gt;<br>
=C2=A0 =C2=A0 -DCMAKE_USE_SYSTEM_LIBRARY_ZSTD=3D0 \<br>
&lt;...&gt;<br>
<br>
Signed-off-by: Leon Woestenberg &lt;<a href=3D"mailto:leon@sidebranch.com"=
 target=3D"_blank">leon@sidebranch.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/cmake/<a href=3D"http://cmake-native_3.16.5.bb=
" rel=3D"noreferrer" target=3D"_blank">cmake-native_3.16.5.bb</a> | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/recipes-devtools/cmake/<a href=3D"http://cmake-native_3.=
16.5.bb" rel=3D"noreferrer" target=3D"_blank">cmake-native_3.16.5.bb</a> b/=
meta/recipes-devtools/cmake/<a href=3D"http://cmake-native_3.16.5.bb" rel=
=3D"noreferrer" target=3D"_blank">cmake-native_3.16.5.bb</a><br>
index b2952ee..e0ac3f8 100644<br>
--- a/meta/recipes-devtools/cmake/<a href=3D"http://cmake-native_3.16.5.bb=
" rel=3D"noreferrer" target=3D"_blank">cmake-native_3.16.5.bb</a><br>
+++ b/meta/recipes-devtools/cmake/<a href=3D"http://cmake-native_3.16.5.bb=
" rel=3D"noreferrer" target=3D"_blank">cmake-native_3.16.5.bb</a><br>
@@ -21,6 +21,7 @@ CMAKE_EXTRACONF =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0-DCMAKE_USE_SYSTEM_LIBRARY_LIBARCHIVE=3D0 \<br>
=C2=A0 =C2=A0 =C2=A0-DCMAKE_USE_SYSTEM_LIBRARY_LIBUV=3D0 \<br>
=C2=A0 =C2=A0 =C2=A0-DCMAKE_USE_SYSTEM_LIBRARY_LIBRHASH=3D0 \<br>
+=C2=A0 =C2=A0 -DCMAKE_USE_SYSTEM_LIBRARY_ZSTD=3D0 \<br>
=C2=A0 =C2=A0 =C2=A0-DENABLE_ACL=3D0 -DHAVE_ACL_LIBACL_H=3D0 \<br>
=C2=A0 =C2=A0 =C2=A0-DHAVE_SYS_ACL_H=3D0 \<br>
=C2=A0&quot;<br>
-- <br>
2.7.4<br>
<br>
<br>
</blockquote></div>

--00000000000058953605acdd53db--
