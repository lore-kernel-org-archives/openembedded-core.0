Received: from mga05.intel.com (mga05.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.2365.1619671281658268226
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Apr 2021 21:41:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: mhSS7kCQvbGB5JCrkVixv+om87Two87k/1xHppSskrNITZ/LVv6Va9o9IV6hJ3r6Y+4gaZ1msO
 CsT2WXfgDUPw==
X-IronPort-AV: E=McAfee;i="6200,9189,9968"; a="282258338"
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; 
   d="scan'208";a="282258338"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2021 21:41:32 -0700
IronPort-SDR: S/HRpJEhjkVjKMmHUIqcavNRN73a2EiuMswIK7sRa+F4e1WrpJMm9rba+YFauij5+vzcAEZ35o
 xJnf5jLbtYXw==
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; 
   d="scan'208";a="423883673"
Received: from ytakikit-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.43.188])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2021 21:41:31 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 08/10] weston: fix build failure due to race condition
Date: Thu, 29 Apr 2021 12:41:05 +0800
Message-Id: <9147e34486d7d45365e590140c5f08aa4be367ee.1619667368.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619667368.git.anuj.mittal@intel.com>
References: <cover.1619667368.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen Qi <Qi.Chen@windriver.com>

The wayland.c actually include 'xdg-shell-client-protocol.h' instead of
the server one, so fix it. Otherwise, it's possible to get build failure
due to race condition.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bd2a9a4d82f66f1ff414c392bcf234d8dbd5e553)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...001-meson.build-fix-incorrect-header.patch | 32 +++++++++++++++++++
 meta/recipes-graphics/wayland/weston_9.0.0.bb |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-graphics/wayland/weston/0001-meson.build-fix-incorrect-header.patch

diff --git a/meta/recipes-graphics/wayland/weston/0001-meson.build-fix-incorrect-header.patch b/meta/recipes-graphics/wayland/weston/0001-meson.build-fix-incorrect-header.patch
new file mode 100644
index 0000000000..06e0f7baec
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston/0001-meson.build-fix-incorrect-header.patch
@@ -0,0 +1,32 @@
+From a2ba4714a6872e547621d29d9ddcb0f374b88cf6 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Tue, 20 Apr 2021 20:42:18 -0700
+Subject: [PATCH] meson.build: fix incorrect header
+
+The wayland.c actually include 'xdg-shell-client-protocol.h' instead of
+the server one, so fix it. Otherwise, it's possible to get build failure
+due to race condition.
+
+Upstream-Status: Pending
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ libweston/backend-wayland/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libweston/backend-wayland/meson.build b/libweston/backend-wayland/meson.build
+index 7e82513..29270b5 100644
+--- a/libweston/backend-wayland/meson.build
++++ b/libweston/backend-wayland/meson.build
+@@ -10,7 +10,7 @@ srcs_wlwl = [
+ 	fullscreen_shell_unstable_v1_protocol_c,
+ 	presentation_time_protocol_c,
+ 	presentation_time_server_protocol_h,
+-	xdg_shell_server_protocol_h,
++	xdg_shell_client_protocol_h,
+ 	xdg_shell_protocol_c,
+ ]
+ 
+-- 
+2.30.2
+
diff --git a/meta/recipes-graphics/wayland/weston_9.0.0.bb b/meta/recipes-graphics/wayland/weston_9.0.0.bb
index 50fbfa613b..bcbac06d58 100644
--- a/meta/recipes-graphics/wayland/weston_9.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_9.0.0.bb
@@ -11,6 +11,7 @@ SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://xwayland.weston-start \
            file://0001-weston-launch-Provide-a-default-version-that-doesn-t.patch \
            file://0001-tests-include-fcntl.h-for-open-O_RDWR-O_CLOEXEC-and-.patch \
+           file://0001-meson.build-fix-incorrect-header.patch \
 "
 
 SRC_URI_append_libc-musl = " file://dont-use-plane-add-prop.patch "
-- 
2.30.2

