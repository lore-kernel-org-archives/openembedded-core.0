Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 411A66C1C0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Nov 2018 09:40:41 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id l9so11273192wrt.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Nov 2018 01:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=est02WpnZuoPAnxfiPtLJ3LyVtqmbPpFhhJXHWv/XB0=;
	b=Dl/SpV2jbV9GX9qLVRNZf1/24QCiAmUYegPSxTObuQdAS0cIZe5GmRe2+rYuivvS/1
	hVylb53tY8y9bUSjMfUHdvfnhGkIB7BI+SJwmWcVeDgdmnle6qz8LYUjTt5iVKmyotAb
	Sq0qMTk4vuBUNgb8KDHKYURx29tZ58wPAGiZ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=est02WpnZuoPAnxfiPtLJ3LyVtqmbPpFhhJXHWv/XB0=;
	b=riJDvfS5kK/0LWNpFZTae7seWBNkfIj5+QU+qz7JGmWXXOxoE+srTSyFX6NlrApjj5
	GBwKK5qh48kl01k1qG2jtZxRFGyKAhcAYXUncstiNv1lNoJWb4E56YcHoCOm1ygEM6Lh
	QAn8f6gPMeTlOdlu2n3iIPkKwFng6kK0wFucqvyuDsl9WKTNx4xLkgPiUkC1IQL+rNaZ
	4LPYjhUUEMOkswxz/WswsjNd+beFDxBO+R58Wk97YYrZcA/VIZ8bz2TRhCWmN6z73jqJ
	fIR/skpjxf5BAdePczUT2gtBDLHB4VAEIhQK4dRIoq/ifKbE8aX6GFpNDwvu36DoYB3t
	BBSw==
X-Gm-Message-State: AGRZ1gKBDeW3dxZ0GLZJamOqJf+nK3FCOl7iH0OWhvd63EQ9uD38sx6k
	uDFWv9huJRqF1WEHLkDaog3p9EA70X4=
X-Google-Smtp-Source: AJdET5eAp2/o/3M+ACSKQ/LCH36vgER67cgiklBXnoJYTNYDtklW0iJQ3opQtYonRIkVaqvSS2bM9g==
X-Received: by 2002:a5d:5206:: with SMTP id
	j6-v6mr8407358wrv.147.1542361241592; 
	Fri, 16 Nov 2018 01:40:41 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o27-v6sm24554039wro.24.2018.11.16.01.40.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Nov 2018 01:40:41 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Nov 2018 09:40:36 +0000
Message-Id: <20181116094037.4220-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181116094037.4220-1-richard.purdie@linuxfoundation.org>
References: <20181116094037.4220-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 4/5] oeqa/utils/httpserver: Rework to avoid hangs and improve logging
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
X-List-Received-Date: Fri, 16 Nov 2018 09:40:41 -0000

testimage.bbclass installs a SIGTERM handler which conflicts with the
use of multiprocessing here. This is paritcularly problematic if the http
service is terminated before its started and hence before its had a chance
to reset the default signal handler (as the code was written).

Instead, temporarily remove testimage's handler whilst forking the http process
which means the correct handler is installed and won't deadlock.

Also take the opportunity to add in some log messages about the server start
and shutdown so that future debugging is easier and its clearer what the code
is doing.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/runtime/cases/apt.py  |  2 +-
 meta/lib/oeqa/runtime/cases/dnf.py  |  2 +-
 meta/lib/oeqa/runtime/cases/opkg.py |  2 +-
 meta/lib/oeqa/utils/httpserver.py   | 37 ++++++++++++++++++++++-------
 4 files changed, 32 insertions(+), 11 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/apt.py b/meta/lib/oeqa/runtime/cases/apt.py
index 8d4dd35c578..793143f72cf 100644
--- a/meta/lib/oeqa/runtime/cases/apt.py
+++ b/meta/lib/oeqa/runtime/cases/apt.py
@@ -18,7 +18,7 @@ class AptRepoTest(AptTest):
     @classmethod
     def setUpClass(cls):
         service_repo = os.path.join(cls.tc.td['DEPLOY_DIR_DEB'], 'all')
-        cls.repo_server = HTTPService(service_repo, cls.tc.target.server_ip)
+        cls.repo_server = HTTPService(service_repo, cls.tc.target.server_ip, logger=cls.tc.logger)
         cls.repo_server.start()
 
     @classmethod
diff --git a/meta/lib/oeqa/runtime/cases/dnf.py b/meta/lib/oeqa/runtime/cases/dnf.py
index e93a1cea06e..c1ed39d7765 100644
--- a/meta/lib/oeqa/runtime/cases/dnf.py
+++ b/meta/lib/oeqa/runtime/cases/dnf.py
@@ -55,7 +55,7 @@ class DnfRepoTest(DnfTest):
     @classmethod
     def setUpClass(cls):
         cls.repo_server = HTTPService(os.path.join(cls.tc.td['WORKDIR'], 'oe-testimage-repo'),
-                                      cls.tc.target.server_ip)
+                                      cls.tc.target.server_ip, logger=cls.tc.logger)
         cls.repo_server.start()
 
     @classmethod
diff --git a/meta/lib/oeqa/runtime/cases/opkg.py b/meta/lib/oeqa/runtime/cases/opkg.py
index 3be480a6722..693f5d68c91 100644
--- a/meta/lib/oeqa/runtime/cases/opkg.py
+++ b/meta/lib/oeqa/runtime/cases/opkg.py
@@ -21,7 +21,7 @@ class OpkgRepoTest(OpkgTest):
         if cls.tc.td["MULTILIB_VARIANTS"]:
             allarchfeed = cls.tc.td["TUNE_PKGARCH"]
         service_repo = os.path.join(cls.tc.td['DEPLOY_DIR_IPK'], allarchfeed)
-        cls.repo_server = HTTPService(service_repo, cls.tc.target.server_ip)
+        cls.repo_server = HTTPService(service_repo, cls.tc.target.server_ip, logger=cls.tc.logger)
         cls.repo_server.start()
 
     @classmethod
diff --git a/meta/lib/oeqa/utils/httpserver.py b/meta/lib/oeqa/utils/httpserver.py
index 7d12331453a..a48d4994fd7 100644
--- a/meta/lib/oeqa/utils/httpserver.py
+++ b/meta/lib/oeqa/utils/httpserver.py
@@ -1,13 +1,13 @@
 import http.server
 import multiprocessing
 import os
+import traceback
+import signal
 from socketserver import ThreadingMixIn
 
 class HTTPServer(ThreadingMixIn, http.server.HTTPServer):
 
-    def server_start(self, root_dir):
-        import signal
-        signal.signal(signal.SIGTERM, signal.SIG_DFL)
+    def server_start(self, root_dir, logger):
         os.chdir(root_dir)
         self.serve_forever()
 
@@ -18,19 +18,40 @@ class HTTPRequestHandler(http.server.SimpleHTTPRequestHandler):
 
 class HTTPService(object):
 
-    def __init__(self, root_dir, host=''):
+    def __init__(self, root_dir, host='', logger=None):
         self.root_dir = root_dir
         self.host = host
         self.port = 0
+        self.logger = logger
 
     def start(self):
+        if not os.path.exists(self.root_dir):
+            self.logger.info("Not starting HTTPService for directory %s which doesn't exist" % (self.root_dir))
+            return
+
         self.server = HTTPServer((self.host, self.port), HTTPRequestHandler)
         if self.port == 0:
             self.port = self.server.server_port
-        self.process = multiprocessing.Process(target=self.server.server_start, args=[self.root_dir])
+        self.process = multiprocessing.Process(target=self.server.server_start, args=[self.root_dir, self.logger])
+
+        # The signal handler from testimage.bbclass can cause deadlocks here
+        # if the HTTPServer is terminated before it can restore the standard 
+        #signal behaviour
+        orig = signal.getsignal(signal.SIGTERM)
+        signal.signal(signal.SIGTERM, signal.SIG_DFL)
         self.process.start()
+        signal.signal(signal.SIGTERM, orig)
+
+        if self.logger:
+            self.logger.info("Started HTTPService on %s:%s" % (self.host, self.port))
+
 
     def stop(self):
-        self.server.server_close()
-        self.process.terminate()
-        self.process.join()
+        if hasattr(self, "server"):
+            self.server.server_close()
+        if hasattr(self, "process"):
+            self.process.terminate()
+            self.process.join()
+        if self.logger:
+            self.logger.info("Stopped HTTPService on %s:%s" % (self.host, self.port))
+
-- 
2.17.1


