Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F83FC87FCF
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 09:03:40 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web11.96149.1755075811627599485
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Aug 2025 02:03:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RpO5FRa9;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-7077a1563b5so55623586d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 02:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755075810; x=1755680610; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4LYLWQ7NIMXJE27GULfQTogFM+Cl3QKI4GHwj4zM5b8=;
        b=RpO5FRa9+CAZpT8/xJDdiaTr7N42SomQCHVNrCpatwNT4iWhicHFU4A83bkyMDsfjz
         Y4xwF7xfDQThHRGUzHBLLkkzGSJ6KMr2aA8axS8T60LOn2lMW95f1b3m3ivLXuGZNZ16
         X4DIwXMwSXtY6xoVQ9AQS197atHvPAdeAPifYJpx2CArLyuw3v8tlifV/XVShLkh6P00
         bMJo0QctmEfAcG0sKkLUMnDXjv6QTr/Ewjlr42Ea+MH0te1NBOn87TEPEu6djyCdXFvB
         9MyXYnUr6svbhFP40orjM4CoyBJxAZ/boSYiQRpRPj/VkswBWkUCDWc9nx9qCFPOA8AA
         zpWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755075810; x=1755680610;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4LYLWQ7NIMXJE27GULfQTogFM+Cl3QKI4GHwj4zM5b8=;
        b=vvJAaCuk1JWihX4wKIjTuDJNBbhMKHekpPfTTE3uOq2ix3FlezC3SIsPQXeKfEaE9a
         hP5Wcv4hszZMTVg21u5WEHwxqX9Dhr/Yjuh5MX8IjjN300z+aKAfuTD+RFJSD806N8ed
         8rFgabMfYGvsw6P4ZHh9NY2i2YIIQx4n9xYJ/vXGyp2VVVVPtLkXwE172oXeqP28JLcx
         xI2lrDl3MVT16lAF7VwxCdbrp6Lml/8iIoTr6oo8AKT+foMjULz75ryYXArJr1rb6zVR
         s/6aLF2cmH3NkH4rbteErzC4GqT7zIhfpYEsmJkrD7nUSPXX+7B0zotLZ5rTYoTg/gp8
         UyXA==
X-Gm-Message-State: AOJu0YzJyJz0OOK3rBS/qzigpTQovYBuJsGkLQH+adWglIvoQUsRqpH+
	GxdqAN1Sav0K+VN8CPfhzrXvnNCsy1+Q/9R8Ei7V+sFi+mpv7D5JFcD2cCswihChSLFI449+iRZ
	QDlKvwGhuonqXt4vdqJm76qBbvptZ/AdrAQ==
X-Gm-Gg: ASbGncuxYiHd2M4C7HfGuegwMkybYQO/qr1/Bb1T2UUNztfKNHFOMeNkd1Rex/J2BN4
	Qs7ut/KEmecE7x4Gv0xLf6Gf3W5OwTZAWaevsyygPobpISD8uOn7DU9aLmzXohfZEQDAAapD6cI
	BFFrqbguPx+M6JujQnrjyH119UNYWVEvaF8G5VVfJEdMdr5nVOsHT9NkVp3sUDMibaiMTM6AjxG
	Zbn92e0JOvaZaMLw50q97JqmZpaCrfk8A3kw2vR6g==
X-Google-Smtp-Source: AGHT+IHELd8nTrJgLik9pg/mVoJCCVjw2WGP4r8xUkZz/XVtShfPfQZFD3rfnLrCwAabRJr2efdrzzc3bGCXCp9tWY8=
X-Received: by 2002:ad4:5be4:0:b0:709:9991:158a with SMTP id
 6a1803df08f44-709e8951eebmr27145396d6.43.1755075810550; Wed, 13 Aug 2025
 02:03:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250812205050.13599-1-osama.abdelkader@gmail.com>
In-Reply-To: <20250812205050.13599-1-osama.abdelkader@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 13 Aug 2025 11:03:19 +0200
X-Gm-Features: Ac12FXw6wyxCFUO9YdSfPZvqQxLcNV6X7dUKjFbWkW9Ct7hpuYFWxlZuiprTcI4
Message-ID: <CANNYZj_7MTXYBkZbgDWu8=toq83USvNdgqe-RtmDc0ZXfLoQ1g@mail.gmail.com>
Subject: Re: [PATCH v2] go-cross-canadian: fix binaries install and GOARCH
To: Osama Abdelkader <osama.abdelkader@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 09:03:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221794

Thanks, lgtm.

Alex

On Tue, 12 Aug 2025 at 22:52, Osama Abdelkader
<osama.abdelkader@gmail.com> wrote:
>
> set GOARCH to HOST_GOARCH which is set from SDKMACHINE,
> since GOARCH defaults to TARGET_GOARCH, which is set from MACHINE (wrong arch).
>
> Also fix do_install to correctly install all binaries from
> ${GO_BUILD_BINDIR} by using 'find -type f' to avoid issues when the
> directory contains subdirectories (e.g. "linux_arm").
>
> Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
> ---
> v2:
> - Fixed commit message
> ---
>  meta/recipes-devtools/go/go-cross-canadian.inc | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/go/go-cross-canadian.inc b/meta/recipes-devtools/go/go-cross-canadian.inc
> index 39330fc98b..4a6f2f4c36 100644
> --- a/meta/recipes-devtools/go/go-cross-canadian.inc
> +++ b/meta/recipes-devtools/go/go-cross-canadian.inc
> @@ -5,6 +5,8 @@ DEPENDS = "go-native virtual/${HOST_PREFIX}go virtual/nativesdk-${HOST_PREFIX}go
>             virtual/nativesdk-compilerlibs"
>  PN = "go-cross-canadian-${TRANSLATED_TARGET_ARCH}"
>
> +GOARCH = "${HOST_GOARCH}"
> +
>  # it uses gcc on build machine during go-cross-canadian bootstrap, but
>  # the gcc version may be old and not support option '-fmacro-prefix-map'
>  # which is one of default values of DEBUG_PREFIX_MAP
> @@ -51,7 +53,7 @@ do_install() {
>         install -d ${D}${libdir}/go/pkg/tool
>         cp --preserve=mode,timestamps -R ${B}/pkg/tool/${HOST_GOTUPLE} ${D}${libdir}/go/pkg/tool/
>         install -d ${D}${bindir} ${D}${libdir}/go/bin
> -       for f in ${B}/${GO_BUILD_BINDIR}/*
> +       for f in $(find ${B}/${GO_BUILD_BINDIR} -type f)
>         do
>                 base=`basename $f`
>                 install -m755 $f ${D}${libdir}/go/bin
> --
> 2.43.0
>

