Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 024817709E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Oct 2015 07:51:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t9U7oLl5024373
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Oct 2015 00:51:19 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.211) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Fri, 30 Oct 2015 00:50:21 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 30 Oct 2015 15:50:19 +0800
Message-ID: <f8f5893dae8e77dc271ecf1cd5d98f44adb75bf2.1446191361.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1446191361.git.Qi.Chen@windriver.com>
References: <cover.1446191361.git.Qi.Chen@windriver.com>
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
X-List-Received-Date: Fri, 30 Oct 2015 07:51:22 -0000
Content-Type: text/plain

Use immediate expansion for the assignment to avoid other classes modifying
variables like HOST_ARCH which changes the result. This happens in the
meta-environment recipe. It inherits cross-canadian which changes HOST_ARCH
from TARGET_ARCH to SDK_ARCH, resulting in wrong site config files in the
generated SDK.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/toolchain-scripts.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index d0b2b91..4427369 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -98,7 +98,7 @@ EOF
 }
 
 #we get the cached site config in the runtime
-TOOLCHAIN_CONFIGSITE_NOCACHE = "${@siteinfo_get_files(d, True)}"
+TOOLCHAIN_CONFIGSITE_NOCACHE := "${@siteinfo_get_files(d, True)}"
 TOOLCHAIN_CONFIGSITE_SYSROOTCACHE = "${STAGING_DIR}/${MLPREFIX}${MACHINE}/${target_datadir}/${TARGET_SYS}_config_site.d"
 TOOLCHAIN_NEED_CONFIGSITE_CACHE ??= "virtual/${MLPREFIX}libc ncurses"
 
-- 
1.9.1


