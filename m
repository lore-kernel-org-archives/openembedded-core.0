Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SWzEh-0007Ob-EI
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 02:15:31 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 22 May 2012 17:05:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="143529243"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by orsmga001.jf.intel.com with ESMTP; 22 May 2012 17:05:20 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 May 2012 17:05:12 -0700
Message-Id: <2b6031ba18c71f0083c006da01fbc5dafd2c4f9a.1337731469.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <9fcc40151424883e9f660dfdd3a3eb52213701c1.1337731469.git.nitin.a.kamble@intel.com>
References: <9fcc40151424883e9f660dfdd3a3eb52213701c1.1337731469.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1337731469.git.nitin.a.kamble@intel.com>
References: <cover.1337731469.git.nitin.a.kamble@intel.com>
Subject: [PATCH 2/9] libgcrypt: fix build
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
X-List-Received-Date: Wed, 23 May 2012 00:15:31 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

avoid this issue:

| rmdir: failed to remove `/srv/home/nitin/builds/build-gcc47/tmp/work/i586-poky-linux/libgcrypt-1.5.0-r0/image/usr/sbin': No such file or directory
NOTE: package libgcrypt-1.5.0-r0: task do_install: Failed

no PR bump as no change in the output

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-support/libgcrypt/libgcrypt.inc |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-support/libgcrypt/libgcrypt.inc b/meta/recipes-support/libgcrypt/libgcrypt.inc
index a890188..012f36a 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt.inc
+++ b/meta/recipes-support/libgcrypt/libgcrypt.inc
@@ -23,7 +23,9 @@ do_install_append() {
 	install -m 0644 ${S}/src/libgcrypt.pc ${D}/${libdir}/pkgconfig/
 	
 	# Remove empty sbin directory since we don't build the daemon that would install there
-	rmdir ${D}${sbindir}
+	if [ -d ${D}${sbindir} ] ; then
+		rmdir ${D}${sbindir}
+	fi
 }
 
 ARM_INSTRUCTION_SET = "arm"
-- 
1.7.7



