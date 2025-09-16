Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9CE1CAC599
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 08:47:12 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web11.14699.1758012422933950248
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Sep 2025 01:47:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aNW85R+h;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-77dd76f6964so20596606d6.1
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 01:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758012422; x=1758617222; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bJ2HvOJ/uszzDm0jDmd4YBvkqARvSo+PIX60uKPj9Lo=;
        b=aNW85R+hfS1v/3pYEiC4eHZMNleOzyQR/WEJCgXsuMUGT3DDc2vDkxNKuZNp5CR9JU
         xcbc6/ztytGoB73qml7HFhXygw4zepDpr7cfOJ8nY68PKNx3aaC8J/mziIFxzkMOrROr
         kGoyD3PLxLmvoZyEvZAqhALdFk5HEdJjp/v4JqfWSKII15/4ULXQIJKozIuBhRw+8xr8
         QEXfVwCVgJ/P8sU8OdGgMqLrTiDA0JCl33OHXmnacXcYRAATofjD/AxdEwZC67r0rx3z
         sADkNLbfhH0NmkvwSUivX40cW9+vAfraSid6uY+K+YETy/g6kxI4oJUMZl3W56i4tNfl
         P1Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758012422; x=1758617222;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bJ2HvOJ/uszzDm0jDmd4YBvkqARvSo+PIX60uKPj9Lo=;
        b=dLEjoh8wKOv972v/PMCCTg6dpqCipQUF9CMt2XAAAsNUFrSz46FAKOQwMVKI/FwwYT
         OD07ugsZs0J+9JBSGUvvw/sWlwRqan0pWPzwqufS130Q+L8PT7jCcXqJ3b3YOtZ0Dtmj
         QqL1CX0KLpa3jqUR/+mp6Qwr5m7zwBTq2UfI75C6aFBDxV2UHwVFYVj2EcH+zeNPD5yr
         DKzwukmymjOM5adyb2kKnrwIdUwxvZa6vxwSKzQ5BUpsB9Lt1WORVGAQr/x0UhjYd8Xf
         +3qtTh9oXBIAO55aaoelyqibQMotPnkf4yc7iWw/R+jjBhZWui9IoaeEWl24OmlIbhuK
         Uhtg==
X-Forwarded-Encrypted: i=1; AJvYcCXh70YDPrLaYehHKs8cNPATOXNFd/Z+j+i7xE57KUD6jOZLc1ylo3ns/z2dRzST/ATOOgaktF3Qemcct8LnI4Bvdg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz+AdkcIK8qzAxa/hxfyvb7M96WbAJI2e2weOU5x7fwdY3ngQkm
	td7+LmAynVpbCbBvA/qTu6tXwHe8sb3NDakxzuJ+0BWDZoaPphZ5UI2a+mQ62P0oa4BcAFAlL/i
	7rzFJE3ZHTMfcmUbcUg+RJLP1QDR9PUo=
X-Gm-Gg: ASbGncuAqc5KDJahxS8RGtSlqyYdua0YjGHpHUmv0Et3S3FhjWum28knY/rywkyhyWM
	eD9DGPW+g4kT07+IBv23ILVIF+e5vYhcUEDqLzfQPcXLZvPbimxH4Yv+bv+SRwCHYaZTModfM7X
	UO0bHSOVHgYOSBhmLuwKfwFfRnvxDNrxSKyDlum4YTh2aVvR7EmmdNzmK1fSH6e1HSjYhv8hjqN
	TnAlTe+tGaZPManGcO6KJ30ufTHXrulcAc7Fdpm//k96ipfMVrRhud6JIfhrbQJ21+0qjhnIViE
	vcoy7WCzDFFCVnYiN2bZ2zeAJAG5o/5vcZ4T0FP4
X-Google-Smtp-Source: AGHT+IFIlf/M2U1vGwLgBUM+OUcdKLWy2kprKiiWgC3e6tVTqo2Ive49N+3RC61NxW4MfESNuxlRXpZOe1Fg9XPRtR0=
X-Received: by 2002:a05:6214:194d:b0:772:8052:d5d6 with SMTP id
 6a1803df08f44-78d5efad441mr17410126d6.25.1758012421651; Tue, 16 Sep 2025
 01:47:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250911085123.1551425-1-alex.kanavin@gmail.com>
 <20250911085123.1551425-15-alex.kanavin@gmail.com> <P12O2T.G9TC7LOZ6AEG@t-online.de>
 <CAMKF1sokUU3n1uDAXTD8ebxFTsSVmZX-4B9iSB1mFQ+3vp7K=Q@mail.gmail.com>
In-Reply-To: <CAMKF1sokUU3n1uDAXTD8ebxFTsSVmZX-4B9iSB1mFQ+3vp7K=Q@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 16 Sep 2025 10:46:50 +0200
X-Gm-Features: AS18NWA0ul6SczIM_duP30tcjX_a4scbJYcI91CQmq8otVGBzW_a9Fln5efbjaw
Message-ID: <CANNYZj994mKx9TLP+1uYf3YDK1ArbkzAJHtyrERhYX5NFT-=EA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 15/16] xkeyboard-config: update 2.44 -> 2.45
To: Khem Raj <raj.khem@gmail.com>
Cc: f_l_k@t-online.de, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 08:47:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223532

I think these are both transient issues that happen when build
directory is reused between the old and the new version. Not
xkeyboard-config fault per se, it just rearranges the install set in a
way that triggers a bug somewhere in oe-core :-/

Alex

On Tue, 16 Sept 2025 at 07:43, Khem Raj <raj.khem@gmail.com> wrote:
>
> I am seeing a build failure for xkeyboard-config-native
>
> ERROR: xkeyboard-config-native-2.45-r0 do_populate_sysroot: sstate
> found an absolute path symlink
> /mnt/stash/tmp/work/x86_64-linux/xkeyboard-config-native/2.45/sysroot-des=
tdir/mnt/stash/tmp/work/x86_64-linux/xkeyboard-config-native/2.45/recipe-sy=
sroot-native/usr/share/X11/xkb
> pointing at /mnt/stash/tmp/work/x86_64-linux/xkeyboard-config-native/2.45=
/recipe-sysroot-native/usr/share/xkeyboard-config-2.
> Please replace this with a relative link.
> ERROR: xkeyboard-config-native-2.45-r0 do_populate_sysroot: Failing
> task due to absolute path symlinks
> ERROR: Logfile of failure stored in:
> /mnt/stash/tmp/work/x86_64-linux/xkeyboard-config-native/2.45/temp/log.do=
_populate_sysroot.726640
> NOTE: recipe xkeyboard-config-native-2.45-r0: task do_populate_sysroot: F=
ailed
> ERROR: Task (virtual:native:/mnt/jenkins/workspace/Yocto-world-arm/source=
s/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_populate_=
sysroot)
> failed with exit code '1'
>
> On Mon, Sep 15, 2025 at 10:32=E2=80=AFPM Markus Volk via
> lists.openembedded.org <f_l_k=3Dt-online.de@lists.openembedded.org>
> wrote:
> >
> > I'm seeing issues with symlink creation:
> > | Installing symlink pointing to xkeyboard-config-2.pc to /home/flk/pok=
y/build/tmp/work/corei7-64-poky-linux/xkeyboard-config/2.45/image/usr/share=
/pkgconfig/xkeyboard-config.pc
> > | Installing symlink pointing to base to /home/flk/poky/build/tmp/work/=
corei7-64-poky-linux/xkeyboard-config/2.45/image/usr/share/xkeyboard-config=
-2/rules/xorg
> > | Installing symlink pointing to base.lst to /home/flk/poky/build/tmp/w=
ork/corei7-64-poky-linux/xkeyboard-config/2.45/image/usr/share/xkeyboard-co=
nfig-2/rules/xorg.lst
> > | Installing symlink pointing to base.xml to /home/flk/poky/build/tmp/w=
ork/corei7-64-poky-linux/xkeyboard-config/2.45/image/usr/share/xkeyboard-co=
nfig-2/rules/xorg.xml
> > | Installing symlink pointing to xkeyboard-config-2.7 to /home/flk/poky=
/build/tmp/work/corei7-64-poky-linux/xkeyboard-config/2.45/image/usr/share/=
man/man7/xkeyboard-config.7
> > | Installing symlink pointing to /usr/share/xkeyboard-config-2 to /home=
/flk/poky/build/tmp/work/corei7-64-poky-linux/xkeyboard-config/2.45/image/u=
sr/share/X11/xkb
> > | ln: failed to create symbolic link '/home/flk/poky/build/tmp/work/cor=
ei7-64-poky-linux/xkeyboard-config/2.45/image/usr/share/X11/xkb/symbols/en'=
: No such file or directory
> >
> > On Thu, Sep 11 2025 at 10:51:22 +02:00:00, Alexander Kanavin via lists.=
openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > From: Alexander Kanavin <alex@linutronix.de> License-update: disclaimer=
 and copyright clarifications per https://gitlab.freedesktop.org/xkeyboard-=
config/xkeyboard-config/-/merge_requests/821 Replace manual symlink creatio=
n with a meson option. Drop no-op autoconf options. Adjust packaging as thi=
s is where upstream installs now. Signed-off-by: Alexander Kanavin <alex@li=
nutronix.de> --- ...oard-config_2.44.bb =3D> xkeyboard-config_2.45.bb} | 13=
 ++++--------- 1 file changed, 4 insertions(+), 9 deletions(-) rename meta/=
recipes-graphics/xorg-lib/{xkeyboard-config_2.44.bb =3D> xkeyboard-config_2=
.45.bb} (65%) diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_=
2.44.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb similarit=
y index 65% rename from meta/recipes-graphics/xorg-lib/xkeyboard-config_2.4=
4.bb rename to meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb inde=
x 52d074fd5ed..857ccc75160 100644 --- a/meta/recipes-graphics/xorg-lib/xkey=
board-config_2.44.bb +++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_=
2.45.bb @@ -10,23 +10,18 @@ HOMEPAGE =3D "http://freedesktop.org/wiki/Softw=
are/XKeyboardConfig" BUGTRACKER =3D "https://bugs.freedesktop.org/enter_bug=
.cgi?product=3Dxkeyboard-config" LICENSE =3D "MIT & MIT" -LIC_FILES_CHKSUM =
=3D "file://COPYING;md5=3D8fc8ae699974c360e2e2e883a63ce264" +LIC_FILES_CHKS=
UM =3D "file://COPYING;md5=3Dfaa756e04053029ddc602caf99e5ef1d" SRC_URI =3D =
"${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.tar.xz" -SRC_=
URI[sha256sum] =3D "54d2c33eeebb031d48fa590c543e54c9bcbd0f00386ebc6489b2f47=
a0da4342a" +SRC_URI[sha256sum] =3D "169e075a92d957a57787c199e84e359df2931b7=
196c1c5b4a3d576ee6235a87c" SECTION =3D "x11/libs" DEPENDS =3D "util-macros =
libxslt-native" -EXTRA_OECONF =3D "--with-xkb-rules-symlink=3Dxorg --disabl=
e-runtime-deps" - -FILES:${PN} +=3D "${datadir}/X11/xkb" +FILES:${PN} +=3D =
"${datadir}/X11/xkb ${datadir}/xkeyboard-config-2" inherit meson pkgconfig =
gettext python3native -do_install:append () { - install -d ${D}${datadir}/X=
11/xkb/compiled - cd ${D}${datadir}/X11/xkb/rules && ln -sf base xorg -} +E=
XTRA_OEMESON +=3D "-Dxorg-rules-symlinks=3Dtrue" BBCLASSEXTEND +=3D "native=
"
> > --
> > 2.39.5
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#223528): https://lists.openembedded.org/g/openembed=
ded-core/message/223528
> > Mute This Topic: https://lists.openembedded.org/mt/115184776/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

