Return-Path: <philn@igalia.com>
X-Greylist: delayed 1341 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 28 May 2019 19:12:45 UTC
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id 2959F6025E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2019 19:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:Date:To:From:Subject:Message-ID;
	bh=B238QA3G/t4R1JA0rp/nu5v4zvGWiTxkySsxLUlNQ38=; 
	b=MrYLG0yUK2gwCawwQvHi+PcWt78DN3KdGUKowrgv2rR/FjeaLGJ46GJd/ZTp+1yDXUB6tHPWfpTR3zTV50YB3TYUPOVX1K6eWmuzjemnZlsZthIAQYh3vI60WbMKzvLwSS88USQu48E+DVVqeOEuAuDQN9iHCSKUEIU+f/NfWvDvi3NaVbKSPPjXS8K56cJ1r2Q2KqxFvVZogNNeNQyO4iYE2D1/2stzNn0Tc+W5pJuBMED/d4b6YcltcBIKFHZlXdBUHdp1r/AM8ILtU6ChXxGWqDPVNoM+jrEJSnrc1iKAsH7d6Z2xFD+ZHYi13EqPFdjBroeX3lQh5miyCTFVwQ==;
Received: from 216.red-88-16-195.dynamicip.rima-tde.net ([88.16.195.216]
	helo=[192.168.1.41]) by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
	id 1hVhB2-0007J2-WD for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2019 20:50:25 +0200
Message-ID: <69e7b572a514abba106b28255461cf17720e68e1.camel@igalia.com>
From: Philippe Normand <philn@igalia.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 May 2019 19:50:15 +0100
User-Agent: Evolution 3.30.5-1 
MIME-Version: 1.0
Subject: [PATCH] cmake: Use compiler launcher variable when ccache is enabled
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
X-List-Received-Date: Tue, 28 May 2019 19:12:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Setting the CMAKE_C{,XX}_COMPILER_LAUNCHER variables is the recomended way to
deal with ccache in CMake. It allows build scripts to optionally opt-out of
CMake, which is especially useful when the pre-processed GCC output is required.

Signed-off-by: Philippe Normand <philn@igalia.com>
---
 meta/classes/cmake.bbclass | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index d3f0d70847..a5cffedbc6 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -26,14 +26,16 @@ python() {
     if not d.getVar('OECMAKE_C_COMPILER'):
         cc_list = d.getVar('CC').split()
         if cc_list[0] == 'ccache':
-            d.setVar('OECMAKE_C_COMPILER', '%s %s' % (cc_list[0], cc_list[1]))
+            d.setVar('OECMAKE_C_COMPILER_LAUNCHER', cc_list[0])
+            d.setVar('OECMAKE_C_COMPILER', cc_list[1])
         else:
             d.setVar('OECMAKE_C_COMPILER', cc_list[0])
 
     if not d.getVar('OECMAKE_CXX_COMPILER'):
         cxx_list = d.getVar('CXX').split()
         if cxx_list[0] == 'ccache':
-            d.setVar('OECMAKE_CXX_COMPILER', '%s %s' % (cxx_list[0], cxx_list[1]))
+            d.setVar('OECMAKE_CXX_COMPILER_LAUNCHER', cxx_list[0])
+            d.setVar('OECMAKE_CXX_COMPILER', cxx_list[1])
         else:
             d.setVar('OECMAKE_CXX_COMPILER', cxx_list[0])
 }
@@ -49,6 +51,9 @@ OECMAKE_CXX_LINK_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${CXXFLAGS} ${LD
 CXXFLAGS += "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}"
 CFLAGS += "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS}"
 
+OECMAKE_C_COMPILER_LAUNCHER ?= ""
+OECMAKE_CXX_COMPILER_LAUNCHER ?= ""
+
 OECMAKE_RPATH ?= ""
 OECMAKE_PERLNATIVE_DIR ??= ""
 OECMAKE_EXTRA_ROOT_PATH ?= ""
@@ -86,6 +91,8 @@ set( CMAKE_SYSTEM_NAME `echo ${TARGET_OS} | sed -e 's/^./\u&/' -e 's/^\(Linux\).
 set( CMAKE_SYSTEM_PROCESSOR ${@map_target_arch_to_uname_arch(d.getVar('TARGET_ARCH'))} )
 set( CMAKE_C_COMPILER ${OECMAKE_C_COMPILER} )
 set( CMAKE_CXX_COMPILER ${OECMAKE_CXX_COMPILER} )
+set( CMAKE_C_COMPILER_LAUNCHER ${OECMAKE_C_COMPILER_LAUNCHER} )
+set( CMAKE_CXX_COMPILER_LAUNCHER ${OECMAKE_CXX_COMPILER_LAUNCHER} )
 set( CMAKE_ASM_COMPILER ${OECMAKE_C_COMPILER} )
 set( CMAKE_AR ${OECMAKE_AR} CACHE FILEPATH "Archiver" )
 set( CMAKE_C_FLAGS "${OECMAKE_C_FLAGS}" CACHE STRING "CFLAGS" )
-- 
2.20.1



