Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25581C28B2E
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 13:17:51 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.8507.1741699065852446315
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Mar 2025 06:17:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FcBt2uts;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5499da759e8so3117612e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 06:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741699064; x=1742303864; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2yKESk/GEGVhPAwVENPjPPj+Ub5XxamfS8n1j6ZIpgg=;
        b=FcBt2uts6ovRYlE918MVzKyKk9rNgpusKFoXC5+oCk0i9aa63bKRDNLJyxOhFL4dSG
         aLHUdorJ1gTqOU3fVayNapiCbIXH72mwLCyHONNoH15M5Y15puF05aY5E8/77bL7u9ef
         lELFx90JEWmL6hL1xc0koFuGzqn4iW9h6PyJR9qpIz1jnFW/KywQIOfC45+c7zPXpueF
         W0EdCP73Qxs1K+/e2t7E5Tozr+oC5wD7UpWMuC2hEttdAPAFQIlacWCnLwq531Ugx8hH
         FN2iQgZ+nhrlXNyR+TZZTI9sIKqxmjDnYkM/Mqn5h6fs0beqQXCU70g5zUWFYJq/YaX4
         AsoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741699064; x=1742303864;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2yKESk/GEGVhPAwVENPjPPj+Ub5XxamfS8n1j6ZIpgg=;
        b=O1PhdFKPdZ6d6l5rCcNllUu6HIoA6SuYJ7LzU52fAlq8sC0HxW89UMUBb7Gt39X/x3
         YNswkcy5gyAxWpOJKLGKZl10Co4VaKSFXVlXHse7yOnS5eSxp87RSvZtkzUvSFer9Eyq
         YEJnweu2YHN0IGPr+3BrvUGZvO1xudhY0NXRirLNzxRbtNTDcH/Sk8fVVbUEu5DUf8+w
         zZvAxSPZLrwH5b0y0Z7NlEAJsb6eVuIc+1U+ncL+URBJi2c/cDfmAMoij1msAOf3+BVw
         cShdwbL5BtGXvzXdkXcif4K3DoimbDumK2N3+2z8I8Y3ETum15UMUbJcgeZ/2GvJExAh
         D30A==
X-Gm-Message-State: AOJu0YwGzhE1jgM0DbDDP0Qa4sQYPcwtdUx/1Salr9NeCrD80RlYe4At
	Ue4OFUkgChfyXKD4VE2iaJfWrOz179eInRNK3Js3/1FVCwkNx0vvxAS7zHIOZigZ1S12GF1aKi0
	WWiZ8NJtB7aJshZBTf+Y7lUkIpQ0=
X-Gm-Gg: ASbGncsP2820opfffxQeZ5nNfBNFqU4N8ic/NlY3WV400YL9aEe3WTCZXnIQGI+2G3a
	/sUv1Mk7iqOHF8qtUB0J+ssXCKVjjsdFXlT6aJX/HkkrSLlqdgyDPFGb9mfTp27SRNRAJzcNM8J
	KiF/w+AnE7vuIcdwQPvkckCeVgcAOts3H00VUrPmZ0TRDdSIJOIAXOINNe9A==
X-Google-Smtp-Source: AGHT+IF0nN5RYQJalDy8z1Ur40uWv435SI3eHe55sIoo2fbzLiIPJfEyB7AhuX3Q/IF7GX4HmnGAcRmLPD4NWye7Fyc=
X-Received: by 2002:a05:6512:2398:b0:545:3035:f0bb with SMTP id
 2adb3069b0e04-549abd648c5mr1469625e87.22.1741699063598; Tue, 11 Mar 2025
 06:17:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250306212007.44880-1-JPEWhacker@gmail.com> <76e6fb1b98cc7269d4290bb4e92d0adf2d3567d7.camel@linuxfoundation.org>
In-Reply-To: <76e6fb1b98cc7269d4290bb4e92d0adf2d3567d7.camel@linuxfoundation.org>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 11 Mar 2025 07:17:33 -0600
X-Gm-Features: AQ5f1JpKvFatCkqomODzCDROHuM1jYrNgQWvNlpufLXOIV1EAZmgZ428bPFL37g
Message-ID: <CAJdd5GY=pQ85g4M6gYHq2y7JKTT4BK+A2mi8dTJ6APnapvuozA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] lib: spdx30_tasks: Handle patched CVEs
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Ross Burton <ross.burton@arm.com>
Content-Type: multipart/alternative; boundary="000000000000fdd7d9063010e963"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 13:17:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212568

--000000000000fdd7d9063010e963
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 11, 2025, 7:01=E2=80=AFAM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2025-03-06 at 14:20 -0700, Joshua Watt via
> lists.openembedded.org wrote:
> > The code to iterate over patched CVEs (e.g. those patched by a .patch
> > file in SRC_URI) was accidentally omitted when writing the SPDX 3
> > handling. Add it in now
> >
> > [YOCTO #15789]
> >
> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > ---
> >  meta/lib/oe/spdx30_tasks.py | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/meta/lib/oe/spdx30_tasks.py
> > b/meta/lib/oe/spdx30_tasks.py
> > index e3e5dbc7427..e20bb0c86f3 100644
> > --- a/meta/lib/oe/spdx30_tasks.py
> > +++ b/meta/lib/oe/spdx30_tasks.py
> > @@ -498,6 +498,16 @@ def create_spdx(d):
> >      # Add CVEs
> >      cve_by_status =3D {}
> >      if include_vex !=3D "none":
> > +        for cve in oe.cve_check.get_patched_cves(d):
> > +            spdx_cve =3D build_objset.new_cve_vuln(cve)
> > +            build_objset.set_element_alias(spdx_cve)
> > +
> > +            cve_by_status.setdefault("Patched", {})[cve] =3D (
> > +                spdx_cve,
> > +                "patched",
> > +                "",
> > +            )
> > +
> >          for cve in d.getVarFlags("CVE_STATUS") or {}:
> >              decoded_status =3D oe.cve_check.decode_cve_status(d, cve)
> >
>
> I worry this has increased the build time by around 10 mins (~25%):
>
>
> https://valkyrie.yocto.io/pub/non-release/20250311-54/testresults/buildpe=
rf-alma8/perf-alma8-vk_master_20250311090119_046a92d351.html


Ok. Let me see what I can do about that

>
>
> Cheers,
>
> Richard
>
>
>

--000000000000fdd7d9063010e963
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 11, 2025, 7:01=E2=80=
=AFAM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.o=
rg">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">On Thu, 2025-03-06 at 14:20 -0700, Joshua Watt via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; The code to iterate over patched CVEs (e.g. those patched by a .patch<=
br>
&gt; file in SRC_URI) was accidentally omitted when writing the SPDX 3<br>
&gt; handling. Add it in now<br>
&gt; <br>
&gt; [YOCTO #15789]<br>
&gt; <br>
&gt; Signed-off-by: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com"=
 target=3D"_blank" rel=3D"noreferrer">JPEWhacker@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/lib/oe/spdx30_tasks.py | 10 ++++++++++<br>
&gt; =C2=A01 file changed, 10 insertions(+)<br>
&gt; <br>
&gt; diff --git a/meta/lib/oe/spdx30_tasks.py<br>
&gt; b/meta/lib/oe/spdx30_tasks.py<br>
&gt; index e3e5dbc7427..e20bb0c86f3 100644<br>
&gt; --- a/meta/lib/oe/spdx30_tasks.py<br>
&gt; +++ b/meta/lib/oe/spdx30_tasks.py<br>
&gt; @@ -498,6 +498,16 @@ def create_spdx(d):<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0 # Add CVEs<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0 cve_by_status =3D {}<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0 if include_vex !=3D &quot;none&quot;:<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for cve in oe.cve_check.ge=
t_patched_cves(d):<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sp=
dx_cve =3D build_objset.new_cve_vuln(cve)<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bu=
ild_objset.set_element_alias(spdx_cve)<br>
&gt; +<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cv=
e_by_status.setdefault(&quot;Patched&quot;, {})[cve] =3D (<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 spdx_cve,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 &quot;patched&quot;,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 &quot;&quot;,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 )<=
br>
&gt; +<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for cve in d.getVarFl=
ags(&quot;CVE_STATUS&quot;) or {}:<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 decoded_status =3D oe.cve_check.decode_cve_status(d, cve)<br>
&gt; =C2=A0<br>
<br>
I worry this has increased the build time by around 10 mins (~25%):<br>
<br>
<a href=3D"https://valkyrie.yocto.io/pub/non-release/20250311-54/testresult=
s/buildperf-alma8/perf-alma8-vk_master_20250311090119_046a92d351.html" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://valkyrie.yocto.io/pub/=
non-release/20250311-54/testresults/buildperf-alma8/perf-alma8-vk_master_20=
250311090119_046a92d351.html</a></blockquote></div></div><div dir=3D"auto">=
<br></div><div dir=3D"auto">Ok. Let me see what I can do about that</div><d=
iv dir=3D"auto"><div class=3D"gmail_quote gmail_quote_container"><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex"><br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
</blockquote></div></div></div>

--000000000000fdd7d9063010e963--

