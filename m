Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E7C6C61CE7
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 17:31:05 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web10.978.1749231056137097052
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jun 2025 10:30:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=0HL4I5gC;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.177, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-70e64b430daso22653537b3.3
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 10:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749231055; x=1749835855; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R+buU0tcTOjRmiGqHk8VvQLM+mXVRFu0avGG+4k6Uls=;
        b=0HL4I5gCwgIRm8HZmuRdPa6aJQwLGykDpCBMZMKLM/Xv5LzdcLWHuTCLmaybrHeaou
         wyKFPtyZQ48xQXp6oVgDWoWNxuSAKE7yTf5AkoV6q+ySGF8XprhJCbZaItH38824ptHP
         arqKsO594o0wQqfbYW/w45PRvyQQUv4UfU3PN4Hip0cnK2v+WnIU/qQ/l21uwoN3g1wp
         N5D5CcyMerfTm+W2wNaiuj+HVmf//t0dve9lc9NrE1OynZcv2dnPNK37aKALfWMyScji
         EucZEe6iEtBSkCsNZ5CvwKFmeWk742/KU10qg7hAaIrMi5l9FzQM3PYICEDSrpP9wcOW
         B1sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749231055; x=1749835855;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R+buU0tcTOjRmiGqHk8VvQLM+mXVRFu0avGG+4k6Uls=;
        b=fkw4NZggozDOtKDgD3P82Gcn2+pNpcE+KzGPJe5kHt/fcCp/bRfbho/QIK4wpZWhiC
         trn2vgthryHXbSgIsn1tfQJIeLNsDDt9kE6CrQbhuWphWfmBdTZYQBinJIuSi4AGAYgQ
         8Z4HLnWQ5tFu+RYJbmZ9U396wqNcU/a/QCydHYdDakfBynOCTUAje8dmLJTN5SvSIa2K
         VSwzPRPARg5vIJk9zPr70tkUR5kyrGL/9YaWmvEu56lCRFvsTaTGjet7hv0SaYr/7YVz
         z8xAve1LdbiW6F4+hdZo3EPil5awoag5GzanoXPeTSZk7hSWtT8vZMjwXDvjcb6WsJnG
         UOqA==
X-Gm-Message-State: AOJu0YwGio4ce8pnGAp0wxLmAqMFOq9naAwWyeRSuocP1tEpvECVbGB/
	xllwziZuUY6gfVZiqT2Mib7YDP9mHtP++aw0apVpQJUnm4F8uNR6fJ527Hcn7EluryRYz0zinFZ
	TsDniwHP2fRVjXOzYmRJ1JtTY/0szo5ndh7/q/9fWNg==
X-Gm-Gg: ASbGncuT98NGOOhQmorFoO9FfgvCDlPITkOdzHSWMKlVSpF2kWCSeaXFk0RT6Jz791H
	U+Cv8Ggh7jynAb63bKWR/LAaQ1FNy1te5mTIHBqJGoRWH1pBxI2AmBRUQgESNlU0aQDWZ4G8PQo
	hADBPSovbe+ZBM4+8x8s2Cr5dnPCHw7J9M1sRF8KgigA2dVOYz7Sa2R+pKA26ehYaFJBNlAZwXQ
	6o=
X-Google-Smtp-Source: AGHT+IFUwSWatRhwCrtW7p31sBqDy+YQnaQeoLo3XrBaGf1usAC9Hp+Bp+DzODrbbGRXMS7jHJxDcoj2wWoxNY4+m3A=
X-Received: by 2002:a05:690c:6405:b0:70e:18c0:daba with SMTP id
 00721157ae682-710f7702170mr59183637b3.25.1749231055255; Fri, 06 Jun 2025
 10:30:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250605061344.2792436-1-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20250605061344.2792436-1-Deepesh.Varatharajan@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 6 Jun 2025 10:30:44 -0700
X-Gm-Features: AX0GCFuKw9bECh4yv3LzL-_6ubyS55ULS825sY8qz8qJoD19C90WcB7B5XtZzwQ
Message-ID: <CAOSpxdaomB2bZqTawmUz15FknOMpTEan-jSdiQaqEmV=jZ8LsQ@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] binutils: Fix CVE-2025-5245
To: deepesh.varatharajan@windriver.com
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 17:31:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218177

On Wed, Jun 4, 2025 at 11:13=E2=80=AFPM Varatharajan, Deepesh via
lists.openembedded.org
<deepesh.varatharajan=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> PR32829, SEGV on objdump function debug_type_samep
> u.kenum is always non-NULL, see debug_make_enum_type.
>
> Backport a patch from upstream to fix CVE-2025-5245
> Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.g=
it;a=3Dpatch;h=3D6c3458a8b7ee7d39f070c7b2350851cb2110c65a]
>
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---
>  .../binutils/binutils-2.38.inc                |  1 +
>  .../binutils/0041-CVE-2025-4245.patch         | 38 +++++++++++++++++++

A typo in the patch filename -- should be 5245, not 4245!

Also, please send V2 as a patch series along with your patch for CVE-2025-5=
244.

Thanks!

Steve

>  2 files changed, 39 insertions(+)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/0041-CVE-2025=
-4245.patch
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/reci=
pes-devtools/binutils/binutils-2.38.inc
> index 01fd03d2f4..d89d3eef19 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.38.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
> @@ -75,5 +75,6 @@ SRC_URI =3D "\
>       file://0038-CVE-2025-0840.patch \
>       file://0039-CVE-2025-1178.patch \
>       file://0040-CVE-2025-1180.patch \
> +     file://0041-CVE-2025-4245.patch \
>  "
>  S  =3D "${WORKDIR}/git"
> diff --git a/meta/recipes-devtools/binutils/binutils/0041-CVE-2025-4245.p=
atch b/meta/recipes-devtools/binutils/binutils/0041-CVE-2025-4245.patch
> new file mode 100644
> index 0000000000..2de6abbe93
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/0041-CVE-2025-4245.patch
> @@ -0,0 +1,38 @@
> +From: Alan Modra <amodra@gmail.com>
> +Date: Tue, 1 Apr 2025 22:36:54 +1030
> +
> +PR32829, SEGV on objdump function debug_type_samep
> +u.kenum is always non-NULL, see debug_make_enum_type.
> +
> +Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.=
git;a=3Dcommitdiff;h=3D6c3458a8b7ee7d39f070c7b2350851cb2110c65a]
> +CVE: CVE-2025-5245
> +
> +Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> +
> +diff --git a/binutils/debug.c b/binutils/debug.c
> +index dcc8ccde..465b18e7 100644
> +--- a/binutils/debug.c
> ++++ b/binutils/debug.c
> +@@ -2554,9 +2554,6 @@ debug_write_type (struct debug_handle *info,
> +     case DEBUG_KIND_UNION_CLASS:
> +       return debug_write_class_type (info, fns, fhandle, type, tag);
> +     case DEBUG_KIND_ENUM:
> +-      if (type->u.kenum =3D=3D NULL)
> +-      return (*fns->enum_type) (fhandle, tag, (const char **) NULL,
> +-                                (bfd_signed_vma *) NULL);
> +       return (*fns->enum_type) (fhandle, tag, type->u.kenum->names,
> +                               type->u.kenum->values);
> +     case DEBUG_KIND_POINTER:
> +@@ -3098,9 +3095,9 @@ debug_type_samep (struct debug_handle *info, struc=
t debug_type_s *t1,
> +       break;
> +
> +     case DEBUG_KIND_ENUM:
> +-      if (t1->u.kenum =3D=3D NULL)
> +-      ret =3D t2->u.kenum =3D=3D NULL;
> +-      else if (t2->u.kenum =3D=3D NULL)
> ++      if (t1->u.kenum->names =3D=3D NULL)
> ++      ret =3D t2->u.kenum->names =3D=3D NULL;
> ++      else if (t2->u.kenum->names =3D=3D NULL)
> +       ret =3D false;
> +       else
> +       {
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#217987): https://lists.openembedded.org/g/openembedde=
d-core/message/217987
> Mute This Topic: https://lists.openembedded.org/mt/113481072/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

