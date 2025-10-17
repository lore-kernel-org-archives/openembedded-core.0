Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC003CCD195
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 18:28:12 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web11.622.1760725686177789015
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Oct 2025 11:28:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UowgLeMc;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-87c237eca60so16035116d6.1
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 11:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760725685; x=1761330485; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Pc7zxjdCP98Jn+6OotRfKSTD4iQqBpBRNMmslo+t2fs=;
        b=UowgLeMc5U9OUz0Z2uphlrflomdJqTrZwFSqdh4wOcudS+5+8CMxqC0t+CQd1leOJK
         L409s71x4zgglY+rKN//A6nTTbt1OqNbfiCVuOkhPthNbhk8k8+MaxJBn1vZ7ZkbFQ/T
         KXEcfF6EXTXnoWY+KsMYqvje7a80HZe9Rv1vRMx7DsaS0GFc7Ps1K9v2877u77gllrGO
         tjyWW8MwfomXejp9UsKcG5Mh9xJbCNv3W0smhepszU0O+WZ8JP2aerxDoI2vpgIZDRDj
         DMdJpWTkGiBLJWMxKHjhq8HLimCwQYPh0TQvwDtJbQPSZvtlV5O+aVXHRGsIMWpSLjRz
         1m8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760725685; x=1761330485;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pc7zxjdCP98Jn+6OotRfKSTD4iQqBpBRNMmslo+t2fs=;
        b=SA+gU1Ns8OpTyfPgewKl6wHIcbwlIWlsjtApDQztXefuO2EDrKzvQQtxUU06C0Utb9
         c/bxCB58nTk7K9YDdDsNM9j2JVqRXY5m+1VziAPXA4puL12QIewdxIHivgzPNSXOdOhQ
         PPeDNUQZNOFtz4/1m6ymwWRqwtJP7ddCRvXFV6crco/c9j0yyrv9sRuDucJDj/7kBtDI
         7DZrxznN2WibhWPaFu960UNrO6GkRqsiima40Xc4xRpXCh9TcYxRkKGJiMOVMqIGlNCM
         9iodlgHlx8XZtQyx9twMkkC5l7TbV2XjnpshAnzbm8EPrxfgnxNC64qpoJLv5Mj1QRpK
         uI/w==
X-Gm-Message-State: AOJu0YwDJ+onZnlkeT/Zo+PrrWdMuEDfeIJI2/P5q15kLu232hsRsIHK
	V41jqv/RtQ3ck96yvGWldx5Tq9GuqRUKAK9Hg85lZ7GEK5gmTaxQYYdNxoJVtTO+WCUX5alBGJR
	uXkgNZN9A5bC/qH5grYyR6+tAHMNEJgC6ng==
X-Gm-Gg: ASbGncuQ5RFDjYuUQmRUnyzxRU7BN01N0YdkyQ8u6/zOp8SO5EnfOS2HmDUaKvg0f4N
	ijs/Ulqm9ju5NvLWjwAVgj1ZUp5whacpuZI9Ncb4RavhtrFLx8z44zSLw+qrXmkWIb4EFkREx/z
	BKjy7ITuxo1SQrfyV2CPNO4povPcZbB+YB8vAaJok9QnR9Yxf9NkfAxgYNKo1ajjb1aO8sFQyZs
	rlrAHAjjaWw7bY9hICIXg/eSFm0TdgbEcrPV3YTACrY9NUOURtXWd59vW3/pgXOCex80i10n7Fr
	7JfKzKGDQnj8ZH8yI++5XdfvS4bp3pTKTkp/qZNVYUv7Ya5/2wus5DuewQIIl+k4KfFSpQ4=
X-Google-Smtp-Source: AGHT+IHkjZZ4MEl01dsoe7teyqYWkgLoVoOr4kH8bwR8BDGVFaK4BtYamg8ev1Pi2A4AsDb6BmCH+UiMQ8CaqjmOKoI=
X-Received: by 2002:a05:6214:c82:b0:87c:1fd9:da55 with SMTP id
 6a1803df08f44-87c2070defcmr63924366d6.5.1760725685141; Fri, 17 Oct 2025
 11:28:05 -0700 (PDT)
MIME-Version: 1.0
References: <20251017122649.493701-1-mikko.rapeli@linaro.org>
In-Reply-To: <20251017122649.493701-1-mikko.rapeli@linaro.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 17 Oct 2025 20:27:56 +0200
X-Gm-Features: AS18NWA46MQD6tZL58PK0TgYgOJJjHiJZRvGi25JG8tK5Faphjc-AnG7CnWGvNI
Message-ID: <CANNYZj8-ujhLtW=6uHzD9F3xF1okizVwzexbnfxnkSkHEhmxwA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/5] sefltest: disable qemu graphics
To: mikko.rapeli@linaro.org
Cc: openembedded-core@lists.openembedded.org, 
	Ross Burton <ross.burton@arm.com>, Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 18:28:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225032

Wait. There is no actual evidence that it is graphics that is causing
the problems, is it? The changes are probably okay, but I would not
want to have this baseless implication in commit messages.

Alex

On Fri, 17 Oct 2025 at 14:27, Mikko Rapeli via lists.openembedded.org
<mikko.rapeli=linaro.org@lists.openembedded.org> wrote:
>
> RFC: did not have time to properly test this, but sending this out
> in case this helps with current release issues
>
> Autobuilders see failures like
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/2714
> and
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/67/builds/2630
> where selftest are booting qemu which hangs, possibly due to graphics
> issues.
>
> Disable graphics from selftests which do not need it. Other selftests
> already use runqemu with nographic.
>
> Mikko Rapeli (5):
>   selftest devtool.py: disable qemu graphics
>   selftest imagefeatures.py: disable qemu graphics
>   selftest overlayfs.py: disable qemu graphics
>   selftest package.py: disable qemu graphics
>   selftest runtime_test.py: disable qemu graphics
>
>  meta/lib/oeqa/selftest/cases/devtool.py       |  2 +-
>  meta/lib/oeqa/selftest/cases/imagefeatures.py |  4 ++--
>  meta/lib/oeqa/selftest/cases/overlayfs.py     | 12 ++++++------
>  meta/lib/oeqa/selftest/cases/package.py       |  4 ++--
>  meta/lib/oeqa/selftest/cases/runtime_test.py  | 12 ++++++------
>  5 files changed, 17 insertions(+), 17 deletions(-)
>
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#225012): https://lists.openembedded.org/g/openembedded-core/message/225012
> Mute This Topic: https://lists.openembedded.org/mt/115806216/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

