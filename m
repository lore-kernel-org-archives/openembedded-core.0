Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id EF2836BA81
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Nov 2018 09:40:38 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id v6so2291733wrr.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Nov 2018 01:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=ue4//cvS+Hgwra4IIjnqw0a0vCj+h2VkyD1B0MuREiU=;
	b=WEbgPjYIIAEc9S1kmAnkamRggAjGGL0ErINmLinICGL+QwtJEvxlliVBe14qOOMsnQ
	SjscLWC4P5ZQA0GvYOT/svdQbzms/9OeG0H9LAMNcrBlikT7tVV1yFpXne6bkZ951s3C
	xANAYkKyWt4RRDysP0zS9cG7dWUDokPgacEiU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ue4//cvS+Hgwra4IIjnqw0a0vCj+h2VkyD1B0MuREiU=;
	b=KnLFI6Ocyl9WORkOBLTsPRbGQpjRiWB91y3fpfUDe4xSFGugPGaVZMPQPSK37t2+Io
	7bZwknQlKKGgfM9aU6tCC0fuCzPDNRRF9RPKSAhh6XS0FLy5eaEyvkrT9rHPLYN/6Iuu
	55D3BAs5h6T57KzAAnPLgnIn4hbOmCWG6QoHeWAnqgnMp8aIz/Xbyx/cfgwtryWYGDSc
	Ea5bNXQBkB+zhPpG0CvVyjAt84MziVx+5rQeuYnL/omDsxcK9vfGCnlSsj3EBCVC9qof
	mW/HnQ0USuwdHOb0qDgCLtYYa2FLjiEZnoK30yPOeh5QBxaN80TV94CocSxDdHjUe5Yu
	foXg==
X-Gm-Message-State: AA+aEWaHKdKS8surebuhvknBq+FESkT3/oeyFfk6FgOyqVkGoSIV2Ken
	RzL6w61hvx6Pv7+4kfepDXwForlBuYg=
X-Google-Smtp-Source: AFSGD/USKnQ/K03b4PXcOc5/5ExfSTbH60il0gAAfuX2lW/istPLpG1A97DQglFLzg60gi6UO4Whew==
X-Received: by 2002:adf:fc4c:: with SMTP id
	e12-v6mr1337173wrs.145.1542361238997; 
	Fri, 16 Nov 2018 01:40:38 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o27-v6sm24554039wro.24.2018.11.16.01.40.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Nov 2018 01:40:38 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Nov 2018 09:40:33 +0000
Message-Id: <20181116094037.4220-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/5] scripts: Remove deprecated imp module usage
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
X-List-Received-Date: Fri, 16 Nov 2018 09:40:39 -0000

The imp module is deprecated, port the code over to use importlib
as recently done for bb.utils as well.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/scriptutils.py | 11 +++++------
 scripts/pythondeps         |  8 +++-----
 2 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/scripts/lib/scriptutils.py b/scripts/lib/scriptutils.py
index 31e48ea4dc1..3c60c3a1e6c 100644
--- a/scripts/lib/scriptutils.py
+++ b/scripts/lib/scriptutils.py
@@ -26,6 +26,8 @@ import string
 import subprocess
 import sys
 import tempfile
+import importlib
+from importlib import machinery
 
 def logger_create(name, stream=None):
     logger = logging.getLogger(name)
@@ -50,12 +52,9 @@ def load_plugins(logger, plugins, pluginpath):
 
     def load_plugin(name):
         logger.debug('Loading plugin %s' % name)
-        fp, pathname, description = imp.find_module(name, [pluginpath])
-        try:
-            return imp.load_module(name, fp, pathname, description)
-        finally:
-            if fp:
-                fp.close()
+        spec = importlib.machinery.PathFinder.find_spec(name, path=[pluginpath] )
+        if spec:
+            return spec.loader.load_module()
 
     def plugin_name(filename):
         return os.path.splitext(os.path.basename(filename))[0]
diff --git a/scripts/pythondeps b/scripts/pythondeps
index 590b9769e78..3e13a587eef 100755
--- a/scripts/pythondeps
+++ b/scripts/pythondeps
@@ -9,7 +9,8 @@
 
 import argparse
 import ast
-import imp
+import importlib
+from importlib import machinery
 import logging
 import os.path
 import sys
@@ -17,10 +18,7 @@ import sys
 
 logger = logging.getLogger('pythondeps')
 
-suffixes = []
-for triple in imp.get_suffixes():
-    suffixes.append(triple[0])
-
+suffixes = importlib.machinery.all_suffixes()
 
 class PythonDepError(Exception):
     pass
-- 
2.17.1


