Return-Path: <jan.siegmund0@hm.edu>
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de [129.187.255.137])
	by mail.openembedded.org (Postfix) with ESMTP id B10A078744
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Feb 2018 10:34:15 +0000 (UTC)
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
	by postout1.mail.lrz.de (Postfix) with ESMTP id 3zYVZw3nMbzyZb;
	Sat,  3 Feb 2018 11:34:16 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs51.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.894
X-Spam-Level: 
X-Spam-Status: No, score=-2.894 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9,
	LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001, LRZ_ENVFROM_FROM_MATCH=0.001,
	LRZ_FROM_HOSTED_DOMAIN=0.001, LRZ_FROM_PHRASE=0.001,
	LRZ_FROM_PRE_SUR_PHRASE=0.001, LRZ_TO_SHORT=0.001]
	autolearn=no autolearn_force=no
Received: from postout1.mail.lrz.de ([127.0.0.1])
	by lxmhs51.srv.lrz.de (lxmhs51.srv.lrz.de [127.0.0.1]) (amavisd-new,
	port 20024)
	with LMTP id xe6IoRpiAHqb; Sat,  3 Feb 2018 11:34:16 +0100 (CET)
Received: from N752VX.cm.cablesurf.de (unknown
	[IPv6:2001:4c50:149:b900:8452:6697:9aa2:dbec])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by postout1.mail.lrz.de (Postfix) with ESMTPSA id 3zYVZv6C1XzyZL;
	Sat,  3 Feb 2018 11:34:15 +0100 (CET)
From: Jan Siegmund <jan.siegmund0@hm.edu>
To: openembedded-core@lists.openembedded.org
Date: Sat,  3 Feb 2018 11:33:14 +0100
Message-Id: <20180203103314.2646-1-jsiegmun@hm.edu>
X-Mailer: git-send-email 2.14.1
Cc: Jan Siegmund <jsiegmund@arri.de>
Subject: [PATCH v2] apt-native: Add libapt-pkg headers
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
X-List-Received-Date: Sat, 03 Feb 2018 10:34:15 -0000

From: Jan Siegmund <jsiegmund@arri.de>

Native tools were not able to use the headers of apt-pkg. This patch
adds the feature.
The headers were added from apt-pkg and apt-inst to the native recipe.
The shipped headers match the ones in the Ubuntu package libapt-pkg-dev.

Signed-off-by: Jan Siegmund <jsiegmund@arri.de>
---
 meta/recipes-devtools/apt/apt-native.inc | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-devtools/apt/apt-native.inc b/meta/recipes-devtools/apt/apt-native.inc
index 68f1b3ce2c..d82ffcc59f 100644
--- a/meta/recipes-devtools/apt/apt-native.inc
+++ b/meta/recipes-devtools/apt/apt-native.inc
@@ -35,6 +35,8 @@ python do_install_config () {
         outfile.close()
 }
 
+FILES_${PN} += "${includedir}"
+
 do_install_base () {
 	install -d ${D}${bindir}
 	install -m 0755 bin/apt-cdrom ${D}${bindir}/
@@ -67,4 +69,10 @@ do_install_base () {
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


