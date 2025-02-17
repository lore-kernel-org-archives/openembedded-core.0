Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17491C021A9
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 18:10:14 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.296.1739815809156232301
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Feb 2025 10:10:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XcIrkTiN;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-309311e7b39so21002311fa.2
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Feb 2025 10:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739815807; x=1740420607; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0D9WazJ17wN8tc9Z7zHKiPkQrWQRLW6wktkThiZCEak=;
        b=XcIrkTiNsWkyIh+14eXw4ErII2MbPQJHwqDLmVUjEGaO+tZXJd8xeAi+O0rE2wgGOG
         pW301BMZxK1V0Lc8GjlR7kmy4+mduU3BID3IS1NDza4wKAFJMeqLVmgY/okquGdnT4QS
         HFvvLIErymM61WDVxzYC1G5/lBzhPQj433BiDrHxgzYZg89h6pAPc39svAFLL/U0Wk3u
         er2jdMd+PQ37P1WkYUrN8mH0HEFiV1mDR2GA3GCkzRbPRU/10zOI0sMSgCjeXF0mchQG
         wpXqX0xl1+v2k6A3qZ5ExQRWRwMiaIP4Tz3pSBpaKQhFBzwR8pX8a5E9l79ZY8U+vBLu
         5v9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739815807; x=1740420607;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0D9WazJ17wN8tc9Z7zHKiPkQrWQRLW6wktkThiZCEak=;
        b=ktTEVEG7t9G4fTFP2MaWDnaB/xFoGi299Gf88HXFaqirgNqWBLBMwe2cpusUBSvDbb
         hCrKx/cc7qNTABL049u4k+k18cTzAK7iGiXClgF5f1urUzq8dKhEe3wXPPIp1Qr1+rxu
         VqMH1Bz0mlfrSMs9i7KU220YMCx8mxaSoEb3dASrCa2GN+C6BgbwPC8kaM0rcmc6CDbn
         URaN9TbzjgqUo3aC3tPm4vg2hLJ92EuYE/It4DPqyHF1XAuRdCVi7HwxKbHaKRaxwbOQ
         8cfxkJNV/Ci0yA49voK/kyOJXqfhES9wdhZ7KsaB/QTokI/QUJkvGUbMRJA+p8Io1w1W
         T34w==
X-Gm-Message-State: AOJu0YydeyB6p3MnSEqHp4opvFh3tEJSCByEM2xzMuRuIHXZTJ9ixW9T
	48pPZzI6RSLVrkezD03PmuAj59hqXWCj0c9TV7jqZs67wxbMCWAqwc2rcrBMGft6uBSiCiR+B4X
	lE39uKtcaONHzSudNYQs5ToHZ158=
X-Gm-Gg: ASbGncsRstU+HCv45C+OvylmoVBL54VAjmqKSmKp6IWbn/Rsxrsqr3gzn6lvNWUaW2I
	mIGs81wqyxQuYB9ouudBpyW24qtf00Fs3/jQh12VWwcu8rfRTLxcyjJd2ewPxBuCdouHctmDRPh
	UaKRw=
X-Google-Smtp-Source: AGHT+IHSu2a8nfc/2GpCVruSJLi3cJZzFtdm8jIKss/dy3RtQ+yu4HiTEmX/1BFtxSCHrCk8ELLFY8Y481S2uKaUmXs=
X-Received: by 2002:a2e:bc0e:0:b0:309:1774:b279 with SMTP id
 38308e7fff4ca-30927afe14fmr37445191fa.31.1739815806873; Mon, 17 Feb 2025
 10:10:06 -0800 (PST)
MIME-Version: 1.0
References: <20250215165545.1929-1-alex.kiernan@gmail.com> <bbf0cbf2-b188-402e-83d2-f3e6f8dfd300@cherry.de>
 <CAO5Uq5R6abpgBoGMnatNthEThR0_GAqP+Q+etOurUT_9jLfkgw@mail.gmail.com> <1dac770a-f6b6-4b30-9c00-4d2576527409@cherry.de>
In-Reply-To: <1dac770a-f6b6-4b30-9c00-4d2576527409@cherry.de>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 17 Feb 2025 18:09:55 +0000
X-Gm-Features: AWEUYZkR6sWq6-HB_65kMVW4E9Tx2FFB5b4Vf-ANWFH3UM1s97mRmTZKUMEtMz4
Message-ID: <CAO5Uq5TOMEdKMB=G0r7Sav_B1P086o+BHiUDvOmGAUGEtQDWbA@mail.gmail.com>
Subject: Re: [OE-Core][PATCH v2] packagegroup-base: Add option to set zeroconf provider
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Feb 2025 18:10:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211549

On Mon, Feb 17, 2025 at 5:05=E2=80=AFPM Quentin Schulz <quentin.schulz@cher=
ry.de> wrote:
>
> Hi Alex,
>
> On 2/17/25 12:16 PM, Alex Kiernan wrote:
> > On Mon, Feb 17, 2025 at 10:32=E2=80=AFAM Quentin Schulz
> > <quentin.schulz@cherry.de> wrote:
> >>
> >> Hi Alex,
> >>
> >> On 2/15/25 5:55 PM, Alex Kiernan via lists.openembedded.org wrote:
> >>> avahi, systemd-resolved and mDNSResponder (in meta-networking) can al=
l
> >>> provide Zeroconf services. Add a `ZEROCONF_DAEMON` option to select
> >>> which of these will provide service via packagegroup-base-zeroconf.
> >>>
> >>
> >> If I'm not mistaken, this seems to be fitting RPROVIDES usage?
> >>
> >
> > I guess I'm guilty of copying what was there (WIRELESS_DAEMON)
> >
>
> Fair enough, consistency is probably better here then :)
>
> >> and then we simply RDEPENDS on zeroconf-daemon?
> >>
> >> Does that work (haven't tested myself)? What do you think?
> >>
> >
> > And then selection via a PREFERRED_RPROVIDER:zeroconf-daemon =3D "..."
> >
> > I guess I think it should work, though my concern is the interaction
> > between the daemon and the nss plugin, which is how I ended up down
> > this rabbit hole in the first place!
> >
> > We seem to have very little usage of RPROVIDES (other than as a
> > migration mechanism) and PREFERRED_RPROVIDER in general.
> >
>
> That makes sense if the packages are absolutely incompatible with each
> other. For example, for the WIRELESS_DAEMON case, you may want to have
> wpa-supplicant but probably could have iwd too in the same rootfs and
> let the user pick the one they want to use?
>
> If we can have multiple zeroconf daemons, then that wouldn't be a good
> solution anyways.
>

Technically you can (as this is a multicast socket), but actually
making it work properly isn't straightforward as you'd end up with two
daemons both announcing the host record. Pretty sure you can make it
work, which is different from wpa_supplicant/iwd (and I guess you
could even make those coexist if you had two wireless interfaces?),
but I'm not sure it's an out of the box configuration we should be
point folk at! libnss-mdns is a simple pick one or the other choice,
but that's enforced anyway because they end up colliding in the
filesystem.

Frankly it's a bit of mess...

--=20
Alex Kiernan

