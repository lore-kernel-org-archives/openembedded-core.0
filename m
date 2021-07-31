Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
 by mx.groups.io with SMTP id smtpd.web10.1434.1627699087382250349
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jul 2021 19:38:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=l1vL5EVb;
 spf=pass (domain: gmail.com, ip: 209.85.161.51, mailfrom: krussell7711@gmail.com)
Received: by mail-oo1-f51.google.com with SMTP id k7-20020a4abd870000b029025e4d9b0a3dso2949592oop.6
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Jul 2021 19:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZqAAanMzFX1+qDsiMYwT7tUpTuolSqPj6rIiLPDXpGE=;
        b=l1vL5EVbVyramW6Y0T1SUhLaV1Uhj9cNbxM/GE/xanx1Jy6HvIs3QdAJ6uQR4JcZk9
         Rm9JoUHM1KLKRw2+8xSlUUJgCcMRAiaC729WujB40p0ogRpxxaYxDrkk5SBgwpkLK/UO
         JjHw6MJLvrgVzEqsf83wtT9mrhGxuZmX4vCqohv8CJbJbXfvxNgg1Lbpquvv5DEH84rm
         tGIlWZepr986Vbi/qyUI9Gut7Ttke9cBqzFL6JAHN7dKOMmBuoSpQroOOAj/nc1txQGj
         0Ec7rRfRorSxPbIkHB1IrgZoMeup/DJv3DN1UzRw8Do2OqqnpprB0WFEEvt+nJJSPE4P
         +iyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZqAAanMzFX1+qDsiMYwT7tUpTuolSqPj6rIiLPDXpGE=;
        b=VbcDWIoiwYkgNSDATCoj83avV/tOnr75DSnUPNu828hlBUwy/WZnC9VLWfwNgmvI50
         iX/wBi0yf+1tkDCOU97lRYvYbMBoHjB+A0OnmFsW4IrLCaUbsnwQsVO88B9ogMltboLU
         eztjf2MOh+Q17bedPNNsiN/7EaA8ceL2Dw9mrO2pjSxZtVJtbVRv6CQzHAUN9nUaQlYD
         v+/dAy12IFU8Sc1Xn4V6nNKWmCVcy/l05ExYFLsOnPlQc+T1S8Rs18HlhD1DXp/EX+VA
         lCc/h9YH/3QclYGgFOvlPaY1AA302PLI8H3fBaBYHH9LamFd0RxBpadzXF/uvZIlTo+T
         4qug==
X-Gm-Message-State: AOAM530Gs3bAvFv8KPqc9S7wbsfZeium80RVFW7lhuxTGJ57WHNTjiVs
	k24z+6y3fSIdeatC4O8M35RoA5EtDZIW6YRz5cE=
X-Google-Smtp-Source: ABdhPJz9hyzkaKTRiDSC1Nh4v0a6rw6EDnd/EGXEEVKgqyUuBwLFOOvL4JX/1cQLV1ZM6uycUr1C7CURSItyI4XZqqs=
X-Received: by 2002:a4a:dd91:: with SMTP id h17mr3909151oov.23.1627699086522;
 Fri, 30 Jul 2021 19:38:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210730190357.369782-1-bkylerussell@gmail.com>
 <CABcZANk3YS-mnR8d0ScZA3E4coCa5Zze0UAueJxQjpwO1L1x6A@mail.gmail.com> <2151aa3f6f971841f94e3457cb5c733ca3518ee4.camel@linuxfoundation.org>
In-Reply-To: <2151aa3f6f971841f94e3457cb5c733ca3518ee4.camel@linuxfoundation.org>
From: bkylerussell@gmail.com
Date: Fri, 30 Jul 2021 21:37:54 -0500
Message-ID: <CAFrQVPOA+Pni3SNSBuHRMXLTA4Q29KVrStXN2OFJM1S0N7XHyA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcc-runtime: do_check should execute before do_build
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Christopher Larson <kergoth@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000da7dad05c862396f"

--000000000000da7dad05c862396f
Content-Type: text/plain; charset="UTF-8"

I see. I had forgotten that the autobuilders don't run do_check as part of
the normal build.

We have a customization in our distro layer to run do_check on normal
builds. Internally, we use that as a hook to allow per-package test suites
to fail our integration pipeline during our normal builds. Maybe there's a
way we can prevent this conflict with rm_work from our own layer.

Sorry for the confusion,

Kyle


On Fri, Jul 30, 2021, 5:06 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2021-07-30 at 14:16 -0700, Christopher Larson wrote:
> > This will result in a behavior change, making it so `bitbake
> gcc-runtime` will
> > run the check task. Are there implications to this?
>
> We definitely do not want to do that. This is used to run the testsuite
> which
> isn't part of a normal build.
>
> Cheers,
>
> Richard
>
>

--000000000000da7dad05c862396f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>I see. I had forgotten that the autobuilders don&#39=
;t run do_check as part of the normal build.</div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto">We have a customization in our distro layer to run do_=
check on normal builds. Internally, we use that as a hook to allow per-pack=
age test suites to fail our integration pipeline during our normal builds. =
Maybe there&#39;s a way we can prevent this conflict with rm_work from our =
own layer.<div dir=3D"auto"><br></div><div dir=3D"auto">Sorry for the confu=
sion,</div><div dir=3D"auto"><br></div><div dir=3D"auto">Kyle</div><br><br>=
<div class=3D"gmail_quote" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_att=
r">On Fri, Jul 30, 2021, 5:06 PM Richard Purdie &lt;<a href=3D"mailto:richa=
rd.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">On Fri, 2021-07-30 at 14:16 -=
0700, Christopher Larson wrote:<br>
&gt; This will result in a behavior change, making it so `bitbake gcc-runti=
me` will<br>
&gt; run the check task. Are there implications to this?<br>
<br>
We definitely do not want to do that. This is used to run the testsuite whi=
ch<br>
isn&#39;t part of a normal build.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div></div></div>

--000000000000da7dad05c862396f--
