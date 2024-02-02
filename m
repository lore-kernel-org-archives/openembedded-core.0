Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8796C4828F
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 15:57:49 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.26155.1706889460055428127
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Feb 2024 07:57:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=J2DKljue;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.49, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a349ed467d9so290022166b.1
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 07:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706889458; x=1707494258; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9mZ+1WSIQE0kJOpexwVpLuq5SftSAp/RFYUDJXa5k4w=;
        b=J2DKljuetkAPGh6ORq3ycY44RORT8+OfLIcDWn6dGgJ54m15FdHIx+zASkBurjs37N
         E/cWHp/dCyYA3w6F6Ue0HkteghMrG63PJXEy4Bn8RGrMUAKd5iGxyBWKZkfXEN4tS99k
         pYWPmr8iQI1lebgtuCCw3v2/EDJjlYPo0KJ+VgD2cm0/pnecAroh9FP/gt2Df0HaykaP
         VMJknR1yebTrUJBz4xZOhLc8+WykVf25dNr+u/tpIJK++miqpG9qE5gviaJhf+8dkj8F
         dD8UUHaP+ixpeAX8zB1feO+yyi8z8JDGEQyUBnXcUtapq7J5ElOqwVXQkokk31WN3Bga
         064Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706889458; x=1707494258;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9mZ+1WSIQE0kJOpexwVpLuq5SftSAp/RFYUDJXa5k4w=;
        b=Hxk7TlP1VK8YF8CItaLNBQChjg5OWxTWv802VvJZ3EVjYR/nhCgNtCIUDLhVuwsKIP
         GQmigj8DWS/Jl1o2reGhewfPbbWg2fwR+ve2coXRRn+kqDOkx6FuMULXGTkeRptrrsfV
         WgDIQk9ktAr2LEgtTY3FiJIe7rrTnNNX1yksPNop1DKH4hgI0HzvlgHoTq1EGUBg+EPF
         uSZfrBJ4mgA6hMGgbgrcrtPFuhq8yydElupQN4g6UqorgH4iLGoogEtqkZKZkmauETGU
         XEV3BPMaBFpiRRSsGFI6vvPgzxDfUPotwpiQil4ygrRy3nY8jn/5jVWtEwt4HJasLH2I
         H2fQ==
X-Gm-Message-State: AOJu0YxrOHvbZ5hFAHTEhzbanNhrXtQV9F790MZF/fax0a1Oms7dWdRm
	CX3wv95bnzuDBdU46llBmJPJfQ30FRzeQq72b0k5q7y2JbHVKiQ4EOlQurqKVNCXv9zXHOa3qEb
	eaYA8b5zUfIpr5jiBUhlU0FLcw7eoXW62GO6esQ==
X-Google-Smtp-Source: AGHT+IFhd11AEtt2BBHy1uMAr6u6vSWpWvnugbjPoy9cO4RLL15yJ5Fa7TIRKp3Ht/AEuW8RQWUqqoon9SgZaLRIdH0=
X-Received: by 2002:a17:907:7747:b0:a37:5ca:3117 with SMTP id
 kx7-20020a170907774700b00a3705ca3117mr1417535ejc.11.1706889457959; Fri, 02
 Feb 2024 07:57:37 -0800 (PST)
MIME-Version: 1.0
References: <20240202120104.3735837-1-Deepthi.Hemraj@windriver.com>
In-Reply-To: <20240202120104.3735837-1-Deepthi.Hemraj@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 2 Feb 2024 05:57:26 -1000
Message-ID: <CAOSpxdbXC2D4iiUx8950bKHF1ajCOm1ijbazrkqKADNqdZnpOA@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH V3 1/2] gdb: Fix CVE-2023-39129
To: Deepthi.Hemraj@windriver.com
Cc: openembedded-core@lists.openembedded.org, rwmacleod@gmail.com, 
	umesh.kalappa0@gmail.com, pgowda.cve@gmail.com, shivams@gmail.com, 
	sundeep.kokkonda@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 15:57:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194805

On Fri, Feb 2, 2024 at 2:01=E2=80=AFAM Hemraj, Deepthi via
lists.openembedded.org
<Deepthi.Hemraj=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
>
> Issue: LIN1022-4854

Please don't include internal windriver issue designators.

Also, please send your initial submission without a version number.
If you need to resubmit, add a version number and include a comment
after the --- line below indicating what has changed. Otherwise I am
left to puzzle out which patch you intended I should take.

I have fixed this, so no need to resubmit this time.

Thanks,

Steve

>
> Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
> ---
>  meta/recipes-devtools/gdb/gdb.inc             |  1 +
>  .../gdb/gdb/0012-CVE-2023-39129.patch         | 50 +++++++++++++++++++
>  2 files changed, 51 insertions(+)
>  create mode 100644 meta/recipes-devtools/gdb/gdb/0012-CVE-2023-39129.pat=
ch
>
> diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gd=
b/gdb.inc
> index 099bd2d8f5..ad2b3ad4b7 100644
> --- a/meta/recipes-devtools/gdb/gdb.inc
> +++ b/meta/recipes-devtools/gdb/gdb.inc
> @@ -15,5 +15,6 @@ SRC_URI =3D "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
>             file://0009-Fix-invalid-sigprocmask-call.patch \
>             file://0010-gdbserver-ctrl-c-handling.patch \
>             file://0011-CVE-2023-39128.patch \
> +          file://0012-CVE-2023-39129.patch \
>             "
>  SRC_URI[sha256sum] =3D "1497c36a71881b8671a9a84a0ee40faab788ca30d7ba19d8=
463c3cc787152e32"
> diff --git a/meta/recipes-devtools/gdb/gdb/0012-CVE-2023-39129.patch b/me=
ta/recipes-devtools/gdb/gdb/0012-CVE-2023-39129.patch
> new file mode 100644
> index 0000000000..63fb44d59a
> --- /dev/null
> +++ b/meta/recipes-devtools/gdb/gdb/0012-CVE-2023-39129.patch
> @@ -0,0 +1,50 @@
> +From: Keith Seitz <keiths@...>
> +Date: Wed, 2 Aug 2023 15:35:11 +0000 (-0700)
> +Subject: Verify COFF symbol stringtab offset
> +X-Git-Tag: gdb-14-branchpoint~473
> +X-Git-Url: https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommitdi=
ff_plain;h=3D58abdf887821a5da09ba184c6e400a3bc5cccd5a
> +
> +Verify COFF symbol stringtab offset
> +
> +This patch addresses an issue with malformed/fuzzed debug information th=
at
> +was recently reported in gdb/30639. That bug specifically deals with
> +an ASAN issue, but the reproducer provided by the reporter causes a
> +another failure outside of ASAN:
> +
> +Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.=
git;a=3Dcommitdiff_plain;h=3D58abdf887821a5da09ba184c6e400a3bc5cccd5a]
> +
> +CVE: CVE-2023-39129
> +
> +Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
> +
> +diff --git a/gdb/coffread.c b/gdb/coffread.c
> +--- a/gdb/coffread.c
> ++++ b/gdb/coffread.c
> +@@ -159,6 +160,7 @@ static file_ptr linetab_offset;
> + static file_ptr linetab_size;
> +
> + static char *stringtab =3D NULL;
> ++static long stringtab_length =3D 0;
> +
> + extern void stabsread_clear_cache (void);
> +
> +@@ -1303,6 +1298,7 @@ init_stringtab (bfd *abfd, file_ptr offset, gdb::u=
nique_xmalloc_ptr<char> *stora
> +   /* This is in target format (probably not very useful, and not
> +      currently used), not host format.  */
> +   memcpy (stringtab, lengthbuf, sizeof lengthbuf);
> ++  stringtab_length =3D length;
> +   if (length =3D=3D sizeof length)        /* Empty table -- just the co=
unt.  */
> +     return 0;
> +
> +@@ -1322,8 +1318,9 @@ getsymname (struct internal_syment *symbol_entry)
> +
> +   if (symbol_entry->_n._n_n._n_zeroes =3D=3D 0)
> +     {
> +-      /* FIXME: Probably should be detecting corrupt symbol files by
> +-       seeing whether offset points to within the stringtab.  */
> ++      if (symbol_entry->_n._n_n._n_offset > stringtab_length)
> ++      error (_("COFF Error: string table offset (%ld) outside string ta=
ble (length %ld)"),
> ++             symbol_entry->_n._n_n._n_offset, stringtab_length);
> +       result =3D stringtab + symbol_entry->_n._n_n._n_offset;
> +     }
> +   else
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194787): https://lists.openembedded.org/g/openembedde=
d-core/message/194787
> Mute This Topic: https://lists.openembedded.org/mt/104117785/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

