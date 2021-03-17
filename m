Received: from smtp0.taitradio.net (smtp0.taitradio.net [202.37.96.22])
 by mx.groups.io with SMTP id smtpd.web10.1552.1616023532360078292
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Mar 2021 16:25:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: taitradio.com, ip: 202.37.96.22, mailfrom: douglas.royds@taitradio.com)
Received: from acheron.taitradio.net (unknown [172.16.182.87])
	by smtp0.taitradio.net (Postfix) with ESMTP id AB7AD2204C5;
	Thu, 18 Mar 2021 12:25:19 +1300 (NZDT)
From: "Douglas" <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Cc: Douglas Royds <douglas.royds@taitradio.com>
Subject: [PATCH] cmake: Fully-qualified path to ar
Date: Thu, 18 Mar 2021 12:25:14 +1300
Message-Id: <20210317232514.255125-1-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

We (correctly enough) pass in our AR to cmake via the toolchain file,
but unlike the other cross-compilation tools (CC, CXX, ranlib, etc),
cmake does not then do its own search in the PATH for our AR.

By using cmake's own find_program() to search the PATH,
make works as expected from the commandline, outside of bitbake.

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 meta/classes/cmake.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 70e4f3b6fd0..8876ce5aa56 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -102,7 +102,8 @@ set( CMAKE_CXX_COMPILER ${OECMAKE_CXX_COMPILER} )
 set( CMAKE_C_COMPILER_LAUNCHER ${OECMAKE_C_COMPILER_LAUNCHER} )
 set( CMAKE_CXX_COMPILER_LAUNCHER ${OECMAKE_CXX_COMPILER_LAUNCHER} )
 set( CMAKE_ASM_COMPILER ${OECMAKE_C_COMPILER} )
-set( CMAKE_AR ${OECMAKE_AR} CACHE FILEPATH "Archiver" )
+find_program( CMAKE_AR ${OECMAKE_AR} DOC "Archiver" REQUIRED )
+
 set( CMAKE_C_FLAGS "${OECMAKE_C_FLAGS}" CACHE STRING "CFLAGS" )
 set( CMAKE_CXX_FLAGS "${OECMAKE_CXX_FLAGS}" CACHE STRING "CXXFLAGS" )
 set( CMAKE_ASM_FLAGS "${OECMAKE_C_FLAGS}" CACHE STRING "ASM FLAGS" )
--=20
2.25.1

