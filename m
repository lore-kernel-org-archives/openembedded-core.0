Return-Path: <pascal.bach@siemens.com>
X-Greylist: delayed 528 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 24 Aug 2018 15:19:37 UTC
Received: from gecko.sbs.de (gecko.sbs.de [194.138.37.40])
	by mail.openembedded.org (Postfix) with ESMTP id 5372E71BF2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2018 15:19:37 +0000 (UTC)
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id w7OFAlne000775
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Fri, 24 Aug 2018 17:10:47 +0200
Received: from DEFTHW99ERGMSX.ww902.siemens.net
	(defthw99ergmsx.ww902.siemens.net [139.22.70.132])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTPS id w7OFAHvc029786
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Fri, 24 Aug 2018 17:10:47 +0200
Received: from DEFTHW99ER2MSX.ww902.siemens.net (139.22.70.75) by
	DEFTHW99ERGMSX.ww902.siemens.net (139.22.70.132) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Fri, 24 Aug 2018 17:10:29 +0200
Received: from DEFTHW99EH4MSX.ww902.siemens.net ([169.254.2.97]) by
	DEFTHW99ER2MSX.ww902.siemens.net ([139.22.70.75]) with mapi id
	14.03.0408.000; Fri, 24 Aug 2018 17:10:29 +0200
From: "Bach, Pascal" <pascal.bach@siemens.com>
To: "Mikko.Rapeli@bmw.de" <Mikko.Rapeli@bmw.de>
Thread-Topic: [OE-core] [PATCH] cmake: add CMAKE_SYSROOT to generated
	toolchain file
Thread-Index: AQHUO6a3HbelJDVjZk2JNMua/n9J0aTO0OkAgAAH4ICAAChVQA==
Date: Fri, 24 Aug 2018 15:10:28 +0000
Message-ID: <355BE46A91031048906B695426A8D8E61B8A14FB@DEFTHW99EH4MSX.ww902.siemens.net>
References: <20180824123346.8602-1-pascal.bach@siemens.com>
	<20180824141512.GG20864@hiutale> <20180824144323.GJ20864@hiutale>
In-Reply-To: <20180824144323.GJ20864@hiutale>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [139.22.70.54]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake: add CMAKE_SYSROOT to generated toolchain file
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
X-List-Received-Date: Fri, 24 Aug 2018 15:19:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

=20
> > Fixes problems which we have also seen on sumo branch. Thanks for this!
>=20
> Sorry, spoke too soon. This fixes compilation on a few recipes in my tree=
 but
> there are still lots failures with the same error message. We had a hacky
> patch to cmake as a workaround but that too causes some problems:

I have not yet figured out what CMake based projects are affected and why.
The error seems to happen only for certain projects.

> --- a/Modules/Compiler/GNU.cmake
> +++ b/Modules/Compiler/GNU.cmake
> @@ -45,7 +45,7 @@
>    set(CMAKE_${lang}_CREATE_PREPROCESSED_SOURCE
> "<CMAKE_${lang}_COMPILER> <DEFINES> <INCLUDES> <FLAGS> -E
> <SOURCE> > <PREPROCESSED_SOURCE>")
>    set(CMAKE_${lang}_CREATE_ASSEMBLY_SOURCE
> "<CMAKE_${lang}_COMPILER> <DEFINES> <INCLUDES> <FLAGS> -S
> <SOURCE> -o <ASSEMBLY_SOURCE>")
>    if(NOT APPLE OR NOT CMAKE_${lang}_COMPILER_VERSION VERSION_LESS
> 4) # work around #4462
> -    set(CMAKE_INCLUDE_SYSTEM_FLAG_${lang} "-isystem ")
> +    set(CMAKE_INCLUDE_SYSTEM_FLAG_${lang} "-I ")
>    endif()
>=20
>    set(_CMAKE_${lang}_IPO_SUPPORTED_BY_CMAKE YES)
>=20
> I wonder what the real fix could be...
>=20

This looks similar to another workaround I saw.
Setting CMAKE_NO_SYSTEM_FROM_IMPORTED to True. I'm also not sure what the r=
eal fix is.
The issue is also discussed here: https://gitlab.kitware.com/cmake/cmake/is=
sues/16291

Pascal

