Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CCBCC433F5
	for <webhook@archiver.kernel.org>; Mon,  1 Nov 2021 15:34:29 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web12.45535.1635780864510944525
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Nov 2021 08:34:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10154"; a="218228529"
X-IronPort-AV: E=Sophos;i="5.87,200,1631602800";
   d="scan'208";a="218228529"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2021 08:34:28 -0700
X-IronPort-AV: E=Sophos;i="5.87,200,1631602800";
   d="scan'208";a="488694193"
Received: from aaronhpe-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.232.69])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2021 08:34:27 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 03/18] openssh: fix CVE-2021-41617
Date: Mon,  1 Nov 2021 23:33:58 +0800
Message-Id: 
 <b2c329641f91630ecbb225e8cd0cdcaf461d7ef6.1635780638.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1635780638.git.anuj.mittal@intel.com>
References: <cover.1635780638.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Nov 2021 15:34:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157710

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../openssh/openssh/CVE-2021-41617.patch      | 49 +++++++++++++++++++
 .../openssh/openssh_8.5p1.bb                  |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2021-41617.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2021-41617.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2021-41617.patch
new file mode 100644
index 0000000000..9ca7c2f202
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2021-41617.patch
@@ -0,0 +1,49 @@
+From 1f0707e8e78ef290fd0f229df3fcd2236f29db89 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 28 Oct 2021 11:11:05 +0800
+Subject: [PATCH] upstream: need initgroups() before setresgid(); reported by
+ anton@,
+
+ok deraadt@
+
+OpenBSD-Commit-ID: 6aa003ee658b316960d94078f2a16edbc25087ce
+
+CVE: CVE-2021-41617
+Upstream-Status: [Backport]
+https://github.com/openssh/openssh-portable/commit/f3cbe43e28fe71427d41cfe3a17125b972710455
+https://github.com/openssh/openssh-portable/commit/bf944e3794eff5413f2df1ef37cddf96918c6bde
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ misc.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/misc.c b/misc.c
+index d988ce3..33eca1c 100644
+--- a/misc.c
++++ b/misc.c
+@@ -56,6 +56,7 @@
+ #ifdef HAVE_PATHS_H
+ # include <paths.h>
+ #include <pwd.h>
++#include <grp.h>
+ #endif
+ #ifdef SSH_TUN_OPENBSD
+ #include <net/if.h>
+@@ -2629,6 +2630,13 @@ subprocess(const char *tag, const char *command,
+ 		}
+ 		closefrom(STDERR_FILENO + 1);
+ 
++		if (geteuid() == 0 &&
++		    initgroups(pw->pw_name, pw->pw_gid) == -1) {
++			error("%s: initgroups(%s, %u): %s", tag,
++			    pw->pw_name, (u_int)pw->pw_gid, strerror(errno));
++			_exit(1);
++		}
++
+ 		if (setresgid(pw->pw_gid, pw->pw_gid, pw->pw_gid) == -1) {
+ 			error("%s: setresgid %u: %s", tag, (u_int)pw->pw_gid,
+ 			    strerror(errno));
+-- 
+2.17.1
+
diff --git a/meta/recipes-connectivity/openssh/openssh_8.5p1.bb b/meta/recipes-connectivity/openssh/openssh_8.5p1.bb
index c6de519884..9a5f37bc39 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.5p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.5p1.bb
@@ -24,6 +24,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://fix-potential-signed-overflow-in-pointer-arithmatic.patch \
            file://sshd_check_keys \
            file://add-test-support-for-busybox.patch \
+           file://CVE-2021-41617.patch \
            "
 SRC_URI[sha256sum] = "f52f3f41d429aa9918e38cf200af225ccdd8e66f052da572870c89737646ec25"
 
-- 
2.31.1


