Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 05B4065CBC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 12:04:36 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 20 Aug 2015 05:04:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,714,1432623600"; d="scan'208";a="545361616"
Received: from theory.fi.intel.com ([10.237.72.51])
	by FMSMGA003.fm.intel.com with ESMTP; 20 Aug 2015 05:04:07 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Aug 2015 15:05:48 +0300
Message-Id: <1440072348-31971-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1439974264-7891-1-git-send-email-jussi.kukkonen@intel.com>
References: <1439974264-7891-1-git-send-email-jussi.kukkonen@intel.com>
Subject: [PATCH v2] openssh: build regression test binaries
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
X-List-Received-Date: Thu, 20 Aug 2015 12:04:37 -0000

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

Changes in v2:
* ptest package RDEPENDS on sudo


 meta/recipes-connectivity/openssh/openssh/run-ptest | 2 +-
 meta/recipes-connectivity/openssh/openssh_7.0p1.bb  | 8 +++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

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
index 105875a..8519a4c 100644
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
@@ -130,7 +136,7 @@ FILES_${PN}-keygen = "${bindir}/ssh-keygen"
 
 RDEPENDS_${PN} += "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen"
 RDEPENDS_${PN}-sshd += "${PN}-keygen ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-keyinit pam-plugin-loginuid', '', d)}"
-RDEPENDS_${PN}-ptest += "${PN}-sftp ${PN}-misc ${PN}-sftp-server make"
+RDEPENDS_${PN}-ptest += "${PN}-sftp ${PN}-misc ${PN}-sftp-server make sudo"
 
 RPROVIDES_${PN}-ssh = "ssh"
 RPROVIDES_${PN}-sshd = "sshd"
-- 
2.1.4


