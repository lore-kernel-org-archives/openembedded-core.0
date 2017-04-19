Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 3BDF571B45
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 08:57:38 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP; 19 Apr 2017 01:57:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,220,1488873600"; d="scan'208";a="89627733"
Received: from nbayani-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.141.108])
	by orsmga005.jf.intel.com with ESMTP; 19 Apr 2017 01:57:37 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Apr 2017 20:57:27 +1200
Message-Id: <63ad928771459b7087ce69f5f372d159c02103f9.1492592223.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1492592223.git.paul.eggleton@linux.intel.com>
References: <cover.1492592223.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/3] runqemu: fix incorrect calls to get variable values
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
X-List-Received-Date: Wed, 19 Apr 2017 08:57:38 -0000

We were specifying a default parameter; the get() function defined here
does not take such a parameter. I appears this code had not been tested.
This fixes runqemu erroring out immediately when used within the eSDK.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/runqemu | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 3744c67..605bcf2 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -732,8 +732,8 @@ class BaseConfig(object):
                 # be able to call `bitbake -e`, then try:
                 # - get OE_TMPDIR from environment and guess paths based on it
                 # - get OECORE_NATIVE_SYSROOT from environment (for sdk)
-                tmpdir = self.get('OE_TMPDIR', None)
-                oecore_native_sysroot = self.get('OECORE_NATIVE_SYSROOT', None)
+                tmpdir = self.get('OE_TMPDIR')
+                oecore_native_sysroot = self.get('OECORE_NATIVE_SYSROOT')
                 if tmpdir:
                     logger.info('Setting STAGING_DIR_NATIVE and STAGING_BINDIR_NATIVE relative to OE_TMPDIR (%s)' % tmpdir)
                     hostos, _, _, _, machine = os.uname()
-- 
2.9.3


