Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 67E3D75A31
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Nov 2015 15:56:59 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 05 Nov 2015 07:56:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,248,1444719600"; d="scan'208";a="594600001"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 05 Nov 2015 07:56:59 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id ADB816A4005
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Nov 2015 07:55:55 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Nov 2015 17:56:09 +0200
Message-Id: <1446738969-28665-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 5/5] libsndfile: fix CVE-2014-9756
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
X-List-Received-Date: Thu, 05 Nov 2015 15:57:01 -0000

Fix divide by zero bug (CVE-2014-9756)

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../files/libsndfile-fix-CVE-2014-9756.patch       | 24 ++++++++++++++++++++++
 .../libsndfile/libsndfile1_1.0.25.bb               |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta/recipes-multimedia/libsndfile/files/libsndfile-fix-CVE-2014-9756.patch

diff --git a/meta/recipes-multimedia/libsndfile/files/libsndfile-fix-CVE-2014-9756.patch b/meta/recipes-multimedia/libsndfile/files/libsndfile-fix-CVE-2014-9756.patch
new file mode 100644
index 0000000..b54b3ba
--- /dev/null
+++ b/meta/recipes-multimedia/libsndfile/files/libsndfile-fix-CVE-2014-9756.patch
@@ -0,0 +1,24 @@
+src/file_io.c : Prevent potential divide-by-zero.
+
+Closes: https://github.com/erikd/libsndfile/issues/92
+
+Upstream-Status: Backport
+
+Fixes CVE-2014-9756
+
+Signed-off-by: Erik de Castro Lopo <erikd@mega-nerd.com>
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
+---
+diff -Naur libsndfile-1.0.25-orig/src/file_io.c libsndfile-1.0.25/src/file_io.c
+--- libsndfile-1.0.25-orig/src/file_io.c	2011-01-19 12:12:28.000000000 +0200
++++ libsndfile-1.0.25/src/file_io.c	2015-11-04 15:02:04.337395618 +0200
+@@ -358,6 +358,9 @@
+ {	sf_count_t total = 0 ;
+ 	ssize_t	count ;
+ 
++    if (bytes == 0 || items == 0)
++        return 0 ;
++
+ 	if (psf->virtual_io)
+ 		return psf->vio.write (ptr, bytes*items, psf->vio_user_data) / bytes ;
+ 
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.25.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.25.bb
index 3e02f4e..be875c2 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.25.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.25.bb
@@ -9,6 +9,7 @@ PR = "r2"
 SRC_URI = "http://www.mega-nerd.com/libsndfile/files/libsndfile-${PV}.tar.gz \
            file://0001-src-sd2.c-Fix-segfault-in-SD2-RSRC-parser.patch \
            file://0001-src-sd2.c-Fix-two-potential-buffer-read-overflows.patch \
+           file://libsndfile-fix-CVE-2014-9756.patch \
 "
 
 SRC_URI[md5sum] = "e2b7bb637e01022c7d20f95f9c3990a2"
-- 
2.4.0


