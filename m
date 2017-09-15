Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 0521D78673
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Sep 2017 13:04:42 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Sep 2017 06:04:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,396,1500966000"; 
	d="scan'208,217";a="1172538619"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga001.jf.intel.com with ESMTP; 15 Sep 2017 06:04:43 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Sep 2017 16:04:38 +0300
Message-Id: <bc59cd22a6cb10f867efb0353875b85e16402d4b.1505480244.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <cover.1505480244.git.markus.lehtonen@linux.intel.com>
References: <cover.1505480244.git.markus.lehtonen@linux.intel.com>
In-Reply-To: <cover.1505480244.git.markus.lehtonen@linux.intel.com>
References: <cover.1505480244.git.markus.lehtonen@linux.intel.com>
Subject: [PATCH 2/4] scripts/oe-build-perf-report: summary of task resource usage
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
X-List-Received-Date: Fri, 15 Sep 2017 13:04:43 -0000

Utilize buildstats, if available, and show a summary of the resource
usage of bitbake tasks in the html report. The details provided are:
- total number of tasks
- top 5 resource-hungry tasks (cputime)
- top 5 increase in resource usage (cputime)
- top 5 decrease in resource usage (cputime)

[YOCTO #11381]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/lib/build_perf/html/report.html | 60 +++++++++++++++++++++-
 scripts/lib/buildstats.py               |  8 +++
 scripts/oe-build-perf-report            | 90 ++++++++++++++++++++++++---------
 3 files changed, 133 insertions(+), 25 deletions(-)

diff --git a/scripts/lib/build_perf/html/report.html b/scripts/lib/build_perf/html/report.html
index 165cbb811c..a7ca5b0cb0 100644
--- a/scripts/lib/build_perf/html/report.html
+++ b/scripts/lib/build_perf/html/report.html
@@ -53,9 +53,11 @@ summary th, .meta-table td {
   border-collapse: collapse;
 }
 .details th {
-  font-weight: normal;
   padding-right: 8px;
 }
+.details.plain th {
+  font-weight: normal;
+}
 .preformatted {
   font-family: monospace;
   white-space: pre-wrap;
@@ -165,6 +167,7 @@ h3 {
             {{ measurement.absdiff_str }} ({{measurement.reldiff}})
             </span></span>
           </div>
+          {# Table for trendchart and the statistics #}
           <table style="width: 100%">
             <tr>
               <td style="width: 75%">
@@ -173,7 +176,7 @@ h3 {
               </td>
               <td>
                 {# Measurement statistics #}
-                <table class="details">
+                <table class="details plain">
                   <tr>
                     <th>Test runs</th><td>{{ measurement.value.sample_cnt }}</td>
                   </tr><tr>
@@ -191,6 +194,59 @@ h3 {
               </td>
             </tr>
           </table>
+
+          {# Task and recipe summary from buildstats #}
+          {% if 'buildstats' in measurement %}
+            Task resource usage
+            <table class="details" style="width:100%">
+              <tr>
+                <th>Number of tasks</th>
+                <th>Top consumers of cputime</th>
+              </tr>
+              <tr>
+                <td style="vertical-align: top">{{ measurement.buildstats.tasks.count }} ({{ measurement.buildstats.tasks.change }})</td>
+                {# Table of most resource-hungry tasks #}
+                <td>
+                  <table class="details plain">
+                    {% for diff in measurement.buildstats.top_consumer|reverse %}
+                    <tr>
+                      <th>{{ diff.pkg }}.{{ diff.task }}</th>
+                      <td>{{ '%0.0f' % diff.value2 }} s</td>
+                    </tr>
+                    {% endfor %}
+                  </table>
+                </td>
+              </tr>
+              <tr>
+                <th>Biggest increase in cputime</th>
+                <th>Biggest decrease in cputime</th>
+              </tr>
+              <tr>
+                {# Table biggest increase in resource usage #}
+                <td>
+                  <table class="details plain">
+                    {% for diff in measurement.buildstats.top_increase|reverse %}
+                    <tr>
+                      <th>{{ diff.pkg }}.{{ diff.task }}</th>
+                      <td>{{ '%+0.0f' % diff.absdiff }} s</td>
+                    </tr>
+                    {% endfor %}
+                  </table>
+                </td>
+                {# Table biggest decrease in resource usage #}
+                <td>
+                  <table class="details plain">
+                    {% for diff in measurement.buildstats.top_decrease %}
+                    <tr>
+                      <th>{{ diff.pkg }}.{{ diff.task }}</th>
+                      <td>{{ '%+0.0f' % diff.absdiff }} s</td>
+                    </tr>
+                    {% endfor %}
+                  </table>
+                </td>
+              </tr>
+            </table>
+          {% endif %}
         </div>
       {% endfor %}
     {# Unsuccessful test #}
diff --git a/scripts/lib/buildstats.py b/scripts/lib/buildstats.py
index 9eb60b1c69..bd6332176a 100644
--- a/scripts/lib/buildstats.py
+++ b/scripts/lib/buildstats.py
@@ -180,6 +180,14 @@ class BSRecipe(object):
 class BuildStats(dict):
     """Class representing buildstats of one build"""
 
+    @property
+    def num_tasks(self):
+        """Get number of tasks"""
+        num = 0
+        for recipe in self.values():
+            num += len(recipe.tasks)
+        return num
+
     @classmethod
     def from_json(cls, bs_json):
         """Create new BuildStats object from JSON object"""
diff --git a/scripts/oe-build-perf-report b/scripts/oe-build-perf-report
index b5ad42bc8a..8d9c53f91f 100755
--- a/scripts/oe-build-perf-report
+++ b/scripts/oe-build-perf-report
@@ -31,6 +31,7 @@ from build_perf import print_table
 from build_perf.report import (metadata_xml_to_json, results_xml_to_json,
                                aggregate_data, aggregate_metadata, measurement_stats)
 from build_perf import html
+from buildstats import BuildStats, diff_buildstats
 
 scriptpath.add_oe_lib_path()
 
@@ -330,7 +331,27 @@ def print_diff_report(metadata_l, data_l, metadata_r, data_r):
     print()
 
 
-def print_html_report(data, id_comp):
+class BSSummary(object):
+    def __init__(self, bs1, bs2):
+        self.tasks = {'count': bs2.num_tasks,
+                      'change': '{:+d}'.format(bs2.num_tasks - bs1.num_tasks)}
+        self.top_consumer = None
+        self.top_decrease = None
+        self.top_increase = None
+
+        tasks_diff = diff_buildstats(bs1, bs2, 'cputime')
+
+        # Get top consumers of resources
+        tasks_diff = sorted(tasks_diff, key=attrgetter('value2'))
+        self.top_consumer = tasks_diff[-5:]
+
+        # Get biggest increase and decrease in resource usage
+        tasks_diff = sorted(tasks_diff, key=attrgetter('absdiff'))
+        self.top_decrease = tasks_diff[0:5]
+        self.top_increase = tasks_diff[-5:]
+
+
+def print_html_report(data, id_comp, buildstats):
     """Print report in html format"""
     # Handle metadata
     metadata = {'branch': {'title': 'Branch', 'value': 'master'},
@@ -339,7 +360,6 @@ def print_html_report(data, id_comp):
                }
     metadata = metadata_diff(data[id_comp][0], data[-1][0])
 
-
     # Generate list of tests
     tests = []
     for test in data[-1][1]['tests'].keys():
@@ -389,6 +409,16 @@ def print_html_report(data, id_comp):
             new_meas['value'] = samples[-1]
             new_meas['value_type'] = samples[-1]['val_cls']
 
+            # Compare buildstats
+            bs_key = test + '.' + meas
+            rev = metadata['commit_num']['value']
+            comp_rev = metadata['commit_num']['value_old']
+            if (rev in buildstats and bs_key in buildstats[rev] and
+                    comp_rev in buildstats and bs_key in buildstats[comp_rev]):
+                new_meas['buildstats'] = BSSummary(buildstats[comp_rev][bs_key],
+                                                   buildstats[rev][bs_key])
+
+
             new_test['measurements'].append(new_meas)
         tests.append(new_test)
 
@@ -400,8 +430,8 @@ def print_html_report(data, id_comp):
     print(html.template.render(metadata=metadata, test_data=tests, chart_opts=chart_opts))
 
 
-def dump_buildstats(repo, outdir, notes_ref, revs):
-    """Dump buildstats of test results"""
+def get_buildstats(repo, notes_ref, revs, outdir=None):
+    """Get the buildstats from git notes"""
     full_ref = 'refs/notes/' + notes_ref
     if not repo.rev_parse(full_ref):
         log.error("No buildstats found, please try running "
@@ -410,9 +440,10 @@ def dump_buildstats(repo, outdir, notes_ref, revs):
         return
 
     missing = False
-    log.info("Writing out buildstats from 'refs/notes/%s' into '%s'",
-              notes_ref, outdir)
+    buildstats = {}
+    log.info("Parsing buildstats from 'refs/notes/%s'", notes_ref)
     for rev in revs:
+        buildstats[rev.commit_number] = {}
         log.debug('Dumping buildstats for %s (%s)', rev.commit_number,
                   rev.commit)
         for tag in rev.tags:
@@ -423,19 +454,32 @@ def dump_buildstats(repo, outdir, notes_ref, revs):
             except GitError:
                 log.warning("Buildstats not found for %s", tag)
                 missing = True
-            for measurement, buildstats in bs_all.items():
-                tag_base, run_id = tag.rsplit('/', 1)
-                tag_base = tag_base.replace('/', '_')
-                bs_dir = os.path.join(outdir, measurement, tag_base)
-                if not os.path.exists(bs_dir):
-                    os.makedirs(bs_dir)
-                with open(os.path.join(bs_dir, run_id + '.json'), 'w') as f:
-                    json.dump(buildstats, f, indent=2)
+
+            for measurement, bs in bs_all.items():
+                # Write out onto disk
+                if outdir:
+                    tag_base, run_id = tag.rsplit('/', 1)
+                    tag_base = tag_base.replace('/', '_')
+                    bs_dir = os.path.join(outdir, measurement, tag_base)
+                    if not os.path.exists(bs_dir):
+                        os.makedirs(bs_dir)
+                    with open(os.path.join(bs_dir, run_id + '.json'), 'w') as f:
+                        json.dump(bs, f, indent=2)
+
+                # Read buildstats into a dict
+                _bs = BuildStats.from_json(bs)
+                if measurement not in buildstats[rev.commit_number]:
+                    buildstats[rev.commit_number][measurement] = _bs
+                else:
+                    buildstats[rev.commit_number][measurement].aggregate(_bs)
+
     if missing:
         log.info("Buildstats were missing for some test runs, please "
                  "run 'git fetch origin %s:%s' and try again",
                  full_ref, full_ref)
 
+    return buildstats
+
 
 def auto_args(repo, args):
     """Guess arguments, if not defined by the user"""
@@ -581,20 +625,20 @@ def main(argv=None):
     index_r = index_r - index_0
     index_l = index_l - index_0
 
+    # Read buildstats only when needed
+    buildstats = None
+    if args.dump_buildstats or args.html:
+        outdir = 'oe-build-perf-buildstats' if args.dump_buildstats else None
+        notes_ref = 'buildstats/{}/{}/{}'.format(args.hostname, args.branch,
+                                                 args.machine)
+        buildstats = get_buildstats(repo, notes_ref, [rev_l, rev_r], outdir)
+
     # Print report
     if not args.html:
         print_diff_report(data[index_l][0], data[index_l][1],
                           data[index_r][0], data[index_r][1])
     else:
-        print_html_report(data, index_l)
-
-    # Dump buildstats
-    if args.dump_buildstats:
-        notes_ref = 'buildstats/{}/{}/{}'.format(args.hostname, args.branch,
-                                                 args.machine)
-        dump_buildstats(repo, 'oe-build-perf-buildstats', notes_ref,
-                        [rev_l, rev_r])
-                        #revs_l.tags + revs_r.tags)
+        print_html_report(data, index_l, buildstats)
 
     return 0
 
-- 
2.12.3


