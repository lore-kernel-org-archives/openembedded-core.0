Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89CD8D0E6E7
	for <webhook@archiver.kernel.org>; Mon, 21 Oct 2024 10:28:07 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.42836.1729506481071736433
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Oct 2024 03:28:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lpWkz0vN;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539e4b7409fso4299482e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 03:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729506479; x=1730111279; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gi/j/qc560WXtgFj9o+571Lhy3MdpTZxSSlMByZQnRk=;
        b=lpWkz0vNRdGbo5zo8fIXypqXmhnhBpHj4CTQeButiDaweLmrKHTlJl2cayB7+64AeW
         p86EA06uY4+qi4xsEfMDVOwagDHZtGlG/fGONT0yqKWIZHUdeT52NlD4SyoAr2kHdpwU
         x/uDsk0ij5GexQ1fuQW8tihILkZp5HT2bVpeRlP7aXpvfdHBQkI3IiZRJ6zQKYfGELud
         TUU0vLOu4O+xURKxsU9Jt1sQlNs+ehy1SZUvMvul7hcbCUZe+3EkT7mgFFjkbeNv2fDB
         /OiB4MUacQm7k1pbX/Ngu/BIbjNSsXVwPqWSICptKjkJccHelMAGNGB0/m4TEe76hzUa
         WYGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729506479; x=1730111279;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gi/j/qc560WXtgFj9o+571Lhy3MdpTZxSSlMByZQnRk=;
        b=JJw9jIjx+N7kckcKx5HvLBwNLtgSRa1D6F0Isss+CHU7mrzE2qJR2nhsBMUBb+E6RN
         FO2gLG+HprUyrO5NEz+33Cq6tomBM8MxDfAYy5QxoQg9zqoFeRf/K977j3AiSy3oZ52Z
         FHSGTv4u8Kolq6HwIigH38aUlA9hTyDoe0eq4K3wzyqmP6XVjI9K25lzOh4IZMpM0STc
         Hpo5FRic/69dgrbCqej3UGrZzeLjbDsAC5meIw9CMzPTjHHTThBouYibGBunpGCwfKU2
         BU13nojI5fpyZrUSaQR2aBGAhG2nqO7zFLIOF+XKrrckWGRxagFs6w5EtLILJvXjC5VB
         WpNA==
X-Gm-Message-State: AOJu0Yw6N6coa6aEzryHbaafrvWFCOzJMnX/2Rm/nUzvnxGa58HoW0Xy
	DF4SsKagpLYjKQLYC4uWE1gJ15YmY481N6pmF7hdpcU5+U6VubEz/PsVPqKsI0LbQtcAoWvmvMJ
	tWHQqqeAy8cnqX4/ioDsR3mGlCFg=
X-Google-Smtp-Source: AGHT+IG/sd0OMRU7TL63sqGbVQJsjs7lj9gvEB6y6i7T4XiGko9NiieBz7gdQwptwFrj242dcCEjsX8paPkeGGVg4DE=
X-Received: by 2002:a05:6512:3ca3:b0:539:f1d2:725b with SMTP id
 2adb3069b0e04-53a1583d16dmr3085945e87.4.1729506478951; Mon, 21 Oct 2024
 03:27:58 -0700 (PDT)
MIME-Version: 1.0
References: <20241019184824.1338594-1-raj.khem@gmail.com> <20241019184824.1338594-2-raj.khem@gmail.com>
In-Reply-To: <20241019184824.1338594-2-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 21 Oct 2024 12:27:47 +0200
Message-ID: <CANNYZj_CG9YmauWebfUfNJQsqVcba_CjkNwgm-2vcGJ+PKxOFA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] python3-libarchive-c: Avoid using
 find_library python API
To: raj.khem@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 10:28:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206105

Can this be a proper patch please?

Alex

On Sat, 19 Oct 2024 at 20:48, Khem Raj via lists.openembedded.org
<raj.khem=gmail.com@lists.openembedded.org> wrote:
>
> find_library API depends on platform to provide ldconfig, ld, gcc, objdump
> etc, so either we add these dependencies or avoid them by computing the
> libarchive library name during build, which we can be done.
>
> This ensures that ffi module works with musl as well as glibc equally
> as musl does not provide ldconfig like glibc does
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/python/python3-libarchive-c_5.1.bb | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb b/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb
> index 3116c6b62ec..510e2d9159c 100644
> --- a/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb
> +++ b/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb
> @@ -16,6 +16,14 @@ inherit pypi setuptools3 ptest
>
>  SRC_URI[sha256sum] = "7bcce24ea6c0fa3bc62468476c6d2f6264156db2f04878a372027c10615a2721"
>
> +DEPENDS += "patchelf-native libarchive"
> +# Avoid using find_library API which needs ldconfig and ld/objdump
> +# https://docs.python.org/3/library/ctypes.html#ctypes-reference
> +#
> +do_configure:append() {
> +    sed -i -e "s|find_library('archive')|'${libdir}/$(patchelf --print-soname ${STAGING_LIBDIR}/libarchive.so)'|" ${S}/libarchive/ffi.py
> +}
> +
>  RDEPENDS:${PN} += "\
>    libarchive \
>    python3-ctypes \
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#206086): https://lists.openembedded.org/g/openembedded-core/message/206086
> Mute This Topic: https://lists.openembedded.org/mt/109104795/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

