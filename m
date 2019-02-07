Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 23D5A7C3A1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Feb 2019 14:53:35 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id v11so153964qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Feb 2019 06:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=/yPrhBgNZbbvl42SVSd11Kgii4cpjuym8NURJbnvaZY=;
	b=TVYMzgOOoXN8nUKMdplI/BcrUMKA+kuwh81sJk4eMDGdpwmDmuyxL+t89npIYb1ho7
	HaY5EfWat3dGu8lBh8SUwUWkmALwdn/4TmLVrSgVkQ5sfslrluftbQrGHU48kukbbCS5
	n+EJq90QtquEH/9jeQquZcQ02p05c1qQaqr/XX3VoGhXR604WR9gHXtWcnFfb+hFJesJ
	ZgqP/oh6JNsyuQUrB3PnzfZmITqaYGFw0X5o++tJMpiR13ykbnRCCcGeSJpssfgmtH4L
	fMHiwDShtLk/tr2GdErl61FB7M2O11UvQeRc4Z1hNsBdq14xYfRjvYaH2RPQuNxorFBI
	yNkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/yPrhBgNZbbvl42SVSd11Kgii4cpjuym8NURJbnvaZY=;
	b=LyJRZreRG54cgZW66uXYHKGQElljbHFERWmH6Z/F4YH5RgFyqrjnZe+aG3KeCM6c7d
	uoLrrUfq1ax2THcQ0xfevdde+Uste7VMH1WQeQUr+U5dy6BMcoyEMZSriWc7X6CWtpYs
	RyXenOlfdq48Pqz6rf5wuhOSveGaY/VdCXXhq75HTbaCjL9evvDLiWyrLO1N3Lm9bAxG
	A/pblo30MUxtIdkQfYVV61L4YlGyPFR/2B0Wbbo+S4Rokz18G9JS6tiZu8YXDAhwTSWo
	ceCTNZgkBWK4OgM8/qFLu2GyYJumfQzPoU4NV3ejXxGoWInzvmT223S4oPoFHW7HuwY9
	Gmtw==
X-Gm-Message-State: AHQUAuayBQNk4hQHH0mJwDGq5JAWtwIdhEKBdsV5uzkC+EnTujGEcd/P
	FY6chLAxOeNWUM7Zyu9RZD8jiwUaWlGiflIGE+2GTQ==
X-Google-Smtp-Source: AHgI3IY+a7ChA3zAk5fpt+BPnwz/rgRObUU06mHVRRomGN5YM2fd6Q2Rzzfw/KdvHxyfL2ft/p8bYkwg0fuUWxTfIXM=
X-Received: by 2002:ac8:300a:: with SMTP id f10mr1954756qte.236.1549551216869; 
	Thu, 07 Feb 2019 06:53:36 -0800 (PST)
MIME-Version: 1.0
References: <20190207003537.7135-1-raj.khem@gmail.com>
	<58853c532317426d98d4b4a641a87780@XBOX04.axis.com>
In-Reply-To: <58853c532317426d98d4b4a641a87780@XBOX04.axis.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 Feb 2019 06:53:12 -0800
Message-ID: <CAMKF1soXc=CEgXTBgcZWMFTfu6iDfHmPFyB92RGJ=PpCbAYdmg@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc-locale: Rewrite do_install using install utility instead of cp
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Feb 2019 14:53:36 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 7, 2019 at 3:44 AM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> > core-bounces@lists.openembedded.org> On Behalf Of Khem Raj
> > Sent: den 7 februari 2019 01:36
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [PATCH] glibc-locale: Rewrite do_install using
> > install utility instead of cp
> >
> > This has been a constant source of trouble for build failures due to
> > host-user-contaminated QA errors of sort
> >
> > ERROR: QA Issue: glibc-locale: /glibc-binary-localedata-ca-
> > es+valencia/usr/lib/locale/ca_ES@valencia/LC_MONETARY is owned by uid
> > 3004, which is the same as the user running bitbake. This may be due to
> > host contamination [host-user-contaminated]
> >
> > So far we have tried to mould cp command into not carrying the build
> > user permissions into install area but it is never entirely fixed since
> > the issue keeps popping up in various scenes
> >
> > This patch replaces use of cp with install utility and specifies
> > install mode for files explcitly
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-core/glibc/glibc-locale.inc | 44 ++++++++++++++----------
> >  1 file changed, 25 insertions(+), 19 deletions(-)
> >
> > diff --git a/meta/recipes-core/glibc/glibc-locale.inc b/meta/recipes-core/glibc/glibc-locale.inc
> > index 6384f9cbf1..9b256a5108 100644
> > --- a/meta/recipes-core/glibc/glibc-locale.inc
> > +++ b/meta/recipes-core/glibc/glibc-locale.inc
> > @@ -72,27 +72,33 @@ FILES_localedef = "${bindir}/localedef"
> >  LOCALETREESRC = "${COMPONENTS_DIR}/${PACKAGE_ARCH}/glibc-stash-locale"
> >
> >  do_install () {
> > -     mkdir -p ${D}${bindir} ${D}${datadir}
> > -     if [ -n "$(ls ${LOCALETREESRC}/${bindir})" ]; then
> > -             cp -R --no-dereference --preserve=mode,links ${LOCALETREESRC}/${bindir}/* ${D}${bindir}
> > -     fi
> > -     if [ -n "$(ls ${LOCALETREESRC}/${localedir})" ]; then
> > -             mkdir -p ${D}${localedir}
> > -             cp -R --no-dereference --preserve=mode,links ${LOCALETREESRC}/${localedir}/* ${D}${localedir}
> > -     fi
> > +        install -d ${D}${bindir}
> > +        find "${LOCALETREESRC}/${bindir}" -maxdepth 1 -type f \
> > +        -exec install -m 0755 -t "${D}${bindir}" {} \;
> > +
> > +        for d in . $(find "${LOCALETREESRC}/${localedir}" -type d -printf '%P ') ; do
> > +                install -d "${D}${localedir}/$d"
> > +                find "${LOCALETREESRC}/${localedir}/$d" -maxdepth 1 -type f \
> > +                -exec install -m 0644 -t "${D}${localedir}/$d" {} \;
> > +        done
> >       if [ ${@d.getVar('PACKAGE_NO_GCONV')} -eq 0 ]; then
> > -             mkdir -p ${D}${libdir}
> > -             if [ -e ${LOCALETREESRC}/${libdir}/gconv ]; then
> > -                     cp -R --no-dereference --preserve=mode,links ${LOCALETREESRC}/${libdir}/gconv ${D}${libdir}
> > -             fi
> > -             if [ -e ${LOCALETREESRC}/${datadir}/i18n ]; then
> > -                     cp -R --no-dereference --preserve=mode,links ${LOCALETREESRC}/${datadir}/i18n ${D}${datadir}
> > -             fi
> > -     fi
> > -     if [ -e ${LOCALETREESRC}/${datadir}/locale ]; then
> > -             cp -R --no-dereference --preserve=mode,links ${LOCALETREESRC}/${datadir}/locale ${D}${datadir}
> > +                for d in . $(find "${LOCALETREESRC}/${libdir}/gconv" -type d -printf '%P ') ; do
> > +                        install -d "${D}${libdir}/gconv/$d"
> > +                        find "${LOCALETREESRC}/${libdir}/gconv/$d" -maxdepth 1 -type f \
> > +                        -exec install -m 0755 -t "${D}${libdir}/gconv/$d" {} \;
> > +                done
> > +                for d in . $(find "${LOCALETREESRC}/${datadir}/i18n" -type d -printf '%P ') ; do
> > +                        install -d "${D}${datadir}/i18n/$d"
> > +                        find "${LOCALETREESRC}/${datadir}/i18n/$d" -maxdepth 1 -type f \
> > +                        -exec install -m 0644 -t "${D}${datadir}/i18n/$d" {} \;
> > +                done
> >       fi
> > -     cp -R --no-dereference --preserve=mode,links ${LOCALETREESRC}/SUPPORTED ${WORKDIR}
> > +        for d in . $(find "${LOCALETREESRC}/${datadir}/locale" -type d -printf '%P ') ; do
> > +                install -d "${D}${datadir}/locale/$d"
> > +                find "${LOCALETREESRC}/${datadir}/locale/$d" -maxdepth 1 -type f \
> > +                -exec install -m 0644 -t "${D}${datadir}/locale/$d" {} \;
> > +        done
> > +     install -m 0644 ${LOCALETREESRC}/SUPPORTED ${WORKDIR}/SUPPORTED
> >  }
> >
> >  inherit libc-package
> > --
> > 2.20.1
>
> May I suggest using a help function to simplify the code a lot:
>
> copy_locale_files() {
>         local dir=$1 mode=$2
>
>         [ -e "${LOCALETREESRC}$dir" ] || return 0
>
>         for d in . $(find "${LOCALETREESRC}$dir" -type d -printf '%P '); do
>                 install -d ${D}$dir/$d
>                 find "${LOCALETREESRC}$dir/$d" -maxdepth 1 -type f \
>                      -exec install -m $mode -t "${D}$dir/$d" {} \;
>         done
> }
>
> do_install() {
>         copy_locale_files ${bindir} 0755
>         copy_locale_files ${localedir} 0644
>         if [ ${PACKAGE_NO_GCONV} -eq 0 ]; then
>                 copy_locale_files ${libdir}/gconv 0755
>                 copy_locale_files ${datadir}/i18n 0644
>         fi
>         copy_locale_files ${datadir}/locale 0644
>         install -m 0644 ${LOCALETREESRC}/SUPPORTED ${WORKDIR}/SUPPORTED
> }
>
> The code above is untested, but I think I got it reasonably correct.
> Also note that I have restored the indentation to use tabs, and
> turned the access to the ${PACKAGE_NO_GCONV} variable into a
> simple variable instead of using d.getVar().
>

thats a neat idea.  I will send a v2 with this

> //Peter
>

