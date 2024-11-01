Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D6B3E6B242
	for <webhook@archiver.kernel.org>; Fri,  1 Nov 2024 10:09:14 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.34500.1730455750750184937
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Nov 2024 03:09:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KLdDAljn;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2fb59652cb9so17616001fa.3
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 03:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730455749; x=1731060549; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kxLSg2rTL4vPEl8HXafoaq0ZHEA7jrwq50NfjK0y2JE=;
        b=KLdDAljnEf7hRELHXt3wLLfyy9aMxQciFNw3kgc+Vf1Y0dPn1yOG8x6tHc3jHRcpmX
         aUIhiaffbanalNUdnDISI3OKlTsLz+AI9VbhtgpiLXdLo8w+uU/pCJtXu7nIdkJPGOC9
         0BMCsfYHkZ3lDcKS3LoAcRPxfBfMJSZbdTyAf2I6XeCPYE2tzwfTlwH/HGI1LgbLKGtv
         GDDU783W5cAplVsIPO5svm7QvBkjuyJBCwr5Xk57lSly1eBoLOiRHn6IxmLrDhO9NOt8
         z0igADhramX5Weo6TcgCKFMSYCrvcj4f+dwv1jB7e9KOhZISRaDzp19KH59qzFVyxsK8
         AGjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730455749; x=1731060549;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kxLSg2rTL4vPEl8HXafoaq0ZHEA7jrwq50NfjK0y2JE=;
        b=vzURYBGM1/UA3BP7nBR2zqRIinmDetna0wla0+Mq/+L+8MIVg3YA6nBxuorxkN9wps
         VV6v+/Q/DLyv816wg+gZvuC+nrCsGGHRQgBz6iJXtgiWbq/wmSY3hurTZepg4HIiOE0G
         CQaswBsuh8THPgj92+csb6bZrXhvtvyuaNU0Com3zzI4M+0eMgyHZgw/fYoUwPKuBGPa
         kNta7DkoOXvoUGiJTRdst5fxPM7YP7Mge+n+hP2BrojNdQqX0kOfZae7kPsBS0z0sSl3
         +URR70IGdTPQp7dCE8VBdJqrnDMc5Q2aaIIZ2sP+w7e+PeBTPwUV+4f1i8IODYPdQEK6
         ie1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVR6+jSmWoX/CCdnEYvQQJLoIxFPIdTQ+3fGKoYrvl98hSKagCbrQ4vMcBIVsviUAjswlaO2kAno9Xi27aFQT+W1g==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxh4dpkl6+pgk69YS15rNm2/ecY/H7XqfXKx074bmuRqWRv8LZC
	WdwCDUGgyNmyL/UdtPi4VrQwMeQkaX5NEt8P0A2uSC+DYJiHE+d4iCrR3ZWGTALM6bI+oj0zH8Z
	gIxPqTQSr9saEMwiOZYglN+Rk6bU=
X-Google-Smtp-Source: AGHT+IHMkHrMYk3JZDGAGCjCRaa9gLbobArC1WjipARY+zWWDuaa8my2/wdI5POHYJSFPwv0pzn3idpZa3QqyLiKk+s=
X-Received: by 2002:a05:651c:b0e:b0:2fb:556c:fdfc with SMTP id
 38308e7fff4ca-2fdec5fad57mr37070421fa.12.1730455748417; Fri, 01 Nov 2024
 03:09:08 -0700 (PDT)
MIME-Version: 1.0
References: <20241029193745.2919129-1-tgamblin@baylibre.com> <ZyJBQBRRsLFov02a@bootlin-mathieu>
In-Reply-To: <ZyJBQBRRsLFov02a@bootlin-mathieu>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 1 Nov 2024 11:08:57 +0100
Message-ID: <CANNYZj9wt-pmRrGYwE-RRSTX3+VtcU7h_Cug6woqs4k_9NSpNQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] python3-numpy: upgrade 1.26.4 -> 2.1.2
To: mathieu.dubois-briand@bootlin.com, Trevor Gamblin <tgamblin@baylibre.com>, 
	openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 10:09:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206614

On Wed, 30 Oct 2024 at 15:23, Mathieu Dubois-Briand via
lists.openembedded.org
<mathieu.dubois-briand=bootlin.com@lists.openembedded.org> wrote:

> Differences can be seen here:
> - https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20241030-a5e77d8y/
> - https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20241030-a5e77d8y/packages/diff-html/
>
> Can you have a look please ?

I believe there are two separate reproducibility issues there:

1. usr/lib/python3.13/site-packages/numpy/__config__.py contains
numerous references to compiler and linker flags which contains build
paths. This is not uncommon, and we generally handle it by patching
these out after the fact with sed in do_install:append() or similar.
Plenty of examples all over oe-core.

2. The second issue is slightly trickier. There's a number of
generated c files produced by cython and they contain lines like:

static const char __pyx_k_srv_storage_alex_yocto_build_64[] =
"/srv/storage/alex/yocto/build-64/tmp/work/core2-64-poky-linux/python3-numpy/2.1.2/numpy-2.1.2/numpy/random/bit_generator.pyx";
 PyObject *__pyx_kp_s_srv_storage_alex_yocto_build_64;
etc.

This needs to be fixed by tracking down where in cython this stuff is
generated, and replacing real paths (or parts of them) with something
reproducible, like 'reproducible_build_path' or similar. Then this
should be submitted or raised with upstream.

3. We should also drop
# Python pyx -> c -> so build leaves absolute build paths in the code
INSANE_SKIP:${PN} += "buildpaths"
INSANE_SKIP:${PN}-src += "buildpaths"

from meta/classes-recipe/python_mesonpy.bbclass when point two is addressed.

Hope this helps,
Alex

