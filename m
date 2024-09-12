Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A387AEEE266
	for <webhook@archiver.kernel.org>; Thu, 12 Sep 2024 21:30:45 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.59604.1726176636283421044
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Sep 2024 14:30:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Lfl6b1+h;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-374c3eef39eso930535f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 14:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1726176634; x=1726781434; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X1kM4zbvhtlOadHQMX0s5VhhT4CGRpnv/dfjDvoNCeo=;
        b=Lfl6b1+hDUSvXucvV8/nlq1fO4T1Wm9U8fzsdZJJMDoabXGWaGt5kxOGQFGAIBH/iV
         KP9oQg5JHvOSgGhtEu72Se9qzCgB0Y7NMv0TU3h7Q7KReKSxl6Twlr0SSP7PYmys7gah
         lcnIQlsrNcKxqpYqZ+svWyX6j02+9hpH87JIs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726176634; x=1726781434;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X1kM4zbvhtlOadHQMX0s5VhhT4CGRpnv/dfjDvoNCeo=;
        b=NHhWx8Ef/lZVX9ujHQL4CfCJ2P5MfzW0XS5n6WIqrLmPmlGiGu34u8jOfsJ2C/QIxE
         HQ80c4CVVO1cqseO+4o7i6YYIGm91CxMbJsc+Bv2Z8bjapKDhvZy5HJashrDiwKfkCZJ
         8/n58kVGEBA34uiJH9pf0z3lL2SXCHzYVfcdkeaFAA9T9qQUD6elIl3n0FyPb49l2YUS
         zDGNTiRHFB68Oh46EzotxuOQhq1OXCmLizEnCb+wkSP2xEgeaCNZDwv3+F72Ep4kfyMD
         A7sbYt5MBvGxAeHe22OXTvvw3QjdEIFHftf4l8Wrfj5WFkenO3vMYMjF32FeB09hPB9U
         D7iA==
X-Forwarded-Encrypted: i=1; AJvYcCV+LrKjUMRStJs+789x97FYZE+sh3LO/1KogsLQfnKC2CVCVxlG2R/TfwFRQOlL0hDUCXYCLls5t/6P2UZngXroQQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwdbaPOgjBrz/+ZLJhY8dYB4YzpJmQTVOFlXVqwBMWxTvJYIjYr
	x+GsHGe7RcK2+hqe7d5ZBuhPOoCGDD08g+av18cz87qJCtenq4eG3SfCRoA3tMk=
X-Google-Smtp-Source: AGHT+IHNV2FtJMLKJ2SGg8RkaywV0fQljNIhKleTaLbDcssGYX49A220GuHws7eTD8r3snzFxVuHfg==
X-Received: by 2002:a5d:428f:0:b0:374:bce8:16bc with SMTP id ffacd0b85a97d-378c2d5b135mr2329999f8f.48.1726176634403;
        Thu, 12 Sep 2024 14:30:34 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:d743:6685:2831:83f1? ([2001:8b0:aba:5f3c:d743:6685:2831:83f1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956494bdsm15320882f8f.21.2024.09.12.14.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 14:30:33 -0700 (PDT)
Message-ID: <cef9b98b491d75e1a2f6f64724669a69a544c6b1.camel@linuxfoundation.org>
Subject: Re: [OE-core] host libs in the SDK link to the host libs
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: aleksandar.nikolic010@gmail.com, openembedded-core@lists.openembedded.org
Date: Thu, 12 Sep 2024 22:30:33 +0100
In-Reply-To: <k0qy.1726164349812717885.rTZk@lists.openembedded.org>
References: <k0qy.1726164349812717885.rTZk@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 21:30:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204465

On Thu, 2024-09-12 at 11:05 -0700, Aleksandar Nikolic via lists.openembedde=
d.org wrote:
> Hi all,
> =C2=A0
> one thing regarding the libs in the SDK is bugging me and I would like to=
 understand it. In short, I cloned the poky repository, checked out the sca=
rthgap branch and built the SDK with "bitbake -c populate_sdk core-image-we=
ston-sdk". After installing the SDK, I checked what the ldd command is retu=
rning:
> =C2=A0
> ```bash
> # executed from the installed SDK
> ldd sysroots/x86_64-pokysdk-linux/lib/libanl.so.1
> sysroots/x86_64-pokysdk-linux/lib/libanl.so.1: /lib/x86_64-linux-gnu/libc=
.so.6: version `GLIBC_2.36' not found (required by sysroots/x86_64-pokysdk-=
linux/lib/libanl.so.1)
> sysroots/x86_64-pokysdk-linux/lib/libanl.so.1: /lib/x86_64-linux-gnu/libc=
.so.6: version `GLIBC_ABI_DT_RELR' not found (required by sysroots/x86_64-p=
okysdk-linux/lib/libanl.so.1)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 linux-vdso.so.1 (0x00007ffdc31a2000)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 libc.so.6 =3D> /lib/x86_64-linux-gnu/libc.so.=
6 (0x00007fade7545000)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 /lib64/ld-linux-x86-64.so.2 (0x00007fade77530=
00)
> ```
> =C2=A0
> Could someone tell me why is libanl.so.1 linking against the libc.so.6 ho=
st library and not the one from the SDK - sysroots/x86_64-pokysdk-linux/lib=
/libc.so.6? Is it because I used the host ldd?=20
> =C2=A0
> I am also getting the same error (that the versions do not match), when t=
rying to execute binaries built with the above SDK by using qemu-x86_64.

The binaries in the SDK are executed using its own dynamic loader which
tweaks the search paths. The output from the host's ldd won't be
correct.

qemu probably isn't aware of or accounting for the change to the
loader.

Cheers,

Richard

