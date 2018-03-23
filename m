Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 87C0278891
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2018 08:17:28 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Mar 2018 01:17:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,349,1517904000"; d="scan'208";a="44641310"
Received: from chiron.jf.intel.com ([10.7.159.63])
	by orsmga002.jf.intel.com with ESMTP; 23 Mar 2018 01:17:28 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Mar 2018 01:17:23 -0700
Message-Id: <20180323081723.65091-2-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180323081723.65091-1-timothy.t.orling@linux.intel.com>
References: <20180323081723.65091-1-timothy.t.orling@linux.intel.com>
Subject: [PATCH 2/2] libxml-namespacesupport: use stable v1.12 release; inherit ptest-perl
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
X-List-Received-Date: Fri, 23 Mar 2018 08:17:28 -0000

* Fix RDEPENDS
* Upstream v1.12_9 is a development version, not a stable release
* Add UPSTREAM_CHECK_REGEX skip development releases
* Drop anonymous python function to "fix" version, which breaks
  auto-upgrade-helper (AUH)
* Use LICENSE file for checksum rather than ephemeral META.yml
* License remains the same

Fixes: [YOCTO #12581]

License-Update: use LICENSE file for checksum

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../perl/libxml-namespacesupport-perl_1.12.9.bb    | 35 ----------------------
 .../perl/libxml-namespacesupport-perl_1.12.bb      | 27 +++++++++++++++++
 2 files changed, 27 insertions(+), 35 deletions(-)
 delete mode 100644 meta/recipes-extended/perl/libxml-namespacesupport-perl_1.12.9.bb
 create mode 100644 meta/recipes-extended/perl/libxml-namespacesupport-perl_1.12.bb

diff --git a/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.12.9.bb b/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.12.9.bb
deleted file mode 100644
index a7d26ea38c..0000000000
--- a/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.12.9.bb
+++ /dev/null
@@ -1,35 +0,0 @@
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
-# the upstream project complicate a bit url generartion on point release, using a underscore
-# instead of a point on URL, i.e 1.12_9 instead of 1.12.9
-python () {
-    baseurl = "http://search.cpan.org/CPAN/authors/id/P/PE/PERIGRIN/XML-NamespaceSupport"
-    pv = d.getVar('PV')
-    pvsplit = pv.split('.')
-
-    if len(pvsplit) != 3:
-        d.setVar('SRC_URI', "%s-%s.tar.gz" % (baseurl, pv))
-        d.setVar('S', "${WORKDIR}/XML-NamespaceSupport-${PV}")
-    else:
-        pvx, pvy, pvz = pvsplit
-        d.setVar('SRC_URI', "%s-%s.%s_%s.tar.gz" % (baseurl, pvx, pvy, pvz))
-        d.setVar('S', "${WORKDIR}/XML-NamespaceSupport-%s.%s_%s" % (pvx, pvy, pvz))
-}
-
-SRC_URI[md5sum] = "165927a311fb640961b28607035beab8"
-SRC_URI[sha256sum] = "2e84a057f0a8c845a612d212742cb94fca4fc8a433150b5721bd448f77d1e4a9"
-
-inherit cpan
-
-BBCLASSEXTEND="native"
-
diff --git a/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.12.bb b/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.12.bb
new file mode 100644
index 0000000000..fa9f9954bb
--- /dev/null
+++ b/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.12.bb
@@ -0,0 +1,27 @@
+SUMMARY = "Perl module for supporting simple generic namespaces"
+HOMEPAGE = "http://veillard.com/XML/"
+DESCRIPTION = "XML::NamespaceSupport offers a simple way to process namespace-based XML names. \
+                It also helps maintain a prefix-to-namespace URI map, and provides a number of \
+                basic checks. "
+
+SECTION = "libs"
+LICENSE = "Artistic-1.0 | GPL-1.0+"
+
+SRCNAME = "XML-NamespaceSupport"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c9d8a117e7620b5adf8d69c29613ceab"
+
+SRC_URI = "${CPAN_MIRROR}/authors/id/P/PE/PERIGRIN/${SRCNAME}-${PV}.tar.gz"
+SRC_URI[md5sum] = "a8916c6d095bcf073e1108af02e78c97"
+SRC_URI[sha256sum] = "47e995859f8dd0413aa3f22d350c4a62da652e854267aa0586ae544ae2bae5ef"
+
+UPSTREAM_CHECK_REGEX = "XML\-NamespaceSupport\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit cpan ptest-perl
+
+RDEPENDS_${PN}-ptest += "perl-module-test-more"
+
+BBCLASSEXTEND="native"
+
-- 
2.14.3


