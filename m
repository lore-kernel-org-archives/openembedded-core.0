Return-Path: <pascal.bach@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 3322065C86
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Oct 2014 14:47:09 +0000 (UTC)
Received: from mail2.sbs.de (localhost [127.0.0.1])
	by thoth.sbs.de (8.14.3/8.14.3) with ESMTP id s9OEl62b008949;
	Fri, 24 Oct 2014 16:47:06 +0200
Received: from DEFTHW99ERJMSX.ww902.siemens.net
	(defthw99erjmsx.ww902.siemens.net [139.22.70.135])
	by mail2.sbs.de (8.14.3/8.14.3) with ESMTP id s9OEl5kg018686
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 24 Oct 2014 16:47:05 +0200
Received: from DEFTHW99ERTMSX.ww902.siemens.net (139.22.70.200) by
	DEFTHW99ERJMSX.ww902.siemens.net (139.22.70.135) with Microsoft SMTP
	Server (TLS) id 14.3.195.1; Fri, 24 Oct 2014 16:47:05 +0200
Received: from DEFTHW99EH4MSX.ww902.siemens.net ([169.254.2.235]) by
	DEFTHW99ERTMSX.ww902.siemens.net ([139.22.70.200]) with mapi id
	14.03.0195.001; Fri, 24 Oct 2014 16:47:04 +0200
From: "Bach, Pascal" <pascal.bach@siemens.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] cmake: Try and improve cleaning of builds
	when	B==S
Thread-Index: AQHP75WwT2e2D9zhw06cvplFAcKAiJw/U0Ag
Date: Fri, 24 Oct 2014 14:47:04 +0000
Message-ID: <355BE46A91031048906B695426A8D8E616AE6E06@DEFTHW99EH4MSX.ww902.siemens.net>
References: <1414160428.30118.19.camel@ted>
In-Reply-To: <1414160428.30118.19.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [139.22.70.29]
MIME-Version: 1.0
Subject: Re: [PATCH] cmake: Try and improve cleaning of builds when	B==S
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
X-List-Received-Date: Fri, 24 Oct 2014 14:47:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Just a note it should be sufficient to delete the CMakeCache.txt file to fo=
rce CMake to reconfigure.
But deleting the rest doesn't hurt.

Pascal

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> Of Richard Purdie
> Sent: Freitag, 24. Oktober 2014 16:20
> To: openembedded-core
> Subject: [OE-core] [PATCH] cmake: Try and improve cleaning of builds when
> B=3D=3DS
>=20
> Currently if B=3D=3DS for a cmake recipe, the build will not reconfigure.=
 This patch
> adds
> code to remove the generated cmake files, meaning cmake will then be
> forced to regenerate
> them. This forces cmake to see configuration changes it may not otherwise
> see.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
> index 995ddf1..10f8f98 100644
> --- a/meta/classes/cmake.bbclass
> +++ b/meta/classes/cmake.bbclass
> @@ -79,6 +79,8 @@ cmake_do_configure() {
>  		rm -rf ${B}
>  		mkdir -p ${B}
>  		cd ${B}
> +	else
> +		find ${B} -name CMakeFiles -or -name Makefile -or -name
> cmake_install.cmake -or -name CMakeCache.txt -delete
>  	fi
>=20
>  	# Just like autotools cmake can use a site file to cache result that
> need generated binaries to run
>=20
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

