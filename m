Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QJjmv-0003An-C8 for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 12:03:33 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4AA0m9C004495;
	Tue, 10 May 2011 11:00:48 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03424-03-5; Tue, 10 May 2011 11:00:40 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4A9xY2g004338
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 10 May 2011 10:59:35 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <c0f7ebbe59b32dace3ae8a4a5dab8622b09f895b.1305004776.git.sgw@linux.intel.com>
References: <cover.1305004776.git.sgw@linux.intel.com>
	<c0f7ebbe59b32dace3ae8a4a5dab8622b09f895b.1305004776.git.sgw@linux.intel.com>
Date: Tue, 10 May 2011 09:50:25 +0100
Message-ID: <1305017425.30391.252.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 25/30] cmake.bbclass: fix qmake and rpath issues
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
X-List-Received-Date: Tue, 10 May 2011 10:03:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-05-09 at 22:26 -0700, Saul Wold wrote:
> From: Otavio Salvador <otavio@ossystems.com.br>
> 
> Sync with OE at 3b7d83362027fde4f6850533ab83277d95dda961 however
> without changing the way of generating the toolchain file and making
> it branding agnostic.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta/classes/cmake.bbclass |   19 +++++++++++++++++--
>  1 files changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
> index a4b0c12..ac7bd62 100644
> --- a/meta/classes/cmake.bbclass
> +++ b/meta/classes/cmake.bbclass
> @@ -24,15 +24,23 @@ OECMAKE_CXX_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${TARGET_CPPFLAGS} -f
>  OECMAKE_C_FLAGS_RELEASE ?= "${SELECTED_OPTIMIZATION} -DNDEBUG"
>  OECMAKE_CXX_FLAGS_RELEASE ?= "${SELECTED_OPTIMIZATION} -DNDEBUG"
>  
> +OECMAKE_RPATH ?= ""
> +python __anonymous() {
> +    # Only set OECMAKE_RPATH if we build a native recipe
> +    if bb.data.inherits_class('native', d) and not bb.data.inherits_class('cross', d):
> +        bb.data.setVar('OECMAKE_RPATH', '${libdir}', d)
> +}

Firstly, I don't understand why the "not bb.data.inherits_class('cross',
d)" part of the condition is there as I can't think of a case we inherit
native and cross.

Secondly, can you not just set OECMAKE_RPATH = "${libdir}" in
native.bbclass? I dislike having anonymous python doing simple things we
could do more simply although I can understand the desire to do this in
the same file. Perhaps we should use:

OECMAKE_RPATH = ""
OECMAKE_RPATH_virtclass-native = "${libdir}"

which assumes anything would use BBCLASSEXTEND but we're encouraging
that strongly anyway.

We could unconditionally make native.bbclass set the override too...

Cheers,

Richard


>  cmake_do_generate_toolchain_file() {
>  	cat > ${WORKDIR}/toolchain.cmake <<EOF
>  # CMake system name must be something like "Linux".
>  # This is important for cross-compiling.
>  set( CMAKE_SYSTEM_NAME `echo ${SDK_OS} | sed 's/^./\u&/'` )
> +set( CMAKE_SYSTEM_PROCESSOR ${TARGET_ARCH} )
>  set( CMAKE_C_COMPILER ${OECMAKE_C_COMPILER} )
>  set( CMAKE_CXX_COMPILER ${OECMAKE_CXX_COMPILER} )
> -set( CMAKE_C_FLAGS "${OECMAKE_C_FLAGS}" CACHE STRING "poky CFLAGS" )
> -set( CMAKE_CXX_FLAGS "${OECMAKE_CXX_FLAGS}" CACHE STRING "poky CXXFLAGS" )
> +set( CMAKE_C_FLAGS "${OECMAKE_C_FLAGS}" CACHE STRING "CFLAGS" )
> +set( CMAKE_CXX_FLAGS "${OECMAKE_CXX_FLAGS}" CACHE STRING "CXXFLAGS" )
>  set( CMAKE_C_FLAGS_RELEASE "${OECMAKE_C_FLAGS_RELEASE}" CACHE STRING "CFLAGS for release" )
>  set( CMAKE_CXX_FLAGS_RELEASE "${OECMAKE_CXX_FLAGS_RELEASE}" CACHE STRING "CXXFLAGS for release" )
>  
> @@ -43,6 +51,13 @@ set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ONLY )
>  set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY )
>  set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY )
>  
> +# Use qt.conf settings
> +set( ENV{QT_CONF_PATH} ${WORKDIR}/qt.conf )
> +
> +# We need to set the rpath to the correct directory as cmake does not provide any
> +# directory as rpath by default
> +set( CMAKE_INSTALL_RPATH ${OECMAKE_RPATH} )
> +
>  # Use native cmake modules
>  set( CMAKE_MODULE_PATH ${STAGING_DATADIR}/cmake/Modules/ )
>  EOF




