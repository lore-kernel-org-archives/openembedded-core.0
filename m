Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UGXLQ-00086S-8c
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Mar 2013 17:19:02 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 15 Mar 2013 09:02:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,850,1355126400"; d="scan'208";a="280057856"
Received: from lpalcu-linux.rb.intel.com (HELO localhost.localdomain)
	([10.237.105.165])
	by orsmga001.jf.intel.com with ESMTP; 15 Mar 2013 09:01:57 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Mar 2013 18:01:52 +0200
Message-Id: <1363363314-12326-2-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1363363314-12326-1-git-send-email-laurentiu.palcu@intel.com>
References: <1363363314-12326-1-git-send-email-laurentiu.palcu@intel.com>
Subject: [PATCH 1/2] gcc-cross-canadian: do not create symlinks to non-existent binaries
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Mar 2013 16:19:57 -0000
X-List-Received-Date: Fri, 15 Mar 2013 16:19:57 -0000

If fortran is not built, soft links to gfortran and g77 are created
even though the fortran compiler doesn't exist...

[YOCTO #4023]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/recipes-devtools/gcc/gcc-package-sdk.inc |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-package-sdk.inc b/meta/recipes-devtools/gcc/gcc-package-sdk.inc
index f32e95f..bb6dfde 100644
--- a/meta/recipes-devtools/gcc/gcc-package-sdk.inc
+++ b/meta/recipes-devtools/gcc/gcc-package-sdk.inc
@@ -60,6 +60,10 @@ do_install () {
 	dest=${D}${libexecdir}/gcc/${TARGET_SYS}/${BINV}/
 	install -d $dest
 	for t in ar as ld nm objcopy objdump ranlib strip g77 gcc cpp gfortran; do
+		if [ "$t" = "g77" -o "$t" = "gfortran" ] && [ ! -e ${D}${bindir}/${TARGET_PREFIX}$t ]; then
+			continue
+		fi
+
 		ln -sf ${bindir}/${TARGET_PREFIX}$t $dest$t
 	done
 
-- 
1.7.9.5



