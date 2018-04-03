Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id A36E474A03
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Apr 2018 15:51:58 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Apr 2018 08:52:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,401,1517904000"; d="scan'208";a="39069230"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 03 Apr 2018 08:51:59 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Apr 2018 18:45:24 +0300
Message-Id: <20180403154524.31588-8-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180403154524.31588-1-alexander.kanavin@linux.intel.com>
References: <20180403154524.31588-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 8/8] glib-2.0/glib.inc: apply MLPREFIX renaming to all package classes
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
X-List-Received-Date: Tue, 03 Apr 2018 15:51:58 -0000

Now that we have postinst intercept execution working for SDK generation,
adding MLPREFIX again makes sense in all cases, as the intercepts do require
that it is there.

This reverts commit 4ffb728df4bdf21daef31d89cfa5771eaf0d90f8.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-core/glib-2.0/glib.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 7e062eeb5da..b7c32e64bc8 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -104,6 +104,11 @@ do_install_append () {
 	if [ -e ${D}${libdir}/charset.alias ]; then
 		rm -f ${D}${libdir}/charset.alias
 	fi
+
+        # Make sure gio-querymodules is unique among multilibs
+        if test "x${MLPREFIX}" != "x"; then
+                mv ${D}${libexecdir}/gio-querymodules ${D}${libexecdir}/${MLPREFIX}gio-querymodules
+        fi
 }
 
 do_install_append_class-target () {
@@ -114,11 +119,6 @@ do_install_append_class-target () {
 			rm ${D}${datadir}/installed-tests/glib/gdbus-serialization.test
 		fi
 	fi
-
-	# Make sure gio-querymodules is unique among multilibs
-	if test "x${MLPREFIX}" != "x"; then
-		mv ${D}${libexecdir}/gio-querymodules ${D}${libexecdir}/${MLPREFIX}gio-querymodules
-	fi
 }
 
 CODEGEN_PYTHON_RDEPENDS = "python3 python3-distutils python3-xml"
-- 
2.16.1


