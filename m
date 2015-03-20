Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 54DAF6013D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2015 18:37:38 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 20 Mar 2015 11:37:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,438,1422950400"; d="scan'208";a="470219840"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 20 Mar 2015 11:37:39 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 9BEA26A408F;
	Fri, 20 Mar 2015 11:37:20 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Mar 2015 20:37:12 +0200
Message-Id: <1426876632-20509-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <20150320141247.GA13743@linux.intel.com>
References: <20150320141247.GA13743@linux.intel.com>
Subject: [PATCH] lib/oe/lsb.py: Prioritize parsing of /etc/os-release
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
X-List-Received-Date: Fri, 20 Mar 2015 18:37:42 -0000

Moved parsing of /etc/os-release before parsing of
/etc/SuSE-release as /etc/SuSE-release is deprecated in
recent releases of OpenSuSE.

Here is the quote from /etc/SuSE-release:
/etc/SuSE-release is deprecated and will be removed in the future,
use /etc/os-release instead

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oe/lsb.py | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oe/lsb.py b/meta/lib/oe/lsb.py
index 50c1d47..ddfe71b 100644
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
@@ -53,6 +45,15 @@ def release_dict_file():
                         data['DISTRIB_ID'] = line[5:].rstrip().strip('"')
                     if line.startswith('VERSION_ID='):
                         data['DISTRIB_RELEASE'] = line[11:].rstrip().strip('"')
+        elif os.path.exists('/etc/SuSE-release'):
+            data = {}
+            data['DISTRIB_ID'] = 'SUSE LINUX'
+            with open('/etc/SuSE-release') as f:
+                for line in f:
+                    if line.startswith('VERSION = '):
+                        data['DISTRIB_RELEASE'] = line[10:].rstrip()
+                        break
+
     except IOError:
         return None
     return data
-- 
2.1.4


