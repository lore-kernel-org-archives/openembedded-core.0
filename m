Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 072C16E630
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 19:48:58 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 29 Aug 2016 12:49:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,252,1470726000"; d="scan'208";a="872304303"
Received: from dthoumin-mobl2.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.6.138])
	by orsmga003.jf.intel.com with ESMTP; 29 Aug 2016 12:48:57 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Aug 2016 22:48:28 +0300
Message-Id: <1472500111-12358-10-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1472500111-12358-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1472500111-12358-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 09/12] oeqa.buildperf: convert buildstats into json format
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
X-List-Received-Date: Mon, 29 Aug 2016 19:48:59 -0000

Instead of archiving buildstats in raw text file format convert all
buildstats into one json-formatted file. Some redundant information,
i.e. 'Event:', 'utime:', 'stime:', 'cutime:' and 'cstime:' fields, are
dropped.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/buildperf/base.py | 69 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 66 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
index 95a0abf..c716220 100644
--- a/meta/lib/oeqa/buildperf/base.py
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -409,13 +409,76 @@ class BuildPerfTestCase(unittest.TestCase):
 
     def save_buildstats(self, label=None):
         """Save buildstats"""
+        def split_nevr(nevr):
+            """Split name and version information from recipe "nevr" string"""
+            name, e_v, revision = nevr.rsplit('-', 2)
+            match = re.match(r'^((?P<epoch>[0-9]{1,5})_)?(?P<version>.*)$', e_v)
+            version = match.group('version')
+            epoch = match.group('epoch')
+            return name, epoch, version, revision
+
+        def bs_to_json(filename):
+            """Convert (task) buildstats file into json format"""
+            bs_json = {'iostat': {},
+                       'rusage': {},
+                       'child_rusage': {}}
+            with open(filename) as fobj:
+                for line in fobj.readlines():
+                    key, val = line.split(':', 1)
+                    val = val.strip()
+                    if key == 'Started':
+                        start_time = datetime.utcfromtimestamp(float(val))
+                        bs_json['start_time'] = start_time
+                    elif key == 'Ended':
+                        end_time = datetime.utcfromtimestamp(float(val))
+                    elif key.startswith('IO '):
+                        split = key.split()
+                        bs_json['iostat'][split[1]] = int(val)
+                    elif key.find('rusage') >= 0:
+                        split = key.split()
+                        ru_key = split[-1]
+                        if ru_key in ('ru_stime', 'ru_utime'):
+                            val = float(val)
+                        else:
+                            val = int(val)
+                        ru_type = 'rusage' if split[0] == 'rusage' else \
+                                                          'child_rusage'
+                        bs_json[ru_type][ru_key] = val
+                    elif key == 'Status':
+                        bs_json['status'] = val
+            bs_json['elapsed_time'] = end_time - start_time
+            return bs_json
+
+        log.info('Saving buildstats in JSON format')
         bs_dirs = os.listdir(self.bb_vars['BUILDSTATS_BASE'])
         if len(bs_dirs) > 1:
             log.warning("Multiple buildstats found for test %s, only "
                         "archiving the last one", self.name)
-        postfix = '-' + label if label else ''
-        shutil.move(os.path.join(self.bb_vars['BUILDSTATS_BASE'], bs_dirs[-1]),
-                    os.path.join(self.out_dir, 'buildstats' + postfix))
+        bs_dir = os.path.join(self.bb_vars['BUILDSTATS_BASE'], bs_dirs[-1])
+
+        buildstats = []
+        for fname in os.listdir(bs_dir):
+            recipe_dir = os.path.join(bs_dir, fname)
+            if not os.path.isdir(recipe_dir):
+                continue
+            name, epoch, version, revision = split_nevr(fname)
+            recipe_bs = {'name': name,
+                         'epoch': epoch,
+                         'version': version,
+                         'revision': revision,
+                         'tasks': {}}
+            for task in os.listdir(recipe_dir):
+                recipe_bs['tasks'][task] = bs_to_json(os.path.join(recipe_dir,
+                                                                   task))
+            buildstats.append(recipe_bs)
+
+        # Write buildstats into json file
+        postfix = '.' + label if label else ''
+        postfix += '.json'
+        outfile = os.path.join(self.out_dir, 'buildstats' + postfix)
+        with open(outfile, 'w') as fobj:
+            json.dump(buildstats, fobj, indent=4, sort_keys=True,
+                      cls=ResultsJsonEncoder)
 
     def rm_tmp(self):
         """Cleanup temporary/intermediate files and directories"""
-- 
2.6.6


