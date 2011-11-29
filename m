Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RVJ8K-0005pY-8Q
	for openembedded-core@openembedded.org; Tue, 29 Nov 2011 09:33:44 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 29 Nov 2011 00:27:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,590,1315206000"; d="scan'208";a="96419486"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.251])
	by fmsmga002.fm.intel.com with ESMTP; 29 Nov 2011 00:27:00 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Tue, 29 Nov 2011 00:26:54 -0800
Message-Id: <fbb50acee4ee9a29ca8374c2661a17a0c890280d.1322554983.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322554983.git.sgw@linux.intel.com>
References: <cover.1322554983.git.sgw@linux.intel.com>
In-Reply-To: <cover.1322554983.git.sgw@linux.intel.com>
References: <cover.1322554983.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 23/23] eglibc-initial: Fix kernel headers symlink being wrong
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
X-List-Received-Date: Tue, 29 Nov 2011 08:33:45 -0000

From: Matthew McClintock <msm@freescale.com>

symlinks to the kernel headers were pointing at the wrong
location when being used from cache. Just copy the kernel
headers instead

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/recipes-core/eglibc/eglibc-common.inc  |    2 +-
 meta/recipes-core/eglibc/eglibc-initial.inc |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc-common.inc b/meta/recipes-core/eglibc/eglibc-common.inc
index 4fa6488..6a93968 100644
--- a/meta/recipes-core/eglibc/eglibc-common.inc
+++ b/meta/recipes-core/eglibc/eglibc-common.inc
@@ -3,7 +3,7 @@ DESCRIPTION = "Embedded GLIBC (EGLIBC) is a variant of the GNU C Library (GLIBC)
 HOMEPAGE = "http://www.eglibc.org/home"
 SECTION = "libs"
 LICENSE = "GPLv2 & LGPLv2.1"
-INC_PR = "r11"
+INC_PR = "r12"
 LIC_FILES_CHKSUM ?= "file://LICENSES;md5=07a394b26e0902b9ffdec03765209770 \
       file://COPYING;md5=393a5ca445f6965873eca0259a17f833 \
       file://posix/rxspencer/COPYRIGHT;md5=dc5485bb394a13b2332ec1c785f5d83a \
diff --git a/meta/recipes-core/eglibc/eglibc-initial.inc b/meta/recipes-core/eglibc/eglibc-initial.inc
index 448f73a..f154d64 100644
--- a/meta/recipes-core/eglibc/eglibc-initial.inc
+++ b/meta/recipes-core/eglibc/eglibc-initial.inc
@@ -48,7 +48,7 @@ do_install () {
 
 	# add links to linux-libc-headers: gcc-{cross,crossdk}-intermediate need this.
 	for t in linux asm asm-generic; do
-		ln -s ${STAGING_DIR_TARGET}${includedir}/$t ${D}${includedir}/
+		cp -ar ${STAGING_DIR_TARGET}${includedir}/$t ${D}${includedir}/
 	done
 }
 
-- 
1.7.6.4



