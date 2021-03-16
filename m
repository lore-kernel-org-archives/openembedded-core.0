Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web10.88.1615913781655644200
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Mar 2021 09:56:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=c61xsSur;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id n79so35941770qke.3
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Mar 2021 09:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RW6/ISr9iwU7uIeT2hfhzYxkzWRD5Pw8TOEq25x7y68=;
        b=c61xsSurAMkFEcX55lqlQr7WNpLBgJvt1bsFrEUET7aqfOiTlebnwR4jQuCczNbKc9
         hWfwcFIDlMKvWVDWDqA2Wu1FVWnWqa/EXnC23rq1pbaTMOnfE/q4usEwrRVAFe4kbh3N
         8JejL2W1G77vQmX39T9XosD4PpI9cZZ6JEgRdz0NZ9/Fe/7C9srlvVQRkBeUozS2pDiZ
         9GajhWhbi5Poy7jjr0y/oxZKY6yj5CVmWkEqyR2rNTooMl9PgJmVTPtZeG9SHGv2Hx5b
         RgSAkzLazq7SbuTpdtnWRfJYLX8WQgwNLUOdF2nqwWsw1ehLk0XUoZ7o6m2iiIIR6KRf
         vDuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RW6/ISr9iwU7uIeT2hfhzYxkzWRD5Pw8TOEq25x7y68=;
        b=IrIsJFKE7bY4J2To9oCeR317oG1FnWMG+wzZAydJE4EC01is5UDpJ+RJ1ouwMcmdRR
         zamrVUX81+KeEOLgOh8qbfgg8zzXDafuMUh1AZa+ZjTj8g+ilrJlQBoqxQDhc8ldYrf8
         6VOewENCS1Ly6i8nlpXaTGrXlhdrZzuimreKhUO/fDQw35Kce67kg96nnJSCdfO4vPZL
         RkJPNEBGRDwVO3RSdWdRxMQrNSILMzFnatsycaK+CXGsX9ZDkTpZjW4hKGESBEmv4E9y
         xQlqqWwkn2Eple5HyAvfxpEvvG3LznuVIuRQuhzvIFh0t1kSuNOFiAxtGXfx0kJUmY/3
         eKlg==
X-Gm-Message-State: AOAM531D3SucYWCM+Fo9/UcB6hrhGVvnpahEu2e30Qixo20OLqJcF+aP
	+eaPgBbcGRWGbIEU4QdX243R8DsnO+fJxq6Q9dU=
X-Google-Smtp-Source: ABdhPJyd2tzvLh7PLQHEVn8FhgQhsW4GBCNAPMj+ImptOqhw8+c0/s3sL/9NR9RBCmgaz+0rmOiEi6QXrC8f1W/fE5E=
X-Received: by 2002:a37:8ec4:: with SMTP id q187mr501309qkd.381.1615913780779;
 Tue, 16 Mar 2021 09:56:20 -0700 (PDT)
MIME-Version: 1.0
References: <166CA878538D6557.30053@lists.openembedded.org>
 <510db8eb-fcb2-ca15-3813-b3d52e51fce6@broadcom.com> <6272b57339e51667b691af97acb70435811e5083.camel@gmail.com>
In-Reply-To: <6272b57339e51667b691af97acb70435811e5083.camel@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 16 Mar 2021 09:55:53 -0700
Message-ID: <CAMKF1soyA72Ue65jPYBsLNhCJaYm6_mAu1U0PMi2gpm70hr6Xg@mail.gmail.com>
Subject: Re: [OE-core] unwanted linux kernel image added to /boot directory
To: Max Krummenacher <max.oss.09@gmail.com>
Cc: Scott Branden <scott.branden@broadcom.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 16, 2021 at 3:47 AM Max Krummenacher <max.oss.09@gmail.com> wrote:
>
> Hi
>
> Am Montag, den 15.03.2021, 20:13 -0700 schrieb Scott Branden via lists.openembedded.org:
> > It appears that inherit of the kernel_do_install routine is called which causes the linux
> > image to be installed in /boot.  I added a quick and dirty hack to inhibit this behaviour.
> > Could someone please comment on a proper solution:
> >
> > diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> > index ddff2ddcd2..527f6ca85d 100644
> > --- a/meta/classes/kernel.bbclass
> > +++ b/meta/classes/kernel.bbclass
> > @@ -428,7 +428,9 @@ kernel_do_install() {
> >
> >         for imageType in ${KERNEL_IMAGETYPES} ; do
> >                 if [ $imageType != "fitImage" ] || [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ] ; then
> > -                       install -m 0644 ${KERNEL_OUTPUT_DIR}/$imageType
> > ${D}/${KERNEL_IMAGEDEST}/$imageType-${KERNEL_VERSION}
> > +                       if [ "${INHIBIT_IMAGE_IN_BOOT}" != "1" ] ; then
> > +                               install -m 0644 ${KERNEL_OUTPUT_DIR}/$imageType
> > ${D}/${KERNEL_IMAGEDEST}/$imageType-${KERNEL_VERSION}
> > +                       fi
> >                 fi
> >         done
> >
> >
> > On 2021-03-15 4:39 p.m., Scott Branden via lists.openembedded.org wrote:
> > > Hello,
> > >
> > > There seems to be a problem when a kernel module is added to an initramfs image.
> > >
> > > As soon as I add a recipe which installs an external kernel module into an initramfs image it
> > > automatically installs the linux kernel image in a /boot directory.
> > >
> > > This is really bad as it increases the size of the initramfs image.
> > >
> > > /boot/Image should not be installed in the image when an external kernel module is added to an
> > > image.
> > >
> > > Can someone suggest a fix to this issue?
> > >
>
> One usually does in the machine configuration:
>
> RDEPENDS_${KERNEL_PACKAGE_NAME}-base = ""

this should work too.
>
> Max
>
>
> 
>
