Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27BC0CA0FED
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 10:53:41 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web11.14456.1757501617314274479
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 03:53:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PyLsK+M3;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-7251e6b2f9eso38089726d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 03:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757501616; x=1758106416; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Qc+vrkz52WwT0w0elPNXXufgJE3tCtWWX0AcT4DMJQM=;
        b=PyLsK+M3QQfG2z9hs2fJyzEY0ZLYygBcI1R6723dImyVZBd8WuZrVBzPZBRvqpzjdB
         wejw3c7ZB95kuhcZmxxqYewSjcv2/RoShsn49mK/Xb0X3ElIeU9Z/KJH8NWvzVgLYGcH
         IWWzouxvjJg9Q/+YBxUcF8xcA0FxnFnh2kX1wlOA7Sk9IQyxSv9bjP7M+l3e5K0C4+IU
         kYb4vQCjCcZTi6QcA9zG0XQC2JG5II8Ua/uOCohDhO9JQ3LtcdRFUtp5r49Vh8Sdc5Q9
         gCw1DHe33qcqsZt5mHKqyMBukj6QYHYBYBRKaFu2aPOjVtcyF0EQ4i1UGQYajTR8utzh
         f+aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757501616; x=1758106416;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qc+vrkz52WwT0w0elPNXXufgJE3tCtWWX0AcT4DMJQM=;
        b=oU4QLHZJf0oRubCIM8iLiKsmrUX/bT26SiUMfIziFxG/zOPQ/MmVBDRgu55oZseCqO
         0A4JzD/wGk3CWhbKYvAMmsksAd8l/nxP2miXuGYro/AlEUNS57g5YEaxN9nkR3F+6+cb
         r0RQkhP4BpuBezvFr95kiwkZbCxZtSltIcAWjS/vrjRr5A583/i0Rtl2YVqIJOvLu8xz
         EhN3wYoJr1KvsZozh5dl9EL34IPs/JRGUGPD+ObZ+UogTANIYti7ifpRbEosoZc+TRBL
         up4p4atbuB8yoRMx8UQjk02Y0IgQBhBKLabYC8oE/iDCxEe0Vwh7wbMXGk4SGF1dE1nt
         f7+A==
X-Gm-Message-State: AOJu0Yy2LvDQvtrQS6e6Pk1oJMZl+sg6Pv+kjUImXVptU8Qf+IzQugd2
	8VQTlf+Vbz8Cgt7BrwqIXidQEG5qpF1f07GUjmGYhd3QToeZy6E21PDwCAI7LfSy8QUd5aBey6f
	Jz2QPYWecxwGBass56XDPfVICiht0SVdKxA==
X-Gm-Gg: ASbGncviLcVTaYzq1eLVADaE7hF1eR6MomnZzfLHthR9GV7WDsmGGOnkiXHst8JzbTC
	sQEu3NSIIGl8CU4lnnfX8zAD0pgl6+729YDFj3/RRtqXcx4x8X5qgJchRSFyHe7NcLA0mDbJqPc
	9HeL/WHSWbIj994WhfUzCacgMkQveuyxAYiR/fMxosErJPRQ7sRFUybft6t+YIrgmb0Rxhwr89t
	H5rvbh+IeXNGVQJD32UMN9zXUJ3civwkzpidgR4xvzLJ7JnjcJXdB+nQczuNukN3BODXGLQkZm4
	qnsTBA7yGliObL4/VHcnZ6+ImK4bfg3VPDmCQEyp
X-Google-Smtp-Source: AGHT+IGgyIhznUuXN0iXqUscm1c0ZTlwGK21StfeG9CIE0VV0YM4vYahSxlR8v7uQ/jKZw+IV19/FNGLJzviOj0CHKI=
X-Received: by 2002:ad4:5ae2:0:b0:72a:3858:74b6 with SMTP id
 6a1803df08f44-7394884de67mr179418656d6.66.1757501616224; Wed, 10 Sep 2025
 03:53:36 -0700 (PDT)
MIME-Version: 1.0
References: <1863E64531E43024.10180@lists.openembedded.org>
In-Reply-To: <1863E64531E43024.10180@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 10 Sep 2025 12:53:25 +0200
X-Gm-Features: AS18NWDeMeUmwRC2k0OoA0QH7wuXmjxD7ag1CzrR-ieVQH2oNFLOo7SyNDPZRiA
Message-ID: <CANNYZj_8n6JdXxGkN49=WmC=s=8uviOiS4--ahus9b3n5-VZfA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/6] maintainers.inc: unassign Zang Ruochen
To: Zang Ruochen <zangruochen@loongson.cn>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 10:53:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223198

Hello Zang,

please see below; if you do not wish to be unassigned as the
maintainer of these recipes in openembedded-core, please speak up. But
it is expected that assigned maintainers update their recipes to
latest versions in a timely manner (which has not been happening).

Thanks,
Alex

On Wed, 10 Sept 2025 at 12:51, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
>
> From: Alexander Kanavin <alex@linutronix.de>
>
> There hasn't been any version updates or other oe-core
> activity in a long time.
>
> We're actually getting better and timelier updates when
> someone sees a recipe has no maintainer and then goes ahead
> with the update themselves.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/conf/distro/include/maintainers.inc | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index 8f230912567..2dafade677d 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -169,8 +169,8 @@ RECIPE_MAINTAINER:pn-e2fsprogs = "Robert Yang <liezhi.yang@windriver.com>"
>  RECIPE_MAINTAINER:pn-ed = "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-efivar = "Ross Burton <ross.burton@arm.com>"
>  RECIPE_MAINTAINER:pn-efibootmgr = "Ross Burton <ross.burton@arm.com>"
> -RECIPE_MAINTAINER:pn-elfutils = "Zang Ruochen <zangruochen@loongson.cn>"
> -RECIPE_MAINTAINER:pn-ell = "Zang Ruochen <zangruochen@loongson.cn>"
> +RECIPE_MAINTAINER:pn-elfutils = "Unassigned <unassigned@yoctoproject.org>"
> +RECIPE_MAINTAINER:pn-ell = "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-enchant2 = "Anuj Mittal <anuj.mittal@intel.com>"
>  RECIPE_MAINTAINER:pn-encodings = "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-epiphany = "Unassigned <unassigned@yoctoproject.org>"
> @@ -425,7 +425,7 @@ RECIPE_MAINTAINER:pn-libuv = "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-libva = "Anuj Mittal <anuj.mittal@intel.com>"
>  RECIPE_MAINTAINER:pn-libva-initial = "Anuj Mittal <anuj.mittal@intel.com>"
>  RECIPE_MAINTAINER:pn-libva-utils = "Anuj Mittal <anuj.mittal@intel.com>"
> -RECIPE_MAINTAINER:pn-libvorbis = "Zang Ruochen <zangruochen@loongson.cn>"
> +RECIPE_MAINTAINER:pn-libvorbis = "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-libwebp = "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-libwpe = "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-libx11 = "Unassigned <unassigned@yoctoproject.org>"
> @@ -636,7 +636,7 @@ RECIPE_MAINTAINER:pn-python3-colorama = "Trevor Gamblin <tgamblin@baylibre.com>"
>  RECIPE_MAINTAINER:pn-python3-cryptography = "Tim Orling <tim.orling@konsulko.com>"
>  RECIPE_MAINTAINER:pn-python3-cryptography-vectors = "Tim Orling <tim.orling@konsulko.com>"
>  RECIPE_MAINTAINER:pn-python3-cython = "Trevor Gamblin <tgamblin@baylibre.com>"
> -RECIPE_MAINTAINER:pn-python3-dbus = "Zang Ruochen <zangruochen@loongson.cn>"
> +RECIPE_MAINTAINER:pn-python3-dbus = "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-python3-dbusmock = "Trevor Gamblin <tgamblin@baylibre.com>"
>  RECIPE_MAINTAINER:pn-python3-docutils = "Trevor Gamblin <tgamblin@baylibre.com>"
>  RECIPE_MAINTAINER:pn-python3-dtc = "Trevor Gamblin <tgamblin@baylibre.com>"
> @@ -673,25 +673,25 @@ RECIPE_MAINTAINER:pn-python3-more-itertools = "Tim Orling <tim.orling@konsulko.c
>  RECIPE_MAINTAINER:pn-python3-numpy = "Trevor Gamblin <tgamblin@baylibre.com>"
>  RECIPE_MAINTAINER:pn-python3-packaging = "Tim Orling <tim.orling@konsulko.com>"
>  RECIPE_MAINTAINER:pn-python3-pathspec = "Ross Burton <ross.burton@arm.com>"
> -RECIPE_MAINTAINER:pn-python3-pbr = "Zang Ruochen <zangruochen@loongson.cn>"
> +RECIPE_MAINTAINER:pn-python3-pbr = "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-python3-pdm = "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-python3-pdm-backend = "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-python3-pdm-build-locked = "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-python3-pefile = "Khem Raj <raj.khem@gmail.com>"
> -RECIPE_MAINTAINER:pn-python3-pip = "Zang Ruochen <zangruochen@loongson.cn>"
> +RECIPE_MAINTAINER:pn-python3-pip = "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-python3-pluggy = "Tim Orling <tim.orling@konsulko.com>"
>  RECIPE_MAINTAINER:pn-python3-ply = "Tim Orling <tim.orling@konsulko.com>"
>  RECIPE_MAINTAINER:pn-python3-poetry-core = "Tim Orling <tim.orling@konsulko.com>"
>  RECIPE_MAINTAINER:pn-python3-pretend = "Tim Orling <tim.orling@konsulko.com>"
>  RECIPE_MAINTAINER:pn-python3-psutil = "Tim Orling <tim.orling@konsulko.com>"
>  RECIPE_MAINTAINER:pn-python3-pyasn1 = "Tim Orling <tim.orling@konsulko.com>"
> -RECIPE_MAINTAINER:pn-python3-pycairo = "Zang Ruochen <zangruochen@loongson.cn>"
> +RECIPE_MAINTAINER:pn-python3-pycairo = "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-python3-pycparser = "Tim Orling <tim.orling@konsulko.com>"
>  RECIPE_MAINTAINER:pn-python3-pycryptodome = "Joshua Watt <JPEWhacker@gmail.com>"
>  RECIPE_MAINTAINER:pn-python3-pycryptodomex = "Joshua Watt <JPEWhacker@gmail.com>"
>  RECIPE_MAINTAINER:pn-python3-pyelftools = "Joshua Watt <JPEWhacker@gmail.com>"
>  RECIPE_MAINTAINER:pn-python3-pygments = "Trevor Gamblin <tgamblin@baylibre.com>"
> -RECIPE_MAINTAINER:pn-python3-pygobject = "Zang Ruochen <zangruochen@loongson.cn>"
> +RECIPE_MAINTAINER:pn-python3-pygobject = "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-python3-pyopenssl = "Tim Orling <tim.orling@konsulko.com>"
>  RECIPE_MAINTAINER:pn-python3-pyparsing = "Trevor Gamblin <tgamblin@baylibre.com>"
>  RECIPE_MAINTAINER:pn-python3-pyproject-hooks = "Ross Burton <ross.burton@arm.com>"
> @@ -715,7 +715,7 @@ RECIPE_MAINTAINER:pn-python3-semantic-version = "Tim Orling <tim.orling@konsulko
>  RECIPE_MAINTAINER:pn-python3-setuptools = "Trevor Gamblin <tgamblin@baylibre.com>"
>  RECIPE_MAINTAINER:pn-python3-setuptools-rust = "Tim Orling <tim.orling@konsulko.com>"
>  RECIPE_MAINTAINER:pn-python3-setuptools-scm = "Trevor Gamblin <tgamblin@baylibre.com>"
> -RECIPE_MAINTAINER:pn-python3-six = "Zang Ruochen <zangruochen@loongson.cn>"
> +RECIPE_MAINTAINER:pn-python3-six = "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-python3-smartypants = "Trevor Gamblin <tgamblin@baylibre.com>"
>  RECIPE_MAINTAINER:pn-python3-smmap = "Trevor Gamblin <tgamblin@baylibre.com>"
>  RECIPE_MAINTAINER:pn-python3-snowballstemmer = "Tim Orling <tim.orling@konsulko.com>"
> --
> 2.39.5
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#223192): https://lists.openembedded.org/g/openembedded-core/message/223192
> Mute This Topic: https://lists.openembedded.org/mt/115167227/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

