Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.31368.1629756915229076036
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Aug 2021 15:15:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MGEFwDUe;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: armccurdy@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id l18so26551971lji.12
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Aug 2021 15:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BLy1uIjGNB9YT3ZGeOPg2seiXK0Mg7Kt/DFRas7ReXw=;
        b=MGEFwDUe0E3eGu/tC5LIXuoTJmztL5WnSlJYRNGxd4NL7aGvwo8ri2uc/k/fgS88fa
         kjJQakHIGQYPv6QshJJ+gzDYErealAI4RhOiIXvqUf6qUTRZLZ6fjNILmOwu7eBuz0Ax
         k/VIUSIqe1Iu4WzovNVMn4qllrcC9rpHbKYsj9MSYzoy7g+neOnUFY2D+A8NLmi0hws2
         qQrimI6H1QIXfH7PsBATUCKoXbgYLZFTbGSMC5Cqtdi5dxQAKUv/O84RxVf/ktnepcIj
         2eQ0DBM8rvuGYiQ22GDRt8uQ2mIXcmgfstj5nCqSd4fiGtWMCqZaHqcFloD5Y0tZnp0H
         3Cpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BLy1uIjGNB9YT3ZGeOPg2seiXK0Mg7Kt/DFRas7ReXw=;
        b=RPTwhgHwx8UCkY1mGw7OxE8iMhvLJMy+eP1wYxKWQgNBcHY283wauSe7q/5XfnpNFg
         MVh695rdWl0y0OKmdieMBjZgy5OrqEGkBqY91KywqHe4l/n05iNKzwOUKYlhwMgFN5Rr
         Dn8DtC2PqrY2aK752ZRRraQYrEaa59HGD0asQU8UxLnkAtfAlvMXCcRpVTkhaU2gK+wD
         kc98A0j+Y70FRC/YxyYnQFk5kfbO8bzMkhAUQeW8svAEEznPPr0WfoJqGa0RFLSDErAA
         QVzjzFIYnjkReibmWWMvmpnTID6lYFX8uludHKqDEqghwghFuioyZGxdirXeWJRk4c8/
         TOLA==
X-Gm-Message-State: AOAM533NqddflO6EUVeLMUIT1MZQAcAacML4zM3vEx4ZJNRs/yH0gP4m
	yiasCOUOPGESV859lIdyBtgmNauucN/o+S99934=
X-Google-Smtp-Source: ABdhPJzH8xPQSwkd0UilX8eOtlkGgTcXBSjRLzPCt9LUjS/H5jxPxMiQnTI4SRuNPtjDomGSYq78oq9hCTOu41RyKYk=
X-Received: by 2002:a2e:94d0:: with SMTP id r16mr29692301ljh.403.1629756913332;
 Mon, 23 Aug 2021 15:15:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210823101205.29267-1-andrej.valek@siemens.com>
 <ce3005b3-6213-9528-2c82-c4f612f3b549@gmail.com> <DB8PR10MB3977E6C2E704FF73707CA62492C49@DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <DB8PR10MB3977E6C2E704FF73707CA62492C49@DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Mon, 23 Aug 2021 15:14:57 -0700
Message-ID: <CAJ86T=V2zSGf3ebYWFh-2-QZ1w55Xsz+6nbkcR9jayh9ANyraQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] vim: add option to disable NLS support
To: Andrej Valek <andrej.valek@siemens.com>
Cc: Khem Raj <raj.khem@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 23, 2021 at 10:12 AM Andrej Valek <andrej.valek@siemens.com> wrote:
>
> Hello Khem,
>
> I looked exactly into configure.ac which arguments are expecting for those options. So I think, it has to be mentioned explicitly.

Assuming configure.ac is based around AC_ARG_ENABLE / AC_ARG_WITH then
an explicit option is not required. A default value of "yes" will be
set for --enable-foo / --with-foo and a default value of "no" will be
set for --disable-foo / --without-foo.

However, apart from that, you've also dropped the leaving "--" from
various --enable-foo options and converted dashes to underscores, all
of which looks wrong. How were the changes tested?

> Regards,
> Andrej
>
> > On 8/23/21 3:12 AM, Andrej Valek wrote:
> >> - Some distributions with UTF-8 locale have problem when National Language
> >>   Support is enabled. Add there an option to disable it.
> >> - refresh options based on configure.ac
> >>
> >> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> >> ---
> >>   meta/recipes-support/vim/vim.inc | 8 +++++---
> >>   1 file changed, 5 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/meta/recipes-support/vim/vim.inc
> >> b/meta/recipes-support/vim/vim.inc
> >> index 17d1c24a7c..7cc47884f2 100644
> >> --- a/meta/recipes-support/vim/vim.inc
> >> +++ b/meta/recipes-support/vim/vim.inc
> >> @@ -54,19 +54,21 @@ do_compile() {
> >>       autotools_do_compile
> >>   }
> >>
> >> -#Available PACKAGECONFIG options are gtkgui, acl, x11, tiny
> >> +#Available PACKAGECONFIG options are gtkgui, acl, x11, tiny, selinux,
> >> +elfutils, nls
> >>   PACKAGECONFIG ??= ""
> >>   PACKAGECONFIG += " \
> >>       ${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux', d)} \
> >>       ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 gtkgui', '',
> >> d)} \
> >> +    nls \
> >>   "
> >>
> >>   PACKAGECONFIG[gtkgui] = "--enable-gui=gtk3,--enable-gui=no,gtk+3"
> >> -PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl,"
> >> +PACKAGECONFIG[acl] = "enable_acl="yes",--disable-acl,acl,"
> >
> >is 'yes' needed to be explicit ? I thought --enable-XYZ meant it implicitly
> >
> >>   PACKAGECONFIG[x11] = "--with-x,--without-x,xt,"
> >>   PACKAGECONFIG[tiny] = "--with-features=tiny,--with-features=big,,"
> >> -PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,"
> >> +PACKAGECONFIG[selinux] = "enable_selinux="yes",--disable-selinux,libselinux,"
> >>   PACKAGECONFIG[elfutils] = "--enable-elf-check,,elfutils,"
> >> +PACKAGECONFIG[nls] = "enable_nls="yes",--disable-nls,,"
> >>
> >>   EXTRA_OECONF = " \
> >>       --disable-gpm \
>
> 
>
