Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 784FDC25B75
	for <webhook@archiver.kernel.org>; Mon, 13 May 2024 12:02:19 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web11.58474.1715601734867358736
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 May 2024 05:02:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=UaNsgB8B;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.175, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-61bee45d035so42955277b3.1
        for <openembedded-core@lists.openembedded.org>; Mon, 13 May 2024 05:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1715601734; x=1716206534; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oZcCtYJNlSDwzO4O/wFbINoXXTXxSvaeEA1pyZsuxIQ=;
        b=UaNsgB8BywAadrgsYTmyqGvOhS/e5Vz4oncpjp8oUdujJT0Va3AeutVI0NAnCTwhFC
         LIZfCo2cHaDOAA0Ntwhr3/Apybk6zl8sAuYbQOHcmwDWy2Tvs0M+q3Wq+M+aIEqN7+Q8
         jpZ91JGGldXSGQw4dQ9YowWl4VcYjDA2WVjnNzapAqmxekioCt61Qf1zZ+DFZ/5dJgqf
         /I6B7gw65o20yIwDyRrwdhm2pSxR4wn1JbrG+bHIbV+CTuIL6KQpTy6BFTnw2zWdmfHJ
         at/SnXnUZYbBFNIAOnHNTCpIew4oJ5mIkXO94TdnAi+vsBJipP16cNPLBMn+xqyh40J7
         WtGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715601734; x=1716206534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oZcCtYJNlSDwzO4O/wFbINoXXTXxSvaeEA1pyZsuxIQ=;
        b=BfKyPylPla9mZR+ZDtzjnqdk/eDZ64ClTUecsCaURitQn/ozoMtl1G2U39AqMTzk4d
         0TsvKQO4lU5tIbki12lR9E4lLjtb7bsyH74hUXu9HHMf0crXVS8A4RtIniRZ5wdt+CuD
         +LOddvKUJNzpDKAHK2fQJsSR/y4z5FxwIIuzDklFZFPubBqs/50ilD9Rge0DV3pIdvnO
         GvHhs+enOLTvsRpx9LRd6j8eR+/iLf4dV7VMahi70LVzURaZHa6dlu7x7CvOwE97JFcX
         9jtFj2Fr97zFGnH9RDBF5t81IdxLodSeKmsfwy3LwdLFA8ONrkWqMnvjdVzykP+pDObK
         wdig==
X-Gm-Message-State: AOJu0YzjR17Va6j3Kzjn+TEYVFcXfUi7uPaiC/d1U/BSfz+5nPJYPL0A
	v730Tg4har1X+kVcjkt5vH9YOkBdyNAdCl+C/sJTL0+TtOPxprnmuwLS9coR8K6k4LPwRgtWAsB
	6GiFrR/9hOiQ7s/BzY6/Rt7zp9Rd/9OWbhEgEycOcRrowy2UOIoI=
X-Google-Smtp-Source: AGHT+IEMo0Miwbch3ssFwYG9sqkmwc2F9PQPbQz9EvyIzszdTpwV1S8X1+0fvj0zr+pckyL1lhraJ6Zf7sP0JMNOGTU=
X-Received: by 2002:a25:ad9d:0:b0:de4:6efa:debd with SMTP id
 3f1490d57ef6-dee4f1b7bc9mr8337130276.29.1715601733916; Mon, 13 May 2024
 05:02:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240513015242.1233919-1-seungkyun.kim@lge.com>
In-Reply-To: <20240513015242.1233919-1-seungkyun.kim@lge.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 13 May 2024 05:02:02 -0700
Message-ID: <CAOSpxdY+Ym5=fq4QdOXa=Wyq9ueiYEov_X7CCDQOKhb027toGg@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] ipk/rootfs: run sanity test of
 multilib in parallel
To: seungkyun.kim@lge.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 May 2024 12:02:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199230

This patch would need to be submitted (and merged)  for master before
it can be considered for kirkstone.  And since it is a significant
change in behaviour, even then it might not be suitable for an LTS
branch.

Thanks,

Steve

On Sun, May 12, 2024 at 6:52=E2=80=AFPM Seungkyun Kim via
lists.openembedded.org <seungkyun.kim=3Dlge.com@lists.openembedded.org>
wrote:
>
> From: "seungkyun.kim" <seungkyun.kim@lge.com>
>
> For multilib type packages, there is an additional temporary
> installation before the actual installation. It makes almost doubles
> the do_rootfs time if having many multilib type packages.
> To avoid this overhead, run sanity test in parallel.
> Installing package groups through opkg takes much more time than
> copying directory.
>
> Signed-off-by: seungkyun.kim <seungkyun.kim@lge.com>
> ---
>  meta/lib/oe/package_manager/ipk/rootfs.py | 21 +++++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)
>
> diff --git a/meta/lib/oe/package_manager/ipk/rootfs.py b/meta/lib/oe/pack=
age_manager/ipk/rootfs.py
> index 10a831994e..88108bb312 100644
> --- a/meta/lib/oe/package_manager/ipk/rootfs.py
> +++ b/meta/lib/oe/package_manager/ipk/rootfs.py
> @@ -4,6 +4,7 @@
>
>  import re
>  import filecmp
> +import multiprocessing
>  import shutil
>  from oe.rootfs import Rootfs
>  from oe.manifest import Manifest
> @@ -196,10 +197,16 @@ class PkgRootfs(DpkgOpkgRootfs):
>
>      def _multilib_test_install(self, pkgs):
>          ml_temp =3D self.d.getVar("MULTILIB_TEMP_ROOTFS")
> +        rootfs_temp =3D os.path.join(ml_temp, "rootfs")
>          bb.utils.mkdirhier(ml_temp)
>
> -        dirs =3D [self.image_rootfs]
> +        bb.utils.remove(rootfs_temp, True)
> +        shutil.copytree(self.image_rootfs, rootfs_temp)
> +        dirs =3D [rootfs_temp]
> +        return multiprocessing.Process(target=3Dself._multilib_test_pkg_=
install, \
> +                                       args=3D(pkgs, ml_temp, dirs, Fals=
e))
>
> +    def _multilib_test_pkg_install(self, pkgs, ml_temp, dirs):
>          for variant in self.d.getVar("MULTILIB_VARIANTS").split():
>              ml_target_rootfs =3D os.path.join(ml_temp, variant)
>
> @@ -216,6 +223,8 @@ class PkgRootfs(DpkgOpkgRootfs):
>              dirs.append(ml_target_rootfs)
>
>          self._multilib_sanity_test(dirs)
> +        rootfs_temp =3D os.path.join(ml_temp, "rootfs")
> +        bb.utils.remove(rootfs_temp)
>
>      '''
>      While ipk incremental image generation is enabled, it will remove th=
e
> @@ -298,14 +307,18 @@ class PkgRootfs(DpkgOpkgRootfs):
>
>          for pkg_type in self.install_order:
>              if pkg_type in pkgs_to_install:
> +                sanity_test =3D None
>                  # For multilib, we perform a sanity test before final in=
stall
>                  # If sanity test fails, it will automatically do a bb.fa=
tal()
>                  # and the installation will stop
>                  if pkg_type =3D=3D Manifest.PKG_TYPE_MULTILIB:
> -                    self._multilib_test_install(pkgs_to_install[pkg_type=
])
> +                    sanity_test=3D self._multilib_test_install(pkgs_to_i=
nstall[pkg_type])
> +                    sanity_test.start()
>
> -                self.pm.install(pkgs_to_install[pkg_type],
> -                                [False, True][pkg_type =3D=3D Manifest.P=
KG_TYPE_ATTEMPT_ONLY])
> +                self.pm.install(pkgs_to_install[pkg_type], [False, True]=
[pkg_type =3D=3D Manifest.PKG_TYPE_ATTEMPT_ONLY])
> +
> +                if sanity_test is not None:
> +                    sanity_test.join()
>
>          if self.progress_reporter:
>              self.progress_reporter.next_stage()
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199222): https://lists.openembedded.org/g/openembedde=
d-core/message/199222
> Mute This Topic: https://lists.openembedded.org/mt/106065500/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

