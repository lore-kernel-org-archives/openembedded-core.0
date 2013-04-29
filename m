Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UWob2-0007ss-IZ
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Apr 2013 15:58:27 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 29 Apr 2013 06:40:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,574,1363158000"; d="scan'208";a="294897093"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by azsmga001.ch.intel.com with ESMTP; 29 Apr 2013 06:40:15 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Apr 2013 16:40:14 +0300
Message-Id: <1367242814-22001-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] menu-cache: Fix segmentation fault
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Apr 2013 13:58:27 -0000

[YOCTO #4353]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../menu-cache/files/Fix-segfault.patch            |   31 ++++++++++++++++++++
 .../menu-cache/menu-cache_0.4.1.bb                 |    4 ++-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/menu-cache/files/Fix-segfault.patch

diff --git a/meta/recipes-graphics/menu-cache/files/Fix-segfault.patch b/meta/recipes-graphics/menu-cache/files/Fix-segfault.patch
new file mode 100644
index 0000000..74a0407
--- /dev/null
+++ b/meta/recipes-graphics/menu-cache/files/Fix-segfault.patch
@@ -0,0 +1,31 @@
+From a497ea6aae3994b7f6527ef7599dd95baf2ad841 Mon Sep 17 00:00:00 2001
+From: Laurentiu Palcu <laurentiu.palcu@intel.com>
+Date: Mon, 29 Apr 2013 12:04:20 +0300
+Subject: [PATCH] Fix segfault
+
+Apparently, g_io_channel_unref() was called twice: once in the
+menu-cache's on_client_closed() callback and once from the finalize
+function, g_io_unix_finalize()/g_io_win32_finalize(), which is called
+anyway when the source is removed.
+
+Upstream-Status: Pending
+Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
+---
+ menu-cache-daemon/menu-cached.c |    1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/menu-cache-daemon/menu-cached.c b/menu-cache-daemon/menu-cached.c
+index e246bb4..a10b6db 100644
+--- a/menu-cache-daemon/menu-cached.c
++++ b/menu-cache-daemon/menu-cached.c
+@@ -579,7 +579,6 @@ static void on_client_closed(gpointer user_data)
+         }
+     }
+     /* DEBUG("client closed"); */
+-    g_io_channel_unref(ch);
+ }
+ 
+ static gboolean on_client_data_in(GIOChannel* ch, GIOCondition cond, gpointer user_data)
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-graphics/menu-cache/menu-cache_0.4.1.bb b/meta/recipes-graphics/menu-cache/menu-cache_0.4.1.bb
index d0c5340..2aabd4a 100644
--- a/meta/recipes-graphics/menu-cache/menu-cache_0.4.1.bb
+++ b/meta/recipes-graphics/menu-cache/menu-cache_0.4.1.bb
@@ -11,7 +11,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 SECTION = "x11/libs"
 DEPENDS = "glib-2.0 zlib"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/lxde/menu-cache-${PV}.tar.gz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/lxde/menu-cache-${PV}.tar.gz \
+           file://Fix-segfault.patch \
+          "
 
 SRC_URI[md5sum] = "20fed982f5d8e6ec8a56a5b48894ecf0"
 SRC_URI[sha256sum] = "4fa9408e353fedba5b7314cbf6b6cd06d873a1424e281aa050d88bb9c0a0191e"
-- 
1.7.9.5



