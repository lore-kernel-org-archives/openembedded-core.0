Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SLH7I-0005tX-DK
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Apr 2012 18:55:28 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 20 Apr 2012 09:45:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="156167823"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.163])
	by fmsmga002.fm.intel.com with ESMTP; 20 Apr 2012 09:45:37 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Apr 2012 09:44:55 -0700
Message-Id: <c96ac930033351b58aafd19a9b25687fe1166012.1334940120.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1334940120.git.sgw@linux.intel.com>
References: <cover.1334940120.git.sgw@linux.intel.com>
In-Reply-To: <cover.1334940120.git.sgw@linux.intel.com>
References: <cover.1334940120.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 04/43] connman: backport test script fixes
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
X-List-Received-Date: Fri, 20 Apr 2012 16:55:28 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

Those fixes are required to get the test scripts to work with current
0.79 DBus API.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../connman/test-set-ipv4-method-api-fix.patch     |   50 ++++++++++++++++++
 .../connman/test-set-ipv6-method-api-fix.patch     |   55 ++++++++++++++++++++
 meta/recipes-connectivity/connman/connman_0.79.bb  |    4 +-
 3 files changed, 108 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-connectivity/connman/connman/test-set-ipv4-method-api-fix.patch
 create mode 100644 meta/recipes-connectivity/connman/connman/test-set-ipv6-method-api-fix.patch

diff --git a/meta/recipes-connectivity/connman/connman/test-set-ipv4-method-api-fix.patch b/meta/recipes-connectivity/connman/connman/test-set-ipv4-method-api-fix.patch
new file mode 100644
index 0000000..78eb19a
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/test-set-ipv4-method-api-fix.patch
@@ -0,0 +1,50 @@
+From 0b817dd3096f5c3ca8f0b868ee55ea550054137b Mon Sep 17 00:00:00 2001
+From: Daniel Wagner <daniel.wagner@bmw-carit.de>
+Date: Mon, 19 Mar 2012 14:03:27 +0100
+Subject: [PATCH 3/3] set-ipv4-method: The arguments have to be wrapped into a
+ variant
+
+Fixes BMC#24986
+
+Upstream-Status: Backport
+
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+---
+ test/set-ipv4-method |   11 +++++++----
+ 1 file changed, 7 insertions(+), 4 deletions(-)
+
+diff --git a/test/set-ipv4-method b/test/set-ipv4-method
+index 820b24b..235113f 100755
+--- a/test/set-ipv4-method
++++ b/test/set-ipv4-method
+@@ -3,6 +3,9 @@
+ import sys
+ import dbus
+ 
++def make_variant(string):
++	return dbus.String(string, variant_level=1)
++
+ def print_usage():
+ 	print "Usage: %s <service> [off|dhcp|manual <address> [netmask] [gateway]]" % (sys.argv[0])
+ 
+@@ -20,13 +23,13 @@ properties = service.GetProperties()
+ 
+ print "Setting method %s for %s" % (sys.argv[2], sys.argv[1])
+ 
+-ipv4_configuration = { "Method": sys.argv[2] }
++ipv4_configuration = { "Method": make_variant(sys.argv[2]) }
+ if (len(sys.argv) > 3):
+-	ipv4_configuration["Address"] = sys.argv[3]
++	ipv4_configuration["Address"] = make_variant(sys.argv[3])
+ if (len(sys.argv) > 4):
+-	ipv4_configuration["Netmask"] = sys.argv[4]
++	ipv4_configuration["Netmask"] = make_variant(sys.argv[4])
+ if (len(sys.argv) > 5):
+-        ipv4_configuration["Gateway"] = sys.argv[5]
++        ipv4_configuration["Gateway"] = make_variant(sys.argv[5])
+ 
+ service.SetProperty("IPv4.Configuration", ipv4_configuration)
+ print "New IPv4.Configuration: ", ipv4_configuration
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-connectivity/connman/connman/test-set-ipv6-method-api-fix.patch b/meta/recipes-connectivity/connman/connman/test-set-ipv6-method-api-fix.patch
new file mode 100644
index 0000000..773127b
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/test-set-ipv6-method-api-fix.patch
@@ -0,0 +1,55 @@
+From 2885e71c9c0df7ea9866e91ab79d255eaa8de53d Mon Sep 17 00:00:00 2001
+From: Daniel Wagner <daniel.wagner@bmw-carit.de>
+Date: Mon, 19 Mar 2012 14:03:28 +0100
+Subject: [PATCH 2/3] set-ipv6-method: The arguments have to be wrapped into a
+ variant
+
+Fixes BMC#24986
+
+Upstream-Status: Backport
+
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+---
+ test/set-ipv6-method |   13 ++++++++-----
+ 1 file changed, 8 insertions(+), 5 deletions(-)
+
+diff --git a/test/set-ipv6-method b/test/set-ipv6-method
+index 7f60b88..4f2de09 100755
+--- a/test/set-ipv6-method
++++ b/test/set-ipv6-method
+@@ -3,6 +3,9 @@
+ import sys
+ import dbus
+ 
++def make_variant(string):
++	return dbus.String(string, variant_level=1)
++
+ def print_usage():
+ 	print "Usage: %s <service> off|manual|auto [<address> [prefixlen] [gateway]] [<privacy>]" % (sys.argv[0])
+ 
+@@ -19,17 +22,17 @@ properties = service.GetProperties()
+ 
+ print "Setting method %s for %s" % (sys.argv[2], sys.argv[1])
+ 
+-ipv6_configuration = { "Method": sys.argv[2] }
++ipv6_configuration = { "Method": make_variant(sys.argv[2])}
+ if sys.argv[2] == "auto":
+ 	if (len(sys.argv) > 3):
+-		ipv6_configuration["Privacy"] = sys.argv[3]
++		ipv6_configuration["Privacy"] = make_variant(sys.argv[3])
+ else:
+ 	if (len(sys.argv) > 3):
+-		ipv6_configuration["Address"] = sys.argv[3]
++		ipv6_configuration["Address"] = make_variant(sys.argv[3])
+ 	if (len(sys.argv) > 4):
+-		ipv6_configuration["PrefixLength"] = sys.argv[4]
++		ipv6_configuration["PrefixLength"] = make_variant(sys.argv[4])
+ 	if (len(sys.argv) > 5):
+-		ipv6_configuration["Gateway"] = sys.argv[5]
++		ipv6_configuration["Gateway"] = make_variant(sys.argv[5])
+ 
+ service.SetProperty("IPv6.Configuration", ipv6_configuration)
+ print "New IPv6.Configuration: ", ipv6_configuration
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-connectivity/connman/connman_0.79.bb b/meta/recipes-connectivity/connman/connman_0.79.bb
index da48e94..4c57dab 100644
--- a/meta/recipes-connectivity/connman/connman_0.79.bb
+++ b/meta/recipes-connectivity/connman/connman_0.79.bb
@@ -7,6 +7,8 @@ SRC_URI  = "git://git.kernel.org/pub/scm/network/connman/connman.git \
             file://ethernet_default.patch \
             file://disable_alg-test.patch \
             file://0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch \
+            file://test-set-ipv4-method-api-fix.patch \
+            file://test-set-ipv6-method-api-fix.patch \
             file://connman"
 S = "${WORKDIR}/git"
-PR = "r2"
+PR = "r3"
-- 
1.7.7.6



