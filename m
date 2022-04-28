Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 827F2C433EF
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 13:34:37 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.10277.1651152870669690698
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 06:34:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=EO8Mp9bP;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1651152871;
  x=1682688871;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=aiC8MLvwjXLHhGJX6TS0y+YYQ9jV3dXD2uq13yzhVgs=;
  b=EO8Mp9bPApcjvNkK0hMQOrq+y3nQh7o6Xyk1mcuoC2iY9zUoMPhS3plU
   4wXfLNRZYXkzaZcfD+KGUjuDbbfswH39KkPzWUQ7y9LGRnVf4xvJJQjLn
   qZM9uyh+/gQG/lvAZNY7x49Y/oSlnjmAeM52oVvX3aEANrQgLa6d68p1u
   AA0oqKeZ04zhF8txFRfcBJjsex1pP0MKfr2hy/567QIk1PFitr2EJEtQv
   gNwHtMR0n0NZQkmhLhIxFCLRh7AcWBdglMDVeWnPHReDx8zlqS7h2Nuwb
   e+j12pZThCJZuZjkauXROodhQEzo/9BIvVdE81BXemplkMYcSVNXv2EyK
   w==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH v2] base-passwd: Disable shell for default users
Thread-Topic: [OE-core] [PATCH v2] base-passwd: Disable shell for default
 users
Thread-Index: AQHYWuW0spDQ4kY5m0e+GwxHQyYxOa0FUz5w
Date: Thu, 28 Apr 2022 13:34:27 +0000
Message-ID: <f8b6dac873114d92985ac907c1c7e088@axis.com>
References: <20220428094932.1411461-1-jiaqing.zhao@linux.intel.com>
In-Reply-To: <20220428094932.1411461-1-jiaqing.zhao@linux.intel.com>
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
 <openembedded-core@lists.openembedded.org>; Thu, 28 Apr 2022 13:34:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164947

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Jiaqing Zhao
> Sent: den 28 april 2022 11:50
> To: openembedded-core@lists.openembedded.org
> Cc: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
> Subject: [OE-core] [PATCH v2] base-passwd: Disable shell for default user=
s
>=20
> Change the shell of all global static users other than root (which
> retains /bin/sh) and sync (as /bin/sync is rather harmless) to
> /sbin/nologin (as /usr/sbin/nologin does not exist in openembedded)
>=20
> Upstream-Status: Backport [https://launchpad.net/ubuntu/+source/base-pass=
wd/3.5.30]

Since Kirkstone is out the door, is there any reason to not update=20
the version of base-passwd instead?

//Peter

> Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
> ---
> v2:
> Fix indentation in bbfile.
> ---
>  .../base-passwd/disable-shell.patch           | 57 +++++++++++++++++++
>  .../base-passwd/base-passwd_3.5.29.bb         |  1 +
>  2 files changed, 58 insertions(+)
>  create mode 100644 meta/recipes-core/base-passwd/base-passwd/disable-
> shell.patch
>=20
> diff --git a/meta/recipes-core/base-passwd/base-passwd/disable-shell.patc=
h
> b/meta/recipes-core/base-passwd/base-passwd/disable-shell.patch
> new file mode 100644
> index 0000000000..dddc93ca35
> --- /dev/null
> +++ b/meta/recipes-core/base-passwd/base-passwd/disable-shell.patch
> @@ -0,0 +1,57 @@
> +From 91e0db96741359173ddf2be083aafcc1a3c32472 Mon Sep 17 00:00:00 2001
> +From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
> +Date: Mon, 18 Apr 2022 11:22:43 +0800
> +Subject: [PATCH] Disable shell for default users
> +
> +Change the shell of all global static users other than root (which
> +retains /bin/sh) and sync (as /bin/sync is rather harmless) to
> +/sbin/nologin (as /usr/sbin/nologin does not exist in openembedded)
> +
> +Upstream-Status: Backport [https://launchpad.net/ubuntu/+source/base-
> passwd/3.5.30]
> +Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
> +---
> + passwd.master | 32 ++++++++++++++++----------------
> + 1 file changed, 16 insertions(+), 16 deletions(-)
> +
> +diff --git a/passwd.master b/passwd.master
> +index e1c32ff..0cd5ffd 100644
> +--- a/passwd.master
> ++++ b/passwd.master
> +@@ -1,18 +1,18 @@
> + root::0:0:root:/root:/bin/sh
> +-daemon:*:1:1:daemon:/usr/sbin:/bin/sh
> +-bin:*:2:2:bin:/bin:/bin/sh
> +-sys:*:3:3:sys:/dev:/bin/sh
> ++daemon:*:1:1:daemon:/usr/sbin:/sbin/nologin
> ++bin:*:2:2:bin:/bin:/sbin/nologin
> ++sys:*:3:3:sys:/dev:/sbin/nologin
> + sync:*:4:65534:sync:/bin:/bin/sync
> +-games:*:5:60:games:/usr/games:/bin/sh
> +-man:*:6:12:man:/var/cache/man:/bin/sh
> +-lp:*:7:7:lp:/var/spool/lpd:/bin/sh
> +-mail:*:8:8:mail:/var/mail:/bin/sh
> +-news:*:9:9:news:/var/spool/news:/bin/sh
> +-uucp:*:10:10:uucp:/var/spool/uucp:/bin/sh
> +-proxy:*:13:13:proxy:/bin:/bin/sh
> +-www-data:*:33:33:www-data:/var/www:/bin/sh
> +-backup:*:34:34:backup:/var/backups:/bin/sh
> +-list:*:38:38:Mailing List Manager:/var/list:/bin/sh
> +-irc:*:39:39:ircd:/var/run/ircd:/bin/sh
> +-gnats:*:41:41:Gnats Bug-Reporting System (admin):/var/lib/gnats:/bin/sh
> +-nobody:*:65534:65534:nobody:/nonexistent:/bin/sh
> ++games:*:5:60:games:/usr/games:/sbin/nologin
> ++man:*:6:12:man:/var/cache/man:/sbin/nologin
> ++lp:*:7:7:lp:/var/spool/lpd:/sbin/nologin
> ++mail:*:8:8:mail:/var/mail:/sbin/nologin
> ++news:*:9:9:news:/var/spool/news:/sbin/nologin
> ++uucp:*:10:10:uucp:/var/spool/uucp:/sbin/nologin
> ++proxy:*:13:13:proxy:/bin:/sbin/nologin
> ++www-data:*:33:33:www-data:/var/www:/sbin/nologin
> ++backup:*:34:34:backup:/var/backups:/sbin/nologin
> ++list:*:38:38:Mailing List Manager:/var/list:/sbin/nologin
> ++irc:*:39:39:ircd:/var/run/ircd:/sbin/nologin
> ++gnats:*:41:41:Gnats Bug-Reporting System
> (admin):/var/lib/gnats:/sbin/nologin
> ++nobody:*:65534:65534:nobody:/nonexistent:/sbin/nologin
> +--
> +2.32.0
> +
> diff --git a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
> b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
> index 9a27ad3ab5..ef7792ae49 100644
> --- a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
> +++ b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
> @@ -14,6 +14,7 @@ SRC_URI =3D
> "https://launchpad.net/debian/+archive/primary/+files/${BPN}_${PV}.tar
>             file://input.patch \
>             file://disable-docs.patch \
>             file://kvm.patch \
> +           file://disable-shell.patch \
>             "
>=20
>  SRC_URI[md5sum] =3D "6beccac48083fe8ae5048acd062e5421"
> --
> 2.34.1


