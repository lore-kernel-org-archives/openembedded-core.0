Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 5BDB27002B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2016 14:28:16 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga101.jf.intel.com with ESMTP; 29 Sep 2016 07:28:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,415,1470726000"; d="scan'208";a="15040351"
Received: from wegenerj-mobl1.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.44.79])
	by orsmga004.jf.intel.com with ESMTP; 29 Sep 2016 07:28:17 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Sep 2016 17:28:05 +0300
Message-Id: <1475159288-31921-9-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1475159288-31921-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1475159288-31921-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 08/11] scripts/buildstats-diff: add walltime to --diff-attr
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
X-List-Received-Date: Thu, 29 Sep 2016 14:28:16 -0000

For comparing the elapsed wall clock time of tests. Default values for
--min-val and --min-absdiff are 5 seconds and 2 seconds.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/buildstats-diff | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/scripts/buildstats-diff b/scripts/buildstats-diff
index c6fa803..f26a6c1 100755
--- a/scripts/buildstats-diff
+++ b/scripts/buildstats-diff
@@ -79,6 +79,11 @@ class BSTask(dict):
                self['child_rusage']['ru_stime'] + self['child_rusage']['ru_utime']
 
     @property
+    def walltime(self):
+        """Elapsed wall clock time"""
+        return self['elapsed_time'].total_seconds()
+
+    @property
     def read_bytes(self):
         """Bytes read from the block layer"""
         return self['iostat']['read_bytes']
@@ -306,7 +311,7 @@ def print_task_diff(bs1, bs2, val_type, min_val=0, min_absdiff=0, sort_by=('absd
             else:
                 return "{:d}:{:02d}:{:04.1f}".format(h, m, s)
 
-        if val_type == 'cputime':
+        if 'time' in val_type:
             if human_readable:
                 return hms_time(val)
             else:
@@ -437,12 +442,14 @@ Script for comparing buildstats of two separate builds."""
                         'read_bytes': 524288,
                         'write_bytes': 524288,
                         'read_ops': 500,
-                        'write_ops': 500}
+                        'write_ops': 500,
+                        'walltime': 5}
     min_absdiff_defaults = {'cputime': 1.0,
                             'read_bytes': 131072,
                             'write_bytes': 131072,
                             'read_ops': 50,
-                            'write_ops': 50}
+                            'write_ops': 50,
+                            'walltime': 2}
 
     parser.add_argument('--debug', '-d', action='store_true',
                         help="Verbose logging")
-- 
2.6.6


