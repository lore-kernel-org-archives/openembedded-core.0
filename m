Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DEA276FFE8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Sep 2016 06:11:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u826BLK7004404
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Sep 2016 23:11:21 -0700 (PDT)
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.1.206]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0248.002;
	Thu, 1 Sep 2016 23:11:20 -0700
From: "Hatle, Mark" <mark.hatle@windriver.com>
To: "Yang, Liezhi" <Liezhi.Yang@windriver.com>
Thread-Topic: [OE-core] [PATCH 1/1] libnl: remove RREPLACES and RCONFLICTS
	for	libnl-genl
Thread-Index: AQHSBNtIFnGxqo2EVkKvbvHsjDHG7qBlt+4e
Date: Fri, 2 Sep 2016 06:11:20 +0000
Message-ID: <D9728F94-608D-44C8-925D-C19F6B310E33@windriver.com>
References: <cover.1472794137.git.liezhi.yang@windriver.com>,
	<b506d54a2cb91ebf6e166775b9f05c0311c650d0.1472794137.git.liezhi.yang@windriver.com>
In-Reply-To: <b506d54a2cb91ebf6e166775b9f05c0311c650d0.1472794137.git.liezhi.yang@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] libnl: remove RREPLACES and RCONFLICTS for	libnl-genl
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
X-List-Received-Date: Fri, 02 Sep 2016 06:11:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

GK

> On Sep 2, 2016, at 1:31 PM, Robert Yang <liezhi.yang@windriver.com> wrote=
:
>=20
> The libnl-genl.rpm provides libnl-genl2 and libnl-genl-3-200:
>=20
> $ rpm -qp --provides tmp/deploy/rpm/core2_64/libnl-genl-3-200-3.2.28-r0.2=
.core2_64.rpm
> elf(buildid) =3D 4e753b2361ba0b02f162244a87cc0680796e46cc
> libnl-genl =3D 3.2.28
> libnl-genl-3.so.200()(64bit)
> libnl-genl-3.so.200(libnl_3)(64bit)
> libnl-genl2
> libnl-genl-3-200 =3D 1:3.2.28-r0.2
>=20
> so that we don't need set them in the RREPLACES and RCONFLICTS, the
> package manager can handle it, otherwise it would cause do_rootfs errors
> when install both libnl-genl.rpm and lib32-libnl-genl.rpm:
>=20
> Computing transaction...error: Can't install libnl-genl-3-200-1:3.2.28-r0=
.0@core2_64: conflicted package libnl-genl-3-200-1:3.2.28-r0.0@lib32_x86 is=
 locked
>=20
> We didn't meet the error before was because there was no libnl-genl.rpm,
> so that it had no effect, but now the following commit fixed the
> packaging problem: (master-next branch)
>=20
> libnl: fix packaging mistakes
>=20
> Remove RREPLACES and RCONFLICTS for libnl-genl will fix the problem.
>=20
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
> meta/recipes-support/libnl/libnl_3.2.28.bb | 2 --
> 1 file changed, 2 deletions(-)
>=20
> diff --git a/meta/recipes-support/libnl/libnl_3.2.28.bb b/meta/recipes-su=
pport/libnl/libnl_3.2.28.bb
> index 7ddbd40..799962f 100644
> --- a/meta/recipes-support/libnl/libnl_3.2.28.bb
> +++ b/meta/recipes-support/libnl/libnl_3.2.28.bb
> @@ -44,5 +44,3 @@ FILES_${PN}-idiag =3D "${libdir}/libnl-idiag-3.so.*"
> FILES_${PN}-nf    =3D "${libdir}/libnl-nf-3.so.*"
> FILES_${PN}-route =3D "${libdir}/libnl-route-3.so.*"
> FILES_${PN}-xfrm  =3D "${libdir}/libnl-xfrm-3.so.*"
> -RREPLACES_${PN}-genl =3D "libnl-genl2 libnl-genl-3-200"
> -RCONFLICTS_${PN}-genl =3D "libnl-genl2 libnl-genl-3-200"
> --=20
> 2.9.0
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

