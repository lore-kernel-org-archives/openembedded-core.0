Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 263F5E77375
	for <webhook@archiver.kernel.org>; Sat, 30 Sep 2023 14:13:52 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.41484.1696083222345214226
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Sep 2023 07:13:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=HMWnO2ws;
 spf=pass (domain: baylibre.com, ip: 209.85.208.51, mailfrom: jstephan@baylibre.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-53406799540so14236883a12.1
        for <openembedded-core@lists.openembedded.org>; Sat, 30 Sep 2023 07:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696083220; x=1696688020; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I5g9S2g7hZoA7631MpvqoQKc1sK1KBqFvLQ1Lt1Hxls=;
        b=HMWnO2ws3HmeOmsyis50RrSoRS6G+bCJHoTb+B0kc0FN/hhRK+K4FnbgOvoh7gNLe9
         lfTM4p3y+ytx1WvwXjfmWLjni/kvr5TjCv6/ay512uqzjs2gyGJLlaO5yWU2lBROv614
         3KEm3hxdNWsivsEoX+4A7N/5b9U5jF81n4zGwNwKJzCu8qauhNuzN5fQcaMSwTPBf62e
         oDWwSl3OzqLvA5fMuPmnsCXWpNPhJfX4sWPZ1ntdq7/iekJyWjxK1q80NdVc4oUPSuAb
         INwyHLpBla0Q07ryGeKEQCmXK2Jp7LYjnMTk1+jk8PC2d6anaz4wTYHVeG9hdu0ukhmB
         3mBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696083220; x=1696688020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I5g9S2g7hZoA7631MpvqoQKc1sK1KBqFvLQ1Lt1Hxls=;
        b=g3qqYpi/rkpE4rDpudkrGPPr56DjgrYMzG5tutVsNCWxTs10bB6+KfcoyZfk+OrjMS
         pQ+MUL8IzR8Kl/tQ3Zg0nWT3iYKEyAeOt07PmBiRQQmM81j5x3pRq4fRWqbDr5tuIbZX
         Xys/Uber2P7c1p2SZ5X5V3IXGiWYw3j+MDpD7RRehbZ9+uId6uoveUQbpBydzas0zKfl
         c+u6a4VGJ05ER6WateVVpM5TscfPGSKQpa0lpeAqpfKbYBb4XAVrIvg0YoTJJY/i4XDG
         Eq3eNmKNVvWtwL4++dY0ZJRxBNbzF4LIgym3Bj1agEGbvbxXWrGl4M9WOpSzY0Go5Y/z
         m8KQ==
X-Gm-Message-State: AOJu0YzSAykHetT52aFU/PkwSFxAV/Ua6r5I+jnD9ls0B/Gr32Dh2ywg
	w8q9BdE6AWIyGKQ7ApX2mlUMdA6bmJfH4NfaFVew7g==
X-Google-Smtp-Source: AGHT+IEGRFvqDab9YWb10zNXZ9OHoAdO7GTtDXggp1C71NAM+XRnc45Qt8yi0FyMqNa9V3FJ1Nw/LKP0HT00rT9yDKY=
X-Received: by 2002:aa7:d145:0:b0:533:49d2:dc8f with SMTP id
 r5-20020aa7d145000000b0053349d2dc8fmr5553732edo.17.1696083220461; Sat, 30 Sep
 2023 07:13:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230925080452.803540-1-jstephan@baylibre.com>
 <20230927101614dd0d974d@mail.local> <CAEHHSvYxWAYjEXBxxyZ-Y4ra3hVPjGxD3+x0GPY_0YYANGxYOw@mail.gmail.com>
 <6f9dd65547742d68a2e3210070ce7efea80343e9.camel@linuxfoundation.org>
In-Reply-To: <6f9dd65547742d68a2e3210070ce7efea80343e9.camel@linuxfoundation.org>
From: Julien Stephan <jstephan@baylibre.com>
Date: Sat, 30 Sep 2023 16:13:27 +0200
Message-ID: <CAEHHSvYc-mDkfG0ok=thQ8OLcHae7M+rUNkMk7MKjiEd+S2GMA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5 0/5] Add bblock helper scripts
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Sep 2023 14:13:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188459

Le mer. 27 sept. 2023 =C3=A0 23:17, Richard Purdie
<richard.purdie@linuxfoundation.org> a =C3=A9crit :
>
> On Wed, 2023-09-27 at 14:47 +0200, Julien Stephan wrote:
> > Le mer. 27 sept. 2023 =C3=A0 12:16, Alexandre Belloni
> > <alexandre.belloni@bootlin.com> a =C3=A9crit :
> > >
> > > Hello,
> > >
> > > I had a build were all the tests passed, then I had this failure:
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/581=
2/steps/14/logs/stdio
> > >
> >
> > Hi Alexandre,
> > I only see
> >
> >    bblock.BBLock.test_lock_single_recipe_all_tasks: FAILED
> >
> > but I can't see the actual error :( Is it possible to have it somewhere=
?
>
> I am a bit worried this will be hard to reproduce/debug so I had a look
> at things as I do really want to get things resolved.
>
> The error log says:
>
> WARNING: The quilt:do_build sig is computed to be 255536826e64d835fcc6b5a=
277e9a3dacaae75318e608fa2df289bdfa23df40e, but the sig is locked to 0f48875=
f011499948d53edc6abbe9e4efd617d5ef9233055e4b61411cf01cb87 in SIGGEN_LOCKEDS=
IGS_core2-64
>
> and I couldn't reproduce those stamps in a local build or on the
> builder where it failed (once I got access which took a while).
>
> The "while" is important as I think in the meantime things changed
> which effected the results.
>
> On the autobuilder, "bitbake quilt -S none" generated stamp files for
> quilt. I did this for "build" and "build-st-3046552", the latter being
> the one where the test failed. There were two different do_build stamps
> generated. The diff:
>
> bitbake-diffsigs tmp/stamps/core2-64-poky-linux/quilt/0.67.do_build.sigda=
ta.b502a759bb6bceb6c8ccd76b57db2612501bb66bd9c46ece5f99f8bf16d7ac4a  ../bui=
ld/tmp/stamps/core2-64-poky-linux/quilt/0.67.do_build.sigdata.7cf16a1f87d50=
58e134f3f6fc02612515e28784625413c87d3545e93ae0ab407
> NOTE: Reconnecting to bitbake server...
> Hash for task dependency diffstat:do_package_write_rpm changed from 41171=
f7938a2ddbe244372c1cc4300d91b7dca425eb8b214c19262e4949a7f18 to 2211ac20553e=
9dddc710970cf1a663412ece5b5a2071e47c5471b3ee01efa2ce
>     Hash for task dependency diffstat:do_package changed from f3fe486831e=
ede23d2ebbc1efe2e2510f49f5df6d5d8a8ceb7aa2ddc6e11b1ec to e5ff0ed8a81d8022b0=
981162e9b4e286886d9e281adee81175725072c3d413ec
>     Unable to find matching sigdata for diffstat:do_package with hash e5f=
f0ed8a81d8022b0981162e9b4e286886d9e281adee81175725072c3d413ec
>
> i.e. a couple of dependencies were different.
>
> bitbake-diffsigs tmp/stamps/core2-64-poky-linux/diffstat/1.65.do_package.=
sigdata.f3fe486831eede23d2ebbc1efe2e2510f49f5df6d5d8a8ceb7aa2ddc6e11b1ec  .=
./build/tmp/stamps/core2-64-poky-linux/diffstat/1.65.do_package.sigdata.af8=
ebe96c5cf424e1094c1599400a56096302e16d0f691daaeec380b963f37b2
>
> showed no output, i.e. they appear to be the same but different.
>
> My best guess at what is going on here is hash equivalence causing
> problems.
>
> So in summary, I think the best solution will be to disable hash
> equivalence for these tests.
>
>

Hi Richard,

Thank you a lot for digging into this!
How can I disable the hash equivalence for these tests?

Should I use BB_BASEHASH_IGNORE_VARS for that?

I tried the following:
self.write_config("BB_BASEHASH_IGNORE_VARS +=3D \"TOPDIR\"")

But this doesn't work, I get a lot of errors like the following:
ERROR: When reparsing
/home/jstephan/upstream/yocto/poky/meta/recipes-devtools/quilt/quilt_0.67.b=
b:do_packagedata,
the basehash value changed from
8b6adb69d1f05eddb3e86143bf9a51060f4fac153742964bb4a3d53bee93d377 to
9dee5dada20d7f8ccfc89ed3114c428af8c96d665234fead22c25fb118f9f62b. The
metadata is not deterministic and this needs to be fixed.
ERROR: The following commands may help:
ERROR: $ bitbake quilt -cdo_packagedata -Snone
ERROR: Then:
ERROR: $ bitbake quilt -cdo_packagedata -Sprintdiff



Cheers
Julien

> Cheers,
>

> Richard

