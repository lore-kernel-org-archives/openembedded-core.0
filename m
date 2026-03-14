Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF5B610706E0
	for <webhook@archiver.kernel.org>; Sat, 14 Mar 2026 14:41:15 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10858.1773499266599415420
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Mar 2026 07:41:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z0kBOfzV;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-354bc7c2c46so1910863a91.0
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Mar 2026 07:41:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773499266; cv=none;
        d=google.com; s=arc-20240605;
        b=Np+kRza/VYSibmjueKUbbwcxe0YICInXi/dxGVNeamjFw+HZR9LwabSPZbdJlxCTJL
         zRf+bwsZkD30uYhdDMvlEYRueGrKGCmJCOFk2okZpHWeL6xvKi9eUEIUWVRkfB2yW8Zk
         joBj1FcjNU6CRFJCErlRSXSSs0+2MR8XX2HDQCs+XJX/13iDPoRJ3cTDjpBfq9gPPdT/
         bo+Zkew2jmQWlkTgFK140jQSe7TJ9Wwuj0z0bM3cnQev41eeunh93OYiOeFH4OjWl+NL
         bxn51oWrneZ9C0cH9rGmho2EZSTmCQLvvWY/TVa02/PnT1UaBBpgBNRcQm8MkprLuXNL
         bnww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3A0pR7QwZG+zItiheWZ3UFjEVYW5Vs/uVtASx0YhauA=;
        fh=tA7dW14mT7jxsq1gA2wZEl2LJ43yLbeJ12whdut8G6E=;
        b=EeC6bxCLIXttiQGpqBcuu5kxIZUYrpNhGhzPD/f1730nLfqrrhaY4FF9dacgNJ1857
         EU5Ir49DYeinERZQSJgAD0nFiVSuknVkRuSgppJLJYtj0Fm/LybNnm0wHJWgVL2KPX5p
         48j+zUeYvnpqygBPBfoSqnIxaetXMnqNh0pPxrAloqlyfs+SnPIt/cG9XvkIPmdKs5W9
         imZu8UuR/9cCVmNGcESlAydcz5+eSNNgOsBdQqOPb1tF1uAyhMIhi8T6TB5YREQRPzuy
         STnbroOW4ceRDQ6BluhOMR8jaGFmmLztA6Ab1j5cTohg95UdgMFa9tUP6mQyAhwgd+4s
         iEHg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773499266; x=1774104066; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3A0pR7QwZG+zItiheWZ3UFjEVYW5Vs/uVtASx0YhauA=;
        b=Z0kBOfzVaM5HVoewehMajF1jZRIgB3Lzh50IP8vfx5JPieu0n1mdo3O1BklEtAF7N2
         yG7jfIGyz5sU0H/IEBuFQAZ0migkoGINn12vJ51kTdsVKyKhGiCsNYNHPGqXphjHBPGa
         UAJbE7Yx4uyZNUq6ieX14BGw1HP/GmJEreWFE+PzHBOgPlBaA+MR9dwsVpggj7eU75yk
         si1YBZhIesGERMpLuLdUk3IASReFjklvWdonNkiZH++TYGHS7CElRx7MaixaTDHTBqE6
         X+URSrKQlFv/LD+p2gBEUAJbE0k7DLmUwCgt6CjgBjT5ouAwHT9U/BJBmvy7i2mYoIfc
         c48Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773499266; x=1774104066;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3A0pR7QwZG+zItiheWZ3UFjEVYW5Vs/uVtASx0YhauA=;
        b=asX1nFxt8JD4g5JwvaUG9vITob1DwGBVjTdUB8Ic3wDzKUeqq9hTHX1tZLUPDAeYW/
         wgiGYUNXhpCyOFGAvDCgLEMdXVBvYKoZsJvoR+vOZDJpiN2a65AkhGvJY00blofxZgWk
         eCoFn+6GdIHSSNUeXZ/d8KCDSUDT2ErQmsyQsmIwcEnFXh3RqtiRT25MddhCczbBFAq0
         rE2MNP23l85rhkVn8ZFOLeMIaeHAIDznkY0LAsU6Sis47cCVcA0+Jk/tRnGF7VblAuPG
         COBpSqu/txFEJciUeAC3Y5lM+fhb8ISem1wEldkJRqphrMUp23GDqazhfxxFU5Y6NxGu
         aKLQ==
X-Gm-Message-State: AOJu0YyI84xVbXwhK+MasAkujbGjYpZvwyQQRpFy+7SABwmsp4jYi9L3
	szwSxdCYU0klLIV6n+C5spg5tmmaqwE2qYEWcGoKmlkcKIKLmk4+6w+VgqUqn6aShkobcQrc5js
	kyk/ZlIBS+e7qMAPczbBznFbEQnMGPhw=
X-Gm-Gg: ATEYQzykgawvrEYo+osquuOqPtPuNRkTZj4pHRi6dRP5NwEZKtkxZHKNuVDg8Gn644D
	OuYiWJzl6CMA35fwXc0RltO9dZRIKE84PnhMXmKrNJswRAAkmZufm2KtMas0bKHTUojxumed4zE
	+KNCf7np8nJUI5hE259RVOGt8aCM5KVCxqERIaR++3pWfE6ugIMTRzZ+89trb+amWnvSIyAwn4j
	3GYo0fAv8Z2ziCGwhLn8aX0t8lECM9bb5ZUMOI3QXfpMrge83ptg++5whzZBvne4b6NGtlRPhOf
	OcsnuVF1D713W8joRbE0Cs5ShN44qVeySpLBjA==
X-Received: by 2002:a17:90b:394f:b0:354:a332:1a61 with SMTP id
 98e67ed59e1d1-35a21efb0eamr6108165a91.5.1773499265868; Sat, 14 Mar 2026
 07:41:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260314094758.3929192-1-richard.purdie@linuxfoundation.org>
 <189CAC32AB5A06DA.1508127@lists.openembedded.org> <64d89dc312e87a607ca8516ad90ea36707c56fe6.camel@linuxfoundation.org>
In-Reply-To: <64d89dc312e87a607ca8516ad90ea36707c56fe6.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 14 Mar 2026 10:40:54 -0400
X-Gm-Features: AaiRm502XFTwxOrzc0YXe9txLUJMLzVieN21DgyRrNwN-PFpQGom78Tb4LJgNw0
Message-ID: <CADkTA4OJ-_bT1rXZ=v0diCdeqoKPms+Dm-8awrWwGCBNAbJCag@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/5] meta/dummy-sdk-package: Improve SDK dummy
 package handling
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Joshua Watt <JPEWhacker@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000c06832064cfcf9d2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Mar 2026 14:41:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233087

--000000000000c06832064cfcf9d2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 14, 2026 at 6:00=E2=80=AFAM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sat, 2026-03-14 at 09:47 +0000, Richard Purdie via
> lists.openembedded.org wrote:
> > Currently, the dummy SDK packages are re-running for different
> SDKMACHINE values
> > when they should not. The usage of allarch is broken and not triggering
> the right
> > PACKAGE_ARCH value due to the deferred nature of nativesdk. This was
> probably
> > broken when we switched to add deferred classes.
> >
> > To try and make this all more explict and less prone to breakage, switc=
h
> to calling
> > oe.utils.make_arch_independent() directly.
> >
> > Add the 'special' package architecture values to SSTATE_ARCHS so the
> system cna properly
> > track them.
> >
> > Remove the pointless tasks we don't need from the dummy recipes, mark
> the packagedata
> > as machine independent and then remove from the conflict list in
> sstate.bbclass.
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> This patch fixes real issues with the way the dummy recipes are
> currently being handled. Unfortunately this change still isn't without
> issues, this is shown by the failure in meta-virtualization it
> introduces. It is starting to feel like I'm somehow targeting Bruce
> recently, sorry!
>

It's probably more that I'm doing strange and niche things :)

I see your patch, I'll pull it in shortly, thanks for the fixup, I
would have taken ages to figure that out!

Bruce



>
> The failure this patchset triggers in meta-virtualization is here:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/89/builds/3215
>
> The reason is that it is doing this:
>
> recipes-core/meta/container-dummy-provides.bb:require
> recipes-core/meta/dummy-sdk-package.inc
>
> which is fine, I hadn't realised layers were using that but it should
> be something you can do. At first glance, the fix looks easy, just add:
>
> DUMMYSDK_PKGDATA_VARNAME =3D "PKGDATA_DIR"
> DUMMYSDK_EXTRASTAMP_VARNAME =3D "MACHINE"
>
> to the recipe. That doesn't account for the sstate.bbclass and
> sstatesig.py changes this patch is making though.
>
> I've never been happy at having to add these individually to the "feed"
> lists in the first place and another layer trying to do this
> illustrates why.
>
> I'm at a bit of a loss on what to do from here. Options could be:
>
> a) move the recipe to core and add another entry to
> sstate.bbclass/sstatesig.py . That doesn't help it anyone else does
> this
>
> b) Create some layer.conf variables which allow these to be
> defined/added generically. That would need careful manipulation of the
> hash variable dependencies to stop things rebuilding like crazy.
>
> c) Find a way for the core not to need this list hardcoded. That would
> be nicer and removes what looks like a horrible scaling issue we have
> right now I don't know how to do that.
>
> d) Something else
>
> I'm open to ideas, these changes are needed to unblock the spdx
> changes.
>
> Cheers,
>
> Richard
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000c06832064cfcf9d2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Mar 14, 2026 at 6:00=
=E2=80=AFAM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfounda=
tion.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">On Sat, 2026-03-14 at 09:47 +00=
00, Richard Purdie via <a href=3D"http://lists.openembedded.org" rel=3D"nor=
eferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; Currently, the dummy SDK packages are re-running for different SDKMACH=
INE values<br>
&gt; when they should not. The usage of allarch is broken and not triggerin=
g the right<br>
&gt; PACKAGE_ARCH value due to the deferred nature of nativesdk. This was p=
robably<br>
&gt; broken when we switched to add deferred classes.<br>
&gt; <br>
&gt; To try and make this all more explict and less prone to breakage, swit=
ch to calling<br>
&gt; oe.utils.make_arch_independent() directly.<br>
&gt; <br>
&gt; Add the &#39;special&#39; package architecture values to SSTATE_ARCHS =
so the system cna properly<br>
&gt; track them.<br>
&gt; <br>
&gt; Remove the pointless tasks we don&#39;t need from the dummy recipes, m=
ark the packagedata<br>
&gt; as machine independent and then remove from the conflict list in sstat=
e.bbclass.<br>
&gt; <br>
&gt; Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@lin=
uxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&=
gt;<br>
<br>
This patch fixes real issues with the way the dummy recipes are<br>
currently being handled. Unfortunately this change still isn&#39;t without<=
br>
issues, this is shown by the failure in meta-virtualization it<br>
introduces. It is starting to feel like I&#39;m somehow targeting Bruce<br>
recently, sorry!<br></blockquote><div><br></div><div><div class=3D"gmail_de=
fault" style=3D"font-size:small">It&#39;s probably more that I&#39;m doing =
strange and niche things :)</div><div class=3D"gmail_default" style=3D"font=
-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:smal=
l">I see your patch, I&#39;ll pull it in shortly, thanks for the fixup, I=
=C2=A0</div><div class=3D"gmail_default" style=3D"font-size:small">would ha=
ve taken ages to figure that out!</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
<br>
The failure this patchset triggers in meta-virtualization is here:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/89/buil=
ds/3215" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproj=
ect.org/valkyrie/#/builders/89/builds/3215</a><br>
<br>
The reason is that it is doing this:<br>
<br>
recipes-core/meta/container-dummy-provides.bb:require recipes-core/meta/dum=
my-sdk-package.inc<br>
<br>
which is fine, I hadn&#39;t realised layers were using that but it should<b=
r>
be something you can do. At first glance, the fix looks easy, just add:<br>
<br>
DUMMYSDK_PKGDATA_VARNAME =3D &quot;PKGDATA_DIR&quot;<br>
DUMMYSDK_EXTRASTAMP_VARNAME =3D &quot;MACHINE&quot;<br>
<br>
to the recipe. That doesn&#39;t account for the sstate.bbclass and<br>
sstatesig.py changes this patch is making though.<br>
<br>
I&#39;ve never been happy at having to add these individually to the &quot;=
feed&quot;<br>
lists in the first place and another layer trying to do this<br>
illustrates why.<br>
<br>
I&#39;m at a bit of a loss on what to do from here. Options could be:<br>
<br>
a) move the recipe to core and add another entry to<br>
sstate.bbclass/sstatesig.py . That doesn&#39;t help it anyone else does<br>
this<br>
<br>
b) Create some layer.conf variables which allow these to be<br>
defined/added generically. That would need careful manipulation of the<br>
hash variable dependencies to stop things rebuilding like crazy.<br>
<br>
c) Find a way for the core not to need this list hardcoded. That would<br>
be nicer and removes what looks like a horrible scaling issue we have<br>
right now I don&#39;t know how to do that.<br>
<br>
d) Something else<br>
<br>
I&#39;m open to ideas, these changes are needed to unblock the spdx<br>
changes.<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000c06832064cfcf9d2--

