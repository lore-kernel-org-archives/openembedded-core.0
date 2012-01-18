Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RnSIt-00072l-S4
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jan 2012 10:59:39 +0100
Received: by wibhr14 with SMTP id hr14so395695wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jan 2012 01:52:01 -0800 (PST)
Received: by 10.180.87.100 with SMTP id w4mr9134833wiz.13.1326880321834;
	Wed, 18 Jan 2012 01:52:01 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id l8sm38887968wiy.5.2012.01.18.01.52.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 Jan 2012 01:52:00 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1326855665-11617-1-git-send-email-raj.khem@gmail.com>
Date: Wed, 18 Jan 2012 10:51:58 +0100
Message-Id: <182165EE-D546-4E80-932D-6409E234863B@dominion.thruhere.net>
References: <1326855665-11617-1-git-send-email-raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH] e2fsprogs_1.42.bb: Fix build fallout for uclibc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Jan 2012 09:59:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 18 jan. 2012, om 04:01 heeft Khem Raj het volgende geschreven:

> e2fsprogs 1.42 onwards uses fallocate() which uclibc
> does not implement(yet). In most of places its use
> is controlled and it only used when configure detects
> fallocate being present but in this one case it missed
> to check for fallocate being available so here we
> add the check

FWIW, e2fsprogs(-native) also has problems with ASNEEDED:

| tune2fs: symbol lookup error: tune2fs: undefined symbol: =
ext2fs_group_desc

regards,

Koen

>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> .../e2fsprogs/e2fsprogs-1.42/fallocate.patch       |   22 =
++++++++++++++++++++
> meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb  |    3 +-
> 2 files changed, 24 insertions(+), 1 deletions(-)
> create mode 100644 =
meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42/fallocate.patch
>=20
> diff --git =
a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42/fallocate.patch =
b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42/fallocate.patch
> new file mode 100644
> index 0000000..4d952a5
> --- /dev/null
> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42/fallocate.patch
> @@ -0,0 +1,22 @@
> +We assume that fallocate is supported somehow
> +but we need to check if we have fallocate()
> +this problem shows up on uclibc systems since
> +uclibc does not have fallocate() implemented
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Upstream-Status: Pending
> +
> +Index: e2fsprogs-1.42/lib/ext2fs/unix_io.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- e2fsprogs-1.42.orig/lib/ext2fs/unix_io.c	2012-01-17 =
17:24:34.290780625 -0800
> ++++ e2fsprogs-1.42/lib/ext2fs/unix_io.c	2012-01-17 =
17:25:37.338783680 -0800
> +@@ -895,7 +895,7 @@
> + 		goto unimplemented;
> + #endif
> + 	} else {
> +-#ifdef FALLOC_FL_PUNCH_HOLE
> ++#if defined FALLOC_FL_PUNCH_HOLE && defined HAVE_FALLOCATE
> + 		/*
> + 		 * If we are not on block device, try to use punch hole
> + 		 * to reclaim free space.
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb =
b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb
> index 9ff85a2..f6759aa7 100644
> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb
> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb
> @@ -1,8 +1,9 @@
> require e2fsprogs.inc
>=20
> -PR =3D "r0"
> +PR =3D "r1"
>=20
> SRC_URI +=3D "file://quotefix.patch \
> +            file://fallocate.patch \
>             file://acinclude.m4"
>=20
> SRC_URI[md5sum] =3D "a3c4ffd7352310ab5e9412965d575610"
> --=20
> 1.7.5.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



