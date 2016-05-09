Return-Path: <edwin.plauchu.camacho@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id CCD017017D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 May 2016 16:21:51 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 09 May 2016 09:21:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,601,1455004800"; d="scan'208";a="699242145"
Received: from pianodaemon-contraption.zpn.intel.com ([10.219.128.59])
	by FMSMGA003.fm.intel.com with ESMTP; 09 May 2016 09:21:43 -0700
From: edwin.plauchu.camacho@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 May 2016 11:21:48 -0500
Message-Id: <1462810908-14676-1-git-send-email-edwin.plauchu.camacho@linux.intel.com>
X-Mailer: git-send-email 1.9.1
Cc: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
Subject: [PATCH] Allows to use proxy vars of OS env
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
X-List-Received-Date: Mon, 09 May 2016 16:21:52 -0000

From: Edwin Plauchu <edwin.plauchu.camacho@intel.com>

This improve allows to fetch values from OS env. Covering an scenario where proxy variables have no value within data storage.
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


