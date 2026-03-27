Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 294FD10F2844
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 15:37:42 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.76256.1774625846731457781
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2026 08:37:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=X+qXbwQj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48700b1ba53so21606615e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 08:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1774625845; x=1775230645; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qhfHh4oDkZLpAO86MYctxSdAIl8qKC5KgXpcpwgyq4g=;
        b=X+qXbwQjJMvqFf3GDwygXUyAUG3ykjpAhwRf309BKBtwxyFo6S+LFZEWL097T6bfKM
         QBk7kXxfzpeO/zh2cVCzmEU7OK3OljkK4xYn3yTsC+fS3nNvlFQUi+3XvlAKjh0/YkhO
         OwpUk2IXgGJ2QfV4FpHoD272HnIkTBZaQu5xg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774625845; x=1775230645;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qhfHh4oDkZLpAO86MYctxSdAIl8qKC5KgXpcpwgyq4g=;
        b=mmbHIEi1fR6aD40dscu8ozQ7ASI8d4CexQYet0b+RIql7zkWdAIIZh1nVZz35TnWJi
         MeQl0axdjHioELjz0g5V63TUY/4eP2lCxzhuluPrXUvMtLechOXtsyhP+jPqXzAsUtYf
         jpdU+3Wp27UkK3Pk1KOz2Q1XMPBFKxkZf81KfQsJG0IvLqpBmNFoYzLvcG409wF7W4fR
         +h78jz4dSYM/rJVxVXnqwD1qWIzeJ8TeuynZW5T0YKejbNqze2MPDdJknfIaogXmxTbo
         +AEM+6c2hX2seq47UNdriSx6JCpAavsqUzCVvZYL8EccOdr5uwMsAxzRkqO2FfbodF7K
         DTsw==
X-Forwarded-Encrypted: i=1; AJvYcCUvyfttiMFNqdhpnRKWl5ic+gOQor5g7exuMH4un2VfKYiMygCd6MUQTHmXPHLOvoI6jS02cMJdpPT+SzAaZ71qBQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwpCrjUDyU1vw6oyZIJeJN61DqFdOyTpPgSj7tdo1AJl6ZBmw3A
	MfUXgTGn+9eMi/NzHxfQq3lEh8IgRj4UBbmuE1IbOSr1AYp9YdCPNRC1dAgd171Iu+Q=
X-Gm-Gg: ATEYQzzlLb5/x6F7oSefWcaeslL3GY29Cf0qlq/12/J8lRkSFC9QFFhreCeT0mjxhvx
	UB8140f1cDY5PFME3efTECI71zCJo7CxnFNnSvFU0SrdudNiBloQJpHtsjeKpptYsHKOTspagG/
	2fQhfv3w6BBrSaIW3qV5NAr+Vx1S32OIURaYXNQhTIw5SRw0UGIzMelvrb6uvmq2vTv0H1zrtcf
	VkN3g2et0N5OzlSru9/ITFoXiTT2NKE6DU9xnyn2OLv2d4SliFbHWb+0rS96869TOB8gAXDylk8
	bRE0scvh3CiMvqlgMzZuqTq9Z2UraxErzcVOd3s2YxkPeRktXpESrxiofzQbVHgqpelz0d4WDZj
	6eVP5eom0vPkyJZkuDUuvFdXOZ+N8slIRk4VICzItfOMoNHt2Ji9jUEDZ3B8GxgEKzHUn/TDPUE
	naI2KDwnclv+07r4ECAUXc4yc0rSxG39uUoTR/6Nnmt+XyE/J48VQXHZ5HdONhWUCdnKzJzSOqd
	JuUMZT9Sho5Bw1EB+rSR2MP+qI=
X-Received: by 2002:a05:600c:3510:b0:486:ffa3:593 with SMTP id 5b1f17b1804b1-487280abccdmr44197855e9.28.1774625844911;
        Fri, 27 Mar 2026 08:37:24 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4d9b:9818:1b9c:6027? ([2001:8b0:aba:5f3c:4d9b:9818:1b9c:6027])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722be47a4sm157691725e9.0.2026.03.27.08.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 08:37:24 -0700 (PDT)
Message-ID: <ed22500800950b87d26983346d7b3106c41257db.camel@linuxfoundation.org>
Subject: Re: [PATCH v2 6/6] oeqa: ltp - add LTP_WORKERS to allow
 parallelization
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: daniel.turull@ericsson.com, openembedded-core@lists.openembedded.org
Cc: bruce.ashfield@gmail.com, alex.kanavin@gmail.com, pratik.farkase@est.tech
Date: Fri, 27 Mar 2026 15:37:23 +0000
In-Reply-To: <20260327122758.1851989-6-daniel.turull@ericsson.com>
References: <20260327122758.1851989-1-daniel.turull@ericsson.com>
	 <20260327122758.1851989-6-daniel.turull@ericsson.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 15:37:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234091

On Fri, 2026-03-27 at 13:27 +0100, daniel.turull@ericsson.com wrote:
> From: Daniel Turull <daniel.turull@ericsson.com>
>=20
> Add new configurable variable to execute multiple workers in parallel.
> kirk adds the option that was not available in runltp.
>=20
> Tested in qemux86-64 with configuration:
>=20
> IMAGE_CLASSES +=3D "testimage"
> CORE_IMAGE_EXTRA_INSTALL +=3D "ltp openssh"
> TEST_SUITES =3D "ping ssh ltp"
> QB_MEM =3D "32768"
> QB_CPU_KVM =3D "-cpu host -smp 16"
> QB_SMP =3D "-smp 16"
> LTP_WORKERS =3D "16"
> IMAGE_ROOTFS_EXTRA_SPACE =3D "2097152"
>=20
> bitbake core-image-minimal
> bitbake core-image-minimal -c testimage
>=20
> Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
> ---
> =C2=A0meta/lib/oeqa/runtime/cases/ltp.py | 4 +++-
> =C2=A01 file changed, 3 insertions(+), 1 deletion(-)

Thanks for looking at this, it is interesting it now has the
parallelism support. I'll probably hold off this initially just so that
we can transition successfully but it then makes sense to tweak things.

I checked yocto-autobuilder-helper's config.json for the config we use
on the autobuilder and it is:

"IMAGE_INSTALL:append =3D ' ltp'",
"TEST_SUITES =3D 'ping ssh ltp ltp_compliance'",
"IMAGE_OVERHEAD_FACTOR =3D '1.0'",
"IMAGE_ROOTFS_EXTRA_SPACE =3D '1324288'",
"QB_MEM:forcevariable =3D '-m 1024'"

so we're running with a lot less memory than you configured but you
also have a lot more threads!

> diff --git a/meta/lib/oeqa/runtime/cases/ltp.py b/meta/lib/oeqa/runtime/c=
ases/ltp.py
> index b855e76907..ae6a275110 100644
> --- a/meta/lib/oeqa/runtime/cases/ltp.py
> +++ b/meta/lib/oeqa/runtime/cases/ltp.py
> @@ -68,7 +68,9 @@ class LtpTest(LtpTestBase):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
# LTP appends to log files, so ensure we start with a clean log
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
self.target.deleteFiles("/opt/ltp/results/", "%s.json" % ltp_group)
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cmd =
=3D 'kirk --run-suite %s --json-report /opt/ltp/results/%s.json -n -d /opt/=
ltp --exec-timeout 20m' % (ltp_group, ltp_group)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # LTP=
_WORKERS: number of parallel test workers (default: 1)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 worke=
rs =3D self.td.get('LTP_WORKERS', '1')
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cmd =
=3D 'kirk --run-suite %s --json-report /opt/ltp/results/%s.json -n -d /opt/=
ltp --exec-timeout 20m --workers %s' % (ltp_group, ltp_group, workers)

We probably need to namespace the variable a little more, such as=C2=A0
OEQA_LTP_WORKERS so that people have a hint on where it is used.

Cheers,

Richard


