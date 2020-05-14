Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web12.190.1589484734237996623
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2020 12:32:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IrksyYt9;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id l3so3325461edq.13
        for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2020 12:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jXYy/bkukmG570lBEat0hyDwvLsTGlgiYHWloZbuiu4=;
        b=IrksyYt9SfIBf4HIwA+8K41QGee+3pi2z9PMTebAAqxfAiToZMF7RKF6wwKiP4MPbt
         mqzxNuOg/lMqAtbCXOVrfwK3+k9efImeMiKKddwhWPvHzIVID7VvUFCs9ehWSMsgJNA/
         mu0Ewm1ryrILgGlXukgHorM256SychVgwjBBA46+bzeflTFjHaA4GA5hrkFCX3yJulaE
         zJf8OPRv/05tcReCNgS1OkUVztJbqutcak3/dFQMYyvO9rAMN2rhvy/MyGQ0eQx9L8PI
         syfru+aMPGvftqE4W2dNs7P7Z776wRFz8zxcMWzaO9v4GlVLYwDbwx+vO9BuqrJ5M7U/
         qMOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jXYy/bkukmG570lBEat0hyDwvLsTGlgiYHWloZbuiu4=;
        b=NHnDR1D7vONpQ2wk287JpxSgg48x0AicoYeuj8WL11Q4gbDQujap0NNiROcZ2f8/14
         UpM/328saDTDCl1XRfYAv0DT+5Fv7GrIWtyrrGRLLH28aXdoYAOuGGLtSkW6qOyXVRXF
         DMDu0zKzWTPRe+N2d40EjnuQWyRIUOKgisPRK4W0gGyK5YTZG2YDI9JWtfWl38b09IwG
         nazFPgxY3XDcIoP/07xuCwMonyARv7m17T+qZnlgzDmmVy6I1t9GzetthzeJRWk1NcnM
         0TJLb2bieKvXoFgUaaK/36d1Uf1i0csMinXNKOiEDGoBv6W4G/3quKfLF39U9L11Dc/5
         yk6A==
X-Gm-Message-State: AOAM5302cBaVu903QGK+ITHr/4+SK6UwhKdu473+2qFNUTQujBKapJlW
	Fdl4yM2KET2vE+DHN10WkNjKLjfC9R8KkjR14dY=
X-Google-Smtp-Source: ABdhPJw3EJdPVSUd5NFMGv8obw+PMmRjGTADrIvREgrio5Ncf194mhUU2+1ESef2QoHZBLkTCtjsm93NEtEFRo0nL64=
X-Received: by 2002:a05:6402:b70:: with SMTP id cb16mr1945277edb.234.1589484732625;
 Thu, 14 May 2020 12:32:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1589378829.git.bruce.ashfield@gmail.com>
 <d09f4c9abf8c9e0ff342c4b5d6323eb371391c63.1589378829.git.bruce.ashfield@gmail.com>
 <3cecc535-4291-4ce1-a25d-51db2b9d0415@gmail.com> <CADkTA4N=MwDmhcDRztDoha8-ezAioPOn4dWCvjWG4R_pS=U9uQ@mail.gmail.com>
In-Reply-To: <CADkTA4N=MwDmhcDRztDoha8-ezAioPOn4dWCvjWG4R_pS=U9uQ@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 14 May 2020 15:32:01 -0400
Message-ID: <CADkTA4PxjJ77sZ+zW=-ukcEub3wrJar3y2gde3QY_F+6+q2bVw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/4] kernel/reproducibility: factor kernel source epoch for common use
To: Joshua Watt <jpewhacker@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, steve@sakoman.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2020 at 3:25 PM Bruce Ashfield <bruce.ashfield@gmail.com> w=
rote:
>
> On Thu, May 14, 2020 at 1:11 PM Joshua Watt <jpewhacker@gmail.com> wrote=
:
> >
> >
> > On 5/13/20 9:24 AM, Bruce Ashfield wrote:
> >
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > Rather than duplicating the code to generate the kbuild environment
> > variable: KBUILD_BUILD_TIMESTAMP, we can factor the checks into a
> > python function and call it from the main image and kernel module
> > do_compile routines.
> >
> > All paths have been checked and the timestamp is identical to the
> > previous shell variant.
> >
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > ---
> >  meta/classes/kernel.bbclass | 43 ++++++++++++++++--------------------=
-
> >  1 file changed, 19 insertions(+), 24 deletions(-)
> >
> > diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> > index a3990aaf59..de63e1c0f6 100644
> > --- a/meta/classes/kernel.bbclass
> > +++ b/meta/classes/kernel.bbclass
> > @@ -153,6 +153,21 @@ python do_symlink_kernsrc () {
> >  }
> >  addtask symlink_kernsrc before do_configure after do_unpack
> >
> > +def get_kernel_source_date_epoch(d):
> > +    import subprocess
> > +
> > +    s_d_e =3D d.getVar("SOURCE_DATE_EPOCH")
> > +    if not s_d_e:
> > +        s_d_e =3D subprocess.check_output(['git', '--git-dir=3D%s/.gi=
t' % d.getVar('S'), 'log', '-1', '--pretty=3D%ct']).decode('utf-8')
> > +        if not s_d_e:
> > +            s_d_e =3D d.getVar("REPRODUCIBLE_TIMESTAMP_ROOTFS")
> > +
> > +    env =3D os.environ.copy()
> > +    env['LC_ALL'] =3D 'C'
> > +    ts =3D subprocess.check_output(['date', '-d @%s' % s_d_e]).decode=
('utf-8')
> > +
> > +    return ts
> > +
> >
> > Is there something special about the kernel that it can't use the SOUR=
CE_DATE_EPOCH guessing code from classes/reproducible_build.bbclass? If so,=
 is it possible there is some minor change we could make to the code to mak=
e it work? It seems a little unfortunate to replicate the logic to calculat=
e the SDE when that class does it already.
> >
>
> That's where it is getting the SOURCE_DATE_EPOCH from in the first
> line. Only if it isn't set is it falling back and querying the top git
> commit and finally the timestamp.
>
> Or at least that's what I understood it to be doing :D

.. or maybe that isn't what you are asking ? That python code is just
a direct replacement of the existing logic that is currently in the
kernel.bbclass that follows the kernel's guidelines for reproducible
builds. I wasn't looking to change the logic, or move it to another
class, just to avoid cutting and pasting the block of code into the
kernel module build phase (which is what I did in the first patch).

Cheers,

Bruce

>
> Bruce
>
> >
> >  inherit kernel-arch deploy
> >
> >  PACKAGES_DYNAMIC +=3D "^${KERNEL_PACKAGE_NAME}-module-.*"
> > @@ -291,19 +306,9 @@ get_cc_option () {
> >  kernel_do_compile() {
> >   unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
> >   if [ "${BUILD_REPRODUCIBLE_BINARIES}" =3D "1" ]; then
> > - # kernel sources do not use do_unpack, so SOURCE_DATE_EPOCH may not
> > - # be set....
> > - if [ "${SOURCE_DATE_EPOCH}" =3D "" -o "${SOURCE_DATE_EPOCH}" =3D "0"=
 ]; then
> > - # The source directory is not necessarily a git repository, so we
> > - # specify the git-dir to ensure that git does not query a
> > - # repository in any parent directory.
> > - SOURCE_DATE_EPOCH=3D`git --git-dir=3D"${S}/.git" log -1 --pretty=3D%=
ct 2>/dev/null || echo "${REPRODUCIBLE_TIMESTAMP_ROOTFS}"`
> > - fi
> > -
> > - ts=3D`LC_ALL=3DC date -d @$SOURCE_DATE_EPOCH`
> > - export KBUILD_BUILD_TIMESTAMP=3D"$ts"
> > + export KBUILD_BUILD_TIMESTAMP=3D"${@ get_kernel_source_date_epoch(d)=
}"
> >   export KCONFIG_NOTIMESTAMP=3D1
> > - bbnote "KBUILD_BUILD_TIMESTAMP: $ts"
> > + bbnote "KBUILD_BUILD_TIMESTAMP: $KBUILD_BUILD_TIMESTAMP"
> >   fi
> >   # The $use_alternate_initrd is only set from
> >   # do_bundle_initramfs() This variable is specifically for the
> > @@ -332,19 +337,9 @@ kernel_do_compile() {
> >  do_compile_kernelmodules() {
> >   unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
> >   if [ "${BUILD_REPRODUCIBLE_BINARIES}" =3D "1" ]; then
> > - # kernel sources do not use do_unpack, so SOURCE_DATE_EPOCH may not
> > - # be set....
> > - if [ "${SOURCE_DATE_EPOCH}" =3D "" -o "${SOURCE_DATE_EPOCH}" =3D "0"=
 ]; then
> > - # The source directory is not necessarily a git repository, so we
> > - # specify the git-dir to ensure that git does not query a
> > - # repository in any parent directory.
> > - SOURCE_DATE_EPOCH=3D`git --git-dir=3D"${S}/.git" log -1 --pretty=3D%=
ct 2>/dev/null || echo "${REPRODUCIBLE_TIMESTAMP_ROOTFS}"`
> > - fi
> > -
> > - ts=3D`LC_ALL=3DC date -d @$SOURCE_DATE_EPOCH`
> > - export KBUILD_BUILD_TIMESTAMP=3D"$ts"
> > + export KBUILD_BUILD_TIMESTAMP=3D"${@ get_kernel_source_date_epoch(d)=
}"
> >   export KCONFIG_NOTIMESTAMP=3D1
> > - bbnote "KBUILD_BUILD_TIMESTAMP: $ts"
> > + bbnote "KBUILD_BUILD_TIMESTAMP: $KBUILD_BUILD_TIMESTAMP"
> >   fi
> >   if (grep -q -i -e '^CONFIG_MODULES=3Dy$' ${B}/.config); then
> >   cc_extra=3D$(get_cc_option)
> >
> >
> >=20
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
