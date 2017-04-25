Return-Path: <dmitry.rozhkov@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id CC66F71C90
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Apr 2017 08:51:20 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Apr 2017 01:51:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,248,1488873600"; d="scan'208";a="960778691"
Received: from drozhkov-desk.fi.intel.com ([10.237.72.60])
	by orsmga003.jf.intel.com with ESMTP; 25 Apr 2017 01:51:19 -0700
From: Dmitry Rozhkov <dmitry.rozhkov@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Apr 2017 11:48:55 +0300
Message-Id: <20170425084855.27154-1-dmitry.rozhkov@linux.intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH v2] connman: fix race condition with systemd-udev
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
X-List-Received-Date: Tue, 25 Apr 2017 08:51:21 -0000

When a new USB network interface is plugged in systemd
fails to rename the new interface (ethX) to a predictable
name [1] because connman locks it first.

Add a fix to connman that makes it to re-evaluate
a known but blacklisted ethernet interface for enabling
after it has got renamed.

Still a user has to blacklist the unpredictable names in
connman herself in order to avoid the race condition.
We cannot blacklist the names by default because there
are cases when one might want to use systemd, but to
disable systemd's predictable names feature.

Fixes [YOCTO #11341]

[1] https://www.freedesktop.org/wiki/Software/systemd/PredictableNetworkInterfaceNames/

Signed-off-by: Dmitry Rozhkov <dmitry.rozhkov@linux.intel.com>
---

Changes in v2:
 - do not blacklist unpredictable network interface names by default
   if systemd is in use.

 ...try-to-add-ether-interface-after-renaming.patch | 42 ++++++++++++++++++++++
 meta/recipes-connectivity/connman/connman_1.33.bb  |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-connectivity/connman/connman/0001-rtnl-retry-to-add-ether-interface-after-renaming.patch

diff --git a/meta/recipes-connectivity/connman/connman/0001-rtnl-retry-to-add-ether-interface-after-renaming.patch b/meta/recipes-connectivity/connman/connman/0001-rtnl-retry-to-add-ether-interface-after-renaming.patch
new file mode 100644
index 0000000..1806b70
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/0001-rtnl-retry-to-add-ether-interface-after-renaming.patch
@@ -0,0 +1,42 @@
+From d92e713e112e48cb4434f1c67b97e6507a7cf9e8 Mon Sep 17 00:00:00 2001
+From: Dmitry Rozhkov <dmitry.rozhkov@linux.intel.com>
+Date: Thu, 20 Apr 2017 15:54:29 +0300
+Subject: [PATCH] rtnl: retry to add ether interface after renaming
+
+If eth* interfaces are blacklisted to avoid a race condition
+where connman may access an interface before systemd/udev can
+change it to use a predictable interface name then it's impossible
+to re-activate it under a new predictable name because an existing
+interface is considered to be already added to the technology.
+
+Once blacklisted an interface is not re-evaluated under a new name.
+
+This patch allows to re-evaluate an interface known to connman for
+adding it to the ethernet technology in case it's name has changed.
+E.g. after unplugging a cable and plugging it back.
+
+Upstream-Status: Accepted [https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=d81f21e32562c83e2a0bdf77e91158c9b3c5945a]
+
+Signed-off-by: Dmitry Rozhkov <dmitry.rozhkov@linux.intel.com>
+---
+ src/rtnl.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/rtnl.c b/src/rtnl.c
+index d1b851f..19a999c 100644
+--- a/src/rtnl.c
++++ b/src/rtnl.c
+@@ -469,7 +469,9 @@ static void process_newlink(unsigned short type, int index, unsigned flags,
+ 
+ 		if (type == ARPHRD_ETHER)
+ 			read_uevent(interface);
+-	} else
++	} else if (type == ARPHRD_ETHER && interface->device_type == CONNMAN_DEVICE_TYPE_UNKNOWN)
++		read_uevent(interface);
++	else
+ 		interface = NULL;
+ 
+ 	for (list = rtnl_list; list; list = list->next) {
+-- 
+2.9.3
+
diff --git a/meta/recipes-connectivity/connman/connman_1.33.bb b/meta/recipes-connectivity/connman/connman_1.33.bb
index 4129b05..56a4711 100644
--- a/meta/recipes-connectivity/connman/connman_1.33.bb
+++ b/meta/recipes-connectivity/connman/connman_1.33.bb
@@ -6,6 +6,7 @@ SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
             file://no-version-scripts.patch \
             file://includes.patch \
             file://0003-stats-Fix-bad-file-descriptor-initialisation.patch \
+            file://0001-rtnl-retry-to-add-ether-interface-after-renaming.patch \
             "
 SRC_URI_append_libc-musl = " file://0002-resolve-musl-does-not-implement-res_ninit.patch \
                              file://0001-Fix-compile-on-musl-with-kernel-4.9-headers.patch"
-- 
2.9.3


