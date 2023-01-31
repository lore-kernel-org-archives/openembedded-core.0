Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4385C636D3
	for <webhook@archiver.kernel.org>; Tue, 31 Jan 2023 11:50:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.10211.1675165798236377020
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Jan 2023 03:49:58 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A0AA21713;
	Tue, 31 Jan 2023 03:50:39 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 254FE3F71E;
	Tue, 31 Jan 2023 03:49:57 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH v2 2/2] oeqa/utils/httpserver: connect up the request logging
Date: Tue, 31 Jan 2023 11:49:54 +0000
Message-Id: <20230131114954.2579029-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230131114954.2579029-1-ross.burton@arm.com>
References: <20230131114954.2579029-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Jan 2023 11:50:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176516

Call logger.info() in the log_message handler so that we get request
logging, and hopefully even error messages.

Create a child logger to be neat and compartmentalise the logging.

Add a __main__ entrypoint so this class can be exercised outside of oeqa.

Remove unused traceback import.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/utils/httpserver.py | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/utils/httpserver.py b/meta/lib/oeqa/utils/http=
server.py
index 8ce1dd42f49..2aa172bf799 100644
--- a/meta/lib/oeqa/utils/httpserver.py
+++ b/meta/lib/oeqa/utils/httpserver.py
@@ -5,9 +5,9 @@
 #
=20
 import http.server
+import logging
 import multiprocessing
 import os
-import traceback
 import signal
 from socketserver import ThreadingMixIn
=20
@@ -15,20 +15,24 @@ class HTTPServer(ThreadingMixIn, http.server.HTTPServ=
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
+        if logger:
+            self.logger =3D logger.getChild("HTTPService")
+        else:
+            self.logger =3D logging.getLogger("HTTPService")
=20
     def start(self):
         if not os.path.exists(self.root_dir):
@@ -49,7 +53,7 @@ class HTTPService(object):
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
@@ -61,3 +65,10 @@ class HTTPService(object):
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


