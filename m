Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49F43C4167B
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 12:11:26 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.82047.1701951077602318713
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Dec 2023 04:11:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dRahxLG8;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2c9ea37ac87so8746021fa.3
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 04:11:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701951076; x=1702555876; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OUTxov6/6ZDjS8VOk31UrsqmXXBdW7n68DuD7jxR8lc=;
        b=dRahxLG8uEQZS0PmTRCZ+NqZ63tty9jFH+ce4JIwJDeb7n/vN8GYIPeBKzkh4wZtZK
         eKbu4WgVPBL/3H7UHF2LWhxpMrrd4DWQEG2odCvkPdI+9UgvHHbmIBShq+SUKeG74ZrK
         b38v9oa56Zk09w7Ti6FwllG8q98y+FmiDkkqsaPn34e4yDHOxpJtV9wfVHa3PnB7k/F8
         sco4d1m21XTZnIreg+o51KckcufVHjEjh2CCd6A208zpQqGsuLIFp1ZpnsXkd+nLI06F
         M4k1BcEq1jTBPe5gUNa+U7GSZ3+dLwAUvNRsnCQwkP7B/QqWEeg3tA2gqG3cLFpQcoF5
         9vpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701951076; x=1702555876;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OUTxov6/6ZDjS8VOk31UrsqmXXBdW7n68DuD7jxR8lc=;
        b=XE/7fOTGap91fnrs8T0vka2T3IugKL3LZR5d8y9CDKnvJwRUeEa4J7lMTNP8dt99Ts
         6FPdJqjfqfsWH59uNflpnaYien8maLXrICdswb3F0LRqd3qFf9BGGe9AoJlOyxTiawqK
         K7TKaWDbAop6lM3BvfQ3rxc0PysTFwgvxBTRigUHnpeNmArtLbT7z0R3Fyp9MfwNpgWF
         45e1s88F5tLki+Ou+o7sJibMK5yW5tISEw6Lc+x6rLuYCxXGKcQZJIkRfMXUZghhPZ5a
         zQ3EEVsse4EVZan6W7/Jpyrlj+425zj2yV1u3ifwk3Tmv/mmM+VdQtQx2iCDKdaaGnns
         0jFw==
X-Gm-Message-State: AOJu0YzOmYQhhTBGLiC647pqupup9yM57RmYD5KFiQmtJJ63ol4gHtde
	wSuOG5uwe5pPKDIA2RhVwSm4jkU/++7t42UhSpt/KFE0
X-Google-Smtp-Source: AGHT+IEGbevBW8e00u0QWsePyq5Fu014SBh2RKrE2hoPxNGB3sjF3LsvUCu4CBd+7pK/MKdqD3OQh3eaurVPoihjgCM=
X-Received: by 2002:a2e:a26d:0:b0:2ca:3592:a87 with SMTP id
 k13-20020a2ea26d000000b002ca35920a87mr88875ljm.106.1701951075322; Thu, 07 Dec
 2023 04:11:15 -0800 (PST)
MIME-Version: 1.0
References: <20231205074322881971a5@mail.local> <20231206085604.3286804-1-mingli.yu@windriver.com>
 <CAO5Uq5QTtXLOay=Ap7QHMODpFRkd2PitpE4OHqV11+QnzHewZA@mail.gmail.com> <CO1PR11MB500966059C28BDED45861768F18BA@CO1PR11MB5009.namprd11.prod.outlook.com>
In-Reply-To: <CO1PR11MB500966059C28BDED45861768F18BA@CO1PR11MB5009.namprd11.prod.outlook.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Thu, 7 Dec 2023 12:11:03 +0000
Message-ID: <CAO5Uq5QoNetShKbL9RwMzuNUY1tCXvrB4rkhXZMShjXaHuam8g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4] openssh: Add PACKAGECONFIG option to
 customize sshd mode
To: "Yu, Mingli" <Mingli.Yu@windriver.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 12:11:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191946

On Thu, Dec 7, 2023 at 2:10=E2=80=AFAM Yu, Mingli <Mingli.Yu@windriver.com>=
 wrote:
>
> Hi Alex,
>
> Thanks for your suggestion!
>
> Both sshd.socket and sshd.service belong to openssh-sshd package, so usin=
g SYSTEMD_AUTO_ENABLE can't enable one of them,  it just can enable both or=
 disable both.
>

Yes, it would need changes to support per-service presets, which I
suspect would be generally useful.

> Thanks,
> ________________________________
> From: Alex Kiernan <alex.kiernan@gmail.com>
> Sent: Wednesday, December 6, 2023 18:37
> To: Yu, Mingli <Mingli.Yu@windriver.com>
> Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org>
> Subject: Re: [OE-core] [PATCH v4] openssh: Add PACKAGECONFIG option to cu=
stomize sshd mode
>
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.
>
> On Wed, Dec 6, 2023 at 8:56=E2=80=AFAM Yu, Mingli <mingli.yu@eng.windrive=
r.com> wrote:
> >
> > From: Mingli Yu <mingli.yu@windriver.com>
> >
> > Add systemd-sshd-socket-mode PACKAGECONFIG option to choose sshd.socket
> > and systemd-sshd-service-mode PACKAGECONFIG option to choose installing
> > sshd.service.
> >
> > The systemd-sshd-socket-mode PACKAGECONFIG option is enabled by default
> > and user can customize the above two PACKAGECONFIG option to choose the
> > sshd mode.
> >
> > Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> > ---
> > Changed in v3:
> > rebase based on https://lore.kernel.org/all/20231201140947.792594-1-xia=
ngyu.chen@eng.windriver.com/
> >
> > Changed in v4:
> > make it possible to install both sshd.socket and sshd.service
>
> I'm wondering if we should make SYSTEMD_AUTO_ENABLE settable per
> service, so you could then install both and manage which one is active
> with a preset.
>
> > .../openssh/openssh_9.5p1.bb                  | 25 ++++++++++++++-----
> >  1 file changed, 19 insertions(+), 6 deletions(-)
> >
> > diff --git a/meta/recipes-connectivity/openssh/openssh_9.5p1.bb b/meta/=
recipes-connectivity/openssh/openssh_9.5p1.bb
> > index 2c1c821ea9..58dd030c64 100644
> > --- a/meta/recipes-connectivity/openssh/openssh_9.5p1.bb
> > +++ b/meta/recipes-connectivity/openssh/openssh_9.5p1.bb
> > @@ -50,16 +50,20 @@ INITSCRIPT_NAME:${PN}-sshd =3D "sshd"
> >  INITSCRIPT_PARAMS:${PN}-sshd =3D "defaults 9"
> >
> >  SYSTEMD_PACKAGES =3D "${PN}-sshd"
> > -SYSTEMD_SERVICE:${PN}-sshd =3D "sshd.socket sshd.service"
> > +SYSTEMD_SERVICE:${PN}-sshd =3D "${@bb.utils.contains('PACKAGECONFIG','=
systemd-sshd-socket-mode','sshd.socket', '', d)} ${@bb.utils.contains('PACK=
AGECONFIG','systemd-sshd-service-mode','sshd.service', '', d)}"
> >
> >  inherit autotools-brokensep ptest pkgconfig
> >
> > -PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', =
d)}"
> > +# systemd-sshd-socket-mode means sshd.socket and systemd-sshd-service-=
mode
> > +# corresponding to sshd.service
> > +PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', =
d)} systemd-sshd-socket-mode"
> >  PACKAGECONFIG[kerberos] =3D "--with-kerberos5,--without-kerberos5,krb5=
"
> >  PACKAGECONFIG[ldns] =3D "--with-ldns,--without-ldns,ldns"
> >  PACKAGECONFIG[libedit] =3D "--with-libedit,--without-libedit,libedit"
> >  PACKAGECONFIG[manpages] =3D "--with-mantype=3Dman,--with-mantype=3Dcat=
"
> >  PACKAGECONFIG[systemd] =3D "--with-systemd,--without-systemd,systemd"
> > +PACKAGECONFIG[systemd-sshd-socket-mode] =3D ""
> > +PACKAGECONFIG[systemd-sshd-service-mode] =3D ""
> >
> >  EXTRA_AUTORECONF +=3D "--exclude=3Daclocal"
> >
> > @@ -124,15 +128,24 @@ do_install:append () {
> >         echo "HostKey /var/run/ssh/ssh_host_ed25519_key" >> ${D}${sysco=
nfdir}/ssh/sshd_config_readonly
> >
> >         install -d ${D}${systemd_system_unitdir}
> > -       install -c -m 0644 ${WORKDIR}/sshd.socket ${D}${systemd_system_=
unitdir}
> > -       install -c -m 0644 ${WORKDIR}/sshd.service ${D}${systemd_system=
_unitdir}
> > -       install -c -m 0644 ${WORKDIR}/sshd@.service ${D}${systemd_syste=
m_unitdir}
> > +       if ${@bb.utils.contains('PACKAGECONFIG','systemd-sshd-socket-mo=
de','true','false',d)}; then
> > +           install -c -m 0644 ${WORKDIR}/sshd.socket ${D}${systemd_sys=
tem_unitdir}
> > +           install -c -m 0644 ${WORKDIR}/sshd@.service ${D}${systemd_s=
ystem_unitdir}
> > +           sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
> > +                   -e 's,@SBINDIR@,${sbindir},g' \
> > +                   -e 's,@BINDIR@,${bindir},g' \
> > +                   -e 's,@LIBEXECDIR@,${libexecdir}/${BPN},g' \
> > +            ${D}${systemd_system_unitdir}/sshd.socket
> > +       fi
> > +       if ${@bb.utils.contains('PACKAGECONFIG','systemd-sshd-service-m=
ode','true','false',d)}; then
> > +           install -c -m 0644 ${WORKDIR}/sshd.service ${D}${systemd_sy=
stem_unitdir}
> > +       fi
> >         install -c -m 0644 ${WORKDIR}/sshdgenkeys.service ${D}${systemd=
_system_unitdir}
> >         sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
> >                 -e 's,@SBINDIR@,${sbindir},g' \
> >                 -e 's,@BINDIR@,${bindir},g' \
> >                 -e 's,@LIBEXECDIR@,${libexecdir}/${BPN},g' \
> > -               ${D}${systemd_system_unitdir}/sshd.socket ${D}${systemd=
_system_unitdir}/*.service
> > +               ${D}${systemd_system_unitdir}/*.service
> >
> >         sed -i -e 's,@LIBEXECDIR@,${libexecdir}/${BPN},g' \
> >                 ${D}${sysconfdir}/init.d/sshd
> > --
> > 2.25.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#191874): https://lists.openembedded.org/g/openembed=
ded-core/message/191874
> > Mute This Topic: https://lists.openembedded.org/mt/103009646/3618097
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alex.kiernan@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> Alex Kiernan



--=20
Alex Kiernan

