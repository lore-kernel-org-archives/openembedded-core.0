Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web10.78168.1629417719219445872
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Aug 2021 17:01:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bo0so40K;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id d25so3066920qtq.9
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Aug 2021 17:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ATLkWqiAzt/6p06KCOI5QrCQc+L82jZi24jRV513sfA=;
        b=bo0so40K6bsoJCSwt41hHJXIWqLg+cLU6X4uYZhM5STB4XnMwUxcHGukbZVF13bUP4
         mIwuj/dsRNcShhPNwqUIxO+fib5LBMBRD6f7BCDLLpAL6IeGJ64gnAwp3EJbKYS4aDDk
         xuTF0Pev3f1uqOkWmkpneJwu01ospQDWkdB9zK4/v2cS/TNgV5WV/IDcnymGttEtTdF7
         LoWRxQU3fOPqq0VC+Yi3tBTGOEPCQB1oOhvJWz7EV2Ba6wTeFRhRY099ggJmUYZDJ3Jo
         9abQGxES0VOLKa4ekXE77vEMt38QYNT2uuBG0J+XC144UaW8QONxxzt+NoF4nx7PJYRo
         Fzsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ATLkWqiAzt/6p06KCOI5QrCQc+L82jZi24jRV513sfA=;
        b=XHfv7dTPdTy51VC3juSnboEahfhmcQsnTg5M2+uzo2Vqx62aJibFjkG0nTJKleDKBR
         YJcVLobpXjEO+YHo1spkqtANOQT5YwTl7C+DVlGFqb6lMmONNPRqCn72bDhWowYsmCuV
         6jX5UkFkMJcF1xgiLYZJPHPUKQDLHNIB2nmwOcyNpbbQHyq7hbW1UyhHsZGXV1MK1WxU
         Ujt7Su+YTaMB7nvMt3RP4TMvdz3ekfUUx3YrnK9+xdmniVPXuts9CGHU0tAM9d24Z27I
         UTZS2lpnjmn2cJs62xn9O/An5PJlM0xAuymOoYx7+u1RVO+nmLfJUbyCoXXy27v2i0cs
         G2dQ==
X-Gm-Message-State: AOAM530wmu8/Xaw3txLP3z+4LzzjL0OkmLXThml6ShEy+EJ/WPGTzdAb
	EPYjcDK3q6c+5hc5WimJhq3jZ+t2qcANynt6LbA=
X-Google-Smtp-Source: ABdhPJxJ2BKWCIXC7tQ416J6lVeSQhKiJzHLI40iMcS3DpUNYc/3dx9FzsBREVr0Nb7W3wlrP8Kqqm16YDw4h2sp4ig=
X-Received: by 2002:ac8:7d48:: with SMTP id h8mr15095235qtb.299.1629417718352;
 Thu, 19 Aug 2021 17:01:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210819092200.486069-1-o.kranz.88@gmail.com>
In-Reply-To: <20210819092200.486069-1-o.kranz.88@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 19 Aug 2021 17:01:47 -0700
Message-ID: <CAMKF1sp3LRuBd==eBJB0dY4_a9Zq3taU40P1Xtqxg0k7mCfKqg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] Allow global override of golang GO_DYNLINK
To: Oliver Kranz <o.kranz.88@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004b0e5005c9f26025"

--0000000000004b0e5005c9f26025
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 19, 2021 at 2:22 AM Oliver Kranz <o.kranz.88@gmail.com> wrote:

> Small golang applications create massive memory overhead if go-runtime
> is deployed. So it is helpfull to be able to disable the GO_DYNLINK
> option on a per distro/local.conf basis by making it a ?= instead of =.
>

I wonder if we should make static as default and let users go for dynamic
link if they wish to

>
> Signed-off-by: Oliver Kranz <o.kranz.88@gmail.com>
> ---
>  meta/classes/goarch.bbclass | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
> index 48dc48dabf..92fec16b82 100644
> --- a/meta/classes/goarch.bbclass
> +++ b/meta/classes/goarch.bbclass
> @@ -32,13 +32,13 @@ BASE_GOARM:armv5 = '5'
>  # Go supports dynamic linking on a limited set of architectures.
>  # See the supportsDynlink function in
> go/src/cmd/compile/internal/gc/main.go
>  GO_DYNLINK = ""
> -GO_DYNLINK:arm = "1"
> -GO_DYNLINK:aarch64 = "1"
> -GO_DYNLINK:x86 = "1"
> -GO_DYNLINK:x86-64 = "1"
> -GO_DYNLINK:powerpc64 = "1"
> -GO_DYNLINK:powerpc64le = "1"
> -GO_DYNLINK:class-native = ""
> +GO_DYNLINK:arm ?= "1"
> +GO_DYNLINK:aarch64 ?= "1"
> +GO_DYNLINK:x86 ?= "1"
> +GO_DYNLINK:x86-64 ?= "1"
> +GO_DYNLINK:powerpc64 ?= "1"
> +GO_DYNLINK:powerpc64le ?= "1"
> +GO_DYNLINK:class-native ?= ""
>  GO_DYNLINK:class-nativesdk = ""
>
>  # define here because everybody inherits this class
> --
> 2.32.0
>
>
> 
>
>

--0000000000004b0e5005c9f26025
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Aug 19, 2021 at 2:22 AM Oliver Kranz &lt;<a href=3D=
"mailto:o.kranz.88@gmail.com">o.kranz.88@gmail.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Small golang applications create massive mem=
ory overhead if go-runtime<br>
is deployed. So it is helpfull to be able to disable the GO_DYNLINK<br>
option on a per distro/local.conf basis by making it a ?=3D instead of =3D.=
<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I wonder if we s=
hould make static as default and let users go for dynamic link if they wish=
 to=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><br>
Signed-off-by: Oliver Kranz &lt;<a href=3D"mailto:o.kranz.88@gmail.com" tar=
get=3D"_blank">o.kranz.88@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/goarch.bbclass | 14 +++++++-------<br>
=C2=A01 file changed, 7 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass<br>
index 48dc48dabf..92fec16b82 100644<br>
--- a/meta/classes/goarch.bbclass<br>
+++ b/meta/classes/goarch.bbclass<br>
@@ -32,13 +32,13 @@ BASE_GOARM:armv5 =3D &#39;5&#39;<br>
=C2=A0# Go supports dynamic linking on a limited set of architectures.<br>
=C2=A0# See the supportsDynlink function in go/src/cmd/compile/internal/gc/=
main.go<br>
=C2=A0GO_DYNLINK =3D &quot;&quot;<br>
-GO_DYNLINK:arm =3D &quot;1&quot;<br>
-GO_DYNLINK:aarch64 =3D &quot;1&quot;<br>
-GO_DYNLINK:x86 =3D &quot;1&quot;<br>
-GO_DYNLINK:x86-64 =3D &quot;1&quot;<br>
-GO_DYNLINK:powerpc64 =3D &quot;1&quot;<br>
-GO_DYNLINK:powerpc64le =3D &quot;1&quot;<br>
-GO_DYNLINK:class-native =3D &quot;&quot;<br>
+GO_DYNLINK:arm ?=3D &quot;1&quot;<br>
+GO_DYNLINK:aarch64 ?=3D &quot;1&quot;<br>
+GO_DYNLINK:x86 ?=3D &quot;1&quot;<br>
+GO_DYNLINK:x86-64 ?=3D &quot;1&quot;<br>
+GO_DYNLINK:powerpc64 ?=3D &quot;1&quot;<br>
+GO_DYNLINK:powerpc64le ?=3D &quot;1&quot;<br>
+GO_DYNLINK:class-native ?=3D &quot;&quot;<br>
=C2=A0GO_DYNLINK:class-nativesdk =3D &quot;&quot;<br>
<br>
=C2=A0# define here because everybody inherits this class<br>
-- <br>
2.32.0<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--0000000000004b0e5005c9f26025--
