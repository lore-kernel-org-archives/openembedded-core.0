Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eflanagan@envy.jf.intel.com>) id 1ScmQS-00047k-FB
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jun 2012 01:47:36 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 07 Jun 2012 16:37:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="149733201"
Received: from envy.jf.intel.com ([10.7.201.175])
	by orsmga001.jf.intel.com with ESMTP; 07 Jun 2012 16:37:04 -0700
Received: from envy.jf.intel.com (localhost [127.0.0.1])
	by envy.jf.intel.com (8.14.4/8.14.4/Debian-2ubuntu2) with ESMTP id
	q57NbINQ006559 for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Jun 2012 16:37:18 -0700
Received: (from eflanagan@localhost)
	by envy.jf.intel.com (8.14.4/8.14.4/Submit) id q57NbI9k006558
	for openembedded-core@lists.openembedded.org;
	Thu, 7 Jun 2012 16:37:18 -0700
From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jun 2012 16:37:02 -0700
Message-Id: <28e560ed1a066a82794474f393bffce2668dfee3.1339111944.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <480358f458a7874b5705fc48547489d19a9df72c.1339111944.git.elizabeth.flanagan@intel.com>
References: <480358f458a7874b5705fc48547489d19a9df72c.1339111944.git.elizabeth.flanagan@intel.com>
In-Reply-To: <cover.1339111944.git.elizabeth.flanagan@intel.com>
References: <cover.1339111944.git.elizabeth.flanagan@intel.com>
Subject: [Consolidated Pull 14/22] insane.bbclass: Make ldd exec_prefix error reporting easier to read
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
X-List-Received-Date: Thu, 07 Jun 2012 23:47:36 -0000

From: Mark Hatle <mark.hatle@windriver.com>

Remove the long obtuse sysroot path from the ldd output.

Make the error message significantly easier to read and understand.

Old Style:
WARNING: QA Issue: keyutils: /home/mhatle/git/oss/oe-core/build-i386/tmp-eglibc/work/i586-oe-linux/keyutils-1.5.5-r1/packages-split/keyutils/sbin/request-key links to something under exec_prefix
WARNING: QA Issue: ldd reports:         libkeyutils.so.1 => /home/mhatle/git/oss/oe-core/build-i386/tmp-eglibc/sysroots/qemux86/usr/lib/libkeyutils.so.1 (0xdead1000)
        libc.so.6 => /home/mhatle/git/oss/oe-core/build-i386/tmp-eglibc/sysroots/qemux86/lib/libc.so.6 (0xdead2000)
        /lib/ld-linux.so.2 => /home/mhatle/git/oss/oe-core/build-i386/tmp-eglibc/sysroots/qemux86/lib/ld-linux.so.2 (0xdead3000)

New style:
WARNING: QA Issue: keyutils: /sbin/request-key, installed in the base_prefix, requires a shared library under exec_prefix (/usr): libkeyutils.so.1 => /usr/lib/libkeyutils.so.1 (0xdead1000)

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
---
 meta/classes/insane.bbclass |   20 ++++++++++++++++----
 1 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 4d139e8..556a176 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -251,10 +251,22 @@ def package_qa_check_unsafe_references_in_binaries(path, name, d, elf, messages)
 			return False
 
 		if sysroot_path_usr in ldd_output:
-			error_msg = pn + ": %s links to something under exec_prefix" % path
-			package_qa_handle_error("unsafe-references-in-binaries", error_msg, d)
-			error_msg = "ldd reports: %s" % ldd_output
-			package_qa_handle_error("unsafe-references-in-binaries", error_msg, d)
+			ldd_output = ldd_output.replace(sysroot_path, "")
+
+			pkgdest = d.getVar('PKGDEST', True)
+			packages = d.getVar('PACKAGES', True)
+
+			for package in packages.split():
+				short_path = path.replace('%s/%s' % (pkgdest, package), "", 1)
+				if (short_path != path):
+					break
+
+			base_err = pn + ": %s, installed in the base_prefix, requires a shared library under exec_prefix (%s)" % (short_path, exec_prefix)
+			for line in ldd_output.split('\n'):
+				if exec_prefix in line:
+					error_msg = "%s: %s" % (base_err, line.strip())
+					package_qa_handle_error("unsafe-references-in-binaries", error_msg, d)
+
 			return False
 
 QAPATHTEST[unsafe-references-in-scripts] = "package_qa_check_unsafe_references_in_scripts"
-- 
1.7.5.4



