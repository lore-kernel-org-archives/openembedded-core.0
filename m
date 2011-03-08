Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1PwkyU-0002Uw-2U
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Mar 2011 01:40:30 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 07 Mar 2011 16:29:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,280,1297065600"; d="scan'208";a="664847856"
Received: from unknown (HELO localhost) ([10.255.12.99])
	by fmsmga002.fm.intel.com with ESMTP; 07 Mar 2011 16:29:34 -0800
Message-Id: <cfbf50c235c2faeb53f43b42a12c49c022288488.1299544029.git.sgw@linux.intel.com>
In-Reply-To: <cover.1299544029.git.sgw@linux.intel.com>
References: <cover.1299544029.git.sgw@linux.intel.com>
Old-Date: Sat, 5 Mar 2011 00:02:14 +0800
Date: Mon, 07 Mar 2011 16:29:34 -0800
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Tue, 08 Mar 2011 08:18:44 +0100
Cc: Koen Kooi <koen@dominion.thruhere.net>, Liping Ke <liping.ke@intel.com>,
	Dongxiao Xu <dongxiao.xu@intel.com>,
	Jingdong Lu <jingdong.lu@windriver.com>
Subject: [PATCH 5/8] connman: add xuser to the dbus permission list
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
X-List-Received-Date: Tue, 08 Mar 2011 00:40:30 -0000

From: Dongxiao Xu <dongxiao.xu@intel.com>

Some platform (like atom-pc) enables rootless X,
thus the connman frontend run on it need the
permission to connect with connman by dbus.
This commit grants permission to xuser.

This fixes [YOCTO #779]

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 .../connman-0.65/add_xuser_dbus_permission.patch   |   21 ++++++++++++++++++++
 meta/recipes-connectivity/connman/connman_0.65.bb  |    3 +-
 2 files changed, 23 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-connectivity/connman/connman-0.65/add_xuser_dbus_permission.patch

diff --git a/meta/recipes-connectivity/connman/connman-0.65/add_xuser_dbus_permission.patch b/meta/recipes-connectivity/connman/connman-0.65/add_xuser_dbus_permission.patch
new file mode 100644
index 0000000..787d49b
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman-0.65/add_xuser_dbus_permission.patch
@@ -0,0 +1,21 @@
+Some platform (like atom-pc) enables rootless X,
+thus we need to add the xuser in the list.
+
+Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
+
+diff -ruN connman-0.65-orig/src/connman-dbus.conf connman-0.65/src/connman-dbus.conf
+--- connman-0.65-orig/src/connman-dbus.conf	2011-03-04 09:34:49.000000000 +0800
++++ connman-0.65/src/connman-dbus.conf	2011-03-04 09:35:21.000000000 +0800
+@@ -7,6 +7,12 @@
+         <allow send_interface="net.connman.Agent"/>
+         <allow send_interface="net.connman.Counter"/>
+     </policy>
++    <policy user="xuser">
++        <allow own="net.connman"/>
++        <allow send_destination="net.connman"/>
++        <allow send_interface="net.connman.Agent"/>
++        <allow send_interface="net.connman.Counter"/>
++    </policy>
+     <policy at_console="true">
+         <allow send_destination="net.connman"/>
+     </policy>
diff --git a/meta/recipes-connectivity/connman/connman_0.65.bb b/meta/recipes-connectivity/connman/connman_0.65.bb
index 0b077e1..8bb84a1 100644
--- a/meta/recipes-connectivity/connman/connman_0.65.bb
+++ b/meta/recipes-connectivity/connman/connman_0.65.bb
@@ -1,5 +1,5 @@
 require connman.inc
-PR = "r0"
+PR = "r1"
 
 EXTRA_OECONF += "\
   ac_cv_path_WPASUPPLICANT=/usr/sbin/wpa_supplicant \
@@ -21,6 +21,7 @@ EXTRA_OECONF += "\
 SRC_URI  = "\
   http://www.kernel.org/pub/linux/network/connman/connman-${PV}.tar.gz \
   file://fix-shutdown-ap-disconnect.patch \
+  file://add_xuser_dbus_permission.patch \
   file://connman \
 "
 
-- 
1.7.1.1



