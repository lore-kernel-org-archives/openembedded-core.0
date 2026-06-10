Return-Path: <saisneha196@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4688CD98C7
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 08:48:46 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15509.1781081320358668517
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 01:48:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MgzPciGr;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: saisneha196@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-bec449d0af2so777198566b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 01:48:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781081319; cv=none;
        d=google.com; s=arc-20240605;
        b=TrAf5K8folUlgczN7j9TsAKOx+asIR9F7fc1qPxNnANb4SQ+oTE/1JlTPnctKHcD54
         X5fSSkKL6ChQc0LH+tmwxeCONeQDu3qB5STQGV7VERWQlIg0QlSrf+soxQXlzw+hQt/8
         1n3yJw9knCmw9A76sJyRswjYyRY3rIjV7KrqRbPL392qxHaIbpaef/edJc54dpdw24Xp
         XzIkFUifFXN79/bHkFztCBvcxNoM6Fcn6IyiUuGVMJ3hZJXjPZuzzgY7v/lsui4v62O6
         Aqk68fat1xZfHs0zgs+1GzuAO29Mg1aeU/9dgINavg6EjevFOoFQ/iUofXltjPIRDWXE
         C/8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3/nq9u/mMxajTGIr4UDG67OwseiL7hxM7eetefS3sUw=;
        fh=1g3M+6+dSFkd6tyVGUOVZpIJ4U7niBwWFelV9mCw8Ns=;
        b=fZ9+NkDkZz/D+NQcWVoyKn+Q21KIj2PWCWFCAE3LaJmnzWhMsJXSnBrMZW3rVqT2V2
         ITP/9uaT7rqqKVNcadgpm+/devD2SOSpOjYsw/wB+XjIwkNGQP2mSoVryiY/FBIGBps7
         2hnA03rQ+aUEYyp8NsZW4/tAyCm64Rh69mC9d1bxWgc4Dp2mensErqT3Hvf3D1tzuvLU
         rIPeyDYNWNPrjBh5t8VTPHWoLMFOPBjJBiK4vEdjqnZpwgL74uSSJ0PFX+U4l6KTP88r
         V7V1r5zHWcTK9YYxLFmy2+aivqaKVtiOv34KPa26hLMbBdQbQig9O2a+cwGvrkrbeMyO
         vJqA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781081319; x=1781686119; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3/nq9u/mMxajTGIr4UDG67OwseiL7hxM7eetefS3sUw=;
        b=MgzPciGrQ/rDf4uXFqBHyxyp8hkweC18dL5VPo/v2T50cF1cyTjlazxwhNS2UQgKCe
         HXoavOcKNqLcY545TxXjo/o3v+7QuiMB8QZ0pQNNIltSf2pbBWLJ7h2VDYvpAIxS7FyL
         dLyoFyUJso8Kh5TpAXfjvBazZNi2td003hwcFC1JBZHjYzMuxyn6UdFMTyTp63v2wO7j
         rhgRpRy/q6mWCStAfnRwoFo0Ov7zq+yFYEz7ablux6GJoBeba1qjSjtZHebohn+tlmAe
         te6vKVwOFY1QAJhO3jU+RjWLJz5QshPtgHt8HIEzhUipOh6U9K5xZhDv3X3cXfphH/vl
         MkRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781081319; x=1781686119;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3/nq9u/mMxajTGIr4UDG67OwseiL7hxM7eetefS3sUw=;
        b=cu7pSTqaAPEsk31F+CzP34QBmVWXHIIqjrxYAtipE4nte5IpEsB2PAZfNsGQiDDjKY
         Hwhaj7Q2/snZFBiH8fN+vqvPJ3m1W85wquj9U4WqKdkIDRTW8j0iKkA1m7M6z6Ev+MPN
         jniMUl3ndqHNPiXxaVRVx6GV+W9bfKayIw7C7FK03JOshO6UR46m1P/PjmGyGvxoxf29
         q7hRwiZ4pBL6yXMlRC4aDrycECzr2iYD7oYcVytpdJJzx4Q+J9/6AAYMvAz1X7UPibId
         pmaRJs68xjLMi7ADv/y5WaiV4OScojxjlNIdmjXXrSRSpaavNmAhLh1EBfrCkurUYh2R
         cdvA==
X-Forwarded-Encrypted: i=1; AFNElJ8CVmoqy34XVfrZKJDBY6FnbG+R6guhozpAFxuwQvgUVcTbC1sz5V90KU9PAcYIQnRDp8KMf7c7XWk9lMeig2mT+Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwHacafcUX3CQMfZpWSTpWt857MX9YNFi/Rs/j1he/Ai8s3TGgk
	+drNpClXob6iJkMrt1px/QSMSO+Y2AaP4oPHUua12Xv/pgmTHHpbvVWFjXi10p216W9Btne+ACn
	VYwyKmS1fQNZ0ci0o+Glj4AG7Kp3XC1s=
X-Gm-Gg: Acq92OFI5LeuVOva5XTZlJHePZeiVjw+rf8BQ44uVNhUyO7wSYlmR27CJisO2sK8IsQ
	y63aZk1If3Gw9D+5tjxfRYLNR/C5AOZbtg+bdnF8k5np+tlwiHoe17z0GVxA5E0V99ZASuXbBg6
	P9Vp+eS5fWaQWOdn5o951VRnulP6QEI8ZAuuv2WYhfmd9T6pwfjHYVmqZTR8WTpJvdZ+52Q9auP
	SdzTh3Rszhe5S15i5Befgkwq+8BE5tYKz05ewQ9qV8UPji5hGnefPgGnGeSufpPm7gaFbv7O3Du
	Qlymufr/cClAmceq4wxmuyUXgNRnbtEq3OLNlBlMqC8f56Uq+g==
X-Received: by 2002:a17:906:6a01:b0:bed:87c:b24e with SMTP id
 a640c23a62f3a-bf3721513damr1136326766b.29.1781081318440; Wed, 10 Jun 2026
 01:48:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260602062940.3107241-1-saisneha196@gmail.com>
 <20260602062940.3107241-4-saisneha196@gmail.com> <DIYF5VYJ6KMJ.3EBC3FMJXOLPL@smile.fr>
 <18B61AC5A22983D6.29982@lists.openembedded.org> <CANcU11dYfjDYfDq152H-Yanv3gJ__b=dUewq+sKL=hHKrisQvw@mail.gmail.com>
 <80ef3660a609e1f080a6ec80872674cbcadb87c0.camel@linuxfoundation.org>
 <CANcU11fqh7bRUo=h9C3woRYnpmwnbUjBkGwpbhs1QV4rhnm4Cw@mail.gmail.com>
 <a5e0dca3e1eba8b86203fa63ba0c6bc7ce228a21.camel@linuxfoundation.org>
 <CANcU11cf4sH1racrRawKMQ8+622W_1qT33ou=Z06YG=38FJJcA@mail.gmail.com>
 <ad7d4fdddcf28b3e7daba91cb0e7d100e9bb5f4b.camel@linuxfoundation.org>
 <18B7A1AFC3F003C5.267903@lists.openembedded.org> <CANcU11dmkfUA7E8=Qm8O1J8VZLHEv=FW3Gjm2bVpHqvsi7AvUg@mail.gmail.com>
 <954159bfc9f674bde4da8e0133143589e4945e65.camel@linuxfoundation.org>
In-Reply-To: <954159bfc9f674bde4da8e0133143589e4945e65.camel@linuxfoundation.org>
From: Sai Sneha <saisneha196@gmail.com>
Date: Wed, 10 Jun 2026 14:18:26 +0530
X-Gm-Features: AVVi8CcHsRCtX3hCKkLgZr1HSvR8vXMwY6NmY3vQB1j-fb-L1auX6iOowmUlh3s
Message-ID: <CANcU11ecMWXsxua-yBMdOwhsNY1YuUrANgL1shSecVWwYXQ_mA@mail.gmail.com>
Subject: Re: [OE-core] insane.bbclass: add missing-srcrev QA check for SCM URIs
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Yoann Congal <yoann.congal@smile.fr>, openembedded-core@lists.openembedded.org, 
	corentin.guillevic@smile.fr, martin@geanix.com, paul@pbarker.dev, 
	mathieu.dubois-briand@bootlin.com
Content-Type: multipart/alternative; boundary="0000000000004d41da0653e24fce"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 08:48:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238324

--0000000000004d41da0653e24fce
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

I tested this locally. You are right that the error message is
already clear:

"Please set a valid SRCREV for url..."

However parsing halts for ALL recipes with:

"ERROR: Parsing halted due to errors"

Not just the offending recipe. Is that acceptable behavior or
does it need fixing?

Best regards,
Sai Sneha


On Wed, 10 Jun 2026 at 12:03=E2=80=AFPM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2026-06-10 at 11:47 +0530, Sai Sneha wrote:
> >
> > I tested BB_NO_NETWORK:layer-core =3D "1" and found that it does
> > not prevent the parse crash for the case where SRCREV is
> > completely missing.
> >
> > The crash happens in srcrev_internal_helper() which raises
> > FetchError before any network access is attempted =E2=80=94 so
> > BB_NO_NETWORK never gets checked. The BB_NO_NETWORK flag would
> > only help for the case where SRCREV is set to a floating
> > branch/tag and latest_revision() is called, since _lsremote()
> > calls check_network_access() there.
>
> FetchError isn't a crash, the code is finding there is a problem and
> raising an exception. The exception should say what the issue is.
>
> Doesn't that mean that case is already covered and we don't need to do
> anything further?
>
> > So it seems like two separate fixes are needed:
> >
> > 1. For missing SRCREV =E2=80=94 something needs to prevent the parse
> >    crash in srcrev_internal_helper(). Would it be appropriate
> >    to check BB_NO_NETWORK in srcrev_internal_helper() itself
> >    before raising FetchError?
>
> I don't understand why we need to trap this, then handle it again
> later?
>
> Cheers,
>
> Richard
>

--0000000000004d41da0653e24fce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div style=3D"font-size:inherit">Hi Richard,<br style=3D"font-size:inh=
erit"><br style=3D"font-size:inherit">I tested this locally. You are right =
that the error message is <br style=3D"font-size:inherit">already clear:<br=
 style=3D"font-size:inherit"><br style=3D"font-size:inherit">  &quot;Please=
 set a valid SRCREV for url...&quot;<br style=3D"font-size:inherit"><br sty=
le=3D"font-size:inherit">However parsing halts for ALL recipes with:<br sty=
le=3D"font-size:inherit"><br style=3D"font-size:inherit">  &quot;ERROR: Par=
sing halted due to errors&quot;<br style=3D"font-size:inherit"><br style=3D=
"font-size:inherit">Not just the offending recipe. Is that acceptable behav=
ior or <br style=3D"font-size:inherit">does it need fixing?<br style=3D"fon=
t-size:inherit"><br style=3D"font-size:inherit">Best regards,<br style=3D"f=
ont-size:inherit">Sai Sneha<br style=3D"font-size:inherit"></div><br></div>=
<div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, 10 Jun 2026 at 12:03=E2=80=AFPM, Richard Purdi=
e &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@=
linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On Wed, 2026-06-10 at 11:47 +0530, Sai Sneha wrote:<br>
&gt; <br>
&gt; I tested BB_NO_NETWORK:layer-core =3D &quot;1&quot; and found that it =
does <br>
&gt; not prevent the parse crash for the case where SRCREV is <br>
&gt; completely missing.<br>
&gt; <br>
&gt; The crash happens in srcrev_internal_helper() which raises <br>
&gt; FetchError before any network access is attempted =E2=80=94 so <br>
&gt; BB_NO_NETWORK never gets checked. The BB_NO_NETWORK flag would <br>
&gt; only help for the case where SRCREV is set to a floating <br>
&gt; branch/tag and latest_revision() is called, since _lsremote() <br>
&gt; calls check_network_access() there.<br>
<br>
FetchError isn&#39;t a crash, the code is finding there is a problem and<br=
>
raising an exception. The exception should say what the issue is.<br>
<br>
Doesn&#39;t that mean that case is already covered and we don&#39;t need to=
 do<br>
anything further?<br>
<br>
&gt; So it seems like two separate fixes are needed:<br>
&gt; <br>
&gt; 1. For missing SRCREV =E2=80=94 something needs to prevent the parse <=
br>
&gt; =C2=A0=C2=A0=C2=A0crash in srcrev_internal_helper(). Would it be appro=
priate <br>
&gt; =C2=A0=C2=A0=C2=A0to check BB_NO_NETWORK in srcrev_internal_helper() i=
tself <br>
&gt; =C2=A0=C2=A0=C2=A0before raising FetchError?<br>
<br>
I don&#39;t understand why we need to trap this, then handle it again<br>
later?<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div></div>

--0000000000004d41da0653e24fce--

