Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1RbSr9-0004o5-4E
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Dec 2011 09:09:27 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 16 Dec 2011 00:01:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="87202618"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by orsmga001.jf.intel.com with ESMTP; 16 Dec 2011 00:01:22 -0800
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Dec 2011 15:53:23 +0800
Message-Id: <0e7c308bae7c77313df31f91043c0cefcc6524d3.1324021777.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1324021777.git.edwin.zhai@intel.com>
References: <cover.1324021777.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1324021777.git.edwin.zhai@intel.com>
References: <cover.1324021777.git.edwin.zhai@intel.com>
Subject: [PATCH 2/2] libical: Fix deadlock in pthread
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
X-List-Received-Date: Fri, 16 Dec 2011 08:09:27 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

libical introduce pthread support after 0.47, but lead deadlock with missing
some unlock code. This makes dates start hang.

Add new patch to properly release mutex.

[YOCTO #1825] got fixed.

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 meta/recipes-sato/libical/files/pthread-fix.patch |   52 +++++++++++++++++++++
 meta/recipes-sato/libical/libical_0.47.bb         |    5 ++-
 2 files changed, 56 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-sato/libical/files/pthread-fix.patch

diff --git a/meta/recipes-sato/libical/files/pthread-fix.patch b/meta/recipes-sato/libical/files/pthread-fix.patch
new file mode 100644
index 0000000..aa7767f
--- /dev/null
+++ b/meta/recipes-sato/libical/files/pthread-fix.patch
@@ -0,0 +1,52 @@
+New added pthread feathre leads some deadlock with some unlock code missing.
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
diff --git a/meta/recipes-sato/libical/libical_0.47.bb b/meta/recipes-sato/libical/libical_0.47.bb
index d711d5f..ee4351a 100644
--- a/meta/recipes-sato/libical/libical_0.47.bb
+++ b/meta/recipes-sato/libical/libical_0.47.bb
@@ -6,7 +6,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d4fc58309d8ed46587ac63bb449d82f8 \
                     file://LICENSE;md5=d1a0891cd3e582b3e2ec8fe63badbbb6"
 SECTION = "libs"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/freeassociation/${BPN}/${P}/${BPN}-${PV}.tar.gz"
+PR = "r1"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/freeassociation/${BPN}/${P}/${BPN}-${PV}.tar.gz\
+           file://pthread-fix.patch"
 
 SRC_URI[md5sum] = "21f7f8a21e3d857c9476be732e52dc32"
 SRC_URI[sha256sum] = "af4cbb4bb13d9ed3f2262181da9199823feba70802b15cc3e89b263d95da2888"
-- 
1.7.1



