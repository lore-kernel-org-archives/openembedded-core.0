Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id CAB677823A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 15:39:06 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Oct 2017 08:39:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,361,1503385200"; d="scan'208";a="1180945894"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 11 Oct 2017 08:39:05 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Oct 2017 18:34:33 +0300
Message-Id: <050a159340e93ecda59dd0aa9b7dc4c17ec9789c.1507735448.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
In-Reply-To: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
References: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 41/50] libinput: update to 1.8.3
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
X-List-Received-Date: Wed, 11 Oct 2017 15:39:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Drop upstreamed patch.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../0001-tools-Fix-race-in-autotools-install.patch | 37 ----------------------
 .../{libinput_1.8.1.bb => libinput_1.8.3.bb}       |  8 ++---
 2 files changed, 3 insertions(+), 42 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/libinput/0001-tools-Fix-race-in-autotools-install.patch
 rename meta/recipes-graphics/wayland/{libinput_1.8.1.bb => libinput_1.8.3.bb} (81%)

diff --git a/meta/recipes-graphics/wayland/libinput/0001-tools-Fix-race-in-autotools-install.patch b/meta/recipes-graphics/wayland/libinput/0001-tools-Fix-race-in-autotools-install.patch
deleted file mode 100644
index 4667538c5eb..00000000000
--- a/meta/recipes-graphics/wayland/libinput/0001-tools-Fix-race-in-autotools-install.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 5e8864c5b7a2e258eea041b0ef66dac7fcab9b7f Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Wed, 9 Aug 2017 09:47:14 +0300
-Subject: [PATCH] tools: Fix race in (autotools) install
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-exec/data distinction is done based on install dir so compat scripts
-must be moved in exec hook.
-
-This should fix this occasional failure:
-| install: cannot change permissions of
-| ‘/usr/bin/libinput-debug-events.compat’: No such file or directory
-
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Upstream-Status: Submitted
----
- tools/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tools/Makefile.am b/tools/Makefile.am
-index 2c8660b..7ee8b90 100644
---- a/tools/Makefile.am
-+++ b/tools/Makefile.am
-@@ -63,7 +63,7 @@ endif
- 
- EXTRA_DIST = make-ptraccel-graphs.sh install-compat-scripts.sh $(bin_SCRIPTS)
- 
--install-data-hook:
-+install-exec-hook:
- 	(cd $(DESTDIR)$(bindir) && mv libinput-list-devices.compat libinput-list-devices)
- 	(cd $(DESTDIR)$(bindir) && mv libinput-debug-events.compat libinput-debug-events)
- 
--- 
-2.13.3
-
diff --git a/meta/recipes-graphics/wayland/libinput_1.8.1.bb b/meta/recipes-graphics/wayland/libinput_1.8.3.bb
similarity index 81%
rename from meta/recipes-graphics/wayland/libinput_1.8.1.bb
rename to meta/recipes-graphics/wayland/libinput_1.8.3.bb
index a21babeb099..3a02c4b1d24 100644
--- a/meta/recipes-graphics/wayland/libinput_1.8.1.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.8.3.bb
@@ -7,12 +7,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2184aef38ff137ed33ce9a63b9d1eb8f"
 
 DEPENDS = "libevdev udev mtdev"
 
-SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
-           file://0001-tools-Fix-race-in-autotools-install.patch \
-"
+SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz"
 
-SRC_URI[md5sum] = "8247f0bb67052ffb272c50c3cb9c5998"
-SRC_URI[sha256sum] = "e3590a9037e561a5791c8bd3b34bfd30fad5cacd8cbefc0d75fafe3a41d07147"
+SRC_URI[md5sum] = "5265244853ad7cf41232b0d3ee805ab9"
+SRC_URI[sha256sum] = "2fe2e2f52f0971a9c43541b8f26582ca8df6ed4bb9050e85eb40d4ff6b13142d"
 
 inherit autotools pkgconfig lib_package
 
-- 
2.14.1


