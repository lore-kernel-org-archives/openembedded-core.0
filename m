Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CC4836FF78
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Dec 2015 09:44:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tB19iqEj025891
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 Dec 2015 01:44:52 -0800
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 1 Dec 2015 01:44:52 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 1 Dec 2015 01:44:47 -0800
Message-ID: <03e530c234d5e555bc5da643d39d571766f3feda.1448962573.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1448962573.git.liezhi.yang@windriver.com>
References: <cover.1448962573.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 8/8] libsndfile: fix CVE-2014-9756
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
X-List-Received-Date: Tue, 01 Dec 2015 09:44:52 -0000
Content-Type: text/plain

From: "Maxin B. John" <maxin.john@intel.com>

Fix divide by zero bug (CVE-2014-9756)

(From OE-Core master rev: f47cf07ab9d00ed7eddc8e867138481f7bd2bb7d)

Signed-off-by: Maxin B. John <maxin.john@intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../files/libsndfile-fix-CVE-2014-9756.patch       |   24 ++++++++++++++++++++
 .../libsndfile/libsndfile1_1.0.25.bb               |    1 +
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
1.7.9.5


