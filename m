Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id 06CAF613DE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 18:38:20 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id a9so1793654wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 10:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=vWUQf/3XxAamu7lTjtlnqT19i9i3tXKtJhcU2m3PpAc=;
	b=VXdTkcg1HZAQZq7O8+bDJnh1dh54BFnoVCCChrJEpNNm4hVlL6vSL89mzFRrunVgb7
	Cx3DVMLoJmAq8b47p8HzvO9p5sUjhI6niB55+wlGcH38MyVab6idId/T36rFt5h4vUbt
	F5FxsKZfSz3mB0gtsSwXEWK78nZp/o5Bl+k+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=vWUQf/3XxAamu7lTjtlnqT19i9i3tXKtJhcU2m3PpAc=;
	b=Yk7SnHJ8k0eLab0IX1reLWW93MRSKyTu+DtlCqz1kgSapLL0SpA8WHq4J+cX90GE1F
	sn7V/0bTMjd1hyElRfJiIkqZ/SgMCsmy/qLRKJ7nBAQc+/3dQrJYrzyx3FUA6yLr7BZM
	O3VBk6EIA8UMCVf2g+33PBWxQXbrUHCCon8vJl23uMOiSh6yg+ZvtLXJJJienEgYDNde
	P8f9v5VyPsvkmHWd86ji757XTvuTzOqdw5VRekEdCa0m+BttYS0eGX48V7whypy9oFqM
	NDGPyu8YZGv9Vyk5Q/25O7vH9GoH0mVeZXpbKXV8hLGXLTcqT3WBlEkLrIGKHdHZqUYJ
	9Sng==
X-Gm-Message-State: APjAAAXsHKfNIY6RD/3J4K1VG0jWPIrKOGB9kSgEjIqelr/xkd0lL3+R
	qvewJTfpJI5Smt0V2cImTZULATUl/dk=
X-Google-Smtp-Source: APXvYqwzWX5FgCEeJh9wFyyAh0QJXWCvgFbe4X3e8a4tmfg1dgJ5oQlKaRjclagbOhCmHPEwd2FYuA==
X-Received: by 2002:a1c:7ec5:: with SMTP id z188mr11299435wmc.52.1582137501328;
	Wed, 19 Feb 2020 10:38:21 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	b21sm856697wmd.37.2020.02.19.10.38.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 19 Feb 2020 10:38:20 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Feb 2020 18:38:17 +0000
Message-Id: <20200219183817.130495-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200219183817.130495-1-richard.purdie@linuxfoundation.org>
References: <20200219183817.130495-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 3/3] oeqa/selftest: Drop 'backup' code and SIGTERM handler
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
X-List-Received-Date: Wed, 19 Feb 2020 18:38:21 -0000
Content-Transfer-Encoding: 8bit

Now selftest is using its own copied build directory, we can stop worrying about
copying files around as backup, and drop the SIGTERM handler to try and restore
them, simplifying the code.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/case.py    | 30 +-------------------
 meta/lib/oeqa/selftest/context.py | 47 ++-----------------------------
 2 files changed, 4 insertions(+), 73 deletions(-)

diff --git a/meta/lib/oeqa/selftest/case.py b/meta/lib/oeqa/selftest/case.py
index ac3308d8a44..dcad4f76ecd 100644
--- a/meta/lib/oeqa/selftest/case.py
+++ b/meta/lib/oeqa/selftest/case.py
@@ -6,7 +6,6 @@
 
 import sys
 import os
-import shutil
 import glob
 import errno
 from unittest.util import safe_repr
@@ -30,9 +29,7 @@ class OESelftestTestCase(OETestCase):
         cls.builddir = cls.tc.config_paths['builddir']
 
         cls.localconf_path = cls.tc.config_paths['localconf']
-        cls.localconf_backup = cls.tc.config_paths['localconf_class_backup']
         cls.local_bblayers_path = cls.tc.config_paths['bblayers']
-        cls.local_bblayers_backup = cls.tc.config_paths['bblayers_class_backup']
 
         cls.testinc_path = os.path.join(cls.tc.config_paths['builddir'],
                 "conf/selftest.inc")
@@ -43,8 +40,7 @@ class OESelftestTestCase(OETestCase):
 
         cls._track_for_cleanup = [
             cls.testinc_path, cls.testinc_bblayers_path,
-            cls.machineinc_path, cls.localconf_backup,
-            cls.local_bblayers_backup]
+            cls.machineinc_path]
 
         cls.add_include()
 
@@ -102,30 +98,6 @@ class OESelftestTestCase(OETestCase):
     def setUp(self):
         super(OESelftestTestCase, self).setUp()
         os.chdir(self.builddir)
-        # Check if local.conf or bblayers.conf files backup exists
-        # from a previous failed test and restore them
-        if os.path.isfile(self.localconf_backup) or os.path.isfile(
-                self.local_bblayers_backup):
-            self.logger.debug("\
-Found a local.conf and/or bblayers.conf backup from a previously aborted test.\
-Restoring these files now, but tests should be re-executed from a clean environment\
-to ensure accurate results.")
-            try:
-                shutil.copyfile(self.localconf_backup, self.localconf_path)
-            except OSError as e:
-                if e.errno != errno.ENOENT:
-                    raise
-            try:
-                shutil.copyfile(self.local_bblayers_backup,
-                                self.local_bblayers_path)
-            except OSError as e:
-                if e.errno != errno.ENOENT:
-                    raise
-        else:
-            # backup local.conf and bblayers.conf
-            shutil.copyfile(self.localconf_path, self.localconf_backup)
-            shutil.copyfile(self.local_bblayers_path, self.local_bblayers_backup)
-            self.logger.debug("Creating local.conf and bblayers.conf backups.")
         # we don't know what the previous test left around in config or inc files
         # if it failed so we need a fresh start
         try:
diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index 2cb6c763852..0ab6462bbf8 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -9,9 +9,7 @@ import time
 import glob
 import sys
 import importlib
-import signal
 import subprocess
-from shutil import copyfile
 from random import choice
 
 import oeqa
@@ -185,26 +183,10 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
 
         builddir = os.environ.get("BUILDDIR")
         self.tc_kwargs['init']['config_paths'] = {}
-        self.tc_kwargs['init']['config_paths']['testlayer_path'] = \
-                get_test_layer()
+        self.tc_kwargs['init']['config_paths']['testlayer_path'] = get_test_layer()
         self.tc_kwargs['init']['config_paths']['builddir'] = builddir
-        self.tc_kwargs['init']['config_paths']['localconf'] = \
-                os.path.join(builddir, "conf/local.conf")
-        self.tc_kwargs['init']['config_paths']['localconf_backup'] = \
-                os.path.join(builddir, "conf/local.conf.orig")
-        self.tc_kwargs['init']['config_paths']['localconf_class_backup'] = \
-                os.path.join(builddir, "conf/local.conf.bk")
-        self.tc_kwargs['init']['config_paths']['bblayers'] = \
-                os.path.join(builddir, "conf/bblayers.conf")
-        self.tc_kwargs['init']['config_paths']['bblayers_backup'] = \
-                os.path.join(builddir, "conf/bblayers.conf.orig")
-        self.tc_kwargs['init']['config_paths']['bblayers_class_backup'] = \
-                os.path.join(builddir, "conf/bblayers.conf.bk")
-
-        copyfile(self.tc_kwargs['init']['config_paths']['localconf'],
-                self.tc_kwargs['init']['config_paths']['localconf_backup'])
-        copyfile(self.tc_kwargs['init']['config_paths']['bblayers'], 
-                self.tc_kwargs['init']['config_paths']['bblayers_backup'])
+        self.tc_kwargs['init']['config_paths']['localconf'] = os.path.join(builddir, "conf/local.conf")
+        self.tc_kwargs['init']['config_paths']['bblayers'] = os.path.join(builddir, "conf/bblayers.conf")
 
         def tag_filter(tags):
             if args.exclude_tags:
@@ -329,18 +311,9 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
 
         return rc
 
-    def _signal_clean_handler(self, signum, frame):
-        if self.ourpid == os.getpid():
-            sys.exit(1)
-    
     def run(self, logger, args):
         self._process_args(logger, args)
 
-        # Setup a SIGTERM handler to allow restoration of files like local.conf and bblayers.conf
-        # but don't interfer with other processes
-        self.ourpid = os.getpid()
-        signal.signal(signal.SIGTERM, self._signal_clean_handler)
-
         rc = None
         try:
             if args.machine:
@@ -369,20 +342,6 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
                 rc = self._internal_run(logger, args)
         finally:
             config_paths = self.tc_kwargs['init']['config_paths']
-            if os.path.exists(config_paths['localconf_backup']):
-                copyfile(config_paths['localconf_backup'],
-                        config_paths['localconf'])
-                os.remove(config_paths['localconf_backup'])
-
-            if os.path.exists(config_paths['bblayers_backup']):
-                copyfile(config_paths['bblayers_backup'], 
-                        config_paths['bblayers'])
-                os.remove(config_paths['bblayers_backup'])
-
-            if os.path.exists(config_paths['localconf_class_backup']):
-                os.remove(config_paths['localconf_class_backup'])
-            if os.path.exists(config_paths['bblayers_class_backup']):
-                os.remove(config_paths['bblayers_class_backup'])
 
             output_link = os.path.join(os.path.dirname(args.output_log),
                     "%s-results.log" % self.name)
-- 
2.25.0


