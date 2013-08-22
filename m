Return-Path: <cazfi74@gmail.com>
Received: from mail-lb0-f181.google.com (mail-lb0-f181.google.com
	[209.85.217.181])
	by mail.openembedded.org (Postfix) with ESMTP id EFA1C6B426
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 21:37:32 +0000 (UTC)
Received: by mail-lb0-f181.google.com with SMTP id u12so1944953lbd.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 14:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=xJcgOCp+A5ocKO9ixXtqMsVP8FwFqeJquKE0BZUIv9Q=;
	b=ocjvCimb93NDLLBJDlGP4zFRv0EZRdHb7A/jH1x3YRmXeK810PzcqIQNEX+MR5GVRb
	5mkOAZSNlNQPdGO0CBHy90IEYFcFxf8/GsT1e/L3AG4TRWpvy5QcY4teatRV8kFadur3
	eSd2rN8d1Zmd9IUIeGxY+K+SOpr/i+TLBD4VhKaUv62kcWZTMESGs0bD2B2QULu9Lk9E
	BPcRcCw5kkbkKZrtjsrzDgC8t7Z1YVZSCXQ/stpBv8MgtBGOkG6h9dp4R65G5mZ3+VR3
	DRcA/fpjDVKNWPFDnYqC5Ir5x2RK5ZE4Kw5w8bBSPhdLn3EPTMvrGJc/sKqdXCaErErE
	JVXg==
X-Received: by 10.112.18.232 with SMTP id z8mr13128460lbd.23.1377207452759;
	Thu, 22 Aug 2013 14:37:32 -0700 (PDT)
Received: from prime (a91-153-14-158.elisa-laajakaista.fi. [91.153.14.158])
	by mx.google.com with ESMTPSA id k6sm5519555lae.9.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 22 Aug 2013 14:37:32 -0700 (PDT)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1VCcZO-0002kl-A2; Fri, 23 Aug 2013 00:37:30 +0300
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2013 00:37:28 +0300
Message-Id: <fdbdadc72d3c6c1ef1feb0602d9f16dce3645a33.1377207091.git.cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1377207091.git.cazfi74@gmail.com>
References: <cover.1377207091.git.cazfi74@gmail.com>
Subject: [PATCH 1/2] gtk-engines: fix build with automake-1.13
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
X-List-Received-Date: Thu, 22 Aug 2013 21:37:33 -0000

Add patch substitute-tests.patch that works around automake
TESTS limitation.
See http://debbugs.gnu.org/cgi/bugreport.cgi?bug=13771.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../gtk-engines-2.20.2/substitute-tests.patch      |   37 ++++++++++++++++++++
 .../gtk-engines/gtk-engines_2.20.2.bb              |    3 +-
 2 files changed, 39 insertions(+), 1 deletion(-)
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
index 32d7be4..f899307 100644
--- a/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
+++ b/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
@@ -37,6 +37,7 @@ python populate_packages_prepend() {
     # TODO: mark theme packages as arch all
 }
 
-SRC_URI += "file://glib-2.32.patch"
+SRC_URI += "file://glib-2.32.patch \
+            file://substitute-tests.patch"
 SRC_URI[archive.md5sum] = "5deb287bc6075dc21812130604c7dc4f"
 SRC_URI[archive.sha256sum] = "15b680abca6c773ecb85253521fa100dd3b8549befeecc7595b10209d62d66b5"
-- 
1.7.10.4


