Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SAKYq-00029x-TW
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 13:22:41 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 21 Mar 2012 05:13:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="121485279"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.204])
	by azsmga001.ch.intel.com with ESMTP; 21 Mar 2012 05:12:45 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Mar 2012 12:12:40 +0000
Message-Id: <90194e665f87f08448ba1eb098d5a721f2858efa.1332331918.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1332331918.git.paul.eggleton@linux.intel.com>
References: <cover.1332331918.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1332331918.git.paul.eggleton@linux.intel.com>
References: <cover.1332331918.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/3] hdparm: fix stripped file warning
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
X-List-Received-Date: Wed, 21 Mar 2012 12:22:41 -0000

Fix the following package warning:
WARNING: File '/sbin/hdparm.hdparm' from hdparm was already stripped, this will prevent future debugging!

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-extended/hdparm/hdparm_9.39.bb |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-extended/hdparm/hdparm_9.39.bb b/meta/recipes-extended/hdparm/hdparm_9.39.bb
index d8342cc..ed076cc 100644
--- a/meta/recipes-extended/hdparm/hdparm_9.39.bb
+++ b/meta/recipes-extended/hdparm/hdparm_9.39.bb
@@ -8,6 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=910a8a42c962d238619c75fdb78bdb24 \
                     file://wiper/GPLv2.txt;md5=fcb02dc552a041dee27e4b85c7396067 \
                     file://wiper/wiper.sh;beginline=7;endline=31;md5=b7bc642addc152ea307505bf1a296f09"
 
+PR = "r1"
+
 PACKAGES += "wiper"
 
 FILES_wiper = "${bindir}/wiper.sh"
@@ -20,6 +22,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/hdparm/hdparm-${PV}.tar.gz "
 SRC_URI[md5sum] = "2bc17b72403885d4faf959682944243b"
 SRC_URI[sha256sum] = "72d550af4526aa96f0841c79321a0ee39d636cbaf1f294e52193e90c054b3cea"
 
+EXTRA_OEMAKE += 'STRIP="echo"'
+
 do_install () {
 	install -d ${D}/${base_sbindir} ${D}/${mandir}/man8 ${D}/${bindir}
 	oe_runmake 'DESTDIR=${D}' 'sbindir=${base_sbindir}' install
-- 
1.7.5.4



