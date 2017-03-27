Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 8772A72F83
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 17:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490634157; x=1522170157;
	h=from:to:cc:subject:date:message-id;
	bh=tKvg0webRV/PgeF9zAT5/oJu5aXs0uTmzU+LNbiomF0=;
	b=dJk6fo0sVTkyo3ZQo1SHTofODk1oCjKlAEqHQFtg+4TQuLF+PA+agGlt
	tIy6OtLU4M9rGwQlTNA4Vwme0a1b1A==;
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Mar 2017 10:02:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,232,1486454400"; d="scan'208";a="79822535"
Received: from pequod.jf.intel.com ([10.54.74.23])
	by orsmga005.jf.intel.com with ESMTP; 27 Mar 2017 10:02:35 -0700
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Mar 2017 10:01:36 -0700
Message-Id: <20170327170136.2446-1-stephano.cetola@linux.intel.com>
X-Mailer: git-send-email 2.12.1
Subject: [PATCH] devtool: open kconfig fragment in binary mode
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
X-List-Received-Date: Mon, 27 Mar 2017 17:02:35 -0000

When devtool writes to the kconfig fragment, it writes the output of
the diff command returned from pipe.communicate(). This function
returns binary objects. We should open the kconfig fragment file in
binary mode if we expect to write binary objects to it.

[YOCTO #11171]

Signed-off-by: Stephano Cetola <stephano.cetola@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 07c1400388..ffca2c9ec4 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1223,7 +1223,7 @@ def _create_kconfig_diff(srctree, rd, outfile):
         stdout, stderr = pipe.communicate()
         if pipe.returncode == 1:
             logger.info("Updating config fragment %s" % outfile)
-            with open(outfile, 'w') as fobj:
+            with open(outfile, 'wb') as fobj:
                 fobj.write(stdout)
         elif pipe.returncode == 0:
             logger.info("Would remove config fragment %s" % outfile)
-- 
2.12.1


