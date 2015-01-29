Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id BC10A60034
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jan 2015 14:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t0TEVg94021312 for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jan 2015 14:32:30 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Os51H3iMLVjH
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jan 2015 14:32:30 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t0TEWFSF021331
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jan 2015 14:32:26 GMT
Message-ID: <1422541935.5312.3.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 29 Jan 2015 14:32:15 +0000
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] scripts/send-error-report: Set exit code if error occurs
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
X-List-Received-Date: Thu, 29 Jan 2015 14:32:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If an error occurs, set an error exit code so the world knows about it. This fixes
issues where the autobuilder doesn't notice these failures.

[YOCTO #7265]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/scripts/send-error-report b/scripts/send-error-report
index c99d387..01c292e 100755
--- a/scripts/send-error-report
+++ b/scripts/send-error-report
@@ -62,6 +62,7 @@ def sendData(json_file, server):
                     g.write(email + "\n")
             else:
                 print("Invalid inputs, try again.")
+                sys.exit(1)
                 return
 
         with open(json_file) as f:
@@ -74,6 +75,7 @@ def sendData(json_file, server):
             data = json.dumps(jsondata, indent=4, sort_keys=True)
         except:
             print("Invalid json data")
+            sys.exit(1)
             return
 
         try:
@@ -87,12 +89,14 @@ def sendData(json_file, server):
                 print("There was a problem submiting your data, response written in %s.response.html" % json_file)
                 with open("%s.response.html" % json_file, "w") as f:
                     f.write(res)
+                sys.exit(1)
             conn.close()
         except Exception as e:
                 print("Server connection failed: %s" % e)
-
+                sys.exit(1)
     else:
         print("No data file found.")
+        sys.exit(1)
 
 
 if __name__ == '__main__':



