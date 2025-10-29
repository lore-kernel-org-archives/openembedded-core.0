Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8188DCCF9E9
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 03:37:24 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web01.437.1761709042385459746
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Oct 2025 20:37:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Tgze2rYA;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-71d60157747so66513367b3.0
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 20:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761709041; x=1762313841; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r1NElYCJKSSxWIbtCGVDczhpY27MpEGODn++UVE1rhY=;
        b=Tgze2rYAJ4earcsSKEWYPY7G5ftGq3gNKpGXTmAzaMYGoevDBhdeqMs/PYOSPk4bdc
         4168qtAtlVf9HfVzVTdqWnzprWYZodnXI/RzwrYl6EHDdIEG8H6DE/i89o0gmwxOosiZ
         3UwTQWk5AtS04F2kM15QdOBvJa/1udhTf9NYQ3Ba1y1sTcVQd61r4oegqaJLd1RRXNzb
         OK4Z8LPZdvCEgDYcMtSoIyRu1YVoFGATtG+WxaBulwoeGKoqYUW+GzcAkkCmKxNqwzYO
         NLU4ESJgJZwXcSMttZxzXi8kj0dV3jNqu71fhJRapCrn3I3r5jkmLq29WiaLYEQ9DHb1
         WW1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761709041; x=1762313841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r1NElYCJKSSxWIbtCGVDczhpY27MpEGODn++UVE1rhY=;
        b=m7ISyfe04VMDd/7lHpXTrknnqOf9B0nVk1xh2nmt68oBXE4FG4SWEWMQ3WAJwglFhk
         MHTV4mUU7wLHD06/j3Fs6osllnqmkwOk+Nb7i6+UjXjnxIgL9b6+dz91SKBwj3ViHUv+
         u3SnKMVx8cgsLNFsNlA/WIuMgyk9Y6Ex5D/OtYl9mV8ytOoXb6yNzVdcJAuukLfmFYq6
         8RsWDuKyTvQUcGlubK3rtIZLNFQw3fSctAWO5ZwH35z7vkREBfVmyT9hbNxsPmJkdP/x
         4DZVVCDYX+Q+rF5Hq1TFf+rmsjfZhrZXPUQNJZGOjAWN2IFLwoGYQB+Ruvs+sQ1K4Ep/
         dWNw==
X-Gm-Message-State: AOJu0YxJgYJvVeCeyd62vaChRSaoGqm2Z28UZergxoAuiEwaaiW9YMqP
	8pNnr4xB12/gAiondoD0pdzS1djS9fjrEG1W+gSfW7/d9tpNhxXW6ElrN3Eoe2jBeUNHQW4A4Vb
	rMWs0e3045EbV1RYXvYVl0gbI1cCWg+5MmKNL
X-Gm-Gg: ASbGnctP/NSM3rJ+Vz6v+VLdKN0Nu5LoP1DdxTxi3COLvT3Ih3b76XDkDIuMlXTlztZ
	5Zo8GFbHqjldxcqo1/IcLJL5SnX3ehJttOR48r5aiMdmwxxngIbAFSAv89n+MC/AVweBByNriKB
	RSzabtiZdo5lINJmrLz2exPC/iqFjYcFd4h6bsz1rf/LKiXUJ/TgkCnvXeeFr84nnQrftjIwR2i
	od/qmBsshZMJHJFpkCQLdVNxwktNqNjkLi1BqsnICqisCH6C1TFtg5RGgIP3rE4WeSScYZHwxbQ
	KSF5eSYMI84GaMJl6KqY7AJLeEUxKwof2ZzNH48tkM/eIlRL
X-Google-Smtp-Source: AGHT+IH3i05g1zJnZbm6XNeDOlOnMfzBnN+4vIhoPhyKIXTM8WK0MjulgQ66izyb8djgHdxKjPLqCE6oGwNYwnPwfrI=
X-Received: by 2002:a05:690c:2c02:b0:785:e76e:59aa with SMTP id
 00721157ae682-78628f85800mr16111107b3.38.1761709041389; Tue, 28 Oct 2025
 20:37:21 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1761692326.git.steve@sakoman.com> <9b5bb098b542a43a7aa97cc376c358f0a38778e3.1761692326.git.steve@sakoman.com>
In-Reply-To: <9b5bb098b542a43a7aa97cc376c358f0a38778e3.1761692326.git.steve@sakoman.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 Oct 2025 20:36:55 -0700
X-Gm-Features: AWmQ_bkBBUr8Yaq76jmAXkFYtG5cPgWA6FqMojxzuIKnC2fEfyxCZxgRQGw0aM8
Message-ID: <CAMKF1sour-R+XNv0oFdSuJntAwkBFFTZMT14h-k_p=DGz9E7ug@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 2/4] binutils: fix CVE-2025-8225
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 03:37:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225430

this looks ok.

On Tue, Oct 28, 2025 at 7:54=E2=80=AFPM Steve Sakoman via
lists.openembedded.org <steve=3Dsakoman.com@lists.openembedded.org>
wrote:
>
> From: Yash Shinde <Yash.Shinde@windriver.com>
>
> CVE: CVE-2025-8225
>
> It is possible with fuzzed files to have num_debug_info_entries zero
> after allocating space for debug_information, leading to multiple
> allocations.
>
> * dwarf.c (process_debug_info): Don't test num_debug_info_entries
> to determine whether debug_information has been allocated,
> test alloc_num_debug_info_entries.
>
> Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.g=
it;a=3Dcommitdiff;h=3De51fdff7d2e538c0e5accdd65649ac68e6e0ddd4]
>
> Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  .../binutils/binutils-2.38.inc                |  1 +
>  .../binutils/0047-CVE-2025-8225.patch         | 47 +++++++++++++++++++
>  2 files changed, 48 insertions(+)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/0047-CVE-2025=
-8225.patch
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/reci=
pes-devtools/binutils/binutils-2.38.inc
> index 2444a304be..ade69881a1 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.38.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
> @@ -83,5 +83,6 @@ SRC_URI =3D "\
>       file://0044-CVE-2025-11082.patch \
>       file://0045-CVE-2025-11083.patch \
>       file://0046-CVE-2025-11081.patch \
> +     file://0047-CVE-2025-8225.patch \
>  "
>  S  =3D "${WORKDIR}/git"
> diff --git a/meta/recipes-devtools/binutils/binutils/0047-CVE-2025-8225.p=
atch b/meta/recipes-devtools/binutils/binutils/0047-CVE-2025-8225.patch
> new file mode 100644
> index 0000000000..410ba64143
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/0047-CVE-2025-8225.patch
> @@ -0,0 +1,47 @@
> +From e51fdff7d2e538c0e5accdd65649ac68e6e0ddd4 Mon Sep 17 00:00:00 2001
> +From: Alan Modra <amodra@gmail.com>
> +Date: Wed, 19 Feb 2025 22:45:29 +1030
> +Subject: [PATCH] binutils/dwarf.c debug_information leak
> +
> +It is possible with fuzzed files to have num_debug_info_entries zero
> +after allocating space for debug_information, leading to multiple
> +allocations.
> +
> +       * dwarf.c (process_debug_info): Don't test num_debug_info_entries
> +       to determine whether debug_information has been allocated,
> +       test alloc_num_debug_info_entries.
> +---
> +
> +Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.=
git;a=3Dcommitdiff;h=3De51fdff7d2e538c0e5accdd65649ac68e6e0ddd4]
> +CVE: CVE-2025-8225
> +
> + binutils/dwarf.c | 8 +++-----
> + 1 file changed, 3 insertions(+), 5 deletions(-)
> +
> +Signed-off-by: Alan Modra <amodra@gmail.com>
> +Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
> +
> +diff --git a/binutils/dwarf.c b/binutils/dwarf.c
> +index 8e004cea839..bfbf83ec9f4 100644
> +--- a/binutils/dwarf.c
> ++++ b/binutils/dwarf.c
> +@@ -3807,13 +3807,11 @@ process_debug_info (struct dwarf_section * secti=
on,
> +     }
> +
> +   if ((do_loc || do_debug_loc || do_debug_ranges || do_debug_info)
> +-      && num_debug_info_entries =3D=3D 0
> +-      && ! do_types)
> ++      && alloc_num_debug_info_entries =3D=3D 0
> ++      && !do_types)
> +     {
> +-
> +       /* Then allocate an array to hold the information.  */
> +-      debug_information =3D (debug_info *) cmalloc (num_units,
> +-                                                sizeof (* debug_informa=
tion));
> ++      debug_information =3D cmalloc (num_units, sizeof (*debug_informat=
ion));
> +       if (debug_information =3D=3D NULL)
> +       {
> +         error (_("Not enough memory for a debug info array of %u entrie=
s\n"),
> +--
> +2.43.7
> +
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#225424): https://lists.openembedded.org/g/openembedde=
d-core/message/225424
> Mute This Topic: https://lists.openembedded.org/mt/116006916/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

