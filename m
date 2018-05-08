Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1F8F874EA0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 May 2018 09:05:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4895ZtA015027
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 May 2018 02:05:50 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 8 May 2018 02:05:24 -0700
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 8 May 2018 02:05:24 -0700
Message-ID: <20180508090524.79759-1-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] gettext: make gettext independant of host java components
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
X-List-Received-Date: Tue, 08 May 2018 09:06:00 -0000
Content-Type: text/plain

The checksums of gettext were changing based on whether or not java
and javac were installed. This patch makes gettext recipes independant
of Java components.

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 ...ke-gettext-independant-of-java-components.patch | 88 ++++++++++++++++++++++
 meta/recipes-core/gettext/gettext_0.19.8.1.bb      |  1 +
 2 files changed, 89 insertions(+)
 create mode 100644 meta/recipes-core/gettext/gettext-0.19.8.1/make-gettext-independant-of-java-components.patch

diff --git a/meta/recipes-core/gettext/gettext-0.19.8.1/make-gettext-independant-of-java-components.patch b/meta/recipes-core/gettext/gettext-0.19.8.1/make-gettext-independant-of-java-components.patch
new file mode 100644
index 0000000000..d3a4c5a056
--- /dev/null
+++ b/meta/recipes-core/gettext/gettext-0.19.8.1/make-gettext-independant-of-java-components.patch
@@ -0,0 +1,88 @@
+From: "Deere & Company" <john@johndeere.com>
+Subject: [PATCH] configure to gettext to default with no java and javac. 
+Author: patilashish3@JohnDeere.com, yeatesrichardr@JohnDeere.com
+
+The checksums of gettext were changing based on whether or not java and javac were installed.
+This patch makes gettext recipes independant of Java components.
+
+Upstream-Status: inappropriate [oe-core specific]
+
+Signed-off-by: Luis Ramirez <Luis.Ramirez@windriver.com>
+Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
+
+Index: gettext-0.19.8.1/gettext-runtime/configure.ac
+===================================================================
+--- gettext-0.19.8.1.orig/gettext-runtime/configure.ac	2014-12-09 16:43:44.000000000 +0800
++++ gettext-0.19.8.1/gettext-runtime/configure.ac	2018-03-07 14:51:57.318227813 +0800
+@@ -35,7 +35,25 @@
+ 
+ gt_JAVA_CHOICE
+ 
+-gt_JAVACOMP([1.3], [1.1])
++dnl replaced gt_JAVACOMP([1.3], [1.1]) with results when no javac is installed
++CONF_JAVAC=
++HAVE_JAVAC_ENVVAR=
++CLASSPATH=
++CLASSPATH_SEPARATOR=:
++HAVE_GCJ_C=
++HAVE_JAVAC=
++HAVE_JIKES=
++HAVE_JAVACOMP=
++
++AC_SUBST([CONF_JAVAC])
++AC_SUBST([HAVE_JAVAC_ENVVAR])
++AC_SUBST([CLASSPATH])
++AC_SUBST([CLASSPATH_SEPARATOR])
++AC_SUBST([HAVE_JAVAC])
++AC_SUBST([HAVE_GCJ_C])
++AC_SUBST([HAVE_JIKES])
++AC_SUBST([HAVE_JAVACOMP])
++
+ AC_CHECK_PROG([JAR], [jar], [jar])
+ if test -n "$HAVE_JAVACOMP" && test -n "$JAR" && test "$JAVA_CHOICE" != no; then
+   BUILDJAVA=yes
+Index: gettext-0.19.8.1/gettext-tools/configure.ac
+===================================================================
+--- gettext-0.19.8.1.orig/gettext-tools/configure.ac	2014-12-09 16:43:45.000000000 +0800
++++ gettext-0.19.8.1/gettext-tools/configure.ac	2018-03-07 14:54:57.654229070 +0800
+@@ -43,8 +43,38 @@
+ fi
+ AC_SUBST([BUILDJAVAEXE])
+ 
+-gt_JAVAEXEC
+-gt_JAVACOMP([1.3])
++dnl replaced gt_JAVAEXEC with results when no java is installed
++CONF_JAVA=
++HAVE_JAVA_ENVVAR=
++HAVE_GIJ=
++HAVE_JAVA=
++HAVE_JRE=
++HAVE_JVIEW=
++AC_SUBST([CONF_JAVA])
++AC_SUBST([HAVE_JAVA_ENVVAR])
++AC_SUBST([HAVE_GIJ])
++AC_SUBST([HAVE_JAVA])
++AC_SUBST([HAVE_JRE])
++AC_SUBST([HAVE_JVIEW])
++
++dnl replaced gt_JAVACOMP([1.3]) with results when no javac is installed
++CONF_JAVAC=
++HAVE_JAVAC_ENVVAR=
++CLASSPATH=
++CLASSPATH_SEPARATOR=:
++HAVE_GCJ_C=
++HAVE_JAVAC=
++HAVE_JIKES=
++HAVE_JAVACOMP=
++AC_SUBST([CONF_JAVAC])
++AC_SUBST([HAVE_JAVAC_ENVVAR])
++AC_SUBST([CLASSPATH])
++AC_SUBST([CLASSPATH_SEPARATOR])
++AC_SUBST([HAVE_JAVAC])
++AC_SUBST([HAVE_GCJ_C])
++AC_SUBST([HAVE_JIKES])
++AC_SUBST([HAVE_JAVACOMP])
++
+ AC_CHECK_PROG([JAR], [jar], [jar])
+ if test -n "$HAVE_JAVACOMP" && test -n "$JAR" && test "$JAVA_CHOICE" != no; then
+   BUILDJAVA=yes
diff --git a/meta/recipes-core/gettext/gettext_0.19.8.1.bb b/meta/recipes-core/gettext/gettext_0.19.8.1.bb
index 68f5cc329a..9ba74120cd 100644
--- a/meta/recipes-core/gettext/gettext_0.19.8.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.19.8.1.bb
@@ -18,6 +18,7 @@ SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
 	   file://add-with-bisonlocaledir.patch \
 	   file://cr-statement.c-timsort.h-fix-formatting-issues.patch \
 	   file://use-pkgconfig.patch \
+	   file://make-gettext-independant-of-java-components.patch \
 "
 
 SRC_URI[md5sum] = "97e034cf8ce5ba73a28ff6c3c0638092"
-- 
2.11.0


