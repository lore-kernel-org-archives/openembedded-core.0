Return-Path: <alexandru.sardan@freescale.com>
X-Greylist: delayed 905 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 30 Apr 2014 11:59:23 UTC
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2lp0211.outbound.protection.outlook.com [207.46.163.211])
	by mail.openembedded.org (Postfix) with ESMTP id 880D260808
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Apr 2014 11:59:23 +0000 (UTC)
Received: from DM2PR03MB368.namprd03.prod.outlook.com (10.141.55.22) by
	DM2PR03MB365.namprd03.prod.outlook.com (10.141.55.12) with Microsoft
	SMTP Server (TLS) id 15.0.934.12; Wed, 30 Apr 2014 11:44:17 +0000
Received: from DM2PR03MB368.namprd03.prod.outlook.com ([10.141.55.22]) by
	DM2PR03MB368.namprd03.prod.outlook.com ([10.141.55.22]) with mapi id
	15.00.0929.001; Wed, 30 Apr 2014 11:44:17 +0000
From: "alexandru.sardan@freescale.com" <alexandru.sardan@freescale.com>
To: "alexandru.sardan@freescale.com" <alexandru.sardan@freescale.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] libgcc: Use TARGET_VENDOR_virtclass-multilib for
	symlink src calculation
Thread-Index: AQHPVASdbv23p3Ez+Umlcv8t9IN7w5sqKs7g
Date: Wed, 30 Apr 2014 11:44:16 +0000
Message-ID: <7a9e7bbd787948bb90841d78ceee1d88@DM2PR03MB368.namprd03.prod.outlook.com>
References: <1397055663-5541-1-git-send-email-alexandru.sardan@freescale.com>
In-Reply-To: <1397055663-5541-1-git-send-email-alexandru.sardan@freescale.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.88.166.1]
x-forefront-prvs: 0197AFBD92
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009001)(6009001)(428001)(377454003)(51704005)(13464003)(199002)(189002)(85852003)(76482001)(4396001)(83322001)(46102001)(74502001)(83072002)(19580405001)(74662001)(76176999)(80976001)(77096999)(31966008)(19580395003)(54356999)(20776003)(92566001)(79102001)(86362001)(74316001)(66066001)(50986999)(80022001)(76576001)(99396002)(99286001)(77982001)(101416001)(2656002)(87936001)(81342001)(33646001)(81542001)(24736002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM2PR03MB365;
	H:DM2PR03MB368.namprd03.prod.outlook.com; FPR:; MLV:sfv;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (: freescale.com does not designate permitted sender hosts)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=alexandru.sardan@freescale.com; 
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH] libgcc: Use TARGET_VENDOR_virtclass-multilib for symlink src calculation
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
X-List-Received-Date: Wed, 30 Apr 2014 11:59:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping


> -----Original Message-----
> From: Alexandru-Cezar Sardan [mailto:alexandru.sardan@freescale.com]
> Sent: Wednesday, April 09, 2014 6:01 PM
> To: openembedded-core@lists.openembedded.org
> Cc: Saul Wold; Sardan Alexandru Cezar-B41700
> Subject: [PATCH] libgcc: Use TARGET_VENDOR_virtclass-multilib for symlink
> src calculation
>=20
> When defining a symlink for the multilib location based on
> MULTILIB_VARIANTS,
> use TARGET_VENDOR_virtclass-multilib to get the vendor, as hardcoding
> the value with TARGET_VENDOR + 'ml' + mlvariant may not corespond with
> the actual directory where the libs are installed.
>=20
> Signed-off-by: Alexandru-Cezar Sardan <alexandru.sardan@freescale.com>
> ---
>  meta/recipes-devtools/gcc/libgcc.inc |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/gcc/libgcc.inc b/meta/recipes-
> devtools/gcc/libgcc.inc
> index 96f1969..eb7a6e8 100644
> --- a/meta/recipes-devtools/gcc/libgcc.inc
> +++ b/meta/recipes-devtools/gcc/libgcc.inc
> @@ -131,8 +131,8 @@ python do_multilib_install() {
>          if not tune_bitness:
>              tune_bitness =3D '32' # /lib =3D> 32bit lib
>=20
> -        src =3D '../../../' + tune_baselib + '/' + \
> -            tune_arch + d.getVar('TARGET_VENDOR', True) + 'ml' + ml + \
> +        vendor =3D d.getVar('TARGET_VENDOR_virtclass-multilib' + '-' + m=
l,
> True)
> +        src =3D '../../../' + tune_baselib + '/' + tune_arch + vendor + =
\
>              '-' + d.getVar('TARGET_OS', True) + '/' + binv + '/'
>=20
>          dest =3D d.getVar('D', True) + d.getVar('libdir', True) + '/' + =
\
> --
> 1.7.9.5
>=20


