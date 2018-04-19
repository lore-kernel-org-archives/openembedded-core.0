Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 48FA072EED
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Apr 2018 10:18:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w3JAI78T027141
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Apr 2018 03:18:07 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 19 Apr 2018 03:18:06 -0700
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Apr 2018 03:18:06 -0700
Message-ID: <20180419101806.125994-1-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] npth: fix multilib header conflict-npth.h
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
X-List-Received-Date: Thu, 19 Apr 2018 10:18:07 -0000
Content-Type: text/plain

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 meta/recipes-support/npth/npth_1.5.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/npth/npth_1.5.bb b/meta/recipes-support/npth/npth_1.5.bb
index e7db6ae1b4..8f42a1a2f9 100644
--- a/meta/recipes-support/npth/npth_1.5.bb
+++ b/meta/recipes-support/npth/npth_1.5.bb
@@ -15,9 +15,13 @@ SRC_URI[sha256sum] = "294a690c1f537b92ed829d867bee537e46be93fbd60b16c04630fbbfcd
 
 BINCONFIG = "${bindir}/npth-config"
 
-inherit autotools binconfig-disabled
+inherit autotools binconfig-disabled multilib_header 
 
 FILES_${PN} = "${libdir}/libnpth.so.*"
 FILES_${PN}-dev += "${bindir}/npth-config"
 
+do_install_append() {
+    oe_multilib_header npth.h
+}
+
 BBCLASSEXTEND = "native"
-- 
2.11.0


