Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82FD3106B53F
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 13:51:16 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22686.1774446671144873976
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 06:51:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=g9EWc/zY;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-486fda2a389so41961975e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 06:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774446669; x=1775051469; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UPg8CprPAgq8IMxehcBj3H9QBXhuHIppCqYGZy8Cj7w=;
        b=g9EWc/zYCh5HWvh41lp51ZVrnGT1sqJG/7bWthyJSXnPUtWqn4377zin2FISndA9eS
         pwYNQdHHPMZrR74idyYNrnliayWKhRaB8etBnYKxsWrA4BxAbHR6DKI3FpxRIjMLs8o8
         kvRKEsYKwTIfHmT7YgYA1YlPqANviNAAqiil2t+BS00DPL9ej4bX6VLH6x472V+o+vt1
         OGbjpR3VtCwVmCSao9bv6c2Gjjth9leaDAWEk/xaLl6o7mNoC+t6GcNIfXdI5Ub+wAT5
         qm1WKOrFDvz2/smTDyqYVtwF9QMNPi1nTR1yRKLPMLeDDgDFj8OaIrcdmxkTjBHB4IM1
         pUCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774446669; x=1775051469;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UPg8CprPAgq8IMxehcBj3H9QBXhuHIppCqYGZy8Cj7w=;
        b=VeBfJwFuh9JY1f4TvV5k8MxKcwPkHGfZxo9ABgn33AYsUAIwsFm+TVMFAuVW8ugMiE
         Xusrayd+XYFUz/mnAYd2+sfwJzeUy/DMDpxlaAfPA3VaA6dGCcVT4K6DUBYBP3ULdPY2
         SvKOPbxhI7smzNZ+wyqShM3wDWXzH7+ZyOl1xMx9yUy3Mcr7R+7YHL55q0jUpyRmkVeP
         BXQcajkIXZK4P7h1i1MI86+MB4vuoTIxSP8uLxGOFyxB/+cmIQhkddPBiOH12iGiM7J3
         3ogC8MZ7MdVCtbddwhNvNyV+bzrQEkfHhsQDbHpJt10W166krFvGbMc0cIBUgZXpGmpr
         yj9w==
X-Gm-Message-State: AOJu0Yx2GZTOno1aoOqBzr+fMShLu1O7NZVxb8G6ESVW33f3qCjm80Uc
	e/kYw/lYcDirRmNyI68evMicU6tWH2E+6qPZfT3OxmE5sukqYSXDCrxg
X-Gm-Gg: ATEYQzw0PwkLjjJ/oJQWdPOuVBEFGhl4P5M6bMQjBBUGwbPCNbiHVrC/RKXAxoVxry0
	XvZ1kQNk2ppYQpfkskHZ1oQZNq8I+UuGpcIbywe7ULAoDGvjGiM7hgZEXno/avaw7uyAruCkUYy
	mnk4CB3VenDclZmqQu8h1qThLkJFgrgj7bRjKvW8GRcbPgSghydQxxbl435cf0p0ZBl8E6gE8Qc
	TLo5tFJ6Pc+OM9QQ6wNdEeXKZYEQmHrNFvzTKCzPrqEvkhpUvDbvdluE7mobj0VRE3Pyh0nZnWk
	Y1CCCFUIgvIUxsaVKBTcLP2tOSZaIrZmr2Jy+9rl70yS4kAkK9VT/zbK5U3LNJg3Qd35OqNV0nr
	t2DgyMCcncJiWVRLePb21U9qdrSO1ZydFkwGM/tIHjYNzM86z5u78yrrw2epY7jL9aNgtSMin2K
	xFvwzXQNLiQCsUHvONrD3JEcCpwKGOLVoISDeLsh6EwzbbvLF0nnn/akwnJHehntAgSQ==
X-Received: by 2002:a05:600c:4e41:b0:483:703e:4ad9 with SMTP id 5b1f17b1804b1-4871605644fmr54127485e9.19.1774446669233;
        Wed, 25 Mar 2026 06:51:09 -0700 (PDT)
Received: from [192.168.2.122] (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48717373ef3sm19954935e9.26.2026.03.25.06.51.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 06:51:07 -0700 (PDT)
Message-ID: <2646923f-34d6-4cb5-9e9a-ac8ec789c359@gmail.com>
Date: Wed, 25 Mar 2026 14:51:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC][PATCH 00/14] Support Python freethreading
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 Bartosz Golaszewski <brgl@kernel.org>, Trevor Gamblin
 <tgamblin@baylibre.com>, Alexander Kanavin <alex.kanavin@gmail.com>
References: <20260325113112.1163632-1-zboszor@gmail.com>
 <CADkTA4OXFgvu2rsU8XTHQrDMj+6SUj1M5GG+9hzdtK3htHvzqw@mail.gmail.com>
 <5bc1065a-005c-4219-bc69-e191e6be3f78@gmail.com>
 <CADkTA4MOXYq1xQaGgGnREmgQUTQaEDTskv1aWRyM9zqiXxAuJA@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CADkTA4MOXYq1xQaGgGnREmgQUTQaEDTskv1aWRyM9zqiXxAuJA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 13:51:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233916

2026. 03. 25. 14:17 keltezéssel, Bruce Ashfield írta:
>
>
> On Wed, Mar 25, 2026 at 9:13 AM Böszörményi Zoltán <zboszor@gmail.com> wrote:
>
>     2026. 03. 25. 14:01 keltezéssel, Bruce Ashfield írta:
>     >
>     >
>     > On Wed, Mar 25, 2026 at 7:31 AM Zoltan Boszormenyi via lists.openembedded.org
>     <http://lists.openembedded.org>
>     > <http://lists.openembedded.org> <zboszor=gmail.com@lists.openembedded.org> wrote:
>     >
>     >     This patchset allows turning on Python freethreading by using
>     >     a new DISTRO_FEATURES setting:
>     >
>     >     DISTRO_FEATURES += "python_freethreading"
>     >
>     >     and optionally:
>     >
>     >     DISTRO_FEATURES_NATIVE += "python_freethreading"
>     >
>     >     The change to python3-dir.bbclass is crucial, as all python module
>     >     build helper classes rely on it.
>     >
>     >     I also added native variants of some settings because another
>     >     series against meta-openembedded is needed to complete this one.
>     >     In that, the change to the fontforge recipe relies on the native
>     >     setting for setting BUILD_LDFLAGS.
>     >
>     >
>     > Looking at those other patches in the series, they don't seem to
>     > be conditional on the distro feature.
>     >
>     > Are those changes valid for a build with and without freethreading ?
>
>     Yes!
>
>     The main change is in python3-dir.bbclass, and the recipe tweaks
>     are just adaptations to the fact that only ${PYTHON_DIR} is needed,
>     not ${PYTHON_DIR}${PYTHON_ABI} from that point.
>
>     I was thinking that the introductory mail stressed this enough.
>
>
> Obviously not :)

Obviously. :)

> I didn't get that impression at all from reading the introductory
> message or looking at the patches themselves.
>
> You have the overview knowledge of the feature, why it is
> useful, how it impacts existing recipes, how the migration would
> work, what is the compatibility, etc.

I think the Python 3.14 release notes has enough details.
See also https://www.phoronix.com/news/Python-3.14

With the two series I sent, only a single recipe is left (cmpi-bindings)
in openembedded-core and meta-openembedded that uses
the PYTHON_ABI setting explicitly.

Migration (of python scripts) should not be a problem.
If it worked with 3.14 as is, it works with freethreading enabled.

Compatibility is poor for a lot of modules, that clearly spell this out
in their pyproject.toml or PKG-INFO:

     "Programming Language :: Python :: Free Threading :: 1 - Unstable"

or something not quite production level support.
It's still experimental for 3rd party modules, despite being officially
supported for the interpreter and built-in modules in 3.14.

This is the reason this was an RFC series.

Anyway, the reason I was experimenting with this was that
with heavily threaded python code, an import storm can cause
a crash in 3.12.11 or the manually updated 3.13.12 in Yocto 5.3 in
importlib._bootstrap according to the backtrace.

I would like to see if Python 3.14 (with and without freethreading)
fixes such crashes.

> The patch reader doesn't, so that all needs to be clearly
> supplied.

Maybe next time for v2 after I have a complete image
successfully built with freethreading enabled.

>
> Bruce
>
>
>
>     FWIW, less than 30 recipes was spelling the latter out in
>     openembedded-core and meta-openembedded combined.
>
>     > That's the type of information, along with the benefits of enabling
>     > this would be information expected in a 0/N introductory patch.
>     >
>     > Cheers,
>     >
>     > Bruce
>     >
>     >
>     >     All of the changes included here were successfully build tested,
>     >     except for the gdb-cross-canadian change. That one failed, but
>     >     it's included for completeness.
>     >
>     >     Quite a few of python modules were build tested for native and
>     >     target builds, including python3-pytorch from my meta-python-ai
>     >     with reduced RDEPENDS because e.g. python3-onnx there failed
>     >     to build with freethreading enabled.
>     >
>     >     All in all, this series at least allows to get things going.
>     >     Though maybe not for Yocto 6.0, as it's quite late.
>     >
>     >     Best regards,
>     >     Zoltán Böszörményi
>     >
>     >     -=-=-=-=-=-=-=-=-=-=-=-
>     >     Links: You receive all messages sent to this group.
>     >     View/Reply Online (#233874):
>     > https://lists.openembedded.org/g/openembedded-core/message/233874
>     >     Mute This Topic: https://lists.openembedded.org/mt/118499141/1050810
>     >     Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     >     <mailto:openembedded-core%2Bowner@lists.openembedded.org
>     <mailto:openembedded-core%252Bowner@lists.openembedded.org>>
>     >     Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
>     >     [bruce.ashfield@gmail.com]
>     >     -=-=-=-=-=-=-=-=-=-=-=-
>     >
>     >
>     >
>     > --
>     > - Thou shalt not follow the NULL pointer, for chaos and madness await thee at its end
>     > - "Use the force Harry" - Gandalf, Star Trek II
>     >
>
>
>
> -- 
> - Thou shalt not follow the NULL pointer, for chaos and madness await thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>


