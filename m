Return-Path: <cordlandwehr@kde.org>
X-Greylist: delayed 418 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 09 Jan 2017 19:29:36 UTC
Received: from postbox.kde.org (postbox.kde.org [46.4.96.248])
	by mail.openembedded.org (Postfix) with ESMTP id B3A6571AC5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 19:29:36 +0000 (UTC)
Received: from weatherwax.Speedport_W723_V_Typ_A_1_01_017
	(p20030077AF6D90015E514FFFFE589B9D.dip0.t-ipconnect.de
	[IPv6:2003:77:af6d:9001:5e51:4fff:fe58:9b9d])
	(Authenticated sender: cordlandwehr)
	by postbox.kde.org (Postfix) with ESMTPSA id 13563BF7E2;
	Mon,  9 Jan 2017 19:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=kde.org; s=default;
	t=1483989758; bh=WrIMi8XpYJ+buTtyrwHA3cE2UEGrv3WYSlpkzznqum0=;
	h=From:To:Cc:Subject:Date:From;
	b=jS3tIQVIb3hcanf+supSIkh8MoEtql9ctIu/F9MK741EeT/SaTgjbb5VN2IpOmlv1
	Q/xSaHTjs4qRO4/nqyLCHPLUgjih/hT/5xOBHLiBwXRO5TPcS2USpIPuQJq3bedWWD
	s74w+0NZPNqlSmuCaooBf63PvHPuvR04pBnlAyQs=
From: Andreas Cord-Landwehr <cordlandwehr@kde.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jan 2017 20:22:24 +0100
Message-Id: <20170109192224.32471-1-cordlandwehr@kde.org>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] Provide additional OECORE_EXTRA_SYSROOT variable
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
X-List-Received-Date: Mon, 09 Jan 2017 19:29:38 -0000

When compiling against a Yocto generated SDK and using an install folder
outside of the SDK's folder, CMake must be configure by using the
respective CMAKE_FIND_ROOT_PATH. This CMake cache variable is set
in the toolchain file and hence can only be configured via environment
variables; unless one wants to modify a project's CMake files.

This patch adds an additional environment variable OECORE_EXTRA_SYSROOT
to specify such an additional sysroot location that can optionally
be used when building against a Yocto SDK using this toolchain file.

Signed-off-by: Andreas Cord-Landwehr <cordlandwehr@kde.org>
---
 meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake b/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
index 6518408c70..1927e0bdb4 100644
--- a/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
+++ b/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
@@ -4,7 +4,10 @@ set( CMAKE_CXX_FLAGS $ENV{CXXFLAGS}  CACHE STRING "" FORCE )
 set( CMAKE ASM_FLAGS ${CMAKE_C_FLAGS} CACHE STRING "" FORCE )
 set( CMAKE_LDFLAGS_FLAGS ${CMAKE_CXX_FLAGS} CACHE STRING "" FORCE )
 
-set( CMAKE_FIND_ROOT_PATH $ENV{OECORE_TARGET_SYSROOT} $ENV{OECORE_NATIVE_SYSROOT} )
+# Re-root CMake search tree to sysroot locations given by environment variables OECORE_TARGET_SYSROOT and
+# OECORE_NATIVE_SYSROOT. For additional locations, e.g. a cross-building install directory, use
+# the OECORE_EXTRA_SYSROOT variable.
+set( CMAKE_FIND_ROOT_PATH $ENV{OECORE_TARGET_SYSROOT} $ENV{OECORE_NATIVE_SYSROOT} $ENV{OECORE_EXTRA_SYSROOT} )
 set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER )
 set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY )
 set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY )
-- 
2.11.0


