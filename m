Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 299EA78C48
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 20:03:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id DBD541854B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 22:03:22 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id mawXbmA4yapB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 22:03:21 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id D8CCA1858B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 22:03:21 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C18B41A08C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 22:03:21 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B5E621A088
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 22:03:21 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 22:03:21 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id ABA82206D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 22:03:21 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id w6QK38M3032681
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 22:03:08 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id w6QK38rR032680
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2018 22:03:08 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jul 2018 22:02:58 +0200
Message-Id: <20180726200258.32625-2-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20180726200258.32625-1-pkj@axis.com>
References: <20180726200258.32625-1-pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 2/2] meson: Support building allarch recipes again
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
X-List-Received-Date: Thu, 26 Jul 2018 20:03:22 -0000

This registers "allarch" as a known CPU family.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

I do not know if there is an appropriate solution to pass upstream, 
but since the lack of a recognized CPU family is only a warning in
the official version, the consequence of not having an "allarch"
or similar CPU family is not as drastic there.

 meta/recipes-devtools/meson/meson.inc              |  1 +
 ...01-Support-building-allarch-recipes-again.patch | 28 ++++++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-devtools/meson/meson/0001-Support-building-allarch-recipes-again.patch

diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
index 5484a8585b..ca7088c409 100644
--- a/meta/recipes-devtools/meson/meson.inc
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -14,6 +14,7 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
            file://0001-Validate-cpu_family-3753.patch \
            file://0002-Make-CPU-family-warnings-fatal.patch \
            file://0003-Send-user-to-our-wiki-instead-of-Meson-bug-system.patch \
+           file://0001-Support-building-allarch-recipes-again.patch \
            "
 
 SRC_URI[md5sum] = "1698f6526574839de5dcdc45e3f7d582"
diff --git a/meta/recipes-devtools/meson/meson/0001-Support-building-allarch-recipes-again.patch b/meta/recipes-devtools/meson/meson/0001-Support-building-allarch-recipes-again.patch
new file mode 100644
index 0000000000..f6dd230916
--- /dev/null
+++ b/meta/recipes-devtools/meson/meson/0001-Support-building-allarch-recipes-again.patch
@@ -0,0 +1,28 @@
+From d80d02a3ca6e21fa3d055c88c05234c2eb4db128 Mon Sep 17 00:00:00 2001
+From: Peter Kjellerstedt <pkj@axis.com>
+Date: Thu, 26 Jul 2018 16:32:49 +0200
+Subject: [PATCH] Support building allarch recipes again
+
+This registers "allarch" as a known CPU family.
+
+Upstream-Status: Inappropriate [OE specific]
+Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
+---
+ mesonbuild/environment.py | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
+index a0580a2..712b1e8 100644
+--- a/mesonbuild/environment.py
++++ b/mesonbuild/environment.py
+@@ -73,6 +73,7 @@ from .compilers import (
+ build_filename = 'meson.build'
+ 
+ known_cpu_families = (
++    'allarch',
+     'aarch64',
+     'arm',
+     'e2k',
+-- 
+2.12.0
+
-- 
2.12.0


