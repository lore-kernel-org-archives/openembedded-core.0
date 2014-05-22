Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (unknown [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D506B660F8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 09:55:38 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s4M9tYSm025635 for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 10:55:34 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id G_oPkJAT-5km
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 10:55:34 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s4M9tRJa025629
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 10:55:28 +0100
Message-ID: <1400752520.17834.66.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 22 May 2014 10:55:20 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] libarchive: Use pkg-config for libxml2 dependency
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
X-List-Received-Date: Thu, 22 May 2014 09:55:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-extended/libarchive/libarchive/pkgconfig.patch b/meta/recipes-extended/libarchive/libarchive/pkgconfig.patch
new file mode 100644
index 0000000..346af91
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/pkgconfig.patch
@@ -0,0 +1,25 @@
+Use pkg-config for the libxml2 dependency, not the -config script.
+
+Upstream-Status: Pending
+
+RP 2014/5/22
+
+Index: libarchive-3.1.2/configure.ac
+===================================================================
+--- libarchive-3.1.2.orig/configure.ac	2013-02-09 17:23:03.000000000 +0000
++++ libarchive-3.1.2/configure.ac	2014-05-13 15:26:45.446499108 +0000
+@@ -329,10 +329,10 @@
+   AS_HELP_STRING([--without-expat], [Don't build support for xar through expat]))
+ 
+ if test "x$with_xml2" != "xno"; then
+-  AC_PATH_PROG([XML2_CONFIG], [xml2-config],, [${PATH}])
+-  if test "x$XML2_CONFIG" != "x"; then
+-    CPPFLAGS="${CPPFLAGS} `${XML2_CONFIG} --cflags`"
+-    LIBS="${LIBS} `${XML2_CONFIG} --libs`"
++  PKG_CHECK_MODULES(PKG_XML2, [libxml-2.0],,)
++  if test "x$PKG_XML2_CFLAGS" != "x"; then
++    CPPFLAGS="${CPPFLAGS} ${PKG_XML2_CFLAGS}"
++    LIBS="${LIBS} ${PKG_XML2_LIBS}"
+     AC_CHECK_LIB(xml2,xmlInitParser,[true],AC_MSG_FAILURE(Missing xml2 library))
+   else
+     AC_CHECK_LIB(xml2,xmlInitParser)
diff --git a/meta/recipes-extended/libarchive/libarchive_3.1.2.bb b/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
index eedbaa7..c73ed35 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
@@ -28,6 +28,7 @@ PACKAGECONFIG[lzo] = "--with-lzo2,--without-lzo2,lzo,"
 
 SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://libarchive-CVE-2013-0211.patch \
+           file://pkgconfig.patch \
            "
 
 SRC_URI[md5sum] = "efad5a503f66329bb9d2f4308b5de98a"



