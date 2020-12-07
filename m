Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com [209.85.210.68])
 by mx.groups.io with SMTP id smtpd.web12.5185.1607342699578900477
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Dec 2020 04:04:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=HbhC32Oe;
 spf=pass (domain: konsulko.com, ip: 209.85.210.68, mailfrom: paul.barker@konsulko.com)
Received: by mail-ot1-f68.google.com with SMTP id d8so4273237otq.6
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Dec 2020 04:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=debrTvPqFZVegBuAiXTrVHTUkQDFjnzsBwmStFxO21Q=;
        b=HbhC32OeYqQHE8cLVBOl3wFhUFcHNP09MAQN9AcWBzupQJDMESwFjfkp+vFSv/aYqJ
         QOSZWYTMQrTyd7p9i0oQT1ZWCfkulOpxE9lduoWv2J+2c03njGO472+m83nl5H/QdaeL
         0NVkatBJfQW7upMRU+bZh5s1tcKNaZZzzB4bo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=debrTvPqFZVegBuAiXTrVHTUkQDFjnzsBwmStFxO21Q=;
        b=fuTorjd9X3KlOstyDnI45i8D572+j96ZRbAYR8pCAJ8joUapsTTlEkH4b+AaMCwzHe
         9ltedEswQ9+WqDtYhnA525Wb7lc/twt2XFACyPCxd2hY0cLQk2v8w2avLmxYn00V317B
         XgVxKcLNYqkIbjt1fMUrtSxi8YDWJDaq01bkU6+CwZT/KYhA7uKTXOKVezTD4DL/wdks
         AFgqc8JcLZRIH05oFHzTBPKp4ggwJ4jH76QzzOQ0+hvcgXd2/Ugt6qFbprYYhEoxk/pU
         65jY9s90VLgBHfK3EgJkyDhNuv52w0d0/vd6nV+9KG3XcutDHiFkNXKwnOBn0Rpc9frY
         qDMQ==
X-Gm-Message-State: AOAM530swHUkkzF9ziA1uAH2IDlM6nS+oZrN6+U6ZfQd+Jn5J2/N+VbL
	c9g9UAw1LeThS/OXwaDvgSGU7FXzTL5KjdhJwkGCJA==
X-Google-Smtp-Source: ABdhPJwillKPbbvsd6iezJH10EnwqCQh7z/3QQF0noyuqLPr84/XaT3qaVSNV/OT5du2eiqMr/+FdPhBUWauny3I9v8=
X-Received: by 2002:a9d:220c:: with SMTP id o12mr12640065ota.92.1607342698840;
 Mon, 07 Dec 2020 04:04:58 -0800 (PST)
MIME-Version: 1.0
References: <cover.1606846217.git.pkj@axis.com> <b7bae6e1633fba206d9c7abad93d79fbe7b0f654.1606846217.git.pkj@axis.com>
 <CAM9ZRVtVRk2CrBKeG=Ks8a+OPhTPKu6q=HctT39tKyYCbAguFA@mail.gmail.com>
In-Reply-To: <CAM9ZRVtVRk2CrBKeG=Ks8a+OPhTPKu6q=HctT39tKyYCbAguFA@mail.gmail.com>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Mon, 7 Dec 2020 12:04:48 +0000
Message-ID: <CAM9ZRVsX+r31zxDHDNA7BOiBCrGyrwwYJWwMmjdF6p69QScJUg@mail.gmail.com>
Subject: Re: [OE-core] [PATCHv3 2/5] bitbake.conf: Add all layers (from BBLAYERS) to PSEUDO_IGNORE_PATHS
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 7 Dec 2020 at 10:29, Paul Barker <pbarker@konsulko.com> wrote:
>
> On Tue, 1 Dec 2020 at 18:12, Peter Kjellerstedt
> <peter.kjellerstedt@axis.com> wrote:
> >
> > Instead of ignoring ${COREBASE}/meta in PSEUDO_IGNORE_PATHS (which may
> > or may not ignore all layers depending on how they are named and placed
> > under ${COREBASE}), ignore all layers.
> >
> > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > ---
> >  meta/conf/bitbake.conf | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index 0d38eac094..9742fe4fe2 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -685,7 +685,7 @@ SRC_URI =3D ""
> >  PSEUDO_LOCALSTATEDIR ?=3D "${WORKDIR}/pseudo/"
> >  PSEUDO_PASSWD ?=3D "${STAGING_DIR_TARGET}:${PSEUDO_SYSROOT}"
> >  PSEUDO_SYSROOT =3D "${COMPONENTS_DIR}/${BUILD_ARCH}/pseudo-native"
> > -PSEUDO_IGNORE_PATHS =3D "/usr/,/etc/,/lib,/dev/,${T},${WORKDIR}/recipe=
-sysroot,${SSTATE_DIR},${STAMPS_DIR},${WORKDIR}/pkgdata-sysroot,${TMPDIR}/s=
state-control,${DEPLOY_DIR},${WORKDIR}/deploy-,${TMPDIR}/buildstats,${WORKD=
IR}/sstate-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/sst=
ate-build-image_complete,${TMPDIR}/sysroots-components,${BUILDHISTORY_DIR},=
${TMPDIR}/pkgdata,${TOPDIR}/cache,${COREBASE}/scripts,${COREBASE}/meta,${CC=
ACHE_DIR}"
> > +PSEUDO_IGNORE_PATHS =3D "/usr/,/etc/,/lib,/dev/,${T},${WORKDIR}/recipe=
-sysroot,${SSTATE_DIR},${STAMPS_DIR},${WORKDIR}/pkgdata-sysroot,${TMPDIR}/s=
state-control,${DEPLOY_DIR},${WORKDIR}/deploy-,${TMPDIR}/buildstats,${WORKD=
IR}/sstate-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/sst=
ate-build-image_complete,${TMPDIR}/sysroots-components,${BUILDHISTORY_DIR},=
${TMPDIR}/pkgdata,${TOPDIR}/cache,${COREBASE}/scripts,${@','.join(d.getVar(=
'BBLAYERS').split())},${CCACHE_DIR}"
>
> This has now landed in master and unfortunately it breaks the way I
> run builds. I often end up building inside a layer directory. For
> example the one that failed this morning has:
>
>     BBLAYERS ?=3D " \
>         /home/pbarker/Projects/Yocto/meta-linux-mainline \
>         /home/pbarker/Projects/Yocto/meta-linux-mainline/layers/poky/meta=
 \
>         /home/pbarker/Projects/Yocto/meta-linux-mainline/layers/poky/meta=
-poky"
>
> TOPDIR is "/home/pbarker/Projects/Yocto/meta-linux-mainline/build" and
> TMPDIR is "${TOPDIR}/tmp". So everything under TMPDIR is now ignored
> by pseudo and various do_install/do_package tasks fail.
>
> I don't think this will just affect me as this is a common pattern,
> especially when using something like kas to setup builds.
>
> Before we revert this I'd like to understand the problem this patch is
> trying to fix. Is there a specific reason why you need to ignore all
> layer directories? I'm not 100% sure why "${COREBASE}/meta" is ignored
> anyway though I guess it is to reduce pseudo db size and so speed up
> builds.

To follow up some more: The entries in PSEUDO_IGNORE_PATHS are treated
as string prefixes within pseudo. So if
"/home/pbarker/Projects/Yocto/meta-linux-mainline" is added to the
ignore list it will exclude not just
"/home/pbarker/Projects/Yocto/meta-linux-mainline/build" but also
""/home/pbarker/Projects/Yocto/meta-linux-mainline-build".

I wonder if some more of those entries should have trailing slashes.

--=20
Paul Barker
Konsulko Group
