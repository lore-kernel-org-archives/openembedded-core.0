Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E12D0731C6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Feb 2016 01:15:30 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 10 Feb 2016 17:15:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,428,1449561600"; d="scan'208";a="900462094"
Received: from pngang-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.182.110])
	by fmsmga001.fm.intel.com with ESMTP; 10 Feb 2016 17:15:30 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Feb 2016 14:13:35 +1300
Message-Id: <12623142e0c5e5cd3db6f0f68eb64147d6d0b799.1455151881.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1455151881.git.paul.eggleton@linux.intel.com>
References: <cover.1455151881.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1455151881.git.paul.eggleton@linux.intel.com>
References: <cover.1455151881.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 10/11] recipetool: create: set S when we set SRC_URI from local git repo
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
X-List-Received-Date: Thu, 11 Feb 2016 01:15:31 -0000

If you specify a local directory which happens to be a git repository
with an origin remote (and it is in fact remote), we can use that for
SRC_URI as implemented by OE-Core revision
b143d414846854dc8b3e0a47358daf5646eded38, however we also need to set S
if the recipe is going to be of any use fetching from that SRC_URI
later.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index daf13fb..3e4bab8 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -369,6 +369,7 @@ def create_recipe(args):
                     if len(splitline) > 1:
                         if splitline[0] == 'origin' and '://' in splitline[1]:
                             srcuri = reformat_git_uri(splitline[1])
+                            srcsubdir = 'git'
                             break
 
     if args.src_subdir:
-- 
2.5.0


