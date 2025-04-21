Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA67CC369AB
	for <webhook@archiver.kernel.org>; Mon, 21 Apr 2025 15:22:27 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web11.17536.1745248938437172003
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Apr 2025 08:22:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DixHALnk;
 spf=pass (domain: gmail.com, ip: 209.85.210.51, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-72ec926e828so1163632a34.0
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Apr 2025 08:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745248937; x=1745853737; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jMr9kAY4F36s7b45XdXtwzMkTJZgDuzQmUG6L1QZSLk=;
        b=DixHALnkQjTKj/6Ie3mYozLQ3yrWMwOYlgnAXGUnVatM2nfeqHpG9xBybJuOGHUytG
         wvvUg+7VMr65oPvcm4KkkK8l0AMo2V7Y3XwDiiSF0z+B8giioVdNh7HEr4CAKKwqu8Qm
         M9GI7Ckdj2iSsvnRGlyTYO0NOFm6x4mQXsKzURPocp6zYSfu0abnKjkGnV9fq+pTn+jV
         r6c7OAQAOYCW/poSlISw+2o+5vCMdzFj5W6o38c2GyaP/wcRP7zjjekPZNPj1QUiao0h
         reU1qKAHX3r3JlO9zy/H7ZUIUFh+mygZQzadbP9IkSqLMFtE0AREompsqlNlg1wIcKxe
         8IDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745248937; x=1745853737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jMr9kAY4F36s7b45XdXtwzMkTJZgDuzQmUG6L1QZSLk=;
        b=hwrW3BqyCAeQL606eg9cdsnAxrsESpKuPw4pV1UTL8eEOgX2zg8SXDZW8HHVSnnkfT
         wuhF7nnw6iIERTHI0b1cfjmF8s8hQtnNaJrTZD0vJhhQhcvC9Gwqfcwrpzpmpigx/lon
         q059qiHyit0FfiUE78d7qa/VXM+/DW6ZTRWA4WPcI8rZMdOZ0UhkmUv1Ol+K/FJDuVNd
         cHi9+3mwUk1cIJ/KUt7EP+EN16MLVQIgJt8nRBMogKhiJpVWZtL6zMYYUn/9XKzqu7nI
         uhCtqFZBJ8WUKuXLfBvgdwqH+8qxBm5gsoM44DdVhPzmFFHY0MvpJFr9zRFpGkut29aW
         9sSQ==
X-Gm-Message-State: AOJu0YyUUDYGvwyZY2d9igy784hatgTKyfhDnV+Iu1evsoheRgbPsUB4
	axSUFgrehLZz8sBRcT7xlG+zW2f1LcptI2N+uYfHMJuYS44Rhz9kbi9oNkFwZ13P5NMVLnZGlGd
	rtdqXItkDCMBiUQGJ+TG6XLk2QRg=
X-Gm-Gg: ASbGncvT1PdmJqCpmTVmV3IZKmnnpgSX1CjKVOB6xRzw18cJARSANwAX0tJoui5kX68
	+aifYFu2FzJsR4kirL0vFvBneoBEWhgY0fIy+FCZKXbQx2MM4okSAZaJkxMQ0lNoFQkdReqMLp3
	kRWgVZgWm8lGqDmLJgSRGLWN/cVwzER3Ge
X-Google-Smtp-Source: AGHT+IFTelQkW9owxe1OxZgbvhlMYYX4FlY8jRgOhqGlcaikVwdoQPhhvsRGxCCgTz/kYtTukj8WQhZ8J03ncCTR6S4=
X-Received: by 2002:a05:6808:8305:b0:401:bcae:68 with SMTP id
 5614622812f47-401c0a7bb43mr6491182b6e.19.1745248937361; Mon, 21 Apr 2025
 08:22:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250418-mesa-25-fixes-v2-0-e110ccfe291f@oss.qualcomm.com>
In-Reply-To: <20250418-mesa-25-fixes-v2-0-e110ccfe291f@oss.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 21 Apr 2025 08:21:50 -0700
X-Gm-Features: ATxdqUEePuxfStneB7pbbv0A9Ii3lcsH9IfaH13yZbp1clZGSqYk7Lgctm6Ky_s
Message-ID: <CAMKF1sr5VLmBKmrr8Q05C7aaZi6OK7JHS9DKEZyKo4eihnusgg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 0/3] mesa: small improvements after 25.0 merge
To: dmitry.baryshkov@oss.qualcomm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Apr 2025 15:22:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215177

Hi Dmitry

I have picked these patch into clang-merge-2 branch.

https://web.git.yoctoproject.org/poky-contrib/log/?h=3Dkraj/clang-merge-2

They help with some mesa-native build failures however, I am still
seeing a build failure build mesa-native
on musl targets. I am not sure why target should matter but it seems
to see the error

https://autobuilder.yoctoproject.org/valkyrie/#/builders/111/builds/150

Error is that mesa_clc is not available before its use. Interestingly,
it never fails locally here but it always fails on AB. Is there some
sort of build race or something else going on?
Would appreciate help.

On Thu, Apr 17, 2025 at 5:57=E2=80=AFPM Dmitry Baryshkov via
lists.openembedded.org
<dmitry.baryshkov=3Doss.qualcomm.com@lists.openembedded.org> wrote:
>
> Several bugfixes after Mesa 25.0 recipe was merged:
> - Replace the bindgen patches with meson-based fix (Dylan Baker)
> - Bundle OpenCL C headers
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Changes in v2:
> - Dropped applied patches
> - Add the bundle-opencl-headers patch
> - Link to v1: https://lore.kernel.org/r/20250412-mesa-25-fixes-v1-0-79184=
0391271@oss.qualcomm.com
>
> ---
> Dmitry Baryshkov (3):
>       meson: pass -target and -I to bindgen calls
>       mesa: drop the bindgen patch
>       mesa: bundle Clang OpenCL headers into meta-clc
>
>  meta/classes-recipe/meson.bbclass                  |  1 +
>  ...d-an-option-to-force-inclusion-of-OpenCL-.patch | 57 ++++++++++++++++=
++
>  ...vide-cross-compilation-arguments-to-LLVM-.patch | 67 ----------------=
------
>  meta/recipes-graphics/mesa/mesa.inc                |  9 +--
>  4 files changed, 61 insertions(+), 73 deletions(-)
> ---
> base-commit: 53c772c941d5ce69ab89f35cd04724b740daf269
> change-id: 20250411-mesa-25-fixes-5a38fe55dd3c
>
> Best regards,
> --
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#215115): https://lists.openembedded.org/g/openembedde=
d-core/message/215115
> Mute This Topic: https://lists.openembedded.org/mt/112324544/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

