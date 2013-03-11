Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1UF3TJ-0005I9-RY
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 15:13:03 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 11 Mar 2013 06:56:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,822,1355126400"; d="scan'208";a="212736121"
Received: from sentry (HELO localhost.localdomain) ([10.237.105.54])
	by AZSMGA002.ch.intel.com with ESMTP; 11 Mar 2013 06:56:21 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Mar 2013 15:56:48 +0200
Message-Id: <1363010209-18220-2-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1363010209-18220-1-git-send-email-cristian.iorga@intel.com>
References: <1363010209-18220-1-git-send-email-cristian.iorga@intel.com>
Subject: [PATCH 1/2] libical: add recipe back in oe-core
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
X-List-Received-Date: Mon, 11 Mar 2013 14:13:09 -0000
X-List-Received-Date: Mon, 11 Mar 2013 14:13:09 -0000
X-List-Received-Date: Mon, 11 Mar 2013 14:13:09 -0000

version: 0.48.
reason: libical is needed by bluez.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../libical/files/pthread-fix.patch                |   52 ++++++++++++++++++++
 meta/recipes-support/libical/libical_0.48.bb       |   17 +++++++
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-support/libical/files/pthread-fix.patch
 create mode 100644 meta/recipes-support/libical/libical_0.48.bb

diff --git a/meta/recipes-support/libical/files/pthread-fix.patch b/meta/recipes-support/libical/files/pthread-fix.patch
new file mode 100644
index 0000000..877b808
--- /dev/null
+++ b/meta/recipes-support/libical/files/pthread-fix.patch
@@ -0,0 +1,52 @@
+New added pthread feature leads to some deadlock with some unlock code missing.
+This patch fix it.
+
+Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
+
+Upstream-Status: Pending
+
+Index: libical-0.47/src/libical/icaltimezone.c
+===================================================================
+--- libical-0.47.orig/src/libical/icaltimezone.c	2011-12-16 13:42:25.000000000 +0800
++++ libical-0.47/src/libical/icaltimezone.c	2011-12-16 14:16:25.000000000 +0800
+@@ -1773,7 +1773,7 @@
+     filename = (char*) malloc (filename_len);
+     if (!filename) {
+ 	icalerror_set_errno(ICAL_NEWFAILED_ERROR);
+-	return;
++	goto out;
+     }
+ 
+     snprintf (filename, filename_len, "%s/%s.ics", get_zone_directory(),
+@@ -1783,7 +1783,7 @@
+     free (filename);
+     if (!fp) {
+ 	icalerror_set_errno(ICAL_FILE_ERROR);
+-	return;
++	goto out;
+     }
+ 
+ 	
+@@ -1807,7 +1807,7 @@
+ 
+     if (!subcomp) {
+ 	icalerror_set_errno(ICAL_PARSE_ERROR);
+-	return;
++	goto out;
+     }
+ 
+     icaltimezone_get_vtimezone_properties (zone, subcomp);
+@@ -1817,10 +1817,12 @@
+     icalcomponent_free(comp);
+     }
+ #endif 
+-#ifdef HAVE_PTHREAD
++
+  out:
++#ifdef HAVE_PTHREAD
+     pthread_mutex_unlock(&builtin_mutex);
+ #endif
++    return;
+ }
+ 
+ 
diff --git a/meta/recipes-support/libical/libical_0.48.bb b/meta/recipes-support/libical/libical_0.48.bb
new file mode 100644
index 0000000..80f629c
--- /dev/null
+++ b/meta/recipes-support/libical/libical_0.48.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "iCal and scheduling (RFC 2445, 2446, 2447) library"
+HOMEPAGE = "http://sourceforge.net/projects/freeassociation/"
+BUGTRACKER = "http://sourceforge.net/tracker/?group_id=16077&atid=116077"
+LICENSE = "LGPLv2.1 | MPL-1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d4fc58309d8ed46587ac63bb449d82f8 \
+                    file://LICENSE;md5=d1a0891cd3e582b3e2ec8fe63badbbb6"
+SECTION = "libs"
+
+PR = "r0"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/freeassociation/${BPN}/${P}/${BPN}-${PV}.tar.gz\
+           file://pthread-fix.patch"
+
+SRC_URI[md5sum] = "e549f434d5fbf9cd156c60ed4943618f"
+SRC_URI[sha256sum] = "2ae78b0757f0dd13431acf42a9a8d038339fd4767fd5134e650bf60ee0b4dff0"
+
+inherit autotools
-- 
1.7.10.4



