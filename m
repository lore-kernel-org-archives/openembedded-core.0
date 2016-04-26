Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 80988605BA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 05:14:01 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u3Q5E2D2016428
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2016 22:14:02 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Mon, 25 Apr 2016 22:14:01 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Apr 2016 13:13:01 +0800
Message-ID: <1461647581-14174-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] curl: add krb5 to PACKAGECONFIG
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
X-List-Received-Date: Tue, 26 Apr 2016 05:14:02 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

krb5 is needed to enables GSS-Negotiate authentication

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../0001-replace-krb5-config-with-pkg-config.patch | 43 ++++++++++++++++++++++
 meta/recipes-support/curl/curl_7.47.1.bb           |  5 ++-
 2 files changed, 47 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/curl/curl/0001-replace-krb5-config-with-pkg-config.patch

diff --git a/meta/recipes-support/curl/curl/0001-replace-krb5-config-with-pkg-config.patch b/meta/recipes-support/curl/curl/0001-replace-krb5-config-with-pkg-config.patch
new file mode 100644
index 0000000..74e5d99
--- /dev/null
+++ b/meta/recipes-support/curl/curl/0001-replace-krb5-config-with-pkg-config.patch
@@ -0,0 +1,43 @@
+[PATCH] replace krb5-config with pkg-config
+
+Upstream-Status:  Pending
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ configure.ac | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index e99b303..dc93f39 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1196,7 +1196,7 @@ AC_ARG_WITH(gssapi,
+   fi
+ ])
+ 
+-: ${KRB5CONFIG:="$GSSAPI_ROOT/bin/krb5-config"}
++KRB5CONFIG=`which pkg-config`
+ 
+ save_CPPFLAGS="$CPPFLAGS"
+ AC_MSG_CHECKING([if GSS-API support is requested])
+@@ -1207,7 +1207,7 @@ if test x"$want_gss" = xyes; then
+      if test -n "$host_alias" -a -f "$GSSAPI_ROOT/bin/$host_alias-krb5-config"; then
+         GSSAPI_INCS=`$GSSAPI_ROOT/bin/$host_alias-krb5-config --cflags gssapi`
+      elif test -f "$KRB5CONFIG"; then
+-        GSSAPI_INCS=`$KRB5CONFIG --cflags gssapi`
++        GSSAPI_INCS=`$KRB5CONFIG --cflags mit-krb5-gssapi`
+      elif test "$GSSAPI_ROOT" != "yes"; then
+         GSSAPI_INCS="-I$GSSAPI_ROOT/include"
+      fi
+@@ -1300,7 +1300,7 @@ if test x"$want_gss" = xyes; then
+         elif test -f "$KRB5CONFIG"; then
+            dnl krb5-config doesn't have --libs-only-L or similar, put everything
+            dnl into LIBS
+-           gss_libs=`$KRB5CONFIG --libs gssapi`
++           gss_libs=`$KRB5CONFIG --libs mit-krb5-gssapi`
+            LIBS="$gss_libs $LIBS"
+         else
+            case $host in
+-- 
+1.9.1
+
diff --git a/meta/recipes-support/curl/curl_7.47.1.bb b/meta/recipes-support/curl/curl_7.47.1.bb
index c2173d8..b237b4e 100644
--- a/meta/recipes-support/curl/curl_7.47.1.bb
+++ b/meta/recipes-support/curl/curl_7.47.1.bb
@@ -5,7 +5,9 @@ SECTION = "console/network"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;beginline=8;md5=3a34942f4ae3fbf1a303160714e664ac"
 
-SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2"
+SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
+           file://0001-replace-krb5-config-with-pkg-config.patch \
+"
 
 # curl likes to set -g0 in CFLAGS, so we stop it
 # from mucking around with debug options
@@ -40,6 +42,7 @@ PACKAGECONFIG[ssl] = "--with-ssl --with-random=/dev/urandom,--without-ssl,openss
 PACKAGECONFIG[telnet] = "--enable-telnet,--disable-telnet,"
 PACKAGECONFIG[tftp] = "--enable-tftp,--disable-tftp,"
 PACKAGECONFIG[zlib] = "--with-zlib=${STAGING_LIBDIR}/../,--without-zlib,zlib"
+PACKAGECONFIG[krb5] = "--with-gssapi,--without-gssapi,krb5"
 
 EXTRA_OECONF = " \
     --enable-crypto-auth \
-- 
2.8.1


