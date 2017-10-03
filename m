Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7A8B86093B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Oct 2017 18:18:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 231F91883F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Oct 2017 20:18:33 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 6_rzjoHUqCEB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Oct 2017 20:18:31 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 610EB189C6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Oct 2017 20:18:31 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A81401A134
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Oct 2017 20:17:20 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9D2191A0CD
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Oct 2017 20:17:20 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Oct 2017 20:17:20 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by thoth.se.axis.com (Postfix) with ESMTP id 9178D269F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Oct 2017 20:17:20 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Tue, 3 Oct 2017 20:17:20 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1263.000; Tue, 3 Oct 2017 20:17:20 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "OE Core (openembedded-core@lists.openembedded.org)"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Oddness regarding file locks in package.bbclass
Thread-Index: AdM8cfN5nvoQJpaXRQK3j9oaui2EfA==
Date: Tue, 3 Oct 2017 18:17:20 +0000
Message-ID: <b720c2022a0a49b08ea3159ef3fdf083@XBOX02.axis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Oddness regarding file locks in package.bbclass
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
X-List-Received-Date: Tue, 03 Oct 2017 18:18:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I just stumbled upon something odd in package.bbclass. In commit=20
ede381d5 from January 2011 (the code hasn't changed since), the=20
use of the ${PACKAGELOCK} lock file was changed to shared to=20
improve parallelism. However, when looking at the actual change=20
it becomes confusing. I have included it below for reference.

> commit ede381d56b180b384fdad98d445e5430819cfade
> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> Date:   Wed Jan 19 11:04:15 2011 +0000
>=20
>     package.bbclass: Take a shared lock when reading to improve do_packag=
e parallelism
>    =20
>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index d39c694de5..8e7fa26f72 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -497,7 +497,8 @@ python emit_pkgdata() {
>  	pkgdest =3D bb.data.getVar('PKGDEST', d, 1)
>  	pkgdatadir =3D bb.data.getVar('PKGDESTWORK', d, True)
> =20
> -	lf =3D bb.utils.lockfile(bb.data.expand("${PACKAGELOCK}", d))
> +	# Take shared lock since we're only reading, not writing
> +	lf =3D bb.utils.lockfile(bb.data.expand("${PACKAGELOCK}", d), True)

Here the lock is changed to shared as per the commit message.

> =20
>  	data_file =3D pkgdatadir + bb.data.expand("/${PN}" , d)
>  	f =3D open(data_file, 'w')
> @@ -649,6 +650,7 @@ python package_do_shlibs() {
>  	shlibs_dir =3D bb.data.getVar('SHLIBSDIR', d, True)
>  	shlibswork_dir =3D bb.data.getVar('SHLIBSWORKDIR', d, True)
> =20
> +	# Take shared lock since we're only reading, not writing
>  	lf =3D bb.utils.lockfile(bb.data.expand("${PACKAGELOCK}", d))

Here, however, it is not changed, even though a comment is added to=20
say that it is. Was this intentional, or just an oversight?

> =20
>  	def linux_so(root, path, file):
> @@ -878,6 +880,7 @@ python package_do_pkgconfig () {
>  							if hdr =3D=3D 'Requires':
>  								pkgconfig_needed[pkg] +=3D exp.replace(',', ' ').split()
> =20
> +	# Take shared lock since we're only reading, not writing
>  	lf =3D bb.utils.lockfile(bb.data.expand("${PACKAGELOCK}", d))

Here again a comment is added, but the code is not changed to match.

> =20
>  	for pkg in packages.split():

Also, what is the ${PACKAGELOCK} lock file actually protecting? With=20
the exception of the two questionable cases above, I cannot see that=20
the lock is taken privately anywhere else. And since it looks as the=20
code in package_do_shlibs() and package_do_pkgconfig() is not what=20
needs protection (based on the added comments above), what is?

//Peter


