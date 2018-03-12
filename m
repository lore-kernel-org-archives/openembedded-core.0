Return-Path: <xiao.zhang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4159A788E3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2018 09:14:08 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w2C9EA7x017359
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2018 02:14:10 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 12 Mar 2018 02:13:32 -0700
From: Zhang Xiao <xiao.zhang@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <mark.hatle@windriver.com>
Date: Mon, 12 Mar 2018 02:13:03 -0700
Message-ID: <20180312091303.121887-7-xiao.zhang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180312091303.121887-1-xiao.zhang@windriver.com>
References: <20180312091303.121887-1-xiao.zhang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 7/7] icu: fix file conflict when multilib enabled
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
X-List-Received-Date: Mon, 12 Mar 2018 09:14:09 -0000
Content-Type: text/plain

Script icu-config conflicts between 32 and 64 bit packages.
Use update-alternatives to add base_libdir as suffix to avoid it.

Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
---
 meta/recipes-support/icu/icu.inc | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/icu/icu.inc b/meta/recipes-support/icu/icu.inc
index 983118cd61..5dc4e1dbb9 100644
--- a/meta/recipes-support/icu/icu.inc
+++ b/meta/recipes-support/icu/icu.inc
@@ -19,7 +19,19 @@ BINCONFIG = "${bindir}/icu-config"
 
 ICU_MAJOR_VER = "${@d.getVar('PV').split('.')[0]}"
 
-inherit autotools pkgconfig binconfig
+inherit autotools pkgconfig binconfig update-alternatives
+
+MULTILIB_SUFFIX = "${@d.getVar('base_libdir',1).split('/')[-1]}"
+
+ALTERNATIVE_${PN}-dev = "icu-config"
+ALTERNATIVE_LINK_NAME[icu-config] = "${bindir}/icu-config"
+ALTERNATIVE_TARGET[icu-config] = "${bindir}/icu-config-${MULTILIB_SUFFIX}"
+
+PACKAGE_PREPROCESS_FUNCS += "alternatives_rename"
+
+alternatives_rename() {
+    mv ${PKGD}/${bindir}/icu-config ${PKGD}/${bindir}/icu-config-${MULTILIB_SUFFIX}
+}
 
 # ICU needs the native build directory as an argument to its --with-cross-build option when
 # cross-compiling. Taken the situation that different builds may share a common sstate-cache
@@ -76,7 +88,7 @@ do_install_append_class-target() {
 
 PACKAGES =+ "libicudata libicuuc libicui18n libicutu libicuio"
 
-FILES_${PN}-dev += "${libdir}/${BPN}/"
+FILES_${PN}-dev += "${libdir}/${BPN}/ ${bindir}/icu-config-${MULTILIB_SUFFIX}"
 
 FILES_libicudata = "${libdir}/libicudata.so.*"
 FILES_libicuuc = "${libdir}/libicuuc.so.*"
-- 
2.11.0


