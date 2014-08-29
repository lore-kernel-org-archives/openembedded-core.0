Return-Path: <cristian.iorga@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E0FB270F06
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 13:10:48 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 29 Aug 2014 06:10:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,424,1406617200"; d="scan'208";a="591690125"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by fmsmga002.fm.intel.com with ESMTP; 29 Aug 2014 06:10:49 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Aug 2014 16:10:42 +0300
Message-Id: <badcf0bac40ddda42b5524af64a1f2b3976f0234.1409317786.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1409317786.git.cristian.iorga@intel.com>
References: <cover.1409317786.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1409317786.git.cristian.iorga@intel.com>
References: <cover.1409317786.git.cristian.iorga@intel.com>
Subject: [PATCH 3/3] libical: upgrade to 1.0.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Aug 2014 13:10:49 -0000

pthread-fix.patch no longer needed, included upstream;
Switched to new website, new bug tracker, new source repo.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../libical/files/pthread-fix.patch                | 52 ----------------------
 .../libical/{libical_0.48.bb => libical_1.0.0.bb}  | 13 +++---
 2 files changed, 5 insertions(+), 60 deletions(-)
 delete mode 100644 meta/recipes-support/libical/files/pthread-fix.patch
 rename meta/recipes-support/libical/{libical_0.48.bb => libical_1.0.0.bb} (40%)

diff --git a/meta/recipes-support/libical/files/pthread-fix.patch b/meta/recipes-support/libical/files/pthread-fix.patch
deleted file mode 100644
index 877b808..0000000
--- a/meta/recipes-support/libical/files/pthread-fix.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-New added pthread feature leads to some deadlock with some unlock code missing.
-This patch fix it.
-
-Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
-
-Upstream-Status: Pending
-
-Index: libical-0.47/src/libical/icaltimezone.c
-===================================================================
---- libical-0.47.orig/src/libical/icaltimezone.c	2011-12-16 13:42:25.000000000 +0800
-+++ libical-0.47/src/libical/icaltimezone.c	2011-12-16 14:16:25.000000000 +0800
-@@ -1773,7 +1773,7 @@
-     filename = (char*) malloc (filename_len);
-     if (!filename) {
- 	icalerror_set_errno(ICAL_NEWFAILED_ERROR);
--	return;
-+	goto out;
-     }
- 
-     snprintf (filename, filename_len, "%s/%s.ics", get_zone_directory(),
-@@ -1783,7 +1783,7 @@
-     free (filename);
-     if (!fp) {
- 	icalerror_set_errno(ICAL_FILE_ERROR);
--	return;
-+	goto out;
-     }
- 
- 	
-@@ -1807,7 +1807,7 @@
- 
-     if (!subcomp) {
- 	icalerror_set_errno(ICAL_PARSE_ERROR);
--	return;
-+	goto out;
-     }
- 
-     icaltimezone_get_vtimezone_properties (zone, subcomp);
-@@ -1817,10 +1817,12 @@
-     icalcomponent_free(comp);
-     }
- #endif 
--#ifdef HAVE_PTHREAD
-+
-  out:
-+#ifdef HAVE_PTHREAD
-     pthread_mutex_unlock(&builtin_mutex);
- #endif
-+    return;
- }
- 
- 
diff --git a/meta/recipes-support/libical/libical_0.48.bb b/meta/recipes-support/libical/libical_1.0.0.bb
similarity index 40%
rename from meta/recipes-support/libical/libical_0.48.bb
rename to meta/recipes-support/libical/libical_1.0.0.bb
index f464026..07b549e 100644
--- a/meta/recipes-support/libical/libical_0.48.bb
+++ b/meta/recipes-support/libical/libical_1.0.0.bb
@@ -1,16 +1,13 @@
 SUMMARY = "iCal and scheduling (RFC 2445, 2446, 2447) library"
-HOMEPAGE = "http://sourceforge.net/projects/freeassociation/"
-BUGTRACKER = "http://sourceforge.net/tracker/?group_id=16077&atid=116077"
+HOMEPAGE = "https://github.com/libical/libical"
+BUGTRACKER = "https://github.com/libical/libical/issues"
 LICENSE = "LGPLv2.1 | MPL-1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d4fc58309d8ed46587ac63bb449d82f8 \
                     file://LICENSE;md5=d1a0891cd3e582b3e2ec8fe63badbbb6"
 SECTION = "libs"
 
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/freeassociation/${BPN}/${P}/${BPN}-${PV}.tar.gz\
-           file://pthread-fix.patch"
-
-SRC_URI[md5sum] = "e549f434d5fbf9cd156c60ed4943618f"
-SRC_URI[sha256sum] = "2ae78b0757f0dd13431acf42a9a8d038339fd4767fd5134e650bf60ee0b4dff0"
+SRC_URI = "https://github.com/${PN}/${PN}/archive/v${PV}.tar.gz"
+SRC_URI[md5sum] = "f4b8e33ae5efb2f025eb43ce69682a36"
+SRC_URI[sha256sum] = "0072e83834092315772e6719b85fc8b11530b1ff53f4d108315fb38cddbce8c2"
 
 inherit autotools
-- 
1.9.1


