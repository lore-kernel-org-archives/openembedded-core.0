Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 14C206F76A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Mar 2014 18:15:37 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id e49so1703330eek.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Mar 2014 11:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=4nRsyUzkQmuf3tT2U3PNO3hrnt67TOhOCI2wpk0rt4Q=;
	b=AwF/mBdtcjLQunnjEo9sNlgSciHqk/XHIU44bMW7c66iWi65l8VwmfYr6C92U0CQMg
	xxq7QlUIls1uYzX9S+prMdNp1aziluQNsRJFktokg2AsJfC03XbdXiGCMuX0C5WHFqPd
	o4K8oGv2RVZ26fmaDPbKe9yY++HSXohVrTrmwFVE6wrj5Uryc6v7GDrlvQGwgcp0Gsgg
	HCrSrrJICX6UMXAlROIGxX2YE51wjZhuHVLXV2WyoA1JAv7YMLwVsQtZ7s/mefl4EHsV
	DdDYMfh8B0ogQNpjmGUKx205zIPSS4F9JCQ40tgXqZOGcX2oRUjwRVCCvLtoV4TBAUr+
	jqng==
X-Received: by 10.14.6.195 with SMTP id 43mr1959373een.101.1394820937852;
	Fri, 14 Mar 2014 11:15:37 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	m8sm18757927eeg.11.2014.03.14.11.15.36 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Mar 2014 11:15:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Mar 2014 19:15:50 +0100
Message-Id: <1394820950-17162-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.0
Subject: [WIP][PATCH] report-error: Allow to upload reports automatically
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
X-List-Received-Date: Fri, 14 Mar 2014 18:15:40 -0000

* useful when distro wants to collect build statistics from
  all users/developers without any manual interaction from them

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/report-error.bbclass    | 85 +++++++++++++++++++++++++++++++++++-
 meta/conf/local.conf.sample.extended | 20 +++++++++
 2 files changed, 103 insertions(+), 2 deletions(-)

diff --git a/meta/classes/report-error.bbclass b/meta/classes/report-error.bbclass
index 479b38d..0a53a60 100644
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
@@ -24,6 +30,77 @@ def errorreport_savedata(e, newdata, file):
         json.dump(newdata, f, indent=4, sort_keys=True)
     return datafile
 
+# from scripts/send-error-report to automate report submissions
+def errorreport_senddata(e, json_file):
+    import httplib, urllib, os, sys, json, subprocess
+
+    if os.path.isfile(json_file):
+        username = e.data.getVar('ERR_REPORT_USERNAME', True)
+        email = e.data.getVar('ERR_REPORT_EMAIL', True)
+        server = e.data.getVar('ERR_REPORT_SERVER', True)
+        port = e.data.getVar('ERR_REPORT_PORT', True)
+
+        if not username or email:
+            # try to read them from git config
+            username = subprocess.check_output(['git', 'config', '--get', 'user.name']).strip()
+            email = subprocess.check_output(['git', 'config', '--get', 'user.email']).strip()
+
+        if not username or not server:
+            home = os.path.expanduser("~")
+            userfile = os.path.join(home, ".oe-send-error")
+            if os.path.isfile(userfile):
+                with open(userfile) as g:
+                    username = g.readline()
+                    email = g.readline()
+            else:
+                print("Please enter your name and your email (optionally), they'll be saved in the file you send.")
+                username = raw_input("Name: ")
+                email = raw_input("E-mail (not required): ")
+                server = raw_input("Server: ")
+                port = raw_input("Port: ")
+                if len(username) > 0 and len(username) < 50:
+                    with open(userfile, "w") as g:
+                        g.write(username + "\n")
+                        g.write(email + "\n")
+                        g.write(server + "\n")
+                        g.write(port + "\n")
+                else:
+                    print("Invalid inputs, try again.")
+                    return
+
+        bb.note("Uploading the report to %s:%s" % (server, port))
+
+        with open(json_file) as f:
+            data = f.read()
+
+        try:
+            jsondata = json.loads(data)
+            jsondata['username'] = username.strip()
+            jsondata['email'] = email.strip()
+            data = json.dumps(jsondata, indent=4, sort_keys=True)
+        except:
+            print("Invalid json data")
+            return
+
+        try:
+            params = urllib.urlencode({'data': data})
+            headers = {"Content-type": "application/json"}
+            conn = httplib.HTTPConnection(server, port)
+            conn.request("POST", "/ClientPost/", params, headers)
+            response = conn.getresponse()
+            print response.status, response.reason
+            res = response.read()
+            if response.status == 200:
+                print res
+            else:
+                print("There was a problem submiting your data")
+            conn.close()
+        except:
+            print("Server connection failed")
+
+    else:
+        print("No data file found.")
+
 python errorreport_handler () {
         import json
 
@@ -55,11 +132,15 @@ python errorreport_handler () {
 
         elif isinstance(e, bb.event.BuildCompleted):
             jsondata = json.loads(errorreport_getdata(e))
+            upload_failures = oe.data.typed_value('ERR_REPORT_UPLOAD_FAILURES', e.data)
+            upload_all = oe.data.typed_value('ERR_REPORT_UPLOAD_ALL', e.data)
             failures = jsondata['failures']
-            if(len(failures) > 0):
+            if len(failures) > 0 or upload_all:
                 filename = "error_report_" + e.data.getVar("BUILDNAME")+".txt"
                 datafile = errorreport_savedata(e, jsondata, filename)
-                bb.note("The errors of this build are stored in: %s. You can send the errors to an upstream server by running: send-error-report %s [server]" % (datafile, datafile))
+                bb.note("The report of this build are stored in: %s." % (datafile))
+                if upload_all or (len(failures) > 0 and upload_failures):
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


