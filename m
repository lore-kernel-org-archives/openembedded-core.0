Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SQ0iS-0001oY-9x
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 20:25:24 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 03 May 2012 11:15:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="96065372"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by AZSMGA002.ch.intel.com with ESMTP; 03 May 2012 11:15:27 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 May 2012 11:15:20 -0700
Message-Id: <fd4416882e867ab6b2ff6d90aca0594fcef6017d.1336068854.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <e19e8ab17e0497c8de235f92d3c8d5ffcff19d91.1336068854.git.nitin.a.kamble@intel.com>
References: <e19e8ab17e0497c8de235f92d3c8d5ffcff19d91.1336068854.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1336068854.git.nitin.a.kamble@intel.com>
References: <cover.1336068854.git.nitin.a.kamble@intel.com>
Subject: [PATCH 26/28] gpgme: fix build
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
X-List-Received-Date: Thu, 03 May 2012 18:25:24 -0000

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



