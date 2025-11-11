Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C2A1CCFA18
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 13:26:58 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17004.1762867615909913967
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Nov 2025 05:26:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lN/B1MFa;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-88057f5d041so43652366d6.1
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 05:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762867615; x=1763472415; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EE/NQrM4KNde1pEbA5643p5FAdht0n1+6maTpQUHdDA=;
        b=lN/B1MFaa9ttjBxi6f/jb3ry0dgD3AuI/In5D9b9+OTsxW0GueLckDjVYCU7mXoCtP
         foXGWRglQa3A4/elTO5g+SIW8SIj9ZOWCY5FLK+exjHOrH0Xb4Nig0aXI+M5w10rTe4o
         8hBZkGJ9eCXQ8iqPOr+DsTWS21FUm87+ieEmwex4hSp1AGhdb1Aw2lWdO8gQlLYGa9L2
         mPCUrmo7/IqDcolXSGTTrZ1ecyK7EkS0V0pG9uXW2TMbDOdqi1u6UGfVeaR4933NfcaQ
         OHS0RwPcAbweQ0DBPSdFOrcTonizmd48INUoILsdELxe3HWkPY6dZIIsCoPA6NiC7AOD
         3rkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762867615; x=1763472415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EE/NQrM4KNde1pEbA5643p5FAdht0n1+6maTpQUHdDA=;
        b=Q/BZlLaJLNOEVf6Cp/3Qmwkh2fANVNOZj4SMPaYTrkJxBXmqhHojEKilb6POtDZuXq
         IPV7XyxBpbpUTX0LRpjydVsVQurkNJ/aAs2ttTXUW1ehJ20zuf1PHzAPyp+WXWinUIWT
         /MCFi7gr2YCAZRFKPeViDfX4ol0kYQPP9/PEy5ZA0phbUM9CKQmchpmv7fmY1s3BBu0b
         SA6hxcNT96Ofuxi1NAdptsCxDnL+5h1ascdFSyC23ymX2Mx/YJt/my7e0tr2Ux6UawKl
         sltQK+jYEWs0tWf/u9CPBePbVv+ttXpr748K6Npppa3WL8dwHIQOwYJ51kz8H0IIhH9I
         0B0Q==
X-Gm-Message-State: AOJu0Yz/bcVFKdClvP6wc5vgBBx0/7fkN6yA+JJo5eTT1VX4Eo53/3eX
	8iuyzzx90065fxCeZGnzT4hItF73sX5BtXsVuKf/XOVse1DJIUCkEFCMohjpdNNY3U08ogJFIdO
	LIUEBzJex5WPWeaHcPCSVBwObbtpaF/c=
X-Gm-Gg: ASbGncuUNi+rRFoagi78Tgp4wfRL8qLi+iJvu2h15cQu6CUozwxyg7k1iYZ37TnJQOi
	LFli2DrHPy3Y2vKqLY7MGI8KXN+kc/9uxeT5t5Q2XEXoxrGd/B3Xnelloggkr3R/vajY1JLsEo2
	sp6Te5noY6bL1D/7BnOOHNQN8U9gho9RZDpSIQsK5s7mizmQyzwrTUjkLsDRya1dj/4t6yBJ0/r
	67s1Q/Y01JS+d2ITe1Y/eh9FXnjrS4JWKI4ac9YbfMQRWckvXPBNpq7nOfQgkoprrOtv4ROFSqm
	4L9EnD1B97GdCBlySQ==
X-Google-Smtp-Source: AGHT+IGheqrZHasG3lsqDg1P1AmwCTWmOVd+qBvUNirCf/jRClNuA0tgRXXkJZWHrxI7feMy1W9Ugbal/E/+S8L6GAY=
X-Received: by 2002:a0c:f10b:0:b0:882:3f38:4fbc with SMTP id
 6a1803df08f44-8823f385876mr119097376d6.61.1762867614848; Tue, 11 Nov 2025
 05:26:54 -0800 (PST)
MIME-Version: 1.0
References: <2AUI5T.7ZXVDQ11N5KQ@t-online.de> <CANNYZj_4H-EmTKQSch-7yB=KFoMezya_q4ZjupVJWfv+TdwXvg@mail.gmail.com>
 <9PBK5T.3N0ESJ8YG4JV3@t-online.de>
In-Reply-To: <9PBK5T.3N0ESJ8YG4JV3@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 11 Nov 2025 14:26:42 +0100
X-Gm-Features: AWmQ_bm3jlWHwXlrnu0B57QTc0kn0g3ROpWGUJnnz5fZWqz9DiwK9I7iPQYXUsk
Message-ID: <CANNYZj9fsH6o_VR7bqEEW6P36MTaJHEF0AH9cFZMGxPanKKfZQ@mail.gmail.com>
Subject: Re: bitbake-setup test
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 13:26:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226162

On Tue, 11 Nov 2025 at 13:51, Markus Volk <f_l_k@t-online.de> wrote:

> Now compilation started  and failed some time later with a more informati=
ve error:
> | FAILED: [code=3D1] media_driver/CMakeFiles/iHD_drv_video_COMMON.dir/agn=
ostic/common/cm/cm_array.cpp.o
> | /home/flk/bitbake-builds/poky-master-poky-distro_poky-altcfg-machine_ge=
nericx86-64/build/tmp/work/core2-64-poky-linux/intel-media-driver/25.1.4/re=
cipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ --sysro=
ot=3D/home/flk/bitbake-builds/poky-master-poky-distro_poky-altcfg-machine_g=
enericx86-64/build/tmp/work/core2-64-poky-linux/intel-media-driver/25.1.4/r=
ecipe-sysroot @media_driver/CMakeFiles/iHD_drv_video_COMMON.dir/agnostic/co=
mmon/cm/cm_array.cpp.o.rsp -MD -MT media_driver/CMakeFiles/iHD_drv_video_CO=
MMON.dir/agnostic/common/cm/cm_array.cpp.o -MF media_driver/CMakeFiles/iHD_=
drv_video_COMMON.dir/agnostic/common/cm/cm_array.cpp.o.d -o media_driver/CM=
akeFiles/iHD_drv_video_COMMON.dir/agnostic/common/cm/cm_array.cpp.o -c /hom=
e/flk/bitbake-builds/poky-master-poky-distro_poky-altcfg-machine_genericx86=
-64/build/tmp/work/core2-64-poky-linux/intel-media-driver/25.1.4/sources/in=
tel-media-driver-25.1.4/media_driver/agnostic/common/cm/cm_array.cpp
> | x86_64-poky-linux-g++: fatal error: cannot execute '/home/flk/bitbake-b=
uilds/poky-master-poky-distro_poky-altcfg-machine_genericx86-64/build/tmp/w=
ork/core2-64-poky-linux/intel-media-driver/25.1.4/recipe-sysroot-native/usr=
/bin/x86_64-poky-linux/../../libexec/x86_64-poky-linux/gcc/x86_64-poky-linu=
x/15.2.0/cc1plus': posix_spawn: Argument list too long
> | compilation terminated.

This line in itself is not problematic, but somehow the arguments that
g++ passes to cc1plus are. Which makes me wonder, what does
'@media_driver/CMakeFiles/iHD_drv_video_COMMON.dir/agnostic/common/cm/cm_ar=
ray.cpp.o.rsp'
part do? I haven't seen such syntax before. I suspect that becomes a
very long list of files, each with a full path that exceeds the limits
anywhere with a long-ish build prefix, not just one made by
bitbake-setup.

Alex

