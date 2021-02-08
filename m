Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web12.793.1612811473324554531
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 11:11:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VcTyhgYP;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id y8so20014311ede.6
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Feb 2021 11:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qDc6hlRWZF1Mdn9hluh0rWR2IjhRGriwTglUhz/5+PE=;
        b=VcTyhgYPe6o1xqqN5VJ9liJl8op5M2vEh8Pg7t/aj9pJ2WCryyyZLd5HW5xmiMRRk1
         dexMO+WwmjkrRmjnyvpbSOeDEhMNOv4QM7mSJXr4nmTU9JNRjk1LLKVF8BXotCsX2uNM
         SJv4tONaTPEXVnwOcZeI+UTX9xspwCuyNQy3cFDAoNLVjux5WbedZzkXvzK4uBFXHKiz
         gOCkJAdyGNMPlIJRVwtkVifM2BA9vAJcmaVtTiaJYRfkkRI3syZrRQIymgLNIJJdlWHI
         xDMAQDaAH7lQRaA5RFo8jX3IKBKnXXoKSI8doFRlpVZtwCfLRHcHmIH7sO6HDBa86kuO
         w5kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qDc6hlRWZF1Mdn9hluh0rWR2IjhRGriwTglUhz/5+PE=;
        b=FyM1XXubi/IUmX0N4uIW5DsmfZME6oXbxaKfL8qTieZ4/phPEFc+gxIxyn/Bx4hgjV
         S0j53qr1W5mDns/5K5Oe0fslCZ32LQrGv8TwVnqyEVj9CBj8ioXfK5q1HE4dc12LXDUq
         ZSS0rMApEVOuh7UqMv5YzdAUK8MJsTDotX6A6pyHi73S5Bq3H1+IckT37WQTMm/R33X7
         knJp0v39K4ggF3v8n7P9UN9dYnZNOgeDVGzO/8Gmpb1uYO2Y0TwSYM2gnFKzvCjqFafT
         9ykL6lquxlMsyLdXsWrDX3yCFNsln3p6BHvTR7ahnMEWlS6fXeV57GBS7r8xL39fbW81
         8jpw==
X-Gm-Message-State: AOAM531fh9Yd8gPbTo8AGKMQvf5XGgK4PRF22E7n2am27jI75WfZXz3f
	qaey+Er/aLSjRnEHbq1QnSNN4w3HIPSqf4AMDDY=
X-Google-Smtp-Source: ABdhPJz3rJDr599Ca9yUGEC2wrTJbj7zuHlHDpbLouGQV1KeQdhkDttcU4YcTaii2rNaJP/UJEzNEEVJa71JW872wYc=
X-Received: by 2002:a05:6402:2053:: with SMTP id bc19mr18198692edb.230.1612811471803;
 Mon, 08 Feb 2021 11:11:11 -0800 (PST)
MIME-Version: 1.0
References: <20210208180747.12546-1-yoann.congal@smile.fr>
In-Reply-To: <20210208180747.12546-1-yoann.congal@smile.fr>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Mon, 8 Feb 2021 20:11:00 +0100
Message-ID: <CA+chaQfTpihqNma3-_aNNwZJRyMa0aqMuqkq7y4HhbmUFt_dGQ@mail.gmail.com>
Subject: Re: [OE-core] [meta][PATCHv2] npm.bbclass: avoid building target nodejs for native npm recipes
To: Yoann Congal <yoann.congal@smile.fr>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ddd8f005bad7ee67"

--000000000000ddd8f005bad7ee67
Content-Type: text/plain; charset="UTF-8"

You need the override after the append/prepend operator and append is more
common than prepend (order of RDEPENDS isn't important) so I would use:

RDEPENDS_${PN}_append_class-target = " nodejs"

On Mon, Feb 8, 2021 at 7:08 PM Yoann Congal <yoann.congal@smile.fr> wrote:

> The current recipe unconditionally RDEPENDS on nodejs (the target one).
> When building on the "-native recipe" of "BBCLASSEXTEND native" recipe,
> the target nodejs is unnecessarily built.
>
> This patch fixes this by only RDEPENDS on nodejs when building for the
> target.
>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>  meta/classes/npm.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
> index 79f55febcc..ac49aa4cda 100644
> --- a/meta/classes/npm.bbclass
> +++ b/meta/classes/npm.bbclass
> @@ -20,7 +20,7 @@
>  inherit python3native
>
>  DEPENDS_prepend = "nodejs-native "
> -RDEPENDS_${PN}_prepend = "nodejs "
> +RDEPENDS_${PN}_class-target_prepend = "nodejs "
>
>  NPM_INSTALL_DEV ?= "0"
>
> --
> 2.20.1
>
>
> 
>
>

--000000000000ddd8f005bad7ee67
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>You need the override after the append/prepend operat=
or and append is more common than prepend (order of RDEPENDS isn&#39;t impo=
rtant) so I would use:</div><div><br></div>RDEPENDS_${PN}_append_class-targ=
et =3D &quot; nodejs&quot;</div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Mon, Feb 8, 2021 at 7:08 PM Yoann Congal &lt;<=
a href=3D"mailto:yoann.congal@smile.fr">yoann.congal@smile.fr</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The current re=
cipe unconditionally RDEPENDS on nodejs (the target one).<br>
When building on the &quot;-native recipe&quot; of &quot;BBCLASSEXTEND nat=
ive&quot; recipe,<br>
the target nodejs is unnecessarily built.<br>
<br>
This patch fixes this by only RDEPENDS on nodejs when building for the tar=
get.<br>
<br>
Signed-off-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" t=
arget=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
---<br>
=C2=A0meta/classes/npm.bbclass | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass<br>
index 79f55febcc..ac49aa4cda 100644<br>
--- a/meta/classes/npm.bbclass<br>
+++ b/meta/classes/npm.bbclass<br>
@@ -20,7 +20,7 @@<br>
=C2=A0inherit python3native<br>
<br>
=C2=A0DEPENDS_prepend =3D &quot;nodejs-native &quot;<br>
-RDEPENDS_${PN}_prepend =3D &quot;nodejs &quot;<br>
+RDEPENDS_${PN}_class-target_prepend =3D &quot;nodejs &quot;<br>
<br>
=C2=A0NPM_INSTALL_DEV ?=3D &quot;0&quot;<br>
<br>
-- <br>
2.20.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000ddd8f005bad7ee67--
