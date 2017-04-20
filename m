Return-Path: <gernot.hillier@siemens.com>
X-Greylist: delayed 1076 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 20 Apr 2017 08:33:25 UTC
Received: from lizzard.sbs.de (lizzard.sbs.de [194.138.37.39])
	by mail.openembedded.org (Postfix) with ESMTP id BCCF871D31
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 08:33:25 +0000 (UTC)
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id v3K8FP2x001967
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 10:15:25 +0200
Received: from linux-mf4q.internal.hillier.de ([146.254.78.32])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id v3K8FOG1019232
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 10:15:24 +0200
To: openembedded-core@lists.openembedded.org
References: <c2cca2c5-c122-e738-0008-4ff3119259bb@siemens.com>
From: Gernot Hillier <gernot.hillier@siemens.com>
Message-ID: <603b4ff2-3bdd-4987-a4d5-5d79155db477@siemens.com>
Date: Thu, 20 Apr 2017 10:15:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <c2cca2c5-c122-e738-0008-4ff3119259bb@siemens.com>
Subject: [PATCH 1/2] tcf-agent: fix machine setting for arm64 build
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
X-List-Received-Date: Thu, 20 Apr 2017 08:33:26 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit


tcf-agent uses "a64", not "aarch64", see agent/Makefile.inc. This fix
allows to re-enable features like SERVICE_Breakpoints and SERVICE_
MemoryMap on arm64.

Signed-off-by: Gernot Hillier <gernot.hillier@siemens.com>
---
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
index e5e41f148e..cd0081ac16 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
@@ -30,7 +30,7 @@ INITSCRIPT_NAME = "tcf-agent"
 INITSCRIPT_PARAMS = "start 99 3 5 . stop 20 0 1 2 6 ."

 # mangling needed for make
-MAKE_ARCH = "`echo ${TARGET_ARCH} | sed s,i.86,i686,`"
+MAKE_ARCH = "`echo ${TARGET_ARCH} | sed s,i.86,i686, | sed s,aarch64,a64,`"
 MAKE_OS = "`echo ${TARGET_OS} | sed s,^linux.*,GNU/Linux,`"

 EXTRA_OEMAKE = "MACHINE=${MAKE_ARCH} OPSYS=${MAKE_OS} 'CC=${CC}'
'AR=${AR}'"
-- 
2.12.0

