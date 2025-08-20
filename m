Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D37C8CA0EED
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 15:25:11 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web11.641.1755703510916266573
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Aug 2025 08:25:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EddpL2gm;
 spf=pass (domain: gmail.com, ip: 209.85.219.169, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e95011504d4so457333276.3
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 08:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755703510; x=1756308310; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LmZtt/3MwEcSl/idpAcrgupnNXIToWGUxC4YhkH6WH8=;
        b=EddpL2gmStWb8v6tbvWOP9slJ8RnmjHzRexNaQCb87Il9UvcXAVMcQ69vwqii0AKxF
         lCukY4o5T54OCS/2bxGV1KRxqJkVIBWdWGunq4DBVagcZ4wBZfknUJ2pwxjRgvCtfdq9
         1Fo3FABYTcqufkIdHVde3MruRl486OVjx2frTIiAO9uFHeTWyUczYhbn7r6GuTMYJxBx
         PQYrdxkESoDBm5QJgurYBGbf3tPSRxQ09ZAvUgcpSbJ47BIjDRLbD70yp7bCvKV+uFzM
         mQ4svJCCZ0XaY35apfj/QHstf0E1vtSrFTK1bOBE4JwS/MRtQV/WqPGQchvKx1hHcllC
         imPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755703510; x=1756308310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LmZtt/3MwEcSl/idpAcrgupnNXIToWGUxC4YhkH6WH8=;
        b=Yk6z40p3//Yi3hzW1m6d/U6sfSsYXRlKHj5NgZ1jyRGoMfF5EwvQbOK+cK4ma0VDO5
         5KUbzvb5Nr4RgXF76CG+jQ0NdvvIrYh7n4mCDGNlI5MOnWfkR9FDF1Y93qNO5WHWWgoG
         OTxOQSwJMHc/u8bK7zHUAlZ1ZS6iWQKy8mRpYjysBKyG70ZWe2spWEmJOBHosqjlkCzV
         +mKuZ/MLaubr4CrA0mZMbd90xU30xJSG2D1a+KS5K7/1yGUml0y9DNYDevIxKBrqWnbc
         vKyJqSjbK6KAnGQ+2zx+M3uSpNhVncO+56lO3lOZ2GGEYgAadTs7i2ABKenJhAY/Kqdg
         +4jw==
X-Forwarded-Encrypted: i=1; AJvYcCWYDiFzcfsP8ftEbLKJaNn9UpGyTpy06fsM1e8pEPNOeeLL6tLDvZA4hX8ATkS/ieip7X88g5MhWeU61FLHkWkpjg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz3zYLJrSbo9MkbTidKitfhapFEMkOFj598niTn1NR/BNMR06L6
	JLzjZ1g31rCsHJqguE52NMiW49tPhRV7SL4GEP93AwLl/MQecuuOJqJ3HCzLiiAdN3skXfSTLGm
	UlbajNP58FaSxs95neo6dojHmJIRJ2yY=
X-Gm-Gg: ASbGnctBGq/F1fTa+q4EtbLDNX9J467H02gpqq3CtLRUOqUvSrDNjW275xnyux8why2
	sGLOdmWPhjPUkHIl+AJcGcB2mSQBXjwoKp64bQ1Xx/uSeHOSv6t/aeMvp5XVGgL/zGXeBEMBPmg
	JdgFG6IyObl/9wbrRIwtpnFmCJ7UDLbDGUuOZIRSjnjrq42AjQwwBBG7dcqXnOMBuEkGXJ15yeV
	q4+90rOjkoBGQCnV/cJFuNdS0BeW9GYvNqZMdyA43FIT/A832E=
X-Google-Smtp-Source: AGHT+IGJL7FYLEcNUxUElFgkBRN6gLFYCyHyyaUxmlwYNW0/L/aIeNAyxW7DC+9RYDmfrh238dWnXfWbPZgXjBZ6YIs=
X-Received: by 2002:a05:6902:2182:b0:e93:4df7:687d with SMTP id
 3f1490d57ef6-e94f669dd5amr3230941276.48.1755703509788; Wed, 20 Aug 2025
 08:25:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250819010128.3519760-1-raj.khem@gmail.com> <20250819010128.3519760-3-raj.khem@gmail.com>
 <DC71FJJ2QC94.35CLO3OBAN1BF@bootlin.com> <CAMKF1sqTdHQrCUYK3dGGzi+=mGZBogaR1TD2r+zMSkJWz3vWUg@mail.gmail.com>
 <DC77JFI2499F.1BTYUM51QCASE@bootlin.com> <CAMKF1spYCYK3PJ-Keauh1Z3n7i6xq1TUJMfSbCB_Gu9S_80FbQ@mail.gmail.com>
 <AS1PR10MB5697C7D8E470853393F57036FD33A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB5697C7D8E470853393F57036FD33A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Aug 2025 08:24:43 -0700
X-Gm-Features: Ac12FXw0oHQ1qd1Z3q1hAvGeWN1cHphIL1EC9rqR_0-ORpXKFkr7_8Lvs9s0QLA
Message-ID: <CAMKF1so-QpbXt39GbXJXsfhBWoeH8yAJ-Ub8HExrx5Ze2wwu9Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] m4: Fix ptest on musl
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, Ross Burton <ross.burton@arm.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 15:25:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222189

On Wed, Aug 20, 2025 at 7:40=E2=80=AFAM Marko, Peter <Peter.Marko@siemens.c=
om> wrote:
>
>
>
> > -----Original Message-----
> > From: Khem Raj <raj.khem@gmail.com>
> > Sent: Wednesday, August 20, 2025 16:33
> > To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>; Marko, P=
eter
> > (FT D EU SK BFS1) <Peter.Marko@siemens.com>; Ross Burton
> > <ross.burton@arm.com>
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH 3/3] m4: Fix ptest on musl
> >
> > On Wed, Aug 20, 2025 at 4:10=E2=80=AFAM Mathieu Dubois-Briand
> > <mathieu.dubois-briand@bootlin.com> wrote:
> > >
> > > On Wed Aug 20, 2025 at 9:15 AM CEST, Khem Raj wrote:
> > > > On Tue, Aug 19, 2025 at 11:23=E2=80=AFPM Mathieu Dubois-Briand
> > > > <mathieu.dubois-briand@bootlin.com> wrote:
> > > >>
> > > >> On Tue Aug 19, 2025 at 3:01 AM CEST, Khem Raj via
> > lists.openembedded.org wrote:
> > > >> > Fixes
> > > >> > ../../sources/m4-1.4.20/tests/test-c32ispunct.c:261: assertion '=
is =3D=3D 0' failed
> > > >> > ./test-c32ispunct.sh: line 36:   402 Aborted
> > > >> > (core dumped) LC_ALL=3D"$testlocale" ${CHECKER} ./test-
> > c32ispunct${EXEEXT} 3
> > > >> >
> > > >> > FAIL: test-c32ispunct.sh
> > > >> >
> > > >> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > >> > ---
> > > >>
> > > >> Hi Khem,
> > > >>
> > > >> Thanks for your patch.
> > > >>
> > > >> It looks like this is breaking tests, specifically on qemuriscv64:
> > > >>
> > > >> Traceback (most recent call last):
> > > >>   File "/srv/pokybuild/yocto-
> > worker/qemuriscv64/build/meta/lib/oeqa/sdk/cases/maturin.py", line 25, =
in
> > test_maturin_list_python
> > > >>     output =3D self._run("maturin list-python")
> > > >>              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > >>   File "/srv/pokybuild/yocto-
> > worker/qemuriscv64/build/meta/lib/oeqa/sdk/case.py", line 17, in _run
> > > >>     return subprocess.check_output(". %s > /dev/null; %s;" % \
> > > >>            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > >>   File "/usr/lib/python3.12/subprocess.py", line 466, in check_out=
put
> > > >>     return run(*popenargs, stdout=3DPIPE, timeout=3Dtimeout, check=
=3DTrue,
> > > >>            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^
> > > >>   File "/usr/lib/python3.12/subprocess.py", line 571, in run
> > > >>     raise CalledProcessError(retcode, process.args,
> > > >> oeqa.utils.subprocesstweak.OETestCalledProcessError: Command '.
> > /srv/pokybuild/yocto-worker/qemuriscv64/build/build/tmp/work/qemuriscv6=
4-poky-
> > linux/core-image-minimal/1.0/testsdkext/environment-setup-riscv64imafdc=
-poky-
> > linux > /dev/null; maturin list-python;' died with <Signals.SIGSEGV: 11=
>.
> > > >>
> > > >
> > > > seems quite unrelated, I wonder if its finding some other bug
> > >
> > > Yes, I can't understand what happens here :(
> > > Yet this commit always triggers the failure.
> > >
> >
> > Looking at logs there is some more info  immediately after what you
> > posted above that is interesting
> >
> > Stdout:
> > Trying to install python3-maturin-native...
> >
> > its running lib/oeqa/sdk/cases/maturin.py and
> > it seems it needs python3-maturin-native in sstate cache and I wonder
> > if it's missing because m4/m4-native dependency will rebuild
> > python3-maturin-native or something is racing with it.
> >
> > There was a similar problem in recent past and a related fix was commit=
ted
> > https://git.yoctoproject.org/poky/commit/?id=3D2239c2c91ab35c67ccd95afe=
0573500
> > 37f7d0e59
> >
> > I now wonder if the test is exited when it does not find
> > python3-maturin-native correctly or not.
>
> The fact that maturin test is executed means that it was installed succes=
sfully, so code in mentioned commit was not active.
> Also segmentation fault suggests that the binary is installed, it just do=
es not work correctly.

Seems so, I would have expected SkipTest to execute if the install
failed. so it seems to be installed fine, but segfaulting on run
seems unrelated to above change which is modifying a testcase source
file in m4, its not changing anything even in m4,  there
was a possibility that modified m4-native is indirectly injecting some
bug into maturin but thats unlikely.

maybe run a build with just this single patch applied on top of the
master branch.

>
> >
> > > --
> > > Mathieu Dubois-Briand, Bootlin
> > > Embedded Linux and Kernel engineering
> > > https://bootlin.com
> > >

