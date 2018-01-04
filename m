Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5FD247845A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jan 2018 12:56:19 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w04CuISZ007253
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 4 Jan 2018 12:56:19 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1eX54E-0006NJ-Jj; Thu, 04 Jan 2018 12:56:18 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Jan 2018 12:56:13 +0000
Message-Id: <1515070574-24435-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 1/2] utils: Make get_multilib_datastore available from lib/oe
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
X-List-Received-Date: Thu, 04 Jan 2018 12:56:20 -0000

Currently we can't access this function from lib/oe as its a class function.
Move it to allow such access.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/utils.bbclass | 7 +------
 meta/lib/oe/utils.py       | 8 ++++++++
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index 8e07eac..32cae7e 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -364,12 +364,7 @@ def multilib_pkg_extend(d, pkg):
     return pkgs
 
 def get_multilib_datastore(variant, d):
-    localdata = bb.data.createCopy(d)
-    overrides = localdata.getVar("OVERRIDES", False) + ":virtclass-multilib-" + variant
-    localdata.setVar("OVERRIDES", overrides)
-    localdata.setVar("MLPREFIX", variant + "-")
-    return localdata
-get_multilib_datastore[vardepsexclude] = "OVERRIDES"
+    return oe.utils.get_multilib_datastore(variant, d)
 
 def all_multilib_tune_values(d, var, unique = True, need_split = True, delim = ' '):
     """Return a string of all ${var} in all multilib tune configuration"""
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 1897c5f..7a79d75 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -281,6 +281,14 @@ def host_gcc_version(d):
     version = match.group(1)
     return "-%s" % version if version in ("4.8", "4.9") else ""
 
+
+def get_multilib_datastore(variant, d):
+    localdata = bb.data.createCopy(d)
+    overrides = localdata.getVar("OVERRIDES", False) + ":virtclass-multilib-" + variant
+    localdata.setVar("OVERRIDES", overrides)
+    localdata.setVar("MLPREFIX", variant + "-")
+    return localdata
+
 #
 # Python 2.7 doesn't have threaded pools (just multiprocessing)
 # so implement a version here
-- 
2.7.4


