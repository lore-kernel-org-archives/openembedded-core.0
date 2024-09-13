Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8149FA3757
	for <webhook@archiver.kernel.org>; Fri, 13 Sep 2024 13:38:20 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web10.73678.1726234696175597416
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Sep 2024 06:38:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=E9cSbysf;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.175, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6dbc5db8a31so10909887b3.1
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Sep 2024 06:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1726234695; x=1726839495; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9qZyN29eCSh28NiFGqgHGdaO3N0HTjBAqtyjD5Hvalk=;
        b=E9cSbysfQjAaa6NmC9+DKFU/9tH1pepiAyGmTy4BhYbOg7og3ng/gWFeaJm6vVgz0R
         8FAwN4NzVDatOUE5Fx4YqT5dJDGBYXE09LTEHPu9dYtB3u+ttYxRjnlf1cYYK7gu4vVl
         WOO0jiTApqC1ibXnsPJJH58zxFHP/GDnklL6jTA3khup/lGnR+kasJhdCcACp3XQTr3a
         OsMeibY2DrpsCdzuXteM1oL80230IZScPpqCB6jPXl08weX+5zmCXjbLpNH6+sWfsfWC
         xfUSJGphL7fx/CsdmtyFGBHdE6s/Cb4uk5mrU6RwvtSGYeOOAa4TjUQYEfXSrYxqX6TC
         IsNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726234695; x=1726839495;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9qZyN29eCSh28NiFGqgHGdaO3N0HTjBAqtyjD5Hvalk=;
        b=OhCsq74SHu6s4FV9z4vUUuWLe191Ja69iX/CsNDz1fb6Jok80xXXLJrC8mpVfzyfDs
         u9dfiZIDlbK2Aku8Hjbeix4srlh7HSZewLk9WcL+CYHVopqc2g+S6Vx3ClJDjraAPRiu
         flR7qYYdSGvwWDccLeSnihG5y+xaiXB6vDiNYm8XNPJVj4N8OMt2Jo+EAQGaMWlqW1FW
         wqn79c3bHimpDiLfnmbJKoIyR0XNa8/LPqfn0/ovfYuv2S5JRuNiHJernECXy5k/cVMB
         i5q4fybK1OOyQ2Qkm+h+TQtILjdGZtuMAB4f1ZzVI5iOVnsWvO52glbIUg94m1vc01J2
         3OhQ==
X-Gm-Message-State: AOJu0YzTEWOvL16GJPSbLfIOqCzDuzUzZ0/65C1/h5I60Ovy61TJex9u
	T+uvio4G6y9THEJHlvVAH1vCSbWxs8fyaUW4LFRoOD7fDZsaBRvya2HTmx3GEpGgNeCGM6hClVZ
	e62DEYco/s0fH65Wy2Uy1XHuL+xOBnt5fjNV/vT8TKwx3vMaWiH8=
X-Google-Smtp-Source: AGHT+IF9ebpHxQd8x14L+hh+ktmYsbR/QdVxRjdYQco8ryF8NaywjUy0ZpM6ly69jQgkt8QxvSM+6Agqbe+6jYu3aB0=
X-Received: by 2002:a05:690c:b03:b0:6d6:5186:32b2 with SMTP id
 00721157ae682-6db9542f5e0mr99906597b3.21.1726234695229; Fri, 13 Sep 2024
 06:38:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240912064206.2502219-1-divya.chellam@windriver.com>
In-Reply-To: <20240912064206.2502219-1-divya.chellam@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 13 Sep 2024 06:38:04 -0700
Message-ID: <CAOSpxda_rHCmLxWEEDOV+F0wVkBFgFMpE88=T+SP=Br4mYN5Tg@mail.gmail.com>
Subject: Re: [oe-core][kirkstone][PATCH 1/1] python3: Upgrade 3.10.14 -> 3.10.15
To: Divya.Chellam@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Sep 2024 13:38:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204486

This fails at build time:

ERROR: python3-3.10.15-r0 do_patch: Applying patch
'CVE-2024-8088.patch' on target directory
'/home/steve/builds/poky-contrib-kirkstone/build/tmp/work/core2-64-poky-lin=
ux/python3/3.10.15-r0/Python-3.10.15'
CmdError('quilt --quiltrc
/home/steve/builds/poky-contrib-kirkstone/build/tmp/work/core2-64-poky-linu=
x/python3/3.10.15-r0/recipe-sysroot-native/etc/quiltrc
push', 0, 'stdout: Applying patch CVE-2024-8088.patch
patching file Lib/test/test_zipfile.py
Hunk #1 succeeded at 3331 with fuzz 2 (offset 51 lines).
patching file Lib/zipfile.py
Hunk #1 FAILED at 9.
Hunk #2 succeeded at 2188 (offset 6 lines).
1 out of 2 hunks FAILED -- rejects in file Lib/zipfile.py
Patch CVE-2024-8088.patch does not apply (enforce with -f)

stderr: ')
ERROR: Logfile of failure stored in:
/home/steve/builds/poky-contrib-kirkstone/build/tmp/work/core2-64-poky-linu=
x/python3/3.10.15-r0/temp/log.do_patch.1201652
ERROR: Task (/home/steve/builds/poky-contrib-kirkstone/meta/recipes-devtool=
s/python/python3_3.10.15.bb:do_patch)
failed with exit code '1'

You'll need to remove the CVE patches that are no longer required.
Please send a V2

Thanks,

Steve

On Wed, Sep 11, 2024 at 11:42=E2=80=AFPM dchellam via lists.openembedded.or=
g
<Divya.Chellam=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Divya Chellam <divya.chellam@windriver.com>
>
> Includes security fixes for CVE-2024-7592, CVE-2024-4032, CVE-2024-8088
> CVE-2024-6232, CVE-2024-6923 and other bug fixes.
>
> Release Notes:
> https://www.python.org/downloads/release/python-31015/
>
> Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
> ---
>  .../python/{python3_3.10.14.bb =3D> python3_3.10.15.bb}           | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/python/{python3_3.10.14.bb =3D> python3_3.1=
0.15.bb} (99%)
>
> diff --git a/meta/recipes-devtools/python/python3_3.10.14.bb b/meta/recip=
es-devtools/python/python3_3.10.15.bb
> similarity index 99%
> rename from meta/recipes-devtools/python/python3_3.10.14.bb
> rename to meta/recipes-devtools/python/python3_3.10.15.bb
> index 14ab3f6155..e3b4dad180 100644
> --- a/meta/recipes-devtools/python/python3_3.10.14.bb
> +++ b/meta/recipes-devtools/python/python3_3.10.15.bb
> @@ -45,7 +45,7 @@ SRC_URI:append:class-native =3D " \
>             file://12-distutils-prefix-is-inside-staging-area.patch \
>             file://0001-Don-t-search-system-for-headers-libraries.patch \
>             "
> -SRC_URI[sha256sum] =3D "9c50481faa8c2832329ba0fc8868d0a606a680fc4f60ec48=
d26ce8e076751fda"
> +SRC_URI[sha256sum] =3D "aab0950817735172601879872d937c1e4928a57c409ae023=
69ec3d91dccebe79"
>
>  # exclude pre-releases for both python 2.x and 3.x
>  UPSTREAM_CHECK_REGEX =3D "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
> --
> 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#204423): https://lists.openembedded.org/g/openembedde=
d-core/message/204423
> Mute This Topic: https://lists.openembedded.org/mt/108408659/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

