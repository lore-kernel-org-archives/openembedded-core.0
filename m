Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B093AC4332F
	for <webhook@archiver.kernel.org>; Sat, 17 Dec 2022 17:11:52 +0000 (UTC)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
 by mx.groups.io with SMTP id smtpd.web11.11913.1671297106912283653
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Dec 2022 09:11:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jThgIXrR;
 spf=pass (domain: gmail.com, ip: 209.85.166.44, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f44.google.com with SMTP id p66so357552iof.1
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Dec 2022 09:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=93QYcKslO0iCadQaPzyqnfZBCCkIZv4jSeaPZqNtJjU=;
        b=jThgIXrRGdyamtpr0acjisNtHcxsBYQ9kSWvznshgqPGEe1YwdyDJCwnZ/EF04WZ9O
         Yrma0Zr4FxtoNHq/AHIYIac3xD7PYdIh4TomM6SvRa8atOLzODE2qkp0Hkky6l38UmzP
         DZIopjTMcfNzeTSkl9goDPOD1n3hbVGm94D/0lk6Fh1tIJtE2PJReja2Sa7tyxDU2+m6
         nIm0qtx48Uw+jJBRkTGjqpRk+DzmhaCLtQmv0ewQBFQJG3iaVtVqg9myZP9C2CAsRLjY
         xAJapMHS2QCB7rKG7Tom6KkfqGDPl7WGLmMi4OcBJRN420Sp/pC4aM5Ghs6ZBjikRvpv
         5xww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=93QYcKslO0iCadQaPzyqnfZBCCkIZv4jSeaPZqNtJjU=;
        b=aNR5f18JzkCWt7DcatIq/akZJRA2dptpfTt0lKXQfGSzZTCf8jV5MVli+QRR592VnP
         F5mKG/c7pbKYazUqK8OMd4tw3I7uQ6da5BVpHX96m/PxFxIipdqqRjzaKp+kpRBmcqKv
         VYuyxI74wnelUi3mdVUSgLS1/8nX5b7fj/ZVMiUIcnzz9V2r7o2cKcXvZ91me0dx2hz0
         1vWsab5S0xEB3lK2jb1dtZjX5+0AckC4/cr6JS3N3AeO4vcqseJtke8qBwRj8+7Yogbw
         lxmjkNhG8FIPL/833eC5NXUWuZSG9dDOyxNa/HYCWUzHKKYcwYcasfOgeRQvotpNzsxY
         KWaQ==
X-Gm-Message-State: ANoB5pn0KOBE+I1WFIVHhS2rdez4brmaebjt4I0ZhmX09I+BYQMo/rM9
	/G9UFnkoHpMZdm9grlGZAx0XiUo41nTe6ICCOpo=
X-Google-Smtp-Source: AA0mqf7qT9xZHt1UWe8IXoXDty1x1b6sv8TnRqsZUFtx4HGspcRs8C0+sbXympcXh/UiU5995F3fawxRpTXSrAXlnrc=
X-Received: by 2002:a05:6638:1a86:b0:38a:a6c3:7983 with SMTP id
 ce6-20020a0566381a8600b0038aa6c37983mr2815192jab.187.1671297106242; Sat, 17
 Dec 2022 09:11:46 -0800 (PST)
MIME-Version: 1.0
References: <20221215073224.3061128-1-alejandro@enedino.org>
 <CANNYZj9qbT+fGQ=18hjLkzR4D=eyr1amX2qxpwM5u_XQTqLo3g@mail.gmail.com>
 <CAHMutrae2sCtGqa-aXVYz1_kDkCtnY2qjKLhGunA-U3-ZxthnA@mail.gmail.com>
 <CAO5Uq5S2reaaVJe7hZwL2okWjKBbVhU_=g6bMjguQ7T9UNC-Vw@mail.gmail.com>
 <CAHMutrZnL2e4_7AuPkacEb-Rgyw0cb7eaErjWRuXZYXu_fUZgw@mail.gmail.com>
 <1731096B411C6A99.9432@lists.openembedded.org> <CANNYZj9BmxffYxhd1gWy6dUBcsjHi6kXgswC=4LVXUnePSOo1w@mail.gmail.com>
 <CAHMutrZhNPdLoiFTfOVvHiqqeYwSOyPB3v2qmmy7BUoraj=GZg@mail.gmail.com>
 <CAHMutrbJo2ocWz88UbQsRjBDccXr0yVDC60SZ35bdMaXHw8LAw@mail.gmail.com>
 <CAO5Uq5QT1zg1jC0wHFMxv0T+m7y_GSS2Wdg_vbuG3Yi5hOZpgQ@mail.gmail.com>
 <CAHMutrYvqcZ806jGpOYwgNrQJKUhoRicf_6M+9REPV5L2Mttxw@mail.gmail.com>
 <CAO5Uq5RTVPLuTS8JePuTy2jgGq6troObiMiPcoUg0VMzbq=geg@mail.gmail.com> <CAHMutrajquaPOofJH6YaF5kqLk2kWif-WVDuRXNRUfUv7f8ZLQ@mail.gmail.com>
In-Reply-To: <CAHMutrajquaPOofJH6YaF5kqLk2kWif-WVDuRXNRUfUv7f8ZLQ@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Sat, 17 Dec 2022 17:11:33 +0000
Message-ID: <CAO5Uq5Ty+yOF7k7jC6s_nfW9R6LiaaDFAR2g=d+jLGKiMxg_XQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] rust: Enable building rust from stable,
 beta and nightly channels
To: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Dec 2022 17:11:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174780

On Sat, Dec 17, 2022 at 1:20 AM Alejandro Enedino Hernandez Samaniego
<alejandro@enedino.org> wrote:
>
>
>
>
> On Thu, 15 Dec 2022 at 22:33, Alex Kiernan <alex.kiernan@gmail.com> wrote=
:
>>
>> On Thu, Dec 15, 2022 at 9:45 PM Alejandro Enedino Hernandez Samaniego
>> <alejandro@enedino.org> wrote:
>> >
>> >
>> >
>> > On Thu, Dec 15, 2022, 3:36 PM Alex Kiernan <alex.kiernan@gmail.com> wr=
ote:
>> >>
>> >> On Thu, Dec 15, 2022 at 6:24 PM Alejandro Enedino Hernandez Samaniego
>> >> <alejandro@enedino.org> wrote:
>> >> >
>> >> >
>> >> >
>> >> > On Thu, 15 Dec 2022 at 11:11, Alejandro Enedino Hernandez Samaniego=
 <alejandro@enedino.org> wrote:
>> >> >>
>> >> >>
>> >> >> On Thu, 15 Dec 2022 at 11:03, Alexander Kanavin <alex.kanavin@gmai=
l.com> wrote:
>> >> >>>
>> >> >>> On Thu, 15 Dec 2022 at 19:01, Alexander Kanavin via
>> >> >>> lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedd=
ed.org>
>> >> >>> wrote:
>> >> >>> > Ok, I think what we should do first is to actually drop the ver=
sion
>> >> >>> > from all of the .bb file names, and set it once, inside some .i=
nc, and
>> >> >>> > probably next to SRC_URI and tarball checksum. Then this should=
 allow
>> >> >>> > a convenient scheme for including and overriding things.
>> >> >>> >
>> >> >>> > rust_1.65.0.bb - > rust.bb, and so on.
>> >> >>>
>> >> >>> Oh, and upstream version checks must be kept functional. It needs=
 to
>> >> >>> both correctly report a newer version, and match the recipe versi=
on
>> >> >>> with upstream if it is already the latest.
>> >> >>>
>> >> >>> Alex
>> >> >>
>> >> >>
>> >> >> How should I test that upstream checks are still functional?
>> >> >>
>> >> >>
>> >> > Actually how would this make it any simpler?, if we remove PV from =
the filenames, the correct place to put the variable is in rust-source.inc =
since all others include it (rust-cross-canadian, rust, rust-llvm), if like=
 I said, rust-source.inc gets included from somewhere else, wouldnt that ov=
erride PV for the other recipe as well? beating the whole purpose of the ch=
ange, this, or creating a new .inc file just for this seems too convoluted =
IMO.
>> >> >
>> >> > If changing RUST_VERSION is too problematic on every upgrade I thin=
k approach #2 its a lot simpler just specifying RUST_VERSION on other recip=
es since it would be very seldom used and it wont conflict with upgrades
>> >> >
>> >>
>> >> Actually changing it is clearly straightforward, the problem is that
>> >> upgrading the rust version is already tricky because of the need to
>> >> regenerate the cargo checksums, so every extra step is something that
>> >> you have to remember to do.
>> >>
>> >> Which leaves me wondering how introducing nightly/beta actually work
>> >> with those patches?
>> >
>> >
>> > I understand that , the checksums/patches shouldn't cause any problem =
since as its explained in the commit message beta/nightly builds from the e=
xact same sources, hence patches should apply and checksums wouldn't change=
.
>> >
>>
>> Sorry, now I'm properly confused, if the sources don't change, how is
>> this beta/nightly?
>>
>> cargo-checksum.json is basically completely non-patch friendly, you
>> have to fix it up every time as its based on the vendored sources in
>> the tarball.
>>
>> --
>> Alex Kiernan
>
>
> Yes, I was confused at first myself, the channel actually works as a buil=
d time flag, setting it to "beta" would enable the beta
> features that already in the source code at the time of every release, sa=
me with nightly hence why there are no extra conflicts
> when doing upgrades..
>

Oh I see... that makes sense now!

--
Alex Kiernan

