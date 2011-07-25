Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QlFgt-0001mf-Ar
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 09:35:03 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 25 Jul 2011 00:30:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,259,1309762800"; d="scan'208";a="31038668"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.61])
	by azsmga001.ch.intel.com with ESMTP; 25 Jul 2011 00:30:45 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jul 2011 00:30:39 -0700
Message-Id: <98e85bedb8633fa8017afd801a36920b96b35951.1311578785.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311578785.git.sgw@linux.intel.com>
References: <cover.1311578785.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311578785.git.sgw@linux.intel.com>
References: <cover.1311578785.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED 25 July PULL 3/7] gcc-4.6: Fix packaging of native toolchains
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
X-List-Received-Date: Mon, 25 Jul 2011 07:35:03 -0000

From: Kumar Gala <galak@kernel.crashing.org>

The base gcc package is missing liblto_plugin.so.  If we try a simple
hello world compile we get something like:

root@p5020-ds:~# gcc hello.c
gcc: fatal error: -fuse-linker-plugin, but liblto_plugin.so not found
compilation terminated.

We need to include liblto_plugin.so in the base gcc package and not
gcc-dev.

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
 meta/recipes-devtools/gcc/gcc-4.6.inc            |    2 +-
 meta/recipes-devtools/gcc/gcc-package-target.inc |    1 +
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtools/gcc/gcc-4.6.inc
index a636d32..6956677 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r1"
+PR = "r2"
 
 # Third digit in PV should be incremented after a minor release
 # happens from this branch on gcc e.g. currently its 4.6.0
diff --git a/meta/recipes-devtools/gcc/gcc-package-target.inc b/meta/recipes-devtools/gcc/gcc-package-target.inc
index e6105da..a0e5da4 100644
--- a/meta/recipes-devtools/gcc/gcc-package-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-package-target.inc
@@ -17,6 +17,7 @@ FILES_${PN} = "\
   ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/cc* \
   ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/lto* \
   ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/lib*${SOLIBS} \
+  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/liblto*${SOLIBSDEV} \
   ${gcclibdir}/${TARGET_SYS}/${BINV}/*.o \
   ${gcclibdir}/${TARGET_SYS}/${BINV}/specs \
   ${gcclibdir}/${TARGET_SYS}/${BINV}/lib*${SOLIBS} \
-- 
1.7.3.4



