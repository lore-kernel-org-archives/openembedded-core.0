Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EBAF07C039
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 06:53:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x0O6rPfg001118
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2019 22:53:35 -0800
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 23 Jan 2019 22:53:14 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 23 Jan 2019 22:53:12 -0800
Message-ID: <98575b4e48e38c35309b6fa379976870eb48f681.1548312757.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1548312757.git.liezhi.yang@windriver.com>
References: <cover.1548312757.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] bitbake.conf: Add DEBUG_BUILD to vardeps
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
X-List-Received-Date: Thu, 24 Jan 2019 06:53:45 -0000
Content-Type: text/plain

Otherwise the recipe would not be rebuilt when enable/disable DEBUG_BUILD.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/conf/bitbake.conf | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 0bdcd04..b00a52b 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -609,8 +609,9 @@ DEBUG_FLAGS ?= "-g -feliminate-unused-debug-types ${DEBUG_PREFIX_MAP}"
 FULL_OPTIMIZATION = "-O2 -pipe ${DEBUG_FLAGS}"
 DEBUG_OPTIMIZATION = "-O -fno-omit-frame-pointer ${DEBUG_FLAGS} -pipe"
 SELECTED_OPTIMIZATION = "${@d.getVar(oe.utils.vartrue('DEBUG_BUILD', 'DEBUG_OPTIMIZATION', 'FULL_OPTIMIZATION', d))}"
-SELECTED_OPTIMIZATION[vardeps] += "FULL_OPTIMIZATION DEBUG_OPTIMIZATION"
+SELECTED_OPTIMIZATION[vardeps] += "FULL_OPTIMIZATION DEBUG_OPTIMIZATION DEBUG_BUILD"
 BUILD_OPTIMIZATION = "${@oe.utils.vartrue('DEBUG_BUILD', '-O -g -feliminate-unused-debug-types -fno-omit-frame-pointer', '-O2', d)} -pipe"
+BUILD_OPTIMIZATION[vardeps] += "DEBUG_BUILD"
 
 ##################################################################
 # Settings used by bitbake-layers.
-- 
2.10.2


