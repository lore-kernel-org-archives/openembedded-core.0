Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0EE7665CBC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 08:17:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t7H8HBcL029252
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 01:17:11 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Mon, 17 Aug 2015 01:17:11 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 17 Aug 2015 01:17:10 -0700
Message-ID: <d8436791cacfc94de5b6b55d1ed9510614f806d1.1439799402.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1439799402.git.liezhi.yang@windriver.com>
References: <cover.1439799402.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] ncurses: 5.9 -> 6.0
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
X-List-Received-Date: Mon, 17 Aug 2015 08:17:14 -0000
Content-Type: text/plain

Use -fPIC to fix when build readline: libtinfo.a(lib_termcap.o):
relocation R_X86_64_32 against `_nc_globals' can not be used when making
a shared object; recompile with -fPIC

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/ncurses/ncurses.inc              |   11 ++++++++---
 .../ncurses/{ncurses-5.9 => ncurses}/config.cache  |    0
 .../{ncurses-5.9 => ncurses}/tic-hang.patch        |    0
 .../ncurses/{ncurses_5.9.bb => ncurses_6.0.bb}     |    8 +++-----
 4 files changed, 11 insertions(+), 8 deletions(-)
 rename meta/recipes-core/ncurses/{ncurses-5.9 => ncurses}/config.cache (100%)
 rename meta/recipes-core/ncurses/{ncurses-5.9 => ncurses}/tic-hang.patch (100%)
 rename meta/recipes-core/ncurses/{ncurses_5.9.bb => ncurses_6.0.bb} (41%)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index ffd80ee..ea18d41 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://ncurses/base/version.c;beginline=1;endline=27;md5=cbc
 SECTION = "libs"
 DEPENDS = "ncurses-native"
 DEPENDS_class-native = ""
-INC_PR = "r15"
 
 BINCONFIG = "${bindir}/ncurses-config"
 
@@ -83,7 +82,7 @@ ncurses_configure() {
 	        --enable-sigwinch \
 	        --enable-pc-files \
 	        --disable-rpath-hack \
-		${EXCONFIG_ARGS} \
+	        ${EXCONFIG_ARGS} \
 	        --with-manpage-format=normal \
 	        "$@" || return 1
 	cd ..
@@ -206,7 +205,7 @@ do_install() {
                 test -h $f || continue
                 rm -f $f
                 echo '/* GNU ld script */'  >$f
-                echo "INPUT($i.so.5 AS_NEEDED(-ltinfo))" >>$f
+                echo "INPUT($i.so.6 AS_NEEDED(-ltinfo))" >>$f
         done
 
         # Make sure that libcurses is linked so that it gets -ltinfo
@@ -304,3 +303,9 @@ FILES_${PN}-terminfo-base = "\
 
 RSUGGESTS_${PN}-libtinfo = "${PN}-terminfo"
 RRECOMMENDS_${PN}-libtinfo = "${PN}-terminfo-base"
+
+# Fixed when build readline:
+# libtinfo.a(lib_termcap.o): relocation R_X86_64_32 against
+# `_nc_globals' can not be used when making a shared object; recompile
+# with -fPIC
+CFLAGS_append = " -fPIC"
diff --git a/meta/recipes-core/ncurses/ncurses-5.9/config.cache b/meta/recipes-core/ncurses/ncurses/config.cache
similarity index 100%
rename from meta/recipes-core/ncurses/ncurses-5.9/config.cache
rename to meta/recipes-core/ncurses/ncurses/config.cache
diff --git a/meta/recipes-core/ncurses/ncurses-5.9/tic-hang.patch b/meta/recipes-core/ncurses/ncurses/tic-hang.patch
similarity index 100%
rename from meta/recipes-core/ncurses/ncurses-5.9/tic-hang.patch
rename to meta/recipes-core/ncurses/ncurses/tic-hang.patch
diff --git a/meta/recipes-core/ncurses/ncurses_5.9.bb b/meta/recipes-core/ncurses/ncurses_6.0.bb
similarity index 41%
rename from meta/recipes-core/ncurses/ncurses_5.9.bb
rename to meta/recipes-core/ncurses/ncurses_6.0.bb
index 54d27a9..e956e3f 100644
--- a/meta/recipes-core/ncurses/ncurses_5.9.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.0.bb
@@ -1,12 +1,10 @@
 require ncurses.inc
 
-REVISION = "20150329"
-
-PR = "${INC_PR}.1"
+REVISION = "20150810"
 
 SRC_URI += "file://tic-hang.patch \
             file://config.cache \
 "
 S = "${WORKDIR}/${BP}-${REVISION}"
-SRC_URI[md5sum] = "cee991d09e69e60ebedef424804c52d4"
-SRC_URI[sha256sum] = "5b64f40e4dce73e3aa83d15bd9257c6eff8790ec41150f0938bd87c0eb75828f"
+SRC_URI[md5sum] = "78bfcb4634a87b4cda390956586f8f1f"
+SRC_URI[sha256sum] = "85d4a615731bc71075416fc3bea15a56740bed42b3596bbb126226af4111c65c"
-- 
1.7.9.5


