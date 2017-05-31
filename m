Return-Path: <andrej.valek@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 17AB478049
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 May 2017 12:55:34 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id v4VCtZhx028933
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 May 2017 14:55:35 +0200
Received: from dev.sbt.siemens.com ([139.16.117.186])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id v4VCtZuc004831;
	Wed, 31 May 2017 14:55:35 +0200
Received: from dev.sbt.siemens.com (localhost [127.0.0.1])
	by dev.sbt.siemens.com (Postfix) with ESMTP id B284B683E0A;
	Wed, 31 May 2017 14:55:35 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 May 2017 14:55:09 +0200
Message-Id: <1496235309-30694-1-git-send-email-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] srecord: add collection of tools for manipulating EPROM load files
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
X-List-Received-Date: Wed, 31 May 2017 12:55:35 -0000

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 .../srecord/files/add-option-to-remove-docs.patch  | 57 ++++++++++++++++++++++
 meta/recipes-support/srecord/srecord_1.64.bb       | 23 +++++++++
 2 files changed, 80 insertions(+)
 create mode 100644 meta/recipes-support/srecord/files/add-option-to-remove-docs.patch
 create mode 100644 meta/recipes-support/srecord/srecord_1.64.bb

diff --git a/meta/recipes-support/srecord/files/add-option-to-remove-docs.patch b/meta/recipes-support/srecord/files/add-option-to-remove-docs.patch
new file mode 100644
index 0000000..9b2bd99
--- /dev/null
+++ b/meta/recipes-support/srecord/files/add-option-to-remove-docs.patch
@@ -0,0 +1,57 @@
+Add option to build this utility without a documentation.
+
+For full documentation building are necessary utilities like
+groff and ps2pdf. Full documentation can takes a lot of space.
+So it can be disabled by overloading makefile variable WITHOUT_DOC.
+
+Upstream-Status: Inappropriate [Other]
+Workaround specific to our build system.
+
+Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
+
+diff --git a/Makefile.in b/Makefile.in
+index 9bdd8f1..a2b5494 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -141,6 +141,14 @@ GROFF = @GROFF@
+ #
+ SOELIM = @SOELIM@
+ 
++# Option to build this utility without building and installing the documentation.
++WITHOUT_DOC ?= 0
++ifeq ($(WITHOUT_DOC),0)
++	BUILD_DOC = all-doc
++	INST_DOC = install-doc
++	CLR_DOC = clean-doc
++endif
++
+ # ---------------------------------------------------------
+ # You should not need to change anything below this line.
+ 
+@@ -4090,7 +4098,7 @@ bin/test_url_decode: $(test_url_decode_obj) .bin srecord/libsrecord.la
+ 	$(LIBTOOL) --mode=link --tag=CXX $(CXX) $(CPPFLAGS) $(CXXFLAGS) -o $@ \
+ 		$(test_url_decode_obj) srecord/libsrecord.la $(LDFLAGS) $(LIBS)
+ 
+-all: all-bin all-doc
++all: all-bin $(BUILD_DOC)
+ 
+ all-bin: bin/srec_cat bin/srec_cmp bin/srec_info bin/test_arglex_ambiguous \
+ 		bin/test_crc16 bin/test_fletcher16 bin/test_gecos \
+@@ -4156,7 +4164,7 @@ test_files = t0001a t0002a t0003a t0004a t0005a t0006a t0007a t0008a t0009a \
+ sure: $(test_files)
+ 	@echo Passed All Tests
+ 
+-clean: clean-bin clean-doc clean-misc clean-obj
++clean: clean-bin $(CLR_DOC) clean-misc clean-obj
+ 
+ clean-bin:
+ 	rm -f bin/srec_cat bin/srec_cmp bin/srec_info bin/test_arglex_ambiguous
+@@ -4443,7 +4451,7 @@ distclean-directories:
+ 	rm -rf test/fletcher16/.libs test/gecos/.libs test/hyphen/.libs
+ 	rm -rf test/url_decode/.libs
+ 
+-install: install-bin install-doc install-include install-libdir install-man
++install: install-bin $(INST_DOC) install-include install-libdir install-man
+ 
+ install-bin: $(bindir)/srec_cat $(bindir)/srec_cmp $(bindir)/srec_info
+ 
diff --git a/meta/recipes-support/srecord/srecord_1.64.bb b/meta/recipes-support/srecord/srecord_1.64.bb
new file mode 100644
index 0000000..fe1af47
--- /dev/null
+++ b/meta/recipes-support/srecord/srecord_1.64.bb
@@ -0,0 +1,23 @@
+SUMMARY = "A collection of powerful tools for manipulating EPROM load files."
+SECTION = "devel"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8dfcbf2f0a144b97f0931b6394debea7"
+
+SRC_URI = " \
+    http://srecord.sourceforge.net/srecord-${PV}.tar.gz \
+    file://add-option-to-remove-docs.patch \
+"
+
+SRC_URI[md5sum] = "4de4a7497472d7972645c2af91313769"
+SRC_URI[sha256sum] = "49a4418733c508c03ad79a29e95acec9a2fbc4c7306131d2a8f5ef32012e67e2"
+
+DEPENDS = "libtool-native boost groff-native"
+
+inherit autotools-brokensep
+
+EXTRA_OECONF = "--without-gcrypt LIBTOOL=${STAGING_BINDIR_CROSS}/${HOST_SYS}-libtool"
+
+# Set variable WITHOUT_DOC=0 to enable documentation generation
+EXTRA_OEMAKE = "WITHOUT_DOC=1"
+
+BBCLASSEXTEND = "native"
-- 
2.1.4


