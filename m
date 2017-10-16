Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id B052778215
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Oct 2017 22:01:28 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga105.jf.intel.com with ESMTP; 16 Oct 2017 15:01:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,388,1503385200"; d="scan'208";a="323947010"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by fmsmga004.fm.intel.com with ESMTP; 16 Oct 2017 15:01:29 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Oct 2017 15:01:25 -0700
Message-Id: <20171016220126.128198-4-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <20171016220126.128198-1-leonardo.sandoval.gonzalez@linux.intel.com>
References: <20171016220126.128198-1-leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH v2 4/5] libxml-namespacesupport-perl: upgrade to 1.12.9
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
X-List-Received-Date: Mon, 16 Oct 2017 22:01:28 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 .../perl/libxml-namespacesupport-perl_1.12.9.bb    | 35 ++++++++++++++++++++++
 .../perl/libxml-namespacesupport-perl_1.12.bb      | 23 --------------
 2 files changed, 35 insertions(+), 23 deletions(-)
 create mode 100644 meta/recipes-extended/perl/libxml-namespacesupport-perl_1.12.9.bb
 delete mode 100644 meta/recipes-extended/perl/libxml-namespacesupport-perl_1.12.bb

diff --git a/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.12.9.bb b/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.12.9.bb
new file mode 100644
index 0000000000..a7d26ea38c
--- /dev/null
+++ b/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.12.9.bb
@@ -0,0 +1,35 @@
+SUMMARY = "Perl module for supporting simple generic namespaces"
+HOMEPAGE = "http://veillard.com/XML/"
+DESCRIPTION = "XML::NamespaceSupport offers a simple way to process namespace-based XML names. \
+                It also helps maintain a prefix-to-namespace URI map, and provides a number of \
+                basic checks. "
+
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+PR = "r3"
+
+LIC_FILES_CHKSUM = "file://META.yml;beginline=22;endline=22;md5=9ca1a4a941496e7feedac72c4fb8b137"
+
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
+
+inherit cpan
+
+BBCLASSEXTEND="native"
+
diff --git a/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.12.bb b/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.12.bb
deleted file mode 100644
index 3498a286d4..0000000000
--- a/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.12.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY = "Perl module for supporting simple generic namespaces"
-HOMEPAGE = "http://veillard.com/XML/"
-DESCRIPTION = "XML::NamespaceSupport offers a simple way to process namespace-based XML names. \
-                It also helps maintain a prefix-to-namespace URI map, and provides a number of \
-                basic checks. "
-
-SECTION = "libs"
-LICENSE = "Artistic-1.0 | GPL-1.0+"
-PR = "r3"
-
-LIC_FILES_CHKSUM = "file://META.yml;beginline=22;endline=22;md5=9ca1a4a941496e7feedac72c4fb8b137"
-
-SRC_URI = "http://search.cpan.org/CPAN/authors/id/P/PE/PERIGRIN/XML-NamespaceSupport-${PV}.tar.gz"
-SRC_URI[md5sum] = "a8916c6d095bcf073e1108af02e78c97"
-SRC_URI[sha256sum] = "47e995859f8dd0413aa3f22d350c4a62da652e854267aa0586ae544ae2bae5ef"
-
-
-S = "${WORKDIR}/XML-NamespaceSupport-${PV}"
-
-inherit cpan
-
-BBCLASSEXTEND="native"
-
-- 
2.12.3


