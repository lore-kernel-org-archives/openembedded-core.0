Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0F595610EE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 08:14:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8D8En8P000361
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 01:14:49 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 13 Sep 2013 01:14:47 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Sep 2013 16:14:42 +0800
Message-ID: <a58f39d86220ad2d36cc79ed01b7bed718ccf9cb.1379059861.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1379059861.git.hongxu.jia@windriver.com>
References: <cover.1379059861.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] busybox: move su to /bin for lsb command check test
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
X-List-Received-Date: Fri, 13 Sep 2013 08:14:47 -0000
Content-Type: text/plain

In busybox, util-linux and shadow, su has been moved to /usr/bin/,
but lsb cmdchk needs su in /bin.

Move su to /bin could fix this issue.

[YOCTO#5175]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../busybox/busybox-1.21.1/su-usr-bin.patch        | 26 ----------------------
 meta/recipes-core/busybox/busybox_1.21.1.bb        |  1 -
 2 files changed, 27 deletions(-)
 delete mode 100644 meta/recipes-core/busybox/busybox-1.21.1/su-usr-bin.patch

diff --git a/meta/recipes-core/busybox/busybox-1.21.1/su-usr-bin.patch b/meta/recipes-core/busybox/busybox-1.21.1/su-usr-bin.patch
deleted file mode 100644
index 0d5b558..0000000
--- a/meta/recipes-core/busybox/busybox-1.21.1/su-usr-bin.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-busybox: move /bin/su to /usr/bin/su to match util-linux and shadow
-
-Both of util-linux and shadow have su binary in /usr/bin, fix busybox
-to use the same path so they can be properly tracked by alternatives.
-
-Upstream-Status: Inappropriate [embedded]
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- include/applets.src.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/include/applets.src.h b/include/applets.src.h
---- a/include/applets.src.h
-+++ b/include/applets.src.h
-@@ -349,7 +349,7 @@ IF_STAT(APPLET(stat, BB_DIR_USR_BIN, BB_SUID_DROP))
- IF_STRINGS(APPLET(strings, BB_DIR_USR_BIN, BB_SUID_DROP))
- IF_STTY(APPLET(stty, BB_DIR_BIN, BB_SUID_DROP))
- /* Needs to be run by root or be suid root - needs to change uid and gid: */
--IF_SU(APPLET(su, BB_DIR_BIN, BB_SUID_REQUIRE))
-+IF_SU(APPLET(su, BB_DIR_USR_BIN, BB_SUID_REQUIRE))
- IF_SULOGIN(APPLET(sulogin, BB_DIR_SBIN, BB_SUID_DROP))
- IF_SUM(APPLET(sum, BB_DIR_USR_BIN, BB_SUID_DROP))
- IF_SV(APPLET(sv, BB_DIR_USR_BIN, BB_SUID_DROP))
--- 
-1.8.1.2
-
diff --git a/meta/recipes-core/busybox/busybox_1.21.1.bb b/meta/recipes-core/busybox/busybox_1.21.1.bb
index f766bee..5c05273 100644
--- a/meta/recipes-core/busybox/busybox_1.21.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.21.1.bb
@@ -24,7 +24,6 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://umount.busybox \
            file://defconfig \
            file://stat-usr-bin.patch \
-           file://su-usr-bin.patch \
            file://busybox-syslog.service.in \
            file://busybox-klogd.service.in \
            file://testsuite-du-du-k-works-fix-false-positive.patch \
-- 
1.8.1.2


