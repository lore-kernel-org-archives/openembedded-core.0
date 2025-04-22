Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF94BC369C2
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 21:51:01 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web11.2257.1745357162412910604
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Apr 2025 14:26:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J2i7rjmT;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: patryk.seregiet@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6f0c30a1cb6so40983506d6.2
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 14:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745357161; x=1745961961; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ug5MLz+CEFikO/wKGhjGdkQb4XZCmQ4S2wIH+aFaX0c=;
        b=J2i7rjmTevlk5GuVqKwjykunoM//cIpAV7S6VwiaDHVAyF++516Gof3iBkYwmvZSER
         zsx88LtdtboE/hAy+4kolHCj+xL0ImrnmA3Y/Dt17fLdWcFhHqvdtsIMVHRvtyL0Ka1l
         6hWUdp8RV3cWcq+3jUQ26dqwh3RrGsDZIsF/Vx6rkw8bgS3amPlFzitWMPku23WdpG69
         astwduB81sDq9l6zSlBxQoDqi6c/fVRLUZkiYB+5Ltp4ykuq3c6iGd0LH/gArs35FZ8r
         8jwNKvUvTCyBmb+uGN0q1+QpEQ5ocHULGwHYo7bX5/s39JG+4u8gFFJ5N0Cv6487MkFj
         2xJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745357161; x=1745961961;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ug5MLz+CEFikO/wKGhjGdkQb4XZCmQ4S2wIH+aFaX0c=;
        b=LcsOAkRg/4eVJ9INAnJf+kQ0D1055/xADi0n7gIpdSIeE9M9hH92D9d1uw67PdiRBh
         0h4pmou2K1BJDwMUNpWBguE+U4vH7K71pfdbo/7+4eKdETHfq/Y8A93tLxhOprROViRO
         BcMTRqzvsYIg/7R5wfr4OnesFOKEWygm7M5a4MxL+G5T8o8f0dDe5nZolRYzBqN49tnW
         Y3CT0XlwOGKlnn5J4grRUUFjGIxY26JfbD43AIjswJcGKorQep5Fr/s+sd58Be8mLe7e
         L0/KG9D7UyPgZD5jgFrQ97iud7WKyse5TJ64CcYXaZv9yJ3jpaS1XS+gtBlMMpo7hJnM
         hZDw==
X-Forwarded-Encrypted: i=1; AJvYcCWSuZMZbfP6sUujD4f3+Xcqa4pA3l7afoBeJNaeMvDUZRcHghDjQOKjC3lP6X9nw9pDiswTs8RF9XBe2K9PydalwA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwkjbGIoQc51CXRVnAZrKEg5yMFMWE/KwIOrHKeQ4uT8bwA154r
	4iqse7p+YA3Ich7ZwRyGMOxLc9dGJ4bOcEfKsGgMzBmnKLRu20Uq/hdaeUwhamLLZQt6YO+OIC7
	2I8tUojs7qaYgzsvD6VbKeKOspCQBdtWr5HxgfA==
X-Gm-Gg: ASbGnctps2FLVkVVzBXcBATCDDdbchlxiNt+FxShzX8a8c3RD36e3D8VGCFWKEyc4+6
	ThJMietkY8lJ3+oyeUxtYhBTct1veXJmhrdfILhQ1iq6hZ4XWHVvpBNn3WgZh5mVB01xAriM4IS
	qnVpmNUSdyBGuiJh4EJdjerEkdHykuq4iQ
X-Google-Smtp-Source: AGHT+IHzFHK+8vxjUxDb/sf1cr30ieo0OAexkry5NMlmkG92gGvyH+fqECUJwd21pkzxFyLAdOX8R+44Jz87exidROs=
X-Received: by 2002:a05:6214:21ee:b0:6e8:f9e6:c4e2 with SMTP id
 6a1803df08f44-6f2c46458c0mr353828636d6.32.1745357161298; Tue, 22 Apr 2025
 14:26:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAOf3PZyrgCJviBHSBeDMmdcH+possRxwmNRoNOyXzRQtabV8iQ@mail.gmail.com>
 <DB5PR02MB10213F71504E2AA09A113921CEFBB2@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <CAO5Uq5Rp5Z1N9Rhh05XHaVUtTfEinhNFSACwU2kEdi7nBaRjEg@mail.gmail.com>
In-Reply-To: <CAO5Uq5Rp5Z1N9Rhh05XHaVUtTfEinhNFSACwU2kEdi7nBaRjEg@mail.gmail.com>
From: patryk seregiet <patryk.seregiet@gmail.com>
Date: Tue, 22 Apr 2025 23:25:49 +0200
X-Gm-Features: ATxdqUHol2y4dSqHFF1QJCoJU62I0G49mpj5VKrdTmWutQSL8lef0qcXq7R5ZTo
Message-ID: <CAOf3PZxV2mYf7r6o4=EgGGVg3OPqr1W0MiP_bSZ722H7E2vS4g@mail.gmail.com>
Subject: Re: [OE-core] linux-firmware-rtl8723 RDEPENDS on entire linux-firmware
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: peter.kjellerstedt@axis.com, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 21:51:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215248

Hi,

Thanks for the quick response. Indeed that was the reason, I didn't
know bitbake would actually follow the symlinks to include the package
that contains it. I've sent a patch, my first one, so hopefully its up
to the standard :)

Pozdrawiam / Best Regards
Patryk Seregiet

wt., 22 kwi 2025 o 23:14 Alex Kiernan <alex.kiernan@gmail.com> napisa=C5=82=
(a):
>
> On Tue, Apr 22, 2025 at 8:36=E2=80=AFPM Peter Kjellerstedt via
> lists.openembedded.org
> <peter.kjellerstedt=3Daxis.com@lists.openembedded.org> wrote:
> >
> > > -----Original Message-----
> > > From: openembedded-core@lists.openembedded.org <openembedded-core@lis=
ts.openembedded.org> On Behalf Of patryk seregiet via lists.openembedded.or=
g
> > > Sent: den 22 april 2025 18:50
> > > To: openembedded-core@lists.openembedded.org
> > > Subject: [OE-core] linux-firmware-rtl8723 RDEPENDS on entire linux-fi=
rmware
> > >
> > > Hello,
> > >
> > > Today I noticed that even though I only install few selected
> > > linux-firmware-xxx packages I end up installing all of them. Finally =
I
> > > narrowed it down to linux-firmware-rtl8723 RDEPENDSing on
> > > linux-firmware.
> > >
> > > from build/tmp-glibc/pkgdata/iot-gate-imx8/runtime/linux-firmware-rtl=
8723:
> > > ....
> > > 11:RDEPENDS:linux-firmware-rtl8723: linux-firmware linux-firmware-rtl=
-license
> >
> > The problem here is rtl8723d_config.bin, which is a symbolic link to
> > rtl8821c_config.bin. The latter is packaged in Linux-firmware and thus
> > an automatic runtime dependency is added from linux-firmware-rtl8723 to
> > linux-firmware.
> >
> > My guess is that the files matching
> > ${nonarch_base_libdir}/firmware/rtl_bt/rtl8821* should be included in
> > the ${PN}-rtl8821 package instead.
> >
>
> Oh nice catch... I had image size explosion for the board using that
> firmware on my todo list, but hadn't got to it.
>
> > >
> > > Another package that has the same problem is linux-firmware-adsp-sst.
> > > I've looked at all the code, bbappends, different confs and could not
> > > find how linux-firmware ends up as RDEPENDS of this package. The only
> > > commit related to this package I found even remotely likely was this
> > > in oe-core deaaf43b8f6c905f04f3d0c56693c027ceac3e3a
> > > which adds 2 lines to the FILES
> > > FILES:${PN}-rtl8723 =3D " \
> > >    ${nonarch_base_libdir}/firmware/rtlwifi/rtl8723*.bin* \
> > >    ${nonarch_base_libdir}/firmware/rtw88/rtw8723*.bin* \
> > >    ${nonarch_base_libdir}/firmware/rtl_bt/rtl8723*.bin* \
> > >
> > > and what do you know, removing the last line "
> > > ${nonarch_base_libdir}/firmware/rtl_bt/rtl8723*.bin*" makes this
> > > problem disappear. I can't figure out why. Seeing this I took a look
> > > at linux-firmware-adsp-sst. It only has one FILES line
> > > FILES:${PN}-adsp-sst              =3D
> > > "${nonarch_base_libdir}/firmware/intel/dsp_fw*"
> > >
> > > just for the test I removed the asterisk and it also fixed the issue.
> > > Not sure if changing the FILES variable here makes any real differenc=
e
> > > or if it just flushes some bad cache... no idea, i tried
> > > do_cleanall/sstate and all the usual stuff but this is the only way I
> > > managed to create these two packages without them having RDEPENDS set
> > > to linux-firmware.
> >
> > The problem here is similar. There are a number of symbolic links
> > included in the linux-firmware-adsp-sst package that link to files in
> > the linux-firmware package.
> >
> > Moving the files matching
> > ${nonarch_base_libdir}/firmware/intel/avs/*/dsp_basefw.bin to
> > ${PN}-adsp-sst should solve it.
> >
> > >
> > > Pozdrawiam / Best Regards
> > > Patryk Seregiet
> >
> > //Peter
> >
> >
> >=20
> >
>
>
> --
> Alex Kiernan

