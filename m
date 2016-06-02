Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id BA5FB773D8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2016 10:13:50 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP; 02 Jun 2016 03:13:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,405,1459839600"; d="scan'208";a="114724062"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga004.fm.intel.com with ESMTP; 02 Jun 2016 03:13:51 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 518896A4006
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2016 04:01:19 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Jun 2016 13:12:50 +0300
Message-Id: <ae53ec09026f709c0bf7ad4608a2f58f72cce1d4.1464861910.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1464861910.git.ed.bartosh@linux.intel.com>
References: <cover.1464861910.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1464861910.git.ed.bartosh@linux.intel.com>
References: <cover.1464861910.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 04/16] scripts: python3: fix urllib imports
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
X-List-Received-Date: Thu, 02 Jun 2016 10:13:50 -0000

Some functions and classes have been moved from urllib[2]
to urllib.request and urllib.error in python 3.

Used new imports to make the code working in python 3.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/contrib/verify-homepage.py |  4 ++--
 scripts/send-error-report          | 14 +++++++-------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/scripts/contrib/verify-homepage.py b/scripts/contrib/verify-homepage.py
index 265ff65..18bb15b 100755
--- a/scripts/contrib/verify-homepage.py
+++ b/scripts/contrib/verify-homepage.py
@@ -7,7 +7,7 @@
 import sys
 import os
 import subprocess
-import urllib2
+import urllib.request
 
 
 # Allow importing scripts/lib modules
@@ -47,7 +47,7 @@ def verifyHomepage(bbhandler):
             homepage = data.getVar("HOMEPAGE", True)
             if homepage:
                 try:
-                    urllib2.urlopen(homepage, timeout=5)
+                    urllib.request.urlopen(homepage, timeout=5)
                 except Exception:
                     count = count + wgetHomepage(os.path.basename(realfn), homepage)
             checked.append(realfn)
diff --git a/scripts/send-error-report b/scripts/send-error-report
index 7251e27..122ce32 100755
--- a/scripts/send-error-report
+++ b/scripts/send-error-report
@@ -7,7 +7,7 @@
 # Author: Andreea Proca <andreea.b.proca@intel.com>
 # Author: Michael Wood <michael.g.wood@intel.com>
 
-import urllib2
+import urllib.request, urllib.error
 import sys
 import json
 import os
@@ -25,10 +25,10 @@ log = logging.getLogger("send-error-report")
 logging.basicConfig(format='%(levelname)s: %(message)s')
 
 def getPayloadLimit(url):
-    req = urllib2.Request(url, None)
+    req = urllib.request.Request(url, None)
     try:
-        response = urllib2.urlopen(req)
-    except urllib2.URLError as e:
+        response = urllib.request.urlopen(req)
+    except urllib.error.URLError as e:
         # Use this opportunity to bail out if we can't even contact the server
         log.error("Could not contact server: " + url)
         log.error(e.reason)
@@ -136,10 +136,10 @@ def send_data(data, args):
     else:
         url = "http://"+args.server+"/ClientPost/"
 
-    req = urllib2.Request(url, data=data, headers=headers)
+    req = urllib.request.Request(url, data=data, headers=headers)
     try:
-        response = urllib2.urlopen(req)
-    except urllib2.HTTPError, e:
+        response = urllib.request.urlopen(req)
+    except urllib.error.HTTPError as e:
         logging.error(e.reason)
         sys.exit(1)
 
-- 
2.1.4


