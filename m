Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QlA62-0000cN-OL
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 03:36:38 +0200
Received: by iyj12 with SMTP id 12so4338660iyj.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Jul 2011 18:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=references:in-reply-to:mime-version:content-transfer-encoding
	:content-type:message-id:cc:x-mailer:from:subject:date:to;
	bh=DFsDJISOKLZTKqQOWw7F8oRRye++292YtU5LvLyAOV0=;
	b=u6PpYcw+A7ZGgazjM6JBQddbKoaKoR6po7BmB1wkbvkmbVuxLfiu69gRFcq8hSTxBn
	oWVn1qXV0OmfUwA+t+puc/4ukfc2LeHGQCTOUbPish60+EEjKCHsxQ5Hv1V+dUi9CzZ8
	G13MMO4tD7AcryPtkfi0rS+pxF0gZ7Ne5r7JM=
Received: by 10.231.41.69 with SMTP id n5mr4285855ibe.83.1311557546087;
	Sun, 24 Jul 2011 18:32:26 -0700 (PDT)
Received: from [192.168.1.81] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id s2sm5563626icw.17.2011.07.24.18.32.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 24 Jul 2011 18:32:24 -0700 (PDT)
References: <1311343068-942-1-git-send-email-galak@kernel.crashing.org>
In-Reply-To: <1311343068-942-1-git-send-email-galak@kernel.crashing.org>
Mime-Version: 1.0 (iPad Mail 8J2)
Message-Id: <6C262B02-045C-4E2B-9780-1E9D044BF652@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
X-Mailer: iPad Mail (8J2)
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 24 Jul 2011 18:33:19 -0700
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-4.6: Fix packaging of native toolchains
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
X-List-Received-Date: Mon, 25 Jul 2011 01:36:38 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



On Jul 22, 2011, at 6:57 AM, Kumar Gala <galak@kernel.crashing.org> wrote:

> The base gcc package is missing liblto_plugin.so.  If we try a simple
> hello world compile we get something like:
>=20
> root@p5020-ds:~# gcc hello.c
> gcc: fatal error: -fuse-linker-plugin, but liblto_plugin.so not found
> compilation terminated.
>=20
> We need to include liblto_plugin.so in the base gcc package and not
> gcc-dev.
>=20
> Signed-off-by: Kumar Gala <galak@kernel.crashing.org>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> meta/recipes-devtools/gcc/gcc-4.6.inc            |    2 +-
> meta/recipes-devtools/gcc/gcc-package-target.inc |    1 +
> 2 files changed, 2 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtools=
/gcc/gcc-4.6.inc
> index a724594..4c1e1e1 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.6.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
> @@ -1,6 +1,6 @@
> require gcc-common.inc
>=20
> -PR =3D "r1"
> +PR =3D "r2"
>=20
> # Third digit in PV should be incremented after a minor release
> # happens from this branch on gcc e.g. currently its 4.6.0
> diff --git a/meta/recipes-devtools/gcc/gcc-package-target.inc b/meta/recip=
es-devtools/gcc/gcc-package-target.inc
> index e6105da..a0e5da4 100644
> --- a/meta/recipes-devtools/gcc/gcc-package-target.inc
> +++ b/meta/recipes-devtools/gcc/gcc-package-target.inc
> @@ -17,6 +17,7 @@ FILES_${PN} =3D "\
>   ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/cc* \
>   ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/lto* \
>   ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/lib*${SOLIBS} \
> +  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/liblto*${SOLIBSDEV} \
>   ${gcclibdir}/${TARGET_SYS}/${BINV}/*.o \
>   ${gcclibdir}/${TARGET_SYS}/${BINV}/specs \
>   ${gcclibdir}/${TARGET_SYS}/${BINV}/lib*${SOLIBS} \
> --=20
> 1.7.3.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


