Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF49AD116F3
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 17:59:51 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27880.1764611989387649542
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Dec 2025 09:59:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iEdNdwuT;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-640bd9039fbso1202505a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 09:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764611988; x=1765216788; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mlW8fMeK+NpVFy29Kd9W7F6j1XQdvKYKJIrPRLuxMSU=;
        b=iEdNdwuTgzIvMbmd4YB+L7kp1kt1+gS4peFnm/HGLd6TL+VzcrAmoNQ/UjxtsleVAY
         Ie6Rs8DpPXca5H4TNuvh0ntM4TOdhXTdUewS6nl5WDj/1OuzaU/OtIgo+G2O6Vci/c8U
         5iz9HhHp3qsCn0R4f613pgUCJFvMMlxrgEg+3rrgZVXULpWt5vBz0QDdS7LjF2dqH+31
         4GHP5zY0uM+QME6EqxVNFr72fmJiJRtMM2El4Zob5Wmp2ecAyFqgb6DOQutaMMa7j6r9
         dgN+/a9QoUruCxzNRy6wyGJFtENjKi6+tc5z9XvX7CSr6uwhNaxo9HhA8Hh+GytCNPuy
         PxDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764611988; x=1765216788;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mlW8fMeK+NpVFy29Kd9W7F6j1XQdvKYKJIrPRLuxMSU=;
        b=bK77ApDtrTP330uUBqAwm7oRhiN+urDhR1PJhqXD6/XHiVTrpfsUgaoKFt7NtSUZi4
         Gj1QlcGbfBcbAfWD3bxN7DKxY/xNRZOiR5p4n/oy9ibpxLZsbMH72fhkST/E6Wn9tvNS
         woTELnDmx9wxMBwrJjlBR5nJcGj6CoqeNLovx+fGEnaAiRJlKISy82xpwhHEWCp3gCDW
         pEyzZvPZqDiONdi7+E4DG7aGAyAqoHCJpLn7JKYEwh2vHeyHSReH1SocVFH98BAXCEdg
         gGRN+gt0n1D+rz+1n1j6ywhjF/0HHbvMrgEZO+xlYnH6YbLwfgulKCZjN/V0I7BAQ8nl
         0ixw==
X-Forwarded-Encrypted: i=1; AJvYcCWZjyj3GwlW4Tm+ZgFAjIDc/AN7q3CTVTcD4qjkG6Y94HESQB62VvKFUx0NlbqFrmrWtBol01eLIjo3ziT3izyxmA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YywxaGVUUtKzZasc/q0PUCMfmQmqwab/CIfY9wTWcPN4pHb7n7V
	gG8quqbfbzRLhtJV2LfOGVlXD58YOk5+Yl66GllP0Gkkprl+RiU/qH3S
X-Gm-Gg: ASbGncvol3DX5SVhOgyLPpWhGePO+BkAXTE6S5dNaS0eTk7+mmhgn+aoSEvOhza4jSa
	6c8FJpwJcn4Y/yV8H7iuQ7RYc8ctluMY3xgvSwxnBx7nFXs6c3nmDW2o7CUz1XZLw7AJyAWQpnu
	yE7CM+/j9fkbVJrt6IsiILcLDmT9LN85faGM98U8LV/dZGmPXiF7mqaH+frfBag7m2I9nWtOL+Y
	rF8DQmGBZ1MlYlNS5LR6zfyjeiJtfsL78edfxBhhrgSsPxghNDfIsuk++yOYQ4OyEk4z1m5a7mK
	lk0SJahM+tNmhTS3g6xZs+szs47jzPdMwLGZ17WtT0awTJHco939PlUAqrfcuLHwN5HvVTtFcHC
	qvWNAaGAQj59ftAj3k2fxlnQFkse2qyHd+DYp6PVUwSkExAQSoShGLzkiaR8pW9H95Ld2u1aa37
	t/arWnl+g2SmP7fmTEEiq2cNhBZtJ9rkITbfVCQNH1ittjjYzVg85n5uj+9TyF
X-Google-Smtp-Source: AGHT+IFxLCZMYj0hSPxJR8LWqGqLp5Stz4vL8bvVkQR+V91k7eLwU4YuHyUFz0/jrTeNdpecxgPprw==
X-Received: by 2002:a05:6402:4403:b0:640:ceef:7e4d with SMTP id 4fb4d7f45d1cf-64554692584mr36160579a12.32.1764611987393;
        Mon, 01 Dec 2025 09:59:47 -0800 (PST)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64751062081sm13098508a12.34.2025.12.01.09.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 09:59:46 -0800 (PST)
Message-ID: <895bcf1973e78323c89bed28ac5c24e89f227e06.camel@gmail.com>
Subject: Re: [OE-core] [PATCH v3 1/2] u-boot: make initial environment
 binary image
From: adrian.freihofer@gmail.com
To: pierre-loup.gosse@smile.fr, openembedded-core@lists.openembedded.org
Date: Mon, 01 Dec 2025 18:59:46 +0100
In-Reply-To: <20251121084918.875151-1-pierre-loup.gosse@smile.fr>
References: <20251121084918.875151-1-pierre-loup.gosse@smile.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 17:59:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227136

Hi

Just a few thoughts on the matter. There are several ways to transfer
the default environment to a target device:

* Compile the environment in u-boot and run env default -a on the
target device, as documented at
https://docs.u-boot.org/en/latest/usage/environment.html#text-based-environ=
ment
.
* Install the file in /etc/u-boot-initial-env, which is used by
libubootenv as the initial environment on the target device.
* Install it as suggested in this patch, e.g., via wic or another flash
approach during device manufacturing.

It is important to enforce some consistency between all these different
approaches. Ideally, all approaches should use the same environment
source, which should be the file referenced by CONFIG_ENV_SOURCE_FILE.
If this is not the case, when the user executes, for example, env
default -a, they will get a different environment than the one
initialized by wic for fw_setenv.

Will this be mentioned in the documentation, or will it not be taken
into account in these patches?

Thank you for the patches.
Regards,
Adrian


>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#226653):
> https://lists.openembedded.org/g/openembedded-core/message/226653
> Mute This Topic: https://lists.openembedded.org/mt/116405112/4454582
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> adrian.freihofer@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

