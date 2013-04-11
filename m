Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UQJBN-0005tK-1c
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Apr 2013 17:13:01 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 11 Apr 2013 07:53:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,455,1363158000"; d="scan'208";a="316649845"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.13.202])
	by orsmga002.jf.intel.com with ESMTP; 11 Apr 2013 07:55:30 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Apr 2013 15:55:15 +0100
Message-Id: <1365692115-9752-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] dpkg, opkg, rpm-postinsts: avoid repackaging when changing IMAGE_FEATURES
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
X-List-Received-Date: Thu, 11 Apr 2013 15:13:01 -0000

Recipes cannot depend on the value of IMAGE_FEATURES; in this case the
result is do_package task signatures changing every time IMAGE_FEATURES
changes, causing a large number of task re-executions. The
implementation of the log capturing really needs to be changed to
capture these in a different place and possibly not even conditional
upon IMAGE_FEATURES at all, but this will be invasive at this point in
the development cycle. For now, remove the variable dependencies to fix
the immediate problem.

Fixes [YOCTO #4246].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-devtools/dpkg/dpkg.inc        |    1 +
 meta/recipes-devtools/opkg/opkg.inc        |    1 +
 meta/recipes-devtools/rpm/rpm-postinsts.bb |    1 +
 3 files changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index 5554920..35cd6e7 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -37,6 +37,7 @@ do_configure () {
 
 POSTLOG ?= "/var/log/postinstall.log"
 REDIRECT_CMD = "${@base_contains('IMAGE_FEATURES', 'debug-tweaks', '>${POSTLOG} 2>&1', '', d)}"
+REDIRECT_CMD[vardepsexclude] += "IMAGE_FEATURES POSTLOG"
 
 DPKG_INIT_POSITION ?= "98"
 
diff --git a/meta/recipes-devtools/opkg/opkg.inc b/meta/recipes-devtools/opkg/opkg.inc
index ff26b04..c1798b1 100644
--- a/meta/recipes-devtools/opkg/opkg.inc
+++ b/meta/recipes-devtools/opkg/opkg.inc
@@ -59,6 +59,7 @@ do_install_append_class-native() {
 
 POSTLOG ?= "/var/log/postinstall.log"
 REDIRECT_CMD = "${@base_contains('IMAGE_FEATURES', 'debug-tweaks', '>${POSTLOG} 2>&1', '', d)}"
+REDIRECT_CMD[vardepsexclude] += "IMAGE_FEATURES POSTLOG"
 
 pkg_postinst_${PN} () {
 #!/bin/sh
diff --git a/meta/recipes-devtools/rpm/rpm-postinsts.bb b/meta/recipes-devtools/rpm/rpm-postinsts.bb
index b551c8d..a5310b5 100644
--- a/meta/recipes-devtools/rpm/rpm-postinsts.bb
+++ b/meta/recipes-devtools/rpm/rpm-postinsts.bb
@@ -13,6 +13,7 @@ POSTINSTALL_INITPOSITION ?= "98"
 
 POSTLOG ?= "/var/log/postinstall.log"
 REDIRECT_CMD = "${@base_contains('IMAGE_FEATURES', 'debug-tweaks', '>>${POSTLOG} 2>&1', '', d)}"
+REDIRECT_CMD[vardepsexclude] += "IMAGE_FEATURES POSTLOG"
 
 do_fetch() {
 	:
-- 
1.7.10.4



