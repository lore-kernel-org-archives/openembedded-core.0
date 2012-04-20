Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SLH73-0005g0-Rk
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Apr 2012 18:55:14 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 20 Apr 2012 09:45:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="156167893"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.163])
	by fmsmga002.fm.intel.com with ESMTP; 20 Apr 2012 09:45:41 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Apr 2012 09:45:15 -0700
Message-Id: <8a5051da0a231ff8f0d0617efb8782e0237b13ac.1334940120.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1334940120.git.sgw@linux.intel.com>
References: <cover.1334940120.git.sgw@linux.intel.com>
In-Reply-To: <cover.1334940120.git.sgw@linux.intel.com>
References: <cover.1334940120.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 24/43] cpio: use update-alternatives class
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
X-List-Received-Date: Fri, 20 Apr 2012 16:55:14 -0000
X-List-Received-Date: Fri, 20 Apr 2012 16:55:14 -0000

From: Mark Hatle <mark.hatle@windriver.com>

Use the manual_alternative_links to ensure that the cpio packages
are generated with proper runtime provides.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-extended/cpio/cpio_2.11.bb |    2 +-
 meta/recipes-extended/cpio/cpio_2.8.bb  |    2 +-
 meta/recipes-extended/cpio/cpio_v2.inc  |    3 +++
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/cpio/cpio_2.11.bb b/meta/recipes-extended/cpio/cpio_2.11.bb
index 78da20e..73a3444 100644
--- a/meta/recipes-extended/cpio/cpio_2.11.bb
+++ b/meta/recipes-extended/cpio/cpio_2.11.bb
@@ -3,7 +3,7 @@ include cpio_v2.inc
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI[md5sum] = "1112bb6c45863468b5496ba128792f6c"
 SRC_URI[sha256sum] = "601b1d774cd6e4cd39416203c91ec59dbd65dd27d79d75e1a9b89497ea643978"
diff --git a/meta/recipes-extended/cpio/cpio_2.8.bb b/meta/recipes-extended/cpio/cpio_2.8.bb
index 006e4f6..cabc1cd 100644
--- a/meta/recipes-extended/cpio/cpio_2.8.bb
+++ b/meta/recipes-extended/cpio/cpio_2.8.bb
@@ -3,7 +3,7 @@ require cpio_v2.inc
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b7f772ea3a2489231cb4872656cac34b"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI += "file://m4extensions.patch \
     file://avoid_heap_overflow.patch \
diff --git a/meta/recipes-extended/cpio/cpio_v2.inc b/meta/recipes-extended/cpio/cpio_v2.inc
index 066e937..2672c95 100644
--- a/meta/recipes-extended/cpio/cpio_v2.inc
+++ b/meta/recipes-extended/cpio/cpio_v2.inc
@@ -25,6 +25,9 @@ do_install () {
     esac
 }
 
+inherit update-alternatives
+MANUAL_ALTERNATIVE_LINKS = "${base_bindir}/cpio ${libexecdir}/rmt"
+
 pkg_postinst_${PN} () {
     update-alternatives --install ${base_bindir}/cpio cpio cpio.${PN} 100
     if [ -f ${libexecdir}/rmt.${PN} ]
-- 
1.7.7.6



