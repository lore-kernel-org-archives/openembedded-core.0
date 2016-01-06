Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E40A160588
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jan 2016 11:16:31 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 06 Jan 2016 03:16:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,528,1444719600"; d="scan'208";a="875594253"
Received: from ngochun1-mobl.ccr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.145.179])
	by fmsmga001.fm.intel.com with ESMTP; 06 Jan 2016 03:16:30 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jan 2016 00:15:42 +1300
Message-Id: <7517fe2774dfaf565382c07e82b160059b849d88.1452078721.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1452078721.git.paul.eggleton@linux.intel.com>
References: <cover.1452078721.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1452078721.git.paul.eggleton@linux.intel.com>
References: <cover.1452078721.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 01/14] scripts/oe-publish-sdk: add missing call to git update-server-info
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
X-List-Received-Date: Wed, 06 Jan 2016 11:16:32 -0000

We need to call git update-server-info here on the created repository or
we can't share it over plain http as we need to be able to for the
update process to function as currently implemented.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/oe-publish-sdk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/oe-publish-sdk b/scripts/oe-publish-sdk
index c8c79c2..9e4f1bf 100755
--- a/scripts/oe-publish-sdk
+++ b/scripts/oe-publish-sdk
@@ -102,9 +102,9 @@ def publish(args):
 
     # Setting up the git repo
     if not is_remote:
-        cmd = 'set -e; mkdir -p %s/layers; cd %s/layers; if [ ! -e .git ]; then git init .; mv .git/hooks/post-update.sample .git/hooks/post-update; fi; git add -A .; git commit -q -m "init repo" || true;' % (destination, destination)
+        cmd = 'set -e; mkdir -p %s/layers; cd %s/layers; if [ ! -e .git ]; then git init .; mv .git/hooks/post-update.sample .git/hooks/post-update; fi; git add -A .; git commit -q -m "init repo" || true; git update-server-info' % (destination, destination)
     else:
-        cmd = "ssh %s 'set -e; mkdir-p %s/layers; cd %s/layers; if [ ! -e .git ]; then git init .; mv .git/hooks/post-update.sample .git/hooks/post-update; fi; git add -A .; git commit -q -m \"init repo\" || true;'" % (host, destdir, destdir)
+        cmd = "ssh %s 'set -e; mkdir-p %s/layers; cd %s/layers; if [ ! -e .git ]; then git init .; mv .git/hooks/post-update.sample .git/hooks/post-update; fi; git add -A .; git commit -q -m \"init repo\" || true; git update-server-info'" % (host, destdir, destdir)
     ret = subprocess.call(cmd, shell=True)
     if ret == 0:
         logger.info('SDK published successfully')
-- 
2.5.0


