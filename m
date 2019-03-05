Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4ED667C77E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Mar 2019 03:11:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x253BQSt023366
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Mar 2019 19:11:26 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.439.0; Mon, 4 Mar 2019 19:11:25 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 Mar 2019 11:30:35 +0800
Message-ID: <02ceb625ae6b771fdb252b2e386f833b9e045f06.1551756548.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1551756548.git.liezhi.yang@windriver.com>
References: <cover.1551756548.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH v2 1/1] send-error-report: Add --no-ssl to use http protocol
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
X-List-Received-Date: Tue, 05 Mar 2019 03:11:25 -0000
Content-Type: text/plain

The script use https protocol by default, but the error-report-web server's
https connection may not work (e.g., doesn't work with python 2.7.6), so add an
option --no-ssl to make it use http.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/send-error-report | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/scripts/send-error-report b/scripts/send-error-report
index 3528cf9..0ed7cc9 100755
--- a/scripts/send-error-report
+++ b/scripts/send-error-report
@@ -62,7 +62,7 @@ def edit_content(json_file_path):
 
 def prepare_data(args):
     # attempt to get the max_log_size from the server's settings
-    max_log_size = getPayloadLimit("https://"+args.server+"/ClientPost/JSON")
+    max_log_size = getPayloadLimit(args.protocol+args.server+"/ClientPost/JSON")
 
     if not os.path.isfile(args.error_file):
         log.error("No data file found.")
@@ -132,9 +132,9 @@ def send_data(data, args):
     headers={'Content-type': 'application/json', 'User-Agent': "send-error-report/"+version}
 
     if args.json:
-        url = "https://"+args.server+"/ClientPost/JSON/"
+        url = args.protocol+args.server+"/ClientPost/JSON/"
     else:
-        url = "https://"+args.server+"/ClientPost/"
+        url = args.protocol+args.server+"/ClientPost/"
 
     req = urllib.request.Request(url, data=data, headers=headers)
     try:
@@ -187,6 +187,11 @@ if __name__ == '__main__':
                            help="Return the result in json format, silences all other output",
                            action="store_true")
 
+    arg_parse.add_argument("--no-ssl",
+                           help="Use http instead of https protocol",
+                           dest="protocol",
+                           action="store_const", const="http://", default="https://")
+
 
 
     args = arg_parse.parse_args()
-- 
2.7.4


