Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 20C11734B8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 09:50:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t7Q9oEm8012249
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 26 Aug 2015 02:50:14 -0700 (PDT)
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.3.206]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0235.001;
	Wed, 26 Aug 2015 02:50:14 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: Andrea Adami <andrea.adami@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v2] mtd-utils: disable xattr if
	DISTRO_FEATURES	doesn't contain acl
Thread-Index: AQHQ3SXT8CoGNSMM0k6kHWkTAgg2c54eC3fg
Date: Wed, 26 Aug 2015 09:50:13 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AAFC716948@ALA-MBB.corp.ad.wrs.com>
References: <1440280746-11401-1-git-send-email-andrea.adami@gmail.com>
In-Reply-To: <1440280746-11401-1-git-send-email-andrea.adami@gmail.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.153]
MIME-Version: 1.0
Subject: Re: [PATCH v2] mtd-utils: disable xattr if DISTRO_FEATURES	doesn't contain acl
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Aug 2015 09:50:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedd=
ed-core-
> bounces@lists.openembedded.org] On Behalf Of Andrea Adami
> Sent: Sunday, August 23, 2015 5:59 AM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH v2] mtd-utils: disable xattr if DISTRO_FEATURES=
 doesn't contain acl
>=20
> After commit 24fde4d do_compile fails:
>=20
> | mkfs.jffs2.c:70:21: fatal error: sys/acl.h: No such file or directory
> | #include <sys/acl.h>
>=20
> This is a missing dependency on acl.
> To fix this we add a check to disable xattr when acl is not in DISTRO_FEA=
TURES.

I think you should check the xattr distro feature, but only checking the DI=
STRO_FEATURES
can't ensure the dependency satisfied, why not use the PACKAGECONFIG, somet=
hing like:

PACKAGECONFIG ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'xattr=
', '', d)}"
PACKAGECONFIG[xattr] =3D ", -DWITHOUT_XATTR,attr acl,"

Thanks,
Jackie


>=20
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  meta/recipes-devtools/mtd/mtd-utils_git.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-de=
vtools/mtd/mtd-
> utils_git.bb
> index 8d4892a..6a388c8 100644
> --- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
> +++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
> @@ -19,7 +19,8 @@ SRC_URI =3D "git://git.infradead.org/mtd-utils.git \
>=20
>  S =3D "${WORKDIR}/git/"
>=20
> -EXTRA_OEMAKE =3D "'CC=3D${CC}' 'RANLIB=3D${RANLIB}' 'AR=3D${AR}' 'CFLAGS=
=3D${CFLAGS} -I${S}/include'
> 'BUILDDIR=3D${S}'"
> +DISABLE_XATTR =3D "${@bb.utils.contains('DISTRO_FEATURES', 'acl', '', '-=
DWITHOUT_XATTR', d)}"
> +EXTRA_OEMAKE =3D "'CC=3D${CC}' 'RANLIB=3D${RANLIB}' 'AR=3D${AR}' 'CFLAGS=
=3D${CFLAGS} -I${S}/include
> ${DISABLE_XATTR}' 'BUILDDIR=3D${S}'"
>=20
>  do_install () {
>  	oe_runmake install DESTDIR=3D${D} SBINDIR=3D${sbindir} MANDIR=3D${mandi=
r}
> INCLUDEDIR=3D${includedir}
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

