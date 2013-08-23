Return-Path: <mihai.prica@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 837496B212
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 12:57:32 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 23 Aug 2013 05:57:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,941,1367996400"; d="scan'208";a="390923677"
Received: from unknown (HELO mihai-Vostro-460.rb.intel.com) ([10.237.105.31])
	by fmsmga002.fm.intel.com with ESMTP; 23 Aug 2013 05:57:32 -0700
From: Mihai Prica <mihai.prica@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2013 15:57:00 +0300
Message-Id: <00278871409c42941aa71f4c64e2c07b0cc6bf61.1377260859.git.mihai.prica@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1377260859.git.mihai.prica@intel.com>
References: <cover.1377260859.git.mihai.prica@intel.com>
In-Reply-To: <cover.1377260859.git.mihai.prica@intel.com>
References: <cover.1377260859.git.mihai.prica@intel.com>
Subject: [PATCH v2 1/1] connman-gnome: fix DHCP segfault
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
X-List-Received-Date: Fri, 23 Aug 2013 12:57:33 -0000

In networks that don't have a DHCP server configured, ipv4 address
allocation fails and the ipv4 structure doesn't get populated.
The patch checks this case also.

[YOCTO #3945]

Signed-off-by: Mihai Prica <mihai.prica@intel.com>
Signed-off-by: Emilia Ciobanu <emilia.maria.silvia.ciobanu at intel.com>
---
 .../connman-gnome/null_check_for_ipv4_config.patch |   36 ++++++++++++++++++++
 .../connman/connman-gnome_0.7.bb                   |    1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-connectivity/connman/connman-gnome/null_check_for_ipv4_config.patch

diff --git a/meta/recipes-connectivity/connman/connman-gnome/null_check_for_ipv4_config.patch b/meta/recipes-connectivity/connman/connman-gnome/null_check_for_ipv4_config.patch
new file mode 100644
index 0000000..a0cfda1
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman-gnome/null_check_for_ipv4_config.patch
@@ -0,0 +1,36 @@
+In networks that don't have a DHCP server configured, ipv4 address
+allocation fails and the ipv4 structure doesn't get populated. When
+the GUI is trying to read the ipv4_config.method field to see whether
+it contains "dhcp" string, a segmentation fault is generated.
+
+Ethernet manual configuration behavior remains unchanged after this fix.
+
+Upstream-Status: Pending
+
+Signed-off-by: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
+Index: git/properties/ethernet.c
+===================================================================
+--- git.orig/properties/ethernet.c
++++ git/properties/ethernet.c
+@@ -194,7 +194,7 @@ void add_ethernet_service(GtkWidget *mai
+
+ 	data->button = button;
+
+-	if (g_str_equal(ipv4_config.method, "dhcp") == TRUE)
++	if (!ipv4_config.method || g_str_equal(ipv4_config.method, "dhcp") == TRUE)
+ 		update_ethernet_ipv4(data, CONNMAN_POLICY_DHCP);
+ 	else
+ 		update_ethernet_ipv4(data, CONNMAN_POLICY_MANUAL);
+Index: git/properties/wifi.c
+===================================================================
+--- git.orig/properties/wifi.c
++++ git/properties/wifi.c
+@@ -230,7 +230,7 @@ static void wifi_ipconfig(GtkWidget *tab
+
+ 	data->ipv4_config = ipv4_config;
+
+-	if (g_str_equal(ipv4_config.method, "dhcp") == TRUE)
++	if (!ipv4_config.method || g_str_equal(ipv4_config.method, "dhcp") == TRUE)
+ 		update_wifi_ipv4(data, CONNMAN_POLICY_DHCP);
+ 	else
+ 		update_wifi_ipv4(data, CONNMAN_POLICY_MANUAL);
diff --git a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
index 6299e70..85be9cb 100644
--- a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
+++ b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
@@ -12,6 +12,7 @@ DEPENDS = "gtk+ dbus-glib intltool-native"
 SRCREV = "cf3c325b23dae843c5499a113591cfbc98acb143"
 SRC_URI = "git://github.com/connectivity/connman-gnome.git;protocol=git \
 	   file://0001-Removed-icon-from-connman-gnome-about-applet.patch \
+       file://null_check_for_ipv4_config.patch \
 	   file://images/* \
           "

--
1.7.9.5


