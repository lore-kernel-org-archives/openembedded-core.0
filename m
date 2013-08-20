Return-Path: <cazfi74@gmail.com>
Received: from mail-lb0-f177.google.com (mail-lb0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id 56FAC6B8C5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 19:57:07 +0000 (UTC)
Received: by mail-lb0-f177.google.com with SMTP id n6so817430lbi.22
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 12:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=kIX/0+DwX/6821fwq1QDyYGQEG4oYsOS9I3bokyw7Uw=;
	b=vtoZNlRE4NWWwOHt08hQPvXm2j/WYXhG9PkrTshmdpVMiaiKYV1tD25hzPPwgUORlN
	QrJhS0rl7nZIvujFsZG3I9s7be8WwpKa10hyeZ+UASIFhK0dk8ceHg7rR5POBYTigUaY
	aWg32PQaWNKX6EIiz4FOHV/U1A96excAWgDjNivj/DFLHqKd/Qg4TfjQn5dTYl6drwLq
	wpwGGFCDYxk2oNph97sLf1mA3sCcORacoLPgZ3iaMyDFVgKBcxz0BvTfbyZC1hUvM9ha
	GmOX851Q0t559cSsc+c+hRR2LragjAs6J9aoBcPZzBpS7OAVJ0WFJdMoEEMO14OP03FH
	TNaw==
X-Received: by 10.112.24.2 with SMTP id q2mr2946708lbf.34.1377028627224;
	Tue, 20 Aug 2013 12:57:07 -0700 (PDT)
Received: from prime (a91-153-14-158.elisa-laajakaista.fi. [91.153.14.158])
	by mx.google.com with ESMTPSA id k9sm1802501lbe.6.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 20 Aug 2013 12:57:06 -0700 (PDT)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1VBs36-00022A-Ow; Tue, 20 Aug 2013 22:57:04 +0300
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Aug 2013 22:57:00 +0300
Message-Id: <e6f02bafd1899fa77f4184c091598098030203ef.1376988152.git.cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <ecbb9d4e38ed43399b6155e2b7a71252dbb57a01.1376988152.git.cazfi74@gmail.com>
References: <ecbb9d4e38ed43399b6155e2b7a71252dbb57a01.1376988152.git.cazfi74@gmail.com>
In-Reply-To: <cover.1376988152.git.cazfi74@gmail.com>
References: <cover.1376988152.git.cazfi74@gmail.com>
Subject: [PATCH 2/2] gtk-engines: fix build with automake-1.13
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
X-List-Received-Date: Tue, 20 Aug 2013 19:57:07 -0000

Add patch substitute-tests.patch that works around automake
TESTS limitation.
See http://debbugs.gnu.org/cgi/bugreport.cgi?bug=13771.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../gtk-engines-2.20.2/substitute-tests.patch      |   37 ++++++++++++++++++++
 .../gtk-engines/gtk-engines_2.20.2.bb              |    5 ++-
 2 files changed, 39 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-gnome/gtk-engines/gtk-engines-2.20.2/substitute-tests.patch

diff --git a/meta/recipes-gnome/gtk-engines/gtk-engines-2.20.2/substitute-tests.patch b/meta/recipes-gnome/gtk-engines/gtk-engines-2.20.2/substitute-tests.patch
new file mode 100644
index 0000000..5c557ba
--- /dev/null
+++ b/meta/recipes-gnome/gtk-engines/gtk-engines-2.20.2/substitute-tests.patch
@@ -0,0 +1,37 @@
+Upstream-Status: Pending
+
+Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
+diff -Nurd gtk-engines-2.20.2/configure.ac gtk-engines-2.20.2/configure.ac
+--- gtk-engines-2.20.2/configure.ac	2010-10-01 15:42:37.000000000 +0300
++++ gtk-engines-2.20.2/configure.ac	2013-08-20 02:50:27.930510565 +0300
+@@ -166,6 +166,9 @@
+
+ AC_SUBST(DEVELOPMENT_CFLAGS)
+
++AC_SUBST([exported_symbols_tests], [[$(EXPORTED_SYMBOLS_TESTS)]])
++AC_SUBST([torture_test_tests], [[$(TORTURE_TEST_TESTS)]])
++
+ AM_CONFIG_HEADER([engines/support/config.h])
+
+ AC_CONFIG_FILES([
+diff -Nurd gtk-engines-2.20.2/test/Makefile.am gtk-engines-2.20.2/test/Makefile.am
+--- gtk-engines-2.20.2/test/Makefile.am	2010-09-19 18:18:21.000000000 +0300
++++ gtk-engines-2.20.2/test/Makefile.am	2013-08-20 02:50:36.842510865 +0300
+@@ -66,7 +66,7 @@
+ # Prefix with exported_
+ EXPORTED_SYMBOLS_TESTS = $(patsubst %,exported_%,$(BUILD_ENGINES))
+
+-TESTS += $(EXPORTED_SYMBOLS_TESTS)
++TESTS += @exported_symbols_tests@
+
+
+ #############################################################
+@@ -88,7 +88,7 @@
+ TORTURE_TEST_TESTS = torture_buildin $(patsubst %,torture_%,$(TORTURE_TEST_ENGINES))
+
+ # Add TORTURE_TEST_ENGINES to list of tests
+-TESTS += $(TORTURE_TEST_TESTS)
++TESTS += @torture_test_tests@
+
+ # Possible other tests:
+ #  - An extensive theme switch tests that loads/unloads the engine
diff --git a/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb b/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
index 32d7be4..401e76c 100644
--- a/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
+++ b/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
@@ -8,8 +8,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
 SECTION = "x11/base"
 DEPENDS = "gtk+"
 
-PR = "r3"
-
 PACKAGES_DYNAMIC += "^gtk-engine-.* ^gtk-theme-.*"
 
 RDEPENDS_gtk-theme-redmond = "gtk-engine-redmond95"
@@ -37,6 +35,7 @@ python populate_packages_prepend() {
     # TODO: mark theme packages as arch all
 }
 
-SRC_URI += "file://glib-2.32.patch"
+SRC_URI += "file://glib-2.32.patch \
+            file://substitute-tests.patch"
 SRC_URI[archive.md5sum] = "5deb287bc6075dc21812130604c7dc4f"
 SRC_URI[archive.sha256sum] = "15b680abca6c773ecb85253521fa100dd3b8549befeecc7595b10209d62d66b5"
-- 
1.7.10.4


