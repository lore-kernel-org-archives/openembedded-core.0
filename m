Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E3C93746A8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Sep 2018 01:59:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w8U1xYcX011592
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2018 18:59:35 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Sat, 29 Sep 2018 18:59:34 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 30 Sep 2018 09:59:33 +0800
Message-ID: <1538272773-298871-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] pango: fix ptest failed problem
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
X-List-Received-Date: Sun, 30 Sep 2018 01:59:34 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

disable-debug will cause compiling with G_DISABLE_ASSERT, but ptest need
it, so don't disable-debug when ptest is enabled.

ptest fail error:

Tests were compiled with G_DISABLE_ASSERT and are likely no-ops. Aborting.
FAIL: pango/test-font.test (Child process exited with code 1)
Running test: pango/testboundaries_ucd.test
Tests were compiled with G_DISABLE_ASSERT and are likely no-ops. Aborting.
FAIL: pango/testboundaries_ucd.test (Child process exited with code 1)
Running test: pango/testboundaries.test
Tests were compiled with G_DISABLE_ASSERT and are likely no-ops. Aborting.
FAIL: pango/testboundaries.test (Child process exited with code 1)
Running test: pango/testattributes.test
Tests were compiled with G_DISABLE_ASSERT and are likely no-ops. Aborting.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-graphics/pango/pango_1.42.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/pango/pango_1.42.4.bb b/meta/recipes-graphics/pango/pango_1.42.4.bb
index e73fd28..c680720 100644
--- a/meta/recipes-graphics/pango/pango_1.42.4.bb
+++ b/meta/recipes-graphics/pango/pango_1.42.4.bb
@@ -24,7 +24,7 @@ DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo h
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
 PACKAGECONFIG[x11] = "--with-xft,--without-xft,virtual/libx11 libxft"
 
-EXTRA_OECONF = "--disable-debug"
+EXTRA_OECONF = "${@bb.utils.contains('DISTRO_FEATURES', 'ptest',"","--disable-debug",d)}"
 
 LEAD_SONAME = "libpango-1.0*"
 LIBV = "1.8.0"
-- 
2.7.4


