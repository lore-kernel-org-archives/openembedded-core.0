Return-Path: <prvs=878637506f=alejandro.delcastillo@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 5E39E745AB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 17:07:00 +0000 (UTC)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w85H1VPL031404; Wed, 5 Sep 2018 12:07:00 -0500
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mx0a-00010702.pphosted.com with ESMTP id 2ma40jahpb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Wed, 05 Sep 2018 12:07:00 -0500
Received: from us-aus-exhub2.ni.corp.natinst.com
	(us-aus-exhub2.ni.corp.natinst.com [130.164.68.32])
	by us-aus-skprod2.natinst.com (8.16.0.22/8.16.0.22) with ESMTPS id
	w85H6xsS032246
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Wed, 5 Sep 2018 12:06:59 -0500
Received: from us-aus-exch4.ni.corp.natinst.com (130.164.68.14) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Wed, 5 Sep 2018 12:06:59 -0500
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exch4.ni.corp.natinst.com (130.164.68.14) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Wed, 5 Sep 2018 12:06:59 -0500
Received: from delcastillo3.amer.corp.natinst.com (130.164.49.7) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server
	id 15.0.1395.4 via Frontend Transport; Wed, 5 Sep 2018 12:06:59 -0500
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
To: <openembedded-core@lists.openembedded.org>, <raj.khem@gmail.com>,
	<christophevr@telnet.be>
Date: Wed, 5 Sep 2018 12:08:25 -0500
Message-ID: <20180905170825.5617-1-alejandro.delcastillo@ni.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-09-05_10:, , signatures=0
X-Proofpoint-Spam-Reason: safe
Subject: [PATCH] opkg: add strict package matching on removal patch
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
X-List-Received-Date: Wed, 05 Sep 2018 17:07:00 -0000
Content-Type: text/plain

During removal, opkg is using globs to select which metadata files to
remove. The glob is too broad and sometimes can result in a package
removing the metadata from a package with a close name. Make the
matching more strict.

Fixes bugzilla 12905

Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
---
 ...intainer_scripts-use-strict-matching.patch | 55 +++++++++++++++++++
 meta/recipes-devtools/opkg/opkg_0.3.6.bb      |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-devtools/opkg/opkg/0001-remove_maintainer_scripts-use-strict-matching.patch

diff --git a/meta/recipes-devtools/opkg/opkg/0001-remove_maintainer_scripts-use-strict-matching.patch b/meta/recipes-devtools/opkg/opkg/0001-remove_maintainer_scripts-use-strict-matching.patch
new file mode 100644
index 0000000000..193c2b326c
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/0001-remove_maintainer_scripts-use-strict-matching.patch
@@ -0,0 +1,55 @@
+From 55c4ad666e76281bdd0db55fa6f4ab2744fea7e4 Mon Sep 17 00:00:00 2001
+From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
+Date: Tue, 4 Sep 2018 18:06:00 -0500
+Subject: [PATCH] remove_maintainer_scripts: use strict matching
+
+The function is using a glob to select which metadata files needs to be
+deleted during package removal, on the info_dir. However, the glob may
+match metadata files from packages with similar names. For example,
+during removal of package glibc-binary-localedata-de-at, the current
+logic was also removing the metadata for
+glibc-binary-localedata-de-at.iso-8859-1. Add check for an exact match
+before deletion.
+
+Fixes bugzilla: 12905
+
+Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
+---
+ libopkg/opkg_remove.c | 14 +++++++++++---
+ 1 file changed, 11 insertions(+), 3 deletions(-)
+
+diff --git a/libopkg/opkg_remove.c b/libopkg/opkg_remove.c
+index 82125fa..3936628 100644
+--- a/libopkg/opkg_remove.c
++++ b/libopkg/opkg_remove.c
+@@ -137,7 +137,7 @@ void remove_maintainer_scripts(pkg_t * pkg)
+ {
+     unsigned int i;
+     int err;
+-    char *globpattern;
++    char *globpattern, *filename, *lastdot;
+     glob_t globbuf;
+ 
+     if (opkg_config->noaction)
+@@ -151,8 +151,16 @@ void remove_maintainer_scripts(pkg_t * pkg)
+         return;
+ 
+     for (i = 0; i < globbuf.gl_pathc; i++) {
+-        opkg_msg(INFO, "Deleting %s.\n", globbuf.gl_pathv[i]);
+-        unlink(globbuf.gl_pathv[i]);
++        filename = xstrdup(basename(globbuf.gl_pathv[i]));
++        lastdot = strrchr(filename, '.');
++        *lastdot = '\0';
++        // Only delete files that match the package name (the glob may match files
++        // with similar names)
++        if (!strcmp(filename, pkg->name)) {
++            opkg_msg(INFO, "Deleting %s.\n", globbuf.gl_pathv[i]);
++            unlink(globbuf.gl_pathv[i]);
++        }
++        free(filename);
+     }
+     globfree(&globbuf);
+ }
+-- 
+2.18.0
+
diff --git a/meta/recipes-devtools/opkg/opkg_0.3.6.bb b/meta/recipes-devtools/opkg/opkg_0.3.6.bb
index 579b51166c..6ebd58b967 100644
--- a/meta/recipes-devtools/opkg/opkg_0.3.6.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.3.6.bb
@@ -14,6 +14,7 @@ PE = "1"
 SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz \
            file://opkg.conf \
            file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch \
+           file://0001-remove_maintainer_scripts-use-strict-matching.patch \
 "
 
 SRC_URI[md5sum] = "79e04307f6f54db431c251772d7d987c"
-- 
2.18.0


