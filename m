Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5E38177053
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 15:35:18 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 30 Sep 2015 08:35:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,613,1437462000"; d="scan'208";a="781011050"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga001.jf.intel.com with ESMTP; 30 Sep 2015 08:35:17 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org, joshua.lock@collabora.co.uk,
	akuster808@gmail.com
Date: Wed, 30 Sep 2015 18:37:43 +0300
Message-Id: <234997d0d5118fd52dba6b2e8f4c0805d211d6ce.1443624731.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <e636475eca83f69162538109ca09176a69d6a21c.1443624731.git.jussi.kukkonen@intel.com>
References: <e636475eca83f69162538109ca09176a69d6a21c.1443624731.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1443624731.git.jussi.kukkonen@intel.com>
References: <cover.1443624731.git.jussi.kukkonen@intel.com>
Subject: [PATCH 2/3] dbus: Use the xuser policy file
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
X-List-Received-Date: Wed, 30 Sep 2015 15:35:18 -0000

Apply the xuser-related policies (if they have been installed by
xuser-account) after the service-specific policies are applied.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-core/dbus/dbus.inc                    |  1 +
 ...-Apply-xuser-specific-policies-if-present.patch | 33 ++++++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-core/dbus/dbus/0001-Apply-xuser-specific-policies-if-present.patch

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index 3971081..59e3afe 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -17,6 +17,7 @@ SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://dbus-1.init \
            file://os-test.patch \
            file://clear-guid_from_server-if-send_negotiate_unix_f.patch \
+           file://0001-Apply-xuser-specific-policies-if-present.patch \
 "
 
 inherit useradd autotools pkgconfig gettext update-rc.d
diff --git a/meta/recipes-core/dbus/dbus/0001-Apply-xuser-specific-policies-if-present.patch b/meta/recipes-core/dbus/dbus/0001-Apply-xuser-specific-policies-if-present.patch
new file mode 100644
index 0000000..01a4870
--- /dev/null
+++ b/meta/recipes-core/dbus/dbus/0001-Apply-xuser-specific-policies-if-present.patch
@@ -0,0 +1,33 @@
+From 3a37ec47ffc9e4d34ac726d649a822cdead1b38f Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Wed, 30 Sep 2015 11:25:08 +0300
+Subject: [PATCH] Apply xuser-specific policies if present
+
+system-xuser.conf is installed by xuser-account and contains
+policies that override the default service policies (allowing
+xuser to send messages to the services).
+
+Upstream-Status: Inappropriate [configuration]
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+---
+ bus/system.conf.in | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/bus/system.conf.in b/bus/system.conf.in
+index 851b9e6..1822011 100644
+--- a/bus/system.conf.in
++++ b/bus/system.conf.in
+@@ -82,6 +82,10 @@
+        holes in the above policy for specific services. -->
+   <includedir>system.d</includedir>
+ 
++  <!-- Apply xuser policies (if present) after the service
++       policies so the xuser ones don't get overridden. -->
++  <include ignore_missing="yes">system-xuser.conf</include>
++
+   <!-- This is included last so local configuration can override what's 
+        in this standard file -->
+   <include ignore_missing="yes">system-local.conf</include>
+-- 
+2.1.4
+
-- 
2.1.4


