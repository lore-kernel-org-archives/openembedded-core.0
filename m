Return-Path: <michael.g.wood@intel.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 3F5C972491
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Feb 2015 11:48:05 +0000 (UTC)
Received: by wggx12 with SMTP id x12so19719270wgg.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Feb 2015 03:48:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=m89xo8eWB22shj8GjHMY6C+fFwSQp8wr7g938/+tWlk=;
	b=Rwg2L7tUrWqwXXcB/Sh8RQNxRISWUrNtfjbmsCv5t6hP4DaRfHxSzLOw6Ygns52o/O
	eBJyU/Mkq5nFZUfYomWE0Q855Sq4knwSsdUmGSSycpuRAYmGCHXxL+FEVhGmQtdme1UG
	wUVkCK4JzMh9VIvEbP/oSqF8xOOFKzeu5s6BS7GMP+Zp/BgDeLWAkNfoa+nJgu4Trn88
	1mHRZea5hbWz57EWsrWjVCuURG4W3POl0YTt6FKCIbsW+MqseF7RnV1KrLMLm9/fRIaO
	l5zx3VzX2+yywaXw2RPB8gFeCveYqGMujlU1hK71ggQQ4XwU7YvQ0d1vg6z3tZdoyCk2
	V55Q==
X-Gm-Message-State: ALoCoQntBdzKqX5L919hRbS+ntjRVm02tvnMeB1ouFRFHuSqN2KGwSv0OmGIwXWYuNXku5p2UQfN
X-Received: by 10.194.6.70 with SMTP id y6mr26232095wjy.97.1425037686442;
	Fri, 27 Feb 2015 03:48:06 -0800 (PST)
Received: from draco.icx.intel.com ([83.217.123.106])
	by mx.google.com with ESMTPSA id j9sm5616174wjy.18.2015.02.27.03.48.05
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 Feb 2015 03:48:05 -0800 (PST)
From: Michael Wood <michael.g.wood@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Feb 2015 11:47:54 +0000
Message-Id: <1425037674-19569-1-git-send-email-michael.g.wood@intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH] scripts/send-error-report: Rework script to support new features
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
X-List-Received-Date: Fri, 27 Feb 2015 11:48:13 -0000

- Add arguments to allow for non-prompted sending, json encoded response
  and link backs.
- Add feature to check the server's max_log_size
- Add feature to allow reviewing of the final data
- Be a bit more helpful if the expected fields aren't filled in instead
  of exiting.
- Remove the redundant urlencode
- Add a user-agent so that the server can identify the encoding method.
- Remove custom proxy handling - urllib should 'just work'

[YOCTO #6736]
[YOCTO #7245]
[YOCTO #7105]

Signed-off-by: Michael Wood <michael.g.wood@intel.com>
---
 scripts/send-error-report | 274 ++++++++++++++++++++++++++++++----------------
 1 file changed, 178 insertions(+), 96 deletions(-)

diff --git a/scripts/send-error-report b/scripts/send-error-report
index 01c292e..1a1b965 100755
--- a/scripts/send-error-report
+++ b/scripts/send-error-report
@@ -1,114 +1,196 @@
 #!/usr/bin/env python
 
-# Sends an error report (if the report-error class was enabled) to a remote server.
+# Sends an error report (if the report-error class was enabled) to a
+# remote server.
 #
 # Copyright (C) 2013 Intel Corporation
 # Author: Andreea Proca <andreea.b.proca@intel.com>
+# Author: Michael Wood <michael.g.wood@intel.com>
+
+import urllib2
+import sys
+import json
+import os
+import subprocess
+import argparse
+import logging
+
+version = "0.3"
+
+log = logging.getLogger("send-error-report")
+logging.basicConfig(format='%(levelname)s: %(message)s')
+
+def getPayloadLimit(url):
+    req = urllib2.Request(url, None)
+    try:
+        response = urllib2.urlopen(req)
+    except urllib2.URLError as e:
+        # Use this opportunity to bail out if we can't even contact the server
+        log.error("Could not contact server: " + url)
+        log.error(e.reason)
+        sys.exit(1)
+    try:
+        ret = json.loads(response.read())
+        max_log_size = ret.get('max_log_size', 0)
+        return int(max_log_size)
+    except:
+        pass
+
+    return 0
+
+def ask_for_contactdetails():
+    print("Please enter your name and your email (optionally), they'll be saved in the file you send.")
+    username = raw_input("Name (required): ")
+    email = raw_input("E-mail (not required): ")
+    return username, email
+
+def edit_content(json_file_path):
+    edit = raw_input("Review information before sending? (y/n): ")
+    if 'y' in edit or 'Y' in edit:
+        editor = os.environ.get('EDITOR', None)
+        if editor:
+            subprocess.check_call([editor, json_file_path])
+        else:
+            log.error("Please set your EDITOR value")
+            sys.exit(1)
+        return True
+    return False
 
+def prepare_data(args):
+    # attempt to get the max_log_size from the server's settings
+    max_log_size = getPayloadLimit("http://"+args.server+"/ClientPost/JSON")
 
+    if not os.path.isfile(args.error_file):
+        log.error("No data file found.")
+        sys.exit(1)
 
-import httplib, urllib, os, sys, json, base64
-from urllib2 import _parse_proxy as parseproxy
-
-
-def handle_connection(server, data):
-    params = urllib.urlencode({'data': data})
-    headers = {"Content-type": "application/json"}
-    proxyrequired = False
-    if os.environ.get("http_proxy") or os.environ.get("HTTP_PROXY"):
-        proxyrequired = True
-        # we need to check that the server isn't a local one, as in no_proxy
-        try:
-            temp = httplib.HTTPConnection(server, strict=True, timeout=5)
-            temp.request("GET", "/Errors/")
-            tempres = temp.getresponse()
-            if tempres.status == 200:
-                proxyrequired = False
-            temp.close()
-        except:
-            pass
-
-    if proxyrequired:
-        proxy = parseproxy(os.environ.get("http_proxy") or os.environ.get("HTTP_PROXY"))
-        if proxy[1] and proxy[2]:
-            auth = base64.encodestring("%s:%s" % (proxy[1], proxy[2]))
-            headers["Authorization"] = "Basic %s" % auth
-        conn = httplib.HTTPConnection(proxy[3])
-        conn.request("POST", "http://%s/ClientPost/" % server, params, headers)
-    else:
-        conn = httplib.HTTPConnection(server)
-        conn.request("POST", "/ClientPost/", params, headers)
+    home = os.path.expanduser("~")
+    userfile = os.path.join(home, ".oe-send-error")
 
-    return conn
+    try:
+        with open(userfile, 'r') as userfile_fp:
+            if len(args.name) == 0:
+                args.name = userfile_fp.readline()
+            else:
+                #use empty readline to increment the fp
+                userfile_fp.readline()
 
+            if len(args.email) == 0:
+                args.email = userfile_fp.readline()
+    except:
+        pass
 
-def sendData(json_file, server):
+    if args.assume_yes == True and len(args.name) == 0:
+        log.error("Name needs to be provided either via "+userfile+" or as an argument (-n).")
+        sys.exit(1)
 
-    if os.path.isfile(json_file):
+    while len(args.name) <= 0 and len(args.name) < 50:
+        print("\nName needs to be given and must not more than 50 characters.")
+        args.name, args.email = ask_for_contactdetails()
 
-        home = os.path.expanduser("~")
-        userfile = os.path.join(home, ".oe-send-error")
-        if os.path.isfile(userfile):
-            with open(userfile) as g:
-                username = g.readline()
-                email = g.readline()
-        else:
-            print("Please enter your name and your email (optionally), they'll be saved in the file you send.")
-            username = raw_input("Name: ")
-            email = raw_input("E-mail (not required): ")
-            if len(username) > 0 and len(username) < 50:
-                with open(userfile, "w") as g:
-                    g.write(username + "\n")
-                    g.write(email + "\n")
-            else:
-                print("Invalid inputs, try again.")
-                sys.exit(1)
-                return
-
-        with open(json_file) as f:
-            data = f.read()
-
-        try:
-            jsondata = json.loads(data)
-            jsondata['username'] = username.strip()
-            jsondata['email'] = email.strip()
-            data = json.dumps(jsondata, indent=4, sort_keys=True)
-        except:
-            print("Invalid json data")
-            sys.exit(1)
-            return
-
-        try:
-            conn = handle_connection(server, data)
-            response = conn.getresponse()
-            print response.status, response.reason
-            res = response.read()
-            if response.status == 200:
-                print(res)
-            else:
-                print("There was a problem submiting your data, response written in %s.response.html" % json_file)
-                with open("%s.response.html" % json_file, "w") as f:
-                    f.write(res)
-                sys.exit(1)
-            conn.close()
-        except Exception as e:
-                print("Server connection failed: %s" % e)
-                sys.exit(1)
+    with open(userfile, 'w') as userfile_fp:
+        userfile_fp.write(args.name.strip() + "\n")
+        userfile_fp.write(args.email.strip() + "\n")
+
+    with open(args.error_file, 'r') as json_fp:
+        data = json_fp.read()
+
+        jsondata = json.loads(data)
+        jsondata['username'] = args.name.strip()
+        jsondata['email'] = args.email.strip()
+        jsondata['link_back'] = args.link_back.strip()
+        # If we got a max_log_size then use this to truncate to get the last
+        # max_log_size bytes from the end
+        if max_log_size != 0:
+            for fail in jsondata['failures']:
+                if len(fail['log']) > max_log_size:
+                    print "Truncating log to allow for upload"
+                    fail['log'] = fail['log'][-max_log_size:]
+
+        data = json.dumps(jsondata, indent=4, sort_keys=True)
+
+    # Write back the result which will contain all fields filled in and
+    # any post processing done on the log data
+    with open(args.error_file, "w") as json_fp:
+        if data:
+            json_fp.write(data)
+
+
+    if args.assume_yes == False and edit_content(args.error_file):
+        #We'll need to re-read the content if we edited it
+        with open(args.error_file, 'r') as json_fp:
+            data = json_fp.read()
+
+    return data
+
+
+def send_data(data, args):
+    headers={'Content-type': 'application/json', 'User-Agent': "send-error-report/"+version}
+
+    if args.json:
+        url = "http://"+args.server+"/ClientPost/JSON/"
     else:
-        print("No data file found.")
+        url = "http://"+args.server+"/ClientPost/"
+
+    req = urllib2.Request(url, data=data, headers=headers)
+    try:
+        response = urllib2.urlopen(req)
+    except urllib2.HTTPError, e:
+        logging.error(e.reason)
         sys.exit(1)
 
+    print response.read()
+
 
 if __name__ == '__main__':
-    print ("\nSends an error report (if the report-error class was enabled) to a remote server.")
-    print("\nThis scripts sends the contents of the error to a public upstream server.")
-    print("\nPlease remove any identifying information before sending.")
-    if len(sys.argv) < 2:
-        print("\nUsage: send-error-report <error_fileName> [server]")
-        print("\nIf this is the first when sending a report you'll be asked for your name and optionally your email address.")
-        print("They will be associated with your report.\n")
-
-    elif len(sys.argv) == 3:
-        sendData(sys.argv[1], sys.argv[2])
-    else:
-        sendData(sys.argv[1], "errors.yoctoproject.org")
+    arg_parse = argparse.ArgumentParser(description="This scripts will send an error report to your specified error-report-web server.")
+
+    arg_parse.add_argument("error_file",
+                           help="Generated error report file location",
+                           type=str)
+
+    arg_parse.add_argument("-y",
+                           "--assume-yes",
+                           help="Assume yes to all queries and do not prompt",
+                           action="store_true")
+
+    arg_parse.add_argument("-s",
+                           "--server",
+                           help="Server to send error report to",
+                           type=str,
+                           default="errors.yoctoproject.org")
+
+    arg_parse.add_argument("-e",
+                           "--email",
+                           help="Email address to be used for contact",
+                           type=str,
+                           default="")
+
+    arg_parse.add_argument("-n",
+                           "--name",
+                           help="Submitter name used to identify your error report",
+                           type=str,
+                           default="")
+
+    arg_parse.add_argument("-l",
+                           "--link-back",
+                           help="A url to link back to this build from the error report server",
+                           type=str,
+                           default="")
+
+    arg_parse.add_argument("-j",
+                           "--json",
+                           help="Return the result in json format, silences all other output",
+                           action="store_true")
+
+
+
+    args = arg_parse.parse_args()
+
+    if (args.json == False):
+        print "Preparing to send errors to: "+args.server
+
+    data = prepare_data(args)
+    send_data(data, args)
+
+    sys.exit(0)
-- 
2.1.0


