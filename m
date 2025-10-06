Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08298CCA470
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 16:59:20 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web10.743.1759769953106406748
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Oct 2025 09:59:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fHwPjBEn;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-72ce9790acdso56505097b3.0
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 09:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759769952; x=1760374752; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NcxUmXLurWup1h3sNDFLEsR9JbJNQKi/CrkchM/vDDs=;
        b=fHwPjBEnnLJY7Ba7PgzriISPpzQYp0NULBHhm/qt3SHJpx1Ao+U9frh1LSij+wyMJM
         l14yLpEQjd55o2ha5ltSg9de1EYz1CZb5MOccAhBA77td/jAcMpSgO4OCOMI5ZEW8k1n
         qQG0l06RHiV4kEt4hTGHFU2cbEJeRZNtnhLfFRadjlvkZd4HuUDPBsh93TgCRCJ8px20
         bpu1eKcKZw0IY7lMTgEBFGPaAyNYirf+Tddpr9Pl4P17KVioGgOuzvqecMm1+QUDkA7O
         lrwnQuS8T5RX6zu4ZLTqbSubzvy/RRSAkl+qZzrmF3uF7aMh7DDydO/TQbTz1iIFBrc+
         c1sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759769952; x=1760374752;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NcxUmXLurWup1h3sNDFLEsR9JbJNQKi/CrkchM/vDDs=;
        b=YWuT3gr9GzK8sYL7W2gbjn3Zmw6/+fhaUycPPbYiaX1d2/0FO+welj23pjYn+RmP6o
         HIdm7jOop5fvv2nWfAFNJ4L8/pFAjN3xQ/zfpUuPdgPCDFo78Uu6F3mrwEV+8XndslHR
         KHgidD/Iz9EeocXNSuwKAzFsbBuQ7ggy9msgNa1OPKXmyWX0CK27QKScqe4Bx1yzH9X5
         cfCNGzECFw47WrXZJMizVPq7XmRTnDN8GZ4evXvO6y2w8MTZDROVfm1V6Br5U0YzTEsQ
         AI08DvLC+0f816WSZ4rZUqYCntiSf1EFJWaUvXzW0CK+tmmCxIeCdepdWQJSz37OnnbI
         wC5w==
X-Gm-Message-State: AOJu0YwfGsQ95gMWG8yC4iYhgRQzDGPWJr4dySYjHtZfCEz4QWnLeU1V
	QzgR4/1l7CusNB3Nq8Wmq5Adt5UnDbCtZoXhJzdy/hCNTc66zGEZBesnkAm5V/OFtvwvVq1914D
	UA1Nl/rieOKZHsYwg0MSax1u+TgcND+djBO8z
X-Gm-Gg: ASbGncupBDT6f9Al3XZs+zrDNilCwd1lYGFdbW7MkzhR23x9LfdSM+FHYEYC220mvRN
	IawPSAxbX64ITz8oskAOAS1lIgWwvEV7NviwHDL0fJPMu2rGDZ1jbv5SBbNYN4MYf5Ksyytw9Fl
	aGOLJQ/hHqwm4lONo7X58jTHXwl411/Wm//fVcPG+kSWdjfgXQfo6v0UbtpiiyuU8KsOXLjFayf
	KexISmr28a67gsLGrCkxyeDbURwfPmW/fLaSe1mdXBXf9ZyBOlmcHjYoH85NlVQkJdpamvtjnW3
	F0j20Dsa15vazc3qxf097RdH6CH1SaWs0S6GsSRYgl6YKpO0HlDcO5AV8NzJkMxUlJ0UczTbA3l
	iV//knA==
X-Google-Smtp-Source: AGHT+IEgeWxB35+AP0PFRAk8JALOzkYdlpO7E7p+iZpqGmziycO2fSk62Xthgm6kSZB99NFPIHJ5+p2dv4J4LNoHXaM=
X-Received: by 2002:a05:690e:1a07:b0:615:14:8320 with SMTP id
 956f58d0204a3-63b9a0e0efemr10653015d50.34.1759769951961; Mon, 06 Oct 2025
 09:59:11 -0700 (PDT)
MIME-Version: 1.0
References: <20251006125127.2156281-1-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20251006125127.2156281-1-Deepesh.Varatharajan@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 6 Oct 2025 09:58:43 -0700
X-Gm-Features: AS18NWCVr3X6bBIA9cZ0zEpz0zC7Sgh5eDj3t4j8Jqi7GraJzueJocYWQuNZuNE
Message-ID: <CAMKF1spp0=HpeP3X=Cb5Ti-nzuDY7pgxFjC9dQ9gsHpowAecEA@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] glibc: stable 2.35 branch updates
To: deepesh.varatharajan@windriver.com
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 16:59:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224497

LGTM

On Mon, Oct 6, 2025 at 5:51=E2=80=AFAM Varatharajan, Deepesh via
lists.openembedded.org
<deepesh.varatharajan=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> git log --oneline a66bc3941ff298e474d5f02d0c3303401951141f..4e50046821f05=
ada5f14c76803845125ddb3ed7d
>
> 4e50046821 (HEAD, origin/release/2.35/master) x86-64: Add GLIBC_ABI_DT_X8=
6_64_PLT [BZ #33212]
> c97735cfde elf: Handle ld.so with LOAD segment gaps in _dl_find_object (b=
ug 31943)
> 96cc65a28a elf: Extract rtld_setup_phdr function from dl_main
> e3f04f64fa elf: Do not add a copy of _dl_find_object to libc.so
> bfae8bf49c arm: Use _dl_find_object on __gnu_Unwind_Find_exidx (BZ 31405)
>
> Testing Results:
>            Before     After   Diff
> PASS         4605      4609     +4
> XPASS           6         6      0
> FAIL          358       356     -2
> XFAIL          16        16      0
> UNRESOLVED      0         1     +1
> UNSUPPORTED   197       197      0
>
> Testcases changes
>
> testcase-name                              before           after
>
> elf/tst-link-map-contiguous-libc(new)        -               PASS
> elf/tst-link-map-contiguous-ldso(new)        -               FAIL
> elf/check-dt-x86-64-plt(new)                 -               UNRESOLVED
> misc/tst-tsearch                            FAIL             PASS
> posix/bug-regex24                           FAIL             PASS
> string/tst-cmp                              FAIL             PASS
>
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---
>  meta/recipes-core/glibc/glibc-version.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-cor=
e/glibc/glibc-version.inc
> index 0b06005b25..b9f5e8fb8f 100644
> --- a/meta/recipes-core/glibc/glibc-version.inc
> +++ b/meta/recipes-core/glibc/glibc-version.inc
> @@ -1,6 +1,6 @@
>  SRCBRANCH ?=3D "release/2.35/master"
>  PV =3D "2.35"
> -SRCREV_glibc ?=3D "a66bc3941ff298e474d5f02d0c3303401951141f"
> +SRCREV_glibc ?=3D "4e50046821f05ada5f14c76803845125ddb3ed7d"
>  SRCREV_localedef ?=3D "794da69788cbf9bf57b59a852f9f11307663fa87"
>
>  GLIBC_GIT_URI ?=3D "git://sourceware.org/git/glibc.git"
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224478): https://lists.openembedded.org/g/openembedde=
d-core/message/224478
> Mute This Topic: https://lists.openembedded.org/mt/115616204/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

