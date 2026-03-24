Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0780AF532C0
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 00:25:44 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9398.1774311927219070958
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2026 17:25:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=d6RR/fXg;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-35bb7afdc38so380261a91.1
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 17:25:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774311927; cv=none;
        d=google.com; s=arc-20240605;
        b=YKX25GVx+q416lvi3/WCedOo8xjIdJ2bQofR4qY9OW/6HofAL0WEfgF1pBfPMvCO5E
         XBk7T39kc3kK7o8VmupphD9gpUixh8INUQbFHIAFzQIH/W3STk2QPNe/Zp9KpG7fVn2P
         66Z8k7bdzvbDalGl4Ge2W/sIAWMQdcDka4miAmWABe54D2urLNR7XeI7g6o890dZpQ+E
         sHk0iZN0MujtfEQ39TDZpIpGEfnnoGqNCUBFpGyB+52A3ghxVu8oUrue+fXwnNr+YKIG
         VorOAjbdVZiH39/Ojzj7AQkUgrMEq5TgC5Wj0WEuAfwawQjO6TaAG2n3fej8CspbyZT4
         KKDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/jkn8mKL7yivTQj+A2Hcd2krjw7UVdZV72oVUMLvX1w=;
        fh=Tyc0Jk2T+8fGWDixU3qFe8BDCZOG+4XtkeWc0U40ryA=;
        b=CXOiVu7K0f/kK7zFk8NfBEQ0zBT17qDtMk1vyilXgYX0JQ3qnptxnTfDgwN8RReNuz
         WUEugnUuGRVkCmjbabXVGJGmjjQsvIEpl0CB484TpjBQQZlK6uoo3tEmfRWQk9Lgc7hn
         1TnUJX0Xj2GenizXH3JKS65gpIg2FCIFPLI5BCFChdUw+4dFIPdLdy6AYEBEMz0qq0e1
         c+8tDMf3Chz+Ej1uSPwuN3Iwpu5K+xy7RBdvI8CAO3y4N66qNOznhXisRB0krFihGii2
         ZC8FnKyP0Q0veD1++OmIVfadSXJS0XnAagBf/yXd8cwrAX87ATzIEf5u12L4zhQZ6Hba
         RzCg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774311927; x=1774916727; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/jkn8mKL7yivTQj+A2Hcd2krjw7UVdZV72oVUMLvX1w=;
        b=d6RR/fXgne+sjrjVXTfV62An3l5OMzFDv3Juthx/YP+n7ASaD8kS4vr9DEZdnuG8ON
         Nz1BdA1PEL2W73kNu8BJuN7i7mBwxWqKweMHMukjyBvWh1HkgUMWckr9rYyGEerMIcpT
         TVExpGcrQAbaBdiiQFAtESXxKtXDt+ZYRV8j70QDtC0PWbdLcJ5tOEzpbPx0KGLDkxMz
         GnajYEieJjGpghtMnlVVjPVG2w/0gvtoaq98ohXUjc98DxNAEkPC0qCVV8q9Ctshn0gx
         B37civLWdtmQiI4JcJoP9V60sYZoA5obwU6Tk4V2jKahbAIJUI/9SfbGb/Zgj3P73SOL
         tY9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774311927; x=1774916727;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/jkn8mKL7yivTQj+A2Hcd2krjw7UVdZV72oVUMLvX1w=;
        b=Hfvden7lXwC8n6EZ7wn8fQn+8O3HvkhuFOAxcaQrkkrwRvvQTeX911Jp+IRSmhBYx6
         vF+c6FfSLnIBHTyVuG5PKuoSvUnyw2TX3dGfevsk9yygABVwNKSG5feJ/XTMnVZabyzu
         nMtdI9cx18q/sUzxWtUeJYmTlNp/QuR+T/c5WXawc+qNw0mX3OKdKzGEkCgFixVBUsdR
         AXEqa597lp87axoPLxNEk6hv5V3wBU+Bl8F+HnaaCOTBR3uYeQntExoZNlLulb9AKb9s
         uW/8Pm4dCpVE+SY00qFBGRNQfX9aAf9qHIQ6lpBAGzwjcq2oODYyUcoEAM4qQvUxCkZY
         mYnA==
X-Gm-Message-State: AOJu0Yxe9U+WZ7fBQ4Q4igEUJM67M7jvr2VuKFUIs7S+MWAIQ/wSloVQ
	nBkYmIfO3CzRcpSjFh+q3y8W3wnMVHTorKoGvo/avv/t5JSx15WQcIcF0iAgy6ZYIYF4aayVmey
	aaHD+TtDTQYiUIOp0ikrr+qMMQogKobs=
X-Gm-Gg: ATEYQzx4Ofy2gfdguKo0P7KLLii/sAp9Jqk3Xpx9D6IHBt7czWZ/DaiWl+t1R9QmJsQ
	szKJbt7e1pUtEy566idmsq0yCJAXzt8BLYYrhkfExdYjcCK+W7L4ugoUWeXjK4jj9VMtqkCs6u9
	YHvlArFKP45hvu4d58dXhJvebuRdCHqO3rb93s+4m8DLKbhBKzDeoTnZI5PYs3HKQHR/Rlgk38O
	dQR0FiPKzfHZvUM5W+tiDQD4xoAd0bxwURNokT7T30srhVxq3tURSz2U6BR3xWWE41fCicqlGCP
	cKyJpR3w4VpupSXCW9+uciqeMYQVr552sNVmwSNp
X-Received: by 2002:a17:90b:3d01:b0:35b:9896:cbcd with SMTP id
 98e67ed59e1d1-35bd2d0c8afmr10272644a91.27.1774311926369; Mon, 23 Mar 2026
 17:25:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260323135057.1605923-1-bruce.ashfield@gmail.com>
 <20260323135057.1605923-9-bruce.ashfield@gmail.com> <b0ecbbaf6756c64d6581102e7c6fce1725c40273.camel@linuxfoundation.org>
In-Reply-To: <b0ecbbaf6756c64d6581102e7c6fce1725c40273.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 23 Mar 2026 20:25:15 -0400
X-Gm-Features: AaiRm500d7IL1zTo1ilw04G1YPrT2n2D5PNsmdixGq9ghoIYElxR7d8oG_yEQXQ
Message-ID: <CADkTA4N67FpQKr3SkiMRHr5K_oLe5Mmx4DqEoX4weD04XxsD-A@mail.gmail.com>
Subject: Re: [meta][PATCH 08/11] linux-yocto/6.18: update to v6.18.19
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001791e9064dba3099"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 00:25:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233770

--0000000000001791e9064dba3099
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 6:15=E2=80=AFPM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2026-03-23 at 09:50 -0400, bruce.ashfield@gmail.com wrote:
> > -SRCREV_machine ?=3D "d8bda5bce522d27c0e71c9190ca1d6fe4ce8c580"
> > -SRCREV_meta ?=3D "1ee48237bcd76936b5fb21bcd3b9202faa25e18b"
> > +SRCREV_machine ?=3D "1fa8fa91abea837d76ab91c972e8387aae78157e"
> > +SRCREV_meta ?=3D "899d5e6d3dd929b52ec2acc5b81e317444279f19"
>
> I'm not sure 6.18.19 was pushed to yocto-kerne-cache? 899d5e6 doesn't
> seem to be there.
>
>
odd.

But yes, I had a machine with an ssh timeout. When I push to linux-yocto
for both content and tags, it is quite slow. I was doing a build at the
same time
so it may have forced a timeout!

Bruce




> We're seeing missing revisions in testing:
>
> e.g.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3492/s=
teps/20/logs/errors
> from
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3492
>
> Cheers,
>
> Richard
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000001791e9064dba3099
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 23, 2026 at 6:15=
=E2=80=AFPM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfounda=
tion.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">On Mon, 2026-03-23 at 09:50 -04=
00, <a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ash=
field@gmail.com</a> wrote:<br>
&gt; -SRCREV_machine ?=3D &quot;d8bda5bce522d27c0e71c9190ca1d6fe4ce8c580&qu=
ot;<br>
&gt; -SRCREV_meta ?=3D &quot;1ee48237bcd76936b5fb21bcd3b9202faa25e18b&quot;=
<br>
&gt; +SRCREV_machine ?=3D &quot;1fa8fa91abea837d76ab91c972e8387aae78157e&qu=
ot;<br>
&gt; +SRCREV_meta ?=3D &quot;899d5e6d3dd929b52ec2acc5b81e317444279f19&quot;=
<br>
<br>
I&#39;m not sure 6.18.19 was pushed to yocto-kerne-cache? 899d5e6 doesn&#39=
;t<br>
seem to be there.<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">odd.=C2=A0</div><div class=3D"gmail_default" style=3D"font=
-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:smal=
l">But yes, I had a machine with an ssh timeout. When I push to linux-yocto=
</div><div class=3D"gmail_default" style=3D"font-size:small">for both conte=
nt and tags, it is quite slow. I was doing a build at the same time</div><d=
iv class=3D"gmail_default" style=3D"font-size:small">so it may have forced =
a timeout!</div><div class=3D"gmail_default" style=3D"font-size:small"><br>=
</div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</div><br=
></div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
We&#39;re seeing missing revisions in testing:<br>
<br>
e.g.<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/buil=
ds/3492/steps/20/logs/errors" rel=3D"noreferrer" target=3D"_blank">https://=
autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3492/steps/20/lo=
gs/errors</a><br>
from<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/buil=
ds/3492" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/29/builds/3492</a><br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--0000000000001791e9064dba3099--

