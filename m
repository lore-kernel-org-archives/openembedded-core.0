Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Li.Wang@windriver.com>) id 1Tj1yf-0003nB-J2
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Dec 2012 07:09:31 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qBD5sRig022469
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Dec 2012 21:54:27 -0800 (PST)
Received: from pek-lpgbuild4.wrs.com (128.224.153.32) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Wed, 12 Dec 2012 21:54:26 -0800
From: Li Wang <li.wang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Dec 2012 13:54:21 +0800
Message-ID: <1355378061-7514-1-git-send-email-li.wang@windriver.com>
X-Mailer: git-send-email 1.7.11
MIME-Version: 1.0
Subject: [PATCH] libxml2 CVE-2012-2871
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Dec 2012 06:09:32 -0000
Content-Type: text/plain

the patch come from:
http://src.chromium.org/viewvc/chrome/trunk/src/third_party/libxml/src \
/include/libxml/tree.h?r1=56276&r2=149930

libxml2 2.9.0-rc1 and earlier, as used in Google Chrome before 21.0.1180.89,
does not properly support a cast of an unspecified variable during handling
of XSL transforms, which allows remote attackers to cause a denial of service
or possibly have unknown other impact via a crafted document, related to the
_xmlNs data structure in include/libxml/tree.h.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-2871

[YOCTO #3580]
[ CQID: WIND00376779 ]
Upstream-Status: Pending

Signed-off-by: Li Wang <li.wang@windriver.com>
---
 .../libxml/libxml2/libxml2-CVE-2012-2871.patch     | 34 ++++++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.0.bb          |  5 +++-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/libxml/libxml2/libxml2-CVE-2012-2871.patch

diff --git a/meta/recipes-core/libxml/libxml2/libxml2-CVE-2012-2871.patch b/meta/recipes-core/libxml/libxml2/libxml2-CVE-2012-2871.patch
new file mode 100644
index 0000000..3c66a9c
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/libxml2-CVE-2012-2871.patch
@@ -0,0 +1,34 @@
+libxml2 CVE-2012-2871
+
+the patch come from:
+http://src.chromium.org/viewvc/chrome/trunk/src/third_party/libxml/src \
+/include/libxml/tree.h?r1=56276&r2=149930
+
+libxml2 2.9.0-rc1 and earlier, as used in Google Chrome before 21.0.1180.89,
+does not properly support a cast of an unspecified variable during handling
+of XSL transforms, which allows remote attackers to cause a denial of service
+or possibly have unknown other impact via a crafted document, related to the
+_xmlNs data structure in include/libxml/tree.h.
+
+http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-2871
+
+Signed-off-by: Li Wang <li.wang@windriver.com>
+---
+ include/libxml/tree.h |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/include/libxml/tree.h b/include/libxml/tree.h
+index b733589..5422dda 100644
+--- a/include/libxml/tree.h
++++ b/include/libxml/tree.h
+@@ -351,6 +351,7 @@ struct _xmlNs {
+     struct _xmlNs  *next;	/* next Ns link for this node  */
+     xmlNsType      type;	/* global or local */
+     const xmlChar *href;	/* URL for the namespace */
++    const char *dummy_children;	/* lines up with node->children */
+     const xmlChar *prefix;	/* prefix for the namespace */
+     void           *_private;   /* application data */
+     struct _xmlDoc *context;		/* normally an xmlDoc */
+-- 
+1.7.0.5
+
diff --git a/meta/recipes-core/libxml/libxml2_2.9.0.bb b/meta/recipes-core/libxml/libxml2_2.9.0.bb
index a022ae9..ecc19fb 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.0.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.0.bb
@@ -1,6 +1,9 @@
 require libxml2.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 SRC_URI[md5sum] = "5b9bebf4f5d2200ae2c4efe8fa6103f7"
 SRC_URI[sha256sum] = "ad25d91958b7212abdc12b9611cfb4dc4e5cddb6d1e9891532f48aacee422b82"
+
+SRC_URI += "file://libxml2-CVE-2012-2871.patch \
+	   "
-- 
1.7.11



