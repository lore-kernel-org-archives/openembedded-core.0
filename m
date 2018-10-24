Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 32308796E4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Oct 2018 03:30:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9O3TZhA023864
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2018 20:30:47 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Tue, 23 Oct 2018 20:30:37 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 24 Oct 2018 11:30:35 +0800
Message-ID: <1540351835-16861-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] openssl: fix occasionally install fail for parallel build
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
X-List-Received-Date: Wed, 24 Oct 2018 03:30:56 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

when do parallel build, like run "make install -j 48", openssl will do_install
failed with below error:
mv: cannot stat 'openssl/1.1.1-r0/image/usr/lib/libcrypto.so.1.1.new': No such file or directory
Makefile:318: recipe for target 'install_dev' failed

problem caused by target install_dev and target install_runtime, both installed
libcrypto.so.1.1, result in log:
*** Installing development files
...
install libcrypto.so.1.1 -> /var/tmp/foo/lib/libcrypto.so.1.1
link /var/tmp/foo/lib/libcrypto.so -> /var/tmp/foo/lib/libcrypto.so.1.1
...
*** Installing runtime files
install libcrypto.so.1.1 -> /var/tmp/foo/lib/libcrypto.so.1.1

command in install_dev and install_runtime will have parallel competition.

have create an issue to upstream:
https://github.com/openssl/openssl/issues/7466#issuecomment-432148137

but upstream won't support this condition, so use this fix as a workaround
to fix the problem.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...-occasionally-install-fail-for-parallel-b.patch | 55 ++++++++++++++++++++++
 meta/recipes-connectivity/openssl/openssl_1.1.1.bb |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/0001-openssl-fix-occasionally-install-fail-for-parallel-b.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-openssl-fix-occasionally-install-fail-for-parallel-b.patch b/meta/recipes-connectivity/openssl/openssl/0001-openssl-fix-occasionally-install-fail-for-parallel-b.patch
new file mode 100644
index 0000000..afb974b
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/0001-openssl-fix-occasionally-install-fail-for-parallel-b.patch
@@ -0,0 +1,55 @@
+From e5baebbf3273ed4f9618eac5b180219e42ffe8c7 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Wed, 24 Oct 2018 10:59:02 +0800
+Subject: [PATCH] openssl: fix occasionally install fail for parallel build
+
+when do parallel build, like run "make install -j 48", openssl will do_install
+failed with below error:
+mv: cannot stat 'openssl/1.1.1-r0/image/usr/lib/libcrypto.so.1.1.new': No such file or directory
+Makefile:318: recipe for target 'install_dev' failed
+
+problem caused by target install_dev and target install_runtime, both installed
+libcrypto.so.1.1, result in log:
+*** Installing development files
+...
+install libcrypto.so.1.1 -> /var/tmp/foo/lib/libcrypto.so.1.1
+link /var/tmp/foo/lib/libcrypto.so -> /var/tmp/foo/lib/libcrypto.so.1.1
+...
+*** Installing runtime files
+install libcrypto.so.1.1 -> /var/tmp/foo/lib/libcrypto.so.1.1
+
+command in install_dev and install_runtime will have parallel competition.
+
+have create an issue to upstream:
+https://github.com/openssl/openssl/issues/7466#issuecomment-432148137
+
+but upstream won't support this condition, so use this fix as a workaround
+to fix the problem.
+
+Upstream-Status: Pending
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ Configurations/unix-Makefile.tmpl | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/Configurations/unix-Makefile.tmpl b/Configurations/unix-Makefile.tmpl
+index 16af4d2..d4c7ae6 100644
+--- a/Configurations/unix-Makefile.tmpl
++++ b/Configurations/unix-Makefile.tmpl
+@@ -436,8 +436,10 @@ depend:
+ 	@: {- output_on() if $disabled{makedepend}; "" -}
+ 
+ # Install helper targets #############################################
+-
+-install_sw: all install_dev install_engines install_runtime
++intermediate: all install_dev install_engines
++install_sw:
++	@$(MAKE) intermediate
++	@$(MAKE) install_runtime
+ 
+ uninstall_sw: uninstall_runtime uninstall_engines uninstall_dev
+ 
+-- 
+2.7.4
+
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1.bb
index af9038a..dcfefb5 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1.bb
@@ -15,6 +15,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://run-ptest \
            file://openssl-c_rehash.sh \
            file://0001-skip-test_symbol_presence.patch \
+           file://0001-openssl-fix-occasionally-install-fail-for-parallel-b.patch \
            "
 
 SRC_URI_append_class-nativesdk = " \
-- 
2.7.4


