Return-Path: <zhe.he@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4E00D78A52
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jul 2018 10:17:57 +0000 (UTC)
Received: from ala-blade48.wrs.com (ala-blade48.wrs.com [147.11.105.68])
	by mail.windriver.com (8.15.2/8.15.1) with SMTP id w64AHuPJ003283
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Jul 2018 03:17:57 -0700 (PDT)
Received: by ala-blade48.wrs.com (sSMTP sendmail emulation);
	Wed, 04 Jul 2018 03:17:56 -0700
From: He Zhe <zhe.he@windriver.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jul 2018 03:17:56 -0700
Message-Id: <20180704101756.15289-1-zhe.he@windriver.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] lttng-tools: Allow reconnect to relayd
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
X-List-Received-Date: Wed, 04 Jul 2018 10:17:57 -0000

If relayd is started after connection attempt from consumerd it will
leave the session in disconnected state and causes the following
inconvenience. This is covered by an upstream feature, see
https://bugs.lttng.org/issues/883. Before it's done, this patches
allows users to reconnect to relayd.

root@localhost:~# lttng enable-event --userspace --all
Error: Events: UST create channel failed (channel channel0, session trace_session)
root@localhost:~# lttng-relayd -b
Warning: No tracing group detected
root@localhost:~# lttng enable-event --userspace --all
Error: Events: UST create channel failed (channel channel0, session trace_session)

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 ...ow-multiple-attempts-to-connect-to-relayd.patch | 43 ++++++++++++++++++++++
 meta/recipes-kernel/lttng/lttng-tools_2.9.5.bb     |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-Allow-multiple-attempts-to-connect-to-relayd.patch

diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-Allow-multiple-attempts-to-connect-to-relayd.patch b/meta/recipes-kernel/lttng/lttng-tools/0001-Allow-multiple-attempts-to-connect-to-relayd.patch
new file mode 100644
index 00000000000..62a0978592d
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-tools/0001-Allow-multiple-attempts-to-connect-to-relayd.patch
@@ -0,0 +1,43 @@
+From 70eff899104b86bae02862927c76caaef5de5d3c Mon Sep 17 00:00:00 2001
+From: Mikael Beckius <mikael.beckius@windriver.com>
+Date: Thu, 7 May 2015 16:14:25 +0200
+Subject: [PATCH] Allow multiple attempts to connect to relayd.
+
+It is unclear why a session needs to be made
+unusable after a failure to connect to relayd
+since a check for a relayd connection is
+always made before a session can be configured.
+
+The behaviour was introduced in:
+d9078d0c000d04d49c599a72c1a725026b636ec0
+
+Signed-off-by: Mikael Beckius <mikael.beckius@windriver.com>
+[ The context has moved, adjust the hunk accordingly ]
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+Upstream-Status: Pending
+---
+ src/bin/lttng-sessiond/cmd.c |    8 --------
+ 1 file changed, 8 deletions(-)
+
+diff --git a/src/bin/lttng-sessiond/cmd.c b/src/bin/lttng-sessiond/cmd.c
+index 73b4ce3..36f62ee 100644
+--- a/src/bin/lttng-sessiond/cmd.c
++++ b/src/bin/lttng-sessiond/cmd.c
+@@ -689,14 +689,6 @@ close_sock:
+ 	free(rsock);
+ 
+ error:
+-	if (ret != LTTNG_OK) {
+-		/*
+-		 * The consumer output for this session should not be used anymore
+-		 * since the relayd connection failed thus making any tracing or/and
+-		 * streaming not usable.
+-		 */
+-		consumer->enabled = 0;
+-	}
+ 	return ret;
+ }
+ 
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.9.5.bb b/meta/recipes-kernel/lttng/lttng-tools_2.9.5.bb
index 93626dd4b5f..e4969c30807 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.9.5.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.9.5.bb
@@ -30,6 +30,7 @@ PACKAGECONFIG_remove_riscv64 = "lttng-ust"
 SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://x32.patch \
            file://run-ptest \
+           file://0001-Allow-multiple-attempts-to-connect-to-relayd.patch \
            "
 
 SRC_URI[md5sum] = "051224eb991aee07f8721ff1877d0b96"
-- 
2.11.0


