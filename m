Return-Path: <gernot.hillier@siemens.com>
Received: from gecko.sbs.de (gecko.sbs.de [194.138.37.40])
	by mail.openembedded.org (Postfix) with ESMTP id A5EB377980
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 19:09:34 +0000 (UTC)
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id v3KJ9YjP015651
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 21:09:34 +0200
Received: from linux-mf4q.internal.hillier.de.hillier.de ([146.254.78.32])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id v3KJ8Yuh007889;
	Thu, 20 Apr 2017 21:09:34 +0200
From: Gernot Hillier <gernot.hillier@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Apr 2017 21:08:14 +0200
Message-Id: <20170420190815.15000-2-gernot.hillier@siemens.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170420190815.15000-1-gernot.hillier@siemens.com>
References: <20170420190815.15000-1-gernot.hillier@siemens.com>
Subject: [PATCH v3 1/2] tcf-agent: fix machine setting for arm64 build
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
X-List-Received-Date: Thu, 20 Apr 2017 19:09:35 -0000

tcf-agent uses "a64", not "aarch64", see agent/Makefile.inc. This fix
allows to re-enable features like SERVICE_Breakpoints and SERVICE_
MemoryMap on arm64.

Signed-off-by: Gernot Hillier <gernot.hillier@siemens.com>
---
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
index e5e41f148e..cd0081ac16 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
@@ -30,7 +30,7 @@ INITSCRIPT_NAME = "tcf-agent"
 INITSCRIPT_PARAMS = "start 99 3 5 . stop 20 0 1 2 6 ."
 
 # mangling needed for make
-MAKE_ARCH = "`echo ${TARGET_ARCH} | sed s,i.86,i686,`"
+MAKE_ARCH = "`echo ${TARGET_ARCH} | sed s,i.86,i686, | sed s,aarch64,a64,`"
 MAKE_OS = "`echo ${TARGET_OS} | sed s,^linux.*,GNU/Linux,`"
 
 EXTRA_OEMAKE = "MACHINE=${MAKE_ARCH} OPSYS=${MAKE_OS} 'CC=${CC}' 'AR=${AR}'"
-- 
2.12.0


