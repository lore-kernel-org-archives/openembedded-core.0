Return-Path: <costin.c.constantin@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C724973CF5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jun 2015 14:22:43 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 15 Jun 2015 07:22:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,618,1427785200"; d="scan'208";a="746981483"
Received: from irsmsx108.ger.corp.intel.com ([163.33.3.3])
	by orsmga002.jf.intel.com with ESMTP; 15 Jun 2015 07:22:44 -0700
Received: from irsmsx101.ger.corp.intel.com ([169.254.1.217]) by
	IRSMSX108.ger.corp.intel.com ([169.254.11.59]) with mapi id
	14.03.0224.002; Mon, 15 Jun 2015 15:22:42 +0100
From: "Constantin, Costin C" <costin.c.constantin@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] scripts/oe-selftest: enhancement 7865
Thread-Index: AQHQphpYn+DYq3ow8E619ZP7mejghp2toQ4g
Date: Mon, 15 Jun 2015 14:22:42 +0000
Message-ID: <2B8B4B6BB45F5242AFEC714E022A4B4A28A7BB67@IRSMSX101.ger.corp.intel.com>
References: <1434229118-31859-1-git-send-email-costin.c.constantin@intel.com>
In-Reply-To: <1434229118-31859-1-git-send-email-costin.c.constantin@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Subject: Re: [PATCH] scripts/oe-selftest: enhancement 7865
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
X-List-Received-Date: Mon, 15 Jun 2015 14:22:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

Please don't consider this patch. It was intended for 7865, but a better pa=
tch was proposed for this

-----Original Message-----
From: Constantin, Costin C=20
Sent: Saturday, June 13, 2015 11:59 PM
To: openembedded-core@lists.openembedded.org
Cc: Constantin, Costin C
Subject: [PATCH] scripts/oe-selftest: enhancement 7865

Signed-off-by: Costin Constantin <costin.c.constantin@intel.com>
---
 scripts/oe-selftest | 36 ++++++++++++++++++++++++------------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/scripts/oe-selftest b/scripts/oe-selftest index a04e9fc..1a89c=
31 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -16,7 +16,10 @@
 # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
=20
 # DESCRIPTION
-# This script runs tests defined in meta/lib/selftest/
+# This script runs tests defined in meta/lib/selftest/ for all=20
+$BUILDDIR/../meta* layers # In order to work, each meta* layer needs to ha=
ve a relative lib/oeqa/selftest path to it.
+# Subdirectories to this relative path are accepted.
+# Test module names need to be unique between all layers.
 # It's purpose is to automate the testing of different bitbake tools.
 # To use it you just need to source your build environment setup script an=
d  # add the meta-selftest layer to your BBLAYERS.
@@ -24,15 +27,26 @@
 # Call the script as: "oe-selftest <module>.<Class>.<method>" to run just =
a single test  # E.g: "oe-selftest bboutput.BitbakeLayers" will run just th=
e BitbakeLayers class from meta/lib/selftest/bboutput.py
=20
-
 import os
 import sys
 import unittest
 import logging
 import argparse
+import glob as g
=20
 sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__),=
 '..', 'meta/lib')))
=20
+tests_path =3D g.glob(os.path.abspath(os.path.join(os.getenv("BUILDDIR"),=
=20
+"..", "meta*/lib/oeqa/selftest"))) # adding tests paths to the sys.path=20
+enabling dynamic import further on # support for subdirectories is also=20
+added test_subdirs =3D [] for pth in tests_path:
+    sys.path.insert(0, pth)
+    for sbd in g.glob(pth + "/*"):
+        if os.path.isdir(sbd):
+            sys.path.append(sbd)
+            test_subdirs.append(sbd)
+
 import oeqa.selftest
 import oeqa.utils.ftools as ftools
 from oeqa.utils.commands import runCmd, get_bb_var, get_test_layer @@ -125=
,14 +139,13 @@ def remove_inc_files():
 def get_tests(exclusive_modules=3D[], include_hidden=3DFalse):
     testslist =3D []
     for x in exclusive_modules:
-        testslist.append('oeqa.selftest.' + x)
+        testslist.append(x)
     if not testslist:
-        testpath =3D os.path.abspath(os.path.dirname(oeqa.selftest.__file_=
_))
-        files =3D sorted([f for f in os.listdir(testpath) if f.endswith('.=
py') and not (f.startswith('_') and not include_hidden) and not f.startswit=
h('__') and f !=3D 'base.py'])
-        for f in files:
-            module =3D 'oeqa.selftest.' + f[:-3]
-            testslist.append(module)
-
+        for pth in (tests_path + test_subdirs) :
+            files =3D sorted([f for f in os.listdir(pth) if f.endswith('.p=
y') and not (f.startswith('_') and not include_hidden) and not f.startswith=
('__') and f !=3D 'base.py'])
+            for f in files:
+                module =3D f[:-3]
+                testslist.append(module)
     return testslist
=20
 def main():
@@ -145,8 +158,7 @@ def main():
     if args.list_modules:
         log.info('Listing all available test modules:')
         testslist =3D get_tests(include_hidden=3DTrue)
-        for test in testslist:
-            module =3D test.split('.')[-1]
+        for module in testslist:
             info =3D ''
             if module.startswith('_'):
                 info =3D ' (hidden)'
@@ -154,7 +166,7 @@ def main():
             if args.list_allclasses:
                 try:
                     import importlib
-                    modlib =3D importlib.import_module(test)
+                    modlib =3D importlib.import_module(module)
                     for v in vars(modlib):
                         t =3D vars(modlib)[v]
                         if isinstance(t, type(oeSelfTest)) and issubclass(=
t, oeSelfTest) and t!=3DoeSelfTest:
--
2.1.4


