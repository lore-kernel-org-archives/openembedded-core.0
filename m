Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 067D471CA7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 11:18:52 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 May 2017 04:18:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,344,1491289200"; d="scan'208";a="86877689"
Received: from bkearns-mobl.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.10.90])
	by orsmga002.jf.intel.com with ESMTP; 15 May 2017 04:18:52 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 May 2017 14:18:45 +0300
Message-Id: <e10806f63bd15aa42306bc84ab93ec9009e75ca3.1494846894.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1494846894.git.markus.lehtonen@linux.intel.com>
References: <cover.1494846894.git.markus.lehtonen@linux.intel.com>
In-Reply-To: <cover.1494846894.git.markus.lehtonen@linux.intel.com>
References: <cover.1494846894.git.markus.lehtonen@linux.intel.com>
Subject: [PATCH 5/5] scripts/buildstats-diff: support optimized rusage values
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
X-List-Received-Date: Mon, 15 May 2017 11:18:52 -0000

Buildstats from oe-build-perf-test results have been optimized to not
have child rusage values at all. There, rusage is the sum of parent and
child rusage values. This patch makes buildstats-diff compatible with
this format.

[YOCTO #11355]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/buildstats-diff | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/scripts/buildstats-diff b/scripts/buildstats-diff
index adeba44988..4276464714 100755
--- a/scripts/buildstats-diff
+++ b/scripts/buildstats-diff
@@ -52,8 +52,12 @@ class BSTask(dict):
     @property
     def cputime(self):
         """Sum of user and system time taken by the task"""
-        return self['rusage']['ru_stime'] + self['rusage']['ru_utime'] + \
-               self['child_rusage']['ru_stime'] + self['child_rusage']['ru_utime']
+        rusage = self['rusage']['ru_stime'] + self['rusage']['ru_utime']
+        if self['child_rusage']:
+            # Child rusage may have been optimized out
+            return rusage + self['child_rusage']['ru_stime'] + self['child_rusage']['ru_utime']
+        else:
+            return rusage
 
     @property
     def walltime(self):
@@ -73,12 +77,20 @@ class BSTask(dict):
     @property
     def read_ops(self):
         """Number of read operations on the block layer"""
-        return self['rusage']['ru_inblock'] + self['child_rusage']['ru_inblock']
+        if self['child_rusage']:
+            # Child rusage may have been optimized out
+            return self['rusage']['ru_inblock'] + self['child_rusage']['ru_inblock']
+        else:
+            return self['rusage']['ru_inblock']
 
     @property
     def write_ops(self):
         """Number of write operations on the block layer"""
-        return self['rusage']['ru_oublock'] + self['child_rusage']['ru_oublock']
+        if self['child_rusage']:
+            # Child rusage may have been optimized out
+            return self['rusage']['ru_oublock'] + self['child_rusage']['ru_oublock']
+        else:
+            return self['rusage']['ru_oublock']
 
 
 def read_buildstats_file(buildstat_file):
-- 
2.12.0


