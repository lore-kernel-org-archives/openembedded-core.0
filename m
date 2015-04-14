Return-Path: <bevenson@melinkcorp.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0141.outbound.protection.outlook.com [157.56.110.141])
	by mail.openembedded.org (Postfix) with ESMTP id 1CC6173501
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 15:46:50 +0000 (UTC)
Received: from BN3PR0501MB1089.namprd05.prod.outlook.com (25.160.113.11) by
	BN3PR0501MB1315.namprd05.prod.outlook.com (25.160.183.16) with
	Microsoft SMTP
	Server (TLS) id 15.1.136.25; Tue, 14 Apr 2015 15:46:50 +0000
Received: from BN3PR0501MB1090.namprd05.prod.outlook.com (25.160.113.12) by
	BN3PR0501MB1089.namprd05.prod.outlook.com (25.160.113.11) with
	Microsoft SMTP
	Server (TLS) id 15.1.136.25; Tue, 14 Apr 2015 15:46:48 +0000
Received: from BN3PR0501MB1090.namprd05.prod.outlook.com ([25.160.113.12]) by
	BN3PR0501MB1090.namprd05.prod.outlook.com ([25.160.113.12]) with
	mapi id 15.01.0136.014; Tue, 14 Apr 2015 15:46:48 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: Bryan Evenson <bevenson@melinkcorp.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [oe-core][dizzy][PATCH] base-files: Check for /run and /var/lock
	softlinks on upgrade
Thread-Index: AQHQc62wvLM5wei+eUuM1Pr7RRODYZ1Mp2ag
Date: Tue, 14 Apr 2015 15:46:48 +0000
Message-ID: <BN3PR0501MB1090C5485C34B9B9C6BB1253BBE60@BN3PR0501MB1090.namprd05.prod.outlook.com>
References: <1428684268-55681-1-git-send-email-bevenson@melinkcorp.com>
In-Reply-To: <1428684268-55681-1-git-send-email-bevenson@melinkcorp.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-vipre-scanned: 00D6D3780099A600D6D4C5
authentication-results: melinkcorp.com; dkim=none (message not signed)
	header.d=none;
x-originating-ip: [98.100.91.242]
x-microsoft-antispam: UriScan:; BCL:0; PCL:0; RULEID:; SRVR:BN3PR0501MB1089;
	UriScan:; BCL:0; PCL:0; RULEID:; SRVR:BN3PR0501MB1315; 
x-forefront-antispam-report: BMV:1; SFV:NSPM;
	SFS:(10019020)(6009001)(164054003)(377454003)(13464003)(2900100001)(62966003)(107886001)(86362001)(46102003)(66066001)(2656002)(2950100001)(450100001)(102836002)(76576001)(2501003)(19580405001)(77156002)(19580395003)(54356999)(76176999)(33656002)(50986999)(106116001)(122556002)(40100003)(74316001)(99286002)(4001410100001)(87936001)(92566002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR0501MB1089;
	H:BN3PR0501MB1090.namprd05.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
x-microsoft-antispam-prvs: <BN3PR0501MB1089B60010B9B05570BC6D0ABBE60@BN3PR0501MB1089.namprd05.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(5002010)(5005006); SRVR:BN3PR0501MB1089; BCL:0;
	PCL:0; RULEID:; SRVR:BN3PR0501MB1089; 
x-forefront-prvs: 054642504A
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2015 15:46:48.0192 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d06db0f9-efcc-42b5-9f8c-c934a01c9bfd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR0501MB1089
X-OriginatorOrg: melinkcorp.com
Subject: Re: [dizzy][PATCH] base-files: Check for /run and /var/lock softlinks on upgrade
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
X-List-Received-Date: Tue, 14 Apr 2015 15:46:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

All,

> -----Original Message-----
> From: Bryan Evenson [mailto:bevenson@melinkcorp.com]
> Sent: Friday, April 10, 2015 12:44 PM
> To: openembedded-core@lists.openembedded.org
> Cc: Bryan Evenson
> Subject: [oe-core][dizzy][PATCH] base-files: Check for /run and /var/lock
> softlinks on upgrade
>=20
> Commit ea647cd9eebdc3e3121b84074519c4bb305adac9 moved the locations
> of /run and /var/lock to match the FHS 3 draft specifications.
> However, the install doesn't remove the existing directories.
> As a result, upgrading a system may result in /run as a softlink
> to /var/run and /var/run as a softlink to /run, creating a circular
> link.
>=20
> During pre and post-install, check for the existence of the old
> softlinks, move the old file contents to a temporary location, remove
> the softlinks, and restore the directory contents after installation.
>=20

I went about this wrong, as I forgot that items may be mounted under /run. =
 I'm working on a different solution in which the preinst step removes the =
/run and /var/lock softlinks if they exist.  However, I still have odd issu=
es.  The first reboot works fine, but then on the next reboot there is a li=
nk inside /run for "run -> /var/run" and inside /var there is a link for "r=
un -> /var/volatile/run".  This doesn't match up with the files listed in t=
he base-files recipe.  I can't figure out where these links are coming from=
.  Has anyone else had issues upgrading base-files?

Thanks,
Bryan

> Signed-off-by: Bryan Evenson <bevenson@melinkcorp.com>
> ---
>  meta/recipes-core/base-files/base-files_3.0.14.bb | 55
> +++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
>=20
> diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb
> b/meta/recipes-core/base-files/base-files_3.0.14.bb
> index 07f5c54..71cea08 100644
> --- a/meta/recipes-core/base-files/base-files_3.0.14.bb
> +++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
> @@ -66,6 +66,41 @@ hostname =3D "openembedded"
>=20
>  BASEFILESISSUEINSTALL ?=3D "do_install_basefilesissue"
>=20
> +# In previous versions of base-files, /run was a softlink to /var/run an=
d the
> +# directory was located in /var/volatlie/run.  Also, /var/lock was a sof=
tlink
> +# to /var/volatile/lock which is where the real directory was located.  =
Now,
> +# /run and /run/lock are the real directories.  If we are upgrading, we =
may
> +# need to remove the symbolic links first before we create the directori=
es.
> +# Otherwise the directory creation will fail and we will have circular s=
ymbolic
> +# links.
> +#
> +# If we do need to remove the symbolic links first, we also need to pres=
erve
> +# all the contents of the directory so running programs can find the fil=
es that
> +# are in use in these directories.  Move the contents to a temporary
> directory
> +# during pre-install to protect the contents
> +pkg_preinst_${PN} () {
> +    #!/bin/sh -e
> +    if [ x"$D" =3D "x" ]; then
> +        if [ -e "/var/volatile/lock" ]; then
> +            # Move the contents of /var/volatile/lock to a temporary dir=
ectory
> +            mkdir -p /run_lock_tmp
> +            mv /var/volatile/lock/* /run_lock_tmp/
> +
> +            # Remove the current directory
> +            rm -rf /var/volatile/lock
> +        fi
> +
> +        if [ -h "/run" ]; then
> +            # Move the contents of /run to a temporary directory
> +            mkdir -p /run_tmp
> +            mv /run/* /run_tmp/
> +
> +            # Remove the current directory
> +            rm -rf /run
> +        fi
> +    fi
> +}
> +
>  do_install () {
>  	for d in ${dirs755}; do
>  		install -m 0755 -d ${D}$d
> @@ -79,6 +114,7 @@ do_install () {
>  	for d in ${volatiles}; do
>  		ln -sf volatile/$d ${D}${localstatedir}/$d
>  	done
> +
>  	ln -snf ../run ${D}${localstatedir}/run
>  	ln -snf ../run/lock ${D}${localstatedir}/lock
>=20
> @@ -144,6 +180,25 @@ do_install_append_linuxstdbase() {
>          done
>  }
>=20
> +# If we are on the actual hardware, check if we had to move /run and
> /run/lock.
> +# If so, copy the temporary directory contents to their new locations.
> +pkg_postinst_${PN} () {
> +    #!/bin/sh -e
> +    if [ x"$D" =3D "x" ]; then
> +        if [ -e "/run_tmp" ]; then
> +            mv /run_tmp/* /run/
> +            rmdir /run_tmp
> +        fi
> +
> +        if [ -e "/run_lock_tmp/" ]; then
> +            mv /run_lock_tmp/* /run/lock
> +            rmdir /run_lock_tmp
> +        fi
> +    else
> +        exit 1
> +    fi
> +}
> +
>  PACKAGES =3D "${PN}-doc ${PN} ${PN}-dev ${PN}-dbg"
>  FILES_${PN} =3D "/"
>  FILES_${PN}-doc =3D "${docdir} ${datadir}/common-licenses"
> --
> 2.1.0


