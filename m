Return-Path: <cristian.iorga@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 11D5E6C76F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2014 12:01:54 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 27 Jan 2014 04:01:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,728,1384329600"; d="scan'208";a="471363430"
Received: from irsmsx103.ger.corp.intel.com ([163.33.3.157])
	by fmsmga002.fm.intel.com with ESMTP; 27 Jan 2014 04:01:53 -0800
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.202]) by
	IRSMSX103.ger.corp.intel.com ([169.254.3.84]) with mapi id
	14.03.0123.003; Mon, 27 Jan 2014 12:01:49 +0000
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: Philip Balister <philip@balister.org>, Tyler Hall <tylerwhall@gmail.com>
Thread-Topic: [OE-core] [PATCH] db: Fix libtool linking against local
	libstdc++.so
Thread-Index: AQHPGq9WcsrfvQsD906F7KFSBvsL9JqYeQjg
Date: Mon, 27 Jan 2014 12:01:49 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB16CF574F@IRSMSX105.ger.corp.intel.com>
References: <1390623243-28674-1-git-send-email-tylerwhall@gmail.com>
	<52E53069.4050508@balister.org>
In-Reply-To: <52E53069.4050508@balister.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.181]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] db: Fix libtool linking against local	libstdc++.so
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
X-List-Received-Date: Mon, 27 Jan 2014 12:01:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

This fixes YB5759 if included in Build Appliance poky repo.
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D5759

Regards,
Cristian Iorga
YP
Intel

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Philip Balister
Sent: Sunday, January 26, 2014 5:57 PM
To: Tyler Hall
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] db: Fix libtool linking against local libstd=
c++.so

On 01/24/2014 11:14 PM, Tyler Hall wrote:
> Building the C++ bindings in a484b35b818768487ff27cf06b8c5d4e128126af
> introduced this error on systems with /usr/lib/libstdc++.so present:
>=20
>     /usr/lib/libstdc++.so: file not recognized: File format not=20
> recognized
>=20
> The shipped libtool is sysroot aware, so pass --with-sysroot so it=20
> will extract the sysroot from the compiler.
>=20
> Signed-off-by: Tyler Hall <tylerwhall@gmail.com>

Tested-by: Philip Balister <philip@balister.org>

It didn't seem to break anything on my build. (Which worked already) Packag=
ing looks OK still.

> ---
>  meta/recipes-support/db/db_5.3.21.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-support/db/db_5.3.21.bb=20
> b/meta/recipes-support/db/db_5.3.21.bb
> index 8ec8870..caf6890 100644
> --- a/meta/recipes-support/db/db_5.3.21.bb
> +++ b/meta/recipes-support/db/db_5.3.21.bb
> @@ -63,7 +63,7 @@ FILES_SOLIBSDEV =3D "${libdir}/libdb.so ${libdir}/libdb=
_cxx.so"
>  # All the --disable-* options replace --enable-smallbuild, which=20
> breaks a bunch of stuff (eg. postfix)  DB5_CONFIG ?=3D "--enable-o_direct=
 --disable-cryptography --disable-queue --disable-replication --disable-ver=
ify --disable-compat185 --disable-sql"
> =20
> -EXTRA_OECONF =3D "${DB5_CONFIG} --enable-shared --enable-cxx"
> +EXTRA_OECONF =3D "${DB5_CONFIG} --enable-shared --enable-cxx --with-sysr=
oot"
> =20
>  # Override the MUTEX setting here, the POSIX library is  # the=20
> default - "POSIX/pthreads/library".
>=20
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

