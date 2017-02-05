Return-Path: <cordlandwehr@kde.org>
Received: from postbox.kde.org (postbox.kde.org [46.4.96.248])
	by mail.openembedded.org (Postfix) with ESMTP id 174276025F
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 Feb 2017 09:10:27 +0000 (UTC)
Received: from weatherwax.localnet (wifi.eduroam.nat.068.ulb.ac.be
	[164.15.240.68]) (Authenticated sender: cordlandwehr)
	by postbox.kde.org (Postfix) with ESMTPSA id C26EFBF37A
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 Feb 2017 09:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=kde.org; s=default;
	t=1486285827; bh=XsSSRBEtAMs3nhJm0RWD4wRgZIKY3hPgTYChvi4CLwM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=VHUcUsb/zaoxXaZoYjeTSWrALb12MA3RSusNX0FvmDrgtw1dq+0d+gYCBjXGM8mzs
	XA02AYnhJ/hoGZaxWPEkpd5oN3zm3pyNrT98nqt8m8wVsD6AcjLY1eDYSvT70eY52W
	ndlcYQ15R1TDfspBY8I41A7709R7sF6nPdDSz7vs=
From: Andreas Cord-Landwehr <cordlandwehr@kde.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 05 Feb 2017 10:10:19 +0100
Message-ID: <1598532.hThCaMBJf2@weatherwax>
User-Agent: KMail/5.3.3 (Linux/4.8.0-2-amd64; KDE/5.30.0; x86_64; git-925145c;
	2016-10-28)
In-Reply-To: <20170109192224.32471-1-cordlandwehr@kde.org>
References: <20170109192224.32471-1-cordlandwehr@kde.org>
MIME-Version: 1.0
Subject: Re: [PATCH] Provide additional OECORE_EXTRA_SYSROOT variable
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
X-List-Received-Date: Sun, 05 Feb 2017 09:10:28 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Good morning,

just want to bump this patch. Does anyone have a comment or questions?

Cheers,
Andreas

On Monday, January 9, 2017 8:22:24 PM CET Andreas Cord-Landwehr wrote:
> When compiling against a Yocto generated SDK and using an install folder
> outside of the SDK's folder, CMake must be configure by using the
> respective CMAKE_FIND_ROOT_PATH. This CMake cache variable is set
> in the toolchain file and hence can only be configured via environment
> variables; unless one wants to modify a project's CMake files.
> 
> This patch adds an additional environment variable OECORE_EXTRA_SYSROOT
> to specify such an additional sysroot location that can optionally
> be used when building against a Yocto SDK using this toolchain file.
> 
> Signed-off-by: Andreas Cord-Landwehr <cordlandwehr@kde.org>
> ---
>  meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
> b/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake index
> 6518408c70..1927e0bdb4 100644
> --- a/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
> +++ b/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
> @@ -4,7 +4,10 @@ set( CMAKE_CXX_FLAGS $ENV{CXXFLAGS}  CACHE STRING "" FORCE
> ) set( CMAKE ASM_FLAGS ${CMAKE_C_FLAGS} CACHE STRING "" FORCE )
>  set( CMAKE_LDFLAGS_FLAGS ${CMAKE_CXX_FLAGS} CACHE STRING "" FORCE )
> 
> -set( CMAKE_FIND_ROOT_PATH $ENV{OECORE_TARGET_SYSROOT}
> $ENV{OECORE_NATIVE_SYSROOT} ) +# Re-root CMake search tree to sysroot
> locations given by environment variables OECORE_TARGET_SYSROOT and +#
> OECORE_NATIVE_SYSROOT. For additional locations, e.g. a cross-building
> install directory, use +# the OECORE_EXTRA_SYSROOT variable.
> +set( CMAKE_FIND_ROOT_PATH $ENV{OECORE_TARGET_SYSROOT}
> $ENV{OECORE_NATIVE_SYSROOT} $ENV{OECORE_EXTRA_SYSROOT} ) set(
> CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER )
>  set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY )
>  set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY )



