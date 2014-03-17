Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id 9746C6EF9D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Mar 2014 09:25:21 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id d17so3910636eek.29
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Mar 2014 02:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=QwXYQN/65cuZh2dvPYYY+nANqnDc2bvsSN8lstO8yoE=;
	b=i/gpdaqumWDPYMYUg8BOgWh+pB8SfOrtJpCuiv8XwQezcSjZukGNNONX7PVRIgebsY
	hT2puB+vprJlOXsabq7By7hibY6A1EDqtLZmOErsAVIXLa+D19SkbXDtjTYZdj1H1dQ3
	ifsaFggUcI8kUapztZNK04CtSwnYzK5YQYD73qPoBC9pdm9EVI2Em3D1EfHqC367/e28
	Mitu0ZjwoSbEOpF53MVylrRtlD191V89Gd8TjgAEtkNBKkwqaGtCRz4B8M+Jz67LMxhA
	6NqpPH1j7rIrqMFjWeM8v/ieVFvEsMriNmuHU5OPCN/UOoRhQtvFiminVTP+JZuxzL0E
	46RQ==
X-Received: by 10.14.122.193 with SMTP id t41mr272109eeh.110.1395048322861;
	Mon, 17 Mar 2014 02:25:22 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	m8sm38287194eeg.11.2014.03.17.02.25.21 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Mar 2014 02:25:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Mar 2014 10:25:38 +0100
Message-Id: <1395048338-25754-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1394820950-17162-1-git-send-email-Martin.Jansa@gmail.com>
References: <1394820950-17162-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [WIP][PATCHv2] report-error: Allow to upload reports automatically
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
X-List-Received-Date: Mon, 17 Mar 2014 09:25:22 -0000

* useful when distro wants to collect build statistics from
  all users/developers without any manual interaction from them

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/report-error.bbclass    | 103 ++++++++++++++++++++++++++++++++++-
 meta/conf/local.conf.sample.extended |  20 +++++++
 2 files changed, 121 insertions(+), 2 deletions(-)

diff --git a/meta/classes/report-error.bbclass b/meta/classes/report-error.bbclass
index 479b38d..58bce0d 100644
--- a/meta/classes/report-error.bbclass
+++ b/meta/classes/report-error.bbclass
@@ -7,6 +7,12 @@
 # Licensed under the MIT license, see COPYING.MIT for details
 
 ERR_REPORT_DIR ?= "${LOG_DIR}/error-report"
+ERR_REPORT_PORT ?= "80"
+
+ERR_REPORT_UPLOAD_FAILURES[type] = "boolean"
+ERR_REPORT_UPLOAD_FAILURES ?= "0"
+ERR_REPORT_UPLOAD_ALL[type] = "boolean"
+ERR_REPORT_UPLOAD_ALL ?= "0"
 
 def errorreport_getdata(e):
     logpath = e.data.getVar('ERR_REPORT_DIR', True)
@@ -24,6 +30,92 @@ def errorreport_savedata(e, newdata, file):
         json.dump(newdata, f, indent=4, sort_keys=True)
     return datafile
 
+def errorreport_get_user_info(e):
+    """
+    Read user info from variables or from git config
+    """
+    import subprocess
+    username = e.data.getVar('ERR_REPORT_USERNAME', True)
+    email = e.data.getVar('ERR_REPORT_EMAIL', True)
+    if not username or email:
+        # try to read them from git config
+        username = subprocess.check_output(['git', 'config', '--get', 'user.name']).strip()
+        email = subprocess.check_output(['git', 'config', '--get', 'user.email']).strip()
+    return (username, email)
+
+def errorreport_get_submit_info(e):
+    """
+    Read submit info from ~/.oe-send-error or ask interactively and save it there.
+    """
+    home = os.path.expanduser("~")
+    userfile = os.path.join(home, ".oe-send-error")
+    if os.path.isfile(userfile):
+        with open(userfile) as g:
+            username = g.readline()
+            email = g.readline()
+    else:
+        print("Please enter your name and your email (optionally), they'll be saved in the file you send.")
+        username = raw_input("Name: ")
+        email = raw_input("E-mail (not required): ")
+        server = raw_input("Server: ")
+        port = raw_input("Port: ")
+        if len(username) > 0 and len(username) < 50:
+            with open(userfile, "w") as g:
+                g.write(username + "\n")
+                g.write(email + "\n")
+                g.write(server + "\n")
+                g.write(port + "\n")
+        else:
+            print("Invalid inputs, try again.")
+            return errorreport_get_submit_info()
+        return (username, email, server, port)
+
+def errorreport_senddata(e, json_file):
+    """
+    From scripts/send-error-report to automate report submissions.
+    """
+
+    import httplib, urllib, os, sys, json, subprocess
+
+    if os.path.isfile(json_file):
+        server = e.data.getVar('ERR_REPORT_SERVER', True)
+        port = e.data.getVar('ERR_REPORT_PORT', True)
+        bb.note("Uploading the report to %s:%s" % (server, port))
+
+        with open(json_file) as f:
+            data = f.read()
+
+        try:
+            jsondata = json.loads(data)
+            if not jsondata['username'] or not server:
+                (username, email, server, port) = errorreport_get_submit_info(e)
+                jsondata['username'] = username.strip()
+                jsondata['email'] = email.strip()
+            data = json.dumps(jsondata, indent=4, sort_keys=True)
+        except:
+            bb.error("Invalid json data")
+            return
+
+        try:
+            params = urllib.urlencode({'data': data})
+            headers = {"Content-type": "application/json"}
+            conn = httplib.HTTPConnection(server, port)
+            conn.request("POST", "/ClientPost/", params, headers)
+            response = conn.getresponse()
+            res = response.read()
+            if response.status == 200:
+                bb.note(res)
+            else:
+                bb.warn("There was a problem submiting your data, response written in %s.response.html" % json_file)
+                with open("%s.response.html" % json_file, "w") as f:
+                    f.write(res)
+            conn.close()
+        except:
+            bb.warn("Server connection failed")
+
+    else:
+        bb.warn("No data file found.")
+
 python errorreport_handler () {
         import json
 
@@ -38,6 +130,9 @@ python errorreport_handler () {
             data['failures'] = []
             data['component'] = e.getPkgs()[0]
             data['branch_commit'] = base_detect_branch(e.data) + ": " + base_detect_revision(e.data)
+            (username, email) = errorreport_get_user_info(e)
+            data['username'] = username.strip()
+            data['email'] = email.strip()
             errorreport_savedata(e, data, "error-report.txt")
 
         elif isinstance(e, bb.build.TaskFailed):
@@ -55,11 +150,15 @@ python errorreport_handler () {
 
         elif isinstance(e, bb.event.BuildCompleted):
             jsondata = json.loads(errorreport_getdata(e))
+            upload_failures = oe.data.typed_value('ERR_REPORT_UPLOAD_FAILURES', e.data)
+            upload_all = oe.data.typed_value('ERR_REPORT_UPLOAD_ALL', e.data)
             failures = jsondata['failures']
-            if(len(failures) > 0):
+            if failures or upload_all:
                 filename = "error_report_" + e.data.getVar("BUILDNAME")+".txt"
                 datafile = errorreport_savedata(e, jsondata, filename)
-                bb.note("The errors of this build are stored in: %s. You can send the errors to an upstream server by running: send-error-report %s [server]" % (datafile, datafile))
+                bb.note("The report of this build are stored in: %s." % (datafile))
+                if upload_all or (failures and upload_failures):
+                    errorreport_senddata(e, datafile)
 }
 
 addhandler errorreport_handler
diff --git a/meta/conf/local.conf.sample.extended b/meta/conf/local.conf.sample.extended
index 5f10886..14d39e2 100644
--- a/meta/conf/local.conf.sample.extended
+++ b/meta/conf/local.conf.sample.extended
@@ -304,3 +304,23 @@
 #INITRAMFS_IMAGE = "core-image-minimal-initramfs"
 #INITRAMFS_IMAGE_BUNDLE = "1"
 
+#
+# Uploading reports with report-error.bbclass
+#
+# Allow to automatically upload the reports without developer calling extra script to upload them.
+#
+# ERR_REPORT_SERVER = "caprica.palm.com"
+# ERR_REPORT_PORT = "8000"
+#
+# Username if you don't want to use "git config --get user.name"
+# ERR_REPORT_USERNAME = "Tester"
+# E-mail if you don't want to use "git config --get user.email"
+# ERR_REPORT_EMAIL = "tester@test.ltd"
+#
+# Upload reports from failed builds
+# ERR_REPORT_UPLOAD_FAILURES = "1"
+#
+# Upload reports from all builds, not only those with failures
+# ERR_REPORT_UPLOAD_ALL = "1"
+#
+# INHERIT += "report-error"
-- 
1.9.0


