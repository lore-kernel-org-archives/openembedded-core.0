Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 2C1976B1A0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2013 11:18:15 +0000 (UTC)
Received: by mail-wg0-f49.google.com with SMTP id y10so226659wgg.28
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Aug 2013 04:18:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=12iRdZQsvGFd+dflfqa5mKBhpZwfFBlW/p2+zubqRyQ=;
	b=R7pvEZdrm/Tg695dDqqUc+ID3BGdyJ7SUfJqZSHZxE+UgdajcpWmE+cGre+GTJoAVR
	rLvbmZUxYoFM90qHURyupz059q/joDyui11jLsrS/RCZl4x1D2Jy01ZhwNplKStmB4xR
	aGRCv74ipANnaYlPzpkneChmvY+pIpHP5i9P9wMkErMbrrw7hCoKJ3UuqlN09YaDmDic
	v4XkRMW3DOms+pFSG5jaHiFjgFT80OURZedalb9ZDTeFfldrdEZw6OFbNr0tnGhUx/RO
	pq8ziP84gASc9ExItrnlEv21O0L1IJXJiwajWbQsXkqapt7RkyxQP/bMxU+HeHxy7nEG
	7wqg==
X-Gm-Message-State: ALoCoQlYo4apm4J5fvmIKWSlWuMuyvxjngbuMZuPWwMdoLqT8XVs/sxcMtEC2/89g6bZr98lSAlt
X-Received: by 10.180.185.166 with SMTP id fd6mr1662474wic.5.1375787895582;
	Tue, 06 Aug 2013 04:18:15 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id hb2sm4966164wib.0.2013.08.06.04.18.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 06 Aug 2013 04:18:14 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Aug 2013 12:18:06 +0100
Message-Id: <26d8d93e65b6b22f4b1265d2696c94dfd8450541.1375787843.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1375787843.git.ross.burton@intel.com>
References: <cover.1375787843.git.ross.burton@intel.com>
In-Reply-To: <cover.1375787843.git.ross.burton@intel.com>
References: <cover.1375787843.git.ross.burton@intel.com>
Subject: [PATCH 1/2] mesa: fix out-of-tree builds when Gallium is enabled
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
X-List-Received-Date: Tue, 06 Aug 2013 11:18:15 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../mesa/0005-fix-out-of-tree-builds-gallium.patch |   42 ++++++++++++++++++++
 meta/recipes-graphics/mesa/mesa_9.1.5.bb           |    1 +
 meta/recipes-graphics/mesa/mesa_git.bb             |    1 +
 3 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/mesa/0005-fix-out-of-tree-builds-gallium.patch

diff --git a/meta/recipes-graphics/mesa/mesa/0005-fix-out-of-tree-builds-gallium.patch b/meta/recipes-graphics/mesa/mesa/0005-fix-out-of-tree-builds-gallium.patch
new file mode 100644
index 0000000..8c5984f
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa/0005-fix-out-of-tree-builds-gallium.patch
@@ -0,0 +1,42 @@
+Upstream-Status: Submitted
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 9e31e15ebb0adbf3cc0394c30cbc1ccd2b35a27f Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Fri, 28 Jun 2013 11:44:58 +0100
+Subject: [PATCH] build: fix out-of-tree builds in gallium/auxiliary
+
+The rules were writing files to e.g. util/u_indices_gen.py, but in an
+out-of-tree build this directory doesn't exist in the build directory.  So,
+create the directories just in case.
+
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+---
+ src/gallium/auxiliary/Makefile.am |    4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/gallium/auxiliary/Makefile.am b/src/gallium/auxiliary/Makefile.am
+index f14279b..0c3e7ba 100644
+--- a/src/gallium/auxiliary/Makefile.am
++++ b/src/gallium/auxiliary/Makefile.am
+@@ -38,13 +38,17 @@ libgallium_la_SOURCES += \
+ endif
+ 
+ indices/u_indices_gen.c: $(srcdir)/indices/u_indices_gen.py
++	mkdir --parents indices
+ 	$(AM_V_GEN) $(PYTHON2) $< > $@
+ 
+ indices/u_unfilled_gen.c: $(srcdir)/indices/u_unfilled_gen.py
++	mkdir --parents indices
+ 	$(AM_V_GEN) $(PYTHON2) $< > $@
+ 
+ util/u_format_srgb.c: $(srcdir)/util/u_format_srgb.py
++	mkdir --parents util
+ 	$(AM_V_GEN) $(PYTHON2) $< > $@
+ 
+ util/u_format_table.c: $(srcdir)/util/u_format_table.py $(srcdir)/util/u_format_pack.py $(srcdir)/util/u_format_parse.py $(srcdir)/util/u_format.csv
++	mkdir --parents util
+ 	$(AM_V_GEN) $(PYTHON2) $(srcdir)/util/u_format_table.py $(srcdir)/util/u_format.csv > $@
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-graphics/mesa/mesa_9.1.5.bb b/meta/recipes-graphics/mesa/mesa_9.1.5.bb
index 49fa5dd..d4a90c8 100644
--- a/meta/recipes-graphics/mesa/mesa_9.1.5.bb
+++ b/meta/recipes-graphics/mesa/mesa_9.1.5.bb
@@ -6,6 +6,7 @@ SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2 \
            file://0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch \
            file://0004-glsl-fix-builtin_compiler-cross-compilation.patch \
            file://0005-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch \
+           file://0005-fix-out-of-tree-builds-gallium.patch \
            "
 
 SRC_URI[md5sum] = "4ed2af5943141a85a21869053a2fc2eb"
diff --git a/meta/recipes-graphics/mesa/mesa_git.bb b/meta/recipes-graphics/mesa/mesa_git.bb
index 52d3d81..1707f03 100644
--- a/meta/recipes-graphics/mesa/mesa_git.bb
+++ b/meta/recipes-graphics/mesa/mesa_git.bb
@@ -13,6 +13,7 @@ SRC_URI = "git://anongit.freedesktop.org/git/mesa/mesa;protocol=git \
            file://0002-pipe_loader_sw-include-xlib_sw_winsys.h-only-when-HA.patch \
            file://0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch \
            file://0004-glsl-fix-builtin_compiler-cross-compilation.patch \
+           file://0005-fix-out-of-tree-builds-gallium.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
1.7.10.4


