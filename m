Received: from mga03.intel.com (mga03.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.48460.1612244058134667125
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Feb 2021 21:34:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: nuS3+k2WOqA4kAKxXfSxyfc5DaXcqgBdG4AGneGn4sQNZHLsN0gzCp9xuKxBeRoTcWgNmD5Xt4
 VHInozgJ7vcw==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="180876889"
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; 
   d="scan'208";a="180876889"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 21:34:23 -0800
IronPort-SDR: Yg0eGVU1zE7Oz1xqYlJw37BiV/BtUR1+qO34NghWXFviKJzBb2NAPPMMBmB98T0XtW4ITi3zSs
 yTmBcTpQc1qQ==
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; 
   d="scan'208";a="370360913"
Received: from ajayap1x-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.184.137])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 21:34:22 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 08/25] gstreamer1.0: fix failing ptest
Date: Tue,  2 Feb 2021 13:33:51 +0800
Message-Id: <f9f4191a6fcc1474fa2b7d96c7f82f066ae02cb4.1612243805.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1612243805.git.anuj.mittal@intel.com>
References: <cover.1612243805.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Backport a patch to increase the timeout that might help with the
intermittent seek test failure.

[YOCTO #14194]

(From OE-Core rev: a7dc7a35334ad634926a1386f4a56b27aad3ce68)

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7b90027aac9fa41b3dc98765151d761df8dabb97)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...-use-too-strict-timeout-for-validati.patch | 32 +++++++++++++++++++
 .../gstreamer/gstreamer1.0_1.16.3.bb          |  1 +
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
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.3.bb
index 7afe56cd7b..632ef8819c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.3.bb
@@ -22,6 +22,7 @@ SRC_URI = " \
     file://0003-meson-Add-valgrind-feature.patch \
     file://0004-meson-Add-option-for-installed-tests.patch \
     file://0005-bufferpool-only-resize-in-reset-when-maxsize-is-larger.patch \
+    file://0001-tests-seek-Don-t-use-too-strict-timeout-for-validati.patch \
 "
 SRC_URI[md5sum] = "beecf6965a17fb17fa3b262fd36df70a"
 SRC_URI[sha256sum] = "692f037968e454e508b0f71d9674e2e26c78475021407fcf8193b1c7e59543c7"
-- 
2.29.2

