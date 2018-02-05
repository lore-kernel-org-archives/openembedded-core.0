Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9D2B578400
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Feb 2018 01:28:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w151SBGK001963
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Sun, 4 Feb 2018 17:28:11 -0800
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Sun, 4 Feb 2018 17:28:08 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 4 Feb 2018 20:27:59 -0500
Message-ID: <24ad9eb8ae60fe08a04140d25b123bea3dc4f3b4.1517793934.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1517793934.git.hongxu.jia@windriver.com>
References: <cover.1517793934.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/5] python-xcbgen: improve reproducibility
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
X-List-Received-Date: Mon, 05 Feb 2018 01:28:11 -0000
Content-Type: text/plain

Use relative path to generate .pyc files could remove build host
references which leads to non-reproducible builds.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb b/meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb
index bc04bc4..be6b1a0 100644
--- a/meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb
+++ b/meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb
@@ -36,5 +36,5 @@ do_install_append() {
     # Makefile's do_install creates .pyc files for python3, now also create
     # them for python2 so that they will be recorded by manifest, and can be
     # cleaned correctly.
-    python -m py_compile ${D}${libdir}/xcb-proto/xcbgen/*.py
+    (cd ${D}; python -m py_compile ./${libdir}/xcb-proto/xcbgen/*.py)
 }
-- 
2.8.1


