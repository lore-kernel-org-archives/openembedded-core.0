Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QyiAl-0004uL-0E for openembedded-core@lists.openembedded.org;
	Wed, 31 Aug 2011 12:37:31 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7VAWbtx008054
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2011 11:32:37 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06951-08 for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2011 11:32:33 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7VAWRGD008048
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2011 11:32:31 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 31 Aug 2011 11:32:13 +0100
Message-ID: <1314786733.5939.454.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] intltool: Fix perl paths
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 31 Aug 2011 10:37:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Currently in the native case we have a path that can easily exceed the
interpretor limit so use "env nativeperl" in that case.

This patch also fixes up the target version's interpretor path but
to do this we need to bypass the configure checks.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/intltool/intltool-0.40.6/noperlcheck.patch b/meta/recipes-devtools/intltool/intltool-0.40.6/noperlcheck.patch
new file mode 100644
index 0000000..3d8b591
--- a/dev/null
+++ b/meta/recipes-devtools/intltool/intltool-0.40.6/noperlcheck.patch
@@ -0,0 +1,40 @@
+In the target case, we can't check if perl exists or try running it. If we
+don't patch the code, the native perl location would be used, not the target
+which is also incorrect. We therefore disable this code and rely on the 
+correct value of PERL being passed in.
+
+RP 31/8/2011
+
+Upstream-Status: Inappropriate [OE specific]
+
+Index: intltool-0.40.6/configure.in
+===================================================================
+--- intltool-0.40.6.orig/configure.in	2011-08-31 11:21:13.061160535 +0100
++++ intltool-0.40.6/configure.in	2011-08-31 11:22:44.991160885 +0100
+@@ -9,24 +9,10 @@
+ aclocaldir='${datadir}'/aclocal
+ AC_SUBST(aclocaldir)
+ 
+-AC_PATH_PROG(PERL, perl)
+ if test -z "$PERL"; then
+-   AC_MSG_ERROR([perl not found])
+-fi
+-AC_MSG_CHECKING([for perl >= 5.8.1])
+-$PERL -e "use 5.8.1;" > /dev/null 2>&1
+-if test $? -ne 0; then
+-   AC_MSG_ERROR([perl 5.8.1 is required for intltool])
+-else
+-   PERL_VERSION="`$PERL -e \"printf '%vd', $^V\"`"
+-   AC_MSG_RESULT([$PERL_VERSION])
+-fi
+-AC_MSG_CHECKING([for XML::Parser])
+-if `$PERL -e "require XML::Parser" 2>/dev/null`; then
+-   AC_MSG_RESULT([ok])
+-else
+-   AC_MSG_ERROR([XML::Parser perl module is required for intltool])
++   AC_MSG_ERROR([PERL variable not set])
+ fi
++AC_SUBST(PERL)
+ 
+ AC_OUTPUT([
+ Makefile
diff --git a/meta/recipes-devtools/intltool/intltool.inc b/meta/recipes-devtools/intltool/intltool.inc
index 7e11fc9..8d4bec5 100644
--- a/meta/recipes-devtools/intltool/intltool.inc
+++ b/meta/recipes-devtools/intltool/intltool.inc
@@ -13,4 +13,7 @@ RRECOMMENDS_${PN}_virtclass-native = ""
 
 inherit autotools pkgconfig perlnative
 
+export PERL = "${bindir}/env perl"
+PERL_virtclass-native = "/usr/bin/env nativeperl"
+
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-devtools/intltool/intltool_0.40.6.bb b/meta/recipes-devtools/intltool/intltool_0.40.6.bb
index 931122d..e9871fc 100644
--- a/meta/recipes-devtools/intltool/intltool_0.40.6.bb
+++ b/meta/recipes-devtools/intltool/intltool_0.40.6.bb
@@ -1,13 +1,13 @@
 require intltool.inc
 LICENSE="GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-PR = "r4"
+PR = "r5"
 
 SRC_URI_append = " file://intltool-nowarn-0.40.0.patch \
                    ${NATIVEPATCHES} \
                  "
 
-NATIVEPATCHES = ""
+NATIVEPATCHES = "file://noperlcheck.patch"
 NATIVEPATCHES_virtclass-native = "file://use-nativeperl.patch"
 
 SRC_URI[md5sum] = "69bc0353323112f42ad4f9cf351bc3e5"




