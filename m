Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6C9CD60E07
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jun 2014 00:28:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5P0SCia020347
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jun 2014 17:28:12 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Tue, 24 Jun 2014 17:28:11 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 24 Jun 2014 19:28:06 -0500
Message-ID: <68a4601291e067276353fb08065392931c938b70.1403655933.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1403655933.git.mark.hatle@windriver.com>
References: <cover.1403655933.git.mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] gcc-cross-canadian: Add configure-target-libgcc
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
X-List-Received-Date: Wed, 25 Jun 2014 00:28:13 -0000
Content-Type: text/plain

While we're not going to package the libgcc component as part of the SDK,
we do need to generate it to get the unwind, and quadmath headers.  Without
this change it is not possible to build eglibc or other components that
require these headers with the SDK toolchain.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index 307f73c..63adae8 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -58,7 +58,7 @@ do_configure () {
 }
 
 do_compile () {
-	oe_runmake all-host
+	oe_runmake all-host configure-target-libgcc
 }
 
 INHIBIT_PACKAGE_STRIP = "1"
@@ -97,6 +97,7 @@ EXEEXT = ""
 BINRELPATH = "${@os.path.relpath(d.expand("${bindir}"), d.expand("${libexecdir}/gcc/${TARGET_SYS}/${BINV}"))}"
 
 do_install () {
+	( cd ${B}/${TARGET_SYS}/libgcc; oe_runmake 'DESTDIR=${D}' install-unwind_h )
 	oe_runmake 'DESTDIR=${D}' install-host
 
 	# Cleanup some of the ${libdir}{,exec}/gcc stuff ...
@@ -137,6 +138,11 @@ do_install () {
 		ln -sf ${BINRELPATH}/${TARGET_PREFIX}$t$suffix $dest$t$suffix
 	done
 
+	# libquadmath headers need to  be available in the gcc libexec dir
+	install -d ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include/
+	cp ${S}/libquadmath/quadmath.h ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include/
+	cp ${S}/libquadmath/quadmath_weak.h ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include/
+
 	chown -R root:root ${D}
 	
 	cross_canadian_bindirlinks
@@ -150,8 +156,9 @@ SYSTEMHEADERS = "/usr/include"
 SYSTEMLIBS = "${target_base_libdir}/"
 SYSTEMLIBS1 = "${target_libdir}/"
 
-EXTRA_OECONF += "--disable-libunwind-exceptions --disable-libssp \
-		--disable-libgomp --disable-libmudflap \
+EXTRA_OECONF += " --enable-poison-system-directories"
+
+EXTRA_OECONF += "--disable-libunwind-exceptions \
 		--with-mpfr=${STAGING_DIR_HOST}${layout_exec_prefix} \
 		--with-mpc=${STAGING_DIR_HOST}${layout_exec_prefix}"
 
-- 
1.9.3


