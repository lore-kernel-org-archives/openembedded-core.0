Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1ToERY-0001uI-Rp
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Dec 2012 15:28:37 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 27 Dec 2012 06:13:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,362,1355126400"; d="scan'208";a="239466234"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by orsmga001.jf.intel.com with ESMTP; 27 Dec 2012 06:13:24 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Dec 2012 16:13:56 +0200
Message-Id: <7f520fd6e3e3f1223f5becfbd4d280f980fa46f4.1356617488.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1356617488.git.constantinx.musca@intel.com>
References: <cover.1356617488.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1356617488.git.constantinx.musca@intel.com>
References: <cover.1356617488.git.constantinx.musca@intel.com>
Subject: [PATCH 5/6] sysstat: fix sa_lib_dir
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
X-List-Received-Date: Thu, 27 Dec 2012 14:28:45 -0000

Fix the following warning:
WARNING: QA Issue: sysstat: Files/directories were installed but not shipped
  /usr/lib
  /usr/lib/sa
  /usr/lib/sa/sadc
  /usr/lib/sa/sa2
  /usr/lib/sa/sa1
  /usr/lib/sa/.debug
  /usr/lib/sa/.debug/sadc

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/recipes-extended/sysstat/sysstat.inc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-extended/sysstat/sysstat.inc
index 287bb54..863f246 100644
--- a/meta/recipes-extended/sysstat/sysstat.inc
+++ b/meta/recipes-extended/sysstat/sysstat.inc
@@ -3,7 +3,7 @@ DESCRIPTION = "The sysstat utilities are a collection of performance monitoring
 HOMEPAGE = "http://sebastien.godard.pagesperso-orange.fr/"
 LICENSE = "GPLv2+"
 SECTION = "console/utils"
-INC_PR = "r1"
+INC_PR = "r2"
 
 SRC_URI = "http://pagesperso-orange.fr/sebastien.godard/sysstat-${PV}.tar.gz \
 		   file://99_sysstat"
@@ -13,6 +13,10 @@ inherit autotools gettext
 EXTRA_OECONF += "--disable-sensors"
 EXTRA_OEMAKE += 'LFLAGS=""'
 
+do_configure_prepend() {
+    export sa_lib_dir=${libdir}/sa
+}
+
 do_install() {
 	autotools_do_install
 
-- 
1.7.11.7



