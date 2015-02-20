Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D08CE71E68
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Feb 2015 18:38:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t1KIc64p006316
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 20 Feb 2015 10:38:06 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 20 Feb 2015 10:38:06 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 20 Feb 2015 13:38:00 -0500
Message-ID: <579a238146ab786175d1512db8d91b98b21f71e5.1424456540.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1424456540.git.bruce.ashfield@windriver.com>
References: <cover.1424456540.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] linux-yocto: make kernel configuration audit user visible
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
X-List-Received-Date: Fri, 20 Feb 2015 18:38:08 -0000
Content-Type: text/plain

After a linux-yocto style kernel is configured, a kernel configuration
audit is executed to detect common errors or issues with the config.

This output used to be visible, but was made less obvious to not alarm
users unnecessarily (since some configuration issues are acceptable).

There are some classes of configuration issue that are worth being
visible, and that is specified configuration values that do not make the
final .config. These dropped options can result in any number of runtime
failures, so flagging them at build time makes sense.

The visibility of auditing is controlled by KCONF_AUDIT_LEVEL:

   0: no reporting
   1: report options that are specified, but not in the final config
   2: report options that are not hardware related, but set by a BSP

The default level is 1, with level 2 and above being for BSP development
only.

If these conditions are detected, warnings will be generated as follows:

  WARNING: [kernel config]: specified values did not make it into the
  kernel's final configuration:

  Value requested for CONFIG_SND_PCSP not in final ".config"
  Requested value: "CONFIG_SND_PCSP=y"
  Actual value set: ""

or

  WARNING: [kernel config]: BSP specified non-hw configuration:

  CONFIG_BLOCK
  CONFIG_CFG80211_WEXT
  CONFIG_CORDIC
  CONFIG_CRC8
  CONFIG_EFIVAR_FS
  CONFIG_EFI_PARTITION
  CONFIG_NET
  CONFIG_NETDEVICES
  CONFIG_PARTITION_ADVANCED
  CONFIG_WEXT_CORE
  CONFIG_WEXT_PROC
  CONFIG_WIRELESS

At this point thse are only a warnings, since there needs to be time for
layers and configuration fragments to be validated against this new
check.

[YOCTO: #6943]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass                  | 24 +++++++++++++++-------
 .../kern-tools/kern-tools-native_git.bb            |  2 +-
 meta/recipes-kernel/linux/linux-yocto.inc          |  6 ++++++
 3 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 223825e546a4..0cbbb5f2d22f 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -253,8 +253,6 @@ addtask kernel_configme after do_patch
 python do_kernel_configcheck() {
     import re, string, sys
 
-    bb.plain("NOTE: validating kernel config, see log.do_kernel_configcheck for details")
-
     # if KMETA isn't set globally by a recipe using this routine, we need to
     # set the default to 'meta'. Otherwise, kconf_check is not passed a valid
     # meta-series for processing
@@ -266,11 +264,23 @@ python do_kernel_configcheck() {
     cmd = d.expand("cd ${S}; kconf_check -config- %s/meta-series ${S} ${B}" % kmeta)
     ret, result = oe.utils.getstatusoutput("%s%s" % (pathprefix, cmd))
 
-    config_check_visibility = d.getVar( "KCONF_AUDIT_LEVEL", True ) or 1
-    if config_check_visibility == 1:
-        bb.debug( 1, "%s" % result )
-    else:
-        bb.note( "%s" % result )
+    config_check_visibility = int(d.getVar( "KCONF_AUDIT_LEVEL", True ) or 0)
+
+    # if config check visibility is non-zero, report dropped configuration values
+    mismatch_file = "${S}/" + kmeta + "/" + "mismatch.cfg"
+    if os.path.exists(mismatch_file):
+        if config_check_visibility:
+            with open (mismatch_file, "r") as myfile:
+                results = myfile.read()
+                bb.warn( "[kernel config]: specified values did not make it into the kernel's final configuration:\n\n%s" % results)
+
+    # if config check visibility is level 2 or higher, report non-hardware options
+    nonhw_file = "${S}/" + kmeta + "/" + "nonhw_report.cfg"
+    if os.path.exists(nonhw_file):
+        if config_check_visibility > 1:
+            with open (nonhw_file, "r") as myfile:
+                results = myfile.read()
+                bb.warn( "[kernel config]: BSP specified non-hw configuration:\n\n%s" % results)
 }
 
 # Ensure that the branches (BSP and meta) are on the locations specified by
diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 32783986487f..80d26f98749d 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=d8d1d729a70c
 
 DEPENDS = "git-native"
 
-SRCREV = "daab4442c22c09a98a823c32d7219316b6832182"
+SRCREV = "cab17f884998b43692244a863dea6f505c7f67af"
 PR = "r12"
 PV = "0.2+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 7416af99f57f..79b3f256f4bc 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -23,6 +23,12 @@ KBRANCH ?= "master"
 KMACHINE ?= "${MACHINE}"
 SRCREV_FORMAT ?= "meta_machine" 
 
+# LEVELS:
+#   0: no reporting
+#   1: report options that are specified, but not in the final config
+#   2: report options that are not hardware related, but set by a BSP
+KCONF_AUDIT_LEVEL ?= "1"
+
 LINUX_VERSION_EXTENSION ?= "-yocto-${LINUX_KERNEL_TYPE}"
 
 do_patch[depends] = "kern-tools-native:do_populate_sysroot"
-- 
2.1.0


