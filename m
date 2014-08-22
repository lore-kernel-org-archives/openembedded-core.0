Return-Path: <roxana.ciobanu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 6B78570F24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Aug 2014 08:49:37 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 22 Aug 2014 01:41:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,378,1406617200"; d="scan'208";a="580310843"
Received: from roxana-optiplex-9010.rb.intel.com ([10.237.105.58])
	by fmsmga001.fm.intel.com with ESMTP; 22 Aug 2014 01:49:21 -0700
From: Roxana Ciobanu <roxana.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Aug 2014 11:49:37 +0300
Message-Id: <c420d62bdc2a5820f1e40c0d3b5e0fdd9e3c21ef.1408696291.git.roxana.ciobanu@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1408696291.git.roxana.ciobanu@intel.com>
References: <cover.1408696291.git.roxana.ciobanu@intel.com>
In-Reply-To: <cover.1408696291.git.roxana.ciobanu@intel.com>
References: <cover.1408696291.git.roxana.ciobanu@intel.com>
Subject: [PATCH 1/9] error-report: add 'Submitted on' column
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
X-List-Received-Date: Fri, 22 Aug 2014 08:49:38 -0000

Show the submission date and time for an error in the
search results page

[YOCTO #6538]

Signed-off-by: Roxana Ciobanu <roxana.ciobanu@intel.com>
---
 Post/createStatistics.py      | 4 ++++
 Post/getInfo.py               | 3 +++
 Post/parser.py                | 3 ++-
 templates/search-details.html | 2 ++
 4 files changed, 11 insertions(+), 1 deletion(-)

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


