Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 7CFF077CEC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Apr 2017 15:58:41 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga104.jf.intel.com with ESMTP; 03 Apr 2017 08:58:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,271,1486454400"; 
	d="scan'208,217";a="841292443"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by FMSMGA003.fm.intel.com with ESMTP; 03 Apr 2017 08:58:42 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Apr 2017 18:58:34 +0300
Message-Id: <20170403155839.14067-3-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20170403155839.14067-1-markus.lehtonen@linux.intel.com>
References: <20170403155839.14067-1-markus.lehtonen@linux.intel.com>
Subject: [PATCH 2/7] scripts/oe-build-perf-report: fix 'charts ready' console message
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
X-List-Received-Date: Mon, 03 Apr 2017 15:58:41 -0000

The javascript console log messages are used in scraping, when
converting an html test report to html email. Before this patch a
console message indicating that all charts have been drawn was not
correctly sent if the last test failed (or didn't have chart data for
some other reason) which, in turn, caused oe-build-perf-report-email.py
script to fail with a timeout.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/lib/build_perf/html/measurement_chart.html | 6 +++---
 scripts/lib/build_perf/html/report.html            | 5 +----
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/scripts/lib/build_perf/html/measurement_chart.html b/scripts/lib/build_perf/html/measurement_chart.html
index 26fe145..65f1a22 100644
--- a/scripts/lib/build_perf/html/measurement_chart.html
+++ b/scripts/lib/build_perf/html/measurement_chart.html
@@ -1,4 +1,5 @@
 <script type="text/javascript">
+  chartsDrawing += 1;
   google.charts.setOnLoadCallback(drawChart_{{ chart_elem_id }});
   function drawChart_{{ chart_elem_id }}() {
     var data = new google.visualization.DataTable();
@@ -39,10 +40,9 @@
       png_div = document.getElementById('{{ chart_elem_id }}_png');
       png_div.outerHTML = '<a id="{{ chart_elem_id }}_png" href="' + chart.getImageURI() + '">PNG</a>';
       console.log("CHART READY: {{ chart_elem_id }}");
-      {% if last_chart == true %}
+      chartsDrawing -= 1;
+      if (chartsDrawing == 0)
         console.log("ALL CHARTS READY");
-      {% endif %}
-      //console.log(chart_div.innerHTML);
     });
     chart.draw(data, options);
 }
diff --git a/scripts/lib/build_perf/html/report.html b/scripts/lib/build_perf/html/report.html
index e428711..165cbb8 100644
--- a/scripts/lib/build_perf/html/report.html
+++ b/scripts/lib/build_perf/html/report.html
@@ -6,17 +6,14 @@
 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
 <script type="text/javascript">
 google.charts.load('current', {'packages':['corechart']});
+var chartsDrawing = 0;
 </script>
 
 {# Render measurement result charts #}
 {% for test in test_data %}
-  {% set test_loop = loop %}
   {% if test.status == 'SUCCESS' %}
     {% for measurement in test.measurements %}
       {% set chart_elem_id = test.name + '_' + measurement.name + '_chart' %}
-      {% if test_loop.last and loop.last %}
-        {% set last_chart = true %}
-      {% endif %}
       {% include 'measurement_chart.html' %}
     {% endfor %}
   {% endif %}
-- 
2.10.2


