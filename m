Return-Path: <pascal.bach@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id EBB7F7D86E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 15:50:06 +0000 (UTC)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x4EFnxN8019973
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Tue, 14 May 2019 17:49:59 +0200
Received: from DEFTHW99ERIMSX.ww902.siemens.net
	(defthw99erimsx.ww902.siemens.net [139.22.70.134])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTPS id x4EFnxuC030441
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Tue, 14 May 2019 17:49:59 +0200
Received: from DENBGAT9ERGMSX.ww902.siemens.net (139.22.70.137) by
	DEFTHW99ERIMSX.ww902.siemens.net (139.22.70.134) with Microsoft SMTP
	Server (TLS) id 14.3.435.0; Tue, 14 May 2019 17:49:59 +0200
Received: from DENBGAT9EL2MSX.ww902.siemens.net ([169.254.9.102]) by
	DENBGAT9ERGMSX.ww902.siemens.net ([139.22.70.137]) with mapi id
	14.03.0435.000; Tue, 14 May 2019 17:49:58 +0200
From: "Bach, Pascal" <pascal.bach@siemens.com>
To: Nikolai Merinov <n.merinov@inango-systems.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] cmake.bbclass: pass mandatory compiler flags
	through CMAKE_<LANG>_COMPILER_ARG1
Thread-Index: AQHVCme1tTDnRL7nA0WCtfovgK/ZGKZqxBdw
Date: Tue, 14 May 2019 15:49:57 +0000
Message-ID: <355BE46A91031048906B695426A8D8E62EA61B2F@DENBGAT9EL2MSX.ww902.siemens.net>
References: <20190514150416.10902-1-n.merinov@inango-systems.com>
In-Reply-To: <20190514150416.10902-1-n.merinov@inango-systems.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-document-confidentiality: NotClassified
x-originating-ip: [139.22.70.27]
MIME-Version: 1.0
Subject: Re: [PATCH] cmake.bbclass: pass mandatory compiler flags	through CMAKE_<LANG>_COMPILER_ARG1
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
X-List-Received-Date: Tue, 14 May 2019 15:50:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Nikolai,

I think this would work. However I would like to understand the problem you=
 are trying to solve with this.
Do you have an example of a recipe this would be needed?

Pascal

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> <openembedded-core-bounces@lists.openembedded.org> On Behalf Of
> Nikolai Merinov
> Sent: Dienstag, 14. Mai 2019 17:04
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] cmake.bbclass: pass mandatory compiler flags
> through CMAKE_<LANG>_COMPILER_ARG1
>=20
> The CMake takes mandatory compiler arguments from the following
> variables:
> - CMAKE_SYSROOT -- path to sysroot that should be passed to compiler.
> - CMAKE_<LANG>_COMPILER_TARGET -- target architecture, used for
> compilers
>   that supports several targets through command line options.
>   e.g. "clang --target ${CMAKE_C_COMPILER_TARGET}".
> - CMAKE_<LANG>_COMPILER_EXTERNAL_TOOLCHAIN -- path to external
> toolchain,
>   used for compilers that support build with external toolchain.
>   e.g. "clang --gcc-toolchain
> ${CMAKE_C_COMPILER_EXTERNAL_TOOLCHAIN}".
> - CMAKE_<LANG>_COMPILER_ARG1 -- other mandatory arguments to a
> compiler
>   command.
>=20
> CMAKE_<LANG>_COMPILER_ARG1 is the most suitable variable to pass
> mandatory arguments, that belongs to CC variable with other build systems=
,
> to a compiler.
>=20
> Additionally usage of CMAKE_<LANG>_COMPILER_ARG1 instead of
> CMAKE_<LANG>_FLAGS reduce the risk that a variable can be overrided by
> CMakeLists.txt files.
> ---
>  meta/classes/cmake.bbclass | 21 +++++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)
>=20
> diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass inde=
x
> d3f0d70847..4da4c00a09 100644
> --- a/meta/classes/cmake.bbclass
> +++ b/meta/classes/cmake.bbclass
> @@ -27,27 +27,33 @@ python() {
>          cc_list =3D d.getVar('CC').split()
>          if cc_list[0] =3D=3D 'ccache':
>              d.setVar('OECMAKE_C_COMPILER', '%s %s' % (cc_list[0], cc_lis=
t[1]))
> +            cc_arg1 =3D ' '.join(cc_list[2:])
>          else:
>              d.setVar('OECMAKE_C_COMPILER', cc_list[0])
> +            cc_arg1 =3D ' '.join(cc_list[1:])
> +        if not d.getVar('OECMAKE_C_COMPILER_ARG1'):
> +            d.setVar('OECMAKE_C_COMPILER_ARG1', cc_arg1)
>=20
>      if not d.getVar('OECMAKE_CXX_COMPILER'):
>          cxx_list =3D d.getVar('CXX').split()
>          if cxx_list[0] =3D=3D 'ccache':
>              d.setVar('OECMAKE_CXX_COMPILER', '%s %s' % (cxx_list[0],
> cxx_list[1]))
> +            cxx_arg1 =3D ' '.join(cxx_list[2:])
>          else:
>              d.setVar('OECMAKE_CXX_COMPILER', cxx_list[0])
> +            cxx_arg1 =3D ' '.join(cxx_list[1:])
> +        if not d.getVar('OECMAKE_CXX_COMPILER_ARG1'):
> +            d.setVar('OECMAKE_CXX_COMPILER_ARG1', cxx_arg1)
>  }
>  OECMAKE_AR ?=3D "${AR}"
>=20
>  # Compiler flags
> -OECMAKE_C_FLAGS ?=3D "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}
> ${CFLAGS}"
> -OECMAKE_CXX_FLAGS ?=3D "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}
> ${CXXFLAGS}"
> +OECMAKE_C_FLAGS ?=3D "${CFLAGS}"
> +OECMAKE_CXX_FLAGS ?=3D "${CXXFLAGS}"
>  OECMAKE_C_FLAGS_RELEASE ?=3D "-DNDEBUG"
>  OECMAKE_CXX_FLAGS_RELEASE ?=3D "-DNDEBUG"
> -OECMAKE_C_LINK_FLAGS ?=3D "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}
> ${CPPFLAGS} ${LDFLAGS}"
> -OECMAKE_CXX_LINK_FLAGS ?=3D "${HOST_CC_ARCH}
> ${TOOLCHAIN_OPTIONS} ${CXXFLAGS} ${LDFLAGS}"
> -CXXFLAGS +=3D "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}"
> -CFLAGS +=3D "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}"
> +OECMAKE_C_LINK_FLAGS ?=3D "${CPPFLAGS} ${LDFLAGS}"
> +OECMAKE_CXX_LINK_FLAGS ?=3D "${CXXFLAGS} ${LDFLAGS}"
>=20
>  OECMAKE_RPATH ?=3D ""
>  OECMAKE_PERLNATIVE_DIR ??=3D ""
> @@ -85,8 +91,11 @@ $cmake_crosscompiling  set( CMAKE_SYSTEM_NAME
> `echo ${TARGET_OS} | sed -e 's/^./\u&/' -e 's/^\(Linux\).*/\1/'` )  set(
> CMAKE_SYSTEM_PROCESSOR
> ${@map_target_arch_to_uname_arch(d.getVar('TARGET_ARCH'))} )  set(
> CMAKE_C_COMPILER ${OECMAKE_C_COMPILER} )
> +set( CMAKE_C_COMPILER_ARG1 "${OECMAKE_C_COMPILER_ARG1}" )
>  set( CMAKE_CXX_COMPILER ${OECMAKE_CXX_COMPILER} )
> +set( CMAKE_CXX_COMPILER_ARG1 "${OECMAKE_CXX_COMPILER_ARG1}"
> )
>  set( CMAKE_ASM_COMPILER ${OECMAKE_C_COMPILER} )
> +set( CMAKE_ASM_COMPILER_ARG1 "${OECMAKE_C_COMPILER_ARG1}" )
>  set( CMAKE_AR ${OECMAKE_AR} CACHE FILEPATH "Archiver" )  set(
> CMAKE_C_FLAGS "${OECMAKE_C_FLAGS}" CACHE STRING "CFLAGS" )  set(
> CMAKE_CXX_FLAGS "${OECMAKE_CXX_FLAGS}" CACHE STRING "CXXFLAGS"
> )
> --
> 2.17.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

