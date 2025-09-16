Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0C89CAC59A
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 05:43:51 +0000 (UTC)
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
 by mx.groups.io with SMTP id smtpd.web10.12343.1758001427056305409
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 22:43:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fEHbRMZ+;
 spf=pass (domain: gmail.com, ip: 74.125.224.42, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-632e9c6b411so816908d50.2
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 22:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758001426; x=1758606226; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kiN6wvFg8cPgFuel0iPe2iAZyRPvgfJb2RROJVELsaI=;
        b=fEHbRMZ+3iT2HcuYuGbsl6ltT1L3tsiluIIG2N/7HNEaCXQb/zQl3UENlxv9/yw18F
         DjcVcVRsaYdy7p/dFEuQ884AFe3CJQRvVNzi0eVv+OAKVCnPG8/V/HD1dV36xOaDD2iZ
         DBLIoYU0ywf64yHfz93djOjkczDUqc1oIkeKqE4aRqRMGt7MDZS98mK9JeTmdTZtfngX
         tKtEAnb8v1Q2CiWxusoh/T5VxJWb2knwh1IvP/GF1urKPrqogFW2uQEGky62vVJqtrvV
         2GpjUc52zBxofFUaoOQKmgbV3Y8HTwe9YRMldQO97mtwbZR8PFna8AlIO6yFOW6Nah0u
         5ehA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758001426; x=1758606226;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kiN6wvFg8cPgFuel0iPe2iAZyRPvgfJb2RROJVELsaI=;
        b=qi0KOhkcYnzskiQ+qZIJzwBeQPfpaHN03XVVDULtpDiMJzDJffr8I3Zn2DpYwHTsJ5
         RG0duuB3dIUR9TU9KeJ4c4myD7Wa+4I59KgfXyltzr0vYIsrKO7yUDZJ9bIokF2ven93
         ZkFSvtidcNsbZ5cnrKqyCLF6yz1U/8fvJUEjzN+aN8cUND/pracg7xYkVRJmYas1lycw
         5x6YR1NpeSQ4vzbkkeojQU1RpMoIBT/QJ38ZrbRwcVXQo+XDWJFebxv06czJrbKH+4B4
         fvxt+MmItnC2cd2iVmaJxrtL0VYPGYtp8KceFXLcK7pSHrlTYw6DWrbPA9sqqI+1Kmh9
         ATWA==
X-Forwarded-Encrypted: i=1; AJvYcCVw5WMGZ9sjgOZ5f5epPXIMW2XYQp2GG3USwkt0V8WCzxGKFRULoX3GTGE8C8KgKhsbpHgtVnH8HqHkR6lKrFMzVg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzvPawwrXSv8noxZNC37F1w7XhGNNyILA6/Od5enEhrBRJ9gX9K
	jJpUlsUCi+vXtvOFMfBSTS5lN2uhbN+Jd7X40AmcdkG0ccpwhtGen016rzYYxuQvGYddzwY+xxb
	XfoUAO8l8Vhc6F3r46BuaFUu5wKqvHIU=
X-Gm-Gg: ASbGnctoDKwuBQDuDjpRSwpNFN2qrfhLiMKS+gFqjXo2PfFy4e/Qs/ripA+V4xE5Wge
	iBDKDmLn0OU0Dq1Elu0jtsClXIY5qS4ihcaJggxhU3Ojk/v2K3DmH0bENVYQTs9RSWy3MYWI/xo
	8sPHTMGq+OCnWPFCoAnROLnhLDO4pel9qOGFLBdY4590yVs6MkTD1ifyS56O5S6732qhn2zEsin
	PWZwq/2podlHFPoKc1XIUmTcJB4t7t87Dr/9EkxwhjSSVTUwc29Rc6M2OcVnYsmoFxhe6bYRq33
	q8vHUtX8V9m0KC4Xr1aXCjJhX3bVXLKwOyanulcDECFLNR5ckOSTgNA0rg==
X-Google-Smtp-Source: AGHT+IHL817B14O1TmXk6vFi9dZR6jscwQ5sT4BYKDidWKn16LDUg2U0MW9VN1QSWf5iKPWHyvO3zItRlXWI58fTBno=
X-Received: by 2002:a05:690e:1487:b0:631:559c:7417 with SMTP id
 956f58d0204a3-631559c771amr5265907d50.0.1758001426026; Mon, 15 Sep 2025
 22:43:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250911085123.1551425-1-alex.kanavin@gmail.com>
 <20250911085123.1551425-15-alex.kanavin@gmail.com> <P12O2T.G9TC7LOZ6AEG@t-online.de>
In-Reply-To: <P12O2T.G9TC7LOZ6AEG@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 15 Sep 2025 22:43:19 -0700
X-Gm-Features: Ac12FXykhEKf8YLeJLt3pomPQeJUlV8GuDY-Z0c4mw35o1ljYBaeZLZG_X_U96o
Message-ID: <CAMKF1sokUU3n1uDAXTD8ebxFTsSVmZX-4B9iSB1mFQ+3vp7K=Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 15/16] xkeyboard-config: update 2.44 -> 2.45
To: f_l_k@t-online.de
Cc: alex.kanavin@gmail.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 05:43:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223531

I am seeing a build failure for xkeyboard-config-native

ERROR: xkeyboard-config-native-2.45-r0 do_populate_sysroot: sstate
found an absolute path symlink
/mnt/stash/tmp/work/x86_64-linux/xkeyboard-config-native/2.45/sysroot-destd=
ir/mnt/stash/tmp/work/x86_64-linux/xkeyboard-config-native/2.45/recipe-sysr=
oot-native/usr/share/X11/xkb
pointing at /mnt/stash/tmp/work/x86_64-linux/xkeyboard-config-native/2.45/r=
ecipe-sysroot-native/usr/share/xkeyboard-config-2.
Please replace this with a relative link.
ERROR: xkeyboard-config-native-2.45-r0 do_populate_sysroot: Failing
task due to absolute path symlinks
ERROR: Logfile of failure stored in:
/mnt/stash/tmp/work/x86_64-linux/xkeyboard-config-native/2.45/temp/log.do_p=
opulate_sysroot.726640
NOTE: recipe xkeyboard-config-native-2.45-r0: task do_populate_sysroot: Fai=
led
ERROR: Task (virtual:native:/mnt/jenkins/workspace/Yocto-world-arm/sources/=
poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_populate_sy=
sroot)
failed with exit code '1'

On Mon, Sep 15, 2025 at 10:32=E2=80=AFPM Markus Volk via
lists.openembedded.org <f_l_k=3Dt-online.de@lists.openembedded.org>
wrote:
>
> I'm seeing issues with symlink creation:
> | Installing symlink pointing to xkeyboard-config-2.pc to /home/flk/poky/=
build/tmp/work/corei7-64-poky-linux/xkeyboard-config/2.45/image/usr/share/p=
kgconfig/xkeyboard-config.pc
> | Installing symlink pointing to base to /home/flk/poky/build/tmp/work/co=
rei7-64-poky-linux/xkeyboard-config/2.45/image/usr/share/xkeyboard-config-2=
/rules/xorg
> | Installing symlink pointing to base.lst to /home/flk/poky/build/tmp/wor=
k/corei7-64-poky-linux/xkeyboard-config/2.45/image/usr/share/xkeyboard-conf=
ig-2/rules/xorg.lst
> | Installing symlink pointing to base.xml to /home/flk/poky/build/tmp/wor=
k/corei7-64-poky-linux/xkeyboard-config/2.45/image/usr/share/xkeyboard-conf=
ig-2/rules/xorg.xml
> | Installing symlink pointing to xkeyboard-config-2.7 to /home/flk/poky/b=
uild/tmp/work/corei7-64-poky-linux/xkeyboard-config/2.45/image/usr/share/ma=
n/man7/xkeyboard-config.7
> | Installing symlink pointing to /usr/share/xkeyboard-config-2 to /home/f=
lk/poky/build/tmp/work/corei7-64-poky-linux/xkeyboard-config/2.45/image/usr=
/share/X11/xkb
> | ln: failed to create symbolic link '/home/flk/poky/build/tmp/work/corei=
7-64-poky-linux/xkeyboard-config/2.45/image/usr/share/X11/xkb/symbols/en': =
No such file or directory
>
> On Thu, Sep 11 2025 at 10:51:22 +02:00:00, Alexander Kanavin via lists.op=
enembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org> wrote:
>
> From: Alexander Kanavin <alex@linutronix.de> License-update: disclaimer a=
nd copyright clarifications per https://gitlab.freedesktop.org/xkeyboard-co=
nfig/xkeyboard-config/-/merge_requests/821 Replace manual symlink creation =
with a meson option. Drop no-op autoconf options. Adjust packaging as this =
is where upstream installs now. Signed-off-by: Alexander Kanavin <alex@linu=
tronix.de> --- ...oard-config_2.44.bb =3D> xkeyboard-config_2.45.bb} | 13 +=
+++--------- 1 file changed, 4 insertions(+), 9 deletions(-) rename meta/re=
cipes-graphics/xorg-lib/{xkeyboard-config_2.44.bb =3D> xkeyboard-config_2.4=
5.bb} (65%) diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.=
44.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb similarity =
index 65% rename from meta/recipes-graphics/xorg-lib/xkeyboard-config_2.44.=
bb rename to meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb index =
52d074fd5ed..857ccc75160 100644 --- a/meta/recipes-graphics/xorg-lib/xkeybo=
ard-config_2.44.bb +++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.=
45.bb @@ -10,23 +10,18 @@ HOMEPAGE =3D "http://freedesktop.org/wiki/Softwar=
e/XKeyboardConfig" BUGTRACKER =3D "https://bugs.freedesktop.org/enter_bug.c=
gi?product=3Dxkeyboard-config" LICENSE =3D "MIT & MIT" -LIC_FILES_CHKSUM =
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
> --
> 2.39.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#223528): https://lists.openembedded.org/g/openembedde=
d-core/message/223528
> Mute This Topic: https://lists.openembedded.org/mt/115184776/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

