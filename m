Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D096FC4725D
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 10:17:49 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.70329.1705918663268169325
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 02:17:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BamvkcAD;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2cd2f472665so27364671fa.2
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 02:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705918661; x=1706523461; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ktC6p6Gb0UiK8EjFvu68yvt3hDhXlDjORjkw7CuCLbs=;
        b=BamvkcADPgpyXRhujCJuKlfiDd+wNWi1VjpcSlRxmY52bSkbEtbbvZNBxU7rpDZ0m1
         KR14WsBRWvQhXu8l6FdyqP0aIgpeh2PV5iGZn0EeiUkAmn+YokcLZLrC7/BvVr5u66Hb
         rE67p1UgbjaMaVu/Yh+LnZQ6WM5QUO86V25bI/vxl/3im1PW2RtvB+/ShaWL9PuujFbY
         CTtVHAkh71tekST3O73UqnDx169aYYPzoFauPf6xhXsiBlkMxBcKI+Wfj82fPLsqtX7o
         IGPO+tgfgFGxH85hI+taF7CJKZu/PzcDKlKz9uxaX72Qaa32Jqr14W0YL1L6mRziUKjA
         uioA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705918661; x=1706523461;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ktC6p6Gb0UiK8EjFvu68yvt3hDhXlDjORjkw7CuCLbs=;
        b=OoQlmtPxB+tlyx4FgpHXnknGHbZFLAC08bahtICQ2hol7XgD31++d8jmbfDSvEUhrB
         uswXYrjMTwbT1JzbyUgPhIMpunV60tffpqjHRF00JwjfChaEmci7w5iuHxDzPvH3BpDE
         /Y5dEA9wb0WwfBE+E/Z/MWZILv0lGPYv2xFID6K+lNQ4H6mPwO1f0pTt8AWMo5GqcJmc
         /GNg6JO1P+h423VKHzJlRi4GT7a6lzbfoKjw6Ey2+vLxCp/l2wlH6z5SOlSSMxWHOsMx
         0glmaU+DrduNW3aNxQoczPyX4PDdWny/JQbHw8abK7JLzq4gP47V5WcQc19FpskglN/l
         ddZw==
X-Gm-Message-State: AOJu0YzQBVUlw74H64E1q6JrKvdKaGvhve++w3aLcJed9XdmOKP/gqST
	hUIgseIYDCuUG4zOkGp5J46EMxvsB+ReFq6JXTdNNksYgbu2ULJKEuUMcZRP9uPNEQ642XzE9Xp
	wlyAZEQW/K9Qr27mLMsXrVH1yU8jaCs5BN7w=
X-Google-Smtp-Source: AGHT+IHM/I1ktBuGQhtRVKkOxtQLuCGPzErgO6qEWM0dt7xAx1wjHyZO23LW8i2qb22cqNA6u/ruK8B9IHedlmZJKGE=
X-Received: by 2002:a2e:a1cc:0:b0:2cd:fab4:1ace with SMTP id
 c12-20020a2ea1cc000000b002cdfab41acemr1426186ljm.81.1705918661222; Mon, 22
 Jan 2024 02:17:41 -0800 (PST)
MIME-Version: 1.0
References: <20240122085443.637472-2-pavel@zhukoff.net>
In-Reply-To: <20240122085443.637472-2-pavel@zhukoff.net>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 22 Jan 2024 11:17:29 +0100
Message-ID: <CANNYZj9a+pvXVcCf9-6qPzVF9gcNccOwqno7ducFYajXFauyfQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] mdamd: Switch to git recipe
To: Pavel Zhukov <pavel@zhukoff.net>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 10:17:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194134

On Mon, 22 Jan 2024 at 09:55, Pavel Zhukov <pavel@zhukoff.net> wrote:
>
> mdadm latest official release was long time while development is
> ongoing. This caused growing number of downstream patches in the layer.
> Switch to git recipe and cleanup patches.

Wait.

Did you engage with upstream to find out if/when they're making a new
release? Switching to a random commit in the middle of a development
cycle needs to be carefully considered, and preferably, confirmed with
upstream. Even if the last release was a long time ago, and
maintenance burden with custom patches is growing.

> --- a/meta/recipes-extended/mdadm/mdadm_4.2.bb
> +++ b/meta/recipes-extended/mdadm/mdadm_git.bb

This breaks PV monotonically increasing. You need to keep it at 4.2,
and add '+git' in the recipe.

>  EXTRA_OEMAKE = 'CHECK_RUN_DIR=0 CXFLAGS="${CFLAGS}" SYSTEMD_DIR=${systemd_system_unitdir} \
> -                BINDIR="${base_sbindir}" UDEVDIR="${nonarch_base_libdir}/udev"'
> +                BINDIR="${base_sbindir}" UDEVDIR="${nonarch_base_libdir}/udev" LDFLAGS="${LDFLAGS}"'
>
>  DEBUG_OPTIMIZATION:append = " -Wno-error"
>
> @@ -91,7 +77,7 @@ do_install_ptest() {
>         cp -R --no-dereference --preserve=mode,links -v ${S}/tests ${D}${PTEST_PATH}/tests
>         cp ${S}/test ${D}${PTEST_PATH}
>         sed -e 's!sleep 0.*!sleep 1!g; s!/var/tmp!/mdadm-testing-dir!g' -i ${D}${PTEST_PATH}/test
> -       sed -e 's!/var/tmp!/mdadm-testing-dir!g' -i ${D}${PTEST_PATH}/tests/*
> +       find ${D}${PTEST_PATH}/tests -type f -maxdepth 1 -exec sed -e 's!/var/tmp!/mdadm-testing-dir!g' -i {} \;
>          sed -i -e '/echo -ne "$_script... "/d' \
>                 -e 's/echo "succeeded"/echo -e "PASS: $_script"/g' \
>                 -e '/save_log fail/N; /_fail=1/i\\t\t\techo -ne "FAIL: $_script"' \

Why these changes?

Alex

