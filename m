Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CD3DCD3442
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 10:07:47 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8412.1778148458479256492
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 03:07:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Pk8Y7hX9;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8b3d6b215cfso10830836d6.3
        for <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 03:07:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778148457; cv=none;
        d=google.com; s=arc-20240605;
        b=YUrATu6L7YcJ/GZJ7mK8i4Ac839UsvEFG3kIQ177MKPaNnfW6qJZ7XWZtC1sbYx4W4
         3HpIrqws6eXC9Gue/jgTpTSvKqWzF9eCW7yeidKfrZodRbPRvJVulXv1BTMWYi++p6ql
         bxs0nrBi34qIRKwVjq5gYNDScFAIUZZWmswMuu6fEgC64b/p5DdfY2Sb8jTVMynJTzyO
         yeYQZExJYyYgIPlUj9coz1n5Xzu+gNfztB4WSkr3X+XvJbxhfhbsfBHBb3cOTAERkhDZ
         E5nKBoCu7fLhyMdGDv6BQyAd4uXkU/JztOPH4GBW3xWQlJ1vcgBIN14JF+SK69O1V7Y/
         Hocg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=M8adGp3EAfYEs40T/uyBVh2UUfeMw0TRNXWcV26S8Jc=;
        fh=hy4S8KThupuVU7aIPH1vI7GwNnkpTJ1M6UdbpYq/vfI=;
        b=Zk/wzEKQLME/Qm0/gRurlpoP1SE+P2ChDKW9Z1Sci8Y0vGkSwHkxMhOOOJXEHIiL+o
         7QeJZlxg+0XT8HVFoj0dqNNqlVw+/nqEAbf1iFkdaVTgnMgowFDpsA9an8sabEz+yB2z
         I6+lXT2AwzSsd8xB4kWdQenuRRqz/mZnO3BXLVoqWHVJDiyvKRIilyfOZDcFBW+xisxi
         3HdOmF4oN4AP+U+BecSpplaobTTJH62pptV8mm+u6x5MQF5Ok5Un5+7W2Lfv6wFdJBPw
         Up/6dzvDL5mX/36zuUL8TMKwSaoB2eO7KDhmdkhQbdPxGA6ZkA8EXA3VI1ZLeZtW8l8y
         gVEg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778148457; x=1778753257; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=M8adGp3EAfYEs40T/uyBVh2UUfeMw0TRNXWcV26S8Jc=;
        b=Pk8Y7hX9GcZQs5ybU2/DoNVrWcsrxYKhIcxfK3TarbcyfrHY8Deevb1k5dmau71FkH
         FHQS6UaX2WIwVIzQFLZeafgx5Qt/WsIeMFVZC9BCgna4Mz2DqvsDYXLI3tHGXHfY6HK9
         xSe7Jchu+dxxPv08uh+3eWazGFfhYHGwJAeP4BzmTvnQtlao394dkWWO6h1wZ1LWk8Ma
         E8IrK/Su/wn8kIA74WQr11tbKFYCXCcfxdVKC//q3HfUAjWP3of2DpyiVEWhVA5UBGlZ
         1+Uad5KaIObN6ZTRWQXpBHrQdaLy4VXs4zZVwBM9z+PwsCw+Spm+Cu+M/u2g+jOnOzPZ
         OpdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778148457; x=1778753257;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M8adGp3EAfYEs40T/uyBVh2UUfeMw0TRNXWcV26S8Jc=;
        b=kl6caIpHmk/99s0KxlJ7A0o44t/0LmSUM3JRfilWdZj5acyJrJkoJ++FitDDe1QMTz
         uR9zJ/g4TDGGEd9BEZ9MRLd3NJwsNUp5O9ACvqma4kwWMmL8/j1k14Ucydd02Uov4xad
         Vkob/YebsY9CuCgJACSbcsQ8GJ+WPhz7T1/ONXNUJToiUmELptQtBdnsJNfqFRehHLCF
         GDSRqi0WZ/PrJJ+oFnmpCKpyYNLLtyQDXqJsMZvn47mcp8J6K+msZ9rTl8gGah4V1+Yo
         amZibwxuijW0qmohevsP2E2sbD3vToWpMINBdMzF+7FqIvubzHea1eI85vv+DkuBuabz
         3TQQ==
X-Gm-Message-State: AOJu0Yw9rZhiziBI+Fz/Ue8E9M3pDPSJy3EakD8za54kHp+3Yt0vkQ03
	Mlu+OiSAUO0NkIRM2G4FR6YD+NenqwR7yhPtkxKtozOWjO8gw/nalsKw+/yn/+BwQZinNLmrHZV
	KAjRGnwSHXoH8pXz/nVqXk8TFxnyH37A=
X-Gm-Gg: AeBDiesZBCN6Rwo2l17x7NvXjncaDib3U9+AHVXgqTHxW2muEyUHuETI3Bx+/KGdiUi
	oqdiU5CIvaDmxLogzYHti9NyvUDwGcmQvArz2DhTBBY/HxbWPfAB8M0ASbgg8D2tePg3KjaRo0z
	Tg6B0zgiW/17CO88jrg43y+onnj+9ZYCZkN+Xsp9maekOPKKBPaktHtMSi1mcObB4rP2Qwa6NWm
	noLU7rouubHyonThrxuapsbBJXv8fGnXF5VWuIFFo/Cc1rA8ESn6cLlyBeOOnT9+Vfz2HI37uiB
	PFZKvoEZ6FFfzRT1zMHi2l/rzxLScRxVNIm/1ZPbnQ2MWT50Vjla
X-Received: by 2002:a05:622a:1182:b0:50f:c245:85fd with SMTP id
 d75a77b69052e-51461fce778mr102738521cf.31.1778148457337; Thu, 07 May 2026
 03:07:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260504-glibc-fix-stackprot-v1-1-fbfd0f22ddd2@sonos.com>
In-Reply-To: <20260504-glibc-fix-stackprot-v1-1-fbfd0f22ddd2@sonos.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 7 May 2026 12:07:26 +0200
X-Gm-Features: AVHnY4L7swBKpwSByd4gt-KTmTfam12CwT5C43dpv8LZPV2qRQGQQEjMaY-O0-k
Message-ID: <CANNYZj8zc+Q4wzg8BOiY4GSNz+dZ5Byq7mjQSdO2zPuKB5XY4A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glibc: Fix recipe bug that disabled stack protector
To: ivan.nestlerode@sonos.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 10:07:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236571

The patch is fine, but there was interest on the patch review in
finding out where and why these lines were introduced. The earliest
commit is this one:
https://git.openembedded.org/openembedded-core/commit/?h=master-next&id=bddc141e7cec18744902787ab53c21bf28e71f78

Alex

On Mon, 4 May 2026 at 23:28, Ivan Nestlerode via
lists.openembedded.org
<ivan.nestlerode=sonos.com@lists.openembedded.org> wrote:
>
> From: Ivan Nestlerode <ivan.nestlerode@sonos.com>
>
> Fixes [YOCTO #16265]
>
> The glibc recipe is supposed to be building with
> --enable-stack-protector=strong, but some CACHED_CONFIGVARS values are
> actually breaking this, causing glibc to be built with no stack
> protector at all.
>
> Remove these CACHED_CONFIGVARS values so that stack protector support is
> detected properly in do_configure and then enabled properly during
> do_compile.
>
> Full details are here:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=16265
>
> Signed-off-by: Ivan Nestlerode <ivan.nestlerode@sonos.com>
> ---
> The glibc recipe is supposed to be building with
> --enable-stack-protector=strong, but some CACHED_CONFIGVARS values
> are actually breaking this, causing glibc to be built with no stack
> protector at all.
>
> Full details are here:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=16265
> ---
>  meta/recipes-core/glibc/glibc.inc | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
> index 30d93bca77..dae087d53f 100644
> --- a/meta/recipes-core/glibc/glibc.inc
> +++ b/meta/recipes-core/glibc/glibc.inc
> @@ -21,9 +21,6 @@ CACHED_CONFIGUREVARS += " \
>    libc_cv_slibdir=${base_libdir} \
>    libc_cv_rootsbindir=${base_sbindir} \
>    libc_cv_localedir=${localedir} \
> -  libc_cv_ssp_strong=no \
> -  libc_cv_ssp_all=no \
> -  libc_cv_ssp=no \
>    libc_cv_include_x86_isa_level=no \
>  "
>
>
> ---
> base-commit: 9ca41405e6bca276468a3b6f67eaa328b8016485
> change-id: 20260504-glibc-fix-stackprot-47134ada0b7f
>
> Best regards,
> --
> Ivan Nestlerode <ivan.nestlerode@sonos.com>
>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#236458): https://lists.openembedded.org/g/openembedded-core/message/236458
> Mute This Topic: https://lists.openembedded.org/mt/119151502/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

