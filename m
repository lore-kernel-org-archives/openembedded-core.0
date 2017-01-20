Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 4EC6B71A54
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 03:21:20 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga104.fm.intel.com with ESMTP; 19 Jan 2017 19:21:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,257,1477983600"; d="scan'208";a="55150074"
Received: from zpchu5-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.128.210])
	by orsmga005.jf.intel.com with ESMTP; 19 Jan 2017 19:21:19 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 16:21:15 +1300
Message-Id: <94534d47178659433e69c63f0733d1b9a9dad87f.1484882455.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1484882455.git.paul.eggleton@linux.intel.com>
References: <cover.1484882455.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v2 1/1] oe-selftest: devtool: remove use of git -C
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
X-List-Received-Date: Fri, 20 Jan 2017 03:21:23 -0000

The -C option isn't available in versions of git older than 1.8.5,
and officially we only require git 1.8.3.1 or newer (and the latter is
the version you'll find on CentOS 7, so the test fails there). In any
case we can simply specify the working directory to runCmd() so just
do that instead.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/devtool.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index 887c1e6..dc3435f 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -461,7 +461,7 @@ class DevtoolTests(DevtoolBase):
         bitbake('mdadm -c package')
         check_line(manfile, 'antique pin sardine', 'man file not modified. man searched file path: %s' % manfile)
 
-        result = runCmd('git -C %s checkout -- %s' % (tempdir, modfile))
+        result = runCmd('git checkout -- %s' % modfile, cwd=tempdir)
         check_line(modfile, 'Linux Software RAID', 'man .in file not restored (git failed)')
 
         bitbake('mdadm -c package')
-- 
2.5.5


