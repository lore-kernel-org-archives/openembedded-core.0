Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A72EA7F89E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2019 18:45:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id xA6Ijt1i015410
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Nov 2019 10:45:55 -0800 (PST)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Wed, 6 Nov 2019 10:45:55 -0800
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Nov 2019 10:45:54 -0800
Message-ID: <20191106184554.22940-2-joe.slater@windriver.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20191106184554.22940-1-joe.slater@windriver.com>
References: <20191106184554.22940-1-joe.slater@windriver.com>
MIME-Version: 1.0
Subject: [zeus][PATCH 1/1] libxslt: fix CVE-2019-18197
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
X-List-Received-Date: Wed, 06 Nov 2019 18:45:54 -0000
Content-Type: text/plain

Use patch from upstream after 1.1.33 release.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../libxslt/files/CVE-2019-18197.patch             | 33 ++++++++++++++++++++++
 meta/recipes-support/libxslt/libxslt_1.1.33.bb     |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-support/libxslt/files/CVE-2019-18197.patch

diff --git a/meta/recipes-support/libxslt/files/CVE-2019-18197.patch b/meta/recipes-support/libxslt/files/CVE-2019-18197.patch
new file mode 100644
index 0000000..5f2b620
--- /dev/null
+++ b/meta/recipes-support/libxslt/files/CVE-2019-18197.patch
@@ -0,0 +1,33 @@
+libxslt: fix CVE-2019-18197
+
+Added after 1.1.33 release.
+
+CVE: CVE-2019-18197
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxslt.git]
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+commit 2232473733b7313d67de8836ea3b29eec6e8e285
+Author: Nick Wellnhofer <wellnhofer@aevum.de>
+Date:   Sat Aug 17 16:51:53 2019 +0200
+
+    Fix dangling pointer in xsltCopyText
+    
+    xsltCopyText didn't reset ctxt->lasttext in some cases which could
+    lead to various memory errors in relation with CDATA sections in input
+    documents.
+    
+    Found by OSS-Fuzz.
+
+diff --git a/libxslt/transform.c b/libxslt/transform.c
+index 95ebd07..d7ab0b6 100644
+--- a/libxslt/transform.c
++++ b/libxslt/transform.c
+@@ -1094,6 +1094,8 @@ xsltCopyText(xsltTransformContextPtr ctxt, xmlNodePtr target,
+ 	    if ((copy->content = xmlStrdup(cur->content)) == NULL)
+ 		return NULL;
+ 	}
++
++	ctxt->lasttext = NULL;
+     } else {
+         /*
+ 	 * normal processing. keep counters to extend the text node
diff --git a/meta/recipes-support/libxslt/libxslt_1.1.33.bb b/meta/recipes-support/libxslt/libxslt_1.1.33.bb
index abc00a0..9f268e7 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.33.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.33.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://xmlsoft.org/sources/libxslt-${PV}.tar.gz \
            file://0001-Fix-security-framework-bypass.patch \
            file://CVE-2019-13117.patch \
            file://CVE-2019-13118.patch \
+           file://CVE-2019-18197.patch \
 "
 
 SRC_URI[md5sum] = "b3bd254a03e46d58f8ad1e4559cd2c2f"
-- 
2.7.4


