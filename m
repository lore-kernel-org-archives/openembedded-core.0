Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3514E79F31
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Nov 2018 15:19:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 01C90182FF;
	Fri,  2 Nov 2018 16:19:46 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id xHG0Plod562q; Fri,  2 Nov 2018 16:19:44 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 924F8182D7;
	Fri,  2 Nov 2018 16:19:44 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 80F481E07F;
	Fri,  2 Nov 2018 16:19:44 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7512C1E079;
	Fri,  2 Nov 2018 16:19:44 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Fri,  2 Nov 2018 16:19:44 +0100 (CET)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by seth.se.axis.com (Postfix) with ESMTP id 69187267C;
	Fri,  2 Nov 2018 16:19:44 +0100 (CET)
Received: from XBOX04.axis.com (10.0.5.18) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Fri, 2 Nov 2018 16:19:44 +0100
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1365.000; Fri, 2 Nov 2018 16:19:44 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "matthias.schiffer@ew.tq-group.com" <matthias.schiffer@ew.tq-group.com>
Thread-Topic: [OE-core] [PATCH] base.bbclass: avoid 'find -ignore_readdir_race
	-delete'
Thread-Index: AQHUcrtc9GrB99Nni0ihMy247F6i6qU8mN0Q
Date: Fri, 2 Nov 2018 15:19:44 +0000
Message-ID: <8ba204af82c54d23805deefb5197dd6f@XBOX04.axis.com>
References: <20181102143927.15387-1-matthias.schiffer@ew.tq-group.com>
In-Reply-To: <20181102143927.15387-1-matthias.schiffer@ew.tq-group.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base.bbclass: avoid 'find -ignore_readdir_race	-delete'
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
X-List-Received-Date: Fri, 02 Nov 2018 15:19:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of
> matthias.schiffer@ew.tq-group.com
> Sent: den 2 november 2018 15:39
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] base.bbclass: avoid 'find -
> ignore_readdir_race -delete'
>=20
> From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
>=20
> Until recent versions of findutils, -ignore_readdir_race did not work
> correctly with -delete. This led to spurious build failures when files
> disappeared; specifically this was seen due to do_configure and
> do_populate_lic running concurrently for packages with ${B} =3D=3D ${WORK=
DIR}:
>=20
>    find: '.../sstate-build-populate_lic': No such file or directory
>=20
> As the find command of the host system is used here, we can't ensure that
> the used version contains the fix. Work around the issue by passing the
> output of find to 'rm -f' instead of using -delete.
>=20
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> ---
>=20
> It would be great if this patch could be backported to all versions
> back to Rocko, as our current setup is still based on Rocko.
>=20
>  meta/classes/base.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index df11c8b270..5ffd8396e3 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -303,7 +303,7 @@ base_do_configure() {
>  			if [ "${CLEANBROKEN}" !=3D "1" -a \( -e Makefile -o -e makefile -o -e=
 GNUmakefile \) ]; then
>  				oe_runmake clean
>  			fi

You might want to include a comment here explaining why rm -f is used=20
instead of -delete, or someone might come along and optimize the code...

> -			find ${B} -ignore_readdir_race -name \*.la -delete
> +			find ${B} -ignore_readdir_race -name \*.la -type f -print0 | xargs -0=
 rm -f
>  		fi
>  	fi
>  	if [ -n "${CONFIGURESTAMPFILE}" ]; then
> --
> 2.17.1

//Peter


