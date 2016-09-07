Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4DC6A7700A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Sep 2016 21:44:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u87LiwCA016006
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Sep 2016 14:44:58 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 7 Sep 2016 14:44:58 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 7 Sep 2016 14:44:58 -0700
Message-ID: <1473284698-19120-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH 1/1][v2] libwebp: sepcify neon availability for arm
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
X-List-Received-Date: Wed, 07 Sep 2016 21:44:59 -0000
Content-Type: text/plain

Defeat automatic neon detection.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/recipes-multimedia/webp/libwebp_0.5.1.bb |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-multimedia/webp/libwebp_0.5.1.bb b/meta/recipes-multimedia/webp/libwebp_0.5.1.bb
index 222bd56..b882db7 100644
--- a/meta/recipes-multimedia/webp/libwebp_0.5.1.bb
+++ b/meta/recipes-multimedia/webp/libwebp_0.5.1.bb
@@ -26,6 +26,11 @@ EXTRA_OECONF = " \
     --enable-libwebpdemux \
     --enable-threading \
 "
+# Do not trust configure to determine if neon is available.
+#
+EXTRA_OECONF_append_arm = " \
+    ${@bb.utils.contains("TUNE_FEATURES","neon","--enable-neon","--disable-neon",d)} \
+"
 
 inherit autotools lib_package
 
-- 
1.7.9.5


