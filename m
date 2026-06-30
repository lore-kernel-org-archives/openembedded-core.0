Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE973C43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 16:28:24 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25206.1782836894376641180
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 09:28:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZWEiDmWh;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-39b19e7d6fcso13439471fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 09:28:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782836892; cv=none;
        d=google.com; s=arc-20260327;
        b=r3wzmf3sqibDqmYKwDWysc/M8BUNyBJGpEea0AGuWH6gR/QqM3e+uxk3aCu8bX73Oa
         nFPklY+SS7dB0jlHs657R93Eb+KZqCdDIZOWu27mA9n14RR+YmK0Dt0ztBBrCSRZ+8z4
         J1CDojac6MsQXz6YEfRLSqI5E3yYFeGyEovi4aWC1HvYGLv4IN/Mqqe+ZbzCJ1brFBF1
         HufEdAmgcVc32Wv4l2xfOG+UAq5tv1Msp38MKnB0hKG+h1Tx5dVapfxtfnbrEW0OEVOk
         WirciSvrt+n/STRkgWFL9p7qBkCVoOHceDYmMpKs1hwW/Z/gCEpUspWSKwBxF7MuCM/W
         GUaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G3hkfhLNeKlvMjRmpw3uSyAEqydiTecVUlEntCKzPVE=;
        fh=rIGYnCMzcaDG8qobSG9EaLQ6Xo5ujUNyetECr1NhHpY=;
        b=CFOixctIZIbva3hPUq2CIIvAgqxILzJDWH4hwFKjy5UjWcPLY5iE01Ggif34T2Llks
         C7XMx7ZlQB7oSVNGUlfzQfFUrusw96AB3j8tYtRYgvwJycKAjsR3Z8LIR18jW/vhrH5F
         4GvzXglAis5PdtDkm7XD23ww04GMvNe1Wideyfkf6NuBSlYOQZPvrq4rVLjygtUCurFk
         K5oRky/M07mWmyNYJblLTr9IZlF76f6Zu84MWN1fGeY7e2TYOWHnOqhXzzfWzOLVa4bG
         8RLBDHzyk2/PpLxhnbhn06BTGovgF+yFLKUXK4X+fGjkLqsvf6Js2Bv2nipdE3xCAJ8C
         sTsA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782836892; x=1783441692; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G3hkfhLNeKlvMjRmpw3uSyAEqydiTecVUlEntCKzPVE=;
        b=ZWEiDmWh6L+Ip2TyOw0mZLAAFpX71j89EDkAD112Tecm04/OY74fGgrYhTUP7qhU0S
         u46wAVOaDbshXiGKvcW6QEhBBN4Jbs7OpzR5BtFGP7CcCSmEWT5ERj4QTppuxKNeOcXA
         RpZhQMDkiSq6zpKvQZAjxzFB/dJBbteTYcPVLNtCau3lMsYqHxanRdy6V4cDdC1NRWxv
         lFQcf5okTdMgZHMU423XanDsksM6yY7Bb6iahCG6HN+mjwTaXlxfLztxoPA+Q9LPx0ZZ
         FQ3Wc9aAkDxdX3cn6QjB9/QAJnCNGohEFsiZsKcE/W9F32z5tymSiU1h1YwF1QaJi3Rm
         fb9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782836892; x=1783441692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G3hkfhLNeKlvMjRmpw3uSyAEqydiTecVUlEntCKzPVE=;
        b=qW8T35Pt0JgBr6dxB/FubyfQRW0LOzlxVrTs3NXgi8uCPLcKTr7U6aQQbShkGvS/Ny
         +L3lVij6I3nseeGShCMmUJXcAT8INPPeoJ+cQRVYhDS+hwwrw+RAg9neKz5l6abX4t2r
         vTzbkcg0LcfvcBlYpF/B2/QlEvGdFurby9i5EeeyWr72CxGOSh8iehp03FDGFZ3JD0Yn
         nxhp1wqiDxtfuCLOZFHtrnP3EeAoDtzJGqruAq3B4B4Z+ssSEDGFHQgLrWHtfbGlUMK0
         1TV0Rm0MNvCvBOlZr/BiC5hRPyutcLRJ6aRhAd1Knly0JLRAZmTX2od6WeIOkXOvUltB
         R04Q==
X-Gm-Message-State: AOJu0Ywu4PVwEnlKyfqdedqVzclf6mKBIdxXE0O5EEWO7FitVsdvizBA
	YoqlTy/wekTmQf5dHG7FV9+qykZq/8xEepOOmQHcDpsyysJVFGJ5TAKD98D0mh68qIIg70vm908
	gH9bJXpcY0+sbmMxeGvtuf/KXjH2ksS4=
X-Gm-Gg: AfdE7clH000mFwJSi2YK4HzVjy8WIIGQdmi4hBzCy7/GtcQU2ugH6RBiiHn3IFcblSG
	u3ReyviGaHPd47PNK/nvqxl5k6X1q0USeGMx7lRs3PYXuw1lZvQPgqL/mdtw4/KplvChu0oAm2n
	gk7SCthQdpVVKzzLPouCmCRSwS0hZ6Hd00FuTfiOzJbxmHeCkJuwRI+pA1jdUQKGNWUwXV7PI+u
	RfZv5qJHS6NnwYi7ARhT158U5Px/mvzKBpc0LoL7AyxGgYpfw9NUjAys7x5K1Vw+fvPmXw=
X-Received: by 2002:a05:6512:a354:b0:5ae:b270:505e with SMTP id
 2adb3069b0e04-5aebdb7d428mr837543e87.1.1782836892059; Tue, 30 Jun 2026
 09:28:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260630151704.2896341-2-alex.kiernan@gmail.com> <CAMKF1sr_emCmEW2R+kMMp5J9+V3JpyTbAKXnKPu_a2ed84UOWQ@mail.gmail.com>
In-Reply-To: <CAMKF1sr_emCmEW2R+kMMp5J9+V3JpyTbAKXnKPu_a2ed84UOWQ@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 30 Jun 2026 17:28:00 +0100
X-Gm-Features: AVVi8Cdoq5BS-Edy1SKe6IwZetqzNXwA_TRQo-cTBIbJPoQEnGV0aplZRhaUIf8
Message-ID: <CAO5Uq5Qt+HSea54YBkpVf76JGB9YAGq_=FsRmYo=+_gG=0Re5w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] dhcpcd: Add PACKAGECONFIG for seccomp
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 16:28:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239908

Oddly no... it's hand coded (and defaults on):

  https://github.com/NetworkConfiguration/dhcpcd/blob/8b312918d8f1885d7fe8f=
cc03a7e06ae8a0314b4/src/privsep-linux.c#L127

Possibly even more oddly, I actually wanted this option because I'm
stuck with a legacy vendor kernel which doesn't have seccomp and I was
trying to deal with all the noise that a sensible userland generates!
The next job is to get rid of the legacy kernel, but one thing at a
time.

On Tue, Jun 30, 2026 at 5:11=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> Does this need libseccomp dependency too ?
>
> On Tue, Jun 30, 2026, 8:17=E2=80=AFAM Alex Kiernan via lists.openembedded=
.org <alex.kiernan=3Dgmail.com@lists.openembedded.org> wrote:
>>
>> Pass --enable/disable-seccomp to the build based on DISTRO_FEATURES.
>>
>> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
>> ---
>>  meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.2.bb | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.2.bb b/meta/re=
cipes-connectivity/dhcpcd/dhcpcd_10.3.2.bb
>> index 6ebfc195323d..58865e108d24 100644
>> --- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.2.bb
>> +++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.3.2.bb
>> @@ -24,10 +24,11 @@ inherit pkgconfig autotools-brokensep systemd userad=
d
>>
>>  SYSTEMD_SERVICE:${PN} =3D "dhcpcd.service"
>>
>> -PACKAGECONFIG ?=3D "udev ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', =
d)}"
>> +PACKAGECONFIG ?=3D "udev ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 se=
ccomp', d)}"
>>
>>  PACKAGECONFIG[udev] =3D "--with-udev,--without-udev,udev,udev"
>>  PACKAGECONFIG[ipv6] =3D "--enable-ipv6,--disable-ipv6"
>> +PACKAGECONFIG[seccomp] =3D "--enable-seccomp,--disable-seccomp"
>>  # ntp conflicts with chrony
>>  PACKAGECONFIG[ntp] =3D "--with-hook=3Dntp, , ,ntp"
>>  PACKAGECONFIG[chrony] =3D "--with-hook=3Dntp, , ,chrony"
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#239905): https://lists.openembedded.org/g/openembedd=
ed-core/message/239905
>> Mute This Topic: https://lists.openembedded.org/mt/120048679/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [r=
aj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


--=20
Alex Kiernan

