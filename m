Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web08.5894.1614443484676128935
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Feb 2021 08:31:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=g6ao0AmI;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 15so6060304qvp.13
        for <openembedded-core@lists.openembedded.org>; Sat, 27 Feb 2021 08:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=f7G4/8a/Njo0uszEf5OY6wPYLbn3fQh/h2opJaw6Doc=;
        b=g6ao0AmIyApcNDFSGQeoGX6xOtQaUjo+w7EEFbRGJo1R+24ia/n3OOcioeogP75ZS0
         4UAGjSBRYbp+TPrUiB3EIjBt5lfhNvOpfBeR+Rw9wsIUm4NomOzh12aeA/g+uzIO31m4
         DK7FHgFfdkQsXDw03dNb3SriGY/a3fWpA751RXvcxzc+7oMy1na2nkgi2LKZxzaIrtHf
         DnDDzzJwsFIWYUEnfLBBwGJ47UOR6wFvefmPJKECwPZK7wg/3YkA96g0TMo0Vrt6EOvU
         F0BEgBrNbvv7gll+mbykYYqU3YUUkHG9fDwtyOcihkSlEod5PU3GBeHI2vZYWHYi/vhB
         mllg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f7G4/8a/Njo0uszEf5OY6wPYLbn3fQh/h2opJaw6Doc=;
        b=m5qXU4gK3YxKnUW2KSfrZBC3cOboNrn5ZRsl0xB1jWEfIKI/kvRZNhIWKjxJW6ZMiQ
         +D3a6qkU9a6DkcK0ym0sTc7U87wkRvsngNM0e/0+hgVIGDRl0oGTpO+oDzWwwhgjsF3y
         GHEghFyKcXw+a08r31wrZdfAQSjuVvPCW5Zbb+mR8e22rooQgBg8mDlazJ3Ji7ei0+Hv
         WcyBMgvB+4nOhSNzAO387wMNftnbLpljrKGKlZEO5ioF/9FOTgzidQJ4wXePITMbtU6R
         O4TjDH9P2v6aw3CGgchKloryNL52uSybiziQPM3NtW9QgNeRmkiFt5XF+3IuUc7EDtqk
         Qhdg==
X-Gm-Message-State: AOAM531g5nk3pcZ/OHQs8/R6gagOF0tSNRZvMeSyS9QU6DtX96NNW4iB
	dWB2GilDWK2axdGRmsDa4Or0DiYlf600CblDXfM=
X-Google-Smtp-Source: ABdhPJy1Y0omB+/YBcGvtX0tAvRAcHy2p1x1J0GzPA3ADTgIluPGCHK7IrcOXtZ58FTMVLj4+euL/YnqgVZuHvGM12U=
X-Received: by 2002:a05:6214:80d:: with SMTP id df13mr1385238qvb.55.1614443483559;
 Sat, 27 Feb 2021 08:31:23 -0800 (PST)
MIME-Version: 1.0
References: <20210225173653.2408-1-mac@mcrowe.com> <YDpe+v5had6dt56Z@piout.net>
In-Reply-To: <YDpe+v5had6dt56Z@piout.net>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 27 Feb 2021 08:30:57 -0800
Message-ID: <CAMKF1sph-7jsZ0G6Fvd9qrgEtDh7JNaVerLCncR+8KKQd+FqxQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcc-sanitizers: Move content from gcclibdir into libdir
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: yocto@mac.mcrowe.com, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, Mike Crowe <mac@mcrowe.com>
Content-Type: text/plain; charset="UTF-8"

thanks Alexandre

I think new dir needs to be added to FILES directive as well.

On Sat, Feb 27, 2021 at 7:02 AM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hello,
>
> On 25/02/2021 17:36:53+0000, Mike Crowe via lists.openembedded.org wrote:
> > In e9e5744ba8b0d43c8b874d365f83071ce20bf0a1, Khem Raj wrote:
> > > OE does not use the traditional /usr/lib/gcc prefix to store
> > > gcc-runtime it basically is moved into libdir, however some newer
> > > files were installed by newer versions of gcc especially libgomp (
> > > omp.h openacc.h ) into gcclibdir, so we have content in both
> > > directories, this confuses other tools which are trying to guess the
> > > gcc installation and its runtime location, since now we have two
> > > directories, the tools either choose one or other and we get
> > > inconsistent behavior, e.g. clang for aarch64 uses /usr/lib but same
> > > clang for riscv64 chose /usr/lib/gcc
> >
> > > This change ensures that OE ends up with single valid location for gcc
> > > runtime files
> >
> > I think that the same thing needs to happen in gcc-sanitizers.inc,
> > otherwise I get errors like:
> >
> > | .../recipe-sysroot/usr/include/gpg-error-64.h:884:11: fatal error: sanitizer/lsan_interface.h: No such file or directory
> >
> > when attempting to compile with sanitizers enabled.
> >
> > Signed-off-by: Mike Crowe <mac@mcrowe.com>
> > Cc: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-devtools/gcc/gcc-sanitizers.inc | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
> > index 668e14a59f..67b755edf8 100644
> > --- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
> > +++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
> > @@ -35,6 +35,11 @@ do_compile () {
> >  do_install () {
> >      cd ${B}/${TARGET_SYS}/libsanitizer/
> >      oe_runmake 'DESTDIR=${D}' MULTIBUILDTOP=${B}/${TARGET_SYS}/libsanitizer/ install
> > +    if [ -d ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include ]; then
> > +     install -d ${D}${libdir}/${TARGET_SYS}/${BINV}/include
> > +     mv ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include/* ${D}${libdir}/${TARGET_SYS}/${BINV}/include
> > +     rmdir --ignore-fail-on-non-empty -p ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include
> > +    fi
> >      if [ -d ${D}${infodir} ]; then
> >          rmdir --ignore-fail-on-non-empty -p ${D}${infodir}
> >      fi
>
> This seems to result in the following erro on the autobuilders:
>
> ERROR: gcc-sanitizers-10.2.0-r0 do_package: QA Issue: gcc-sanitizers: Files/directories were installed but not shipped in any package:
>   /usr/lib/i686-poky-linux
>   /usr/lib/i686-poky-linux/10.2.0
>   /usr/lib/i686-poky-linux/10.2.0/include
>   /usr/lib/i686-poky-linux/10.2.0/include/sanitizer
>   /usr/lib/i686-poky-linux/10.2.0/include/sanitizer/common_interface_defs.h
>   /usr/lib/i686-poky-linux/10.2.0/include/sanitizer/lsan_interface.h
>   /usr/lib/i686-poky-linux/10.2.0/include/sanitizer/asan_interface.h
>   /usr/lib/i686-poky-linux/10.2.0/include/sanitizer/tsan_interface.h
> Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
> gcc-sanitizers: 8 installed and not shipped files. [installed-vs-shipped]
> ERROR: gcc-sanitizers-10.2.0-r0 do_package: Fatal QA errors found, failing task.
>
> It seems to be an easy one to fix.
>
> Regards,
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
