Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (unknown [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2F1966ABDB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 May 2014 18:13:07 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 23 May 2014 11:13:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,895,1392192000"; d="scan'208";a="536721472"
Received: from bidesilv-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.159])
	by fmsmga001.fm.intel.com with ESMTP; 23 May 2014 11:13:07 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 May 2014 19:12:57 +0100
Message-Id: <89dfa13b2e4c30f4cb8ee72618cad136c74d8b4f.1400868743.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <cover.1400868743.git.paul.eggleton@linux.intel.com>
References: <cover.1400868743.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1400868743.git.paul.eggleton@linux.intel.com>
References: <cover.1400868743.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/4] list-packageconfig-flags: filter out doc and defaultval varflags
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
X-List-Received-Date: Fri, 23 May 2014 18:13:08 -0000

These are generic flags and shouldn't be listed in the output of this
script.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/contrib/list-packageconfig-flags.py | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/scripts/contrib/list-packageconfig-flags.py b/scripts/contrib/list-packageconfig-flags.py
index 615f91f..3db4298 100755
--- a/scripts/contrib/list-packageconfig-flags.py
+++ b/scripts/contrib/list-packageconfig-flags.py
@@ -83,7 +83,10 @@ def get_recipesdata(bbhandler, preferred):
     data_dict = {}
     for fn in get_fnlist(bbhandler, pkg_pn, preferred):
         data = bb.cache.Cache.loadDataFull(fn, bbhandler.cooker.collection.get_file_appends(fn), bbhandler.config_data)
-        if data.getVarFlags("PACKAGECONFIG"):
+        flags = data.getVarFlags("PACKAGECONFIG")
+        flags.pop('doc', None)
+        flags.pop('defaultval', None)
+        if flags:
             data_dict[fn] = data
 
     return data_dict
@@ -94,6 +97,8 @@ def collect_pkgs(data_dict):
     pkg_dict = {}
     for fn in data_dict:
         pkgconfigflags = data_dict[fn].getVarFlags("PACKAGECONFIG")
+        pkgconfigflags.pop('doc', None)
+        pkgconfigflags.pop('defaultval', None)
         pkgname = data_dict[fn].getVar("P", True)
         pkg_dict[pkgname] = sorted(pkgconfigflags.keys())
 
@@ -105,9 +110,6 @@ def collect_flags(pkg_dict):
     flag_dict = {}
     for pkgname, flaglist in pkg_dict.iteritems():
         for flag in flaglist:
-            if flag == "defaultval":
-                continue
-
             if flag in flag_dict:
                 flag_dict[flag].append(pkgname)
             else:
@@ -153,7 +155,7 @@ def display_all(data_dict):
         print('PACKAGECONFIG %s' % packageconfig)
 
         for flag,flag_val in data_dict[fn].getVarFlags("PACKAGECONFIG").iteritems():
-            if flag == "defaultval":
+            if flag in ["defaultval", "doc"]:
                 continue
             print('PACKAGECONFIG[%s] %s' % (flag, flag_val))
         print ''
-- 
1.9.0


