Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1357465D6E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Oct 2015 17:20:07 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 08 Oct 2015 10:19:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,655,1437462000"; d="scan'208";a="576737817"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by FMSMGA003.fm.intel.com with ESMTP; 08 Oct 2015 10:19:46 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Oct 2015 09:11:55 +0000
Message-Id: <1444295515-4641-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Cc: alexander.kanevskiy@intel.com
Subject: [PATCH] lib/oe/distro_check: Remove '_proxy' on dict values used by urllib.open
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
X-List-Received-Date: Thu, 08 Oct 2015 17:20:08 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

There are two ways to pass the proxies values into urllib.open: exporting
the environment variables *_proxy and passing as dictionary into the
urllib.open call. The latter is currenty used and values should not have
the '_proxy' string, so removing it. Also, ignore uppercase proxies, these
are not taken into account by the library.

Tested on a network with proxy, adding 'inherit +="distrodata"' on local.conf
with the following commands

    for distrotask in distrodataall distro_checkall checklicenseall; do
        bitbake universe -c $distrotask
    done

[YOCTO #7567]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/lib/oe/distro_check.py | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oe/distro_check.py b/meta/lib/oe/distro_check.py
index b3419ce..f92cd2e 100644
--- a/meta/lib/oe/distro_check.py
+++ b/meta/lib/oe/distro_check.py
@@ -10,13 +10,8 @@ def create_socket(url, d):
 
 def get_proxies(d):
     import os
-    proxykeys = ['HTTP_PROXY', 'http_proxy',
-                 'HTTPS_PROXY', 'https_proxy',
-                 'FTP_PROXY', 'ftp_proxy',
-                 'FTPS_PROXY', 'ftps_proxy',
-                 'NO_PROXY', 'no_proxy',
-                 'ALL_PROXY', 'all_proxy']
-    proxyvalues = map(lambda key: d.getVar(key, True), proxykeys)
+    proxykeys = ['http', 'https', 'ftp', 'ftps', 'no', 'all']
+    proxyvalues = map(lambda key: d.getVar(key+'_proxy', True), proxykeys)
     return dict(zip(proxykeys, proxyvalues))
 
 def get_links_from_url(url, d):
-- 
1.8.4.5


