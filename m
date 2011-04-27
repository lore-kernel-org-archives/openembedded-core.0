Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1QEwab-0002nn-CG
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 06:43:01 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 26 Apr 2011 21:40:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,272,1301900400"; d="scan'208";a="684492337"
Received: from kyu3-dev32.bj.intel.com (HELO localhost) ([10.238.153.187])
	by fmsmga002.fm.intel.com with ESMTP; 26 Apr 2011 21:40:27 -0700
Message-Id: <73f9675c0e2ea187dafb85330f3e0f6c4902add8.1303879603.git.ke.yu@intel.com>
In-Reply-To: <cover.1303879603.git.ke.yu@intel.com>
References: <cover.1303879603.git.ke.yu@intel.com>
Old-Date: Mon, 18 Apr 2011 13:53:53 +0800
Date: Wed, 27 Apr 2011 12:48:22 +0800
To: openembedded-core@lists.openembedded.org
From: Yu Ke <ke.yu@intel.com>
Subject: [PATCH 1/1] git fetcher: make tag back to work, fix Yocto bug 972
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Apr 2011 04:43:01 -0000

From: Yu Ke <ke.yu@intel.com>

In current git fetcher, tag does not work due to commit http://git.pokylinux.org/cgit/cgit.cgi/poky/commit/?id=5920e85c561624e657c126df58f5c378a8950bbc. Tag is not in sha256 form, so it will be treated invalid, and silently replaced by latest revision.

To fix it, this patch treat tag name as branches name, thus it will be handled correctly later. Thanks Richard for reviewing and proposing the better approach.

Fix [YOCTO #972]

CC: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Yu Ke <ke.yu@intel.com>
---
 bitbake/lib/bb/fetch2/git.py |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/bitbake/lib/bb/fetch2/git.py b/bitbake/lib/bb/fetch2/git.py
index d462acf..811acbf 100644
--- a/bitbake/lib/bb/fetch2/git.py
+++ b/bitbake/lib/bb/fetch2/git.py
@@ -81,6 +81,7 @@ class Git(FetchMethod):
         for name in ud.names:
             # Ensure anything that doesn't look like a sha256 checksum/revision is translated into one
             if not ud.revisions[name] or len(ud.revisions[name]) != 40  or (False in [c in "abcdef0123456789" for c in ud.revisions[name]]):
+                ud.branches[name] = ud.revisions[name]
                 ud.revisions[name] = self.latest_revision(ud.url, ud, d, name)
 
     def localpath(self, url, ud, d):
-- 
1.7.0.4



