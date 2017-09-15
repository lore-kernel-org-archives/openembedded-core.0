Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 600C37868A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Sep 2017 12:55:03 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP; 15 Sep 2017 05:55:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,396,1500966000"; d="scan'208";a="1014792792"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga003.jf.intel.com with ESMTP; 15 Sep 2017 05:55:04 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Sep 2017 15:54:55 +0300
Message-Id: <602cc5b3dfa56fc65892788fbeed4e2062b20efd.1505479710.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <cover.1505479710.git.markus.lehtonen@linux.intel.com>
References: <cover.1505479710.git.markus.lehtonen@linux.intel.com>
In-Reply-To: <cover.1505479710.git.markus.lehtonen@linux.intel.com>
References: <cover.1505479710.git.markus.lehtonen@linux.intel.com>
Subject: [PATCH 7/7] scripts/oe-build-perf-report: tidy up html syntax
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
X-List-Received-Date: Fri, 15 Sep 2017 12:55:03 -0000

Fix some problems in the html syntax of the generated report:
- prevent empty rows in the summary table
- add one missing column in the results table

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/lib/build_perf/html/report.html | 36 ++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/scripts/lib/build_perf/html/report.html b/scripts/lib/build_perf/html/report.html
index 165cbb811c..f983a4a09c 100644
--- a/scripts/lib/build_perf/html/report.html
+++ b/scripts/lib/build_perf/html/report.html
@@ -118,29 +118,32 @@ h3 {
       {% else %}
         {% set row_style = 'style="background-color: #ffffff"' %}
       {% endif %}
-      <tr {{ row_style }}><td>{{ test.name }}: {{ test.description }}</td>
       {% if test.status == 'SUCCESS' %}
         {% for measurement in test.measurements %}
-          {# add empty cell in place of the test name#}
-          {% if loop.index > 1 %}<td></td>{% endif %}
-          {% if measurement.absdiff > 0 %}
-            {% set result_style = "color: red" %}
-          {% elif measurement.absdiff == measurement.absdiff %}
-            {% set result_style = "color: green" %}
-          {% else %}
-            {% set result_style = "color: orange" %}
-          {%endif %}
-          <td>{{ measurement.description }}</td>
-          <td style="font-weight: bold">{{ measurement.value.mean }}</td>
-          <td style="{{ result_style }}">{{ measurement.absdiff_str }}</td>
-          <td style="{{ result_style }}">{{ measurement.reldiff }}</td>
-          </tr><tr {{ row_style }}>
+          <tr {{ row_style }}>
+            {% if loop.index == 1 %}
+              <td>{{ test.name }}: {{ test.description }}</td>
+            {% else %}
+              {# add empty cell in place of the test name#}
+              <td></td>
+            {% endif %}
+            {% if measurement.absdiff > 0 %}
+              {% set result_style = "color: red" %}
+            {% elif measurement.absdiff == measurement.absdiff %}
+              {% set result_style = "color: green" %}
+            {% else %}
+              {% set result_style = "color: orange" %}
+            {%endif %}
+            <td>{{ measurement.description }}</td>
+            <td style="font-weight: bold">{{ measurement.value.mean }}</td>
+            <td style="{{ result_style }}">{{ measurement.absdiff_str }}</td>
+            <td style="{{ result_style }}">{{ measurement.reldiff }}</td>
+          </tr>
         {% endfor %}
       {% else %}
         <td style="font-weight: bold; color: red;">{{test.status }}</td>
         <td></td> <td></td> <td></td> <td></td>
       {% endif %}
-      </tr>
     {% endfor %}
   </table>
 
@@ -186,6 +189,7 @@ h3 {
                     <th>Stdev</th><td>{{ measurement.value.stdev }}</td>
                   </tr><tr>
                     <th><div id="{{ test.name }}_{{ measurement.name }}_chart_png"></div></th>
+                    <td></td>
                   </tr>
                 </table>
               </td>
-- 
2.12.3


