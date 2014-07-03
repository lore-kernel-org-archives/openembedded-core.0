Return-Path: <roxana.ciobanu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4921365E38
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jul 2014 09:46:56 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 03 Jul 2014 02:41:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,594,1400050800"; d="scan'208";a="567757496"
Received: from roxana-optiplex-9010.rb.intel.com ([10.237.105.38])
	by orsmga002.jf.intel.com with ESMTP; 03 Jul 2014 02:46:55 -0700
From: Roxana Ciobanu <roxana.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Jul 2014 12:45:44 +0300
Message-Id: <7288f6c98bf45e320a83b27a80aae3dc3d529764.1404380633.git.roxana.ciobanu@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1404380633.git.roxana.ciobanu@intel.com>
References: <cover.1404380633.git.roxana.ciobanu@intel.com>
In-Reply-To: <cover.1404380633.git.roxana.ciobanu@intel.com>
References: <cover.1404380633.git.roxana.ciobanu@intel.com>
Subject: [PATCH 1/1] gawk: fix optional dependency mpfr
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
X-List-Received-Date: Thu, 03 Jul 2014 09:47:03 -0000

 Gawk was failing to compile because of the optional feature mpfr if it found
 libmpfr on build host and linked against that or mpfr existed in sysroot but
 not in deploy, or if gawk was pulled from sstate and someone had mpfr built.

 [YOCTO# 6473]

Signed-off-by: Roxana Ciobanu <roxana.ciobanu@intel.com>
---
 meta/recipes-extended/gawk/gawk_4.1.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/gawk/gawk_4.1.1.bb b/meta/recipes-extended/gawk/gawk_4.1.1.bb
index 1298ee2..3266f58 100644
--- a/meta/recipes-extended/gawk/gawk_4.1.1.bb
+++ b/meta/recipes-extended/gawk/gawk_4.1.1.bb
@@ -13,6 +13,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 DEPENDS += "readline"
 
+PACKAGECONFIG[mpfr] = "--with-mpfr,--without-mpfr, mpfr"
+
 SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
            file://run-ptest \
            file://Use-DESTDIR-in-extension-Makefile.am-when-removing-..patch \
-- 
1.9.1


