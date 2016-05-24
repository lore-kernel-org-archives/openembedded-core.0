Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id EC05065CBA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 04:19:38 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 23 May 2016 21:19:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,359,1459839600"; d="scan'208";a="983340970"
Received: from jchang2-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.174.130])
	by orsmga002.jf.intel.com with ESMTP; 23 May 2016 21:19:17 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 May 2016 16:18:50 +1200
Message-Id: <82db35e40ef7d801b96dc5ac0171085b9135b4a1.1464063465.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1464063465.git.paul.eggleton@linux.intel.com>
References: <cover.1464063465.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1464063465.git.paul.eggleton@linux.intel.com>
References: <cover.1464063465.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/3] devtool: upgrade: handle upgrading recipes with a versioned inc file
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
X-List-Received-Date: Tue, 24 May 2016 04:19:39 -0000

The gdb recipe in OE-Core has an inc file with the version in it;
since the inc file is pulled in with a "require ${PV}.inc", when
upgrading the recipe we need to also rename the inc file it will fail to
parse and the upgrade itself will fail.

Fixes [YOCTO #9574].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/upgrade.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index a085f78..e34234a 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -77,11 +77,19 @@ def _recipe_contains(rd, var):
 
 def _rename_recipe_dirs(oldpv, newpv, path):
     for root, dirs, files in os.walk(path):
+        # Rename directories with the version in their name
         for olddir in dirs:
             if olddir.find(oldpv) != -1:
                 newdir = olddir.replace(oldpv, newpv)
                 if olddir != newdir:
                     shutil.move(os.path.join(path, olddir), os.path.join(path, newdir))
+        # Rename any inc files with the version in their name (unusual, but possible)
+        for oldfile in files:
+            if oldfile.endswith('.inc'):
+                if oldfile.find(oldpv) != -1:
+                    newfile = oldfile.replace(oldpv, newpv)
+                    if oldfile != newfile:
+                        os.rename(os.path.join(path, oldfile), os.path.join(path, newfile))
 
 def _rename_recipe_file(oldrecipe, bpn, oldpv, newpv, path):
     oldrecipe = os.path.basename(oldrecipe)
-- 
2.5.5


