Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SQQF2-0000V8-2R
	for openembedded-core@lists.openembedded.org;
	Fri, 04 May 2012 23:40:44 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 04 May 2012 14:30:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="149486036"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by fmsmga001.fm.intel.com with ESMTP; 04 May 2012 14:30:48 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 May 2012 14:30:29 -0700
Message-Id: <71d9e4f9d3a7132b9adb12002ad92d99fbd08226.1336166919.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <a0c837f8e419221a32b6709163579732f1758c84.1336166919.git.nitin.a.kamble@intel.com>
References: <a0c837f8e419221a32b6709163579732f1758c84.1336166919.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1336166919.git.nitin.a.kamble@intel.com>
References: <cover.1336166919.git.nitin.a.kamble@intel.com>
Subject: [PATCH 23/40] gpgme: fix build
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
X-List-Received-Date: Fri, 04 May 2012 21:40:46 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

avoid this issue:

| rmdir: failed to remove `/srv/home/nitin/builds/build-gcc47/tmp/wERROR: Function failed: do_install (see /srv/home/nitin/builds/build-gcc47/tmp/work/i586-poky-linux/gpgme-1.3.1-r1/temp/log.do_install.36763 for further information)
| ork/i586-poky-linux/gpgme-1.3.1-r1/image/usr/libexec': No such file or directory
NOTE: package gpgme-1.3.1-r1: task do_install: Failed

no PR bump as no change in the output

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-support/gpgme/gpgme_1.3.1.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-support/gpgme/gpgme_1.3.1.bb b/meta/recipes-support/gpgme/gpgme_1.3.1.bb
index 4bcb57a..88f6d28 100644
--- a/meta/recipes-support/gpgme/gpgme_1.3.1.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.3.1.bb
@@ -28,5 +28,7 @@ FILES_${PN} = "${libdir}/libgpgme.so.*"
 FILES_${PN}-dev += "${bindir}/gpgme-config ${datadir}/common-lisp/source/gpgme/*"
 
 do_install_append() {
-	rmdir ${D}/usr/libexec
+	if [ -d ${D}/usr/libexec ] ; then
+		rmdir ${D}/usr/libexec
+	fi
 }
-- 
1.7.7



