Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4AD2277D70
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 06:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491545386; x=1523081386;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=RcbJ0YCtl8rsunu3VqGpYwr4c/t0PQH0Oo1yEF5ltIA=;
	b=Wol/lBIOCWo9dKOx2YgQUwU3uW1LQkiRCjC38JKX07fNnktX4OUcZNj8
	EyFRLOaLt52ol+Y/fFXDNRJwoYX7PQ==;
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Apr 2017 23:09:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,163,1488873600"; d="scan'208";a="85788862"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 06 Apr 2017 23:09:45 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id F41126A4080;
	Thu,  6 Apr 2017 23:09:35 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Apr 2017 09:09:36 +0300
Message-Id: <d071facbbdbb48f34e0f0d9500872349c1130a9a.1491483222.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1491483222.git.jussi.kukkonen@intel.com>
References: <cover.1491483222.git.jussi.kukkonen@intel.com>
Subject: [PATCH 4/4] native.bbclass: Use fixed DISTRO_FEATURES
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
X-List-Received-Date: Fri, 07 Apr 2017 06:09:44 -0000

There seems to be no advantage to letting distro features affect
native builds. There is a significant disadvantage: a change to
DISTRO_FEATURES will trigger a lot of unnecessary native tasks. In a
test like this:
  $ bitbake core-image-minimal
  # append " systemd" to DISTRO_FEATURES
  $ bitbake core-image-minimal
The latter build takes 44 minutes (28%) of cpu-time less with this
patch (skipping 135 native tasks). Sadly wall clock time was not
affected as glibc remains the bottleneck.

Set DISTRO_FEATURES to a fixed value for native recipes to avoid the
unnecessary tasks: currently the default value is empty.

Do the variable setting in native_virtclass_handler() because otherwise
it could still be overridden by appends and the feature backfilling.
Shuffle the early returns so DISTRO_FEATURES gets set as long as
the packagename ends with "-native".

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/classes/native.bbclass | 12 ++++++++----
 meta/conf/bitbake.conf      |  2 ++
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index 1919fbc..fbca4c6 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -121,14 +121,18 @@ PATH_prepend = "${COREBASE}/scripts/native-intercept:"
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
+    d.setVar("DISTRO_FEATURES", "${NATIVE_DISTRO_FEATURES}")
+
+    classextend = e.data.getVar('BBCLASSEXTEND') or ""
+    if "native" not in classextend:
+        return
+
     def map_dependencies(varname, d, suffix = ""):
         if suffix:
             varname = varname + "_" + suffix
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 5e98d45..78a3470 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -789,6 +789,8 @@ MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS ?= ""
 EXTRA_IMAGE_FEATURES ??= ""
 IMAGE_FEATURES += "${EXTRA_IMAGE_FEATURES}"
 
+NATIVE_DISTRO_FEATURES ?= ""
+
 DISTRO_FEATURES_BACKFILL = "pulseaudio sysvinit bluez5 gobject-introspection-data ldconfig"
 MACHINE_FEATURES_BACKFILL = "rtc qemu-usermode"
 
-- 
2.1.4


