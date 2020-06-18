Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web11.6505.1592484359020301724
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2020 05:45:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=A+Gj8fng;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id w16so6260604ejj.5
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2020 05:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y7do4mRHTg2x7xOy+Npvj+CWpTMy76G4q4Af4AL3soQ=;
        b=A+Gj8fngp4h4TqRq9gnLsIJb/74w64071CPtjgcR4qEgIB6FLic8MkzEpq2wiyRE+4
         VfU502832MJiZ/oknBv1YnCUyOaxTlSdzBXa1zUuZc4oTPBNeY20rcePNKxosyDsaSu4
         rwjxcHnzKIpEVuNic3K8jt7+PawtXPnkiWz9wFp26zELyL9LqOX9hSbDF+ziQQbeCwLc
         vcXGi9xJGXsdAUoytxWyCiGlJtnup5GDTBD5jjhxfBVZZsPSBpmG0iHjAuKz53uQF4uX
         bjLmyYKpgUieXM+YIOmFF5E8JsIUmiLpOuJbhzbUBqTxmXnqK4Ixe6tXG9YkIjruRl+m
         QMmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y7do4mRHTg2x7xOy+Npvj+CWpTMy76G4q4Af4AL3soQ=;
        b=NAXIVXLjUQs8bIz28ExJSp8qI8azuTqlGPkUhaHJME62deAdvQszLUmJJD9sWMha4/
         QovVFPgyIceC4t6VNxxZ9Yvqt7sJWCq7txd+WLVh7210+/ecAWOxk7pNIOmyBoFmHdxC
         8LXp7HsISGfzQhWkZzFSGiLU/gCKVx2lbxlNhKvIuQPh+tacZCccy6wddv9vfGLP6ydo
         M2pyr7Xl0ymxOu1BtuvEbOk/HVCtw3gO0k2CXG3A2na6tcuBVPuuuVVGasJrl84twF5n
         U91BhL/AhXWDeQ8M6PcS0g2M2Izf1bZN27xu9xG9ieqvArYLqW5d3Ai0XGpsROtwFL9w
         4FFg==
X-Gm-Message-State: AOAM532Kt+2zoJgTbFe0YaBJYiNfyO86t++lNTZE445RgM79wnOrB+VX
	Fw+G4pEtj4Kegm4dHUCRFCyyFhsb+dSxkSL4Ep8aJmZbPnQ=
X-Google-Smtp-Source: ABdhPJwH7BZWL/10f9i2DZBhMA3tub2Ki2rW2w5tDJOkV0fWkka2p2M9bR2buS0MWlJtu3iaOW9Aj4shEUMrVBjSLmM=
X-Received: by 2002:a17:906:5fcd:: with SMTP id k13mr3641394ejv.459.1592484357501;
 Thu, 18 Jun 2020 05:45:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200618075725.39434-1-yanfei.xu@windriver.com> <5e93588e648dfac9263dfc9520ba9b205d933703.camel@linuxfoundation.org>
In-Reply-To: <5e93588e648dfac9263dfc9520ba9b205d933703.camel@linuxfoundation.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 18 Jun 2020 08:45:46 -0400
Message-ID: <CADkTA4MBcpp+Kf6xJg3y4MKgfpM0SMZ2tUoJByDTcoJp5hY-FQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] classes/kernel: Use a copied image for kernel*.rpm if fs don't support symlinks
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "Xu, Yanfei" <yanfei.xu@windriver.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, He Zhe <zhe.he@windriver.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 18, 2020 at 5:52 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2020-06-18 at 15:57 +0800, Xu, Yanfei wrote:
> > From: Yanfei Xu <yanfei.xu@windriver.com>
> >
> > Some filesystems don't support symlink, then you will get failure when
> > you install or update the kernel rpm package. Now we use a copied iamge
> > for these filesystems instead of symlink.
> >
> > Suggested-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
> > ---
> >  meta/classes/kernel.bbclass | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> > index 41101a64a0..749d1a0f29 100644
> > --- a/meta/classes/kernel.bbclass
> > +++ b/meta/classes/kernel.bbclass
> > @@ -94,6 +94,14 @@ python __anonymous () {
> >          d.appendVar('RDEPENDS_%s-image' % kname, ' %s-image-%s' % (kname, typelower))
> >          d.setVar('PKG_%s-image-%s' % (kname,typelower), '%s-image-%s-${KERNEL_VERSION_PKG_NAME}' % (kname, typelower))
> >          d.setVar('ALLOW_EMPTY_%s-image-%s' % (kname, typelower), '1')
> > +        d.setVar('pkg_postinst_ontarget_%s-image-%s' % (kname,typelower), """
> > +set +e
> > +ln -sf %s-${KERNEL_VERSION} ${KERNEL_IMAGEDEST}/%s > /dev/null 2>&1
> > +if [ $? -ne 0 ]; then
> > +    echo "Filesystem on ${KERNEL_IMAGEDEST}/ doesn't support symlinks, falling back to copied image (%s)."
> > +fi
> > +set -e
> > +""" % (type, type, type))
> >
> >      image = d.getVar('INITRAMFS_IMAGE')
> >      # If the INTIRAMFS_IMAGE is set but the INITRAMFS_IMAGE_BUNDLE is set to 0,
> > @@ -386,7 +394,7 @@ kernel_do_install() {
> >       for imageType in ${KERNEL_IMAGETYPES} ; do
> >               install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType} ${D}/${KERNEL_IMAGEDEST}/${imageType}-${KERNEL_VERSION}
> >               if [ "${KERNEL_PACKAGE_NAME}" = "kernel" ]; then
> > -                     ln -sf ${imageType}-${KERNEL_VERSION} ${D}/${KERNEL_IMAGEDEST}/${imageType}
> > +                     install -m 0644 ${D}/${KERNEL_IMAGEDEST}/${imageType}-${KERNEL_VERSION} ${D}/${KERNEL_IMAGEDEST}/${imageType}
> >               fi
> >       done
> >       install -m 0644 System.map ${D}/boot/System.map-${KERNEL_VERSION}
>
> I am a bit concerned about this since whilst it solves one problem,
> doesn't having two copies of the same file around significantly
> increase the size of the packages and the update payloads updating such
> systems would need? Are these two copies of the file in the same
> package or not?
>
> Perhaps the symlink creation should fall back to a copy on device
> rather than having the copy at build time (as I understand it)?

This was my question in v1 as well, looks like we've consolidated on
that option now :D

Bruce

>
> Cheers,
>
> Richard
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
