Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4BFF36212E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 02:38:07 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 22 Nov 2015 18:38:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,335,1444719600"; d="scan'208";a="857558568"
Received: from echoo1-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.170.181])
	by fmsmga002.fm.intel.com with ESMTP; 22 Nov 2015 18:38:06 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Nov 2015 15:37:37 +1300
Message-Id: <a05088d581e3238a7c0d5e02c7de4a4780de4fdc.1448246218.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1448246218.git.paul.eggleton@linux.intel.com>
References: <cover.1448246218.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1448246218.git.paul.eggleton@linux.intel.com>
References: <cover.1448246218.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/7] nativesdk-buildtools-perl-dummy: fix rebuilding when SDKMACHINE changes
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
X-List-Received-Date: Mon, 23 Nov 2015 02:38:07 -0000

This recipe produces an empty dummy package (in order to satisfy
dependencies on perl so we don't have perl within buildtools-tarball).
Because we were inheriting nativesdk here the recipe was being rebuilt,
but having forced PACKAGE_ARCH to a particular value the packages for
each architecture were stepping on eachother. Since the packages are
empty they can in fact be allarch (even though they won't actually go
into the "all" package feed). It turns out that nheriting nativesdk
wasn't actually necessary either, so drop that.

Fixes [YOCTO #8509].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb b/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
index d971c3c..6fb2b64 100644
--- a/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
+++ b/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
@@ -2,9 +2,16 @@ SUMMARY = "Dummy package which ensures perl is excluded from buildtools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
-inherit nativesdk
+inherit allarch
+
+python() {
+    # Put the package somewhere separate to ensure it's never used except
+    # when we want it
+    # (note that we have to do this in anonymous python here to avoid
+    # allarch.bbclass disabling itself)
+    d.setVar('PACKAGE_ARCH', 'buildtools-dummy-${SDKPKGSUFFIX}')
+}
 
-# Put it somewhere separate to ensure it's never used except when we want it
 PACKAGE_ARCH = "buildtools-dummy-${SDKPKGSUFFIX}"
 
 PERLPACKAGES = "nativesdk-perl \
-- 
2.1.0


