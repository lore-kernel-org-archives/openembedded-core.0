Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4F097731CD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2016 03:12:14 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 28 Jun 2016 20:12:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,544,1459839600"; d="scan'208";a="726582579"
Received: from hkao-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.176.158])
	by FMSMGA003.fm.intel.com with ESMTP; 28 Jun 2016 20:12:14 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jun 2016 15:12:04 +1200
Message-Id: <296bb09388c074c98717cb5f895143f72f3a76e6.1467169903.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1467169903.git.paul.eggleton@linux.intel.com>
References: <cover.1467169903.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1467169903.git.paul.eggleton@linux.intel.com>
References: <cover.1467169903.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] recipetool: create: drop unused convert_pkginfo() function
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
X-List-Received-Date: Wed, 29 Jun 2016 03:12:14 -0000

Code cleanup, no functional changes - this code was never used.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create.py | 29 -----------------------------
 1 file changed, 29 deletions(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 042e700..430f5bb 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -937,35 +937,6 @@ def read_pkgconfig_provides(d):
                         recipemap[pc] = line.split(':', 1)[1].strip()
     return recipemap
 
-def convert_pkginfo(pkginfofile):
-    values = {}
-    with open(pkginfofile, 'r') as f:
-        indesc = False
-        for line in f:
-            if indesc:
-                if line.strip():
-                    values['DESCRIPTION'] += ' ' + line.strip()
-                else:
-                    indesc = False
-            else:
-                splitline = line.split(': ', 1)
-                key = line[0]
-                value = line[1]
-                if key == 'LICENSE':
-                    for dep in value.split(','):
-                        dep = dep.split()[0]
-                        mapped = depmap.get(dep, '')
-                        if mapped:
-                            depends.append(mapped)
-                elif key == 'License':
-                    values['LICENSE'] = value
-                elif key == 'Summary':
-                    values['SUMMARY'] = value
-                elif key == 'Description':
-                    values['DESCRIPTION'] = value
-                    indesc = True
-    return values
-
 def convert_debian(debpath):
     value_map = {'Package': 'PN',
                  'Version': 'PV',
-- 
2.5.5


