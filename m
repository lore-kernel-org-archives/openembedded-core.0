Return-Path: <xiao.zhang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 222F0788CF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2018 00:33:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w2C0X9uu032203
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Mar 2018 17:33:24 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Sun, 11 Mar 2018 17:32:20 -0700
From: Zhang Xiao <xiao.zhang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 11 Mar 2018 17:32:55 -0700
Message-ID: <20180312003256.40039-2-xiao.zhang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180312003256.40039-1-xiao.zhang@windriver.com>
References: <20180312003256.40039-1-xiao.zhang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] tiff: Fix multilib header conflict - tiffconf.h
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
X-List-Received-Date: Mon, 12 Mar 2018 00:33:33 -0000
Content-Type: text/plain

Header file conflict between 32-bit and 64-bit versions.

Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
---
 meta/recipes-multimedia/libtiff/tiff_4.0.9.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/libtiff/tiff_4.0.9.bb b/meta/recipes-multimedia/libtiff/tiff_4.0.9.bb
index 57bf7408d0..b8f895b143 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.0.9.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.0.9.bb
@@ -14,7 +14,7 @@ SRC_URI[sha256sum] = "6e7bdeec2c310734e734d19aae3a71ebe37a4d842e0e23dbb1b8921c00
 # exclude betas
 UPSTREAM_CHECK_REGEX = "tiff-(?P<pver>\d+(\.\d+)+).tar"
 
-inherit autotools
+inherit autotools multilib_header
 
 CACHED_CONFIGUREVARS = "ax_cv_check_gl_libgl=no"
 
@@ -45,4 +45,8 @@ PACKAGES =+ "tiffxx tiff-utils"
 FILES_tiffxx = "${libdir}/libtiffxx.so.*"
 FILES_tiff-utils = "${bindir}/*"
 
+do_install_append() {
+    oe_multilib_header tiffconf.h
+}
+
 BBCLASSEXTEND = "native"
-- 
2.11.0


