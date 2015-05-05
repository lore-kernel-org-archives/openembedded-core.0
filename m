Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E8DE771144
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 May 2015 12:57:37 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 05 May 2015 05:57:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,372,1427785200"; d="scan'208";a="723963087"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 05 May 2015 05:57:25 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 7E5926A408D;
	Tue,  5 May 2015 05:56:49 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 May 2015 15:57:13 +0300
Message-Id: <1430830633-30115-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <D16E537B.5AAE0%belen.barros.pena@intel.com>
References: <D16E537B.5AAE0%belen.barros.pena@intel.com>
Subject: [PATCH] bitbake: toastergui: show relative paths in configvars view
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
X-List-Received-Date: Tue, 05 May 2015 12:57:38 -0000

Stripped topdir from paths to config files in configvars view.

[YOCTO #7463]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 bitbake/lib/toaster/toastergui/templates/configvars.html   | 4 ++--
 bitbake/lib/toaster/toastergui/templatetags/projecttags.py | 6 ++++++
 bitbake/lib/toaster/toastergui/views.py                    | 2 ++
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/bitbake/lib/toaster/toastergui/templates/configvars.html b/bitbake/lib/toaster/toastergui/templates/configvars.html
index 3e4c7e8..99ffe8b 100644
--- a/bitbake/lib/toaster/toastergui/templates/configvars.html
+++ b/bitbake/lib/toaster/toastergui/templates/configvars.html
@@ -55,7 +55,7 @@
         <td class="variable_value"><a data-toggle="modal" href="#variable-{{variable.pk}}">{{variable.variable_value|truncatechars:153}}</a></td>
         <td class="file"><a data-toggle="modal" href="#variable-{{variable.pk}}">
             {% if variable.vhistory.all %} {% autoescape off %}
-                {{variable.vhistory.all | filter_setin_files:file_filter | cut_layer_path_prefix:layer_names}}
+                {{variable.vhistory.all | filter_setin_files:file_filter | cut_layer_path_prefix:layer_names | cut_topdir_path_prefix:topdir}}
             {% endautoescape %} {% endif %}
         </a></td>
         <td class="description">
@@ -115,7 +115,7 @@
                 <tbody>
                     {% for vh in variable.vhistory.all %}
                     <tr>
-                        <td>{{forloop.counter}}</td><td>{{vh.file_name|cut_layer_path_prefix:layer_names}}</td><td>{{vh.operation}}</td><td>{{vh.line_number}}</td>
+                        <td>{{forloop.counter}}</td><td>{{vh.file_name|cut_layer_path_prefix:layer_names|cut_topdir_path_prefix:topdir}}</td><td>{{vh.operation}}</td><td>{{vh.line_number}}</td>
                     </tr>
                     {%endfor%}
                 </tbody>
diff --git a/bitbake/lib/toaster/toastergui/templatetags/projecttags.py b/bitbake/lib/toaster/toastergui/templatetags/projecttags.py
index 54700e3..67762a5 100644
--- a/bitbake/lib/toaster/toastergui/templatetags/projecttags.py
+++ b/bitbake/lib/toaster/toastergui/templatetags/projecttags.py
@@ -20,6 +20,7 @@
 # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
 from datetime import datetime, timedelta
+from os.path import relpath
 import re
 from django import template
 from django.utils import timezone
@@ -326,3 +327,8 @@ def cut_layer_path_prefix(fullpath,layer_names):
                 parts = re.split(lname, fullpath, 1)
                 return lname + parts[1]
     return fullpath
+
+@register.filter
+def cut_topdir_path_prefix(fullpath, topdir):
+    """Cut topdir from the fullpath."""
+    return relpath(fullpath, topdir) if fullpath.startswith(topdir) else fullpath
diff --git a/bitbake/lib/toaster/toastergui/views.py b/bitbake/lib/toaster/toastergui/views.py
index 7849b50..d2cd367 100755
--- a/bitbake/lib/toaster/toastergui/views.py
+++ b/bitbake/lib/toaster/toastergui/views.py
@@ -39,6 +39,7 @@ from datetime import timedelta, datetime, date
 from django.utils import formats
 from toastergui.templatetags.projecttags import json as jsonfilter
 import json
+from os.path import dirname
 
 # all new sessions should come through the landing page;
 # determine in which mode we are running in, and redirect appropriately
@@ -1326,6 +1327,7 @@ def configvars(request, build_id):
                 'default_orderby' : 'variable_name:+',
                 'search_term':search_term,
                 'layer_names' : layer_names,
+                'topdir': dirname(build_dir),
             # Specifies the display of columns for the table, appearance in "Edit columns" box, toggling default show/hide, and specifying filters for columns
                 'tablecols' : [
                 {'name': 'Variable',
-- 
2.1.4


