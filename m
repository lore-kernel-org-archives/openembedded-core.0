Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24C54CCFA03
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 07:57:24 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9856.1762415836495024833
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 23:57:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=WXmFhuaj;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so5176875e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1762415835; x=1763020635; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=S0UBIPukwo9oEZ45T+TRtQ1JGZKnZI8HOTCnNR23pW0=;
        b=WXmFhuajptigvNEeQMy9so31MCtsXGgH7KCpU6qa9SDY+G3Ltxaifj5VVoKtqOjMqQ
         pHtKx24yVsXhc2hjTzdqZ+VwSfBF04vGMph5/qv0063zi1zum4+H9bEOA6GSCthiBMGE
         cpjqo/IDUWIsTp6uk8s0BmY9JH4adVDxUHMbM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762415835; x=1763020635;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S0UBIPukwo9oEZ45T+TRtQ1JGZKnZI8HOTCnNR23pW0=;
        b=rHQZpZEpOvwwU57j1mfDB/tq4YrtOxPoBSAtcrMFxXgKVHlpY0PqoFU3PbIapnFICe
         wpOlAfSPhfwNp1bD1HIXaAGH7b/zVu1KReL/yN42SdIXihsqVEFn/89lphVRTHX4Esxp
         WLsXGAaodAJkbHj/3cWwOxgOnDx75c4wdOZwUEun5UQ53FRy6K3/rV6OGyBE00VI/oYS
         K0Rxg1miEKhjcxbNaO/DTauWQFqXuOWgx/DvIqMufQK2bQtllDUHefJXUSGtITM/dfzm
         tj6xG5XiMg8DzP88QzJtz8/uFxM9kUKU8VWVI//XD4qIfmGGotN/fLTA/f0jFBy2wqrk
         L9bA==
X-Gm-Message-State: AOJu0YzxlLHxqRclXBdTn2OFQmrCM65nG5eCCrQ/naAE87N6uEjvWWIu
	y8sDUtToSLjutNP/FuXVMjGVwBePR25Kw4zpYX31hPukiVZzRjmIQnSD8bBgidKZwU8Ty52IVpn
	HZ50qfpFQCTehRFpiyk5N1eOoGMEP3RdiUygJLCbIYw==
X-Gm-Gg: ASbGncvQTlndbu7dRFuw2qXZsQmo0FUSyKzfDwWxDPtislf2QOgvvcFIodnPUSekqXF
	PRWYrCod8VY2Rk8fiWs1FOMi5/YgC4ZwSApDUWnKCSbJSHRIGKkWgLoJgi3nCEDsFy/U0UEeI4O
	fQ+kYlBqEv9AWV+wGhV+w9cdohFurB3K16eNBgh+J8uKKHSszUCHxBjZupWVFcGXC7iEAZM7p1q
	j0X1+GbI/i0ybO2mlTkPFtMfZgt4nbmcW1/7DqkHmL93HPdgQJBHCjGuT+P1UQh+HDxAQKFhM5O
	WfSz/oD8zpLV5x/zuyKG4UFoaeHHDQ==
X-Google-Smtp-Source: AGHT+IEnNCXdiVNilyYybCcXh1AYQBCu8wQbSrHb3yCGn02+5g2A1KYBy+CRjbvZqyhdDD4fcJCmqZKs70oY6OyNpEI=
X-Received: by 2002:a05:600c:8b6f:b0:471:3b5:aeac with SMTP id
 5b1f17b1804b1-4775cdca35dmr63966215e9.15.1762415834743; Wed, 05 Nov 2025
 23:57:14 -0800 (PST)
MIME-Version: 1.0
References: <20251105232333.2800541-1-yoann.congal@smile.fr> <CAJdd5Ga4O9AWOCg=NrOnwdd_m_u24L4OS+cqB0ojmT39zFhj1A@mail.gmail.com>
In-Reply-To: <CAJdd5Ga4O9AWOCg=NrOnwdd_m_u24L4OS+cqB0ojmT39zFhj1A@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 6 Nov 2025 08:56:48 +0100
X-Gm-Features: AWmQ_bkF9Ii7N-H1mMraiuqzgWmFn1OQ0f1SuX5w14hbqrc80tuOR6ejGsnpNG8
Message-ID: <CAMSfU+7tVyd36J5ssaKeyPK4cxCtTsrgkOVejvXbaUM+n9fRMg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bitbake-setup.schema.json: Add schema for
 "{THISDIR}" bb-layer
To: Joshua Watt <jpewhacker@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000c6d2280642e86918"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 07:57:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225964

--000000000000c6d2280642e86918
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 6 nov. 2025 =C3=A0 00:35, Joshua Watt <jpewhacker@gmail.com> a =C3=
=A9crit :

> On Wed, Nov 5, 2025 at 4:23=E2=80=AFPM Yoann Congal via lists.openembedde=
d.org
> <yoann.congal=3Dsmile.fr@lists.openembedded.org> wrote:
> >
> > From: Yoann Congal <yoann.congal@smile.fr>
> >
> > A "bb-layers" element can either:
> > * start with "{THISDIR}/meta-xxx", then "meta-xxx" is found relative to
> >   the configuration file,
> > * or not, the layer is found where bitbake-setup has cloned
> >   the layer from the "sources" list (usually a layers/ directory)
> >
> > Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> > ---
> >  meta/files/bitbake-setup.schema.json | 15 ++++++++++++++-
> >  1 file changed, 14 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/files/bitbake-setup.schema.json
> b/meta/files/bitbake-setup.schema.json
> > index 5101b0de53e..65d6abd16b0 100644
> > --- a/meta/files/bitbake-setup.schema.json
> > +++ b/meta/files/bitbake-setup.schema.json
> > @@ -41,7 +41,20 @@
> >                                  "type": "array",
> >                                  "description": "List of BitBake layers
> to include",
> >                                  "items": {
> > -                                    "type": "string"
> > +                                    "oneOf": [
> > +                                        {
> > +                                            "type": "string",
> > +                                            "description": "Path
> relative to the directory containing the configuration file",
> > +                                            "pattern": "^\\{THISDIR\\}=
/"
> > +                                        },
> > +                                        {
> > +                                            "type": "string",
> > +                                            "description": "Path
> relative to the directory created by bitbake-setup to store sources",
> > +                                            "not": {
> > +                                                "pattern":
> "^\\{THISDIR\\}/"
> > +                                            }
> > +                                        }
> > +                                    ]
>
> This seems tautological to me; can you give an example of a string
> that would fail to validate?
>

It is tautological. As of now, every string will validate (I did not want
to limit what a path can be).
But semantically, whether they start with "{THISDIR}/" changes where the
path is looked up, so the description changes between branches.
This is coming from the bitbake-setup documentation patch review :
https://lists.openembedded.org/g/bitbake-devel/message/18267


> >                                  }
> >                              },
> >                              "oe-template": {
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#225929):
> https://lists.openembedded.org/g/openembedded-core/message/225929
> > Mute This Topic: https://lists.openembedded.org/mt/116144544/3616693
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> JPEWhacker@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--000000000000c6d2280642e86918
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"auto"><div><br><br><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">Le jeu. 6 nov. 2025 =C3=A0 00:35,=
 Joshua Watt &lt;<a href=3D"mailto:jpewhacker@gmail.com" target=3D"_blank">=
jpewhacker@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Wed, Nov 5, 2025 at 4:23=E2=80=AFPM Yoa=
nn Congal via <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">lists.openembedded.org</a><br>
&lt;yoann.congal=3D<a href=3D"mailto:smile.fr@lists.openembedded.org" rel=
=3D"noreferrer" target=3D"_blank">smile.fr@lists.openembedded.org</a>&gt; w=
rote:<br>
&gt;<br>
&gt; From: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" rel=3D=
"noreferrer" target=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
&gt;<br>
&gt; A &quot;bb-layers&quot; element can either:<br>
&gt; * start with &quot;{THISDIR}/meta-xxx&quot;, then &quot;meta-xxx&quot;=
 is found relative to<br>
&gt;=C2=A0 =C2=A0the configuration file,<br>
&gt; * or not, the layer is found where bitbake-setup has cloned<br>
&gt;=C2=A0 =C2=A0the layer from the &quot;sources&quot; list (usually a lay=
ers/ directory)<br>
&gt;<br>
&gt; Signed-off-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.f=
r" rel=3D"noreferrer" target=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/files/bitbake-setup.schema.json | 15 ++++++++++++++-<br>
&gt;=C2=A0 1 file changed, 14 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/files/bitbake-setup.schema.json b/meta/files/bitbake=
-setup.schema.json<br>
&gt; index 5101b0de53e..65d6abd16b0 100644<br>
&gt; --- a/meta/files/bitbake-setup.schema.json<br>
&gt; +++ b/meta/files/bitbake-setup.schema.json<br>
&gt; @@ -41,7 +41,20 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;ar=
ray&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;description&quot;: &=
quot;List of BitBake layers to include&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;items&quot;: {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: =
&quot;string&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;oneOf&quot;:=
 [<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;type&quot;: &quot;string&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;description&quot;: &quot;Path relative to the directory co=
ntaining the configuration file&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;pattern&quot;: &quot;^\\{THISDIR\\}/&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;type&quot;: &quot;string&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;description&quot;: &quot;Path relative to the directory cr=
eated by bitbake-setup to store sources&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;not&quot;: {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;pattern&quot;: &quot;^\\{THISDIR\\}/&quot;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ]<br>
<br>
This seems tautological to me; can you give an example of a string<br>
that would fail to validate?<br></blockquote></div></div><div dir=3D"auto">=
<br></div><div dir=3D"auto">It is tautological. As of now, every string wil=
l validate (I did not want to limit what a path=C2=A0can be).</div><div dir=
=3D"auto">But semantically, whether they start with &quot;{THISDIR}/&quot; =
changes where the path is looked up, so the description changes between bra=
nches.</div><div>This is coming from the bitbake-setup documentation patch =
review :=C2=A0<a href=3D"https://lists.openembedded.org/g/bitbake-devel/mes=
sage/18267">https://lists.openembedded.org/g/bitbake-devel/message/18267</a=
>=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gm=
ail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;oe-template&quot;: {<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#225929): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/225929" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://lists.openembedded.org/g/openembedded-core/message/2259=
29</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11614454=
4/3616693" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.op=
enembedded.org/mt/116144544/3616693</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" rel=3D"noreferrer" target=3D"_blank">openembedded-core+owner@lis=
ts.openembedded.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.o=
penembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:JPEWhacker=
@gmail.com" rel=3D"noreferrer" target=3D"_blank">JPEWhacker@gmail.com</a>]<=
br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div></div>
</div>

--000000000000c6d2280642e86918--

