Return-Path: <roxana.ciobanu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 8650460DF7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 11:07:22 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 04 Aug 2014 04:00:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="367604368"
Received: from unknown (HELO roxana-OptiPlex-9010.rb.intel.com)
	([10.237.105.58])
	by FMSMGA003.fm.intel.com with ESMTP; 04 Aug 2014 04:04:01 -0700
From: Roxana Ciobanu <roxana.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Aug 2014 14:07:45 +0300
Message-Id: <7f58ec97929b7272c20bc4affaa6dc92927d8bbd.1407150413.git.roxana.ciobanu@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1407150413.git.roxana.ciobanu@intel.com>
References: <cover.1407150413.git.roxana.ciobanu@intel.com>
In-Reply-To: <cover.1407150413.git.roxana.ciobanu@intel.com>
References: <cover.1407150413.git.roxana.ciobanu@intel.com>
Subject: [PATCH 1/1] error page/search result page: Display submission date/time information
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
X-List-Received-Date: Mon, 04 Aug 2014 11:07:22 -0000

Show the submission date and time for an error in the search
results page as a table column and in the the error page as
a definition list item in the "Error details" section.

Signed-off-by: Roxana Ciobanu <roxana.ciobanu@intel.com>
---
 Post/createStatistics.py      |  4 ++++
 Post/getInfo.py               |  3 +++
 Post/parser.py                |  3 ++-
 templates/error-details.html  |  2 ++
 templates/home.html           | 13 +++++++++++++
 templates/search-details.html |  2 ++
 6 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/Post/createStatistics.py b/Post/createStatistics.py
index e4d9e3f..1df3e51 100644
--- a/Post/createStatistics.py
+++ b/Post/createStatistics.py
@@ -39,6 +39,10 @@ class Statistics:
     def chart_statistics(self, string):
         startdate = datetime.now()
         enddate = startdate - timedelta(days=30)
+        if string == "DATE":
+            date = Build.objects.filter(DATE__range=[enddate, startdate]).values('DATE').annotate(dcount=Count('DATE'))
+            items = list(date)
+            return self.create_statistic(items, "DATE")
         if string == "MACHINE":
             machines = Build.objects.filter(DATE__range=[enddate, startdate]).values('MACHINE').annotate(dcount=Count('MACHINE'))
             items = list(machines)
diff --git a/Post/getInfo.py b/Post/getInfo.py
index 3e9936d..5f0c3eb 100644
--- a/Post/getInfo.py
+++ b/Post/getInfo.py
@@ -68,6 +68,9 @@ class Info:
                 except:
                     pass
 
+            if category == "DATE":
+                build = Build.objects.filter(DATE__icontains = string)
+                results.append(self.getBuildFailures(build))
             if category == "MACHINE":
                 build = Build.objects.filter(MACHINE__icontains = string)
                 results.append(self.getBuildFailures(build))
diff --git a/Post/parser.py b/Post/parser.py
index 35325f1..fae9194 100644
--- a/Post/parser.py
+++ b/Post/parser.py
@@ -10,6 +10,7 @@
 import sys, os, json, re
 from Post.models import Build, BuildFailure
 from django.conf import settings
+from django.utils import timezone
 from datetime import datetime
 
 class Parser:
@@ -30,7 +31,7 @@ class Parser:
         NAME = str(jsondata['username'])
         EMAIL = str(jsondata['email'])
         g = re.match(r'(.*): (.*)', str(BRANCH_COMMIT))
-        b=Build(DATE = datetime.now(), MACHINE = MACHINE_NAME, BRANCH = g.group(1), COMMIT = str(g.group(2)), TARGET = COMPONENT, DISTRO = DISTRO, NATIVELSBSTRING = NATIVELSBSTRING, BUILD_SYS = BUILD_SYS, TARGET_SYS = TARGET_SYS, NAME = NAME, EMAIL = EMAIL)
+        b=Build(DATE = timezone.now(), MACHINE = MACHINE_NAME, BRANCH = g.group(1), COMMIT = str(g.group(2)), TARGET = COMPONENT, DISTRO = DISTRO, NATIVELSBSTRING = NATIVELSBSTRING, BUILD_SYS = BUILD_SYS, TARGET_SYS = TARGET_SYS, NAME = NAME, EMAIL = EMAIL)
         b.save()
         failures = jsondata['failures']
         for fail in failures:
diff --git a/templates/error-details.html b/templates/error-details.html
index 0de5f46..f2dc010 100644
--- a/templates/error-details.html
+++ b/templates/error-details.html
@@ -21,6 +21,8 @@
 					<div class="well">
 						<h2>Error details</h2>
 						<dl class="dl-vertical">
+							<dt>Submitted on:</dt>
+							<dd>{{ detail.BUILD.DATE|date:"d/m/y H:i"}}</dd>
 							<dt>Task:</dt>
 							<dd>{{ detail.TASK }}</dd>
 							<dt>Recipe:</dt>
diff --git a/templates/home.html b/templates/home.html
index 6c8a1e7..77c31d9 100644
--- a/templates/home.html
+++ b/templates/home.html
@@ -25,6 +25,13 @@
 						{% include_container "r" %}
 					</div>
 				</li>
+				<li class="span6">
+					<h2>By date</h2>
+					<div class="thumbnail">
+						<p style="display:none">{% load_chart charttype chartdata "r"%}</p>
+						{% include_container "r" %}
+					</div>
+				</li>
 			</ul>
 			</div>
 			<div class="row-fluid">
@@ -160,6 +167,12 @@
 
 					
 					if ($("#m").text() == ""){
+						$.get('{% url statistics "DATE" %}', function(data){
+						draw = modify_chart(data, "By date", "m");
+						$("#m").html(draw);
+					})
+					}
+					if ($("#m").text() == ""){
 						$.get('{% url statistics "MACHINE" %}', function(data){
 						draw = modify_chart(data, "By machine", "m");
 						$("#m").html(draw);
diff --git a/templates/search-details.html b/templates/search-details.html
index cf57507..3941a1f 100644
--- a/templates/search-details.html
+++ b/templates/search-details.html
@@ -16,6 +16,7 @@
 					<table class="table table-bordered table-hover">
 						<thead>
 							<tr>
+								<th>Submitted on</th>
 								<th>Recipe</th>
 								<th>Recipe version</th>
 								<th>Task</th>
@@ -31,6 +32,7 @@
 						<tbody>
 							{%for detail in details %}
 								<tr>
+									<td><a href="{% url id detail.id details.number items d %}">{{ detail.BUILD.DATE|date:"d/m/y H:i"}}</a></td>
 									<td><a href="{% url id detail.id details.number items d %}">{{ detail.RECIPE }}</a></td>
 									<td><a href="{% url id detail.id details.number items d %}">{{ detail.RECIPE_VERSION }}</a></td>
 									<td><a href="{% url id detail.id details.number items d %}">{{ detail.TASK }}</a></td>
-- 
1.9.1


