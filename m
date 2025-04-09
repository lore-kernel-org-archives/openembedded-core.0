Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E13BC36002
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 08:57:02 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.3882.1744189012110562686
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Apr 2025 01:56:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lJdjdzCS;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6e8fca43972so73549756d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Apr 2025 01:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744189011; x=1744793811; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aue/sOJguFoWr3oWuU9ob6hh3lpUaNziMGPiVkwNSSA=;
        b=lJdjdzCSRVDz3EOx0sy82x9PS+mA2oceP7Dv+M15yX+wQVl1V6rx6yIZVMQgT28p8q
         bjLWVGN0/tYkC0Pz6ZgEHOXB4y9tlonoN8PbXTdS3MZVarfogLAPxe9opAM3mGzSbyor
         /YijvllX89UEgx5TTsuQLRC68nMipIL0fvCN4vOjpOXm+7cQri3rrNP+EwajnFGYAbxl
         bg2jvJysTxLsE/gkpfYT7gEK7ysXfgz+7cny5c4HW9WsQtN1A7IzEcnfxM33zZIltN7J
         tNx0GKaaH+7g1tkNv3zp1eQu+7F+KPuEnSNgFV4tLpqHMdgyNs2iFEV9QDmc7gw7vi4m
         MlqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744189011; x=1744793811;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aue/sOJguFoWr3oWuU9ob6hh3lpUaNziMGPiVkwNSSA=;
        b=f/HRxBaaOlkcffUnC8Vzk+W/epIbAwyNvTdDKf/KVDJaBX5CKbhacGCwAi5k90o9Gw
         JFQgURMEuxW23kzBCZI6h/4ZeY0f9P8u9GcoSm8spupUcCDOImBHx+vOut4CbjsWdWh9
         zWFpX9ar/MykVkmU/xbpRXY2fAyCGgM96Sk4Qua/yk8iIgloaKvuodPATZaRWQQgwEWO
         f/nQlHjd//SfGh11m1mMt/D6Rqgiik1yVRuroUSCNaxwNxfDOwYwgoIo9bhUB7SmZY0X
         n0Btbg2JE562wdcJesPniGNdCTGpmGwdQ0lJv/OYuRY6kk8QRJKWV3pyKmIKWKRwx18S
         lL+g==
X-Gm-Message-State: AOJu0YzX0PwRiEtZgG6RZVe7kXz+vqRkGgpJmuUmalmAlsFvBy0iedFE
	CcUwq7TC1e866Tm+VvxK9KM0iEzlnSgs+UUUDFJOxU6gHnb638Z8somWCZ2o/s3nSN9/0UKcY0n
	NDS8odJTdxEyQmcf3SHs8mtlddWQ=
X-Gm-Gg: ASbGncuo8rPOZ66/+aFGZFiZFD2hJ4B4cmd0OwzT3R7AVA8ALWtHaqPcYKs62YeYCz/
	ORV1vA1XLJqV+hhiZLy1j7m/m/46CCfC9rr+Lk39FCg042q0+22GRcNQrnXUNvgRrNx7hP6bDhW
	kWQ8IG8O7HhxaEMOjZSBW72fGv+ObEkYyPhtkYlz5coZ0MHA0meWV5AkuQ
X-Google-Smtp-Source: AGHT+IFNxqbXhS6iUD9bUJG7nL8dponxDVPVeKcEbzMMXirNQJ2rix0NMP3xSRcgOsNOmOSonI19dK3+AC+UjK1zy5o=
X-Received: by 2002:ad4:5f87:0:b0:6e8:8d76:f38c with SMTP id
 6a1803df08f44-6f0dd15d10emr20939186d6.40.1744189010946; Wed, 09 Apr 2025
 01:56:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250409014030.2479490-1-jiaying.song.cn@windriver.com>
In-Reply-To: <20250409014030.2479490-1-jiaying.song.cn@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 9 Apr 2025 10:56:39 +0200
X-Gm-Features: ATxdqUHxwIV7Q-jI4MfUrpiQXQ572TQXbplk-APqiLLzTBa2sc0RPdg1GIl3bEY
Message-ID: <CANNYZj-iZyzgw3pmAJDcn0_qiD5JsF5e_bAxks7CAXN9J154uQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcc: Undef _TIME_BITS along with
 _FILE_OFFSET_BITS on Linux
To: Jiaying.Song.CN@windriver.com
Cc: openembedded-core@lists.openembedded.org, changqing.li@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Apr 2025 08:57:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214578

On Wed, 9 Apr 2025 at 03:40, Song, Jiaying (CN) via
lists.openembedded.org
<Jiaying.Song.CN=windriver.com@lists.openembedded.org> wrote:
> On 32-bit glibc>=2.34 systems using 64bit time_t build fails because
> _FILE_OFFSET_BITS is undefined here but _TIME_BITS is still set to 64
>
> Fixes
>
> ```
> /usr/include/features-time64.h:26:5: error: "_TIME_BITS=64 is allowed
>  only with _FILE_OFFSET_BITS=64"
> | #   error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
> |     ^
> | 1 error generated.
> ```

Thanks. Does this mean we can remove special exceptions for gcc and
gcc-sanitizers from meta/conf/distro/include/time64.inc? Can you
please check that?

Alex

