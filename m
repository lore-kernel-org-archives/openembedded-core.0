Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23545CCD184
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 16:42:58 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web11.943.1760460168817741098
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Oct 2025 09:42:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C00E+zNu;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-780fe73e337so66044067b3.1
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 09:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760460168; x=1761064968; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XaWGVrDdN3nGnBuPueGIYJeP6cZ8ZzBKgom02CSnuro=;
        b=C00E+zNuwfiEXitjmDS/fydH0/7/+NIQjbUkScFjjDHG87yMrj8dUS1rS9PcUmDhoq
         NUEVp17Sl+eXOJV+G/5pPJBpD9QOqCeo9KrRqaP2sB/PAf4YOJ4oGsYU/eP4CurSqnVN
         FEBr2wjFoFrDmqHjzGrcVMUZfxio7XEQib7oc0Y1VKqQcOOQ7WzKpLT4Wld2AHs1pYL6
         2xPAsZCXDQbI5VaWDLFliZy8788Wd+00YT5mTk3EFsocKZcvqGIH3xalKTpu7xI+lVfX
         /UgV7k5YDG4FHs9wl8k5n+b1b85SNZpXvjEk9cFSSwpBMnfUpm4BzSYyl90J0VohuGWm
         YxLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760460168; x=1761064968;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XaWGVrDdN3nGnBuPueGIYJeP6cZ8ZzBKgom02CSnuro=;
        b=tNtdbrwIflwNY6mdMjDw7NZQEEtJ3ZrfA4fgl38ArA20mlSEqlNxKQ//jukcmnq3AJ
         k+BgwhPYj+j3pcLkD7PaxKzQDef2f8yrRxIfIO1+TuaxHeIUe7lOiTZs1uOz80VwnRfi
         hlDO9UuImtqOZM4Icbt0bKgTOc47PSUn6kcvXQCg+qHdMsqtUWSEiU3J/dDLEM1Zhg9N
         HBvqofzss4WXGc5EbWFthlzX54uPgQWWXVC1MQWkXVyWQPG+A1+Aft9HRIIcVMGfaXXQ
         F+WiMz9wUsXn5yWLk/5JkEcoXwbSOwqSsLZ11B1DLypLflwytV27QRzfDjTE2en/WuwY
         rrkQ==
X-Gm-Message-State: AOJu0YwrV877cCVagZmRFh3zM14hu2Ul9xiAB3npt/I4utQhgQi9uCCT
	LUZotsPp+pnqHDLeKg8klP50nx6CUAYHCAhIPnABo2rZdqeU/mhkIZs2T6fqG8vD0LC4l0nhNZx
	INIcW0a9uE3YCuPRmZtF8f1PiS7M2UfE=
X-Gm-Gg: ASbGncvbQo8N1dKg3uyiTpD3OlR17eNYpsX+tY6AZjTTumviKqvackYr7IocpwGaF6A
	19pzzGETwiVFCz1Dv0mTzZDIZuDpu5r51HxDL+10/Dip46Ud0iFSSzjS2o/r4Bw9tpPU37enMez
	iJvNVcSx8emH46N69ut9sogY10K4/WnHSW3rQYdV7UqRx7i+qirmZvYGN8WYpsZx+EkI7zHBt4L
	1qN9zTCsRCJKTo47JxS1mF8n/fmgnGiJHXJiFrARph/zl6+G2iHtxMQjZGf7oiylysO
X-Google-Smtp-Source: AGHT+IFbPnWVt+QR0+Fp6d2PkaJeijPnL+jyu5U7FnAk3884NopfIr67apyBxq/08MikVxbE5q34dPPGPC1zDFgOWEo=
X-Received: by 2002:a05:690e:204e:b0:63c:f5a6:f2f3 with SMTP id
 956f58d0204a3-63cf5a70677mr8003145d50.69.1760460167895; Tue, 14 Oct 2025
 09:42:47 -0700 (PDT)
MIME-Version: 1.0
References: <20251014135247.6178-1-phanirajkiran.a@gmail.com>
In-Reply-To: <20251014135247.6178-1-phanirajkiran.a@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 14 Oct 2025 09:42:21 -0700
X-Gm-Features: AS18NWAGoiC-sJz-ra8jRxtvV6O5BEyh8k8S6IYepnEmXhxg5fWwv7kDJ8U8OS0
Message-ID: <CAMKF1sqipBZjYpmFA-sEmcoLL4MNbtxSrgs_itNHYaeB-2ztzQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] [scarthgap] musl: backport fix for
 CVE-2025-26519 to LTS branches
To: phanirajkiran.a@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Gunda Swetha <swetha12g@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 16:42:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224843

On Tue, Oct 14, 2025 at 9:13=E2=80=AFAM Mallapuram Phani raj kiran via
lists.openembedded.org
<phanirajkiran.a=3Dgmail.com@lists.openembedded.org> wrote:
>
> From: Mallapuram Phanirajkiran <phanirajkiran.a@gmail.com>
>
> Fixes [YOCTO #15932]
>
> The musl libc code in LTS (Scarthgap) is missing
> the fix addressing CVE-2025-26519.  This patch backports the upstream
> changes (or applies the required fix) so that LTS builds include it.
>
> Reference:
> https://nvd.nist.gov/vuln/detail/CVE-2025-26519
>
> (From OE-Core rev: 7af6b75221d5703ba5bf43c7cd9f1e7a2e0ed20b)
>
> Signed-off-by: Mallapuram Phani raj kiran <phanirajkiran.a@gmail.com>
> Signed-off-by: Gunda Swetha <swetha12g@gmail.com>
>
> Reported-by: Cristian Morales Vega
> ---
>  ...x-for-CVE-2025-26519-to-LTS-branches.patch | 50 +++++++++++++++++++
>  meta/recipes-core/musl/musl_git.bb            |  1 +
>  2 files changed, 51 insertions(+)
>  create mode 100644 meta/recipes-core/musl/musl/0001-musl-backport-fix-fo=
r-CVE-2025-26519-to-LTS-branches.patch
>
> diff --git a/meta/recipes-core/musl/musl/0001-musl-backport-fix-for-CVE-2=
025-26519-to-LTS-branches.patch b/meta/recipes-core/musl/musl/0001-musl-bac=
kport-fix-for-CVE-2025-26519-to-LTS-branches.patch
> new file mode 100644
> index 0000000000..3f0b14a5d0
> --- /dev/null
> +++ b/meta/recipes-core/musl/musl/0001-musl-backport-fix-for-CVE-2025-265=
19-to-LTS-branches.patch
> @@ -0,0 +1,50 @@
> +From 7ee0592397ea0e3d4b47018631642864864d443d Mon Sep 17 00:00:00 2001
> +From: Mallapuram Phanirajkiran <phanirajkiran.a@gmail.com>
> +Date: Tue, 14 Oct 2025 01:40:45 +0530
> +Subject: [PATCH] musl: backport fix for CVE-2025-26519 to LTS branches
> +
> +Fixes [YOCTO #15932]
> +
> +The musl libc code in LTS (Scarthgap) is missing
> +the fix addressing CVE-2025-26519.  This patch backports the upstream
> +changes (or applies the required fix) so that LTS builds include it.
> +
> +Reference:
> +https://nvd.nist.gov/vuln/detail/CVE-2025-26519
> +(From OE-Core rev: 7af6b75221d5703ba5bf43c7cd9f1e7a2e0ed20b)
> +
> +Signed-off-by: Mallapuram Phani raj kiran <phanirajkiran.a@gmail.com>
> +Signed-off-by: Gunda Swetha <swetha12g@gmail.com>
> +
> +Reported-by: Cristian Morales Vega

Please add Upstream-Status tag to this musl patch

> +---
> + src/locale/iconv.c | 6 +++++-
> + 1 file changed, 5 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/locale/iconv.c b/src/locale/iconv.c
> +index 3047c27b..0729465e 100644
> +--- a/src/locale/iconv.c
> ++++ b/src/locale/iconv.c
> +@@ -495,7 +495,7 @@ size_t iconv(iconv_t cd, char **restrict in, size_t =
*restrict inb, char **restri
> +                       if (c >=3D 93 || d >=3D 94) {
> +                               c +=3D (0xa1-0x81);
> +                               d +=3D 0xa1;
> +-                              if (c >=3D 93 || c>=3D0xc6-0x81 && d>0x52=
)
> ++                              if (c > 0xc6-0x81 || c>=3D0xc6-0x81 && d>=
0x52)
> +                                       goto ilseq;
> +                               if (d-'A'<26) d =3D d-'A';
> +                               else if (d-'a'<26) d =3D d-'a'+26;
> +@@ -538,6 +538,10 @@ size_t iconv(iconv_t cd, char **restrict in, size_t=
 *restrict inb, char **restri
> +                               if (*outb < k) goto toobig;
> +                               memcpy(*out, tmp, k);
> +                       } else k =3D wctomb_utf8(*out, c);
> ++                      /* This failure condition should be unreachable, =
but
> ++                       * is included to prevent decoder bugs from trans=
lating
> ++                       * into advancement outside the output buffer ran=
ge. */
> ++                      if (k>4) goto ilseq;
> +                       *out +=3D k;
> +                       *outb -=3D k;
> +                       break;
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/=
musl_git.bb
> index 324269a968..db6f5ce2de 100644
> --- a/meta/recipes-core/musl/musl_git.bb
> +++ b/meta/recipes-core/musl/musl_git.bb
> @@ -14,6 +14,7 @@ SRC_URI =3D "git://git.etalabs.net/git/musl;branch=3Dma=
ster;protocol=3Dhttps \
>             file://0001-Make-dynamic-linker-a-relative-symlink-to-libc.pa=
tch \
>             file://0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-t=
o-l.patch \
>             file://0003-elf.h-add-typedefs-for-Elf64_Relr-and-Elf32_Relr.=
patch \
> +           file://0001-musl-backport-fix-for-CVE-2025-26519-to-LTS-branc=
hes.patch \
>            "
>
>  S =3D "${WORKDIR}/git"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224839): https://lists.openembedded.org/g/openembedde=
d-core/message/224839
> Mute This Topic: https://lists.openembedded.org/mt/115755455/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

