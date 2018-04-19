Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1D190745E7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Apr 2018 10:18:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w3JAIFDY027693
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Apr 2018 03:18:15 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 19 Apr 2018 03:18:15 -0700
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 19 Apr 2018 03:18:15 -0700
Message-ID: <20180419101815.126167-1-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] liburcu: fix multilib header conflict-urcu/config.h
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
X-List-Received-Date: Thu, 19 Apr 2018 10:18:15 -0000
Content-Type: text/plain

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 meta/recipes-support/liburcu/liburcu_0.10.1.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/liburcu/liburcu_0.10.1.bb b/meta/recipes-support/liburcu/liburcu_0.10.1.bb
index 459c04a7a1..9d5b28b33d 100644
--- a/meta/recipes-support/liburcu/liburcu_0.10.1.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.10.1.bb
@@ -14,6 +14,10 @@ SRC_URI[md5sum] = "281a2f92fdc39c40ad6b76f6631fdbd7"
 SRC_URI[sha256sum] = "9c09220be4435dc27fcd22d291707b94b97f159e0c442fbcd60c168f8f79eb06"
 
 S = "${WORKDIR}/userspace-rcu-${PV}"
-inherit autotools
+inherit autotools multilib_header
 
 CPPFLAGS_append_riscv64  = " -pthread -D_REENTRANT"
+
+do_install_append() {
+    oe_multilib_header urcu/config.h
+}
-- 
2.11.0


