Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QpabK-0000Nc-Od
	for openembedded-core@lists.openembedded.org;
	Sat, 06 Aug 2011 08:43:14 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 05 Aug 2011 23:38:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,327,1309762800"; d="scan'208";a="35941156"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.173])
	by orsmga001.jf.intel.com with ESMTP; 05 Aug 2011 23:38:47 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Aug 2011 23:38:37 -0700
Message-Id: <173c73e87ab4e499eb146fe1d7193b1aca1979d8.1312612601.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1312612601.git.sgw@linux.intel.com>
References: <cover.1312612601.git.sgw@linux.intel.com>
In-Reply-To: <cover.1312612601.git.sgw@linux.intel.com>
References: <cover.1312612601.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 1/9] gcc: use ${base_lib} to match gcc default configuration
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
X-List-Received-Date: Sat, 06 Aug 2011 06:43:15 -0000

From: Kumar Gala <galak@kernel.crashing.org>

Rather than tweaking MULTILIB_DIRNAMES & MULTILIB_OSDIRNAMES like is
done for x86-64 via 64bithack.patch.  We can just go with gcc defaults
and utilize ${base_lib} for where to find gcc libs.

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
 .../gcc/gcc-cross-intermediate.inc                 |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc b/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
index df5958a..7b1bb38 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-intermediate.inc
@@ -34,7 +34,7 @@ do_compile () {
 do_install () {
 	oe_runmake 'DESTDIR=${D}' install
 	install -d ${D}${target_base_libdir}/
-	mv ${D}${exec_prefix}/${TARGET_SYS}/lib/* ${D}${target_base_libdir}/
+	mv ${D}${exec_prefix}/${TARGET_SYS}/${baselib}/* ${D}${target_base_libdir}/
 
 	# We don't really need this (here shares/ contains man/, info/, locale/).
 	rm -rf ${D}${datadir}/
-- 
1.7.3.4



