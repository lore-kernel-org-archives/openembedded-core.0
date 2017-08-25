Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E8A40783EA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 09:36:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7P9adAV008418
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 02:36:47 -0700 (PDT)
Received: from localhost (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Thu, 24 Aug 2017 19:56:09 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 25 Aug 2017 10:56:56 +0800
Message-ID: <1503629816-19824-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.198]
Subject: [PATCH] taglib: Security fix CVE-2017-12678
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
X-List-Received-Date: Fri, 25 Aug 2017 09:36:47 -0000
Content-Type: text/plain

CVE-2017-12678: In TagLib 1.11.1, the rebuildAggregateFrames function in
id3v2framefactory.cpp has a pointer to cast vulnerability, which allows
remote attackers to cause a denial of service or possibly have
unspecified other impact via a crafted audio file.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2017-12678

Patch from:
https://github.com/taglib/taglib/pull/831/commits/eb9ded1206f18f2c319157337edea2533a40bea6

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../taglib/taglib/CVE-2017-12678.patch             | 40 ++++++++++++++++++++++
 meta/recipes-support/taglib/taglib_1.11.1.bb       |  5 ++-
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/taglib/taglib/CVE-2017-12678.patch

diff --git a/meta/recipes-support/taglib/taglib/CVE-2017-12678.patch b/meta/recipes-support/taglib/taglib/CVE-2017-12678.patch
new file mode 100644
index 0000000..4bd9f2b
--- /dev/null
+++ b/meta/recipes-support/taglib/taglib/CVE-2017-12678.patch
@@ -0,0 +1,40 @@
+From eb9ded1206f18f2c319157337edea2533a40bea6 Mon Sep 17 00:00:00 2001
+From: "Stephen F. Booth" <me@sbooth.org>
+Date: Sun, 23 Jul 2017 10:11:09 -0400
+Subject: [PATCH] Don't assume TDRC is an instance of TextIdentificationFrame
+
+If TDRC is encrypted, FrameFactory::createFrame() returns UnknownFrame
+which causes problems in rebuildAggregateFrames() when it is assumed
+that TDRC is a TextIdentificationFrame
+
+Upstream-Status: Backport
+[https://github.com/taglib/taglib/pull/831/commits/eb9ded1206f18f2c319157337edea2533a40bea6]
+
+CVE: CVE-2017-12678
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ taglib/mpeg/id3v2/id3v2framefactory.cpp | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/taglib/mpeg/id3v2/id3v2framefactory.cpp b/taglib/mpeg/id3v2/id3v2framefactory.cpp
+index 759a9b7b..9347ab86 100644
+--- a/taglib/mpeg/id3v2/id3v2framefactory.cpp
++++ b/taglib/mpeg/id3v2/id3v2framefactory.cpp
+@@ -334,10 +334,11 @@ void FrameFactory::rebuildAggregateFrames(ID3v2::Tag *tag) const
+      tag->frameList("TDAT").size() == 1)
+   {
+     TextIdentificationFrame *tdrc =
+-      static_cast<TextIdentificationFrame *>(tag->frameList("TDRC").front());
++      dynamic_cast<TextIdentificationFrame *>(tag->frameList("TDRC").front());
+     UnknownFrame *tdat = static_cast<UnknownFrame *>(tag->frameList("TDAT").front());
+ 
+-    if(tdrc->fieldList().size() == 1 &&
++    if(tdrc &&
++       tdrc->fieldList().size() == 1 &&
+        tdrc->fieldList().front().size() == 4 &&
+        tdat->data().size() >= 5)
+     {
+-- 
+2.13.5
+
diff --git a/meta/recipes-support/taglib/taglib_1.11.1.bb b/meta/recipes-support/taglib/taglib_1.11.1.bb
index 54a92d9..50439bc 100644
--- a/meta/recipes-support/taglib/taglib_1.11.1.bb
+++ b/meta/recipes-support/taglib/taglib_1.11.1.bb
@@ -8,7 +8,10 @@ LIC_FILES_CHKSUM = "file://COPYING.LGPL;md5=4fbd65380cdd255951079008b364516c \
 
 DEPENDS = "zlib"
 
-SRC_URI = "http://taglib.github.io/releases/${BP}.tar.gz"
+SRC_URI = "http://taglib.github.io/releases/${BP}.tar.gz \
+           file://CVE-2017-12678.patch \
+          "
+
 SRC_URI[md5sum] = "cee7be0ccfc892fa433d6c837df9522a"
 SRC_URI[sha256sum] = "b6d1a5a610aae6ff39d93de5efd0fdc787aa9e9dc1e7026fa4c961b26563526b"
 
-- 
2.7.4


