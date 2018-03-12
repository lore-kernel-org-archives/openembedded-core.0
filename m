Return-Path: <xiao.zhang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7B8C9788E3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2018 09:14:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w2C9Drjh011047
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2018 02:14:08 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 12 Mar 2018 02:13:05 -0700
From: Zhang Xiao <xiao.zhang@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <mark.hatle@windriver.com>
Date: Mon, 12 Mar 2018 02:13:01 -0700
Message-ID: <20180312091303.121887-5-xiao.zhang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180312091303.121887-1-xiao.zhang@windriver.com>
References: <20180312091303.121887-1-xiao.zhang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/7] cairo: fix file conflict when multilib enabled
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
X-List-Received-Date: Mon, 12 Mar 2018 09:14:17 -0000
Content-Type: text/plain

Script file cairo-trace conflict between 32 and 64 bit packages.
Use update-alternatives to add base_libdir as suffix to avoid it.

Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
---
 meta/recipes-graphics/cairo/cairo_1.14.12.bb | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/cairo/cairo_1.14.12.bb b/meta/recipes-graphics/cairo/cairo_1.14.12.bb
index 075ca1ed34..1f2d68c0de 100644
--- a/meta/recipes-graphics/cairo/cairo_1.14.12.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.14.12.bb
@@ -10,6 +10,20 @@ SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.xz \
 SRC_URI[md5sum] = "9f0db9dbfca0966be8acd682e636d165"
 SRC_URI[sha256sum] = "8c90f00c500b2299c0a323dd9beead2a00353752b2092ead558139bd67f7bf16"
 
+inherit update-alternatives
+
+MULTILIB_SUFFIX = "${@d.getVar('base_libdir',1).split('/')[-1]}"
+
+ALTERNATIVE_${PN}-perf-utils="cairo-trace"
+ALTERNATIVE_LINK_NAME[cairo-trace] = "${bindir}/cairo-trace"
+ALTERNATIVE_TARGET[cairo-trace] = "${bindir}/cairo-trace-${MULTILIB_SUFFIX}"
+
+PACKAGE_PREPROCESS_FUNCS += "alternatives_rename"
+
+alternatives_rename() {
+       mv ${PKGD}${bindir}/cairo-trace ${PKGD}${bindir}/cairo-trace-${MULTILIB_SUFFIX}
+}
+
 PACKAGES =+ "cairo-gobject cairo-script-interpreter cairo-perf-utils"
 
 SUMMARY_${PN} = "The Cairo 2D vector graphics library"
@@ -35,7 +49,7 @@ FILES_${PN} = "${libdir}/libcairo.so.*"
 FILES_${PN}-dev += "${libdir}/cairo/*.so"
 FILES_${PN}-gobject = "${libdir}/libcairo-gobject.so.*"
 FILES_${PN}-script-interpreter = "${libdir}/libcairo-script-interpreter.so.*"
-FILES_${PN}-perf-utils = "${bindir}/cairo-trace ${libdir}/cairo/*.la ${libdir}/cairo/libcairo-trace.so.*"
+FILES_${PN}-perf-utils = "${bindir}/cairo-trace* ${libdir}/cairo/*.la ${libdir}/cairo/libcairo-trace.so.*"
 
 do_install_append () {
 	rm -rf ${D}${bindir}/cairo-sphinx
-- 
2.11.0


