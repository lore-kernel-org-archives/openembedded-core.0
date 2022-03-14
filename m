Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A927C433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 14:22:48 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web12.26678.1647267765261339125
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 07:22:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=ileF47fW;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1647267765;
  x=1678803765;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=WOUJKfN9L7Zj7q/wN+2b9P1SG7gYe9FtKMEtBzPOeLk=;
  b=ileF47fWkJFuv2zrTzpJGHCsmAPe4dyRJPR7uegZ4Prkj0/FyL54vi0K
   HCF6XLPgS+t/um0RcBBq1VPUcP0NG8YXvQz2ZCyhhOhKs8RJ036bokDeL
   rq1Y/etHwuES4gKnUQcuSSOafxrKc8DTxNNPxKmQAILx/P78EQXmtKNEa
   +Lh4hwVwV5WmzeX8rA0iKVb+b3mB5Mrstz1bjdexW6sGHAhGny6tiVTH+
   juFAHcgpriMz0xr1vJYUCpq6NFRD8u2JF8BFPXIsjZ67uVWLKz37I5xpL
   oDjPbHI9P3riiboeGFopgfN1ZuoyGbGbPEg9oCAQfL961kJNUZF6KxMJZ
   A==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Ming Liu <liu.ming50@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] image.bbclass: make sure do_rootfs run from a
 clean workspace
Thread-Topic: [OE-core] [PATCH] image.bbclass: make sure do_rootfs run from a
 clean workspace
Thread-Index: AQHYNgfGUzzz54wv5ka1757b795RCKy+8KmQ
Date: Mon, 14 Mar 2022 14:22:42 +0000
Message-ID: <4b9059ba87384d63af475e645a9aa259@axis.com>
References: <20220312115303.10434-1-liu.ming50@gmail.com>
In-Reply-To: <20220312115303.10434-1-liu.ming50@gmail.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 14:22:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163148

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Ming Liu
> Sent: den 12 mars 2022 12:53
> To: openembedded-core@lists.openembedded.org
> Cc: Ming Liu <liu.ming50@gmail.com>
> Subject: [OE-core] [PATCH] image.bbclass: make sure do_rootfs run from a
> clean workspace
>=20
> From: Ming Liu <liu.ming50@gmail.com>
>=20
> Add ${IMAGE_ROOTFS} and ${IMGDEPLOYDIR} to do_rootfs[dirs] and
> do_rootfs[cleandirs], this ensures do_rootfs run from a clean
> workspace, with this change, we can now remove two bb.utils.mkdirhier
> lines from meta/lib/oe/rootfs.py.
>=20
> Also drop ${S} from do_rootfs[cleandirs], nothing being installed into
> that directory.
>=20
> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> ---
>  meta/classes/image.bbclass | 4 ++--
>  meta/lib/oe/rootfs.py      | 4 ----
>  2 files changed, 2 insertions(+), 6 deletions(-)
>=20
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 2b0ce4a988..98a0555040 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -252,8 +252,8 @@ fakeroot python do_rootfs () {
>=20
>      progress_reporter.finish()
>  }
> -do_rootfs[dirs] =3D "${TOPDIR}"
> -do_rootfs[cleandirs] +=3D "${S} ${IMGDEPLOYDIR}"
> +do_rootfs[dirs] =3D "${IMAGE_ROOTFS} ${IMGDEPLOYDIR} ${TOPDIR}"
> +do_rootfs[cleandirs] +=3D "${IMAGE_ROOTFS} ${IMGDEPLOYDIR}"

There is no reason to include paths in do_rootfs[dirs] if they are=20
also in do_rootfs[cleandirs] (except for the last path in=20
do_rootfs[dirs]). It only leads to bb.utils.mkdirhier() being=20
called for the same directory multiple times.

I have sent a patch series to correct this here and for all other=20
cases I could find. For anyone interested, I used the following=20
incantation to find the culprits:

grep -r 'cleandirs.*".*"' meta | grep -v '${@' | \
  perl -ne 'if (/^(.*):(.*)\[.*\].*"(.*)"/) { @vars =3D split(" ", $3); for=
 $var (@vars) {  print("=3D" x 75, "\n$1 - $2 - $var\n"); system("grep", "-=
-color=3Dalways", "$2\\[dirs\\].*\\$var ", $1); } }'

>  do_rootfs[file-checksums] +=3D "${POSTINST_INTERCEPT_CHECKSUMS}"
>  addtask rootfs after do_prepare_recipe_sysroot
>=20
> diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
> index b0dd625539..98cf3f244d 100644
> --- a/meta/lib/oe/rootfs.py
> +++ b/meta/lib/oe/rootfs.py
> @@ -190,10 +190,6 @@ class Rootfs(object, metaclass=3DABCMeta):
>          post_process_cmds =3D self.d.getVar("ROOTFS_POSTPROCESS_COMMAND"=
)
>          rootfs_post_install_cmds =3D
> self.d.getVar('ROOTFS_POSTINSTALL_COMMAND')
>=20
> -        bb.utils.mkdirhier(self.image_rootfs)
> -
> -        bb.utils.mkdirhier(self.deploydir)
> -
>          execute_pre_post_process(self.d, pre_process_cmds)
>=20
>          if self.progress_reporter:
> --
> 2.25.1

//Peter


