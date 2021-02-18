Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.1582.1613675735119934811
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Feb 2021 11:15:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=L/o+Yh90;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: jatedev@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id z6so1976041pfq.0
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Feb 2021 11:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=r94Jju7NDnlN+bGNbVs2JB+0N0j1YVakujv821HCL6w=;
        b=L/o+Yh90h4dw3hzQdSeYXGbizcvTaIhC0bwR81vZfXG/BgCHG1fR4G4A9y0IU0N1jO
         OcDLXM1Q4rJPR448tGL6XJgwc93iO69XHT5iYsCFoqEUAmbk59Kji9GYMkI2BEifYeWS
         AJwf4L2STuArKrAQKmdO6Tgsrcu7kl70Ybn6QRpRoI1PJnqN/x5pkgSzy3j9GU7gLCkf
         k2s7EkSWEiBcS9+Npf7dfHXsbINWZL1N/qTh6KShqmLltGoh/iWs0kxbF2Fo1+0g+q1j
         P0XNAo6Jm1kdr/1mllbwY2mcBjrj+VQ82l4o35zpRb284xz/X+RmuY/RKD/ZmkY0ruAT
         MneA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r94Jju7NDnlN+bGNbVs2JB+0N0j1YVakujv821HCL6w=;
        b=lVl28yTVlVi4SuONQ0fiBsWQFSmHCJ15GaXxobqgVKuuosFv4jLP8NEFel31WjI68L
         CVFST7chpaCeD+dZDo/FHcduW3kHvXB4Jcl1qJ6IPthV2BaOcEpQ+skQTUx7410gsg8y
         z0vLmvsEnU/vb7b38UxDc/KYsCo9GHKIrmvzOSOB+21Wo9FWk1wZqBUmdOIB5JY5j4B/
         MCymdFNG6RGDPKFFp2wOMdV977Qu53Ln6yRFrZRYiVh0Dy/VrpeYHbwMYCbZH8NvqUdz
         IBWolOmJ/YA4B8d9P+76opOUqxxS3fctNjG0rU/GuAUCtvCx70tAA/LQ5Fg+SvJ/SFl0
         cRuw==
X-Gm-Message-State: AOAM53325Ct6rpLt4W8tIwdyhEDng6/GVePi9z4UXkj55MfJBI+Z4z5k
	ooDLf8kOSv9d1BWlMlqX/px2SQ7cQB/0wrKz9GM=
X-Google-Smtp-Source: ABdhPJy5nZkjvAdAHEDZ0jlubMsGpmjfZD8/1fUpoDugerywBFaYmblDtr/7Jo87HcLm6FIYE5FgSb7QshQScsjCb/I=
X-Received: by 2002:a63:1c13:: with SMTP id c19mr5061891pgc.359.1613675734717;
 Thu, 18 Feb 2021 11:15:34 -0800 (PST)
MIME-Version: 1.0
References: <20210218001126.39215-1-jatedev@gmail.com> <daffe2a0221518c5f37419003b2107a440a1f9fa.camel@linuxfoundation.org>
In-Reply-To: <daffe2a0221518c5f37419003b2107a440a1f9fa.camel@linuxfoundation.org>
From: "Jate Sujjavanich" <jatedev@gmail.com>
Date: Thu, 18 Feb 2021 14:15:23 -0500
Message-ID: <CAPphmgbOUBU_XZ7D8-f7wPk3J1OLXiv9TB9PHAVhCOGdpQow_Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] iputils: Use STAGING_DIR_NATIVE for setcap detection
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f35a0905bba12814"

--000000000000f35a0905bba12814
Content-Type: text/plain; charset="UTF-8"

The iputils build will try to make the binaries callable by regular users
using setcap or setuid depending on what is available on the system. It
turns out that libcap provides this command. I figured that adding the
dependency on libcap-native and having meson search STAGING_DIR_NATIVE
would work. If libcap is not on in PACKAGECONFIG, then it falls back to
setuid. The script which does this is build-aux/setcap-setuid.sh.

This will become more apparent in version 2 which will contain the missing
a patch file.

- Jate

On Thu, Feb 18, 2021 at 11:35 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2021-02-18 at 00:11 +0000, Jate Sujjavanich wrote:
> > Search for setcap in STAGING_DIR_NATIVE to avoid host contamination. Add
> > DEPENDS for libcap-native to supply this if we select libcap for
> > PACKAGECONFIG.
>
> Why does it need setcap-native, isn't the target setcap enough? It seems
> odd that it should need it...
>
> Cheers,
>
> Richard
>
>

--000000000000f35a0905bba12814
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>The iputils build will try to make the binaries calla=
ble by regular users using setcap or setuid depending on what is available =
on the system. It turns out that libcap provides this command. I figured th=
at adding the dependency on libcap-native and having meson search STAGING_D=
IR_NATIVE would work. If libcap is not on in PACKAGECONFIG, then it falls b=
ack to setuid. The script which does this is build-aux/setcap-setuid.sh.<br=
></div><div><br></div><div>This will become more apparent in version 2 whic=
h will contain the missing a patch file.</div><div><br></div><div>- Jate<br=
></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, Feb 18, 2021 at 11:35 AM Richard Purdie &lt;<a href=3D"mailt=
o:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On =
Thu, 2021-02-18 at 00:11 +0000, Jate Sujjavanich wrote:<br>
&gt; Search for setcap in STAGING_DIR_NATIVE to avoid host contamination. A=
dd<br>
&gt; DEPENDS for libcap-native to supply this if we select libcap for<br>
&gt; PACKAGECONFIG.<br>
<br>
Why does it need setcap-native, isn&#39;t the target setcap enough? It seem=
s=C2=A0<br>
odd that it should need it...<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div>

--000000000000f35a0905bba12814--
