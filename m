Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E37AC36002
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 16:38:44 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web10.13549.1744216721680566352
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Apr 2025 09:38:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=y1s9e/5Q;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.171, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e643f235a34so5184641276.1
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Apr 2025 09:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1744216721; x=1744821521; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vtrymjy0VLKh4cribdeVsT4aa31SJFc0gk7kEBA04z0=;
        b=y1s9e/5QBQB63dUjjSyeqAaAAOaD+NPBscc7LUNHydctK/ks+4nAbzA0aby87UYWew
         FWDgFXP0lMgMK0tIpZU80k9fA6e6raYbiTRFw10GYDGNwntEgyHwoEjjJGC4Ds7bzvnY
         2sLFd8//0UrYDOJV1tcLy1OPuRm32GCr2BnEhO4ospcgsPRabC+meGlvssdIRSW97Jxa
         mezsfH2OXvQyT3dMeWVfDNpn6dUo5YnyvR6nto0/tbMR8O0+2ckktej725XdSrfqP34l
         B1DbZ/Pa7nBXxaikbDD+l13w47Rkr4ILzd0RToTB9jTSENpUFnkkhNeFB/9V3zGCcfr5
         hc7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744216721; x=1744821521;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vtrymjy0VLKh4cribdeVsT4aa31SJFc0gk7kEBA04z0=;
        b=wrliQdRvG+olqB5WUkmhHFwYOyBIdONtqjoQuzotUoQXif3eWpq1jaTEFLi4JEsmuH
         99g81ORHZhftvfWe6xDMxQ2KOyNmVHT5JqnzutEFsbdN4SFKoAtg0JH5NI5MyDW4y7mB
         NpY2BvA1VaOFADsyo+atFHlFmtuN6R0vCTtvrhRksDHTSl1538PZt0ymbH+KPjhUbBIE
         ILV/xIt6PDiMqaV3pN4xaM/OHc1NaU33/b5oEyYT3hVgUksHI9n5v77+6kqVos4LXTrB
         HdBNlB//qP9GeiE8wmzjjqIpmQ6sqdDnsSXYi4/XJI+J6bGLhRvX4Um4E5id6bfvtELD
         EY1g==
X-Gm-Message-State: AOJu0Ywx3P0NI9WFzyZNfFTeAHh7pyqk3Ryi9QEXrfUSkwibfX68qS17
	7/fWsvUWF+MhQl5LenTxnWE+qp90uQLiKTDBDq0Zvd9pLPoSMWOpDmVZeEzqdAsL9ZxG1zbljcb
	WlJWFG7ISLOJ+vhGNvp6QwBY5sy1flD8LPCveYA==
X-Gm-Gg: ASbGncu+gL70bSvc/ne6/aqOcCO9WMdN1EshMZntyjAiiYZ8i0SxOADq8PYro+kshsY
	vWAnlPNrvMkiJ0Q6aPIEpL1vrtPyJmW8RWbMXliNfq/nht/AkzFz+1k6mc4iaImcCTIXL2SF4GQ
	x+Jd1/kX0AcsVVzRcG4ZlcUYtCsnR2iYmJO8GsVzWQe8y3G9REywAe
X-Google-Smtp-Source: AGHT+IGy2RhOSY/Z0HNWfIIS9KHGhuYyH6BLqJyFXh+XAZGlwjqsrvU722trvgAxvsGzbtqXBDxsLiA2P7VbSXJC1W4=
X-Received: by 2002:a05:6902:983:b0:e6d:f287:bf9 with SMTP id
 3f1490d57ef6-e702f5f168amr5395971276.22.1744216720699; Wed, 09 Apr 2025
 09:38:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250409125419.1432110-1-soumya.sambu@windriver.com>
In-Reply-To: <20250409125419.1432110-1-soumya.sambu@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 9 Apr 2025 09:38:29 -0700
X-Gm-Features: ATxdqUHk8bzWCJhQnkXb7L09Vcc0mrLls9oC7xeCGsNGFxQAzy8HdDuHH0XJdlw
Message-ID: <CAOSpxdZh-==Zezd-55bLNYAwHq2Q0YtkLtNXxeO-NcQgG3uS3w@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][PATCH 1/1] python3-jinja2: upgrade 3.1.4 -> 3.1.6
To: soumya.sambu@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Apr 2025 16:38:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214595

Unfortunately there were python3-jinja2 ptest errors in autobuilder testing=
:

AssertionError:
Failed ptests:
{'python3-jinja2': 'START: ptest-runner\n'
'2025-04-09T14:59\n'
'\n'
'ImportError while importing test module '
"'/usr/lib/python3-jinja2/ptest/tests/test_async.py'.\n"
'Hint: make sure your test modules/packages have valid '
'Python names.\n'
'Traceback:\n'
'../../python3.12/importlib/__init__.py:90: in '
'import_module\n'
' return _bootstrap._gcd_import(name[level:], package, '
'level)\n'
'tests/test_async.py:4: in <module>\n'
' import trio\n'
"E ModuleNotFoundError: No module named 'trio'\n"
'ERROR: tests/test_async.py:tests/test_async.py\n'
'\n'
'ImportError while importing test module '
"'/usr/lib/python3-jinja2/ptest/tests/test_async_filters.py'.\n"
'Hint: make sure your test modules/packages have valid '
'Python names.\n'
'Traceback:\n'
'../../python3.12/importlib/__init__.py:90: in '
'import_module\n'
' return _bootstrap._gcd_import(name[level:], package, '
'level)\n'
'tests/test_async_filters.py:6: in <module>\n'
' import trio\n'
"E ModuleNotFoundError: No module named 'trio'\n"
'ERROR: '
'tests/test_async_filters.py:tests/test_async_filters.py\n'
'=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D\n'
'Testsuite summary\n'
'# TOTAL: 2\n'
'# PASS: 0\n'
'# SKIP: 0\n'
'# XFAIL: 0\n'
'# FAIL: 0\n'
'# XPASS: 0\n'
'# ERROR: 2\n'
'\n'
'ERROR: Exit status is 2\n'
'DURATION: 2\n'}
ptests which had no test results:
['python3-jinja2']

Links to the builds:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/1289/ste=
ps/12/logs/stdio
https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/1289/ste=
ps/12/logs/stdio

Steve

On Wed, Apr 9, 2025 at 5:54=E2=80=AFAM Soumya via lists.openembedded.org
<soumya.sambu=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Soumya Sambu <soumya.sambu@windriver.com>
>
> Includes fix for - CVE-2024-56326, CVE-2025-27516, CVE-2024-56201
>
> Changelog:
> https://github.com/pallets/jinja/blob/3.1.6/CHANGES.rst
> https://github.com/pallets/jinja/blob/3.1.5/CHANGES.rst
>
> Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
> ---
>  .../python/{python3-jinja2_3.1.4.bb =3D> python3-jinja2_3.1.6.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/python/{python3-jinja2_3.1.4.bb =3D> python=
3-jinja2_3.1.6.bb} (91%)
>
> diff --git a/meta/recipes-devtools/python/python3-jinja2_3.1.4.bb b/meta/=
recipes-devtools/python/python3-jinja2_3.1.6.bb
> similarity index 91%
> rename from meta/recipes-devtools/python/python3-jinja2_3.1.4.bb
> rename to meta/recipes-devtools/python/python3-jinja2_3.1.6.bb
> index 2c02037011..4e185f4abd 100644
> --- a/meta/recipes-devtools/python/python3-jinja2_3.1.4.bb
> +++ b/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb
> @@ -4,7 +4,7 @@ HOMEPAGE =3D "https://pypi.org/project/Jinja2/"
>  LICENSE =3D "BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D5dc88300786f1c214c1e9827a=
5229462"
>
> -SRC_URI[sha256sum] =3D "4a3aee7acbbe7303aede8e9648d13b8bf88a429282aa6122=
a993f0ac800cb369"
> +SRC_URI[sha256sum] =3D "0137fb05990d35f1275a587e9aee6d56da821fc83491a0fb=
838183be43f66d6d"
>
>  PYPI_PACKAGE =3D "jinja2"
>
> --
> 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#214588): https://lists.openembedded.org/g/openembedde=
d-core/message/214588
> Mute This Topic: https://lists.openembedded.org/mt/112171235/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

