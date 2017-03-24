Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id BB81077BAD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 14:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490365082; x=1521901082;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=TFhZjn8LFmCwaQHpQEDho49+s3JXtGAA4Ips5qLi8fg=;
	b=CpnumYI5Y8gR7djaR8uQB+MhHlYc4O6SgUwKtql9dK6bGA4jKjNfOqa6
	852OnRi1QGn46TpQNJn7F/JyXX3iMw==;
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Mar 2017 07:18:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,215,1486454400"; d="scan'208";a="1146511857"
Received: from mlehtone-mac02.fi.intel.com (HELO mqz-osx-suse64.fi.intel.com)
	([10.237.66.34])
	by fmsmga002.fm.intel.com with ESMTP; 24 Mar 2017 07:17:37 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Mar 2017 16:17:26 +0200
Message-Id: <1490365050-11776-3-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1490365050-11776-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1490365050-11776-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 2/6] oe-build-perf-test: sum rusage in buildstats
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
X-List-Received-Date: Fri, 24 Mar 2017 14:18:01 -0000

Instead of separate rusage and child rusage values, only store their sum
value in buildstats. This is a big reduction in data footprint without
really losing any interesting data.

Also, utilize OrderedDict to order data more logically.

[YOCTO #10582]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/buildperf/base.py | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
index ffe42dc..aa5c5ad 100644
--- a/meta/lib/oeqa/buildperf/base.py
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -411,9 +411,9 @@ class BuildPerfTestCase(unittest.TestCase):
 
         def bs_to_json(filename):
             """Convert (task) buildstats file into json format"""
-            bs_json = {'iostat': {},
-                       'rusage': {},
-                       'child_rusage': {}}
+            bs_json = OrderedDict()
+            iostat = OrderedDict()
+            rusage = OrderedDict()
             with open(filename) as fobj:
                 for line in fobj.readlines():
                     key, val = line.split(':', 1)
@@ -425,7 +425,7 @@ class BuildPerfTestCase(unittest.TestCase):
                         end_time = datetime.utcfromtimestamp(float(val))
                     elif key.startswith('IO '):
                         split = key.split()
-                        bs_json['iostat'][split[1]] = int(val)
+                        iostat[split[1]] = int(val)
                     elif key.find('rusage') >= 0:
                         split = key.split()
                         ru_key = split[-1]
@@ -433,12 +433,12 @@ class BuildPerfTestCase(unittest.TestCase):
                             val = float(val)
                         else:
                             val = int(val)
-                        ru_type = 'rusage' if split[0] == 'rusage' else \
-                                                          'child_rusage'
-                        bs_json[ru_type][ru_key] = val
+                        rusage[ru_key] = rusage.get(ru_key, 0) + val
                     elif key == 'Status':
                         bs_json['status'] = val
             bs_json['elapsed_time'] = end_time - start_time
+            bs_json['rusage'] = rusage
+            bs_json['iostat'] = iostat
             return bs_json
 
         log.info('Saving buildstats in JSON format')
@@ -454,11 +454,11 @@ class BuildPerfTestCase(unittest.TestCase):
             if not os.path.isdir(recipe_dir):
                 continue
             name, epoch, version, revision = split_nevr(fname)
-            recipe_bs = {'name': name,
-                         'epoch': epoch,
-                         'version': version,
-                         'revision': revision,
-                         'tasks': {}}
+            recipe_bs = OrderedDict((('name', name),
+                                     ('epoch', epoch),
+                                     ('version', version),
+                                     ('revision', revision),
+                                     ('tasks', OrderedDict())))
             for task in os.listdir(recipe_dir):
                 recipe_bs['tasks'][task] = bs_to_json(os.path.join(recipe_dir,
                                                                    task))
-- 
2.6.6


