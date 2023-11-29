Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D476C4167B
	for <webhook@archiver.kernel.org>; Wed, 29 Nov 2023 17:17:24 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.44064.1701278234219251638
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Nov 2023 09:17:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=yN3HD6V+;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.44, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-9e1021dbd28so946995566b.3
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 09:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701278232; x=1701883032; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=udqHpjpQbeoPkN5qZxBzhWrIFVc6XUGDpY6o9DBYi4U=;
        b=yN3HD6V+RI3iVjBNqL1iN0zfrMo7T5PJpKfmOOAOEjI+EGmaERw8c6f4QXxJWirvyp
         4j70lapHbWB0C747KozdquUF/ocmEhhCy2O2yDuwRBCTavhED2SnSFaF3/jf3c6XkQZp
         oH7Q6PMHn6dhuP72I05jxfBW768wzea+hvtRmGXQ4X2LyM9XfrCneVc6cJPTPOqJMr0A
         mno6wwZMbdMi/W46rnh0gcQfMuxpbMfgpigOQykZvgrzdK8OLgQ7NxoH4ZvhYAdTjRwo
         XYA/hRCrbwGJyLEKH7nk4my2Rp4PwbKa2GtgQhjeMqpdKlyMvNeWfnvNhu5GXmW4TFxI
         0yOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701278232; x=1701883032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=udqHpjpQbeoPkN5qZxBzhWrIFVc6XUGDpY6o9DBYi4U=;
        b=fB04HBOwamqzEBRapAmuBv0pcd69IcLWYW3+V5kG2z9HAEJwa5RUQ4T0PKOisECW9h
         vmoZeoW6QW0NBD6nqTjazuMOltGpJFxusX+fMqgI4pFvwdHvpzckEk3B9n0YszQ97btz
         O5bn6etvBvIJoT2lEiL2KHqDQHnKwpvZWYaTfbFlhZvqf2+e3jWlq2iZ49RQmi3Ko5zI
         hGTzIqu1Ka/iJ8iVlnpOa3G9i/Vw+UVB0IMYt/uwVncXHzl10aHaB0LHPYFtHmzVqkPG
         AQL5nSeg50vsF92N78IFDHRC9QUVPYu2K0BU3c6l7Ts6xy/JT8BbkD5ARavC3189F4wv
         3q+Q==
X-Gm-Message-State: AOJu0YzMgWvHjMKN0FXdidXodfuOJifDa5ZUNA0QlBtzTIQ4QWuNqY4g
	C6fjZcQbjFyQQHX3c/GGLSfSnFofF6jxi2ThO0VCDw==
X-Google-Smtp-Source: AGHT+IE6Q4sTC+A95HBrH1q/0SKelpmpfDCfPjlxWvAAYsc5+hnPVgtrbKq9Yt4WjwiOucVwh5ek3L2/WH2JwnXlR1U=
X-Received: by 2002:a17:906:3386:b0:9b8:b683:5837 with SMTP id
 v6-20020a170906338600b009b8b6835837mr13578736eja.46.1701278232403; Wed, 29
 Nov 2023 09:17:12 -0800 (PST)
MIME-Version: 1.0
References: <20231124141108.1397342-1-joakim.tjernlund@infinera.com>
 <20231124141108.1397342-3-joakim.tjernlund@infinera.com> <DB5PR02MB10213D2E9905D5D115A8F4EF9EFBEA@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <cb756de9310b460726d56f962293d8a3dec54a31.camel@infinera.com>
In-Reply-To: <cb756de9310b460726d56f962293d8a3dec54a31.camel@infinera.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 29 Nov 2023 07:17:00 -1000
Message-ID: <CAOSpxdYsEfEVAMAFe9_UrLrJHx7jeWgnYBdHSobp9-_mJ8cinw@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH 2/4] base-passwd: Add PW_SUBDIR
To: Joakim.Tjernlund@infinera.com
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"peter.kjellerstedt@axis.com" <peter.kjellerstedt@axis.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 17:17:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191458

On Wed, Nov 29, 2023 at 1:11=E2=80=AFAM Joakim Tjernlund via
lists.openembedded.org
<Joakim.Tjernlund=3Dinfinera.com@lists.openembedded.org> wrote:
>
> Hi Peter :)
>
> All good comments, will fix accordingly. Not sure how PW_DIR ?=3D "${sysc=
onfdir}" will work though.

One additional comment: a change like this should be submitted for the
master branch, it can't go into a stable branch first.

Steve

> How do you envision one should set PW_DIR in distro .conf or layer.conf?
> Just PW_DIR =3D "/etc/pwdb" or PW_DIR =3D "${sysconfdir}/pwdb" ?
>
>  Jocke
>
> On Sun, 2023-11-26 at 21:21 +0000, Peter Kjellerstedt wrote:
> > > -----Original Message-----
> > > From: openembedded-core@lists.openembedded.org <openembedded-core@lis=
ts.openembedded.org> On Behalf Of Joakim Tjernlund via lists.openembedded.o=
rg
> > > Sent: den 24 november 2023 15:11
> > > To: openembedded-core@lists.openembedded.org
> > > Cc: Joakim Tjernlund <joakim.tjernlund@infinera.com>
> > > Subject: [OE-core] [kirkstone][PATCH 2/4] base-passwd: Add PW_SUBDIR
> > >
> > > Add support for creating passwd files in a /etc subdir
> > > Set PW_SUBIR to pwdb to get passwd  files in /etc/pwdb
> > >
> > > Signed-off-by: Joakim Tjernlund <joakim.tjernlund@infinera.com>
> > > ---
> > >  .../base-passwd/base-passwd_3.5.29.bb         | 24 ++++++++++++-----=
--
> > >  1 file changed, 16 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb b/me=
ta/recipes-core/base-passwd/base-passwd_3.5.29.bb
> > > index ef7792ae49..e453be0763 100644
> > > --- a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
> > > +++ b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
> > > @@ -20,6 +20,9 @@ SRC_URI =3D "https://launchpad.net/debian/+archive/=
primary/+files/${BPN}_${PV}.tar
> > >  SRC_URI[md5sum] =3D "6beccac48083fe8ae5048acd062e5421"
> > >  SRC_URI[sha256sum] =3D "f0b66388b2c8e49c15692439d2bee63bcdd4bbbf7a78=
2c7f64accc55986b6a36"
> > >
> > > +#Set PW_SUBDIR to pwdb to get passwd  files in /etc/pwdb
> > > +PW_SUBDIR ?=3D ""
> > > +
> >
> > Rather than defining a subdirectory, I would recommend defining the ful=
l
> > path, e.g.:
> >
> > PW_DIR ?=3D "${sysconfdir}"
> >
> > This avoids generating a lot of "//" in the middle of paths for the maj=
ority
> > of us who do not use a subdirectory for the password files.
> >
> > >  # the package is taken from launchpad; that source is static and goe=
s stale
> > >  # so we check the latest upstream from a directory that does get upd=
ated
> > >  UPSTREAM_CHECK_URI =3D "${DEBIAN_MIRROR}/main/b/base-passwd/"
> > > @@ -50,10 +53,11 @@ basepasswd_sysroot_postinst() {
> > >  #!/bin/sh
> > >
> > >  # Install passwd.master and group.master to sysconfdir
> > > -install -d -m 755 ${STAGING_DIR_TARGET}${sysconfdir}
> > > +install -d -m 755 ${STAGING_DIR_TARGET}${sysconfdir}/${PW_SUBDIR}
> > >  for i in passwd group; do
> > >     install -p -m 644 ${STAGING_DIR_TARGET}${datadir}/base-passwd/\$i=
.master \
> > > -           ${STAGING_DIR_TARGET}${sysconfdir}/\$i
> > > +           ${STAGING_DIR_TARGET}${sysconfdir}/${PW_SUBDIR}/\$i
> > > +   [ -n "${PW_SUBDIR}" ] && ln -fs ${PW_SUBDIR}/\$i ${STAGING_DIR_TA=
RGET}${sysconfdir}/\$i
> >
> > I generally recommended to use `[ ! ... ] || ...` instead of `[ ... ] &=
& ...`:
> >
> >       [ -z "${PW_SUBDIR}" ] || ln -fs ${PW_SUBDIR}/\$i ${STAGING_DIR_TA=
RGET}${sysconfdir}/\$i
> >
> > Or, assuming my recommendation above is followed:
> >
> >       [ "${PW_DIR}" =3D "${sysconfdir}" ] ||
> >               ln -fsr ${STAGING_DIR_TARGET}${PW_DIR}/\$i ${STAGING_DIR_=
TARGET}${sysconfdir}/\$i
> >
> > The reason is that the return status ($?) of `[ ... ] && ...` is 1 if t=
he
> > test fails, while it is 0 for `[ ! ... ] || ...` when the test succeeds=
.
> >
> > >  done
> > >
> > >  # Run any useradd postinsts
> > > @@ -89,15 +93,19 @@ python populate_packages:prepend() {
> > >      f.close()
> > >
> > >      preinst =3D """#!/bin/sh
> > > -mkdir -p $D${sysconfdir}
> > > -if [ ! -e $D${sysconfdir}/passwd ]; then
> > > -\tcat << 'EOF' > $D${sysconfdir}/passwd
> > > +mkdir -p $D${sysconfdir}/${PW_SUBDIR}
> > > +if [ ! -e $D${sysconfdir}/${PW_SUBDIR}/passwd ]; then
> > > +\tcat << 'EOF' > $D${sysconfdir}/${PW_SUBDIR}/passwd
> > >  """ + passwd + """EOF
> > >  fi
> > > -if [ ! -e $D${sysconfdir}/group ]; then
> > > -\tcat << 'EOF' > $D${sysconfdir}/group
> > > +if [ ! -e $D${sysconfdir}/${PW_SUBDIR}/group ]; then
> > > +\tcat << 'EOF' > $D${sysconfdir}/${PW_SUBDIR}/group
> > >  """ + group + """EOF
> > >  fi
> > > +if [ -n "${PW_SUBDIR}" ]; then
> > > +ln -fs ${PW_SUBDIR}/passwd $D${sysconfdir}/passwd
> > > +ln -fs ${PW_SUBDIR}/group $D${sysconfdir}/group
> >
> > Use \t to indent the above two lines like the code before.
> >
> > > +fi
> > >  """
> > >      d.setVar(d.expand('pkg_preinst:${PN}'), preinst)
> > >  }
> > > @@ -114,5 +122,5 @@ pkg_postinst:${PN}-update () {
> > >  if [ -n "$D" ]; then
> > >     exit 0
> > >  fi
> > > -${sbindir}/update-passwd
> > > +${sbindir}/update-passwd -P /etc/${PW_SUBDIR}/passwd -S /etc/${PW_SU=
BDIR}/shadow -G /etc/${PW_SUBDIR}/group
> >
> > Replace /etc with ${sysconfdir}.
> >
> > >  }
> > > --
> > > 2.41.0
> >
> > //Peter
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191437): https://lists.openembedded.org/g/openembedde=
d-core/message/191437
> Mute This Topic: https://lists.openembedded.org/mt/102780967/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

