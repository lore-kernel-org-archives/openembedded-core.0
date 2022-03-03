Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3F00C433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 09:58:45 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web08.9169.1646301524722560995
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 01:58:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qonoJxBA;
 spf=pass (domain: gmail.com, ip: 209.85.167.48,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id bu29so7592341lfb.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 01:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TK27VDHQwOQEPiJak069umnMrSAXnowC4f/E/Zexxl4=;
        b=qonoJxBAPYMsd7WGtgORX9KMwKdW6i1TaFQXEZ8whzvJgq/kAi/glQhc2Wp678AJxn
         dhi08pEDxbJeByp6G16aNFS6E8ywGUBuVTtobldTPHNBZv5+IjH1+CK7NVJBnKq9/yEE
         ToEVR4QU0iPIE+jS8C6rSiCQ994McZc/VM9fJg3uDZOJ1EGIYJylYIvgOSgaSfEnB2Tn
         dSX6SECdigD+XHftcFgZS/hIQmdJ+OBRGtxR9nkVgkhaAKXYcyIyXn3Kt1As13KA0o4p
         RFwyRWjGUanFXarlV+L6hs5NiPsQPOP+6z6svYeCCuYC/lZtM15ONmDIpUb7d5rekoBn
         PT6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TK27VDHQwOQEPiJak069umnMrSAXnowC4f/E/Zexxl4=;
        b=tE0IIBhCh6Awp/NyisIV2aSVoqYq4gmAGkrRC//2xc0mMttcharA0uOyhhpevFqUbw
         2KTOGMNjFVfl7VN4NxzrmoDeAyzVNfkQMahqxZrZf5vmQdIS9WRtk6gmQgn4ywVdeoZy
         pRN+vbFStxr6R1TLJQ/y3JL9WSP7GdXF6pbUPiySEmpozrtgIBHzq8jlsS8eWfHZ6BQw
         zPRGbOTyoUhFsSzoons7Zr/YsgI+VlB1Gt4xqdQ6vIiKt2161SJEM8vWN0eklXEim0d6
         7lpzm6BPZEBCnQM8Zc/jturnWDhNqy+6v9s3ghzOIXj3pxavhk4VkwS5clxUsUPq947c
         clAA==
X-Gm-Message-State: AOAM533bsH318yGXCIENqzFxl/wqgruHsv7oxETnLx2yILCa5X0av22F
	1M6YH4MAJu5/yR0bYQtvUtQrAb2RlXNyppG4Zxw=
X-Google-Smtp-Source: 
 ABdhPJz7R+4RuAZftidVf+HR8q6oVlnwzrHBywcNnpgqpcbvznUfu0Q+uPhpGfJaF1oKeozAOuGN5LqXkLQBRZ7kq4k=
X-Received: by 2002:ac2:5dfb:0:b0:443:7baa:aee6 with SMTP id
 z27-20020ac25dfb000000b004437baaaee6mr21177899lfq.324.1646301522680; Thu, 03
 Mar 2022 01:58:42 -0800 (PST)
MIME-Version: 1.0
References: <20220303093324.1663870-1-alex@linutronix.de>
 <20220303093324.1663870-3-alex@linutronix.de>
 <CANPvuRnmai3wQZY-P9PT0z=iYephBnYkwf1E=7qFAuD5vMqjxw@mail.gmail.com>
 <CANNYZj-v0L_gm8d0Wtjcvt+gAVBQE4qMDhAkroTiXThR+ZiaOg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-v0L_gm8d0Wtjcvt+gAVBQE4qMDhAkroTiXThR+ZiaOg@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 3 Mar 2022 09:58:31 +0000
Message-ID: 
 <CANPvuR=_FJOg56R0_m3DvLmzHay9C6f5mouF-s5V-sUtU0++kw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] glslang/spirv: synchronize with the rest of
 vulkan items
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: multipart/alternative; boundary="00000000000073de7805d94d71f5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Mar 2022 09:58:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162643

--00000000000073de7805d94d71f5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Alexander Kanavin <alex.kanavin@gmail.com> escreveu no dia quinta,
3/03/2022 =C3=A0(s) 09:53:

> On Thu, 3 Mar 2022 at 10:45, Jose Quaresma <quaresma.jose@gmail.com>
> wrote:
>
> > Is it possible to add a reference on the commit message for this change=
?
>
> What kind of reference, like a link to some kind of upstream statement?
>

Yes, I think a link is useful.
I only found these issues but nothing official in release notes or
somewhere else.
https://github.com/KhronosGroup/SPIRV-Headers/issues/252
https://github.com/KhronosGroup/SPIRV-Headers/issues/266

Jose


> Alex
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000073de7805d94d71f5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Alexander Kanavin &lt;<a href=3D"mail=
to:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; escreveu no dia q=
uinta, 3/03/2022 =C3=A0(s) 09:53:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On Thu, 3 Mar 2022 at 10:45, Jose Quaresma &lt;<a href=3D=
"mailto:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com<=
/a>&gt; wrote:<br>
<br>
&gt; Is it possible to add a reference on the commit message for this chang=
e?<br>
<br>
What kind of reference, like a link to some kind of upstream statement?<br>=
</blockquote><div><br></div><div>Yes, I think a link is useful.</div><div>I=
 only found these issues but nothing official=C2=A0in release notes or some=
where else.</div><div><a href=3D"https://github.com/KhronosGroup/SPIRV-Head=
ers/issues/252">https://github.com/KhronosGroup/SPIRV-Headers/issues/252</a=
><br></div><div><a href=3D"https://github.com/KhronosGroup/SPIRV-Headers/is=
sues/266">https://github.com/KhronosGroup/SPIRV-Headers/issues/266</a><br><=
/div><div><br></div><div>Jose</div><div><br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
<br>
Alex<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--00000000000073de7805d94d71f5--

