Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3F7F560770
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 08:29:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u8N8Tm3c015440
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 01:29:48 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.229) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Fri, 23 Sep 2016 01:29:46 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 23 Sep 2016 16:30:51 +0800
Message-ID: <b837a1b7714ef69601f5a12cbf5baf925dfb1a7b.1474619360.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1474619360.git.Qi.Chen@windriver.com>
References: <cover.1474619360.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] toolchain-script: use immediate expansion for TOOLCHAIN_CONFIGSITE_NOCACHE
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
X-List-Received-Date: Fri, 23 Sep 2016 08:29:48 -0000
Content-Type: text/plain

Use immediate expansion for the assignment to avoid other classes modifying
variables like HOST_ARCH which changes the result. This happens in the
meta-environment recipe. It inherits cross-canadian which changes HOST_ARCH
from TARGET_ARCH to SDK_ARCH, resulting in wrong site config files in the
generated SDK.

[YOCTO #10255]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/toolchain-scripts.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index 997ff88..8df0967 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -105,7 +105,7 @@ EOF
 }
 
 #we get the cached site config in the runtime
-TOOLCHAIN_CONFIGSITE_NOCACHE = "${@siteinfo_get_files(d)}"
+TOOLCHAIN_CONFIGSITE_NOCACHE := "${@siteinfo_get_files(d)}"
 TOOLCHAIN_CONFIGSITE_SYSROOTCACHE = "${STAGING_DIR}/${MLPREFIX}${MACHINE}/${target_datadir}/${TARGET_SYS}_config_site.d"
 TOOLCHAIN_NEED_CONFIGSITE_CACHE ??= "virtual/${MLPREFIX}libc ncurses"
 
-- 
1.9.1


