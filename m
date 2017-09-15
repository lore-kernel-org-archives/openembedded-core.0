Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id B43B378685
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Sep 2017 13:04:45 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Sep 2017 06:04:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,396,1500966000"; 
	d="scan'208,217";a="1172538629"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga001.jf.intel.com with ESMTP; 15 Sep 2017 06:04:45 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Sep 2017 16:04:40 +0300
Message-Id: <fec681b6a8adbebbf8ca1a49915880eff9b4b998.1505480244.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <cover.1505480244.git.markus.lehtonen@linux.intel.com>
References: <cover.1505480244.git.markus.lehtonen@linux.intel.com>
In-Reply-To: <cover.1505480244.git.markus.lehtonen@linux.intel.com>
References: <cover.1505480244.git.markus.lehtonen@linux.intel.com>
Subject: [PATCH 4/4] scripts/oe-build-perf-report: show recipe version changes in html report
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
X-List-Received-Date: Fri, 15 Sep 2017 13:04:46 -0000

If buildstats are available (for a certain measurement), show recipe
version changes between the two builds that are being compared. The
information shown includes new and dropped recipes as well as changes in
recipe version, revision or epoch.

[YOCTO #11382]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/lib/build_perf/html/report.html | 20 ++++++++++++++++++++
 scripts/lib/buildstats.py               | 15 +++++++++++++--
 scripts/oe-build-perf-report            | 17 ++++++++++++++++-
 3 files changed, 49 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/build_perf/html/report.html b/scripts/lib/build_perf/html/report.html
index a7ca5b0cb0..00ecec884b 100644
--- a/scripts/lib/build_perf/html/report.html
+++ b/scripts/lib/build_perf/html/report.html
@@ -246,6 +246,26 @@ h3 {
                 </td>
               </tr>
             </table>
+
+            {# Recipe version differences #}
+            {% if measurement.buildstats.ver_diff %}
+              <div style="margin-top: 16px">Recipe version changes</div>
+              <table class="details">
+                {% for head, recipes in measurement.buildstats.ver_diff.items() %}
+                  <tr>
+                    <th colspan="2">{{ head }}</th>
+                  </tr>
+                  {% for name, info in recipes|sort %}
+                    <tr>
+                      <td>{{ name }}</td>
+                      <td>{{ info }}</td>
+                    </tr>
+                  {% endfor %}
+                {% endfor %}
+              </table>
+            {% else %}
+              <div style="margin-top: 16px">No recipe version changes detected</div>
+            {% endif %}
           {% endif %}
         </div>
       {% endfor %}
diff --git a/scripts/lib/buildstats.py b/scripts/lib/buildstats.py
index b1c9e617c6..d9aadf3cb8 100644
--- a/scripts/lib/buildstats.py
+++ b/scripts/lib/buildstats.py
@@ -157,9 +157,9 @@ class BSRecipe(object):
         self.version = version
         self.revision = revision
         if epoch is None:
-            self.nevr = "{}-{}-{}".format(name, version, revision)
+            self.evr = "{}-{}".format(version, revision)
         else:
-            self.nevr = "{}-{}_{}-{}".format(name, epoch, version, revision)
+            self.evr = "{}_{}-{}".format(epoch, version, revision)
         self.tasks = {}
 
     def aggregate(self, bsrecipe):
@@ -176,6 +176,10 @@ class BSRecipe(object):
                 self.tasks[taskname] = BSTaskAggregate([self.tasks[taskname]])
             self.tasks[taskname].append(taskdata)
 
+    @property
+    def nevr(self):
+        return self.name + '-' + self.evr
+
 
 class BuildStats(dict):
     """Class representing buildstats of one build"""
@@ -323,6 +327,7 @@ class BSVerDiff(object):
         self.vchanged = {}
         self.rchanged = {}
         self.unchanged = {}
+        self.empty_diff = False
 
         common = recipes2.intersection(recipes1)
         if common:
@@ -336,3 +341,9 @@ class BSVerDiff(object):
                     self.rchanged[recipe] = rdiff
                 else:
                     self.unchanged[recipe] = rdiff
+
+        if len(recipes1) == len(recipes2) == len(self.unchanged):
+            self.empty_diff = True
+
+    def __bool__(self):
+        return not self.empty_diff
diff --git a/scripts/oe-build-perf-report b/scripts/oe-build-perf-report
index 8d9c53f91f..7296450b9c 100755
--- a/scripts/oe-build-perf-report
+++ b/scripts/oe-build-perf-report
@@ -31,7 +31,7 @@ from build_perf import print_table
 from build_perf.report import (metadata_xml_to_json, results_xml_to_json,
                                aggregate_data, aggregate_metadata, measurement_stats)
 from build_perf import html
-from buildstats import BuildStats, diff_buildstats
+from buildstats import BuildStats, diff_buildstats, BSVerDiff
 
 scriptpath.add_oe_lib_path()
 
@@ -338,6 +338,7 @@ class BSSummary(object):
         self.top_consumer = None
         self.top_decrease = None
         self.top_increase = None
+        self.ver_diff = OrderedDict()
 
         tasks_diff = diff_buildstats(bs1, bs2, 'cputime')
 
@@ -350,6 +351,20 @@ class BSSummary(object):
         self.top_decrease = tasks_diff[0:5]
         self.top_increase = tasks_diff[-5:]
 
+        # Compare recipe versions and prepare data for display
+        ver_diff = BSVerDiff(bs1, bs2)
+        if ver_diff:
+            if ver_diff.new:
+                self.ver_diff['New recipes'] = [(n, r.evr) for n, r in ver_diff.new.items()]
+            if ver_diff.dropped:
+                self.ver_diff['Dropped recipes'] = [(n, r.evr) for n, r in ver_diff.dropped.items()]
+            if ver_diff.echanged:
+                self.ver_diff['Epoch changed'] = [(n, "{} &rarr; {}".format(r.left.evr, r.right.evr)) for n, r in ver_diff.echanged.items()]
+            if ver_diff.vchanged:
+                self.ver_diff['Version changed'] = [(n, "{} &rarr; {}".format(r.left.version, r.right.version)) for n, r in ver_diff.vchanged.items()]
+            if ver_diff.rchanged:
+                self.ver_diff['Revision changed'] = [(n, "{} &rarr; {}".format(r.left.evr, r.right.evr)) for n, r in ver_diff.rchanged.items()]
+
 
 def print_html_report(data, id_comp, buildstats):
     """Print report in html format"""
-- 
2.12.3


