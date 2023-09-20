Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F41ECE79D4
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 14:21:02 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.40905.1695219657579623045
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 07:20:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=Fr54FYyh;
 spf=pass (domain: baylibre.com, ip: 209.85.218.48, mailfrom: jstephan@baylibre.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-9ad810be221so918174766b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 07:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695219655; x=1695824455; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hhh5GFSe3AUuv3yOuRGX8yiAMZOfamsaTmv8hW56QEg=;
        b=Fr54FYyhPE5KK1CrKReY6jxOYgiqguSBCGGiLNowWrKlZL0+pFi/bB1Wv835I/w+kz
         xpMJtn3Ye0R8zdbVDZ7B0ism9u9vBsh5Ro5Mnuvp4boA/VtBUkg7/AOHVWj3bJ6sCvxF
         YXP+x0qkq9iKSKg/EhhoUp4v3QeW92NGetyDmVgOCze+4+h5MiZ75STInJYA2zk11eyV
         KT4/Zx9Lw+IL2gUMdZrGdtW9xqwPXQRlyIj/iGE9juPK8ZDTUwfts3uBbtyZ/JZHLSoj
         hOz7x+Tx3+Yt8ccwlJqsHyPlbVZG6U8Hc0hbR7rpGbnslpE+2vOPrEIE2xlk92HkDDWP
         0aOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695219655; x=1695824455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hhh5GFSe3AUuv3yOuRGX8yiAMZOfamsaTmv8hW56QEg=;
        b=LWMw/Tq6hiq3+tz+diKnSZwJDARGiGN12He3v/rUlpPfeAuO6PsCd+REQ2T87UcIBH
         eL+lEPxp4cqCsKdCCDPFTGvSaFAhA1cVZSx8IibeR1/7lZv84ZhGQi/Q22MdnBfoh12T
         UFnPtASDLVIPSEOTRovL3RV9NMbrKZjcRjOBbiB9i5XkuNJQ5R/MshK7/bZO5rPMtkXP
         Kp/wfNRYsOTCvjBletcS3if/IQ20VvkJjfzruAfue8p3on/Bp69BmfjDKgzweeyZY1yk
         DCAA+py2hMsswswUy1M+xoZ3KIb9AfNIDE1u9GPwmyVpqjw86j3THYQyzzqhI4BOnQTr
         odHA==
X-Gm-Message-State: AOJu0YxL/QyddrPlDHGEuBF69LDqRtorHjsdzdP7QVR/0NGE3m6ItR7H
	WTa7gPu32yblq5LjA3dsWmrBoEaKVJIpZrp+zKPRBt/8PmKLNO7rhdA=
X-Google-Smtp-Source: AGHT+IEHE0a8CQhA9gch9iWQlZAVEH7ncdPTem+HAK2qiMpz5l0WDDp3TYgO9Lp3us2392zwqEut/+slcdHcKKdiT8g=
X-Received: by 2002:a17:906:2189:b0:9ad:e721:df9a with SMTP id
 9-20020a170906218900b009ade721df9amr2384539eju.20.1695219655606; Wed, 20 Sep
 2023 07:20:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230802142432.2296716-1-jstephan@baylibre.com>
 <20230810132113aee9ceff@mail.local> <20230811080027d7b75a14@mail.local> <202308110845568593abfe@mail.local>
In-Reply-To: <202308110845568593abfe@mail.local>
From: Julien Stephan <jstephan@baylibre.com>
Date: Wed, 20 Sep 2023 16:20:42 +0200
Message-ID: <CAEHHSvaS6cuNeu3gidGmOnnRiDkOY-ST7M1+NS6BNk4S1Y0BJw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 0/5] Add bblock helper scripts
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 14:21:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187925

Hi Alexandre,
sorry for the late reply.

I was not able to reproduce this issue on my local setup, but I did
find another (similar??)  bug, I fixed it, so hopefully it will also
fix the one detected by the autobuilder.
I updated my branch on poky-contrib
(https://git.yoctoproject.org/poky-contrib/log/?h=3Djstephan/bblock)
(with this fix and a few other ones), can you try it on autobuilder? I
didn't send a newer version of the series in case the issue is still
there.

Please let me know if I can do anything else
Cheers
Julien

Le ven. 11 ao=C3=BBt 2023 =C3=A0 10:45, Alexandre Belloni
<alexandre.belloni@bootlin.com> a =C3=A9crit :
>
> On 11/08/2023 10:00:33+0200, Alexandre Belloni wrote:
> > On 10/08/2023 15:21:14+0200, Alexandre Belloni wrote:
> > > Hello, this causes oe-selftest failures on the autobuilders:
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/558=
9/steps/14/logs/stdio
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/557=
7/steps/14/logs/stdio
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/553=
6/steps/14/logs/stdio
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/561=
3/steps/14/logs/stdio
> > >
> > > 2023-08-10 09:44:34,071 - oe-selftest - INFO - bblock.BBLock.test_loc=
k_architecture_specific (subunit.RemotedTestCase)
> > > 2023-08-10 09:44:34,072 - oe-selftest - INFO -  ... FAIL
> > > Stderr:
> > > 2023-08-10 09:40:23,454 - oe-selftest - INFO - Adding: "include selft=
est.inc" in /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-=
2290072/conf/local.conf
> > > 2023-08-10 09:40:23,455 - oe-selftest - INFO - Adding: "include bblay=
ers.inc" in bblayers.conf
> > > 2023-08-10 09:44:34,072 - oe-selftest - INFO - 3: 1/34 29/533 (250.62=
s) (0 failed) (bblock.BBLock.test_lock_architecture_specific)
> > > 2023-08-10 09:44:34,072 - oe-selftest - INFO - testtools.testresult.r=
eal._StringException: Traceback (most recent call last):
> > >   File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/li=
b/oeqa/selftest/cases/bblock.py", line 103, in test_lock_architecture_speci=
fic
> > >     self.assertNotIn(info_message, result.output)
> > >   File "/usr/lib64/python3.9/unittest/case.py", line 1111, in assertN=
otIn
> > >     self.fail(self._formatMessage(msg, standardMsg))
> > >   File "/usr/lib64/python3.9/unittest/case.py", line 676, in fail
> > >     raise self.failureException(msg)
> > > AssertionError: 'NOTE: The following recipes have locked tasks: quilt=
' unexpectedly found in 'NOTE: Reconnecting to bitbake server...
> > >
> >
> > Hum, wait, I got this without the patch series. Let me investigate.
>
> Actually, I still had the series :)
>

Hi Alexandre,

I am not able to reproduce it locally, so it is difficult to fix the issue.



> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

