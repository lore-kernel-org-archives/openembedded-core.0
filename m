Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED36C1093176
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 14:17:57 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23737.1774448267749738884
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 07:17:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RtcAMu8J;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2b0afa0210bso6701915ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 07:17:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774448267; cv=none;
        d=google.com; s=arc-20240605;
        b=lcX7weAn4BloMT+NO0RDprCZzO5CxqgBiTLyItPQyMgEEAkRNcFA+lKwLO8mAElWJa
         dtIKJ3Be9TEs2WVE+TZ/3WSTd2Vd1BMi4C+KjpAbqZPgA/AnF4NQq5RdW4vDp0/iO7Ii
         qooOBUKVED/zwr58t+93kIwNQqQjIVWnF5cm3l9g93lQQgXrf4d2Z73uJXgSIkmZeG86
         RbNN64C7Yh9ObBTgz6uw39iQcDZUZxWTTCZBNpK8Ir5Le/dAEKayaiPjStNXq4/q6HK3
         j5IrEywQlsvEruFw2GV7cswE3aYJzrFXteNxdR9Z+N/prpAzKwKF9gSf1Hn6AVu6QLUf
         JaCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FE9zJBfDNYobxHrP7EK+Akwd7SRfs0sy+NhBnsoCpVA=;
        fh=UM/Gx49N6thVAMMNWfJLfqejhmgNNAYw2CK+Ob0parM=;
        b=Y60dY74l1A4YrmmLWU4F3SGzjvr6asW3nlVBZFToti3uEq3AnDoP9w/rsHuBNMOyA7
         gdy/a7DV7KyKQDbTQSNkpid/IVWU8zguxdACQt3on60O7acpcdg27QoL6aLjvGHVN6RU
         Y5BxZaV+IT/syh9DhgsYOnF7DoOYdejmj2pIpHOVdrc86i8s0qFRdtJryJh2Q4HQ+eFK
         /ZqEfaP6WpsySJzxG6CqRsRsuT/QiEAcemFaKs1fEzBDwrexZRS5E+nbeOyfO0JA5SMA
         Yw9yKThWdQhTEj9uA0g3WJa4ccKs819AJEuv2BqOL5/MzqmHN5bANPapS79kRriQbvM6
         x4yg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774448267; x=1775053067; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FE9zJBfDNYobxHrP7EK+Akwd7SRfs0sy+NhBnsoCpVA=;
        b=RtcAMu8J/wvDAwSBlAQWKAGjk2r2GXhvLh2y6P/ippAm+Tx7uQYIlUZpKdHc+PcvPO
         /7ES9akUeUEqDArvbii/7FzUTW22A7DQwFsd6S2Xf/1QOxJhaftE/j8XBi6amIUts6E0
         BPYNZD8NGsKLp/f4OA4kzF2X7UmOe5BtqD3r8gKxUofUIERiIbDJ1OOmqrSr+vtGaNq0
         q0aUxDSbTpC8Cv8wSUOLr+qOGoAAaY7FQFnHbyxhn2XgGmG2OpBGUbuqNcfJmtlWiIQG
         tJ2rR9UD+xItJcISV7/tWqarEXYvV53+xB7WWmgu/bWcA45982SwlMbjIKXry15NROHH
         XhcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774448267; x=1775053067;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FE9zJBfDNYobxHrP7EK+Akwd7SRfs0sy+NhBnsoCpVA=;
        b=kzuz02cPX5oGPA+c4/JIY0OD09cUGZf1zVjKhNh+zMed15XYhVMVOfqLrJC1tUtkJx
         Mhvvjm0JK9NSJhpXZeeeAW1Y5yLLvgBl8Ytlx+c0uelJx7ZzjNxHhaMcyBnBNfohjiw/
         7QAKcS9n44f+J9IGknlswOMpnwjLyXOby4XsEbOayTSDTkJfDvRwHHE93yyG3DHZVCZc
         N+JccGMS8pOYsoU6GnooC2kWuQAsjIAs6F4lxoRzyfRhgrLJWi08QDH8cxWpyxBSBAX8
         wmC5YJq5kOLgKefJIXTvKv9X2BNSqy8PYalAre4TTG+hFhmsXvy4uAXJQCG0F+oc/b7h
         bXPg==
X-Gm-Message-State: AOJu0Yw3hHPxcO6UNbNBPHKvb0+EzXgy5yyIOXBv4HfM2dDcGqb0eUQc
	iqz2dzfLddUqMfEL6SReQloQjElK2MhFc3b6FoCrPQa1rA/OMmJw+jVvabmaHuoMYdT3l/6uLNV
	B9rAQnVYphedM7IOLVzfJ5wdpyVJqIYI=
X-Gm-Gg: ATEYQzw61EJdWJ4oTEU97uv7qEbImUL3u10WkMcB6M3PViNjYa4AevBbPa7anJHRxmW
	d1PkvXC+47JoUiXMhbVNQHs84fyCoVuZ0x+D4pxxsuW71vkku4oC4Yx2/JjaRDa7b18rFijbtxX
	1ZXUCAJDmdLOrPXh2fH6dWSL3ULsqhnD+WFnc3EmU1SWvr4Wfrw9i3LAQkFKKPD1Qu+/ktV+SwQ
	ejxzFJYzrUhnDDliJRDnS5DTAcp/bhc3W10BTjEvLKCafmmg9276KNcPdjqkTECqicZq2+huSVZ
	m90dCzc031gwBOG+lHi6RpkjCiCAxZp6hIETrt+m
X-Received: by 2002:a17:903:2a8d:b0:2b0:6e8f:8e73 with SMTP id
 d9443c01a7336-2b0b0b2d665mr44015445ad.44.1774448266753; Wed, 25 Mar 2026
 07:17:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260325113112.1163632-1-zboszor@gmail.com> <CADkTA4OXFgvu2rsU8XTHQrDMj+6SUj1M5GG+9hzdtK3htHvzqw@mail.gmail.com>
 <5bc1065a-005c-4219-bc69-e191e6be3f78@gmail.com> <CADkTA4MOXYq1xQaGgGnREmgQUTQaEDTskv1aWRyM9zqiXxAuJA@mail.gmail.com>
 <2646923f-34d6-4cb5-9e9a-ac8ec789c359@gmail.com>
In-Reply-To: <2646923f-34d6-4cb5-9e9a-ac8ec789c359@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 25 Mar 2026 10:17:34 -0400
X-Gm-Features: AaiRm53e2GxPOoI8dviVVt2h_JbQ-wvHv9-_1-H06ytDvGvjeUGL68xOH9ABDng
Message-ID: <CADkTA4P-Zz-uNyth-y1Zjaq0Y3O+Pk8qTM650_2QkL2ZCDEQBQ@mail.gmail.com>
Subject: Re: [OE-core] [RFC][PATCH 00/14] Support Python freethreading
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Bartosz Golaszewski <brgl@kernel.org>, Trevor Gamblin <tgamblin@baylibre.com>, 
	Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000009cba6f064dd9ee20"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 14:17:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233917

--0000000000009cba6f064dd9ee20
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 9:51=E2=80=AFAM B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=
=A1n <zboszor@gmail.com>
wrote:

> 2026. 03. 25. 14:17 keltez=C3=A9ssel, Bruce Ashfield =C3=ADrta:
> >
> >
> > On Wed, Mar 25, 2026 at 9:13=E2=80=AFAM B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=
=C3=A1n <zboszor@gmail.com>
> wrote:
> >
> >     2026. 03. 25. 14:01 keltez=C3=A9ssel, Bruce Ashfield =C3=ADrta:
> >     >
> >     >
> >     > On Wed, Mar 25, 2026 at 7:31=E2=80=AFAM Zoltan Boszormenyi via
> lists.openembedded.org
> >     <http://lists.openembedded.org>
> >     > <http://lists.openembedded.org> <zboszor=3D
> gmail.com@lists.openembedded.org> wrote:
> >     >
> >     >     This patchset allows turning on Python freethreading by using
> >     >     a new DISTRO_FEATURES setting:
> >     >
> >     >     DISTRO_FEATURES +=3D "python_freethreading"
> >     >
> >     >     and optionally:
> >     >
> >     >     DISTRO_FEATURES_NATIVE +=3D "python_freethreading"
> >     >
> >     >     The change to python3-dir.bbclass is crucial, as all python
> module
> >     >     build helper classes rely on it.
> >     >
> >     >     I also added native variants of some settings because another
> >     >     series against meta-openembedded is needed to complete this
> one.
> >     >     In that, the change to the fontforge recipe relies on the
> native
> >     >     setting for setting BUILD_LDFLAGS.
> >     >
> >     >
> >     > Looking at those other patches in the series, they don't seem to
> >     > be conditional on the distro feature.
> >     >
> >     > Are those changes valid for a build with and without freethreadin=
g
> ?
> >
> >     Yes!
> >
> >     The main change is in python3-dir.bbclass, and the recipe tweaks
> >     are just adaptations to the fact that only ${PYTHON_DIR} is needed,
> >     not ${PYTHON_DIR}${PYTHON_ABI} from that point.
> >
> >     I was thinking that the introductory mail stressed this enough.
> >
> >
> > Obviously not :)
>
> Obviously. :)
>
> > I didn't get that impression at all from reading the introductory
> > message or looking at the patches themselves.
> >
> > You have the overview knowledge of the feature, why it is
> > useful, how it impacts existing recipes, how the migration would
> > work, what is the compatibility, etc.
>
> I think the Python 3.14 release notes has enough details.
> See also https://www.phoronix.com/news/Python-3.14


The information needs to be distilled into your commit, not left
to the patch reader to go off and read release notes. That's the
point I'm trying to make.


>
>
> With the two series I sent, only a single recipe is left (cmpi-bindings)
> in openembedded-core and meta-openembedded that uses
> the PYTHON_ABI setting explicitly.
>
> Migration (of python scripts) should not be a problem.
> If it worked with 3.14 as is, it works with freethreading enabled.
>
> Compatibility is poor for a lot of modules, that clearly spell this out
> in their pyproject.toml or PKG-INFO:
>
>      "Programming Language :: Python :: Free Threading :: 1 - Unstable"
>
> or something not quite production level support.
> It's still experimental for 3rd party modules, despite being officially
> supported for the interpreter and built-in modules in 3.14.
>
> This is the reason this was an RFC series.
>
> Anyway, the reason I was experimenting with this was that
> with heavily threaded python code, an import storm can cause
> a crash in 3.12.11 or the manually updated 3.13.12 in Yocto 5.3 in
> importlib._bootstrap according to the backtrace.
>
> I would like to see if Python 3.14 (with and without freethreading)
> fixes such crashes.
>

Definitely worth putting in the RFC as well, the motivation for
the change matters!



>
> > The patch reader doesn't, so that all needs to be clearly
> > supplied.
>
> Maybe next time for v2 after I have a complete image
> successfully built with freethreading enabled.
>

Ack'd

Bruce



>
> >
> > Bruce
> >
> >
> >
> >     FWIW, less than 30 recipes was spelling the latter out in
> >     openembedded-core and meta-openembedded combined.
> >
> >     > That's the type of information, along with the benefits of enabli=
ng
> >     > this would be information expected in a 0/N introductory patch.
> >     >
> >     > Cheers,
> >     >
> >     > Bruce
> >     >
> >     >
> >     >     All of the changes included here were successfully build
> tested,
> >     >     except for the gdb-cross-canadian change. That one failed, bu=
t
> >     >     it's included for completeness.
> >     >
> >     >     Quite a few of python modules were build tested for native an=
d
> >     >     target builds, including python3-pytorch from my meta-python-=
ai
> >     >     with reduced RDEPENDS because e.g. python3-onnx there failed
> >     >     to build with freethreading enabled.
> >     >
> >     >     All in all, this series at least allows to get things going.
> >     >     Though maybe not for Yocto 6.0, as it's quite late.
> >     >
> >     >     Best regards,
> >     >     Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi
> >     >
> >     >     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >     >     Links: You receive all messages sent to this group.
> >     >     View/Reply Online (#233874):
> >     > https://lists.openembedded.org/g/openembedded-core/message/233874
> >     >     Mute This Topic:
> https://lists.openembedded.org/mt/118499141/1050810
> >     >     Group Owner: openembedded-core+owner@lists.openembedded.org
> >     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
> >     >     <mailto:openembedded-core%2Bowner@lists.openembedded.org
> >     <mailto:openembedded-core%252Bowner@lists.openembedded.org>>
> >     >     Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub
> >     >     [bruce.ashfield@gmail.com]
> >     >     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >     >
> >     >
> >     >
> >     > --
> >     > - Thou shalt not follow the NULL pointer, for chaos and madness
> await thee at its end
> >     > - "Use the force Harry" - Gandalf, Star Trek II
> >     >
> >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000009cba6f064dd9ee20
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 25, 2026 at 9:51=
=E2=80=AFAM B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n &lt;<a href=3D"mailto:zb=
oszor@gmail.com">zboszor@gmail.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">2026. 03. 25. 14:17 keltez=C3=A9ssel, Bru=
ce Ashfield =C3=ADrta:<br>
&gt;<br>
&gt;<br>
&gt; On Wed, Mar 25, 2026 at 9:13=E2=80=AFAM B=C3=B6sz=C3=B6rm=C3=A9nyi Zol=
t=C3=A1n &lt;<a href=3D"mailto:zboszor@gmail.com" target=3D"_blank">zboszor=
@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A02026. 03. 25. 14:01 keltez=C3=A9ssel, Bruce Ashfiel=
d =C3=ADrta:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; On Wed, Mar 25, 2026 at 7:31=E2=80=AFAM Zoltan=
 Boszormenyi via <a href=3D"http://lists.openembedded.org" rel=3D"noreferre=
r" target=3D"_blank">lists.openembedded.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://lists.openembedded.org" rel=
=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &lt;<a href=3D"http://lists.openembedded.org" =
rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org</a>&gt; =
&lt;zboszor=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=3D=
"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0This patchset allows turnin=
g on Python freethreading by using<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0a new DISTRO_FEATURES setti=
ng:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0DISTRO_FEATURES +=3D &quot;=
python_freethreading&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0and optionally:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0DISTRO_FEATURES_NATIVE +=3D=
 &quot;python_freethreading&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0The change to python3-dir.b=
bclass is crucial, as all python module<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0build helper classes rely o=
n it.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0I also added native variant=
s of some settings because another<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0series against meta-openemb=
edded is needed to complete this one.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0In that, the change to the =
fontforge recipe relies on the native<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0setting for setting BUILD_L=
DFLAGS.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Looking at those other patches in the series, =
they don&#39;t seem to<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; be conditional=C2=A0on the distro feature.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Are those changes valid for a build with and w=
ithout freethreading ?<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Yes!<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0The main change is in python3-dir.bbclass, and the =
recipe tweaks<br>
&gt;=C2=A0 =C2=A0 =C2=A0are just adaptations to the fact that only ${PYTHON=
_DIR} is needed,<br>
&gt;=C2=A0 =C2=A0 =C2=A0not ${PYTHON_DIR}${PYTHON_ABI} from that point.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0I was thinking that the introductory mail stressed =
this enough.<br>
&gt;<br>
&gt;<br>
&gt; Obviously not :)<br>
<br>
Obviously. :)<br>
<br>
&gt; I didn&#39;t get that impression at all from reading the introductory<=
br>
&gt; message or looking at the patches themselves.<br>
&gt;<br>
&gt; You have the overview knowledge of the feature, why it is<br>
&gt; useful, how it impacts existing recipes, how the migration would<br>
&gt; work, what is the compatibility, etc.<br>
<br>
I think the Python 3.14 release notes has enough details.<br>
See also <a href=3D"https://www.phoronix.com/news/Python-3.14" rel=3D"noref=
errer" target=3D"_blank">https://www.phoronix.com/news/Python-3.14</a></blo=
ckquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-size=
:small">The information needs to be distilled into your commit, not left</d=
iv><div class=3D"gmail_default" style=3D"font-size:small">to the patch read=
er to go off and read release notes. That&#39;s the</div><div class=3D"gmai=
l_default" style=3D"font-size:small">point I&#39;m trying to make.<br>=C2=
=A0</div></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
With the two series I sent, only a single recipe is left (cmpi-bindings)<br=
>
in openembedded-core and meta-openembedded that uses<br>
the PYTHON_ABI setting explicitly.<br>
<br>
Migration (of python scripts) should not be a problem.<br>
If it worked with 3.14 as is, it works with freethreading enabled.<br>
<br>
Compatibility is poor for a lot of modules, that clearly spell this out<br>
in their pyproject.toml or PKG-INFO:<br>
<br>
=C2=A0=C2=A0 =C2=A0 &quot;Programming Language :: Python :: Free Threading =
:: 1 - Unstable&quot;<br>
<br>
or something not quite production level support.<br>
It&#39;s still experimental for 3rd party modules, despite being officially=
<br>
supported for the interpreter and built-in modules in 3.14.<br>
<br>
This is the reason this was an RFC series.<br>
<br>
Anyway, the reason I was experimenting with this was that<br>
with heavily threaded python code, an import storm can cause<br>
a crash in 3.12.11 or the manually updated 3.13.12 in Yocto 5.3 in<br>
importlib._bootstrap according to the backtrace.<br>
<br>
I would like to see if Python 3.14 (with and without freethreading)<br>
fixes such crashes.<br></blockquote><div><br></div><div><div class=3D"gmail=
_default" style=3D"font-size:small">Definitely worth putting in the RFC as =
well, the motivation for</div><div class=3D"gmail_default" style=3D"font-si=
ze:small">the change matters!</div><br></div><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
<br>
&gt; The patch reader doesn&#39;t, so that all needs to be clearly<br>
&gt; supplied.<br>
<br>
Maybe next time for v2 after I have a complete image<br>
successfully built with freethreading enabled.<br></blockquote><div><br></d=
iv><div><div class=3D"gmail_default" style=3D"font-size:small">Ack&#39;d</d=
iv><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">Bruce</div><br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;<br>
&gt; Bruce<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0FWIW, less than 30 recipes was spelling the latter =
out in<br>
&gt;=C2=A0 =C2=A0 =C2=A0openembedded-core and meta-openembedded combined.<b=
r>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; That&#39;s the type of information, along with=
 the benefits of enabling<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; this would be information expected in a 0/N in=
troductory patch.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Cheers,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Bruce<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0All of the changes included=
 here were successfully build tested,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0except for the gdb-cross-ca=
nadian change. That one failed, but<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0it&#39;s included for compl=
eteness.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Quite a few of python modul=
es were build tested for native and<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0target builds, including py=
thon3-pytorch from my meta-python-ai<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0with reduced RDEPENDS becau=
se e.g. python3-onnx there failed<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0to build with freethreading=
 enabled.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0All in all, this series at =
least allows to get things going.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Though maybe not for Yocto =
6.0, as it&#39;s quite late.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Best regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Zolt=C3=A1n B=C3=B6sz=C3=B6=
rm=C3=A9nyi<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-=3D-=3D-<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Links: You receive all mess=
ages sent to this group.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0View/Reply Online (#233874)=
:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/233874" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/233874</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Mute This Topic: <a href=3D=
"https://lists.openembedded.org/mt/118499141/1050810" rel=3D"noreferrer" ta=
rget=3D"_blank">https://lists.openembedded.org/mt/118499141/1050810</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Group Owner: <a href=3D"mai=
lto:openembedded-core%2Bowner@lists.openembedded.org" target=3D"_blank">ope=
nembedded-core+owner@lists.openembedded.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:openembedded-core%252B=
owner@lists.openembedded.org" target=3D"_blank">openembedded-core%2Bowner@l=
ists.openembedded.org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailt=
o:openembedded-core%252Bowner@lists.openembedded.org" target=3D"_blank">ope=
nembedded-core%2Bowner@lists.openembedded.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:openembedded-core%2525=
2Bowner@lists.openembedded.org" target=3D"_blank">openembedded-core%252Bown=
er@lists.openembedded.org</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Unsubscribe: <a href=3D"htt=
ps://lists.openembedded.org/g/openembedded-core/unsub" rel=3D"noreferrer" t=
arget=3D"_blank">https://lists.openembedded.org/g/openembedded-core/unsub</=
a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0[<a href=3D"mailto:bruce.as=
hfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-=3D-=3D-<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; --<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; - Thou shalt not follow the NULL pointer, for =
chaos and madness await thee at its end<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; - &quot;Use the force Harry&quot; - Gandalf, S=
tar Trek II<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; -- <br>
&gt; - Thou shalt not follow the NULL pointer, for chaos and madness await =
thee at its end<br>
&gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
&gt;<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--0000000000009cba6f064dd9ee20--

