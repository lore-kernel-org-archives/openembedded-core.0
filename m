Return-Path: <jason.wessel@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5F145719C8
	for <Openembedded-core@lists.openembedded.org>;
	Fri,  9 Dec 2016 17:16:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uB9HGNiu015381
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 9 Dec 2016 09:16:23 -0800 (PST)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 9 Dec 2016 09:16:22 -0800
From: Jason Wessel <jason.wessel@windriver.com>
To: <Openembedded-core@lists.openembedded.org>
Date: Fri, 9 Dec 2016 09:16:20 -0800
Message-ID: <20161209171620.59610-1-jason.wessel@windriver.com>
X-Mailer: git-send-email 2.10.1
MIME-Version: 1.0
Subject: [PATCH] systemd: Backport cgroup fix from 233 to 232
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
X-List-Received-Date: Fri, 09 Dec 2016 17:16:24 -0000
Content-Type: text/plain

There is a critical regression in the default behavior with systemd
232 which prevents lxc, docker, and opencontainers from working
properly out of the box.  The change was already committed to the
systemd 233 code stream.

The failure looks like what is shown below.

% lxc-start -n container -F
lxc-start: cgfsng.c: parse_hierarchies: 825 Failed to find current cgroup for controller 'name=systemd'
lxc-start: cgfsng.c: all_controllers_found: 431 no systemd controller mountpoint found
lxc-start: start.c: lxc_spawn: 1082 failed initializing cgroup support
lxc-start: start.c: __lxc_start: 1332 failed to spawn 'container'
lxc-start: lxc_start.c: main: 344 The container failed to start.
lxc-start: lxc_start.c: main: 348 Additional information can be obtained by setting the --logfile and --logpriority options.

Commit 843d5baf6aad6c53fc00ea8d95d83209a4f92de1 from the systemd git
has been backported and can be dropped in a future uprev.

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 ...use-the-unified-hierarchy-for-the-systemd.patch | 51 ++++++++++++++++++++++
 meta/recipes-core/systemd/systemd_232.bb           |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0020-back-port-233-don-t-use-the-unified-hierarchy-for-the-systemd.patch

diff --git a/meta/recipes-core/systemd/systemd/0020-back-port-233-don-t-use-the-unified-hierarchy-for-the-systemd.patch b/meta/recipes-core/systemd/systemd/0020-back-port-233-don-t-use-the-unified-hierarchy-for-the-systemd.patch
new file mode 100644
index 0000000..ef2d868
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0020-back-port-233-don-t-use-the-unified-hierarchy-for-the-systemd.patch
@@ -0,0 +1,51 @@
+This is a direct backport from systemd-233's stream to fix lxc/docker.
+
+% lxc-start -n container -F
+lxc-start: cgfsng.c: parse_hierarchies: 825 Failed to find current cgroup for controller 'name=systemd'
+lxc-start: cgfsng.c: all_controllers_found: 431 no systemd controller mountpoint found
+lxc-start: start.c: lxc_spawn: 1082 failed initializing cgroup support
+lxc-start: start.c: __lxc_start: 1332 failed to spawn 'container'
+lxc-start: lxc_start.c: main: 344 The container failed to start.
+lxc-start: lxc_start.c: main: 348 Additional information can be obtained by setting the --logfile and --logpriority options.
+
+## begin backport ##
+
+From 843d5baf6aad6c53fc00ea8d95d83209a4f92de1 Mon Sep 17 00:00:00 2001
+From: Martin Pitt <martin.pitt@ubuntu.com>
+Date: Thu, 10 Nov 2016 05:33:13 +0100
+Subject: [PATCH] core: don't use the unified hierarchy for the systemd cgroup
+ yet (#4628)
+
+Too many things don't get along with the unified hierarchy yet:
+
+ * https://github.com/opencontainers/runc/issues/1175
+ * https://github.com/docker/docker/issues/28109
+ * https://github.com/lxc/lxc/issues/1280
+
+So revert the default to the legacy hierarchy for now. Developers of the above
+software can opt into the unified hierarchy with
+"systemd.legacy_systemd_cgroup_controller=0".
+---
+ src/basic/cgroup-util.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/basic/cgroup-util.c b/src/basic/cgroup-util.c
+index 5e73753..dc13025 100644
+--- a/src/basic/cgroup-util.c
++++ b/src/basic/cgroup-util.c
+@@ -2423,10 +2423,10 @@ bool cg_is_unified_systemd_controller_wanted(void) {
+ 
+                 r = get_proc_cmdline_key("systemd.legacy_systemd_cgroup_controller=", &value);
+                 if (r < 0)
+-                        return true;
++                        return false;
+ 
+                 if (r == 0)
+-                        wanted = true;
++                        wanted = false;
+                 else
+                         wanted = parse_boolean(value) <= 0;
+         }
+-- 
+2.10.1
+
diff --git a/meta/recipes-core/systemd/systemd_232.bb b/meta/recipes-core/systemd/systemd_232.bb
index baee02e..a978bec 100644
--- a/meta/recipes-core/systemd/systemd_232.bb
+++ b/meta/recipes-core/systemd/systemd_232.bb
@@ -32,6 +32,7 @@ SRC_URI += " \
            file://0017-remove-duplicate-include-uchar.h.patch \
            file://0018-check-for-uchar.h-in-configure.patch \
            file://0019-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch \
+           file://0020-back-port-233-don-t-use-the-unified-hierarchy-for-the-systemd.patch \
 "
 SRC_URI_append_libc-uclibc = "\
            file://0002-units-Prefer-getty-to-agetty-in-console-setup-system.patch \
-- 
2.10.1


