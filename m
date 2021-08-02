Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web08.17081.1627890806830162900
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Aug 2021 00:53:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10063"; a="193002126"
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; 
   d="scan'208";a="193002126"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2021 00:53:31 -0700
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; 
   d="scan'208";a="478655169"
Received: from chewchoo-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.228.46])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2021 00:53:30 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 29/37] glew: fix Makefile race
Date: Mon,  2 Aug 2021 15:52:16 +0800
Message-Id: <caa34b782a4e7d14dabf5a14cc3fb147509cc716.1627890114.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1627890114.git.anuj.mittal@intel.com>
References: <cover.1627890114.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross@burtonini.com>

Fix a Makefile race resulting in the target creating a directory being
executed after the target to write into that directory.

[ YOCTO #14485 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e90c1d3b80e35fb685d4b321972743771eb2c2c0)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../0001-Fix-build-race-in-Makefile.patch     | 56 +++++++++++++++++++
 meta/recipes-graphics/glew/glew_2.2.0.bb      |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-graphics/glew/glew/0001-Fix-build-race-in-Makefile.patch

diff --git a/meta/recipes-graphics/glew/glew/0001-Fix-build-race-in-Makefile.patch b/meta/recipes-graphics/glew/glew/0001-Fix-build-race-in-Makefile.patch
new file mode 100644
index 0000000000..7edcfe8de8
--- /dev/null
+++ b/meta/recipes-graphics/glew/glew/0001-Fix-build-race-in-Makefile.patch
@@ -0,0 +1,56 @@
+Upstream-Status: Submitted [https://github.com/nigels-com/glew/pull/311]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 0ce0a85597db48a2fca619bd95e34af091e54ae8 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Thu, 22 Jul 2021 16:31:11 +0100
+Subject: [PATCH] Fix build race in Makefile
+
+The current rule for the binaries is:
+
+glew.bin: glew.lib bin bin/$(GLEWINFO.BIN) bin/$(VISUALINFO.BIN)
+
+In parallel builds, all of those targets happen at the same time. This
+means that 'bin' can happen *after* 'bin/$(GLEWINFO.BIN)', which is a
+problem as the 'bin' target's responsibility is to create the directory
+that the other target writes into.
+
+Solve this by not having a separate 'create directory' target which is
+fundamentally racy, and simply mkdir in each target which writes into it.
+---
+ Makefile | 9 ++++-----
+ 1 file changed, 4 insertions(+), 5 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index d0e4614..04af44c 100644
+--- a/Makefile
++++ b/Makefile
+@@ -171,21 +171,20 @@ VISUALINFO.BIN.OBJ := $(VISUALINFO.BIN.OBJ:.c=.o)
+ # Don't build glewinfo or visualinfo for NaCL, yet.
+ 
+ ifneq ($(filter nacl%,$(SYSTEM)),)
+-glew.bin: glew.lib bin
++glew.bin: glew.lib
+ else
+-glew.bin: glew.lib bin bin/$(GLEWINFO.BIN) bin/$(VISUALINFO.BIN) 
++glew.bin: glew.lib bin/$(GLEWINFO.BIN) bin/$(VISUALINFO.BIN)
+ endif
+ 
+-bin:
+-	mkdir bin
+-
+ bin/$(GLEWINFO.BIN): $(GLEWINFO.BIN.OBJ) $(LIB.SHARED.DIR)/$(LIB.SHARED)
++	@mkdir -p $(dir $@)
+ 	$(CC) $(CFLAGS) -o $@ $(GLEWINFO.BIN.OBJ) $(BIN.LIBS)
+ ifneq ($(STRIP),)
+ 	$(STRIP) -x $@
+ endif
+ 
+ bin/$(VISUALINFO.BIN): $(VISUALINFO.BIN.OBJ) $(LIB.SHARED.DIR)/$(LIB.SHARED)
++	@mkdir -p $(dir $@)
+ 	$(CC) $(CFLAGS) -o $@ $(VISUALINFO.BIN.OBJ) $(BIN.LIBS)
+ ifneq ($(STRIP),)
+ 	$(STRIP) -x $@
+-- 
+2.25.1
+
diff --git a/meta/recipes-graphics/glew/glew_2.2.0.bb b/meta/recipes-graphics/glew/glew_2.2.0.bb
index 8948444e08..92b6083648 100644
--- a/meta/recipes-graphics/glew/glew_2.2.0.bb
+++ b/meta/recipes-graphics/glew/glew_2.2.0.bb
@@ -6,6 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ac251558de685c6b9478d89be3149c2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/glew/glew/${PV}/glew-${PV}.tgz \
+           file://0001-Fix-build-race-in-Makefile.patch \
            file://no-strip.patch"
 
 SRC_URI[md5sum] = "3579164bccaef09e36c0af7f4fd5c7c7"
-- 
2.31.1

