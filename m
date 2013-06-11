Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 0DD786AA06
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 16:28:54 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 11 Jun 2013 09:28:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,846,1363158000"; d="scan'208";a="253553172"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.29])
	by AZSMGA002.ch.intel.com with ESMTP; 11 Jun 2013 09:28:32 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Jun 2013 17:28:24 +0100
Message-Id: <1370968104-25752-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [dylan][PATCH] menu-cache: Fix segmentation fault
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
X-List-Received-Date: Tue, 11 Jun 2013 16:28:55 -0000

From: Laurentiu Palcu <laurentiu.palcu@intel.com>

[YOCTO #4353]

(From OE-Core rev: 8c9c6155e6d83675a94b4eaae4ffc6dfeca399ee)

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../menu-cache/files/Fix-segfault.patch            | 31 ++++++++++++++++++++++
 .../menu-cache/menu-cache_0.4.1.bb                 |  4 ++-
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
1.8.1.2


