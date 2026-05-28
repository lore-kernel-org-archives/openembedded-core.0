Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10566CD5BD5
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 21:19:16 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16138.1779988562469930379
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2026 10:16:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GQKYpqSm;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: adityags2004@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3938cc204a7so93977211fa.1
        for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 10:16:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779988561; cv=none;
        d=google.com; s=arc-20240605;
        b=gyyfYOVZ8Q3uWKtJWsjWk+7X1NIpJQnABS6iWrAf8kAXt6yjPjZpx7fFNQ+hiPFtX0
         sBgwzP8CkvMZQzJtdW81F6yevNi1aVvCC2UVoZYokFIIuZVkrY5BHLBDsy6bztILVOXz
         9iJwzGRHP8d9zusW+YCpHUQleK4tLOQAX6lTl6IqUalGvPNWWN6pi8o8M0RLZJcsMzXz
         wiZd1JWA53vqtVuhBsMAwNGxaFwT8jbSfrtOod1r2PIbRXVuXsSYVWs9WNDdCiUy9kV0
         2DoMzSYCzlFcxZS4WdsAvBsyvrzKGsv4cFlOqTFQS9gpD536VAsFw3zC4IyPfX0CZz84
         4i6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BgPDxN5qauTB6d7+8qezOULtwJyGPYLxjPabkEfqzlM=;
        fh=HV0pswH5GB6UcRGvoGB5+EfNlB78N+UPlRP5L/jvmvA=;
        b=I1a761uvFVcCwatcmlKGzb4lebWnKsudVhn5KYIaEaxCvKxWasaC4YETr/nAyB55VH
         +46dXnSqPOa26BBtJSWqoHOu3DuCM2W69+NNHEx5fpzNHG0xRBouTsVK/vd4/evaruq1
         3+5Yf33VPX/1cA9mssE7bQKxpLxCH8gmAV4OGltnIuOgJq3dIVAezyG+52zmgQ0L2Ghy
         Nw/Ck0SbQ9N2IgElhPoUAjeIY0NFMD8bHoCaF13Sm69rlgzbbvOjv5mpNP6U73qnI3iv
         I42OC7g1CgxWPZZn9Gb/0YiECuuANzl6Bk0f50+OcKDHeNJGFcFh7uIweQN3MF920yup
         +UTQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779988561; x=1780593361; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BgPDxN5qauTB6d7+8qezOULtwJyGPYLxjPabkEfqzlM=;
        b=GQKYpqSms+Q63LlMdAzmjyGbAvdPN2g24IfE36X0EboSj5oHZn1un6ah2uoWM6dAUv
         xmpJGnhXpNqmlvUFr5ZzrbYs6+kSqeVJ916RWQk9190mRGNDS96DXDKyxQ6MTGFK+0Dl
         gA7hwt6+qfkntZkmlWLV0G3/ZP1t9TdROn/hVrEnSfxAOSi50qNYiM0ZVi/+dEb0YFIs
         pXo3hqrqasOwU75sOqPG+qHWqJidkT7kjVm9Ez4dbRfVOFtx6u8w4MBCUJBk/EVsOcXj
         Hz8eqNINWEq7/jF0yQxQDDnkFKXRdLtN/qw1uMHSVwv3OzrMGdE+zfrcQJ8k5KGWc470
         cpJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779988561; x=1780593361;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BgPDxN5qauTB6d7+8qezOULtwJyGPYLxjPabkEfqzlM=;
        b=FjR1d3WvkznWDv1t5i76+vsv8i4ARtuI83W3pE18fzcprh7alFfaWmqRW/Xs9Qm8zD
         PDIMIYinldOyNs186gSg36qq1FtEEMucETckkV6cqFC0Ph5VjSR4IPzjmPqAqYKvP/Iy
         84pon56JbsZ74ZDTpqt91KnaSFq0KQkVQRgoLuVw7Qi0/a7hE9FGrwVEnxtREboVnAYh
         qbAHXEDGvRMHkI6my6GhnIZLLw8WxUpaKGaH9PhIola4Sio/lLtDcPJ+9L/cp+XJ3u6y
         FDt0HJZ9QgPzitStbWPZS09Dxy+umOIu1NkDcngXuC8wt11BAuPLkxpQCdnHtW17TDbC
         +WHw==
X-Forwarded-Encrypted: i=1; AFNElJ/WGGxeBd+4urPITJIEb+zNOWoP6NP9i7s/E3SdJr7nKWiuxkDeTH9k29ZCHW5mO1FWIj4YJWWU7h0Xh2xmf4l3mQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxTE97mndiDQtgSAopkKBw2fxUhHtnUjlLfDiCAArWRpP9DDtOe
	dP6vWNK/O9OVhRJm7P7UwkkN9hxOfVNJRsiEv9lwimFG7T7OSLksJ78uUgv5lSuWQNB8BA7hMbB
	7nJKwtrD1T0I28fqdDDdZqHOUrbT+m6w=
X-Gm-Gg: Acq92OEAsO5DrweHG2zZMZ77vAvXZR93G0G5CJUlOm0quJO2Q7Z214otP+fYbftCExG
	hbKkElB/NqeXMurKsqyWZLUKPZlWXZsK/6xO04Yx2a+TXzWRUuxGO8G9CPUbbPbcAqMhP7vUoxj
	XYkNVOkRxdHBaftRBV4iG7AtEY+u7PS23XmFeAOjokUg2V7zyEOHFjfkeC/uo1sBIDSAiaDTFir
	xyxPlKr/m0brvrxb6E8FmN0GeswkOOuXV3U9HaCakLSGSyqKeC4OxCVTdiHPFgC+lZn7/bzX+fl
	pid4LDPPu51/KuZNnN3x
X-Received: by 2002:a05:651c:1b97:b0:37f:c5ca:a6d4 with SMTP id
 38308e7fff4ca-395d8bd88b3mr94058161fa.6.1779988560201; Thu, 28 May 2026
 10:16:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260526112501.15985-1-adityags2004@gmail.com>
 <CANNYZj-CRdJjU1z-0m8bqfWtS=X_PVzyg8uKS4mcRXMua+ikVQ@mail.gmail.com>
 <CAHaUZZAZGRx0H4z5sr8ndJVqjdUk4N9kaSRKp=6-DyX73e0VkQ@mail.gmail.com>
 <CANNYZj_T4TDeN0LgrxqO4GZvebhhZx9smKrwN+MFG845z5dMUA@mail.gmail.com>
 <CAHaUZZCEHB_OVEpJgbE8tfsKyRP0JjOFBgjRyg54tLdFZY6Wtg@mail.gmail.com>
 <CANNYZj-BEjNW54zU6tOQ54BmtK8magKQe7oakp=iOggj6BBk-w@mail.gmail.com>
 <CAHaUZZBBwdufvhvggvG=xtoHuOFBZx+ExFGC+s_tK3Q51Qdwgw@mail.gmail.com>
 <CAHaUZZAG5d3WsGq_u-Kb4HuHc1u8H21gfcmSay4CxR-uxmE4Fg@mail.gmail.com> <f396af25d398685f31b9b55c079aa9fbb757dc1f.camel@linuxfoundation.org>
In-Reply-To: <f396af25d398685f31b9b55c079aa9fbb757dc1f.camel@linuxfoundation.org>
From: "Aditya G.S" <adityags2004@gmail.com>
Date: Thu, 28 May 2026 22:45:46 +0530
X-Gm-Features: AVHnY4JXsdVHoblEFg-eL6s2_twdGh7Mr4aeZTPKzHpoC2s9lfPiYFpn0Xs3heI
Message-ID: <CAHaUZZBwnoENFCg=kJsmB7t2jU3GciHQixxDy+VXwP02XD0d1Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] randtest: retry on unstable sigma instead of tolerating statistical outliers
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-core@lists.openembedded.org, 
	joaomarcos.costa@bootlin.com, ross.burton@arm.com, 
	randy.macleod@windriver.com
Content-Type: multipart/alternative; boundary="000000000000d5cc330652e3e18a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 21:19:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237733

--000000000000d5cc330652e3e18a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex, Richard,

Thank you for the kind words and support I really appreciate it!

I'm currently working on preparing the backport patch for oe-core based on
the upstream changes, and will share it shortly for your review.

Please let me know if there are any specific expectations or guidelines I
should keep in mind while preparing the patch.

Thanks,
Aditya

On Thu, May 28, 2026, 10:33=E2=80=AFPM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2026-05-28 at 20:43 +0530, Aditya G.S wrote:
> > I wanted to provide an update on this issue.
> >
> > The proposed fix has now been accepted upstream by the gawk
> > maintainer.
> >
> > The changes to randtest.sh have been reviewed and integrated into the
> > upstream repository, with appropriate updates to the original file
> > and test/ChangeLog.
> >
> > Given that the root cause has now been addressed upstream, this issue
> > can be resolved in oe-core by backporting the corresponding upstream
> > fix, rather than relying on a workaround such as skipping the test.
> >
> > Please let me know if you would like me to prepare a backport patch
> > for oe-core based on the upstream changes.
>
> Big thanks and kudos for getting it sorted upstream!
>
> We would happily take a backport patch.
>
> Cheers,
>
> Richard
>

--000000000000d5cc330652e3e18a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Alex, Richard,<div dir=3D"auto"><br></div><div dir=3D"=
auto">Thank you for the kind words and support I really appreciate it!</div=
><div dir=3D"auto"><br></div><div dir=3D"auto">I&#39;m currently working on=
 preparing the backport patch for oe-core based on the upstream changes, an=
d will share it shortly for your review.</div><div dir=3D"auto"><br></div><=
div dir=3D"auto">Please let me know if there are any specific expectations =
or guidelines I should keep in mind while preparing the patch.</div><div di=
r=3D"auto"><br></div><div dir=3D"auto">Thanks,=C2=A0</div><div dir=3D"auto"=
>Aditya</div></div><br><div class=3D"gmail_quote gmail_quote_container"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Thu, May 28, 2026, 10:33=E2=80=AFPM R=
ichard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">ric=
hard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">On Thu, 2026-05-28 at 20:43 +0530, Aditya G.S wrote:<br>
&gt; I wanted to provide an update on this issue.<br>
&gt; <br>
&gt; The proposed fix has now been accepted upstream by the gawk<br>
&gt; maintainer.<br>
&gt; <br>
&gt; The changes to randtest.sh have been reviewed and integrated into the<=
br>
&gt; upstream repository, with appropriate updates to the original file<br>
&gt; and test/ChangeLog.<br>
&gt; <br>
&gt; Given that the root cause has now been addressed upstream, this issue<=
br>
&gt; can be resolved in oe-core by backporting the corresponding upstream<b=
r>
&gt; fix, rather than relying on a workaround such as skipping the test.<br=
>
&gt; <br>
&gt; Please let me know if you would like me to prepare a backport patch<br=
>
&gt; for oe-core based on the upstream changes.<br>
<br>
Big thanks and kudos for getting it sorted upstream!<br>
<br>
We would happily take a backport patch.<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div>

--000000000000d5cc330652e3e18a--

