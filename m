Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5795874749
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Apr 2018 17:21:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w3NHLhRj009155
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Apr 2018 10:21:43 -0700
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 23 Apr 2018 10:21:42 -0700
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 23 Apr 2018 10:21:42 -0700
Message-ID: <20180423172142.74868-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [PATCH 1/1] python3-native: correctly invoke regen-importlib make target
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
X-List-Received-Date: Mon, 23 Apr 2018 17:21:43 -0000
Content-Type: text/plain

Redefiine regen-all in Makefile to invoke regen-importlib after
building other regen- targets.  Change the recipe to not build it
before regen-all.  This avoids trying to build it multiple times,
which can occasionally fail.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../python/python3-native_3.5.5.bb                 |  5 +++--
 .../python/python3/regen-all.patch                 | 25 ++++++++++++++++++++++
 2 files changed, 28 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3/regen-all.patch

diff --git a/meta/recipes-devtools/python/python3-native_3.5.5.bb b/meta/recipes-devtools/python/python3-native_3.5.5.bb
index 962ccfc..3098027 100644
--- a/meta/recipes-devtools/python/python3-native_3.5.5.bb
+++ b/meta/recipes-devtools/python/python3-native_3.5.5.bb
@@ -25,6 +25,7 @@ file://sysconfig.py-add-_PYTHON_PROJECT_SRC.patch \
 file://setup.py-check-cross_compiling-when-get-FLAGS.patch \
 file://0001-Do-not-use-the-shell-version-of-python-config-that-w.patch \
 file://support_SOURCE_DATE_EPOCH_in_py_compile.patch \
+file://regen-all.patch \
 "
 
 SRC_URI[md5sum] = "f3763edf9824d5d3a15f5f646083b6e0"
@@ -62,9 +63,9 @@ do_configure_append() {
 
 # Regenerate all of the generated files
 # This ensures that pgen and friends get created during the compile phase
+#
 do_compile_prepend() {
-    # Has to be done ahead of other regen- targets due to https://bugs.python.org/issue33080
-    oe_runmake regen-importlib
+    # Assuming https://bugs.python.org/issue33080 has been addressed in Makefile.
     oe_runmake regen-all
 }
 
diff --git a/meta/recipes-devtools/python/python3/regen-all.patch b/meta/recipes-devtools/python/python3/regen-all.patch
new file mode 100644
index 0000000..36b9d9d
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/regen-all.patch
@@ -0,0 +1,25 @@
+python3-native: run regen-importlib target correctly
+
+regen-importlib depends on other regen- targets, so we must be sure to
+run it after (most of) the others.  In reality, we do not need to run it
+at all since "make" will invoke it, if necessary.  We do not want to
+rely on that, though.
+
+Upstream-Status: Pending
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+
+
+--- a/Makefile.pre.in
++++ b/Makefile.pre.in
+@@ -709,7 +709,8 @@ regen-importlib: Programs/_freeze_import
+ ############################################################################
+ # Regenerate all generated files
+ 
+-regen-all: regen-opcode regen-opcode-targets regen-typeslots regen-grammar regen-ast regen-importlib
++regen-all: regen-opcode regen-opcode-targets regen-typeslots regen-grammar regen-ast
++	$(MAKE) regen-importlib
+ 
+ ############################################################################
+ # Special rules for object files
-- 
2.7.4


