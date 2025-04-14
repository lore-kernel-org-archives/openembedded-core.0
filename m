Return-Path: <jaeyoon.jung@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6539FC3601E
	for <webhook@archiver.kernel.org>; Mon, 14 Apr 2025 02:42:09 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by mx.groups.io with SMTP id smtpd.web10.41550.1744598522635131280
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Apr 2025 19:42:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.51, mailfrom: jaeyoon.jung@lge.com)
Received: from unknown (HELO lgeamrelo04.lge.com) (156.147.1.127)
	by 156.147.23.51 with ESMTP; 14 Apr 2025 11:42:00 +0900
X-Original-SENDERIP: 156.147.1.127
X-Original-MAILFROM: jaeyoon.jung@lge.com
Received: from unknown (HELO magneto.lge.net) (10.177.121.44)
	by 156.147.1.127 with ESMTP; 14 Apr 2025 11:42:00 +0900
X-Original-SENDERIP: 10.177.121.44
X-Original-MAILFROM: jaeyoon.jung@lge.com
From: jaeyoon.jung@lge.com
To: openembedded-core@lists.openembedded.org
Cc: Jaeyoon Jung <jaeyoon.jung@lge.com>
Subject: [PATCH 2/2] send-error-report: Drop --no-ssl
Date: Mon, 14 Apr 2025 11:41:11 +0900
Message-ID: <20250414024111.141648-2-jaeyoon.jung@lge.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250414024111.141648-1-jaeyoon.jung@lge.com>
References: <20250414024111.141648-1-jaeyoon.jung@lge.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Apr 2025 02:42:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214789

From: Jaeyoon Jung <jaeyoon.jung@lge.com>

A server name from -s or --server flag needs to contain a leading string
for URL scheme either http:// or https://. --no-ssl flag is dropped as
it is no longer needed.

Signed-off-by: Jaeyoon Jung <jaeyoon.jung@lge.com>
---
 scripts/send-error-report | 24 +++++++-----------------
 1 file changed, 7 insertions(+), 17 deletions(-)

diff --git a/scripts/send-error-report b/scripts/send-error-report
index f8bf51a491..efb7e9630f 100755
--- a/scripts/send-error-report
+++ b/scripts/send-error-report
@@ -149,21 +149,16 @@ def send_data(data, args):
     print(response.read().decode('utf-8'))
 
 
-def determine_server_url(args):
+def validate_server_url(args):
     # Get the error report server from an argument
-    server = args.server or 'errors.yoctoproject.org'
+    server = args.server or 'https://errors.yoctoproject.org'
 
-    # The scheme contained in the given URL takes precedence over --no-ssl flag
-    scheme = args.protocol
-    if server.startswith('http://'):
-        server = server[len('http://'):]
-        scheme = 'http://'
-    elif server.startswith('https://'):
-        server = server[len('https://'):]
-        scheme = 'https://'
+    if not server.startswith('http://') and not server.startswith('https://'):
+        log.error("Missing a URL scheme either http:// or https:// in the server name: " + server)
+        sys.exit(1)
 
     # Construct the final URL
-    return f"{scheme}{server}"
+    return f"{server}"
 
 
 if __name__ == '__main__':
@@ -206,14 +201,9 @@ if __name__ == '__main__':
                            help="Return the result in json format, silences all other output",
                            action="store_true")
 
-    arg_parse.add_argument("--no-ssl",
-                           help="Use http instead of https protocol",
-                           dest="protocol",
-                           action="store_const", const="http://", default="https://")
-
     args = arg_parse.parse_args()
 
-    args.server = determine_server_url(args)
+    args.server = validate_server_url(args)
 
     if (args.json == False):
         print("Preparing to send errors to: "+args.server)
-- 
2.43.0


