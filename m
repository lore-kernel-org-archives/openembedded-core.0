Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id BE1387DE77
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 08:56:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 454QJj2Ccpz7P
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 10:56:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557996997;
	bh=plDVzu9kPVHAiW9fQDthYwIE0uO9ydAgBXoWr1KFE3g=;
	h=From:To:Subject:Date:From;
	b=paFMHxNXmDNj/R4vIHxXL8YY//omaJ7OR2EW+2EaMvzI9q2PBFnXsWOttIVchCTuE
	MkPwMmZxjhgrIxdPE35ixOlp33ffim3AeNoSpffpaN1Dl6gu5Pl5Mmcpf9huRa/NvJ
	H7YIWEAFmAJ+tJZfuszgYQG1vPSgvupVUfDjwpHnKgYjzKXGbwhBGP7YOtr4KWi81Y
	0h9At6IOvIvnjj58mQHBKYaU2Wl+wmQGsJp9+DysKARaUd032RRoPD2kHyOpco0hVy
	ydPcjXXV3hF2LcEMSjgm/BdxVPd1DcBg9gFxY1JQYBmRBE8DnQS2J60o4ApjOoF7ap
	Aogw6RQ5gjOUFbYbuNRoTz5PUYyeij3nx7Y2Ru3bg+MJHxp7OBfc2HUb/NbYqCsq4V
	2sU8bxGh7Jh2DVg5/EJtFKJrH0V0+5zZ8sGwG1ql7/HF2gL1jO8pCHCV0LV86rf31b
	XA9lioN2z6cEPLGDMiJGFzcc//j8YkBD/vhwyoSlo6leVs4+94Qf8FMKlvgLnpeIVg
	zBiP0tIip43RjjUqz6KA8T5HSK10v64VvXE1A4NvP4PgFx6wC0XourKLFqkbyTBF3E
	eukSlQIEa7ilN23HfiCdRV9iXVIVxzSeKYYqzcssTBB4ofLsqsxX3g2RPmZgTbfkdq
	4WcI4XO7Lh3THxOQQ7B4NWLk=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 May 2019 11:56:36 +0300
Message-Id: <20190516085636.9992-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH v3] ofono: upgrade 1.25 -> 1.29
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
X-List-Received-Date: Thu, 16 May 2019 08:56:38 -0000

Remove patch applied upstream.
Backport two fixes for build failures

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
v3: Another buildfix backported.
---
 ...Add-check-for-explicit_bzero-support.patch | 27 ++++++++++++++++++
 .../0001-build-Fix-a-race-condition.patch     | 28 +++++++++++++++++++
 .../ofono/ofono/use-python3.patch             | 27 ------------------
 meta/recipes-connectivity/ofono/ofono_1.25.bb |  9 ------
 meta/recipes-connectivity/ofono/ofono_1.29.bb | 10 +++++++
 5 files changed, 65 insertions(+), 36 deletions(-)
 create mode 100644 meta/recipes-connectivity/ofono/ofono/0001-build-Add-check-for-explicit_bzero-support.patch
 create mode 100644 meta/recipes-connectivity/ofono/ofono/0001-build-Fix-a-race-condition.patch
 delete mode 100644 meta/recipes-connectivity/ofono/ofono/use-python3.patch
 delete mode 100644 meta/recipes-connectivity/ofono/ofono_1.25.bb
 create mode 100644 meta/recipes-connectivity/ofono/ofono_1.29.bb

diff --git a/meta/recipes-connectivity/ofono/ofono/0001-build-Add-check-for-explicit_bzero-support.patch b/meta/recipes-connectivity/ofono/ofono/0001-build-Add-check-for-explicit_bzero-support.patch
new file mode 100644
index 0000000000..4676bb7668
--- /dev/null
+++ b/meta/recipes-connectivity/ofono/ofono/0001-build-Add-check-for-explicit_bzero-support.patch
@@ -0,0 +1,27 @@
+From dff595671bf5a46f7c9231966a6cd7d2a0183076 Mon Sep 17 00:00:00 2001
+From: Marcel Holtmann <marcel@holtmann.org>
+Date: Wed, 15 May 2019 09:39:44 +0200
+Subject: build: Add check for explicit_bzero support
+
+Upstream-Status: Backport
+Signed-off-by: Adrian Bunk <bunk@stusta.de>
+---
+ configure.ac | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index bacb7ac5..cad35c5d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -54,6 +54,8 @@ AC_ARG_ENABLE(pie, AC_HELP_STRING([--enable-pie],
+ 	fi
+ ])
+ 
++AC_CHECK_FUNCS(explicit_bzero)
++
+ AC_CHECK_FUNC(signalfd, dummy=yes,
+ 			AC_MSG_ERROR(signalfd support is required))
+ 
+-- 
+2.20.1
+
diff --git a/meta/recipes-connectivity/ofono/ofono/0001-build-Fix-a-race-condition.patch b/meta/recipes-connectivity/ofono/ofono/0001-build-Fix-a-race-condition.patch
new file mode 100644
index 0000000000..2e2aa88265
--- /dev/null
+++ b/meta/recipes-connectivity/ofono/ofono/0001-build-Fix-a-race-condition.patch
@@ -0,0 +1,28 @@
+From 3e43e3342f3fada1624a28500a5337019fed7d89 Mon Sep 17 00:00:00 2001
+From: Adrian Bunk <bunk@kernel.org>
+Date: Thu, 9 May 2019 12:19:51 +0300
+Subject: build: Fix a race condition
+
+ell/ell.h was written before ell/ existed
+
+Upstream-Status: Backport
+Signed-off-by: Adrian Bunk <bunk@stusta.de>
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
index 0000000000..a22b99a728
--- /dev/null
+++ b/meta/recipes-connectivity/ofono/ofono_1.29.bb
@@ -0,0 +1,10 @@
+require ofono.inc
+
+SRC_URI  = "\
+  ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
+  file://ofono \
+  file://0001-build-Fix-a-race-condition.patch \
+  file://0001-build-Add-check-for-explicit_bzero-support.patch \
+"
+SRC_URI[md5sum] = "4fa0372630ff03f223452e4d05efa8f8"
+SRC_URI[sha256sum] = "67f0f8e5740dea5b46309e40667d1e560be39c90ef08dd01ff9e9ce8e61f0679"
-- 
2.17.1


