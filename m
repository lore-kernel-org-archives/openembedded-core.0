Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id DD37F6FF78
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Dec 2015 09:56:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tB89uogD017886
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Dec 2015 01:56:50 -0800
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 8 Dec 2015 01:56:50 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 8 Dec 2015 01:56:34 -0800
Message-ID: <bc8b7401fa18f6a987041d7f93a1fa3512f8513c.1449568553.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1449568553.git.liezhi.yang@windriver.com>
References: <cover.1449568553.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 06/15] libxslt: CVE-2015-7995
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
X-List-Received-Date: Tue, 08 Dec 2015 09:56:50 -0000
Content-Type: text/plain

From: Armin Kuster <akuster@mvista.com>

This is a is being give a High rating so please consider it for
all 1.1.28 versions.

A type confusion error within the libxslt "xsltStylePreCompute()"
function in preproc.c can lead to a DoS. Confirmed in version 1.1.28,
other versions may also be affected.

(From OE-Core master rev: 0f89bbab6588a1171259801fa879516740030acb)

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../libxslt/libxslt/CVE-2015-7995.patch            |   33 ++++++++++++++++++++
 meta/recipes-support/libxslt/libxslt_1.1.28.bb     |    3 +-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libxslt/libxslt/CVE-2015-7995.patch

diff --git a/meta/recipes-support/libxslt/libxslt/CVE-2015-7995.patch b/meta/recipes-support/libxslt/libxslt/CVE-2015-7995.patch
new file mode 100644
index 0000000..e4d09c2
--- /dev/null
+++ b/meta/recipes-support/libxslt/libxslt/CVE-2015-7995.patch
@@ -0,0 +1,33 @@
+From 7ca19df892ca22d9314e95d59ce2abdeff46b617 Mon Sep 17 00:00:00 2001
+From: Daniel Veillard <veillard@redhat.com>
+Date: Thu, 29 Oct 2015 19:33:23 +0800
+Subject: Fix for type confusion in preprocessing attributes
+
+CVE-2015-7995 http://www.openwall.com/lists/oss-security/2015/10/27/10
+We need to check that the parent node is an element before dereferencing
+its namespace
+
+Upstream-Status: Backport
+
+https://git.gnome.org/browse/libxslt/commit/?id=7ca19df892ca22d9314e95d59ce2abdeff46b617
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ libxslt/preproc.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+Index: libxslt-1.1.28/libxslt/preproc.c
+===================================================================
+--- libxslt-1.1.28.orig/libxslt/preproc.c
++++ libxslt-1.1.28/libxslt/preproc.c
+@@ -2245,7 +2245,8 @@ xsltStylePreCompute(xsltStylesheetPtr st
+ 	} else if (IS_XSLT_NAME(inst, "attribute")) {
+ 	    xmlNodePtr parent = inst->parent;
+ 
+-	    if ((parent == NULL) || (parent->ns == NULL) ||
++	    if ((parent == NULL) ||
++	        (parent->type != XML_ELEMENT_NODE) || (parent->ns == NULL) ||
+ 		((parent->ns != inst->ns) &&
+ 		 (!xmlStrEqual(parent->ns->href, inst->ns->href))) ||
+ 		(!xmlStrEqual(parent->name, BAD_CAST "attribute-set"))) {
diff --git a/meta/recipes-support/libxslt/libxslt_1.1.28.bb b/meta/recipes-support/libxslt/libxslt_1.1.28.bb
index 166bcd8..87fabec 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.28.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.28.bb
@@ -10,7 +10,8 @@ DEPENDS = "libxml2"
 
 SRC_URI = "ftp://xmlsoft.org/libxslt//libxslt-${PV}.tar.gz \
            file://pkgconfig_fix.patch \
-           file://pkgconfig.patch"
+           file://pkgconfig.patch \
+           file://CVE-2015-7995.patch"
 
 SRC_URI[md5sum] = "9667bf6f9310b957254fdcf6596600b7"
 SRC_URI[sha256sum] = "5fc7151a57b89c03d7b825df5a0fae0a8d5f05674c0e7cf2937ecec4d54a028c"
-- 
1.7.9.5


