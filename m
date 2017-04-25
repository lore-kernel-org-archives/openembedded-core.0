Return-Path: <andrej.valek@siemens.com>
Received: from thoth.sbs.de (unknown [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id C7E7A72F3A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Apr 2017 06:12:06 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id v3P6C1JS006238
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Apr 2017 08:12:01 +0200
Received: from dev.sbt.siemens.com ([163.242.52.173])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id v3P6C1KN018278;
	Tue, 25 Apr 2017 08:12:01 +0200
Received: from dev.sbt.siemens.com (localhost [127.0.0.1])
	by dev.sbt.siemens.com (Postfix) with ESMTP id EFA233E73;
	Tue, 25 Apr 2017 08:12:00 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Apr 2017 08:11:48 +0200
Message-Id: <1493100708-26425-1-git-send-email-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1493034871-24823-1-git-send-email-andrej.valek@siemens.com>
References: <1493034871-24823-1-git-send-email-andrej.valek@siemens.com>
Subject: [PATCH v2] libevent: 2.0.22 -> 2.1.8
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
X-List-Received-Date: Tue, 25 Apr 2017 06:12:08 -0000

Update libevent to version 2.1.8 and fix test directory creation

License file has been changed due to new MIT license in source code.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 .../libevent/Makefile-missing-test-dir.patch       | 27 ++++++++++++++++++++++
 .../{libevent_2.0.22.bb => libevent_2.1.8.bb}      | 15 ++++++------
 2 files changed, 35 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-support/libevent/libevent/Makefile-missing-test-dir.patch
 rename meta/recipes-support/libevent/{libevent_2.0.22.bb => libevent_2.1.8.bb} (56%)

diff --git a/meta/recipes-support/libevent/libevent/Makefile-missing-test-dir.patch b/meta/recipes-support/libevent/libevent/Makefile-missing-test-dir.patch
new file mode 100644
index 0000000..8880bd0
--- /dev/null
+++ b/meta/recipes-support/libevent/libevent/Makefile-missing-test-dir.patch
@@ -0,0 +1,27 @@
+Fix missing test directory creation.
+
+GCC used in OE-core has "dependency tracking" disabled and
+libevent has problem with this.
+Due to removed makefile.am/in files in test/sample/include
+directories, output directories are not created in
+configuration step. Compilation step will fails, when
+trying to write to non-existing directory.
+
+Upstream-Status: Inappropriate [Other]
+Workaround specific to our build system.
+
+Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
+Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
+
+diff --git a/libevent-2.1.8-stable/test/include.am b/libevent-2.1.8-stable/test/include.am
+index eea249f..d323dff 100644
+--- a/test/include.am
++++ b/test/include.am
+@@ -161,6 +161,7 @@ test_bench_httpclient_LDADD = $(LIBEVENT_GC_SECTIONS) libevent_core.la
+ test/regress.gen.c test/regress.gen.h: test/rpcgen-attempted
+ 
+ test/rpcgen-attempted: test/regress.rpc event_rpcgen.py test/rpcgen_wrapper.sh
++	@$(MKDIR_P) test
+ 	$(AM_V_GEN)date -u > $@
+ 	$(AM_V_at)if $(srcdir)/test/rpcgen_wrapper.sh $(srcdir)/test; then \
+ 	   true; \
diff --git a/meta/recipes-support/libevent/libevent_2.0.22.bb b/meta/recipes-support/libevent/libevent_2.1.8.bb
similarity index 56%
rename from meta/recipes-support/libevent/libevent_2.0.22.bb
rename to meta/recipes-support/libevent/libevent_2.1.8.bb
index df8a31c..1270d62 100644
--- a/meta/recipes-support/libevent/libevent_2.0.22.bb
+++ b/meta/recipes-support/libevent/libevent_2.1.8.bb
@@ -1,18 +1,19 @@
 SUMMARY = "An asynchronous event notification library"
 HOMEPAGE = "http://libevent.org/"
-BUGTRACKER = "http://sourceforge.net/tracker/?group_id=50884&atid=461322"
+BUGTRACKER = "https://github.com/libevent/libevent/issues"
 SECTION = "libs"
 
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=45c5316ff684bcfe2f9f86d8b1279559"
+LICENSE = "BSD & MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=17f20574c0b154d12236d5fbe964f549"
 
 SRC_URI = " \
-    ${SOURCEFORGE_MIRROR}/levent/${BP}-stable.tar.gz \
+    https://github.com/libevent/libevent/releases/download/release-${PV}-stable/${BP}-stable.tar.gz \
+    file://Makefile-missing-test-dir.patch \
     file://run-ptest \
 "
 
-SRC_URI[md5sum] = "c4c56f986aa985677ca1db89630a2e11"
-SRC_URI[sha256sum] = "71c2c49f0adadacfdbe6332a372c38cf9c8b7895bb73dabeaa53cdcc1d4e1fa3"
+SRC_URI[md5sum] = "f3eeaed018542963b7d2416ef1135ecc"
+SRC_URI[sha256sum] = "965cc5a8bb46ce4199a47e9b2c9e1cae3b137e8356ffdad6d94d3b9069b71dc2"
 
 UPSTREAM_CHECK_URI = "http://libevent.org/"
 
@@ -24,7 +25,7 @@ PACKAGECONFIG[openssl] = "--enable-openssl,--disable-openssl,openssl"
 inherit autotools
 
 # Needed for Debian packaging
-LEAD_SONAME = "libevent-2.0.so"
+LEAD_SONAME = "libevent-2.1.so"
 
 inherit ptest
 
-- 
2.1.4


