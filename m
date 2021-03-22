Received: from mga03.intel.com (mga03.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.7183.1616377301187997965
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Mar 2021 18:41:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 2SxSuiASgpjktY2grT3uX1z6F93jpaD7fhUg5pzr490ek+TLsRNYD0rG8eG55H5Q5epay4zohU
 l9le+TDKrqvw==
X-IronPort-AV: E=McAfee;i="6000,8403,9930"; a="190211631"
X-IronPort-AV: E=Sophos;i="5.81,266,1610438400"; 
   d="scan'208";a="190211631"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2021 18:41:57 -0700
IronPort-SDR: 2CB6+6TQgiOGHRuMDigzpEL7gs2QfUPk28Xrv+Xixk9jF8HnqObHsrTA/UWBxiNEWcbod2W/zt
 SOn21o06lr3A==
X-IronPort-AV: E=Sophos;i="5.81,266,1610438400"; 
   d="scan'208";a="524295210"
Received: from myusoff-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.78.4])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2021 18:41:56 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 15/25] gcc-sanitizers: Move content from gcclibdir into libdir
Date: Mon, 22 Mar 2021 09:41:17 +0800
Message-Id: <6b9e85e48ba43be74d51c7af703ba787f36e3241.1616377115.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1616377115.git.anuj.mittal@intel.com>
References: <cover.1616377115.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mike Crowe <mac@mcrowe.com>

In e9e5744ba8b0d43c8b874d365f83071ce20bf0a1, Khem Raj wrote:
> OE does not use the traditional /usr/lib/gcc prefix to store
> gcc-runtime it basically is moved into libdir, however some newer
> files were installed by newer versions of gcc especially libgomp (
> omp.h openacc.h ) into gcclibdir, so we have content in both
> directories, this confuses other tools which are trying to guess the
> gcc installation and its runtime location, since now we have two
> directories, the tools either choose one or other and we get
> inconsistent behavior, e.g. clang for aarch64 uses /usr/lib but same
> clang for riscv64 chose /usr/lib/gcc

> This change ensures that OE ends up with single valid location for gcc
> runtime files

I think that the same thing needs to happen in gcc-sanitizers.inc,
otherwise I get errors like:

| .../recipe-sysroot/usr/include/gpg-error-64.h:884:11: fatal error: sanitizer/lsan_interface.h: No such file or directory

when attempting to compile with sanitizers enabled.

FILES_${PN} needs updating to match too.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
Cc: Khem Raj <raj.khem@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 862b4fac3ee7d951758c8c93462331ad52bf0190)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/gcc/gcc-sanitizers.inc | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
index 668e14a59f..9e643ee277 100644
--- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
+++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
@@ -35,6 +35,11 @@ do_compile () {
 do_install () {
     cd ${B}/${TARGET_SYS}/libsanitizer/
     oe_runmake 'DESTDIR=${D}' MULTIBUILDTOP=${B}/${TARGET_SYS}/libsanitizer/ install
+    if [ -d ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include ]; then
+	install -d ${D}${libdir}/${TARGET_SYS}/${BINV}/include
+	mv ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include/* ${D}${libdir}/${TARGET_SYS}/${BINV}/include
+	rmdir --ignore-fail-on-non-empty -p ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include
+    fi
     if [ -d ${D}${infodir} ]; then
         rmdir --ignore-fail-on-non-empty -p ${D}${infodir}
     fi
@@ -109,4 +114,4 @@ FILES_libtsan-dev += "\
 "
 FILES_libtsan-staticdev += "${libdir}/libtsan.a"
 
-FILES_${PN} = "${libdir}/*.spec ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/sanitizer/*.h"
+FILES_${PN} = "${libdir}/*.spec ${libdir}/${TARGET_SYS}/${BINV}/include/sanitizer/*.h"
-- 
2.30.2

