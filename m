Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AA6666067C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 12:04:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u6CC47R5015860
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 05:04:08 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 12 Jul 2016 05:04:07 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 12 Jul 2016 05:04:01 -0700
Message-ID: <15b4178affc4e58802f349ab07fe53c51d523e97.1468324994.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1468324994.git.liezhi.yang@windriver.com>
References: <cover.1468324994.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] oe-selftest: print errors when failed to find test
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
X-List-Received-Date: Tue, 12 Jul 2016 12:04:09 -0000
Content-Type: text/plain

For example:
$ oe-selftest --run-tests-by name hello world
2016-07-12 00:33:28,678 - selftest - ERROR - Failed to find test: hello
2016-07-12 00:33:28,679 - selftest - ERROR - Failed to find test: world

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/oe-selftest | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index df76f94..303b1d5 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -262,16 +262,22 @@ def get_testsuite_by(criteria, keyword):
         result = []
         remaining = values[:]
         for key in keyword:
+            found = False
             if key in remaining:
                 # Regular matching of exact item
                 result.append(key)
                 remaining.remove(key)
+                found = True
             else:
                 # Wildcard matching
                 pattern = re.compile(fnmatch.translate(r"%s" % key))
                 added = [x for x in remaining if pattern.match(x)]
-                result.extend(added)
-                remaining = [x for x in remaining if x not in added]
+                if added:
+                    result.extend(added)
+                    remaining = [x for x in remaining if x not in added]
+                    found = True
+            if not found:
+                log.error("Failed to find test: %s" % key)
 
         return result
 
@@ -455,6 +461,8 @@ def main():
             criteria = args.run_tests_by[0]
             keyword = args.run_tests_by[1:]
             ts = sorted([ tc.fullpath for tc in get_testsuite_by(criteria, keyword) ])
+        if not ts:
+            return 1
 
     if args.list_tests_by and len(args.list_tests_by) >= 2:
         valid_options = ['name', 'class', 'module', 'id', 'tag']
-- 
2.9.0


