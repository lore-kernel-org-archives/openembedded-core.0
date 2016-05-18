Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 87941770A6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 12:12:03 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 18 May 2016 05:12:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,329,1459839600"; d="scan'208";a="979546234"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga002.jf.intel.com with ESMTP; 18 May 2016 05:12:03 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 May 2016 15:11:56 +0300
Message-Id: <737cc844c04fc742ddd6ec55a29988e5a70d09dc.1463572706.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <f3072e43a5219f3228fcc8e342c27227d92158fc.1463572706.git.jussi.kukkonen@intel.com>
References: <f3072e43a5219f3228fcc8e342c27227d92158fc.1463572706.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1463572706.git.jussi.kukkonen@intel.com>
References: <cover.1463572706.git.jussi.kukkonen@intel.com>
Subject: [PATCH 2/2][master][krogoth][jethro] openssh: Backport fix for CVE-2015-8325
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
X-List-Received-Date: Wed, 18 May 2016 12:12:03 -0000

PAM environment vars must be ignored when UseLogin=yes

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../openssh/openssh/CVE-2015-8325.patch            | 39 ++++++++++++++++++++++
 meta/recipes-connectivity/openssh/openssh_7.2p2.bb |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2015-8325.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2015-8325.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2015-8325.patch
new file mode 100644
index 0000000..2263897
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2015-8325.patch
@@ -0,0 +1,39 @@
+From 85bdcd7c92fe7ff133bbc4e10a65c91810f88755 Mon Sep 17 00:00:00 2001
+From: Damien Miller <djm@mindrot.org>
+Date: Wed, 13 Apr 2016 10:39:57 +1000
+Subject: ignore PAM environment vars when UseLogin=yes
+
+If PAM is configured to read user-specified environment variables
+and UseLogin=yes in sshd_config, then a hostile local user may
+attack /bin/login via LD_PRELOAD or similar environment variables
+set via PAM.
+
+CVE-2015-8325, found by Shayan Sadigh, via Colin Watson
+
+
+
+https://anongit.mindrot.org/openssh.git/commit/session.c?id=85bdcd7c92fe7ff133bbc4e10a65c91810f88755
+
+CVE: CVE-2015-8325
+Upstream-Status: Backport
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+---
+ session.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/session.c b/session.c
+index 4859245..4653b09 100644
+--- a/session.c
++++ b/session.c
+@@ -1322,7 +1322,7 @@ do_setup_env(Session *s, const char *shell)
+ 	 * Pull in any environment variables that may have
+ 	 * been set by PAM.
+ 	 */
+-	if (options.use_pam) {
++	if (options.use_pam && !options.use_login) {
+ 		char **p;
+ 
+ 		p = fetch_pam_child_environment();
+-- 
+cgit v0.11.2
+
diff --git a/meta/recipes-connectivity/openssh/openssh_7.2p2.bb b/meta/recipes-connectivity/openssh/openssh_7.2p2.bb
index 173f80a..7e04716 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.2p2.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.2p2.bb
@@ -21,6 +21,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://volatiles.99_sshd \
            file://add-test-support-for-busybox.patch \
            file://run-ptest \
+           file://CVE-2015-8325.patch \
            "
 
 PAM_SRC_URI = "file://sshd"
-- 
2.1.4


