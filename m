Return-Path: <jussi.kukkonen@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 6A2FA7828E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 07:36:32 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga105.jf.intel.com with ESMTP; 09 Jun 2017 00:36:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,317,1493708400"; d="scan'208";a="97438603"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 09 Jun 2017 00:36:24 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 1BA1B58029B;
	Fri,  9 Jun 2017 00:36:21 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Jun 2017 10:36:18 +0300
Message-Id: <c6e84eb06d2c254e5c9f090cc95d90534f802596.1496993458.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1496993458.git.jussi.kukkonen@intel.com>
References: <cover.1496993458.git.jussi.kukkonen@intel.com>
Subject: [PATCH 2/2] diffutils: prevent host path leaks, set pr path
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
X-List-Received-Date: Fri, 09 Jun 2017 07:36:33 -0000

Note that this just removes a host path leakage: diffutils still
doesn't depend on coreutils so 'pr' might not actually be there
on image (this only breaks "diff -l" so no big deal).

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-extended/diffutils/diffutils_3.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/diffutils/diffutils_3.5.bb b/meta/recipes-extended/diffutils/diffutils_3.5.bb
index 354a6e8..a4fc27b 100644
--- a/meta/recipes-extended/diffutils/diffutils_3.5.bb
+++ b/meta/recipes-extended/diffutils/diffutils_3.5.bb
@@ -11,7 +11,7 @@ SRC_URI = "${GNU_MIRROR}/diffutils/diffutils-${PV}.tar.xz \
 SRC_URI[md5sum] = "569354697ff1cfc9a9de3781361015fa"
 SRC_URI[sha256sum] = "dad398ccd5b9faca6b0ab219a036453f62a602a56203ac659b43e889bec35533"
 
-EXTRA_OECONF += "--without-libsigsegv-prefix"
+EXTRA_OECONF += "ac_cv_path_PR_PROGRAM=${bindir}/pr --without-libsigsegv-prefix"
 
 # Fix "Argument list too long" error when len(TMPDIR) = 410
 acpaths = "-I ./m4"
-- 
2.1.4


