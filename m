Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91792D2F7DD
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 11:16:40 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3242.1764933390222925827
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Dec 2025 03:16:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E/yXjK5C;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8804f1bd6a7so16274446d6.2
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Dec 2025 03:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764933389; x=1765538189; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1jJ0XK7Rq81pHQqMic5+gl/4iXecEvf8EapUyFQSxhQ=;
        b=E/yXjK5CrspM6/JjNWjTTbm62IujDoHdeLD20ja3Tblgx1Xnq2wcR5ZC7FtSsWNejs
         P+d8hpEh+tet/bu1f3HMNTF7D+TIyRXzbTmRHIzAF62PT+araWgMNVrdfM9coszLzofd
         WHYPFImB42qLY1ApEQ2xTGvs1aWXCDNcObZiv2yo0gS4AQ/2elICrTcFMCMn6Hckfzab
         ZT6vwSECnhdhFUK6Fnl4Y+qGPgz2CHYTYYQplM5uS7XOmCaCdNWbG2tvhDnUCoFlqjr1
         42f88JH8b0OpvJi7cWqpiftGwUW6Xo+mV0XJZjw8u+3M8WSbQjMGSFGbaBnbn0IBKNy+
         a1nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764933389; x=1765538189;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1jJ0XK7Rq81pHQqMic5+gl/4iXecEvf8EapUyFQSxhQ=;
        b=DlANQO4CfpwKm29UPkS7h7cBh+BbM1A8Zfd31BWph5IZvhuVeeXv0adkhIw/fSPf8j
         8Q0FDnXNrCjVZlihdMwlJgJ3iq9rfN0KhnSF/UbbIOm/g2Q2qFBU4tMawG6okDhhvLDf
         psZfImY6WDViHQr9zDlYCBvySaJcWkJNGrxLhPzAd+72tAztlN4pbPrl/Z6jp1d5p8EU
         CDrmlZcYLDy3wZQesehekngLbpqo+npGRBgpNWVODbG9W/dsb3uFbWeFdjtSxnhtci9/
         sh6qGMpWYmGMqxdLo2Lk/ImvQZt9QdOS5q+ztSsUdGkUPqQK47JJbVxAVqE5DbvkrfCu
         gR2w==
X-Gm-Message-State: AOJu0YyAdLyhqPUaJci+/x8HW8mb2JpYsTe9CZYD7I14WaiFqHAVZ1u6
	MrC/Pxzhu2z5nn4YEBCmyySICi1GV0KxAJfUG0A4DkCc/DtGz+xgAZYnEFN/iYKSTailzIUqtqv
	pa64eEh7YKrWWXVc/otIdnhub/arBMhc=
X-Gm-Gg: ASbGncvlFTKO0M65ZpAtVQ6vnjOkvH20i+BjsBecwuoilf/P/Xdqu/m8plUSx2+358R
	mj1X99PtuFoDlqLm3zJmh3QDsYPG0wOJT7b3037jeyazz/1oGE2RRI+qH8Eny4Qvf4zfV7aytFr
	tfxBnnvMyq1Zpp6zf7nwlChSDu6t2RAQDvkGEpkOZWNxk8s6WboutK7Yuwa5Jxr1FWFrNPAZceE
	Q4lP9piAFQTAzQAlEmC8HIvzFV9aOZk2uHlnpwJDjoAQhvqJuhHuBqEhJjihXrKNhPUBGxcTyEt
	+1jZdbg6Q7Ow68WEIE1nffrrap1Wlw==
X-Google-Smtp-Source: AGHT+IEQ4ChfCCDvi1wFADHsqhzr+l/p3DCPSmZyenS876/dpB+iAZ1UQ7QIPm4vxJKwNkDqcWo1mjBKlnRZOJJI+Yo=
X-Received: by 2002:a05:6214:194b:b0:7c2:d5b7:dd54 with SMTP id
 6a1803df08f44-88824834472mr85433286d6.18.1764933389219; Fri, 05 Dec 2025
 03:16:29 -0800 (PST)
MIME-Version: 1.0
References: <20251204180945.3112334-1-tgamblin@baylibre.com> <20251204180945.3112334-5-tgamblin@baylibre.com>
In-Reply-To: <20251204180945.3112334-5-tgamblin@baylibre.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 5 Dec 2025 12:16:17 +0100
X-Gm-Features: AQt7F2quJhNwL5Sex1LN5DP1GCe31urUAOB9crPuES-F9UEgrtzhoARiuOHxihE
Message-ID: <CANNYZj8tUMEVU-SPDbhyg4L+eiZK2PKdJebTigCS953aS4VhFw@mail.gmail.com>
Subject: Re: [OE-core][PATCH 4/6] rpm: handle CMake Python paths in do_configure
To: tgamblin@baylibre.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Dec 2025 11:16:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227350

On Thu, 4 Dec 2025 at 19:10, Trevor Gamblin via lists.openembedded.org
<tgamblin=baylibre.com@lists.openembedded.org> wrote:
>
> With the Python 3.14.0 upgrade, rpm is finding the wrong paths with
> CMake, leading to a QA issue for files that we have listed in FILES
> already:
>
> |ERROR: QA Issue: rpm: Files/directories were installed but not shipped in any package:
> |  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/rpm/4.20.1/recipe-sysroot-native/usr/lib/python3.14/site-packages/rpm-4.20.1-py3.14.egg-info
> |  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/rpm/4.20.1/recipe-sysroot-native/usr/lib/python3.14/site-packages/rpm/_rpm.so
> |  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/rpm/4.20.1/recipe-sysroot-native/usr/lib/python3.14/site-packages/rpm/transaction.py
> |  /home/tgamblin/workspace/yocto/openembedded-core/build/tmp/work/x86-64-v3-poky-linux/rpm/4.20.1/recipe-sysroot-native/usr/lib/python3.14/site-packages/rpm/__init__.py
> |Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
> |rpm: 4 installed and not shipped files. [installed-vs-shipped]
>
> Add a do_configure:prepend() step to make sure the right ones are found.
...
> +do_configure:prepend() {
> +    # Force CMake to use target Python paths, not native
> +    sed -i 's|${Python3_SITEARCH}|${PYTHON_SITEPACKAGES_DIR}|g' ${S}/python/CMakeLists.txt
> +}
> +

This kind of tweak should be done with a proper patch.

But before that, it would be good to investigate why the correct value
was returned before and now it is not: even if we work around it in
oe-core like this, the issue may pop up in other layers too. It's
possible something needs to be fixed in python recipe still.

Alex

