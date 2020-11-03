Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web11.4323.1604411976517121868
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2020 05:59:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=SUpOP3XH;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.67, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f67.google.com with SMTP id cw8so10670129ejb.8
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2020 05:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=t2dBn+Iz6zTv5Ztlqt68aupe5DRoO54JAXS8BmUIgT0=;
        b=SUpOP3XHXU6YMbvwfJ0OweQKqfmIWD/SGRcKu9l5ABzV34NCamgVu4wW9qtYjWYjPp
         YNHhL0C9nP4ShMQIpBbZDPnYOq5/1QXV9+3+sAGfuy0v0UpBumBsAT3W2iF+i+NBXHLi
         ZhskvGc8Rl90/xnORJrfL7chsjKQGzq6rKkt56EOPpKG/bYL9e6z0/nFP+JOLytPlrF6
         FIKCeVXDuuiODlOMzG76uHZ7+SJeTDivGEiDjiqBSJoCWjqlMWiaeheoaE8EQ5XpMVBu
         k49H8/V1TaRtyC0WV4s2nOOjzXVN/kjALnItP/sGSBeCJbuw3SYtj4qRaYI6x+w/62hZ
         kCTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=t2dBn+Iz6zTv5Ztlqt68aupe5DRoO54JAXS8BmUIgT0=;
        b=qSCwFXTdAV59mWLBj9uAiCVGD4zJHxTI3keSwwgpqqdnTYuoRwZysCqOn19WewbDCF
         Cc4S2kJkqjOlMjREFXSN9Nlkkgt1o+laDrxoVvZLcbOXYXh7S+x1lAA/w9Omc2GLyQ4R
         X7TO8s3LuVuln34oroxIB56nbkd0Nrhp3RjaOGd5YdddVoqlGUbfrTkUCoEttHDa4H5c
         FkZV+cziz5OTpOdZkKuXoYYvl3yqodVV7JsUzpKjC5FX3CeH9SAHKawWyyYJ03knLsDZ
         QNyDgrRCRabFgsvulFs+NdsZlotongGhP7/MYhGSrILe3VFfSzsYPplyVBS1SY72epGW
         7vIg==
X-Gm-Message-State: AOAM532iYxmxB77BeCJy5vu281ArxIucnHzoF0DjXFD7SPoTlNQaMAMK
	0elUbnlOZiRxLT5DldDJ2eV7XZEL6mRIQtqyyMDNWA==
X-Google-Smtp-Source: ABdhPJwTGoE1fnVqTKZLpf8tFyy/Tffe6U3fHuFsOgQx6e3cTWzNKUF2dN92TeVu9a2TB2qj68irhY+dkLcfaRMZ/kQ=
X-Received: by 2002:a17:906:b0d6:: with SMTP id bk22mr19934333ejb.153.1604411974945;
 Tue, 03 Nov 2020 05:59:34 -0800 (PST)
MIME-Version: 1.0
References: <20201030134551.44013-1-dev@bubus.at> <20201103090536.GA6121@brokenbit>
In-Reply-To: <20201103090536.GA6121@brokenbit>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Tue, 3 Nov 2020 03:59:23 -1000
Message-ID: <CAOSpxdaFA8+XhZMS4V83G+YOcaDBLXHLgD-nSRhRN1kpVS74Lw@mail.gmail.com>
Subject: Re: [dunfell][PATCH] xcb-proto: backport fix for python gcd function
To: Richard Leitner <richard.leitner@skidata.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

This patch is in the set I am currently testing on the autobuilder, so
if all goes well it should be merged to dunfell soon.

Steve

On Mon, Nov 2, 2020 at 11:08 PM Richard Leitner
<richard.leitner@skidata.com> wrote:
>
> Hi Steve,
> friendly reminder for this patch as the initial fix was merged to master
> a few days ago as commit 1476d40d3e (xcb-proto: update to 1.14.1, 2020-10=
-28).
>
> Is backporting the patch fine for dunfell or should xcb-proto be
> updated?
>
> Thanks!
>
> regards;rl
>
> On Fri, Oct 30, 2020 at 02:45:51PM +0100, Richard Leitner wrote:
> > From: Richard Leitner <richard.leitner@skidata.com>
> >
> > This backports the fix [1] for the following build error for nativesdk =
on
> > Fedora 33 which is caused by the removal of fractions.gcd() in favor of
> > math.gcd() in python 3.9 [2]:
> >
> > ImportError: cannot import name 'gcd' from 'fractions' (/usr/lib64/pyth=
on3.9/fractions.py)
> >
> > [1] https://gitlab.freedesktop.org/xorg/proto/xcbproto/-/commit/426ae35=
bee1fa0fdb8b5120b1dcd20cee6e34512
> > [2] https://bugs.python.org/issue39350
> >
> > Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> > ---
> >  ...1-xcbgen-use-math-gcd-for-python-3-5.patch | 40 +++++++++++++++++++
> >  .../xorg-proto/xcb-proto_1.13.bb              |  3 +-
> >  2 files changed, 42 insertions(+), 1 deletion(-)
> >  create mode 100644 meta/recipes-graphics/xorg-proto/xcb-proto/0001-xcb=
gen-use-math-gcd-for-python-3-5.patch
> >
> > diff --git a/meta/recipes-graphics/xorg-proto/xcb-proto/0001-xcbgen-use=
-math-gcd-for-python-3-5.patch b/meta/recipes-graphics/xorg-proto/xcb-proto=
/0001-xcbgen-use-math-gcd-for-python-3-5.patch
> > new file mode 100644
> > index 0000000000..f9f4424da5
> > --- /dev/null
> > +++ b/meta/recipes-graphics/xorg-proto/xcb-proto/0001-xcbgen-use-math-g=
cd-for-python-3-5.patch
> > @@ -0,0 +1,40 @@
> > +From 426ae35bee1fa0fdb8b5120b1dcd20cee6e34512 Mon Sep 17 00:00:00 2001
> > +From: =3D?UTF-8?q?Bj=3DC3=3DB6rn=3D20Esser?=3D <besser82@fedoraproject=
.org>
> > +Date: Mon, 1 Jun 2020 12:24:16 +0200
> > +Subject: [PATCH] xcbgen: Use math.gcd() for Python >=3D 3.5.
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=3DUTF-8
> > +Content-Transfer-Encoding: 8bit
> > +
> > +fractions.gcd() has been deprecated since Python 3.5, and
> > +was finally dropped in Python 3.9.  It is recommended to
> > +use math.gcd() instead.
> > +
> > +Signed-off-by: Bj=C3=B6rn Esser <besser82@fedoraproject.org>
> > +Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/proto/x=
cbproto/-/commit/426ae35bee1fa0fdb8b5120b1dcd20cee6e34512]
> > +Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> > +---
> > + xcbgen/align.py | 7 ++++++-
> > + 1 file changed, 6 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/xcbgen/align.py b/xcbgen/align.py
> > +index d4c12ee..5c4f517 100644
> > +--- a/xcbgen/align.py
> > ++++ b/xcbgen/align.py
> > +@@ -2,7 +2,12 @@
> > + This module contains helper classes for alignment arithmetic and chec=
ks
> > + '''
> > +
> > +-from fractions import gcd
> > ++from sys import version_info
> > ++
> > ++if version_info[:2] >=3D (3, 5):
> > ++    from math import gcd
> > ++else:
> > ++    from fractions import gcd
> > +
> > + class Alignment(object):
> > +
> > +--
> > +GitLab
> > +
> > diff --git a/meta/recipes-graphics/xorg-proto/xcb-proto_1.13.bb b/meta/=
recipes-graphics/xorg-proto/xcb-proto_1.13.bb
> > index 7467090920..1f41821302 100644
> > --- a/meta/recipes-graphics/xorg-proto/xcb-proto_1.13.bb
> > +++ b/meta/recipes-graphics/xorg-proto/xcb-proto_1.13.bb
> > @@ -11,7 +11,8 @@ LICENSE =3D "MIT"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd763b081cb10c223435b01e00dc=
0aba7 \
> >                      file://src/dri2.xml;beginline=3D2;endline=3D28;md5=
=3Df8763b13ff432e8597e0d610cf598e65"
> >
> > -SRC_URI =3D "http://xcb.freedesktop.org/dist/${BP}.tar.bz2"
> > +SRC_URI =3D "http://xcb.freedesktop.org/dist/${BP}.tar.bz2 \
> > +           file://0001-xcbgen-use-math-gcd-for-python-3-5.patch"
> >  SRC_URI[md5sum] =3D "abe9aa4886138150bbc04ae4f29b90e3"
> >  SRC_URI[sha256sum] =3D "7b98721e669be80284e9bbfeab02d2d0d54cd11172b722=
71e47a2fe875e2bde1"
> >
> > --
> > 2.28.0
> >
