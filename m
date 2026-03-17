Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9A81FB5EAD
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 14:38:40 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.77475.1773758318376295634
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Mar 2026 07:38:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IKrrpQU2;
 spf=pass (domain: gmail.com, ip: 209.85.161.54, mailfrom: quaresma.jose@gmail.com)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-67bb3a6c6f3so504206eaf.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 07:38:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773758317; cv=none;
        d=google.com; s=arc-20240605;
        b=QOPXxqsYWtfrxi/Nox8x+DCLqTSuKB7XJqLLQEp/c3EphOWo+97Qn6VDllOlt4Kven
         omXgK3mj8Rw4q47UvzTRKeaHB03yplce4aYSqaVwsko5U2WgjQ/0t0j/eKspTGQlAwAA
         ezg3n4YSuqhEUSwivFxwUjVb7Z+lXYD/EmAOgkR0faZDYmQdqyT42lEdmNIAhVNyCGT+
         D2ClW5/JVDTxMvLRs5h4hZW/agBtchAgf4x8hNkGczCN18DgZ9GStRuT4SpjceyHNjY5
         rt06cqNxw+PpcMgm2NuajmBMHZOoEzoPq7AmI5T18XByVAO098auOL7e863EkFNETwQF
         0nSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=e9Mnwl4QScVHi3ZP3RE0iAcrsWC5cOKYS7f1JLEMaTU=;
        fh=5xELTUkEFpUNpJ4/InEGVlvwTr8mYP/ofJkVqhImH18=;
        b=BJW6fhead4Mbapkb7SK8M8SNUXOshCuS/L376kDA7gE5ACzUIQ8ZiIQeXqYUz2KK6R
         v/Uhj1ZPZbuurEp0JPIHzi6MQ298AZEov704gmxEWR2cdfuhRomnGk2KNbfjWpB2bdcZ
         iX+DAPKLj8N2y8btNC/MKIvZjYLwOWW3lpQHhvaBmbdVqjgtKnJ8yqw1waTm4KiyV82a
         16LK013sfONAJ5TV4Atz/R7mo0XdylTGXsKt4h8eehivjEGk/Et6I+otEn5cVOn77fvR
         Iq1n4dm2ajl1XPux4Zby3APRnlIXWSheeCtuY17mJYSBVPm9FuWkoRWAsNdUxF5NU9VV
         WU0w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773758317; x=1774363117; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e9Mnwl4QScVHi3ZP3RE0iAcrsWC5cOKYS7f1JLEMaTU=;
        b=IKrrpQU2bHOY+3t4k1GF17ME0q0qAJq7Bi1rJbT6Tn5Vr/c8UdU9/l0vXzO+a8eoPZ
         wjUcrwu3AF/r9i0WdqTK8exix3eXU6u56OYJXs2EQ9MmFCGW+/8HAeJOlmC2HxkMl9KI
         Qgd56C4xRhtE9730MAOVTwg3X81epTthoVYHwndOEPzaxeO/RIRBWwmIbjN21EzUthIU
         WQ4wmIwzipMM8KIf8KbVAWEIqt4izqydP+/gRjXo6C2xmurJVN1ONkM6Wd01KZWqrmmH
         2Vz1xuMWZxggh+Zdxr9ATaYPmV2jMppz+1U3zxdIMI/DaPmQCTOHFPm2vDrtvdAfahko
         HUyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773758317; x=1774363117;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e9Mnwl4QScVHi3ZP3RE0iAcrsWC5cOKYS7f1JLEMaTU=;
        b=R54jPcJNaFR/mIkSP+sb0eZlQlEZ6WrAp5o9Rr3GlwGUyp7LBi1+zBohC9LhJBHKUo
         +JEpGDJzSBCgSfalG07zq5FDPpZh3nr6Ta1vrwe/D6hLivLJaTw8kfaLNhaQ5vNbOeo6
         Tw1T+c1seWlgfLah68Z/FMdCLnPfTqcrbJoodMVvOKWK3DCjxpp89Auzu1Q6YlNrkvU/
         PIoJbj2aITHKDeg4hojgqf6rEB4nS7RbfcoJwxMgr6NYsrSZCEScWrMrZFbKldX24RmL
         zL35CSaTsC4/w3ig+CD+wG5NcpZAX8krDP425jGEcQMyubPWEilR7bN7rWZlQeg9DpGQ
         GzEA==
X-Gm-Message-State: AOJu0YyKRZWV4nyu0r6KEuQASozr+h+DyG1Q1rtcc/lQ3Tfa/+hBpIBc
	qj71ZDB99HamJ6e/h8dGbF0p3x36Zl2CvrFmE81TlIR+q4ys9EVqUozZDV4yb7004inOTi+VuCE
	/7ZpAIk8MC8n5Bo2M824TrB+8eiQ+EXI=
X-Gm-Gg: ATEYQzyW64JjpGwrccWV7Dng9LqcUubrrut0cJb0hWJJ5/6dNmxAWJOTelF3bHIGP/3
	zSTVv+dyNAEVe1BdMFQXJTAPMiGPWXIPh4zY6sz89ujguzuXCz/4ymmoHHYsUvsR67pRQug7S6W
	88QoNbVkZiL3AYJmXvHans4Oiq+kiBhFlSm0FCmiMuDyByLEiubAy6MF4cWv69mLeJSy7drUqm2
	y6mdml9XDDGN4OxQdwF1DaWRYxHMQ+hLC/aP+ewQkBop50bA8i29K/P4t6+V4pv0S6va+yAdbUc
	sLVgekSWtg==
X-Received: by 2002:a05:6820:480f:b0:679:c55a:df0b with SMTP id
 006d021491bc7-67c049dac9bmr2030276eaf.37.1773758317178; Tue, 17 Mar 2026
 07:38:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260317120859.317294-2-jose.quaresma@foundries.io> <55beda2c3e095bdbd466713ae23d25cb80fb95a4.camel@linuxfoundation.org>
In-Reply-To: <55beda2c3e095bdbd466713ae23d25cb80fb95a4.camel@linuxfoundation.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 17 Mar 2026 14:38:24 +0000
X-Gm-Features: AaiRm533INWv8IEoCqykWNpRBwz2RBIki-M4gs91YkU7VOM0OPJ1FUPS2Fk2E8k
Message-ID: <CANPvuRmbvbnN4QWtCKiR+Ez5y7Qg+Tuw+xFNvyen5vHZTHmyRg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sanity: condition hash equivalence warnings to
 when it is in use.
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@foundries.io>, Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Content-Type: multipart/alternative; boundary="00000000000069b3a8064d394a91"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 14:38:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233326

--00000000000069b3a8064d394a91
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu (ter=C3=A7a,
17/03/2026 =C3=A0(s) 12:16):

> On Tue, 2026-03-17 at 12:09 +0000, Jose Quaresma via
> lists.openembedded.org wrote:
> > From: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
> >
> > The warnings about the hash equivalence are only valid when it the hash
> equivalence
> > signature is being used, and for that we have to check the
> BB_SIGNATURE_HANDLER variable.
> > We also have to consider the case where the variable BB_HASHSERVE is no=
t
> defined.
> >
> > This fix the warning that is displayed when using the basic signature
> hash, OEBasicHash.
> >
> > > WARNING:
> > > You are using a local hash equivalence server but have configured an
> sstate mirror.
> > > This will likely mean no sstate will match from the mirror.
> > > You may wish to disable the hash equivalence use (BB_HASHSERVE),
> > > or use a hash equivalence server alongside the sstate mirror.
> >
> > Signed-off-by: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
> > ---
> >  meta/classes-global/sanity.bbclass | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/classes-global/sanity.bbclass
> b/meta/classes-global/sanity.bbclass
> > index a170c3f5f5..e8eab1cdfe 100644
> > --- a/meta/classes-global/sanity.bbclass
> > +++ b/meta/classes-global/sanity.bbclass
> > @@ -1007,8 +1007,8 @@ def check_sanity_everybuild(status, d):
> >                      check_symlink(mirror_base, d)
> >
> >      # Check sstate mirrors aren't being used with a local hash server
> and no remote
> > -    hashserv =3D d.getVar("BB_HASHSERVE")
> > -    if d.getVar("SSTATE_MIRRORS") and hashserv and
> hashserv.startswith("unix://") and not d.getVar("BB_HASHSERVE_UPSTREAM"):
> > +    hashserv =3D "" if d.getVar("BB_SIGNATURE_HANDLER") !=3D "OEEquivH=
ash"
> else d.getVar("BB_HASHSERVE") or ""
> > +    if d.getVar("SSTATE_MIRRORS") and hashserv.startswith("unix://")
> and not d.getVar("BB_HASHSERVE_UPSTREAM"):
> >          bb.warn("You are using a local hash equivalence server but hav=
e
> configured an sstate mirror. This will likely mean no sstate will match
> from the mirror. You may wish to disable the hash equivalence use
> (BB_HASHSERVE), or use a hash equivalence server alongside the sstate
> mirror.")
>
> Good catch, thanks.
>
> Since we're in python, we don't need to make this all one line and I
> suspect it might be more readable if you put the two conditions on
> separate lines and add a level of indentation.
>
> "" if d.getVar("BB_SIGNATURE_HANDLER") !=3D "OEEquivHash" else
> d.getVar("BB_HASHSERVE") or ""
>
> isn't easily parsable.
>

It's true, it's the conditional operator in C, but impossible to read in
Python. I sent a v2.

Jose


> Cheers,
>
> Richard
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000069b3a8064d394a91
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Richard Purdie =
&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@li=
nuxfoundation.org</a>&gt; escreveu (ter=C3=A7a, 17/03/2026 =C3=A0(s) 12:16)=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, 2026-0=
3-17 at 12:09 +0000, Jose Quaresma via <a href=3D"http://lists.openembedded=
.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote=
:<br>
&gt; From: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@oss.qualcomm.c=
om" target=3D"_blank">jose.quaresma@oss.qualcomm.com</a>&gt;<br>
&gt; <br>
&gt; The warnings about the hash equivalence are only valid when it the has=
h equivalence<br>
&gt; signature is being used, and for that we have to check the BB_SIGNATUR=
E_HANDLER variable.<br>
&gt; We also have to consider the case where the variable BB_HASHSERVE is n=
ot defined.<br>
&gt; <br>
&gt; This fix the warning that is displayed when using the basic signature =
hash, OEBasicHash.<br>
&gt; <br>
&gt; &gt; WARNING:<br>
&gt; &gt; You are using a local hash equivalence server but have configured=
 an sstate mirror.<br>
&gt; &gt; This will likely mean no sstate will match from the mirror.<br>
&gt; &gt; You may wish to disable the hash equivalence use (BB_HASHSERVE),<=
br>
&gt; &gt; or use a hash equivalence server alongside the sstate mirror.<br>
&gt; <br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@oss.q=
ualcomm.com" target=3D"_blank">jose.quaresma@oss.qualcomm.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/classes-global/sanity.bbclass | 4 ++--<br>
&gt; =C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/=
sanity.bbclass<br>
&gt; index a170c3f5f5..e8eab1cdfe 100644<br>
&gt; --- a/meta/classes-global/sanity.bbclass<br>
&gt; +++ b/meta/classes-global/sanity.bbclass<br>
&gt; @@ -1007,8 +1007,8 @@ def check_sanity_everybuild(status, d):<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 check_symlink(mirror_ba=
se, d)<br>
&gt; =C2=A0<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0 # Check sstate mirrors aren&#39;t being used =
with a local hash server and no remote<br>
&gt; -=C2=A0=C2=A0=C2=A0 hashserv =3D d.getVar(&quot;BB_HASHSERVE&quot;)<br=
>
&gt; -=C2=A0=C2=A0=C2=A0 if d.getVar(&quot;SSTATE_MIRRORS&quot;) and hashse=
rv and hashserv.startswith(&quot;unix://&quot;) and not d.getVar(&quot;BB_H=
ASHSERVE_UPSTREAM&quot;):<br>
&gt; +=C2=A0=C2=A0=C2=A0 hashserv =3D &quot;&quot; if d.getVar(&quot;BB_SIG=
NATURE_HANDLER&quot;) !=3D &quot;OEEquivHash&quot; else d.getVar(&quot;BB_H=
ASHSERVE&quot;) or &quot;&quot;<br>
&gt; +=C2=A0=C2=A0=C2=A0 if d.getVar(&quot;SSTATE_MIRRORS&quot;) and hashse=
rv.startswith(&quot;unix://&quot;) and not d.getVar(&quot;BB_HASHSERVE_UPST=
REAM&quot;):<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bb.warn(&quot;You are=
 using a local hash equivalence server but have configured an sstate mirror=
. This will likely mean no sstate will match from the mirror. You may wish =
to disable the hash equivalence use (BB_HASHSERVE), or use a hash equivalen=
ce server alongside the sstate mirror.&quot;)<br>
<br>
Good catch, thanks.<br>
<br>
Since we&#39;re in python, we don&#39;t need to make this all one line and =
I<br>
suspect it might be more readable if you put the two conditions on<br>
separate lines and add a level of indentation.<br>
<br>
&quot;&quot; if d.getVar(&quot;BB_SIGNATURE_HANDLER&quot;) !=3D &quot;OEEqu=
ivHash&quot; else d.getVar(&quot;BB_HASHSERVE&quot;) or &quot;&quot;<br>
<br>
isn&#39;t easily parsable.<br></blockquote><div><br></div><div>It&#39;s tru=
e, it&#39;s the conditional operator in C, but impossible to read in Python=
. I sent a v2.</div><div><br>Jose</div><div><br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></=
div></div></div>

--00000000000069b3a8064d394a91--

