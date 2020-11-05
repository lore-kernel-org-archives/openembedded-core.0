Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web09.45.1604599049912633060
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2020 09:57:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=I6cCAwlP;
 spf=pass (domain: linaro.org, ip: 209.85.128.47, mailfrom: anibal.limon@linaro.org)
Received: by mail-wm1-f47.google.com with SMTP id h2so2471552wmm.0
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2020 09:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UxHH4eNJGOGAZdaoPoNoKrFqBcar7Vu8ijo/eX3ekPA=;
        b=I6cCAwlPWRVWP77BnbNo33O1RtxpvAA0Z4X2zlASkIZFsq1X8Q7Y1u2BuoKgoKC0ou
         HUG6llOoy4U4h5tqU7q3s3vu2sFkNlxNH4ESCYCet605GOGI5+pQ792ZHNNy+L+ma0mY
         nw0x24SAAwrpQSaT9HIybOyRSf1bFtga6nI0QLeoTNmlDl3DEeHlSlVwSm4chEEhWWhs
         NlUJoUZE+U47eZip2oKw48R6akRpQlwJFcBfHH3Hhd1XH3XrVq6eDHKAbN/4Xlk8zKLc
         xT8kahTMVBED0yfKQm6JfEu+aUmRS5IcesZVOBJQ7rkyqr+CfI9tojVoAsqlwBbSrvCF
         dKlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UxHH4eNJGOGAZdaoPoNoKrFqBcar7Vu8ijo/eX3ekPA=;
        b=oCQy/NJfafJtlPmbF5YBALA1iaY3K1LDQlZcyoB3daJMOL2mxBAHm1y36YXz6/rwjR
         8jhNThko+WWzx8Yx4nMg0yHOxfN7Qm1Q3v8/dD/WZay07AHWZMci8t01HEhg/r8ivIyV
         9VXC7m25dN82hMjj3+8wurd4/FoZFs8l3EdUdoVLHnrucUHstRtzSEie6PcqREAA38HA
         5D6x0+cLyhNc0oU1UyeLndVx7B1Uz9aiqs0sOZE64jHVDsBmhVdPJ4wSG1BSkD6ExPRr
         y+K2biC5nFnXoDvPF4HdvYPwvspHLz+XKSAIovuyrH/gUIwYaesdk8oJKG923NpGWQ3t
         9QfQ==
X-Gm-Message-State: AOAM533OkWZZx8xH8LQa8xIKBgE3NPpCQvGfMBvNIRNx2krZCYhV3315
	wLQvvAQ1SHmlXNGMJexEFIzNsAnPhi3nDegaTnEVjQ==
X-Google-Smtp-Source: ABdhPJwSQmuoM7Fb6gOqnXDVIKeLpoYjALMyIIYATULVrrR5YfRUPDv7uGq+XjvBwDobrCaUZsLJRz+upH42pkNlc60=
X-Received: by 2002:a7b:ce0c:: with SMTP id m12mr3829418wmc.114.1604599048276;
 Thu, 05 Nov 2020 09:57:28 -0800 (PST)
MIME-Version: 1.0
References: <164419F41027C9D2.7719@lists.openembedded.org> <20201103215244.857384-1-Martin.Jansa@gmail.com>
In-Reply-To: <20201103215244.857384-1-Martin.Jansa@gmail.com>
From: "Anibal Limon" <anibal.limon@linaro.org>
Date: Thu, 5 Nov 2020 11:57:17 -0600
Message-ID: <CA+_Aqiuge4Tpf0XsHbWLLRpjXS8sUu7-uAgqRZ+vMuc8V9Qc+w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libxkbcommon: add missing dependency on libxml2
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000047a65805b35fd4e9"

--00000000000047a65805b35fd4e9
Content-Type: text/plain; charset="UTF-8"

I have the same issue, looking at libxkbcommon [1], it suggest to package
the libxkbregistry separately and since the libxml2 adds a lot
of dependencies may be is better to disable by default via
-Denable-xkbregistry=false and add another recipe to build it if needed.

Regards,
Anibal

On Tue, 3 Nov 2020 at 15:52, Martin Jansa <Martin.Jansa@gmail.com> wrote:

> * it was introduced with xkbregistry support in:
>
> https://github.com/xkbcommon/libxkbcommon/commit/afb26e7df9090a0b765eb294b6efff448f763b6f
>   and as xkbregistry is enabled by default libxkbcommon
>   is failing since the upgrade to 1.0.1 in builds where
>   libxml2 wasn't included in RSS (e.g. when wayland
>   isn't in DISTRO_FEATURES -> in PACKAGECONFIG)
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.1.bb
> b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.1.bb
> index 4ef20b0721..353856e1c4 100644
> --- a/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.1.bb
> +++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.1.bb
> @@ -5,7 +5,7 @@ HOMEPAGE = "http://www.xkbcommon.org"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=e525ed9809e1f8a07cf4bce8b09e8b87"
>  LICENSE = "MIT & MIT-style"
>
> -DEPENDS = "util-macros flex-native bison-native"
> +DEPENDS = "util-macros flex-native bison-native libxml2"
>
>  SRC_URI = "http://xkbcommon.org/download/${BPN}-${PV}.tar.xz"
>
> --
> 2.27.0
>
>
> 
>
>

--00000000000047a65805b35fd4e9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"></div>I have the same is=
sue, looking at libxkbcommon [1], it suggest to package the libxkbregistry =
separately and since the libxml2 adds a lot<div>of dependencies may be is b=
etter to disable by default via -Denable-xkbregistry=3Dfalse and add anothe=
r recipe to build it if needed.</div><div><br></div><div>Regards,</div><div=
>Anibal<br><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Tue, 3 Nov 2020 at 15:52, Martin Jansa &lt;<a href=3D"mailto:M=
artin.Jansa@gmail.com">Martin.Jansa@gmail.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">* it was introduced with xkbre=
gistry support in:<br>
=C2=A0 <a href=3D"https://github.com/xkbcommon/libxkbcommon/commit/afb26e7=
df9090a0b765eb294b6efff448f763b6f" rel=3D"noreferrer" target=3D"_blank">htt=
ps://github.com/xkbcommon/libxkbcommon/commit/afb26e7df9090a0b765eb294b6eff=
f448f763b6f</a><br>
=C2=A0 and as xkbregistry is enabled by default libxkbcommon<br>
=C2=A0 is failing since the upgrade to 1.0.1 in builds where<br>
=C2=A0 libxml2 wasn&#39;t included in RSS (e.g. when wayland<br>
=C2=A0 isn&#39;t in DISTRO_FEATURES -&gt; in PACKAGECONFIG)<br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-graphics/xorg-lib/<a href=3D"http://libxkbcommon_1.0.1.=
bb" rel=3D"noreferrer" target=3D"_blank">libxkbcommon_1.0.1.bb</a> | 2 +-<b=
r>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-graphics/xorg-lib/<a href=3D"http://libxkbcommon=
_1.0.1.bb" rel=3D"noreferrer" target=3D"_blank">libxkbcommon_1.0.1.bb</a> b=
/meta/recipes-graphics/xorg-lib/<a href=3D"http://libxkbcommon_1.0.1.bb" re=
l=3D"noreferrer" target=3D"_blank">libxkbcommon_1.0.1.bb</a><br>
index 4ef20b0721..353856e1c4 100644<br>
--- a/meta/recipes-graphics/xorg-lib/<a href=3D"http://libxkbcommon_1.0.1.=
bb" rel=3D"noreferrer" target=3D"_blank">libxkbcommon_1.0.1.bb</a><br>
+++ b/meta/recipes-graphics/xorg-lib/<a href=3D"http://libxkbcommon_1.0.1.=
bb" rel=3D"noreferrer" target=3D"_blank">libxkbcommon_1.0.1.bb</a><br>
@@ -5,7 +5,7 @@ HOMEPAGE =3D &quot;<a href=3D"http://www.xkbcommon.org" re=
l=3D"noreferrer" target=3D"_blank">http://www.xkbcommon.org</a>&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3De525ed9809e1f8a07cf4=
bce8b09e8b87&quot;<br>
=C2=A0LICENSE =3D &quot;MIT &amp; MIT-style&quot;<br>
<br>
-DEPENDS =3D &quot;util-macros flex-native bison-native&quot;<br>
+DEPENDS =3D &quot;util-macros flex-native bison-native libxml2&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"http://xkbcommon.org/download/$%7BBPN%7=
D-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">http://xkbcommon.o=
rg/download/${BPN}-${PV}.tar.xz</a>&quot;<br>
<br>
-- <br>
2.27.0<br>
<br>
<br>
<br>
<br>
</blockquote></div></div></div></div></div>

--00000000000047a65805b35fd4e9--
