Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1Qyec1-0006sf-MP
	for openembedded-core@lists.openembedded.org;
	Wed, 31 Aug 2011 08:49:25 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 30 Aug 2011 23:44:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="43901089"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by orsmga001.jf.intel.com with ESMTP; 30 Aug 2011 23:44:30 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Aug 2011 14:47:33 +0800
Message-Id: <03b1125f27548be099b557d6d767b6c2db7364d6.1314772012.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1314772012.git.dongxiao.xu@intel.com>
References: <cover.1314772012.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1314772012.git.dongxiao.xu@intel.com>
References: <cover.1314772012.git.dongxiao.xu@intel.com>
Subject: [PATCH 1/1] connman-gnome: Fix WiFi security display issue
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 31 Aug 2011 06:49:25 -0000

Latest connman-0.75 change the WiFi security type, causing the
incompatibility of connman-gnome. Fix connman-gnome accordingly to show
the correct security informtion.

[YOCTO #1343]

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 .../connman/connman-gnome/security-type.patch      |   41 ++++++++++++++++++++
 .../connman/connman-gnome_0.5.bb                   |    5 +-
 2 files changed, 44 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/connman/connman-gnome/security-type.patch

diff --git a/meta/recipes-connectivity/connman/connman-gnome/security-type.patch b/meta/recipes-connectivity/connman/connman-gnome/security-type.patch
new file mode 100644
index 0000000..a75d696
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman-gnome/security-type.patch
@@ -0,0 +1,41 @@
+From ec36df9d1fbb6dcbf0d1e79245ffe213049ecd5a Mon Sep 17 00:00:00 2001
+From: Dongxiao Xu <dongxiao.xu@intel.com>
+Date: Wed, 3 Aug 2011 14:33:07 +0800
+Subject: [PATCH] connman-dbus: fix security type mismatch
+
+Latest connman change the Security type to be array{String}, fix
+connman-gnome accordingly.
+
+Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
+---
+ common/connman-dbus.c |    5 +++--
+ 1 files changed, 3 insertions(+), 2 deletions(-)
+
+Upstream-Status: Pending
+
+diff --git a/common/connman-dbus.c b/common/connman-dbus.c
+index 0f4e1db..0ac8ed5 100644
+--- a/common/connman-dbus.c
++++ b/common/connman-dbus.c
+@@ -384,7 +384,8 @@ static void service_changed(DBusGProxy *proxy, const char *property,
+ 		gtk_tree_store_set(store, &iter,
+ 					CONNMAN_COLUMN_FAVORITE, favorite, -1);
+ 	} else if (g_str_equal(property, "Security") == TRUE) {
+-		const char *security = value ? g_value_get_string(value) : NULL;
++		const char **array = value ? g_value_get_boxed(value) : NULL;
++		const char *security = g_strjoinv(" ", array);
+ 		gtk_tree_store_set(store, &iter,
+ 					CONNMAN_COLUMN_SECURITY, security,
+ 					-1);
+@@ -487,7 +488,7 @@ static void service_properties(DBusGProxy *proxy, GHashTable *hash,
+ 	strength = value ? g_value_get_uchar(value) : 0;
+ 
+ 	value = g_hash_table_lookup(hash, "Security");
+-	security = value ? g_value_get_string(value) : NULL;
++	security = value ? g_strjoinv(" ", g_value_get_boxed(value)) : NULL;
+ 
+ 	value = g_hash_table_lookup(hash, "PassPhrase");
+ 	passphrase = value ? g_value_get_string(value) : NULL;
+-- 
+1.7.1
+
diff --git a/meta/recipes-connectivity/connman/connman-gnome_0.5.bb b/meta/recipes-connectivity/connman/connman-gnome_0.5.bb
index 416fa4b..9c78186 100644
--- a/meta/recipes-connectivity/connman/connman-gnome_0.5.bb
+++ b/meta/recipes-connectivity/connman/connman-gnome_0.5.bb
@@ -8,11 +8,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
 
 DEPENDS = "gtk+ dbus"
 
-PR = "r6"
+PR = "r7"
 
 SRCREV = "78d3c39db6f3f7977b466305110faa8ca5f74ec8"
 SRC_URI = "git://git.kernel.org/pub/scm/network/connman/connman-gnome.git;protocol=git \
-           file://3g.patch"
+           file://3g.patch \
+           file://security-type.patch"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.1



