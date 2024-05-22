Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A19D8C25B7A
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 13:19:33 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.9805.1716383967701167062
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 06:19:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QqS96HCs;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2e34e85ebf4so56233291fa.2
        for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 06:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716383966; x=1716988766; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WFCscl0jZtrHWXhAmZKePj6tmNUYmHJu2KXSSeDOoek=;
        b=QqS96HCs+4UTfeTh8D4DHu/mC8vVWbcbcNpCOFRNYag3JWyT/Ra7LKxB3lKUOGY76B
         2peL0jDqDcRtMiwv2FC6ko4E07aLPp92QKVfEL2vkywfRUOHBz4V62T9DeSuTxVjqVdc
         7wzzrF4nsHnCAkb8fU3w4S3uTcLg8Vbxxctr1f0vRPLtFKgyELbDQGL79RHNlAEOx1JT
         4yUgsLkl0NA/gcs22zjpFQqQljMhhcn++6/KSQTUgvaOZx1NsRRxCqmVVU6Vt+Aiwnqz
         8v5b0ERjYJ0VbxKGsWjgfvy+Gx+iRLh+HimDqUU4xt7mgPkysMlfmD9R/cXlrWTpYH+T
         SI8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716383966; x=1716988766;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WFCscl0jZtrHWXhAmZKePj6tmNUYmHJu2KXSSeDOoek=;
        b=R0aiSJ3GyFEWLUExytznI69pJBtUUjvBtrQQn+dWfDwqPZV2Gwm9eM1RDGG8n4AyFK
         qmCla9WrLb2DMb/d2ATKKQbPBT6A6iJT+FF2Xm7jMupjMSq3mzaAQJjlSgKetRmxx6fG
         3C3IK1XZymiC+hXI/u7iPX0IyL4JKQDQeAqPxLhpFjQZJdwoGnT5oLEQmfP8oLBf2ftS
         +xKlywCSiLXmOLTc78HF2Hvn3uV+AIwf2tFEo4Xavci4782NQr9rLnUZqe0Fwf3XJ/Ra
         mQwsmfl8dytKI7pHdi2HQdGEyZkgrydLWEbPH2EJziHVGEw1svwbZTn6iWzFd7vXGMG6
         gxjw==
X-Forwarded-Encrypted: i=1; AJvYcCWJ9Q8xYbxeEfA+sBjqtXQknEtZ2GaExBJcVKlISIgRDK0s/Z3X8tmY5db2n/jpNqS2Eq0my46wwTizVs2eF2LRp3+9aRSuFr+KHnzlcars/zzKRTMQU+gR
X-Gm-Message-State: AOJu0YzBi1Hq+tUXxtjUOegLRFW76A0x3zOcIh3GevzDwmI26MZDcS01
	i/L1KA2B5ksAJm7AqZ5WAen9xYBWQEljdCkg44QWvigVHHu7JqHQ3vGaKlhOP1YkP+x8pyRD350
	UMaeiIKmColt30bXiq9//bsyTYlU=
X-Google-Smtp-Source: AGHT+IFBewKnzs7Y2i2nL7YwQgPiRakx1RsfWjP/oe1z/WLGdL5ZbqaXMtd8WDdcbajpIJy2Br3lYK3MdpbtYQ/kYGg=
X-Received: by 2002:a2e:9b4a:0:b0:2e6:f5a2:1ec8 with SMTP id
 38308e7fff4ca-2e9496ad51cmr11256461fa.51.1716383965551; Wed, 22 May 2024
 06:19:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240522092817.1250809-1-richard.purdie@linuxfoundation.org>
 <DB5PR02MB102130544E52F16C92DD69492EFEB2@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <a24a5efe30e6cf61c30c56fa12e25bd29e6c9ec2.camel@linuxfoundation.org>
In-Reply-To: <a24a5efe30e6cf61c30c56fa12e25bd29e6c9ec2.camel@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 22 May 2024 15:19:09 +0200
Message-ID: <CA+chaQe4_Uj89-0=Jm9No=KuF2swCG5gJcTgto4U3+=H_eK14w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] base: Switch UNPACKDIR to a subdir of WORKDIR
To: richard.purdie@linuxfoundation.org
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 13:19:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199751

On Wed, May 22, 2024 at 3:09=E2=80=AFPM Richard Purdie via
lists.openembedded.org
<richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
>
> On Wed, 2024-05-22 at 13:00 +0000, Peter Kjellerstedt wrote:
> > > -----Original Message-----
> > > From: openembedded-core@lists.openembedded.org <openembedded-core@lis=
ts.openembedded.org> On Behalf Of Richard Purdie
> > > Sent: den 22 maj 2024 11:28
> > > To: openembedded-core@lists.openembedded.org
> > > Subject: [OE-core] [PATCH 1/3] base: Switch UNPACKDIR to a subdir of =
WORKDIR
> > >
> > > Change do_unpack to unpack files to a subdirectory of WORKDIR instead=
 of WORKDIR
> > > itself. There are several good reasons for this but it is mainly abou=
t being able
> > > to isolate the output of the unpack task and tell the files apart fro=
m other things
> > > which are created in workdir (logs, sysroots, temp dirs and more).
> > >
> > > This means that when the do_unpack task reruns, we can clean UNPACKDI=
R and know
> > > we have a standard point to start builds from.
> > >
> > > It also makes code in tools like devtool and recipetool easier.
> > >
> > > To reduce the impact to users, if a subdirectory under UNPACKDIR matc=
hes
> > > the first subdirectory under WORKDIR of S, that directory is moved in=
to position
> > > inside WORKDIR. This preserves the behaviour of S =3D "${WORKDIR}/git=
",
> > > S =3D "${WORKDIR}/${BPN}" and other commonly used source directory se=
tups.
> > >
> > > The directory is moved since sadly many autotools based projects can'=
t cope with
> > > symlinks in their paths.
> > >
> > > The patch also updates reproducible and SOURCE_DATE_EPOCH handling to
> > > match the new potential source locations. We can get rid of the horri=
ble
> > > list of hardcoded directories in WORKDIR to ignore from that code.
> > >
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > ---
> > >  meta/classes-global/base.bbclass | 28 +++++++++++++++++++++++-----
> > >  meta/conf/bitbake.conf           |  2 +-
> > >  meta/lib/oe/reproducible.py      | 19 ++++++++++---------
> > >  3 files changed, 34 insertions(+), 15 deletions(-)
> > >
> > > diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/b=
ase.bbclass
> > > index 066f3848f7c..13e91b24a3b 100644
> > > --- a/meta/classes-global/base.bbclass
> > > +++ b/meta/classes-global/base.bbclass
> > > @@ -153,20 +153,38 @@ python base_do_fetch() {
> > >  }
> > >
> > >  addtask unpack after do_fetch
> > > -do_unpack[dirs] =3D "${UNPACKDIR}"
> > > -
> > > -do_unpack[cleandirs] =3D "${@d.getVar('S') if os.path.normpath(d.get=
Var('S')) !=3D os.path.normpath(d.getVar('WORKDIR')) else os.path.join('${S=
}', 'patches')}"
> > > +do_unpack[cleandirs] =3D "${UNPACKDIR}"
> > >
> > >  python base_do_unpack() {
> > > +    import shutil
> > > +
> > > +    sourcedir =3D d.getVar('S')
> > > +    # Intentionally keep SOURCE_BASEDIR internal to the task just fo=
r SDE
> > > +    d.setVar("SOURCE_BASEDIR", sourcedir)
> > > +
> > >      src_uri =3D (d.getVar('SRC_URI') or "").split()
> > >      if not src_uri:
> > >          return
> > >
> > > +    basedir =3D None
> > > +    unpackdir =3D d.getVar('UNPACKDIR')
> > > +    workdir =3D d.getVar('WORKDIR')
> > > +    if sourcedir.startswith(workdir) and not sourcedir.startswith(un=
packdir):
> > > +        basedir =3D sourcedir.replace(workdir, '').strip("/").split(=
'/')[0]
> > > +        if basedir:
> > > +            bb.utils.remove(workdir + '/' + basedir, True)
> > > +            d.setVar("SOURCE_BASEDIR", workdir + '/' + basedir)
> > > +
> > >      try:
> > >          fetcher =3D bb.fetch2.Fetch(src_uri, d)
> > >          fetcher.unpack(d.getVar('UNPACKDIR'))
> > >      except bb.fetch2.BBFetchException as e:
> > >          bb.fatal("Bitbake Fetcher Error: " + repr(e))
> > > +
> > > +    if basedir and os.path.exists(unpackdir + '/' + basedir):
> > > +        # Compatibility magic to ensure ${WORKDIR}/git and ${WORKDIR=
}/${BP}
> > > +        # as often used in S work as expected.
> > > +        shutil.move(unpackdir + '/' + basedir, workdir + '/' + based=
ir)
> > >  }
> > >
> > >  SSTATETASKS +=3D "do_deploy_source_date_epoch"
> > > @@ -199,8 +217,8 @@ addtask do_deploy_source_date_epoch_setscene
> > >  addtask do_deploy_source_date_epoch before do_configure after do_pat=
ch
> > >
> > >  python create_source_date_epoch_stamp() {
> > > -    # Version: 1
> > > -    source_date_epoch =3D oe.reproducible.get_source_date_epoch(d, d=
.getVar('S'))
> > > +    # Version: 2
> > > +    source_date_epoch =3D oe.reproducible.get_source_date_epoch(d, d=
.getVar('SOURCE_BASEDIR') or d.getVar('S'))
> > >      oe.reproducible.epochfile_write(source_date_epoch, d.getVar('SDE=
_FILE'), d)
> > >  }
> > >  do_unpack[postfuncs] +=3D "create_source_date_epoch_stamp"
> >
> > The following code is part of the anonymous python() function in base.b=
bclass:
> >
> >     if os.path.normpath(d.getVar("WORKDIR")) !=3D os.path.normpath(d.ge=
tVar("S")):
> >         d.appendVar("PSEUDO_IGNORE_PATHS", ",${S}")
> >     if os.path.normpath(d.getVar("WORKDIR")) !=3D os.path.normpath(d.ge=
tVar("B")):
> >         d.appendVar("PSEUDO_IGNORE_PATHS", ",${B}")
> >
> > Since it is (or will be) an error to have S =3D "${WORKDIR}", it should=
 now be
> > possible to move the addition of ${S} to PSEUDO_IGNORE_PATHS to bitbake=
.conf.
>
> Yes, we should be able to start finding and cleaning up things like
> this.
>
> > I also believe ${UNPACKDIR} should be added to PSEUDO_IGNORE_PATHS.
>
> Why? I don't think we want UNPACKDIR there, we only need S.

There were recently couple issues with pseudo when the source file
from something not unpacked under ${S} confuses pseudo when it sees
the same file unpacked by do_unpack and then linked from
package/usr/src/debug e.g.:

path mismatch [3 links]: ino 214373575 db
'opencv/4.5.5-r0/package/usr/src/debug/lib32-opencv/4.5.5-r0/contrib/module=
s/intensity_transform/src/bimef.cpp'
req 'opencv/4.5.5-r0/contrib/modules/intensity_transform/src/bimef.cpp'.

which can be usually easily fixed by moving the additional files (or
other repositories) to be unpacked/checked out as subdirectory under
${S} to make them ignored by pseudo as well.

As in:
https://git.openembedded.org/meta-openembedded/commit/?h=3Dkirkstone&id=3Dd=
a98a75f37830e69ded0207cc6c73182ab00ec50
which moved ${WORKDIR}/contrib to ${WORKDIR}/git/contrib to avoid this issu=
e.

But now with clearer separation thanks to ${UNPACKDIR} this whouldn't
be needed if we add whole UNPACKDIR to PSEUDO_IGNORE_PATHS.

Is there any case when UNPACKDIR needs to be tracked by pseudo?

> > And on a related note, would it make sense to make B =3D ${WORKDIR} an =
error too?
> > In which case the addition of ${B} to PSEUDO_IGNORE_PATHS could also be=
 moved
> > to bitbake.conf.
>
> I'd hope no one is doing that so yes, I'd also like to move that. We
> can make that an error too.
>
> Cheers,
>
> Richard
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199750): https://lists.openembedded.org/g/openembedde=
d-core/message/199750
> Mute This Topic: https://lists.openembedded.org/mt/106239726/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

