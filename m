Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com [209.85.222.65])
 by mx.groups.io with SMTP id smtpd.web12.45472.1590471894242641938
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 May 2020 22:44:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EW/xMqIc;
 spf=pass (domain: gmail.com, ip: 209.85.222.65, mailfrom: andrey.z@gmail.com)
Received: by mail-ua1-f65.google.com with SMTP id b13so6840161uav.3
        for <openembedded-core@lists.openembedded.org>; Mon, 25 May 2020 22:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bqAx1JUAFt8vDJ5PqbZqfmWg9hzVekZzuPrJb5uPsSc=;
        b=EW/xMqIcKtOveJmEdwELWfycmxL4A9DF01ugHsprHLRSTFXSRFRMXy5Gzj+0dgkZ88
         TDH6COsVormKignuFE/F+ZC9Jn7lGOtiFTxKY+ZDJ3mrrWp86HMPN3ItDN6d6uDbJR2h
         SNE0PhhloktQwQOxjEw2ibgysBkUTv1QrpCP+rYmK4Cj2xRLbCQvtHq3u4hD9kb9pjOY
         v2anmgqlwTU2YJ2K9r/GufnGxmvkPRjBA+fITJQ7+p+X+J/T0t3+1tGr5IVCBqg3M1Oq
         vsJvsrduWdoYXD62xm/K97nke/Oj+YYZeqRrnZTXUw5T7yncU5qKcgfgFkUoFHvdsl8u
         /7jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bqAx1JUAFt8vDJ5PqbZqfmWg9hzVekZzuPrJb5uPsSc=;
        b=iGxSUsDD0x9k3SJUlqoETeQfiqKnJFelyoMJ/XJl1UKEogrl/f9pyG7w8rRqkNfGmy
         zc9mG4h0hb9V7IVJDgJeIzzcpXCUKb/XupXu+jsHPZyP3dTtnnZBFJYNsyzd5+DcqrzE
         NEHGxocPqxtdFtrZgSIkdpKAZcf1b+D+/Rvje9l7Ybl1P2wIbQmNwp8Jmvk0Rx8YqWkT
         WNb2RfmzvhVb5S3TK69pjb2qnmJ9kFMx+5BAFc2puwmJ41WmScLknoVWE5WVjCi2eWiW
         hnJEYSf4rKzSGf6XGmeQACD7Fe9Prd2w3M+OvvtK1mJnpCIAOW5CESOwbxgYWYUvR/2D
         jwag==
X-Gm-Message-State: AOAM5310YQhZmPY6CiTeck7E9t1/pLYwcqQjffRWOMmCoCaUJT9OtuHu
	VCsZtFikB/UvB0PUdCoujW2NPeCq7xi2OkogQ+M=
X-Google-Smtp-Source: ABdhPJwPPiFThr09PC1NjG5RwbYJhiiMXtQzzFNcK5Hk2qhcDRrUirk8t6sRSGHAQQ0AeuhT8gXTczZ2yphQmXJEvHw=
X-Received: by 2002:ab0:45aa:: with SMTP id u39mr746392uau.95.1590471893328;
 Mon, 25 May 2020 22:44:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1571688520.git.bruce.ashfield@gmail.com>
 <eb27cbf9e4e86187a79967546674a0156d722c16.1571688520.git.bruce.ashfield@gmail.com>
 <20191021202444.GB1500@jama> <CADkTA4O1v-GZi-mkt866dpazowHsGZPrjwPuLi_Ry8vxZn8aqA@mail.gmail.com>
In-Reply-To: <CADkTA4O1v-GZi-mkt866dpazowHsGZPrjwPuLi_Ry8vxZn8aqA@mail.gmail.com>
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
Date: Tue, 26 May 2020 07:44:42 +0200
Message-ID: <CAHtQpK7g400jDAUx+tYedCF6c654OQhCT+wZtKm7x3+_Gkr9SQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 6/6] perf: drop 'include' copy
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 21, 2019 at 10:58 PM Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
>
> On Mon, Oct 21, 2019 at 4:24 PM Martin Jansa <martin.jansa@gmail.com> wrote:
> >
> > On Mon, Oct 21, 2019 at 04:16:18PM -0400, bruce.ashfield@gmail.com wrote:
> > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > >
> > > The copy of the kernel's top level include directory is not
> > > required to build perf. We have both the linux-libc-headers and
> > > perf's captured/copied headers for what it requires.
> > >
> > > The copy of the kernel's headers is leading us to multiple smaller
> > > fixes to ensure that the various .h files are in sync. We can
> > > remove the copy and all of the sync checks, and perf still builds
> > > and executes correctly.
> >
> > Maybe reorder this before "[OE-core] [PATCH 3/6] perf: fix v5.4+ builds"
> > as it removes most of what was possibly incorrectly added there (see 2nd
> > review)
> >
>
> I left this here on purpose, since it is only RFC. The other patches
> as they appear in the series are required to build against 5.4+, but
> this is optional.

Look like this patch causes issues with building perf for 4.4.y kernel...

I've recently started to upgrade some of BSPs from zeus to dunfell,
and kernel 4.4.y fails to build with this patch applied. When I
applied changes from Martin in commit
[f3515d2d2545cae6b88fe5e86d081f4ef6133bf6] - build went through.

I have now the bbappend in the layer, which sets the PERF_SRC to add
the "include" folder back but I don't think this is a clean approach.

Should this be reverted, or those who has a "dunfell+4.4.y kernel"
setup need to use appends to override the PERF_SRC?

>
> Bruce
>
> > > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > ---
> > >  meta/recipes-kernel/perf/perf.bb | 9 ---------
> > >  1 file changed, 9 deletions(-)
> > >
> > > diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
> > > index 191305969c..5f0ba7c180 100644
> > > --- a/meta/recipes-kernel/perf/perf.bb
> > > +++ b/meta/recipes-kernel/perf/perf.bb
> > > @@ -106,7 +106,6 @@ EXTRA_OEMAKE += "\
> > >  EXTRA_OEMAKE_append_task-configure = " JOBS=1"
> > >
> > >  PERF_SRC ?= "Makefile \
> > > -             include \
> > >               tools/arch \
> > >               tools/build \
> > >               tools/include \
> > > @@ -248,14 +247,6 @@ do_configure_prepend () {
> > >      # so we copy it from the sysroot unistd.h to the perf unistd.h
> > >      install -D -m0644 ${STAGING_INCDIR}/asm-generic/unistd.h ${S}/tools/include/uapi/asm-generic/unistd.h
> > >      install -D -m0644 ${STAGING_INCDIR}/asm-generic/unistd.h ${S}/include/uapi/asm-generic/unistd.h
> > > -
> > > -    # bits.h can have the same issue as unistd.h, so we make the tools variant take precedence
> > > -    [ -e ${S}/tools/include/linux/bits.h ] && install -D -m0644 ${S}/tools/include/linux/bits.h ${S}/include/linux/bits.h
> > > -
> > > -    [ -e ${S}/tools/perf/util/include/linux/ctype.h ] && install -D -m0644 ${S}/include/linux/ctype.h ${S}/tools/perf/util/include/linux/ctype.h
> > > -
> > > -    [ -e ${S}/include/uapi/linux/kvm.h ] && install -D -m0644 ${S}/include/uapi/linux/kvm.h  ${S}/tools/include/uapi/linux/kvm.h
> > > -    [ -e ${S}/include/uapi/linux/sched.h ] && install -D -m0644 ${S}/include/uapi/linux/sched.h  ${S}/tools/include/uapi/linux/sched.h
> > >  }
> > >
> > >  python do_package_prepend() {
> > > --
> > > 2.19.1
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
Regards,
Andrey.
