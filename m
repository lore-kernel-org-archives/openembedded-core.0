Return-Path: <n.merinov@inango-systems.com>
Received: from mail.inango-sw.com (mail.inango-systems.com [213.136.71.184])
	by mail.openembedded.org (Postfix) with ESMTP id 2B7C471B99
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2019 09:19:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.inango-sw.com (Postfix) with ESMTP id E4EF77A23B2;
	Wed, 15 May 2019 12:19:42 +0300 (IDT)
Received: from mail.inango-sw.com ([127.0.0.1])
	by localhost (mail.inango-sw.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id Ek1BryMtUsVV; Wed, 15 May 2019 12:19:39 +0300 (IDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.inango-sw.com (Postfix) with ESMTP id B8AEE7A23B5;
	Wed, 15 May 2019 12:19:39 +0300 (IDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.inango-sw.com B8AEE7A23B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inango-systems.com;
	s=45A440E0-D841-11E8-B985-5FCC721607E0; t=1557911979;
	bh=pYworIidAzR0naIiT2/Ii0wF4p4wvKhbQnLnlQMefbQ=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=mpWfol+762lpawcynwh2ZqApjs5CFAGE1pKX3lBjxtgDiqLlU2jGiGbU5/AZw9Ewo
	f76R972PukQ+p2cjvI3m2qg4Q8qUd8SW70p0fE4WgG55fKm4C00FVWYAZwLz9FHdwu
	0WEt/5z8y5V/2zQFTAQcrj1cN+BJqJRTfFZhms3H3ZsejAMINKKMu0QnQd426uVD30
	7NG0LorUzRly+ikTxrTPRTqJIEJoopA1fBDOmOT24gr2zgT3VaS4hb+FibORFpK9GM
	yMzj4ca3GBV3awvf5qFuPjJxn1JTF1ScWiF9UHLQ7imaKaeozDcvgnLN1qisg9tVFS
	iYIA3GmTM2fdw==
X-Virus-Scanned: amavisd-new at inango-sw.com
Received: from mail.inango-sw.com ([127.0.0.1])
	by localhost (mail.inango-sw.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 2aFXapKMGcpR; Wed, 15 May 2019 12:19:39 +0300 (IDT)
Received: from mail.inango-sw.com (mail.inango-sw.com [172.17.220.3])
	by mail.inango-sw.com (Postfix) with ESMTP id 796C97A23B2;
	Wed, 15 May 2019 12:19:39 +0300 (IDT)
Date: Wed, 15 May 2019 12:19:39 +0300 (IDT)
From: Nikolai Merinov <n.merinov@inango-systems.com>
To: "Bach, Pascal" <pascal.bach@siemens.com>
Message-ID: <151165355.247295.1557911979234.JavaMail.zimbra@inango-systems.com>
In-Reply-To: <355BE46A91031048906B695426A8D8E62EA61B2F@DENBGAT9EL2MSX.ww902.siemens.net>
References: <20190514150416.10902-1-n.merinov@inango-systems.com>
	<355BE46A91031048906B695426A8D8E62EA61B2F@DENBGAT9EL2MSX.ww902.siemens.net>
MIME-Version: 1.0
X-Originating-IP: [172.17.220.3]
X-Mailer: Zimbra 8.8.9_GA_3006 (ZimbraWebClient - GC73 (Linux)/8.8.9_GA_3006)
Thread-Topic: cmake.bbclass: pass mandatory compiler flags through
	CMAKE_<LANG>_COMPILER_ARG1
Thread-Index: AQHVCme1tTDnRL7nA0WCtfovgK/ZGKZqxBdw8MH9B1g=
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Wed, 15 May 2019 09:19:43 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi Pascal,

I very often saw in proprietary projects the following code

> set(CMAKE_C_FLAGS "list of flags that developer want to add")

where package developer overwrite default CMAKE_C_FLAGS or CMAKE_CXX_FLAGS variables.

There are several examples from github: 
https://github.com/psi4/psi4archive/blob/1.0.x/cmake/compilers/CFlags.cmake
https://github.com/eloraiby/dna-cross-platform/blob/master/src/DNA/native/CMakeLists.txt
https://github.com/JWZepf/bfsdk/blob/master/cmake/CMakeFlags_Native_GCC.txt
https://github.com/redcurrant/metacd-http/blob/master/CMakeLists.txt
https://github.com/HabanaAI/hl-thunk/blob/master/CMakeLists.txt
https://github.com/chrisz/librain/blob/master/CMakeLists.txt
https://github.com/chrishoen/Dev_RisLibLx/blob/master/CMakeLists.txt
https://github.com/Farigh/yasc/blob/master/config/GccCompileOptions.cmake

I suggest my changes in order to reduce risk of failure with such CMake projects.

In same time suggested changes will logically tie this flags to the compiler in same manner as it tied in the CC and CXX variables.

Regards,
Nikolai

----- Original Message -----
From: "Bach, Pascal" <pascal.bach@siemens.com>
To: "n merinov" <n.merinov@inango-systems.com>, openembedded-core@lists.openembedded.org
Sent: Tuesday, May 14, 2019 8:49:57 PM
Subject: RE: [OE-core] [PATCH] cmake.bbclass: pass mandatory compiler flags	through CMAKE_<LANG>_COMPILER_ARG1

Hi Nikolai,

I think this would work. However I would like to understand the problem you are trying to solve with this.
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
> 
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
> 
> CMAKE_<LANG>_COMPILER_ARG1 is the most suitable variable to pass
> mandatory arguments, that belongs to CC variable with other build systems,
> to a compiler.
> 
> Additionally usage of CMAKE_<LANG>_COMPILER_ARG1 instead of
> CMAKE_<LANG>_FLAGS reduce the risk that a variable can be overrided by
> CMakeLists.txt files.
> ---
>  meta/classes/cmake.bbclass | 21 +++++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass index
> d3f0d70847..4da4c00a09 100644
> --- a/meta/classes/cmake.bbclass
> +++ b/meta/classes/cmake.bbclass
> @@ -27,27 +27,33 @@ python() {
>          cc_list = d.getVar('CC').split()
>          if cc_list[0] == 'ccache':
>              d.setVar('OECMAKE_C_COMPILER', '%s %s' % (cc_list[0], cc_list[1]))
> +            cc_arg1 = ' '.join(cc_list[2:])
>          else:
>              d.setVar('OECMAKE_C_COMPILER', cc_list[0])
> +            cc_arg1 = ' '.join(cc_list[1:])
> +        if not d.getVar('OECMAKE_C_COMPILER_ARG1'):
> +            d.setVar('OECMAKE_C_COMPILER_ARG1', cc_arg1)
> 
>      if not d.getVar('OECMAKE_CXX_COMPILER'):
>          cxx_list = d.getVar('CXX').split()
>          if cxx_list[0] == 'ccache':
>              d.setVar('OECMAKE_CXX_COMPILER', '%s %s' % (cxx_list[0],
> cxx_list[1]))
> +            cxx_arg1 = ' '.join(cxx_list[2:])
>          else:
>              d.setVar('OECMAKE_CXX_COMPILER', cxx_list[0])
> +            cxx_arg1 = ' '.join(cxx_list[1:])
> +        if not d.getVar('OECMAKE_CXX_COMPILER_ARG1'):
> +            d.setVar('OECMAKE_CXX_COMPILER_ARG1', cxx_arg1)
>  }
>  OECMAKE_AR ?= "${AR}"
> 
>  # Compiler flags
> -OECMAKE_C_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}
> ${CFLAGS}"
> -OECMAKE_CXX_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}
> ${CXXFLAGS}"
> +OECMAKE_C_FLAGS ?= "${CFLAGS}"
> +OECMAKE_CXX_FLAGS ?= "${CXXFLAGS}"
>  OECMAKE_C_FLAGS_RELEASE ?= "-DNDEBUG"
>  OECMAKE_CXX_FLAGS_RELEASE ?= "-DNDEBUG"
> -OECMAKE_C_LINK_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}
> ${CPPFLAGS} ${LDFLAGS}"
> -OECMAKE_CXX_LINK_FLAGS ?= "${HOST_CC_ARCH}
> ${TOOLCHAIN_OPTIONS} ${CXXFLAGS} ${LDFLAGS}"
> -CXXFLAGS += "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}"
> -CFLAGS += "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}"
> +OECMAKE_C_LINK_FLAGS ?= "${CPPFLAGS} ${LDFLAGS}"
> +OECMAKE_CXX_LINK_FLAGS ?= "${CXXFLAGS} ${LDFLAGS}"
> 
>  OECMAKE_RPATH ?= ""
>  OECMAKE_PERLNATIVE_DIR ??= ""
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
> 
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

