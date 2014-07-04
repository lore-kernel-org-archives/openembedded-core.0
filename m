Return-Path: <Ming.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3A5D762252
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Jul 2014 10:54:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s64AsYg1009090
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 4 Jul 2014 03:54:34 -0700 (PDT)
Received: from PEK-MLIU3-D1.corp.ad.wrs.com (128.224.163.186) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.169.1; Fri, 4 Jul 2014 03:54:33 -0700
From: Ming Liu <ming.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 4 Jul 2014 18:54:29 +0800
Message-ID: <1404471270-1536-1-git-send-email-ming.liu@windriver.com>
X-Mailer: git-send-email 1.8.4.1
MIME-Version: 1.0
Subject: [PATCH 1/2] libcroco: dont package /usr/bin/croco-0.6-config
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
X-List-Received-Date: Fri, 04 Jul 2014 10:54:38 -0000
Content-Type: text/plain

It's build time specific and should not be packaged, otherwise, it will
introduce conflicts among multilib build.

Signed-off-by: Ming Liu <ming.liu@windriver.com>
---
 meta/recipes-support/libcroco/libcroco_0.6.8.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/recipes-support/libcroco/libcroco_0.6.8.bb b/meta/recipes-support/libcroco/libcroco_0.6.8.bb
index 7d04265..a926a1c 100644
--- a/meta/recipes-support/libcroco/libcroco_0.6.8.bb
+++ b/meta/recipes-support/libcroco/libcroco_0.6.8.bb
@@ -19,3 +19,14 @@ GNOME_COMPRESS_TYPE = "xz"
 
 SRC_URI[archive.md5sum] = "767e73c4174f75b99695d4530fd9bb80"
 SRC_URI[archive.sha256sum] = "ea6e1b858c55219cefd7109756bff5bc1a774ba7a55f7d3ccd734d6b871b8570"
+
+#
+# Don't package croco-0.6-config, it's build time specific.
+# Otherwise, it would cause conflicts among multilib install. 
+#
+PACKAGE_PREPROCESS_FUNCS += "croco_package_preprocess"
+croco_package_preprocess () {
+	if [ -f ${PKGD}/${bindir}/croco-0.6-config ]; then
+		rm -f ${PKGD}/${bindir}/croco-0.6-config
+	fi
+}
-- 
1.8.4.1


