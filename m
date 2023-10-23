Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A88ACDB474
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 09:32:50 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.116605.1698053560305768787
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Oct 2023 02:32:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ite5gmHU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4083dbc43cfso22429945e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Oct 2023 02:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1698053559; x=1698658359; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3lbPabf5rcpXx/m2rbjrumZ9qwSB++VUCjI2xbCvPEg=;
        b=Ite5gmHUrq9KWfonKbE02D2qHW+pE3NcaC1gaPUUr7fFJ4MPhKIu1hbPHITbw4yeJ5
         lUyK5+9ujDQwV/Zb+MyRuH9yhGWXhAoTzXr4BUBiD2kYJoB3548cV5843PM3g2SbxT29
         k9D+C/+fMLamPVN9X6Xmx0+oLrUirkVXM6+XY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698053559; x=1698658359;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3lbPabf5rcpXx/m2rbjrumZ9qwSB++VUCjI2xbCvPEg=;
        b=RePveGAj0LfmSkDlroVyixjGND/cEoT6SnKnPIk7ioQnHQ/0kbVmS8L8CEme5cDC/j
         6+NOZSf/JWL99tB2iZgabgm2viwAyaaMxitcV93+2xI4vKJ4nWyY3aQEW7qFjU8gSCnm
         xvxPdwRAlFKqQ4I+FfjsF7upUg5eJ6zwmJicpwpsy11DpftASNa5F9hzavR8aCskQAPu
         zgczxBXLV+GaMe8TZzRCTgRY278o+Es5uhKbhh8Q+SlvzYEFOMAJv25LCaxXA/Wbsd0H
         doH/U4eUFtYRAZkCOKtJJ4wP9bbsRBiPnqTMXJQbwzhAmKFdb22yCtlAYQ/s+isu+05g
         G5jw==
X-Gm-Message-State: AOJu0Yxg5lkXMVPGy7zigkbtmmUsmV6k2NbK/MDBLj55Qc9BNT2bNPE7
	0Fct2GKyVH/jFyJSOExPmYqzTw==
X-Google-Smtp-Source: AGHT+IHPb5HXdCsqr80U4sgRb6aU9ia3M0kiBmOl3nSKbXU6PYgRigxt2YRtsIILQQwaFuOrrXdRDQ==
X-Received: by 2002:a05:600c:468e:b0:408:500b:a476 with SMTP id p14-20020a05600c468e00b00408500ba476mr6799098wmo.20.1698053558589;
        Mon, 23 Oct 2023 02:32:38 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3e73:a41c:6787:e5d4? ([2001:8b0:aba:5f3c:3e73:a41c:6787:e5d4])
        by smtp.gmail.com with ESMTPSA id f5-20020a056000128500b0032179c4a46dsm7332802wrx.100.2023.10.23.02.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 02:32:38 -0700 (PDT)
Message-ID: <de71b01ea99f61d3f2474194513ce7c7957f07d7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] selftest/sstatetests: add tests for
 'bitbake -S printdiff'
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 openembedded-core@lists.openembedded.org, Alexander Kanavin
 <alex@linutronix.de>
Date: Mon, 23 Oct 2023 10:32:37 +0100
In-Reply-To: <CANNYZj9ofMU3NF9qZ8nV6-UvvHQ6_J8=+TcBj1MaQKLR2pw5TQ@mail.gmail.com>
References: <20231018084652.900785-1-alex@linutronix.de>
	 <20231018193932e6cb99ef@mail.local>
	 <CANNYZj9X6yi7D6unHuwa3eYkJq61jWJR5aQZ6_oOjGPrOV7ZEQ@mail.gmail.com>
	 <2c31af449efdd50af8dee1642c614da33595366c.camel@linuxfoundation.org>
	 <CANNYZj8LdSmPgNh9sXKZcS_dU+GveKTFDSjSWtRxopjJizwLkg@mail.gmail.com>
	 <5b1e2359d03645983d923ddb6e8ecd6f97b304d8.camel@linuxfoundation.org>
	 <17906BBEB8B5FFF5.20272@lists.openembedded.org>
	 <CANNYZj9psB-6JEaKp6HyBbGy2VTHxn8DQ8MsRweGYJYLo+ikfg@mail.gmail.com>
	 <8614ecbc167a87768f710b5f1b43c26221aa3202.camel@linuxfoundation.org>
	 <CANNYZj9ofMU3NF9qZ8nV6-UvvHQ6_J8=+TcBj1MaQKLR2pw5TQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Oct 2023 09:32:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189617

On Mon, 2023-10-23 at 11:17 +0200, Alexander Kanavin wrote:
> On Sun, 22 Oct 2023 at 13:55, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > > > Seems like that ('auto') had no effect. :-(
> > >=20
> > > Hit send too quickly. Should I try with your suggestion?
> >=20
> > It is worth a shot, yes. One causes a local hashequiv whereas the other
> > disables it entirely.
>=20
> Seems like it worked:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/2314/s=
teps/15/logs/stdio

Great!

> Should I fold BB_SIGNATURE_HANDLER =3D "OEBasicHash" into this commit,
> with a FIXME perhaps? Tools should work without special tweaks, so it
> needs to be addressed.

We should add the workaround into the commit and leave a note, yes.

Hashequiv is 'fun' since it means in a new build of something, the
build can track onto an older build/hash chain depending on whether it
matches it or not.

I've not looked into the test specifically and you're right, we want
people to be able to get diffs reliably regardless of whether it is
enabled or not. Whether the issue is with the test case or the tooling,
I'm not really sure. I suggested it as it was the most likely source of
the issues and definitely worth ruling out if it wasn't.

Note that the armhost case is interesting since the hash equivalence
mapping can be present but the sstate might not be in the native case
if it was built only on x86.

Cheers,

Richard

