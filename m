Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B56DE748D2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 02:11:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7R2B5xH029339
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Aug 2018 19:11:05 -0700
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Sun, 26 Aug 2018 19:11:04 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Aug 2018 10:11:02 +0800
Message-ID: <1535335862-21797-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [PATCH] taglib: Security fix CVE-2018-11439
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
X-List-Received-Date: Mon, 27 Aug 2018 02:11:04 -0000
Content-Type: text/plain

CVE-2018-11439: The TagLib::Ogg::FLAC::File::scan function in
oggflacfile.cpp in TagLib 1.11.1 allows remote attackers to cause
information disclosure (heap-based buffer over-read) via a crafted audio
file.

References:
https://nvd.nist.gov/vuln/detail/CVE-2018-11439

Patch from:
https://github.com/taglib/taglib/pull/869/commits/272648ccfcccae30e002ccf34a22e075dd477278

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../taglib/taglib/CVE-2018-11439.patch             | 51 ++++++++++++++++++++++
 meta/recipes-support/taglib/taglib_1.11.1.bb       |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-support/taglib/taglib/CVE-2018-11439.patch

diff --git a/meta/recipes-support/taglib/taglib/CVE-2018-11439.patch b/meta/recipes-support/taglib/taglib/CVE-2018-11439.patch
new file mode 100644
index 0000000..74aa5c8
--- /dev/null
+++ b/meta/recipes-support/taglib/taglib/CVE-2018-11439.patch
@@ -0,0 +1,51 @@
+From 272648ccfcccae30e002ccf34a22e075dd477278 Mon Sep 17 00:00:00 2001
+From: Scott Gayou <github.scott@gmail.com>
+Date: Mon, 4 Jun 2018 11:34:36 -0400
+Subject: [PATCH] Fixed OOB read when loading invalid ogg flac file. (#868)
+
+CVE-2018-11439 is caused by a failure to check the minimum length
+of a ogg flac header. This header is detailed in full at:
+https://xiph.org/flac/ogg_mapping.html. Added more strict checking
+for entire header.
+
+Upstream-Status: Backport
+[https://github.com/taglib/taglib/pull/869/commits/272648ccfcccae30e002ccf34a22e075dd477278]
+
+CVE: CVE-2018-11439
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ taglib/ogg/flac/oggflacfile.cpp | 14 ++++++++++++--
+ 1 file changed, 12 insertions(+), 2 deletions(-)
+
+diff --git a/taglib/ogg/flac/oggflacfile.cpp b/taglib/ogg/flac/oggflacfile.cpp
+index 53d0450..07ea9dc 100644
+--- a/taglib/ogg/flac/oggflacfile.cpp
++++ b/taglib/ogg/flac/oggflacfile.cpp
+@@ -231,11 +231,21 @@ void Ogg::FLAC::File::scan()
+ 
+   if(!metadataHeader.startsWith("fLaC"))  {
+     // FLAC 1.1.2+
++    // See https://xiph.org/flac/ogg_mapping.html for the header specification.
++    if(metadataHeader.size() < 13)
++      return;
++
++    if(metadataHeader[0] != 0x7f)
++      return;
++
+     if(metadataHeader.mid(1, 4) != "FLAC")
+       return;
+ 
+-    if(metadataHeader[5] != 1)
+-      return; // not version 1
++    if(metadataHeader[5] != 1 && metadataHeader[6] != 0)
++      return; // not version 1.0
++
++    if(metadataHeader.mid(9, 4) != "fLaC")
++      return;
+ 
+     metadataHeader = metadataHeader.mid(13);
+   }
+-- 
+2.7.4
+
diff --git a/meta/recipes-support/taglib/taglib_1.11.1.bb b/meta/recipes-support/taglib/taglib_1.11.1.bb
index 50439bc..01dcf66 100644
--- a/meta/recipes-support/taglib/taglib_1.11.1.bb
+++ b/meta/recipes-support/taglib/taglib_1.11.1.bb
@@ -10,6 +10,7 @@ DEPENDS = "zlib"
 
 SRC_URI = "http://taglib.github.io/releases/${BP}.tar.gz \
            file://CVE-2017-12678.patch \
+           file://CVE-2018-11439.patch \
           "
 
 SRC_URI[md5sum] = "cee7be0ccfc892fa433d6c837df9522a"
-- 
2.7.4


