Return-Path: <antoine.gouby@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41CEACDB479
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 08:44:13 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2430.1782290645805476390
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2026 01:44:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=mTUHUn9/;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: antoine.gouby@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-9203654905eso57030885a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 01:44:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782290645; cv=none;
        d=google.com; s=arc-20240605;
        b=gLsXvtkFfk3lKt6xLmqKCq1EMAAvJiid134M24ZOGedINEghGpwcLuG4gYFns3Hqma
         AcABEjQLW5Jw4hpATQuPxWnS3Q8BWUUYfO+k+X7nUohrrci4gnItwZ9NKNhEd9ajZ7Xm
         3fgBd17DWsaww4gAlMnNEVO0Iqh1lgvfk4EbuVHqDbk9tbZBIcl4V392PWdrlllSEA4h
         arIApyWAsvi5NEZKPtUKdQEr7va53JbyieJyq/Smxaam7Ocxt7W3aQH+wOfEzAHTkyH4
         exwThRykATnTvWiH9TT/M+Vcx1ATvt0s+9RxxMgVoDbFmCHuXFNrc77W9U+kuk16IXfY
         V3PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=csZziTcXUSL7dYpbcCdRTUa8qYtdoqdeVjnNN4INZgA=;
        fh=5AD09ljP9+WpFvhFoDd1R4EXvkhDWs0EYTVvuvi3FxY=;
        b=fsw94TbAp+NmOwYi0yAxLwxRG9DQPrFV+FuFftu5+fId24cmNIEo5Q2OJ6axv7lEDU
         ILkHWJS/bxNzLBpNk9lARQobA/DXTDWumpfuB+OI/5Mcm5MKOJA2OGP17NZPHalBApAQ
         MVXy8ps6NLwvIWVFO5wZc7U8+zGftMwaLoQRQ37PayxW2ItfkFEMWyFuBWDP8tL+47MX
         BJhMYAb6HCGSxbBA7SC6GUQpe5QN7APnwjPgX9ebZ4gSTlCorPZhBfykAlXd9gl2VVNq
         GL58dsuYT1VXBm6Y0qfgClDgqjfVknkkBUTXtvS/IZy4tIbbp8Xa7VluENwbeU3V9jp7
         KQwg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782290645; x=1782895445; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=csZziTcXUSL7dYpbcCdRTUa8qYtdoqdeVjnNN4INZgA=;
        b=mTUHUn9/BjGezJJGG+I3fTrXQRVI4gXj6CM8F0JaLFeFCDX0AO74lX1B9YqBcWZRQF
         +jBz1N2O9VN4MGSSDJYP0gyLo7pNSK/cUUUZWZN0wIVZjZWHOzesZoe3o9G5ajR7d1Ph
         1OiNmlYeb85xfz/eSjOXdURNQ+D3gLvFs2p9BXwoZUbuutxziAEeSDwTlexyRTRs6r3c
         iAgRKb3gHMXBhtA/kO4gwbNbTOnrvIAoM5yc/UIn5qiXrfFl7lQq974AY7QMYC/3WLsb
         aTBwlwchjKLNSUpwH8IPnjXaBZTp09WROdCGrZvmBRogbRfILOu0uTwiICRSBUe3L9of
         WkSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782290645; x=1782895445;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=csZziTcXUSL7dYpbcCdRTUa8qYtdoqdeVjnNN4INZgA=;
        b=UCcphUGXkixgJx0H+Hy370e6ueS8VOi/Z1t+jWhevV4ZyHfLT0w06fxb8OQy0y9hA5
         /bRtrF+DZvaVVZ3L8Z7S+asMre6Lc+Gu3ryi6Lk/qvW122pgsXeGXZNlBF+q2z/GWL3l
         upyc4I54ihBPDdYZJk2I5SUpZyEcxN1Hrb6AlJzbH2uTa+CTilNDa2Z8/iPLcjOKBbpC
         hWf3/BwIVt2CMg2OKUDIHUKJWIVgxh44wfxlgbATMCYsQYvsUDLyabgCU8xn0eBZiM9m
         OzwwHVqIdaC4UXYtQQnX0ffPdtD7QUQZuoYlV+NL5KX2E3EuEIMcxQQE91404r3sLjA5
         EAzg==
X-Forwarded-Encrypted: i=1; AFNElJ/npPQ8xBtyuTnBzSh3kM2Rct3LyRwIXntpZfDkwvq/WEarZYd+zaa1OqvVZL7qfjmQdzXhGwHGTQ6M8+JBQDzWLw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxzJtpPmJAnBtJ/aZowy1vJGQOrTBuqA5PAOtxVDqMfKjKOJpel
	HJRd/QlCupKSg4oVYT7lR0CRqsDSnjzGdsNkUjzzkM8rAsfwo493dwPVy3jshI8VTltU3jBmm/Z
	CVJSbqtiu7qjDPsOykpzpKHj6+tEcOk8=
X-Gm-Gg: AfdE7clZktAXAC51kaqmeb+X12UAwHMo5Q9/qDtuRi4FN/RxZiFULwWDjvd+I+sRmXi
	rUmaB4V7JvrXh8Gju/3u7JFewyOXM0RuE2Et5cWY9a7FVBhkOZASjqfEHbjV7eNxTxJaqM1Iufd
	8G22niphZ4h4ofQe0LWRhQod+A4FC8GYkJf8Y6Lh2NzEvNnYOXHg55ea2GtGnJjn0UFEM7DCEbA
	S8rzG6nSwfOnuouQxfN4QloSOqcmO3jllTYe5WNHwsanwP4BGHRzp+b7+I8sB0n05/BZgXwgXdP
	XoWk+ztYi0zJQJG+XapP0i1VDL4xQw==
X-Received: by 2002:a05:620a:462c:b0:915:8c48:497c with SMTP id
 af79cd13be357-921d29f83f8mr2795098385a.28.1782290644650; Wed, 24 Jun 2026
 01:44:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260623-mesa-fix-insane-skip-v1-1-97856536ea8b@toradex.com>
 <DJGHNTGT2MED.PW12J0XM4EPW@bootlin.com> <3ab79332-a44a-4408-99d1-c884f5b40313@cherry.de>
In-Reply-To: <3ab79332-a44a-4408-99d1-c884f5b40313@cherry.de>
From: Antoine <antoine.gouby@gmail.com>
Date: Wed, 24 Jun 2026 10:43:53 +0200
X-Gm-Features: AVVi8Ccf_PV167LF16669dPoRQjH97Vmat3P-cNhtp3T-6FwKjzLMxgP5AaZsgg
Message-ID: <CAL2Htgxnc1-eqE8tF009oD1aN_fMXMgtm7+L23o5bq9R7-FQLg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mesa: fix INSANE_SKIP package name for mesa-gl builds
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: mathieu.dubois-briand@bootlin.com, 
	openembedded-core@lists.openembedded.org, 
	Antoine Gouby <antoine.gouby@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 08:44:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239481

Hi Mathieu and Quentin,

Indeed I didn't take into account the multilib support when writing the pat=
ch.
I will send a v2 with:
INSANE_SKIP:${MLPREFIX}mesa-megadriver +=3D "dev-so"

Regarding PACKAGES_DYNAMIC and the other package-related variables, my
understanding is that rename_package_variables() in multilib.bbclass
already handles the multilib renaming for those variables, so I don't
expect them to be affected.

Kind regards,
Antoine


Le mar. 23 juin 2026 =C3=A0 16:22, Quentin Schulz
<quentin.schulz@cherry.de> a =C3=A9crit :
>
>
>
> On 6/23/26 4:12 PM, Mathieu Dubois-Briand via lists.openembedded.org wrot=
e:
> > On Tue Jun 23, 2026 at 1:21 PM CEST, Antoine Gouby via lists.openembedd=
ed.org wrote:
> >> From: Antoine Gouby <antoine.gouby@toradex.com>
> >>
> >> mesa.inc is shared by both mesa.bb and mesa-gl.bb. The variable
> >> INSANE_SKIP:${PN}-megadriver expands to mesa-gl-megadriver when
> >> included by mesa-gl.bb, but the package is always named mesa-megadrive=
r
> >> (hardcoded via PACKAGES =3D+). The skip therefore had no effect for
> >> mesa-gl builds.
> >>
> >> This was hidden until mesa 26.1.0 removed the with_gbm condition from
> >> the dril subdir build, causing mesa-gl to now install DRI driver
> >> symlinks into mesa-megadriver for the first time.
> >>
> >> Use the hardcoded package name, consistent with the three RREPLACES/
> >> RCONFLICTS/RPROVIDES lines right below.
> >>
> >> Signed-off-by: Antoine Gouby <antoine.gouby@toradex.com>
> >> ---
> >
> > Hi Antoine,
> >
> > Thanks for your patch.
> >
> > This is now producing another QA issue about these symlinks, in multili=
b
> > configuration:
> > ERROR: lib32-mesa-2_26.1.2-r0 do_package_qa: QA Issue: non -dev/-dbg/na=
tivesdk- package lib32-mesa-megadriver contains symlink .so '/usr/lib/dri/p=
anel-mipi-dbi_dri.so' [dev-so]
> > ERROR: lib32-mesa-2_26.1.2-r0 do_package_qa: QA Issue: non -dev/-dbg/na=
tivesdk- package lib32-mesa-megadriver contains symlink .so '/usr/lib/dri/c=
rocus_dri.so' [dev-so]
> > ERROR: lib32-mesa-2_26.1.2-r0 do_package_qa: QA Issue: non -dev/-dbg/na=
tivesdk- package lib32-mesa-megadriver contains symlink .so '/usr/lib/dri/i=
li9225_dri.so' [dev-so]
> > ERROR: lib32-mesa-2_26.1.2-r0 do_package_qa: QA Issue: non -dev/-dbg/na=
tivesdk- package lib32-mesa-megadriver contains symlink .so '/usr/lib/dri/g=
m12u320_dri.so' [dev-so]
> > ERROR: lib32-mesa-2_26.1.2-r0 do_package_qa: QA Issue: non -dev/-dbg/na=
tivesdk- package lib32-mesa-megadriver contains symlink .so '/usr/lib/dri/r=
car-du_dri.so' [dev-so]
> >
> > https://autobuilder.yoctoproject.org/valkyrie/#/builders/92/builds/3975
> >
> > Can you have a look at the issue?
> >
>
> Likely simply
>
> INSANE_SKIP:${MLPREFIX}mesa-megadriver +=3D "dev-so"
>
> ?
>
> I'm wondering if we also need something for PACKAGES_DYNAMIC for
> multilib as well (and RREPLACES, RCONFLICTS, RPROVIDES, etc....). I
> really dislike packages which don't use ${PN} in their name, a lot of
> headaches are avoided by simply using ${PN} but I guess that ship has
> sailed already.
>
> Cheers,
> Quentin

