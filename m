Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 49F7C605B3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 01:38:02 +0000 (UTC)
Received: by pdjn11 with SMTP id n11so150108800pdj.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jun 2015 18:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=5+7oq6UGWZupenkEwIrd7B9vfI2eOLdlucHQq+wYx+o=;
	b=pJY5vRn2aMGymuMlmIQD1ujwSJ0At4z5sS+MVDoQ7OPjUB97E0aqxmxax3xrLgmqld
	HPomo7SdxNaFZTe/5aL9uC2JWWY/BVUp9S7BAEWXqpRk320aeclh6cxfpjN11vlatweJ
	02dW4fc9KwmOLjDsVZwDl3w/bUHow/UxFVbRHpL+AtECHbz9+kDUE7ajMcuwNmQ4ECrV
	mwgK8Lp66JDmU9WndAzBE2q5C6lrBVJ0/arZFLQ3lc8Np9jRea1NQZaF/BI1iytIMLKQ
	sUTc/GCBPcMJRqztobIJTNPhH5BjiIhuoIqEgnUsGQm30kg2lp4rx/KrAdXDMsD9zvVf
	3ZGw==
X-Received: by 10.70.128.34 with SMTP id nl2mr64732884pdb.43.1435023483732;
	Mon, 22 Jun 2015 18:38:03 -0700 (PDT)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by mx.google.com with ESMTPSA id
	ia3sm21163654pbc.31.2015.06.22.18.38.00
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Jun 2015 18:38:01 -0700 (PDT)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 92608FC46EC; Mon, 22 Jun 2015 18:37:58 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Jun 2015 18:37:55 -0700
Message-Id: <97b3f2e7b6b28d7540a1f69c65c319e4775e936f.1435022780.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <2bcc164faf8bbe473eb08c5046a636ca69e25dd1.1435022780.git.akuster808@gmail.com>
References: <2bcc164faf8bbe473eb08c5046a636ca69e25dd1.1435022780.git.akuster808@gmail.com>
In-Reply-To: <cover.1435022780.git.akuster808@gmail.com>
References: <cover.1435022780.git.akuster808@gmail.com>
Subject: [PATCH 2/3] gnutls: update to 3.4.1
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
X-List-Received-Date: Tue, 23 Jun 2015 01:38:04 -0000

This version supports the nettle 3.x and higher and requires that version.

this include a security fix:
GNUTLS-SA-2015-2
no CVE assigned to date.

enable openssl compat via PACKAGECONFIG as iputils needs gnutls/openssl.h

for migration info:
http://www.gnutls.org/manual/gnutls.html#Upgrading-from-previous-versions

V2: Fix some build depends seen on some systems.
WARNING: QA Issue: gnutls-openssl rdepends on libidn, but it isn't a build dependency? [build-deps]
WARNING: QA Issue: gnutls-xx rdepends on libidn, but it isn't a build dependency? [build-deps]
WARNING: QA Issue: gnutls-dev rdepends on libidn, but it isn't a build dependency? [build-deps]
WARNING: QA Issue: gnutls-bin rdepends on libidn, but it isn't a build dependency? [build-deps]
WARNING: QA Issue: gnutls rdepends on libidn, but it isn't a build dependency? [build-deps]

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-support/gnutls/gnutls.inc             |  4 ++-
 .../gnutls/configure.ac-fix-sed-command.patch      | 29 ++++++++++------------
 meta/recipes-support/gnutls/gnutls_3.3.14.bb       |  8 ------
 meta/recipes-support/gnutls/gnutls_3.4.1.bb        |  8 ++++++
 4 files changed, 24 insertions(+), 25 deletions(-)
 delete mode 100644 meta/recipes-support/gnutls/gnutls_3.3.14.bb
 create mode 100644 meta/recipes-support/gnutls/gnutls_3.4.1.bb

diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
index e9b138a..f57a788 100644
--- a/meta/recipes-support/gnutls/gnutls.inc
+++ b/meta/recipes-support/gnutls/gnutls.inc
@@ -34,9 +34,11 @@ do_configure_prepend() {
 	done
 }
 
-PACKAGECONFIG ??= "zlib"
+PACKAGECONFIG ??= "zlib openssl_compat"
 PACKAGECONFIG[tpm] = "--with-tpm, --without-tpm, trousers"
 PACKAGECONFIG[zlib] = "--with-zlib, --without-zlib, zlib"
+PACKAGECONFIG[openssl_compat] = "--enable-openssl-compatibility,,"
+PACKAGECONFIG[libind] = "--with-idn,--without-idn, libidn"
 
 PACKAGES =+ "${PN}-openssl ${PN}-xx"
 
diff --git a/meta/recipes-support/gnutls/gnutls/configure.ac-fix-sed-command.patch b/meta/recipes-support/gnutls/gnutls/configure.ac-fix-sed-command.patch
index 44a9934..342143f 100644
--- a/meta/recipes-support/gnutls/gnutls/configure.ac-fix-sed-command.patch
+++ b/meta/recipes-support/gnutls/gnutls/configure.ac-fix-sed-command.patch
@@ -13,19 +13,16 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/configure.ac b/configure.ac
-index c6818a0..1c4582d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -466,7 +466,7 @@ if test "$NEED_LIBOPTS_DIR" = "true";then
- 	dnl replace libopts-generated files with distributed backups, if present
- 	missing_baks=
- 	for i in ${srcdir}/src/*-args.c.bak ${srcdir}/src/*-args.h.bak; do
--		nam=`echo $i|sed 's/.bak//g'`
-+		nam=`echo $i|sed 's/\.bak$//'`
- 		if test -f $i;then
- 			cp -f $i $nam
- 		else
--- 
-2.0.1
-
+Index: gnutls-3.4.1/configure.ac
+===================================================================
+--- gnutls-3.4.1.orig/configure.ac
++++ gnutls-3.4.1/configure.ac
+@@ -530,7 +530,7 @@ if test "$enable_tools" != "no" || test
+ 		dnl replace libopts-generated files with distributed backups, if present
+ 		missing_baks=
+ 		for i in ${srcdir}/src/*-args.c.bak ${srcdir}/src/*-args.h.bak; do
+-			nam=`echo $i|sed 's/.bak//g'`
++			nam=`echo $i|sed 's/\.bak$//'`
+ 			if test -f $i;then
+ 				cp -f $i $nam
+ 			else
diff --git a/meta/recipes-support/gnutls/gnutls_3.3.14.bb b/meta/recipes-support/gnutls/gnutls_3.3.14.bb
deleted file mode 100644
index f41d183..0000000
--- a/meta/recipes-support/gnutls/gnutls_3.3.14.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require gnutls.inc
-
-SRC_URI += "file://correct_rpl_gettimeofday_signature.patch \
-            file://configure.ac-fix-sed-command.patch \
-            file://use-pkg-config-to-locate-zlib.patch \
-           "
-SRC_URI[md5sum] = "7f4465f8c564cf9cb8f5cb38b909f7ca"
-SRC_URI[sha256sum] = "0dfa0030faad8909c1e904105198232d6bc0123cae8cf4933b2bac85ee7cec52"
diff --git a/meta/recipes-support/gnutls/gnutls_3.4.1.bb b/meta/recipes-support/gnutls/gnutls_3.4.1.bb
new file mode 100644
index 0000000..1b64813
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls_3.4.1.bb
@@ -0,0 +1,8 @@
+require gnutls.inc
+
+SRC_URI += "file://correct_rpl_gettimeofday_signature.patch  \
+            file://configure.ac-fix-sed-command.patch \
+            file://use-pkg-config-to-locate-zlib.patch \
+          "
+SRC_URI[md5sum] = "2d04f34fa25b45f9dcb9104c0394e12e"
+SRC_URI[sha256sum] = "e9b5f58becf34756464216056cd5abbf04315eda80a374d02699dee83f80b12e"
-- 
1.9.1


