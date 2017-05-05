Return-Path: <wei.tee.ng@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 809DF77D62
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 May 2017 09:14:41 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 May 2017 02:14:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,291,1491289200"; d="scan'208";a="1126762655"
Received: from echidna.jf.intel.com ([10.54.77.34])
	by orsmga001.jf.intel.com with ESMTP; 05 May 2017 02:14:41 -0700
From: wei.tee.ng@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 May 2017 19:04:57 -0700
Message-Id: <1493949898-38657-2-git-send-email-wei.tee.ng@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493949898-38657-1-git-send-email-wei.tee.ng@intel.com>
References: <1493949898-38657-1-git-send-email-wei.tee.ng@intel.com>
Cc: wei.tee.ng@intel.com
Subject: [PATCH 1/2] rpm: allow arch-dependent binaries in noarch packages
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
X-List-Received-Date: Fri, 05 May 2017 09:14:41 -0000

From: Ng Wei Tee <wei.tee.ng@intel.com>

This is needed for packages like linux-firmware which have a
legitimate reason for it. Oe-core has a separate package_qa
test for this situation, so any accidental inclusions of such
binaries will still be caught.

[YOCTO #11329]

Signed-off-by: Ng Wei Tee <wei.tee.ng@intel.com>
---
 meta/classes/package_rpm.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 084546f..a844c4d 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -643,6 +643,7 @@ python do_package_rpm () {
     cmd = cmd + " --define '_builddir " + d.getVar('S') + "'"
     cmd = cmd + " --define '_build_name_fmt %%{NAME}-%%{VERSION}-%%{RELEASE}.%%{ARCH}.rpm'"
     cmd = cmd + " --define '_use_internal_dependency_generator 0'"
+    cmd = cmd + " --define '_binaries_in_noarch_packages_terminate_build 0'"
     if perfiledeps:
         cmd = cmd + " --define '__find_requires " + outdepends + "'"
         cmd = cmd + " --define '__find_provides " + outprovides + "'"
-- 
2.7.4


