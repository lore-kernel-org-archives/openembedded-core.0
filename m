Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SFCsQ-00061r-Du
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Apr 2012 01:11:02 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 03 Apr 2012 16:01:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="125038002"
Received: from orsmsx606.amr.corp.intel.com ([10.22.226.128])
	by orsmga001.jf.intel.com with ESMTP; 03 Apr 2012 16:01:51 -0700
Received: from orsmsx101.amr.corp.intel.com (10.22.225.128) by
	orsmsx606.amr.corp.intel.com (10.22.226.128) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Tue, 3 Apr 2012 16:01:51 -0700
Received: from orsmsx106.amr.corp.intel.com ([169.254.5.128]) by
	ORSMSX101.amr.corp.intel.com ([169.254.8.154]) with mapi id
	14.01.0355.002; Tue, 3 Apr 2012 16:01:51 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/2] gcc-cross-intermediate: fix do_install
	for x32
Thread-Index: AQHNEe08ay89DMcxRUK0BVkNuSqaipaJt24A
Date: Tue, 3 Apr 2012 23:01:50 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C01382684@ORSMSX106.amr.corp.intel.com>
References: <cover.1333493785.git.nitin.a.kamble@intel.com>
	<3c9f0f3047f80b6290ea2ceb4fcecdb7b286c1d5.1333493785.git.nitin.a.kamble@intel.com>
In-Reply-To: <3c9f0f3047f80b6290ea2ceb4fcecdb7b286c1d5.1333493785.git.nitin.a.kamble@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.139]
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] gcc-cross-intermediate: fix do_install for x32
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
X-List-Received-Date: Tue, 03 Apr 2012 23:11:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> nitin.a.kamble@intel.com
> Sent: Tuesday, April 03, 2012 3:58 PM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 1/2] gcc-cross-intermediate: fix do_install
> for x32
>=20
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>=20
> This Fixes [Ycoto #2223] bug.
>=20
> The gcc osdir is obtained in the do_install by invocation of command
> "gcc -print-multi-os-directory". For x32 it returns gcc osdir for the
> default abi which is x86_64. Fix this by adding target abi parameter to
> the gcc command line to get correct gcc osdir with invocation of
> command "gcc -mx32 -print-multi-os-directory"
>=20
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
>  .../gcc/gcc-cross-intermediate.inc                 |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
> b/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
> index 316a764..1995725 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
> +++ b/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
> @@ -35,9 +35,10 @@ do_compile () {
>  }
>=20
>  do_install () {
> +	set -x

I have removed this debug line from the commit on the contrib branch.
Nitin


>  	oe_runmake 'DESTDIR=3D${D}' install
>  	install -d ${D}${target_base_libdir}/
> -	osdir=3D`${D}${STAGING_BINDIR_TOOLCHAIN}.${PN}/${TARGET_PREFIX}gcc
> -print-multi-os-directory`
> +	osdir=3D`${D}${STAGING_BINDIR_TOOLCHAIN}.${PN}/${TARGET_PREFIX}gcc
> +${TARGET_CC_ARCH} -print-multi-os-directory`
>  	mv ${D}${exec_prefix}/${TARGET_SYS}/lib/$osdir/*
> ${D}${target_base_libdir}/
>=20
>  	# We don't really need this (here shares/ contains man/, info/,
> locale/).
> --
> 1.7.7.6
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


