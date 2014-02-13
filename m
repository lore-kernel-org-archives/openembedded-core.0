Return-Path: <andreea.b.proca@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 4329E6EFE7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2014 15:25:07 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 13 Feb 2014 07:25:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,839,1384329600"; d="scan'208";a="410674901"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by azsmga001.ch.intel.com with ESMTP; 13 Feb 2014 07:25:07 -0800
Received: from andreea-Vostro-460.rb.intel.com (unknown [10.237.112.104])
	by linux.intel.com (Postfix) with ESMTP id 65C706A4083
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2014 07:24:59 -0800 (PST)
From: Andreea Proca <andreea.b.proca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Feb 2014 17:28:51 +0200
Message-Id: <a4ffa9d1c2f040a1b78b5cbfa92ee7ad9e3402e0.1392303990.git.andreea.b.proca@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1392303990.git.andreea.b.proca@intel.com>
References: <cover.1392303990.git.andreea.b.proca@intel.com>
In-Reply-To: <cover.1392303990.git.andreea.b.proca@intel.com>
References: <cover.1392303990.git.andreea.b.proca@intel.com>
Subject: [PATCH 1/1] report-error.bbclass: new class to save build information when errors occur
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
X-List-Received-Date: Thu, 13 Feb 2014 15:25:07 -0000

Class is used to save data about errors after every task that failed.
Debug data is saved in json files in ERROR_REPORT_DIR (defaults to tmp/log/error-report).
To use this class one has to add INHERIT += "report-error" to local.conf.

scripts/send-error-report is a simple script that sends the json file
to a HTTP server that collects data (git://git.yoctoproject.org/error-report-web
is a Django web interface that can be used to receive and visualize
the error reports). The script will give you an URL where you can
find your report.

Signed-off-by: Andreea Proca <andreea.b.proca@intel.com>
---
 meta/classes/report-error.bbclass |   67 +++++++++++++++++++++++++++++++
 scripts/send-error-report         |   78 +++++++++++++++++++++++++++++++++++++
 2 files changed, 145 insertions(+)
 create mode 100644 meta/classes/report-error.bbclass
 create mode 100755 scripts/send-error-report

diff --git a/meta/classes/report-error.bbclass b/meta/classes/report-error.bbclass
new file mode 100644
index 0000000..149b36c
--- /dev/null
+++ b/meta/classes/report-error.bbclass
@@ -0,0 +1,67 @@
+#
+# Collects debug information in order to create error report files.
+#
+# Copyright (C) 2013 Intel Corporation
+# Author: Andreea Brandusa Proca <andreea.b.proca@intel.com>
+#
+# Licensed under the MIT license, see COPYING.MIT for details
+
+ERR_REPORT_DIR ?= "${LOG_DIR}/error-report"
+
+def getdata(e):
+    logpath = e.data.getVar('ERR_REPORT_DIR', True)
+    datafile = os.path.join(logpath, "error-report.txt")
+    f = open(datafile, "r")
+    data = f.read()
+    f.close()
+    return data
+
+def savedata(e, newdata, file):
+    import json
+    logpath = e.data.getVar('ERR_REPORT_DIR', True)
+    bb.utils.mkdirhier(logpath)
+    datafile = os.path.join(logpath, file)
+    f = open(datafile, "w")
+    json.dump(newdata, f, indent=4, sort_keys=True)
+    f.close()
+    return datafile
+
+python report () {
+        import os, re, sys, json
+
+        if isinstance(e, bb.event.BuildStarted):
+            data = {}
+            machine = e.data.getVar("MACHINE")
+            data['machine'] = machine
+            data['build_sys'] = e.data.getVar("BUILD_SYS", True)
+            data['nativelsb'] = e.data.getVar("NATIVELSBSTRING")
+            data['distro'] = e.data.getVar("DISTRO")
+            data['target_sys'] = e.data.getVar("TARGET_SYS", True)
+            data['failures'] = []
+            data['component'] = e.getPkgs()[0]
+            data['branch_commit'] = base_detect_branch(e.data) + ": " + base_detect_revision(e.data)
+            savedata(e, data, "error-report.txt")
+
+        elif isinstance(e, bb.build.TaskFailed):
+            task = e.task
+            taskdata={}
+            log = e.data.getVar('BB_LOGFILE', True)
+            logFile = open(log, 'r')
+            taskdata['package'] = e.data.expand("${PF}")
+            taskdata['task'] = task
+            taskdata['log'] = logFile.read()
+            logFile.close()
+            jsondata = json.loads(getdata(e))
+            jsondata['failures'].append(taskdata)
+            savedata(e, jsondata, "error-report.txt")
+
+        elif isinstance(e, bb.event.BuildCompleted):
+            jsondata = json.loads(getdata(e))
+            failures = jsondata['failures']
+            if(len(failures) > 0):
+                filename = "error_report_" + e.data.getVar("BUILDNAME")+".txt"
+                datafile = savedata(e, jsondata, filename)
+                bb.note("The errors of this build are stored in: %s. You can send the errors to an upstream server by running: send-error-report %s [server]" % (datafile, datafile))
+}
+
+addhandler report
diff --git a/scripts/send-error-report b/scripts/send-error-report
new file mode 100755
index 0000000..0d85776
--- /dev/null
+++ b/scripts/send-error-report
@@ -0,0 +1,78 @@
+#!/usr/bin/env python
+
+# Sends an error report (if the report-error class was enabled) to a remote server.
+#
+# Copyright (C) 2013 Intel Corporation
+# Author: Andreea Proca <andreea.b.proca@intel.com>
+
+
+
+import httplib, urllib, os, sys, json
+
+
+def sendData(json_file, server):
+
+    if os.path.isfile(json_file):
+
+        home = os.path.expanduser("~")
+        userfile = os.path.join(home, ".oe-send-error")
+        if os.path.isfile(userfile):
+            with open(userfile) as g:
+                username = g.readline()
+                email = g.readline()
+        else:
+            print("Please enter your name and your email (optionally), they'll be saved in the file you send.")
+            username = raw_input("Name: ")
+            email = raw_input("E-mail (not required): ")
+            if len(username) > 0 and len(username) < 50:
+                with open(userfile, "w") as g:
+                    g.write(username + "\n")
+                    g.write(email + "\n")
+            else:
+                print("Invalid inputs, try again.")
+                return
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
+            conn = httplib.HTTPConnection(server)
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
+                print("Server connection failed")
+
+    else:
+        print("No data file found.")
+
+
+if __name__ == '__main__':
+    print ("\nSends an error report (if the report-error class was enabled) to a remote server.")
+    if len(sys.argv) < 2:
+        print("\nThis scripts sends the contents of a file to an upstream server.")
+        print("\nUsage: send-error-report <error_fileName> [server]")
+        print("\nIf this is the first when sending a report you'll be asked for your name and optionally your email address.")
+        print("They will be associated with your report.\n")
+
+    elif len(sys.argv) == 3:
+        sendData(sys.argv[1], sys.argv[2])
+    else:
+        sendData(sys.argv[1], "localhost:8000")
-- 
1.7.9.5


