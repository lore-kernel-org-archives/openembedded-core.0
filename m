Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5605C83F1B
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 01:18:30 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web11.38561.1752715102475923842
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 18:18:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QiXUSe19;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-718389fb988so4187797b3.1
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 18:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752715101; x=1753319901; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9L4r0W27ivhyypke31+idTy43gvXnPvACssN2+fDLeI=;
        b=QiXUSe19SBvM66f0ZxIn0CxABIHkFH1KT3zk9U8T96PgKL88VY+Ogy5KboUExl53qG
         C8UFOypAjLAqFeR1CdmXzjJAv4F3a15D5p41rXOmFFj5pM9uGnkvoTWAK9EnjNNOFkXM
         oJ9Euq/BRqyP2vUI0r84o0M9uweBqftewWrpD1LAbD7BKYmzFtR4j2KFogU/Ko8fa7Iw
         e59J1Wwci+NP0No6lNcy6XxpSf0QqzR+nExPtHnDPSHq94MCOUoPxQJd9DIu19HgtSTE
         4aOXIjEV3J/chbyZtHWlvQwA+7fvG5JgORyUz6bewm+bn7i/eNNi54AiKv2w2IqtWH4c
         EP2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752715101; x=1753319901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9L4r0W27ivhyypke31+idTy43gvXnPvACssN2+fDLeI=;
        b=P7EXFjyeBs6D0nVtrptIrl7sgyFuj+gRJAaLOs3hvGrA8wJModjyYD6hoDUBQx4xNw
         wZDEtkS90ytayn39N3KXWeG0DQ1rpqumiHqC2Sev2LJL1jqWqwXoQOIJ10/QEjuL+jXB
         ZW2JvQHNnZ2D5Uml3eRzC+5wVAGBfuQ8bVmqXt105PAPW42BV8BikbB6b5H/4nRNLa2x
         16et5qVogK9MOK5aOGW2hFiP6FymAp21vlJlRluIytxLp2v2S/AP/uGLygN60BwaXKLa
         yttPrtrNQErv6qNQ/3BJVirGRaVrX+mu/XIy/O3jWmPMbpxz1e4AydxVKuod0tkkbFz2
         tsiQ==
X-Gm-Message-State: AOJu0YyjgSU+kV9LNdGH2LaoYZ0dQk/qNHNs/OwxSypg7JbY72swGaqd
	Olaxi/itOdeOxm+Qp+aZyn/ByYckjR7gh6lSOcBfpiMj1SqtOvV0szxto+ojfnwpkyo0M9moDbx
	Jha+dhLG8uURJoxygR4ta6npZJ8Tll2C8+viZ
X-Gm-Gg: ASbGncuZ+f5FCD5WEnYR812kcl2n0yZ6RGHd/ylaCJ0gjGkr8iB2OQ9xms5AaJkJMW1
	XRjkrf+E5oaId3ZOyvSK730iC6GgzEGa8ZETBI1N4kOGTk6B6tLN0irshPs+2CZJV1x2dxOWrIW
	uP4wWpp0r9RbmPd/owTiV6rvI4lrASb9sxMteSQqDUR3b0H7F+/gRaTbr0ysf/OlvekXt9BB6yW
	uX81Q==
X-Google-Smtp-Source: AGHT+IH1wlOGrvjLSQ2NJEe7N89Qe3anZAulLiLR325c8CsZvXrhdJc6djqRFnpqxgnBr1TEDuVWWYJvM6ZZQfGopm0=
X-Received: by 2002:a05:690c:6189:b0:716:5986:e4c7 with SMTP id
 00721157ae682-71834f7c367mr66007457b3.11.1752715101219; Wed, 16 Jul 2025
 18:18:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250716094153.1698390-1-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20250716094153.1698390-1-Deepesh.Varatharajan@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 Jul 2025 18:17:53 -0700
X-Gm-Features: Ac12FXw65OqWhNTlw23qMZeoza07TN2kaK0b4Jx6YTw-zw2r-z87f6_zwsZB3WQ
Message-ID: <CAMKF1sowfxadYdgGfXabmZeeqv=mFffXaudFpNunHksO+wTZkA@mail.gmail.com>
Subject: Re: [OE-core] [walnascar][PATCH 1/2] binutils: Fix CVE-2025-5245
To: deepesh.varatharajan@windriver.com
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 01:18:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220478

series LGTM

On Wed, Jul 16, 2025 at 2:42=E2=80=AFAM Varatharajan, Deepesh via
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
>  .../binutils/binutils-2.44.inc                |  1 +
>  .../binutils/0018-CVE-2025-5245.patch         | 38 +++++++++++++++++++
>  2 files changed, 39 insertions(+)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/0018-CVE-2025=
-5245.patch
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.44.inc b/meta/reci=
pes-devtools/binutils/binutils-2.44.inc
> index e5df62b14e..a37f0bd27a 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.44.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.44.inc
> @@ -42,5 +42,6 @@ SRC_URI =3D "\
>       file://0017-CVE-2025-1181-2.patch \
>       file://0016-CVE-2025-5244.patch \
>       file://0016-CVE-2025-3198.patch \
> +     file://0018-CVE-2025-5245.patch \
>  "
>  S  =3D "${WORKDIR}/git"
> diff --git a/meta/recipes-devtools/binutils/binutils/0018-CVE-2025-5245.p=
atch b/meta/recipes-devtools/binutils/binutils/0018-CVE-2025-5245.patch
> new file mode 100644
> index 0000000000..d4b7d55966
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/0018-CVE-2025-5245.patch
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
> +@@ -3097,9 +3094,9 @@ debug_type_samep (struct debug_handle *info, struc=
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
> View/Reply Online (#220441): https://lists.openembedded.org/g/openembedde=
d-core/message/220441
> Mute This Topic: https://lists.openembedded.org/mt/114182090/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

