Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB173C2D0CD
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 13:06:34 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web11.11815.1747314385978884351
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 06:06:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OM2gwRPA;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6f5365bdbaeso8496696d6.3
        for <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 06:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747314385; x=1747919185; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hWPcBjcmL8pd7i+LqNXmJqKhSUkR+4IhoDepw2oDFbA=;
        b=OM2gwRPAgzL2cxpqkuDA9UPx4dQp4XyPXOqFkSfwO9PmLLnURrsiqeF8F4ZRWEISFM
         O+DHxy4cwBRGPjwLHY0+JsRi4hFY/7hwSFYPt01u9CI8NUr0UR6iwYMG9yiZ+RFN0M/V
         f6YJ/oyW/fzUgg7lclNwaZF3x2n7AleKSO9nqdqV7DyK+RDLoLPjBT8RyJxn5uRiNN7P
         sVwZNo5V6oTmtNpzlfv5cbtPSvr0YaecZ8KYYoQINUkxv8WFs5UcE3WS1gnTbRAZthcm
         X66iq7N+AfoyHErB/yQRyyqPWxt7D2T26v1cZaP2O4L5So4Pgzlsfc/xJnpzNFBaZot5
         +aQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747314385; x=1747919185;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hWPcBjcmL8pd7i+LqNXmJqKhSUkR+4IhoDepw2oDFbA=;
        b=tTrL0YCJR9K7yADRAsDTwa5tWsvXcRUr76wDEr3KCGngzJp6mWXj05RY4Pgu9wacAL
         7BAgzu0pGnj0ZD5G44y06bgwggtmm7zpOaTXNyVdIrkzFdM+1PXLsPwZTpocpnD+HRPr
         nOl0LF14mvI5RahF1U4bOaD/rUcRIcb6wtniGz4IQPIXTK7J86QHJxLTw5vG7QWdB7ZL
         WgUiU9z/tK0Gv8y3NIIoYWR76QKsP+tAwTF/xAKBeSRJQ0BT4VE2N9Wf9Zyl/r4g3s91
         zhzY9Jy8Hrjm+0cd3VTnDTT2yrvV3vPgDM6o2BBD6QZ4DfYgxtT8jcpLAEzR7BKeffTB
         4iEQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1KRYCfsKuvKUAzEC1SRT64zYyELa8qWZ6zW72+Ch0r+bXmZLl3FeLqa6VNfJ2vgjP1W1AZZHGG+y/KYF3F7npsA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx6OYKKmQdXUcNaJNyT2+xoU3yv/J8XQ1F3IOxI+nRnMGlfpds+
	X8d7dQG8gygDTUO4kHU85HwTEMp+fjPboHtcyV2AKOFbDM3PzcflrGnM/t+RqIrbpa4wmE/fYgK
	htuB1/yv17fjAMw8DGZU7q+dmkQs=
X-Gm-Gg: ASbGncsLieoU9DtmD1OaSWZO7E3GJsiKqmEZPbY+V4VyGP1KDwh+2hASvJgZE0If8G5
	dO3YVZBUM0spgbw0sJWJIIeYFTV+QG4CZ1UojTDg1Vy2Ymh68Y2bl6naocuQ0sKaXYvg3XSiKRp
	7pdBQ/WE9Y1tPrF90YOv4rgiEaDxbQIFVmw2DoNyTmEFGvU2IE7sZGk/1aTpUoQc32
X-Google-Smtp-Source: AGHT+IHU+zFnkbPjTYgAAPstcbP+2Gjbe2GHY2dlL8/QOTjZaDF4TRrqzws7Aik2F3V1Lovo9DnIhqctZyi9sqSnlAc=
X-Received: by 2002:a05:6214:23cc:b0:6e8:fbb7:6760 with SMTP id
 6a1803df08f44-6f8a4b83d35mr41976946d6.1.1747314384938; Thu, 15 May 2025
 06:06:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250515031214.924-1-liuyd.fnst@fujitsu.com>
In-Reply-To: <20250515031214.924-1-liuyd.fnst@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 15 May 2025 15:06:13 +0200
X-Gm-Features: AX0GCFuUPLhIFszp2uBL8zS6Vw9YIyTpt_1dnJSQXYv_1SfHFrvuGitegk3kPoc
Message-ID: <CANNYZj_eu1vXmNaq1ehRJDM8VonWNmU=e+jBa4LerDnEWT7Yxw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libunwind: fix multilib conflict
To: liuyd.fnst@fujitsu.com
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 13:06:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216670

On Thu, 15 May 2025 at 05:12, Yiding Liu (Fujitsu) via
lists.openembedded.org <liuyd.fnst=fujitsu.com@lists.openembedded.org>
wrote:
> fix issue that
> | Error: Transaction test error:
> |   file /usr/libexec/libunwind/check-namespace.sh conflicts between attempted installs of libunwind-1.8.1-r0.core2_64 and lib32-libunwind-1.8.1-r0.core2_32
> |   file /usr/libexec/libunwind/test-runner conflicts between attempted installs of libunwind-1.8.1-r0.core2_64 and lib32-libunwind-1.8.1-r0.core2_32
>
> Pass ${libdir} to configure option --libexecdir of libunwind that it installs
>     plugin libraries to /usr/lib{,64} rather than /usr/libexec/
>
> Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> ---
>  meta/recipes-support/libunwind/libunwind_1.8.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/libunwind/libunwind_1.8.1.bb b/meta/recipes-support/libunwind/libunwind_1.8.1.bb
> index 68d7a98ee4..1dca39e1b7 100644
> --- a/meta/recipes-support/libunwind/libunwind_1.8.1.bb
> +++ b/meta/recipes-support/libunwind/libunwind_1.8.1.bb
> @@ -28,7 +28,7 @@ PACKAGECONFIG[lzma] = "--enable-minidebuginfo,--disable-minidebuginfo,xz"
>  PACKAGECONFIG[zlib] = "--enable-zlibdebuginfo,--disable-zlibdebuginfo,zlib"
>  PACKAGECONFIG[latexdocs] = "--enable-documentation, --disable-documentation, latex2man-native"
>
> -EXTRA_OECONF = "--enable-static"
> +EXTRA_OECONF = "--enable-static --libexecdir=${libdir}"

This does not look like a correct fix. Helper executables should not
go to libdir, they should indeed remain in libexecdir.

When multilib issues happen, there's an unfortunate tendency to not
look into what the differences actually are, and where they originate.
Please do so first, and then we'll work towards a fix.

Alex

