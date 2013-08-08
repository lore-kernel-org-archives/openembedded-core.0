Return-Path: <ross.burton@intel.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 6B4D96A457
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2013 16:29:51 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id c41so1655250eek.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Aug 2013 09:29:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=vtLh9bCQk+REEZqxhaWmKOOTbcFAns+N2NRnbG73GPA=;
	b=MyJmTL9JCM8uqAVb6qhyaR2lFv1zfxRYXqgC2kWt7/AjM60odqIiRMVxroUnGMkdtr
	wxDhmG9ll+zxTwMPJUsl7cilD4ZEiNzLOTYUEMtpsSF2Jfy9UfkcQ1erQup0zRIFTYvK
	O70ehWvzQfv1vMDU8XfRdIZopngOV0VWUeISvNGJS2oL7q9mYrdeUR7+Rsnl/b0hXHSi
	YBSsbstI4xlxUhXvts8UKd5K0oRUjNS/Rynk8+r0fHXjlr3T7qWXz513Mds58AXXfmux
	faQyTasWWPVRhszHoXcr8AFrV4h1PFtI3iOyveMYIy8lblKSPjVwSc1Q7tVl4QL1r4/D
	+L7Q==
X-Gm-Message-State: ALoCoQnnW+7BlnooRIlgkY/FUScfUcNrWxhMh0q4gsDNunrbuLHjeG1ulTqz9mHnau4UCk9iVIhq
X-Received: by 10.15.64.1 with SMTP id n1mr9158541eex.15.1375979391356;
	Thu, 08 Aug 2013 09:29:51 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id d8sm7293471eeh.8.2013.08.08.09.29.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 08 Aug 2013 09:29:50 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Aug 2013 17:29:44 +0100
Message-Id: <1375979385-2063-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
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
X-List-Received-Date: Thu, 08 Aug 2013 16:29:51 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../mesa/0005-fix-out-of-tree-builds-gallium.patch |   42 ++++++++++++++++++++
 meta/recipes-graphics/mesa/mesa_9.1.6.bb           |    1 +
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
diff --git a/meta/recipes-graphics/mesa/mesa_9.1.6.bb b/meta/recipes-graphics/mesa/mesa_9.1.6.bb
index d47822f..7cc0847 100644
--- a/meta/recipes-graphics/mesa/mesa_9.1.6.bb
+++ b/meta/recipes-graphics/mesa/mesa_9.1.6.bb
@@ -6,6 +6,7 @@ SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2 \
            file://0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch \
            file://0004-glsl-fix-builtin_compiler-cross-compilation.patch \
            file://0005-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch \
+           file://0005-fix-out-of-tree-builds-gallium.patch \
            "
 
 SRC_URI[md5sum] = "443a2a352667294b53d56cb1a74114e9"
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


