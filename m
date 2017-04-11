Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 5BDFA77C05
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 14:35:44 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Apr 2017 07:35:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,185,1488873600"; d="scan'208";a="954782002"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 11 Apr 2017 07:35:45 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 20D736A4006;
	Tue, 11 Apr 2017 07:35:35 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Apr 2017 17:35:40 +0300
Message-Id: <ea482eb749a7dbeb22743bf6ce3f31c447b970bf.1491920909.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1491920909.git.jussi.kukkonen@intel.com>
References: <cover.1491920909.git.jussi.kukkonen@intel.com>
Subject: [PATCHv3 1/1] native/nativesdk: Use fixed DISTRO_FEATURES
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
X-List-Received-Date: Tue, 11 Apr 2017 14:35:45 -0000

There seems to be little advantage to letting distro features affect
native builds. There is a significant disadvantage: a change to
DISTRO_FEATURES will trigger a lot of unnecessary native tasks. In a
test like this:
  $ bitbake core-image-minimal
  # append " systemd" to DISTRO_FEATURES
  $ bitbake core-image-minimal
The latter build takes 44 minutes (28%) of cpu-time less with this
patch (skipping 135 native tasks). Sadly wall clock time was not
affected as glibc remains the bottleneck.

Set native distro features to DISTRO_FEATURES_NATIVE appended with
an intersection of DISTRO_FEATURES and DISTRO_FEATURES_FILTER_NATIVE.
Current default values (baitbake.conf) are
* DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation" (as gtk-doc-native
has much less dependencies when built without it)
* DISTRO_FEATURES_NATIVE ?= "x11" (to enable native UIs even if target
does not containe them)

Do the variable setting in native_virtclass_handler() because otherwise
it could still be overridden by appends and the feature backfilling.
Shuffle the early returns so DISTRO_FEATURES gets set as long as
the packagename ends with "-native".

Add similar variables for nativesdk.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/classes/native.bbclass    | 14 ++++++++++----
 meta/classes/nativesdk.bbclass |  6 ++++++
 meta/conf/bitbake.conf         |  9 +++++++++
 3 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index 1919fbc..aec1087 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -121,14 +121,20 @@ PATH_prepend = "${COREBASE}/scripts/native-intercept:"
 SSTATE_SCAN_CMD ?= "${SSTATE_SCAN_CMD_NATIVE}"
 
 python native_virtclass_handler () {
-    classextend = e.data.getVar('BBCLASSEXTEND') or ""
-    if "native" not in classextend:
-        return
-
     pn = e.data.getVar("PN")
     if not pn.endswith("-native"):
         return
 
+    # Set features here to prevent appends and distro features backfill
+    # from modifying native distro features
+    features = set(d.getVar("DISTRO_FEATURES_NATIVE").split())
+    filtered = set(bb.utils.filter("DISTRO_FEATURES", d.getVar("DISTRO_FEATURES_FILTER_NATIVE"), d).split())
+    d.setVar("DISTRO_FEATURES", " ".join(features | filtered))
+
+    classextend = e.data.getVar('BBCLASSEXTEND') or ""
+    if "native" not in classextend:
+        return
+
     def map_dependencies(varname, d, suffix = ""):
         if suffix:
             varname = varname + "_" + suffix
diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbclass
index ebcfb2d..655b456 100644
--- a/meta/classes/nativesdk.bbclass
+++ b/meta/classes/nativesdk.bbclass
@@ -70,6 +70,12 @@ python nativesdk_virtclass_handler () {
     if not (pn.endswith("-nativesdk") or pn.startswith("nativesdk-")):
         return
 
+    # Set features here to prevent appends and distro features backfill
+    # from modifying nativesdk distro features
+    features = set(d.getVar("DISTRO_FEATURES_NATIVESDK").split())
+    filtered = set(bb.utils.filter("DISTRO_FEATURES", d.getVar("DISTRO_FEATURES_FILTER_NATIVESDK"), d).split())
+    d.setVar("DISTRO_FEATURES", " ".join(features | filtered))
+
     e.data.setVar("MLPREFIX", "nativesdk-")
     e.data.setVar("PN", "nativesdk-" + e.data.getVar("PN").replace("-nativesdk", "").replace("nativesdk-", ""))
     e.data.setVar("OVERRIDES", e.data.getVar("OVERRIDES", False) + ":virtclass-nativesdk")
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 5e98d45..dca6bd4 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -789,6 +789,15 @@ MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS ?= ""
 EXTRA_IMAGE_FEATURES ??= ""
 IMAGE_FEATURES += "${EXTRA_IMAGE_FEATURES}"
 
+# Native distro features (will always be used for -native, even if they
+# are not enabled for target)
+DISTRO_FEATURES_NATIVE ?= "x11"
+DISTRO_FEATURES_NATIVESDK ?= "x11"
+# Normally target distro features will not be applied to native builds:
+# Native distro features on this list will use the target feature value
+DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation"
+DISTRO_FEATURES_FILTER_NATIVESDK ?= "api-documentation"
+
 DISTRO_FEATURES_BACKFILL = "pulseaudio sysvinit bluez5 gobject-introspection-data ldconfig"
 MACHINE_FEATURES_BACKFILL = "rtc qemu-usermode"
 
-- 
2.1.4


