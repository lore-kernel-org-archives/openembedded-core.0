Return-Path: <stefan@herbrechtsmeier.net>
Received: from dd5638.kasserver.com (dd5638.kasserver.com [85.13.130.155])
	by mail.openembedded.org (Postfix) with ESMTP id 1859765CBD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jul 2015 10:56:30 +0000 (UTC)
Received: from [129.70.144.65] (astra.TechFak.Uni-Bielefeld.DE [129.70.144.65])
	by dd5638.kasserver.com (Postfix) with ESMTPSA id CFFDE5600028;
	Fri, 17 Jul 2015 12:56:28 +0200 (CEST)
To: Pascal Bach <pascal.bach@siemens.com>,
	openembedded-core@lists.openembedded.org
References: <1437119073-4788-1-git-send-email-pascal.bach@siemens.com>
From: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
Message-ID: <55A8DF58.4010906@herbrechtsmeier.net>
Date: Fri, 17 Jul 2015 12:56:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <1437119073-4788-1-git-send-email-pascal.bach@siemens.com>
Subject: Re: [PATCH] cmake.bbclass: set archiver, linker and ranlib in toolchain.cmake
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
X-List-Received-Date: Fri, 17 Jul 2015 10:56:31 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Am 17.07.2015 um 09:44 schrieb Pascal Bach:
> Setting CMAKE_AR, CMAKE_LINKER and CMAKE_RANLIB correctly in
> toolchain.cmake is necessary to correctly build -native packages
> using CMake.
>
> The reason is that CMake is not able to find the above utilities by
> itself because CMAKE_FIND_ROOT_PATH_MODE_PROGRAM is set to ONLY
> so we need to tell it explicitly where to look.
Which version do you use? The master sets 
CMAKE_FIND_ROOT_PATH_MODE_PROGRAM to BOTH for native packages.

If this don't work you could set the CMAKE_C_COMPILER_EXTERNAL_TOOLCHAIN 
path (without /bin).

> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> ---
>   meta/classes/cmake.bbclass | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
> index 995ddf1..cae0ad2 100644
> --- a/meta/classes/cmake.bbclass
> +++ b/meta/classes/cmake.bbclass
> @@ -13,6 +13,9 @@ inherit autotools
>   # C/C++ Compiler (without cpu arch/tune arguments)
>   OECMAKE_C_COMPILER ?= "`echo ${CC} | sed 's/^\([^ ]*\).*/\1/'`"
>   OECMAKE_CXX_COMPILER ?= "`echo ${CXX} | sed 's/^\([^ ]*\).*/\1/'`"
> +OECMAKE_AR ?= "`echo ${AR} | sed 's/^\([^ ]*\).*/\1/'`"
This is already set in master.

> +OECMAKE_LINKER ?= "`echo ${LD} | sed 's/^\([^ ]*\).*/\1/'`"
> +OECMAKE_RANLIB ?= "`echo ${RANLIB} | sed 's/^\([^ ]*\).*/\1/'`"
You don't need the sed for ranlib.

>   # Compiler flags
>   OECMAKE_C_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CFLAGS}"
> @@ -35,6 +38,11 @@ set( CMAKE_SYSTEM_PROCESSOR ${TARGET_ARCH} )
>   set( CMAKE_C_COMPILER ${OECMAKE_C_COMPILER} )
>   set( CMAKE_CXX_COMPILER ${OECMAKE_CXX_COMPILER} )
>   set( CMAKE_ASM_COMPILER ${OECMAKE_C_COMPILER} )
> +# Force the use of cache here otherwise the values will be overridden (http://www.cmake.org/Bug/view.php?id=13038)
> +set( CMAKE_AR ar CACHE FILEPATH "Archiver" FORCE )
> +set( CMAKE_LINKER ld CACHE FILEPATH "Linker" FORCE )
> +set( CMAKE_RANLIB ranlib CACHE FILEPATH "Ranlib" FORCE )
> +
Why you generate OECMAKE_* and don't use them?

Furthermore the CMAKE_* should contain the full path and are generated 
in the CMakeFindBinUtils.cmake.

>   set( CMAKE_C_FLAGS "${OECMAKE_C_FLAGS}" CACHE STRING "CFLAGS" )
>   set( CMAKE_CXX_FLAGS "${OECMAKE_CXX_FLAGS}" CACHE STRING "CXXFLAGS" )
>   set( CMAKE_ASM_FLAGS "${OECMAKE_C_FLAGS}" CACHE STRING "ASM FLAGS" )


