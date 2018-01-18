Return-Path: <amanda.r.brindle@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D156F7872C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jan 2018 23:47:37 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Jan 2018 15:47:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,379,1511856000"; d="scan'208";a="11278521"
Received: from arbrindl-dev.jf.intel.com ([10.7.199.57])
	by orsmga008.jf.intel.com with ESMTP; 18 Jan 2018 15:47:36 -0800
From: Amanda Brindle <amanda.r.brindle@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Jan 2018 15:45:24 -0800
Message-Id: <12c8206e65ab9f797d2da46eecfad7fad4aaafc2.1516318733.git.amanda.r.brindle@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1516318733.git.amanda.r.brindle@intel.com>
References: <cover.1516318733.git.amanda.r.brindle@intel.com>
Cc: paul.eggleton@linux.intel.com, Amanda Brindle <amanda.r.brindle@intel.com>
Subject: [PATCH 1/1] tinfoil.py: Check if BUILDDIR exists
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
X-List-Received-Date: Thu, 18 Jan 2018 23:47:38 -0000

Check if BUILDDIR exists in order to deterimine if a tinfoil using
script is running without having called oe-init-build-env (or similar).
If not, instruct user to initialise the build environment, and then
error out immediately. Before, tinfoil would hang for 30s before
erroring out.

Fixes [YOCTO #12096]

Signed-off-by: Amanda Brindle <amanda.r.brindle@intel.com>
---
 bitbake/lib/bb/tinfoil.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/bitbake/lib/bb/tinfoil.py b/bitbake/lib/bb/tinfoil.py
index 368264f..e156b47 100644
--- a/bitbake/lib/bb/tinfoil.py
+++ b/bitbake/lib/bb/tinfoil.py
@@ -372,6 +372,11 @@ class Tinfoil:
         """
         self.quiet = quiet
 
+        basepath = os.environ.get('BUILDDIR')
+        if not basepath:
+            print("Tinfoil can only be run after initialising the build environment (e.g. by using oe-init-build-env)")
+            sys.exit(1)
+
         if self.tracking:
             extrafeatures = [bb.cooker.CookerFeatures.BASEDATASTORE_TRACKING]
         else:
-- 
2.7.4


