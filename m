Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id AEA11758C4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 17:23:39 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 17 Jun 2015 10:23:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,634,1427785200"; d="scan'208";a="729357425"
Received: from apulli-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.1.212])
	by fmsmga001.fm.intel.com with ESMTP; 17 Jun 2015 10:23:39 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jun 2015 18:23:26 +0100
Message-Id: <07949b25c11ecc849e968a2d47fe5f0106480abc.1434559829.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1434559829.git.paul.eggleton@linux.intel.com>
References: <cover.1434559829.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1434559829.git.paul.eggleton@linux.intel.com>
References: <cover.1434559829.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/5] lib/oeqa/utils/commands: ensure get_bb_var() works when value contains =
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
X-List-Received-Date: Wed, 17 Jun 2015 17:23:41 -0000

Only split on the first equals character so that values that contain
equals characters (such as FAKEROOTENV) can be retrieved.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/utils/commands.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index dc8a983..1be7bed 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -141,7 +141,7 @@ def get_bb_var(var, target=None, postconfig=None):
     lastline = None
     for line in bbenv.splitlines():
         if re.search("^(export )?%s=" % var, line):
-            val = line.split('=')[1]
+            val = line.split('=', 1)[1]
             val = val.strip('\"')
             break
         elif re.match("unset %s$" % var, line):
-- 
2.1.0


