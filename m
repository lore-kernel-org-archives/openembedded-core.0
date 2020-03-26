Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 by mx.groups.io with SMTP id smtpd.web11.39703.1585236363958318948
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 08:26:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=syntax error for token:  (domain: kernel.crashing.org, ip: 76.164.61.194, mailfrom: mark.hatle@kernel.crashing.org)
Received: from lons-builder.int.hatle.net ([192.40.192.88])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 02QFQ0fR015172
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2020 10:26:02 -0500
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Subject: [v2 PATCH] base.bbclass: Add COMPATIBLE_OS, useful for non-Linux target recipes
Date: Thu, 26 Mar 2020 10:25:59 -0500
Message-Id: <20200326152559.64446-1-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1

Add the ability to generate non-Linux based components, such as
baremetal, FreeRTOS, Zypher, etc, exist.  There is a need for a way
to take components as specific to a given OS.

This is especially important in a multiconfig build where you may be
targeting different OSes which different sets of recipes in a common
set of layers.

Setting a default of (matching bitbake.conf's default TARGET_OS):

   COMPATIBLE_OS ?= "linux${LIBCEXTENSION}${ABIEXTENSION}"

will allow all existing recipes to be tagged as Linux specific, so
only non-Linux recipes would need to be tagged with specific
compatibility.

For a baremetal recipes, the following was used to test this code:

   COMPATIBLE_OS = "elf"
   COMPATIBLE_OS_arm = "eabi"

Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
V2:
Only difference to V1 is typograhic fixes to the commit message.

 meta/classes/base.bbclass    | 7 +++++++
 meta/conf/documentation.conf | 1 +
 2 files changed, 8 insertions(+)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 45f9435fd8..c123c5dc50 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -509,6 +509,13 @@ python () {
         d.setVarFlag('do_devshell', 'fakeroot', '1')
         d.appendVarFlag('do_devshell', 'depends', ' virtual/fakeroot-native:do_populate_sysroot')
 
+    need_os = d.getVar('COMPATIBLE_OS')
+    if need_os and not d.getVar('PARSE_ALL_RECIPES', False):
+        import re
+        this_os = d.getVar('TARGET_OS')
+        if not re.match(need_os, this_os):
+            raise bb.parse.SkipRecipe("incompatible with os %s (not in COMPATIBLE_OS)" % this_os)
+
     need_machine = d.getVar('COMPATIBLE_MACHINE')
     if need_machine and not d.getVar('PARSE_ALL_RECIPES', False):
         import re
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 0b21d1f63e..7a87540f43 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -111,6 +111,7 @@ COMBINED_FEATURES[doc] = "A set of features common between MACHINE_FEATURES and
 COMMON_LICENSE_DIR[doc] = "Points to meta/files/common-licenses in the Source Directory, which is where generic license files reside."
 COMPATIBLE_HOST[doc] = "A regular expression that resolves to one or more hosts (when the recipe is native) or one or more targets (when the recipe is non-native) with which a recipe is compatible."
 COMPATIBLE_MACHINE[doc] = "A regular expression that resolves to one or more target machines with which a recipe is compatible."
+COMPATIBLE_OS[doc] = "A regular expression that resolves to one or more target oses which a recipe is compatible."
 COMPLEMENTARY_GLOB[doc] = "Defines wildcards to match when installing a list of complementary packages for all the packages installed in an image."
 CONFFILES[doc] = "Identifies editable or configurable files that are part of a package."
 CONFIG_SITE[doc] = "A list of files that contains autoconf test results relevant to the current build. This variable is used by the Autotools utilities when running configure."
-- 
2.17.1

