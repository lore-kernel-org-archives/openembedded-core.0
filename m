Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web10.2930.1593714235212941423
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2020 11:23:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VH4LnDO6;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id dp18so30879274ejc.8
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2020 11:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mtl8JngaUYmdg2FyjuIbcQyZTWtgFGCL90mSee4pO4s=;
        b=VH4LnDO60+9+vG20CQj/qzsr9s6B3KQZkiOKpR0PHTd6SUtoBqc+WkdrTyATKkx2oN
         ozns8nmLJMvFs/XLHfzIjSMZ7PTq6CIoux+3K65TyBUhQySKx7dXw9NcVoIfSxPbty+T
         iF8C2xHtXH5uYRxeEO33JrfVQPuWJhX6E3ejYnimtuk6OKv3Pb2tKRB7sgS583NdLxOw
         cULZqboEOiK1zvVbCyqkk9pg64lTEoijGrX76GFRr5EMPI31xVIhPvDeZkncFUlHMVCw
         n0e4b9EePa2W4x8jxRaxQBuDMr8FUfTVivyHW3uxKVaoSG3Nyq6bUQNy6cTr/FuWfUMh
         UBtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mtl8JngaUYmdg2FyjuIbcQyZTWtgFGCL90mSee4pO4s=;
        b=TJKXJMlXIZYen8Uu5JiX0l/YXqBIIUyoZAald7vKXm1VtyQaBhgtkWQK7egN5R6fmZ
         UpvEZJ60vvb87iuTq7IZWGTCIHn1ZebuKpaU1RAuCnls7swfkXqmhhu/QY1s7R/pZ4F1
         SI+SfX3+hMtdN41TdA1uEn9p7DgdX3ZmEJodLm1rK9Hqt10/KW7SOUs+6j7eaAcVvp9j
         VWiAuPtqowzkqVPb2oQTlud4OA+rN3YbpFLVNrLRmAcJjRce7khAancRCfbg7fR5qZgb
         NH3kYhU8EllQejj6XmG1gKrDYYTO5wa0OzMWKpLMSqgBIZo+IwUU6N9ih7u+b7Ndgx/E
         DwVw==
X-Gm-Message-State: AOAM532Nx6goELwTGxefi07+GnD1m2Z9gUEkooRNwU3u23FQDJZKb1ht
	kk9LSQXvaqQw1uTUtRYHcnwg0JNgHv10l41FThU=
X-Google-Smtp-Source: ABdhPJx25z0KUhDqyn+aIAnrOD9YrrASnQ7qmWRP8pb2iMt02i1gv0ga7YJ6Cr4QILkIojp3tkwRDNTiPaLJKu5DY+I=
X-Received: by 2002:a17:906:8542:: with SMTP id h2mr28172471ejy.517.1593714233700;
 Thu, 02 Jul 2020 11:23:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200626054556.32056-1-lili.li@intel.com> <161E0225303E6367.9271@lists.openembedded.org>
In-Reply-To: <161E0225303E6367.9271@lists.openembedded.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 2 Jul 2020 14:23:42 -0400
Message-ID: <CADkTA4O0A3nM3xqzbe0+SX0jRy3aaXhRxPxwQ+ouk3csUVdp0g@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][master][PATCH] kernel.bbclass: Fix Module.symvers support
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: lili.li@intel.com, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Anuj Mittal <Anuj.Mittal@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 2, 2020 at 2:14 PM Bruce Ashfield via
lists.openembedded.org
<bruce.ashfield=gmail.com@lists.openembedded.org> wrote:
>
> On Fri, Jun 26, 2020 at 1:47 AM <lili.li@intel.com> wrote:
> >
> > From: Lili Li <lili.li@intel.com>
> >
> > Starting from v5.8-rc1 commit 269a535ca931 (modpost: generate
> > vmlinux.symvers and reuse it for the second modpost"), kernel will
> > generate new vmlinux.symvers instead of dumping all the vmlinux symbols
> > into Module.symvers in the first pass.
> >
> > Error log:
> >     'run.do_shared_workdir.16614' failed with exit code 1:
> >     DEBUG: cp: cannot stat 'Module.symvers': No such file or directory
> >
> > This change will check the file Module.symvers existence before copying it.
>
> This doesn't actually fix the problem where we still want
> Module.symvers, it just ignores copying it to the shared directory.
> But it will be created ones modules are built.
>
> We either need a 2nd copy task, or we need to move the
> do_shared_workdir until after modules are built. I'm looking into
> which makes more sense.

As it turns out (and as you probably already knew), we do that 2nd
copy already so it will make it to the shared workdir.

So I retract my comment, and we are good.

Cheers,

Bruce

>
> Bruce
>
> >
> > Signed-off-by: Lili Li <lili.li@intel.com>
> > ---
> >  meta/classes/kernel.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> > index 20a0135fc979..a1219f315620 100644
> > --- a/meta/classes/kernel.bbclass
> > +++ b/meta/classes/kernel.bbclass
> > @@ -463,7 +463,7 @@ do_shared_workdir () {
> >
> >         # Copy files required for module builds
> >         cp System.map $kerneldir/System.map-${KERNEL_VERSION}
> > -       cp Module.symvers $kerneldir/
> > +       [ -e Module.symvers ] && cp Module.symvers $kerneldir/
> >         cp .config $kerneldir/
> >         mkdir -p $kerneldir/include/config
> >         cp include/config/kernel.release $kerneldir/include/config/kernel.release
> > --
> > 2.26.2
> >
> >
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
> 



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
