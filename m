Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id C12767DE7D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 20:01:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44znRh1Rwnz7P
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 22:01:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557345696;
	bh=A3Wl7Y3EoC8U66i41eqgtg7IG9h5SMfcDggJk2OOkeo=;
	h=From:To:Subject:Date:From;
	b=K7SwY0h4lDgsJZJQ6Pvbhn8t7UpkWj82w5liVm5yEMo6VvHahJSj/6zDnNEuTWBqN
	iIA9G/8jMCte575VMYmH41u6KENFl09wJStjHy9DkdYA+MlL4Pk5KNIGlxOyRQUMlx
	OSHoTB/0qtOND9o6ht2sa1j50ycA60K3vvPAhjv9s7rncWoECkA+2ZulWGcEhlkD0Q
	I+TiZ7JTmS/5xBgFSGkgjsvdxBOKnTfXiiqDx42q+MHjbjS/ICQUL/RU0J3GAVJJT+
	wce3XYFKiK4nTGcKxwfOjOfb8e/aifp/CEiAuwPLTtL2cihmaMjZBATfY30Vh1MN8s
	ENZBj3SBjn82QBNvnn/lVFNYUyvSvuqsxe0T9ya1PyxBuTEGaSu9yI4kobR0Lwh3Sf
	Ibb1+N9Rs+N8GFSJ5fYwG+4B11aFUwGolj1ObJiv9EPPFo0+FJW5Zm/dj5F8HFMvMc
	Gv8bJE2P2JoP8ObgLmiyA7cbleFQoELkFyBhFcIHa5miVC2AR59+alQwsPtMshpqTD
	Y7gfFg6ZyuDb4VFWuOG0pbOZrFMiP9ibollrlrPk1z49U69Rfd3ZHiTlBsZEqyj/Yb
	NZoHxcEUk5scU55B2+g1WIwwQCUpuocQUr4DKx7n5GXR6YOzDgweCUdrixBg4AreBV
	3PfaojuDOiCqlPi/Dd2t7lQ0=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 May 2019 23:01:34 +0300
Message-Id: <20190508200134.28907-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH v2] ofono: upgrade 1.25 -> 1.29
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
X-List-Received-Date: Wed, 08 May 2019 20:01:36 -0000

Remove patch applied upstream.
Fix a new parallel build failure.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...a-race-condition-where-ell-ell.h-was.patch | 28 +++++++++++++++++++
 .../ofono/ofono/use-python3.patch             | 27 ------------------
 meta/recipes-connectivity/ofono/ofono_1.25.bb |  9 ------
 meta/recipes-connectivity/ofono/ofono_1.29.bb |  9 ++++++
 4 files changed, 37 insertions(+), 36 deletions(-)
 create mode 100644 meta/recipes-connectivity/ofono/ofono/0001-Makefile.am-Fix-a-race-condition-where-ell-ell.h-was.patch
 delete mode 100644 meta/recipes-connectivity/ofono/ofono/use-python3.patch
 delete mode 100644 meta/recipes-connectivity/ofono/ofono_1.25.bb
 create mode 100644 meta/recipes-connectivity/ofono/ofono_1.29.bb

diff --git a/meta/recipes-connectivity/ofono/ofono/0001-Makefile.am-Fix-a-race-condition-where-ell-ell.h-was.patch b/meta/recipes-connectivity/ofono/ofono/0001-Makefile.am-Fix-a-race-condition-where-ell-ell.h-was.patch
new file mode 100644
index 0000000000..1dfc977add
--- /dev/null
+++ b/meta/recipes-connectivity/ofono/ofono/0001-Makefile.am-Fix-a-race-condition-where-ell-ell.h-was.patch
@@ -0,0 +1,28 @@
+From 61c78979eab39ead47a91aeacad43ad72d162052 Mon Sep 17 00:00:00 2001
+From: Adrian Bunk <bunk@kernel.org>
+Date: Wed, 8 May 2019 21:58:44 +0300
+Subject: Makefile.am: Fix a race condition where ell/ell.h was written before
+ ell/ existed
+
+Signed-off-by: Adrian Bunk <bunk@kernel.org>
+Upstream-Status: Pending
+
+---
+ Makefile.am | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Makefile.am b/Makefile.am
+index a569c4a3..d2e310d5 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1107,6 +1107,7 @@ ell/internal: Makefile
+ 	done > $@
+ 
+ ell/ell.h: Makefile
++	$(AM_V_at)$(MKDIR_P) ell
+ 	$(AM_V_at)echo -n > $@
+ 	$(AM_V_GEN)for f in $(ell_headers) ; do \
+ 		echo "#include <$$f>" >> $@ ; \
+-- 
+2.20.1
+
diff --git a/meta/recipes-connectivity/ofono/ofono/use-python3.patch b/meta/recipes-connectivity/ofono/ofono/use-python3.patch
deleted file mode 100644
index 7b84075257..0000000000
--- a/meta/recipes-connectivity/ofono/ofono/use-python3.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-set-ddr should use Python3 like all the other tests.
-
-Upstream-Status: Submitted
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 17b69cd1da4c5c5f732acb38ca1602446c567ee7 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Mon, 29 Jan 2018 11:31:25 +0000
-Subject: [PATCH] test/setddr: use Python 3
-
-All the other tests use Python 3, so this should to.
----
- test/set-ddr | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/test/set-ddr b/test/set-ddr
-index 5d061b95..33631f31 100755
---- a/test/set-ddr
-+++ b/test/set-ddr
-@@ -1,4 +1,4 @@
--#!/usr/bin/python
-+#!/usr/bin/python3
- 
- import sys
- import dbus
--- 
-2.11.0
diff --git a/meta/recipes-connectivity/ofono/ofono_1.25.bb b/meta/recipes-connectivity/ofono/ofono_1.25.bb
deleted file mode 100644
index 3688b9d2fc..0000000000
--- a/meta/recipes-connectivity/ofono/ofono_1.25.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require ofono.inc
-
-SRC_URI  = "\
-  ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
-  file://ofono \
-  file://use-python3.patch \
-"
-SRC_URI[md5sum] = "31450cabdd8dbbf3f808ea2f2f066863"
-SRC_URI[sha256sum] = "eb011fcd3080e93f3a56f96be60350b6595a8b5f36b61646312ba41b0bcb0d75"
diff --git a/meta/recipes-connectivity/ofono/ofono_1.29.bb b/meta/recipes-connectivity/ofono/ofono_1.29.bb
new file mode 100644
index 0000000000..8539aa1372
--- /dev/null
+++ b/meta/recipes-connectivity/ofono/ofono_1.29.bb
@@ -0,0 +1,9 @@
+require ofono.inc
+
+SRC_URI  = "\
+  ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
+  file://ofono \
+  file://0001-Makefile.am-Fix-a-race-condition-where-ell-ell.h-was.patch \
+"
+SRC_URI[md5sum] = "4fa0372630ff03f223452e4d05efa8f8"
+SRC_URI[sha256sum] = "67f0f8e5740dea5b46309e40667d1e560be39c90ef08dd01ff9e9ce8e61f0679"
-- 
2.17.1


