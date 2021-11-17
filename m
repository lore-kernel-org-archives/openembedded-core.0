Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18C7DC433F5
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 08:09:04 +0000 (UTC)
Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web09.4383.1637136542712324064
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 00:09:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: changqing.li@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 1AH891v8020757
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 00:09:01 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 17 Nov 2021 00:09:01 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 17 Nov 2021 00:09:00 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [hardknott][PATCH] openssh: fix CVE-2021-41617
Date: Wed, 17 Nov 2021 16:06:49 +0800
Message-ID: <20211117080649.22035-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 08:09:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158377

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
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
2.17.1


