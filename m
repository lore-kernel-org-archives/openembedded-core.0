Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BDFD077E94
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 08:13:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v6B8DdYV017656
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 11 Jul 2017 01:13:39 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 11 Jul 2017 01:13:38 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Tue, 11 Jul 2017 04:13:37 -0400
Message-ID: <1499760817-127823-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] dhcp: fix genetle shutdown not work while bind9 compile with --enable-threads
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
X-List-Received-Date: Tue, 11 Jul 2017 08:13:40 -0000
Content-Type: text/plain

Previously, OE enabled threads in bind9:
...
commit 598e5da5a2af2bd93ad890687dd32009e348fc85
Author: Kai Kang <kai.kang@windriver.com>
Date:   Fri May 19 16:52:46 2017 +0800

    bind: build with threads and update configure options
...

And enabled gentle shutdown in dhcp:
...
commit 2c789bac353e17637549a7b31706761ba848728e
Author: Chen Qi <Qi.Chen@windriver.com>
Date:   Tue Mar 15 14:39:40 2016 +0800

    dhcp: enable gentle shutdown
...

Both of them caused systemd's reboot hung. The reason is
bind9 blocked SIGHUP, SIGINT and SIGTERM while compiled with
--enable-threads, and dhcp use SIGINT and SIGTERM for
gentle shutdown.

While systemd's reboot, it sends SIGTERM to dhclient by default,
and dhclient block the singnal that caused reboot hung.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...-shutdown-not-work-while-bind9-compile-wi.patch | 74 ++++++++++++++++++++++
 meta/recipes-connectivity/dhcp/dhcp_4.3.5.bb       |  1 +
 2 files changed, 75 insertions(+)
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/fix-genetle-shutdown-not-work-while-bind9-compile-wi.patch

diff --git a/meta/recipes-connectivity/dhcp/dhcp/fix-genetle-shutdown-not-work-while-bind9-compile-wi.patch b/meta/recipes-connectivity/dhcp/dhcp/fix-genetle-shutdown-not-work-while-bind9-compile-wi.patch
new file mode 100644
index 0000000..6340420
--- /dev/null
+++ b/meta/recipes-connectivity/dhcp/dhcp/fix-genetle-shutdown-not-work-while-bind9-compile-wi.patch
@@ -0,0 +1,74 @@
+From 91c50f7feb36ef13dba5fa0cefb918ae044da94f Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Mon, 10 Jul 2017 05:20:55 -0400
+Subject: [PATCH] fix genetle shutdown not work while bind9 compile with --enable-threads
+
+While bind9 compile with --enable-threads, it blocked SIGHUP, SIGINT,
+SIGTERM which caused genetle shutdown not work.
+
+Unblock SIGTERM and SIGINT for genetle shutdown.
+
+The upstream (https://source.isc.org/git/dhcp.git) could work without
+the fix, because it disable gentle shutdown by default:
+...
+commit e9326fd0f4561db5496f18523da15612213bd1b4
+Author: Shawn Routhier <sar@isc.org>
+Date:   Wed Jul 2 08:49:19 2014 -0700
+
+    [master] Add define to disable gentle shutodwn by default
+...
+And built bind9 without --enable-threads does not require the fix neither.
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ omapip/isclib.c | 25 +++++++++++++++++++++++++
+ 1 file changed, 25 insertions(+)
+
+diff --git a/omapip/isclib.c b/omapip/isclib.c
+index 13f0d3e..4fe3328 100644
+--- a/omapip/isclib.c
++++ b/omapip/isclib.c
+@@ -29,6 +29,25 @@
+ 
+ #include <sys/time.h>
+ #include <signal.h>
++#include <pthread.h>
++
++#if defined(ENABLE_GENTLE_SHUTDOWN)
++void unblock_signal(void)
++{
++	sigset_t sset;
++
++	if (sigemptyset(&sset) != 0 ||
++	    sigaddset(&sset, SIGTERM) != 0 ||
++	    sigaddset(&sset, SIGINT) != 0) {
++		log_error("sigsetops: %d\n", errno);
++		return;
++	}
++	if (sigprocmask(SIG_UNBLOCK, &sset, NULL) != 0) {
++		log_error("sigprocmask: %d\n", errno);
++		return;
++	}
++}
++#endif
+ 
+ dhcp_context_t dhcp_gbl_ctx;
+ int shutdown_signal = 0;
+@@ -188,6 +207,12 @@ dhcp_context_create(int flags,
+ 		result = isc_app_ctxstart(dhcp_gbl_ctx.actx);
+ 		if (result != ISC_R_SUCCESS)
+ 			return (result);
++
++
++#if defined(ENABLE_GENTLE_SHUTDOWN)
++		unblock_signal();
++#endif
++
+ 		dhcp_gbl_ctx.actx_started = ISC_TRUE;
+ 
+ 		/* Not all OSs support suppressing SIGPIPE through socket
+-- 
+2.8.1
+
diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.3.5.bb b/meta/recipes-connectivity/dhcp/dhcp_4.3.5.bb
index 0a73ecc..b20147a 100644
--- a/meta/recipes-connectivity/dhcp/dhcp_4.3.5.bb
+++ b/meta/recipes-connectivity/dhcp/dhcp_4.3.5.bb
@@ -10,6 +10,7 @@ SRC_URI += "file://dhcp-3.0.3-dhclient-dbus.patch;striplevel=0 \
             file://tweak-to-support-external-bind.patch \
             file://remove-dhclient-script-bash-dependency.patch \
             file://build-shared-libs.patch \
+            file://fix-genetle-shutdown-not-work-while-bind9-compile-wi.patch \
            "
 
 SRC_URI[md5sum] = "2b5e5b2fa31c2e27e487039d86f83d3f"
-- 
2.8.1


