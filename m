Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1DA2C52D6F
	for <webhook@archiver.kernel.org>; Wed, 21 Aug 2024 09:43:42 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.16194.1724233421392081441
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Aug 2024 02:43:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AFV4DY+P;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: rybczynska@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2d3b36f5366so4552242a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 02:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724233421; x=1724838221; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QFkn2tfBQOMSJcPxp5A3g5w3GPYD1ixEOVG+nsMbRX0=;
        b=AFV4DY+P0cBQiCRvPlMV/xtTAu+r11LbhexObkTbHxwf0pbWcj/K0g2TWv5KkZ1ahS
         YySMDfmY1ZZOGP2WH7Yj/1JjSibCtJLOchAQi6N+q8gT2HiMNoIC4BLfA9YEN8GeINRm
         We46YxMig5TD1KN0cCv+v+kGogs5j6dnY2/Na5UWTjIdN3mYF+Z1Xamf9+A0CkgDCeEc
         kgD/KH0r4baVJXUsui7YwtLgB6zk9n02XIWr099gMTJXO0LZYqRLPn5Lxeir4aubIsQG
         st65WrkShG5ao2TlnaQGMv+lvij1m8mJhCAP5Y5tdxGTEWGy7RcjNIhMs3oMDHjqkmlk
         SK2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724233421; x=1724838221;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QFkn2tfBQOMSJcPxp5A3g5w3GPYD1ixEOVG+nsMbRX0=;
        b=mYHjuZwOWOasei9hmrABFMKrpRELrURTSLTpHQnyfKw1HM/X2QjLkqB0aXLu0zJD0M
         hQyPD9XJtNQofgYaBhXlnW8GNSPLSXNucHZmpak37ytcgNa1oSEcUfNT+tXqZXYvxAZq
         1L1uGNHOZqaJcE/+JxGwnUdctVl3al4gyaxWgtg76fp9fW/zJ6gvOb9YgXfonaKwFs5r
         LuCnSRMxeHC+bo4f7gddq5j+vdJmR78lDDUnBcfpq9rnqaDfe9xU3cq7gfJ6FBqOdYNi
         aTZ2/UJUGlULhSdy6/1OfWWpMoSjLZLYKa40sZsb5JIZSPnxGaVVjWQVt6ycWOtKhxji
         Avsw==
X-Gm-Message-State: AOJu0YyLsJLnIEZDWiy1LTyZVOJk6ui0043d1gS42VbTibPfOO07deJ+
	qdJSl4Ei4PTTrKnozUbkqxzkY7oC2lDtv89rhIsBX3/0goAzzfUalAmREZC99gATx5EVFTUIonF
	2fMpQ6/tiJ1YXpAzpMQjMwlmiDp4=
X-Google-Smtp-Source: AGHT+IE3mW4rZKkHoY4ehnTsNGmS5Wf9Mmq957fRETvKhVV2DLdnEvT1DCXpZX2xEN9jz2MO5g7iyz/lJt8VIxy/fXA=
X-Received: by 2002:a17:90b:4c41:b0:2cb:50fa:b01e with SMTP id
 98e67ed59e1d1-2d5ea4c9efbmr1576263a91.41.1724233420419; Wed, 21 Aug 2024
 02:43:40 -0700 (PDT)
MIME-Version: 1.0
References: <20240821051721.70558-1-marta.rybczynska@ygreky.com> <c1d1e39a3ef77428e273ecaed59ef1406869dd38.camel@linuxfoundation.org>
In-Reply-To: <c1d1e39a3ef77428e273ecaed59ef1406869dd38.camel@linuxfoundation.org>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Wed, 21 Aug 2024 11:43:28 +0200
Message-ID: <CAApg2=Q13RRBn3Xg3j3w-P8B-9WMgtyD=RRexmetYwuV0y=gdA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cve-check: disable the text format by default
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Marta Rybczynska <marta.rybczynska@ygreky.com>
Content-Type: multipart/alternative; boundary="00000000000088d4b306202e6006"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Aug 2024 09:43:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203581

--00000000000088d4b306202e6006
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 21, 2024 at 10:58=E2=80=AFAM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2024-08-21 at 07:17 +0200, Marta Rybczynska via
> lists.openembedded.org wrote:
> > The cve-check JSON format has been present for a long time now,
> > and this is a moment to disable the TEXT output.
> >
> > The JSON format is easier to parse by automatic tools, so users
> > should have migrated already.
> >
> > Signed-off-by: Marta Rybczynska <marta.rybczynska@ygreky.com>
> > ---
> >  meta/classes/cve-check.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/cve-check.bbclass
> b/meta/classes/cve-check.bbclass
> > index 0d7c8a5835..41f2b8304f 100644
> > --- a/meta/classes/cve-check.bbclass
> > +++ b/meta/classes/cve-check.bbclass
> > @@ -61,7 +61,7 @@ CVE_CHECK_REPORT_PATCHED ??=3D "1"
> >  CVE_CHECK_SHOW_WARNINGS ??=3D "1"
> >
> >  # Provide text output
> > -CVE_CHECK_FORMAT_TEXT ??=3D "1"
> > +CVE_CHECK_FORMAT_TEXT ??=3D "0"
> >
> >  # Provide JSON output
> >  CVE_CHECK_FORMAT_JSON ??=3D "1"
>
> I'm wondering if we should remove this at this point? I'd prefer the
> build generated machine readable data and then external tools can be
> used to create text based reports of that if/as/where needed rather
> than complicate the code class code with potentially many different
> report formats...
>
> Do we have a tool which can generate a text report from the json?
>
>
I want to remove it :)

But I also adhere to good practices of deprecating first, removing later.

I do have a conversion script, so we can ask people to use it if they want
the old format. The question is if people really still use it.

The removal is a little more complex, because there are some dependencies
between variables. We did it in the yocto-vex-tool code, and it took a
little time.

There will also be a bigger cleanup in the docs when the removal happens...

So, no strong opinion from my side. However, given that the freeze is
really soon,
deprecation looks like a minimum target.

Regards,
Marta

--00000000000088d4b306202e6006
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 21, 2024 at 10:58=E2=80=
=AFAM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.o=
rg">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">On Wed, 2024-08-21 at 07:17 +0200, Ma=
rta Rybczynska via <a href=3D"http://lists.openembedded.org" rel=3D"norefer=
rer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; The cve-check JSON format has been present for a long time now,<br>
&gt; and this is a moment to disable the TEXT output.<br>
&gt; <br>
&gt; The JSON format is easier to parse by automatic tools, so users<br>
&gt; should have migrated already.<br>
&gt; <br>
&gt; Signed-off-by: Marta Rybczynska &lt;<a href=3D"mailto:marta.rybczynska=
@ygreky.com" target=3D"_blank">marta.rybczynska@ygreky.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/classes/cve-check.bbclass | 2 +-<br>
&gt; =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.b=
bclass<br>
&gt; index 0d7c8a5835..41f2b8304f 100644<br>
&gt; --- a/meta/classes/cve-check.bbclass<br>
&gt; +++ b/meta/classes/cve-check.bbclass<br>
&gt; @@ -61,7 +61,7 @@ CVE_CHECK_REPORT_PATCHED ??=3D &quot;1&quot;<br>
&gt; =C2=A0CVE_CHECK_SHOW_WARNINGS ??=3D &quot;1&quot;<br>
&gt; =C2=A0<br>
&gt; =C2=A0# Provide text output<br>
&gt; -CVE_CHECK_FORMAT_TEXT ??=3D &quot;1&quot;<br>
&gt; +CVE_CHECK_FORMAT_TEXT ??=3D &quot;0&quot;<br>
&gt; =C2=A0<br>
&gt; =C2=A0# Provide JSON output<br>
&gt; =C2=A0CVE_CHECK_FORMAT_JSON ??=3D &quot;1&quot;<br>
<br>
I&#39;m wondering if we should remove this at this point? I&#39;d prefer th=
e<br>
build generated machine readable data and then external tools can be<br>
used to create text based reports of that if/as/where needed rather<br>
than complicate the code class code with potentially many different<br>
report formats...<br>
<br>
Do we have a tool which can generate a text report from the json?<br>
<br></blockquote><div><br></div><div>I want to remove it :)</div><div><br><=
/div><div>But I also adhere to good practices of deprecating first, removin=
g later.</div><div><br></div><div>I do have a conversion script, so we can =
ask people to use it if they want</div><div>the old format. The question is=
 if people really still use it. <br></div><div><br></div><div>The removal i=
s a little more complex, because there are some dependencies</div><div>betw=
een variables. We did it in the yocto-vex-tool code, and it took a little t=
ime.<br></div><div><br></div><div>There will also be a bigger cleanup in th=
e docs when the removal happens...</div><div><br></div><div>So, no strong o=
pinion from my side. However, given that the freeze is really soon,</div><d=
iv>deprecation looks like a minimum target.<br></div><div><br></div><div>Re=
gards,</div><div>Marta<br></div><div><br></div></div></div>

--00000000000088d4b306202e6006--

