Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 707CDC001DF
	for <webhook@archiver.kernel.org>; Fri, 28 Jul 2023 14:01:57 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
 by mx.groups.io with SMTP id smtpd.web10.32825.1690552908702855634
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jul 2023 07:01:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=EzRgVutC;
 spf=pass (domain: gmail.com, ip: 209.85.166.53, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-78372b896d0so87267839f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Jul 2023 07:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690552908; x=1691157708;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6kmdATkDW0zKsJ6vxZa3N+bhS+l2ZcVWQg8AG4IXhqA=;
        b=EzRgVutCO9HlW8zFIrSDWqUWyAKYJsojwxKZwC0ZiywMoy5dBk7UuelxDiq1EOh/zf
         b0gIC8BN2s1oTNvztHHakLbv1tepm8JMgo0Od49EwozKVYEH96XBLbI0a8drWgZABDNN
         LU4PrNxDKcKOP9VzCfkputKYINitGUyjDSbJnpPoG1KGePn/XxkVaT9HaY26xrdgXeQI
         mbrK0SnIr8UdhXtztE2/ymoW1TUs//JS/VEUFpT8bmcMWZBXZJiJNCYQa95eon1cav23
         Pl1k0ioTrWK3nOmxYwLTLUxBF/gcp79O1xTUa9kz5jFx2snOVy2mr4ztlt8Xxdzr/dkA
         tuLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690552908; x=1691157708;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6kmdATkDW0zKsJ6vxZa3N+bhS+l2ZcVWQg8AG4IXhqA=;
        b=CLNwQWS3Hs0EJJ8cY8NqVK10yXd+58v8SEBb9cZBqHeb/zFdIx3pw/urwKFYMsDH4n
         uBmNC+wiAZY2tsVNP68i5apROx/Mb6kGOJV1RqbckGFnOxUzK3gj++9U4yvKR/4/vJf3
         l5GTJdGyBMoMajQ3/zaFYF7jxz8EHEwgXDRwVTcGfylyV70TBf7f0gxQUalhSHkwBfZ1
         8poaHX+fNNETm1bmiOBRJOrahlitBw6+vqkY3Hx+sJlt+beb4M+xnCbirmGhTfRX3Vto
         Ge0MZ10NH/pdVknBifEyishqTxEQ34lHK73XVz9VEcT4xJZMLzJqQ4S+k5pB0oLGak4f
         Pkew==
X-Gm-Message-State: ABy/qLZWS16mQPra/RA/I7+TIOYEcDpXUEZkbS97AxC2S7t0oQWBmUHl
	dalGtTl5zhii5XqGmvyTFfG+snKTM7tAWfdgh6Y=
X-Google-Smtp-Source: APBJJlGxnVc1bjB3VAwi4XZr0hKzrifPxlrJ+/A2UoOUu4Zc+tr+SD/mPDBtREePyc8p7bzieJeVC8s5QzYuIROsoLk=
X-Received: by 2002:a5d:984c:0:b0:787:9f4:a286 with SMTP id
 p12-20020a5d984c000000b0078709f4a286mr3234864ios.3.1690552907716; Fri, 28 Jul
 2023 07:01:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230728093950.12046-1-alex.kiernan@gmail.com> <CAPoiz9xVrUn-B7U61CjrU7Qkq2tMVJ-znYbSMnv0zPFBUDSLhA@mail.gmail.com>
In-Reply-To: <CAPoiz9xVrUn-B7U61CjrU7Qkq2tMVJ-znYbSMnv0zPFBUDSLhA@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Fri, 28 Jul 2023 15:01:35 +0100
Message-ID: <CAO5Uq5S6b1LpkeEXBL6eo-YELeRATERAu3ikOFsT=+UUgdG=sA@mail.gmail.com>
Subject: Re: [OE-Core][PATCH 1/2] base-passwd: Add the sgx group
To: Jon Mason <jdmason@kudzu.us>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Jul 2023 14:01:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185031

On Fri, Jul 28, 2023 at 1:52=E2=80=AFPM Jon Mason <jdmason@kudzu.us> wrote:
>
> On Fri, Jul 28, 2023 at 5:40=E2=80=AFAM Alex Kiernan <alex.kiernan@gmail.=
com> wrote:
> >
> > To avoid errors from eudev/udev we need an sgx group, but if we add it
> > via groupadd that causes shadow login to be brought into an image, whic=
h
> > causes images which have CONFIG_MULTIUSER unset to fail with `setgid:
> > Function not implemented` as shadow's login doesn't implement the
> > heuristics which busybox has to handle this kernel configuration.
>
> Firstly, thank you very much for fixing this.  I was having lots of
> trouble with it.
>
> I just wanted to point out that the underlying sgx issue is unique to
> Intel/x86.  So, it might make sense to only apply this patch in this
> case.
>

You get the noise from eudev on everything (I'm deploying onto
aarch64), I guess because it fails at parse time and everyone gets the
same rules. Obviously we could try for an sgx only rule on x86, but
tbh that feels like way too much effort!

I think we want something like this on poky-tiny so this doesn't regress:

diff --git a/meta-poky/conf/distro/poky-tiny.conf
b/meta-poky/conf/distro/poky-tiny.conf
index f65d2dabf3af..728d161d59af 100644
--- a/meta-poky/conf/distro/poky-tiny.conf
+++ b/meta-poky/conf/distro/poky-tiny.conf
@@ -122,3 +122,7 @@ SKIP_RECIPE[core-image-weston] =3D "not buildable
with poky-tiny"

 # Disable python usage in opkg-utils since it won't build with tiny config
 PACKAGECONFIG:remove:pn-opkg-utils =3D "python"
+
+# If shadow-base is brought into the image, logins will fail because it
+# doesn't have the heuristics to work when CONFIG_MULTIUSER is unset.
+PACKAGE_EXCLUDE:poky-tiny =3D "shadow-base"

> Thanks,
> Jon
>
> > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > ---
> >
> >  .../0001-base-passwd-Add-the-sgx-group.patch  | 30 +++++++++++++++++++
> >  .../base-passwd/base-passwd_3.6.1.bb          |  1 +
> >  2 files changed, 31 insertions(+)
> >  create mode 100644 meta/recipes-core/base-passwd/base-passwd/0001-base=
-passwd-Add-the-sgx-group.patch
> >
> > diff --git a/meta/recipes-core/base-passwd/base-passwd/0001-base-passwd=
-Add-the-sgx-group.patch b/meta/recipes-core/base-passwd/base-passwd/0001-b=
ase-passwd-Add-the-sgx-group.patch
> > new file mode 100644
> > index 000000000000..e1340e1b70cf
> > --- /dev/null
> > +++ b/meta/recipes-core/base-passwd/base-passwd/0001-base-passwd-Add-th=
e-sgx-group.patch
> > @@ -0,0 +1,30 @@
> > +From 9e57771d138ac423d5139b984b8c869122ce4976 Mon Sep 17 00:00:00 2001
> > +From: Alex Kiernan <alexk@zuma.ai>
> > +Date: Fri, 28 Jul 2023 10:28:57 +0100
> > +Subject: [PATCH] base-passwd: Add the sgx group
> > +
> > +To avoid errors from eudev/udev we need an sgx group, but if we add it
> > +via groupadd that causes shadow login to be brought into an image, whi=
ch
> > +causes images which have CONFIG_MULTIUSER unset to fail with `setgid:
> > +Function not implemented` as shadow's login doesn't implement the
> > +heuristics which busybox has to handle this kernel configuration.
> > +
> > +Upstream-Status: Inappropriate [oe-specific]
> > +
> > +Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > +---
> > + group.master | 1 +
> > + 1 file changed, 1 insertion(+)
> > +
> > +diff --git a/group.master b/group.master
> > +index d34d2b832d43..e54fd1d2c6dc 100644
> > +--- a/group.master
> > ++++ b/group.master
> > +@@ -34,6 +34,7 @@ video:*:44:
> > + sasl:*:45:
> > + plugdev:*:46:
> > + kvm:*:47:
> > ++sgx:*:48:
> > + staff:*:50:
> > + games:*:60:
> > + shutdown:*:70:
> > diff --git a/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb b/meta/=
recipes-core/base-passwd/base-passwd_3.6.1.bb
> > index 204016b3e72e..44bcfb019930 100644
> > --- a/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb
> > +++ b/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb
> > @@ -13,6 +13,7 @@ SRC_URI =3D "https://launchpad.net/debian/+archive/pr=
imary/+files/${BPN}_${PV}.tar
> >             file://0005-Add-kvm-group.patch \
> >             file://0006-Make-it-possible-to-configure-whether-to-use-SE=
Linux.patch \
> >             file://0007-Add-wheel-group.patch \
> > +           file://0001-base-passwd-Add-the-sgx-group.patch \
> >             "
> >
> >  SRC_URI[sha256sum] =3D "6ff369be59d586ba63c0c5fcb00f75f9953fe49db88bc6=
c6428f2c92866f79af"
> > --
> > 2.39.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#185015): https://lists.openembedded.org/g/openembed=
ded-core/message/185015
> > Mute This Topic: https://lists.openembedded.org/mt/100407464/3616920
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
jdmason@kudzu.us]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >



--=20
Alex Kiernan

