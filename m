Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 3BE6C745BB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 19:31:53 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id l1-v6so43508517wmb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 12:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=flIPqHh4iiI8hrkAeFoeNCVeZaEOCYjl5F6EQagCONA=;
	b=TywXGSdKusaqaWGl9uIl+S/8RmbAkhLVcinHaXfpBwiisihzfuT8a6inV64xxkD0YR
	jzomJnz2On31rnufzHY6Fw9kmExJTo8ThL0egfJJlQjJZXrA6mTIR625487z1MSzLg4j
	jymYmrRj8lVm3FeAYMSBE9FCl0vkjByJ/FA37HtaTEPO/Qr43clSdrc1HZ/GDQ5IKh0F
	UKLf9HoA7K0UXpqG1Vy1nW/R5lx1BvVYxQi3G4XQpBkJEINqms9JUzXiTcpn3GTRGBpR
	Z7BEL3PgwpVKvdJSI/fMQyh7FewLDm9q4jv2aTuhMmb5bYydQODC5m3Gd0JNYCm3j2wf
	pKwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=flIPqHh4iiI8hrkAeFoeNCVeZaEOCYjl5F6EQagCONA=;
	b=lfeRz2GebYWIX/TraMJOrpx5U1QgYWInX3bZ9R65uVFY7QCajB5yKzZxO+UonBXBI6
	IrvhBkiBX8d8KKUtbE5tRcZNDy82TIllKixqYjIBtn2YoQqRlY46dIPuYlRB+JW1m+Ge
	fr8iyCbr/WZT47Ng3WUCc6XiQ/BmvvKLWguVe/SJZMohV2T3H1H5IxyiR6iI+WA1o7RP
	bjYo7tgdbTNwvGWMzsdqRwJg3fWCmw+RlEF5OlcOvkdofIIx8ZroUUDYLiHlS5+yJt+X
	1+++KpI56AZm/rFq2fLBAmDTooLldvSB0Cd1KCXh2Gxmo4Mfrt+SgFNzf8U/DIxi/j+e
	qd5Q==
X-Gm-Message-State: ALKqPwexAVth/1KjkFR/TGIvEIIWdrPZq+69+17rduj9RLAVnkhfzr+d
	Qz4bWxXk7h0oZKzxW6n+Eftw6w==
X-Google-Smtp-Source: ADUXVKJ7uvYm9WJjddEHqmipTjJVj/+G5z3OU3X53YEbvA4G1cAiRy9vzcZDVL74GTgfx0a5xjGVLw==
X-Received: by 2002:a50:b585:: with SMTP id a5-v6mr219624ede.136.1527622314345;
	Tue, 29 May 2018 12:31:54 -0700 (PDT)
Received: from localhost.localdomain (c-93-184-18-27.customer.ggaweb.ch.
	[93.184.18.27]) by smtp.gmail.com with ESMTPSA id
	m12-v6sm299681edd.86.2018.05.29.12.31.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 May 2018 12:31:53 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 May 2018 21:31:01 +0200
Message-Id: <20180529193101.43396-2-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20180529193101.43396-1-adrian.freihofer@gmail.com>
References: <20180529193101.43396-1-adrian.freihofer@gmail.com>
Subject: [poky][PATCH 2/2] devtool sdk-update: --updateserver-insecure-tls
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
X-List-Received-Date: Tue, 29 May 2018 19:31:54 -0000

Support insecure HTTPS connections for devtool sdk-update. This
adds a boolean --updateserver-insecure-tls option the the command
line parameters and to the devtool.conf file's SDK section.

This addresses a common szenario:
* Authorization (HTTPS + user credentials) is required by security
  policy.
* Linux development workstations are not domain members, so they
  don't get the company's ca.cert enrolled.
* The build server has a self signed certificate

Signed-off-by: Adrian Freihofer <adrian.freihofer@gmail.com>
---
 scripts/lib/devtool/sdk.py | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/sdk.py b/scripts/lib/devtool/sdk.py
index fbf69264e6..1b703dd21f 100644
--- a/scripts/lib/devtool/sdk.py
+++ b/scripts/lib/devtool/sdk.py
@@ -23,6 +23,7 @@ import shutil
 import errno
 import tempfile
 import re
+import ssl
 import urllib.request
 import base64
 import getpass
@@ -39,6 +40,13 @@ class SdkUpdateHelper(object):
         self.__user_name = user_name
         self.__user_password = None
         self.__ba_credentials = None
+        self.__ssl_context = ssl.create_default_context();
+        self.__git_ssl_args = ""
+
+    def enable_insecure_ssl(self):
+        self.__ssl_context.check_hostname=False
+        self.__ssl_context.verify_mode=ssl.CERT_NONE
+        self.__git_ssl_args = "-c http.sslVerify=false"
 
     def ask_ba_credentials(self, user_name=None):
         '''Ask user for Basic Auth Credentials'''
@@ -66,7 +74,7 @@ class SdkUpdateHelper(object):
             if self.__ba_credentials:
                 req.add_header('Authorization', self.__ba_credentials)
             try:
-                with urllib.request.urlopen(req) as response, open(out_file_name, 'wb') as out_file:
+                with urllib.request.urlopen(req, context=self.__ssl_context) as response, open(out_file_name, 'wb') as out_file:
                     data = response.read()
                     out_file.write(data)
                     return 0  # success
@@ -93,11 +101,15 @@ class SdkUpdateHelper(object):
         return 1
 
     def _git_http_command(self, command, updateserver="", cwd=None):
+        git_ssl_args = ""
+        if self.__git_ssl_args:
+            git_ssl_args = "%s " % self.__git_ssl_args
+
         git_ba_header = ""
         if self.__ba_credentials:
             git_ba_header = "-c http.extraheader=\"Authorization: %s\" " % self.__ba_credentials
 
-        git_cmd = "git %s %s %s" % (git_ba_header, command, updateserver)
+        git_cmd = "git %s%s %s %s" % (git_ssl_args, git_ba_header, command, updateserver)
         logger.debug("Running: %s", git_cmd)
         return subprocess.call(git_cmd, shell=True, cwd=cwd)
 
@@ -193,6 +205,12 @@ def sdk_update(args, config, basepath, workspace):
         updateserver = config.get('SDK', 'updateserver', '')
     logger.debug("updateserver: %s" % updateserver)
 
+    updateserver_insecure_tls = args.updateserver_insecure_tls
+    if not updateserver_insecure_tls:
+        updateserver_insecure_tls = config.get('SDK', 'updateserver-insecure-tls', '')
+    if updateserver_insecure_tls:
+        logger.info("Certificate of update server is not validated.")
+
     # Make sure we are using sdk-update from within SDK
     logger.debug("basepath = %s" % basepath)
     old_locked_sig_file_path = os.path.join(basepath, 'conf/locked-sigs.inc')
@@ -219,6 +237,8 @@ def sdk_update(args, config, basepath, workspace):
         tinfoil.shutdown()
 
     sdk_update_helper = SdkUpdateHelper()
+    if updateserver_insecure_tls:
+        sdk_update_helper.enable_insecure_ssl()
     tmpsdk_dir = tempfile.mkdtemp()
     try:
         os.makedirs(os.path.join(tmpsdk_dir, 'conf'))
@@ -416,6 +436,13 @@ def register_commands(subparsers, context):
             parser_sdk.add_argument('updateserver', help='The update server to fetch latest SDK components from (default %s)' % updateserver, nargs='?')
         else:
             parser_sdk.add_argument('updateserver', help='The update server to fetch latest SDK components from')
+
+        try:
+            updateserver_insecure_tls = context.config.get('SDK', 'updateserver-insecure-tls', '')
+        except AttributeError:
+            updateserver_insecure_tls = False
+        parser_sdk.add_argument('--updateserver-insecure-tls', action="store_true", help='Do not validate the SSL Certificate of the update server (default %s)' % updateserver_insecure_tls)
+
         parser_sdk.add_argument('--skip-prepare', action="store_true", help='Skip re-preparing the build system after updating (for debugging only)')
         parser_sdk.set_defaults(func=sdk_update)
 
-- 
2.14.1


