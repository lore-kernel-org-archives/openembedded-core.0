Return-Path: <philn@igalia.com>
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id C28067E024
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 08:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID;
	bh=3alR6XKR6Mrrqiu8molCWjy0TsA4emXN5+46H9JwxUk=; 
	b=MpB6DjllyUqCjHdU8Im2wCJEsHSgofaXfA+/Wj7VOGd5PuDuFLfdbF5GgqX7+ZrKnGhFAViECpYBmodEWNRM1Ih/3+mOA8GnNB2L703Ji3d94P5Qc1ER35GO5D3siZQztHyf0OktTOgzSrmtib5EQe8ar8SfeM+Ns7g5/ltEed2QGsWOkwXYk5SJ5QVU8nancNqIzqIZfx2mHu8qS90JFxUdE5Oho1B3CxUnieo+ugZYYKUAXLpVZw0e0j2OXjdoV+JyFCN4yLzzhllDgniT9gtHiw44qZzphZzrbv0wC8j9GCilYZ0fmec1cDhhiyLEVdsCPmZ0Bz7ZStl3vCc+FA==;
Received: from 216.red-88-16-195.dynamicip.rima-tde.net ([88.16.195.216]
	helo=[192.168.1.41]) by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
	id 1hVu8i-0006QJ-7V for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 10:40:52 +0200
Message-ID: <0d70053e5742b8a3741313cfc2f299d8b69d63c0.camel@igalia.com>
From: Philippe Normand <philn@igalia.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Date: Wed, 29 May 2019 09:40:42 +0100
In-Reply-To: <CAJ86T=VEKBv21mMo9cxh-VG8OstFF5bwte_g41k2=RUNAcbnRA@mail.gmail.com>
References: <69e7b572a514abba106b28255461cf17720e68e1.camel@igalia.com>
	<CAJ86T=VEKBv21mMo9cxh-VG8OstFF5bwte_g41k2=RUNAcbnRA@mail.gmail.com>
User-Agent: Evolution 3.30.5-1 
MIME-Version: 1.0
Subject: Re: [PATCH v2] cmake: Use compiler launcher variable when ccache is enabled
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
X-List-Received-Date: Wed, 29 May 2019 08:40:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Setting the CMAKE_C{,XX}_COMPILER_LAUNCHER variables is the recomended way to
deal with ccache in CMake. It allows build scripts to optionally opt-out of
ccache, which is especially useful when the pre-processed GCC output is required.

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



