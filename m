Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9D32C60616
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 19:49:02 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 13 May 2016 12:49:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,615,1455004800"; d="scan'208";a="980017442"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.164])
	by fmsmga002.fm.intel.com with ESMTP; 13 May 2016 12:49:02 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 May 2016 14:49:24 -0500
Message-Id: <1463168968-29526-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Cc: joshua.g.lock@intel.com, edwin.plauchu.camacho@intel.com
Subject: [PATCH 1/4] ltp: Fixes security string printf on testcases/network/nfsv4/acl/acl1.c
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
X-List-Received-Date: Fri, 13 May 2016 19:49:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

[YOCTO #9548]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 ...etwork-nfsv4-acl-acl1.c-Security-fix-on-s.patch | 41 ++++++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20160126.bb          |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch

diff --git a/meta/recipes-extended/ltp/ltp/0001-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch b/meta/recipes-extended/ltp/ltp/0001-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch
new file mode 100644
index 0000000..8f285d1
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0001-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch
@@ -0,0 +1,41 @@
+From 672a56be14426eae44864673c6c2afca0ab89d46 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
+Date: Fri, 13 May 2016 11:11:28 -0500
+Subject: [PATCH] testcases/network/nfsv4/acl/acl1.c: Security fix on string
+ printf
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes:
+
+acl1.c: In function 'test_acl_default':
+acl1.c:317:2: error: format not a string literal and no format arguments
+[-Werror=format-security]
+  printf(cmd);
+
+[YOCTO #9548]
+
+Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
+
+Upstream-status: Pending
+---
+ testcases/network/nfsv4/acl/acl1.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/testcases/network/nfsv4/acl/acl1.c b/testcases/network/nfsv4/acl/acl1.c
+index b8b67b4..7c7c506 100644
+--- a/testcases/network/nfsv4/acl/acl1.c
++++ b/testcases/network/nfsv4/acl/acl1.c
+@@ -314,7 +314,7 @@ void test_acl_default(char *dir, acl_t acl)
+ 	char *cmd = malloc(256);
+ 
+ 	strcpy(cmd, "chmod 7777 ");
+-	printf(cmd);
++	printf(cmd, NULL);
+ 	strcat(cmd, dir);
+ 	system(cmd);
+ 	acl2 = acl_get_file(path, ACL_TYPE_ACCESS);
+-- 
+2.1.4
+
diff --git a/meta/recipes-extended/ltp/ltp_20160126.bb b/meta/recipes-extended/ltp/ltp_20160126.bb
index 097c16d..278f492 100644
--- a/meta/recipes-extended/ltp/ltp_20160126.bb
+++ b/meta/recipes-extended/ltp/ltp_20160126.bb
@@ -62,6 +62,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0033-shmat1-Cover-GNU-specific-code-under-__USE_GNU.patch \
            file://0034-periodic_output.patch \
            file://0035-fix-test_proc_kill-hang.patch \
+           file://0001-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.1.4


