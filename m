Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sz2FS-0002DR-D9
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Aug 2012 11:08:14 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 08 Aug 2012 01:56:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,732,1336374000"; d="scan'208";a="177367049"
Received: from unknown (HELO swold-mobl.amr.corp.intel.com) ([10.255.12.166])
	by orsmga001.jf.intel.com with ESMTP; 08 Aug 2012 01:56:25 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2012 11:56:24 +0300
Message-Id: <1344416184-28969-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH] foomatic: fix perl path for target
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
X-List-Received-Date: Wed, 08 Aug 2012 09:08:14 -0000

This problem appears on F17 when configure finds /bin/perl, since the beh
script is a target side script, we need to set PERL in the do_configure_prepend
in order for the correct perl to be used

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../foomatic/foomatic-filters_4.0.16.bb            |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/foomatic/foomatic-filters_4.0.16.bb b/meta/recipes-extended/foomatic/foomatic-filters_4.0.16.bb
index 5f145b0..d158f94 100644
--- a/meta/recipes-extended/foomatic/foomatic-filters_4.0.16.bb
+++ b/meta/recipes-extended/foomatic/foomatic-filters_4.0.16.bb
@@ -10,7 +10,7 @@ format using a printer-specific, but spooler-independent PPD file. \
 "
 
 DEPENDS += "cups perl libxml2"
-PR = "r0"
+PR = "r1"
 
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/foomatic-filters-${PV}/COPYING;md5=393a5ca445f6965873eca0259a17f833"
@@ -25,6 +25,7 @@ inherit autotools
 EXTRA_OECONF += "--disable-file-converter-check --with-file-converter=texttops"
 
 do_configure_prepend() {
+    export PERL="${bindir}/env perl"
     export LIB_CUPS=${exec_prefix}/lib/cups               # /usr/lib NOT libdir
     export CUPS_BACKENDS=${exec_prefix}/lib/cups/backend  # /usr/lib NOT libdir
     export CUPS_FILTERS=${exec_prefix}/lib/cups/filter    # /usr/lib NOT libdir
-- 
1.7.7.6



