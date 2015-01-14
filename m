Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 10C99725F6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jan 2015 08:47:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0E8lehO003225
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jan 2015 00:47:40 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 14 Jan 2015 00:47:39 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Jan 2015 00:47:14 -0800
Message-ID: <cbf45f8798c0abbdf07a34f4fe6c2a5e13d564b1.1421225218.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1421225218.git.liezhi.yang@windriver.com>
References: <cover.1421225218.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 03/27] ghostscript: fix B != S
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
X-List-Received-Date: Wed, 14 Jan 2015 08:47:47 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../ghostscript/ghostscript_9.15.bb                |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.15.bb b/meta/recipes-extended/ghostscript/ghostscript_9.15.bb
index ee5483c..850ed81 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.15.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.15.bb
@@ -34,6 +34,8 @@ SRC_URI_class-native = "${SRC_URI_BASE} \
 SRC_URI[md5sum] = "5a78ab0990ff6ec3a103576bc8777c46"
 SRC_URI[sha256sum] = "27f11e4fe5b89857ae745687281d1e4daf9681edc858a3f7e8e77ef09609777a"
 
+PR = "r1"
+
 EXTRA_OECONF = "--without-x --with-system-libtiff --without-jbig2dec \
                 --with-fontpath=${datadir}/fonts \
                 --without-libidn --with-cups-serverbin=${exec_prefix}/lib/cups \
@@ -58,7 +60,7 @@ EXTRA_OECONF_class-native = "--without-x --with-system-libtiff=no \
 CFLAGS += "-DHAVE_SYS_TIME_H=1"
 BUILD_CFLAGS += "-DHAVE_SYS_TIME_H=1"
 
-inherit autotools-brokensep
+inherit autotools
 
 do_configure_prepend () {
 	mkdir -p obj
@@ -80,8 +82,8 @@ do_configure_append () {
 
 do_install_append () {
     mkdir -p ${D}${datadir}/ghostscript/${PV}/
-    cp -r Resource ${D}${datadir}/ghostscript/${PV}/
-    cp -r iccprofiles ${D}${datadir}/ghostscript/${PV}/
+    cp -r ${S}/Resource ${D}${datadir}/ghostscript/${PV}/
+    cp -r ${S}/iccprofiles ${D}${datadir}/ghostscript/${PV}/
 }
 
 do_compile_class-native () {
-- 
1.7.9.5


