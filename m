Return-Path: <edwin.plauchu.camacho@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 9DCD7605BB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 May 2016 16:55:10 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 09 May 2016 09:55:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,601,1455004800"; d="scan'208";a="949361275"
Received: from pianodaemon-contraption.zpn.intel.com ([10.219.128.59])
	by orsmga001.jf.intel.com with ESMTP; 09 May 2016 09:55:09 -0700
From: edwin.plauchu.camacho@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 May 2016 11:55:15 -0500
Message-Id: <1462812915-14974-1-git-send-email-edwin.plauchu.camacho@linux.intel.com>
X-Mailer: git-send-email 1.9.1
Cc: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
Subject: [PATCH] distro_check: Allows to use proxy vars of OS env
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
X-List-Received-Date: Mon, 09 May 2016 16:55:12 -0000

From: Edwin Plauchu <edwin.plauchu.camacho@intel.com>

This improve allows to fetch values from OS env. Covering an scenario where proxy variables have no value within data storage.

Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
---
 meta/lib/oe/distro_check.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/distro_check.py b/meta/lib/oe/distro_check.py
index 8655a6f..6e87323 100644
--- a/meta/lib/oe/distro_check.py
+++ b/meta/lib/oe/distro_check.py
@@ -11,7 +11,7 @@ def create_socket(url, d):
 def get_proxies(d):
     proxies = {}
     for key in ['http', 'https', 'ftp', 'ftps', 'no', 'all']:
-        proxy = d.getVar(key + '_proxy', True)
+        proxy = os.environ.get( key + '_proxy' ) or d.getVar(key + '_proxy', True)
         if proxy:
             proxies[key] = proxy
     return proxies
-- 
1.9.1


