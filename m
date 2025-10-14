Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19D2DCCD184
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 19:41:59 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web10.5327.1760470917295273191
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Oct 2025 12:41:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=DmN+GaSL;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.174, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-743ba48eb71so4533277b3.1
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 12:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760470916; x=1761075716; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4lYQk/JNOltIDApKFYY3anLm5P0PeZWtyR4K8ZK0W6k=;
        b=DmN+GaSLHphSC+sVfbHROww6O5dHR3dINyXS9xXA4NVzSIjyqPLmvl+82f/YAFHdvD
         QtT5ujnAVP3NkJMReZDgUW/W13VQR6lIwVbdeOzPgY+19TbU5dRzjnJYWbsPvp18/GCc
         9Glf4xu7I4WUkMu2EScYoiWor582qy5hOOw8XyAj+dDMb473s2eNnljcJC+lHV9c8CLj
         P0VBDZkYprBBtbcBEo7bshYf1jn0eRndwz6tJiYIMJ6QuYcmaCucwt8k6fvwV+V273Ww
         31T/FaTtevH/kCpSPYDE/ttiNtvxyAAX0+JM2r05vfh9A3BCCpxk2MyzuZy0wmmNDL89
         WS4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760470916; x=1761075716;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4lYQk/JNOltIDApKFYY3anLm5P0PeZWtyR4K8ZK0W6k=;
        b=qpXSUMF376nCXRdvd26XREwjHXVGRzQqzXsXP5/jq3EQozUj6qgOf6DYSlD4udrAzQ
         Q5PGUgrUswB7cTsgZ+1NadoTpinhgaHUMyvYl9RUMUM21Kfl/B/o6BeFHggu2C6QjQO1
         nVoImykWCvdI6nQp+PRCz7duytwlUaiaFl+xZldAnwdjnkjV+GDdzXgcLnza2vr7qhps
         ft6x0s8nCzaX/MQ/UBq1SDjFHISBTq626fruyo7FFM+OwSvSMTPTW/f7vApokV4r7xIN
         CPqtXg0NGETeY0dQScreyFnVloxqPO2BpBSlnfvfJviUlVlanXskFZqO1mlKWXlLw+/h
         ly9g==
X-Gm-Message-State: AOJu0YwaTbe28NIXZXHgOnzwx0Yng2DPLIrQfBnAYaELRLM1/Fd6BxT4
	mmsm8AXSarL2WuMsuRHB9UuaHAB5fXffftjkl8OUsLYF15NyRh7D6fb2zd+KjxdSyBtNDjGmpwS
	3RYVcp/Y0/APiNz7+AFH1OVp2wkTSjmFMStPPoNVkNw==
X-Gm-Gg: ASbGnct1c0OYQKvkWUWXvtafcg826BW15ATCmefuFCI5FwCcaaiL+xAqfotqm44Tv9/
	KF2w8tj0dOqqcujP72u/KJXj0lfIt4O44gXxj65dKJncZ5lk9ydbWLy2BLrfTmL7KzLzNQLI/rx
	5RkbCf7wlV5L9oZrYdSUyJ0jpQ9n5boPTtrp9MHGsZ4nB4sWdWFYsz2wBHHmFoHoWemtwE943d8
	1WQrp421HSIKQLhINiqbIpbBe4EpnbIiXzlP+2vRDsCxtJPYKrP3FoMqg==
X-Google-Smtp-Source: AGHT+IFBQxpuyht2zFeGO0iOCEWt+9gPFJ7LebD1PCwmGHotzGMT1KYOEIM2SKruxUGKf/pF/CJcsvjFuKHWoVSZI8g=
X-Received: by 2002:a53:d001:0:b0:63b:a941:90c1 with SMTP id
 956f58d0204a3-63cbe106a57mr24631002d50.12.1760470916256; Tue, 14 Oct 2025
 12:41:56 -0700 (PDT)
MIME-Version: 1.0
References: <20251014135247.6178-1-phanirajkiran.a@gmail.com>
In-Reply-To: <20251014135247.6178-1-phanirajkiran.a@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 14 Oct 2025 12:41:45 -0700
X-Gm-Features: AS18NWANvEkqsklOf6tQ24QfDtO2v69v4xrZR0rhXFq4sQHJ6wmPJl36wUCydU8
Message-ID: <CAOSpxdbO=12trwL4bxjyqYmCc_1qqWCsLPib7DYrXQNTwVyu1A@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 19:41:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224851

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

Along with the other comments, please change the filename to just
CVE-2025-26519.patch

Thanks!

Steve

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
> Mute This Topic: https://lists.openembedded.org/mt/115755455/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

