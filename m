Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7BA8C3600B
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 14:16:02 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.53134.1743430553681514626
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Mar 2025 07:15:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jb4wZRoR;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54acc04516fso4362410e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 07:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743430552; x=1744035352; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DMK84gGnsiuzaO+5Rp/Z65jVxePgwnbJUuNjmWzjvkc=;
        b=jb4wZRoRsYkHNrTpCXcFgEdPQZrBb/gBCyGOXlbHn2vn1MQJzx1e/oZ6uQHDnXNrKR
         3bv5AxRm23vYApIopgEkIrGbnbX3cFY3ZPBT0EPEjxG4+Le44FfR/RflrloWt+TJ6PjQ
         UOEShrmsVTxr8d5Lp/WwZChn3Ql/AYtY9XlAKvmimoIcylbpY9HBbAfCxa2/xLx6InRM
         OimZYpfA+r8fJvbSmQkD8TLiIj2Sl4cS/gkGqSiKNKotFPA96h4+OYa9bblmVQLzVN9+
         uqwaosMEr1p9WluP7CxA9OVLWh3rFOLRk+/ATZ3lDUpCsoioJu7Rm2DDid8aEBH8vg7N
         o5GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743430552; x=1744035352;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DMK84gGnsiuzaO+5Rp/Z65jVxePgwnbJUuNjmWzjvkc=;
        b=YInZ8kS3xxO+QbxEwRS0lsWFxB70HTJhEptjyLWbV4dxUN+bwEQkOdj80eds+myt8Z
         iCaPoJtAcCtd7AOy3FSSJ7OiWSVdUxWQQadq2YZUArw5yTVPYzOFSa0htsh3LR1rW+s3
         I4d//dq9gc8On0x/TMvITXw1vxSo3YCixXvbj11VOZE1uaQpyjfi1Y692P065pdtaCy+
         su7Ytn7nqAHLiLfUAng1Q55VsS165hCFHj86KkfIa3dpgNO+apDzSATYXUBixo6dufTy
         EerpFJehHCk8aUs9X0DtLLB6mY1JVoADpO1U7E9dhqqBsmcpLcCY/ZoykCFniB6ve5+5
         dhHw==
X-Forwarded-Encrypted: i=1; AJvYcCXMOfCnCVu2e8NiQH0s9LmcPekU8E+GPEbZFvVr5l1IU2hhyK2lhmosqKEZHYHl8ZYTNswXxdn+w63HAWQbvqlchg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyWPQTajdIBfLyfv3kc1hxKzuCpB0gPY7ikeQcoLi3y66PvUATF
	8tq/BD0TRK0D/6FGAmXnppPur2ZqWnol7kY+Sn0Y/UPGOmoiT/HLwAE5nN26ybnIonPvxLPGSIk
	RSsh2NW/A/XQXV+JNXLoHv+w3mRY=
X-Gm-Gg: ASbGncscXBXfnUYbqxlgF+Z3i0lkpu4lEelIfSour2Oivb/ndjINrYbDf7guYkFY5zw
	sxJBZ4+PYERA+2S8XedEYfVtafczOV+Kht43GkZEleEswThUnHD1f+ZmkVuSWCNmchG/GyF4YgJ
	5g/6j3r562quPp71ty9c+RbncLjeHpkCoXCDXHGV1v
X-Google-Smtp-Source: AGHT+IH+YOE4phrZdo6mQq6CwBXxYSV8FlkcRYQNxH9r1qBz5xn5zY6CTZ5SGMqdlbe8vDdCjhor4YdrIkg/CtKuweU=
X-Received: by 2002:a05:6512:1154:b0:549:8e54:da9c with SMTP id
 2adb3069b0e04-54b10db9d0bmr2907863e87.4.1743430551577; Mon, 31 Mar 2025
 07:15:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250331111128.317469-1-peter.marko@siemens.com>
 <CAJdd5GZQZSb3NC3DRuW8rXGN610hKmHc9sOSQigc-qkm6RXjew@mail.gmail.com> <259308841ccfd6cbcdcef5de8c6157276af32386.camel@linuxfoundation.org>
In-Reply-To: <259308841ccfd6cbcdcef5de8c6157276af32386.camel@linuxfoundation.org>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 31 Mar 2025 08:15:38 -0600
X-Gm-Features: AQ5f1JoUyPd1_3WhG4aCGnN3ElnqIacMp5F6hFIErOqmZaFdp568DIh1sxBbva0
Message-ID: <CAJdd5GakXJW6wEu8u_x9ioN6sVZqQVCVq5zV5nTxkgv_oZcF2g@mail.gmail.com>
Subject: Re: [OE-core][PATCH 1/2] create-spdx-3.0: make create_spdx depend on CVE_STATUS
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Peter Marko <peter.marko@siemens.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 14:16:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213982

On Mon, Mar 31, 2025 at 8:13=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2025-03-31 at 08:11 -0600, Joshua Watt wrote:
> > On Mon, Mar 31, 2025 at 5:12=E2=80=AFAM Peter Marko <peter.marko@siemen=
s.com>
> > wrote:
> > >
> > > From: Peter Marko <peter.marko@siemens.com>
> > >
> > > SPDX3 classes now add CVE_STATUS information to spdx.
> > > So the task needs to be rebuilt when CVE_STATUS changes.
> > >
> > > This is true since commit 1ff496546279d8a97df5ec475007cfb095c2a0bc
> > >
> > > Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > > cc: Joshua Watt <JPEWhacker@gmail.com>
> > > ---
> > >  meta/classes/create-spdx-3.0.bbclass | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/meta/classes/create-spdx-3.0.bbclass
> > > b/meta/classes/create-spdx-3.0.bbclass
> > > index 044517d9f7..235bd804bd 100644
> > > --- a/meta/classes/create-spdx-3.0.bbclass
> > > +++ b/meta/classes/create-spdx-3.0.bbclass
> > > @@ -138,6 +138,7 @@ python do_create_spdx() {
> > >      oe.spdx30_tasks.create_spdx(d)
> > >  }
> > >  do_create_spdx[vardeps] +=3D "\
> > > +    CVE_STATUS \
> >
> > Seems fine to me, unless RP thinks we should add cve_check to
> > BBIMPORTS instead?
>
> That would potentially see off other problems in the future. Is there a
> reason we wouldn't want to do that?

I can't think of one, as long as it actually works :). I'm testing it
now and I'll send the patch if works

>
> Cheers,
>
> Richard

