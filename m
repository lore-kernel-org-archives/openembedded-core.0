Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 732947002B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2016 14:28:15 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga101.jf.intel.com with ESMTP; 29 Sep 2016 07:28:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,415,1470726000"; d="scan'208";a="15040348"
Received: from wegenerj-mobl1.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.44.79])
	by orsmga004.jf.intel.com with ESMTP; 29 Sep 2016 07:28:16 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Sep 2016 17:28:04 +0300
Message-Id: <1475159288-31921-8-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1475159288-31921-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1475159288-31921-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 07/11] scripts/buildstats-diff: add read_ops and write_ops to --diff-attr
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
X-List-Received-Date: Thu, 29 Sep 2016 14:28:15 -0000

Two new options, making it possible to compare the number of filesystem
operations of tasks. Defaults for --min-val and --min-absdiff are set to
more or less arbitrary 500 and 50 operations, respectively.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/buildstats-diff | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/scripts/buildstats-diff b/scripts/buildstats-diff
index 3c894cb..c6fa803 100755
--- a/scripts/buildstats-diff
+++ b/scripts/buildstats-diff
@@ -88,6 +88,17 @@ class BSTask(dict):
         """Bytes written to the block layer"""
         return self['iostat']['write_bytes']
 
+    @property
+    def read_ops(self):
+        """Number of read operations on the block layer"""
+        return self['rusage']['ru_inblock'] + self['child_rusage']['ru_inblock']
+
+    @property
+    def write_ops(self):
+        """Number of write operations on the block layer"""
+        return self['rusage']['ru_oublock'] + self['child_rusage']['ru_oublock']
+
+
 def read_buildstats_file(buildstat_file):
     """Convert buildstat text file into dict/json"""
     bs_task = BSTask()
@@ -306,6 +317,12 @@ def print_task_diff(bs1, bs2, val_type, min_val=0, min_absdiff=0, sort_by=('absd
                 prec = 1 if dec > 0 else 0
                 return "{:.{prec}f}{}B".format(val / (2 ** (10 * dec)),
                                                prefix[dec], prec=prec)
+        elif 'ops' in val_type and human_readable:
+                prefix = ['', 'k', 'M', 'G', 'T', 'P']
+                dec = int(math.log(val, 1000))
+                prec = 1 if dec > 0 else 0
+                return "{:.{prec}f}{}ops".format(val / (1000 ** dec),
+                                                 prefix[dec], prec=prec)
         return str(int(val))
 
     def sum_vals(buildstats):
@@ -418,17 +435,21 @@ Script for comparing buildstats of two separate builds."""
 
     min_val_defaults = {'cputime': 3.0,
                         'read_bytes': 524288,
-                        'write_bytes': 524288}
+                        'write_bytes': 524288,
+                        'read_ops': 500,
+                        'write_ops': 500}
     min_absdiff_defaults = {'cputime': 1.0,
                             'read_bytes': 131072,
-                            'write_bytes': 131072}
+                            'write_bytes': 131072,
+                            'read_ops': 50,
+                            'write_ops': 50}
 
     parser.add_argument('--debug', '-d', action='store_true',
                         help="Verbose logging")
     parser.add_argument('--ver-diff', action='store_true',
                         help="Show package version differences and exit")
     parser.add_argument('--diff-attr', default='cputime',
-                        choices=('cputime', 'read_bytes', 'write_bytes'),
+                        choices=min_val_defaults.keys(),
                         help="Buildstat attribute which to compare")
     parser.add_argument('--min-val', default=min_val_defaults, type=float,
                         help="Filter out tasks less than MIN_VAL. "
-- 
2.6.6


