Return-Path: <misn@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id BE61360F77
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2013 08:16:48 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.2.318.1; Mon, 9 Sep 2013
	10:16:44 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4351)	id 622A428B833;
	Mon,  9 Sep 2013 10:16:44 +0200 (CEST)
From: Mihaela Sendrea <mihaela.sendrea@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 9 Sep 2013 10:16:40 +0200
Message-ID: <1378714602-54741-1-git-send-email-mihaela.sendrea@enea.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: mihaela.sendrea@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH v2 1/3] dejagnu: Add recipe
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
X-List-Received-Date: Mon, 09 Sep 2013 08:16:49 -0000
Content-Type: text/plain

Nedeed for gcc-runtime tests.

Signed-off-by: Mihaela Sendrea <mihaela.sendrea@enea.com>
---
 .../dejagnu-1.5/remove-expect-tcl-dependency.patch |   34 ++++++++++++++++++++
 meta/recipes-devtools/dejagnu/dejagnu_1.5.bb       |   19 +++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-devtools/dejagnu/dejagnu-1.5/remove-expect-tcl-dependency.patch
 create mode 100644 meta/recipes-devtools/dejagnu/dejagnu_1.5.bb

diff --git a/meta/recipes-devtools/dejagnu/dejagnu-1.5/remove-expect-tcl-dependency.patch b/meta/recipes-devtools/dejagnu/dejagnu-1.5/remove-expect-tcl-dependency.patch
new file mode 100644
index 0000000..9e5471a
--- /dev/null
+++ b/meta/recipes-devtools/dejagnu/dejagnu-1.5/remove-expect-tcl-dependency.patch
@@ -0,0 +1,34 @@
+Remove the build dependency on expect and tcl
+
+Upstream-Status: Pending
+
+Signed-off-by: Anders Roxell <anders.roxell@enea.com>
+---
+diff -uNr a/configure.ac b/configure.ac
+--- a/configure.ac	2013-01-17 16:05:13.715074360 +0100
++++ b/configure.ac	2013-01-17 16:25:48.678029417 +0100
+@@ -37,24 +37,5 @@
+ AC_PATH_PROG([DOCBOOK2PS], [docbook2ps], [false])
+ AC_PATH_PROG([DOCBOOK2TEXI], [docbook2x-texi], [false])
+ 
+-dnl Search for expect.
+-AC_PATH_PROG([EXPECT], [expect])
+-if test -z $ac_cv_path_EXPECT ; then
+-   AC_MSG_ERROR([unable to locate expect])
+-fi
+-
+-dnl Check the Tcl version is >= 8.3.
+-AC_MSG_CHECKING([Tcl version 8.3 or greater])
+-AC_CACHE_VAL(ac_cv_dg_tcl_modern,[
+-  ac_cv_dg_tcl_modern=`$EXPECT << EOF
+-if @<:@ expr \\${tcl_version} >= 8.3  @:>@ then { puts yes } else { puts no }
+-EOF`
+-])
+-if test x${ac_cv_dg_tcl_modern} = xyes ; then
+-  AC_MSG_RESULT(${ac_cv_dg_tcl_modern})
+-else
+-  AC_MSG_ERROR([Tcl 8.3 or greater is required])
+-fi
+-
+ AC_CONFIG_SUBDIRS([example/calc example/hello example/mathhelper])
+ AC_OUTPUT([Makefile])
diff --git a/meta/recipes-devtools/dejagnu/dejagnu_1.5.bb b/meta/recipes-devtools/dejagnu/dejagnu_1.5.bb
new file mode 100644
index 0000000..d70d4c3
--- /dev/null
+++ b/meta/recipes-devtools/dejagnu/dejagnu_1.5.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "dejagnu tests tool."
+HOMEPAGE = "http://www.gnu.org/software/dejagnu/"
+LICENSE="GPLv3+"
+SECTION = "devel"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+PR = "r1"
+
+RDEPENDS_${PN} = "expect"
+
+SRC_URI = "${GNU_MIRROR}/dejagnu/dejagnu-${PV}.tar.gz \
+           file://remove-expect-tcl-dependency.patch \
+          "
+
+SRC_URI[md5sum] = "3df1cbca885e751e22d3ebd1ac64dc3c"
+SRC_URI[sha256sum] = "c8b45808357a6f3e32cd56d8b56a4fdf8a1d5f3818818045c2022993e0e8a3db"
+
+inherit autotools
+
-- 
1.7.10.4


