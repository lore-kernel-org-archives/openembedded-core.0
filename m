Return-Path: <jaeyoon.jung@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C275C369A4
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 10:10:29 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.53])
 by mx.groups.io with SMTP id smtpd.web11.71300.1744107018832632343
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Apr 2025 03:10:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.53, mailfrom: jaeyoon.jung@lge.com)
Received: from unknown (HELO lgemrelse6q.lge.com) (156.147.1.121)
	by 156.147.23.53 with ESMTP; 8 Apr 2025 19:10:16 +0900
X-Original-SENDERIP: 156.147.1.121
X-Original-MAILFROM: jaeyoon.jung@lge.com
Received: from unknown (HELO magneto.lge.net) (10.177.121.44)
	by 156.147.1.121 with ESMTP; 8 Apr 2025 19:10:16 +0900
X-Original-SENDERIP: 10.177.121.44
X-Original-MAILFROM: jaeyoon.jung@lge.com
From: jaeyoon.jung@lge.com
To: openembedded-core@lists.openembedded.org
Cc: Jaeyoon Jung <jaeyoon.jung@lge.com>
Subject: [PATCH] send-error-report: Allow to set server using an environment variable
Date: Tue,  8 Apr 2025 19:09:45 +0900
Message-ID: <20250408100945.111801-1-jaeyoon.jung@lge.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 10:10:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214522

From: Jaeyoon Jung <jaeyoon.jung@lge.com>

Check ERROR_REPORT_SERVER if -s or --server isn't set before falling back
to the default errors.yoctoproject.org. It would be useful to alter the
report server as needed without adding flags.

Signed-off-by: Jaeyoon Jung <jaeyoon.jung@lge.com>
---
 scripts/send-error-report | 30 +++++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/scripts/send-error-report b/scripts/send-error-report
index cfbcaa52cb..3a522a3a5f 100755
--- a/scripts/send-error-report
+++ b/scripts/send-error-report
@@ -65,7 +65,7 @@ def edit_content(json_file_path):
 
 def prepare_data(args):
     # attempt to get the max_log_size from the server's settings
-    max_log_size = getPayloadLimit(args.protocol+args.server+"/ClientPost/JSON")
+    max_log_size = getPayloadLimit(args.server+"/ClientPost/JSON")
 
     if not os.path.isfile(args.error_file):
         log.error("No data file found.")
@@ -135,9 +135,9 @@ def send_data(data, args):
     headers={'Content-type': 'application/json', 'User-Agent': "send-error-report/"+version}
 
     if args.json:
-        url = args.protocol+args.server+"/ClientPost/JSON/"
+        url = args.server+"/ClientPost/JSON/"
     else:
-        url = args.protocol+args.server+"/ClientPost/"
+        url = args.server+"/ClientPost/"
 
     req = urllib.request.Request(url, data=data, headers=headers)
     try:
@@ -149,6 +149,23 @@ def send_data(data, args):
     print(response.read().decode('utf-8'))
 
 
+def determine_server_url(args):
+    # Get the error report server from the environment variable
+    server = args.server or os.getenv('ERROR_REPORT_SERVER', 'errors.yoctoproject.org')
+
+    # The scheme contained in the given URL takes precedence over --no-ssl flag
+    scheme = args.protocol
+    if server.startswith('http://'):
+        server = server[len('http://'):]
+        scheme = 'http://'
+    elif server.startswith('https://'):
+        server = server[len('https://'):]
+        scheme = 'https://'
+
+    # Construct the final URL
+    return f"{scheme}{server}"
+
+
 if __name__ == '__main__':
     arg_parse = argparse_oe.ArgumentParser(description="This scripts will send an error report to your specified error-report-web server.")
 
@@ -164,8 +181,7 @@ if __name__ == '__main__':
     arg_parse.add_argument("-s",
                            "--server",
                            help="Server to send error report to",
-                           type=str,
-                           default="errors.yoctoproject.org")
+                           type=str)
 
     arg_parse.add_argument("-e",
                            "--email",
@@ -195,10 +211,10 @@ if __name__ == '__main__':
                            dest="protocol",
                            action="store_const", const="http://", default="https://")
 
-
-
     args = arg_parse.parse_args()
 
+    args.server = determine_server_url(args)
+
     if (args.json == False):
         print("Preparing to send errors to: "+args.server)
 
-- 
2.43.0


