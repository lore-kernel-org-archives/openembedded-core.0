Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 0B32C73184
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 04:04:10 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 21 Dec 2015 20:04:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,462,1444719600"; d="scan'208";a="621978834"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.148.44])
	by FMSMGA003.fm.intel.com with ESMTP; 21 Dec 2015 20:04:08 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Dec 2015 17:02:54 +1300
Message-Id: <6766455bb351e516c9bcdffe28f3689c28380001.1450756555.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1450756555.git.paul.eggleton@linux.intel.com>
References: <cover.1450756555.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1450756555.git.paul.eggleton@linux.intel.com>
References: <cover.1450756555.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 01/26] scripts: print usage in argparse-using scripts when a command-line error occurs
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
X-List-Received-Date: Tue, 22 Dec 2015 04:04:10 -0000

For scripts that use Python's standard argparse module to parse
command-line arguments, create a subclass which will show the usage
the usage information when a command-line parsing error occurs. The most
common case would be when the script is run with no arguments; at least
then the user immediately gets to see what arguments they might need to
pass instead of just an error message.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/contrib/devtool-stress.py |  5 +++--
 scripts/devtool                   |  7 ++++---
 scripts/lib/argparse_oe.py        | 11 +++++++++++
 scripts/lib/scriptutils.py        |  1 +
 scripts/oe-pkgdata-util           |  5 +++--
 scripts/oe-publish-sdk            |  5 +++--
 scripts/oe-selftest               |  3 ++-
 scripts/recipetool                |  7 ++++---
 scripts/send-error-report         |  6 +++++-
 scripts/test-remote-image         |  3 ++-
 10 files changed, 38 insertions(+), 15 deletions(-)
 create mode 100644 scripts/lib/argparse_oe.py

diff --git a/scripts/contrib/devtool-stress.py b/scripts/contrib/devtool-stress.py
index 4b35fc9..8cf92ca 100755
--- a/scripts/contrib/devtool-stress.py
+++ b/scripts/contrib/devtool-stress.py
@@ -35,6 +35,7 @@ import fnmatch
 scripts_lib_path = os.path.abspath(os.path.join(os.path.dirname(os.path.realpath(__file__)), '..', 'lib'))
 sys.path.insert(0, scripts_lib_path)
 import scriptutils
+import argparse_oe
 logger = scriptutils.logger_create('devtool-stress')
 
 def select_recipes(args):
@@ -204,8 +205,8 @@ def stress_modify(args):
 
 
 def main():
-    parser = argparse.ArgumentParser(description="devtool stress tester",
-                                     epilog="Use %(prog)s <subcommand> --help to get help on a specific command")
+    parser = argparse_oe.ArgumentParser(description="devtool stress tester",
+                                        epilog="Use %(prog)s <subcommand> --help to get help on a specific command")
     parser.add_argument('-d', '--debug', help='Enable debug output', action='store_true')
     parser.add_argument('-r', '--resume-from', help='Resume from specified recipe', metavar='PN')
     parser.add_argument('-o', '--only', help='Only test specified recipes (comma-separated without spaces, wildcards allowed)', metavar='PNLIST')
diff --git a/scripts/devtool b/scripts/devtool
index 9d3287c..955495e 100755
--- a/scripts/devtool
+++ b/scripts/devtool
@@ -37,6 +37,7 @@ lib_path = scripts_path + '/lib'
 sys.path = sys.path + [lib_path]
 from devtool import DevtoolError, setup_tinfoil
 import scriptutils
+import argparse_oe
 logger = scriptutils.logger_create('devtool')
 
 plugins = []
@@ -185,9 +186,9 @@ def main():
             break
         pth = os.path.dirname(pth)
 
-    parser = argparse.ArgumentParser(description="OpenEmbedded development tool",
-                                     add_help=False,
-                                     epilog="Use %(prog)s <subcommand> --help to get help on a specific command")
+    parser = argparse_oe.ArgumentParser(description="OpenEmbedded development tool",
+                                        add_help=False,
+                                        epilog="Use %(prog)s <subcommand> --help to get help on a specific command")
     parser.add_argument('--basepath', help='Base directory of SDK / build directory')
     parser.add_argument('--bbpath', help='Explicitly specify the BBPATH, rather than getting it from the metadata')
     parser.add_argument('-d', '--debug', help='Enable debug output', action='store_true')
diff --git a/scripts/lib/argparse_oe.py b/scripts/lib/argparse_oe.py
new file mode 100644
index 0000000..c2fee6d
--- /dev/null
+++ b/scripts/lib/argparse_oe.py
@@ -0,0 +1,11 @@
+import sys
+import argparse
+
+class ArgumentParser(argparse.ArgumentParser):
+    """Our own version of argparse's ArgumentParser"""
+
+    def error(self, message):
+        sys.stderr.write('ERROR: %s\n' % message)
+        self.print_help()
+        sys.exit(2)
+
diff --git a/scripts/lib/scriptutils.py b/scripts/lib/scriptutils.py
index 3366882..4dd7ef2 100644
--- a/scripts/lib/scriptutils.py
+++ b/scripts/lib/scriptutils.py
@@ -19,6 +19,7 @@ import sys
 import os
 import logging
 import glob
+import argparse
 
 def logger_create(name):
     logger = logging.getLogger(name)
diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index afdceaa..8e22e02 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -33,6 +33,7 @@ scripts_path = os.path.dirname(os.path.realpath(__file__))
 lib_path = scripts_path + '/lib'
 sys.path = sys.path + [lib_path]
 import scriptutils
+import argparse_oe
 logger = scriptutils.logger_create('pkgdatautil')
 
 def tinfoil_init():
@@ -417,8 +418,8 @@ def find_path(args):
 
 
 def main():
-    parser = argparse.ArgumentParser(description="OpenEmbedded pkgdata tool - queries the pkgdata files written out during do_package",
-                                     epilog="Use %(prog)s <subcommand> --help to get help on a specific command")
+    parser = argparse_oe.ArgumentParser(description="OpenEmbedded pkgdata tool - queries the pkgdata files written out during do_package",
+                                        epilog="Use %(prog)s <subcommand> --help to get help on a specific command")
     parser.add_argument('-d', '--debug', help='Enable debug output', action='store_true')
     parser.add_argument('-p', '--pkgdata-dir', help='Path to pkgdata directory (determined automatically if not specified)')
     subparsers = parser.add_subparsers(title='subcommands', metavar='<subcommand>')
diff --git a/scripts/oe-publish-sdk b/scripts/oe-publish-sdk
index c4c35bd..c8c79c2 100755
--- a/scripts/oe-publish-sdk
+++ b/scripts/oe-publish-sdk
@@ -24,6 +24,7 @@ scripts_path = os.path.dirname(os.path.realpath(__file__))
 lib_path = scripts_path + '/lib'
 sys.path = sys.path + [lib_path]
 import scriptutils
+import argparse_oe
 logger = scriptutils.logger_create('sdktool')
 
 def mkdir(d):
@@ -113,8 +114,8 @@ def publish(args):
 
 
 def main():
-    parser = argparse.ArgumentParser(description="OpenEmbedded development tool",
-                                     epilog="Use %(prog)s <subcommand> --help to get help on a specific command")
+    parser = argparse_oe.ArgumentParser(description="OpenEmbedded development tool",
+                                        epilog="Use %(prog)s <subcommand> --help to get help on a specific command")
     parser.add_argument('-d', '--debug', help='Enable debug output', action='store_true')
     parser.add_argument('-q', '--quiet', help='Print only errors', action='store_true')
 
diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index bc50b2a..f989e87 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -36,6 +36,7 @@ sys.path.insert(0, os.path.dirname(os.path.realpath(__file__)) + '/lib')
 import scriptpath
 scriptpath.add_bitbake_lib_path()
 scriptpath.add_oe_lib_path()
+import argparse_oe
 
 import oeqa.selftest
 import oeqa.utils.ftools as ftools
@@ -65,7 +66,7 @@ log = logger_create()
 
 def get_args_parser():
     description = "Script that runs unit tests agains bitbake and other Yocto related tools. The goal is to validate tools functionality and metadata integrity. Refer to https://wiki.yoctoproject.org/wiki/Oe-selftest for more information."
-    parser = argparse.ArgumentParser(description=description)
+    parser = argparse_oe.ArgumentParser(description=description)
     group = parser.add_mutually_exclusive_group(required=True)
     group.add_argument('--run-tests', required=False, action='store', nargs='*', dest="run_tests", default=None, help='Select what tests to run (modules, classes or test methods). Format should be: <module>.<class>.<test_method>')
     group.add_argument('--run-all-tests', required=False, action="store_true", dest="run_all_tests", default=False, help='Run all (unhidden) tests')
diff --git a/scripts/recipetool b/scripts/recipetool
index 791a66a..1198cc2 100755
--- a/scripts/recipetool
+++ b/scripts/recipetool
@@ -27,6 +27,7 @@ scripts_path = os.path.dirname(os.path.realpath(__file__))
 lib_path = scripts_path + '/lib'
 sys.path = sys.path + [lib_path]
 import scriptutils
+import argparse_oe
 logger = scriptutils.logger_create('recipetool')
 
 plugins = []
@@ -45,9 +46,9 @@ def main():
         logger.error("This script can only be run after initialising the build environment (e.g. by using oe-init-build-env)")
         sys.exit(1)
 
-    parser = argparse.ArgumentParser(description="OpenEmbedded recipe tool",
-                                     add_help=False,
-                                     epilog="Use %(prog)s <subcommand> --help to get help on a specific command")
+    parser = argparse_oe.ArgumentParser(description="OpenEmbedded recipe tool",
+                                        add_help=False,
+                                        epilog="Use %(prog)s <subcommand> --help to get help on a specific command")
     parser.add_argument('-d', '--debug', help='Enable debug output', action='store_true')
     parser.add_argument('-q', '--quiet', help='Print only errors', action='store_true')
     parser.add_argument('--color', choices=['auto', 'always', 'never'], default='auto', help='Colorize output (where %(metavar)s is %(choices)s)', metavar='COLOR')
diff --git a/scripts/send-error-report b/scripts/send-error-report
index 1a1b965..a29feff 100755
--- a/scripts/send-error-report
+++ b/scripts/send-error-report
@@ -15,6 +15,10 @@ import subprocess
 import argparse
 import logging
 
+scripts_lib_path = os.path.join(os.path.dirname(os.path.realpath(__file__)), 'lib')
+sys.path.insert(0, scripts_lib_path)
+import argparse_oe
+
 version = "0.3"
 
 log = logging.getLogger("send-error-report")
@@ -143,7 +147,7 @@ def send_data(data, args):
 
 
 if __name__ == '__main__':
-    arg_parse = argparse.ArgumentParser(description="This scripts will send an error report to your specified error-report-web server.")
+    arg_parse = argparse_oe.ArgumentParser(description="This scripts will send an error report to your specified error-report-web server.")
 
     arg_parse.add_argument("error_file",
                            help="Generated error report file location",
diff --git a/scripts/test-remote-image b/scripts/test-remote-image
index f3a44eb..97d03d7 100755
--- a/scripts/test-remote-image
+++ b/scripts/test-remote-image
@@ -38,6 +38,7 @@ lib_path = scripts_path + '/lib'
 sys.path = sys.path + [lib_path]
 
 import scriptpath
+import argparse_oe
 
 # Add meta/lib to sys.path
 scriptpath.add_oe_lib_path()
@@ -82,7 +83,7 @@ log = logger_create()
 # Define and return the arguments parser for the script
 def get_args_parser():
     description = "This script is used to run automated runtime tests using remotely published image files. You should prepare the build environment just like building local images and running the tests."
-    parser = argparse.ArgumentParser(description=description)
+    parser = argparse_oe.ArgumentParser(description=description)
     parser.add_argument('--image-types', required=True, action="store", nargs='*', dest="image_types", default=None, help='The image types to test(ex: core-image-minimal).')
     parser.add_argument('--repo-link', required=True, action="store", type=str, dest="repo_link", default=None, help='The link to the remote images repository.')
     parser.add_argument('--required-packages', required=False, action="store", nargs='*', dest="required_packages", default=None, help='Required packages for the tests. They will be built before the testing begins.')
-- 
2.5.0


