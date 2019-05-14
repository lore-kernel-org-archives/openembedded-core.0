Return-Path: <n.merinov@inango-systems.com>
X-Greylist: delayed 505 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 14 May 2019 15:12:50 UTC
Received: from mail.inango-sw.com (mail.inango-systems.com [213.136.71.184])
	by mail.openembedded.org (Postfix) with ESMTP id 7DE557DEEC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 15:12:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.inango-sw.com (Postfix) with ESMTP id 720AA7A254A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 18:04:26 +0300 (IDT)
Received: from mail.inango-sw.com ([127.0.0.1])
	by localhost (mail.inango-sw.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id EV0MiGvr-Dy0; Tue, 14 May 2019 18:04:25 +0300 (IDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.inango-sw.com (Postfix) with ESMTP id B02A97A2542;
	Tue, 14 May 2019 18:04:25 +0300 (IDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.inango-sw.com B02A97A2542
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inango-systems.com;
	s=45A440E0-D841-11E8-B985-5FCC721607E0; t=1557846265;
	bh=PKkCgQodDjGlebB72jq3Az4gUWnkj1p3IL0+EVF1mrU=;
	h=From:To:Date:Message-Id;
	b=OkXbkp884DPgGAM9ktwM4eSpECYZXXsbfP1/wOivSocNcFOYAe/Tmt3f9Om/RoAb4
	DHYPqkRcSlZp1aO0aj4uTXC364GDSFiiuxFKTXgQks2Syk9QuTdCrn9wncZ0U5meqn
	SzF8XaPDfp9aNXRSPdEKTrs5lZ+6Ku7R6jDMsmzavTyk3InxVyJHl9vOcu2Wp8pf7e
	AbrLTQE6//w1X0/CGJ0h5A5x+U0qk0Wx/RYpRkhfkw1Amxs5RFSGuu+mVQj7vOZPDk
	UofehFdGzUHrk/CsxX/EpbBJwi17z1BocyQQbW41HOFazmo/3awQUYeHTAktwGYbmQ
	O6/se1g18GMlw==
X-Virus-Scanned: amavisd-new at inango-sw.com
Received: from mail.inango-sw.com ([127.0.0.1])
	by localhost (mail.inango-sw.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id S3tj_SbXJS67; Tue, 14 May 2019 18:04:25 +0300 (IDT)
Received: from nmerinov.inango-sw (unknown [194.60.247.123])
	by mail.inango-sw.com (Postfix) with ESMTPSA id 428527A2540;
	Tue, 14 May 2019 18:04:25 +0300 (IDT)
From: Nikolai Merinov <n.merinov@inango-systems.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 May 2019 20:04:16 +0500
Message-Id: <20190514150416.10902-1-n.merinov@inango-systems.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] cmake.bbclass: pass mandatory compiler flags through CMAKE_<LANG>_COMPILER_ARG1
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
X-List-Received-Date: Tue, 14 May 2019 15:12:50 -0000

The CMake takes mandatory compiler arguments from the following variables:
- CMAKE_SYSROOT -- path to sysroot that should be passed to compiler.
- CMAKE_<LANG>_COMPILER_TARGET -- target architecture, used for compilers
  that supports several targets through command line options.
  e.g. "clang --target ${CMAKE_C_COMPILER_TARGET}".
- CMAKE_<LANG>_COMPILER_EXTERNAL_TOOLCHAIN -- path to external toolchain,
  used for compilers that support build with external toolchain.
  e.g. "clang --gcc-toolchain ${CMAKE_C_COMPILER_EXTERNAL_TOOLCHAIN}".
- CMAKE_<LANG>_COMPILER_ARG1 -- other mandatory arguments to a compiler
  command.

CMAKE_<LANG>_COMPILER_ARG1 is the most suitable variable to pass mandatory
arguments, that belongs to CC variable with other build systems, to a
compiler.

Additionally usage of CMAKE_<LANG>_COMPILER_ARG1 instead of
CMAKE_<LANG>_FLAGS reduce the risk that a variable can be overrided by
CMakeLists.txt files.
---
 meta/classes/cmake.bbclass | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index d3f0d70847..4da4c00a09 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -27,27 +27,33 @@ python() {
         cc_list = d.getVar('CC').split()
         if cc_list[0] == 'ccache':
             d.setVar('OECMAKE_C_COMPILER', '%s %s' % (cc_list[0], cc_list[1]))
+            cc_arg1 = ' '.join(cc_list[2:])
         else:
             d.setVar('OECMAKE_C_COMPILER', cc_list[0])
+            cc_arg1 = ' '.join(cc_list[1:])
+        if not d.getVar('OECMAKE_C_COMPILER_ARG1'):
+            d.setVar('OECMAKE_C_COMPILER_ARG1', cc_arg1)
 
     if not d.getVar('OECMAKE_CXX_COMPILER'):
         cxx_list = d.getVar('CXX').split()
         if cxx_list[0] == 'ccache':
             d.setVar('OECMAKE_CXX_COMPILER', '%s %s' % (cxx_list[0], cxx_list[1]))
+            cxx_arg1 = ' '.join(cxx_list[2:])
         else:
             d.setVar('OECMAKE_CXX_COMPILER', cxx_list[0])
+            cxx_arg1 = ' '.join(cxx_list[1:])
+        if not d.getVar('OECMAKE_CXX_COMPILER_ARG1'):
+            d.setVar('OECMAKE_CXX_COMPILER_ARG1', cxx_arg1)
 }
 OECMAKE_AR ?= "${AR}"
 
 # Compiler flags
-OECMAKE_C_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CFLAGS}"
-OECMAKE_CXX_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CXXFLAGS}"
+OECMAKE_C_FLAGS ?= "${CFLAGS}"
+OECMAKE_CXX_FLAGS ?= "${CXXFLAGS}"
 OECMAKE_C_FLAGS_RELEASE ?= "-DNDEBUG"
 OECMAKE_CXX_FLAGS_RELEASE ?= "-DNDEBUG"
-OECMAKE_C_LINK_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CPPFLAGS} ${LDFLAGS}"
-OECMAKE_CXX_LINK_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CXXFLAGS} ${LDFLAGS}"
-CXXFLAGS += "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}"
-CFLAGS += "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}"
+OECMAKE_C_LINK_FLAGS ?= "${CPPFLAGS} ${LDFLAGS}"
+OECMAKE_CXX_LINK_FLAGS ?= "${CXXFLAGS} ${LDFLAGS}"
 
 OECMAKE_RPATH ?= ""
 OECMAKE_PERLNATIVE_DIR ??= ""
@@ -85,8 +91,11 @@ $cmake_crosscompiling
 set( CMAKE_SYSTEM_NAME `echo ${TARGET_OS} | sed -e 's/^./\u&/' -e 's/^\(Linux\).*/\1/'` )
 set( CMAKE_SYSTEM_PROCESSOR ${@map_target_arch_to_uname_arch(d.getVar('TARGET_ARCH'))} )
 set( CMAKE_C_COMPILER ${OECMAKE_C_COMPILER} )
+set( CMAKE_C_COMPILER_ARG1 "${OECMAKE_C_COMPILER_ARG1}" )
 set( CMAKE_CXX_COMPILER ${OECMAKE_CXX_COMPILER} )
+set( CMAKE_CXX_COMPILER_ARG1 "${OECMAKE_CXX_COMPILER_ARG1}" )
 set( CMAKE_ASM_COMPILER ${OECMAKE_C_COMPILER} )
+set( CMAKE_ASM_COMPILER_ARG1 "${OECMAKE_C_COMPILER_ARG1}" )
 set( CMAKE_AR ${OECMAKE_AR} CACHE FILEPATH "Archiver" )
 set( CMAKE_C_FLAGS "${OECMAKE_C_FLAGS}" CACHE STRING "CFLAGS" )
 set( CMAKE_CXX_FLAGS "${OECMAKE_CXX_FLAGS}" CACHE STRING "CXXFLAGS" )
-- 
2.17.1


