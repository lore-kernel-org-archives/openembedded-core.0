Return-Path: <jeremy.rosen@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6DDBCD8C9D
	for <webhook@archiver.kernel.org>; Mon,  8 Jun 2026 14:29:00 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.55964.1780928933587419695
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2026 07:28:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ASzvenu8;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: jeremy.rosen@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-46019b190b6so3340971f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2026 07:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1780928932; x=1781533732; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cqGCQ4CCjGwNNrLpmvAQJYRxDkXRy5bpOPHS0u/eQo8=;
        b=ASzvenu8o1cjQhEl6MqRaYvs1qygCXQL4qEB3v6SAb/BAuLyOms/+CVicIdVWcNpGY
         /B0Tz1faGTRIq7nvu7QNtFisk33VDPC/vMmlZHk3vAsJ4FH63WyTZInzLuKWjKPb4xpr
         n3FzD9dfWvhBst5MYv5qyt/8zcxJEmSg4RUjg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780928932; x=1781533732;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cqGCQ4CCjGwNNrLpmvAQJYRxDkXRy5bpOPHS0u/eQo8=;
        b=Lcq7TWP55gnut+ud63CwDSVQ6GGIeJEtLZx1n7gJITeZ6ntPIv3oKqqmkp5JIyILsi
         ZnoEnFhVORs6cQdxwttffI7JFaMlAPccgBhbivJHsP7kIaBBX8FVxQ5a5pyxyRt/jeXT
         wyuqvaNBA0REwDN6NyzYHaq8nK9rN5wCQF3PdUL/wdoxY82eyO3jWACHk6SO0usRvo8T
         qBI9y95jy0t4eG6c40DxADIRtFtelvODZuhbC748Ziz/NRyyGwgycztDK/hmxKMozDqE
         M7wNbarK66877pyXnlTtt99K/W/QKrtz6fJwk0y4vt5pSh9CVU/3lcGAv0fospUybmaI
         49iQ==
X-Forwarded-Encrypted: i=1; AFNElJ/UMcRUcIWWtm15xdV8MEV8OGKlt9Y/dAvplEuQXV6/w/iVxIN9rPeF/zeATLL63v7hum0V39qhkypi+2kcPTWOvw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzF7qGgoBXzZzDKJhug0HC1PbWGAfDWvROEnkc9V/v13T6vhckN
	uQSAEUXuG6fL95yJEsHTLGW5jNj/CdHIVwpEhyTJpxVupkyJ/LdpnYvxG/K4Hly4SQ==
X-Gm-Gg: Acq92OHDzoXkgJ21Q3HXQbRJKdb2IBMQp/BmSUCkWErGSAqK0xQRQr4+MrgSRtfKM6V
	WX+zD7hsR+PQur+wazFUKYPJkMR+bfq5gPpfNPYkVcNe734Eg/8jQNoHmV3/SwYPgpqR+eZ2GUq
	HDyVHtwEF/IqnqtAlxvFB7HSoOb+Nes6czEyUG4OAc1gyAZYleb8lZ3e9QbQeCQWAwehW44q4+W
	WP8cJYzBESsNpwE2EKYBCz6EGw5F00Og1RYQt8mIvBmdj1zkI6ZxjJyOcH8Rc3IMyZU8ywCh8xH
	9Si2MlHFz+RS5lP+jPfQtYTXNrW7HoQ8t15Kb8kiLA8OzTb2veXoZiriO/FnOyHEr7adWReuITX
	G44x5mVkiR8Q1hCw9D6+hyTMpgZCVr1CciiOSB44Ohhz2mm1fQUbuvWoHduIPwmFHtaWxtx8z0j
	UJbBriJeR1cNz1en26BzWxarqS0vOfYZ3y
X-Received: by 2002:a5d:6652:0:b0:45e:f2e1:9a20 with SMTP id ffacd0b85a97d-4603060b538mr17983104f8f.27.1780928931895;
        Mon, 08 Jun 2026 07:28:51 -0700 (PDT)
Received: from localhost ([2001:861:560f:240:8dd0:2c2:7492:641b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2ed944sm54493634f8f.13.2026.06.08.07.28.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 07:28:51 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 08 Jun 2026 16:28:51 +0200
Message-Id: <DJ3QM894Q24E.3662NGQA2U7ZP@smile.fr>
Cc: <xe-linux-external@cisco.com>
Subject: Re: [OE-core] [Scarthgap] [PATCH] binutils: Fix CVE-2026-6846
From: =?utf-8?q?J=C3=A9r=C3=A9my_Rosen?= <jeremy.rosen@smile.fr>
To: <spushpka@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0
References: <20260601144901.33446-1-spushpka@cisco.com>
In-Reply-To: <20260601144901.33446-1-spushpka@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2026 14:29:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238246

=20

Hello Shubham

From what I can see, both master and wrynose are affected by this CVE
but I could not find any patch for these releases

please submit patches for those releases as well and then repost this
one

thanks a lot
Jeremy

On Mon Jun 1, 2026 at 4:49 PM CEST, Shubham Pushpkar via lists.openembedded=
.org wrote:
> This patch applies the upstream fix as referenced in [2], using the commi=
t shown in [1].
>
> [1] https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;h=3D7a089e=
0302382f4d4e077941156e1eaa68d01393
> [2] https://security-tracker.debian.org/tracker/CVE-2026-6846
>
> Signed-off-by: Shubham Pushpkar <spushpka@cisco.com>
> ---
>  .../binutils/binutils-2.42.inc                |  1 +
>  .../binutils/binutils/CVE-2026-6846.patch     | 57 +++++++++++++++++++
>  2 files changed, 58 insertions(+)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-6846=
.patch
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/reci=
pes-devtools/binutils/binutils-2.42.inc
> index 1a865c45f4..4e5125f532 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.42.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
> @@ -74,5 +74,6 @@ SRC_URI =3D "\
>       file://0030-CVE-2025-11840.patch \
>       file://CVE-2025-69647.patch \
>       file://CVE-2025-69648.patch \
> +     file://CVE-2026-6846.patch \
>  "
>  S  =3D "${WORKDIR}/git"
> diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2026-6846.patch =
b/meta/recipes-devtools/binutils/binutils/CVE-2026-6846.patch
> new file mode 100644
> index 0000000000..8eaca87583
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/CVE-2026-6846.patch
> @@ -0,0 +1,57 @@
> +From 2a340616f7e6591f83e85777d1d1f6108c33f5b8 Mon Sep 17 00:00:00 2001
> +From: Alan Modra <amodra@gmail.com>
> +Date: Mon, 6 Apr 2026 22:58:22 +0930
> +Subject: [PATCH] PR 34049 buffer overflow in xcoff_link_add_symbols
> +
> +The fact that coffcode.h:coff_set_alignment_hook for rs6000 removes
> +sections can result in target_index > section_count.  Thus any array
> +indexed by target_index must not be sized by section_count.
> +
> +	PR ld/34049
> +	* xcofflink.c (xcoff_link_add_symbols): Size reloc_info array
> +	using max target_index.
> +
> +CVE: CVE-2026-6846
> +Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.=
git;a=3Dcommitdiff;h=3D7a089e0302382f4d4e077941156e1eaa68d01393]
> +
> +(cherry picked from commit 7a089e0302382f4d4e077941156e1eaa68d01393)
> +Signed-off-by: Shubham Pushpkar <spushpka@cisco.com>
> +---
> + bfd/xcofflink.c | 15 ++++++++++++++-
> + 1 file changed, 14 insertions(+), 1 deletion(-)
> +
> +diff --git a/bfd/xcofflink.c b/bfd/xcofflink.c
> +index 6ef9abcd8..196967ed0 100644
> +--- a/bfd/xcofflink.c
> ++++ b/bfd/xcofflink.c
> +@@ -1300,6 +1300,7 @@ xcoff_link_add_symbols (bfd *abfd, struct bfd_link=
_info *info)
> +   } *reloc_info =3D NULL;
> +   bfd_size_type amt;
> +   unsigned short visibility;
> ++  unsigned int max_target_index;
> +
> +   keep_syms =3D obj_coff_keep_syms (abfd);
> +
> +@@ -1363,7 +1364,19 @@ xcoff_link_add_symbols (bfd *abfd, struct bfd_lin=
k_info *info)
> +      order by VMA within a given section, so we handle this by
> +      scanning along the relocs as we process the csects.  We index
> +      into reloc_info using the section target_index.  */
> +-  amt =3D abfd->section_count + 1;
> ++  max_target_index =3D 0;
> ++  for (o =3D abfd->section_last; o !=3D NULL; o =3D o->prev)
> ++    if (o->target_index !=3D 0)
> ++      {
> ++	/* The last section added from the object file will have the
> ++	   highest target_index.  See coffgen.c coff_real_object_p and
> ++	   make_a_section_from_file.  Sections added by
> ++	   xcoff_link_create_extra_sections will have a zero
> ++	   target_index.  */
> ++	max_target_index =3D o->target_index;
> ++	break;
> ++      }
> ++  amt =3D max_target_index + 1;
> +   amt *=3D sizeof (struct reloc_info_struct);
> +   reloc_info =3D bfd_zmalloc (amt);
> +   if (reloc_info =3D=3D NULL)
> +--
> +2.35.6


