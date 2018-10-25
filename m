Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 00416745AE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Oct 2018 04:18:49 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w9P4IoSD014990
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Oct 2018 21:18:50 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Wed, 24 Oct 2018 21:18:38 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 25 Oct 2018 12:18:36 +0800
Message-ID: <1540441116-366611-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] openssl: change make install run serially
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
X-List-Received-Date: Thu, 25 Oct 2018 04:18:50 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

openssl offcially don't supprt parallel make install, and have
occasionally install fail problem for parallel build,
according to upstream suggestion, just make install serially.

refer:
https://github.com/openssl/openssl/issues/7466#issuecomment-432148137

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...nssl-let-make-install-stop-parallel-build.patch | 37 ++++++++++++++++++++++
 meta/recipes-connectivity/openssl/openssl_1.1.1.bb |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/0001-openssl-let-make-install-stop-parallel-build.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-openssl-let-make-install-stop-parallel-build.patch b/meta/recipes-connectivity/openssl/openssl/0001-openssl-let-make-install-stop-parallel-build.patch
new file mode 100644
index 0000000..0726d04
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/0001-openssl-let-make-install-stop-parallel-build.patch
@@ -0,0 +1,37 @@
+From adb36f6dadecf8775cf9603ee4745aed6ee20af1 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 25 Oct 2018 09:43:48 +0800
+Subject: [PATCH] openssl: let make install stop parallel build
+
+openssl offcially don't supprt parallel make install, and have 
+occasionally install fail problem for parallel build,
+according to upstream suggestion, just make install serially.
+
+refer:
+https://github.com/openssl/openssl/issues/7466#issuecomment-432148137
+
+Upstream-Status: Inappropriate[oe-specific]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ Configurations/unix-Makefile.tmpl | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/Configurations/unix-Makefile.tmpl b/Configurations/unix-Makefile.tmpl
+index 16af4d2..c8f60df 100644
+--- a/Configurations/unix-Makefile.tmpl
++++ b/Configurations/unix-Makefile.tmpl
+@@ -437,6 +437,10 @@ depend:
+ 
+ # Install helper targets #############################################
+ 
++ifneq ($(filter install,$(MAKECMDGOALS)),)
++.NOTPARALLEL:
++endif
++
+ install_sw: all install_dev install_engines install_runtime
+ 
+ uninstall_sw: uninstall_runtime uninstall_engines uninstall_dev
+-- 
+2.7.4
+
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1.bb
index af9038a..8330162 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1.bb
@@ -15,6 +15,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://run-ptest \
            file://openssl-c_rehash.sh \
            file://0001-skip-test_symbol_presence.patch \
+           file://0001-openssl-let-make-install-stop-parallel-build.patch \
            "
 
 SRC_URI_append_class-nativesdk = " \
-- 
2.7.4


