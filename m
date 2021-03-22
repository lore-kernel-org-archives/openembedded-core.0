Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
 by mx.groups.io with SMTP id smtpd.web09.13242.1616421994556718092
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Mar 2021 07:06:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OK7737zW;
 spf=pass (domain: gmail.com, ip: 209.85.217.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f53.google.com with SMTP id z68so7511933vsb.10
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Mar 2021 07:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=z1NmBF5Egu3wP1BOyX81cP5Q+ZLI+3+DImQMbqySasQ=;
        b=OK7737zWNf3m1cMGIXQHTVOm4loNUZGO/p1p0jl1UcM9NqtjQ8If0rEyltu1u4hiyZ
         zytYCmqoa/U9rUDUJDXA5odYQCMiK0bD7cv+Q8cq+NSYPIxlrEhMD36Tpx2z7aRuDlVV
         OjL3n16HwX7DL1Vks9z9wEfYgrsXC8VPXhpgX9gA/CZTPHnY4VNRyuO9pgVTdTm0aMSn
         6rQv0bS284/0tIbcUZ8Qw95U4iLkVy5Lj8/lsERaB3F/VT/e4GUiBemQ3H14HEuBrZkT
         d+wsy499CMYyOfKNCJKx4sqpkCv97hJJOwwP1F+9TJnkvJe9MA5yJGENtG81cZAV/LoY
         C/Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z1NmBF5Egu3wP1BOyX81cP5Q+ZLI+3+DImQMbqySasQ=;
        b=iDvoiVyPTO38cmBqvo4wiSkgsS9ZHkywy66/HfGlprtapvPvVYzshd0pveVp/Bjj19
         QjvsQSrfVL+wsLU60IraTTk++0FX2hVpF8EmOWnzIBm0/F/HxdE7zo/BAO5pQF3XUBXn
         4qMLNILOl0Hh+mXyA0gp6ZhU2hPSbySuL2pS6pWEBZPjHrwx35g6BQrchQne5uw9ubtR
         x+1gAJrfiJoNlOdn5k28/+cslAnWsga0dZ01Ytrx9PNh4N7qk+e4w4Wg4j2K8i7Toj6e
         7Pjl8koOR/FMnG0UlQf2PHXiF7sP2UUYNP+b/yxS7wglPhW5EqpY0kmvGR2jMcaFbNBd
         HLvA==
X-Gm-Message-State: AOAM532C/my97Ac4ddR3yUj2PgeqxiIoGV8Th8pgEGOqGfxrPx++YWK8
	+ZGaioYLqrYaiWJTpYK5W0Vaj7aCO1suR4IWPec=
X-Google-Smtp-Source: ABdhPJzWTgoR50eKCQMHMba1lfoCZYUYkbppwWuGjYl5b0wy+aH15BnU5IffXR/n25QzkJ265tdAJQI1Os68cLJTXmw=
X-Received: by 2002:a67:33d8:: with SMTP id z207mr8729829vsz.54.1616421993596;
 Mon, 22 Mar 2021 07:06:33 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj-+6z3RJQR2eo2_zj9HExHhtGx=oZRa+aLK4mBD-gAV0g@mail.gmail.com>
 <32114.1616413272768671921@lists.openembedded.org>
In-Reply-To: <32114.1616413272768671921@lists.openembedded.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 22 Mar 2021 17:06:23 +0300
Message-ID: <CANNYZj-Tt8cZLtb6EJP+80t-scOh8n65S=ahNbMBGWhkckzzew@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rootfs.py: mask run-postinsts systemd service when unneeded
To: Awais Belal <Awais_Belal@mentor.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000bc4c2a05be209298"

--000000000000bc4c2a05be209298
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Right, I guess I was missing the context where the patch is applied: "if
delayed_postinst is None" inside uninstall_unneeded(). Perhaps you could
expand the commit message a bit, and say specifically what is the scenario
when this is executed ("not needed" is somewhat vague).

Then no separate test is necessary.

Alex

On Mon, 22 Mar 2021 at 14:41, Awais Belal <Awais_Belal@mentor.com> wrote:

> Hi Alex,
>
> Why isn=E2=80=99t this seen in the tests? Can you add a test that shows =
the issue
> please? (Fails without the patch, passes with)
>
> I'm not very well versed with the oe test infrastructure, I'd be happy t=
o
> create a test for this scenario if you can point me to the material that=
 I
> need to go through in order to be able to create a test for this. Howeve=
r,
> if you want me to summarize this tends to fix the issue where the system=
d
> run-postinsts.service is run at the target even when not needed (no pend=
ing
> postinsts are found during build).
>
> I do need to send a v2 for this as there's a slight issue in the patch.
>=20
>
>

--000000000000bc4c2a05be209298
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Right, I guess I was missing the context where the patch i=
s applied: &quot;if delayed_postinst is None&quot; inside uninstall_unneede=
d(). Perhaps you could expand the commit message a bit, and say specificall=
y what is the scenario when this is executed (&quot;not needed&quot; is som=
ewhat vague).<div><br></div><div>Then no separate test is necessary.</div><=
div><br></div><div>Alex</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, 22 Mar 2021 at 14:41, Awais Belal &l=
t;<a href=3D"mailto:Awais_Belal@mentor.com">Awais_Belal@mentor.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Alex,<=
br>
<blockquote>Why isn=E2=80=99t this seen in the tests? Can you add a test t=
hat shows the issue please? (Fails without the patch, passes with)</blockqu=
ote>
I&#39;m not very well versed with the oe test infrastructure, I&#39;d be h=
appy to create a test for this scenario if you can point me to the material=
 that I need to go through in order to be able to create a test for this. H=
owever, if you want me to summarize this tends to fix the issue where the s=
ystemd run-postinsts.service is run at the target even when not needed (no =
pending postinsts are found during build).<br><br>I do need to send a v2 fo=
r this as there&#39;s a slight issue in the patch.
<br>
<br>
<br>
</blockquote></div>

--000000000000bc4c2a05be209298--
