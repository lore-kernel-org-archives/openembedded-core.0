Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id CE89E60124
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Dec 2015 13:20:58 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 07 Dec 2015 05:20:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,394,1444719600"; d="scan'208";a="866321627"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 07 Dec 2015 05:20:59 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 415ED6A4087
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Dec 2015 05:19:49 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Dec 2015 10:33:22 +0200
Message-Id: <1449477202-8261-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] libjpeg-turbo: fix build error on x32 ABI
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
X-List-Received-Date: Mon, 07 Dec 2015 13:20:59 -0000

libjpeg-turbo doesn't support x32 ABI now. Work around missing x32 ABI
support by building with "--without-simd" option.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-core/jpeg/libjpeg-turbo_8d+1.4.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/jpeg/libjpeg-turbo_8d+1.4.2.bb b/meta/recipes-core/jpeg/libjpeg-turbo_8d+1.4.2.bb
index 0947763..da1923f 100644
--- a/meta/recipes-core/jpeg/libjpeg-turbo_8d+1.4.2.bb
+++ b/meta/recipes-core/jpeg/libjpeg-turbo_8d+1.4.2.bb
@@ -25,6 +25,9 @@ RCONFLICTS_${PN} += "jpeg"
 
 inherit autotools pkgconfig
 
+# Work around missing x32 ABI support
+EXTRA_OECONF_append_class-target = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", "--without-simd", "", d)}"
+
 PACKAGES =+ "jpeg-tools libturbojpeg"
 
 DESCRIPTION_jpeg-tools = "The jpeg-tools package includes client programs to access libjpeg functionality.  These tools allow for the compression, decompression, transformation and display of JPEG files and benchmarking of the libjpeg library."
-- 
2.4.0


