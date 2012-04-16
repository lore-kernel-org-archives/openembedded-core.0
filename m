Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SJtlA-0006FO-O6
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Apr 2012 23:46:56 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 Apr 2012 14:37:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="154323058"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.96])
	by fmsmga002.fm.intel.com with ESMTP; 16 Apr 2012 14:37:18 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Apr 2012 22:37:16 +0100
Message-Id: <4f9c9967e64cc974799fe6d886212caba2de6529.1334611909.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1334611909.git.paul.eggleton@linux.intel.com>
References: <cover.1334611909.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1334611909.git.paul.eggleton@linux.intel.com>
References: <cover.1334611909.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] connman-gnome: fix segfault on connect
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
X-List-Received-Date: Mon, 16 Apr 2012 21:46:56 -0000

Fixes a segfault in the properties application when connecting to a WiFi
service succeeds.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 ...me-fix-segfault-due-to-unchecked-null-val.patch |   30 ++++++++++++++++++++
 .../connman/connman-gnome_0.5.bb                   |    5 ++-
 2 files changed, 33 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/connman/connman-gnome/0007-connman-gnome-fix-segfault-due-to-unchecked-null-val.patch

diff --git a/meta/recipes-connectivity/connman/connman-gnome/0007-connman-gnome-fix-segfault-due-to-unchecked-null-val.patch b/meta/recipes-connectivity/connman/connman-gnome/0007-connman-gnome-fix-segfault-due-to-unchecked-null-val.patch
new file mode 100644
index 0000000..3e054ba
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman-gnome/0007-connman-gnome-fix-segfault-due-to-unchecked-null-val.patch
@@ -0,0 +1,30 @@
+From 7225bf8e8e9bee42d7d7d02ba754b9fb30a877b6 Mon Sep 17 00:00:00 2001
+From: Paul Eggleton <paul.eggleton@linux.intel.com>
+Date: Mon, 16 Apr 2012 19:15:35 +0100
+Subject: [PATCH] connman-gnome: fix segfault due to unchecked null value
+
+If value is NULL here we should not pass it to g_value_get_boxed().
+
+Upstream-Status: Submitted
+
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+---
+ common/connman-dbus.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/common/connman-dbus.c b/common/connman-dbus.c
+index 33ac623..822fc98 100644
+--- a/common/connman-dbus.c
++++ b/common/connman-dbus.c
+@@ -437,7 +437,7 @@ static void service_properties(DBusGProxy *proxy, GHashTable *hash,
+ 	DBG("name %s type %d icon %s", name, type, icon);
+ 
+ 	value = g_hash_table_lookup(hash, "IPv4.Configuration");
+-	ipv4 = g_value_get_boxed (value);
++	ipv4 = value ? g_value_get_boxed (value) : NULL;
+ 
+ 	if (!ipv4)
+ 		goto done;
+-- 
+1.7.5.4
+
diff --git a/meta/recipes-connectivity/connman/connman-gnome_0.5.bb b/meta/recipes-connectivity/connman/connman-gnome_0.5.bb
index 93aac21..e2e8deb 100644
--- a/meta/recipes-connectivity/connman/connman-gnome_0.5.bb
+++ b/meta/recipes-connectivity/connman/connman-gnome_0.5.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
 
 DEPENDS = "gtk+ dbus"
 
-PR = "r9"
+PR = "r10"
 
 SRCREV = "42c652d123ea133d0a0930b96e8e39dbd0c597b5"
 SRC_URI = "git://git.kernel.org/pub/scm/network/connman/connman-gnome.git \
@@ -17,7 +17,8 @@ SRC_URI = "git://git.kernel.org/pub/scm/network/connman/connman-gnome.git \
            file://0003-Fix-setting-IPv4-configuration.patch \
            file://0004-Handle-WiFi-authentication-using-an-agent.patch \
            file://0005-Remove-all-handling-of-Passphrase-property.patch \
-           file://0006-Fix-status-descriptions-in-properties-tree.patch"
+           file://0006-Fix-status-descriptions-in-properties-tree.patch \
+           file://0007-connman-gnome-fix-segfault-due-to-unchecked-null-val.patch"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.5.4



