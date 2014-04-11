Return-Path: <stefanx.stanacar@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 3CE5365EEB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Apr 2014 15:54:54 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 Apr 2014 08:50:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,842,1389772800"; d="scan'208";a="491418922"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 11 Apr 2014 08:54:48 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.160])
	by linux.intel.com (Postfix) with ESMTP id 186AB6A4083;
	Fri, 11 Apr 2014 08:54:30 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Apr 2014 18:54:55 +0300
Message-Id: <1397231695-19060-2-git-send-email-stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.9.0
Subject: [PATCH] scripts/send-error-report: simple hack to use proxy from the enviroment
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
X-List-Received-Date: Fri, 11 Apr 2014 15:54:58 -0000

People behind a proxy couldn't send an error report to an upstream server,
this should fix the issue if they use a proxy that doesn't require authentication,
and it's correctly exported in the enviroment.
There are probbaly better ways to fix this (urllib2, proxy connect,
a command line option for proxy) but those require more changes than
I feel confortable doing now.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 scripts/send-error-report | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/scripts/send-error-report b/scripts/send-error-report
index 3734b61..0bce8b6 100755
--- a/scripts/send-error-report
+++ b/scripts/send-error-report
@@ -8,6 +8,24 @@
 
 
 import httplib, urllib, os, sys, json
+from urllib2 import _parse_proxy as parseproxy
+
+
+def handle_connection(server, data):
+        params = urllib.urlencode({'data': data})
+        headers = {"Content-type": "application/json"}
+
+        if os.environ.get("http_proxy") or os.environ.get("HTTP_PROXY"):
+                proxy = parseproxy(os.environ.get("http_proxy") or os.environ.get("HTTP_PROXY"))
+                if proxy[1] or proxy[2]:
+                        raise Exception("http proxies that require authentication are not supported for now.")
+                conn = httplib.HTTPConnection(proxy[3])
+                conn.request("POST", "http://%s/ClientPost/" % server, params, headers)
+        else:
+                conn = httplib.HTTPConnection(server)
+                conn.request("POST", "/ClientPost/", params, headers)
+
+        return conn
 
 
 def sendData(json_file, server):
@@ -45,10 +63,7 @@ def sendData(json_file, server):
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
@@ -59,8 +74,8 @@ def sendData(json_file, server):
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


