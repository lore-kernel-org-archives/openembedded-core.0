Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6ED9A77D81
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 07:27:49 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v6C7RowG018551
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 12 Jul 2017 00:27:50 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 12 Jul 2017 00:27:50 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Wed, 12 Jul 2017 03:27:48 -0400
Message-ID: <1499844468-45814-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [V2 PATCH] dhcp: fix shutdown not work by SIGTERM while bind9 enable threads
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
X-List-Received-Date: Wed, 12 Jul 2017 07:27:50 -0000
Content-Type: text/plain

In https://source.isc.org/git/bind9.git, since the following
commit applied:
...
commit b99bfa184bc9375421b5df915eea7dfac6a68a99
Author: Evan Hunt <each@isc.org>
Date:   Wed Apr 10 13:49:57 2013 -0700

    [master] unify internal and export libraries

    3550.       [func]          Unified the internal and export versions of the
                        BIND libraries, allowing external clients to use
                        the same libraries as BIND. [RT #33131]
...
(git show b99bfa184bc9375421b5df915eea7dfac6a68a99 -- ./lib/isc/unix/app.c)

In this commit, if bind9 enable threads(ISC_PLATFORM_USETHREADS),
it blocks signal SIGHUP, SIGINT and SIGTERM in isc__app_ctxstart.
Which caused dhclient/dhcpd could not be stopped by SIGTERM.

It caused systemd's reboot hung which send SIGTERM by default.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...all-to-isc_app_ctxstart-to-not-get-signal.patch | 81 ++++++++++++++++++++++
 meta/recipes-connectivity/dhcp/dhcp_4.3.5.bb       |  1 +
 2 files changed, 82 insertions(+)
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/Moved-the-call-to-isc_app_ctxstart-to-not-get-signal.patch

diff --git a/meta/recipes-connectivity/dhcp/dhcp/Moved-the-call-to-isc_app_ctxstart-to-not-get-signal.patch b/meta/recipes-connectivity/dhcp/dhcp/Moved-the-call-to-isc_app_ctxstart-to-not-get-signal.patch
new file mode 100644
index 0000000..9b43f96
--- /dev/null
+++ b/meta/recipes-connectivity/dhcp/dhcp/Moved-the-call-to-isc_app_ctxstart-to-not-get-signal.patch
@@ -0,0 +1,81 @@
+From e8c30bac53f8baeb80f87b445f42259cc8984fb5 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 12 Jul 2017 03:05:13 -0400
+Subject: [PATCH] Moved the call to isc_app_ctxstart() to not get signal block
+ by all threads
+
+Signed-off-by: Francis Dupont <fdupont@isc.org>
+
+In https://source.isc.org/git/bind9.git, since the following
+commit applied:
+...
+commit b99bfa184bc9375421b5df915eea7dfac6a68a99
+Author: Evan Hunt <each@isc.org>
+Date:   Wed Apr 10 13:49:57 2013 -0700
+
+    [master] unify internal and export libraries
+
+    3550.       [func]          Unified the internal and export versions of the
+                        BIND libraries, allowing external clients to use
+                        the same libraries as BIND. [RT #33131]
+...
+(git show b99bfa184bc9375421b5df915eea7dfac6a68a99 -- ./lib/isc/unix/app.c)
+
+In this commit, if bind9 enable threads(ISC_PLATFORM_USETHREADS),
+it blocks signal SIGHUP, SIGINT and SIGTERM in isc__app_ctxstart.
+Which caused dhclient/dhcpd could not be stopped by SIGTERM.
+
+It caused systemd's reboot hung which send SIGTERM by default.
+
+Upstream-Status: Backport [https://source.isc.org/git/dhcp.git]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ omapip/isclib.c | 25 +++++++++++++++----------
+ 1 file changed, 15 insertions(+), 10 deletions(-)
+
+diff --git a/omapip/isclib.c b/omapip/isclib.c
+index 13f0d3e..4af04b6 100644
+--- a/omapip/isclib.c
++++ b/omapip/isclib.c
+@@ -185,16 +185,6 @@ dhcp_context_create(int flags,
+ 		if (result != ISC_R_SUCCESS)
+ 			goto cleanup;
+ 
+-		result = isc_app_ctxstart(dhcp_gbl_ctx.actx);
+-		if (result != ISC_R_SUCCESS)
+-			return (result);
+-		dhcp_gbl_ctx.actx_started = ISC_TRUE;
+-
+-		/* Not all OSs support suppressing SIGPIPE through socket
+-		 * options, so set the sigal action to be ignore.  This allows
+-		 * broken connections to fail gracefully with EPIPE on writes */
+-		handle_signal(SIGPIPE, SIG_IGN);
+-
+ 		result = isc_taskmgr_createinctx(dhcp_gbl_ctx.mctx,
+ 						 dhcp_gbl_ctx.actx,
+ 						 1, 0,
+@@ -217,6 +207,21 @@ dhcp_context_create(int flags,
+ 		result = isc_task_create(dhcp_gbl_ctx.taskmgr, 0, &dhcp_gbl_ctx.task);
+ 		if (result != ISC_R_SUCCESS)
+ 			goto cleanup;
++
++		result = isc_app_ctxstart(dhcp_gbl_ctx.actx);
++		if (result != ISC_R_SUCCESS)
++			return (result);
++		dhcp_gbl_ctx.actx_started = ISC_TRUE;
++
++		/* Not all OSs support suppressing SIGPIPE through socket
++		 * options, so set the sigal action to be ignore.  This allows
++		 * broken connections to fail gracefully with EPIPE on writes */
++		handle_signal(SIGPIPE, SIG_IGN);
++
++		/* Reset handlers installed by isc_app_ctxstart()
++		 * to default for control-c and kill */
++		handle_signal(SIGINT, SIG_DFL);
++		handle_signal(SIGTERM, SIG_DFL);
+ 	}
+ 
+ #if defined (NSUPDATE)
+-- 
+2.8.1
+
diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.3.5.bb b/meta/recipes-connectivity/dhcp/dhcp_4.3.5.bb
index 0a73ecc..964d05dd 100644
--- a/meta/recipes-connectivity/dhcp/dhcp_4.3.5.bb
+++ b/meta/recipes-connectivity/dhcp/dhcp_4.3.5.bb
@@ -10,6 +10,7 @@ SRC_URI += "file://dhcp-3.0.3-dhclient-dbus.patch;striplevel=0 \
             file://tweak-to-support-external-bind.patch \
             file://remove-dhclient-script-bash-dependency.patch \
             file://build-shared-libs.patch \
+            file://Moved-the-call-to-isc_app_ctxstart-to-not-get-signal.patch \
            "
 
 SRC_URI[md5sum] = "2b5e5b2fa31c2e27e487039d86f83d3f"
-- 
2.8.1


