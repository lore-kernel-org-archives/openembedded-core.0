Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4425E6B6EA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Oct 2017 18:35:28 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Oct 2017 11:35:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,367,1503385200"; d="scan'208";a="137884498"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by orsmga004.jf.intel.com with ESMTP; 12 Oct 2017 11:35:29 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Oct 2017 11:35:22 -0700
Message-Id: <20171012183523.130193-3-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <20171012183523.130193-1-leonardo.sandoval.gonzalez@linux.intel.com>
References: <20171012183523.130193-1-leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH 3/4] libxml-namespacesupport-perl: upgrade to 1.12.9
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
X-List-Received-Date: Thu, 12 Oct 2017 18:35:28 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 ...2.bb => libxml-namespacesupport-perl_1.12.9.bb} | 24 ++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)
 rename meta/recipes-extended/perl/{libxml-namespacesupport-perl_1.12.bb => libxml-namespacesupport-perl_1.12.9.bb} (40%)

diff --git a/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.12.bb b/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.12.9.bb
similarity index 40%
rename from meta/recipes-extended/perl/libxml-namespacesupport-perl_1.12.bb
rename to meta/recipes-extended/perl/libxml-namespacesupport-perl_1.12.9.bb
index 3498a286d4..a7d26ea38c 100644
--- a/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.12.bb
+++ b/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.12.9.bb
@@ -10,12 +10,24 @@ PR = "r3"
 
 LIC_FILES_CHKSUM = "file://META.yml;beginline=22;endline=22;md5=9ca1a4a941496e7feedac72c4fb8b137"
 
-SRC_URI = "http://search.cpan.org/CPAN/authors/id/P/PE/PERIGRIN/XML-NamespaceSupport-${PV}.tar.gz"
-SRC_URI[md5sum] = "a8916c6d095bcf073e1108af02e78c97"
-SRC_URI[sha256sum] = "47e995859f8dd0413aa3f22d350c4a62da652e854267aa0586ae544ae2bae5ef"
-
-
-S = "${WORKDIR}/XML-NamespaceSupport-${PV}"
+# the upstream project complicate a bit url generartion on point release, using a underscore
+# instead of a point on URL, i.e 1.12_9 instead of 1.12.9
+python () {
+    baseurl = "http://search.cpan.org/CPAN/authors/id/P/PE/PERIGRIN/XML-NamespaceSupport"
+    pv = d.getVar('PV')
+    pvsplit = pv.split('.')
+
+    if len(pvsplit) != 3:
+        d.setVar('SRC_URI', "%s-%s.tar.gz" % (baseurl, pv))
+        d.setVar('S', "${WORKDIR}/XML-NamespaceSupport-${PV}")
+    else:
+        pvx, pvy, pvz = pvsplit
+        d.setVar('SRC_URI', "%s-%s.%s_%s.tar.gz" % (baseurl, pvx, pvy, pvz))
+        d.setVar('S', "${WORKDIR}/XML-NamespaceSupport-%s.%s_%s" % (pvx, pvy, pvz))
+}
+
+SRC_URI[md5sum] = "165927a311fb640961b28607035beab8"
+SRC_URI[sha256sum] = "2e84a057f0a8c845a612d212742cb94fca4fc8a433150b5721bd448f77d1e4a9"
 
 inherit cpan
 
-- 
2.12.3


