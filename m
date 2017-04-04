Return-Path: <brian.avery@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0609872F89
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Apr 2017 23:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491348074; x=1522884074;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=iBWpYmPRpbFOI91qxZYdRHbpzwBgPtKcSYW0Pf25RrQ=;
	b=VKeoMS2F/G8WGxvjE7QvTKPTAsSddTCRIaEhKwzSFFxh8xIP8jK2JNCJ
	xa9rMxD/EmJrklNHAZrhi/jucQgugQ==;
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Apr 2017 16:21:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,276,1486454400"; d="scan'208";a="83117961"
Received: from bavery-ws-desk.jf.intel.com ([10.54.74.5])
	by orsmga005.jf.intel.com with ESMTP; 04 Apr 2017 16:21:14 -0700
From: brian avery <brian.avery@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Apr 2017 16:23:24 -0700
Message-Id: <c96340523824500d490e2b31748ad3fa8aada5b3.1491347966.git.brian.avery@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1491347966.git.brian.avery@intel.com>
References: <cover.1491347966.git.brian.avery@intel.com>
Subject: [PATCH 1/1] devtool: point runqemu to correct native bindir
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
X-List-Received-Date: Tue, 04 Apr 2017 23:21:13 -0000

devtool/runqemu.py was relying on STAGING_BINDIR_NATIVE to find the host
tools it needed like qemu-system-<arch>.  In the post RSS world, this no
longer exists. This patch points it to
{STAGING_DIR}/{BUILD_ARCH}/{bindir_native}.

[YOCTO #11223]

Signed-off-by: brian avery <brian.avery@intel.com>
---
 scripts/lib/devtool/runqemu.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/runqemu.py b/scripts/lib/devtool/runqemu.py
index 641664e..e26cf28 100644
--- a/scripts/lib/devtool/runqemu.py
+++ b/scripts/lib/devtool/runqemu.py
@@ -32,7 +32,9 @@ def runqemu(args, config, basepath, workspace):
     tinfoil = setup_tinfoil(config_only=True, basepath=basepath)
     try:
         machine = tinfoil.config_data.getVar('MACHINE')
-        bindir_native = tinfoil.config_data.getVar('STAGING_BINDIR_NATIVE')
+        bindir_native = os.path.join(tinfoil.config_data.getVar('STAGING_DIR'),
+                                     tinfoil.config_data.getVar('BUILD_ARCH'),
+                                     tinfoil.config_data.getVar('bindir_native').lstrip(os.path.sep))
     finally:
         tinfoil.shutdown()
 
-- 
1.9.1


