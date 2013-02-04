Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1U2ISc-0004wh-2s
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 10:35:34 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 04 Feb 2013 01:19:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,598,1355126400"; d="scan'208";a="252243139"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by azsmga001.ch.intel.com with ESMTP; 04 Feb 2013 01:19:43 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Feb 2013 11:20:19 +0200
Message-Id: <3943eeea0a8ca0f2e25d4e877eaa9e747db73acd.1359967266.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1359967266.git.constantinx.musca@intel.com>
References: <cover.1359967266.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1359967266.git.constantinx.musca@intel.com>
References: <cover.1359967266.git.constantinx.musca@intel.com>
Subject: [PATCH 05/10] foomatic-filters: fix CUPS directory config
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
X-List-Received-Date: Mon, 04 Feb 2013 09:35:34 -0000

- use CUPS_SERVERBIN to configure the CUPS directory
- the removed variables are not used anymore

Fix the following warning:
WARNING: QA Issue: foomatic-filters: Files/directories were installed but not shipped
  /usr/lib64
  /usr/lib64/cups
  /usr/lib64/cups/filter
  /usr/lib64/cups/backend
  /usr/lib64/cups/filter/foomatic-rip
  /usr/lib64/cups/backend/beh

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/recipes-extended/foomatic/foomatic-filters_4.0.17.bb | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-extended/foomatic/foomatic-filters_4.0.17.bb b/meta/recipes-extended/foomatic/foomatic-filters_4.0.17.bb
index bb01f71..c0290b1 100644
--- a/meta/recipes-extended/foomatic/foomatic-filters_4.0.17.bb
+++ b/meta/recipes-extended/foomatic/foomatic-filters_4.0.17.bb
@@ -10,7 +10,7 @@ format using a printer-specific, but spooler-independent PPD file. \
 "
 
 DEPENDS += "cups perl libxml2"
-PR = "r0"
+PR = "r1"
 
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/foomatic-filters-${PV}/COPYING;md5=393a5ca445f6965873eca0259a17f833"
@@ -26,10 +26,7 @@ EXTRA_OECONF += "--disable-file-converter-check --with-file-converter=texttops"
 
 do_configure_prepend() {
     export PERL="${bindir}/env perl"
-    export LIB_CUPS=${exec_prefix}/lib/cups               # /usr/lib NOT libdir
-    export CUPS_BACKENDS=${exec_prefix}/lib/cups/backend  # /usr/lib NOT libdir
-    export CUPS_FILTERS=${exec_prefix}/lib/cups/filter    # /usr/lib NOT libdir
-    export CUPS_PPDS=${datadir}/cups/model
+    export CUPS_SERVERBIN=${exec_prefix}/lib/cups       # /usr/lib NOT libdir
 }
 
 do_install_append_linuxstdbase() {
-- 
1.7.11.7



