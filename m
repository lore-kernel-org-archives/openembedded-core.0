Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BC03C48291
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 16:34:40 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.27300.1706891673918869060
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Feb 2024 08:34:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=R31+2Yo9;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.51, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a354408e6bfso577512266b.1
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 08:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706891672; x=1707496472; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K8IgNzpPYsVCrRfNp1rfb0zzWb7O4sWlV5KoeW5RIJo=;
        b=R31+2Yo9I9xRIaX6Y0A0lw0nAAgEuncDBYrj0yMPN2AcVo/23xqSHJ4DVSGJyNvLMX
         cFmvcZOqzi1E28l1cULfpnBemuoE2aXDoIGu0ki1oUjBC9HBq0AQuQcknfJjM+czot9f
         3SvozpLBzoa1xTDbPYl4C0qC9doR/h8sljEjykbLzzYn7D486kj8FFMxIrObMgpM10ji
         0nJSq5LnuMVJxTNmxOQMlPvFp5X4ElSW7fw5UWx4jPxoPDz8G1ZS1q5eGYupztQLwL4t
         FcjQqt9kS27H1X62/o26hvN8UXyLBI+cGx1eepWrqspfZ8CdtsvvXnaY1aWznwUgGyrY
         9f/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706891672; x=1707496472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K8IgNzpPYsVCrRfNp1rfb0zzWb7O4sWlV5KoeW5RIJo=;
        b=gHsYa2J2EfhEl6b6+AoO6pRMBuDaibs150WrzF42FXsrKxdCZRDVZ9aO8zblurOkpJ
         M9WgLfiyAP4Br/GjAySuuSdcqHLqWSrKFuFvuLac08kgqNVGlLLdxO5d6mRiolvEj/U9
         ir3iKQJ19K/IkyDpvpkKKXvJuy+L6MAsvXjyjFmlEGvHOQf10fagaCumpRJeBMtajq4E
         BWpOClA9/38pNbUCLRnXTeZQQS/ksdLPONfRJwdn5xzzODw0ONQg1MSx4efWAULzKo4E
         kUW1jER449dPn+GcXyM+KREYcwmGSxezN4P31g+DibrRJNVu4xOlOL2QoIka+nhVSxLN
         oKRQ==
X-Gm-Message-State: AOJu0YxKNwBcBo5BYuD4Dcz2uhRGp6A2mXkByojQhWqkSZgvxoUZwiKQ
	uzPkhfsHL5Gm/32NrhD4Le9i9n3YWlGwuELYszzH02DgCOVPnFPORBIR7kWizPOVERPcnwGaeim
	B/GeaTyEiibvbilcqawo3rdMX3JFml9MGXHe9ZA==
X-Google-Smtp-Source: AGHT+IHBhiwoqMEjlPLMEvSrXgkNTX6pDZiN+B+SRPPTXIk8+c2eWFuiv8mzed/598AyX1cySDlJ1LCofIRrkdUAPT0=
X-Received: by 2002:a17:906:31c3:b0:a29:b31d:1dc6 with SMTP id
 f3-20020a17090631c300b00a29b31d1dc6mr2358507ejf.6.1706891672238; Fri, 02 Feb
 2024 08:34:32 -0800 (PST)
MIME-Version: 1.0
References: <20240202120104.3735837-1-Deepthi.Hemraj@windriver.com>
 <CAOSpxdbXC2D4iiUx8950bKHF1ajCOm1ijbazrkqKADNqdZnpOA@mail.gmail.com> <42f67a75-53c6-4b8c-891e-f2c33e74f1bc@windriver.com>
In-Reply-To: <42f67a75-53c6-4b8c-891e-f2c33e74f1bc@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 2 Feb 2024 06:34:21 -1000
Message-ID: <CAOSpxdbDg1TN12hpTrMpxf=VnL9D61v3ReKxLz-qrjdm1tsoTA@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH V3 1/2] gdb: Fix CVE-2023-39129
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Deepthi.Hemraj@windriver.com, openembedded-core@lists.openembedded.org, 
	rwmacleod@gmail.com, umesh.kalappa0@gmail.com, pgowda.cve@gmail.com, 
	shivams@gmail.com, sundeep.kokkonda@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 16:34:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194808

On Fri, Feb 2, 2024 at 6:14=E2=80=AFAM Randy MacLeod
<randy.macleod@windriver.com> wrote:
>
> On 2024-02-02 10:57 a.m., Steve Sakoman via lists.openembedded.org wrote:
>
> On Fri, Feb 2, 2024 at 2:01=E2=80=AFAM Hemraj, Deepthi via
> lists.openembedded.org
> <Deepthi.Hemraj=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
>
> Issue: LIN1022-4854
>
> Please don't include internal windriver issue designators.
>
> Agreed. Please only add those if needed when doing WR reviews.
>
> Also, please send your initial submission without a version number.
> If you need to resubmit, add a version number and include a comment
> after the --- line below indicating what has changed. Otherwise I am
> left to puzzle out which patch you intended I should take.
>
>
>
> I have fixed this, so no need to resubmit this time.
>
> Thanks Steve.
>
> Also there are two threads with the same git shortlog / email subject:
>    [OE-core] [kirkstone][PATCH V3 1/2] gdb: Fix CVE-2023-39129
>
>
>
> This is the second one and the first was:
>   https://lists.openembedded.org/g/openembedded-core/message/194789
> I'll reply there to ask you to change the git shortlog.
>
>
> I'm a bit concerned about the fix since the last comment in:
>
>    https://sourceware.org/bugzilla/show_bug.cgi?id=3D30640
>
> says:
>    " Fixed by 58abdf88782 (and follow-up patches from mjw). "
>
> Deepthi,
> What can you find out about the "follow-up" patches?
>
> I suspect that we won't need to revert this commit but that there
> may be more work to be done.
>
> Steve, will you keep what you have from this commit in your tree?

Yes, I will keep it in -nut for now (assuming it passes autobuilder testing=
)

Steve

>
> ../Randy
>
>
> Thanks,
>
> Steve
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
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194805): https://lists.openembedded.org/g/openembedde=
d-core/message/194805
> Mute This Topic: https://lists.openembedded.org/mt/104117785/3616765
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
ndy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>
> --
> # Randy MacLeod
> # Wind River Linux

