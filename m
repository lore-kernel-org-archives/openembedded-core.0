Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1774460616
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Dec 2015 02:59:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tBO2xLbV005089
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Dec 2015 18:59:22 -0800
Received: from pek-zchi-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Wed, 23 Dec 2015 18:59:16 -0800
From: Zhixiong Chi <Zhixiong.Chi@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 24 Dec 2015 10:59:28 +0800
Message-ID: <1450925968-6421-1-git-send-email-Zhixiong.Chi@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] expat: Security Advisory-expat-CVE-2015-1283
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
X-List-Received-Date: Thu, 24 Dec 2015 02:59:22 -0000
Content-Type: text/plain

Add CVE-2015-1283 patch for fixing integer overflow bug in expat.

Details are at below link:
http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2015-1283

Patch comes from:
https://hg.mozilla.org/releases/mozilla-esr31/rev/2f3e78643f5c
https://codereview.chromium.org/1224303003

Signed-off-by: Zhixiong Chi <Zhixiong.Chi@windriver.com>
---
 .../expat/expat-2.1.0/expat-CVE-2015-1283.patch    | 58 ++++++++++++++++++++++
 meta/recipes-core/expat/expat.inc                  |  4 +-
 2 files changed, 61 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/expat/expat-2.1.0/expat-CVE-2015-1283.patch

diff --git a/meta/recipes-core/expat/expat-2.1.0/expat-CVE-2015-1283.patch b/meta/recipes-core/expat/expat-2.1.0/expat-CVE-2015-1283.patch
new file mode 100644
index 0000000..385afd6
--- /dev/null
+++ b/meta/recipes-core/expat/expat-2.1.0/expat-CVE-2015-1283.patch
@@ -0,0 +1,58 @@
+Multiple integer overflows in the XML_GetBuffer function in Expat 
+through 2.1.0, allow remote attackers to cause a denial of service 
+(heap-based buffer overflow) or possibly have unspecified other 
+impact via crafted XML data.
+
+CVSSv2:  (AV:N/AC:M/Au:N/C:P/I:P/A:P)
+
+Upstream-Status: Backport
+
+Index: expat-2.1.0/lib/xmlparse.c
+===================================================================
+--- expat-2.1.0.orig/lib/xmlparse.c	2012-03-11 13:13:12.000000000 +0800
++++ expat-2.1.0/lib/xmlparse.c	2015-12-23 10:29:07.347361329 +0800
+@@ -1678,6 +1678,12 @@
+ void * XMLCALL
+ XML_GetBuffer(XML_Parser parser, int len)
+ {
++/* BEGIN MOZILLA CHANGE (sanity check len) */
++  if (len < 0) {
++    errorCode = XML_ERROR_NO_MEMORY;
++    return NULL;
++  }
++/* END MOZILLA CHANGE */
+   switch (ps_parsing) {
+   case XML_SUSPENDED:
+     errorCode = XML_ERROR_SUSPENDED;
+@@ -1689,8 +1695,13 @@
+   }
+ 
+   if (len > bufferLim - bufferEnd) {
+-    /* FIXME avoid integer overflow */
+     int neededSize = len + (int)(bufferEnd - bufferPtr);
++/* BEGIN MOZILLA CHANGE (sanity check neededSize) */
++    if (neededSize < 0) {
++      errorCode = XML_ERROR_NO_MEMORY;
++      return NULL;
++    }
++/* END MOZILLA CHANGE */
+ #ifdef XML_CONTEXT_BYTES
+     int keep = (int)(bufferPtr - buffer);
+ 
+@@ -1719,7 +1730,15 @@
+         bufferSize = INIT_BUFFER_SIZE;
+       do {
+         bufferSize *= 2;
+-      } while (bufferSize < neededSize);
++/* BEGIN MOZILLA CHANGE (prevent infinite loop on overflow) */
++      } while (bufferSize < neededSize && bufferSize > 0);
++/* END MOZILLA CHANGE */
++/* BEGIN MOZILLA CHANGE (sanity check bufferSize) */
++      if (bufferSize <= 0) {
++        errorCode = XML_ERROR_NO_MEMORY;
++        return NULL;
++      }
++/* END MOZILLA CHANGE */
+       newBuf = (char *)MALLOC(bufferSize);
+       if (newBuf == 0) {
+         errorCode = XML_ERROR_NO_MEMORY;
diff --git a/meta/recipes-core/expat/expat.inc b/meta/recipes-core/expat/expat.inc
index 6dfafe9..4bd60a2 100644
--- a/meta/recipes-core/expat/expat.inc
+++ b/meta/recipes-core/expat/expat.inc
@@ -5,7 +5,9 @@ SECTION = "libs"
 LICENSE = "MIT"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/expat/expat-${PV}.tar.gz \
-           file://autotools.patch"
+           file://autotools.patch \
+           file://expat-CVE-2015-1283.patch \
+	  "
 
 inherit autotools lib_package gzipnative
 
-- 
1.9.1


