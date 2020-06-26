Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
 by mx.groups.io with SMTP id smtpd.web11.6171.1593173175860713166
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2020 05:06:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=VKWSimOY;
 spf=pass (domain: burtonini.com, ip: 209.85.208.193, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f193.google.com with SMTP id t25so5490844lji.12
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2020 05:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=nNN2w8q1NMEY4j8Z8+sgRcsh3qMxDY4ACZeDV/Nwmw8=;
        b=VKWSimOYh/sRYENOwJQ/Fr8PpwlAL0Pxo+pgOFpPIMwnxzGPBIRiXkypPk5pT2jjgG
         xr/s7usK+NAg1PXMdilRjd03ODlOFRC6AoAxGgupO5lEgaAVUZPrw4X/VaufzAJlGaxz
         5ox/JxCplE8hb5FvuiXs7zBTK0HGGSsDANuPlTC0Hq0fTknwF/8OxFKCUGZlrbcce4vZ
         O604fBCzaIH7JlagBteRoI0K9OwvyKWq1BgL7Tr/upisRTeD3Y+H3wRRqUGtGygj38LJ
         VwMEx6CBzijmRI1U/s61hllWn9i2Tr/QheqMG1i7a1Upf7gZf0iKjWvl0tauMM1Q+raW
         G1Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=nNN2w8q1NMEY4j8Z8+sgRcsh3qMxDY4ACZeDV/Nwmw8=;
        b=oEjs1FLpWOSpeRir5CdqqMnge4TwpBPU7ifqKFfbyGAyChJbIRu7S+fDLA3Lx6o8jY
         MgKWCPY5jy5zZZck8xZmryrNjBL1JZFRt9h74Qrb6Vvp8BQUy9IdgNfnlfiDehrkX7BR
         4FKr+ERm0Gk67n3GpV75EqC2a108OpWgFYRCgRhQ1rZIP2UhFtnrbzT+67MFjExJ7v63
         8vujR3r5DsNiOxctT0DLKYy4YNnQpD5IZOmR3ffx2uCQo/PTaIQS2iXyceqRRciwmWQd
         zeM0a6xwNQgEg+TYy2ygyge6jGgo/4hTIY4gjWEMxqjFV2bIoEmVf5NnKZeNQIWXOFsr
         F7Xw==
X-Gm-Message-State: AOAM532o1lP6VVN3ss0EZqKCtV9LVqfnE/XZS8VZCHyXjd0GMKD07Ypd
	DJ7y/xYbffkhwqoTwgtDze/colEU27oZC2o1xXtVqMoWVO0=
X-Google-Smtp-Source: ABdhPJyVPN+pvVEo3QiOb2wdBFiOX8zSisyrgMKMNip9h6bGixz0PWOTATbm3+3OuP7EVKwN3ieD+3/pmxd5sgrmqQk=
X-Received: by 2002:a2e:854c:: with SMTP id u12mr1224168ljj.352.1593173173686;
 Fri, 26 Jun 2020 05:06:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200622125359.11587-1-ceggers@arri.de>
In-Reply-To: <20200622125359.11587-1-ceggers@arri.de>
From: "Ross Burton" <ross@burtonini.com>
Date: Fri, 26 Jun 2020 13:06:02 +0100
Message-ID: <CAAnfSTtcUvrt1dVYXi+2qfo_kQOKGn6PSCucaq3x5WH4Dgr-vQ@mail.gmail.com>
Subject: Re: [OE-core] [Patch v2 0/2] Extend dependencies of networkmanager for native/nativesdk
To: Christian Eggers <ceggers@arri.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'm curious what you're actually building for native here? (ie what
bit of network manager is meaningful as a native build).

Ross

On Mon, 22 Jun 2020 at 13:54, Christian Eggers <ceggers@arri.de> wrote:
>
> On Friday, 2020-06-19, Richard Pudie wrote:
> > A native eudev is a really bad idea, a nativesdk one isn't much better=
.
> > If there are libs we need from here, then the recipe should only be
> > generating those but a "native eudev" makes no sense to be needed by a
> > build system.
> Ack. I already expected that there might be a (hidden?) rule, what type =
of
> software is (NOT) allowed for -native/-nativesdk.
>
> > A native or nativesdk consolekit does not make sense.
>
> > If you need libs from networkmanager, you'll probably have to patch it
> > just to generate the libs you need. We don't want builds polluted with
> > confusing and potentially quite problematic binaries.
> Networkmanager can be built fine without consolekit. Probably this will
> not make any difference for libnm.
>
>
> Changelog v2:
> --------------
> - eudev: Don't build main package for -native(sdk), only libudev is
>   required
> - dbus/dbus-glib: Patch removed
> - consolekit: Patch removed
>
>
>
>
> ________________________________
>  [http://assets.arri.com/media/sign/2020-04-03-E-mail-signature-Stellar2=
_V1.jpg] <https://microsites.arri.com/stellar/>
>
> Get all the latest information from www.arri.com<https://www.arri.com/>,=
 Facebook<https://www.facebook.com/TeamARRI>, Twitter<https://twitter.com/A=
RRIChannel>, Instagram<https://instagram.com/arri> and YouTube<https://www.=
youtube.com/user/ARRIChannel>.
>
> Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
> Sitz: M=C3=BCnchen - Registergericht: Amtsgericht M=C3=BCnchen - Handels=
registernummer: HRA 57918
> Pers=C3=B6nlich haftender Gesellschafter: Arnold & Richter Cine Technik =
GmbH
> Sitz: M=C3=BCnchen - Registergericht: Amtsgericht M=C3=BCnchen - Handels=
registernummer: HRB 54477
> Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Neuh=C3=A4user; Stephan Schenk; W=
alter Trauninger; Markus Zeiler
>=20
