Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8AC3B78087
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 12:07:21 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Nov 2017 04:07:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,464,1505804400"; d="scan'208";a="12423524"
Received: from marquiz2.fi.intel.com ([10.237.72.79])
	by orsmga002.jf.intel.com with ESMTP; 27 Nov 2017 04:07:09 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Nov 2017 14:06:52 +0200
Message-Id: <4ec82b09c46ef7a37a0cd8ee530b1b2ff1f0cb60.1511784130.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <cover.1511784130.git.markus.lehtonen@linux.intel.com>
References: <cover.1511784130.git.markus.lehtonen@linux.intel.com>
In-Reply-To: <cover.1511784130.git.markus.lehtonen@linux.intel.com>
References: <cover.1511784130.git.markus.lehtonen@linux.intel.com>
Subject: [PATCH v8 08/16] iproute2: enable native
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
X-List-Received-Date: Mon, 27 Nov 2017 12:07:21 -0000

[YOCTO #9338]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/recipes-connectivity/iproute2/iproute2.inc | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc b/meta/recipes-connectivity/iproute2/iproute2.inc
index a578eb3afa..d08d049f41 100644
--- a/meta/recipes-connectivity/iproute2/iproute2.inc
+++ b/meta/recipes-connectivity/iproute2/iproute2.inc
@@ -26,12 +26,15 @@ do_configure_append () {
 
 do_install () {
     oe_runmake DESTDIR=${D} install
-    mv ${D}${base_sbindir}/ip ${D}${base_sbindir}/ip.iproute2
     install -d ${D}${datadir}
     mv ${D}/share/* ${D}${datadir}/ || true
     rm ${D}/share -rf || true
 }
 
+do_install_append_class-target () {
+    mv ${D}${base_sbindir}/ip ${D}${base_sbindir}/ip.iproute2
+}
+
 # The .so files in iproute2-tc are modules, not traditional libraries
 INSANE_SKIP_${PN}-tc = "dev-so"
 
@@ -50,3 +53,5 @@ ALTERNATIVE_${PN} = "ip"
 ALTERNATIVE_TARGET[ip] = "${base_sbindir}/ip.${BPN}"
 ALTERNATIVE_LINK_NAME[ip] = "${base_sbindir}/ip"
 ALTERNATIVE_PRIORITY = "100"
+
+BBCLASSEXTEND = "native"
-- 
2.13.6


