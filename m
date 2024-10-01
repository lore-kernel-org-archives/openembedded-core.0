Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 480A8CEACD8
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 14:43:10 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web11.83594.1727793782085082970
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Oct 2024 07:43:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BtSYxRiM;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6dbb24ee34dso48878787b3.2
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 07:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727793781; x=1728398581; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v8yTZRIBejSp7nqxfLOGHfGjgEn4Nbi03QiLmzInFiQ=;
        b=BtSYxRiM0xap6qA8sw6NTUAP+U1q64hbvkDVBDvvIIX3aZ+8LbjZpKypjE6BMDdifq
         gTaeYV5EiXPb9X3feW6KwCjP+aZ60m9E+l/wWC5CQ1Bok/2dnaTcwfMi89Iobg1PkZv3
         U1pNz0BDmllMm4gzfFV6ZZN+G5JBoAaPpufoqlmuz99rVoiafA/uzifZgua+MFLMhWji
         TC8DwYXUp+6RBISQy68nQ50YbLs38+PRP9avMWCb6QvGqOWCbLRKUrNjS9W65ReIXr1p
         BYb9TzZyOphoaWYs5yJAVLnmSnDKNFH9FDXJhRBUyDTKprBUQGv+fKY+HqrSaf8VJbnR
         BrxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727793781; x=1728398581;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v8yTZRIBejSp7nqxfLOGHfGjgEn4Nbi03QiLmzInFiQ=;
        b=JGU9q9oNef+H8/+ZLNV5pX1ifkBhs5tAuon6f/hLm0CexI48mFA8niEWE6kgfo/Q5/
         vNyKw9cPiwwGtq9JBnOz2+Nm+L5oBUtsH2NfKD8JfLY38Kko3i2R9k1xS2fcSelz6JIH
         55DQkxfqBAsw9aUP4WY42oHCEZcn4YXXif+J5lCjbCYYmyxyiOx98fMt4/XlwR92Z7Z5
         celLIV/OsXsUYlms0uUcmjjvELaFxRXlvo9S498BL/Yu/EYspbT/QNh+WXBAafRskVbU
         yeZyOmT8GDPvGVrq89d4foNdT6SawlhB+FOCzAMQbHHfFzxjVdlnkcywK6d2cGrtgry0
         eNqg==
X-Gm-Message-State: AOJu0YxWi+k3s+YmGvywN6KJz8K61hresdk3C9imDNlNpVBr+MTa/ikZ
	/89c140E/aY1RUbMapwjNouZHqHAi3dDlr4ITf9Zh5GETVHjOl+LCmZMs1Tffoh3CaCFQl30d51
	QA/q7IrMorgx66U7Fhb4spdddSxmEoRhL
X-Google-Smtp-Source: AGHT+IFBzikRxT2obnjdx8qO1Npi5EO8POtT9mcxbPbg3abvCF6C69ePYaGfZ+aOj4Z7eCgP4Cxna0dl3k3GuQA+ZjY=
X-Received: by 2002:a05:690c:d8e:b0:6e2:1336:55d8 with SMTP id
 00721157ae682-6e24754a3camr126281427b3.10.1727793781100; Tue, 01 Oct 2024
 07:43:01 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1727069614.git.liezhi.yang@windriver.com> <73daecdd8298f7cc64730877148ea11b3f113bc4.1727069614.git.liezhi.yang@windriver.com>
In-Reply-To: <73daecdd8298f7cc64730877148ea11b3f113bc4.1727069614.git.liezhi.yang@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 1 Oct 2024 10:42:48 -0400
Message-ID: <CADkTA4MjcpmOqarUHz2UnNwHZZgRtEB7c18stuuggLb+deu_Ww@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] kernelsrc.bbclass: Move virtual/kernel:do_shared_workdir
 to do_configure
To: liezhi.yang@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 14:43:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205172

On Mon, Sep 23, 2024 at 1:34=E2=80=AFAM Robert Yang via lists.openembedded.=
org
<liezhi.yang=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Robert Yang <liezhi.yang@windriver.com>
>
> The do_shared_workdir populates build artifacts to
> work-shared/${MACHINE}/kernel-build-artifacts, which isn't useful for do_=
patch,
> make do_patch depend on it will make a lot of recipes compiling which mak=
es
> world's do_patch very slow, e.g.:
>
> Download sources locally:
> $ bitbake world --runall=3Dfetch
>
> * Before the patch:
> $ rm -fr sstate-cache/ tmp/; time bitbake world --runall=3Dpatch
> real    23m31.739s
> user    0m25.086s
> sys     0m4.630s
>
> * Now
> $ rm -fr sstate-cache/ tmp/; time bitbake world --runall=3Dpatch
> real    12m25.650s
> user    0m35.641s
> sys     0m5.699s

The motivation for why this is a priority should be included in
the commit message. It helps us decide if any issues this may
trigger are worth the risk.

I assume you are doing some sort of source archiving, or
licensing and all you care about is the patched source
for this, and not any potentially generated files from the
build(s) ?

See below for why I ask.

>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/classes-recipe/kernelsrc.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/kernelsrc.bbclass b/meta/classes-recipe/=
kernelsrc.bbclass
> index ecb02dc9edc..f23a1e6bff2 100644
> --- a/meta/classes-recipe/kernelsrc.bbclass
> +++ b/meta/classes-recipe/kernelsrc.bbclass
> @@ -7,8 +7,8 @@
>  S =3D "${STAGING_KERNEL_DIR}"
>  deltask do_fetch
>  deltask do_unpack
> -do_patch[depends] +=3D "virtual/kernel:do_shared_workdir"
>  do_patch[noexec] =3D "1"
> +do_configure[depends] +=3D "virtual/kernel:do_shared_workdir"

From what I can see (bitbake expansion and dependency experts
can feel free to correct the below):

There's already an issue with the KERNEL_VERSION / LOCAL_VERSION
variables, in that they depend on STAGING_KERNEL_BUILDDIR, which
is populated from the do_shared_workdir. We are moving that population
later / to a different task with this patch, so those variables are now goi=
ng to
be defined at a different point in the build. There's potential risk in tha=
t.

Looking at the routines get_kernel* that the variables are using, they
gracefully return None if the file doesn't exist, so the question is .. wou=
ld
an impacted user of the variables notice a potential issue ?

One wonders if they shouldn't just propagate the exception to the caller
so it could be dealt with, and harder to ignore.

So while it does speed up do_patch, there is a behaviour change in
when the variables are going to be valid/defined.

Bruce

>  do_package[depends] +=3D "virtual/kernel:do_populate_sysroot"
>  KERNEL_VERSION =3D "${@get_kernelversion_file("${STAGING_KERNEL_BUILDDIR=
}")}"
>  LOCAL_VERSION =3D "${@get_kernellocalversion_file("${STAGING_KERNEL_BUIL=
DDIR}")}"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#204794): https://lists.openembedded.org/g/openembedde=
d-core/message/204794
> Mute This Topic: https://lists.openembedded.org/mt/108603063/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

