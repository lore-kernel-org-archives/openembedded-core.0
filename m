Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CBACD76DE1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 07:54:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8U7sLWr003044
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 00:54:21 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Wed, 30 Sep 2015 00:54:20 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Sep 2015 15:47:18 +0800
Message-ID: <33c8de1f09eda9ac9c46466f1f44ae7fa650fa0b.1443599169.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.0.rc2.10.gf4d9753
In-Reply-To: <cover.1443599169.git.kai.kang@windriver.com>
References: <cover.1443599169.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] fontconfig: fix buildpaths QA check
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
X-List-Received-Date: Wed, 30 Sep 2015 07:54:23 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Variable Libs.private contains build path in file fontconfig.pc. It is
not right and fails buildpaths check.

Remove build path from fontconfig.pc to fix this issue.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-graphics/fontconfig/fontconfig_2.11.94.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.11.94.bb b/meta/recipes-graphics/fontconfig/fontconfig_2.11.94.bb
index 9bbff20..384a95d 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig_2.11.94.bb
+++ b/meta/recipes-graphics/fontconfig/fontconfig_2.11.94.bb
@@ -43,3 +43,7 @@ FONTCONFIG_CACHE_DIR ?= "${localstatedir}/cache/fontconfig"
 EXTRA_OECONF = " --disable-docs --with-default-fonts=${datadir}/fonts --with-cache-dir=${FONTCONFIG_CACHE_DIR}"
 
 BBCLASSEXTEND = "native"
+
+do_install_append() {
+    sed -i 's,${STAGING_DIR_HOST},,g' ${D}${libdir}/pkgconfig/fontconfig.pc
+}
-- 
2.6.0.rc2.10.gf4d9753


