Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6C570785B3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 03:36:33 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Aug 2017 20:36:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,381,1498546800"; d="scan'208";a="140774949"
Received: from rebeccas.png.intel.com ([172.30.199.118])
	by fmsmga006.fm.intel.com with ESMTP; 15 Aug 2017 20:36:34 -0700
From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Aug 2017 11:37:15 +0800
Message-Id: <1502854635-107377-4-git-send-email-rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1502854635-107377-1-git-send-email-rebecca.swee.fun.chang@intel.com>
References: <1502854635-107377-1-git-send-email-rebecca.swee.fun.chang@intel.com>
Subject: [PATCHv2 3/3] recipetool: create: replacing PV in SRCURI
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
X-List-Received-Date: Wed, 16 Aug 2017 03:36:33 -0000

From: Stanley Phoong <stanley.cheong.kwan.phoong@intel.com>

During recipe creation, it seems that the automation for replacing
${PV} at the SRCURI for tag, (e.g mbed-tls-${PV}) is causing some
issue due to PV assuming it's a git source. A fix is implemented in
this patch to resolve this issue.

Signed-off-by: Stanley Phoong <stanley.cheong.kwan.phoong@intel.com>
---
 scripts/lib/recipetool/create.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index c16b61c..988739a 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -424,6 +424,7 @@ def create_recipe(args):
     srcrev = '${AUTOREV}'
     srcbranch = ''
     storeTagName = ''
+    pv_srcpv = False
 
     if os.path.isfile(source):
         source = 'file://%s' % os.path.abspath(source)
@@ -671,6 +672,7 @@ def create_recipe(args):
         lines_before.append('')
         lines_before.append('# Modify these as desired')
         lines_before.append('PV = "%s+git${SRCPV}"' % (realpv or '1.0'))
+        pv_srcpv = True
         if not args.autorev and srcrev == '${AUTOREV}':
             if os.path.exists(os.path.join(srctree, '.git')):
                 (stdout, _) = bb.process.run('git rev-parse HEAD', cwd=srctree)
@@ -797,7 +799,7 @@ def create_recipe(args):
                 skipblank = True
                 continue
         elif line.startswith('SRC_URI = '):
-            if realpv:
+            if realpv and not pv_srcpv:
                 line = line.replace(realpv, '${PV}')
         elif line.startswith('PV = '):
             if realpv:
-- 
2.7.4


