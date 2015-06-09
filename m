Return-Path: <akuster808@gmail.com>
Received: from mail-qc0-f193.google.com (mail-qc0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8FF88758CE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jun 2015 19:30:32 +0000 (UTC)
Received: by qcvp6 with SMTP id p6so2356694qcv.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Jun 2015 12:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Jw6bBZNKmT9fqm3xwjLaLL4WbKgr4Srk9SkPCBXBo88=;
	b=EougivxTXR55N5WDU23zopeQb6yAv5pXTquUGL1sFsXmXYRh7MGAMvvlsqtAsx0gxX
	45v2cg56lTuu/Sk6v6grVRj02XjEIKgylGFpJQygrujNMZXRKKqIKii718wcPw6xMRTM
	JfwcRV6kUkGgnD3jYFvfx0EUHp98ZS7L00IKCHdQ1c4GVudAtStBzHk55e1f7ifWkV3z
	kTN8go8gfaEo21Mff/TZLkL934wy5NovQCEOGw/xVbocW5S1L2vUfJZHvxy8Uigft76E
	/dQ3HT1rTG9OMyP61K9XRmmUqI4FPoGjR1eePmgWpotAv6f9bwQLq3tkHSzFCrXuegp7
	R8YA==
X-Received: by 10.229.236.71 with SMTP id kj7mr29414212qcb.16.1433878233346;
	Tue, 09 Jun 2015 12:30:33 -0700 (PDT)
Received: from Pahoa2.mvista.com (64.2.3.194.ptr.us.xo.net. [64.2.3.194])
	by mx.google.com with ESMTPSA id 138sm3074610qhx.18.2015.06.09.12.30.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Jun 2015 12:30:32 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Jun 2015 12:30:25 -0700
Message-Id: <1433878226-21350-3-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1433878226-21350-1-git-send-email-akuster808@gmail.com>
References: <1433878226-21350-1-git-send-email-akuster808@gmail.com>
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
X-List-Received-Date: Tue, 09 Jun 2015 19:30:32 -0000

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
2.3.5


