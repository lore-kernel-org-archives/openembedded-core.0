Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2AC7D6071F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2016 21:37:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u8MLbLfZ025178
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2016 14:37:21 -0700 (PDT)
Received: from msp-dhcp15.wrs.com (172.25.34.15) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 22 Sep 2016 14:37:20 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Sep 2016 16:37:20 -0500
Message-ID: <1474580240-42826-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [PATCH] pseudo: Fix problem where pseudo could kill a container init
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
X-List-Received-Date: Thu, 22 Sep 2016 21:37:21 -0000
Content-Type: text/plain

In a heavily loaded container, the child process might not started
before the parent process had terminated.  The child process attempts to
signal the parent with SIGUSR1.  If the parent had terminated, the
parent becomes PID 1, which is generally init.  When it signaled pid 1,
it caused the docker mini-init to terminate.

This doesn't happen in a traditional system, as systemd/sysvinit is
protected to only root users can signal it.

[YOCTO #10324]

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../files/0001-Don-t-send-SIGUSR1-to-init.patch    | 48 ++++++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_1.8.1.bb       |  1 +
 meta/recipes-devtools/pseudo/pseudo_git.bb         |  2 +-
 3 files changed, 50 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/pseudo/files/0001-Don-t-send-SIGUSR1-to-init.patch

diff --git a/meta/recipes-devtools/pseudo/files/0001-Don-t-send-SIGUSR1-to-init.patch b/meta/recipes-devtools/pseudo/files/0001-Don-t-send-SIGUSR1-to-init.patch
new file mode 100644
index 0000000..6c694ce
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/0001-Don-t-send-SIGUSR1-to-init.patch
@@ -0,0 +1,48 @@
+From befc6dbd6469d428c9e0830dbe51bdf7ac39d9ae Mon Sep 17 00:00:00 2001
+From: Seebs <seebs@seebs.net>
+Date: Thu, 22 Sep 2016 14:35:04 -0500
+Subject: [PATCH] Don't send SIGUSR1 to init.
+
+If the parent exits due to child process being slow, getppid() will return
+1, and we'll send SIGUSR1 to init, which can break things like dumbinit
+which aren't adequately protected against non-root processes sending them
+signals.
+
+Signed-off-by: Seebs <seebs@seebs.net>
+
+Upstream-Status: Backport (commit befc6dbd6469d428c9e0830dbe51bdf7ac39d9ae)
+
+[YOCTO #10324]
+
+This resolves an issue where a docker container running builds would die
+due to it's 'mini init' being signaled by pseudo.
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+---
+ pseudo_server.c | 11 ++++++++---
+
+diff --git a/pseudo_server.c b/pseudo_server.c
+index 65102dd..8731d20 100644
+--- a/pseudo_server.c
++++ b/pseudo_server.c
+@@ -358,9 +358,14 @@ pseudo_server_start(int daemonize) {
+ 	signal(SIGTERM, quit_now);
+ 	/* tell parent process to stop waiting */
+ 	if (daemonize) {
+-		pseudo_diag("Setup complete, sending SIGUSR1 to pid %d.\n",
+-			getppid());
+-		kill(getppid(), SIGUSR1);
++		pid_t ppid = getppid();
++		if (ppid == 1) {
++			pseudo_diag("Setup complete, but parent is init, not sending SIGUSR1.\n");
++		} else {
++			pseudo_diag("Setup complete, sending SIGUSR1 to pid %d.\n",
++				ppid);
++			kill(ppid, SIGUSR1);
++		}
+ 	}
+ 	pseudo_server_loop();
+ 	return 0;
+-- 
+2.5.5
+
diff --git a/meta/recipes-devtools/pseudo/pseudo_1.8.1.bb b/meta/recipes-devtools/pseudo/pseudo_1.8.1.bb
index f45912a..cec2149 100644
--- a/meta/recipes-devtools/pseudo/pseudo_1.8.1.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_1.8.1.bb
@@ -6,6 +6,7 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/pseudo/${BPN}-${PV}.tar.bz
            file://fallback-group \
            file://moreretries.patch \
            file://Fix-xattr-performance.patch \
+           file://0001-Don-t-send-SIGUSR1-to-init.patch \
            "
 
 SRC_URI[md5sum] = "ee38e4fb62ff88ad067b1a5a3825bac7"
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 8735cf4..8110b1a 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -1,6 +1,6 @@
 require pseudo.inc
 
-SRCREV = "f4b1c752186f4d08f1fadb0ea10ebcde9b0ea251"
+SRCREV = "befc6dbd6469d428c9e0830dbe51bdf7ac39d9ae"
 PV = "1.8.1+git${SRCPV}"
 
 DEFAULT_PREFERENCE = "-1"
-- 
2.5.5


