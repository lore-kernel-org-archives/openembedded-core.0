Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id BD1146FF9B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 18:40:01 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP; 10 Mar 2016 10:34:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,316,1455004800"; d="scan'208";a="63722032"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by fmsmga004.fm.intel.com with ESMTP; 10 Mar 2016 10:34:14 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Mar 2016 10:29:21 +0000
Message-Id: <700ba3c535628dbbfd9edf2c64569869e0cf9f03.1457604105.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1457604105.git.mariano.lopez@linux.intel.com>
References: <cover.1457604105.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1457604105.git.mariano.lopez@linux.intel.com>
References: <cover.1457604105.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 1/2] selftest/prservice.py: Sanitize package version when looking for stamp
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
X-List-Received-Date: Thu, 10 Mar 2016 18:40:02 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

Currently when using a git version the check for the stamp, using regex,
will fail because of plus sign in the version.

With this change the version is escaped before adding it to the regex.

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/selftest/prservice.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/prservice.py b/meta/lib/oeqa/selftest/prservice.py
index 66638de..1b9a510 100644
--- a/meta/lib/oeqa/selftest/prservice.py
+++ b/meta/lib/oeqa/selftest/prservice.py
@@ -27,7 +27,7 @@ class BitbakePrTests(oeSelfTest):
         package_stamps_path = "/".join(stampdata[:-1])
         stamps = []
         for stamp in os.listdir(package_stamps_path):
-            find_stamp = re.match("%s\.%s\.([a-z0-9]{32})" % (prefix, recipe_task), stamp)
+            find_stamp = re.match("%s\.%s\.([a-z0-9]{32})" % (re.escape(prefix), recipe_task), stamp)
             if find_stamp:
                 stamps.append(find_stamp.group(1))
         self.assertFalse(len(stamps) == 0, msg="Cound not find stamp for task %s for recipe %s" % (recipe_task, package_name))
-- 
2.6.2


