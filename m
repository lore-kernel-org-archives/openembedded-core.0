Return-Path: <Tudor.Florea@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 6B31C6B1EC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2013 23:56:18 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.2.318.1;
	Thu, 18 Jul 2013 01:56:17 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4200)	id ED04A288C5A;
	Thu, 18 Jul 2013 01:56:16 +0200 (CEST)
From: Tudor Florea <tudor.florea@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 18 Jul 2013 01:56:11 +0200
Message-ID: <1374105371-28913-1-git-send-email-tudor.florea@enea.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: tudor.florea@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH] kmod: add ptest
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
X-List-Received-Date: Wed, 17 Jul 2013 23:56:19 -0000
Content-Type: text/plain

Install kmod test suite and run it as ptest.

Signed-off-by: Tudor Florea <tudor.florea@enea.com>
---
 meta/recipes-kernel/kmod/kmod.inc         |    4 +++-
 meta/recipes-kernel/kmod/kmod/ptest.patch |   20 ++++++++++++++++++++
 meta/recipes-kernel/kmod/kmod/run-ptest   |    5 +++++
 meta/recipes-kernel/kmod/kmod_git.bb      |    9 +++++++++
 4 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/kmod/kmod/ptest.patch
 create mode 100755 meta/recipes-kernel/kmod/kmod/run-ptest

diff --git a/meta/recipes-kernel/kmod/kmod.inc b/meta/recipes-kernel/kmod/kmod.inc
index 3cd963f..a780b6c 100644
--- a/meta/recipes-kernel/kmod/kmod.inc
+++ b/meta/recipes-kernel/kmod/kmod.inc
@@ -15,11 +15,13 @@ DEPENDS += "pkgconfig-native"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://libkmod/COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                    "
-inherit autotools gtk-doc
+inherit autotools gtk-doc ptest
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git \
            file://depmod-search.conf \
            file://0001-man-disable-man-page-generation-because-we-don-t-hav.patch \
+           file://run-ptest \
+           file://ptest.patch \
           "
 
 SRCREV = "62081c0f68905b22f375156d4532fd37fa5c8d33"
diff --git a/meta/recipes-kernel/kmod/kmod/ptest.patch b/meta/recipes-kernel/kmod/kmod/ptest.patch
new file mode 100644
index 0000000..8f3355f
--- /dev/null
+++ b/meta/recipes-kernel/kmod/kmod/ptest.patch
@@ -0,0 +1,20 @@
+diff -ruN a/Makefile.am b/Makefile.am
+--- a/Makefile.am	2013-07-12 17:11:05.278331557 +0200
++++ b/Makefile.am	2013-07-12 17:14:27.033788016 +0200
+@@ -204,6 +204,16 @@
+ 
+ distclean-local: $(DISTCLEAN_LOCAL_HOOKS)
+ 
++install-ptest:
++	@$(MKDIR_P) $(DESTDIR)/testsuite
++	@for file in $(TESTSUITE); do \
++		install $$file $(DESTDIR)/testsuite; \
++	done;
++	@cp Makefile $(DESTDIR)
++	@sed -i 's/^Makefile/_Makefile/'  ${DESTDIR}/Makefile
++	@tar -czf $(DESTDIR)/tools.tgz $(noinst_SCRIPTS) $(noinst_PROGRAMS)
++	@tar -C testsuite -czf $(DESTDIR)/testsuite.tgz rootfs-pristine .libs
++
+ # ------------------------------------------------------------------------------
+ # custom release helpers
+ # ------------------------------------------------------------------------------
diff --git a/meta/recipes-kernel/kmod/kmod/run-ptest b/meta/recipes-kernel/kmod/kmod/run-ptest
new file mode 100755
index 0000000..fac24fd
--- /dev/null
+++ b/meta/recipes-kernel/kmod/kmod/run-ptest
@@ -0,0 +1,5 @@
+#!/bin/sh
+tar -xzf tools.tgz
+tar -C testsuite -xzf testsuite.tgz
+make rootfs
+make -k runtest-TESTS 2>/dev/null| grep -e ^PASS -e ^FAIL
diff --git a/meta/recipes-kernel/kmod/kmod_git.bb b/meta/recipes-kernel/kmod/kmod_git.bb
index ca6b004..cb7a131 100644
--- a/meta/recipes-kernel/kmod/kmod_git.bb
+++ b/meta/recipes-kernel/kmod/kmod_git.bb
@@ -36,6 +36,15 @@ do_install_append () {
         install -Dm644 "${WORKDIR}/depmod-search.conf" "${D}${base_libdir}/depmod.d/search.conf"
 }
 
+do_compile_prepend() {
+            sed -i 's/ac_pwd=/#ac_pwd=/' config.status ; sed -i "/#ac_pwd=/a\ac_pwd='.'" config.status
+}
+
+do_compile_ptest () {
+        oe_runmake buildtest-TESTS
+        oe_runmake rootfs
+}
+
 inherit update-alternatives
 
 ALTERNATIVE_PRIORITY = "60"
-- 
1.7.10.4


