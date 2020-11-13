Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web09.719.1605297357738053283
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2020 11:55:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Z6Xde5JD;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id za3so15331111ejb.5
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2020 11:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=woMdZ/OydUg/O7Xjy4XD5McuFBx3768VayTOVbzJ+cI=;
        b=Z6Xde5JDCNrQP+NPdi+xVMQ9KOQuXRZwHcdWUKCN+I1gOCzofT53DiXf5beZ0t59Je
         x6Psdupxe2s4ZqMMpaXsFI1LRcpDWR5eO/NZj+jaYZlYGBMD4AhRHdKBQ6JPVR2RAPwE
         3fnm4xYb7chAtpAaMaMl1W5akCiJH9BfBcKcgemRylk8MB1pCkob7kSvvnFmrotgsU2+
         pQc9wsX6u+Eoh/9i8wddiEHjUsDLZgEVkIgfGJUVp84+h7ddYhDOX6wvQaDAvuFvA5v0
         fLbJhFCjrb6HAEW89kslduW3qoEdt/lRaJ76BHgqAZ3qvLghY7pDCsV+xxfKyo7LshEN
         BEMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=woMdZ/OydUg/O7Xjy4XD5McuFBx3768VayTOVbzJ+cI=;
        b=lYWysmgE/t4cIXWrkiDzNFzsLeB1kASK+8byUKeMgt3AsFoyN51xCOapQYrq2oVN8K
         4zjJwkLpO7/v/OTF6yHe54iq5dvirgg5CFkNTW4A8bj93y9ezSXCIlr3UPDgK7qHmZ2m
         +Nz2qsMpBVS2tOVgugDtzOPy00fXbzR4fJBUJbHII1CYfffzI8M3QI772QSn8Qz1RJq+
         LM7eWa4DfPImk8OjGeo0DIpJ4/kmlXYgnSxst0Jsoux84myx7kf3wzE5Idwryf05hcqL
         2bWuEnxuW/lteDTHnjujhwh9zHXajWJPc7Mu3nnaiqaKOgRAJjFM5X04XCteKxHwYc42
         EubA==
X-Gm-Message-State: AOAM533pYTzw335OHuGRR0rIUbYoV/qSpCelpGc9rOVRW/juQaMDyf0O
	D1YCCrUCarbUKBApr4QiVaNmUO+sVMyFqrksINc=
X-Google-Smtp-Source: ABdhPJzUFXIIpvGzL01ox6/SAGu8Ly0qWIgIofn2ogNnuXfAp2didQTuh1ZtNQtM1dITHHs86iKPlGNbjzxiGpvQmlA=
X-Received: by 2002:a17:906:c18c:: with SMTP id g12mr3559647ejz.334.1605297355368;
 Fri, 13 Nov 2020 11:55:55 -0800 (PST)
MIME-Version: 1.0
References: <20201113063206.1716-1-bruce.ashfield@gmail.com> <CAMKF1squzG-WAXMg6ncjvnfLqrxYT-YpFmR=i816DZ_QVWPBmA@mail.gmail.com>
In-Reply-To: <CAMKF1squzG-WAXMg6ncjvnfLqrxYT-YpFmR=i816DZ_QVWPBmA@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 13 Nov 2020 14:55:44 -0500
Message-ID: <CADkTA4OBH_7kZvWo7=G4JnR=EVqUhGLEz_f5xy4HZ4hzCe1mFA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel: provide module.lds for out of tree builds in v5.10+
To: Khem Raj <raj.khem@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Lili Li <lili.li@intel.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 13, 2020 at 1:10 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Thu, Nov 12, 2020 at 10:32 PM Bruce Ashfield
> <bruce.ashfield@gmail.com> wrote:
> >
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > The upstream commit 596b0474d3d [kbuild: preprocess module linker
> > script], adds a dependency on module.lds for external module
> > building.
> >
> > Since module.lds is generated as part of 'modules_prepare', we
> > must make it available with the other kernel artifacts in the
> > kernel shared workdir, otherwise out of tree builds fail.
> >
> > This fixes errors like:
> >
> >     | make[4]: *** No rule to make target 'scripts/module.lds', needed by
> >         'build/tmp/work/qemuarm64-poky-linux/cryptodev-module/1.11-r0/git/cryptodev.ko'.
> >         Stop.
> >     | make[4]: *** Waiting for unfinished jobs....
> >
> > We also ensure that kernel-devsrc has a copy to support on
> > target module builds that are often prepared with 'make scripts
> > prepare'. Those targets won't regenerate it, so the build fails.
> > If 'make modules_prepare' is used, the file will be regenerated
> > and overwrite our copy (as expected).
> >
> > Signed-off-by: Pan, Kris <kris.pan@intel.com>
> > Signed-off-by: Lili Li <lili.li@intel.com>
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > ---
> >  meta/classes/kernel.bbclass                | 1 +
> >  meta/recipes-kernel/linux/kernel-devsrc.bb | 6 ++++++
> >  2 files changed, 7 insertions(+)
> >
> > diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> > index be93a258f6..ccd74e61e8 100644
> > --- a/meta/classes/kernel.bbclass
> > +++ b/meta/classes/kernel.bbclass
> > @@ -494,6 +494,7 @@ do_shared_workdir () {
> >         # Copy files required for module builds
> >         cp System.map $kerneldir/System.map-${KERNEL_VERSION}
> >         [ -e Module.symvers ] && cp Module.symvers $kerneldir/
> > +       [ -e scripts/module.lds ] && install -Dm 0644 scripts/module.lds $kerneldir/scripts/module.lds
> >         cp .config $kerneldir/
> >         mkdir -p $kerneldir/include/config
> >         cp include/config/kernel.release $kerneldir/include/config/kernel.release
> > diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
> > index 81b1e36041..5f0dedbdf7 100644
> > --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> > +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> > @@ -100,6 +100,12 @@ do_install() {
> >         # be dealt with.
> >         # cp -a scripts $kerneldir/build
> >
> > +       # although module.lds can be regenerated on target via 'make modules_prepare'
> > +       # there are several places where 'makes scripts prepare' is done, and that won't
> > +       # regenerate the file. So we copy it onto the target as a migration to using
> > +       # modules_prepare
> > +       cp -a --parents scripts/module.lds $kerneldir/build/ 2>/dev/null || :
> > +
>
> I see there are more occurrence of cp -a in this recipe but I thought
> I will mention it
> cp -a could be perhaps made more portable with cp --preserve=mode,timestamps -R

They've been there since the beginning.

But I'll keep it in mind next time I'm doing a bigger update to the devsrc!

Bruce

>
> >          if [ -d arch/${ARCH}/scripts ]; then
> >             cp -a arch/${ARCH}/scripts $kerneldir/build/arch/${ARCH}
> >         fi
> > --
> > 2.19.1
> >
> >
> > 
> >



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
