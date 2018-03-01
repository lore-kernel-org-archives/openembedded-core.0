Return-Path: <juro.bystricky@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 7C3DB71C7A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 22:53:17 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Mar 2018 14:53:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,409,1515484800"; d="scan'208";a="35261486"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga001.jf.intel.com with ESMTP; 01 Mar 2018 14:53:18 -0800
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Mar 2018 14:53:18 -0800
Message-Id: <1519944798-15230-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: jurobystricky@hotmail.com
Subject: [PATCH] libjpeg-turbo: improve reproducibility
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
X-List-Received-Date: Thu, 01 Mar 2018 22:53:17 -0000

Build date ends up embbedded in binary images, breaking reproducibility
of jpeg-tools and libturbojpeg. To enable reproducible builds, build date can be
specified during configuration, via "--with_build_date=<date>".
If SOURCE_DATE_EPOCH is specified we configure libjpeg-turbo with this value as
build date. Although the build date is a generic string, we keep it in the same
format YYYYMMDD.

[YOCTO #12526]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.3.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.3.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.3.bb
index 8809f2c..50a5ae0 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.3.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.3.bb
@@ -40,6 +40,14 @@ EXTRA_OECONF_append_class-target = " ${@bb.utils.contains("MIPSPKGSFX_FPU", "-nf
 EXTRA_OECONF_append_class-target_powerpc = " ${@bb.utils.contains("TUNE_FEATURES", "altivec", "", "--without-simd", d)}"
 EXTRA_OECONF_append_class-target_powerpc64 = " ${@bb.utils.contains("TUNE_FEATURES", "altivec", "", "--without-simd", d)}"
 
+def get_build_time(d):
+    if d.getVar('SOURCE_DATE_EPOCH') != None:
+        import datetime
+        return " --with-build-date="+ datetime.datetime.fromtimestamp(float(d.getVar('SOURCE_DATE_EPOCH'))).strftime("%Y%m%d")
+    return ""
+
+EXTRA_OECONF_append_class-target = "${@get_build_time(d)}"
+
 PACKAGES =+ "jpeg-tools libturbojpeg"
 
 DESCRIPTION_jpeg-tools = "The jpeg-tools package includes client programs to access libjpeg functionality.  These tools allow for the compression, decompression, transformation and display of JPEG files and benchmarking of the libjpeg library."
-- 
2.7.4


