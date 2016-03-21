Return-Path: <william.c.randle@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 9DDC165CB5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 23:22:26 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 21 Mar 2016 16:22:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,374,1455004800"; d="scan'208";a="938726846"
Received: from wcrandle-mobl1.jf.intel.com ([10.24.6.123])
	by orsmga002.jf.intel.com with ESMTP; 21 Mar 2016 16:22:26 -0700
From: Bill Randle <william.c.randle@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Mar 2016 16:22:12 -0700
Message-Id: <1458602532-22796-1-git-send-email-william.c.randle@intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [jethro][PATCH] systemd: fix segfault on shutdown
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
X-List-Received-Date: Mon, 21 Mar 2016 23:22:29 -0000

This applies upstream fixes to fix a segfault in systemd-logind on
shutdown.

[Fixes YOCTO #9265]

Signed-off-by: Bill Randle <william.c.randle@intel.com>
---
 .../0023-backported-fixes-for-null-messages.patch  | 101 +++++++++++++++++++++
 meta/recipes-core/systemd/systemd_225.bb           |   1 +
 2 files changed, 102 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0023-backported-fixes-for-null-messages.patch

diff --git a/meta/recipes-core/systemd/systemd/0023-backported-fixes-for-null-messages.patch b/meta/recipes-core/systemd/systemd/0023-backported-fixes-for-null-messages.patch
new file mode 100644
index 0000000..33570dd
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0023-backported-fixes-for-null-messages.patch
@@ -0,0 +1,101 @@
+From ce88232a1c8e914936e18edbee2551ab95fc4c1d Mon Sep 17 00:00:00 2001
+From: Bill Randle <william.c.randle@intel.com>
+Date: Mon, 21 Mar 2016 15:52:30 -0700
+Subject: [PATCH] backported fixes for null messages
+
+Apply upstream commits 5744f59a3ee883ef3a78214bd5236157acdc35ba,
+2cf088b56d72cb6a3243041524f1fbae7c1cb28e and
+c7430c3d1a0c14aed631864b9da504ba1a9352c2 to fix Yocto #9265.
+
+Upstream-Status: Backport
+
+Signed-off-by: Bill Randle <william.c.randle@intel.com>
+---
+ src/login/logind-dbus.c | 31 ++++++++++++++++++-------------
+ 1 file changed, 18 insertions(+), 13 deletions(-)
+
+diff --git a/src/login/logind-dbus.c b/src/login/logind-dbus.c
+index 5b2b36b..e433549 100644
+--- a/src/login/logind-dbus.c
++++ b/src/login/logind-dbus.c
+@@ -1339,8 +1339,7 @@ static int bus_manager_log_shutdown(
+                 InhibitWhat w,
+                 const char *unit_name) {
+ 
+-        const char *p;
+-        const char *q;
++        const char *p, *q;
+ 
+         assert(m);
+         assert(unit_name);
+@@ -1365,8 +1364,8 @@ static int bus_manager_log_shutdown(
+                 q = NULL;
+         }
+ 
+-        if (m->wall_message)
+-                p = strjoina(p, " (", m->wall_message, ")", NULL);
++        if (!isempty(m->wall_message))
++                p = strjoina(p, " (", m->wall_message, ")");
+ 
+         return log_struct(LOG_NOTICE,
+                           LOG_MESSAGE_ID(SD_MESSAGE_SHUTDOWN),
+@@ -1797,9 +1796,11 @@ static int update_schedule_file(Manager *m) {
+         if (r < 0)
+                 return log_error_errno(r, "Failed to create shutdown subdirectory: %m");
+ 
+-        t = cescape(m->wall_message);
+-        if (!t)
+-                return log_oom();
++        if (!isempty(m->wall_message)) {
++                t = cescape(m->wall_message);
++                if (!t)
++                        return log_oom();
++        }
+ 
+         r = fopen_temporary("/run/systemd/shutdown/scheduled", &f, &temp_path);
+         if (r < 0)
+@@ -1815,7 +1816,7 @@ static int update_schedule_file(Manager *m) {
+                 m->enable_wall_messages,
+                 m->scheduled_shutdown_type);
+ 
+-        if (!isempty(m->wall_message))
++        if (t)
+                 fprintf(f, "WALL_MESSAGE=%s\n", t);
+ 
+         r = fflush_and_check(f);
+@@ -2294,7 +2295,7 @@ static int method_set_wall_message(
+         int r;
+         Manager *m = userdata;
+         char *wall_message;
+-        bool enable_wall_messages;
++        int enable_wall_messages;
+ 
+         assert(message);
+         assert(m);
+@@ -2310,15 +2311,19 @@ static int method_set_wall_message(
+                                     UID_INVALID,
+                                     &m->polkit_registry,
+                                     error);
+-
+         if (r < 0)
+                 return r;
+         if (r == 0)
+                 return 1; /* Will call us back */
+ 
+-        r = free_and_strdup(&m->wall_message, wall_message);
+-        if (r < 0)
+-                return log_oom();
++        if (isempty(wall_message))
++                m->wall_message = mfree(m->wall_message);
++        else {
++                r = free_and_strdup(&m->wall_message, wall_message);
++                if (r < 0)
++                        return log_oom();
++        }
++
+         m->enable_wall_messages = enable_wall_messages;
+ 
+         return sd_bus_reply_method_return(message, NULL);
+-- 
+2.5.0
+
diff --git a/meta/recipes-core/systemd/systemd_225.bb b/meta/recipes-core/systemd/systemd_225.bb
index 18c2448..7c66ba2 100644
--- a/meta/recipes-core/systemd/systemd_225.bb
+++ b/meta/recipes-core/systemd/systemd_225.bb
@@ -46,6 +46,7 @@ SRC_URI = "git://github.com/systemd/systemd.git;protocol=git \
            file://init \
            file://run-ptest \
            file://rules-whitelist-hd-devices.patch \
+           file://0023-backported-fixes-for-null-messages.patch \
           "
 SRC_URI_append_qemuall = " file://qemuall_io_latency-core-device.c-Change-the-default-device-timeout-to-2.patch"
 
-- 
2.5.0


