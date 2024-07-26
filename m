Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09005C3DA4A
	for <webhook@archiver.kernel.org>; Fri, 26 Jul 2024 17:04:11 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.65840.1722013441184312377
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jul 2024 10:04:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Zi38Hitf;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52fc14d6689so1642092e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 10:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722013439; x=1722618239; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vcX0o2BMzczgyNKd5M9Jd5FaGUctHKFG+A6LoOUgg00=;
        b=Zi38HitfreomsIxQUEE4soFNy0yy1xkDUp7xUfi4yJN3RToiSPVrzFCHYDlYpSv5DH
         /9N+HLmfXAJzomSXzngdAIQB9DdFhs/uKrpe4ALJVUfWySpss3vxvGD4dDgcQul+SRWY
         SD1nHHidnJ9VFCmOc6dUlH0acnT4qhWjFCUHmeNS+DX9Sb+9HlSiVHIuwMRIBl4kcsAa
         4XywSf10ilpxRaeEdJaAgA4KYDTiq56dpBhuzQgJtpTfHuN8fi7mrqXRXF09U6A0K1mv
         Uu7rtwqfkIeTE4WUIf+Ljqb2puk5rvo6FvCg+sR6ukHPqIHpVlV1vpt27tR5oGcRqBkB
         GxNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722013439; x=1722618239;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vcX0o2BMzczgyNKd5M9Jd5FaGUctHKFG+A6LoOUgg00=;
        b=rAZh6ACykLf0lpv7P6RodjrKuQlA10hCdNFNHidlbzltUaAuNv2m1mNC0entczjILk
         KBbZvEJqvJ0D/asHgJOvqRpzW3xFmPEFIkjiNAF3Q/EeGhw2yby1WQ56mD384WgBmHY6
         xkuMvwpXmL18vK/9HaL9z/Md3erhfQ8Lt85JPoriQ0J/nE3YXXdWVGi9ZC/Semx2oNd1
         ec1I8ERAC8927P0rxWox/Fne1xuJoVu4yl+EL2OBPMkEFy41afOKUZqmhgxW3l4/E59c
         84XUTk1xV/23cClk984JfTFBN+4In5hgoaVsIgHTXY8Tgs7m3014crrn8k48Vbehyh2t
         NvWg==
X-Gm-Message-State: AOJu0YycN6eJnjoUgT06JjrBoTb/n7fTwmeHlFvfAkqI8GsNgRKr5J5P
	6fdMOSaq9qgW2d8ty9yKvNuihjmT6rLAn7frlCqrEzLYRw3WYxfrqnuY6A2/iAJ7M0P1zfVWheB
	QR/MOoZlZk8/pglFTS636ap/5NCM=
X-Google-Smtp-Source: AGHT+IHjAfUFlpBliKZBOFuVKxP+R7YGIGdxO3WLF6DdFT/80ssFi0boDCgSvR6Gp3WjAvSInNdqnxyO0shJBthiVxw=
X-Received: by 2002:a05:6512:200b:b0:52e:96d7:2f35 with SMTP id
 2adb3069b0e04-5309b27a371mr293541e87.24.1722013439036; Fri, 26 Jul 2024
 10:03:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240726112431.698884-1-zboszor@gmail.com> <CAJdd5GYtvYx8szx6W2hMgKh=UHkAX7+FJ4gmaVJ4eyNj4F7teA@mail.gmail.com>
 <ae5b577e-005c-49e3-bfe7-aec330b072a7@gmail.com>
In-Reply-To: <ae5b577e-005c-49e3-bfe7-aec330b072a7@gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Fri, 26 Jul 2024 11:03:46 -0600
Message-ID: <CAJdd5GYfnJSw7LP5SYUX5dKSK1MzGGgpLRAPUXMiGEzZZ3+Nhg@mail.gmail.com>
Subject: Re: [PATCH] rpcbind: Fix boot time start failure
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Steve Sakoman <steve@sakoman.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 17:04:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202560

On Fri, Jul 26, 2024 at 9:55=E2=80=AFAM B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=
=A1n <zboszor@gmail.com> wrote:
>
> 2024. 07. 26. 17:21 keltez=C3=A9ssel, Joshua Watt =C3=ADrta:
> > On Fri, Jul 26, 2024 at 5:24=E2=80=AFAM Zolt=C3=A1n B=C3=B6sz=C3=B6rm=
=C3=A9nyi <zboszor@gmail.com> wrote:
> >> With commits 90bc1810 ("bitbake.conf: Add runtimedir") and
> >> 561e853e ("rpcbind: Specify state directory under /run") rpcbind
> >> still can fail during startup.
> >>
> >> It has two problems:
> >> * The lockfile is still hardcoded as "/var/run/rpcbind.lock".
> >>    It needs to use the same internal define for RPCBIND_STATEDIR
> >>    as the paths for rpcbind.xdr and portmap.xdr.
> >> * Using --with-statedir=3D/run/rpcbind doesn't guarantee that this
> >>    directory exists when rpcbind.service starts. Add this guarantee
> >>    by running rpcbind.service with After=3Dsystemd-tmpfiles-setup.serv=
ice
> >>    and add the tmpfiles.d entry for /run/rpcbind.
> > The original patches have been working for me on nanbield (and
> > kirkstone), so I'm a little confused as to why this is not working for
> > you; I'd like to avoid patching the source code if at all possible as
> > carrying patches like this is a burden
>
> The error I got is:
>
> rpcbind[455]: rpcbind: /var/run/rpcbind.lock: Read-only file system
>
> So, while /var/run is a symlink to /run, the latter is not writable yet.
> Indeed, rpcbind.service was starting very early. These changes
> delay it enough to avoid the problem.
>
> The inconsistency between using /run via --with-statedir=3D/run
> directly for some the xdr files but not for the lockfile is not nice.
> That must have been an oversight in the source code.

Yes it is, however I suspect this patch isn't _strictly_ necessary to
fix the problem as long as the service file change is done (using a
drop file). That said, I'd rather not carry a patch unnecessarily and
we should attempt to fix it upstream instead of carry the patch.

The systemd service change should also be upstreamed, but thankfully
we can fix it with a drop file instead of a patch so I'm fine with
doing that.

>
> These changes fix the issue for me in nanbield. I can reproduce
> the above problem in scarthgap without these changes.
>
> FWIW, different machines can give very different testing results,
> due to the differences in their number of CPU cores and speed.
> Recently, I had to add a modified rngd.service from dracut
> to rng-tools as an in-house change, because one particular
> machine (slow by today's standards, based on AMD Kabini)
> ended up with this service failing, due to the CPU not supporting
> RDRAND and the JITTER random source driver starting particularly
> slowly on it, so rngd couldn't pick it up when started only from
> initramfs.
>
> >> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.c=
om>
> >> ---
> >>   ...ke-the-lockfile-follow-with-statedir.patch | 31 +++++++++++++++++=
+
> >>   ...ice-after-etc-tmpfiles.d-is-processe.patch | 32 +++++++++++++++++=
++
> >>   .../rpcbind/rpcbind/rpcbind.tmpfiles          |  1 +
> >>   .../recipes-extended/rpcbind/rpcbind_1.2.6.bb |  6 ++++
> >>   4 files changed, 70 insertions(+)
> >>   create mode 100644 meta/recipes-extended/rpcbind/rpcbind/0001-Make-t=
he-lockfile-follow-with-statedir.patch
> >>   create mode 100644 meta/recipes-extended/rpcbind/rpcbind/0002-Run-rp=
cbind.service-after-etc-tmpfiles.d-is-processe.patch
> >>   create mode 100644 meta/recipes-extended/rpcbind/rpcbind/rpcbind.tmp=
files
> >>
> >> diff --git a/meta/recipes-extended/rpcbind/rpcbind/0001-Make-the-lockf=
ile-follow-with-statedir.patch b/meta/recipes-extended/rpcbind/rpcbind/0001=
-Make-the-lockfile-follow-with-statedir.patch
> >> new file mode 100644
> >> index 0000000000..d487312d22
> >> --- /dev/null
> >> +++ b/meta/recipes-extended/rpcbind/rpcbind/0001-Make-the-lockfile-fol=
low-with-statedir.patch
> >> @@ -0,0 +1,31 @@
> >> +From f10db88174e73c78c028561715f16ed38148ebde Mon Sep 17 00:00:00 200=
1
> >> +From: =3D?UTF-8?q?Zolt=3DC3=3DA1n=3D20B=3DC3=3DB6sz=3DC3=3DB6rm=3DC3=
=3DA9nyi?=3D
> >> + <zboszor@gmail.com>
> >> +Date: Fri, 26 Jul 2024 12:36:06 +0200
> >> +Subject: [PATCH 1/2] Make the lockfile follow --with-statedir=3D
> >> +MIME-Version: 1.0
> >> +Content-Type: text/plain; charset=3DUTF-8
> >> +Content-Transfer-Encoding: 8bit
> >> +
> >> +Upstream-Status: Inactive-Upstream [lastrelease: 2021-05-10]
> >> +Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.=
com>
> >> +---
> >> + src/rpcbind.c | 2 +-
> >> + 1 file changed, 1 insertion(+), 1 deletion(-)
> >> +
> >> +diff --git a/src/rpcbind.c b/src/rpcbind.c
> >> +index 36a95b9..948a284 100644
> >> +--- a/src/rpcbind.c
> >> ++++ b/src/rpcbind.c
> >> +@@ -105,7 +105,7 @@ char *nss_modules =3D "files";
> >> + /* who to suid to if -s is given */
> >> + #define RUN_AS  "daemon"
> >> +
> >> +-#define RPCBINDDLOCK "/var/run/rpcbind.lock"
> >> ++#define RPCBINDDLOCK RPCBIND_STATEDIR "/rpcbind.lock"
> > /var/run should be a symlink to /run, so I really don't think this
> > should be necessary (at least with the default value for $runtimedir)
> >
> >> +
> >> + int runasdaemon =3D 0;
> >> + int insecure =3D 0;
> >> +--
> >> +2.45.2
> >> +
> >> diff --git a/meta/recipes-extended/rpcbind/rpcbind/0002-Run-rpcbind.se=
rvice-after-etc-tmpfiles.d-is-processe.patch b/meta/recipes-extended/rpcbin=
d/rpcbind/0002-Run-rpcbind.service-after-etc-tmpfiles.d-is-processe.patch
> >> new file mode 100644
> >> index 0000000000..f454fdbb3b
> >> --- /dev/null
> >> +++ b/meta/recipes-extended/rpcbind/rpcbind/0002-Run-rpcbind.service-a=
fter-etc-tmpfiles.d-is-processe.patch
> >> @@ -0,0 +1,32 @@
> >> +From 408b18c77c254baaa9111b3e7031ebf12149db38 Mon Sep 17 00:00:00 200=
1
> >> +From: =3D?UTF-8?q?Zolt=3DC3=3DA1n=3D20B=3DC3=3DB6sz=3DC3=3DB6rm=3DC3=
=3DA9nyi?=3D
> >> + <zboszor@gmail.com>
> >> +Date: Fri, 26 Jul 2024 12:54:38 +0200
> >> +Subject: [PATCH 2/2] Run rpcbind.service after /etc/tmpfiles.d is pro=
cessed
> >> +MIME-Version: 1.0
> >> +Content-Type: text/plain; charset=3DUTF-8
> >> +Content-Transfer-Encoding: 8bit
> >> +
> >> +Upstream-Status: Inactive-Upstream [lastrelease: 2021-05-10]
> >> +Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.=
com>
> >> +---
> >> + systemd/rpcbind.service.in | 3 +++
> >> + 1 file changed, 3 insertions(+)
> >> +
> >> +diff --git a/systemd/rpcbind.service.in b/systemd/rpcbind.service.in
> >> +index f45ee1e..e9d94ce 100644
> >> +--- a/systemd/rpcbind.service.in
> >> ++++ b/systemd/rpcbind.service.in
> >> +@@ -9,6 +9,9 @@ RequiresMountsFor=3D@statedir@
> >> + Requires=3Drpcbind.socket
> >> + Wants=3Drpcbind.target
> >> +
> >> ++# Make sure the runtime directory exists
> >> ++After=3Dsystemd-tmpfiles-setup.service
> > I'd rather have the recipe provide a drop file for this instead of
> > patching the source
> >
> >> ++
> >> + [Service]
> >> + Type=3Dnotify
> >> + EnvironmentFile=3D-@_sysconfdir@/rpcbind.conf
> >> +--
> >> +2.45.2
> >> +
> >> diff --git a/meta/recipes-extended/rpcbind/rpcbind/rpcbind.tmpfiles b/=
meta/recipes-extended/rpcbind/rpcbind/rpcbind.tmpfiles
> >> new file mode 100644
> >> index 0000000000..fecee72c09
> >> --- /dev/null
> >> +++ b/meta/recipes-extended/rpcbind/rpcbind/rpcbind.tmpfiles
> >> @@ -0,0 +1 @@
> >> +d /run/rpcbind 0755 root root -
> >> diff --git a/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb b/meta/rec=
ipes-extended/rpcbind/rpcbind_1.2.6.bb
> >> index e751eb631c..477092b37d 100644
> >> --- a/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb
> >> +++ b/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb
> >> @@ -13,8 +13,11 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db46486e4=
c4a416602693a711bb5bfa39 \
> >>   SRC_URI =3D "${SOURCEFORGE_MIRROR}/rpcbind/rpcbind-${PV}.tar.bz2 \
> >>              file://init.d \
> >>              file://rpcbind.conf \
> >> +           file://rpcbind.tmpfiles \
> >>              file://rpcbind_add_option_to_fix_port_number.patch \
> >>              file://0001-systemd-use-EnvironmentFile.patch \
> >> +           file://0001-Make-the-lockfile-follow-with-statedir.patch \
> >> +           file://0002-Run-rpcbind.service-after-etc-tmpfiles.d-is-pr=
ocesse.patch \
> >>             "
> >>   SRC_URI[sha256sum] =3D "5613746489cae5ae23a443bb85c05a11741a5f12c8f5=
5d2bb5e83b9defeee8de"
> >>
> >> @@ -49,6 +52,9 @@ do_install:append () {
> >>                  ${UNPACKDIR}/init.d > ${D}${sysconfdir}/init.d/rpcbin=
d
> >>          chmod 0755 ${D}${sysconfdir}/init.d/rpcbind
> >>          install -m 0644 ${UNPACKDIR}/rpcbind.conf ${D}${sysconfdir}/r=
pcbind.conf
> >> +
> >> +       install -d ${D}${sysconfdir}/tmpfiles.d
> >> +       install -m 0644 ${UNPACKDIR}/rpcbind.tmpfiles ${D}${sysconfdir=
}/tmpfiles.d/rpcbind.conf
> >>   }
> >>
> >>   ALTERNATIVE:${PN} =3D "rpcinfo"
> >> --
> >> 2.45.2
> >>
>

