Return-Path: <marius.kriegerowski@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Marius Kriegerowski" <marius.kriegerowski@gmail.com>
Subject: [PATCH] scriptutils: fix style to be more PEP8 compliant
Date: Thu, 14 Apr 2022 20:22:59 +0200
Message-Id: <20220414182259.69733-1-marius.kriegerowski@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
Cc: Marius Kriegerowski <marius.kriegerowski@gmail.com>

Signed-off-by: Marius Kriegerowski <marius.kriegerowski@gmail.com>
---
 scripts/lib/scriptutils.py | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/scripts/lib/scriptutils.py b/scripts/lib/scriptutils.py
index adf81476f0..b265b5c838 100644
--- a/scripts/lib/scriptutils.py
+++ b/scripts/lib/scriptutils.py
@@ -5,7 +5,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
-import argparse
 import glob
 import logging
 import os
@@ -21,11 +20,12 @@ import importlib
 import importlib.machinery
 import importlib.util
 
+
 class KeepAliveStreamHandler(logging.StreamHandler):
     def __init__(self, keepalive=True, **kwargs):
         super().__init__(**kwargs)
         if keepalive is True:
-            keepalive = 5000 # default timeout
+            keepalive = 5000  # default timeout
         self._timeout = threading.Condition()
         self._stop = False
 
@@ -36,9 +36,9 @@ class KeepAliveStreamHandler(logging.StreamHandler):
                 with self._timeout:
                     if not self._timeout.wait(keepalive):
                         self.emit(logging.LogRecord("keepalive", logging.INFO,
-                            None, None, "Keepalive message", None, None))
+                                                    None, None, "Keepalive message", None, None))
 
-        self._thread = threading.Thread(target = thread, daemon = True)
+        self._thread = threading.Thread(target=thread, daemon=True)
         self._thread.start()
 
     def close(self):
@@ -56,6 +56,7 @@ class KeepAliveStreamHandler(logging.StreamHandler):
         with self._timeout:
             self._timeout.notify()
 
+
 def logger_create(name, stream=None, keepalive=None):
     logger = logging.getLogger(name)
     if keepalive is not None:
@@ -67,21 +68,21 @@ def logger_create(name, stream=None, keepalive=None):
     logger.setLevel(logging.INFO)
     return logger
 
+
 def logger_setup_color(logger, color='auto'):
     from bb.msg import BBLogFormatter
 
     for handler in logger.handlers:
         if (isinstance(handler, logging.StreamHandler) and
-            isinstance(handler.formatter, BBLogFormatter)):
+                isinstance(handler.formatter, BBLogFormatter)):
             if color == 'always' or (color == 'auto' and handler.stream.isatty()):
                 handler.formatter.enable_color()
 
 
 def load_plugins(logger, plugins, pluginpath):
-
     def load_plugin(name):
         logger.debug('Loading plugin %s' % name)
-        spec = importlib.machinery.PathFinder.find_spec(name, path=[pluginpath] )
+        spec = importlib.machinery.PathFinder.find_spec(name, path=[pluginpath])
         if spec:
             mod = importlib.util.module_from_spec(spec)
             spec.loader.exec_module(mod)
@@ -112,6 +113,7 @@ def git_convert_standalone_clone(repodir):
             bb.process.run('git repack -a', cwd=repodir)
             os.remove(alternatesfile)
 
+
 def _get_temp_recipe_dir(d):
     # This is a little bit hacky but we need to find a place where we can put
     # the recipe so that bitbake can find it. We're going to delete it at the
@@ -128,12 +130,15 @@ def _get_temp_recipe_dir(d):
                     break
     return fetchrecipedir
 
+
 class FetchUrlFailure(Exception):
     def __init__(self, url):
         self.url = url
+
     def __str__(self):
         return "Failed to fetch URL %s" % self.url
 
+
 def fetch_url(tinfoil, srcuri, srcrev, destdir, logger, preserve_tmp=False, mirrors=False):
     """
     Fetch the specified URL using normal do_fetch and do_unpack tasks, i.e.
@@ -254,12 +259,13 @@ def run_editor(fn, logger=None):
 
     editor = os.getenv('VISUAL', os.getenv('EDITOR', 'vi'))
     try:
-        #print(shlex.split(editor) + files)
+        # print(shlex.split(editor) + files)
         return subprocess.check_call(shlex.split(editor) + files)
     except subprocess.CalledProcessError as exc:
         logger.error("Execution of '%s' failed: %s" % (editor, exc))
         return 1
 
+
 def is_src_url(param):
     """
     Check if a parameter is a URL and return True if so
@@ -273,6 +279,7 @@ def is_src_url(param):
         return True
     return False
 
+
 def filter_src_subdirs(pth):
     """
     Filter out subdirectories of initial unpacked source trees that we do not care about.
-- 
2.32.0 (Apple Git-132)

