Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 63B0D60621
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 11:19:16 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 18 Jan 2016 03:19:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,312,1449561600"; d="scan'208";a="635440019"
Received: from stan94-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.180.176])
	by FMSMGA003.fm.intel.com with ESMTP; 18 Jan 2016 03:19:15 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jan 2016 00:18:30 +1300
Message-Id: <2533254cf8415e1eaf73fbf074c9ab24fbd20a69.1453115842.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1453115842.git.paul.eggleton@linux.intel.com>
References: <cover.1453115842.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1453115842.git.paul.eggleton@linux.intel.com>
References: <cover.1453115842.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 05/10] recipetool: create: fix overzealous mapping of git URLs
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
X-List-Received-Date: Mon, 18 Jan 2016 11:19:16 -0000

The regex for detecting git URLs was unanchored, leading to it matching
where it shouldn't have. An example of where this went wrong was
http://taglib.github.io/releases/taglib-1.9.1.tar.gz.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 4f95d7e..1218a7d 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -140,7 +140,7 @@ def create_recipe(args):
             # Assume the archive contains the directory structure verbatim
             # so we need to extract to a subdirectory
             fetchuri += ';subdir=%s' % os.path.splitext(os.path.basename(urlparse.urlsplit(fetchuri).path))[0]
-        git_re = re.compile('(https?)://([^;]+\.git)(;.*)?')
+        git_re = re.compile('(https?)://([^;]+\.git)(;.*)?$')
         res = git_re.match(fetchuri)
         if res:
             # Need to switch the URI around so that the git fetcher is used
-- 
2.5.0


