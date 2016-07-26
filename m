Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 82112731CD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2016 02:58:19 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 25 Jul 2016 19:58:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,422,1464678000"; d="scan'208";a="1002452673"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.139.129])
	by orsmga001.jf.intel.com with ESMTP; 25 Jul 2016 19:58:19 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jul 2016 14:57:49 +1200
Message-Id: <126ef126a5a8c35225d0d7c4f07328fcf83a4f4d.1469501778.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1469501778.git.paul.eggleton@linux.intel.com>
References: <cover.1469501778.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1469501778.git.paul.eggleton@linux.intel.com>
References: <cover.1469501778.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] recipetool: create: fix greedy regex that broke support for github tarballs
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
X-List-Received-Date: Tue, 26 Jul 2016 02:58:19 -0000

The regex here needs to be anchored to the end or it'll match longer
URLs, which was exactly what I was trying to avoid. This regression was
introduced in OE-Core revision 7998dc3597657229507e5c140fceef1e485ac402.

Fixes [YOCTO #10023].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index f246028..8c399b3 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -324,7 +324,7 @@ def supports_srcrev(uri):
 def reformat_git_uri(uri):
     '''Convert any http[s]://....git URI into git://...;protocol=http[s]'''
     checkuri = uri.split(';', 1)[0]
-    if checkuri.endswith('.git') or '/git/' in checkuri or re.match('https?://github.com/[^/]+/[^/]+/?', checkuri):
+    if checkuri.endswith('.git') or '/git/' in checkuri or re.match('https?://github.com/[^/]+/[^/]+/?$', checkuri):
         res = re.match('(https?)://([^;]+(\.git)?)(;.*)?$', uri)
         if res:
             # Need to switch the URI around so that the git fetcher is used
-- 
2.5.5


