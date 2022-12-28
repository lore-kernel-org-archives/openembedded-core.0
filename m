Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3405AC4167B
	for <webhook@archiver.kernel.org>; Wed, 28 Dec 2022 14:22:55 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.181200.1672237369729856141
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Dec 2022 06:22:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Ebt0vl0G;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.53, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f53.google.com with SMTP id gh17so38715360ejb.6
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 06:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TbXUSG5AcQdxYqdRF2LGTJEoLlIDiBNi/77bUWVm9Uw=;
        b=Ebt0vl0GECjQlHinwWi1E2G5yzmWeDX+dABgvRxsMJco2fTblveq0JUL7/hw5hKyqJ
         jDc1B0jd/dh36USZ+JoKT3SKZ4rbe39DWTJyuFPkctnk356wzRRVyZLRDtwcA4QyqQGr
         eRf0GUHuTeuT8RAPgcvUb58kKCw1xpbOLFZIJEOawZawp4XEfEAyfFOyoUHMgO6JRLwz
         7yEL7VVLCs7NPO88jFViR31A8GO5vx0ZLehHDMA9q7uXCYYaarwlsls2JnUzHje4oDp/
         /EYoDHbLixmcr4KyEmCcN4YqD5z0/kUbZ/wCFi4v8mIgSeMAYhyF+837KlvuFRUvXlOX
         Euhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TbXUSG5AcQdxYqdRF2LGTJEoLlIDiBNi/77bUWVm9Uw=;
        b=cA/8ldNhQ4zOt/NyjSAdDBHYeKDkFTEvGgyfc8UJjWp0VE/Sy/ZmnYVCDQAH1W7hKZ
         DX1UuR3QFLz2Z4C8fnQua8/lrbhUiC+37TWqL3163A5Si8C/kn1SusWub+kIXf44u2Ul
         /vyTycaSvtA6mJ3ISDYUVTvS8jDosy5i+Xp7t/aKDyW6ZMBDtJMjSGB3ko9sgI0HpNLH
         6g7g8ghxErJHWvMPzDXcu1AEG/VehWEVLVwV8OHJ1HFglu31E1dsUcUaZQYl/BDHKMSe
         2pNMtn/gFmT7lbaFJgyEmMkG5yyhR+nBAcGTaMo3FDvoTE5/kk1Wpun0dUDX6lrBwue1
         aOxQ==
X-Gm-Message-State: AFqh2koXKLU+lZoULooWPrrVZ7plDkrWs4WvBAYr0o3mQmi2yo0wkKMA
	02VgCCtkWSP1vTuMB8iQtwec8l0vwtvH7/lQTMsCcA==
X-Google-Smtp-Source: AMrXdXtJUaIGQ1XjglFo4v9ujIGGQd8+TEfmYbepP3zPYZJaIJl6lIAhyy7KOx/xoMz0da682WQ9yiwP/PZMFjpjWg8=
X-Received: by 2002:a17:906:3b47:b0:7c0:a8ff:3380 with SMTP id
 h7-20020a1709063b4700b007c0a8ff3380mr1864795ejf.92.1672237367947; Wed, 28 Dec
 2022 06:22:47 -0800 (PST)
MIME-Version: 1.0
References: <20221227164202.3700000-1-yashinde145@gmail.com> <724024e3-02dc-8159-8f7d-b49277a44077@windriver.com>
In-Reply-To: <724024e3-02dc-8159-8f7d-b49277a44077@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 28 Dec 2022 04:22:36 -1000
Message-ID: <CAOSpxdYHO_f3QVFjmuhW5+D_C6v4U+aqS0JgHihnOgqOAHhDeg@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone] [PATCH v3] binutils : Fix CVE-2022-4285
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: yashinde145@gmail.com, openembedded-core@lists.openembedded.org, 
	Yash.Shinde@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 14:22:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175067

On Tue, Dec 27, 2022 at 8:11 AM Randy MacLeod
<randy.macleod@windriver.com> wrote:
>
> On 2022-12-27 11:42, Yash Shinde via lists.openembedded.org wrote:
> > From: Yash Shinde <Yash.Shinde@windriver.com>
>
> Yash,
>
> I know you have a problem with sending email from your WR account so
> I suspect that you're trying to ensure that the patch is authored by
> your WR email.
>
> Don't bother, we'll get your email fixed early in 2023.
>
> Steve,
>
> I'd drop this version of the CVE fix an take the one sent 10 minutes
> earlier.

Done, and I manually changed Yash's email address to the windriver.com one.

Steve

> Yash,
> As I explained offline, you need to tell people why you are sending a
> duplicate fix.
> In this case if you wanted the new version to be merged (we don't!),
> then you should
> have replied on the old version to explain that it should not be merged
> and explain
> why.
>
> ../Randy
>
>
> >
> > Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=5c831a3c7f3ca98d6aba1200353311e1a1f84c70]
> >
> > Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
> > ---
> >   .../binutils/binutils-2.38.inc                |  1 +
> >   .../binutils/0019-CVE-2022-4285.patch         | 37 +++++++++++++++++++
> >   2 files changed, 38 insertions(+)
> >   create mode 100644 meta/recipes-devtools/binutils/binutils/0019-CVE-2022-4285.patch
> >
> > diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
> > index c1904768dc..0a4a0d7bc1 100644
> > --- a/meta/recipes-devtools/binutils/binutils-2.38.inc
> > +++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
> > @@ -42,5 +42,6 @@ SRC_URI = "\
> >        file://0018-CVE-2022-38128-1.patch \
> >        file://0018-CVE-2022-38128-2.patch \
> >        file://0018-CVE-2022-38128-3.patch \
> > +     file://0019-CVE-2022-4285.patch \
> >   "
> >   S  = "${WORKDIR}/git"
> > diff --git a/meta/recipes-devtools/binutils/binutils/0019-CVE-2022-4285.patch b/meta/recipes-devtools/binutils/binutils/0019-CVE-2022-4285.patch
> > new file mode 100644
> > index 0000000000..e5e404982e
> > --- /dev/null
> > +++ b/meta/recipes-devtools/binutils/binutils/0019-CVE-2022-4285.patch
> > @@ -0,0 +1,37 @@
> > +From 5c831a3c7f3ca98d6aba1200353311e1a1f84c70 Mon Sep 17 00:00:00 2001
> > +From: Nick Clifton <nickc@redhat.com>
> > +Date: Wed, 19 Oct 2022 15:09:12 +0100
> > +Subject: [PATCH] Fix an illegal memory access when parsing an ELF file
> > + containing corrupt symbol version information.
> > +
> > +     PR 29699
> > +     * elf.c (_bfd_elf_slurp_version_tables): Fail if the sh_info field
> > +     of the section header is zero.
> > +
> > +Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=5c831a3c7f3ca98d6aba1200353311e1a1f84c70]
> > +CVE: CVE-2022-4285
> > +
> > +Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
> > +---
> > + bfd/ChangeLog | 6 ++++++
> > + bfd/elf.c     | 4 +++-
> > + 2 files changed, 9 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/bfd/elf.c b/bfd/elf.c
> > +index fe00e0f9189..7cd7febcf95 100644
> > +--- a/bfd/elf.c
> > ++++ b/bfd/elf.c
> > +@@ -8918,7 +8918,9 @@ _bfd_elf_slurp_version_tables (bfd *abfd, bool default_imported_symver)
> > +       bfd_set_error (bfd_error_file_too_big);
> > +       goto error_return_verref;
> > +     }
> > +-      elf_tdata (abfd)->verref = (Elf_Internal_Verneed *) bfd_alloc (abfd, amt);
> > ++      if (amt == 0)
> > ++    goto error_return_verref;
> > ++      elf_tdata (abfd)->verref = (Elf_Internal_Verneed *) bfd_zalloc (abfd, amt);
> > +       if (elf_tdata (abfd)->verref == NULL)
> > +     goto error_return_verref;
> > +
> > +--
> > +2.31.1
> > +
> >
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#175030): https://lists.openembedded.org/g/openembedded-core/message/175030
> > Mute This Topic: https://lists.openembedded.org/mt/95905716/3616765
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [randy.macleod@windriver.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>
> --
> # Randy MacLeod
> # Wind River Linux
>

