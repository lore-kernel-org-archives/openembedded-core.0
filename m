Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3C49CD98D2
	for <webhook@archiver.kernel.org>; Sun, 14 Jun 2026 16:07:31 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.111660.1781452314664730644
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 08:51:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Obor+6eP;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: prabhudasuvatala@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-7ddd3d67084so27873347b3.3
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 08:51:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781452314; cv=none;
        d=google.com; s=arc-20240605;
        b=XUYJ8K1r0xgiMp085kw3NbRUbdInJbuwIUulduI609Ma9hNsupGmAmMdznqBjNvTRN
         yw7fHpMAwJjFLBtlJ3Qgx/j/7Ib5wicem+4mAuJJdFZJ1sjG40eviBQZRquYUIEkWeve
         YT3NSr/EgE7n73IlfxJHX5hvJwn7eFl5KYGUTMZfltZUtQB/+BGGJVpz7fo+9Le/axr/
         O6SNWxckqxx01Ne65khzGGnodnRjlaQpVcKWFMXT0bkEsomLXBCNhBvZcSRuZ3VUCUvt
         ldHlu6OzM8hFQL/tO8EZ3VKZiuacZnt/GCChT1Roy9J93Af7OiRudGUx8yRnFYso5SX4
         1QQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/QDjNDzdGjbPqH85B3NbLGc5Rtf9+zI4jXqGHQ6+Qf4=;
        fh=jI69jlrSrGGDfY+DrgeE9SvYQXt8ZZZ/xUosv/3dREk=;
        b=RWn7GBYto/bkMk9k9dTiFMBvJhhBTHtbuCIv+NF9yCKv5w4bxOJnmwctogAaL7dBm6
         aVSEsuuQeeUSvxEyWF9MwAfQr/AvLG/pWiUkHzGyCWYeJbQ02W3/A6SxluLaehkuGrTq
         CDLCIJMfVe/qm/dViKgoOB0Lkn3dxp8tnY79OXpq9vH9R9HSzYLeu8IomDcXfkI6pLOA
         DrMyT5MWXrEBz5QDG7jjBkg/Mud0dRTQyiqDrzXnMctHLyRe2jEwAkyovQh8W1ORZFyr
         UnbR/3NB+8fbjXTM8d07SIokUQLE0sBCvWCzAQO6oci4VYnHLEyZQb1I3IVpv92TVsfy
         u2qg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781452314; x=1782057114; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/QDjNDzdGjbPqH85B3NbLGc5Rtf9+zI4jXqGHQ6+Qf4=;
        b=Obor+6ePNngiXv0miklaMQh5aFxbFyQsd2LS6vyOqZCkDDlST4UYXYeCOM1PkUaQQf
         Qzb4+JsCZoSu1h6VHPB60MNLiMtSV/36rxTSmGVweyGAg6NnK5tr0uws2RZEkLHHmKQo
         Qb2nX88F903ZdpvbakR7YDbniGJeuZ4i/YhxEMEu7QXXPvU9qxOrdhTygq1r9EIdjG5H
         1X+CIZbyE5R/KziWUJF42D5d40SFpwLjfficBc5zAv1nkjkeAYnLJLFuN8M3oI6xKt1c
         2bpX4vsYijxDYv4fCjxAEFftzbmMiDSMIC/6rJYVEGUu6qOC1wwhIZG0jWG2PXLfceyz
         woWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781452314; x=1782057114;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/QDjNDzdGjbPqH85B3NbLGc5Rtf9+zI4jXqGHQ6+Qf4=;
        b=QV9nTCTMam8d0UGSpd8t8FOQCz9wpKT78ab8PWjOj/8RjT6Ssfkc7DskEKeqz1+rMb
         9Ax6ZlzbXmGrqJtRhWy0lmjC7JkQOQj0PZVDjc+wTSWcpisAjhxOYxGqnOb8nIk121xB
         Ha93e2YJPEP22X8/ba5HiZ/GQhkm9b3UuuDi1ekgmaSUVUub7AiQ5rtn78vQz6q90hE+
         dGatMmq4lNid0UnN9MdrRExMdpHYObmk52JqG8x1mE/06IRC+pCCF1ML1IW70F6r5wV4
         olbMCRUPtPNLp/GblcsFhghAXyjSOrB+OmrlVRrttrZzcfbovcqFghI2jc6ojGHj/RII
         zaVw==
X-Gm-Message-State: AOJu0YysHDuOr1Sup1wP7gj3WBDpAgP5NcrV8jPgTlzDvPNLdBKmAu8O
	zBcB3pYYS9junquQZhppZZklDtB8MsFIXiLQyzZMMna7jSXsUXx8PoysYMVT3c+Se3p+GNuBTO/
	rukrUO2h71iu+0bnUIPJyZUdI9RGzBBAPq9ex
X-Gm-Gg: Acq92OGyRoSC0q7GRb91JaWavtjbHzCoZHl4Gi41SpErem/Fap0ycPKLXNPPbKq/Plf
	Tf0Ao4OLTuW0lSK/g9TCJbLKbpj6ywNvmRrCEfxAlTkzXq92KMcYd+QbkjR1RpChOZtosUDQ1IN
	A6OVJUavAw/j+GJi78kDeYHhsVSFVm8nesqhL6ZUugI7NE1r4r1cYz1UYehVbVvChfmyI2XCcMm
	J5QUREOIzQ7j/HvWjx9ecI/l4Bz2MckhsOQvw9NvQeEil1Evkew8cGZov3nuEBMeUdwp3U3BK/j
	sgBOdl2pt9CixdRoiI9BJqt8+JjBTfBlzA==
X-Received: by 2002:a05:690e:12c6:b0:660:446b:7aad with SMTP id
 956f58d0204a3-66278357784mr8464167d50.57.1781452313620; Sun, 14 Jun 2026
 08:51:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260601001057.18589-1-prabhudasuvatala@gmail.com> <DJ4CNOCK804H.O6IBAE2MU9MH@smile.fr>
In-Reply-To: <DJ4CNOCK804H.O6IBAE2MU9MH@smile.fr>
From: prabhu <prabhudasuvatala@gmail.com>
Date: Sun, 14 Jun 2026 21:21:42 +0530
X-Gm-Features: AVVi8CfbB36Rq7FJ8-7wWh0qrJjz36dyY8-IZ7p3w6DJX-afiKFwj8KAPCayvMM
Message-ID: <CAAsmOw7KJdmnJQqCS17dTsjCkWP+eSv9Q5G95waABxdppamhqw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] [scarthgap] conf/machine: fix typos in ARM and x86 README files
To: Jeremy Rosen <jeremy.rosen@smile.fr>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000056746d065438b027"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 16:07:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238799

--00000000000056746d065438b027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

*Hi J=C3=A9r=C3=A9my,*

*I have successfully submitted the backport patch for the wrynose branch to
the list.*


*Thanks a lot!**Prabhudasu*


On Tue, Jun 9, 2026 at 1:15=E2=80=AFPM Jeremy Rosen <jeremy.rosen@smile.fr>=
 wrote:

> Hello Prabhudasu
>
> I could not find an equivalent patch for wrynose (though I did find one
> for master)
> Please submit to wrynose and ping this mail once this is done
>
> thx a lot
> J=C3=A9r=C3=A9my
> On Mon Jun 1, 2026 at 2:10 AM CEST, Prabhudasu Vatala via
> lists.openembedded.org wrote:
> > Correct spelling errors in the machine include README documentation
> > for both ARM and x86 architectures to improve clarity.
> >
> > ARM changes:
> > - Fix TUNE_PKGACH -> TUNE_PKGARCH.
> > - Fix "definiton" -> "definition".
> > - Fix "Curently" -> "Currently".
> > - Fix "specificed" -> "specified".
> >
> > x86 changes:
> > - Fix "define" -> "defined".
> > - Fix "to to" duplication.
> >
> > Signed-off-by: Prabhudasu Vatala <prabhudasuvatala@gmail.com>
> > ---
> >  meta/conf/machine/include/arm/README | 6 +++---
> >  meta/conf/machine/include/x86/README | 4 ++--
> >  2 files changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/meta/conf/machine/include/arm/README
> b/meta/conf/machine/include/arm/README
> > index c5637798e6..bccbb1bdee 100644
> > --- a/meta/conf/machine/include/arm/README
> > +++ b/meta/conf/machine/include/arm/README
> > @@ -10,7 +10,7 @@ of the existence of the "bigendian" feature in a give=
n
> tune.
> >
> >  A small set of ARM specific variables have been defined to allow
> >  TUNE_PKGARCH to be automatically defined.  Optimized tunings must NOT
> > -change the definiton of TUNE_PKGARCH.  TUNE_PKGACH:tune-<tune> will be
> > +change the definition of TUNE_PKGARCH.  TUNE_PKGARCH:tune-<tune> will
> be
> >  ignored.  The format of the package arch is enforced by the TUNE_PKGAR=
CH
> >  default.  The format must be of the form:
> >  <armversion>[t][e][hf][b][-vfp][-neon]
> > @@ -22,14 +22,14 @@ ARMPKGARCH - This is the core package arch componen=
t
> specified by each
> >  tuning.  This is the primary identifier of a tuning.  Usual values are=
:
> >  arm, armv4, armv5, armv6, armv7a, etc.
> >
> > -ARMPKGSFX_THUMB - This is the thumb specific suffix.  Curently it is
> > +ARMPKGSFX_THUMB - This is the thumb specific suffix.  Currently it is
> >  defined in feature-arm-thumb.inc.
> >
> >  ARMPKGSFX_DSP - This is the DSP specific suffix.  Currently this is se=
t
> >  to 'e' when on armv5 and the dsp feature is enabled.
> >
> >  ARMPKGSFX_EABI - This is the eabi specific suffix.  There are currentl=
y
> > -two defined ABIs specificed, standard EABI and Hard Float (VFP) EABI.
> > +two defined ABIs specified, standard EABI and Hard Float (VFP) EABI.
> >  When the callconvention-hard is enabled, "hf" is specified, otherwise
> it
> >  is blank.
> >
> > diff --git a/meta/conf/machine/include/x86/README
> b/meta/conf/machine/include/x86/README
> > index 05aee533a7..f0a1882d81 100644
> > --- a/meta/conf/machine/include/x86/README
> > +++ b/meta/conf/machine/include/x86/README
> > @@ -4,7 +4,7 @@
> >  Most of the items for the X86 architectures are defined in the single
> >  arch-x86 file.
> >
> > -Three ABIs are define, m32, mx32 and m64.
> > +Three ABIs are defined, m32, mx32 and m64.
> >
> >  The following is the list of X86 specific variables:
> >
> > @@ -17,7 +17,7 @@ The TUNE_PKGARCH is defined as follows:
> >  TUNE_PKGARCH =3D ${TUNE_PKGARCH:tune-${DEFAULTTUNE}}
> >
> >  The package architecture for 32-bit targets is historical and generall=
y
> > -set to to match the core compatible processor type, i.e. i386.
> > +set to match the core compatible processor type, i.e. i386.
> >
> >  For 64-bit architectures, the architecture is expected to end in '_64'=
.
> >
>
>

--00000000000056746d065438b027
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p><i>Hi J=C3=A9r=C3=A9my,</i></p><p><i>I have successfull=
y submitted the backport patch for the wrynose branch to the list.</i></p><=
p><i>Thanks a lot!<br></i><i>Prabhudasu</i></p><br></div><br><div class=3D"=
gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Tue, Jun 9, 2026 at 1:15=E2=80=AFPM Jeremy Rosen &lt;<a href=3D"mailto:jer=
emy.rosen@smile.fr">jeremy.rosen@smile.fr</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">Hello Prabhudasu<br>
<br>
I could not find an equivalent patch for wrynose (though I did find one<br>
for master)<br>
Please submit to wrynose and ping this mail once this is done<br>
<br>
thx a lot<br>
J=C3=A9r=C3=A9my<br>
On Mon Jun 1, 2026 at 2:10 AM CEST, Prabhudasu Vatala via <a href=3D"http:/=
/lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openemb=
edded.org</a> wrote:<br>
&gt; Correct spelling errors in the machine include README documentation<br=
>
&gt; for both ARM and x86 architectures to improve clarity.<br>
&gt;<br>
&gt; ARM changes:<br>
&gt; - Fix TUNE_PKGACH -&gt; TUNE_PKGARCH.<br>
&gt; - Fix &quot;definiton&quot; -&gt; &quot;definition&quot;.<br>
&gt; - Fix &quot;Curently&quot; -&gt; &quot;Currently&quot;.<br>
&gt; - Fix &quot;specificed&quot; -&gt; &quot;specified&quot;.<br>
&gt;<br>
&gt; x86 changes:<br>
&gt; - Fix &quot;define&quot; -&gt; &quot;defined&quot;.<br>
&gt; - Fix &quot;to to&quot; duplication.<br>
&gt;<br>
&gt; Signed-off-by: Prabhudasu Vatala &lt;<a href=3D"mailto:prabhudasuvatal=
a@gmail.com" target=3D"_blank">prabhudasuvatala@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/conf/machine/include/arm/README | 6 +++---<br>
&gt;=C2=A0 meta/conf/machine/include/x86/README | 4 ++--<br>
&gt;=C2=A0 2 files changed, 5 insertions(+), 5 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/conf/machine/include/arm/README b/meta/conf/machine/=
include/arm/README<br>
&gt; index c5637798e6..bccbb1bdee 100644<br>
&gt; --- a/meta/conf/machine/include/arm/README<br>
&gt; +++ b/meta/conf/machine/include/arm/README<br>
&gt; @@ -10,7 +10,7 @@ of the existence of the &quot;bigendian&quot; featur=
e in a given tune.<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 A small set of ARM specific variables have been defined to allow=
 <br>
&gt;=C2=A0 TUNE_PKGARCH to be automatically defined.=C2=A0 Optimized tuning=
s must NOT <br>
&gt; -change the definiton of TUNE_PKGARCH.=C2=A0 TUNE_PKGACH:tune-&lt;tune=
&gt; will be <br>
&gt; +change the definition of TUNE_PKGARCH.=C2=A0 TUNE_PKGARCH:tune-&lt;tu=
ne&gt; will be <br>
&gt;=C2=A0 ignored.=C2=A0 The format of the package arch is enforced by the=
 TUNE_PKGARCH<br>
&gt;=C2=A0 default.=C2=A0 The format must be of the form:<br>
&gt;=C2=A0 &lt;armversion&gt;[t][e][hf][b][-vfp][-neon]<br>
&gt; @@ -22,14 +22,14 @@ ARMPKGARCH - This is the core package arch compone=
nt specified by each<br>
&gt;=C2=A0 tuning.=C2=A0 This is the primary identifier of a tuning.=C2=A0 =
Usual values are:<br>
&gt;=C2=A0 arm, armv4, armv5, armv6, armv7a, etc.<br>
&gt;=C2=A0 <br>
&gt; -ARMPKGSFX_THUMB - This is the thumb specific suffix.=C2=A0 Curently i=
t is <br>
&gt; +ARMPKGSFX_THUMB - This is the thumb specific suffix.=C2=A0 Currently =
it is <br>
&gt;=C2=A0 defined in feature-arm-thumb.inc.<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 ARMPKGSFX_DSP - This is the DSP specific suffix.=C2=A0 Currently=
 this is set <br>
&gt;=C2=A0 to &#39;e&#39; when on armv5 and the dsp feature is enabled.<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 ARMPKGSFX_EABI - This is the eabi specific suffix.=C2=A0 There a=
re currently <br>
&gt; -two defined ABIs specificed, standard EABI and Hard Float (VFP) EABI.=
=C2=A0 <br>
&gt; +two defined ABIs specified, standard EABI and Hard Float (VFP) EABI.=
=C2=A0 <br>
&gt;=C2=A0 When the callconvention-hard is enabled, &quot;hf&quot; is speci=
fied, otherwise it <br>
&gt;=C2=A0 is blank.<br>
&gt;=C2=A0 <br>
&gt; diff --git a/meta/conf/machine/include/x86/README b/meta/conf/machine/=
include/x86/README<br>
&gt; index 05aee533a7..f0a1882d81 100644<br>
&gt; --- a/meta/conf/machine/include/x86/README<br>
&gt; +++ b/meta/conf/machine/include/x86/README<br>
&gt; @@ -4,7 +4,7 @@<br>
&gt;=C2=A0 Most of the items for the X86 architectures are defined in the s=
ingle<br>
&gt;=C2=A0 arch-x86 file.<br>
&gt;=C2=A0 <br>
&gt; -Three ABIs are define, m32, mx32 and m64.<br>
&gt; +Three ABIs are defined, m32, mx32 and m64.<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 The following is the list of X86 specific variables:<br>
&gt;=C2=A0 <br>
&gt; @@ -17,7 +17,7 @@ The TUNE_PKGARCH is defined as follows:<br>
&gt;=C2=A0 TUNE_PKGARCH =3D ${TUNE_PKGARCH:tune-${DEFAULTTUNE}}<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 The package architecture for 32-bit targets is historical and ge=
nerally<br>
&gt; -set to to match the core compatible processor type, i.e. i386.<br>
&gt; +set to match the core compatible processor type, i.e. i386.<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 For 64-bit architectures, the architecture is expected to end in=
 &#39;_64&#39;.<br>
&gt;=C2=A0 <br>
<br>
</blockquote></div>

--00000000000056746d065438b027--

