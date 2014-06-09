Return-Path: <akuster@mvista.com>
Received: from mail-pb0-f41.google.com (mail-pb0-f41.google.com
	[209.85.160.41])
	by mail.openembedded.org (Postfix) with ESMTP id 1BD5965FC8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jun 2014 21:01:04 +0000 (UTC)
Received: by mail-pb0-f41.google.com with SMTP id uo5so5420451pbc.28
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jun 2014 14:01:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=eVe6ZRa2ol70mp3RlWLV8rcBucanfoEV6PKcXYhT7oQ=;
	b=HYnSimU90x7lem1inb+xUfGSR+7RlmP6vu3jv4MCn9Os5X4V9Pb1LZx+pgtuxGayIn
	kdqo0lk2Uz5JMqVh7dBgwc06SfDjdKKOJL4WfUD8x2TgExLtVY5z0sH9+8zOjNn23P+U
	W8ybR1+1NTBBjLqpMHoB7O8wrCfbQgomoVBpus1FcNgxSaNeNj64iDKgoDNOuwosKlXS
	ZN+zl+fTJ5Lz6m8SmRJA4DluAvxJK6YtsWDv/KIOW1kgaxarLGSiJG/ePDS0bsXIExqt
	QFrSQG6+WtBEfyaBx2W2zXGEiB+uxhP3zOL1BUcIK7nzvpjFnBsWx+e6KAwN5UgxOzol
	ufJg==
X-Gm-Message-State: ALoCoQlgO7EGtSNr3TKi6foMZjFDHxrRpU8HuXjo84eXs/moDBmWYDwEBned411nD9xuGCADxz05
X-Received: by 10.66.159.34 with SMTP id wz2mr845733pab.96.1402347665951;
	Mon, 09 Jun 2014 14:01:05 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55]) by mx.google.com with ESMTPSA id
	bu1sm65610675pbb.54.2014.06.09.14.01.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 09 Jun 2014 14:01:05 -0700 (PDT)
From: Armin Kuster <akuster@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jun 2014 14:01:01 -0700
Message-Id: <1402347661-28746-1-git-send-email-akuster@mvista.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] v3 cups: Shouldn't link against libgcrypt without using gcrypt functions
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
X-List-Received-Date: Mon, 09 Jun 2014 21:01:12 -0000

[CUPS Ticket #4399] -- http://www.cups.org/str.php?L4399

Upstream-Status: Backport

Backported from http://www.cups.org/strfiles.php/3308/cups-no-gcrypt.patch

This addresses the cryto dependency seen during build.

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-extended/cups/cups.inc                |  1 +
 .../cups/cups/cups-no-gcrypt.patch                 | 40 ++++++++++++++++++++++
 2 files changed, 41 insertions(+)
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
index 0000000..465d353
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/cups-no-gcrypt.patch
@@ -0,0 +1,40 @@
+Description: Don't build-depend on libgcrypt, as nothing is used from it
+Author: Didier Raboud <odyx@debian.org>
+Bug-Debian: https://bugs.debian.org/638416
+Bug: http://www.cups.org/str.php?L????
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


