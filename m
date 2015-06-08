Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6A42F757A5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jun 2015 10:05:18 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 08 Jun 2015 03:05:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,573,1427785200"; d="scan'208";a="504700548"
Received: from ewishar1-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.30.184])
	by FMSMGA003.fm.intel.com with ESMTP; 08 Jun 2015 03:05:18 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Jun 2015 11:04:52 +0100
Message-Id: <1ac1c747182181bfb2a5f544df381f1644e46456.1433757846.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1433757846.git.paul.eggleton@linux.intel.com>
References: <cover.1433757846.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1433757846.git.paul.eggleton@linux.intel.com>
References: <cover.1433757846.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] python-smartpm: change "already installed" warnings into info messages
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
X-List-Received-Date: Mon, 08 Jun 2015 10:05:19 -0000

It's possible to trigger "already installed" messages during normal
usage if you explicitly install something in the image through
IMAGE_INSTALL that has a dependency on some -dev packages and also have
dev-pkgs in IMAGE_FEATURES. Since we now check the do_rootfs log for
warnings, these are reported as warnings at the build system level.
This situation should not trigger warnings, nor is it really cause for
concern under any other circumstance if the user asks smart to install
something that's already installed, so make it an info message rather
than a warning.

Fixes [YOCTO #7840].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../smart-already-installed-message.patch          | 54 ++++++++++++++++++++++
 .../python/python-smartpm_1.4.1.bb                 |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-already-installed-message.patch

diff --git a/meta/recipes-devtools/python/python-smartpm/smart-already-installed-message.patch b/meta/recipes-devtools/python/python-smartpm/smart-already-installed-message.patch
new file mode 100644
index 0000000..9055555
--- /dev/null
+++ b/meta/recipes-devtools/python/python-smartpm/smart-already-installed-message.patch
@@ -0,0 +1,54 @@
+From a74a9a9eb9d75964a0e978950e8b191d7a18d763 Mon Sep 17 00:00:00 2001
+From: Paul Eggleton <paul.eggleton@linux.intel.com>
+Date: Fri, 5 Jun 2015 17:07:16 +0100
+Subject: [PATCH] smart: change "is already installed" message from warning to
+ info
+
+This doesn't need to be a warning.
+
+Upstream-Status: Pending
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+---
+ smart/commands/install.py            | 4 ++--
+ smart/interfaces/text/interactive.py | 2 +-
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/smart/commands/install.py b/smart/commands/install.py
+index 6ef9682..80d456b 100644
+--- a/smart/commands/install.py
++++ b/smart/commands/install.py
+@@ -152,7 +152,7 @@ def main(ctrl, opts):
+             for obj in results:
+                 for pkg in obj.packages:
+                     if pkg.installed:
+-                        iface.warning(_("%s (for %s) is already installed")
++                        iface.info(_("%s (for %s) is already installed")
+                                       % (pkg, arg))
+                         installed = True
+                         break
+@@ -184,7 +184,7 @@ def main(ctrl, opts):
+         for name in names:
+             pkg = names[name][0]
+             if pkg.installed:
+-                iface.warning(_("%s is already installed") % pkg)
++                iface.info(_("%s is already installed") % pkg)
+             else:
+                 trans.enqueue(pkg, INSTALL)
+ 
+diff --git a/smart/interfaces/text/interactive.py b/smart/interfaces/text/interactive.py
+index 9865584..190867b 100644
+--- a/smart/interfaces/text/interactive.py
++++ b/smart/interfaces/text/interactive.py
+@@ -278,7 +278,7 @@ class Interpreter(Cmd):
+             for name in names:
+                 pkg = names[name][0]
+                 if pkg.installed:
+-                    iface.warning(_("%s is already installed") % pkg)
++                    iface.info(_("%s is already installed") % pkg)
+                 else:
+                     found = True
+                     transaction.enqueue(pkg, INSTALL)
+-- 
+2.1.0
+
diff --git a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
index c75f10f..69b94a2 100644
--- a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
+++ b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
@@ -34,6 +34,7 @@ SRC_URI = "\
           file://smart-filename-NAME_MAX.patch \
           file://smart-rpm4-fixes.patch \
           file://smart-add-for-rpm-ignoresize-check.patch \
+          file://smart-already-installed-message.patch \
          "
 
 SRC_URI[md5sum] = "573ef32ba177a6b3c4bf7ef04873fcb6"
-- 
2.1.0


