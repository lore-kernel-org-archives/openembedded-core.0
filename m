Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A63E5C02194
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 18:58:59 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web10.124880.1738695532558048502
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Feb 2025 10:58:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bBSzQQwa;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6d8a3e99e32so52853716d6.2
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 10:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738695531; x=1739300331; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ffTlZ5M7xkAelI5eWHi1pFirPj/inHlruAfrw3b/7bE=;
        b=bBSzQQwa9a3EYAwhq9bY2K1iATQTwlsHxwiYJRWe9G0nr7m5PCnKsAT7QjKA4C0hgl
         3mXye429pisCTfb3stAdNlDFQOpmGgfs3n3J+iqz1CuT3kNkIsGsBArCq4VruFzbAvVE
         sr0KRAcmBsUNjQEuBmpM4BTAo/kqwuRXJWo437uMirQhmaLDrSmquTCi/Y9Uu4IdHEKn
         ZwxAhuQ2vyTEeZsFs0HcptsLbBxyRv8BtvA09fLA0k0iH5WZwJFKa/9QCtS9+JZa6xVd
         9VbqbYCF8YJ5ruBzfSEln85qMaKnV8uNt7fxibZqdrLJIZweYwwRdpacJ6SfmYIJ2BSK
         ggAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738695531; x=1739300331;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ffTlZ5M7xkAelI5eWHi1pFirPj/inHlruAfrw3b/7bE=;
        b=e148CfwjjJ05jsAzlEdIfu8dFCYoOq1fVQ9GqOeO1mrFpfmWQEt+wOI1g0Vmk1a3wR
         laQXWv6SjUmD3TMY2VITFmP2+lAgN6NQX8fZS2PC6sqtv3MMjLgjzSRW7VEVwlYLJDml
         vMD3dkVlUlowhYCimWatjM7eNadz72F6RKVUwxox28QOLjiDXrp+CtIwZwOwEjQi4Iwo
         XaM7z53Pjm0al9Q9fATUN0cBH0+DpH8utPwDkI/5u1Ab21bZ07hOOHM+lyvA3N0qNYBX
         26gy/Ajpk7sIWPqo06i/hnQbu2ZbKCu8vqVa2umcrdHB952KhEctUPVaI2diJYvuzofs
         2ZRA==
X-Forwarded-Encrypted: i=1; AJvYcCWWGVbjSMB6tIoufC16NxLOqu15/ZP/AhVSYPgKcdiXCiFlXGwNL5FE5kIEpVp4X66bBygGZsH8DlJo6c1MbW2QUA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YylBgKEq7Yz67bQk8H4AkdC+t0Zh6D/KR9sGr16b1FPGPswHOXw
	QNpX8hE6UB1CLToMJ4jv5s9OJkOvf4SvN4b5Kau3uuJoCoPqt2wqHDp6kv4G3o9ITO9ay8AKDEW
	+DRNAKxu+SRY2VwFJ5hJCB4TpHTs=
X-Gm-Gg: ASbGncu2djRioB1ya/+/1G0DswHdepKgyiGMb4vzMhP6Et6vUJOtrFaFyGIFCQKjIb2
	3xsF/rHjY3wrbOwxrHLzmpNXL5ri0IUx+AJI3jfo6pejZr+i+fq21/vk6NtlVUCFQiDXB1wnmmb
	kk2fy9unCtfMvQ9jmnfAueJ7+mRJ6hRW0=
X-Google-Smtp-Source: AGHT+IHLrykbpf9K0l391dMUDaq8sQNaKHSfj4zhA0klM84e8IkvPmay8Anznqsi/qxXzqeoKd+1SQEAioRqslS74g8=
X-Received: by 2002:ad4:58e4:0:b0:6e4:2bb6:275c with SMTP id
 6a1803df08f44-6e42bb62863mr27521226d6.19.1738695531614; Tue, 04 Feb 2025
 10:58:51 -0800 (PST)
MIME-Version: 1.0
References: <CAOSpxdYfp_rjUkofvCQk6VFbJj8TkCv-eWjb=V5U5TavT++Pfg@mail.gmail.com>
 <7067.1738686633751194071@lists.openembedded.org> <CAOSpxdYXfpROfknEGgNGdxmyfekOKgstxgOQZtvMuC015NPQuw@mail.gmail.com>
In-Reply-To: <CAOSpxdYXfpROfknEGgNGdxmyfekOKgstxgOQZtvMuC015NPQuw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 4 Feb 2025 19:58:40 +0100
X-Gm-Features: AWEUYZnVIdPlX9Cx0bKmG1dRIYoZMiIzR2KMJ4qNVRU58RkQwvE-oxQ9ksJPXlE
Message-ID: <CANNYZj8EcX6jHXXmcf_=Hx3-AQStBBdn9FOdv4Oi89OZXooW4A@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] gnupg: upgrade 2.4.4 -> 2.4.5
To: Steve Sakoman <steve@sakoman.com>
Cc: gudni.m.g@gmail.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 18:58:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210818

On Tue, 4 Feb 2025 at 18:53, Steve Sakoman <steve@sakoman.com> wrote:
> Understood, but without the patch I get an error free build, and with
> the patch I get these errors.
>
> I've tried twice with and without your patch, and the issue is reproducible.
>
> I'm open to suggestions, copying Alex since he's more familiar with
> building rust than I am!

I see

/lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.36' not found
(required by /srv/pokybuild/yocto-worker/qemux86-tc/build/build-st-2023465/tmp/work/core2-32-poky-linux/rust/1.75.0/recipe-sysroot-native/usr/lib/libexpat.so.1)

I can't explain what gnupg can possibly have to do with this, I can
only suggest that the failing test needs to be reproduced locally
first on the submitter's side.

Alex

