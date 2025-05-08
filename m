Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ED0BC3ABBE
	for <webhook@archiver.kernel.org>; Thu,  8 May 2025 13:04:13 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.14913.1746709448863254996
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 May 2025 06:04:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ob/Zg+TQ;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b1f7357b5b6so554112a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 08 May 2025 06:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746709448; x=1747314248; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QF+H/J8Ri/nW7wWrVV6PBp/wXcK+e/7GluuzSfbZpmA=;
        b=Ob/Zg+TQB6///CwQjZr9+q0OLgm1J+63cMW2JJoJjMW9seXNUxYDi+VQsnbrE6g+SB
         RKkmaWfJitEQFpPl2G3J8mNQl9J/iFrvaw3hK7fh/nZwungrC1DtGp59ZrEW0etyvN8f
         hTybXYOFqQf2ogJoshft+a+NF54QZgsoUCiR93kORR628Y6NUa5stnKeu8lA1Mx1prbu
         gUTzQeAaK1hBRPIgsWbyXse/GoBT8KCOUq/utamEMi5fJy4xqVoGKCVYpeLsuMhq5PzO
         8Cu9V5C+KmcOi/y7eXMyEyeRV35Ctk4uV4L9GuKARjjBmnKB2sUb3jfxlBzm2CCaCrP+
         dToQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746709448; x=1747314248;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QF+H/J8Ri/nW7wWrVV6PBp/wXcK+e/7GluuzSfbZpmA=;
        b=l0Wr7vbqw2b02uXcDunlGIs+nfwzpIce8ldtGGqTZCh7wkBlE7/asS+Bar/dDjqFBz
         4hEbTwCqfqPGTKgnktz5rtR1l6xZOdOi/5q9TJM+jivuP5xLNMYgFz2R0FZcdZxoF32R
         1ZEZWE8dABqsExKY3e80WJhHjmKAUTt3sstImF207JBFfJt6TNzO2pLquZ0cZyELlzzD
         m5Cw+zBVlytdxbdQpxUaTYU2DNH2npygSH+CK3aUAGsT4fecl6Iz74ggshf1WocAoMh1
         OqstRNGuUL/+BNR6rTkuB1FxjEb1fumJlx8RW6DM2y0mE2c8OLSuW6YvRfAp02/adg+h
         3Ndw==
X-Gm-Message-State: AOJu0YxeL0Zy8Y64PPfZk+KG1dP2j8SdJK2wH+pIAWpr43yp5djtZ3iQ
	VWe8CsJMQrn/bmNi+hZKvGZ8oN0Gbh8udnKbq3lP55PppFmG7s+N/O/C9pxg902jG4j1+mdLqE0
	SJQqTn3/GQPcGiAAaunirVP62IV7J9n9G
X-Gm-Gg: ASbGnct9pdFfayZRDWOD/svGHMp+AS/W356I979j0ujFMzAD2BwEMfvtHFyxRkFeyE4
	ol0XlT6mo99MJVawnl0kpNJhVKlawK7cvYPBLkbJgguZ9N84JzgKmH+MWTZ4j3wABL6NGFkVz+R
	yhv3jfyRGagSWKhVga8z4/a85uQlZaVoxG4Q==
X-Google-Smtp-Source: AGHT+IFY1uMJ8/EABqQbw/PKc+lymwybQ7zDhlCv4fsNF/L+A3hs4pLffquRj5WvuTfMHfF7U7uIP9I573iJdPXwwfQ=
X-Received: by 2002:a17:90b:2d06:b0:2ee:c6c8:d89f with SMTP id
 98e67ed59e1d1-30aac19f42cmr12571774a91.14.1746709447736; Thu, 08 May 2025
 06:04:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250507151109.654312-1-bruce.ashfield@gmail.com> <76eb7a8c593616cb502e7ed42084b105b5016f52.camel@linuxfoundation.org>
In-Reply-To: <76eb7a8c593616cb502e7ed42084b105b5016f52.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 8 May 2025 09:03:55 -0400
X-Gm-Features: ATxdqUGksN2cbC4ewW3_NL7z6DPNJLUIsT_lW9zpqvfA_nnnTT0glIbbY_YZP3k
Message-ID: <CADkTA4OCWxdRvyzRDSzv9wPY6j-MkOxO1GYM=Wtp9SLT=7Vf9g@mail.gmail.com>
Subject: Re: [PATCH] linux-yoto/6.12: bsp/arm: fix CONFIG_CRYPTO_LIB_CHACHA
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000028cd4106349f7c10"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 May 2025 13:04:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216151

--00000000000028cd4106349f7c10
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 8, 2025 at 3:19=E2=80=AFAM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2025-05-07 at 11:11 -0400, bruce.ashfield@gmail.com wrote:
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > Integrating the following commit(s) to linux-yocto/.:
> >
> > 1/2 [
> >     Author: Mikko Rapeli
> >     Email: mikko.rapeli@linaro.org
> >     Subject: genericarm64: add CONFIG_CRYPTO_LIB_CHACHA=3Dm
> >     Date: Wed, 7 May 2025 14:43:40 +0300
> >
> >     Fixes CONFIG_CRYPTO_CHACHA20_NEON build as module:
> >
> >     WARNING: [kernel config]: specified values did not make it into the
> kernel's final configuration:
> >
> >         [NOTE]: 'CONFIG_CRYPTO_CHACHA20_NEON' last val (m) and .config
> val (n) do not match
> >         [INFO]: CONFIG_CRYPTO_CHACHA20_NEON : n
> >
> >     Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> >     Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > ]
> >
> > 2/2 [
> >     Author: Mikko Rapeli
> >     Email: mikko.rapeli@linaro.org
> >     Subject: qemuarma15.cfg: enable CONFIG_CRYPTO_LIB_CHACHA
> >     Date: Wed, 7 May 2025 14:43:41 +0300
> >
> >     It's a dependency of CONFIG_CRYPTO_CHACHA20_NEON.
> >     Fixes:
> >
> >         [NOTE]: 'CONFIG_CRYPTO_CHACHA20_NEON' last val (y) and .config
> val (n) do not match
> >         [INFO]: CONFIG_CRYPTO_CHACHA20_NEON : n
> >
> >     Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> >     Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > ]
> >
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > ---
> >
> > Apply this on top of my recent kernel series and the warnings
> > should be gone from the various arm builds.
>
> I think there is a push to yocto-kernel-cache missing as these revisions
> aren't in the repo.
>
> I re-ran my publish steps, everything should be there now (including thos=
e
revisions).

Bruce



> Cheers,
>
> Richard
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000028cd4106349f7c10
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 8, 2025 at 3:19=
=E2=80=AFAM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfounda=
tion.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">On Wed, 2025-05-07 at 11:11 -04=
00, <a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ash=
field@gmail.com</a> wrote:<br>
&gt; From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" t=
arget=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt; <br>
&gt; Integrating the following commit(s) to linux-yocto/.:<br>
&gt; <br>
&gt; 1/2 [<br>
&gt; =C2=A0=C2=A0=C2=A0 Author: Mikko Rapeli<br>
&gt; =C2=A0=C2=A0=C2=A0 Email: <a href=3D"mailto:mikko.rapeli@linaro.org" t=
arget=3D"_blank">mikko.rapeli@linaro.org</a><br>
&gt; =C2=A0=C2=A0=C2=A0 Subject: genericarm64: add CONFIG_CRYPTO_LIB_CHACHA=
=3Dm<br>
&gt; =C2=A0=C2=A0=C2=A0 Date: Wed, 7 May 2025 14:43:40 +0300<br>
&gt; <br>
&gt; =C2=A0=C2=A0=C2=A0 Fixes CONFIG_CRYPTO_CHACHA20_NEON build as module:<=
br>
&gt; <br>
&gt; =C2=A0=C2=A0=C2=A0 WARNING: [kernel config]: specified values did not =
make it into the kernel&#39;s final configuration:<br>
&gt; <br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [NOTE]: &#39;CONFIG_CRYPTO_=
CHACHA20_NEON&#39; last val (m) and .config val (n) do not match<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [INFO]: CONFIG_CRYPTO_CHACH=
A20_NEON : n<br>
&gt; <br>
&gt; =C2=A0=C2=A0=C2=A0 Signed-off-by: Mikko Rapeli &lt;<a href=3D"mailto:m=
ikko.rapeli@linaro.org" target=3D"_blank">mikko.rapeli@linaro.org</a>&gt;<b=
r>
&gt; =C2=A0=C2=A0=C2=A0 Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto=
:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&g=
t;<br>
&gt; ]<br>
&gt; <br>
&gt; 2/2 [<br>
&gt; =C2=A0=C2=A0=C2=A0 Author: Mikko Rapeli<br>
&gt; =C2=A0=C2=A0=C2=A0 Email: <a href=3D"mailto:mikko.rapeli@linaro.org" t=
arget=3D"_blank">mikko.rapeli@linaro.org</a><br>
&gt; =C2=A0=C2=A0=C2=A0 Subject: qemuarma15.cfg: enable CONFIG_CRYPTO_LIB_C=
HACHA<br>
&gt; =C2=A0=C2=A0=C2=A0 Date: Wed, 7 May 2025 14:43:41 +0300<br>
&gt; <br>
&gt; =C2=A0=C2=A0=C2=A0 It&#39;s a dependency of CONFIG_CRYPTO_CHACHA20_NEO=
N.<br>
&gt; =C2=A0=C2=A0=C2=A0 Fixes:<br>
&gt; <br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [NOTE]: &#39;CONFIG_CRYPTO_=
CHACHA20_NEON&#39; last val (y) and .config val (n) do not match<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [INFO]: CONFIG_CRYPTO_CHACH=
A20_NEON : n<br>
&gt; <br>
&gt; =C2=A0=C2=A0=C2=A0 Signed-off-by: Mikko Rapeli &lt;<a href=3D"mailto:m=
ikko.rapeli@linaro.org" target=3D"_blank">mikko.rapeli@linaro.org</a>&gt;<b=
r>
&gt; =C2=A0=C2=A0=C2=A0 Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto=
:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&g=
t;<br>
&gt; ]<br>
&gt; <br>
&gt; Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gma=
il.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; <br>
&gt; Apply this on top of my recent kernel series and the warnings<br>
&gt; should be gone from the various arm builds.<br>
<br>
I think there is a push to yocto-kernel-cache missing as these revisions ar=
en&#39;t in the repo.<br>
<br></blockquote><div><span class=3D"gmail_default" style=3D"font-size:smal=
l"></span></div><div><div class=3D"gmail_default" style=3D"font-size:small"=
>I re-ran my publish steps, everything should be there now (including those=
 revisions).</div><div class=3D"gmail_default" style=3D"font-size:small"><b=
r></div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</div><=
br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
Cheers,<br>
<br>
Richard<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--00000000000028cd4106349f7c10--

