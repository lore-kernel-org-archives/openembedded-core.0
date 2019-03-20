Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0821F7C6EE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 11:48:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 7A32F1858F;
	Wed, 20 Mar 2019 12:48:05 +0100 (CET)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id kE4FIN9NXAwC; Wed, 20 Mar 2019 12:48:03 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id D777C18242;
	Wed, 20 Mar 2019 12:48:03 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C13191A0B0;
	Wed, 20 Mar 2019 12:48:03 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B5BEA1A0AF;
	Wed, 20 Mar 2019 12:48:03 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Wed, 20 Mar 2019 12:48:03 +0100 (CET)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by thoth.se.axis.com (Postfix) with ESMTP id A9FF3FAB;
	Wed, 20 Mar 2019 12:48:03 +0100 (CET)
Received: from XBOX04.axis.com (10.0.5.18) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Wed, 20 Mar 2019 12:48:03 +0100
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1365.000; Wed, 20 Mar 2019 12:48:02 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Jiang Lu <lu.jiang@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH 4/4] relocatable: add file existence checking
	in relocatable_native_pcfiles
Thread-Index: AdTfEsTSKU4KMxgIQFi5FZtS1xMwIQ==
Date: Wed, 20 Mar 2019 11:48:02 +0000
Message-ID: <5bc652cad0774bbfb2e5ee2c4a5203f6@XBOX04.axis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH 4/4] relocatable: add file existence checking in relocatable_native_pcfiles
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
X-List-Received-Date: Wed, 20 Mar 2019 11:48:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of Jiang Lu
> Sent: den 20 mars 2019 10:39
> To: lu.jiang@windriver.com; openembedded-core@lists.openembedded.org;
> richard.purdie@linuxfoundation.org
> Subject: [OE-core] [PATCH 4/4] relocatable: add file existence checking
> in relocatable_native_pcfiles
>=20
> Some package may create a ${libdir}/pkgconfig directory in its sysroot
> without .pc file. It leads following error:
> sed: can't read ${sysroot}/${libdir}/pkgconfig/*.pc: No such file or
> directory
>=20
> To avoid this, add a file existence checking in
> relocatable_native_pcfiles()
> before sed.
>=20
> Signed-off-by: Jiang Lu <lu.jiang@windriver.com>
> ---
>  meta/classes/relocatable.bbclass | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/classes/relocatable.bbclass
> b/meta/classes/relocatable.bbclass
> index 582812c1cf..eb9989d18c 100644
> --- a/meta/classes/relocatable.bbclass
> +++ b/meta/classes/relocatable.bbclass
> @@ -7,11 +7,13 @@ python relocatable_binaries_preprocess() {
>  }
>=20
>  relocatable_native_pcfiles () {
> -	if [ -d ${SYSROOT_DESTDIR}${libdir}/pkgconfig ]; then
> +	filecnt=3D`ls -l ${SYSROOT_DESTDIR}${libdir}/pkgconfig/*.pc 2>/dev/null=
 | wc -l`
> +	if [ $filecnt -gt 0 ]; then
>  		rel=3D${@os.path.relpath(d.getVar('base_prefix'), d.getVar('libdir') +=
 "/pkgconfig")}
>  		sed -i -e "s:${base_prefix}:\${pcfiledir}/$rel:g" ${SYSROOT_DESTDIR}${=
libdir}/pkgconfig/*.pc
>  	fi
> -	if [ -d ${SYSROOT_DESTDIR}${datadir}/pkgconfig ]; then
> +	filecnt=3D`ls -l ${SYSROOT_DESTDIR}${datadir}/pkgconfig/*.pc 2>/dev/nul=
l | wc -l`
> +	if [ $filecnt -gt 0 ]; then
>  		rel=3D${@os.path.relpath(d.getVar('base_prefix'), d.getVar('datadir') =
+ "/pkgconfig")}
>  		sed -i -e "s:${base_prefix}:\${pcfiledir}/$rel:g" ${SYSROOT_DESTDIR}${=
datadir}/pkgconfig/*.pc
>  	fi
> --
> 2.17.1

May I suggest the following instead:

relocatable_native_pcfiles () {
	files=3D$(find ${SYSROOT_DESTDIR}${libdir}/pkgconfig -name '*.pc' 2>/dev/n=
ull)
	if [ "$files" ]; then
		rel=3D${@os.path.relpath(d.getVar('base_prefix'), d.getVar('libdir') + "/=
pkgconfig")}
		sed -i -e "s:${base_prefix}:\${pcfiledir}/$rel:g" $files
	fi
	files=3D$(find ${SYSROOT_DESTDIR}${datadir}/pkgconfig -name '*.pc' 2>/dev/=
null)
	if [ "$files" ]; then
		rel=3D${@os.path.relpath(d.getVar('base_prefix'), d.getVar('datadir') + "=
/pkgconfig")}
		sed -i -e "s:${base_prefix}:\${pcfiledir}/$rel:g" $files
	fi
}

//Peter


