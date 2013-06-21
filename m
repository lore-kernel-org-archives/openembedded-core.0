Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5DFC4608BE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2013 02:28:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5L2SpKJ019451
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 19:28:51 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Thu, 20 Jun 2013 19:28:51 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 21 Jun 2013 10:28:46 +0800
Message-ID: <178fedbf79c6a303d0db3ef7af6b1b81b6b3342a.1371781463.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1371781463.git.jackie.huang@windriver.com>
References: <cover.1371781463.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2 v2] libxml2 CVE-2012-2807
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
X-List-Received-Date: Fri, 21 Jun 2013 02:28:50 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Multiple integer overflows in libxml2, as used in Google Chrome
before 20.0.1132.43, on 64-bit Linux platforms allow remote attackers to
cause a denial of service or possibly have unspecified other impact via unknown vectors.
http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-2807

Signed-off-by: Li Wang <li.wang@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../libxml/libxml2/libxml2-fix-CVE-2012-2807.patch |   80 ++++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.1.bb          |    1 +
 2 files changed, 81 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-core/libxml/libxml2/libxml2-fix-CVE-2012-2807.patch

diff --git a/meta/recipes-core/libxml/libxml2/libxml2-fix-CVE-2012-2807.patch b/meta/recipes-core/libxml/libxml2/libxml2-fix-CVE-2012-2807.patch
new file mode 100644
index 0000000..7fb53c3
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/libxml2-fix-CVE-2012-2807.patch
@@ -0,0 +1,80 @@
+Attempt to address libxml crash.
+
+Upstream-Status: Backport
+
+BUG=129930
+Review URL: https://chromiumcodereview.appspot.com/10458051
+
+https://src.chromium.org/viewvc/chrome?view=rev&revision=142822
+
+2012-2807
+Multiple integer overflows in libxml2, as used in Google Chrome
+before 20.0.1132.43, on 64-bit Linux platforms allow remote attackers to cause \
+a denial of service or possibly have unspecified other impact via unknown vectors.
+http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-2807
+
+Signed-off-by: Li Wang <li.wang@windriver.com>
+---
+ globals.c |   25 ++++++++++++++++++++++---
+ 1 files changed, 22 insertions(+), 3 deletions(-)
+
+diff --git a/globals.c b/globals.c
+index 69002f0..b369346 100644
+--- a/globals.c
++++ b/globals.c
+@@ -86,6 +86,25 @@ xmlMallocFunc xmlMallocAtomic = (xmlMallocFunc) xmlMemMalloc;
+ xmlReallocFunc xmlRealloc = (xmlReallocFunc) xmlMemRealloc;
+ xmlStrdupFunc xmlMemStrdup = (xmlStrdupFunc) xmlMemoryStrdup;
+ #else
++
++#define MAX_LIBXML_MALLOC (1024*1024*512)
++
++static void* size_checked_malloc(size_t size) {
++  if (size > MAX_LIBXML_MALLOC) {
++    *(volatile char*)0 = '\0';
++    return NULL;
++  }
++  return malloc(size);
++}
++
++static void* size_checked_realloc(void* ptr, size_t size) {
++  if (size > MAX_LIBXML_MALLOC) {
++    *(volatile char*)0 = '\0';
++    return NULL;
++  }
++  return realloc(ptr, size);
++}
++
+ /**
+  * xmlFree:
+  * @mem: an already allocated block of memory
+@@ -101,7 +120,7 @@ xmlFreeFunc xmlFree = (xmlFreeFunc) free;
+  *
+  * Returns a pointer to the newly allocated block or NULL in case of error
+  */
+-xmlMallocFunc xmlMalloc = (xmlMallocFunc) malloc;
++xmlMallocFunc xmlMalloc = (xmlMallocFunc) size_checked_malloc;
+ /**
+  * xmlMallocAtomic:
+  * @size:  the size requested in bytes
+@@ -112,7 +131,7 @@ xmlMallocFunc xmlMalloc = (xmlMallocFunc) malloc;
+  *
+  * Returns a pointer to the newly allocated block or NULL in case of error
+  */
+-xmlMallocFunc xmlMallocAtomic = (xmlMallocFunc) malloc;
++xmlMallocFunc xmlMallocAtomic = (xmlMallocFunc) size_checked_malloc;
+ /**
+  * xmlRealloc:
+  * @mem: an already allocated block of memory
+@@ -122,7 +141,7 @@ xmlMallocFunc xmlMallocAtomic = (xmlMallocFunc) malloc;
+  *
+  * Returns a pointer to the newly reallocated block or NULL in case of error
+  */
+-xmlReallocFunc xmlRealloc = (xmlReallocFunc) realloc;
++xmlReallocFunc xmlRealloc = (xmlReallocFunc) size_checked_realloc;
+ /**
+  * xmlMemStrdup:
+  * @str: a zero terminated string
+--
+1.7.0.5
+
diff --git a/meta/recipes-core/libxml/libxml2_2.9.1.bb b/meta/recipes-core/libxml/libxml2_2.9.1.bb
index a1093ed..11d8486 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.1.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.1.bb
@@ -1,6 +1,7 @@
 require libxml2.inc

 SRC_URI += "file://libxml2-CVE-2012-2871.patch \
+	    file://libxml2-fix-CVE-2012-2807.patch \
 	   "

 SRC_URI[md5sum] = "9c0cfef285d5c4a5c80d00904ddab380"
--
1.7.4.1


