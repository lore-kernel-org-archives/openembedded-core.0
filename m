Return-Path: <kergoth@gmail.com>
Received: from mail-we0-f178.google.com (mail-we0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id 0D85B6DE45
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 18:07:19 +0000 (UTC)
Received: by mail-we0-f178.google.com with SMTP id u57so1464455wes.23
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 10:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=acOAS+jWDIDSnrGfeA3tRJRFgGAwcaBkSuLguWbpXpQ=;
	b=0Yh+mkZDC8/0QYWwT5wZPyto61jqsR2hJ4HYXMcZHK/SJXWDw91Nba2oiwEvugJ7i6
	8+tL7CnFr9vfCVkDeJC7SW9WKD3ggdquI4tCdC9sXtsMh2gGsmgj42Nt0LW80gaf8nfP
	SAB4RsbVK50LFDOyIZ+lkaMWWtHSZ3NsDUnugTBOxFt1UpAhGCZ5MHTCMNRodXLeKr3/
	/sBIEBaAbDLYXxyr2PWIBYb4yqg7XrnhmP73Df+dEQZ4QO9riKFQPWKRLhCtqfLWo4OZ
	TmnzTlotZJlOT7Y8yfubNDcRb5Pv8QWS4I7tFoQiUdvQVByNPVS4lWz0sVt5AMOOZEH6
	jSfA==
X-Received: by 10.194.47.236 with SMTP id g12mr60791wjn.92.1385575639292;
	Wed, 27 Nov 2013 10:07:19 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id w1sm37430090wib.6.2013.11.27.10.07.17
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 27 Nov 2013 10:07:18 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Nov 2013 11:07:03 -0700
Message-Id: <8f8accc6c39b277ac61d6779997291eb40a63703.1385575572.git.kergoth@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <cover.1385575572.git.kergoth@gmail.com>
References: <cover.1385575572.git.kergoth@gmail.com>
In-Reply-To: <cover.1385575572.git.kergoth@gmail.com>
References: <cover.1385575572.git.kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 3/7] python, python-native: fix PARALLEL_MAKEINST failure
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
X-List-Received-Date: Wed, 27 Nov 2013 18:07:20 -0000

From: Christopher Larson <chris_larson@mentor.com>

When using make -j with the 'install' target, it's possible for altbininstall
(which normally creates BINDIR) and libainstall (which doesn't, though it
installs python-config there) to race, resulting in a failure due to
attempting to install python-config into a nonexistent BINDIR. Ensure it also
exists in the libainstall target.

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta/recipes-devtools/python/python-native_2.7.3.bb   |  1 +
 .../python/parallel-makeinst-create-bindir.patch      | 19 +++++++++++++++++++
 meta/recipes-devtools/python/python_2.7.3.bb          |  1 +
 3 files changed, 21 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python/parallel-makeinst-create-bindir.patch

diff --git a/meta/recipes-devtools/python/python-native_2.7.3.bb b/meta/recipes-devtools/python/python-native_2.7.3.bb
index ef891b2..6b87a16 100644
--- a/meta/recipes-devtools/python/python-native_2.7.3.bb
+++ b/meta/recipes-devtools/python/python-native_2.7.3.bb
@@ -16,6 +16,7 @@ SRC_URI += "\
            file://multilib.patch \
            file://add-md5module-support.patch \
            file://builddir.patch \
+           file://parallel-makeinst-create-bindir.patch \
            "
 S = "${WORKDIR}/Python-${PV}"
 
diff --git a/meta/recipes-devtools/python/python/parallel-makeinst-create-bindir.patch b/meta/recipes-devtools/python/python/parallel-makeinst-create-bindir.patch
new file mode 100644
index 0000000..951cb46
--- /dev/null
+++ b/meta/recipes-devtools/python/python/parallel-makeinst-create-bindir.patch
@@ -0,0 +1,19 @@
+When using make -j with the 'install' target, it's possible for altbininstall
+(which normally creates BINDIR) and libainstall (which doesn't, though it
+installs python-config there) to race, resulting in a failure due to
+attempting to install python-config into a nonexistent BINDIR. Ensure it also
+exists in the libainstall target.
+
+Upstream-Status: Pending
+
+--- Python-2.7.3.orig/Makefile.pre.in
++++ Python-2.7.3/Makefile.pre.in
+@@ -1008,7 +1008,7 @@ LIBPL=		$(LIBP)/config
+ LIBPC=		$(LIBDIR)/pkgconfig
+
+ libainstall:	all python-config
+-	@for i in $(LIBDIR) $(LIBP) $(LIBPL) $(LIBPC); \
++	@for i in $(LIBDIR) $(LIBP) $(LIBPL) $(LIBPC) $(BINDIR); \
+	do \
+		if test ! -d $(DESTDIR)$$i; then \
+			echo "Creating directory $$i"; \
diff --git a/meta/recipes-devtools/python/python_2.7.3.bb b/meta/recipes-devtools/python/python_2.7.3.bb
index 887e02e..ff41122 100644
--- a/meta/recipes-devtools/python/python_2.7.3.bb
+++ b/meta/recipes-devtools/python/python_2.7.3.bb
@@ -32,6 +32,7 @@ SRC_URI += "\
   file://run-ptest \
   file://CVE-2013-4073_py27.patch \
   file://pypirc-secure.patch \
+  file://parallel-makeinst-create-bindir.patch \
 "
 
 S = "${WORKDIR}/Python-${PV}"
-- 
1.8.3.4


