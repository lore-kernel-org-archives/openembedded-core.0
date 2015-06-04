Return-Path: <akuster808@gmail.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 2C7B77580D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jun 2015 19:37:15 +0000 (UTC)
Received: by qkoo18 with SMTP id o18so29548551qko.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jun 2015 12:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=UwrEFxz0ka4jcPPQi9Gx14Kny+ZRbxs8tV2nubvIM/E=;
	b=s504vQ2JMb4YEEB0Vwm9n4Zzc05mq+p+OsFPVmb6AqhULSF1L8FUqyk6Xp3dWIHSUo
	ROc6yYL2BTFmH4PiwK6RmpQOrJ3kcvlTYGQKnm0KfFH8TY5A2HZcZMtemxrDFkQpL0nV
	WC/mDU3rjB7CEtGbuSwmFL5v+5XgmVd4lWtqWoq4ojxu8mOa9JkhkKsdPvMXBaoAisAI
	iPaPH0+NX/gZ4GJEowkNcA/5zqeZH3St+WVPXTMSpsReeGHMLGB1/TRSQi/bNQn1Y/qp
	stBaXZT6gIHwzInSIsF/zf5u/ouSampQib+gZ54YR+2l2Aq5PMIjOtLDKrkdnPBVCIMx
	Gjkg==
X-Received: by 10.140.33.21 with SMTP id i21mr44289905qgi.4.1433446637107;
	Thu, 04 Jun 2015 12:37:17 -0700 (PDT)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id j62sm2869295qhc.33.2015.06.04.12.37.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Jun 2015 12:37:15 -0700 (PDT)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id CDEB2FC91F1; Thu,  4 Jun 2015 12:37:09 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Jun 2015 12:37:07 -0700
Message-Id: <6c7c4b20a65422884d29efaa109b9b8b5961f300.1433446500.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1433446500.git.akuster808@gmail.com>
References: <cover.1433446500.git.akuster808@gmail.com>
In-Reply-To: <cover.1433446500.git.akuster808@gmail.com>
References: <cover.1433446500.git.akuster808@gmail.com>
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
X-List-Received-Date: Thu, 04 Jun 2015 19:37:19 -0000

This version supports the nettle 3.x and higher and requires that version.

this include a security fix:
GNUTLS-SA-2015-2
no CVE assigned to date.

enable openssl compat via PACKAGECONFIG as iputils needs gnutls/openssl.h

for migration info:
http://www.gnutls.org/manual/gnutls.html#Upgrading-from-previous-versions

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-support/gnutls/gnutls.inc             |  3 ++-
 .../gnutls/configure.ac-fix-sed-command.patch      | 29 ++++++++++------------
 meta/recipes-support/gnutls/gnutls_3.3.14.bb       |  8 ------
 meta/recipes-support/gnutls/gnutls_3.4.1.bb        |  8 ++++++
 4 files changed, 23 insertions(+), 25 deletions(-)
 delete mode 100644 meta/recipes-support/gnutls/gnutls_3.3.14.bb
 create mode 100644 meta/recipes-support/gnutls/gnutls_3.4.1.bb

diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
index e9b138a..6928cb9 100644
--- a/meta/recipes-support/gnutls/gnutls.inc
+++ b/meta/recipes-support/gnutls/gnutls.inc
@@ -34,9 +34,10 @@ do_configure_prepend() {
 	done
 }
 
-PACKAGECONFIG ??= "zlib"
+PACKAGECONFIG ??= "zlib openssl_compat"
 PACKAGECONFIG[tpm] = "--with-tpm, --without-tpm, trousers"
 PACKAGECONFIG[zlib] = "--with-zlib, --without-zlib, zlib"
+PACKAGECONFIG[openssl_compat] = "--enable-openssl-compatibility,,"
 
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


