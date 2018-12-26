Return-Path: <prvs=18989725c3=alejandro.delcastillo@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 329DC6C135
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Dec 2018 01:01:01 +0000 (UTC)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	wBQNqpTJ005508 for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Dec 2018 17:57:32 -0600
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mx0a-00010702.pphosted.com with ESMTP id 2phj62aq7r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Dec 2018 17:57:32 -0600
Received: from us-aus-exch1.ni.corp.natinst.com
	(us-aus-exch1.ni.corp.natinst.com [130.164.68.11])
	by us-aus-skprod3.natinst.com (8.16.0.27/8.16.0.27) with ESMTPS id
	wBQNvVmK004260
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Dec 2018 17:57:31 -0600
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exch1.ni.corp.natinst.com (130.164.68.11) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Wed, 26 Dec 2018 17:57:30 -0600
Received: from delcastillo3.amer.corp.natinst.com (130.164.49.7) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server
	id 15.0.1395.4 via Frontend Transport; Wed, 26 Dec 2018 17:57:31 -0600
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Dec 2018 17:59:04 -0600
Message-ID: <20181226235906.22007-2-alejandro.delcastillo@ni.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20181226235906.22007-1-alejandro.delcastillo@ni.com>
References: <20181226235906.22007-1-alejandro.delcastillo@ni.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-12-26_13:, , signatures=0
X-Proofpoint-Spam-Reason: safe
Subject: [PATCH 1/3] opkg: upgrade to version 0.4.0
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
X-List-Received-Date: Thu, 27 Dec 2018 01:01:01 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

- Drop 0001-remove_maintainer_scripts-use-strict-matching.patch

Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
---
 ...intainer_scripts-use-strict-matching.patch | 56 -------------------
 .../opkg/{opkg_0.3.6.bb => opkg_0.4.0.bb}     |  5 +-
 2 files changed, 2 insertions(+), 59 deletions(-)
 delete mode 100644 meta/recipes-devtools/opkg/opkg/0001-remove_maintainer_scripts-use-strict-matching.patch
 rename meta/recipes-devtools/opkg/{opkg_0.3.6.bb => opkg_0.4.0.bb} (90%)

diff --git a/meta/recipes-devtools/opkg/opkg/0001-remove_maintainer_scripts-use-strict-matching.patch b/meta/recipes-devtools/opkg/opkg/0001-remove_maintainer_scripts-use-strict-matching.patch
deleted file mode 100644
index ec160290be..0000000000
--- a/meta/recipes-devtools/opkg/opkg/0001-remove_maintainer_scripts-use-strict-matching.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 55c4ad666e76281bdd0db55fa6f4ab2744fea7e4 Mon Sep 17 00:00:00 2001
-From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
-Date: Tue, 4 Sep 2018 18:06:00 -0500
-Subject: [PATCH] remove_maintainer_scripts: use strict matching
-
-The function is using a glob to select which metadata files needs to be
-deleted during package removal, on the info_dir. However, the glob may
-match metadata files from packages with similar names. For example,
-during removal of package glibc-binary-localedata-de-at, the current
-logic was also removing the metadata for
-glibc-binary-localedata-de-at.iso-8859-1. Add check for an exact match
-before deletion.
-
-Fixes bugzilla: 12905
-
-Upstream-Status: Submitted [https://groups.google.com/forum/#!topic/opkg-devel/Fr40Yt0NBno]
-Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
----
- libopkg/opkg_remove.c | 14 +++++++++++---
- 1 file changed, 11 insertions(+), 3 deletions(-)
-
-diff --git a/libopkg/opkg_remove.c b/libopkg/opkg_remove.c
-index 82125fa..3936628 100644
---- a/libopkg/opkg_remove.c
-+++ b/libopkg/opkg_remove.c
-@@ -137,7 +137,7 @@ void remove_maintainer_scripts(pkg_t * pkg)
- {
-     unsigned int i;
-     int err;
--    char *globpattern;
-+    char *globpattern, *filename, *lastdot;
-     glob_t globbuf;
- 
-     if (opkg_config->noaction)
-@@ -151,8 +151,16 @@ void remove_maintainer_scripts(pkg_t * pkg)
-         return;
- 
-     for (i = 0; i < globbuf.gl_pathc; i++) {
--        opkg_msg(INFO, "Deleting %s.\n", globbuf.gl_pathv[i]);
--        unlink(globbuf.gl_pathv[i]);
-+        filename = xstrdup(basename(globbuf.gl_pathv[i]));
-+        lastdot = strrchr(filename, '.');
-+        *lastdot = '\0';
-+        // Only delete files that match the package name (the glob may match files
-+        // with similar names)
-+        if (!strcmp(filename, pkg->name)) {
-+            opkg_msg(INFO, "Deleting %s.\n", globbuf.gl_pathv[i]);
-+            unlink(globbuf.gl_pathv[i]);
-+        }
-+        free(filename);
-     }
-     globfree(&globbuf);
- }
--- 
-2.18.0
-
diff --git a/meta/recipes-devtools/opkg/opkg_0.3.6.bb b/meta/recipes-devtools/opkg/opkg_0.4.0.bb
similarity index 90%
rename from meta/recipes-devtools/opkg/opkg_0.3.6.bb
rename to meta/recipes-devtools/opkg/opkg_0.4.0.bb
index 6ebd58b967..9b7cf3f596 100644
--- a/meta/recipes-devtools/opkg/opkg_0.3.6.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.4.0.bb
@@ -14,11 +14,10 @@ PE = "1"
 SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz \
            file://opkg.conf \
            file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch \
-           file://0001-remove_maintainer_scripts-use-strict-matching.patch \
 "
 
-SRC_URI[md5sum] = "79e04307f6f54db431c251772d7d987c"
-SRC_URI[sha256sum] = "f607f0e61be8cf8a3bbd0d2dccd9ec9e9b6c21dd4307b671c600d6eeaf84d30b"
+SRC_URI[md5sum] = "ae51d95fee599bb4dce08453529158f5"
+SRC_URI[sha256sum] = "f6c00515d8a2ad8f6742a8e73830315d1983ed0459cba77c4d656cfc9e7fe6fe"
 
 inherit autotools pkgconfig systemd
 
-- 
2.20.1


