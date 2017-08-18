Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E9B7478466
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 07:31:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7I7VwOM011111
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 18 Aug 2017 00:31:58 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 18 Aug 2017 00:31:57 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>,
	<richard.purdie@linuxfoundation.org>
Date: Fri, 18 Aug 2017 03:31:52 -0400
Message-ID: <5655f2419fcd8869378b1f8a0ebcef27be631ef3.1503041246.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1503041246.git.hongxu.jia@windriver.com>
References: <cover.1503041246.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] logrotate: fix systemd service not found while multilib
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
X-List-Received-Date: Fri, 18 Aug 2017 07:31:59 -0000
Content-Type: text/plain

...
|ERROR: lib32-logrotate-3.12.3-r0 do_package: SYSTEMD_SERVICE_lib32-logrotate
value lib32-logrotate.service does not exist
|ERROR: lib32-logrotate-3.12.3-r0 do_package: Function failed:
systemd_populate_packages
...

The systemd sercie file should not be multilib expend.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-extended/logrotate/logrotate_3.12.3.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/logrotate/logrotate_3.12.3.bb b/meta/recipes-extended/logrotate/logrotate_3.12.3.bb
index 05705be..05c2ef1 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.12.3.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.12.3.bb
@@ -56,8 +56,8 @@ OS_NAME = "Linux"
 inherit autotools systemd
 
 SYSTEMD_SERVICE_${PN} = "\
-    ${PN}.service \
-    ${PN}.timer \
+    ${BPN}.service \
+    ${BPN}.timer \
 "
 
 LOGROTATE_SYSTEMD_TIMER_BASIS ?= "daily"
-- 
2.8.1


