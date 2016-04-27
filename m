Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1D19C73281
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 13:07:08 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 27 Apr 2016 06:06:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,541,1455004800"; d="scan'208";a="793467172"
Received: from wlee9-mobl3.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.141.75])
	by orsmga003.jf.intel.com with ESMTP; 27 Apr 2016 06:06:54 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Apr 2016 01:06:18 +1200
Message-Id: <c830e5f8ddaad013fabcdc6a148def03f9456e05.1461762339.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1461762339.git.paul.eggleton@linux.intel.com>
References: <cover.1461762339.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1461762339.git.paul.eggleton@linux.intel.com>
References: <cover.1461762339.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] recipetool: create: fix picking up false npm package directories
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
X-List-Received-Date: Wed, 27 Apr 2016 13:07:08 -0000

It is possible for a Node.js module to have node_modules subdirectories
that contain no package.json file (e.g. iotivity-node has such a
directory). It appears these should simply be ignored, or else with the
way the current code works we will get errors later.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/package.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 2887689..252e32d 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -149,7 +149,7 @@ def npm_split_package_dirs(pkgdir):
                 if os.path.exists(pkgfile):
                     with open(pkgfile, 'r') as f:
                         data = json.loads(f.read())
-                packages[pkgname] = (relpth, data)
+                    packages[pkgname] = (relpth, data)
     # We want the main package for a module sorted *after* its subpackages
     # (so that it doesn't otherwise steal the files for the subpackage), so
     # this is a cheap way to do that whilst still having an otherwise
-- 
2.5.5


