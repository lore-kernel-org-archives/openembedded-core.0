Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A8BE5737A3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 02:39:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6G2dGlH022279
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jul 2015 19:39:17 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.235.1; Wed, 15 Jul 2015 19:39:16 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 16 Jul 2015 10:37:39 +0800
Message-ID: <7b235830abc716e0ce3123aac59fe54ae2731f7c.1437014008.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1437014008.git.kai.kang@windriver.com>
References: <cover.1437014008.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Subject: [PATCH 1/1] fontconfig: fix buildpaths QA check
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
X-List-Received-Date: Thu, 16 Jul 2015 02:39:18 -0000
Content-Type: text/plain

Variable Libs.private contains build path in file fontconfig.pc. It
fails buildpaths check and that is not the right value when use
pkg-config with option '--static'.

Remove build path from fontconfig.pc to fix it.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-graphics/fontconfig/fontconfig_2.11.93.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.11.93.bb b/meta/recipes-graphics/fontconfig/fontconfig_2.11.93.bb
index e024adb..081ce1f 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig_2.11.93.bb
+++ b/meta/recipes-graphics/fontconfig/fontconfig_2.11.93.bb
@@ -43,3 +43,7 @@ FONTCONFIG_CACHE_DIR ?= "${localstatedir}/cache/fontconfig"
 EXTRA_OECONF = " --disable-docs --with-default-fonts=${datadir}/fonts --with-cache-dir=${FONTCONFIG_CACHE_DIR}"
 
 BBCLASSEXTEND = "native"
+
+do_install_append() {
+    sed -i 's,${STAGING_DIR_HOST},,g' ${D}${libdir}/pkgconfig/fontconfig.pc
+}
-- 
1.9.1


