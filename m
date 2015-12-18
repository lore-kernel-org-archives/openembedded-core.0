Return-Path: <costin.c.constantin@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 83903731BD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 12:28:45 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP; 18 Dec 2015 04:28:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,446,1444719600"; d="scan'208";a="710370869"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 18 Dec 2015 04:28:46 -0800
Received: from localhost.localdomain (unknown [10.237.112.252])
	by linux.intel.com (Postfix) with ESMTP id EA7166A4007
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 05:16:46 -0800 (PST)
From: Costin Constantin <costin.c.constantin@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Dec 2015 14:41:00 +0200
Message-Id: <626bc03ee8e8b358d0ec891f8b140575edbdf4c2.1450441923.git.costin.c.constantin@intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1450441923.git.costin.c.constantin@intel.com>
References: <cover.1450441923.git.costin.c.constantin@intel.com>
In-Reply-To: <cover.1450441923.git.costin.c.constantin@intel.com>
References: <cover.1450441923.git.costin.c.constantin@intel.com>
Subject: [PATCH 08/12] oeqa/runexported: The runner supports tests from other layers.
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
X-List-Received-Date: Fri, 18 Dec 2015 12:28:45 -0000

From: Lucian Musat <george.l.musat@intel.com>

It looks in "extralayers" folder if it can't find the test
that needs to be run.

Signed-off-by: Lucian Musat <george.l.musat@intel.com>
---
 meta/lib/oeqa/runexported.py | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta/lib/oeqa/runexported.py b/meta/lib/oeqa/runexported.py
index c3ce79a..b8d621c 100755
--- a/meta/lib/oeqa/runexported.py
+++ b/meta/lib/oeqa/runexported.py
@@ -92,6 +92,12 @@ def main():
 
     args = parser.parse_args()
 
+    if os.path.isdir("extralayers"):
+        extrapaths = [x[0] for x in os.walk('extralayers')]
+        for path in extrapaths:
+            if os.path.isdir(os.path.join(path,"oeqa")) and (os.path.join(path,"oeqa") not in sys.path):
+                sys.path.append(os.path.abspath(path))
+
     with open(args.json, "r") as f:
         loaded = json.load(f)
 
@@ -144,6 +150,14 @@ def main():
                 for files in os.listdir(os.sep.join(test.split('.'))):
                     if (files.endswith(".py")) and not files.startswith("_"):
                         tc.testslist.insert(index, test+'.'+files.split('.')[0])
+            elif not os.path.isfile(os.path.join(os.sep.join(test.split('.')), '.py')):
+                for testpath in sys.path:
+                    directory = os.path.join(testpath, os.sep.join(test.split('.')))
+                    if os.path.isdir(directory):
+                        del tc.testslist[index]
+                        for files in os.listdir(directory):
+                            if (files.endswith(".py")) and not files.startswith("_"):
+                                tc.testslist.insert(index, test+'.'+files.split('.')[0])
         target.exportStart()
         runTests(tc)
 
-- 
2.5.0


