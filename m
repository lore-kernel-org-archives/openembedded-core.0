Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id AFF6C60034
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Nov 2015 14:17:11 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 02 Nov 2015 06:17:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,234,1444719600"; d="scan'208";a="809687490"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 02 Nov 2015 06:17:11 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 64BC16A4005
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Nov 2015 06:16:08 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Nov 2015 16:17:19 +0200
Message-Id: <1446473839-498-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] gnome-desktop-testing: fix ptest output format
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
X-List-Received-Date: Mon, 02 Nov 2015 14:17:12 -0000

Fix ptest output format for glib-2.0 and other packages
which depends on gnome-desktop-testing framework.

[YOCTO #6601]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../update-output-syntax.patch                     | 27 ++++++++++++++++++++++
 .../gnome-desktop-testing_2014.1.bb                |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing/update-output-syntax.patch

diff --git a/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing/update-output-syntax.patch b/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing/update-output-syntax.patch
new file mode 100644
index 0000000..5a178e2
--- /dev/null
+++ b/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing/update-output-syntax.patch
@@ -0,0 +1,27 @@
+
+The terms `FAIL` instead of `FAILED` and `SKIP` instead of `SKIPPED`
+match what Automake does
+
+Upstream-Status: Accepted
+[ https://git.gnome.org/browse/gnome-desktop-testing/commit/?id=048850731a640532ef55a61df7357fcc6d2ad501 ]
+
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
+---
+diff -Naur gnome-desktop-testing-2014.1-orig/src/gnome-desktop-testing-runner.c gnome-desktop-testing-2014.1/src/gnome-desktop-testing-runner.c
+--- gnome-desktop-testing-2014.1-orig/src/gnome-desktop-testing-runner.c	2014-01-16 12:58:26.000000000 +0200
++++ gnome-desktop-testing-2014.1/src/gnome-desktop-testing-runner.c	2015-11-02 11:27:34.010594126 +0200
+@@ -280,12 +280,12 @@
+   else if (test->state == TEST_STATE_COMPLETE_FAILED)
+     {
+       msgid_value = ONE_TEST_FAILED_MSGID;
+-      msg = g_strconcat ("FAILED: ", test->name, " (", reason, ")", NULL);
++      msg = g_strconcat ("FAIL: ", test->name, " (", reason, ")", NULL);
+     }
+   else if (test->state == TEST_STATE_COMPLETE_SKIPPED)
+     {
+       msgid_value = ONE_TEST_SKIPPED_MSGID;
+-      msg = g_strconcat ("SKIPPED: ", test->name, NULL);
++      msg = g_strconcat ("SKIP: ", test->name, NULL);
+     }
+   else
+     g_assert_not_reached ();
diff --git a/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2014.1.bb b/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2014.1.bb
index 482de99..ccb3d3b 100644
--- a/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2014.1.bb
+++ b/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2014.1.bb
@@ -4,6 +4,7 @@ LICENSE = "LGPLv2+"
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-gsystem-subprocess.c-Enable-GNU-extensions-in-system.patch \
+           file://update-output-syntax.patch \
           "
 SRC_URI[md5sum] = "a608ad72a77e23a1aecdfd8d07a94baf"
 SRC_URI[sha256sum] = "1a3eed73678dd22d09d6a7ec4f899557df3e8b4a802affa76d0f163b31286539"
-- 
2.4.0


