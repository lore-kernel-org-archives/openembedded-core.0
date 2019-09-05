Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 75EED7F2A2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2019 13:44:35 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id q10so1808749pfl.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Sep 2019 06:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=WGm8AAGOR405jD60Rev3AdK3g5E4NFKfhbbeHzKBqyc=;
	b=Ngnza7nLQ3tRY9C/yitryrycCiHr7/PweL9+9kTNow1SBZh1Le570dvidrGUOCObmp
	TL0CbkNLGPYhcKFxN5G+ZzdKxYXuEb/764I03PZBUBJpq+DbUpBRznvVYe1IVkBwgRWm
	BX3jPQUHcDt/oJp6/K/IN25YslCP1KeC2SV3Jje0wxAEGxFVQB2yDws8Ol5HvTVZfWG2
	kpPTyiqNuqAKVFcKj99xZk7qVzEUL2ghlP0iYEhHO6l2ImDCinVU3LAXbYOQaGAgwFQx
	plVHNdAthUyIH+HFQeygm844Y3JguehwMN16vM1BEy/KkHaBqWgc2aJJDSQasndNnf60
	IOvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:content-transfer-encoding:mime-version;
	bh=WGm8AAGOR405jD60Rev3AdK3g5E4NFKfhbbeHzKBqyc=;
	b=rBy7Edr5pW9oO6Kr9NffGwHSGXrMnVKbfK7PFpQrbl3XoME3u7NIGCai0jT39WGEMe
	BZq6JLAYfZytmnDIuOjDDmuiuE3G7tLOdpNOHzke8NVlKWeJGdFNrBHkLLqWchvQnaKr
	uJKowOAHt5uLqEMmnE1KhGO5BpnxZysi5Ufsow+aZ/1M3inHCOMKYoNNYay1mcze6yFa
	UpTdeNI84tCSXQWn49ztTz322MjBdcRjpvFXMn62uL8VO4jmvjHiyvArHts+8pl2Pytm
	Hap8JBDtjpZ1ygBUD1hwCdk7CRzkZhDKchfe7w61jKGT66gjViY3pdywhYu8cfAfBAPh
	DOhg==
X-Gm-Message-State: APjAAAXz0e3cBvRj3WnrXVd0nljH8fzHyZq5hu7/y+iYzjJzhfeK4dnc
	fvtUjEQFKjVdDt6uEpHBp4CB43EjXzK6Hw==
X-Google-Smtp-Source: APXvYqwS5hKkSXf//Ol63Q8sTBYW6EeniiPAcfZyBawp7pyF4qEeUd/5iTjbvEMAfrknxOPRTdKI2w==
X-Received: by 2002:a62:ee0a:: with SMTP id e10mr3946852pfi.197.1567691076063; 
	Thu, 05 Sep 2019 06:44:36 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.76.229])
	by smtp.gmail.com with UTF8SMTPSA id
	2sm6385628pfa.43.2019.09.05.06.44.34
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Sep 2019 06:44:35 -0700 (PDT)
Date: Thu, 05 Sep 2019 13:44:15 +0000
Message-Id: <20190905134415.26785-3-nathan@nathanrossi.com>
In-Reply-To: <20190905134415.26785-1-nathan@nathanrossi.com>
References: <20190905134415.26785-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH 3/3] oe-selftest: Implement console 'keepalive' output
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
X-List-Received-Date: Thu, 05 Sep 2019 13:44:35 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Similar to bitbake, implement a 'keepalive' output to the console to
ensure CI systems do not kill the process. The default timeout for
bitbake is 5000s.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 scripts/lib/scriptutils.py | 43 +++++++++++++++++++++++++++++++++++++++++--
 scripts/oe-selftest        |  2 +-
 2 files changed, 42 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/scriptutils.py b/scripts/lib/scriptutils.py
index e7e7021c24..c573dc7f67 100644
--- a/scripts/lib/scriptutils.py
+++ b/scripts/lib/scriptutils.py
@@ -16,12 +16,51 @@ import string
 import subprocess
 import sys
 import tempfile
+import threading
 import importlib
 from importlib import machinery
 
-def logger_create(name, stream=None):
+class KeepAliveStreamHandler(logging.StreamHandler):
+    def __init__(self, keepalive=True, **kwargs):
+        super().__init__(**kwargs)
+        if keepalive is True:
+            keepalive = 5000 # default timeout
+        self._timeout = threading.Condition()
+        self._stop = False
+
+        # background thread waits on condition, if the condition does not
+        # happen emit a keep alive message
+        def thread():
+            while not self._stop:
+                with self._timeout:
+                    if not self._timeout.wait(keepalive):
+                        self.emit(logging.LogRecord("keepalive", logging.INFO,
+                            None, None, "Keepalive message", None, None))
+
+        self._thread = threading.Thread(target = thread, daemon = True)
+        self._thread.start()
+
+    def close(self):
+        # mark the thread to stop and notify it
+        self._stop = True
+        with self._timeout:
+            self._timeout.notify()
+        # wait for it to join
+        self._thread.join()
+        super().close()
+
+    def emit(self, record):
+        super().emit(record)
+        # trigger timer reset
+        with self._timeout:
+            self._timeout.notify()
+
+def logger_create(name, stream=None, keepalive=None):
     logger = logging.getLogger(name)
-    loggerhandler = logging.StreamHandler(stream=stream)
+    if keepalive is not None:
+        loggerhandler = KeepAliveStreamHandler(stream=stream, keepalive=keepalive)
+    else:
+        loggerhandler = logging.StreamHandler(stream=stream)
     loggerhandler.setFormatter(logging.Formatter("%(levelname)s: %(message)s"))
     logger.addHandler(loggerhandler)
     logger.setLevel(logging.INFO)
diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index 57662b2f75..18ac0f5869 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -33,7 +33,7 @@ scriptpath.add_bitbake_lib_path()
 from oeqa.utils import load_test_components
 from oeqa.core.exception import OEQAPreRun
 
-logger = scriptutils.logger_create('oe-selftest', stream=sys.stdout)
+logger = scriptutils.logger_create('oe-selftest', stream=sys.stdout, keepalive=True)
 
 def main():
     description = "Script that runs unit tests against bitbake and other Yocto related tools. The goal is to validate tools functionality and metadata integrity. Refer to https://wiki.yoctoproject.org/wiki/Oe-selftest for more information."
---
2.23.0.rc1

