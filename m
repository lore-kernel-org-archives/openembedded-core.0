Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7801577D30
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 10:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491908136; x=1523444136;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=yjbLZH9ZjcrZqJwHMQMKZSZ3wBfeA8zuBtsVrWk+ocI=;
	b=M/HaS4eNgb35uw9+Sn4eD13b+ew7JKG5e0VCy6qWEDtq6kL6ynremwE9
	uzTGTBwHvlEWQYWHsQrSE0U1Yym27w==;
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Apr 2017 03:55:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,185,1488873600"; d="scan'208";a="72498235"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 11 Apr 2017 03:55:35 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 443966A4006;
	Tue, 11 Apr 2017 03:55:25 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Apr 2017 13:55:24 +0300
Message-Id: <249c74e24159b85231ab5ce7655bb6f12b01f32a.1491907553.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1491907553.git.jussi.kukkonen@intel.com>
References: <cover.1491907553.git.jussi.kukkonen@intel.com>
Subject: [PATCHv2 4/4] native.bbclass: Use fixed DISTRO_FEATURES
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
X-List-Received-Date: Tue, 11 Apr 2017 10:55:34 -0000

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

Set native distro features to an intersection of DISTRO_FEATURES and
DISTRO_FEATURES_FILTER_NATIVE (which is defined in bitbake.conf).
Current filter includes only "api-documentation" (as gtk-doc-native
has much less dependencies when built without it)

Do the variable setting in native_virtclass_handler() because otherwise
it could still be overridden by appends and the feature backfilling.
Shuffle the early returns so DISTRO_FEATURES gets set as long as
the packagename ends with "-native".

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/classes/native.bbclass | 13 +++++++++----
 meta/conf/bitbake.conf      |  4 ++++
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index 1919fbc..225e062 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -121,14 +121,19 @@ PATH_prepend = "${COREBASE}/scripts/native-intercept:"
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
+    features = bb.utils.filter("DISTRO_FEATURES", d.getVar("DISTRO_FEATURES_FILTER_NATIVE"), d)
+    d.setVar("DISTRO_FEATURES", features)
+
+    classextend = e.data.getVar('BBCLASSEXTEND') or ""
+    if "native" not in classextend:
+        return
+
     def map_dependencies(varname, d, suffix = ""):
         if suffix:
             varname = varname + "_" + suffix
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 5e98d45..c959960 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -789,6 +789,10 @@ MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS ?= ""
 EXTRA_IMAGE_FEATURES ??= ""
 IMAGE_FEATURES += "${EXTRA_IMAGE_FEATURES}"
 
+# Distro features that can affect native recipes (all other features
+# will be removed for the -native case).
+DISTRO_FEATURES_FILTER_NATIVE ?= "api-documentation"
+
 DISTRO_FEATURES_BACKFILL = "pulseaudio sysvinit bluez5 gobject-introspection-data ldconfig"
 MACHINE_FEATURES_BACKFILL = "rtc qemu-usermode"
 
-- 
2.1.4


