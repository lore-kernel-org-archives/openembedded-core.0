Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 867E4C2D0CD
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 05:21:13 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web11.4137.1747804865204044071
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 22:21:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OsO0thTZ;
 spf=pass (domain: gmail.com, ip: 209.85.210.54, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-730580b0de8so4503310a34.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 22:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747804864; x=1748409664; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JCNRLnU20Q3sqLci3f54CsC2tAepEayIjGTt9Wabnps=;
        b=OsO0thTZtHZhqAr04A6Ln+Jr4m2jppkxpmEaArZWlq7kIrj/+aiImqOeB1JDc9kNo9
         TCEVy1HK6RKVOtfKJJt6K361918fkn4Oth9So99nMJbqkcwJXmSG3joKUn6tTDzkKOPh
         RtnOQMV33Och/K3l9VLsBiF7mvZ4aliC1oN2cZAGwLX3bBpDkAwTSE6uWDYH5meh+Jce
         zuPK5LvfS9zBvIqfefvTLBJeNHEgrYQ3MCsI0/Rq+rDXrxw8ALzNiK8BijGwsbC8x7rA
         fIArc+T16G6IxffMoxlXo2I8BYU/w0NxZS084e+RhtmOU5kZiLZax55v4KhoYKazHInN
         thsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747804864; x=1748409664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JCNRLnU20Q3sqLci3f54CsC2tAepEayIjGTt9Wabnps=;
        b=wsm8BfuhRcNvv0Ub6I1Fite5ay+lO292+FIS/ACu3anug8LYdEq0beMsVVkLDCYN3l
         5tIfpoyqNaiOa7Vu2WQIdSI7x3PaGlxillYkcYK1lVZR0hERAXs5zh1npvGBQrhxyEWn
         hIl9jMPUhN9ZfwzJ0T/V/y0DJB3fFMRiIECnx/c9ewz3RRc5M1u5qQiRwzmT6w7c2Ljn
         Y5vlYctOxfX+YAaE9rph5JDO6woQtat+BSlzr1Aio0hy3SIB+Oa48gGC6rnJ+Hg49i4w
         fppBuqWq0IP54Tq4GQAEjd3NEEw0rZptGlQ8aGok0vU2TU9RdEZ0J4UclxXv6fHs6Ldg
         Qh7Q==
X-Gm-Message-State: AOJu0YxKyKyOtLXmfaSpCaLRC13qh5S82Ae4+XthlTKs2uZahUsdI0cK
	u77gXxmSjuZc4iDZTmgnAZq4hR8f6xWnS97Y+nbCyaOFIq/eu6dqhGEIVJwYfUtbK9oKzBs3fTN
	swisIciR2qPZLQRNWyt4TxZ71fHi2aBA=
X-Gm-Gg: ASbGnct3ZUFY0I8MbnnA2kAM6U+A3DR4P9k3oeP2fg5CPruoXOjDVRvkPuX7AtJm6Yz
	qDHGZdZv+8LnBa4iR3iq37WenWUw+rUONM58YTMJYdrli0D11L0yESqz5MbT/WI2Qo2thykaM5z
	EQWZfdchb7xRm1u/VFLpPdE97eJcdgf+fg
X-Google-Smtp-Source: AGHT+IFCm/vINZwGejlw10kgj8Wg295Xo+UO0a4U+Tr9/1VfV3QC4YNQnu3ceCiyjDxNCN+41U2EVwTQGmKrHB/6FZo=
X-Received: by 2002:a05:6871:a105:b0:2d4:dc79:b92 with SMTP id
 586e51a60fabf-2e3c28013camr11520559fac.6.1747804863989; Tue, 20 May 2025
 22:21:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250521045414.449621-1-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20250521045414.449621-1-Deepesh.Varatharajan@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 May 2025 22:20:37 -0700
X-Gm-Features: AX0GCFtQ2BplFTydEISGXXWv-Brym72VUaE_P96aEUlUTL3x2KO3OgZcBt3TYac
Message-ID: <CAMKF1srLE0sOdqi4+ox7LRnm4v4UB_dJBe=TLqP-=+WQCffJsg@mail.gmail.com>
Subject: Re: [OE-core] [walnascar][PATCH] binutils: Fix CVE-2025-1178
To: deepesh.varatharajan@windriver.com
Cc: openembedded-core@lists.openembedded.org, 
	Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 05:21:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216966

LGTM

On Tue, May 20, 2025 at 9:54=E2=80=AFPM Varatharajan, Deepesh via
lists.openembedded.org
<deepesh.varatharajan=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> Prevent an abort in the bfd linker when attempting to
> generate dynamic relocs for a corrupt input file.
>
> PR 32638
>
> Backport a patch from upstream to fix CVE-2025-1178
> Upstream-Status: Backport from [https://sourceware.org/git/?p=3Dbinutils-=
gdb.git;a=3Dpatch;h=3D75086e9de1707281172cc77f178e7949a4414ed0]
>
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---
>  .../binutils/binutils-2.44.inc                |  1 +
>  .../binutils/0015-CVE-2025-1178.patch         | 33 +++++++++++++++++++
>  2 files changed, 34 insertions(+)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/0015-CVE-2025=
-1178.patch
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.44.inc b/meta/reci=
pes-devtools/binutils/binutils-2.44.inc
> index 7a19aa31d5..395549a624 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.44.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.44.inc
> @@ -35,5 +35,6 @@ SRC_URI =3D "\
>       file://0012-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.pa=
tch \
>       file://0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.pa=
tch \
>       file://0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.pa=
tch \
> +     file://0015-CVE-2025-1178.patch \
>  "
>  S  =3D "${WORKDIR}/git"
> diff --git a/meta/recipes-devtools/binutils/binutils/0015-CVE-2025-1178.p=
atch b/meta/recipes-devtools/binutils/binutils/0015-CVE-2025-1178.patch
> new file mode 100644
> index 0000000000..c39f43fba4
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/0015-CVE-2025-1178.patch
> @@ -0,0 +1,33 @@
> +From 75086e9de1707281172cc77f178e7949a4414ed0 Mon Sep 17 00:00:00 2001
> +From: Nick Clifton <nickc@redhat.com>
> +Date: Wed, 5 Feb 2025 13:26:51 +0000
> +Subject: [PATCH] Prevent an abort in the bfd linker when attempting to
> + generate dynamic relocs for a corrupt input file.
> +
> +PR 32638
> +
> +Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.=
git;a=3Dpatch;h=3D75086e9de1707281172cc77f178e7949a4414ed0]
> +CVE: CVE-2025-1178
> +
> +Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> +
> +diff --git a/bfd/elf64-x86-64.c b/bfd/elf64-x86-64.c
> +index cb32732e..a08e9c97 100644
> +--- a/bfd/elf64-x86-64.c
> ++++ b/bfd/elf64-x86-64.c
> +@@ -5031,6 +5031,15 @@ elf_x86_64_finish_dynamic_symbol (bfd *output_bfd=
,
> +
> +       if (generate_dynamic_reloc)
> +       {
> ++        /* If the relgot section has not been created, then
> ++           generate an error instead of a reloc.  cf PR 32638.  */
> ++        if (relgot =3D=3D NULL || relgot->size =3D=3D 0)
> ++          {
> ++            info->callbacks->einfo (_("%F%pB: Unable to generate dynami=
c relocs because a suitable section does not exist\n"),
> ++                                      output_bfd);
> ++            return false;
> ++          }
> ++
> +         if (relative_reloc_name !=3D NULL
> +             && htab->params->report_relative_reloc)
> +           _bfd_x86_elf_link_report_relative_reloc
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#216965): https://lists.openembedded.org/g/openembedde=
d-core/message/216965
> Mute This Topic: https://lists.openembedded.org/mt/113224477/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

