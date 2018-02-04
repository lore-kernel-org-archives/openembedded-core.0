Return-Path: <jan.siegmund0@hm.edu>
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de [129.187.255.138])
	by mail.openembedded.org (Postfix) with ESMTP id 894E678589
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Feb 2018 11:08:57 +0000 (UTC)
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 3zZ7JT5nWRzyWW;
	Sun,  4 Feb 2018 12:08:57 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.894
X-Spam-Level: 
X-Spam-Status: No, score=-2.894 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9,
	LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001, LRZ_ENVFROM_FROM_MATCH=0.001,
	LRZ_FROM_HOSTED_DOMAIN=0.001, LRZ_FROM_PHRASE=0.001,
	LRZ_FROM_PRE_SUR_PHRASE=0.001, LRZ_TO_SHORT=0.001]
	autolearn=no autolearn_force=no
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new,
	port 20024)
	with LMTP id RUULW2uYkzE9; Sun,  4 Feb 2018 12:08:57 +0100 (CET)
Received: from N752VX.cm.cablesurf.de (unknown
	[IPv6:2001:4c50:149:b900:c51f:62d8:6a67:304e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 3zZ7JS6KG0zyWR;
	Sun,  4 Feb 2018 12:08:56 +0100 (CET)
From: Jan Siegmund <jan.siegmund0@hm.edu>
To: openembedded-core@lists.openembedded.org
Date: Sun,  4 Feb 2018 12:08:48 +0100
Message-Id: <20180204110848.12720-1-jsiegmun@hm.edu>
X-Mailer: git-send-email 2.14.1
Cc: Jan Siegmund <jsiegmund@arri.de>
Subject: [PATCH v3] apt-native: Add libapt-pkg headers
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
X-List-Received-Date: Sun, 04 Feb 2018 11:08:57 -0000

From: Jan Siegmund <jsiegmund@arri.de>

Native tools were not able to use the headers of apt-pkg. This patch
adds the feature.
The headers were added from apt-pkg and apt-inst to the native recipe.
The shipped headers match the ones in the Ubuntu package libapt-pkg-dev.

Signed-off-by: Jan Siegmund <jsiegmund@arri.de>
---
 meta/recipes-devtools/apt/apt-native.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/apt/apt-native.inc b/meta/recipes-devtools/apt/apt-native.inc
index 68f1b3ce2c..ef232c1eb6 100644
--- a/meta/recipes-devtools/apt/apt-native.inc
+++ b/meta/recipes-devtools/apt/apt-native.inc
@@ -67,4 +67,10 @@ do_install_base () {
 	install -d ${D}${localstatedir}/cache/apt/archives/partial
 
 	install -d ${D}${localstatedir}/log/apt/
+
+	install -d ${D}${includedir}/apt-pkg
+	for h in `find ${S}/apt-pkg ${S}/apt-inst -name '*.h'`
+	do
+		install -m 0644 $h ${D}${includedir}/apt-pkg
+	done
 }
-- 
2.14.1


