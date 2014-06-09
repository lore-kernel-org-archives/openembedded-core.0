Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 515606BF85
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jun 2014 15:45:21 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 09 Jun 2014 08:40:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,1003,1392192000"; d="scan'208";a="554540681"
Received: from mmckenna-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.49])
	by orsmga002.jf.intel.com with ESMTP; 09 Jun 2014 08:45:21 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jun 2014 16:45:06 +0100
Message-Id: <c679ec81c19dd2b5e366b713801785ce0ba5b49a.1402328640.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1402328640.git.paul.eggleton@linux.intel.com>
References: <cover.1402328640.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1402328640.git.paul.eggleton@linux.intel.com>
References: <cover.1402328640.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] openssl: fix ptests
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
X-List-Received-Date: Mon, 09 Jun 2014 15:45:21 -0000

Add some missing dependencies and fix the Makefile in order to get most
of the ptest tests working (specifically test_bn, test_verify, test_cms,
test_srp and test_heartbeat). test_verify still fails for unknown
reasons (perhaps some of the now expired certificates weren't meant to
have expired as far as the test is concerned?) but at least it has the
certificates to run now.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-connectivity/openssl/openssl.inc      |  3 ++-
 .../openssl/openssl/ptest-deps.patch               | 30 ++++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.1h.bb |  1 +
 3 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/ptest-deps.patch

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index 6c86588..b839c00 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -47,7 +47,7 @@ FILES_${PN}-dev += "${base_libdir}/libcrypto${SOLIBSDEV}"
 FILES_openssl-conf = "${libdir}/ssl/openssl.cnf"
 CONFFILES_openssl-conf = "${libdir}/ssl/openssl.cnf"
 RRECOMMENDS_libcrypto += "openssl-conf"
-RDEPENDS_${PN}-ptest += "${PN}-misc make"
+RDEPENDS_${PN}-ptest += "${PN}-misc make perl perl-module-filehandle bc"
 
 do_configure_prepend_darwin () {
 	sed -i -e '/version-script=openssl\.ld/d' Configure
@@ -176,6 +176,7 @@ do_install () {
 
 do_install_ptest () {
 	cp -r Makefile test ${D}${PTEST_PATH}
+	cp -r certs ${D}${PTEST_PATH}
 	mkdir -p ${D}${PTEST_PATH}/apps
 	ln -sf /usr/lib/ssl/misc/CA.sh  ${D}${PTEST_PATH}/apps
 	ln -sf /usr/lib/ssl/openssl.cnf ${D}${PTEST_PATH}/apps
diff --git a/meta/recipes-connectivity/openssl/openssl/ptest-deps.patch b/meta/recipes-connectivity/openssl/openssl/ptest-deps.patch
new file mode 100644
index 0000000..527e10c
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/ptest-deps.patch
@@ -0,0 +1,30 @@
+Remove Makefile dependencies for test targets
+
+These are probably here because the executables aren't always built for
+other platforms (e.g. Windows); however we can safely assume they'll
+always be there. None of the other test targets have such dependencies
+and if we don't remove them, make tries to rebuild the executables and
+fails during run-ptest.
+
+Upstream-Status: Inappropriate [config]
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+diff --git a/test/Makefile b/test/Makefile
+index e6fcfb4..5ae043b 100644
+--- a/test/Makefile
++++ b/test/Makefile
+@@ -322,11 +322,11 @@ test_cms:
+ 	@echo "CMS consistency test"
+ 	$(PERL) cms-test.pl
+ 
+-test_srp: $(SRPTEST)$(EXE_EXT)
++test_srp:
+ 	@echo "Test SRP"
+ 	../util/shlib_wrap.sh ./srptest
+ 
+-test_heartbeat: $(HEARTBEATTEST)$(EXE_EXT)
++test_heartbeat:
+ 	../util/shlib_wrap.sh ./$(HEARTBEATTEST)
+ 
+ lint:
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.1h.bb b/meta/recipes-connectivity/openssl/openssl_1.0.1h.bb
index ebb1029..ddaaba8 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.1h.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.1h.bb
@@ -35,6 +35,7 @@ SRC_URI += "file://configure-targets.patch \
             file://openssl-fix-des.pod-error.patch \
             file://Makefiles-ptest.patch \
             file://heartbeat-test-private-api.patch \
+            file://ptest-deps.patch \
             file://run-ptest \
            "
 
-- 
1.9.3


