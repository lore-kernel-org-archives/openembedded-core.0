Return-Path: <gs-yoctoproject.org@gluelogic.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99864CDB474
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 13:30:58 +0000 (UTC)
Received: from smtp1.atof.net (smtp1.atof.net [52.86.233.228])
 by mx.groups.io with SMTP id smtpd.web10.54234.1697808642990488032
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 06:30:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gluelogic.com, ip: 52.86.233.228, mailfrom: gs-yoctoproject.org@gluelogic.com)
From: Glenn Strauss <gs-yoctoproject.org@gluelogic.com>
To: openembedded-core@lists.openembedded.org
Cc: Glenn Strauss <gstrauss@gluelogic.com>
Subject: [PATCH 3/3] lighttpd: modernize lighttpd.conf
Date: Fri, 20 Oct 2023 09:30:26 -0400
Message-ID: <20231020133026.103646-4-gs-yoctoproject.org@gluelogic.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231020133026.103646-1-gs-yoctoproject.org@gluelogic.com>
References: <20231020133026.103646-1-gs-yoctoproject.org@gluelogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit
X-Mime-Autoconverted: from 8bit to 7bit by courier 0.78
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 13:30:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189531

From: Glenn Strauss <gstrauss@gluelogic.com>

- remove obsolete modules
- replace mod_compress directives with mod_deflate
- do not enable debug.log-request-handling by default
  (should not be enabled *by default* on any production system,
   especially not an embedded system)
- update TLS syntax for modern recommended use
  (separate files for certificate+chain, and private key)
- remove incorrect comment about server.event-handler
  lighttpd defaults correctly to use kqueue on *BSD systems
- remove ancient config which disables range requests for PDF
  (cargo-culted config from ~15 years ago to address problem
   in then-popular PDF client)
- use recommend config file include syntax
  (more efficient and more deterministic include file ordering)

Signed-off-by: Glenn Strauss <gstrauss@gluelogic.com>
---
 .../lighttpd/lighttpd/lighttpd.conf           | 38 ++++---------------
 1 file changed, 8 insertions(+), 30 deletions(-)

diff --git a/meta/recipes-extended/lighttpd/lighttpd/lighttpd.conf b/meta/recipes-extended/lighttpd/lighttpd/lighttpd.conf
index 6e8402d242..47a6c93349 100644
--- a/meta/recipes-extended/lighttpd/lighttpd/lighttpd.conf
+++ b/meta/recipes-extended/lighttpd/lighttpd/lighttpd.conf
@@ -16,8 +16,6 @@ server.modules              = (
 #                               "mod_redirect",
 #                               "mod_alias",
                                 "mod_access",
-#                               "mod_cml",
-#                               "mod_trigger_b4_dl",
 #                               "mod_auth",
 #                               "mod_status",
 #                               "mod_setenv",
@@ -27,11 +25,9 @@ server.modules              = (
 #                               "mod_evhost",
 #                               "mod_userdir",
 #                               "mod_cgi",
-#                               "mod_compress",
 #                               "mod_ssi",
-#                               "mod_usertrack",
 #                               "mod_expire",
-#                               "mod_secdownload",
+#                               "mod_deflate",
 #                               "mod_rrdtool",
 #				"mod_webdav",
                                 "mod_accesslog" )
@@ -47,9 +43,6 @@ server.errorlog             = "/www/logs/lighttpd.error.log"
 index-file.names            = ( "index.php", "index.html",
                                 "index.htm", "default.htm" )
 
-## set the event-handler (read the performance section in the manual)
-# server.event-handler = "freebsd-kqueue" # needed on OS X
-
 # mimetype mapping
 mimetype.assign             = (
   ".pdf"          =>      "application/pdf",
@@ -115,7 +108,6 @@ mimetype.assign             = (
 
 #### accesslog module
 accesslog.filename          = "/www/logs/access.log"
-debug.log-request-handling = "enable"
 
 
 
@@ -127,10 +119,6 @@ debug.log-request-handling = "enable"
 #      of the document-root
 url.access-deny             = ( "~", ".inc" )
 
-$HTTP["url"] =~ "\.pdf$" {
-  server.range-requests = "disable"
-}
-
 ##
 # which extensions should not be handle via static-file transfer
 #
@@ -177,6 +165,7 @@ static-file.exclude-extensions = ( ".php", ".pl", ".fcgi" )
 #dir-listing.activate       = "enable"
 
 ## enable debugging
+#debug.log-request-header-on-error = "enable"
 #debug.log-request-header   = "enable"
 #debug.log-response-header  = "enable"
 #debug.log-request-handling = "enable"
@@ -194,8 +183,9 @@ static-file.exclude-extensions = ( ".php", ".pl", ".fcgi" )
 #server.groupname           = "wwwrun"
 
 #### compress module
-#compress.cache-dir         = "/tmp/lighttpd/cache/compress/"
-#compress.filetype          = ("text/plain", "text/html")
+#deflate.cache-dir          = "/tmp/lighttpd/cache/compress/"
+#deflate.mimetypes          = ("text/plain", "text/html")
+#deflate.allowed-encodings  = ("gzip")
 
 #### proxy module
 ## read proxy.txt for more info
@@ -227,7 +217,8 @@ static-file.exclude-extensions = ( ".php", ".pl", ".fcgi" )
 
 #### SSL engine
 #ssl.engine                 = "enable"
-#ssl.pemfile                = "server.pem"
+#ssl.pemfile                = "/path/to/fullchain.pem"
+#ssl.privkey                = "/path/to/privkey.pem"
 
 #### status module
 #status.status-url          = "/server-status"
@@ -291,19 +282,6 @@ static-file.exclude-extensions = ( ".php", ".pl", ".fcgi" )
 #setenv.add-request-header  = ( "TRAV_ENV" => "mysql://user@host/db" )
 #setenv.add-response-header = ( "X-Secret-Message" => "42" )
 
-## for mod_trigger_b4_dl
-# trigger-before-download.gdbm-filename = "/home/weigon/testbase/trigger.db"
-# trigger-before-download.memcache-hosts = ( "127.0.0.1:11211" )
-# trigger-before-download.trigger-url = "^/trigger/"
-# trigger-before-download.download-url = "^/download/"
-# trigger-before-download.deny-url = "http://127.0.0.1/index.html"
-# trigger-before-download.trigger-timeout = 10
-
-## for mod_cml
-## don't forget to add index.cml to server.indexfiles
-# cml.extension               = ".cml"
-# cml.memcache-hosts          = ( "127.0.0.1:11211" )
-
 #### variable usage:
 ## variable name without "." is auto prefixed by "var." and becomes "var.bar"
 #bar = 1
@@ -328,4 +306,4 @@ static-file.exclude-extensions = ( ".php", ".pl", ".fcgi" )
 #var.a=1
 
 # include other config file fragments from lighttpd.d subdir
-include_shell "find /etc/lighttpd.d -maxdepth 1 -name '*.conf' -exec cat {} \;" 
+include "/etc/lighttpd.d/*.conf"
-- 
2.41.0

