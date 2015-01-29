Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 96FB660132
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jan 2015 13:24:20 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 29 Jan 2015 05:24:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,486,1418112000"; d="scan'208";a="658602319"
Received: from jamiewei-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.23.125])
	by fmsmga001.fm.intel.com with ESMTP; 29 Jan 2015 05:24:12 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Jan 2015 13:24:09 +0000
Message-Id: <4bbe2b8a16baaf23915bf3afb60b56d13b8a78bc.1422537804.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1422537804.git.paul.eggleton@linux.intel.com>
References: <cover.1422537804.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1422537804.git.paul.eggleton@linux.intel.com>
References: <cover.1422537804.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] sed-native: drop
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
X-List-Received-Date: Thu, 29 Jan 2015 13:24:26 -0000

This was added back in the depths of history (around 2006 in OE-Classic)
when apparently the host sed couldn't always be relied upon. We now call
the host sed all over the place without this dependency and don't have
any problems. On the other hand, having it around can lead to races
where we're calling sed in one task and staging it to the sysroot in
another, the result being nasty failures compiling binutils for example.
Since it isn't needed, let's just drop it completely.

Fixes [YOCTO #7264].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/populate_sdk_base.bbclass | 2 +-
 meta/recipes-extended/sed/sed_4.1.2.bb | 1 -
 meta/recipes-extended/sed/sed_4.2.2.bb | 1 -
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index de72e32..8b7e9ea 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -40,7 +40,7 @@ TOOLCHAIN_TARGET_TASK_ATTEMPTONLY ?= ""
 TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-toolchain-${SDK_VERSION}"
 
 SDK_RDEPENDS = "${TOOLCHAIN_TARGET_TASK} ${TOOLCHAIN_HOST_TASK}"
-SDK_DEPENDS = "virtual/fakeroot-native sed-native"
+SDK_DEPENDS = "virtual/fakeroot-native"
 
 # We want the MULTIARCH_TARGET_SYS to point to the TUNE_PKGARCH, not PACKAGE_ARCH as it
 # could be set to the MACHINE_ARCH
diff --git a/meta/recipes-extended/sed/sed_4.1.2.bb b/meta/recipes-extended/sed/sed_4.1.2.bb
index fe242e1..4c0f345 100644
--- a/meta/recipes-extended/sed/sed_4.1.2.bb
+++ b/meta/recipes-extended/sed/sed_4.1.2.bb
@@ -31,4 +31,3 @@ ALTERNATIVE_${PN} = "sed"
 ALTERNATIVE_LINK_NAME[sed] = "${base_bindir}/sed"
 ALTERNATIVE_PRIORITY = "100"
 
-BBCLASSEXTEND = "native"
diff --git a/meta/recipes-extended/sed/sed_4.2.2.bb b/meta/recipes-extended/sed/sed_4.2.2.bb
index ea39dae..72976de 100644
--- a/meta/recipes-extended/sed/sed_4.2.2.bb
+++ b/meta/recipes-extended/sed/sed_4.2.2.bb
@@ -40,4 +40,3 @@ do_install_ptest() {
 	oe_runmake -C ${TESTDIR} install-ptest BUILDDIR=${B} DESTDIR=${D}${PTEST_PATH} TESTDIR=${TESTDIR}
 }
 
-BBCLASSEXTEND = "native"
-- 
1.9.3


