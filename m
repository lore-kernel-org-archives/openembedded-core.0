Return-Path: <roxana.ciobanu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4FA1170F3F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Aug 2014 08:49:40 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 22 Aug 2014 01:49:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,378,1406617200"; d="scan'208";a="580310881"
Received: from roxana-optiplex-9010.rb.intel.com ([10.237.105.58])
	by fmsmga001.fm.intel.com with ESMTP; 22 Aug 2014 01:49:30 -0700
From: Roxana Ciobanu <roxana.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Aug 2014 11:49:40 +0300
Message-Id: <3d0b8f9ba07b12983b53db7531bfb7e6ac4bbf79.1408696291.git.roxana.ciobanu@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1408696291.git.roxana.ciobanu@intel.com>
References: <cover.1408696291.git.roxana.ciobanu@intel.com>
In-Reply-To: <cover.1408696291.git.roxana.ciobanu@intel.com>
References: <cover.1408696291.git.roxana.ciobanu@intel.com>
Subject: [PATCH 4/9] error-report: add 'Edit columns' menu
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
X-List-Received-Date: Fri, 22 Aug 2014 08:49:41 -0000

Add 'Edit columns' menu.

[YOCTO #6538]

Signed-off-by: Roxana Ciobanu <roxana.ciobanu@intel.com>
---
 Post/templatetags/__init__.py    |   0
 Post/templatetags/projecttags.py |  12 +++++
 Post/views.py                    |  26 +++++++++-
 templates/search-details.html    | 105 ++++++++++++++++++++++++++-------------
 4 files changed, 108 insertions(+), 35 deletions(-)
 create mode 100644 Post/templatetags/__init__.py
 create mode 100644 Post/templatetags/projecttags.py

diff --git a/Post/templatetags/__init__.py b/Post/templatetags/__init__.py
new file mode 100644
index 0000000..e69de29
diff --git a/Post/templatetags/projecttags.py b/Post/templatetags/projecttags.py
new file mode 100644
index 0000000..cd2e0bd
--- /dev/null
+++ b/Post/templatetags/projecttags.py
@@ -0,0 +1,12 @@
+from datetime import datetime, timedelta
+import re
+from django import template
+from django.utils import timezone
+from django.template.defaultfilters import filesizeformat
+
+register = template.Library()
+
+@register.filter(name = 'sortcols')
+def sortcols(tablecols):
+    return sorted(tablecols, key = lambda t: t['name'])
+
diff --git a/Post/views.py b/Post/views.py
index 02f80fc..f9c6655 100644
--- a/Post/views.py
+++ b/Post/views.py
@@ -84,7 +84,31 @@ def search(request, template_name, items = None, page = None, query = None):
     else:
         index = paginator.page_range.index(c.number) - 2
         end = index + 5
-    return render_to_response(template_name, {'details':c, 'd' : query, "no" : no, 'list' : paginator.page_range[index:end], 'items' : items}, RequestContext(request))
+
+    context = {
+        'details':c,
+        'd' : query,
+        "no" : no,
+        'list' : paginator.page_range[index:end],
+        'items' : items,
+        'objectname' : 'errors',
+        'tablecols' : [
+        {'name': 'Submitted on', 'clclass': 'submitted_on'},
+        {'name': 'Recipe'},
+        {'name': 'Recipe version', 'clclass': 'recipe_version'},
+        {'name': 'Task'},
+        {'name': 'Machine'},
+        {'name': 'Distro'},
+        {'name': 'Build system', 'clclass': 'build_sys', 'hidden': 1},
+        {'name': 'Target system', 'clclass': 'target_sys', 'hidden': 1},
+        {'name': 'Host distro', 'clclass': 'host_distro'},
+        {'name': 'Branch', 'clclass': 'branch'},
+        {'name': 'Commit', 'clclass': 'commit'},
+        {'name': 'Submitter', 'clclass': 'submitter','hidden': 1}],
+    }
+
+    return render_to_response(template_name, context, RequestContext(request))
+
 
 def searchDetails(request, template_name, pk, page = None, query = None, items = None):
     results=''
diff --git a/templates/search-details.html b/templates/search-details.html
index b6c2b7e..269aa62 100644
--- a/templates/search-details.html
+++ b/templates/search-details.html
@@ -1,58 +1,88 @@
 {% extends "base.html" %}
 {% load i18n %}
 {% load staticfiles %}
+{% load projecttags %}
 <!DOCTYPE html>
 <html>
 	<body>
-
 		{% block content %}
+		<script>$
+		function showhideTableColumn( clname, sh) {
+			if ( sh ) {
+				$('.' + clname ).show( 100 );
+			}
+			else {
+				$('.' + clname ).hide( 100 );
+			}
+		}
+		</script>
+
 			<div class="row-fluid">
 				<div class="page-header">
 					{% if no %}
 						<h1>{{ no }} errors found for "{{ d }}"</h1>
 					{% endif %}
 				</div>
-				{% if details %}
+				<div class="navbar">
+					<div class="navbar-inner">
+						{% if tablecols %}
+							<div class="btn-group pull-right">
+								<button class="btn dropdown-toggle" data-toggle="dropdown">Edit columns
+									<span class="caret"></span>
+								</button>
+								<ul id='editcol' class="dropdown-menu">
+									{% for i in tablecols|sortcols %}
+									<li>
+									<label {% if not i.clclass %} class="checkbox muted" {%else%} class="checkbox" {%endif%}>
+										<input type="checkbox" class="chbxtoggle"
+										{% if i.clclass %}
+											id="{{i.clclass}}"
+											value="ct{{i.name}}"
+											{% if not i.hidden %}
+												checked="checked"
+											{%endif%}
+											onclick="showhideTableColumn($(this).attr('id'), $(this).is(':checked'))"
+										{%else%}
+											checked disabled
+										{% endif %}/>   {{i.name}}
+									</label>
+									</li>
+									{% endfor %}
+								</ul>
+						{% endif %}
+					</div>
+				</div> <!-- navbar-inner -->
+			</div>
+			{% if details %}
 					<table class="table table-bordered table-hover">
 						<thead>
 							<tr>
-								<th>Submitted on</th>
-								<th>Recipe</th>
-								<th>Recipe version</th>
-								<th>Task</th>
-								<th>Machine</th>
-								<th>Distro</th>
-								<th>Build system</th>
-								<th>Target system</th>
-								<th>Host distro</th>
-								<th>Branch</th>
-								<th>Commit</th>
-								<th>Submitter</th>
+								{% for i in tablecols %} <th class="{{i.dclass}} {{i.clclass}}"> {{i.name}} </th> {%endfor%}
 							</tr>
 						</thead>
 						<tbody>
 							{%for detail in details %}
-								<tr>
-									<td><a href="{% url id detail.id details.number items d %}">{{ detail.BUILD.DATE|date:"d/m/y H:i"}}</a></td>
-									<td><a href="{% url id detail.id details.number items d %}">{{ detail.RECIPE }}</a></td>
-									<td><a href="{% url id detail.id details.number items d %}">{{ detail.RECIPE_VERSION }}</a></td>
-									<td><a href="{% url id detail.id details.number items d %}">{{ detail.TASK }}</a></td>
-									<td><a href="{% url id detail.id details.number items d %}">{{ detail.BUILD.MACHINE }}</a></td>
-									<td><a href="{% url id detail.id details.number items d %}">{{ detail.BUILD.DISTRO }}</a></td>
-									<td><a href="{% url id detail.id details.number items d %}">{{ detail.BUILD.BUILD_SYS }}</a></td>
-									<td><a href="{% url id detail.id details.number items d %}">{{ detail.BUILD.TARGET_SYS }}</a></td>
-									<td><a href="{% url id detail.id details.number items d %}">{{ detail.BUILD.NATIVELSBSTRING }}</a></td>
-									<td><a href="{% url id detail.id details.number items d %}">{{ detail.BUILD.BRANCH }} </a></td>
+								<tr class="data">
+									<td class="submitted_on"> <a href="{% url id detail.id details.number items d %}">{{ detail.BUILD.DATE|date:"d/m/y H:i"}}</a></td>
+									<td class="recipe"><a href="{% url id detail.id details.number items d %}">{{ detail.RECIPE }}</a></td>
+									<td class="recipe_version"><a href="{% url id detail.id details.number items d %}">{{ detail.RECIPE_VERSION }}</a></td>
+									<td class="task"><a href="{% url id detail.id details.number items d %}">{{ detail.TASK }}</a></td>
+									<td class="machine"><a href="{% url id detail.id details.number items d %}">{{ detail.BUILD.MACHINE }}</a></td>
+									<td class="distro"><a href="{% url id detail.id details.number items d %}">{{ detail.BUILD.DISTRO }}</a></td>
+									<td class="build_sys"><a href="{% url id detail.id details.number items d %}">{{ detail.BUILD.BUILD_SYS }}</a></td>
+									<td class="target_sys"><a href="{% url id detail.id details.number items d %}">{{ detail.BUILD.TARGET_SYS }}</a></td>
+									<td class="host_distro"><a href="{% url id detail.id details.number items d %}">{{ detail.BUILD.NATIVELSBSTRING }}</a></td>
+									<td class="branch"><a href="{% url id detail.id details.number items d %}">{{ detail.BUILD.BRANCH }} </a></td>
 									<td class="commit">
 										{% autoescape off %}
 											<div class="btn" rel="popover" data-content= {{ detail.BUILD.COMMIT|escape}} title="">
 												{% endautoescape %}
-												{{ detail.BUILD.COMMIT|truncatechars:10}}
+											{{ detail.BUILD.COMMIT|truncatechars:10}}
 											</div>
-						            </td>
-									<td><a href="{% url id detail.id details.number items d %}">{{ detail.BUILD.NAME }} </a></td>
+									</td>
+									<td class="submitter"><a href="{% url id detail.id details.number items d %}">{{ detail.BUILD.NAME }} </a></td>
 								</tr>
-							 {%endfor%}
+							{%endfor%}
 						</tbody>
 					</table>
 						<div class="pagination pagination-centered">
@@ -130,11 +160,18 @@
 				           <h4>Nothing matches your search!</h4>
 				{% endif %}
 			</div>
-		    <script>
-		    $(document).ready(function() {
-		    	$('.commit > div').popover({placement:'left'})
-		    });
-		    </script>
+				<script>
+				$(document).ready(function() {
+					$('.commit > div').popover({placement:'left'})
+					$('.chbxtoggle').each(function () {
+						showhideTableColumn($(this).attr('id'), $(this).is(':checked'))
+					});
+					//turn edit columns dropdown into a multi-select menu$
+					$('.dropdown-menu input, .dropdown-menu label').click(function(e) {
+						e.stopPropagation();
+					});$
+				});
+			</script>
 		{% endblock %}
 	</body>
 </html>
-- 
1.9.1


