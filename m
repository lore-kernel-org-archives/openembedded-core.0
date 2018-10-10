Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3644978F5C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2018 01:16:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9A1G5uA011116
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Oct 2018 18:16:15 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Tue, 9 Oct 2018 18:15:54 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 10 Oct 2018 09:15:53 +0800
Message-ID: <1539134153-197518-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] libsndfile1: CVE-2018-13139
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
X-List-Received-Date: Wed, 10 Oct 2018 01:16:25 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

A stack-based buffer overflow in psf_memset in common.c in libsndfile 1.0.28.

Fixed in https://github.com/erikd/libsndfile/issues/397

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../libsndfile/libsndfile1/CVE-2018-13139.patch    | 35 ++++++++++++++++++++++
 .../libsndfile/libsndfile1_1.0.28.bb               |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2018-13139.patch

diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2018-13139.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2018-13139.patch
new file mode 100644
index 0000000..4ae3674
--- /dev/null
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2018-13139.patch
@@ -0,0 +1,35 @@
+From 5473aeef7875e54bd0f786fbdd259a35aaee875c Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Wed, 10 Oct 2018 08:59:30 +0800
+Subject: [PATCH] libsndfile1: patch for CVE-2018-13139
+
+Upstream-Status: Backport [https://github.com/bwarden/libsndfile/
+commit/df18323c622b54221ee7ace74b177cdcccc152d7]
+
+CVE: CVE-2018-13139
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ programs/sndfile-deinterleave.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/programs/sndfile-deinterleave.c b/programs/sndfile-deinterleave.c
+index e27593e..721bee7 100644
+--- a/programs/sndfile-deinterleave.c
++++ b/programs/sndfile-deinterleave.c
+@@ -89,6 +89,12 @@ main (int argc, char **argv)
+ 		exit (1) ;
+ 		} ;
+ 
++	if (sfinfo.channels > MAX_CHANNELS)
++	{	printf ("\nError : Input file '%s' has too many (%d) channels. Limit is %d.\n",
++			argv [1], sfinfo.channels, MAX_CHANNELS) ;
++		exit (1) ;
++		} ;
++
+ 	state.channels = sfinfo.channels ;
+ 	sfinfo.channels = 1 ;
+ 
+-- 
+2.7.4
+
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
index ed43b74..b28f675 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://www.mega-nerd.com/libsndfile/files/libsndfile-${PV}.tar.gz \
            file://CVE-2017-8363.patch \
            file://CVE-2017-14245-14246.patch \
            file://CVE-2017-14634.patch \
+           file://CVE-2018-13139.patch \
           "
 
 SRC_URI[md5sum] = "646b5f98ce89ac60cdb060fcd398247c"
-- 
2.7.4


