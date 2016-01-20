Return-Path: <Dengke.Du@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6B36A60767
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 09:30:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0K9UhLL006488
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 01:30:43 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 20 Jan 2016 01:30:42 -0800
From: Dengke Du <dengke.du@windriver.com>
To: <dengke.du@windriver.com>
Date: Wed, 20 Jan 2016 04:30:36 -0500
Message-ID: <2a8d19d4ef60a323c8770722ec7f60811ced53ca.1453281406.git.dengke.du@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1453281406.git.dengke.du@windriver.com>
References: <cover.1453281406.git.dengke.du@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] ncurses: drop the compatible option
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
X-List-Received-Date: Wed, 20 Jan 2016 09:30:46 -0000
Content-Type: text/plain

drop the compatible option --with-abi-version=5

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 meta/recipes-core/ncurses/ncurses.inc    | 10 +++++-----
 meta/recipes-core/ncurses/ncurses_6.0.bb |  1 -
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index fbe74d5..0ebf8d5 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -7,7 +7,7 @@ SECTION = "libs"
 DEPENDS = "ncurses-native"
 DEPENDS_class-native = ""
 
-BINCONFIG = "${bindir}/ncurses5-config ${bindir}/ncursesw5-config"
+BINCONFIG = "${bindir}/ncurses6-config ${bindir}/ncursesw6-config"
 
 inherit autotools binconfig-disabled multilib_header pkgconfig
 
@@ -205,7 +205,7 @@ do_install() {
                 test -h $f || continue
                 rm -f $f
                 echo '/* GNU ld script */'  >$f
-                echo "INPUT($i.so.5 AS_NEEDED(-ltinfo))" >>$f
+                echo "INPUT($i.so.6 AS_NEEDED(-ltinfo))" >>$f
         done
 
         # Make sure that libcurses is linked so that it gets -ltinfo
@@ -231,7 +231,7 @@ do_install() {
             # Use lnr to ensure this is a relative link despite absolute paths
             # (as we can't know the relationship between base_libdir and libdir).
             # At some point we can rely on coreutils 8.16 which has ln -r.
-            lnr ${D}${base_libdir}/libtinfo.so.5 ${D}${libdir}/libtinfo.so
+            lnr ${D}${base_libdir}/libtinfo.so.6 ${D}${libdir}/libtinfo.so
         fi
         if [ -d "${D}${includedir}/ncurses" ]; then
             for f in `find ${D}${includedir}/ncurses -name "*.h"`
@@ -271,8 +271,8 @@ PACKAGES += " \
 FILES_${PN} = "\
   ${bindir}/tput \
   ${bindir}/tset \
-  ${bindir}/ncurses5-config \
-  ${bindir}/ncursesw5-config \
+  ${bindir}/ncurses6-config \
+  ${bindir}/ncursesw6-config \
   ${datadir}/tabset \
 "
 
diff --git a/meta/recipes-core/ncurses/ncurses_6.0.bb b/meta/recipes-core/ncurses/ncurses_6.0.bb
index 8587287..ea45ea7 100644
--- a/meta/recipes-core/ncurses/ncurses_6.0.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.0.bb
@@ -8,4 +8,3 @@ SRC_URI += "file://tic-hang.patch \
 # commit id corresponds to the above listed REVISION
 SRCREV = "c6b034b4d69f8c9092c2a1b5d5bb718282b2a522"
 S = "${WORKDIR}/git"
-EXTRA_OECONF += "--with-abi-version=5"
-- 
1.9.1


