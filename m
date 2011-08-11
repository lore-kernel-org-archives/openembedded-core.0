Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QrYDQ-0002kL-DP
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 18:34:40 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 11 Aug 2011 09:30:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,357,1309762800"; d="scan'208";a="38285565"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.248])
	by fmsmga002.fm.intel.com with ESMTP; 11 Aug 2011 09:30:04 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Aug 2011 09:29:58 -0700
Message-Id: <0377a5128953172ec0893d7cd4c1c0cf7fc9b64c.1313079549.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1313079549.git.sgw@linux.intel.com>
References: <cover.1313079549.git.sgw@linux.intel.com>
In-Reply-To: <cover.1313079549.git.sgw@linux.intel.com>
References: <cover.1313079549.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 10/10] Magic file path should be given for rpmbuild
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
X-List-Received-Date: Thu, 11 Aug 2011 16:34:40 -0000

From: jani.uusi-rantala@nokia.com <jani.uusi-rantala@nokia.com>

From d54b975506c392cfb59dbb3caf313ac061b6fa01 Mon Sep 17 00:00:00 2001
From: Jani Uusi-Rantala <jani.uusi-rantala@nokia.com>
Date: Thu, 11 Aug 2011 18:37:56 +0300
Subject: [PATCH] Magic file path should be given for rpmbuild in
 _rpmfc_magic_path define so that build system default file
 is not used by accident. Not doing this caused many
 packages to fail building in several systems.

Fixes [YOCTO #1358]

Signed-off-by: Jani Uusi-Rantala <jani.uusi-rantala@nokia.com>
---
 meta/classes/package_rpm.bbclass |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index f123229..59e8d48 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -822,6 +822,7 @@ python do_package_rpm () {
 	targetvendor = bb.data.getVar('TARGET_VENDOR', d, True)
 	pkgwritedir = bb.data.expand('${PKGWRITEDIRRPM}/${PACKAGE_ARCH}', d)
 	pkgarch = bb.data.expand('${PACKAGE_ARCH}', d)
+	magicfile = bb.data.expand('${STAGING_DIR_NATIVE}/usr/share/misc/magic.mgc', d)
 	bb.mkdirhier(pkgwritedir)
 	os.chmod(pkgwritedir, 0755)
 
@@ -834,6 +835,7 @@ python do_package_rpm () {
 	cmd = cmd + " --define '__find_provides " + outprovides + "'"
 	cmd = cmd + " --define '_unpackaged_files_terminate_build 0'"
 	cmd = cmd + " --define 'debug_package %{nil}'"
+	cmd = cmd + " --define '_rpmfc_magic_path " + magicfile + "'"
 	cmd = cmd + " -bb " + outspecfile
 
 	# Build the rpm package!
-- 
1.7.3.4



