Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4D20F719DE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 07:40:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u9P7eZBU018084
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 00:40:35 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.209) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 25 Oct 2016 00:40:34 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 25 Oct 2016 15:40:44 +0800
Message-ID: <20eff30466bc455870852e4f071507726571fe68.1477381190.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1477381190.git.Qi.Chen@windriver.com>
References: <cover.1477381190.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] systemd: CVE-2016-7795
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
X-List-Received-Date: Tue, 25 Oct 2016 07:40:34 -0000
Content-Type: text/plain

The manager_invoke_notify_message function in systemd 231 and earlier allows
local users to cause a denial of service (assertion failure and PID 1 hang)
via a zero-length message received over a notify socket.

The patch is a backport from the latest git repo.

Please see the link below for more information.
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-7795

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...s-zero-length-notification-messages-again.patch | 68 ++++++++++++++++++++++
 meta/recipes-core/systemd/systemd_230.bb           |  1 +
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-pid1-process-zero-length-notification-messages-again.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-pid1-process-zero-length-notification-messages-again.patch b/meta/recipes-core/systemd/systemd/0001-pid1-process-zero-length-notification-messages-again.patch
new file mode 100644
index 0000000..0332593
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-pid1-process-zero-length-notification-messages-again.patch
@@ -0,0 +1,68 @@
+Subject: pid1: process zero-length notification messages again
+
+This undoes 531ac2b. I acked that patch without looking at the code
+carefully enough. There are two problems:
+- we want to process the fds anyway
+- in principle empty notification messages are valid, and we should
+  process them as usual, including logging using log_unit_debug().
+
+Upstream-Status: Backport
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/core/manager.c | 11 ++++++-----
+ 1 file changed, 6 insertions(+), 5 deletions(-)
+
+diff --git a/src/core/manager.c b/src/core/manager.c
+index 7838f56..f165d08e 100644
+--- a/src/core/manager.c
++++ b/src/core/manager.c
+@@ -1589,13 +1589,12 @@ static int manager_dispatch_cgroups_agent_fd(sd_event_source *source, int fd, ui
+         return 0;
+ }
+ 
+-static void manager_invoke_notify_message(Manager *m, Unit *u, pid_t pid, const char *buf, size_t n, FDSet *fds) {
++static void manager_invoke_notify_message(Manager *m, Unit *u, pid_t pid, const char *buf, FDSet *fds) {
+         _cleanup_strv_free_ char **tags = NULL;
+ 
+         assert(m);
+         assert(u);
+         assert(buf);
+-        assert(n > 0);
+ 
+         tags = strv_split(buf, "\n\r");
+         if (!tags) {
+@@ -1688,25 +1687,27 @@ static int manager_dispatch_notify_fd(sd_event_source *source, int fd, uint32_t
+                 return 0;
+         }
+ 
++        /* The message should be a string. Here we make sure it's NUL-terminated,
++         * but only the part until first NUL will be used anyway. */
+         buf[n] = 0;
+ 
+         /* Notify every unit that might be interested, but try
+          * to avoid notifying the same one multiple times. */
+         u1 = manager_get_unit_by_pid_cgroup(m, ucred->pid);
+         if (u1) {
+-                manager_invoke_notify_message(m, u1, ucred->pid, buf, n, fds);
++                manager_invoke_notify_message(m, u1, ucred->pid, buf, fds);
+                 found = true;
+         }
+ 
+         u2 = hashmap_get(m->watch_pids1, PID_TO_PTR(ucred->pid));
+         if (u2 && u2 != u1) {
+-                manager_invoke_notify_message(m, u2, ucred->pid, buf, n, fds);
++                manager_invoke_notify_message(m, u2, ucred->pid, buf, fds);
+                 found = true;
+         }
+ 
+         u3 = hashmap_get(m->watch_pids2, PID_TO_PTR(ucred->pid));
+         if (u3 && u3 != u2 && u3 != u1) {
+-                manager_invoke_notify_message(m, u3, ucred->pid, buf, n, fds);
++                manager_invoke_notify_message(m, u3, ucred->pid, buf, fds);
+                 found = true;
+         }
+ 
+-- 
+2.8.3
+
diff --git a/meta/recipes-core/systemd/systemd_230.bb b/meta/recipes-core/systemd/systemd_230.bb
index a949fe8..1a266c8 100644
--- a/meta/recipes-core/systemd/systemd_230.bb
+++ b/meta/recipes-core/systemd/systemd_230.bb
@@ -36,6 +36,7 @@ SRC_URI += " \
            file://0021-include-missing.h-for-getting-secure_getenv-definiti.patch \
            file://0022-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch \
            file://udev-re-enable-mount-propagation-for-udevd.patch \
+           file://0001-pid1-process-zero-length-notification-messages-again.patch \
 "
 SRC_URI_append_libc-uclibc = "\
            file://0002-units-Prefer-getty-to-agetty-in-console-setup-system.patch \
-- 
1.9.1


