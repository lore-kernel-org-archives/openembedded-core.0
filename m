Return-Path: <prvs=767f4520c=Mikko.Rapeli@bmw.de>
Received: from esa5.bmw.c3s2.iphmx.com (esa5.bmw.c3s2.iphmx.com
	[68.232.139.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3E89879617
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2018 15:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1535125705; x=1566661705;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=rDNuSAuLPjTTAEd5O+xwQhX/6BxNEDGbYPCTFMnG36c=;
	b=pAl/ABwLdkuMLFEHQ3mqIwaYEEG+k5CCongWDmdIG8NYkqq5gVjLLFCd
	bGvZfskvin+2jsEJq+eeRpl8CwXGtqIi7URg8sf2wkkxc9HIzNzjxUscB
	M2Hn+1m/iu5CHvKUgDgQ9TuXDH6p3v992FIFMUEpHbjujvYJj485p31+F 4=;
Received: from esagw3.bmwgroup.com (HELO esagw3.muc) ([160.46.252.35]) by
	esa5.bmw.c3s2.iphmx.com with ESMTP/TLS; 24 Aug 2018 17:48:24 +0200
Received: from esabb1.muc ([160.50.100.31])  by esagw3.muc with ESMTP/TLS;
	24 Aug 2018 17:48:23 +0200
Received: from smucm10k.bmwgroup.net (HELO smucm10k.europe.bmw.corp)
	([160.48.96.47])
	by esabb1.muc with ESMTP/TLS; 24 Aug 2018 17:48:23 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10k.europe.bmw.corp
	(160.48.96.47) with Microsoft SMTP Server (TLS;
	Fri, 24 Aug 2018 17:48:23 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1367.000;
	Fri, 24 Aug 2018 17:48:22 +0200
From: <Mikko.Rapeli@bmw.de>
To: <pascal.bach@siemens.com>
Thread-Topic: [OE-core] [PATCH] cmake: add CMAKE_SYSROOT to generated
	toolchain file
Thread-Index: AQHUO7TfP39PtwdlbkOrx+nUTU/G7KTO2KyAgAAHkQCAAAqXAA==
Date: Fri, 24 Aug 2018 15:48:22 +0000
Message-ID: <20180824154822.GK20864@hiutale>
References: <20180824123346.8602-1-pascal.bach@siemens.com>
	<20180824141512.GG20864@hiutale> <20180824144323.GJ20864@hiutale>
	<355BE46A91031048906B695426A8D8E61B8A14FB@DEFTHW99EH4MSX.ww902.siemens.net>
In-Reply-To: <355BE46A91031048906B695426A8D8E61B8A14FB@DEFTHW99EH4MSX.ww902.siemens.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.221.42]
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Fri, 24 Aug 2018 15:48:23 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <41F6B14F4681ED4A95C83F4159B781C4@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 24, 2018 at 03:10:28PM +0000, Bach, Pascal wrote:
> =20
> > > Fixes problems which we have also seen on sumo branch. Thanks for thi=
s!
> >=20
> > Sorry, spoke too soon. This fixes compilation on a few recipes in my tr=
ee but
> > there are still lots failures with the same error message. We had a hac=
ky
> > patch to cmake as a workaround but that too causes some problems:
>=20
> I have not yet figured out what CMake based projects are affected and why=
.
> The error seems to happen only for certain projects.

In our case it looks like a library is adding target_include_directories()
with SYSTEM keyword in its cmake module. Everyone who includes the cmake mo=
dule
fails to build. This repeats with a handful of cmake modules and causes all
of their dependencies to fail build with errors like:

.../recipe-sysroot/usr/include/c++/7.3.0/cstdlib:75:15: fatal error: stdlib=
.h: No such file or directory
|  #include_next <stdlib.h>
|                ^~~~~~~~~~
| compilation terminated.

or

| cc1plus: warning: include location "/usr/include" is unsafe for cross-com=
pilation [-Wpoison-system-directories]
...
.../recipe-sysroot/usr/include/stdlib.h:133:35: error: missing binary opera=
tor before token=20
"("
|  #if __HAVE_FLOAT16 && __GLIBC_USE (IEC_60559_TYPES_EXT)
|                                    ^

So to me it looks like using SYSTEM with target_include_directories()
is no longer possible with CMake and gcc > 6:

https://cmake.org/cmake/help/v3.10/command/target_include_directories.html?=
highlight=3Dtarget_include_directories

> > --- a/Modules/Compiler/GNU.cmake
> > +++ b/Modules/Compiler/GNU.cmake
> > @@ -45,7 +45,7 @@
> >    set(CMAKE_${lang}_CREATE_PREPROCESSED_SOURCE
> > "<CMAKE_${lang}_COMPILER> <DEFINES> <INCLUDES> <FLAGS> -E
> > <SOURCE> > <PREPROCESSED_SOURCE>")
> >    set(CMAKE_${lang}_CREATE_ASSEMBLY_SOURCE
> > "<CMAKE_${lang}_COMPILER> <DEFINES> <INCLUDES> <FLAGS> -S
> > <SOURCE> -o <ASSEMBLY_SOURCE>")
> >    if(NOT APPLE OR NOT CMAKE_${lang}_COMPILER_VERSION VERSION_LESS
> > 4) # work around #4462
> > -    set(CMAKE_INCLUDE_SYSTEM_FLAG_${lang} "-isystem ")
> > +    set(CMAKE_INCLUDE_SYSTEM_FLAG_${lang} "-I ")
> >    endif()
> >=20
> >    set(_CMAKE_${lang}_IPO_SUPPORTED_BY_CMAKE YES)
> >=20
> > I wonder what the real fix could be...
> >=20
>=20
> This looks similar to another workaround I saw.
> Setting CMAKE_NO_SYSTEM_FROM_IMPORTED to True. I'm also not sure what the=
 real fix is.
> The issue is also discussed here: https://gitlab.kitware.com/cmake/cmake/=
issues/16291

Thanks for the ticket link.

-Mikko=

