Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1D5D5731ED
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Feb 2016 01:15:29 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 10 Feb 2016 17:15:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,428,1449561600"; d="scan'208";a="900462084"
Received: from pngang-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.182.110])
	by fmsmga001.fm.intel.com with ESMTP; 10 Feb 2016 17:15:28 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Feb 2016 14:13:34 +1300
Message-Id: <4c5b6e42393fdf520ae2ff06c954cef4f3dd6523.1455151881.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1455151881.git.paul.eggleton@linux.intel.com>
References: <cover.1455151881.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1455151881.git.paul.eggleton@linux.intel.com>
References: <cover.1455151881.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 09/11] recipetool: create: convert http git URLs that don't end in .git but contain /git/
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
X-List-Received-Date: Thu, 11 Feb 2016 01:15:29 -0000

When recipetool create is given a URL that starts with http(s):// and
contains /git/, such as the URLs at git.yoctoproject.org, it's fairly safe
to assume it's a git repository and not something that should be fetched
with wget, so rewrite the URL.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create.py | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index f6d7515..daf13fb 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -291,10 +291,12 @@ def supports_srcrev(uri):
 
 def reformat_git_uri(uri):
     '''Convert any http[s]://....git URI into git://...;protocol=http[s]'''
-    res = re.match('(https?)://([^;]+\.git)(;.*)?$', uri)
-    if res:
-        # Need to switch the URI around so that the git fetcher is used
-        return 'git://%s;protocol=%s%s' % (res.group(2), res.group(1), res.group(3) or '')
+    checkuri = uri.split(';', 1)[0]
+    if checkuri.endswith('.git') or '/git/' in checkuri:
+        res = re.match('(https?)://([^;]+(\.git)?)(;.*)?$', uri)
+        if res:
+            # Need to switch the URI around so that the git fetcher is used
+            return 'git://%s;protocol=%s%s' % (res.group(2), res.group(1), res.group(4) or '')
     return uri
 
 def create_recipe(args):
-- 
2.5.0


