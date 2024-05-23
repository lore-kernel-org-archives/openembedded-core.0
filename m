Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 393ADC25B75
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 13:39:31 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.15721.1716471566478884483
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 May 2024 06:39:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Lr9KFBav;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-354b7d76c52so1561265f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 23 May 2024 06:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1716471565; x=1717076365; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PchH1C5uPFDIzvCeqMtP4/UaJz8NitgtWIIzOAAq09k=;
        b=Lr9KFBavNzvWnZWgZ4CeYKIilTzahDXGCxIx0NoSdfJQfMAfffhpBasfOmpUIhLknP
         3fsJzwG9/ZU+poK0a0TclVo2IUtAf9UVmljxY58N2cQP4aTDxlaSMgI9LQlH6j1ND5fd
         7nqp6dVBb3ngy6E07vXtrCpO6NcfV6DyZFaBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716471565; x=1717076365;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PchH1C5uPFDIzvCeqMtP4/UaJz8NitgtWIIzOAAq09k=;
        b=P4kTmNYn0qKGdyzGNd6AULbmH45gi3Y/ZqlwvJQgi7gOWIYDS1gro/7skljjv66r3g
         ID75Y6rsvDOBtBzFCL86CtT5Nr2P/ekYdtp7a8S6JDwchTDJab90FJQa9gQGOcZ1ZFCh
         1tCTcIYF///viPqxthEqN7oO5mv7BSO4WUkcT1QmpWxPYJ4bntkxO6jkYH2JPm0YtoBu
         ovdpShNMCZlvAu39LIL0ekb3MwmrmBSL2BiSzU/T8QRnd0rrUBU9AWyjzZPm9LPPMjUW
         ozjzHXVCuGI9TczsQP028ERRh0rxxcr3m0zLf3TmJTqlsEqiZJlf4t123sgo+Q2bWWgi
         dxiA==
X-Forwarded-Encrypted: i=1; AJvYcCWvwq6gN/GhuGh8eM5pWx/wrkVnv+YDTmpCZFXgKPnV9/vlk0SIdFd2u3ED4jNtyxjBS7h6dMEK0onRuPN7t54PBg/k1pzkZ13bRysluFoeV59bB5j74k3g
X-Gm-Message-State: AOJu0Yz+j2y3Das+It0CzLMGpuesrlS/7Pw7TZ4jFggMV7V8daZ3Njil
	jtQvrkW9eYUAmz4qxqGAFN+WKKSSOe5SKRE+IWechY/eWOfcPceqz10bTijrS8Y=
X-Google-Smtp-Source: AGHT+IHh5KYOZvFYcWdDFhALDbK6pu/RdgVeAd6XSPLnNratxbUClv0w57CUCHI465okQup+7GwySA==
X-Received: by 2002:a5d:574d:0:b0:354:f4f9:90af with SMTP id ffacd0b85a97d-354f4f9947amr2207067f8f.15.1716471564864;
        Thu, 23 May 2024 06:39:24 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:bf06:e9d5:d26:9301? ([2001:8b0:aba:5f3c:bf06:e9d5:d26:9301])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-354dd239e73sm3861228f8f.12.2024.05.23.06.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 06:39:24 -0700 (PDT)
Message-ID: <a1e40553b608081c1f251c1ac61310f2583ee015.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] insane.bbclass: use HOST_ARCH to check for
 32-bit symbols
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: emil.kronborg@protonmail.com, openembedded-core@lists.openembedded.org
Cc: rasmus.villemoes@prevas.dk
Date: Thu, 23 May 2024 14:39:23 +0100
In-Reply-To: <20240523125441.45922-1-emil.kronborg@protonmail.com>
References: <20240523125441.45922-1-emil.kronborg@protonmail.com>
Autocrypt: addr=richard.purdie@linuxfoundation.org; prefer-encrypt=mutual; keydata=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
 YNvg==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 May 2024 13:39:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199796

On Thu, 2024-05-23 at 12:54 +0000, Emil Kronborg via lists.openembedded.org=
 wrote:
> Using OVERRIDES in the check generates false positives in some
> scenarios, for example when building binaries for an SDK supposed to run
> on a 64-bit host. Therefore, it is more correct to use HOST_ARCH for the
> check instead.
>=20
> =C2=A0=C2=A0=C2=A0 $ bitbake -c do_package_qa gcc-cross-canadian-arm
> =C2=A0=C2=A0=C2=A0 (...)
> =C2=A0=C2=A0=C2=A0 /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-=
oesdk-linux/usr/bin/arm-oe-linux-gnueabi/arm-oe-linux-gnueabi-g++ uses 32-b=
it api 'localtime'
> =C2=A0=C2=A0=C2=A0 /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-=
oesdk-linux/usr/bin/arm-oe-linux-gnueabi/arm-oe-linux-gnueabi-g++ uses 32-b=
it api 'fcntl'
> =C2=A0=C2=A0=C2=A0 /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-=
oesdk-linux/usr/bin/arm-oe-linux-gnueabi/arm-oe-linux-gnueabi-g++ uses 32-b=
it api 'lstat'
> =C2=A0=C2=A0=C2=A0 /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-=
oesdk-linux/usr/bin/arm-oe-linux-gnueabi/arm-oe-linux-gnueabi-g++ uses 32-b=
it api 'wait4'
> =C2=A0=C2=A0=C2=A0 /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-=
oesdk-linux/usr/bin/arm-oe-linux-gnueabi/arm-oe-linux-gnueabi-g++ uses 32-b=
it api 'gettimeofday'
> =C2=A0=C2=A0=C2=A0 /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-=
oesdk-linux/usr/bin/arm-oe-linux-gnueabi/arm-oe-linux-gnueabi-g++ uses 32-b=
it api 'stat'
> =C2=A0=C2=A0=C2=A0 /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-=
oesdk-linux/usr/bin/arm-oe-linux-gnueabi/arm-oe-linux-gnueabi-g++ uses 32-b=
it api 'fstat'
> =C2=A0=C2=A0=C2=A0 /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-=
oesdk-linux/usr/bin/arm-oe-linux-gnueabi/arm-oe-linux-gnueabi-g++ uses 32-b=
it api 'ioctl'
> =C2=A0=C2=A0=C2=A0 /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-=
oesdk-linux/usr/bin/arm-oe-linux-gnueabi/arm-oe-linux-gnueabi-g++ uses 32-b=
it api 'time'
> =C2=A0=C2=A0=C2=A0 /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-=
oesdk-linux/usr/bin/arm-oe-linux-gnueabi/arm-oe-linux-gnueabi-g++ uses 32-b=
it api 'gmtime'
> =C2=A0=C2=A0=C2=A0 Suppress with INSANE_SKIP =3D "32bit-time"
>=20
> Signed-off-by: Emil Kronborg <emil.kronborg@protonmail.com>
> ---
> =C2=A0meta/classes-global/insane.bbclass | 3 +--
> =C2=A01 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/ins=
ane.bbclass
> index 99736830b9a8..bd2328601676 100644
> --- a/meta/classes-global/insane.bbclass
> +++ b/meta/classes-global/insane.bbclass
> @@ -515,8 +515,7 @@ def check_32bit_symbols(path, packagename, d, elf, me=
ssages):
> =C2=A0=C2=A0=C2=A0=C2=A0 Check that ELF files do not use any 32 bit time =
APIs from glibc.
> =C2=A0=C2=A0=C2=A0=C2=A0 """
> =C2=A0=C2=A0=C2=A0=C2=A0 thirtytwo_bit_time_archs =3D {'arm','armeb','mip=
sarcho32','powerpc','x86'}
> -=C2=A0=C2=A0=C2=A0 overrides =3D set(d.getVar('OVERRIDES').split(':'))
> -=C2=A0=C2=A0=C2=A0 if not (thirtytwo_bit_time_archs & overrides):
> +=C2=A0=C2=A0=C2=A0 if d.getVar('HOST_ARCH') not in thirtytwo_bit_time_ar=
chs:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return
>=20

This is not correct, e.g. HOST_ARCH does not always equal "x86" for 32
bit x86 builds.

$ MACHINE=3Dqemux86 bitbake -e | grep ^OVERRIDES=3D -C 2
# pre-expansion value:
#   "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:pn-${PN}:layer-${FILE_LAYERNAME=
}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}${LIBCOVERRIDE}:fo=
rcevariable"
OVERRIDES=3D"linux:i686:pn-defaultpkgname:layer-config:x86:qemuall:qemux86:=
poky:poky-altcfg:class-target:libc-glibc:forcevariable"

i.e. the x86 comes from MACHINEOVERRIDES.

Cheers,

Richard



