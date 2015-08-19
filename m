Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C6088737F4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 08:49:29 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 19 Aug 2015 01:49:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,708,1432623600"; d="scan'208";a="751397387"
Received: from theory.fi.intel.com ([10.237.72.51])
	by orsmga001.jf.intel.com with ESMTP; 19 Aug 2015 01:49:29 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Aug 2015 11:51:04 +0300
Message-Id: <1439974264-7891-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] openssh: build regression test binaries
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
X-List-Received-Date: Wed, 19 Aug 2015 08:49:30 -0000

ptests were failing and many more were being silently skipped because
required binaries were not being built.

Build the binaries in regress/ and set SUDO environment variable in
run-ptests: after this all tests in regress/ are now run. Continue to
skip building binaries in regress/unittests/: unittest runtime is
excessive.

On a NUC running intel-corei7-64 core-image-sato, new results are:
PASS: 55, SKIP: 3, FAIL: 0

[YOCTO #8153]

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---

I tested this with openssh 7.0p1 (which was sent to mailinglist on
Aug 18), should work with 6.9p1 as well.


 meta/recipes-connectivity/openssh/openssh/run-ptest | 2 +-
 meta/recipes-connectivity/openssh/openssh_7.0p1.bb  | 6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssh/openssh/run-ptest b/meta/recipes-connectivity/openssh/openssh/run-ptest
index 3e725cf..564c0c8 100755
--- a/meta/recipes-connectivity/openssh/openssh/run-ptest
+++ b/meta/recipes-connectivity/openssh/openssh/run-ptest
@@ -3,5 +3,5 @@
 export TEST_SHELL=sh
 
 cd regress
-make -k .OBJDIR=`pwd` .CURDIR=`pwd` tests \
+make -k .OBJDIR=`pwd` .CURDIR=`pwd` SUDO="sudo" tests \
         | sed -e 's/^skipped/SKIP: /g' -e 's/^ok /PASS: /g' -e 's/^failed/FAIL: /g'
diff --git a/meta/recipes-connectivity/openssh/openssh_7.0p1.bb b/meta/recipes-connectivity/openssh/openssh_7.0p1.bb
index 105875a..67abe57 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.0p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.0p1.bb
@@ -79,6 +79,12 @@ do_configure_prepend () {
 	fi
 }
 
+do_compile_ptest() {
+        # skip regress/unittests/ binaries: this will silently skip
+        # unittests in run-ptests which is good because they are so slow.
+        oe_runmake regress/modpipe regress/setuid-allowed regress/netcat
+}
+
 do_install_append () {
 	if [ "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}" = "pam" ]; then
 		install -D -m 0755 ${WORKDIR}/sshd ${D}${sysconfdir}/pam.d/sshd
-- 
2.1.4


