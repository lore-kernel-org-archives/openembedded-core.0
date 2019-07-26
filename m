Return-Path: <anuj.mittal@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1261B7E5E8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2019 04:47:36 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Jul 2019 21:47:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,309,1559545200"; d="scan'208";a="172069553"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga007.fm.intel.com with ESMTP; 25 Jul 2019 21:47:36 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Jul 2019 12:47:23 +0800
Message-Id: <1564116449-69248-1-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [warrior][PATCH 1/7] expat: fix CVE-2018-20843
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
X-List-Received-Date: Fri, 26 Jul 2019 04:47:37 -0000

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-core/expat/expat/CVE-2018-20843.patch | 26 ++++++++++++++++++++++
 meta/recipes-core/expat/expat_2.2.6.bb             |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2018-20843.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2018-20843.patch b/meta/recipes-core/expat/expat/CVE-2018-20843.patch
new file mode 100644
index 0000000..af6641e
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2018-20843.patch
@@ -0,0 +1,26 @@
+From 11f8838bf99ea0a6f0b76f9760c43704d00c4ff6 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Wed, 12 Jun 2019 15:42:22 +0200
+Subject: [PATCH] xmlparse.c: Fix extraction of namespace prefix from XML name
+ (#186)
+
+Upstream-Status: Backport
+CVE: CVE-2018-20843
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ expat/lib/xmlparse.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
+index 30d55c5c..737d7cd2 100644
+--- a/expat/lib/xmlparse.c
++++ b/expat/lib/xmlparse.c
+@@ -6071,7 +6071,7 @@ setElementTypePrefix(XML_Parser parser, ELEMENT_TYPE *elementType)
+       else
+         poolDiscard(&dtd->pool);
+       elementType->prefix = prefix;
+-
++      break;
+     }
+   }
+   return 1;
diff --git a/meta/recipes-core/expat/expat_2.2.6.bb b/meta/recipes-core/expat/expat_2.2.6.bb
index c9e6081..0cef705 100644
--- a/meta/recipes-core/expat/expat_2.2.6.bb
+++ b/meta/recipes-core/expat/expat_2.2.6.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5b8620d98e49772d95fc1d291c26aa79"
 SRC_URI = "${SOURCEFORGE_MIRROR}/expat/expat-${PV}.tar.bz2 \
            file://autotools.patch \
            file://libtool-tag.patch \
+           file://CVE-2018-20843.patch;striplevel=2 \
 	  "
 
 SRC_URI[md5sum] = "ca047ae951b40020ac831c28859161b2"
-- 
2.7.4


