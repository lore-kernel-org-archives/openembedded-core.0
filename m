Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 65F9B78070
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 12:57:54 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Jul 2017 05:57:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,346,1496127600"; d="scan'208";a="285465424"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 11 Jul 2017 05:57:56 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id D20D15804B8;
	Tue, 11 Jul 2017 05:57:54 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Jul 2017 15:58:12 +0300
Message-Id: <1499777893-16292-3-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1499777893-16292-1-git-send-email-maxin.john@intel.com>
References: <1499777893-16292-1-git-send-email-maxin.john@intel.com>
Cc: joshua.g.lock@intel.com, stanley.cheong.kwan.phoong@intel.com
Subject: [PATCH 2/3] libx11: fix build error
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
X-List-Received-Date: Tue, 11 Jul 2017 12:57:55 -0000

libx11 build fails with this error:

fatal error: bits/long-double-64.h: No such file or directory
| compilation terminated.

This is due to the fact that "makekeys" should be compiled for the host
since it is executed at build time to generate ks_tables.h. Since we have
the X11 include files in the standard path of oe-core, we can remove the
X11_CFLAGS from Makefile.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-graphics/xorg-lib/libx11_1.6.5.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.6.5.bb b/meta/recipes-graphics/xorg-lib/libx11_1.6.5.bb
index 71cbf67..50e8837 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.6.5.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.6.5.bb
@@ -5,6 +5,9 @@ BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI += "file://disable_tests.patch \
            "
+do_configure_append () {
+    sed -i -e "/X11_CFLAGS/d" ${B}/src/util/Makefile
+}
 
 SRC_URI[md5sum] = "0f618db70c4054ca67cee0cc156a4255"
 SRC_URI[sha256sum] = "4d3890db2ba225ba8c55ca63c6409c1ebb078a2806de59fb16342768ae63435d"
-- 
2.4.0


