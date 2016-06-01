Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 61FFC77349
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jun 2016 12:36:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u51CZslT006905; Wed, 1 Jun 2016 13:35:57 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id UG3YELV1zwon; Wed,  1 Jun 2016 13:35:57 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u51CZpiu006885
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 1 Jun 2016 13:35:52 +0100
Received: from richard by hex with local (Exim 4.86)
	(envelope-from <richard@rpsys.net>)
	id 1b85NH-0000lW-Ez; Wed, 01 Jun 2016 13:35:51 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Jun 2016 13:35:35 +0100
Message-Id: <1464784540-2786-17-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1464784540-2786-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1464784540-2786-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 17/22] classes/lib: Complete transition to python3
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
X-List-Received-Date: Wed, 01 Jun 2016 12:36:01 -0000

This patch contains all the other misc pieces of the transition to
python3 which didn't make sense to be broken into individual patches.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/base.bbclass                |  2 +-
 meta/classes/buildhistory.bbclass        |  2 +-
 meta/classes/populate_sdk_ext.bbclass    |  4 ++--
 meta/classes/report-error.bbclass        |  2 +-
 meta/lib/oe/classutils.py                | 15 ++++++++-------
 meta/lib/oe/distro_check.py              |  4 ++--
 meta/lib/oe/maketype.py                  |  9 ++++++---
 meta/lib/oe/manifest.py                  |  3 +--
 meta/lib/oe/package.py                   |  2 +-
 meta/lib/oe/package_manager.py           | 11 +++--------
 meta/lib/oe/qa.py                        | 28 ++++++++++++++--------------
 meta/lib/oe/recipeutils.py               |  4 ++--
 meta/lib/oe/rootfs.py                    |  3 +--
 meta/lib/oe/sdk.py                       |  4 +---
 meta/lib/oe/terminal.py                  |  6 ++----
 meta/lib/oe/tests/test_path.py           |  2 +-
 meta/lib/oe/types.py                     |  4 ++--
 meta/lib/oe/utils.py                     |  6 +++---
 meta/lib/oeqa/controllers/masterimage.py |  4 +---
 meta/lib/oeqa/oetest.py                  | 10 +++++++++-
 meta/lib/oeqa/selftest/_toaster.py       |  4 ++--
 meta/lib/oeqa/selftest/recipetool.py     |  4 ++--
 meta/lib/oeqa/selftest/sstatetests.py    |  6 +++---
 meta/lib/oeqa/targetcontrol.py           |  4 +---
 meta/lib/oeqa/utils/commands.py          |  4 ++--
 meta/lib/oeqa/utils/decorators.py        | 17 ++++++++++++++++-
 meta/lib/oeqa/utils/dump.py              |  2 +-
 meta/lib/oeqa/utils/httpserver.py        |  6 +++---
 meta/lib/oeqa/utils/logparser.py         |  2 +-
 meta/lib/oeqa/utils/qemurunner.py        | 22 ++++++++++++----------
 meta/lib/oeqa/utils/qemutinyrunner.py    |  2 +-
 meta/lib/oeqa/utils/targetbuild.py       |  4 +---
 meta/lib/oeqa/utils/testexport.py        |  2 +-
 scripts/oe-selftest                      | 10 ++++++----
 34 files changed, 114 insertions(+), 100 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 1ba1222..1bbe812 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -10,7 +10,7 @@ inherit utility-tasks
 inherit metadata_scm
 inherit logging
 
-OE_IMPORTS += "os sys time oe.path oe.utils oe.data oe.package oe.packagegroup oe.sstatesig oe.lsb oe.cachedpath"
+OE_IMPORTS += "os sys time oe.path oe.utils oe.types oe.package oe.packagegroup oe.sstatesig oe.lsb oe.cachedpath"
 OE_IMPORTS[type] = "list"
 
 def oe_import(d):
diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 1ccd9ee..6995d06 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -145,7 +145,7 @@ python buildhistory_emit_pkghistory() {
                 elif name == "RCONFLICTS":
                     pkginfo.rconflicts = value
                 elif name == "PKGSIZE":
-                    pkginfo.size = long(value)
+                    pkginfo.size = int(value)
                 elif name == "FILES":
                     pkginfo.files = value
                 elif name == "FILELIST":
diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index a9c6fe5..b9d9543 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -129,8 +129,8 @@ python copy_buildsystem () {
     d.setVar('scriptrelpath', scriptrelpath)
 
     # Write out config file for devtool
-    import ConfigParser
-    config = ConfigParser.SafeConfigParser()
+    import configparser
+    config = configparser.SafeConfigParser()
     config.add_section('General')
     config.set('General', 'bitbake_subdir', conf_bbpath)
     config.set('General', 'init_path', conf_initpath)
diff --git a/meta/classes/report-error.bbclass b/meta/classes/report-error.bbclass
index 20d2bef..5cbf8f0 100644
--- a/meta/classes/report-error.bbclass
+++ b/meta/classes/report-error.bbclass
@@ -43,7 +43,7 @@ python errorreport_handler () {
             data['target_sys'] = e.data.getVar("TARGET_SYS", True)
             data['failures'] = []
             data['component'] = e.getPkgs()[0]
-            data['branch_commit'] = base_detect_branch(e.data) + ": " + base_detect_revision(e.data)
+            data['branch_commit'] = str(base_detect_branch(e.data)) + ": " + str(base_detect_revision(e.data))
             lock = bb.utils.lockfile(datafile + '.lock')
             errorreport_savedata(e, data, "error-report.txt")
             bb.utils.unlockfile(lock)
diff --git a/meta/lib/oe/classutils.py b/meta/lib/oe/classutils.py
index 98bb059..e7856c8 100644
--- a/meta/lib/oe/classutils.py
+++ b/meta/lib/oe/classutils.py
@@ -1,4 +1,11 @@
-class ClassRegistry(type):
+
+class ClassRegistryMeta(type):
+    """Give each ClassRegistry their own registry"""
+    def __init__(cls, name, bases, attrs):
+        cls.registry = {}
+        type.__init__(cls, name, bases, attrs)
+
+class ClassRegistry(type, metaclass=ClassRegistryMeta):
     """Maintain a registry of classes, indexed by name.
 
 Note that this implementation requires that the names be unique, as it uses
@@ -12,12 +19,6 @@ Subclasses of ClassRegistry may define an 'implemented' property to exert
 control over whether the class will be added to the registry (e.g. to keep
 abstract base classes out of the registry)."""
     priority = 0
-    class __metaclass__(type):
-        """Give each ClassRegistry their own registry"""
-        def __init__(cls, name, bases, attrs):
-            cls.registry = {}
-            type.__init__(cls, name, bases, attrs)
-
     def __init__(cls, name, bases, attrs):
         super(ClassRegistry, cls).__init__(name, bases, attrs)
         try:
diff --git a/meta/lib/oe/distro_check.py b/meta/lib/oe/distro_check.py
index ba1bba6..746e242 100644
--- a/meta/lib/oe/distro_check.py
+++ b/meta/lib/oe/distro_check.py
@@ -1,8 +1,8 @@
 from contextlib import contextmanager
 @contextmanager
 def create_socket(url, d):
-    import urllib
-    socket = urllib.urlopen(url, proxies=get_proxies(d))
+    import urllib.request, urllib.parse, urllib.error
+    socket = urllib.request.urlopen(url, proxies=get_proxies(d))
     try:
         yield socket
     finally:
diff --git a/meta/lib/oe/maketype.py b/meta/lib/oe/maketype.py
index 139f333..f88981d 100644
--- a/meta/lib/oe/maketype.py
+++ b/meta/lib/oe/maketype.py
@@ -6,7 +6,8 @@ the arguments of the type's factory for details.
 """
 
 import inspect
-import types
+import oe.types as types
+import collections
 
 available_types = {}
 
@@ -53,7 +54,9 @@ def get_callable_args(obj):
     if type(obj) is type:
         obj = obj.__init__
 
-    args, varargs, keywords, defaults = inspect.getargspec(obj)
+    sig = inspect.signature(obj)
+    args = list(sig.parameters.keys())
+    defaults = list(s for s in sig.parameters.keys() if sig.parameters[s].default != inspect.Parameter.empty)
     flaglist = []
     if args:
         if len(args) > 1 and args[0] == 'self':
@@ -93,7 +96,7 @@ for name in dir(types):
         continue
 
     obj = getattr(types, name)
-    if not callable(obj):
+    if not isinstance(obj, collections.Callable):
         continue
 
     register(name, obj)
diff --git a/meta/lib/oe/manifest.py b/meta/lib/oe/manifest.py
index ec2ef50..95f8eb2 100644
--- a/meta/lib/oe/manifest.py
+++ b/meta/lib/oe/manifest.py
@@ -4,11 +4,10 @@ import re
 import bb
 
 
-class Manifest(object):
+class Manifest(object, metaclass=ABCMeta):
     """
     This is an abstract class. Do not instantiate this directly.
     """
-    __metaclass__ = ABCMeta
 
     PKG_TYPE_MUST_INSTALL = "mip"
     PKG_TYPE_MULTILIB = "mlp"
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 5bb15bb..faa0ab2 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -8,7 +8,7 @@ def runstrip(arg):
     # 8 - shared library
     # 16 - kernel module
 
-    import commands, stat, subprocess
+    import stat, subprocess
 
     (file, elftype, strip) = arg
 
diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 54e6970..71e5b50 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -89,9 +89,7 @@ def opkg_query(cmd_output):
     return output
 
 
-class Indexer(object):
-    __metaclass__ = ABCMeta
-
+class Indexer(object, metaclass=ABCMeta):
     def __init__(self, d, deploy_dir):
         self.d = d
         self.deploy_dir = deploy_dir
@@ -342,9 +340,7 @@ class DpkgIndexer(Indexer):
 
 
 
-class PkgsList(object):
-    __metaclass__ = ABCMeta
-
+class PkgsList(object, metaclass=ABCMeta):
     def __init__(self, d, rootfs_dir):
         self.d = d
         self.rootfs_dir = rootfs_dir
@@ -512,11 +508,10 @@ class DpkgPkgsList(PkgsList):
         return opkg_query(cmd_output)
 
 
-class PackageManager(object):
+class PackageManager(object, metaclass=ABCMeta):
     """
     This is an abstract class. Do not instantiate this directly.
     """
-    __metaclass__ = ABCMeta
 
     def __init__(self, d):
         self.d = d
diff --git a/meta/lib/oe/qa.py b/meta/lib/oe/qa.py
index 2c30141..75e7df8 100644
--- a/meta/lib/oe/qa.py
+++ b/meta/lib/oe/qa.py
@@ -50,41 +50,41 @@ class ELFFile:
         if len(self.data) < ELFFile.EI_NIDENT + 4:
             raise NotELFFileError("%s is not an ELF" % self.name)
 
-        self.my_assert(self.data[0], chr(0x7f) )
-        self.my_assert(self.data[1], 'E')
-        self.my_assert(self.data[2], 'L')
-        self.my_assert(self.data[3], 'F')
+        self.my_assert(self.data[0], 0x7f)
+        self.my_assert(self.data[1], ord('E'))
+        self.my_assert(self.data[2], ord('L'))
+        self.my_assert(self.data[3], ord('F'))
         if self.bits == 0:
-            if self.data[ELFFile.EI_CLASS] == chr(ELFFile.ELFCLASS32):
+            if self.data[ELFFile.EI_CLASS] == ELFFile.ELFCLASS32:
                 self.bits = 32
-            elif self.data[ELFFile.EI_CLASS] == chr(ELFFile.ELFCLASS64):
+            elif self.data[ELFFile.EI_CLASS] == ELFFile.ELFCLASS64:
                 self.bits = 64
             else:
                 # Not 32-bit or 64.. lets assert
                 raise NotELFFileError("ELF but not 32 or 64 bit.")
         elif self.bits == 32:
-            self.my_assert(self.data[ELFFile.EI_CLASS], chr(ELFFile.ELFCLASS32))
+            self.my_assert(self.data[ELFFile.EI_CLASS], ELFFile.ELFCLASS32)
         elif self.bits == 64:
-            self.my_assert(self.data[ELFFile.EI_CLASS], chr(ELFFile.ELFCLASS64))
+            self.my_assert(self.data[ELFFile.EI_CLASS], ELFFile.ELFCLASS64)
         else:
             raise NotELFFileError("Must specify unknown, 32 or 64 bit size.")
-        self.my_assert(self.data[ELFFile.EI_VERSION], chr(ELFFile.EV_CURRENT) )
+        self.my_assert(self.data[ELFFile.EI_VERSION], ELFFile.EV_CURRENT)
 
         self.sex = self.data[ELFFile.EI_DATA]
-        if self.sex == chr(ELFFile.ELFDATANONE):
+        if self.sex == ELFFile.ELFDATANONE:
             raise NotELFFileError("self.sex == ELFDATANONE")
-        elif self.sex == chr(ELFFile.ELFDATA2LSB):
+        elif self.sex == ELFFile.ELFDATA2LSB:
             self.sex = "<"
-        elif self.sex == chr(ELFFile.ELFDATA2MSB):
+        elif self.sex == ELFFile.ELFDATA2MSB:
             self.sex = ">"
         else:
             raise NotELFFileError("Unknown self.sex")
 
     def osAbi(self):
-        return ord(self.data[ELFFile.EI_OSABI])
+        return self.data[ELFFile.EI_OSABI]
 
     def abiVersion(self):
-        return ord(self.data[ELFFile.EI_ABIVERSION])
+        return self.data[ELFFile.EI_ABIVERSION]
 
     def abiSize(self):
         return self.bits
diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 1b85387..e3c4b8a 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -11,7 +11,7 @@ import os.path
 import tempfile
 import textwrap
 import difflib
-import utils
+from . import utils
 import shutil
 import re
 import fnmatch
@@ -662,7 +662,7 @@ def bbappend_recipe(rd, destlayerdir, srcfiles, install=None, wildcardver=False,
 
                 if removevar in removevalues:
                     remove = removevalues[removevar]
-                    if isinstance(remove, basestring):
+                    if isinstance(remove, str):
                         if remove in splitval:
                             splitval.remove(remove)
                             changed = True
diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index d934858..1fc35bd 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -10,11 +10,10 @@ import subprocess
 import re
 
 
-class Rootfs(object):
+class Rootfs(object, metaclass=ABCMeta):
     """
     This is an abstract class. Do not instantiate this directly.
     """
-    __metaclass__ = ABCMeta
 
     def __init__(self, d):
         self.d = d
diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index 4786cc5..c74525f 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -8,9 +8,7 @@ import glob
 import traceback
 
 
-class Sdk(object):
-    __metaclass__ = ABCMeta
-
+class Sdk(object, metaclass=ABCMeta):
     def __init__(self, d, manifest_dir):
         self.d = d
         self.sdk_output = self.d.getVar('SDK_OUTPUT', True)
diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index 634daa9..dc25d14 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -25,9 +25,7 @@ class Registry(oe.classutils.ClassRegistry):
         return bool(cls.command)
 
 
-class Terminal(Popen):
-    __metaclass__ = Registry
-
+class Terminal(Popen, metaclass=Registry):
     def __init__(self, sh_cmd, title=None, env=None, d=None):
         fmt_sh_cmd = self.format_command(sh_cmd, title)
         try:
@@ -41,7 +39,7 @@ class Terminal(Popen):
 
     def format_command(self, sh_cmd, title):
         fmt = {'title': title or 'Terminal', 'command': sh_cmd}
-        if isinstance(self.command, basestring):
+        if isinstance(self.command, str):
             return shlex.split(self.command.format(**fmt))
         else:
             return [element.format(**fmt) for element in self.command]
diff --git a/meta/lib/oe/tests/test_path.py b/meta/lib/oe/tests/test_path.py
index 5fa2448..44d0681 100644
--- a/meta/lib/oe/tests/test_path.py
+++ b/meta/lib/oe/tests/test_path.py
@@ -85,5 +85,5 @@ class TestRealPath(unittest.TestCase):
 
     def test_loop(self):
         for e in self.EXCEPTIONS:
-            self.assertRaisesRegexp(OSError, r'\[Errno %u\]' % e[1],
+            self.assertRaisesRegex(OSError, r'\[Errno %u\]' % e[1],
                                     self.__realpath, e[0], False, False)
diff --git a/meta/lib/oe/types.py b/meta/lib/oe/types.py
index 7f47c17..4ae58ac 100644
--- a/meta/lib/oe/types.py
+++ b/meta/lib/oe/types.py
@@ -33,7 +33,7 @@ def choice(value, choices):
     Acts as a multiple choice for the user.  To use this, set the variable
     type flag to 'choice', and set the 'choices' flag to a space separated
     list of valid values."""
-    if not isinstance(value, basestring):
+    if not isinstance(value, str):
         raise TypeError("choice accepts a string, not '%s'" % type(value))
 
     value = value.lower()
@@ -106,7 +106,7 @@ def boolean(value):
     Valid values for false: 'no', 'n', 'false', 'f', '0'
     """
 
-    if not isinstance(value, basestring):
+    if not isinstance(value, str):
         raise TypeError("boolean accepts a string, not '%s'" % type(value))
 
     value = value.lower()
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 1bbdbb4..cecddc6 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -46,7 +46,7 @@ def both_contain(variable1, variable2, checkvalue, d):
     val2 = d.getVar(variable2, True)
     val1 = set(val1.split())
     val2 = set(val2.split())
-    if isinstance(checkvalue, basestring):
+    if isinstance(checkvalue, str):
         checkvalue = set(checkvalue.split())
     else:
         checkvalue = set(checkvalue)
@@ -235,7 +235,7 @@ def format_pkg_list(pkg_dict, ret_format=None):
 # so implement a version here
 #
 
-from Queue import Queue
+from queue import Queue
 from threading import Thread
 
 class ThreadedWorker(Thread):
@@ -249,7 +249,7 @@ class ThreadedWorker(Thread):
         self.worker_end = worker_end
 
     def run(self):
-        from Queue import Empty
+        from queue import Empty
 
         if self.worker_init is not None:
             self.worker_init(self)
diff --git a/meta/lib/oeqa/controllers/masterimage.py b/meta/lib/oeqa/controllers/masterimage.py
index 522f9eb..4cb7553 100644
--- a/meta/lib/oeqa/controllers/masterimage.py
+++ b/meta/lib/oeqa/controllers/masterimage.py
@@ -24,9 +24,7 @@ from oeqa.utils import CommandError
 
 from abc import ABCMeta, abstractmethod
 
-class MasterImageHardwareTarget(oeqa.targetcontrol.BaseTarget):
-
-    __metaclass__ = ABCMeta
+class MasterImageHardwareTarget(oeqa.targetcontrol.BaseTarget, metaclass=ABCMeta):
 
     supported_image_fstypes = ['tar.gz', 'tar.bz2']
 
diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index 4211ffc..b4cf34b 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -13,6 +13,7 @@ import inspect
 import subprocess
 import signal
 import shutil
+import functools
 try:
     import bb
 except ImportError:
@@ -340,7 +341,14 @@ class TestContext(object):
         for index, suite in enumerate(suites):
             set_suite_depth(suite)
             suite.index = index
-        suites.sort(cmp=lambda a,b: cmp((a.depth, a.index), (b.depth, b.index)))
+
+        def cmp(a, b):
+            return (a > b) - (a < b)
+
+        def cmpfunc(a, b):
+            return cmp((a.depth, a.index), (b.depth, b.index))
+
+        suites.sort(key=functools.cmp_to_key(cmpfunc))
 
         self.suite = testloader.suiteClass(suites)
 
diff --git a/meta/lib/oeqa/selftest/_toaster.py b/meta/lib/oeqa/selftest/_toaster.py
index c424659..15ea9df 100644
--- a/meta/lib/oeqa/selftest/_toaster.py
+++ b/meta/lib/oeqa/selftest/_toaster.py
@@ -2,7 +2,7 @@ import unittest
 import os
 import sys
 import shlex, subprocess
-import urllib, commands, time, getpass, re, json, shlex
+import urllib.request, urllib.parse, urllib.error, subprocess, time, getpass, re, json, shlex
 
 import oeqa.utils.ftools as ftools
 from oeqa.selftest.base import oeSelfTest
@@ -290,7 +290,7 @@ class Toaster_DB_Tests(ToasterSetup):
         layers = Layer.objects.values('id', 'layer_index_url')
         cnt_err = []
         for layer in layers:
-            resp = urllib.urlopen(layer['layer_index_url'])
+            resp = urllib.request.urlopen(layer['layer_index_url'])
             if (resp.getcode() != 200):
                 cnt_err.append(layer['id'])
         self.assertEqual(len(cnt_err), 0, msg = 'Errors for layer id: %s' % cnt_err)
diff --git a/meta/lib/oeqa/selftest/recipetool.py b/meta/lib/oeqa/selftest/recipetool.py
index e72911b..a93d18e 100644
--- a/meta/lib/oeqa/selftest/recipetool.py
+++ b/meta/lib/oeqa/selftest/recipetool.py
@@ -1,7 +1,7 @@
 import os
 import logging
 import tempfile
-import urlparse
+import urllib.parse
 
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, create_temp_layer
 from oeqa.utils.decorators import testcase
@@ -471,7 +471,7 @@ class RecipetoolAppendsrcBase(RecipetoolBase):
         '''Return the first file:// in SRC_URI for the specified recipe.'''
         src_uri = get_bb_var('SRC_URI', recipe).split()
         for uri in src_uri:
-            p = urlparse.urlparse(uri)
+            p = urllib.parse.urlparse(uri)
             if p.scheme == 'file':
                 return p.netloc + p.path
 
diff --git a/meta/lib/oeqa/selftest/sstatetests.py b/meta/lib/oeqa/selftest/sstatetests.py
index cc64c6c..07212ac 100644
--- a/meta/lib/oeqa/selftest/sstatetests.py
+++ b/meta/lib/oeqa/selftest/sstatetests.py
@@ -264,7 +264,7 @@ SDKMACHINE = "i686"
         files2 = get_files(topdir + "/tmp-sstatesamehash2/stamps/")
         files2 = [x.replace("tmp-sstatesamehash2", "tmp-sstatesamehash").replace("i686-linux", "x86_64-linux").replace("i686" + targetvendor + "-linux", "x86_64" + targetvendor + "-linux", ) for x in files2]
         self.maxDiff = None
-        self.assertItemsEqual(files1, files2)
+        self.assertCountEqual(files1, files2)
 
 
     @testcase(1271)
@@ -298,7 +298,7 @@ NATIVELSBSTRING = \"DistroB\"
         files2 = get_files(topdir + "/tmp-sstatesamehash2/stamps/")
         files2 = [x.replace("tmp-sstatesamehash2", "tmp-sstatesamehash") for x in files2]
         self.maxDiff = None
-        self.assertItemsEqual(files1, files2)
+        self.assertCountEqual(files1, files2)
 
     @testcase(1368)
     def test_sstate_allarch_samesigs(self):
@@ -393,7 +393,7 @@ DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
         files2 = get_files(topdir + "/tmp-sstatesamehash2/stamps")
         files2 = [x.replace("tmp-sstatesamehash2", "tmp-sstatesamehash") for x in files2]
         self.maxDiff = None
-        self.assertItemsEqual(files1, files2)
+        self.assertCountEqual(files1, files2)
 
 
     def test_sstate_noop_samesigs(self):
diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index 5422a61..1c57efa 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -43,9 +43,7 @@ def get_target_controller(d):
         return controller(d)
 
 
-class BaseTarget(object):
-
-    __metaclass__ = ABCMeta
+class BaseTarget(object, metaclass=ABCMeta):
 
     supported_image_fstypes = []
 
diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index 9a7c1d1..18fe39e 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -41,7 +41,7 @@ class Command(object):
         self.data = data
 
         self.options = dict(self.defaultopts)
-        if isinstance(self.cmd, basestring):
+        if isinstance(self.cmd, str):
             self.options["shell"] = True
         if self.data:
             self.options['stdin'] = subprocess.PIPE
@@ -123,7 +123,7 @@ def bitbake(command, ignore_status=False, timeout=None, postconfig=None, **optio
     else:
         extra_args = ""
 
-    if isinstance(command, basestring):
+    if isinstance(command, str):
         cmd = "bitbake " + extra_args + " " + command
     else:
         cmd = [ "bitbake" ] + [a for a in (command + extra_args.split(" ")) if a not in [""]]
diff --git a/meta/lib/oeqa/utils/decorators.py b/meta/lib/oeqa/utils/decorators.py
index 6fb09db..0b23565 100644
--- a/meta/lib/oeqa/utils/decorators.py
+++ b/meta/lib/oeqa/utils/decorators.py
@@ -115,6 +115,8 @@ class NoParsingFilter(logging.Filter):
     def filter(self, record):
         return record.levelno == 100
 
+import inspect
+
 def LogResults(original_class):
     orig_method = original_class.run
 
@@ -124,6 +126,19 @@ def LogResults(original_class):
     logfile = os.path.join(os.getcwd(),'results-'+caller+'.'+timestamp+'.log')
     linkfile = os.path.join(os.getcwd(),'results-'+caller+'.log')
 
+    def get_class_that_defined_method(meth):
+        if inspect.ismethod(meth):
+            for cls in inspect.getmro(meth.__self__.__class__):
+               if cls.__dict__.get(meth.__name__) is meth:
+                    return cls
+            meth = meth.__func__ # fallback to __qualname__ parsing
+        if inspect.isfunction(meth):
+            cls = getattr(inspect.getmodule(meth),
+                          meth.__qualname__.split('.<locals>', 1)[0].rsplit('.', 1)[0])
+            if isinstance(cls, type):
+               return cls
+        return None
+
     #rewrite the run method of unittest.TestCase to add testcase logging
     def run(self, result, *args, **kws):
         orig_method(self, result, *args, **kws)
@@ -135,7 +150,7 @@ def LogResults(original_class):
         except AttributeError:
             test_case = self._testMethodName
 
-        class_name = str(testMethod.im_class).split("'")[1]
+        class_name = str(get_class_that_defined_method(testMethod)).split("'")[1]
 
         #create custom logging level for filtering.
         custom_log_level = 100
diff --git a/meta/lib/oeqa/utils/dump.py b/meta/lib/oeqa/utils/dump.py
index 63a591d..71422a9 100644
--- a/meta/lib/oeqa/utils/dump.py
+++ b/meta/lib/oeqa/utils/dump.py
@@ -3,7 +3,7 @@ import sys
 import errno
 import datetime
 import itertools
-from commands import runCmd
+from .commands import runCmd
 
 def get_host_dumper(d):
     cmds = d.getVar("testimage_dump_host", True)
diff --git a/meta/lib/oeqa/utils/httpserver.py b/meta/lib/oeqa/utils/httpserver.py
index 76518d8..bd76f36 100644
--- a/meta/lib/oeqa/utils/httpserver.py
+++ b/meta/lib/oeqa/utils/httpserver.py
@@ -1,8 +1,8 @@
-import SimpleHTTPServer
+import http.server
 import multiprocessing
 import os
 
-class HTTPServer(SimpleHTTPServer.BaseHTTPServer.HTTPServer):
+class HTTPServer(http.server.HTTPServer):
 
     def server_start(self, root_dir):
         import signal
@@ -10,7 +10,7 @@ class HTTPServer(SimpleHTTPServer.BaseHTTPServer.HTTPServer):
         os.chdir(root_dir)
         self.serve_forever()
 
-class HTTPRequestHandler(SimpleHTTPServer.SimpleHTTPRequestHandler):
+class HTTPRequestHandler(http.server.SimpleHTTPRequestHandler):
 
     def log_message(self, format_str, *args):
         pass
diff --git a/meta/lib/oeqa/utils/logparser.py b/meta/lib/oeqa/utils/logparser.py
index 87b5035..b377dcd 100644
--- a/meta/lib/oeqa/utils/logparser.py
+++ b/meta/lib/oeqa/utils/logparser.py
@@ -3,7 +3,7 @@
 import sys
 import os
 import re
-import ftools
+from . import ftools
 
 
 # A parser that can be used to identify weather a line is a test result or a section statement.
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 3d60433..e408fbb 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -23,8 +23,8 @@ logger = logging.getLogger("BitBake.QemuRunner")
 
 # Get Unicode non printable control chars
 control_range = list(range(0,32))+list(range(127,160))
-control_chars = [unichr(x) for x in control_range
-                if unichr(x) not in string.printable]
+control_chars = [chr(x) for x in control_range
+                if chr(x) not in string.printable]
 re_control_char = re.compile('[%s]' % re.escape("".join(control_chars)))
 
 class QemuRunner:
@@ -220,6 +220,7 @@ class QemuRunner:
             stopread = False
             qemusock = None
             bootlog = ''
+            data = b''
             while time.time() < endtime and not stopread:
                 sread, swrite, serror = select.select(socklist, [], [], 5)
                 for sock in sread:
@@ -283,13 +284,14 @@ class QemuRunner:
         if hasattr(self, "origchldhandler"):
             signal.signal(signal.SIGCHLD, self.origchldhandler)
         if self.runqemu:
-            os.kill(self.monitorpid, signal.SIGKILL)
-            logger.info("Sending SIGTERM to runqemu")
-            try:
-                os.killpg(os.getpgid(self.runqemu.pid), signal.SIGTERM)
-            except OSError as e:
-                if e.errno != errno.ESRCH:
-                    raise
+            if hasattr(self, "monitorpid"):
+                os.kill(self.monitorpid, signal.SIGKILL)
+                logger.info("Sending SIGTERM to runqemu")
+                try:
+                    os.killpg(os.getpgid(self.runqemu.pid), signal.SIGTERM)
+                except OSError as e:
+                    if e.errno != errno.ESRCH:
+                        raise
             endtime = time.time() + self.runqemutime
             while self.runqemu.poll() is None and time.time() < endtime:
                 time.sleep(1)
@@ -448,7 +450,7 @@ class LoggingThread(threading.Thread):
     def stop(self):
         self.logger.info("Stopping logging thread")
         if self.running:
-            os.write(self.writepipe, "stop")
+            os.write(self.writepipe, bytes("stop", "utf-8"))
 
     def teardown(self):
         self.logger.info("Tearing down logging thread")
diff --git a/meta/lib/oeqa/utils/qemutinyrunner.py b/meta/lib/oeqa/utils/qemutinyrunner.py
index 054ab0e..c823157 100644
--- a/meta/lib/oeqa/utils/qemutinyrunner.py
+++ b/meta/lib/oeqa/utils/qemutinyrunner.py
@@ -13,7 +13,7 @@ import re
 import socket
 import select
 import bb
-from qemurunner import QemuRunner
+from .qemurunner import QemuRunner
 
 class QemuTinyRunner(QemuRunner):
 
diff --git a/meta/lib/oeqa/utils/targetbuild.py b/meta/lib/oeqa/utils/targetbuild.py
index f850d78..d538f6b 100644
--- a/meta/lib/oeqa/utils/targetbuild.py
+++ b/meta/lib/oeqa/utils/targetbuild.py
@@ -10,9 +10,7 @@ import bb.utils
 import subprocess
 from abc import ABCMeta, abstractmethod
 
-class BuildProject():
-
-    __metaclass__ = ABCMeta
+class BuildProject(metaclass=ABCMeta):
 
     def __init__(self, d, uri, foldername=None, tmpdir="/tmp/"):
         self.d = d
diff --git a/meta/lib/oeqa/utils/testexport.py b/meta/lib/oeqa/utils/testexport.py
index 4fbf4bd..57be2ca 100644
--- a/meta/lib/oeqa/utils/testexport.py
+++ b/meta/lib/oeqa/utils/testexport.py
@@ -6,7 +6,7 @@
 
 import os, re, glob as g, shutil as sh,sys
 from time import sleep
-from commands import runCmd
+from .commands import runCmd
 from difflib import SequenceMatcher as SM
 
 try:
diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index db132fd..b1ecf7f 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 
 # Copyright (c) 2013 Intel Corporation
 #
@@ -34,6 +34,8 @@ import subprocess
 import time as t
 import re
 import fnmatch
+import collections
+import imp
 
 sys.path.insert(0, os.path.dirname(os.path.realpath(__file__)) + '/lib')
 import scriptpath
@@ -414,7 +416,7 @@ def coverage_report():
         # Coverage under version 4 uses coverage.coverage
         from coverage import coverage as Coverage
 
-    import cStringIO as StringIO
+    import io as StringIO
     from coverage.misc import CoverageException
 
     cov_output = StringIO.StringIO()
@@ -442,7 +444,7 @@ def main():
     bbpath = get_bb_var('BBPATH').split(':')
     layer_libdirs = [p for p in (os.path.join(l, 'lib') for l in bbpath) if os.path.exists(p)]
     sys.path.extend(layer_libdirs)
-    reload(oeqa.selftest)
+    imp.reload(oeqa.selftest)
 
     if args.run_tests_by and len(args.run_tests_by) >= 2:
         valid_options = ['name', 'class', 'module', 'id', 'tag']
@@ -491,7 +493,7 @@ def main():
                         if isinstance(t, type(oeSelfTest)) and issubclass(t, oeSelfTest) and t!=oeSelfTest:
                             print(" --", v)
                             for method in dir(t):
-                                if method.startswith("test_") and callable(vars(t)[method]):
+                                if method.startswith("test_") and isinstance(vars(t)[method], collections.Callable):
                                     print(" --  --", method)
 
                 except (AttributeError, ImportError) as e:
-- 
2.5.0


