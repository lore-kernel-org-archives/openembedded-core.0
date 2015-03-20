Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id EB07473AAC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2015 11:22:57 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 20 Mar 2015 04:23:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,436,1422950400"; d="scan'208";a="701615557"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 20 Mar 2015 04:22:59 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 49F5B6A408F;
	Fri, 20 Mar 2015 04:22:40 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Mar 2015 13:22:50 +0200
Message-Id: <1426850570-12024-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] lib/oe/lsb.py: Stop parsing /etc/SuSE-release
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
X-List-Received-Date: Fri, 20 Mar 2015 11:23:00 -0000

/etc/SuSE-release should not be parsed to obtain release info

Here is the quote from /etc/SuSE-release:
/etc/SuSE-release is deprecated and will be removed in the future,
use /etc/os-release instead

All recent OpenSUSE versions already have /etc/os-release and
oe.lsb/release_dict_file function already parses it.

Current implementation of release_dict_file returns different values
when parsing /etc/SuSE-release and /etc/os-release. This is one more
advantage of getting rid of parsing /etc/SuSE-release.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oe/lsb.py | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/meta/lib/oe/lsb.py b/meta/lib/oe/lsb.py
index 50c1d47..e25e282 100644
--- a/meta/lib/oe/lsb.py
+++ b/meta/lib/oe/lsb.py
@@ -37,14 +37,6 @@ def release_dict_file():
             if match:
                 data['DISTRIB_ID'] = match.group(1)
                 data['DISTRIB_RELEASE'] = match.group(2)
-        elif os.path.exists('/etc/SuSE-release'):
-            data = {}
-            data['DISTRIB_ID'] = 'SUSE LINUX'
-            with open('/etc/SuSE-release') as f:
-                for line in f:
-                    if line.startswith('VERSION = '):
-                        data['DISTRIB_RELEASE'] = line[10:].rstrip()
-                        break
         elif os.path.exists('/etc/os-release'):
             data = {}
             with open('/etc/os-release') as f:
-- 
2.1.4


