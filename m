Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C326A6D4C6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Mar 2019 10:30:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x24AUEqK009008
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 4 Mar 2019 02:30:15 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.439.0; Mon, 4 Mar 2019 02:30:09 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 Mar 2019 18:49:00 +0800
Message-ID: <e58863c6dfe0bfb23665568e90d34da5e9734d0e.1551696484.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1551696484.git.liezhi.yang@windriver.com>
References: <cover.1551696484.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] send-error-report: Add --no-ssl to use http protocol
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
X-List-Received-Date: Mon, 04 Mar 2019 10:30:15 -0000
Content-Type: text/plain

The script use https protocol by default, but the error-report-web server's
https connection may not work (e.g., doesn't work with python 2.7.6), so add an
option --no-ssl to make it use http.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/send-error-report | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/scripts/send-error-report b/scripts/send-error-report
index 3528cf9..f8039b8 100755
--- a/scripts/send-error-report
+++ b/scripts/send-error-report
@@ -60,9 +60,9 @@ def edit_content(json_file_path):
         return True
     return False
 
-def prepare_data(args):
+def prepare_data(args, protocol):
     # attempt to get the max_log_size from the server's settings
-    max_log_size = getPayloadLimit("https://"+args.server+"/ClientPost/JSON")
+    max_log_size = getPayloadLimit(protocol+args.server+"/ClientPost/JSON")
 
     if not os.path.isfile(args.error_file):
         log.error("No data file found.")
@@ -128,13 +128,13 @@ def prepare_data(args):
     return data.encode('utf-8')
 
 
-def send_data(data, args):
+def send_data(data, args, protocol):
     headers={'Content-type': 'application/json', 'User-Agent': "send-error-report/"+version}
 
     if args.json:
-        url = "https://"+args.server+"/ClientPost/JSON/"
+        url = protocol+args.server+"/ClientPost/JSON/"
     else:
-        url = "https://"+args.server+"/ClientPost/"
+        url = protocol+args.server+"/ClientPost/"
 
     req = urllib.request.Request(url, data=data, headers=headers)
     try:
@@ -187,6 +187,10 @@ if __name__ == '__main__':
                            help="Return the result in json format, silences all other output",
                            action="store_true")
 
+    arg_parse.add_argument("--no-ssl",
+                           help="Use http instead of https protocol",
+                           action="store_true")
+
 
 
     args = arg_parse.parse_args()
@@ -194,7 +198,12 @@ if __name__ == '__main__':
     if (args.json == False):
         print("Preparing to send errors to: "+args.server)
 
-    data = prepare_data(args)
-    send_data(data, args)
+    if args.no_ssl:
+        protocol = "http://"
+    else:
+        protocol = "https://"
+
+    data = prepare_data(args, protocol)
+    send_data(data, args, protocol)
 
     sys.exit(0)
-- 
2.7.4


