Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QJt89-0001jj-RM
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 22:02:06 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 10 May 2011 12:59:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,347,1301900400"; d="scan'208";a="433825030"
Received: from unknown (HELO [10.255.12.75]) ([10.255.12.75])
	by azsmga001.ch.intel.com with ESMTP; 10 May 2011 12:59:16 -0700
Message-ID: <4DC99913.1060403@linux.intel.com>
Date: Tue, 10 May 2011 12:59:15 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.10) Gecko/20100621 Fedora/3.0.5-1.fc13 Lightning/1.0b2pre
	Thunderbird/3.0.5
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1305039119-1469-1-git-send-email-otavio@ossystems.com.br>
In-Reply-To: <1305039119-1469-1-git-send-email-otavio@ossystems.com.br>
Subject: Re: [PATCH 1/3] cmake.bbclass: fix qmake and rpath issues
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 May 2011 20:02:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/10/2011 07:51 AM, Otavio Salvador wrote:
> Sync with OE at 3b7d83362027fde4f6850533ab83277d95dda961 however
> without changing the way of generating the toolchain file and making
> it branding agnostic.
>
> Signed-off-by: Otavio Salvador<otavio@ossystems.com.br>
> ---
>   meta/classes/cmake.bbclass  |   14 ++++++++++++--
>   meta/classes/native.bbclass |    4 ++++
>   2 files changed, 16 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
> index a4b0c12..011c232 100644
> --- a/meta/classes/cmake.bbclass
> +++ b/meta/classes/cmake.bbclass
> @@ -24,15 +24,18 @@ OECMAKE_CXX_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${TARGET_CPPFLAGS} -f
>   OECMAKE_C_FLAGS_RELEASE ?= "${SELECTED_OPTIMIZATION} -DNDEBUG"
>   OECMAKE_CXX_FLAGS_RELEASE ?= "${SELECTED_OPTIMIZATION} -DNDEBUG"
>
> +OECMAKE_RPATH ?= ""
> +
>   cmake_do_generate_toolchain_file() {
>   	cat>  ${WORKDIR}/toolchain.cmake<<EOF
>   # CMake system name must be something like "Linux".
>   # This is important for cross-compiling.
>   set( CMAKE_SYSTEM_NAME `echo ${SDK_OS} | sed 's/^./\u&/'` )
> +set( CMAKE_SYSTEM_PROCESSOR ${TARGET_ARCH} )
>   set( CMAKE_C_COMPILER ${OECMAKE_C_COMPILER} )
>   set( CMAKE_CXX_COMPILER ${OECMAKE_CXX_COMPILER} )
> -set( CMAKE_C_FLAGS "${OECMAKE_C_FLAGS}" CACHE STRING "poky CFLAGS" )
> -set( CMAKE_CXX_FLAGS "${OECMAKE_CXX_FLAGS}" CACHE STRING "poky CXXFLAGS" )
> +set( CMAKE_C_FLAGS "${OECMAKE_C_FLAGS}" CACHE STRING "CFLAGS" )
> +set( CMAKE_CXX_FLAGS "${OECMAKE_CXX_FLAGS}" CACHE STRING "CXXFLAGS" )
>   set( CMAKE_C_FLAGS_RELEASE "${OECMAKE_C_FLAGS_RELEASE}" CACHE STRING "CFLAGS for release" )
>   set( CMAKE_CXX_FLAGS_RELEASE "${OECMAKE_CXX_FLAGS_RELEASE}" CACHE STRING "CXXFLAGS for release" )
>
> @@ -43,6 +46,13 @@ set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ONLY )
>   set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY )
>   set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY )
>
> +# Use qt.conf settings
> +set( ENV{QT_CONF_PATH} ${WORKDIR}/qt.conf )
> +
> +# We need to set the rpath to the correct directory as cmake does not provide any
> +# directory as rpath by default
> +set( CMAKE_INSTALL_RPATH ${OECMAKE_RPATH} )
> +
>   # Use native cmake modules
>   set( CMAKE_MODULE_PATH ${STAGING_DATADIR}/cmake/Modules/ )
>   EOF
> diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
> index d9e67f6..e06f02a 100644
> --- a/meta/classes/native.bbclass
> +++ b/meta/classes/native.bbclass
> @@ -11,6 +11,10 @@ PACKAGES_DYNAMIC = ""
>   PACKAGES_DYNAMIC_virtclass-native = ""
>   PACKAGE_ARCH = "${BUILD_ARCH}"
>
> +# used by cmake class
> +OECMAKE_RPATH = "${libdir}"
> +OECMAKE_RPATH_virtclass-native = "${libdir}"
> +
In Richard's email he proposed one or the other be set, why do you need 
to set both here?  If both need to be set then you don't need the override.

Sau!
>   BASE_PACKAGE_ARCH = "${BUILD_ARCH}"
>   BASEPKG_HOST_SYS = "${BUILD_ARCH}${BUILD_VENDOR}-${BUILD_OS}"
>   BASEPKG_TARGET_SYS = "${BUILD_ARCH}${BUILD_VENDOR}-${BUILD_OS}"


