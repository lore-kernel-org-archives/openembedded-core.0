Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C118878444
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 06:45:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7H6jCEW006690
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 23:45:12 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Wed, 16 Aug 2017 23:45:10 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Aug 2017 14:44:29 +0800
Message-ID: <426809fa85f3bbf114d76916d3a92ce78239f872.1502952233.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1502952233.git.jackie.huang@windriver.com>
References: <cover.1502952233.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] libsndfile1: Fix CVE-2017-8363
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
X-List-Received-Date: Thu, 17 Aug 2017 06:45:10 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Backport the patch to fix CVE-2017-8363:

The flac_buffer_copy function in flac.c in libsndfile 1.0.28 allows
remote attackers to cause a denial of service (heap-based buffer
over-read and application crash) via a crafted audio file.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2017-8363

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../libsndfile/libsndfile1/CVE-2017-8363.patch     | 37 ++++++++++++++++++++++
 .../libsndfile/libsndfile1_1.0.28.bb               |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-8363.patch

diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-8363.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-8363.patch
new file mode 100644
index 0000000000..e526e5a346
--- /dev/null
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-8363.patch
@@ -0,0 +1,37 @@
+From cd7da8dbf6ee4310d21d9e44b385d6797160d9e8 Mon Sep 17 00:00:00 2001
+From: Erik de Castro Lopo <erikd@mega-nerd.com>
+Date: Wed, 12 Apr 2017 20:19:34 +1000
+Subject: [PATCH] src/flac.c: Fix another memory leak
+
+When the FLAC decoder was passed a malformed file, the associated
+`FLAC__StreamDecoder` object was not getting released.
+
+Closes: https://github.com/erikd/libsndfile/issues/233
+
+CVE: CVE-2017-8363
+
+Upstream-Status: Backport [https://github.com/erikd/libsndfile/commit/cd7da8dbf6ee4310d21d9e44b385d6797160d9e8]
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ src/flac.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/flac.c b/src/flac.c
+index 986a7b8..5a4f8c2 100644
+--- a/src/flac.c
++++ b/src/flac.c
+@@ -841,7 +841,9 @@ flac_read_header (SF_PRIVATE *psf)
+ 
+ 	psf_log_printf (psf, "End\n") ;
+ 
+-	if (psf->error == 0)
++	if (psf->error != 0)
++		FLAC__stream_decoder_delete (pflac->fsd) ;
++	else
+ 	{	FLAC__uint64 position ;
+ 
+ 		FLAC__stream_decoder_get_decode_position (pflac->fsd, &position) ;
+-- 
+2.7.4
+
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
index 2bd51b1cd9..281ac82e39 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
@@ -9,6 +9,7 @@ SRC_URI = "http://www.mega-nerd.com/libsndfile/files/libsndfile-${PV}.tar.gz \
            file://CVE-2017-6892.patch \
            file://CVE-2017-8361-8365.patch \
            file://CVE-2017-8362.patch \
+           file://CVE-2017-8363.patch \
           "
 
 SRC_URI[md5sum] = "646b5f98ce89ac60cdb060fcd398247c"
-- 
2.11.0


