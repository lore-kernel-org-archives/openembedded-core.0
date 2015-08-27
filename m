Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 5718E76DE6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 09:31:19 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 27 Aug 2015 02:31:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,421,1437462000"; d="scan'208";a="776621068"
Received: from wneubaue-mobl1.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.11.162])
	by fmsmga001.fm.intel.com with ESMTP; 27 Aug 2015 02:31:21 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Aug 2015 12:31:13 +0300
Message-Id: <1440667876-1024-2-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1440667876-1024-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1440667876-1024-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH v2 1/4] createrepo: disable RPM signature validation
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
X-List-Received-Date: Thu, 27 Aug 2015 09:31:19 -0000

Disable RPM signature validation so that it is possible to create
package feeds of signed RPM packages without importing the public part
of the signing key into the RPM database. In any case, the signatures
are validated when the packages in the feed are used (e.g. in image
generation of manually installing packages from the feed).

The original idea idea of this patch is from Mark Hatle
<mark.hatle@windriver.com>.

[YOCTO #8134]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 ...dumpMetadata-disable-signature-validation.patch | 31 ++++++++++++++++++++++
 .../createrepo/createrepo_0.4.11.bb                | 17 ++++++------
 2 files changed, 40 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-support/createrepo/createrepo/dumpMetadata-disable-signature-validation.patch

diff --git a/meta/recipes-support/createrepo/createrepo/dumpMetadata-disable-signature-validation.patch b/meta/recipes-support/createrepo/createrepo/dumpMetadata-disable-signature-validation.patch
new file mode 100644
index 0000000..905531f
--- /dev/null
+++ b/meta/recipes-support/createrepo/createrepo/dumpMetadata-disable-signature-validation.patch
@@ -0,0 +1,31 @@
+dumpMetadata: disable signature validation
+
+Makes it possible to work on RPM repositories that contain signed packages
+without the need of importing the public part of the signing key into the RPM
+database.
+
+Upstream-Status: Pending
+
+Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
+---
+ dumpMetadata.py | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/dumpMetadata.py b/dumpMetadata.py
+index e40e8ac..ca6a82d 100644
+--- a/dumpMetadata.py
++++ b/dumpMetadata.py
+@@ -92,7 +92,9 @@ def returnHdr(ts, package):
+             fdno = package # let's assume this is an fdno and go with it :)
+     except OSError:
+         raise MDError, "Error opening file"
+-    ts.setVSFlags((rpm.RPMVSF_NOMD5|rpm.RPMVSF_NEEDPAYLOAD))
++    ts.setVSFlags((rpm.RPMVSF_NOMD5|rpm.RPMVSF_NEEDPAYLOAD|
++                   rpm.RPMVSF_NODSA|rpm.RPMVSF_NORSA|
++                   rpm.RPMVSF_NODSAHEADER|rpm.RPMVSF_NORSAHEADER))
+     try:
+         hdr = ts.hdrFromFdno(fdno)
+     except rpm.error:
+-- 
+2.1.4
+
diff --git a/meta/recipes-support/createrepo/createrepo_0.4.11.bb b/meta/recipes-support/createrepo/createrepo_0.4.11.bb
index adc193e..debbaec 100644
--- a/meta/recipes-support/createrepo/createrepo_0.4.11.bb
+++ b/meta/recipes-support/createrepo/createrepo_0.4.11.bb
@@ -9,14 +9,15 @@ RDEPENDS_${PN}_class-target = "libxml2-python"
 
 PR = "r9"
 
-SRC_URI= "http://createrepo.baseurl.org/download/${BP}.tar.gz \
-          file://fix-native-install.patch \
-          file://python-scripts-should-use-interpreter-from-env.patch \
-	  file://createrepo-rpm549.patch \
-	  file://recommends.patch \
-	  file://createrepo-dbpath.patch \
-	  file://rpm-createsolvedb.py \
-         "
+SRC_URI = "http://createrepo.baseurl.org/download/${BP}.tar.gz \
+           file://fix-native-install.patch \
+           file://python-scripts-should-use-interpreter-from-env.patch \
+           file://createrepo-rpm549.patch \
+           file://recommends.patch \
+           file://createrepo-dbpath.patch \
+           file://dumpMetadata-disable-signature-validation.patch \
+           file://rpm-createsolvedb.py \
+           "
 
 SRC_URI[md5sum] = "3e9ccf4abcffe3f49af078c83611eda2"
 SRC_URI[sha256sum] = "a73ae11a0dcde8bde36d900bc3f7f8f1083ba752c70a5c61b72d1e1e7608f21b"
-- 
2.1.4


