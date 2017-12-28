Return-Path: <Jibin.Xu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 365FD7199A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Dec 2017 07:48:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vBS7mA6g024525
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Dec 2017 23:48:10 -0800 (PST)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 27 Dec 2017 23:48:10 -0800
From: Jibin Xu <jibin.xu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Dec 2017 23:47:52 -0800
Message-ID: <20171228074752.128561-1-jibin.xu@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [PATCH] fontcache : fix build warning when using qemu usermode
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
X-List-Received-Date: Thu, 28 Dec 2017 07:48:10 -0000
Content-Type: text/plain

fontcache uses qemu usermode by default, but some architecture
such as Intel skylake does not support qemu usermode, this can
lead to a build warning as below:
"WARNING: The postinstall intercept hook 'update_font_cache' failed".

Add a judgement of qemu usermode to fix the build warning.

Signed-off-by: Jibin Xu <jibin.xu@windriver.com>
---
 meta/classes/fontcache.bbclass | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/meta/classes/fontcache.bbclass b/meta/classes/fontcache.bbclass
index e76331131e..3eb868fa08 100644
--- a/meta/classes/fontcache.bbclass
+++ b/meta/classes/fontcache.bbclass
@@ -17,13 +17,17 @@ FONTCONFIG_CACHE_PARAMS ?= "-v"
 FONTCONFIG_CACHE_ENV ?= "FC_DEBUG=1"
 fontcache_common() {
 if [ -n "$D" ] ; then
-	$INTERCEPT_DIR/postinst_intercept update_font_cache ${PKG} mlprefix=${MLPREFIX} \
-		'bindir="${bindir}"' \
-		'libdir="${libdir}"' \
-		'base_libdir="${base_libdir}"' \
-		'fontconfigcachedir="${FONTCONFIG_CACHE_DIR}"' \
-		'fontconfigcacheparams="${FONTCONFIG_CACHE_PARAMS}"' \
-		'fontconfigcacheenv="${FONTCONFIG_CACHE_ENV}"'
+	if ${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'true','false', d)}; then
+		$INTERCEPT_DIR/postinst_intercept update_font_cache ${PKG} mlprefix=${MLPREFIX} \
+			'bindir="${bindir}"' \
+			'libdir="${libdir}"' \
+			'base_libdir="${base_libdir}"' \
+			'fontconfigcachedir="${FONTCONFIG_CACHE_DIR}"' \
+			'fontconfigcacheparams="${FONTCONFIG_CACHE_PARAMS}"' \
+			'fontconfigcacheenv="${FONTCONFIG_CACHE_ENV}"'
+	else
+		exit 1
+	fi
 else
 	${FONTCONFIG_CACHE_ENV} fc-cache ${FONTCONFIG_CACHE_PARAMS}
 fi
-- 
2.13.0


