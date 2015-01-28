Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E214B60017
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jan 2015 12:02:31 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 28 Jan 2015 03:58:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="446340539"
Received: from nnodonog-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.3.113])
	by FMSMGA003.fm.intel.com with ESMTP; 28 Jan 2015 03:48:46 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Jan 2015 12:02:26 +0000
Message-Id: <550991e8c7a1eaa1998ab7694293b26657fef9ee.1422446524.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1422446524.git.paul.eggleton@linux.intel.com>
References: <cover.1422446524.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1422446524.git.paul.eggleton@linux.intel.com>
References: <cover.1422446524.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] recipetool: replace version in S value
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
X-List-Received-Date: Wed, 28 Jan 2015 12:02:32 -0000

If a versioned recipe filename is specified, replace the version in the
value of S with ${PV} just as we do with SRC_URI to make future upgrades
of the recipe easier.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 6dba078..38f5ead 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -212,6 +212,8 @@ def create_recipe(args):
             # This would be the default, so we don't need to set S in the recipe
             srcsubdir = ''
     if srcsubdir:
+        if pv and pv not in 'git svn hg'.split():
+            srcsubdir = srcsubdir.replace(pv, '${PV}')
         lines_before.append('S = "${WORKDIR}/%s"' % srcsubdir)
         lines_before.append('')
 
-- 
1.9.3


