Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C8C4C4332F
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 01:21:05 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web10.20093.1639444861529217620
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 17:21:04 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@intel.com header.s=intel
 header.b=gAqaQDvV;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639444863; x=1670980863;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Pdk1FvskOi5ABZF7TraHWvsTW0VvsA86NCHpT0UOF1U=;
  b=gAqaQDvV6yXpssgrDQM5Tj1/gr+BveUAHI1YoPR3SVaEvgDnSxe9K4w3
   +rMnglwttBon0Gvch7oo3bD36GpqpDB5VtiEponMnZdC2I0hhQBATII9Q
   TsGnQUtywhWzjyCv2o0pmMojjPPHLoFbH4F3zvE6GOcXYO740/68F9Qwy
   e4d7FHD+UE8lkZf39/XlkfoSt4l/oaPCFnpRJlgTOYHU4hOcuxLga528a
   lwe0LEPCJ8Gc1gklktrlPDY8/pqdhsu7l/k/D+CfEhXeXFzusvL1ws5R9
   LuYto2iJZkIXTRYVVqyKxDCOcz/1delf/obMPpnVcvfz1fykPsZYWeHGz
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="238682479"
X-IronPort-AV: E=Sophos;i="5.88,204,1635231600";
   d="scan'208";a="238682479"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 17:21:03 -0800
X-IronPort-AV: E=Sophos;i="5.88,204,1635231600";
   d="scan'208";a="464869143"
Received: from zyteoh-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.239.31])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 17:21:02 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 02/17] openssh: fix CVE-2021-41617
Date: Tue, 14 Dec 2021 09:20:37 +0800
Message-Id: 
 <37edef7d39c829b8d01a0471e612d62d6388fb7e.1639444641.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1639444641.git.anuj.mittal@intel.com>
References: <cover.1639444641.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Dec 2021 01:21:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159664

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../openssh/openssh/CVE-2021-41617.patch      | 48 +++++++++++++++++++
 .../openssh/openssh_8.7p1.bb                  |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2021-41617.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2021-41617.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2021-41617.patch
new file mode 100644
index 0000000000..bebde7f26d
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2021-41617.patch
@@ -0,0 +1,48 @@
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
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/f3cbe43e28fe71427d41cfe3a17125b972710455
+https://github.com/openssh/openssh-portable/commit/bf944e3794eff5413f2df1ef37cddf96918c6bde]
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
diff --git a/meta/recipes-connectivity/openssh/openssh_8.7p1.bb b/meta/recipes-connectivity/openssh/openssh_8.7p1.bb
index 07cd6b74cd..d19833e56f 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.7p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.7p1.bb
@@ -24,6 +24,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://fix-potential-signed-overflow-in-pointer-arithmatic.patch \
            file://sshd_check_keys \
            file://add-test-support-for-busybox.patch \
+           file://CVE-2021-41617.patch \
            "
 SRC_URI[sha256sum] = "7ca34b8bb24ae9e50f33792b7091b3841d7e1b440ff57bc9fabddf01e2ed1e24"
 
-- 
2.33.1


