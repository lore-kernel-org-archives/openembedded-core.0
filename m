Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A70BCAC59A
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 13:23:07 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.16581.1758288177317649592
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Sep 2025 06:22:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fu7vup7L;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-77251d7cca6so2178044b3a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 06:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758288177; x=1758892977; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ulOKShY3H/2Nhi7SHSBWNnvmvX6Crz+T8t20PWGUcdc=;
        b=fu7vup7LHBHoXEBhrUBTHqYxjfLaX1uduNRhIJCZ1c3T8xJIYAMpWiM8B4qhF2G2qL
         4mKNRQGhAXIvyxTuWEjG1pYsdJ9EPVI+NkEVEyQBQlhVJUozMy5wuQiGI+PO3CRmi/Vr
         pUjhj1K4y0LcHcoC70CBMKwF6wDNVDodIZhmb2ZkJcWQLgr0jLllXtaVcAlaywDkr7zr
         6OoA9V3gN1c7KWidGXBsiLu06P7RkrjJxGusGSOAahYfwRqZ/s8JQe4ovTyfZfKf/q1+
         ER3SdwwX7aCE6xLBSyfg4sBD61GkWkYUQf68dCE88iNE5C6Pmai+Deu2OdfY3DU04Iv1
         JRFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758288177; x=1758892977;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ulOKShY3H/2Nhi7SHSBWNnvmvX6Crz+T8t20PWGUcdc=;
        b=qYtxyKBujJwppE3Ib6tBhop1s+DHwUYAKE7jfyFb2+LnfvblpuZYH4jKFgZMQprdOk
         lLAnEZdNMyshZ5VV3TiHaOt+rqtJsfz3pWkpz5mTEYnC0wB/neRXEaxnZBSX7i+CJSBL
         voDakWYO+2jSx5WPUpb1unNCx1q6cTCKuU39Eaqw/tbqhAb3LcbtLFh879w9y7NdH97u
         4IuxsVlRymAv/3Nql4IV3uVTLqIPaiOg+c/FvKF0eBIAwZhKlYOoAZ96fInffq09HYrd
         H5XBVJfaty1pZzosWq2HD+po7RjHCuJI7kiRZwFJ0j2Coa3deQRG501ufKwAwLaBhZCi
         AJyw==
X-Gm-Message-State: AOJu0YyAiHZRlKwUamgN02z/eMQgoVXT9Gnmthp5cvZo0QGiD07XmARe
	7phaYzZWWyO6kxSupzNC1c0oOKD1v3w2bEA5vGuLPl5V2yHOFV57511Jn4kI93DoGfmjOxYG3BJ
	El9h2SJskoKo37hnd8GRek0+gomNQiZU=
X-Gm-Gg: ASbGnct1b68jDuwUG9PwEVqAuCTUaMqj70z1XBA7q/Q34/FPN2QCsFaBEpEg0PL/ANd
	vlz3JfyTxmLV0Dh3E5427iBt6Qxu1Jac/30X9UJX82RfrsIP5tS7zKlLrPP/Fa0OI52Cx7q91sr
	Y2b5zwSAy447NsVUvAFwsh/4upIVD2UJ0iRQHuRxSpQXhHfjEqWEV43HcVjEzMZlw6SHLUxzhnp
	YHqyCGz65ZOAPQE1ydIXpG+68H44JH8fx++x2BV
X-Google-Smtp-Source: AGHT+IE4pqlg2m8uFD251vHTXwc7Bw7mLox+kLy2et1jW9X6riF1Ab3MMFUF4TYPieubXGAOSSdyaVlYk9ZYWO8OlHY=
X-Received: by 2002:a05:6a20:3c8e:b0:261:d708:b7f7 with SMTP id
 adf61e73a8af0-2927182c4eemr4803152637.49.1758288176451; Fri, 19 Sep 2025
 06:22:56 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1757088383.git.bruce.ashfield@gmail.com>
 <0074b1cd80c242493c1e50d9ff58cc4427272a50.1757088383.git.bruce.ashfield@gmail.com>
 <AS1PR10MB5697E637960455A217026DBBFD11A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <1866AF8ECC88AFA1.22280@lists.openembedded.org> <CADkTA4NRGBeFNS_UE4YYOXh+RFPnTM8QoZYMizUAsD_d9tHKww@mail.gmail.com>
 <e4eb1f62375f337aed1e4215020f6a0b2369c35f.camel@siemens.com>
In-Reply-To: <e4eb1f62375f337aed1e4215020f6a0b2369c35f.camel@siemens.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 19 Sep 2025 09:22:44 -0400
X-Gm-Features: AS18NWAi8FxQ83C6ufKuqIPq6XVRoNpO9GinwN0Y0hO9vjobCxZ4-jPBeyU0R9k
Message-ID: <CADkTA4OagBCWb1Ta8PoC3uCeJzs0D9QqYO+PcTC_TodJoV+j2Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/5] poky: bump default kernel reference to 6.16
To: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"Marko, Peter" <Peter.Marko@siemens.com>, 
	"Freihofer, Adrian" <adrian.freihofer@siemens.com>
Content-Type: multipart/alternative; boundary="0000000000002b980d063f275e85"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 13:23:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223750

--0000000000002b980d063f275e85
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 19, 2025 at 9:10=E2=80=AFAM Sverdlin, Alexander <
alexander.sverdlin@siemens.com> wrote:

> Hi all,
>
> On Fri, 2025-09-19 at 08:48 -0400, Bruce Ashfield wrote:
> > What is interesting is that we had a crtres patch for powerpc for many
> years,
> > but "recently" (2024) dropped it:
> >
> >
> https://git.yoctoproject.org/yocto-kernel-cache/commit/?h=3Dyocto-6.12&id=
=3D3cf758061025b9284ddfb1259f79860666737302
> >
> > And that dropped patch should have been part of several reference
> kernels since
> > that commit. Just so I know, this is something that has been passing on
> all
> > reference kernels and just broke on 6.16 ?
> >
> > Something must have changed upstream to bring the breakage back! Your
> > fix is simpler than the old one we had, so that's progress :)
>
> I believe, the removed patches were rather backports from the upstream
> kernel
> solving the dependency issues for in-tree modules. The current issue look=
s
> a bit
> different and is, I believe, an issue for external modules only.
>

They weren't backports, there's been a series of fixes around this for a
long time
to deal with it as a dependency for modules, here's one of my commits for
5.4:

------------------------
From f13fd6af4120b8b42d77377c9989457cda41899f Mon Sep 17 00:00:00 2001
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Sun, 15 Feb 2009 16:57:14 -0500
Subject: [PATCH 3/3] powerpc: add crtsavres.o to archprepare for kbuild

upstream commit da3de6df33f5f42ff9dc40093fbc884f524c9a49 adds
a dependency to all kernel modules to crtsavres. This
ensures that out-of-line register saves/restores work when
CONFIG_CC_OPTIMIZE_FOR_SIZE is enabled.

What it didn't do was ensure that it was built when
modules_prepare was run and hence out of tree powerpc kernel
modules can't properly link.

The fix is to add crtsavres.o to the archprepare rule in
the arch/powerpc/Makefile

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>


----------

Cheers,

Bruce



>
> But the above unfortunately makes it harder to explain why the external
> modules
> were buildable before ;-)
>
> --
> Alexander Sverdlin
> Siemens AG
> www.siemens.com
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000002b980d063f275e85
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 19, 2025 at 9:10=
=E2=80=AFAM Sverdlin, Alexander &lt;<a href=3D"mailto:alexander.sverdlin@si=
emens.com">alexander.sverdlin@siemens.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">Hi all,<br>
<br>
On Fri, 2025-09-19 at 08:48 -0400, Bruce Ashfield wrote:<br>
&gt; What is interesting is that we had a crtres=C2=A0patch for powerpc for=
 many years,<br>
&gt; but &quot;recently&quot; (2024) dropped it:<br>
&gt; <br>
&gt; <a href=3D"https://git.yoctoproject.org/yocto-kernel-cache/commit/?h=
=3Dyocto-6.12&amp;id=3D3cf758061025b9284ddfb1259f79860666737302" rel=3D"nor=
eferrer" target=3D"_blank">https://git.yoctoproject.org/yocto-kernel-cache/=
commit/?h=3Dyocto-6.12&amp;id=3D3cf758061025b9284ddfb1259f79860666737302</a=
><br>
&gt; <br>
&gt; And that dropped patch should have been part of several reference kern=
els since=C2=A0<br>
&gt; that commit. Just so I know, this is something that has been passing o=
n all<br>
&gt; reference kernels and just broke on 6.16 ?<br>
&gt; <br>
&gt; Something must have changed upstream to bring the breakage back! Your<=
br>
&gt; fix is simpler than the old one we had, so that&#39;s progress :)<br>
<br>
I believe, the removed patches were rather backports from the upstream kern=
el<br>
solving the dependency issues for in-tree modules. The current issue looks =
a bit<br>
different and is, I believe, an issue for external modules only.<br></block=
quote><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:s=
mall">They weren&#39;t backports, there&#39;s been a series of fixes around=
 this for a long time</div><div class=3D"gmail_default" style=3D"font-size:=
small">to deal with it as a dependency for modules, here&#39;s one of my co=
mmits for 5.4:</div><div class=3D"gmail_default" style=3D"font-size:small">=
<br></div><div class=3D"gmail_default" style=3D"font-size:small">----------=
--------------</div><div class=3D"gmail_default" style=3D"font-size:small">=
From f13fd6af4120b8b42d77377c9989457cda41899f Mon Sep 17 00:00:00 2001<br>F=
rom: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@windriver.com">bru=
ce.ashfield@windriver.com</a>&gt;<br>Date: Sun, 15 Feb 2009 16:57:14 -0500<=
br>Subject: [PATCH 3/3] powerpc: add crtsavres.o to archprepare for kbuild<=
br><br>upstream commit da3de6df33f5f42ff9dc40093fbc884f524c9a49 adds<br>a d=
ependency to all kernel modules to crtsavres. This<br>ensures that out-of-l=
ine register saves/restores work when<br>CONFIG_CC_OPTIMIZE_FOR_SIZE is ena=
bled.<br><br>What it didn&#39;t do was ensure that it was built when<br>mod=
ules_prepare was run and hence out of tree powerpc kernel<br>modules can&#3=
9;t properly link.<br><br>The fix is to add crtsavres.o to the archprepare =
rule in<br>the arch/powerpc/Makefile<br><br>Signed-off-by: Bruce Ashfield &=
lt;<a href=3D"mailto:bruce.ashfield@windriver.com">bruce.ashfield@windriver=
.com</a>&gt;<br></div></div><div><br></div><div><br></div><div><div class=
=3D"gmail_default" style=3D"font-size:small">----------</div><div class=3D"=
gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_defa=
ult" style=3D"font-size:small">Cheers,</div><div class=3D"gmail_default" st=
yle=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"fon=
t-size:small">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
<br>
But the above unfortunately makes it harder to explain why the external mod=
ules<br>
were buildable before ;-)<br>
<br>
-- <br>
Alexander Sverdlin<br>
Siemens AG<br>
<a href=3D"http://www.siemens.com" rel=3D"noreferrer" target=3D"_blank">www=
.siemens.com</a><br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--0000000000002b980d063f275e85--

