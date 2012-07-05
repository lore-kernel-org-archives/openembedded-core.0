Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SmnKx-0005rV-IV
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jul 2012 16:47:19 +0200
Received: by mail-pb0-f47.google.com with SMTP id rq2so12500315pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jul 2012 07:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=c4ZdtwCn3PhivVuRHFn2kr8DeUaiqtTpPDRBem5qhCA=;
	b=gesxMeIpw3VEl9adeMtuf1l3wjCnKzxie/ylD7aJK7nog0b4KdydPijj68R/WhWTZr
	P4oZdyvuXgT37Etwp5iMjrZFAsy2haNSeUHwAKGkXoDMKHuFWnQBQ2j2NyIoF33RF71J
	6+P8/S/x0xyBhMSpguxlcHh1ZLa41Ymx769chRtJ8674LtFcsUbDLB5UcKVwliIPQg1i
	hPaMAgNArl9VlKm9YbxOqSeogY2tSXUN4X+HY2BEvCoSq7PYCXx/svtwSYDDdRlbFOiW
	tzE44c+8J8NgbNm55ppqvKFgERYJekO1CoT/TuLe2PfHq+DZ4WzlAQzTa6s09Cihs5L8
	YBwQ==
Received: by 10.68.131.10 with SMTP id oi10mr28297085pbb.122.1341498977083;
	Thu, 05 Jul 2012 07:36:17 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id ru10sm9521262pbc.50.2012.07.05.07.36.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 Jul 2012 07:36:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jul 2012 07:35:32 -0700
Message-Id: <0413ecda2ffd71f9deaf296591b8744d29a30099.1341498745.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <48ef71f7c5eea25278a5a9c9befd01123369e2f9.1341498745.git.raj.khem@gmail.com>
References: <48ef71f7c5eea25278a5a9c9befd01123369e2f9.1341498745.git.raj.khem@gmail.com>
In-Reply-To: <cover.1341498745.git.raj.khem@gmail.com>
References: <cover.1341498745.git.raj.khem@gmail.com>
Subject: [PATCH 13/14] libpam: Fix build with eglibc 2.16
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Jul 2012 14:47:21 -0000

pam_unix_acct.c: In function '_unix_run_verify_binary':
pam_unix_acct.c:97:19: error: storage size of 'rlim' isn't known
pam_unix_acct.c:106:19: error: 'RLIMIT_NOFILE' undeclared (first use in
this function)
pam_unix_acct.c:106:19: note: each undeclared identifier is reported
only once for each function it appears in

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../pam/libpam/include-sys-resource.patch          |   12 ++++++++++++
 meta/recipes-extended/pam/libpam_1.1.5.bb          |    6 ++++--
 2 files changed, 16 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/pam/libpam/include-sys-resource.patch

diff --git a/meta/recipes-extended/pam/libpam/include-sys-resource.patch b/meta/recipes-extended/pam/libpam/include-sys-resource.patch
new file mode 100644
index 0000000..0108a88
--- /dev/null
+++ b/meta/recipes-extended/pam/libpam/include-sys-resource.patch
@@ -0,0 +1,12 @@
+Index: Linux-PAM-1.1.5/modules/pam_unix/pam_unix_acct.c
+===================================================================
+--- Linux-PAM-1.1.5.orig/modules/pam_unix/pam_unix_acct.c	2012-07-04 12:37:44.881136025 -0700
++++ Linux-PAM-1.1.5/modules/pam_unix/pam_unix_acct.c	2012-07-04 12:38:00.601136785 -0700
+@@ -47,6 +47,7 @@
+ #include <time.h>		/* for time() */
+ #include <errno.h>
+ #include <sys/wait.h>
++#include <sys/resource.h>
+ 
+ #include <security/_pam_macros.h>
+ 
diff --git a/meta/recipes-extended/pam/libpam_1.1.5.bb b/meta/recipes-extended/pam/libpam_1.1.5.bb
index 08ce1d1..275e5d8 100644
--- a/meta/recipes-extended/pam/libpam_1.1.5.bb
+++ b/meta/recipes-extended/pam/libpam_1.1.5.bb
@@ -9,12 +9,14 @@ SECTION = "base"
 LICENSE = "GPLv2+ | BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ca0395de9a86191a078b8b79302e3083"
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "https://fedorahosted.org/releases/l/i/linux-pam/Linux-PAM-${PV}.tar.bz2 \
            file://99_pam \
            file://pam.d/* \
-           file://libpam-xtests.patch"
+           file://libpam-xtests.patch \
+           file://include-sys-resource.patch \
+          "
 
 SRC_URI_append_libc-uclibc = " file://pam-no-innetgr.patch"
 
-- 
1.7.9.5



