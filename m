Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D45ABE77188
	for <webhook@archiver.kernel.org>; Fri,  3 Jan 2025 11:03:35 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web11.28113.1735902207376999207
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jan 2025 03:03:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NY/15Fh6;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6dd049b5428so102030066d6.2
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 03:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735902206; x=1736507006; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7SuY4tsmSjS/KrzchhQpc10WgKNoLo3jDNj7blft0og=;
        b=NY/15Fh6I6ELmt7RHVLX7onGm67fpw9ET/QdJFuUayC0M/t1WtG6TEU6yq6s2yggWU
         OE6HXShXOkXn8uEapySJ7BJbv/PV9EgLLXKwOcildOcfuI7+Bpucx4YopKrMBYPJ0Fty
         XrcnioDvX7fhau8eB2uc45RWRgInklBUBvahXYxXfkLBxcVMcbEXsUmNHm8mvU7ebHte
         /cJuRDRUm6wuSByXqQbjxmaSY68bmeekAOlQS+azH93g1pyn+ZrP8l+zYMLlZicttwAB
         SkDt50092N1FGRH5vXaYwzOb4MUsD1b1znZRMXWn1hnyAvC+3VFJ8TPiFxzO2maCkiZu
         /AdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735902206; x=1736507006;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7SuY4tsmSjS/KrzchhQpc10WgKNoLo3jDNj7blft0og=;
        b=r/NL+C606IbEhnLru+3mGnkZuod4PIqey1GuCDjsd2eRORwWSmawXVoVRbufTSOPP6
         XvUmx2COHeMiVxZOPS7Bo8Amoqb1J5JxvnPwbhe9jzQpr2UJwhSOyhUfcQPfIu3P/TdG
         4WyX0ixPuSiBOC8Q/BktjI6iNTpwfitiHZTMtE3C50cpl3H5T8nwssr/Nak5EZUv50i3
         WgvMsEVqHDJeX0XiBnCGpPoZIN2y/Rat+5wcmOxmtGTv6c1L7MJGF6xQMxDlsCKAPgnU
         Tu7lNxiSfVbQ80nBoWOAqyWM+XVEgnaVyzJal8y8ODlT0KOoPGKD0h4QMILmYUVsVcbD
         Z50w==
X-Gm-Message-State: AOJu0YxHl1vWvPyu3vqCBTzBl5b9INJ8oX1W7naZgRWTB3K5W806nu8O
	ckhkZZapE81ZrSFd5jSZok9SWqPynr8A6JOeJyup60dXONx9CW70+KWa//UvTnGQV9hxM0vcZq/
	b56VZKLa+8+50M82kzrsFoNahkpk=
X-Gm-Gg: ASbGncsJq+w3v5ezt9g5M3Na3dKbwpqhVnkAsXb/UY3u2kGRRFwDZprD1rkqd72e/8y
	47Gy3NjdVJsJWA0NCj4U7HvL1ij/uJu4MoV0r3bnJDL0GrdTPs73/ynhAmav7f6CyT7pUP8jh
X-Google-Smtp-Source: AGHT+IFqzsELE6IcQvMrgEaKip5E8IYB8KpdtC/7xoIKViRVQSiZKYONCnLkfzP5rqP+YDTNQI9gso5QpZjvtUDzJPc=
X-Received: by 2002:a05:6214:518c:b0:6d8:a39e:32a4 with SMTP id
 6a1803df08f44-6dd2334bfd9mr679151996d6.25.1735902206476; Fri, 03 Jan 2025
 03:03:26 -0800 (PST)
MIME-Version: 1.0
References: <20250103104903.2946151-1-sanakazi720@gmail.com>
In-Reply-To: <20250103104903.2946151-1-sanakazi720@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 3 Jan 2025 12:03:14 +0100
Message-ID: <CANNYZj943J4+pPGYCee57FszCwT9_otyu1fzAwcqXoHbGBz5uw@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] libpng: Add ptest for libpng
To: sanakazi720@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 11:03:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209345

On Fri, 3 Jan 2025 at 11:49, Sana Kazi via lists.openembedded.org
<sanakazi720=gmail.com@lists.openembedded.org> wrote:

> libpng is a platform-independent library which
> supports all PNG features.
> This ptest executes the below binaries, parses
> the png image and prints the image features.
>
> 1. pngfix - provides information about PNG image
> copyrights details.
>
> 2. pngtest - tests, optimizes and optionally fixes
> the zlib header in PNG files.
>
> 3. pngstest - verifies the integrity of PNG image by
> dumping chunk level information.
>
> 4. timepng - provides details about PNG image chunks.

Thanks for working in this. There are more tests provided by libpng,
why only these four are picked? E.g. in Makefile.am:

if ENABLE_TESTS
check_PROGRAMS= pngtest pngunknown pngstest pngvalid pngimage pngcp
if HAVE_CLOCK_GETTIME
check_PROGRAMS += timepng

> +#!/bin/sh
> +
> +set -eux
> +
> +./pngfix pngtest.png &> log.txt  2>&1
> +
> +if grep -i "OK" log.txt 2>&1 ; then
> +   echo "PASS: pngfix passed"
> +else
> +   echo "FAIL: pngfix failed"
> +fi
> +rm -f log.txt
> +
> +./pngtest pngtest.png &> log.txt 2>&1
> +
> +if grep -i "PASS" log.txt 2>&1 ; then
> +   echo "PASS: pngtest passed"
> +else
> +   echo "FAIL: pngtest failed"
> +fi
> +rm -f log.txt
> +
> +for i in pngstest timepng; do
> +    if "./${i}" pngtest.png 2>&1; then
> +        echo "PASS: $i"
> +    else
> +        echo "FAIL: $i"
> +    fi
> +done

There are several problems here:
- hardcoding the list of test executables is prone to getting out of
date as libpng is updated to newer versions. As pointed above, it is
already incomplete.
- checking the logs for things like 'OK' is prone to incorrect test
results if the test prints OK somewhere unrelated. The correct thing
to do is to check the return code.
- removing the logs makes investigating failures more difficult

All of the above issues can be addressed by installing Makefile from
${B} and running 'make check' from run-ptest. We do this in several
other ptests.

Alex

