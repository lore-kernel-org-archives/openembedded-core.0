Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id CE1AE7C3DD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Feb 2019 14:50:08 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id y20so53260qtm.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Feb 2019 06:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=eRKsb/eYKxaVYPjQiAifxaVHRIN7peCsEFT9vL5YNTA=;
	b=C90B8dNxkW9LH7EzQ1SSC1/BbPOSXY4PMteRt/gVPzpHTcBqh/Wa9MK394a7P85NhQ
	9nNMV2Wx9eIUFxQ6+wGeFvBywAGjlkDXULBYQ7w0vsIg5gy337Kzv009K9nXBiYtcw2K
	qB85TjIG1+ka3nil/jlddHhT4mOlYPYALQQina+1IKsLkjraXT6BJr/RKvFJsVwPnrLx
	kiNztdFZuxjW5pIXFEFS9iXcn5YbGGX/cwrzifAaFhLubZxZrlXH7QsiMZ4DGj+jv0NZ
	Oc+W6EgT+d2V5TnVFxzhJxiEzpvzVTMsqgSEFWqWam75FUkBBs/mw3k4x285tSCzRtb7
	XzDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=eRKsb/eYKxaVYPjQiAifxaVHRIN7peCsEFT9vL5YNTA=;
	b=rUXiC7iod9em+MzuVN2EZ5DPAz4qysxk2wFh8ghK+WbH9rtjWGEGCeCZczyzRus7bn
	3rXb4C3C/wLyZ6jGiJK31pbJYZ/kPLWIRGH3x29aZO6D3K1dUgb1h6At4dhHOvu4sYwB
	Ks6PWC0YPh9vT+udS+L1/tNUBPXiU3M9mi0/f6jRpIhXtLlYDm4wnkdjSfsQ4nTmj1q1
	Fc7OObU+Vu5rS9zpMQ5MJ0YWJyKhmRGdovoHeiwC8foCKbbOaiHj21/2hleB0quqA4Gg
	86rhGT1Ukmn4kNkJ3wCM2M2GR1T7sEOJSkrpy/6J0tIAgBxNEO78aBFxMRLAvUfu6xVY
	Fuvw==
X-Gm-Message-State: AHQUAuYkQzXjr7xv3/o14hIJrFmalxy2rttxmR/wNESp3f8ArkozIH9u
	wcM2wIrE91NUOztxYehw99kN8+ZJ4EwPpZQJY3E=
X-Google-Smtp-Source: AHgI3IY8ISAxGGxfk6JmU9tHhmU0ktMUsn2lZU4DFZ/ZriiJmCH0zFjsw0febNyLb47N3Kab2ghHZTqhvC2j0sUUrFM=
X-Received: by 2002:a0c:c103:: with SMTP id f3mr10381517qvh.194.1549551009329; 
	Thu, 07 Feb 2019 06:50:09 -0800 (PST)
MIME-Version: 1.0
References: <20190207003537.7135-1-raj.khem@gmail.com>
	<88a02e81ed831ed4fba8adbd9e18f1a35dbf098d.camel@linuxfoundation.org>
In-Reply-To: <88a02e81ed831ed4fba8adbd9e18f1a35dbf098d.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 Feb 2019 06:49:45 -0800
Message-ID: <CAMKF1sr9DyoaDpbz0O=1kur3-WRS=8FEuaq70YSfuSj71S_VkA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Thu, 07 Feb 2019 14:50:09 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 7, 2019 at 1:00 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2019-02-06 at 16:35 -0800, Khem Raj wrote:
> > This has been a constant source of trouble for build failures due to host-user-contaminated QA
> > errors of sort
> >
> > ERROR: QA Issue: glibc-locale: /glibc-binary-localedata-ca-es+valencia/usr/lib/locale/ca_ES@valencia/LC_MONETARY is owned by uid 3004, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
> >
> > So far we have tried to mould cp command into not carrying the build
> > user permissions into install area but it is never entirely fixed since
> > the issue keeps popping up in various scenes
> >
> > This patch replaces use of cp with install utility and specifies install
> > mode for files explcitly
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
>
> The trouble is this is a workaround. The cp commands should work and
> there is some underlying issue in pseudo causing this. We really need
> to figure out what that is since this will likely just mean we see the
> problem somewhere else :(

so far this is the only place where it shows in world builds that
meta-oe does which includes many layers.

>
> I still suspect some kind of inode number reuse problem which these cp
> commands trigger...

cp and install are not same when it comes to how they operate
underneath. install is better when it comes to what we are doing here
it also gives better control of permissions and mods,as a recipe writer
someone would prefer then to let the tool ( cp ) assume it.

So there might be a pseudo issue, I dont disagree but not obvious and
I believe using cp is subpar anyway.

>
> Cheers,
>
> Richard
>

