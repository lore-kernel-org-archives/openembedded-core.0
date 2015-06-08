Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5CF6875750
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jun 2015 10:05:18 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 08 Jun 2015 03:05:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,573,1427785200"; d="scan'208";a="504700543"
Received: from ewishar1-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.30.184])
	by FMSMGA003.fm.intel.com with ESMTP; 08 Jun 2015 03:05:17 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Jun 2015 11:04:51 +0100
Message-Id: <99f305fc49efe1bb765669aebee864b75aa0ba95.1433757846.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1433757846.git.paul.eggleton@linux.intel.com>
References: <cover.1433757846.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1433757846.git.paul.eggleton@linux.intel.com>
References: <cover.1433757846.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] lib/oe/rootfs: tidy up log warning reporting
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
X-List-Received-Date: Mon, 08 Jun 2015 10:05:19 -0000

* bb.warn() should only be called once per warning - UIs such as Toaster
  assume that this is the case, so adjust the output accordingly. (It's
  tricky here because we have to include "log_check" on every line or
  we'll end up looping forever as the log checking code's own messages
  retrigger the log check, sigh...)
* Iterating over a file already splits by line, there's no need to do it
  manually.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/rootfs.py | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 5f1f7b3e..48e5754 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -44,15 +44,14 @@ class Rootfs(object):
         r = re.compile('^(warn|Warn|NOTE: warn|NOTE: Warn|WARNING:)')
         log_path = self.d.expand("${T}/log.do_rootfs")
         with open(log_path, 'r') as log:
-            for line in log.read().split('\n'):
+            for line in log:
                 if 'log_check' in line or 'NOTE:' in line:
                     continue
 
                 m = r.search(line)
                 if m:
-                    bb.warn('log_check: There is a warn message in the logfile')
-                    bb.warn('log_check: Matched keyword: [%s]' % m.group())
-                    bb.warn('log_check: %s\n' % line)
+                    bb.warn('[log_check] %s: found a warning message in the logfile (keyword \'%s\'):\n[log_check] %s'
+				    % (self.d.getVar('PN', True), m.group(), line))
 
     def _log_check_error(self):
         r = re.compile(self.log_check_regex)
@@ -60,15 +59,15 @@ class Rootfs(object):
         with open(log_path, 'r') as log:
             found_error = 0
             message = "\n"
-            for line in log.read().split('\n'):
+            for line in log:
                 if 'log_check' in line:
                     continue
 
                 m = r.search(line)
                 if m:
                     found_error = 1
-                    bb.warn('log_check: There were error messages in the logfile')
-                    bb.warn('log_check: Matched keyword: [%s]\n\n' % m.group())
+                    bb.warn('[log_check] %s: found an error message in the logfile (keyword \'%s\'):\n[log_check] %s'
+				    % (self.d.getVar('PN', True), m.group(), line))
 
                 if found_error >= 1 and found_error <= 5:
                     message += line + '\n'
-- 
2.1.0


