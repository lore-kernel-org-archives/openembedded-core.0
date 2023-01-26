Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF61CC52D11
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 17:31:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.80233.1674754254768631772
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jan 2023 09:30:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CB3154B3;
	Thu, 26 Jan 2023 09:31:35 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8002A3F64C;
	Thu, 26 Jan 2023 09:30:53 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] oeqa/utils/httpserver: connect up the request logging
Date: Thu, 26 Jan 2023 17:30:48 +0000
Message-Id: <20230126173048.1534444-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 17:31:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176413

Call logger.info() in the log_message handler so that we get request
logging, and hopefully even error messages.

Create a child logger to be neat and compartmentalise the logging.

Add a __main__ entrypoint so this class can be exercised outside of oeqa.

Remove unused traceback import.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/utils/httpserver.py | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/utils/httpserver.py b/meta/lib/oeqa/utils/http=
server.py
index 8ce1dd42f49..b478172ed76 100644
--- a/meta/lib/oeqa/utils/httpserver.py
+++ b/meta/lib/oeqa/utils/httpserver.py
@@ -7,7 +7,6 @@
 import http.server
 import multiprocessing
 import os
-import traceback
 import signal
 from socketserver import ThreadingMixIn
=20
@@ -15,20 +14,21 @@ class HTTPServer(ThreadingMixIn, http.server.HTTPServ=
er):
=20
     def server_start(self, root_dir, logger):
         os.chdir(root_dir)
+        self.logger =3D logger
         self.serve_forever()
=20
 class HTTPRequestHandler(http.server.SimpleHTTPRequestHandler):
=20
     def log_message(self, format_str, *args):
-        pass
+        self.server.logger.info(format_str, *args)
=20
-class HTTPService(object):
+class HTTPService:
=20
     def __init__(self, root_dir, host=3D'', port=3D0, logger=3DNone):
         self.root_dir =3D root_dir
         self.host =3D host
         self.port =3D port
-        self.logger =3D logger
+        self.logger =3D logger.getChild("HTTPService")
=20
     def start(self):
         if not os.path.exists(self.root_dir):
@@ -49,7 +49,7 @@ class HTTPService(object):
         signal.signal(signal.SIGTERM, orig)
=20
         if self.logger:
-            self.logger.info("Started HTTPService on %s:%s" % (self.host=
, self.port))
+            self.logger.info("Started HTTPService for %s on %s:%s" % (se=
lf.root_dir, self.host, self.port))
=20
=20
     def stop(self):
@@ -61,3 +61,10 @@ class HTTPService(object):
         if self.logger:
             self.logger.info("Stopped HTTPService on %s:%s" % (self.host=
, self.port))
=20
+if __name__ =3D=3D "__main__":
+    import sys, logging
+
+    logger =3D logging.getLogger(__name__)
+    logging.basicConfig(level=3Dlogging.DEBUG)
+    httpd =3D HTTPService(sys.argv[1], port=3D8888, logger=3Dlogger)
+    httpd.start()
--=20
2.34.1


