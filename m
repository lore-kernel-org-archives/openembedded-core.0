Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E6BDA773BD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2016 09:26:58 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 02 Jun 2016 02:26:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,405,1459839600"; d="scan'208";a="114703450"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 02 Jun 2016 02:26:40 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Jun 2016 12:26:03 +0300
Message-Id: <79fcc0a00b7f817826685ffebe8a550286ba2990.1464859158.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1464859158.git.alexander.kanavin@linux.intel.com>
References: <cover.1464859158.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1464859158.git.alexander.kanavin@linux.intel.com>
References: <cover.1464859158.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 26/31] lttng-ust: move to Python 3
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
X-List-Received-Date: Thu, 02 Jun 2016 09:26:59 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-kernel/lttng/lttng-ust_git.bb | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/lttng-ust_git.bb b/meta/recipes-kernel/lttng/lttng-ust_git.bb
index 15d925d..f5a12b1 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_git.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_git.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c963eb366b781252b0bf0fdf1624d9e9 \
 inherit autotools lib_package
 
 DEPENDS = "liburcu util-linux"
-RDEPENDS_${PN}-bin = "python-core"
+RDEPENDS_${PN}-bin = "python3-core"
 
 # For backwards compatibility after rename
 RPROVIDES_${PN} = "lttng2-ust"
@@ -27,6 +27,13 @@ SRC_URI = "git://git.lttng.org/lttng-ust.git;branch=stable-2.7 \
            file://lttng-ust-add-support-for-aarch64_be.patch \
           "
 
+do_install_append() {
+        # Patch python tools to use Python 3; they should be source compatible, but
+        # still refer to Python 2 in the shebang
+        sed -i -e '1s,#!.*python.*,#!${bindir}/python3,' ${D}${bindir}/lttng-gen-tp
+}
+
+
 S = "${WORKDIR}/git"
 
 do_configure_prepend () {
-- 
2.8.1


