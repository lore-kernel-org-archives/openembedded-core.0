Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2C79F71FF3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 00:19:56 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 06 Nov 2014 16:17:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,329,1413270000"; d="scan'208";a="632989802"
Received: from unknown (HELO swold-linux.amr.corp.intel.com) ([10.255.13.21])
	by orsmga002.jf.intel.com with ESMTP; 06 Nov 2014 16:19:56 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Nov 2014 16:19:38 -0800
Message-Id: <e328785c43e1c22b5b198c0e9a787e115653dfe8.1415319473.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1415319473.git.sgw@linux.intel.com>
References: <cover.1415319473.git.sgw@linux.intel.com>
In-Reply-To: <cover.1415319473.git.sgw@linux.intel.com>
References: <cover.1415319473.git.sgw@linux.intel.com>
Subject: [PATCH 13/19] cups: Upgrade to 2.0.0
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
X-List-Received-Date: Fri, 07 Nov 2014 00:19:56 -0000

Remove backported patch and rebase gcrypt patch

Licence change updates the date and removes the OpenSSL exception

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/cups/cups.inc                |  1 -
 .../0001-don-t-try-to-run-generated-binaries.patch | 35 ++++++++--------
 .../cups/cups/cups-no-gcrypt.patch                 | 49 ----------------------
 meta/recipes-extended/cups/cups_1.7.5.bb           |  6 ---
 meta/recipes-extended/cups/cups_2.0.0.bb           |  6 +++
 5 files changed, 23 insertions(+), 74 deletions(-)
 delete mode 100644 meta/recipes-extended/cups/cups/cups-no-gcrypt.patch
 delete mode 100644 meta/recipes-extended/cups/cups_1.7.5.bb
 create mode 100644 meta/recipes-extended/cups/cups_2.0.0.bb

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index fbdc48e..70041c3 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -7,7 +7,6 @@ SRC_URI = "http://www.cups.org/software/${PV}/${BP}-source.tar.bz2 \
            file://use_echo_only_in_init.patch \
            file://0001-don-t-try-to-run-generated-binaries.patch \
            file://cups_serverbin.patch \
-           file://cups-no-gcrypt.patch \
            file://cups.socket \
            file://cups.path \
            file://cups.service \
diff --git a/meta/recipes-extended/cups/cups/0001-don-t-try-to-run-generated-binaries.patch b/meta/recipes-extended/cups/cups/0001-don-t-try-to-run-generated-binaries.patch
index e6544b5..5379eb6 100644
--- a/meta/recipes-extended/cups/cups/0001-don-t-try-to-run-generated-binaries.patch
+++ b/meta/recipes-extended/cups/cups/0001-don-t-try-to-run-generated-binaries.patch
@@ -10,13 +10,13 @@ Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
  ppdc/Makefile |   30 +++++++++++++++---------------
  1 files changed, 15 insertions(+), 15 deletions(-)
 
-diff --git a/ppdc/Makefile b/ppdc/Makefile
-index 0288d47..fc87f1b 100644
---- a/ppdc/Makefile
-+++ b/ppdc/Makefile
-@@ -243,8 +243,8 @@ genstrings:		genstrings.o libcupsppdc.a ../cups/libcups.a \
+Index: cups-2.0.0/ppdc/Makefile
+===================================================================
+--- cups-2.0.0.orig/ppdc/Makefile
++++ cups-2.0.0/ppdc/Makefile
+@@ -242,8 +242,8 @@ genstrings:		genstrings.o libcupsppdc.a
  	$(CXX) $(ARCHFLAGS) $(LDFLAGS) -o genstrings genstrings.o \
- 		libcupsppdc.a ../cups/libcups.a $(LIBGSSAPI) $(SSLLIBS) \
+ 		libcupsppdc.a ../cups/$(LIBCUPSSTATIC) $(LIBGSSAPI) $(SSLLIBS) \
  		$(DNSSDLIBS) $(COMMONLIBS) $(LIBZ)
 -	echo Generating localization strings...
 -	./genstrings >sample.c
@@ -25,9 +25,9 @@ index 0288d47..fc87f1b 100644
  
  
  #
-@@ -261,9 +261,9 @@ ppdc-static:		ppdc.o libcupsppdc.a  ../cups/libcups.a foo.drv foo-fr.po
+@@ -260,9 +260,9 @@ ppdc-static:		ppdc.o libcupsppdc.a ../cu
  	$(CXX) $(ARCHFLAGS) $(LDFLAGS) -o ppdc-static ppdc.o libcupsppdc.a \
- 		../cups/libcups.a $(LIBGSSAPI) $(SSLLIBS) $(DNSSDLIBS) \
+ 		../cups/$(LIBCUPSSTATIC) $(LIBGSSAPI) $(SSLLIBS) $(DNSSDLIBS) \
  		$(COMMONLIBS) $(LIBZ)
 -	echo Testing PPD compiler...
 -	./ppdc-static -l en,fr -I ../data foo.drv
@@ -38,24 +38,26 @@ index 0288d47..fc87f1b 100644
  
  
  #
-@@ -290,16 +290,16 @@ ppdi-static:		ppdc-static ppdi.o libcupsppdc.a  ../cups/libcups.a
- 		../cups/libcups.a $(LIBGSSAPI) $(SSLLIBS) $(DNSSDLIBS) \
+@@ -288,17 +288,17 @@ ppdi-static:		ppdc-static ppdi.o libcups
+ 	$(CXX) $(ARCHFLAGS) $(LDFLAGS) -o ppdi-static ppdi.o libcupsppdc.a \
+ 		../cups/$(LIBCUPSSTATIC) $(LIBGSSAPI) $(SSLLIBS) $(DNSSDLIBS) \
  		$(COMMONLIBS) $(LIBZ)
- 	echo Testing PPD importer...
+-	echo Testing PPD importer...
 -	$(RM) -r ppd ppd2 sample-import.drv
--	./ppdc-static -I ../data sample.drv
+-	./ppdc-static -l en -I ../data sample.drv
 -	./ppdi-static -I ../data -o sample-import.drv ppd/*
--	./ppdc-static -I ../data -d ppd2 sample-import.drv
+-	./ppdc-static -l en -I ../data -d ppd2 sample-import.drv
 -	if diff -r ppd ppd2 >/dev/null; then \
 -		echo PPD import OK; \
 -	else \
 -		echo PPD import FAILED; \
 -		exit 1; \
 -	fi
++#	echo Testing PPD importer...
 +#	$(RM) -r ppd ppd2 sample-import.drv
-+#	./ppdc-static -I ../data sample.drv
++#	./ppdc-static -l en -I ../data sample.drv
 +#	./ppdi-static -I ../data -o sample-import.drv ppd/*
-+#	./ppdc-static -I ../data -d ppd2 sample-import.drv
++#	./ppdc-static -l en -I ../data -d ppd2 sample-import.drv
 +#	if diff -r ppd ppd2 >/dev/null; then \
 +#		echo PPD import OK; \
 +#	else \
@@ -65,6 +67,3 @@ index 0288d47..fc87f1b 100644
  
  
  #
--- 
-1.6.6.1
-
diff --git a/meta/recipes-extended/cups/cups/cups-no-gcrypt.patch b/meta/recipes-extended/cups/cups/cups-no-gcrypt.patch
deleted file mode 100644
index 8bbcf39..0000000
--- a/meta/recipes-extended/cups/cups/cups-no-gcrypt.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-Description: Don't build-depend on libgcrypt, as nothing is used from it
-Author: Didier Raboud <odyx@debian.org>
-Bug-Debian: https://bugs.debian.org/638416
-Bug: http://www.cups.org/str.php?L????
-
-[CUPS Ticket #4399] -- http://www.cups.org/str.php?L4399
-
-Backported from http://www.cups.org/strfiles.php/3308/cups-no-gcrypt.patch
-
-Upstream-Status: Backport 
-
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
-Last-Update: 2014-04-07
---- a/config-scripts/cups-ssl.m4
-+++ b/config-scripts/cups-ssl.m4
-@@ -66,7 +66,6 @@
-     dnl Then look for GNU TLS...
-     if test $have_ssl = 0 -a "x$enable_gnutls" != "xno" -a "x$PKGCONFIG" != x; then
-     	AC_PATH_PROG(LIBGNUTLSCONFIG,libgnutls-config)
--    	AC_PATH_PROG(LIBGCRYPTCONFIG,libgcrypt-config)
- 	if $PKGCONFIG --exists gnutls; then
- 	    have_ssl=1
- 	    SSLLIBS=`$PKGCONFIG --libs gnutls`
-@@ -84,14 +83,6 @@
- 	if test $have_ssl = 1; then
- 	    CUPS_SERVERCERT="ssl/server.crt"
- 	    CUPS_SERVERKEY="ssl/server.key"
--
--            if $PKGCONFIG --exists gcrypt; then
--	        SSLLIBS="$SSLLIBS `$PKGCONFIG --libs gcrypt`"
--	        SSLFLAGS="$SSLFLAGS `$PKGCONFIG --cflags gcrypt`"
--	    elif test "x$LIBGCRYPTCONFIG" != x; then
--	        SSLLIBS="$SSLLIBS `$LIBGCRYPTCONFIG --libs`"
--	        SSLFLAGS="$SSLFLAGS `$LIBGCRYPTCONFIG --cflags`"
--	    fi
- 	fi
-     fi
- 
---- a/cups/http-private.h
-+++ b/cups/http-private.h
-@@ -80,7 +80,6 @@
- #  elif defined HAVE_GNUTLS
- #    include <gnutls/gnutls.h>
- #    include <gnutls/x509.h>
--#    include <gcrypt.h>
- #  elif defined(HAVE_CDSASSL)
- #    include <CoreFoundation/CoreFoundation.h>
- #    include <Security/Security.h>
diff --git a/meta/recipes-extended/cups/cups_1.7.5.bb b/meta/recipes-extended/cups/cups_1.7.5.bb
deleted file mode 100644
index 5538cec..0000000
--- a/meta/recipes-extended/cups/cups_1.7.5.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require cups.inc
-
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c5e50cb4b8f24b04636b719683a9102d"
-
-SRC_URI[md5sum] = "5d893edc2957005f78e2b2423fdace2e"
-SRC_URI[sha256sum] = "18cb4c6847dbaaaa05c8b35af787f19dd5c7686970b46548e72c711c6f26bd02"
diff --git a/meta/recipes-extended/cups/cups_2.0.0.bb b/meta/recipes-extended/cups/cups_2.0.0.bb
new file mode 100644
index 0000000..384cd0b
--- /dev/null
+++ b/meta/recipes-extended/cups/cups_2.0.0.bb
@@ -0,0 +1,6 @@
+require cups.inc
+
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=6c5a350596fba02754bd96eb6df3afd0"
+
+SRC_URI[md5sum] = "2cdd81fea23e9e29555c24bdfd0d7c89"
+SRC_URI[sha256sum] = "83fdbbcb4ac4d82949bbde6d5dce7a4b6a62557da8f3d46c5e34b951110f5be2"
-- 
1.8.3.1


