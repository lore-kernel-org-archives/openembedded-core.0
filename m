Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39934CCA470
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 19:56:27 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.28668.1759866985294044827
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Oct 2025 12:56:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RlKnjcSX;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b3ee18913c0so1056688566b.3
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 12:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759866984; x=1760471784; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RejGgBI9BDisd5bKuojAIbdyANjae7Ak9HnBV9754y8=;
        b=RlKnjcSXIWhitDTjuIAH9oCR8iZiaC2i3WjdqWhJNc9R933pqbUFfyhJ3i+kOc13gk
         fxWjg1u/SawHdET1RYWdpXTHze23I13pTNgUxoorCs2AwhBySuQMzM1o/c5fBSj5csS0
         FTzBin57Izv8xobJ1zi4PY9ugzU+jRQHKsUp4j2jhNd1AnD/auOYn8dIxle/13sSDOQz
         RG/OE/CMyvyT67O68VsQy4F5Ki/KarING8WNy3YGfyobRar0M/KfcefQ5fl+1pm20q34
         VICF+GgoLkio06/klAL8AWlIlOH6pKdsGS8OUzRLHuecBO5afHzSzXuNn+sEKOWywVCL
         SadA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759866984; x=1760471784;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RejGgBI9BDisd5bKuojAIbdyANjae7Ak9HnBV9754y8=;
        b=IP6t9phUXxxNAabcSPEbCENlq+xTr9w0dIbEa1dGBt5dc5sadRL8Odvur0Y/6Z6aP6
         QrbhT5xYqonm+AhLr6dSE1vPNyrLFDSGzCJqoT7Ra9P0Ik1fl9doESTXldQyy04k8hW3
         0ZOUswhbb3W7waEt9fzEdu4nZuQvwhr9mQ9uF1DxfNXswD2KloD/G7glQS3RqzYcCuQV
         zXWtdoaewJKovUX98AnsftJlMBF2Bxp4cL6mxljp7ROJVvqXyPJVYHWXLRpWaigEuNyy
         vK4cHknhs88/Waml3pQI4G3rxFIZ6n+bc6pYaeV3pgR10ElZbFfqBbPE5Zs4Al+ytsy0
         mNGw==
X-Forwarded-Encrypted: i=1; AJvYcCXP6FuUQ1kv5rIzPbgy4vztN/+wFgGt2qLg4Hdh6fCJbkTjX64nJAPhouGQ7Q4wstIL8IwHFXn7i5iLkKpgqR1PXQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwDsYK4S98tYWbBquwngTeXxjSC9k5YqSctOJsR6aGlDj+IER11
	sEy8u4dMW0a/8aQ4Z58tM5sQbnmCsXZO2vk9YolhT/a47E7a/1oR1woR
X-Gm-Gg: ASbGncvlg4tHX3ArbFw8KXzICI7LArww6kypfXD9XwCHNmYtMffKqJCbkNlKsYmXVXa
	c4E97zzZlZMFmYrK9wA3DG5CUlTO0Ubfv1+z9QO4fMGrvsEv3HNDD++IJC5ZcZpSmb6mAugBJhR
	Age7LVIRYXhmiTeHtjkWJQejRaA+pRBzY94dq+IDjM0HwFzImxp0fKcUb0GI0a5gkz1n+6KuY/N
	9kIGL+dZNMt1nj4MXtlYcpK7XZuMyg+dmIuTx9jpTSVNCIc2vawy5pM1LjmV/7bRNa0tbGZ4DmR
	bYWjwUMyUyVWdz1Du68iaMulR/b8suhiEtY4gIr+Sn4NS6iBc1eWweKCvjPHI9mTp/ihpBgoWsF
	aj0tYF/Zv2Sc07tB4K6s6OYjTIB8NO/xvYTlS//Ie9HOAcIYwiH40HfQ=
X-Google-Smtp-Source: AGHT+IEjWa9Jc+YG/FgtV0T3QnOQ/o384mkkWkC1MRC4r2VdNmlDgGeRA/YKBFX26HZ/LLW72NQwoQ==
X-Received: by 2002:a17:907:3daa:b0:b4a:d0cf:8748 with SMTP id a640c23a62f3a-b50a9a6d769mr107617266b.13.1759866983549;
        Tue, 07 Oct 2025 12:56:23 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652aa637sm1440830466b.12.2025.10.07.12.56.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 12:56:22 -0700 (PDT)
Message-ID: <424cb94c-6693-417a-add4-14aadb60d231@gmail.com>
Date: Tue, 7 Oct 2025 21:56:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v4] gawk: disable persistent memory allocator
 due to licensing
To: randy.macleod@windriver.com, openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, Liezhi.Yang@windriver.com,
 peter.kjellerstedt@axis.com, ross.burton@arm.com
References: <20251007190923.315257-1-Randy.MacLeod@windriver.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20251007190923.315257-1-Randy.MacLeod@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 19:56:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224552

On 10/7/25 21:09, Randy MacLeod via lists.openembedded.org wrote:
> From: Randy MacLeod <Randy.MacLeod@windriver.com>
>
> In gawk-5.2, a feature that allows gawk to preserve memory between runs:
>    https://www.gnu.org/software/gawk/manual/html_node/Persistent-Memory.html
> was added. The files that implement this, support/pma.[ch], are licensed
> under the AGPL3 which some entities perfer to avoid. Force people to knowingly
> opt into using this feature and license using:
>    PACKAGECONFIG:append:pn-gawk = " pma-if-64bit"
> where pma is an abbreviation for persistent memory allocator and the
> "-if-64bit" suffix is a indicator to users that the feature only works
> for 64 bit targets. Also add AGPL to LICENSE and LICENSE:${PN}, when using pma.
>
> Correct the license to be AGPL-3.0-or-later. There hasn't been a change in
> the license terms, at least for main.c, haven't changed significantly in
> the last 15 years:
>
> License-Update: Reflects conditional AGPL use and more as described above.
>
> Testing requires a non-root account and following the example in the link above:
>   $ truncate -s <size> data.pma
>   $ chmod 0600 data.pma
>   $ GAWK_PERSIST_FILE=data.pma gawk 'BEGIN { print ++i }'
>   1
>   $ GAWK_PERSIST_FILE=data.pma gawk 'BEGIN { print ++i }'
>   2
>   $ GAWK_PERSIST_FILE=data.pma gawk 'BEGIN { print ++i }'
>   3
>
> This works on qemu[x86-|arm|riscv]64 but not on qemu[arm|x86] where the
> --enable-pma is ignored because there is a requirement and build-time test
> for 8 byte void pointers in m4/pma.m4:
>   if test "$SKIP_PERSIST_MALLOC" = no && test $ac_cv_sizeof_void_p -eq 8
>
> Finally, remove an old comment about GPLv2, GPLv3 versions of gawk
> since this is no longer important as the GPLv2 version is not maintained.
>
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>  meta/recipes-extended/gawk/gawk_5.3.2.bb | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-extended/gawk/gawk_5.3.2.bb b/meta/recipes-extended/gawk/gawk_5.3.2.bb
> index 833fe78bf9..ffaef93e8a 100644
> --- a/meta/recipes-extended/gawk/gawk_5.3.2.bb
> +++ b/meta/recipes-extended/gawk/gawk_5.3.2.bb
> @@ -6,14 +6,21 @@ HOMEPAGE = "https://www.gnu.org/software/gawk/"
>  BUGTRACKER  = "bug-gawk@gnu.org"
>  SECTION = "console/utils"
>  
> -# gawk <= 3.1.5: GPL-2.0-only
> -# gawk >= 3.1.6: GPL-3.0-only
> -LICENSE = "GPL-3.0-only"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> +LICENSE = "GPL-3.0-or-later & AGPL-3.0-or-later"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
> +                    file://support/pma.c;md5=bb0026ee5e8b950e67d670dd2d60cc93;beginline=8;endline=19 \
> +                    file://support/pma.h;md5=bb0026ee5e8b950e67d670dd2d60cc93;beginline=8;endline=19"
> +
> +LICENSE:${PN} = "GPL-3.0-or-later"
> +LICENSE${PN}:append = " ${@bb.utils.contains('PACKAGECONFIG', 'pma-if-64bit', ' & AGPL-3.0-or-later', '', d)}"

Typo: missing colon between LICENSE and ${PN}

>  
>  PACKAGECONFIG ??= "readline mpfr"
>  PACKAGECONFIG[readline] = "--with-readline,--without-readline,readline"
>  PACKAGECONFIG[mpfr] = "--with-mpfr,--without-mpfr, mpfr"
> +# pma: persistent memory allocator:
> +# Disabled by default due to AGPL license.
> +# Note that PMA works only for 64-bit targets and is automatically disabled at configure time otherwise.
> +PACKAGECONFIG[pma-if-64bit] = "--enable-pma,--disable-pma, "
>  
>  SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
>             file://run-ptest \
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224551): https://lists.openembedded.org/g/openembedded-core/message/224551
> Mute This Topic: https://lists.openembedded.org/mt/115642245/6084445
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


