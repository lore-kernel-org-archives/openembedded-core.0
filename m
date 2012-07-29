Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SvMRL-0005hC-CH
	for openembedded-core@lists.openembedded.org;
	Sun, 29 Jul 2012 07:53:19 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 28 Jul 2012 22:41:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="189126716"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.26])
	by fmsmga001.fm.intel.com with ESMTP; 28 Jul 2012 22:41:29 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Jul 2012 06:41:24 +0100
Message-Id: <1343540484-5817-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] classes/package: ensure pkgdata is cleaned out first
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
X-List-Received-Date: Sun, 29 Jul 2012 05:53:19 -0000

If do_package needs to be re-run and packages are removed/renamed as a
result, we want the corresponding stale pkgdata files to no longer be
present; for that we need to ensure all of the old pkgdata files are
cleaned out prior to creating the new ones. This is particularly
important now we rely on pkgdata more heavily (for complementary
packages, license manifest, etc.).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/package.bbclass |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index f55b3e0..6142911 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1795,6 +1795,7 @@ addtask package before do_build after do_install
 PACKAGELOCK = "${STAGING_DIR}/package-output.lock"
 SSTATETASKS += "do_package"
 do_package[sstate-name] = "package"
+do_package[cleandirs] = "${PKGDESTWORK}"
 do_package[sstate-plaindirs] = "${PKGD} ${PKGDEST}"
 do_package[sstate-inputdirs] = "${PKGDESTWORK} ${SHLIBSWORKDIR}"
 do_package[sstate-outputdirs] = "${PKGDATA_DIR} ${SHLIBSDIR}"
-- 
1.7.9.5



