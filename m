Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CA38C28B28
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 14:37:35 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.13553.1742308652249611772
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 07:37:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DNyjYBJi;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: jpewhacker@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30762598511so59631441fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 07:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742308650; x=1742913450; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aFnoCzpG+oT06PVfLAWXMJ8ObSbvT4KFZJMov/u9udw=;
        b=DNyjYBJimp4vuxzFxaiVI36ILMrQm5HGzIVmQrRXtvA1L9VC70bzRCQl78wBHUSxt1
         tJpYlOvNSDjkYC8mlOoLSKAjTL+v4JzZcSFBeUEoyjQ7Xxm/6rn7Y3v3FeW9OmHrxVQp
         X1pKumgpLmAb7eCW0sdG2aWmHyyAQNy8fVn8rOiSQLjCNZzxk8uQvTnn86URZVQw0UIC
         iz3YJQVfcgl61PXt9Ss6XP5+AEB6DyUNH+9JrP067Hpq822Aqv0AqDxpAHUrNfSoWyay
         2yIqPWa1zT+ixJ4IqAUjGrrdJ25ECKmD4GhBZq4lTAcAXMhxMURICy7ZVNxyv1c0dfST
         pVmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742308650; x=1742913450;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aFnoCzpG+oT06PVfLAWXMJ8ObSbvT4KFZJMov/u9udw=;
        b=mrHzefcHnwZKCazy8ZpGCRIuqqvqCMieKgIgWC2qYSvr+hg5a0efiUOxPYE5m5U3kU
         B/UVYbT70q9LP0tLsdOimrAQ84oMWYbtaxVXiZVXAmhLxm6uMhi/nDpJ3y3vkFQn3KI9
         84T4yjAV0dsBj13jHV/eycLVPWKaIX9BUNIT3Ta2hEHNyrv5iHcFeVHXEVNvcwJsENY8
         ujNADV5+uF5YDOTVo9qZmCnZGsYZVPYSjiytxtSh9DxbpoOesMJ+q9wysyPTV7fm7rtc
         /fXJhmA8LQ/gisXV5ypZwOSbCAvI/iOV5Kl6lQ53vHKf+rb6WAiJ2Aas0YlL6ite4r33
         85Lg==
X-Gm-Message-State: AOJu0Yx8G/9q0nXvnzj2roq3RbaRmt2PvNbljXjTg74EdwWnv9rSLhQ1
	ovogRVJVkmyU+8VukMS0lGik7pXdaKaxNorZtHHiY38q2FpK/mVD2qdRPfSELd2iUrj7GyTiObU
	hWBpuCfsMF22lstj+KeFnIzF1IKqJtw==
X-Gm-Gg: ASbGncsoY4FMzUNJijvWzU/35GMJV2N2CGxo4AILsXzYuCfuHtkbTdCqGQ2Jd4okIt5
	ODb02KbqidtUfU9sGbW9KRGbEbBIRxgaCfwNfG+pfttMA1MZQzDmZ4FwmcytylvZM9Md13GbUhE
	aCikdbiNpK2wcwxrEE2EHQzTPBp5r92jpu7iIDmHHJ
X-Google-Smtp-Source: AGHT+IE9bCkp7CLg8XHAM3LATW8JeG3K+NbDbHbMDl22KqNuDjXMfihrUnWinEzOFSW5BRiNf/blzVSzJ++AnPvt4Mw=
X-Received: by 2002:a2e:b8cf:0:b0:30b:edfc:5d8a with SMTP id
 38308e7fff4ca-30c4a64f3f3mr122421081fa.0.1742308649979; Tue, 18 Mar 2025
 07:37:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250318113254.3556987-1-hongxu.jia@windriver.com>
In-Reply-To: <20250318113254.3556987-1-hongxu.jia@windriver.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 18 Mar 2025 08:37:17 -0600
X-Gm-Features: AQ5f1JoICZIjy-Fnp1Yus9-6uSgG3WCs94CGf9KNMgeNfXPuVH2qJt1g86xLsgY
Message-ID: <CAJdd5GZEKU+KNiD9kGPc0-VzMvHvsP3fJOa-_qqNep8_moQTPQ@mail.gmail.com>
Subject: Re: [PATCH] spdx30: test the existence of directory before walking
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 14:37:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213215

LGTM, Thanks

Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>

On Tue, Mar 18, 2025 at 5:32=E2=80=AFAM Hongxu Jia <hongxu.jia@windriver.co=
m> wrote:
>
> Due to commit [spdx30: Improve os.walk() handling][1] applied,
> it reported an error if walk directory failed
>
> While SPDX_INCLUDE_SOURCES =3D "1", if recipe does not provide sysroots,
> the walk in function add_package_files is broken
>
> $ echo 'SPDX_INCLUDE_SOURCES =3D "1"' >> conf/local.conf
> $ bitbake packagegroup-core-boot
> |DEBUG: Adding sysroot files to SPDX
> |ERROR: packagegroup-core-boot-1.0-r0 do_create_spdx: ERROR walking tmp/s=
ysroots-components/intel_x86_64/packagegroup-core-boot: [Errno 2]
> | No such file or directory: 'tmp/sysroots-components/intel_x86_64/packag=
egroup-core-boot'
>
> Test the existence of directory before walking
>
> [1] https://git.openembedded.org/openembedded-core/commit/?id=3D86b581e80=
637cd8136ce7a7e95db94d9553d2f60
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/lib/oe/spdx30_tasks.py | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> index 3d80f05612f..0618f2f139d 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -152,6 +152,10 @@ def add_package_files(
>      spdx_files =3D set()
>
>      file_counter =3D 1
> +    if not os.path.exists(topdir):
> +        bb.note(f"Skip {topdir}")
> +        return spdx_files
> +
>      for subdir, dirs, files in os.walk(topdir, onerror=3Dwalk_error):
>          dirs[:] =3D [d for d in dirs if d not in ignore_dirs]
>          if subdir =3D=3D str(topdir):
> --
> 2.34.1
>

