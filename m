Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 2E23A78874
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jan 2018 05:46:50 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Jan 2018 21:46:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,343,1511856000"; 
   d="scan'208";a="8890784"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga008.fm.intel.com with ESMTP; 10 Jan 2018 21:46:50 -0800
From: rebecca.swee.fun.chang@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Jan 2018 13:41:13 +0800
Message-Id: <6de46ebf485e1bbe14a1cc38d10dac9e70144a3f.1515648396.git.rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1515648396.git.rebecca.swee.fun.chang@intel.com>
References: <cover.1515648396.git.rebecca.swee.fun.chang@intel.com>
Subject: [PATCH 3/5] scripts/wic: fix error of import wic module in eSDK environment
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
X-List-Received-Date: Thu, 11 Jan 2018 05:46:50 -0000

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
index 293a216..d9bea22 100755
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
2.7.4


