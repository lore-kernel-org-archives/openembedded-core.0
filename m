Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD00BC021B2
	for <webhook@archiver.kernel.org>; Thu, 20 Feb 2025 20:58:18 +0000 (UTC)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
 by mx.groups.io with SMTP id smtpd.web10.7969.1740085092831588804
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Feb 2025 12:58:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J5ae10I4;
 spf=pass (domain: gmail.com, ip: 209.85.222.51, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-868f322b8dfso868762241.0
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 12:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740085091; x=1740689891; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LjxPlRM64ccqb5CvFq1xRCrdWQILf4Nvpw+Adl8DICA=;
        b=J5ae10I4otwLPCvUdRFeOWN2SKjJgUce7onO92RY3Oyya7Atw1v/DnPxIddKB9OrjD
         w7UAfPwtywaRHhYF8tSjTUhv6S+qqrkOTbnuuakz+SauHBTbI6j4dP4Ti8TPMa0f67jr
         7NSR7vKSr960lLJ7d2M4PCw+l9m0Aq+vgaeMhsTn/JRVsPwEXZFyEogPaL6/UTELljLQ
         EiqE99pgzXM/PTHaoScSUDmxXzDjQ+qQoVRx6Nn3Plh1kowjTedH8+K32EVw2kK7vZ5M
         GiXqhpHZX3J8nrCcT1+I7kr1iGuHrbYsERoLkemrFLCzPnsldCEDMJLfX1sPCaJVbfzm
         uWOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740085091; x=1740689891;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LjxPlRM64ccqb5CvFq1xRCrdWQILf4Nvpw+Adl8DICA=;
        b=qCipqT5MQXv39uuSeuT0zU7k7QqRjYYmnVwY4fcxVb3AlviWjAnVxbnoVApqzRresD
         ujCvr338xOjSvSWO2Ke/pQCilC3fvf96uDJAS+p8gs5cSu0tP6GRonB8YyDdYI5vUnDf
         Ycq/pcllOWw/ImS6mvLZHHj/QAb7P90ve6a9c2+Ra/xVtAlygQgX8FUaLqHsKCEOdXRY
         M7bjOgxxgkEoTxcpwfADlj34lhxkq5ZOw153hI1lp/cFO6lVY6fU3v7ses5Dk5ejlrXP
         ywijrhIjV1tmDLYJUDElgC2mJ+6P3BcPeuRLm+FUdGS3HX4I4v+bklt9IWEELy6h5H/s
         z0/A==
X-Gm-Message-State: AOJu0Yz1AqN+0fmSHSlDJLWhhK014A8WPTMvbK6G+5M4wjC4GioZs0zs
	jcU2EqiBiSgI3dwgDNPvRhV4XWuVdHwWWcGQ177AW7YGnrC9Fs7dFsR5R6GnLbumcHhYZPShIEg
	T8H/aNFMmODluGgye67rGJM5ZJmM=
X-Gm-Gg: ASbGncsGMsIiGEYyS7N1EBFIH0WXqMu2lnrbYBMJkYl4XyOoBTdrBWkYiIX76oiRWmU
	O/t4P7aRkySccj8VbLw/6zSFu75GKrL1ewYo6T6c9eWBja3Q8fKewisySdYqGnu9h3FnBBlc67C
	8=
X-Google-Smtp-Source: AGHT+IHZ7ZpW06dGsuUvuX84qp0YxGVwItZkNHI/jj1cQ6z1haVP29HJsGG6mcCG1/3gM+tDu5wKKp572N6SU59wU9Q=
X-Received: by 2002:a05:6102:304b:b0:4bd:860f:ff2 with SMTP id
 ada2fe7eead31-4be99122626mr2455783137.4.1740085091510; Thu, 20 Feb 2025
 12:58:11 -0800 (PST)
MIME-Version: 1.0
References: <20250220144012.27057-1-l.anderweit@phytec.de> <16618.1740079324041661447@lists.openembedded.org>
In-Reply-To: <16618.1740079324041661447@lists.openembedded.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 20 Feb 2025 20:58:00 +0000
X-Gm-Features: AWEUYZkOsFD0WRoljCo4UTptdVUwAbHGHvwyPbBMjcvgNZkI4QEL00ou1qlCu7o
Message-ID: <CANPvuRnE2ibqVLZN3xM81TG0RO7qus9EiZh=dT0VVaCRwtSPUw@mail.gmail.com>
Subject: Re: [OE-core] [RFC] uboot-sign: Fix u-boot dtb signatures
To: rogerio.borin@toradex.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c22fb4062e99219a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 20:58:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211776

--000000000000c22fb4062e99219a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Leonard,

I tested it on a couple of machines on my side and it fixes the regression.

Tested-by: Jose Quaresma <jose.quaresma@foundries.io>

Thanks for working on the solution.

Jose

Rogerio Guerra Borin via lists.openembedded.org <rogerio.borin=3D
toradex.com@lists.openembedded.org> escreveu (quinta, 20/02/2025 =C3=A0(s)
19:22):

> Hi Leonard,
>
> I've tested your patch and I wanted to let you know it worked fine for me
> both when FIT_SIGN_INDIVIDUAL=3D"1" or "0". I've checked the contents of =
the
> u-boot dtb (for the presence of the required pubkeys) and the fitImage (f=
or
> the signatures) and the results match what we had before commit d7bd9c627=
66
> ("u-boot: kernel-fitimage: Fix dependency loop if UBOOT_SIGN_ENABLE and
> UBOOT_ENV enabled").
>
> As for the patch, since the understanding is that when
> FIT_SIGN_INDIVIDUAL=3D"1" the individual images will be signed besides th=
e
> signing of the configurations then I'd say that sentence in the comment
> "Signing individual images is not recommended as that makes fitImage
> susceptible to mix-and-match attack" seems unnecessary/misleading to me
> since it gives the impression that one would get either images or
> configurations signed.
>
> As for the check performed at build time by the "fit_check_sign" tool, th=
e
> fact that now the check is done only on the configuration doesn't seem li=
ke
> a big loss to me. Though I imagine the ideal solution would be to have th=
at
> check on the final fitImage rather than on a temporary one (unused.itb) i=
n
> order to provide stronger guarantees that the image is correctly signed.
> However, this would likely complicate things which may make it not worth
> the effort...
>
> Regards
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#211775):
> https://lists.openembedded.org/g/openembedded-core/message/211775
> Mute This Topic: https://lists.openembedded.org/mt/111289801/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000c22fb4062e99219a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Leonard,<br><br>I tested it on a couple of machine=
s on my side and it fixes the regression.</div><br>Tested-by:=C2=A0Jose Qua=
resma &lt;<a href=3D"mailto:jose.quaresma@foundries.io">jose.quaresma@found=
ries.io</a>&gt;<br><br>Thanks for working on the solution.<br><br>Jose<br><=
br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=
=3D"gmail_attr">Rogerio Guerra Borin via <a href=3D"http://lists.openembedd=
ed.org">lists.openembedded.org</a> &lt;rogerio.borin=3D<a href=3D"mailto:to=
radex.com@lists.openembedded.org">toradex.com@lists.openembedded.org</a>&gt=
; escreveu (quinta, 20/02/2025 =C3=A0(s) 19:22):<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div>Hi Leonard,</div>
<div>=C2=A0</div>
<div>I&#39;ve tested your patch and I wanted to let you know it worked fine=
 for me both when FIT_SIGN_INDIVIDUAL=3D&quot;1&quot; or &quot;0&quot;. I&#=
39;ve checked the contents of the u-boot dtb (for the presence of the requi=
red pubkeys) and the fitImage (for the signatures) and the results match wh=
at we had before commit d7bd9c62766 (&quot;u-boot: kernel-fitimage: Fix dep=
endency loop if UBOOT_SIGN_ENABLE and UBOOT_ENV enabled&quot;).</div>
<div>=C2=A0</div>
<div>As for the patch, since the understanding is that when FIT_SIGN_INDIVI=
DUAL=3D&quot;1&quot; the individual images will be signed besides the signi=
ng of the configurations then I&#39;d say that sentence in the comment &quo=
t;Signing individual images is not recommended as that makes fitImage susce=
ptible to mix-and-match attack&quot; seems unnecessary/misleading to me sin=
ce it gives the impression that one would get either images or configuratio=
ns signed.</div>
<div>=C2=A0</div>
<div>As for the check performed at build time by the &quot;fit_check_sign&q=
uot; tool, the fact that now the check is done only on the configuration do=
esn&#39;t seem like a big loss to me. Though I imagine the ideal solution w=
ould be to have that check on the final fitImage rather than on a temporary=
 one (unused.itb) in order to provide stronger guarantees that the image is=
 correctly signed. However, this would likely complicate things which may m=
ake it not worth the effort...</div>
<div>=C2=A0</div>
<div>Regards</div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#211775): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/211775" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/211775</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/111289801/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/111289801/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></=
div></div></div>

--000000000000c22fb4062e99219a--

