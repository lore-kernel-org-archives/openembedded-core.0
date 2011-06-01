Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QRerr-00042u-NL
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 08:25:24 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 31 May 2011 23:22:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,302,1304319600"; d="scan'208";a="10203829"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.41])
	by fmsmga002.fm.intel.com with ESMTP; 31 May 2011 23:22:06 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 May 2011 23:21:52 -0700
Message-Id: <43ba264bf3edbfd59995703ba48e99ce925f1a15.1306909184.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1306909184.git.sgw@linux.intel.com>
References: <cover.1306909184.git.sgw@linux.intel.com>
In-Reply-To: <cover.1306909184.git.sgw@linux.intel.com>
References: <cover.1306909184.git.sgw@linux.intel.com>
Cc: Xiaofeng Yan <xiaofeng.yan@windriver.com>
Subject: [CONSOLIDATED PULL 25/32] sudo.inc: Add do_install_prepend () to sudo.inc
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
X-List-Received-Date: Wed, 01 Jun 2011 06:25:25 -0000

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Fix bug [YOCTO #1092]
Own a directory "/var/lib" before do_install() because if there isn't this directory during installing, \
then script "mkinstalldirs" from "sudo package" will create directory "/var/lib/sudo" by recursion with mode "0700" \
which will cause bug [YOCTO #1092]. So I add do_install_prepend() to create a "/var/lib" which can be accessed \
by common user before installing files.

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/recipes-extended/sudo/sudo.inc |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index 6a04a9c..fd68057 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -23,6 +23,18 @@ do_configure_prepend () {
 	fi
 }
 
+# The script "mkinstalldirs" from package "sudo" will create directory 
+# "/var/lib/sudo" by recursion with mode "0700" during installing files.
+# That is to say, "var", "var/lib" and "var/lib/sudo" will possess access authority 
+# with mode "0700". It cause that directory "var" and "var/lib" 
+# can't be accessed by common user. Creating directory "/var/lib" before 
+# installing files can resolve this problem.
+
+do_install_prepend (){
+	mkdir -p ${D}/${localstatedir}/lib
+}
+ 
+
 pkg_postinst_${PN} () {
 	if [ "x$D" != "x" ]; then
 		exit 1
-- 
1.7.3.4



