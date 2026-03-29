Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1110F3D610
	for <webhook@archiver.kernel.org>; Sun, 29 Mar 2026 16:15:17 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32309.1774800910030720701
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Mar 2026 09:15:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GcNhvTIH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-483487335c2so38404385e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 09:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1774800908; x=1775405708; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t4ZYNohzpk3aCHNtAQz9zDORBpC0yitmnPZbRgiU1Fc=;
        b=GcNhvTIHeBCpkvTNaxQ+m3TZZAnhafYHL/a/1J9Bfy0TZ+MytMy1BqB6JZkVQdqHMY
         AsFo/VQGV3K2hIwXbYfFqy/cJQEblP0aflM/uHxiHA3PlbytjvbyNFTB2Q+zX0fu+UWw
         8Omgxh4VjQNCunNZ0+vYwsi3TajUbzVTJaN9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774800908; x=1775405708;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t4ZYNohzpk3aCHNtAQz9zDORBpC0yitmnPZbRgiU1Fc=;
        b=VTsrRlzGjm4CWJipiIuIV7J1k7pFmRk6PaUrTqusDU3CeI49T7stuYsNfup8LUIa46
         LdMECwTQCurZ9hlxTKHtreEIAIgCZ58xfEhhlX3EnU4/VbmkMQFqCP0Yv+n3YkZKRuiu
         YNpV2o0IMD+IXHIXFFwdcGTri5DaUGjuzOQR572iVzs5tDvIXs9k0EDkE0XcbocTLJzm
         UgaL/fAO5shcsDTD9mnS4ACzVERzFufzJ6YcMjAyuzy1sA3t+JivHTzDJPBi1nbfahbO
         1VmGv3BeI+ZN/WUmpxvqUtm8Bo1dkGu/sCt6NXx+Ry5qmLQwiykhZv+HKUoYjJyw9czV
         3d8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUnXGEru9tcEqjnVqUBYrQLCSkzgLu4IwcYyWd9EHuPUyLmC7goLVit/TR2FBcbSRx5mN+AKSSg4TyovWDWPhNj4Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw7IsT8CN+7gQh/ZZouTYqPevSUBlonScRgZ1qJQZtqDEeSovGE
	Rxw6QYiwhism02mf3XyvOqYVMRbIO55VNFzaPeM8UNnQfzoLlSeDCQsIrf6uI0f4eTc=
X-Gm-Gg: ATEYQzw+/PwJlHUZ/BBGvsWSa/vkuLyayKAB4yOl2c+oggVn/y6ctYYpz1qemt/L99t
	QXR5H4fLjpoFSxqs0dJM/aLJYtPqZ4gk/HZWlUwJwnyBk1MvL9p4A05dCfZxt1Rut/NDVY8SC3Y
	p2mSoUhvV1zWmnR4oBGcftxVIcGBH0sXiEAdAKfWUq8/6d1D80UaXA8YPXjPc3fJtySpHfySLmL
	WDmbT87NeWxMqQrYGEXQNlJqKeiFaAL3ZhtcbNMU78uVf2YJ7PODXCx/1a8WhQogkfJ8tks5iLg
	mHbgrQrC6as/LP69ED/An7n4eJ/vG5f/fgCnrKni5HGLZ+mGSBP2pcDn8GP+qxfOt7XLUGjwjkA
	17lEFT1SWy4xLW6DVGb9Xn31dNi1DJk5C7yn/i+6/0qFGuls2Iy3kqzGJCookM172jnsCmWQRv6
	0TZru+FLsl9pcwk13y96l55vlxbV9tQSmwo1qWTxO0qIdFRnXdj4dTDqc/BZKFpW0toZP5Q0QJr
	RVu9xIAoKLhXHYM
X-Received: by 2002:a05:600c:4e0e:b0:485:2a85:e5ec with SMTP id 5b1f17b1804b1-48727ef5508mr157728165e9.2.1774800908321;
        Sun, 29 Mar 2026 09:15:08 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:c535:91e1:c332:1ca3? ([2001:8b0:aba:5f3c:c535:91e1:c332:1ca3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4872712b268sm59977175e9.16.2026.03.29.09.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 09:15:07 -0700 (PDT)
Message-ID: <2cae9e645c767894e77f718113f4f4d689f9121e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 0/5 v4] image_types: use IMAGE_FILE_MAXSIZE
 variable to create fixed partition size
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: charles-antoine.couret@mind.be, openembedded-core@lists.openembedded.org
Date: Sun, 29 Mar 2026 17:15:05 +0100
In-Reply-To: <20260329134716.3185469-1-charles-antoine.couret@mind.be>
References: <20260329134716.3185469-1-charles-antoine.couret@mind.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 16:15:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234152

On Sun, 2026-03-29 at 15:47 +0200, Charles-Antoine Couret via lists.openemb=
edded.org wrote:
> From: Charles-Antoine Couret <charles-antoine.couret@mind.be>
>=20
> Details are described in the first patch.
>=20
> Difference from v3:
>=20
> * Don't use bashism which fails for Debian derived systems by default
> * Improve test checks
>=20
> Difference from v2:
>=20
> * Added working and failing tests in meta/lib/oeqa/selftest/cases/imagefe=
atures.py
> * Split commit to send documentation to right mailing list
>=20
> Difference from v1:
>=20
> * Added documentation for IMAGE_FILE_MAXSIZE variable
> * Added Python function to get the value of this variable from shell func=
tions
> otherwise parsing issue can happen
> * Added an additional task to check the final result which works for all =
filesystems
> and not only those created with dd command.
>=20
> Charles-Antoine Couret (5):
> =C2=A0 image_types: add python function to get the IMAGE_FILE_MAXSIZE:fst=
ype
> =C2=A0=C2=A0=C2=A0 value
> =C2=A0 image_types: use IMAGE_FILE_MAXSIZE variable for ext2/3/4 image ty=
pes
> =C2=A0 image_types: use IMAGE_FILE_MAXSIZE variable for btrfs image types
> =C2=A0 image_types: use IMAGE_FILE_MAXSIZE variable for f2fs image types
> =C2=A0 image: add check_image_max_size as post function to check file siz=
e
> =C2=A0=C2=A0=C2=A0 against IMAGE_FILE_MAXSIZE

For context, these previous versions were in 2023. I think the general
concern is we already have a lot of rootfs size related variables and
adding more of them complicates the user interface. It isn't clear
which ones "win" when multiple conflicting settings are made.

In this case the max size "wins" above any of the others. It does
appear that it isn't just a max size but a fixed size in that it will
pad the filesystems to this size? That makes the name a bit
confusing/misleading and was one of the concerns last time.

Cheers,

Richard

