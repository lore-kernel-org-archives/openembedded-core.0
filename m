Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1332F65E0C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 08:23:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7D8NEt0019304
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 01:23:14 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 13 Aug 2014 01:23:14 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Aug 2014 01:23:13 -0700
Message-ID: <7870042734abc804036f137ea34cabdb5601f2b5.1407918169.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1407918169.git.liezhi.yang@windriver.com>
References: <cover.1407918169.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] python-pygtk: fix native python path
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
X-List-Received-Date: Wed, 13 Aug 2014 08:23:17 -0000
Content-Type: text/plain

Fixed:
1) Set IMAGE_INSTALL_append = " python-pygtk-demo" in local.conf
2) $ bitbake core-image-minimal
[snip]
Computing transaction...error: Can't install python-pygtk-demo-2.24.0-r1@core2_64: no package provides /usr/bin/python-native/python
[snip]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../recipes-devtools/python/python-pygtk_2.24.0.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python-pygtk_2.24.0.bb b/meta/recipes-devtools/python/python-pygtk_2.24.0.bb
index 3dbef89..8fc194f 100644
--- a/meta/recipes-devtools/python/python-pygtk_2.24.0.bb
+++ b/meta/recipes-devtools/python/python-pygtk_2.24.0.bb
@@ -44,6 +44,7 @@ do_install_append() {
 	find ${D} -name "*.la"|xargs rm -f
 	rm -f ${D}/${bindir}/pygtk-codegen-2.0
 	rm -rf ${D}/${libdir}/pkgconfig
+	sed -i -e '1s|^#!.*python|#!/usr/bin/env python|' ${D}${bindir}/pygtk-demo
 }
 
 # dirty fix #2: fix build system paths leaking in
-- 
1.7.9.5


