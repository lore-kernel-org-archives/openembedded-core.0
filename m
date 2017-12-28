Return-Path: <Jibin.Xu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0091071C71
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Dec 2017 02:36:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vBS2a81m000074
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Dec 2017 18:36:09 -0800 (PST)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 27 Dec 2017 18:36:08 -0800
From: Jibin Xu <jibin.xu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Dec 2017 18:36:04 -0800
Message-ID: <20171228023604.79205-1-jibin.xu@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [PATCH] gio-module-cache : fix build warning when using qemu usermode
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
X-List-Received-Date: Thu, 28 Dec 2017 02:36:08 -0000
Content-Type: text/plain

gio-module-cache uses qemu usermode by default, but some architecture
such as Intel skylake does not support qemu usermode, this can
lead to a build warning as below:
"WARNING: The postinstall intercept hook 'update_gio_module_cache' failed".

Add a judgement of qemu usermode to fix the build warning.

Signed-off-by: Jibin Xu <jibin.xu@windriver.com>
---
 meta/classes/gio-module-cache.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/gio-module-cache.bbclass b/meta/classes/gio-module-cache.bbclass
index a8190b7b89..f211bad743 100644
--- a/meta/classes/gio-module-cache.bbclass
+++ b/meta/classes/gio-module-cache.bbclass
@@ -5,12 +5,16 @@ GIO_MODULE_PACKAGES ??= "${PN}"
 
 gio_module_cache_common() {
 if [ "x$D" != "x" ]; then
-    $INTERCEPT_DIR/postinst_intercept update_gio_module_cache ${PKG} \
+    if ${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'true','false', d)}; then
+        $INTERCEPT_DIR/postinst_intercept update_gio_module_cache ${PKG} \
             mlprefix=${MLPREFIX} \
             binprefix=${MLPREFIX} \
             libdir=${libdir} \
             base_libdir=${base_libdir} \
             bindir=${bindir}
+    else
+        exit 1
+    fi
 else
     ${libexecdir}/${MLPREFIX}gio-querymodules ${libdir}/gio/modules/
 fi
-- 
2.13.0


