Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B552AD3B7E5
	for <webhook@archiver.kernel.org>; Mon, 29 Dec 2025 11:13:51 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41511.1767006825695651032
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Dec 2025 03:13:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bsKv7dg5;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8ba0d6c68a8so1008120785a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Dec 2025 03:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767006825; x=1767611625; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=alerZXqvn+VOXyDC43Tb+YPof0CQVxl55OgNLuVdOl4=;
        b=bsKv7dg5m5kRvsTi+cXFIUl8HblAK5Dv68K4UelwbmOQbZ5P+md9v+1RKj2K8rRcr3
         /7m9Rxf0l4Ht8czWTjB03qqbYMVGDICStq+YV/j6oYA+Z7hwRmBfBsV7NWNXlNZOJUkw
         rhkRmKr/vGDBrK8oRk6X95nEgd6lBMxz6WMdk87w+kIXVVCbPvfUgEL8rR+zoZgRfoTs
         ChHxBywSjCBKlMu/Mo66lKBwABSAOivq8sc3z3YXRg+tCdp4aksCqIzXTEQH4krhQCPJ
         2+iMa2D3hCglAojx6zzMpzouZR6itoP9tCYWz5WUB1Q1zZaNSMvePSn7wCw4/zQRnLdh
         D9pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767006825; x=1767611625;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=alerZXqvn+VOXyDC43Tb+YPof0CQVxl55OgNLuVdOl4=;
        b=e0ufIZfF7rKAQ7yaDp9Z3D+FRKDsiLUIuICWH/JOq8uiBHAu9UPNmPkNGP8raBQAuw
         npcFwkwzXMj6uY5utJpQ3BoMTDNd86/U+64fCD1dOLwglbWQGbuvYNyVEDePEFrYhuwb
         M4/Dr+9bB4P4VcaVGC+gBBRi5Q9MQ1sbrdyTi690rO+jw9D6qjn4P6PK6yMhGnP5S+BR
         mJJiDXdOcaAaURAKqleeUcjVzWfwTfsKiYC0tl0wlrI70QToPRcHbdQcdtBElUEOGIdk
         OGFreVCzBhyetCWhG+y0+KDxoLsdRZSL/2UjmDZC8lAEGr5zUl85YrdhgRQwzJIVvSCs
         Fxdw==
X-Gm-Message-State: AOJu0YyrSVJFSNiaQxt97Ot5Ko0meZHp5uLZT/QBkkCyFeb96TgdZaWy
	urUVNs2azIAbvTzGt+KVEoFy6xeE4kVUuy+iOU34ClfKvbUrCbtGEEQH0cqpKEH5t1EuE3A5+xU
	HxwloyEZrW3nIqxw1OSvHDMkO+xMKxOxnFw==
X-Gm-Gg: AY/fxX63arfCageSdDbsFL+2AN/yLpHNVqFJYHy4yGjhoXOcctrmMj64hBdt3GlTFvF
	Vt0viD11NLpmG4fZrfDZx1FnO9rsZjT7NzK/BYNGFp5T7a6uMtoPcVRHZ/tVlu9hpaD1kMeyRsr
	XmJ60cLJKQXxXWPyixmXnM6Qpregg3qtPkqI2fmq8dqiyw/wfKjspOwxS62r5lmuaETLcrDeYRa
	fif2mHOiAQ9kPgDZQvr9+jhIJuFjcRbS2D/e+SnBhQlAi0QmSlLCOWT9wj1R/mdu0tyKz47+ojE
	ElksoLUbVUkK3z55DW6rSOVXQp5UOg==
X-Google-Smtp-Source: AGHT+IEpxWSbEZN6kLhx9d2c90Kk4HaSW23Mwwy8m4ROXV25jXbdeaIRIPbEXMeLX18/tTFz216P9wghbSITzoICpUA=
X-Received: by 2002:a05:620a:454e:b0:8b2:a049:4ac0 with SMTP id
 af79cd13be357-8c08f675f0emr4846896685a.30.1767006824656; Mon, 29 Dec 2025
 03:13:44 -0800 (PST)
MIME-Version: 1.0
References: <20251228031953.4024552-1-mark.yang@lge.com>
In-Reply-To: <20251228031953.4024552-1-mark.yang@lge.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 29 Dec 2025 12:13:33 +0100
X-Gm-Features: AQt7F2qrw9JP4ug2WIwcnku9J92KPspErcB73cUJOI4LfuNlT8Vi3ku3x_ZLY88
Message-ID: <CANNYZj_5Y2VeymLiL29cThrk4jC8q2r2BMSFRrVpT-QfXP35Mw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] package.py: skip dwarfsrcfiles for Clang LTO
 static libraries
To: mark.yang@lge.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Dec 2025 11:13:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228597

Thanks, this should be good.

Alex

On Sun, 28 Dec 2025 at 04:20, mark.yang via lists.openembedded.org
<mark.yang=lge.com@lists.openembedded.org> wrote:
>
> From: "mark.yang" <mark.yang@lge.com>
>
> When using Clang toolchain with LTO enabled, static libraries (.a) contain
> LLVM bitcode objects instead of ELF objects. dwarfsrcfiles cannot process
> these files and fails with "not a valid ELF file" error.
>
> Rather than catching the error message, guard the dwarfsrcfiles call by
> checking for the specific conditions: static library (using is_static_lib()
> magic check) + clang toolchain + lto in DISTRO_FEATURES. When all conditions
> are met, skip the call silently.
>
> Signed-off-by: mark.yang <mark.yang@lge.com>
> ---
>  meta/lib/oe/package.py | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
> index baaa0cba02..279cd567b3 100644
> --- a/meta/lib/oe/package.py
> +++ b/meta/lib/oe/package.py
> @@ -770,6 +770,14 @@ def parse_debugsources_from_dwarfsrcfiles_output(dwarfsrcfiles_output):
>      return debugfiles.keys()
>
>  def source_info(file, d, fatal=True):
> +    # Skip static libraries when using Clang toolchain with LTO enabled.
> +    # In this case, .a files contain LLVM bitcode instead of ELF objects,
> +    # and dwarfsrcfiles cannot process them.
> +    if is_static_lib(file):
> +        if d.getVar('TOOLCHAIN') == "clang" and bb.utils.contains('DISTRO_FEATURES', 'lto', True, False, d):
> +            bb.debug(1, "Skipping dwarfsrcfiles for Clang LTO archive: %s" % file)
> +            return []
> +
>      cmd = ["dwarfsrcfiles", file]
>      try:
>          output = subprocess.check_output(cmd, universal_newlines=True, stderr=subprocess.STDOUT)
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#228580): https://lists.openembedded.org/g/openembedded-core/message/228580
> Mute This Topic: https://lists.openembedded.org/mt/116968059/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

