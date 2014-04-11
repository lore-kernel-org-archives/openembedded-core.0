Return-Path: <stefanx.stanacar@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8339F65DFD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Apr 2014 17:49:30 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 11 Apr 2014 10:49:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,843,1389772800"; d="scan'208";a="519053007"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 11 Apr 2014 10:49:05 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.160])
	by linux.intel.com (Postfix) with ESMTP id BEE3D6A4083;
	Fri, 11 Apr 2014 10:48:47 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Apr 2014 20:49:14 +0300
Message-Id: <1397238554-22145-1-git-send-email-stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.9.0
Subject: [PATCH v2] scripts/send-error-report: simple hack to use proxy from the enviroment
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
X-List-Received-Date: Fri, 11 Apr 2014 17:49:31 -0000

People behind a proxy couldn't send an error report to an upstream server,
this should fix the issue if they use a proxy that doesn't require authentication,
or one that uses basic http authentication and it's correctly exported in the enviroment.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 scripts/send-error-report | 43 ++++++++++++++++++++++++++++++++++++-------
 1 file changed, 36 insertions(+), 7 deletions(-)

diff --git a/scripts/send-error-report b/scripts/send-error-report
index 8eea3cf..5e3b2a2 100755
--- a/scripts/send-error-report
+++ b/scripts/send-error-report
@@ -7,7 +7,39 @@
 
 
 
-import httplib, urllib, os, sys, json
+import httplib, urllib, os, sys, json, base64
+from urllib2 import _parse_proxy as parseproxy
+
+
+def handle_connection(server, data):
+    params = urllib.urlencode({'data': data})
+    headers = {"Content-type": "application/json"}
+    proxyrequired = False
+    if os.environ.get("http_proxy") or os.environ.get("HTTP_PROXY"):
+        proxyrequired = True
+        # we need to check that the server isn't a local one, as in no_proxy
+        try:
+            temp = httplib.HTTPConnection(server, strict=True, timeout=5)
+            temp.request("GET", "/")
+            tempres = temp.getresponse()
+            if tempres.status == 200:
+                proxyrequired = False
+            temp.close()
+        except:
+            pass
+
+    if proxyrequired:
+        proxy = parseproxy(os.environ.get("http_proxy") or os.environ.get("HTTP_PROXY"))
+        if proxy[1] and proxy[2]:
+            auth = base64.encodestring("%s:%s" % (proxy[1], proxy[2]))
+            headers["Authorization"] = "Basic %s" % auth
+        conn = httplib.HTTPConnection(proxy[3])
+        conn.request("POST", "http://%s/ClientPost/" % server, params, headers)
+    else:
+        conn = httplib.HTTPConnection(server)
+        conn.request("POST", "/ClientPost/", params, headers)
+
+    return conn
 
 
 def sendData(json_file, server):
@@ -45,10 +77,7 @@ def sendData(json_file, server):
             return
 
         try:
-            params = urllib.urlencode({'data': data})
-            headers = {"Content-type": "application/json"}
-            conn = httplib.HTTPConnection(server)
-            conn.request("POST", "/ClientPost/", params, headers)
+            conn = handle_connection(server, data)
             response = conn.getresponse()
             print response.status, response.reason
             res = response.read()
@@ -59,8 +88,8 @@ def sendData(json_file, server):
                 with open("%s.response.html" % json_file, "w") as f:
                     f.write(res)
             conn.close()
-        except:
-                print("Server connection failed")
+        except Exception as e:
+                print("Server connection failed: %s" % e)
 
     else:
         print("No data file found.")
-- 
1.9.0


