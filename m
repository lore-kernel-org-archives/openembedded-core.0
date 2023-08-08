Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1D59C001DB
	for <webhook@archiver.kernel.org>; Tue,  8 Aug 2023 07:59:28 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
 by mx.groups.io with SMTP id smtpd.web10.56851.1691481566459868014
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Aug 2023 00:59:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=cwccYTSd;
 spf=pass (domain: gmail.com, ip: 209.85.166.41, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-790976d86a1so214246239f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 00:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691481565; x=1692086365;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W4AoLj1u2mFWqqHCiL0DYBUjkrihFUcwDd76kyCO/z0=;
        b=cwccYTSdveXmNBWaELQ6Ubk13ZmXZN+F8G7DgFGGZxRX3rO2i6Qg6fLg2FSQAZi9cj
         hZR10aoNZ6qM3bkyY40tDvfEJSe3HSuydknG4xg2RsaU2ozw78jxDQH7/k/pxu76o1j5
         3UPyqPhahO75rap+QNXASpS7WIazaIoq19wloOEa8ibXjzp7AsQzfs4qCsy5ciqyHWqM
         UNDxrT+BCSTOC7P+tIMyMjrPhnJp0uMp0TQSbZEelbWgmIWrQ/UFcwP0woqXfbO4eCRd
         337AYLOVjf17nJpBAXiCq3FhlbZ8yaJHP/gT5fDKlulzn3cNiBap2c6jTa6yI7eXg5Be
         3rtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691481565; x=1692086365;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W4AoLj1u2mFWqqHCiL0DYBUjkrihFUcwDd76kyCO/z0=;
        b=huxNZtmGFIFWpQn1HWcG2AdCdbhGBx0BZrOKLY6e0ZxctBeae9jP+RNA+10h8QGQBA
         sw1Q39SDHEfV6dJTKefMtj5VbP+69ZfmBidIkaKzDYXjjoe+Ps89pEzPkGpvWNprFhKg
         HFbpGy1OC+UP7VvguIwQfaIopaRdPlS+aD6eXAYdXDVRc+B749cabFlXAjt7H6t7n5K+
         dpB2u4AMwVHBWlnLurjV+EIpioYrG7Tlr8XjFN0Ao9M8nU9s7tvgjz3K+LieDZ1C+bep
         3bIx+cayBFNH+yXP83YfzbhnkE4OFRaJoibWhCviB8dGZa46i+G0cHr1iu3TJ1g96kyx
         PGlw==
X-Gm-Message-State: AOJu0Yx0JRvhuRpNl3nmRGImmMkOTnflsBPHY+rWpiKBATik3wgBrxgS
	B9X+12CO49zmSRVJUXMBBbF30XYHeOJpjWC1NX4=
X-Google-Smtp-Source: AGHT+IGPyWkFtfgM8MElh55Sxe1Lj2SEVNd0O3uVdDLIf+GluMg2eNPcTSIPbiR02QZGbX6kV0POwCciCualKnUb+GY=
X-Received: by 2002:a5d:91d9:0:b0:783:62d0:88c with SMTP id
 k25-20020a5d91d9000000b0078362d0088cmr12952884ior.19.1691481565544; Tue, 08
 Aug 2023 00:59:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230720102014.11236-1-alex.kiernan@gmail.com> <DB5PR02MB10213CFC8D205771414A08CE4EF0CA@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB10213CFC8D205771414A08CE4EF0CA@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 8 Aug 2023 08:59:14 +0100
Message-ID: <CAO5Uq5SjFDcgo3DujxZLrc_ozDbASDuP3LZq6uJmBrYadPa5sg@mail.gmail.com>
Subject: Re: [OE-Core][PATCH v2 1/3] rootfs: Add debugfs package db file copy
 and cleanup
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 07:59:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185651

On Mon, Aug 7, 2023 at 9:21=E2=80=AFPM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-core@lists=
.openembedded.org> On Behalf Of Alex Kiernan
> > Sent: den 20 juli 2023 12:20
> > To: openembedded-core@lists.openembedded.org
> > Cc: Alex Kiernan <alex.kiernan@gmail.com>
> > Subject: [OE-Core][PATCH v2 1/3] rootfs: Add debugfs package db file co=
py and cleanup
> >
> > When copying the package database files for the debugfs, add individual
> > file copy as well as tree copying. After the debug rootfs has been
> > created, cleanup the package files.
> >
> > This then allows us to avoid a problem where (for rpm at least)
> > extraneous files in the debug rootfs would cause failures during
> > oe-selftest because some files existed in both regular and debugfs
> > images.
> >
> > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > ---
> >
> > Changes in v2:
> > - New in v2
> >
> >  meta/lib/oe/rootfs.py | 20 ++++++++++++++------
> >  1 file changed, 14 insertions(+), 6 deletions(-)
> >
> > diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
> > index 890ba5f03984..1a48ed10b3f6 100644
> > --- a/meta/lib/oe/rootfs.py
> > +++ b/meta/lib/oe/rootfs.py
> > @@ -106,7 +106,7 @@ class Rootfs(object, metaclass=3DABCMeta):
> >      def _cleanup(self):
> >          pass
> >
> > -    def _setup_dbg_rootfs(self, dirs):
> > +    def _setup_dbg_rootfs(self, package_paths):
> >          gen_debugfs =3D self.d.getVar('IMAGE_GEN_DEBUGFS') or '0'
> >          if gen_debugfs !=3D '1':
> >             return
> > @@ -122,11 +122,12 @@ class Rootfs(object, metaclass=3DABCMeta):
> >          bb.utils.mkdirhier(self.image_rootfs)
> >
> >          bb.note("  Copying back package database...")
> > -        for dir in dirs:
> > -            if not os.path.isdir(self.image_rootfs + '-orig' + dir):
> > -                continue
> > -            bb.utils.mkdirhier(self.image_rootfs + os.path.dirname(dir=
))
> > -            shutil.copytree(self.image_rootfs + '-orig' + dir, self.im=
age_rootfs + dir, symlinks=3DTrue)
> > +        for path in package_paths:
> > +            bb.utils.mkdirhier(self.image_rootfs + os.path.dirname(pat=
h))
> > +            if os.path.isdir(self.image_rootfs + '-orig' + path):
> > +                shutil.copytree(self.image_rootfs + '-orig' + path, se=
lf.image_rootfs + path, symlinks=3DTrue)
> > +            elif os.path.isfile(self.image_rootfs + '-orig' + path):
> > +                shutil.copyfile(self.image_rootfs + '-orig' + path, se=
lf.image_rootfs + path)
> >
> >          # Copy files located in /usr/lib/debug or /usr/src/debug
> >          for dir in ["/usr/lib/debug", "/usr/src/debug"]:
> > @@ -162,6 +163,13 @@ class Rootfs(object, metaclass=3DABCMeta):
> >              bb.note("  Install extra debug packages...")
> >              self.pm.install(extra_debug_pkgs.split(), True)
> >
> > +        bb.note("  Removing package database...")
> > +        for path in package_paths:
> > +            if os.path.isdir(self.image_rootfs + path):
> > +                shutil.rmtree(self.image_rootfs + path)
> > +            elif os.path.isfile(self.image_rootfs + path):
> > +                os.remove(self.image_rootfs + path)
>
> What's the reason to do it like this rather than calling
> self.pm.remove_packaging_data()?
>

Just looking now, I suspect only that I didn't notice that it existed!
Though looking across the other packaging implementations, it looks
like you'd get different things removed than were passed initially.
Certainly looks like a refactor would be in order.

> I also just noticed that we apparently have a local change that does the
> above, but where we also do:
>
>      # Remove /etc as it may clash with rootfs.  Also saves some space.
>      bb.utils.remove(oe.path.join(self.image_rootfs, 'etc'), True)
>
> I do not know if that would be appropriate to do here as well?
>

The clash was exactly what I was fixing here (gshadow), but prior to
these two changes you got the whole of /etc copied, so a clash was
exactly what you were in danger of running into - anything that
clashes now, I think wants investigating as to why, rather than just
wiping out `/etc` entirely.

--=20
Alex Kiernan

