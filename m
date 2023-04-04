Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11DE5C76196
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 02:48:59 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web11.92215.1680576534512912535
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Apr 2023 19:48:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mJM9yYT/;
 spf=pass (domain: gmail.com, ip: 209.85.167.169, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id l18so23273796oic.13
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 19:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680576534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C1tj1t8ucg4gj/J3OZflEv6F8J439HLfrTLzLJgb7Xg=;
        b=mJM9yYT/32w4bU4xCvQGTnraAz4sDhxc+r0pmJpx1K6pCMPxj1k9tIqi/AD7prStUs
         WrglBXBX1Fojppm+PkJi/F8YUpGwyId1h2x4ywp4x/2KkgGPyBU7ZxzkKtIh/L8plW0h
         X26yF8v5SGncYdVCiLfBKF5E4UpNM1Hcotb7/X68FLXH2JZYqjo8cq9xSuu7rRsI6ZWN
         4L8YXFBpuR6TKD61QcRifPljrs//Z3UJHJDczKCHzALyucaUnw4SIyDkRF+FuCACms8z
         mpxai5YxwZhDbhWYfI4oIvlTBXJYmRwvvZJjSKDXSi/gW+nru2C9+ZZ/etga2G1EGmxV
         AGbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680576534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C1tj1t8ucg4gj/J3OZflEv6F8J439HLfrTLzLJgb7Xg=;
        b=yY6HFQxEQuhz9BQ6VutVg8sbOAtoyzKJPKd0z8jB14UgB4QPa7V+ZQL6Vp+zQT9C/b
         0ynmPC29l4KW6BPwh4voyJ2+dHMzpe2S3CHK5JHU8xJfqTy/iYPhUUf1bhgjUmE20Dwy
         qZS9xJ5o26TdyX9WYL455rlVP5M6iqFTlbIcWJXVG/9Ozi27aKJBGgvr06gtSzdBmvET
         4ToW7X71dCqsqIn3Di/u9N7Tket+AHQCt/4CrzYPbaGFHwxr3er17/kRaY86S1bz1cN1
         fdHoQBwQ97WNPpDww6pTyaZGVzuL0D2MB4IWmMkSormkOsRQyzu76JhoMLuUJhHfoVCO
         iuCA==
X-Gm-Message-State: AAQBX9f/xC7ieN7s6pMWuz+D2C6Zb9omdu2JSC4SbC+gSOPeQjKZNYmI
	mFNUsVJ8TC9X2fGx3hQZVsq/6/ygSLgh+QYBgbzROxdje1c=
X-Google-Smtp-Source: AKy350azxgdrV477BVr0BWttA78Ow2VZBIy/B4Cw87JWysDnoi30k+antCjNj+4keVujvuc8FF2Mj1khwh1TIF3mqzo=
X-Received: by 2002:a05:6808:2009:b0:386:d8a5:d80b with SMTP id
 q9-20020a056808200900b00386d8a5d80bmr376892oiw.4.1680576533678; Mon, 03 Apr
 2023 19:48:53 -0700 (PDT)
MIME-Version: 1.0
References: <51ba3bfc-caa0-0a31-c295-e59c8416e672@kernel.crashing.org> <CO6PR11MB5602C3D93B44F41049BBDCECED939@CO6PR11MB5602.namprd11.prod.outlook.com>
In-Reply-To: <CO6PR11MB5602C3D93B44F41049BBDCECED939@CO6PR11MB5602.namprd11.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 3 Apr 2023 19:48:27 -0700
Message-ID: <CAMKF1sqq+H5_1YQGikajgdpnwmDwrTrXYeBNv=_+4PhTiMx8pA@mail.gmail.com>
Subject: Re: [OE-core] mesa-native fails on master
To: Chen Qi <Qi.Chen@windriver.com>
Cc: Mark Hatle <mark.hatle@kernel.crashing.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 02:48:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179669

On Mon, Apr 3, 2023 at 7:39=E2=80=AFPM Chen Qi <Qi.Chen@windriver.com> wrot=
e:
>
> I just met the same issue. My host is ubuntu18, gcc version is 7.5.0.
>
> Regards,
> Qi
>
> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Mark Hatle
> Sent: Tuesday, April 4, 2023 10:25 AM
> To: Patches and discussions about the oe-core layer <openembedded-core@li=
sts.openembedded.org>
> Subject: [OE-core] mesa-native fails on master
>
> It's been a few weeks since I last built master, but starting with today'=
s pull I'm getting errors building mesa-native -- which pretty much kills t=
he whole build.
>
> I'm on an Ubuntu 18.04 host, and have the 'buildtools-tarball' from the l=
ast
> 4.1.3 loaded so I can get to the minimum version of python to run a build=
.
>
> (I tried with buildtools-tarball-extended and that DOES appear to work.  =
If this is expected, you can ignore the rest of this.  But I expected the s=
ystem to complain before trying to build everything if the compiler wasn't =
new enough.)
>
>
> The error is:
>
> brw_simd_selection.cpp:205:7: sorry, unimplemented: non-trivial designate=
d initializers not supported
>
>
> The host gcc is 7.5.0
>
> What is strange is I had 2 successful builds, and then it started failing=
.  All
> fresh builds.  I've no idea why one was successful and the others failed.=
  I'm
> wondering if maybe there is some sort of race in mesa, but lowered my par=
allel
> build (-j) to 1 and I'm still getting it.


You need a newer gcc compiler > 7.x
I just abandoned using ubuntu 18.04
see - https://lists.openembedded.org/g/openembedded-core/message/178783?p=
=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3Acreated%2C0%2Cnon-trivial+designated+initia=
lizers+not+supported%2C20%2C2%2C0%2C97647023
>
>
> Reproducer:
>
> git clone https://git.yoctoproject.org/poky
>
> cd poky
>
> wget
> http://downloads.yoctoproject.org/releases/yocto/yocto-4.1.3/buildtools/x=
86_64-buildtools-nativesdk-standalone-4.1.3.sh
>
> bash x86_64-buildtools-nativesdk-standalone-4.1.3.sh -d buildtools -y
>
> . ./buildtools/environment-...
>
> . ./oe-init-build-env
>
> bitbake mesa-native
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179667): https://lists.openembedded.org/g/openembedde=
d-core/message/179667
> Mute This Topic: https://lists.openembedded.org/mt/98052337/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

