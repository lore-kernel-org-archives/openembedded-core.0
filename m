Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 3556C6AC3E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 May 2015 14:37:08 +0000 (UTC)
Received: by wgyo15 with SMTP id o15so185546061wgy.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 May 2015 07:37:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=U5AR1fVySdDJE/IteIQ9d8pm6GNdVAXMnQULIAyXrZ4=;
	b=CBDT7U1BWYY3ySmGQPJZFhDrJ8MlVynHxQMfn+ik+BeXNySQFr5vB+tjVOVX7UFhGO
	LM0XP5WiM954xCipUl5R8bolbSXTI0lHFthuxHORvhKuLKSvxLzEP5uGIqIuwLTySpZW
	3HBBlBMkdqvnLOLrHqULu5mDVYcboo3PQLWXdgtZ8qTYX2OxI7QyR84ILHCiOoqskh41
	OT9a1YR8pv/xeKInWM4lU1FtDE7B6W9/ceda6WfV70SSvroukCKdbR0/zyRT6Rv1RQaA
	9raIwjg5VQVLWS7WMtDR3USXojS0d1V2v98qXWN6r4kLUMLIKjW7fH2TRs0NMHbdfWb/
	+Rpg==
X-Gm-Message-State: ALoCoQnrBw0sQagmflC+IHn57ttf/q/pPDVuZMV5+SaMVutHswJWSAusNiOuaOBw3qPsgLzFGWOF
X-Received: by 10.180.206.229 with SMTP id lr5mr4739600wic.86.1430836629250;
	Tue, 05 May 2015 07:37:09 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by mx.google.com with ESMTPSA id
	yr1sm25874536wjc.37.2015.05.05.07.37.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 05 May 2015 07:37:08 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 May 2015 15:33:15 +0100
Message-Id: <1430836395-4815-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] libarchive: fix out of tree builds
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
X-List-Received-Date: Tue, 05 May 2015 14:37:09 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../libarchive/libarchive/mkdir.patch              | 45 ++++++++++++++++++++++
 .../libarchive/libarchive_3.1.2.bb                 |  3 +-
 2 files changed, 47 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/mkdir.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/mkdir.patch b/meta/recipes-extended/libarchive/libarchive/mkdir.patch
new file mode 100644
index 0000000..509a295
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/mkdir.patch
@@ -0,0 +1,45 @@
+Add missing mkdir calls so that out-of-tree builds work.
+
+Upstream-Status: Submitted (https://github.com/libarchive/libarchive/pull/534)
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/Makefile.am b/Makefile.am
+index 3fa2d22..5ecca52 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -508,6 +508,7 @@ libarchive_test_LDADD= $(LTLIBICONV)
+ # Building it automatically provides a sanity-check on libarchive_test_SOURCES
+ # above.
+ libarchive/test/list.h: Makefile
++	$(MKDIR_P) libarchive/test
+ 	cat $(top_srcdir)/libarchive/test/test_*.c | grep DEFINE_TEST > libarchive/test/list.h
+ 
+ libarchive_TESTS_ENVIRONMENT= LIBARCHIVE_TEST_FILES=`cd $(top_srcdir);/bin/pwd`/libarchive/test LRZIP=NOCONFIG
+@@ -835,6 +836,7 @@ bsdtar_test_CPPFLAGS=\
+ 	$(PLATFORMCPPFLAGS)
+ 
+ tar/test/list.h: Makefile
++	$(MKDIR_P) tar/test
+ 	cat $(top_srcdir)/tar/test/test_*.c | grep DEFINE_TEST > tar/test/list.h
+ 
+ if BUILD_BSDTAR
+@@ -975,6 +977,7 @@ bsdcpio_test_CPPFLAGS= \
+ bsdcpio_test_LDADD=libarchive_fe.la
+ 
+ cpio/test/list.h: Makefile
++	$(MKDIR_P) cpio/test
+ 	cat $(top_srcdir)/cpio/test/test_*.c | grep DEFINE_TEST > cpio/test/list.h
+ 
+ if BUILD_BSDCPIO
+diff --git a/configure.ac b/configure.ac
+index 38bd299..7bdb00c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -102,6 +102,7 @@ AC_USE_SYSTEM_EXTENSIONS
+ AC_LIBTOOL_WIN32_DLL
+ AC_PROG_LIBTOOL
+ AC_CHECK_TOOL([STRIP],[strip])
++AC_PROG_MKDIR_P
+ 
+ #
+ # Options for building bsdtar.
diff --git a/meta/recipes-extended/libarchive/libarchive_3.1.2.bb b/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
index 75008c3..aaa3255 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
@@ -33,12 +33,13 @@ SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://libarchive-CVE-2013-0211.patch \
            file://pkgconfig.patch \
            file://0001-Add-ARCHIVE_EXTRACT_SECURE_NOABSOLUTEPATHS-option.patch \
+           file://mkdir.patch \
            "
 
 SRC_URI[md5sum] = "efad5a503f66329bb9d2f4308b5de98a"
 SRC_URI[sha256sum] = "eb87eacd8fe49e8d90c8fdc189813023ccc319c5e752b01fb6ad0cc7b2c53d5e"
 
-inherit autotools-brokensep lib_package pkgconfig
+inherit autotools lib_package pkgconfig
 
 CPPFLAGS += "-I${WORKDIR}/extra-includes"
 
-- 
2.1.4


