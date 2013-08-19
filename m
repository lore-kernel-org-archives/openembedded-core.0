Return-Path: <morphis@gravedo.de>
Received: from gravedo.de (gravedo.de [85.214.79.159])
	by mail.openembedded.org (Postfix) with ESMTP id 8614C69686
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2013 16:04:31 +0000 (UTC)
Received: by gravedo.de (Postfix, from userid 5001)
	id D24363B34559; Mon, 19 Aug 2013 18:04:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h1108419.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00,
	URIBL_BLOCKED autolearn=unavailable version=3.3.1
Received: from localhost (dslb-088-070-141-046.pools.arcor-ip.net
	[88.70.141.46]) by gravedo.de (Postfix) with ESMTPSA id 486123B34553;
	Mon, 19 Aug 2013 18:04:28 +0200 (CEST)
From: Simon Busch <morphis@gravedo.de>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Aug 2013 18:04:23 +0200
Message-Id: <1376928263-9092-1-git-send-email-morphis@gravedo.de>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] mesa: add PACKAGECONFIG_DISTRO variable for distro specific options
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
X-List-Received-Date: Mon, 19 Aug 2013 16:04:31 -0000

In some cases as distribution just wants to extend the default PACKAGECONFIG instead of
rewriting it completely. Therefor having a PACKAGECONFIG_DISTRO variable which is empty
by default and included in PACKAGECONFIG helps a lot.

Signed-off-by: Simon Busch <morphis@gravedo.de>
---
 meta/recipes-graphics/mesa/mesa.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 447e186..2875158 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -23,9 +23,11 @@ inherit autotools pkgconfig pythonnative gettext
 
 EXTRA_OECONF = "--enable-shared-glapi"
 
+PACKAGECONFIG_DISTRO ??= ""
 PACKAGECONFIG ??= "egl gles dri \
 		${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}\
 		${@base_contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)}\
+		${PACKAGECONFIG_DISTRO} \
 		"
 
 X11_DEPS = "xf86driproto glproto virtual/libx11 libxext libxxf86vm libxdamage libxfixes"
-- 
1.8.1.2


