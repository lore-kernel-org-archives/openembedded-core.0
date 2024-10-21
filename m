Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89D8FD0E6E8
	for <webhook@archiver.kernel.org>; Mon, 21 Oct 2024 10:29:37 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.42849.1729506573381960279
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Oct 2024 03:29:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SAyqHjVN;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539e8586b53so4488328e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 03:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729506571; x=1730111371; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7GPOBt3K3nWb6eJ99VMrdrwODvmZM7hPiDF/PHl+mQ0=;
        b=SAyqHjVNlJliAlCTh4o+41e4ykj+RSkPQCrx6De8wJIHXtGr9SlyPOgdgFUpoB0vUf
         oNllKYrVZyNogIDpbNtr7ZTrfEQ7cagGKjsk22yub3t++PWa5Gmt9RFqOGolzChybcAQ
         RhJN8SfWJMyBpnrF8Yy8pXXiBcpNXZMNeR5FmKzIIupxuyTgy+XOVnCiSWs+64clhU8V
         Epw3WcUsSg5XpsVzmAgEBllOsUMXADPYUWzSobrjqQisDLaZw0IOP9ra+WwAXOwE8lHI
         AM+nvmHMSFkkjYrKCtGerZACWddk2J67oNOIqtUmtQaXgU1lMJKVmDRR3lVK7QrZmiIv
         HjyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729506571; x=1730111371;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7GPOBt3K3nWb6eJ99VMrdrwODvmZM7hPiDF/PHl+mQ0=;
        b=VNf+QZmmHLoqAtKjmhKBh6wEk+NS67zQ5o5T3dHKl1PJvG110ChxloL+Ihm8O0bu6+
         byQMEsGfEXhwuhQ9r8VFkq3qX6MC6XfMnDZwA+9T5V96r/Rz9EBwVuSAqZCAg9wNTIK6
         Oes0Ppzzc1J/+z1i25G/EiaaXvFynP8nrw+ednY4C0QzzTCLHTG+APLxE5MVeZTMvJQh
         E3g1iKz7x9/LqDSVfh5Rz5ZhpBuu4J1bYt0/rH51vyrfba1W9Ixcde6qLgJ8ihi/tnhc
         ROVHFH/wcN4mLNeINkpcsmAMns8d0HWFExjlAzeabtDqO7MfKpKPl5LPDjFygW2lcTKF
         ocaQ==
X-Gm-Message-State: AOJu0YxdeJe368gQT8nfw5Fbvh1yiyanMga98p2Wc3oh0x5Kx5F9p7IQ
	6mUlKC0Zecy4j9+qz332MFEeVT0MVHHC+7eniCOpOq8ayzcS+qec8zyrzs4+R+kIOSSkYkBjhU6
	ARS0VyTLPe7JezTwq5IFVEvKUJ7hQNQ==
X-Google-Smtp-Source: AGHT+IGYXujoL1m8r3693+1zbiBFl4Y0NTnweP7jPMkNOZixD6qMI09qoh6dfSyyXFQcMjZUwxAk2lcU26y4C7Vw4LE=
X-Received: by 2002:a05:6512:1584:b0:539:f84d:bee1 with SMTP id
 2adb3069b0e04-53a0c6dbb2amr5612905e87.17.1729506569848; Mon, 21 Oct 2024
 03:29:29 -0700 (PDT)
MIME-Version: 1.0
References: <20241019184824.1338594-1-raj.khem@gmail.com>
In-Reply-To: <20241019184824.1338594-1-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 21 Oct 2024 12:29:18 +0200
Message-ID: <CANNYZj-Mf9DQKCzA8_e0gagdSP9iAbv_bjtJixtHZFMuxD4MOg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] python3-packaging: Ignore old glibc tests
 on musl
To: raj.khem@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 10:29:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206106

Can run-ptest be rewritten to load the list of tests to skip from a
file, and then the recipe would add to that file instead? These sed
hacks are brittle and barely readable.

Alex

On Sat, 19 Oct 2024 at 20:48, Khem Raj via lists.openembedded.org
<raj.khem=gmail.com@lists.openembedded.org> wrote:
>
> These tests expect glibc to be the system C library
> ignore them for musl
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/python/python3-packaging_24.1.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-devtools/python/python3-packaging_24.1.bb b/meta/recipes-devtools/python/python3-packaging_24.1.bb
> index 20bcd55fbad..f8465d9fdb7 100644
> --- a/meta/recipes-devtools/python/python3-packaging_24.1.bb
> +++ b/meta/recipes-devtools/python/python3-packaging_24.1.bb
> @@ -25,6 +25,10 @@ do_install_ptest() {
>      rm -f ${D}${PTEST_PATH}/tests/manylinux/build.sh
>  }
>
> +do_install_ptest:append:libc-musl() {
> +    sed -i -e '/^pytest/ s|$| --deselect tests/test_manylinux.py::test_is_manylinux_compatible_old --ignore=tests/test_tags.py|' ${D}${PTEST_PATH}/run-ptest
> +}
> +
>  RDEPENDS:${PN}-ptest = "\
>      python3-ctypes \
>      python3-pretend \
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#206085): https://lists.openembedded.org/g/openembedded-core/message/206085
> Mute This Topic: https://lists.openembedded.org/mt/109104794/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

