Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C75E865CC7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jan 2018 08:11:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w0C8BXUm015238
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 12 Jan 2018 00:11:33 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 12 Jan 2018 00:11:32 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 12 Jan 2018 03:11:23 -0500
Message-ID: <2729c5290f3971e77f1a38a1658b7193df8f466f.1515744181.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1515744181.git.hongxu.jia@windriver.com>
References: <cover.1515744181.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/6] python-xcbgen: improve reproducibility
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
X-List-Received-Date: Fri, 12 Jan 2018 08:11:32 -0000
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


