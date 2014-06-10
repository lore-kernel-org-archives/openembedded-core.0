Return-Path: <akuster@mvista.com>
Received: from mail-pb0-f51.google.com (mail-pb0-f51.google.com
	[209.85.160.51])
	by mail.openembedded.org (Postfix) with ESMTP id F39CC60CF8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jun 2014 01:12:00 +0000 (UTC)
Received: by mail-pb0-f51.google.com with SMTP id rp16so206693pbb.38
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jun 2014 18:12:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=1Rfv10BdNPkWbm5oDlqCe5jkWvPPoChxCegc3R70dCQ=;
	b=LdAQ4ItcQLvyMcFu0fQVRryTx0Jm6H8OFDnWHwpEE1aVFUFsRkVUqsNsM7/5K7d+d7
	pXjjSm1cQP/YFOvlR45alUY8QjbHDBkLjkjwjE5TAi3p193l+egTEtEetBbYmTgaAtHR
	XgCrlkt8mZu3/K1Bi/AlxxfhffuWJJqYro8bHhPUgt6QaNk8zJCzwkjGnP3cgJjX2/UM
	5eh11to3fPP2VLGpAjtVgfrbwBd0tqTb+UfhtpwFj0D5am7UZQGdKFoVvjbIWk5Z9sP4
	eiY6hpfihU5doTOsqaIujBTxTUIAb+gNoS/mlm9d5KyUuuo3Hq7Ah28m9NrCuRP7kT7W
	+rpw==
X-Gm-Message-State: ALoCoQnELxWgcA/c2bDfkPRd08GkEBaDOa4Dma1RxIuxHVuPPjofdNaBXCQLVguoLZDMaX8bW/cS
X-Received: by 10.68.137.193 with SMTP id qk1mr7114695pbb.155.1402362720887;
	Mon, 09 Jun 2014 18:12:00 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55])
	by mx.google.com with ESMTPSA id be7sm4477672pad.9.2014.06.09.18.11.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 09 Jun 2014 18:12:00 -0700 (PDT)
From: Armin Kuster <akuster@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jun 2014 18:11:55 -0700
Message-Id: <1402362715-16218-1-git-send-email-akuster@mvista.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] v4 cups: Shouldn't link against libgcrypt without using gcrypt functions
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
X-List-Received-Date: Tue, 10 Jun 2014 01:12:05 -0000

Backported from http://www.cups.org/strfiles.php/3308/cups-no-gcrypt.patch

This addresses the cryto dependency seen during build.

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-extended/cups/cups.inc                |  1 +
 .../cups/cups/cups-no-gcrypt.patch                 | 49 ++++++++++++++++++++++
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/cups-no-gcrypt.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index fd88552..3b8027b 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -8,6 +8,7 @@ SRC_URI = "http://www.cups.org/software/${PV}/${BP}-source.tar.bz2 \
            file://use_echo_only_in_init.patch \
            file://0001-don-t-try-to-run-generated-binaries.patch \
            file://cups_serverbin.patch \
+           file://cups-no-gcrypt.patch \
 	  "
 
 LEAD_SONAME = "libcupsdriver.so"
diff --git a/meta/recipes-extended/cups/cups/cups-no-gcrypt.patch b/meta/recipes-extended/cups/cups/cups-no-gcrypt.patch
new file mode 100644
index 0000000..8bbcf39
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/cups-no-gcrypt.patch
@@ -0,0 +1,49 @@
+Description: Don't build-depend on libgcrypt, as nothing is used from it
+Author: Didier Raboud <odyx@debian.org>
+Bug-Debian: https://bugs.debian.org/638416
+Bug: http://www.cups.org/str.php?L????
+
+[CUPS Ticket #4399] -- http://www.cups.org/str.php?L4399
+
+Backported from http://www.cups.org/strfiles.php/3308/cups-no-gcrypt.patch
+
+Upstream-Status: Backport 
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+Last-Update: 2014-04-07
+--- a/config-scripts/cups-ssl.m4
++++ b/config-scripts/cups-ssl.m4
+@@ -66,7 +66,6 @@
+     dnl Then look for GNU TLS...
+     if test $have_ssl = 0 -a "x$enable_gnutls" != "xno" -a "x$PKGCONFIG" != x; then
+     	AC_PATH_PROG(LIBGNUTLSCONFIG,libgnutls-config)
+-    	AC_PATH_PROG(LIBGCRYPTCONFIG,libgcrypt-config)
+ 	if $PKGCONFIG --exists gnutls; then
+ 	    have_ssl=1
+ 	    SSLLIBS=`$PKGCONFIG --libs gnutls`
+@@ -84,14 +83,6 @@
+ 	if test $have_ssl = 1; then
+ 	    CUPS_SERVERCERT="ssl/server.crt"
+ 	    CUPS_SERVERKEY="ssl/server.key"
+-
+-            if $PKGCONFIG --exists gcrypt; then
+-	        SSLLIBS="$SSLLIBS `$PKGCONFIG --libs gcrypt`"
+-	        SSLFLAGS="$SSLFLAGS `$PKGCONFIG --cflags gcrypt`"
+-	    elif test "x$LIBGCRYPTCONFIG" != x; then
+-	        SSLLIBS="$SSLLIBS `$LIBGCRYPTCONFIG --libs`"
+-	        SSLFLAGS="$SSLFLAGS `$LIBGCRYPTCONFIG --cflags`"
+-	    fi
+ 	fi
+     fi
+ 
+--- a/cups/http-private.h
++++ b/cups/http-private.h
+@@ -80,7 +80,6 @@
+ #  elif defined HAVE_GNUTLS
+ #    include <gnutls/gnutls.h>
+ #    include <gnutls/x509.h>
+-#    include <gcrypt.h>
+ #  elif defined(HAVE_CDSASSL)
+ #    include <CoreFoundation/CoreFoundation.h>
+ #    include <Security/Security.h>
-- 
1.9.1


