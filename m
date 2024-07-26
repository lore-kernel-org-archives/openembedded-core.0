Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F40C3C3DA49
	for <webhook@archiver.kernel.org>; Fri, 26 Jul 2024 12:23:08 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.59484.1721996580804262545
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jul 2024 05:23:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q5J7yyI3;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: rybczynska@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-71871d5e087so672505a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 05:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721996580; x=1722601380; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rer0Qkl34TYKduFcznojxMprKEG8qod4ajmiMB6H2E8=;
        b=Q5J7yyI3CrahtbGttEFClbBHx5hPJzT4XcDTTVJNSu7M6qEww2YHA2DaX+j4PaYpGT
         AiGV2RoPeJz1v+W6Cr0tow6eSAyZIeo7Cu6MAHHct4/uD5acjcboT6XKOJ2WD4jTh2wC
         LP7M0OZbsMUETku+5zMoeMf8FdpzRuwENSzucwNZQfev95f+Ozcaz/xsL4CXMXykQVnN
         yEfXO43TPSruZU0ZGyetEOKzBE4eSr+KXqWpFgSke6CC5cKeqDW/uwDDHxulE/9qH8Ql
         6afs5qyPj8kFRT8TJYSeZuCBQQQP99Wg+zKXm3zaC3gWO9O82T0FOUcILoUkiPtunjZP
         ArRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721996580; x=1722601380;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rer0Qkl34TYKduFcznojxMprKEG8qod4ajmiMB6H2E8=;
        b=RwJP37OssNDfQarlIMcrQvht2PDbVcyX8V2/krWzI6UX2bbKgumrc77qIT3Z/DYJt/
         tNPF7NfHhuFz3etEUrnH8ZCxQH8Y5FcZhhfCSgokPbrs1ot1/g5bMnErfXWiqdgoaLIB
         rdHBwsmQxOUbOyfQLabPMCzzrviLEpOSqIAj19nPchpw5GidE+ioKRMAzDH8D2/+GE4O
         JqHftsTAoC+iQNUB0DqxqLjeGBul8jwOUTjIXgilcMTp73GCyi63IjXHfY0DTvFP89bn
         oETBF/R4+qnhA6fg+g6oHdCqoczwkMPzjQFrVvyOv93RXJpuRW7jObmgqVboUsWeMzq3
         PSUQ==
X-Gm-Message-State: AOJu0YzmiMV41d0cNE06+aS8O4yn+z3Qc+vb56QlPprDGtw0uG1JsPcR
	zn/B/Gj0YIeJZGPMIscXtKN8ctJMS76IGjDnVfbhtsmReTpKdDvuyDVIY5C/ppKQMI6fdPqG9Og
	NBZ+oGooJdckYdkXIzSt9WFWjbCU=
X-Google-Smtp-Source: AGHT+IERjjnUkySN9cBw2cgDCoPmrLQ3nrVPfha2ODLmIvxRHg7QfQz5o5YQvVeMXTxZFcnNbSvvTP0LBMhHKxYJfBg=
X-Received: by 2002:a17:90b:b03:b0:2c8:e43b:4015 with SMTP id
 98e67ed59e1d1-2cf2377360bmr6688461a91.6.1721996579838; Fri, 26 Jul 2024
 05:22:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240724152530.25856-1-marta.rybczynska@syslinbit.com>
 <20240724152530.25856-3-marta.rybczynska@syslinbit.com> <3F580A6C-E380-4B95-9224-1F1336444B31@arm.com>
In-Reply-To: <3F580A6C-E380-4B95-9224-1F1336444B31@arm.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Fri, 26 Jul 2024 14:22:47 +0200
Message-ID: <CAApg2=SYoxcsGyde8qmmFg_JEd5izYLWM+qDh3v4iZch=mTN3Q@mail.gmail.com>
Subject: Re: [OE-core][PATCH v3 3/5] vex.bbclass: add a new class
To: Ross Burton <Ross.Burton@arm.com>
Cc: ",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Marta Rybczynska <marta.rybczynska@syslinbit.com>, 
	Samantha Jalabert <samantha.jalabert@syslinbit.com>
Content-Type: multipart/alternative; boundary="0000000000007227b4061e2592f2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 12:23:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202532

--0000000000007227b4061e2592f2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 26, 2024 at 2:09=E2=80=AFPM Ross Burton <Ross.Burton@arm.com> w=
rote:

> On 24 Jul 2024, at 16:25, Marta Rybczynska via lists.openembedded.org
> <rybczynska=3Dgmail.com@lists.openembedded.org> wrote:
> > +# CVE_CHECK_IGNORE is deprecated and CVE_STATUS has to be used instead=
.
> > +# Keep CVE_CHECK_IGNORE until other layers migrate to new variables
> > +CVE_CHECK_IGNORE ?=3D ""
>
> In the new classes, I think we should just drop the deprecated variables
> entirely.


Yes, if we do not plan to backport. From what I know there was no decision
at this stage.

Regards,
Marta

--0000000000007227b4061e2592f2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 26, 2024 at 2:09=E2=80=AF=
PM Ross Burton &lt;<a href=3D"mailto:Ross.Burton@arm.com">Ross.Burton@arm.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">On 24 Jul 2024, at 16:25, Marta Rybczynska via <a href=3D"http://lists.op=
enembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org=
</a> &lt;rybczynska=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" t=
arget=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; +# CVE_CHECK_IGNORE is deprecated and CVE_STATUS has to be used instea=
d.<br>
&gt; +# Keep CVE_CHECK_IGNORE until other layers migrate to new variables<b=
r>
&gt; +CVE_CHECK_IGNORE ?=3D &quot;&quot;<br>
<br>
In the new classes, I think we should just drop the deprecated variables en=
tirely.</blockquote><div><br></div><div>Yes, if we do not plan to backport.=
 From what I know there was no decision at this stage.<br></div><div><br></=
div><div>Regards,</div><div>Marta <br></div></div></div>

--0000000000007227b4061e2592f2--

