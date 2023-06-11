Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 895BBC77B7A
	for <webhook@archiver.kernel.org>; Sun, 11 Jun 2023 15:48:57 +0000 (UTC)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
 by mx.groups.io with SMTP id smtpd.web10.38887.1686498527366647097
 for <Openembedded-core@lists.openembedded.org>;
 Sun, 11 Jun 2023 08:48:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=TL59MtQz;
 spf=pass (domain: gmail.com, ip: 209.85.166.173, mailfrom: alex.kiernan@gmail.com)
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-33b4552e55cso12270295ab.0
        for <Openembedded-core@lists.openembedded.org>; Sun, 11 Jun 2023 08:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686498526; x=1689090526;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3Q5HHNaZvXl2itaMIwJOq24jHQXrm2tAqGHd5IPcl+I=;
        b=TL59MtQzeWNKt+UH9A+yc5TfQh3uG1zLFe2vHJmwXXhirfRAIn/OQli3R+6/yQRFd1
         Zct8zPYoT1cD9Dr+sSfxC3O+M/4xk8/aA04f7VG3oJ4ETMIkrsWv0pw84TJ6OtvmnyM0
         ttCzVbfCx64AunhFMIv0oWzJxT0KyGafRo6L+BL2Uz1c7z33UL1v/fKFKFVFD1onm7e+
         kKXCDQX5H6lpVcfDcYnKnOrA3wbOXhouT9EzYU0gH8U+BUinOfn1u6JzLZkXp2H+1wjG
         6vnn3QSmKRKFX1n+uIO8v7kxC8l3XG9rEy1VQ0IxSjCDV5m1V01F//t8hAssHRQd3j/6
         eRDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686498526; x=1689090526;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Q5HHNaZvXl2itaMIwJOq24jHQXrm2tAqGHd5IPcl+I=;
        b=Yv6tSq0Wn+DispYUES20pKuvRzZlV79+MzKyntNDzFVykqH+zxtRPYP8a5CB4byESb
         MBB68eW8OLDmsE1dqaAMP0SGUgnthOM+wtyPd1gYPORvH0IqzN0uFt7RV221SVwtkRXD
         NA8PdGBLt0RH+GrWiVWJtHMvPNPmN7zaSSxbkQi5A2dqrFgfxpG/HXv9yB5tjcMDnAxd
         C14KAVsWBVYQBb4LFRHKsERHIJ+EFO/XUmHvr8oUSpdgorWzdy73xv0soZq8BPrdYJe8
         imTzKb/RifyG/oc1ZvX0xioCh8Wm3Zw84xhtU2uWt9hbj3zLQuIs1FcssFj/zdJIsWoV
         RvbQ==
X-Gm-Message-State: AC+VfDzYW9ZzhgFQ48EYWQsF7Fi0YFi8FmwjVjVoJQ4DaAuubaNy9J70
	Izyk5K7t+QGwwUUE8bSPsJ7Ut5XxFAh1Zxt4ymA=
X-Google-Smtp-Source: ACHHUZ5eAR04SOMNO+lyneRodyH4NAl3vhWhMyT9lWQOqFqKAmqbZBNTxXQIEWchOSnmAMpJx0bGGTAzubXCRTaZx/8=
X-Received: by 2002:a92:a041:0:b0:33e:51bf:727d with SMTP id
 b1-20020a92a041000000b0033e51bf727dmr5972956ilm.10.1686498526468; Sun, 11 Jun
 2023 08:48:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230609064802.11777-1-alexis.lothore@bootlin.com>
 <20230609064802.11777-5-alexis.lothore@bootlin.com> <ZILME/DYo6hUkXv0@nuoska>
 <212cdfaa-12a2-e292-ea51-7432efaef913@bootlin.com> <CANNYZj91ma6TFrZGsYegK6ZpQMRKudN_K6hqSW-o81MA2srntQ@mail.gmail.com>
In-Reply-To: <CANNYZj91ma6TFrZGsYegK6ZpQMRKudN_K6hqSW-o81MA2srntQ@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Sun, 11 Jun 2023 16:48:36 +0100
Message-ID: <CAO5Uq5TCx7bde9dESJB5VNJt9j_OxwCxX3MSy+5gEm0YrA9CJA@mail.gmail.com>
Subject: Re: [OE-Core][PATCH v3 4/4] core-image-ptest: append ptest directory
 to artifacts list
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: alexis.lothore@bootlin.com, Mikko Rapeli <mikko.rapeli@linaro.org>, 
	Patches and discussions about the oe-core layer <Openembedded-core@lists.openembedded.org>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: multipart/alternative; boundary="00000000000095a29c05fddc89c7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Jun 2023 15:48:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182621

--00000000000095a29c05fddc89c7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm glad it's not just me!

On Sun, 11 Jun 2023, 16:16 Alexander Kanavin, <alex.kanavin@gmail.com>
wrote:

> Doesn't +=3D override the earlier ?=3D (or ??=3D), so you lose what was i=
n
> the weak assignment and end up only with the value in +=3D ? Yes, I'm
> still uncertain about this after all the years :)
>
>
> Alex
>
> On Fri, 9 Jun 2023 at 09:23, Alexis Lothor=C3=A9 via lists.openembedded.o=
rg
> <alexis.lothore=3Dbootlin.com@lists.openembedded.org> wrote:
> >
> > Hi Mikko,
> >
> > On 6/9/23 08:52, Mikko Rapeli wrote:
> > > Hi,
> > >
> > > On Fri, Jun 09, 2023 at 08:48:02AM +0200, Alexis Lothor=C3=A9 via
> lists.openembedded.org wrote:
> > >> From: Alexis Lothor=C3=A9 <alexis.lothore@bootlin.com>
> > >>
> > >> TESTIMAGE_FAILED_QA_ARTIFACTS is defined in testimage.bbclass with a
> > >> minimal list of files to retrieve when a test fail. By appending the
> ptest
> > >> directory only in core-image-ptest.bb, thanks to multiconfig feature
> used
> > >> in the recipe, only failing ptests will lead to corresponding ptest
> > >> artifacts retrieval, instead of all ptests artifacts retrieval.
> > >>
> > >> Signed-off-by: Alexis Lothor=C3=A9 <alexis.lothore@bootlin.com>
> > >> ---
> > >>  meta/recipes-core/images/core-image-ptest.bb | 1 +
> > >>  1 file changed, 1 insertion(+)
> > >>
> > >> diff --git a/meta/recipes-core/images/core-image-ptest.bb
> b/meta/recipes-core/images/core-image-ptest.bb
> > >> index 90c26641ba3a..e1be81bb2666 100644
> > >> --- a/meta/recipes-core/images/core-image-ptest.bb
> > >> +++ b/meta/recipes-core/images/core-image-ptest.bb
> > >> @@ -28,6 +28,7 @@ QB_MEM:virtclass-mcextend-lttng-tools =3D "-m 4096=
"
> > >>  QB_MEM:virtclass-mcextend-python3-cryptography =3D "-m 4096"
> > >>
> > >>  TEST_SUITES =3D "ping ssh parselogs ptest"
> > >> +TESTIMAGE_FAILED_QA_ARTIFACTS:append=3D" ${libdir}/${MCNAME}/ptest"
> > >
> > > Why not +=3D ? Also, spaces around =3D.
> > >
> > > If :append is used, bbappend in other layers can not easily override
> > > this variable.
> >
> > Good catch, thanks, I'll wait a bit for any more reviews and send a new
> version
> > with this point fixed.
> >
> > Thanks,
> > Alexis
> >
> > >
> > > Cheers,
> > >
> > > -Mikko
> > >
> > >
> > >
> > >
> > >
> >
> > --
> > Alexis Lothor=C3=A9, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182620):
> https://lists.openembedded.org/g/openembedded-core/message/182620
> Mute This Topic: https://lists.openembedded.org/mt/99423382/3618097
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kiernan@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000095a29c05fddc89c7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>I&#39;m glad it&#39;s not just me!<br><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, 11 Jun 2023,=
 16:16 Alexander Kanavin, &lt;<a href=3D"mailto:alex.kanavin@gmail.com">ale=
x.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
Doesn&#39;t +=3D override the earlier ?=3D (or ??=3D), so you lose what was=
 in<br>
the weak assignment and end up only with the value in +=3D ? Yes, I&#39;m<b=
r>
still uncertain about this after all the years :)<br>
<br>
<br>
Alex<br>
<br>
On Fri, 9 Jun 2023 at 09:23, Alexis Lothor=C3=A9 via <a href=3D"http://list=
s.openembedded.org" rel=3D"noreferrer noreferrer" target=3D"_blank">lists.o=
penembedded.org</a><br>
&lt;alexis.lothore=3D<a href=3D"mailto:bootlin.com@lists.openembedded.org" =
target=3D"_blank" rel=3D"noreferrer">bootlin.com@lists.openembedded.org</a>=
&gt; wrote:<br>
&gt;<br>
&gt; Hi Mikko,<br>
&gt;<br>
&gt; On 6/9/23 08:52, Mikko Rapeli wrote:<br>
&gt; &gt; Hi,<br>
&gt; &gt;<br>
&gt; &gt; On Fri, Jun 09, 2023 at 08:48:02AM +0200, Alexis Lothor=C3=A9 via=
 <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; &gt;&gt; From: Alexis Lothor=C3=A9 &lt;<a href=3D"mailto:alexis.lothor=
e@bootlin.com" target=3D"_blank" rel=3D"noreferrer">alexis.lothore@bootlin.=
com</a>&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; TESTIMAGE_FAILED_QA_ARTIFACTS is defined in testimage.bbclass=
 with a<br>
&gt; &gt;&gt; minimal list of files to retrieve when a test fail. By append=
ing the ptest<br>
&gt; &gt;&gt; directory only in <a href=3D"http://core-image-ptest.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">core-image-ptest.bb</a>, thank=
s to multiconfig feature used<br>
&gt; &gt;&gt; in the recipe, only failing ptests will lead to corresponding=
 ptest<br>
&gt; &gt;&gt; artifacts retrieval, instead of all ptests artifacts retrieva=
l.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Signed-off-by: Alexis Lothor=C3=A9 &lt;<a href=3D"mailto:alex=
is.lothore@bootlin.com" target=3D"_blank" rel=3D"noreferrer">alexis.lothore=
@bootlin.com</a>&gt;<br>
&gt; &gt;&gt; ---<br>
&gt; &gt;&gt;=C2=A0 meta/recipes-core/images/<a href=3D"http://core-image-p=
test.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">core-image-ptest.b=
b</a> | 1 +<br>
&gt; &gt;&gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; diff --git a/meta/recipes-core/images/<a href=3D"http://core-=
image-ptest.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">core-image-=
ptest.bb</a> b/meta/recipes-core/images/<a href=3D"http://core-image-ptest.=
bb" rel=3D"noreferrer noreferrer" target=3D"_blank">core-image-ptest.bb</a>=
<br>
&gt; &gt;&gt; index 90c26641ba3a..e1be81bb2666 100644<br>
&gt; &gt;&gt; --- a/meta/recipes-core/images/<a href=3D"http://core-image-p=
test.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">core-image-ptest.b=
b</a><br>
&gt; &gt;&gt; +++ b/meta/recipes-core/images/<a href=3D"http://core-image-p=
test.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">core-image-ptest.b=
b</a><br>
&gt; &gt;&gt; @@ -28,6 +28,7 @@ QB_MEM:virtclass-mcextend-lttng-tools =3D &=
quot;-m 4096&quot;<br>
&gt; &gt;&gt;=C2=A0 QB_MEM:virtclass-mcextend-python3-cryptography =3D &quo=
t;-m 4096&quot;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 TEST_SUITES =3D &quot;ping ssh parselogs ptest&quot;<br=
>
&gt; &gt;&gt; +TESTIMAGE_FAILED_QA_ARTIFACTS:append=3D&quot; ${libdir}/${MC=
NAME}/ptest&quot;<br>
&gt; &gt;<br>
&gt; &gt; Why not +=3D ? Also, spaces around =3D.<br>
&gt; &gt;<br>
&gt; &gt; If :append is used, bbappend in other layers can not easily overr=
ide<br>
&gt; &gt; this variable.<br>
&gt;<br>
&gt; Good catch, thanks, I&#39;ll wait a bit for any more reviews and send =
a new version<br>
&gt; with this point fixed.<br>
&gt;<br>
&gt; Thanks,<br>
&gt; Alexis<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; Cheers,<br>
&gt; &gt;<br>
&gt; &gt; -Mikko<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt;<br>
&gt; --<br>
&gt; Alexis Lothor=C3=A9, Bootlin<br>
&gt; Embedded Linux and Kernel engineering<br>
&gt; <a href=3D"https://bootlin.com" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://bootlin.com</a><br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#182620): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/182620" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/182620</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/99423382/3618=
097" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/mt/99423382/3618097</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kiernan@gm=
ail.com" target=3D"_blank" rel=3D"noreferrer">alex.kiernan@gmail.com</a>]<b=
r>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div></div>

--00000000000095a29c05fddc89c7--

