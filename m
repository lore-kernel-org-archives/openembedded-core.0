Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D172CC5B552
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 12:50:46 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.85986.1749559843508213203
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 05:50:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=iERxfnOG;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-453066fad06so19450985e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 05:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1749559842; x=1750164642; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CXDUpNAADCzgaio20h7fEiNRCHm+jfGwIVfhHL+lQdQ=;
        b=iERxfnOGJpNe6+nuF4xxQukWclMy7XOzBOznRgGejBxhIN5lQnFsTgOQXgK4e9Ti42
         TnBtZ0ggEeASVFSTDbOzFkWT/ktmHJsSOh4fF05AKIpi8VXgjpBYRq/qwuAjFa5idesh
         QAmZjlJSSydJ7GOZvWk2WtmYH+gEuYnYALVrw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749559842; x=1750164642;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CXDUpNAADCzgaio20h7fEiNRCHm+jfGwIVfhHL+lQdQ=;
        b=dlBQGVV+G+VGPqBqV/w5jKjeamd/3S3g0tlVFdO+mmxlZ17hO8cDblMHU+wUazGVbf
         g2IuKPaKYxpjkCkAcjjxcAECJmgPMki5WhLjPKIePBpFRSbdupH+c2OKrPynQV7nsbJU
         S7lJx4bEkvpDYdkst4Q+zJ1dZbovpvY/mGXbJCbupKJoJ2LnrhPucbW/3KGi8lCmTdAV
         TxU7PN8A8ZuEbgkuYJhzQRe5UVGck+DXjHa1N3mAinGJ6mPG2cLELsLF0x6cKwdnMhPQ
         6ESYhy5ClQRyEIhpqUAOWJjkxwydScde15DWzjD01+pmS6hPg2M9mFKgFEUUQKZmmnKK
         r4GQ==
X-Gm-Message-State: AOJu0YztJMimWdsHEZpLqdrF13I9C9BIgODn5/p2S+ujYz0GrXZF/cQA
	4cFK7pKehV9/ynVSGrgcba2PHhn7yh7J1Rm3VRYeEHUfoCVxU0LgW2qoBh4gDrWuv8h0f48WUuH
	76D2vJk0UglncDXBt3L/irCBM2+Oa/rMxYzx3VZbL3A==
X-Gm-Gg: ASbGncvz2dbR8CeqZyGUizV+VKWJKNSeFgSRiXaTm26vZKfYdzaoJxk8ETFQjh81fSi
	Lty15JTlC60c7VtmN6x4v77s8Zd/T3KyDEs2elXNh7ebW2CVcyoU5vIakHHUaEMCEUBzNQDEPFh
	s+USLrzMN61Yh2S/xyWmG/IYC1cVE0QiWxq8LNJepLvHU6m3W2/mDhIDEHxobIakCAinaKjzVgA
	0YoIjLm4Q0Xt5c4
X-Google-Smtp-Source: AGHT+IF6+55p8psc8ZRjaUUFQM+nIDWfQr9qWzNm54CW3MH/YLy1duc2E+INeFFW2KUUP8cg3M4qV5aIiDJD8j/HKtY=
X-Received: by 2002:a5d:588a:0:b0:3a5:2ed2:118e with SMTP id
 ffacd0b85a97d-3a53188a883mr13804403f8f.9.1749559841627; Tue, 10 Jun 2025
 05:50:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250609152757.1153027-1-yoann.congal@smile.fr> <3e190ff1-9261-4a13-8c1c-daeb16671b44@cherry.de>
In-Reply-To: <3e190ff1-9261-4a13-8c1c-daeb16671b44@cherry.de>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Tue, 10 Jun 2025 14:50:15 +0200
X-Gm-Features: AX0GCFucU7VUb0_dh3a_BU_w2gND26Tu2_3rek9th2eribLAAKMJ1g3RrnAbrbs
Message-ID: <CAMSfU+50UFfmzHUf+ag9_8-FAau4+ym3+Oe+9G-i97C+2irVDQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] reproducible: allow each layer to define its
 known non-repro packages
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: openembedded-core@lists.openembedded.org, 
	Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="000000000000dfbe6706373724ac"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 12:50:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218350

--000000000000dfbe6706373724ac
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 10 juin 2025 =C3=A0 12:57, Quentin Schulz <quentin.schulz@cherry.de=
> a
=C3=A9crit :

> Hi Yoann,
>
> On 6/9/25 5:27 PM, Yoann Congal via lists.openembedded.org wrote:
> > From: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
> >
> > With this change, layers can use a conf/include/known_non_repro.inc fil=
e
> > to extend the OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES variable with their
> own known
> > non-reproducible packages to make them automatically excluded from the
> > reproducible test.
> >
> > Example of usage, in conf/include/known_non_repro.inc:
> >    OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES +=3D " \
> >          this-package-is-not-reproducible \
> >    "
> >
> > This uses the new "include_all" in the reproducible test and will move
> > the maintenance burden from AB config[0] to the layers themselves.
> >
>
> Isn't this something that could already be handled by a simple
>
> OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES +=3D "this-package-is-not-reproducibl=
e"
>
> in the appropriate layer.conf file by any chance?
>

Yes, I guess that would work (and without adding new code).
I seen so much bad stuff put in layer.conf files that I always forgot that
you can! -_-

Richard, what do you think? Should we switch from
an include_all conf/include/known_non_repro.inc in each layer
to
OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES +=3D " ..." in layer.conf of each layer=
?

Regards,
--=20
Yoann Congal
Smile ECS

--000000000000dfbe6706373724ac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. 10=
 juin 2025 =C3=A0=C2=A012:57, Quentin Schulz &lt;<a href=3D"mailto:quentin.=
schulz@cherry.de">quentin.schulz@cherry.de</a>&gt; a =C3=A9crit=C2=A0:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Yoann,<br>
<br>
On 6/9/25 5:27 PM, Yoann Congal via <a href=3D"http://lists.openembedded.or=
g" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<b=
r>
&gt; From: Guillaume Swaenepoel &lt;<a href=3D"mailto:guillaume.swaenepoel@=
smile.fr" target=3D"_blank">guillaume.swaenepoel@smile.fr</a>&gt;<br>
&gt; <br>
&gt; With this change, layers can use a conf/include/known_non_repro.inc fi=
le<br>
&gt; to extend the OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES variable with their =
own known<br>
&gt; non-reproducible packages to make them automatically excluded from the=
<br>
&gt; reproducible test.<br>
&gt; <br>
&gt; Example of usage, in conf/include/known_non_repro.inc:<br>
&gt;=C2=A0 =C2=A0 OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES +=3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 this-package-is-not-reproducible \<b=
r>
&gt;=C2=A0 =C2=A0 &quot;<br>
&gt; <br>
&gt; This uses the new &quot;include_all&quot; in the reproducible test and=
 will move<br>
&gt; the maintenance burden from AB config[0] to the layers themselves.<br>
&gt; <br>
<br>
Isn&#39;t this something that could already be handled by a simple<br>
<br>
OEQA_REPRODUCIBLE_EXCLUDED_PACKAGES +=3D &quot;this-package-is-not-reproduc=
ible&quot;<br>
<br>
in the appropriate layer.conf file by any chance?<br></blockquote><div><br>=
</div><div>Yes, I guess that would work (and without adding new code).</div=
><div>I seen so much bad stuff put in=C2=A0layer.conf files that I always f=
orgot that you can! -_-</div><div><br></div><div>Richard, what do you think=
? Should we switch from</div><div>an include_all=C2=A0conf/include/known_no=
n_repro.inc in each layer</div><div>to</div><div>OEQA_REPRODUCIBLE_EXCLUDED=
_PACKAGES +=3D &quot; ...&quot; in layer.conf of each layer?</div><div><br>=
</div><div>Regards,</div></div><span class=3D"gmail_signature_prefix">--=C2=
=A0</span><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><font=
 face=3D"Raleway, regular">Yoann Congal</font><div><font face=3D"Raleway, r=
egular">Smile ECS</font></div></div></div></div>

--000000000000dfbe6706373724ac--

