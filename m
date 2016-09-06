Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 669C77754D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Sep 2016 20:25:56 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u86KPukh016153
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Sep 2016 13:25:56 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Tue, 6 Sep 2016 13:25:56 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 6 Sep 2016 13:25:56 -0700
Message-ID: <1473193556-11790-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH 1/1] libwebp: do not assume armv7a has neon intrinsics
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
X-List-Received-Date: Tue, 06 Sep 2016 20:25:59 -0000
Content-Type: text/plain

configure incorrectly thinks -mfpu=neon is in CC for armv7a,
so defeat automatic neon detection.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/recipes-multimedia/webp/libwebp_0.5.1.bb |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-multimedia/webp/libwebp_0.5.1.bb b/meta/recipes-multimedia/webp/libwebp_0.5.1.bb
index 222bd56..2d86b4a 100644
--- a/meta/recipes-multimedia/webp/libwebp_0.5.1.bb
+++ b/meta/recipes-multimedia/webp/libwebp_0.5.1.bb
@@ -26,6 +26,9 @@ EXTRA_OECONF = " \
     --enable-libwebpdemux \
     --enable-threading \
 "
+# configure incorrectly believes that armv7a has -mfpu=neon
+#
+EXTRA_OECONF_append_armv7a = " --disable-neon"
 
 inherit autotools lib_package
 
-- 
1.7.9.5


