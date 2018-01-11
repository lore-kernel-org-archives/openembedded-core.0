Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 2CA5378840
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jan 2018 15:00:51 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Jan 2018 07:00:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,344,1511856000"; d="scan'208";a="192927000"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga005.jf.intel.com with ESMTP; 11 Jan 2018 07:00:52 -0800
From: rebecca.swee.fun.chang@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Jan 2018 22:55:21 +0800
Message-Id: <9abfafc4acf328f7d4de83fe2efcc191dcdc604e.1515681706.git.rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <cover.1515681706.git.rebecca.swee.fun.chang@intel.com>
References: <cover.1515681706.git.rebecca.swee.fun.chang@intel.com>
Subject: [PATCHv2 3/5] scripts/wic: fix error of import wic module in eSDK environment
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
X-List-Received-Date: Thu, 11 Jan 2018 15:00:51 -0000

From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>

wic modules in scripts/lib/ are needed for wic to work, but path to
the python module is not exported in eSDK environment and we were
using an absolutized path of wic script within the sysroots.

We now changed to use real script path instead, where the wic modules
are located. This will also resolved the tracebacks found when running
wic from within the eSDK environment.

Traceback (most recent call last):
  File "/tmp/deploy/sdk/poky_sdk/sysroots/x86_64-pokysdk-linux/usr/bin/wic", line 58, in <module>
    from wic import WicError
ImportError: No module named 'wic'

Signed-off-by: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
---
 scripts/wic | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/wic b/scripts/wic
index 293a216d71d..d9bea228ad5 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -40,7 +40,7 @@ from collections import namedtuple
 from distutils import spawn
 
 # External modules
-scripts_path = os.path.abspath(os.path.dirname(__file__))
+scripts_path = os.path.dirname(os.path.realpath(__file__))
 lib_path = scripts_path + '/lib'
 sys.path.insert(0, lib_path)
 import scriptpath
-- 
2.15.0


