Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web09.3494.1611282630196437417
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jan 2021 18:30:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 3Vmp9a5OLM138aTJYnMtPrYUnTkDabOI/za94E49EPtuIDXLpCKIYTzbTSoA3zeTcAiIvFzo7/
 fItHDIXZ0HbQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9871"; a="198125699"
X-IronPort-AV: E=Sophos;i="5.79,365,1602572400"; 
   d="scan'208";a="198125699"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2021 18:30:28 -0800
IronPort-SDR: 69SYBO8hvLsjoqQ1oG7EIpL7CtfDaKdol0p5xrEeSVX9Q9iZy3sk2wNfqu2qFnyeuW5Qz8BaBl
 giga/mAEAMcw==
X-IronPort-AV: E=Sophos;i="5.79,365,1602572400"; 
   d="scan'208";a="574480989"
Received: from bchon-mobl3.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.183.238])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2021 18:30:26 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gstreamer1.0: fix failing ptest
Date: Fri, 22 Jan 2021 10:30:21 +0800
Message-Id: <20210122023021.583568-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Backport a patch to increase the timeout that might help with the
intermittent seek test failure.

[YOCTO #14194]

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...-use-too-strict-timeout-for-validati.patch | 32 +++++++++++++++++++
 .../gstreamer/gstreamer1.0_1.18.3.bb          |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-seek-Don-t-use-too-strict-timeout-for-validati.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-seek-Don-t-use-too-strict-timeout-for-validati.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-seek-Don-t-use-too-strict-timeout-for-validati.patch
new file mode 100644
index 0000000000..e0e64e2c7a
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-tests-seek-Don-t-use-too-strict-timeout-for-validati.patch
@@ -0,0 +1,32 @@
+From 1db36347d05d88835519368442e9aa89c64091ad Mon Sep 17 00:00:00 2001
+From: Seungha Yang <seungha@centricular.com>
+Date: Tue, 15 Sep 2020 00:54:58 +0900
+Subject: [PATCH] tests: seek: Don't use too strict timeout for validation
+
+Expected segment-done message might not be seen within expected
+time if system is not powerful enough.
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/625>
+
+Upstream-Status: Backport [https://cgit.freedesktop.org/gstreamer/gstreamer/commit?id=f44312ae5d831438fcf8041162079c65321c588c]
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ tests/check/pipelines/seek.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/check/pipelines/seek.c b/tests/check/pipelines/seek.c
+index 28bb8846d..5f7447bc5 100644
+--- a/tests/check/pipelines/seek.c
++++ b/tests/check/pipelines/seek.c
+@@ -521,7 +521,7 @@ GST_START_TEST (test_loopback_2)
+ 
+   GST_INFO ("wait for segment done message");
+ 
+-  msg = gst_bus_timed_pop_filtered (bus, (GstClockTime) 2 * GST_SECOND,
++  msg = gst_bus_timed_pop_filtered (bus, GST_CLOCK_TIME_NONE,
+       GST_MESSAGE_SEGMENT_DONE | GST_MESSAGE_ERROR);
+   fail_unless (msg, "no message within the timed window");
+   fail_unless_equals_string (GST_MESSAGE_TYPE_NAME (msg), "segment-done");
+-- 
+2.29.2
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.3.bb
index 7ad0248b7c..9cb07726ed 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.18.3.bb
@@ -19,6 +19,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0001-gst-gstpluginloader.c-when-env-var-is-set-do-not-fal.patch \
            file://0002-Remove-unused-valgrind-detection.patch \
            file://0003-meson-Add-option-for-installed-tests.patch \
+           file://0001-tests-seek-Don-t-use-too-strict-timeout-for-validati.patch \
            "
 SRC_URI[sha256sum] = "0c2e09e18f2df69a99b5cb3bd53c597b3cc2e35cf6c98043bb86a66f3d312100"
 
-- 
2.29.2

