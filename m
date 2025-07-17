Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 953E4C83F1A
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 16:42:55 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web10.115.1752770572921855474
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jul 2025 09:42:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ihGPzh1q;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7183dae66b0so11656007b3.3
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 09:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752770572; x=1753375372; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L6/GnqFqwpExZb5U5J4Tu5qzCGcrER7VcnUg+/+2ctU=;
        b=ihGPzh1qOmzd2QI9oLZpPTjREEEkO2Ew/s2TNlUyjFt2h9aDbmGEF//m8+XLDHC/EC
         fdvsByD1XbTO+giqouD0tKHMSkwMIG6WOcGAao9oWdqE+Z26aA1MrsfFSopB3/5y/jlV
         WiqQD5QSoDtd4oXl1epnbT+98BxA63WbSMSDVEdtRFpyoj0+DLASd2ZS3M2h5SyreHWe
         lJNuP803Uhp4F+R5gg+naZ4RS42szNMtWCozDdVzXg/WpL187r6KIjP5GCjm05scGk24
         WMkaiLa0mazMfHxu7d362wUuPBw+ZGNkEAh1JOKlCB6kmELBAILgom6057jr3feiO+HB
         yySg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752770572; x=1753375372;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L6/GnqFqwpExZb5U5J4Tu5qzCGcrER7VcnUg+/+2ctU=;
        b=ey+Kx75bMS8xuNFBSoK+egatHQC2UTVrBvLdwIL5QoNZhPMpkZOf/NBe1Hvoh1B4w5
         pj67O5cEud3Fm2r5JzMbPXTOHVlW4sPgkap/Z71odqiZbmVXoYC9UGTME1PW9487LBYx
         k7hGVoSjGjJ9l7bfA580VGXRz30ISg6IufwJnHtr+4D555P1CB2d8P6OyhKk79H/uaX9
         XOiBvjpukSgSAbEWn49eoixIGzpjVxxjdDJRZacbStI5j96MG8bKbed6qmfvkEWGKWYw
         cYjEp3Qec1w2y6Ba86MngGTtNzYC8LRaWQ5oEULsMLaL0i9MjI6oLrK3TkaGZwnl8f7k
         kb9g==
X-Gm-Message-State: AOJu0YwVcYqyl+GLKR1J+MFvj7vJhiCdznDVkPQ32G44WKlks4gVxIpY
	aSzLyGMxWlRuKyQqMept73o9nTcHqjvag/ZmUme2NLK+Dp71pve35RlC19ahNZoj0VuN6pZpykx
	2iT/iAn2rxFEguqWFgvbseLwm1Ncq3hE=
X-Gm-Gg: ASbGnctYWszM95Ieu7YyYsPjplLoaUI84S22csodR//Ql9sMgbV4gVS5NpcLOlVySjS
	wUD+xPAPuS31iSWzzDGIEgdaCD/Ox0beXxP/NEFoBzdFu6mvczV6IlQxkUqL+CzW9ynu3h05mED
	ankPNdKKlQm/UasQ6WZuOtAMl+cmXudIJRkbfW5w8PL8n6TM/1f+UkFtXVcAEHMBw9TRsM+r8pi
	LJJEQ==
X-Google-Smtp-Source: AGHT+IGY9sc0CpvWaxWYI16r7HfR6tJLKlTdHMmyNgd8Q5AUXqD9+NVgDlCkFwyTzlCqAfiNwSdyWXHnDwSZLvIwqpQ=
X-Received: by 2002:a05:690c:6181:b0:718:38be:b3e4 with SMTP id
 00721157ae682-71838bebb4bmr95005067b3.40.1752770571629; Thu, 17 Jul 2025
 09:42:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250717120210.3061934-1-Yash.Shinde@windriver.com>
In-Reply-To: <20250717120210.3061934-1-Yash.Shinde@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 17 Jul 2025 09:42:25 -0700
X-Gm-Features: Ac12FXyZHfebJF24AnJCPaX2FuhwMaN1a92J-3Q2yYQWc6aS4d-kxgpF_z6YwZ0
Message-ID: <CAMKF1sr0FnUFiuhm4Abw-8J3hi9r2dUiYj9f9fArNFjw5anYiw@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] binutils: Fix CVE-2025-7546
To: Yash.Shinde@windriver.com
Cc: openembedded-core@lists.openembedded.org, steve@sakoman.com, 
	Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 16:42:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220551

LGTM

On Thu, Jul 17, 2025 at 5:02=E2=80=AFAM Yash Shinde via lists.openembedded.=
org
<Yash.Shinde=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Yash Shinde <Yash.Shinde@windriver.com>
>
> Report corrupted group section instead of trying to recover.
>
> CVE: CVE-2025-7546
> Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=3Dbinu=
tils-gdb.git;h=3D41461010eb7c79fee7a9d5f6209accdaac66cc6b]
> PR  33050 [https://sourceware.org/bugzilla/show_bug.cgi?id=3D33050]
>
> Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
> ---
>  .../binutils/binutils-2.38.inc                |  1 +
>  .../binutils/0043-CVE-2025-7546.patch         | 44 +++++++++++++++++++
>  2 files changed, 45 insertions(+)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/0043-CVE-2025=
-7546.patch
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/reci=
pes-devtools/binutils/binutils-2.38.inc
> index f1c29015bc..70176c791c 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.38.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
> @@ -78,5 +78,6 @@ SRC_URI =3D "\
>       file://0040-CVE-2025-1182.patch \
>       file://0041-CVE-2025-5244.patch \
>       file://0042-CVE-2025-5245.patch \
> +     file://0043-CVE-2025-7546.patch \
>  "
>  S  =3D "${WORKDIR}/git"
> diff --git a/meta/recipes-devtools/binutils/binutils/0043-CVE-2025-7546.p=
atch b/meta/recipes-devtools/binutils/binutils/0043-CVE-2025-7546.patch
> new file mode 100644
> index 0000000000..da4dc3fb39
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/0043-CVE-2025-7546.patch
> @@ -0,0 +1,44 @@
> +From 41461010eb7c79fee7a9d5f6209accdaac66cc6b Mon Sep 17 00:00:00 2001
> +From: "H.J. Lu" <hjl.tools@gmail.com>
> +Date: Sat, 21 Jun 2025 06:52:00 +0800
> +Subject: [PATCH] elf: Report corrupted group section
> +
> +Report corrupted group section instead of trying to recover.
> +
> +       PR binutils/33050
> +       * elf.c (bfd_elf_set_group_contents): Report corrupted group
> +       section.
> +
> +Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=3Dbin=
utils-gdb.git;h=3D41461010eb7c79fee7a9d5f6209accdaac66cc6b]
> +CVE: CVE-2025-7546
> +
> +Signed-off-by: H.J. Lu <hjl.tools@gmail.com>
> +Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
> +---
> + bfd/elf.c | 23 ++++++++++-------------
> + 1 file changed, 10 insertions(+), 13 deletions(-)
> +
> +diff --git a/bfd/elf.c b/bfd/elf.c
> +index 14ce15c7254..ee894eb05f2 100644
> +--- a/bfd/elf.c
> ++++ b/bfd/elf.c
> +@@ -3611,8 +3611,18 @@
> +       break;
> +     }
> +
> ++  /* We should always get here with loc =3D=3D sec->contents + 4.  Retu=
rn
> ++     an error for bogus SHT_GROUP sections.  */
> +   loc -=3D 4;
> +-  BFD_ASSERT (loc =3D=3D sec->contents);
> ++  if (loc !=3D sec->contents)
> ++    {
> ++     /* xgettext:c-format */
> ++      _bfd_error_handler (_("%pB: corrupted group section: `%pA'"),
> ++                         abfd, sec);
> ++      bfd_set_error (bfd_error_bad_value);
> ++      *failedptr =3D true;
> ++      return;
> ++    }
> +
> +   H_PUT_32 (abfd, sec->flags & SEC_LINK_ONCE ? GRP_COMDAT : 0, loc);
> + }
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#220535): https://lists.openembedded.org/g/openembedde=
d-core/message/220535
> Mute This Topic: https://lists.openembedded.org/mt/114201610/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

