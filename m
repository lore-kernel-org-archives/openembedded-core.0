Return-Path: <swee.aun.khor@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 831A872F67
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 05:23:09 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Aug 2017 22:23:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,443,1498546800"; d="scan'208";a="1211792998"
Received: from echidna.jf.intel.com ([10.54.77.34])
	by fmsmga002.fm.intel.com with ESMTP; 28 Aug 2017 22:23:10 -0700
From: swee.aun.khor@intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Aug 2017 15:14:07 -0700
Message-Id: <1503958447-114317-1-git-send-email-swee.aun.khor@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] openssh: Fix syntax error on x32
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
X-List-Received-Date: Tue, 29 Aug 2017 05:23:09 -0000

From: sweeaun <swee.aun.khor@intel.com>

Fix compilation error during openssh x32 build due to syntax error.

Signed-off-by: sweeaun <swee.aun.khor@intel.com>
---
 .../0001-openssh-Fix-syntax-error-on-x32.patch     | 33 ++++++++++++++++++++++
 meta/recipes-connectivity/openssh/openssh_7.5p1.bb |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/0001-openssh-Fix-syntax-error-on-x32.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/0001-openssh-Fix-syntax-error-on-x32.patch b/meta/recipes-connectivity/openssh/openssh/0001-openssh-Fix-syntax-error-on-x32.patch
new file mode 100644
index 0000000..ce9e200
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/0001-openssh-Fix-syntax-error-on-x32.patch
@@ -0,0 +1,33 @@
+From a7e359d4ba345aa2a13c07f1057184e9b4e598a2 Mon Sep 17 00:00:00 2001
+From: sweeaun <swee.aun.khor@intel.com>
+Date: Tue, 22 Aug 2017 11:19:48 -0700
+Subject: [PATCH] openssh: Fix syntax error on x32
+
+Upstream-Status: Backport
+This bug has been fixed in v_7.5 branch https://github.com/openssh/
+openssh-portable/tree/V_7_5 and master branch https://github.com/
+openssh/openssh-portable/tree/master.
+
+Fix compilation error during openssh x32 build due to syntax error.
+
+Signed-off-by: sweeaun <swee.aun.khor@intel.com>
+---
+ sandbox-seccomp-filter.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sandbox-seccomp-filter.c b/sandbox-seccomp-filter.c
+index 3a1aedc..a8d472a 100644
+--- a/sandbox-seccomp-filter.c
++++ b/sandbox-seccomp-filter.c
+@@ -235,7 +235,7 @@ static const struct sock_filter preauth_insns[] = {
+ 	 * x86-64 syscall under some circumstances, e.g.
+ 	 * https://bugs.debian.org/849923
+ 	 */
+-	SC_ALLOW(__NR_clock_gettime & ~__X32_SYSCALL_BIT);
++	SC_ALLOW(__NR_clock_gettime & ~__X32_SYSCALL_BIT),
+ #endif
+ 
+ 	/* Default deny */
+-- 
+2.7.4
+
diff --git a/meta/recipes-connectivity/openssh/openssh_7.5p1.bb b/meta/recipes-connectivity/openssh/openssh_7.5p1.bb
index 3b8fd7d..e46b4c8 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.5p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.5p1.bb
@@ -26,6 +26,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://openssh-7.1p1-conditional-compile-des-in-cipher.patch \
            file://openssh-7.1p1-conditional-compile-des-in-pkcs11.patch \
            file://fix-potential-signed-overflow-in-pointer-arithmatic.patch \
+           file://0001-openssh-Fix-syntax-error-on-x32.patch \
            "
 
 PAM_SRC_URI = "file://sshd"
-- 
2.7.4


