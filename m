Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E69A672D0A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Jan 2015 00:31:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0H0VKFp008791
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jan 2015 16:31:20 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 16 Jan 2015 16:31:20 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Jan 2015 16:31:18 -0800
Message-ID: <6be624d6e5aef9579f2736a845bf200af4d0c225.1421454635.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1421454635.git.liezhi.yang@windriver.com>
References: <cover.1421454635.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] neard: fix parallel issue
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
X-List-Received-Date: Sat, 17 Jan 2015 00:31:26 -0000
Content-Type: text/plain

There might be no src dir if the src/builtin.h runs earlier, create it
to fix the race issue:
src/genbuiltin nfctype1 nfctype2 nfctype3 nfctype4 p2p > src/builtin.h
/bin/sh: src/builtin.h: No such file or directory

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../neard/Makefile.am-fix-parallel-issue.patch     |   33 ++++++++++++++++++++
 meta/recipes-connectivity/neard/neard_0.14.bb      |    1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-connectivity/neard/neard/Makefile.am-fix-parallel-issue.patch

diff --git a/meta/recipes-connectivity/neard/neard/Makefile.am-fix-parallel-issue.patch b/meta/recipes-connectivity/neard/neard/Makefile.am-fix-parallel-issue.patch
new file mode 100644
index 0000000..4660676
--- /dev/null
+++ b/meta/recipes-connectivity/neard/neard/Makefile.am-fix-parallel-issue.patch
@@ -0,0 +1,33 @@
+From 43acc56d5506c7e318f717fb3634bc16e3438913 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Thu, 15 Jan 2015 18:12:07 -0800
+Subject: [PATCH] Makefile.am: fix parallel issue
+
+There might be no src dir if src/builtin.h runs earlier, create it to
+fix the race issue:
+
+src/genbuiltin nfctype1 nfctype2 nfctype3 nfctype4 p2p > src/builtin.h
+/bin/sh: src/builtin.h: No such file or directory
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ Makefile.am |    1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Makefile.am b/Makefile.am
+index 3241311..a43eaa2 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -164,6 +164,7 @@ MAINTAINERCLEANFILES = Makefile.in \
+ src/plugin.$(OBJEXT): src/builtin.h
+ 
+ src/builtin.h: src/genbuiltin $(builtin_sources)
++	$(AM_V_at)$(MKDIR_P) src
+ 	$(AM_V_GEN)$(srcdir)/src/genbuiltin $(builtin_modules) > $@
+ 
+ $(src_neard_OBJECTS) \
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-connectivity/neard/neard_0.14.bb b/meta/recipes-connectivity/neard/neard_0.14.bb
index 43fb589..7a1096b 100644
--- a/meta/recipes-connectivity/neard/neard_0.14.bb
+++ b/meta/recipes-connectivity/neard/neard_0.14.bb
@@ -4,6 +4,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/network/nfc/${BPN}-${PV}.tar.xz \
            file://parallel-build.patch \
            file://neard.in \
            file://neard.service.in \
+           file://Makefile.am-fix-parallel-issue.patch \
           "
 SRC_URI[md5sum] = "692ba2653d60155255244c87396c486b"
 SRC_URI[sha256sum] = "6ea724b443d39d679168fc7776a965d1f64727c3735391df2c01469ee7cd8cca"
-- 
1.7.9.5


