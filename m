Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0610FC2BA15
	for <webhook@archiver.kernel.org>; Tue, 18 Jun 2024 08:01:52 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.80866.1718697708965751396
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jun 2024 01:01:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A+48mchO;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2ec1e5505abso22238631fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Jun 2024 01:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718697707; x=1719302507; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v+Q5fR+PwH1Q14X5qiG/1RhEXlH0LSUKpGx0Q5NPbdo=;
        b=A+48mchOUW+64JMy4a93RjLcMbQjq8pfjKO6WjaOy3KRyUqqPVH0rnGM3fhtKfZzLq
         Z2qO7KxpKfPpX80b1Egn3USXINozAuUSz6EOSTpeHWMarKpGgZ+AIX6j23VVf4Bolz98
         SFUh1jfGZ1/rRffSb+BhdtufTl+dX/+bvk5n99Zz2uvkwW2OXhNeBF7wbX/P5gUnFwKr
         30pETnJjhdzFkupV4TJEupnJYvnBIbgqFmWJD787E6uOylCsklpYOt9C4A4gHK9Uy0E3
         7C0Q8JNF8QWLIzNz1Xhi9j1t6KpNPnGX7UqrDcjXUDJZf0WPsD8BMS7jbnWX90Qlv/RZ
         0DUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718697707; x=1719302507;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v+Q5fR+PwH1Q14X5qiG/1RhEXlH0LSUKpGx0Q5NPbdo=;
        b=XG/zXT5oZUrHsS1hA4//rd/p8wYo4blUVdTVok6mfzYCnJcB7xOf/DXU8X7UPPzpcX
         L7WSKmvN9g6/PbsgVM9hnp6Q+KXkHPG2/mISxy6SCmQXUhKYa1T3gOHd7GxUQJtyLS5x
         lFVBAoin4aVHWI6t2RwlsxBX2sR3bHJox/OYuyQ5K2d00Qq3VfKs8McgFEYq+abY2C8O
         2zpOsp2wvAKBJK1KNDGgKHt/FbNR32MEfvnmeiIZGEkv42SMG6WOyd0srloz8Y5VdOla
         eKwbCbv90opWqddV+abEnXP+4WE0JktGYQ9IYNZlqPG3uXFIhvP2+Tvvhy8UYJads/Hv
         ZElg==
X-Gm-Message-State: AOJu0YwdHg9nhBVTopPGa/HbWvMP46NWuSXA1YccWakzT4OcboPYzksx
	xzIaCSrJz921wO5PKTv6UdHHodfJ8lL+pcwYGF9wo6qtY0cDeFwdwb8Vidtz5O8rkPnZSwuHRRE
	+Tuv5cB4eV1CT4lwgPWnc55XLPis=
X-Google-Smtp-Source: AGHT+IE5T8wG+kb6NWr+D3E5vLvO0/m28Art0WtH8fD+vu5SqCoW6pHHwih+RHo5VnpAFRlo+m3A5NqDdi45mj61DkU=
X-Received: by 2002:a2e:9f51:0:b0:2ec:39ec:d0b5 with SMTP id
 38308e7fff4ca-2ec39ecd0e7mr1815341fa.18.1718697706300; Tue, 18 Jun 2024
 01:01:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240618033019.1181198-1-changqing.li@windriver.com> <20240618033019.1181198-3-changqing.li@windriver.com>
In-Reply-To: <20240618033019.1181198-3-changqing.li@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 18 Jun 2024 10:01:43 +0200
Message-ID: <CANNYZj-S7gkEHb+mc9jjZxXn1xfs+V=eAtTgdJ_G_fa3KfZmtw@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][master][PATCH 2/2] apt: runtime error:
 filename too long (tmpdir length)
To: changqing.li@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jun 2024 08:01:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200862

On Tue, 18 Jun 2024 at 05:30, Changqing Li via lists.openembedded.org
<changqing.li=windriver.com@lists.openembedded.org> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> when the tmpdir dir is longer than 220, there is no files saved in
> tmp/sysroots/x86_64-linux/var/lib/apt/lists/ after run apt-get update,
> this is because apt-get uses the path as the file name, but the file
> name can't be longer than 255 according to /usr/include/linux/limits.h.
>
> [YOCTO #2688]
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>
> Take back from https://git.openembedded.org/openembedded-core/commit/?id=9a0c0393871eda4bbcecfdd4b595f0c1b8e42edf
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  ...he-filename-can-t-be-longer-than-255.patch | 40 +++++++++++++++++++
>  meta/recipes-devtools/apt/apt_2.6.1.bb        |  1 +
>  2 files changed, 41 insertions(+)
>  create mode 100644 meta/recipes-devtools/apt/apt/0001-strutl.cc-the-filename-can-t-be-longer-than-255.patch
>
> diff --git a/meta/recipes-devtools/apt/apt/0001-strutl.cc-the-filename-can-t-be-longer-than-255.patch b/meta/recipes-devtools/apt/apt/0001-strutl.cc-the-filename-can-t-be-longer-than-255.patch
> new file mode 100644
> index 0000000000..c88efa3aae
> --- /dev/null
> +++ b/meta/recipes-devtools/apt/apt/0001-strutl.cc-the-filename-can-t-be-longer-than-255.patch
> @@ -0,0 +1,40 @@
> +From 918295aa1320718d342116f76c98d2289d377800 Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Tue, 18 Jun 2024 10:32:55 +0800
> +Subject: [PATCH] strutl.cc: the filename can't be longer than 255
> +
> +The URItoFileName translates the path into the filename, but the
> +filename can't be longer than 255 according to
> +/usr/include/linux/limits.h.
> +
> +Truncate it when it is longer than 240 (leave some spaces for
> +".Packages" and "._Release" suffix)
> +
> +Upstream-Status: Submitted [submit@bugs.debian.org]

Was this submitted just now, or is the status from the original patch?

In any case, we need to trace the submissions, so please include a
link to the bug page if there is one, or (better) re-submit as a pull
request:
https://salsa.debian.org/apt-team/apt

Alex

