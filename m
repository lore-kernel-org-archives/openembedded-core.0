Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A343BE7107E
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 14:24:52 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.19041.1695306286399189662
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Sep 2023 07:24:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=cSHQaSat;
 spf=pass (domain: baylibre.com, ip: 209.85.208.171, mailfrom: jstephan@baylibre.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2c123eed8b2so17831231fa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 07:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695306284; x=1695911084; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ak9kH+qlB/fxLG19r2eetsHGSLmpPMAbrmZRoESCdiY=;
        b=cSHQaSatLm4bCiQWtE8INVSYVllteEvvx3L5vdcXyoNLXnK3XFso4O5Vn1VMcLM0xi
         r5YRfGys36mAZ5RvCHa6FNhWWzUiaQS/eSTacIcJVVoX5dFxRPjekf9RJDLrimmNZK/e
         76yn7RwhTpP5n56Bc3s6Y9ktPok/iTwc7nMntV1xyeM3tY15FBCrntKRENRKTlRsfEl6
         vZ8M9HMFiqBTzJOc0Lz9MqFq7f+0kq8qi52Gllpmn6Vv2PVlixspw41815tNmUiiW7YY
         IOoN5vv9jrgo3csBwTsim8X7JwzyXBukjG6ZS6mIC1ekuCtg0NoPwF+6uu4If5/Eeu9L
         vtsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695306284; x=1695911084;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ak9kH+qlB/fxLG19r2eetsHGSLmpPMAbrmZRoESCdiY=;
        b=a8aV7cikjuAzWsP/WqowiFcSRcL5dsPURIR2AH1uINa3uupuDC68OFlH258lsoQkOQ
         GBMS54lKnyfr8771uAeQG8bGQTjaP/pflvRPcqB6TY5lrDKzCGkrKiE0tJFTkLy7Z6FS
         10I8MO48Ek2l2mFmYkzuEWml7iPQS2MIAR2hOJuk2ADTwjJ7h0sORDSa2wj12cPcenYw
         PvDLrJp0X9wJHehy4B5pSQiNi7wgva/qW3CJ+i08lL1TgOYdjlnyrE9NdVxlsZZjvsa7
         g5XxFerO7sLDJkjgxm53t1XCBRd1Jh9drcTmcYzD2A+c8Dnd/NeNusWfHJbPrN5ZlpxO
         ihpA==
X-Gm-Message-State: AOJu0YySqZyoJx3/Qm7dz6H7WAxktGRQ3uu8V+PkB1QZwn8LhcteBZkm
	CmG/MYanJzy7GMuH78JWLzQADBpxxIC8X+tsLKURnA==
X-Google-Smtp-Source: AGHT+IEjMQckytDkif38uBwXlhgxe+QY1sEQg77tj3KX3aMS8CCr/HR2zaR5OIlQskdWW9XXW9snIv4ED4TGxNJGrTI=
X-Received: by 2002:a2e:8796:0:b0:2bb:b01a:9226 with SMTP id
 n22-20020a2e8796000000b002bbb01a9226mr4792169lji.7.1695306283902; Thu, 21 Sep
 2023 07:24:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230802142432.2296716-1-jstephan@baylibre.com>
 <20230810132113aee9ceff@mail.local> <20230811080027d7b75a14@mail.local>
 <202308110845568593abfe@mail.local> <CAEHHSvaS6cuNeu3gidGmOnnRiDkOY-ST7M1+NS6BNk4S1Y0BJw@mail.gmail.com>
 <202309211311328bf3a025@mail.local>
In-Reply-To: <202309211311328bf3a025@mail.local>
From: Julien Stephan <jstephan@baylibre.com>
Date: Thu, 21 Sep 2023 16:24:30 +0200
Message-ID: <CAEHHSvZ1aiq0hMV18xSmtib-pQaQ2o0ETDGkMGJbjwz9RHTb9Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 0/5] Add bblock helper scripts
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 14:24:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188007

Le jeu. 21 sept. 2023 =C3=A0 15:11, Alexandre Belloni
<alexandre.belloni@bootlin.com> a =C3=A9crit :
>
> Hello,
>
> On 20/09/2023 16:20:42+0200, Julien Stephan wrote:
> > Hi Alexandre,
> > sorry for the late reply.
> >
> > I was not able to reproduce this issue on my local setup, but I did
> > find another (similar??)  bug, I fixed it, so hopefully it will also
> > fix the one detected by the autobuilder.
> > I updated my branch on poky-contrib
> > (https://git.yoctoproject.org/poky-contrib/log/?h=3Djstephan/bblock)
> > (with this fix and a few other ones), can you try it on autobuilder? I
> > didn't send a newer version of the series in case the issue is still
> > there.
>
> This was sent to the autobuilders:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/5785/st=
eps/14/logs/stdio
>

Hi Alexandre,

Thank you! Unfortunately I can see that it is still failing on the same tes=
t :(
I may need your help here.

Here is what my test is supposed to do:
From the autobuilder log I can see that the machine is set to qemux86-64 so=
 :

$ bblock -d # unlock all recipes and remove build/conf/bblock.conf file
$ MACHINE=3Dqemuarm block quilt -t compile # lock do_compile for bc for
qemuarm arch so block.conf file should look like this:

# Generated by bblock
SIGGEN_LOCKEDSIGS_TASKSIG_CHECK =3D "info"
SIGGEN_LOCKEDSIGS_TYPES +=3D "${PACKAGE_ARCHS}"

SIGGEN_LOCKEDSIGS_cortexa15t2hf-neon +=3D "quilt:do_compile:<sig>"

# modify the quilt's do_compile task by adding an empty
do_compile:append function
$ bitbake -n quilt # for qemux86-64 machine

Because quilt is supposed to be locked for qemuarm, I am not supposed
to see any warning, but the log on the autobuilder says:
"WARNING: The quilt:do_compile sig is computed to be
d5902ba1813663fcd92fc5afb9026e01c01ccdbcc0ff792aad555522ce407c31, but
the sig is locked to
c9c5724b6f125763f1f0e2c87e6451acdaf59f7aba7efe387c2908d14486f3fe in
SIGGEN_LOCKEDSIGS_core2-64\""

meaning bblock.conf contains:

SIGGEN_LOCKEDSIGS_core2-64 +=3D "quilt:do_compile:<sig>


So I can see two possible reasons for that:
* MACHINE=3Dqemuarm block quilt -t compile  is not using the machine I
give on the command line, but why??
* bblock.conf gets polluted by another test that also tries to lock
quilt's do_compile function for qemux86-64 because of parallelism  (I
was not able to reproduce it locally)

Do you have an idea why this test is failing?
My next move would be to place all the tests in a single test to
remove the parallelism issue (if that is the issue) but I would prefer
to avoid wasting your time starting builds for me several times..

Also, I didn't manage to print log messages on my test, how can I do that?

Cheers
Julien
> >
> > Please let me know if I can do anything else
> > Cheers
> > Julien
> >
> > Le ven. 11 ao=C3=BBt 2023 =C3=A0 10:45, Alexandre Belloni
> > <alexandre.belloni@bootlin.com> a =C3=A9crit :
> > >
> > > On 11/08/2023 10:00:33+0200, Alexandre Belloni wrote:
> > > > On 10/08/2023 15:21:14+0200, Alexandre Belloni wrote:
> > > > > Hello, this causes oe-selftest failures on the autobuilders:
> > > > >
> > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds=
/5589/steps/14/logs/stdio
> > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds=
/5577/steps/14/logs/stdio
> > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds=
/5536/steps/14/logs/stdio
> > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds=
/5613/steps/14/logs/stdio
> > > > >
> > > > > 2023-08-10 09:44:34,071 - oe-selftest - INFO - bblock.BBLock.test=
_lock_architecture_specific (subunit.RemotedTestCase)
> > > > > 2023-08-10 09:44:34,072 - oe-selftest - INFO -  ... FAIL
> > > > > Stderr:
> > > > > 2023-08-10 09:40:23,454 - oe-selftest - INFO - Adding: "include s=
elftest.inc" in /home/pokybuild/yocto-worker/oe-selftest-centos/build/build=
-st-2290072/conf/local.conf
> > > > > 2023-08-10 09:40:23,455 - oe-selftest - INFO - Adding: "include b=
blayers.inc" in bblayers.conf
> > > > > 2023-08-10 09:44:34,072 - oe-selftest - INFO - 3: 1/34 29/533 (25=
0.62s) (0 failed) (bblock.BBLock.test_lock_architecture_specific)
> > > > > 2023-08-10 09:44:34,072 - oe-selftest - INFO - testtools.testresu=
lt.real._StringException: Traceback (most recent call last):
> > > > >   File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/met=
a/lib/oeqa/selftest/cases/bblock.py", line 103, in test_lock_architecture_s=
pecific
> > > > >     self.assertNotIn(info_message, result.output)
> > > > >   File "/usr/lib64/python3.9/unittest/case.py", line 1111, in ass=
ertNotIn
> > > > >     self.fail(self._formatMessage(msg, standardMsg))
> > > > >   File "/usr/lib64/python3.9/unittest/case.py", line 676, in fail
> > > > >     raise self.failureException(msg)
> > > > > AssertionError: 'NOTE: The following recipes have locked tasks: q=
uilt' unexpectedly found in 'NOTE: Reconnecting to bitbake server...
> > > > >
> > > >
> > > > Hum, wait, I got this without the patch series. Let me investigate.
> > >
> > > Actually, I still had the series :)
> > >
> >
> > Hi Alexandre,
> >
> > I am not able to reproduce it locally, so it is difficult to fix the is=
sue.
> >
> >
> >
> > > Alexandre Belloni, co-owner and COO, Bootlin
> > > Embedded Linux and Kernel engineering
> > > https://bootlin.com
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

