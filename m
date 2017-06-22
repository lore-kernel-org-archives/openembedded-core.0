Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwkm01.jp.fujitsu.com (mgwkm01.jp.fujitsu.com [202.219.69.168])
	by mail.openembedded.org (Postfix) with ESMTP id B552E6FF7F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 01:42:41 +0000 (UTC)
Received: from kw-mxoi2.gw.nic.fujitsu.com (unknown [192.168.231.133]) by
	mgwkm01.jp.fujitsu.com with smtp
	id 1e67_d8d2_7489d0b1_c1c4_4c2b_9c51_3dcc3ebbf8fb;
	Thu, 22 Jun 2017 10:42:38 +0900
Received: from g01jpfmpwkw03.exch.g01.fujitsu.local
	(g01jpfmpwkw03.exch.g01.fujitsu.local [10.0.193.57])
	by kw-mxoi2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9F24CAC0131
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 10:42:37 +0900 (JST)
Received: from g01jpexchkw33.g01.fujitsu.local (unknown [10.0.193.4])
	by g01jpfmpwkw03.exch.g01.fujitsu.local (Postfix) with ESMTP id
	93ED8BD6785 for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 10:42:36 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	g01jpexchkw33.g01.fujitsu.local (10.0.193.36) with Microsoft SMTP
	Server id 14.3.266.1; Thu, 22 Jun 2017 10:42:35 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Jun 2017 10:44:02 +0900
Message-ID: <1498095842-6455-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-Encrypted: FENCE-Mail/3.1.1
X-TM-AS-MML: disable
Subject: [PATCH] libsndfile1: Fix CVE-2017-6892
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
X-List-Received-Date: Thu, 22 Jun 2017 01:42:43 -0000
Content-Type: text/plain

Backport upstream patch to fix CVE-2017-6892.

CVE: CVE-2017-6892

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 .../libsndfile/libsndfile1/CVE-2017-6892.patch     | 34 ++++++++++++++++++++++
 .../libsndfile/libsndfile1_1.0.28.bb               |  4 ++-
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-6892.patch

diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-6892.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-6892.patch
new file mode 100644
index 0000000..89552ac
--- /dev/null
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-6892.patch
@@ -0,0 +1,34 @@
+From f833c53cb596e9e1792949f762e0b33661822748 Mon Sep 17 00:00:00 2001
+From: Erik de Castro Lopo <erikd@mega-nerd.com>
+Date: Tue, 23 May 2017 20:15:24 +1000
+Subject: [PATCH] src/aiff.c: Fix a buffer read overflow
+
+Secunia Advisory SA76717.
+
+Found by: Laurent Delosieres, Secunia Research at Flexera Software
+
+CVE: CVE-2017-6892
+Upstream-Status: Backport
+
+Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
+
+---
+ src/aiff.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/aiff.c b/src/aiff.c
+index 5b5f9f5..45864b7 100644
+--- a/src/aiff.c
++++ b/src/aiff.c
+@@ -1759,7 +1759,7 @@ aiff_read_chanmap (SF_PRIVATE * psf, unsigned dword)
+ 		psf_binheader_readf (psf, "j", dword - bytesread) ;
+ 
+ 	if (map_info->channel_map != NULL)
+-	{	size_t chanmap_size = psf->sf.channels * sizeof (psf->channel_map [0]) ;
++	{	size_t chanmap_size = SF_MIN (psf->sf.channels, layout_tag & 0xffff) * sizeof (psf->channel_map [0]) ;
+ 
+ 		free (psf->channel_map) ;
+ 
+-- 
+1.9.1
+
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
index 248b292..6f242cfa 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
@@ -5,7 +5,9 @@ DEPENDS = "flac libogg libvorbis sqlite3"
 SECTION = "libs/multimedia"
 LICENSE = "LGPLv2.1"
 
-SRC_URI = "http://www.mega-nerd.com/libsndfile/files/libsndfile-${PV}.tar.gz"
+SRC_URI = "http://www.mega-nerd.com/libsndfile/files/libsndfile-${PV}.tar.gz \
+           file://CVE-2017-6892.patch \
+          "
 
 SRC_URI[md5sum] = "646b5f98ce89ac60cdb060fcd398247c"
 SRC_URI[sha256sum] = "1ff33929f042fa333aed1e8923aa628c3ee9e1eb85512686c55092d1e5a9dfa9"
-- 
2.7.4


