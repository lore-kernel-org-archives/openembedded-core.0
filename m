Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3608C27C7A
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 07:44:27 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.182067.1692258259868489941
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Aug 2023 00:44:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=pwkuUEBa;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-4ff88239785so3827458e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 00:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692258258; x=1692863058;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tervpsIq9UDSxMzobugr/RVpfgkaMiIftCI+px/t4Bs=;
        b=pwkuUEBaW88fchFZ5DnMBeG9vOkeBsu1dFM64tz4qdRJ0DEvfqJqlRKQet9TpTk5Qv
         b4USWgCdHaHeQUKNV1aWBv+G4ejFxlsuDs6uEAyQvczqAEee+KaLLBtnpUVyt3AE2lWK
         x693VhXhYw42b46HRF5fNJEKATWXbi0Tp4BzPjBSvx+MuUCKW3EgMAPzGbLCkEDODTJ9
         YX08IJnjtzWlUBWwd/ihIYbTEXxzYLSyzAbL8gXdhBsGVadlJRAenPwhgBe2G8cEEKhz
         vaqxxoe+kwXb31R0HB1b1IFTyvpb4Cj+glVtgz5lZ2GVoJqIUfHPVMuHJsqMVXIFNyd2
         Gmag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692258258; x=1692863058;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tervpsIq9UDSxMzobugr/RVpfgkaMiIftCI+px/t4Bs=;
        b=ENf+dYIgG413MhmlbiOxAGANGkTawCBz01cMSm4SXyjsa8zvndW4ssJFVjjxjZuTC8
         w0ea7LW01RJhMRJnbS23ZOP2buLx00V9157GTacmRGU1GPaXXiqQy8+0qgc2g7kAoCN8
         SaLEI5sEsj6STbpOtZlrVPOSSwQDA8gg88NtcYjbY0g2QlgBZcQylHOn5R7DXgA7chAo
         XukJ25u3/OMnts0zVZbcunQr7U8NkwdENGlEEYzInDHyzHtBeimmXWhaBCOgmX+1RCIx
         Sct73zOQ6ziub/Gio/+Cf/rmFg1GXBXSOOrQ5/nX53sI6G7S0VV/1dtuL4AJPNPbMjxc
         YIyA==
X-Gm-Message-State: AOJu0YxpXbc4pQePgvwgw3QrvmUeOtx7qnmqGCvV8jqVkWgLH4aqrOLE
	BbqNWK/0zoVKbt0rkW1AKzz9XSwE4ITSdEvvdxo=
X-Google-Smtp-Source: AGHT+IHrVu4JTQq5yaMfT17eFQB7+8Ddg6AeXoeebYPh99EVtBf4fkOpP2XB7C3//qtYZQycGLc1Kcu4e71e/0BinHU=
X-Received: by 2002:a05:6512:3e1a:b0:4fe:2d93:2b51 with SMTP id
 i26-20020a0565123e1a00b004fe2d932b51mr4204153lfv.27.1692258257658; Thu, 17
 Aug 2023 00:44:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230817061149.503336-1-jtilahun@astranis.com> <fd9fb58a880db328172a7aa08912b230fb409312.camel@linuxfoundation.org>
In-Reply-To: <fd9fb58a880db328172a7aa08912b230fb409312.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 17 Aug 2023 09:44:06 +0200
Message-ID: <CANNYZj8SqfHt0TJYjSdm=o40X7YQTgg3Qg10dN4K_51PbO9=sg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] time: use the monotonic clock to compute time elapsed
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: jtilahun@astranis.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 07:44:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186293

I also wonder about maintaining consistency. We may fix everything to
monotonic() now, but further newly introduced usages of time() may
creep in in the future. time() is simply standard practice, and I
would use that without thinking or consulting manuals.

Alex

On Thu, 17 Aug 2023 at 09:27, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2023-08-16 at 23:11 -0700, jtilahun via lists.openembedded.org
> wrote:
> > From: Joseph Tilahun <jtilahun@astranis.com>
> >
> > The monotonic clock is preferable over the system clock when computing the time elapsed.
> >
> > Signed-off-by: Joseph Tilahun <jtilahun@astranis.com>
> > ---
> >  meta/classes-global/buildstats.bbclass        |  4 +--
> >  meta/classes/buildhistory.bbclass             |  4 +--
> >  meta/lib/oeqa/core/context.py                 |  4 +--
> >  meta/lib/oeqa/core/runner.py                  |  4 +--
> >  meta/lib/oeqa/core/target/ssh.py              | 14 ++++----
> >  meta/lib/oeqa/runtime/cases/ltp.py            |  4 +--
> >  meta/lib/oeqa/runtime/cases/ltp_compliance.py |  4 +--
> >  meta/lib/oeqa/runtime/cases/ltp_stress.py     |  4 +--
> >  meta/lib/oeqa/runtime/cases/oe_syslog.py      |  4 +--
> >  meta/lib/oeqa/runtime/cases/rpm.py            |  4 +--
> >  meta/lib/oeqa/runtime/cases/systemd.py        |  4 +--
> >  meta/lib/oeqa/selftest/cases/binutils.py      |  4 +--
> >  meta/lib/oeqa/selftest/cases/gcc.py           |  4 +--
> >  meta/lib/oeqa/selftest/cases/glibc.py         |  4 +--
> >  meta/lib/oeqa/selftest/cases/runcmd.py        | 12 +++----
> >  meta/lib/oeqa/selftest/cases/rust.py          |  4 +--
> >  meta/lib/oeqa/selftest/cases/tinfoil.py       |  4 +--
> >  meta/lib/oeqa/utils/commands.py               |  4 +--
> >  meta/lib/oeqa/utils/qemurunner.py             | 34 +++++++++----------
> >  meta/lib/oeqa/utils/qemutinyrunner.py         |  8 ++---
> >  meta/lib/oeqa/utils/sshcontrol.py             | 10 +++---
> >  meta/recipes-rt/rt-tests/files/rt_bmark.py    |  4 +--
> >  22 files changed, 73 insertions(+), 73 deletions(-)
> >
> > diff --git a/meta/classes-global/buildstats.bbclass b/meta/classes-global/buildstats.bbclass
> > index f49a67aa4f..1abd52c72a 100644
> > --- a/meta/classes-global/buildstats.bbclass
> > +++ b/meta/classes-global/buildstats.bbclass
> > @@ -64,7 +64,7 @@ def get_timedata(var, d, end_time):
> >
> >  def set_buildtimedata(var, d):
> >      import time
> > -    time = time.time()
> > +    time = time.monotonic()
> >      cputime = get_cputime()
> >      proctime = get_buildprocess_cputime(os.getpid())
> >      d.setVar(var, (time, cputime, proctime))
> > @@ -77,7 +77,7 @@ def get_buildtimedata(var, d):
> >      oldtime, oldcpu, oldproc = timedata
> >      procdiff = get_buildprocess_cputime(os.getpid()) - oldproc
> >      cpudiff = get_cputime() - oldcpu
> > -    end_time = time.time()
> > +    end_time = time.monotonic()
> >      timediff = end_time - oldtime
> >      if cpudiff > 0:
> >          cpuperc = float(procdiff) * 100 / cpudiff
>
> Looking at the python man page, it says:
>
> """
> The reference point of the returned value is undefined, so that only
> the difference between the results of two calls is valid.
> """
>
> so we have to be really careful none of this data is data which is
> compared against bitbake's event timestamps for example.
>
> Is there a real world issue you ran into using time.time()?
>
> In the above case it is true we're just computing a difference but did
> you look into all these cases and check that the value isn't used
> elsewhere after the return value?
>
> I'm just a bit worried there may be leakage of these values where it is
> compared with time.time() or it is used in logs for absolute time data.
>
> Cheers,
>
> Richard
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186289): https://lists.openembedded.org/g/openembedded-core/message/186289
> Mute This Topic: https://lists.openembedded.org/mt/100795709/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

