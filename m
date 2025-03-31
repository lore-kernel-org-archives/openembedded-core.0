Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B09E2C3600B
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 19:26:46 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.1399.1743449205459717849
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Mar 2025 12:26:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M1G/YCNn;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: jpewhacker@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-307c13298eeso54899711fa.0
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 12:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743449204; x=1744054004; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z3UiW5+bXu/S6PrHjjep4hyoyOqpP6Zfy25aIrIGJ3c=;
        b=M1G/YCNnFdg+pEWa60RFnNWRruQHIHpcLy8wCG94pqx+AKHqCQNMVW+x8ay5rXLmO8
         BTHU7F1L0l3/xFwqXKFllICIl2kh55KLFqcjgcBhgbU/q4tZX6Gru9tFAKapRz3xoZpw
         KhbfTLrHp0Vl5D6ZQO7bwPNReIlWLxC8+cpa6G3Em0d6pEXZneRCdmPlxvyToO5kdXUn
         yTD+/2r1+u8j642oqzMDpzb+QGnjQ6PYC0MkC8bSKRztD2b+1JKCzka54fRVH8vcTZFf
         n4mNVnA+qyUs0KF6MpEbgwJvaZ1BaIL5+jsdJYrc7L1DtrI2onHGWVK0fyGhtA3NeKKR
         kbYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743449204; x=1744054004;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z3UiW5+bXu/S6PrHjjep4hyoyOqpP6Zfy25aIrIGJ3c=;
        b=VFDXrXsYvIxFWUJUZ+QV1ff644VdhPsI8vno7CouKZctGbkPWFJtGz9pDjHaC6O6Py
         Pu23G28rnWQm8U1DEg11XMRFpUL/rhQuDMHMXpuhkaBMBWadOAKf2jALInM1I49dNMha
         OMrhhvFWHO8lYD6jeW7MAa3FnruN92irrOCoo//BA/H25G5bUnB0sHIBjPC2A1TMTCPD
         YXLobotQExPcXu40zFqBlVE0isI2Ox78pa+l5doJNfYb98owpqPQecgwu4I0HQh/geYC
         LZMNtkOzWW9HHS3RXDfuKADzFjAC2JiEexXdBkbU5sHqpbl2d4XkbzIIGaX3TZP6/qQD
         suGw==
X-Forwarded-Encrypted: i=1; AJvYcCXteSvbVTUobZRsF7a48qmiDBIjWKVnO7pNU/q0tp8oEKAxa5hhJ1X3jC38f0P44mmTUiP+YDO0n4aWf1nR6Nhvzw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwTd8DsbO/2KCERljgg7k9tVzLm90xJZMS/9st5SA9QLZbC1sE9
	LdwYqS8tUnPrA5HAQ4sg19Wpwz20Ofv2qy/O0pKegprquWI03Tlgd6cEFwIns1NVJEKz8ZnWcoh
	KYdTN7oFJ9TN7n3YtMvlFmlrEcYL0+A==
X-Gm-Gg: ASbGncu0KUxBuu0ZCGRiOWVmvESTVr8l68Me2gSRwpliet0DUyUIjGYri24QiTfjtVg
	T2yTL1KRs26eIlZP1k/+7odd/uMn9NiK5z3Zy0av6i6DU8Sm1efzDA4TlaPHHOPJiOcab4UsfWZ
	0TIS9ouI6OlmetIm3x7FfIFoH4JuKPPKzV/2zdpfzl
X-Google-Smtp-Source: AGHT+IFYPbpsU/70zOU4aflMv6XkJubMj7lI1JlN1VE3mkYgiZn81jtEimnTLNQ5MBu8t2IPAwxhUUpX5/+g+h3dfdE=
X-Received: by 2002:a2e:9a0a:0:b0:309:22dc:6917 with SMTP id
 38308e7fff4ca-30ddfa07710mr35313751fa.19.1743449203367; Mon, 31 Mar 2025
 12:26:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250331111128.317469-1-peter.marko@siemens.com>
 <CAJdd5GZQZSb3NC3DRuW8rXGN610hKmHc9sOSQigc-qkm6RXjew@mail.gmail.com>
 <259308841ccfd6cbcdcef5de8c6157276af32386.camel@linuxfoundation.org> <CAJdd5GakXJW6wEu8u_x9ioN6sVZqQVCVq5zV5nTxkgv_oZcF2g@mail.gmail.com>
In-Reply-To: <CAJdd5GakXJW6wEu8u_x9ioN6sVZqQVCVq5zV5nTxkgv_oZcF2g@mail.gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 31 Mar 2025 13:26:31 -0600
X-Gm-Features: AQ5f1Jryp-xp_uuvOn2NJ7__YiiHhPX0qp35KZoq9JOhAUrBVxoZRr1VmxJsopo
Message-ID: <CAJdd5GZVv0cbp86ba1UvPcHFP-v7Y9Oh_r=dMmE2WauHWkEXrg@mail.gmail.com>
Subject: Re: [OE-core][PATCH 1/2] create-spdx-3.0: make create_spdx depend on CVE_STATUS
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Peter Marko <peter.marko@siemens.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 19:26:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213995

On Mon, Mar 31, 2025 at 8:15=E2=80=AFAM Joshua Watt <jpewhacker@gmail.com> =
wrote:
>
> On Mon, Mar 31, 2025 at 8:13=E2=80=AFAM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Mon, 2025-03-31 at 08:11 -0600, Joshua Watt wrote:
> > > On Mon, Mar 31, 2025 at 5:12=E2=80=AFAM Peter Marko <peter.marko@siem=
ens.com>
> > > wrote:
> > > >
> > > > From: Peter Marko <peter.marko@siemens.com>
> > > >
> > > > SPDX3 classes now add CVE_STATUS information to spdx.
> > > > So the task needs to be rebuilt when CVE_STATUS changes.
> > > >
> > > > This is true since commit 1ff496546279d8a97df5ec475007cfb095c2a0bc
> > > >
> > > > Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > > > cc: Joshua Watt <JPEWhacker@gmail.com>
> > > > ---
> > > >  meta/classes/create-spdx-3.0.bbclass | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/meta/classes/create-spdx-3.0.bbclass
> > > > b/meta/classes/create-spdx-3.0.bbclass
> > > > index 044517d9f7..235bd804bd 100644
> > > > --- a/meta/classes/create-spdx-3.0.bbclass
> > > > +++ b/meta/classes/create-spdx-3.0.bbclass
> > > > @@ -138,6 +138,7 @@ python do_create_spdx() {
> > > >      oe.spdx30_tasks.create_spdx(d)
> > > >  }
> > > >  do_create_spdx[vardeps] +=3D "\
> > > > +    CVE_STATUS \
> > >
> > > Seems fine to me, unless RP thinks we should add cve_check to
> > > BBIMPORTS instead?
> >
> > That would potentially see off other problems in the future. Is there a
> > reason we wouldn't want to do that?
>
> I can't think of one, as long as it actually works :). I'm testing it
> now and I'll send the patch if works

Just to follow up on this; I think we can fix this more systemically
in bitbake and/or make improvements to make it easier to specify these
types of dependencies in the actual code that references them (see
jpew/var-flag-deps on poky-contrib for some prototypes), so I think it
would be better to take that approach than this one (at least on
master, this is likely better for backport fixes)

>
> >
> > Cheers,
> >
> > Richard

