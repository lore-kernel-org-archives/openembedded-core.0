Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 0BBC76FFA4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Dec 2015 14:32:14 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 08 Dec 2015 06:32:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,400,1444719600"; d="scan'208";a="614544704"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 08 Dec 2015 06:32:08 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 20C876A4083
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Dec 2015 06:30:57 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Dec 2015 16:33:04 +0200
Message-Id: <1449585184-7423-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1449585184-7423-1-git-send-email-maxin.john@intel.com>
References: <1449585184-7423-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/2] rpcbind: Fix build with libtirpc 1.0.1
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
X-List-Received-Date: Tue, 08 Dec 2015 14:32:15 -0000

libtirpc 1.0.1 uses the SVC_XP_AUTH macro to access xp_auth.
Update rpcbind to follow the same way.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...ly-Don-t-use-the-xp_auth-pointer-directly.patch | 43 ++++++++++++++++++++++
 meta/recipes-extended/rpcbind/rpcbind_0.2.3.bb     |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-extended/rpcbind/rpcbind/0001-handle_reply-Don-t-use-the-xp_auth-pointer-directly.patch

diff --git a/meta/recipes-extended/rpcbind/rpcbind/0001-handle_reply-Don-t-use-the-xp_auth-pointer-directly.patch b/meta/recipes-extended/rpcbind/rpcbind/0001-handle_reply-Don-t-use-the-xp_auth-pointer-directly.patch
new file mode 100644
index 0000000..16b763e
--- /dev/null
+++ b/meta/recipes-extended/rpcbind/rpcbind/0001-handle_reply-Don-t-use-the-xp_auth-pointer-directly.patch
@@ -0,0 +1,43 @@
+From 9194122389f2a56b1cd1f935e64307e2e963c2da Mon Sep 17 00:00:00 2001
+From: Steve Dickson <steved@redhat.com>
+Date: Mon, 2 Nov 2015 17:05:18 -0500
+Subject: [PATCH] handle_reply: Don't use the xp_auth pointer directly
+
+In the latest libtirpc version to access the xp_auth
+one must use the SVC_XP_AUTH macro. To be backwards
+compatible a couple ifdefs were added to use the
+macro when it exists.
+
+Upstream-Status: Backport
+
+Signed-off-by: Steve Dickson <steved@redhat.com>
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
+---
+ src/rpcb_svc_com.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/src/rpcb_svc_com.c b/src/rpcb_svc_com.c
+index 4ae93f1..22d6c84 100644
+--- a/src/rpcb_svc_com.c
++++ b/src/rpcb_svc_com.c
+@@ -1295,10 +1295,17 @@ handle_reply(int fd, SVCXPRT *xprt)
+ 	a.rmt_localvers = fi->versnum;
+ 
+ 	xprt_set_caller(xprt, fi);
++#if defined(SVC_XP_AUTH)
++	SVC_XP_AUTH(xprt) = svc_auth_none;
++#else 
+ 	xprt->xp_auth = &svc_auth_none;
++#endif
+ 	svc_sendreply(xprt, (xdrproc_t) xdr_rmtcall_result, (char *) &a);
++#if !defined(SVC_XP_AUTH)
+ 	SVCAUTH_DESTROY(xprt->xp_auth);
+ 	xprt->xp_auth = NULL;
++#endif
++
+ done:
+ 	if (buffer)
+ 		free(buffer);
+-- 
+2.4.0
+
diff --git a/meta/recipes-extended/rpcbind/rpcbind_0.2.3.bb b/meta/recipes-extended/rpcbind/rpcbind_0.2.3.bb
index ecd3ba8..c19a197 100644
--- a/meta/recipes-extended/rpcbind/rpcbind_0.2.3.bb
+++ b/meta/recipes-extended/rpcbind/rpcbind_0.2.3.bb
@@ -14,6 +14,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/rpcbind/rpcbind-${PV}.tar.bz2 \
            file://init.d \
            file://0001-Avoid-use-of-glibc-sys-cdefs.h-header.patch \
            file://remove-sys-queue.patch \
+           file://0001-handle_reply-Don-t-use-the-xp_auth-pointer-directly.patch \
            ${UCLIBCPATCHES} \
            ${MUSLPATCHES} \
            file://rpcbind.conf \
-- 
2.4.0


