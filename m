Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2776CD37AA
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 22:03:51 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.708.1778191423766252311
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 15:03:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=YNQCd5X1;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso10150335e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 15:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778191422; x=1778796222; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LT9W6g6AIgUI8rrLv7wYldomPRP+cDyyrWWkhx7YbWQ=;
        b=YNQCd5X1IgamP82CmTEqmejVocGAN8f70BFA/sGXgeHmy2IPrkCF30BzeOW7vaJcs3
         pnwCrd5cKelmtP+vO9wGM6W8UQ/HdE7iMHFIOrR1FCZUd83c1fmbHvH2F2GvQxV3omVP
         JXHrTZ0/ZjOPc3MHj4T4Vx3D3C9CGN13o87qg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778191422; x=1778796222;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LT9W6g6AIgUI8rrLv7wYldomPRP+cDyyrWWkhx7YbWQ=;
        b=hGyv0wU7Xa5ctekyRurUZwqB4AMaSKKE5p2nl1szTm0Y4lAQdM7bF/9DwEW7O4crdM
         ahghYPvbLhT5HMuaNEUYhkM3wf4mTcAS4UBERKx3I5eMWBftVTwNsgVZvIyAghr4r/C4
         l8yvgEyCt3zZXraDTjPlXPBo9xzCma9h6QeRWYf1AiQ/OjCQYHSha+oFDKihN+B4RAfB
         tDoRzBtoT09/juAkMr2R0y0Sh39Ga69zNoeYrXwjb2mSxtYHBBSaeF2dpF8gMMwM4/Ml
         lAyRfuu2kAoOQRdy7xBAVpXgCjmGSseszHB/F7tRUbYJ0xHbLE5Xboh0gTb0Vs44G01O
         WBOA==
X-Forwarded-Encrypted: i=1; AFNElJ+/S8VlL+Z4GXmKQq4JtXR63E9R8FLw6nRmZXLQkRwG773H2uM89a7CI8kGCcPL/RblxS8h0hNmHLkRCqqBEDnqfg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxNg6S/0zmS0gSZe4iS6ELZh3ciuYyFj/auMTdL8DVJrKYm/ffm
	+v50JAH9AI+LxPpIUXKiiJryjmmOymdIwfFa93nvsbX3v+M+Q1wlVot7u2cvcnxMYSU=
X-Gm-Gg: AeBDieuBkV8TJnFibXgIiVUY5bCLKRdkuFbst4u6qHupZRtUIYulQ5Bp4HeUgphsEmR
	1tGvuZzAUCxoIMZqqGsapZXURzOzvT9enLxPF/ZI38SHH86V3TTs4a2SldMTgxr1yI+cwx8aFqP
	TtwyG4Gjcbfz5tzJKUc+kbDvbb8RKdgxzKdl+MOrt0hvPod420p/3gYLHn3oviHm9LNVgTHLvdx
	p2abdHsne+JuAucq98GKXL7aWCl5/AYin4OaDdQbULsE/y1XHq7ce8v83zzsUhzKoeta6Iu8Ggc
	pLPZzpgt5L+FCbSSgM15HtZ7v/NYS6U43/jqf8yu0WYGLp44Tbp8z5wIjclexZgIstlaSAMBLzU
	U0NZ+T4WvRBGP5O2UH56DTT4X5EN8IxDeKDd+9Pho5CwmgyxDBk8M2sKpNJqBjE2ty9hiZjZuWG
	1B6qsauYJaPapkDLTy89/fjLMilsOfL4xRFXZlrJkNI350xwGlF2xfMGH6T454CiiVaR8weABjf
	8G07biAgkIye6xucExTciFG6A==
X-Received: by 2002:a05:600c:c107:b0:48a:52d4:888c with SMTP id 5b1f17b1804b1-48e51e0bb23mr118579655e9.3.1778191421802;
        Thu, 07 May 2026 15:03:41 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-907b87c037esm7728985a.30.2026.05.07.15.03.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 15:03:40 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 08 May 2026 00:03:37 +0200
Message-Id: <DICS8ZZ99Q7C.25QI9TUSM1VCB@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH 1/2] binutils: fix CVE-2026-3441 and
 CVE-2026-3442
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <sudumbha@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260502142354.3840615-1-sudumbha@cisco.com>
In-Reply-To: <20260502142354.3840615-1-sudumbha@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 22:03:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236624

On Sat May 2, 2026 at 4:23 PM CEST, Sudhir Dumbhare -X (sudumbha - E INFOCH=
IPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Sudhir Dumbhare <sudumbha@cisco.com>
>
> This patch applies the upstream fix [1], which addresses two out-of-bound=
s
> read issues in bfd/xcofflink.c within xcoff_link_add_symbols(). The chang=
es
> shown in [2] are referenced by [3] and [4].
>
> [1] https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommit;h=3Dc2bf7=
de1eb77a91d7a3c86d56408bf57de540faf
> [2] https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dblobdiff;f=3Dbfd=
/xcofflink.c;h=3D1781182fa6a3f92e5e91996f8b0dcf3ab192679b;hp=3Dfde21c9f9583=
baff05e72e390e6bb896d02f9d43;hb=3Dc2bf7de1eb77a91d7a3c86d56408bf57de540faf;=
hpb=3Dd7f532cb3a46527
> [3] https://bugzilla.suse.com/show_bug.cgi?id=3DCVE-2026-3441
> [4] https://bugzilla.suse.com/show_bug.cgi?id=3DCVE-2026-3442
>
> Reference:
> https://nvd.nist.gov/vuln/detail/CVE-2026-3441
> https://nvd.nist.gov/vuln/detail/CVE-2026-3442
> https://www.suse.com/security/cve/CVE-2026-3441.html
> https://www.suse.com/security/cve/CVE-2026-3442.html
>
> Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
> ---
>  .../binutils/binutils-2.42.inc                |  1 +
>  .../CVE-2026-3441_CVE-2026-3442.patch         | 50 +++++++++++++++++++
>  2 files changed, 51 insertions(+)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-3441=
_CVE-2026-3442.patch
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/reci=
pes-devtools/binutils/binutils-2.42.inc
> index 839d31242e..5d91a41648 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.42.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
> @@ -69,5 +69,6 @@ SRC_URI =3D "\
>       file://0028-CVE-2025-11494.patch \
>       file://0029-CVE-2025-11839.patch \
>       file://0030-CVE-2025-11840.patch \
> +     file://CVE-2026-3441_CVE-2026-3442.patch \
>  "
>  S  =3D "${WORKDIR}/git"
> diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2026-3441_CVE-20=
26-3442.patch b/meta/recipes-devtools/binutils/binutils/CVE-2026-3441_CVE-2=
026-3442.patch
> new file mode 100644
> index 0000000000..28cface2c9
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/CVE-2026-3441_CVE-2026-3442=
.patch
> @@ -0,0 +1,50 @@
> +From 88a051b765a7684b24250907c2dad9fa8cd4124a Mon Sep 17 00:00:00 2001
> +From: Alan Modra <amodra@gmail.com>
> +Date: Sat, 28 Feb 2026 13:16:40 +1030
> +Subject: [PATCH] xcofflink buffer overflows
> +
> +This fixes two fuzzed object file out-of-bounds accesses.
> +
> +	* xcofflink.c (xcoff_link_add_symbols): Properly bounds check
> +	XTY_LD x_scnlen index.  Sanity check r_symndx before using it
> +	to index sym hashes.
> +
> +CVE: CVE-2026-3441 CVE-2026-3442
> +Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.=
git;a=3Dcommit;h=3Dc2bf7de1eb77a91d7a3c86d56408bf57de540faf]
> +
> +(cherry picked from commit c2bf7de1eb77a91d7a3c86d56408bf57de540faf)
> +Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
> +---
> + bfd/xcofflink.c | 10 ++++------
> + 1 file changed, 4 insertions(+), 6 deletions(-)
> +

Hello,

This patch has a weird format:

> +diff --git a/bfd/xcofflink.c b/bfd/xcofflink.c
> +index e0165d202a9..88c49755c64 100644
> +--- a/bfd/xcofflink.c
> ++++ b/bfd/xcofflink.c
> +@@ -1873,12 +1873,9 @@ xcoff_link_add_symbols (bfd *abfd, struct bfd_lin=
k_info *info)
> +	     follow its appropriate XTY_SD symbol.  The .set pseudo op can
   ^ here a context line starts with a TAB instead of the usual space.
     Can you check please?

> +	     cause the XTY_LD to not follow the XTY_SD symbol. */
> +	  {
> +-	    bool bad;
> +-
> +-	    bad =3D false;
> +-	    if (aux.x_csect.x_scnlen.u64
> +-		>=3D (size_t) (esym - (bfd_byte *) obj_coff_external_syms (abfd)))
> +-	      bad =3D true;
> ++	    bool bad =3D (aux.x_csect.x_scnlen.u64
> ++			>=3D ((esym - (bfd_byte *) obj_coff_external_syms (abfd))
> ++			    / symesz));
> +	    if (! bad)
> +	      {
> +		section =3D xcoff_data (abfd)->csects[aux.x_csect.x_scnlen.u64];
> +@@ -2244,6 +2241,7 @@ xcoff_link_add_symbols (bfd *abfd, struct bfd_link=
_info *info)
> +		 functions imported from dynamic objects.  */
> +	      if (info->output_bfd->xvec =3D=3D abfd->xvec
> +		  && *rel_csect !=3D bfd_und_section_ptr
> ++		  && (unsigned long) rel->r_symndx < obj_raw_syment_count (abfd)
> +		  && obj_xcoff_sym_hashes (abfd)[rel->r_symndx] !=3D NULL)
> +		{
> +		  struct xcoff_link_hash_entry *h;
> +--
     ^ Also, this line usually has a ending space. Maybe some tool
       decided to rewrite spaces, unaware of the patch expected format?

Thanks!

> +2.44.4


--=20
Yoann Congal
Smile ECS


