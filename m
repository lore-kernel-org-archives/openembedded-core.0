Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64849CCD184
	for <webhook@archiver.kernel.org>; Sun, 12 Oct 2025 19:02:23 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.24682.1760295736086809851
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Oct 2025 12:02:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WWNEMz3B;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-46e42fa08e4so32012275e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Oct 2025 12:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760295734; x=1760900534; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WI3h1l4H8oQx63bPZETH1R5Qiq72B31Zc8mskV7b9uI=;
        b=WWNEMz3BB9iRhr+EXH3eBQMMcClj9YcW3vJr3NXyobf0WVJDEa04iklteG40gqFWDo
         WfTgK47BFuDpp2EH3HRik/7Rer/jMh2qQpupTD2TtTf964P8Qzk3mOsDHTWaUb1sioNH
         KXjSRKOarFGD7KlBl5enY2T4xpi05dcTsK5bnyZiC9R3ksJyI1pOhEfGPZVCJIkfZeX1
         yAfgZkcP7HfL9l0VA8rqqFmYrn3n22xWp1qkXhyXb8MH+XL1GL6ukir/FW7TwiJ8cfLK
         TAUEjZO4T8SDMxQylvpDtHYquG0GEH40YnRi82vTPbOXTY+BQ/uRiX68NTYyh2ufGNxw
         7ATA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760295734; x=1760900534;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WI3h1l4H8oQx63bPZETH1R5Qiq72B31Zc8mskV7b9uI=;
        b=auAKW2i2wZl1X7r+WkKGnv5IoUBk4aoJMm7CNH+GNkQPMi1Mr2Hr5mmIuF5A6HlugN
         DtZnbsIXBBTeIRRNWDraEOaq9SeQOrrIKHX8r6ha7cLNJ8nHuF4gU5np4eMmoOyiSj0q
         3Ury7JLWLD7jmZ1tCzrYWoyPue3xC/aK6b3qaGKWgqYsg+JqSs3M3C6VEJXMHIWDqwHl
         Mfr6x+m8LR0H550vrHNboZISwlYJESk8bP4Tcv0rCnjCej2p6x8ZOBm1zc+qc+D+0Z/O
         7gR0q+JQ8rvXKYBqQrQmfuUDEhKfI93WJN8jWeoRcSRZIlWYKdjQUa+fL2nx/mar/+Wf
         SStQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOfJANSV6qIRtDvRm5KeltAZSvt5PKXpiy+jNt9zeuow2O65hVNv7frF1Tm1DHXoC6EXMQnwCTMkNAEsZpYCVfPw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwZbe5NiZttRqEKUQ6Cjhz/bpRiS3W9rgeBLP3lKItvi7/zGtLO
	wclYtQWy4ZuKLPBr+Vsm6awuvMrI2eUdVKFFeedys9+F8U1eU+8Ow4EP
X-Gm-Gg: ASbGncvwF4kMKITeyCOeLDb18ANrVMipSfKkYLu4yUxw7T9X/Y3An3bh6lNK+qoT6mr
	0G+GFYg01rh8GV87HtqDr0rKx1ToOUGcirbE+qOVUHo+5HM7qk0gT0hFJtA5gYZ6rwx/3cfVjun
	J2uJEtjYNRiImyKaLzP6gj3T5n3TMcQwmN6iT3VbmLDrnEVlZJuI8Pq6UjNa6u8FFI9+n7zYwlW
	8/dngm9oggAkVtOrpyM277SpgS0u+sUjsuKLCFlqPDfC8VYDwcJWojTUWUkwxYirUvRu0kFl6N3
	jsyOK/qSxEKWDY6FSiH2ncMWWczke/pk592huufq7njjfzCLn8b/FffeWli+FuTI8veWxVOYhzt
	52B15W0nePGcaeLpJvRpkkA+cdkO/nnaOyMWbZxn0BbxaUDOx2bpH1rxkJqRe
X-Google-Smtp-Source: AGHT+IHLBY9QoVoBYgGrT4esgrtHKUgxGYu72HwXbUWw1Ap//f4kt6qn1hdachSz/uLRxYV4gsmw+Q==
X-Received: by 2002:a05:600c:8b5b:b0:46c:d6ed:2311 with SMTP id 5b1f17b1804b1-46fa9af2f4dmr129596085e9.19.1760295733688;
        Sun, 12 Oct 2025 12:02:13 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb492e6ddsm164708145e9.0.2025.10.12.12.02.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Oct 2025 12:02:13 -0700 (PDT)
Message-ID: <b4728274-d6cd-4fd8-b26b-ceef7811ffa0@gmail.com>
Date: Sun, 12 Oct 2025 21:02:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][scarthgap 00/18] Patch review
To: steve@sakoman.com, openembedded-core@lists.openembedded.org
References: <cover.1760064493.git.steve@sakoman.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <cover.1760064493.git.steve@sakoman.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Oct 2025 19:02:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224746

On 10/10/25 04:50, Steve Sakoman via lists.openembedded.org wrote:
> Please review this set of changes for scarthgap and have comments back by
> end of day Monday, October 13
>
> Passed a-full on autobuilder:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2553

This didn't pass... though I guess it's some infra problem?

> The following changes since commit 2696c50af9946f425ccaf7d0e7e0eb3fd87c36bb:
>
>   expect: fix native build with GCC 15 (2025-10-02 08:40:43 -0700)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
>   https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut
>
> Aleksandar Nikolic (1):
>   scripts/install-buildtools: Update to 5.0.12
>
> Archana Polampalli (1):
>   go: fix CVE-2025-47906
>
> Deepesh Varatharajan (1):
>   glibc: stable 2.39 branch updates
>
> Gyorgy Sarvari (1):
>   conf/bitbake.conf: use gnu mirror instead of main server
>
> Hitendra Prajapati (1):
>   grub2: mark CVE-2024-2312 as not applicable
>
> Peter Marko (10):
>   busybox: patch CVE-2025-46394
>   gstreamer1.0: ignore CVEs fixed in plugins
>   gstreamer1.0: ignore CVE-2025-2759
>   ghostscript: patch CVE-2025-59798
>   ghostscript: patch CVE-2025-59799
>   ghostscript: patch CVE-2025-59800
>   expat: follow-up for CVE-2024-8176
>   tiff: ignore 5 CVEs
>   ffmpeg: ignore 8 CVEs fixed in 6.1.1 and 6.1.3 releases
>   openssl: upgrade 3.2.4 -> 3.2.6
>
> Ross Burton (1):
>   pulseaudio: ignore CVE-2024-11586
>
> Steve Sakoman (2):
>   selftest/cases/meta_ide.py: use use gnu mirror instead of main server
>   oeqa/sdk/cases/buildcpio.py: use gnu mirror instead of main server
>
>  meta/conf/bitbake.conf                        |    2 +-
>  meta/lib/oeqa/sdk/cases/buildcpio.py          |    2 +-
>  meta/lib/oeqa/selftest/cases/meta_ide.py      |    2 +-
>  meta/recipes-bsp/grub/grub2.inc               |    1 +
>  .../openssl/openssl/CVE-2025-27587-1.patch    | 1918 -----------------
>  .../openssl/openssl/CVE-2025-27587-2.patch    |  129 --
>  .../{openssl_3.2.4.bb => openssl_3.2.6.bb}    |    4 +-
>  .../busybox/busybox/CVE-2025-46394-01.patch   |   57 +
>  .../busybox/busybox/CVE-2025-46394-02.patch   |   32 +
>  meta/recipes-core/busybox/busybox_1.36.1.bb   |    2 +
>  .../expat/expat/CVE-2024-8176-03.patch        |   35 +
>  .../expat/expat/CVE-2024-8176-04.patch        |  115 +
>  .../expat/expat/CVE-2024-8176-05.patch        |   78 +
>  meta/recipes-core/expat/expat_2.6.4.bb        |    3 +
>  meta/recipes-core/glibc/glibc-version.inc     |    4 +-
>  meta/recipes-devtools/go/go-1.22.12.inc       |    1 +
>  .../go/go/CVE-2025-47906.patch                |  183 ++
>  .../ghostscript/CVE-2025-59798.patch          |  134 ++
>  .../ghostscript/CVE-2025-59799.patch          |   41 +
>  .../ghostscript/CVE-2025-59800.patch          |   36 +
>  .../ghostscript/ghostscript_10.05.1.bb        |    3 +
>  .../recipes-multimedia/ffmpeg/ffmpeg_6.1.3.bb |    4 +
>  .../gstreamer/gstreamer1.0_1.22.12.bb         |   19 +-
>  meta/recipes-multimedia/libtiff/tiff_4.6.0.bb |    4 +
>  .../pulseaudio/pulseaudio.inc                 |    2 +
>  scripts/install-buildtools                    |    4 +-
>  26 files changed, 754 insertions(+), 2061 deletions(-)
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2025-27587-1.patch
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2025-27587-2.patch
>  rename meta/recipes-connectivity/openssl/{openssl_3.2.4.bb => openssl_3.2.6.bb} (98%)
>  create mode 100644 meta/recipes-core/busybox/busybox/CVE-2025-46394-01.patch
>  create mode 100644 meta/recipes-core/busybox/busybox/CVE-2025-46394-02.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2024-8176-03.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2024-8176-04.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2024-8176-05.patch
>  create mode 100644 meta/recipes-devtools/go/go/CVE-2025-47906.patch
>  create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2025-59798.patch
>  create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2025-59799.patch
>  create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2025-59800.patch
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224644): https://lists.openembedded.org/g/openembedded-core/message/224644
> Mute This Topic: https://lists.openembedded.org/mt/115683663/6084445
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


