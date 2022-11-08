Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF603C4332F
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 18:36:03 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web09.890.1667932559273971764
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Nov 2022 10:35:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HJKt8MVu;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id a29so3875644lfj.9
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 10:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IDmwYOsC9ceYH/mHcyvA0c94/ZqRFMIC1rjmX2Q42Y0=;
        b=HJKt8MVu5I16pN2inQuGwit2+Z/iG+7Gh1nnRK0aaF3xSAhLcHw+eAF6+8R48h6Okb
         DxCWWy1z/WrsBfQG3nA7DIOSsLgxC/glQG1Psbs6xPnyuIVYhtJm7O4IVeNfHTu716/W
         faBO86AjzvOAlQT7n3PmhHzvCfpMO/4fGvV5h5ORdVB8XYJV7R+e3PPMdhBSb27QvEK9
         op8oIeIpQ9Eli80aO5pizkP63TwCM2sOij0kDtmzdL8X3xmEcJxuU34KQRzumz5jfOVv
         kM/ly5z51NSNdoUfjyIOxMhfXn7VdF+3c2xxZxRZVg0eRuBfn0dMs7ZTsXQtAOV6HkQB
         bydA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IDmwYOsC9ceYH/mHcyvA0c94/ZqRFMIC1rjmX2Q42Y0=;
        b=sTiqrZvdftvyimhE4IiVTJoVHY8KF8BoHwWxQ+SP4RsD8RyLxbvcZpMVmVuvmjbwoe
         t+hpQzTGXanvslUPNeaEhvDFfR/jljZrwffUGG5D0OezQseklO+Ic9GS4ot/SXq05jAt
         r7cINUeP2XjfdXYd7DwshTev55pa5fJUrsUn4hSodU4NOdwiuOd9utkJ79O9C1mo2jjt
         fz6rgnd0zvTi9h7DGA91MWCY/b33nJdS+QqdaDOW9OZZMIuqUmXpqNM/WrCq3izuOMmW
         IhA+QGj5CpBL0uw3cUDV1oKw+j0k0Tnhr0IsKzjy/Ll+liRjfc1kCHJcQxTdnvyuSOfB
         IMAg==
X-Gm-Message-State: ACrzQf1wdNUA8dT/lq7FIp+PZPi05YI7TEfJlXtdxn6cNnW1Aq3cY2Er
	NtbERCXOwwtzVomBrjg9IOYL92s6vmNIdRy+e84=
X-Google-Smtp-Source: AMsMyM7t0hi6XoLSYnXMEF5wIeol0fif+/0kFsZn0COjKCO7xoVgTyMq1M77NO2/Mnn2BqdNyV+s31ZNIEZxPm61P2M=
X-Received: by 2002:a05:6512:2399:b0:4a2:94d6:da27 with SMTP id
 c25-20020a056512239900b004a294d6da27mr20295251lfv.131.1667932557276; Tue, 08
 Nov 2022 10:35:57 -0800 (PST)
MIME-Version: 1.0
References: <20221107145508.1051404-1-alex@linutronix.de> <20221107145508.1051404-47-alex@linutronix.de>
 <29FE1D7A-808C-4EFA-880F-5D7C055C7E2E@arm.com>
In-Reply-To: <29FE1D7A-808C-4EFA-880F-5D7C055C7E2E@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 8 Nov 2022 19:35:45 +0100
Message-ID: <CANNYZj-sdmMc7Oskv_weGnShN2eE1RVArKkytDRvuxcq96A0+w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 47/48] sanity.bbclass: do not check for presence
 of distutils
To: Ross Burton <Ross.Burton@arm.com>
Cc: Openembedded Core <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 18:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172990

I'd say we should just drop the check then. If something breaks, then
that something needs to be fixed to not use distutils anyway, and not
doing the check will expose those items in need of fixing.

Alex

On Tue, 8 Nov 2022 at 19:18, Ross Burton <Ross.Burton@arm.com> wrote:
>
> On 7 Nov 2022, at 14:55, Alexander Kanavin via lists.openembedded.org <al=
ex.kanavin=3Dgmail.com@lists.openembedded.org> wrote:
> >     # Check the python install is complete. Examples that are often rem=
oved in
> > -    # minimal installations: glib-2.0-natives requries # xml.parsers.e=
xpat and icu
> > -    # requires distutils.sysconfig.
> > +    # minimal installations: glib-2.0-natives requries # xml.parsers.e=
xpat
> >     try:
> >         import xml.parsers.expat
> > -        import distutils.sysconfig
> > +        import sysconfig
>
> Well, we check for distutils because it=E2=80=99s often packaged separate=
ly, for example in Debian/Ubuntu it is part of python3-distutils and is not=
 installed if you just =E2=80=98apt install python3=E2=80=99.
>
> sysconfig is not split out, it=E2=80=99s part of the core library.
>
> If we don=E2=80=99t actually need a *host* distutils anymore (and this is=
 easily tested) then we can remove this check entirely. If we do, then this=
 test needs to remain and the code that uses *host* distutils should be fix=
ed.
>
> Ross

