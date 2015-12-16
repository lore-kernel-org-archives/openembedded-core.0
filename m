Return-Path: <daniel.alexandrux.istrate@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 1C0D973185
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 16:25:23 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 16 Dec 2015 08:25:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,437,1444719600"; d="scan'208";a="862082715"
Received: from irsmsx152.ger.corp.intel.com ([163.33.192.66])
	by fmsmga001.fm.intel.com with ESMTP; 16 Dec 2015 08:25:23 -0800
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.251]) by
	IRSMSX152.ger.corp.intel.com ([169.254.6.143]) with mapi id
	14.03.0248.002; Wed, 16 Dec 2015 16:25:23 +0000
From: "Istrate, Daniel AlexandruX" <daniel.alexandrux.istrate@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCHv2 1/2] scripts/oe-selftest: Allow to run tests on
	random/all architecture
Thread-Index: AQHROB4KxvhThotoTUWK3j7toyI3sJ7NzBWw
Date: Wed, 16 Dec 2015 16:25:22 +0000
Message-ID: <174AD7CFE5F468498ACCFE3FEE0EF1EB142EB8D0@IRSMSX102.ger.corp.intel.com>
References: <1450283140-6599-1-git-send-email-daniel.alexandrux.istrate@intel.com>
In-Reply-To: <1450283140-6599-1-git-send-email-daniel.alexandrux.istrate@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiOTMzODBjZmEtYzJhMC00OGJlLTgzMmUtMmYxODM3NDY0ZmFkIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX1BVQkxJQyJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxNS40LjEwLjE5IiwiVHJ1c3RlZExhYmVsSGFzaCI6ImZOOTczSndubXNmMTRNRnE1OGFoQ2g2a3Znb2lha1VESWgyN0Jkc01pS2c9In0=
x-ctpclassification: CTP_PUBLIC
x-originating-ip: [163.33.239.181]
MIME-Version: 1.0
Subject: Re: [PATCHv2 1/2] scripts/oe-selftest: Allow to run tests on random/all architecture
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
X-List-Received-Date: Wed, 16 Dec 2015 16:25:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Updated commit message.

-----Original Message-----
From: Istrate, Daniel AlexandruX=20
Sent: Wednesday, December 16, 2015 18:26
To: openembedded-core@lists.openembedded.org
Cc: Istrate, Daniel AlexandruX <daniel.alexandrux.istrate@intel.com>
Subject: [PATCHv2 1/2] scripts/oe-selftest: Allow to run tests on random/al=
l architecture

Add an option for random arch into oe-selftest:
--arch [random/all]
1. random: will set a random MACHINE for each test 2. all: will run tests f=
or all architectures

Custom arch sets only weak default values (??=3D) for MACHINE in local.conf=
.
This let test cases that require a specific MACHINE to be able to override =
it, using (?=3D or =3D).

e.g.:
oe-selftest --run-tests signing --arch random --> will run all tests switch=
ing MACHINE randomly for each test

oe-selftest --run-tests signing --arch all --> for each arch will run all t=
ests

oe-selftest --run-all-tests --arch random

Also update oeqa/selftest/base.py to accomodate this feature.

Fix for [YOCTO #5880].

Signed-off-by: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
---
 meta/lib/oeqa/selftest/base.py | 39 +++++++++++++++++++++++++++++++++-----=
-
 scripts/oe-selftest            | 34 +++++++++++++++++++++++++++-------
 2 files changed, 60 insertions(+), 13 deletions(-)

diff --git a/meta/lib/oeqa/selftest/base.py b/meta/lib/oeqa/selftest/base.p=
y index 9bddc23..4ee0a8a 100644
--- a/meta/lib/oeqa/selftest/base.py
+++ b/meta/lib/oeqa/selftest/base.py
@@ -16,6 +16,7 @@ import errno
 import oeqa.utils.ftools as ftools
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_test_laye=
r  from oeqa.utils.decorators import LogResults
+from random import choice
=20
 @LogResults
 class oeSelfTest(unittest.TestCase):
@@ -29,9 +30,12 @@ class oeSelfTest(unittest.TestCase):
         self.testinc_path =3D os.path.join(self.builddir, "conf/selftest.i=
nc")
         self.local_bblayers_path =3D os.path.join(self.builddir, "conf/bbl=
ayers.conf")
         self.testinc_bblayers_path =3D os.path.join(self.builddir, "conf/b=
blayers.inc")
+        self.archinc_path =3D os.path.join(self.builddir,=20
+ "conf/arch.inc")
         self.testlayer_path =3D oeSelfTest.testlayer_path
         self._extra_tear_down_commands =3D []
-        self._track_for_cleanup =3D [self.testinc_path]
+        self._track_for_cleanup =3D [self.testinc_path, self.testinc_bblay=
ers_path, self.archinc_path]
+        self.arch_list =3D ['qemuarm', 'qemuarm64', 'qemumips', 'qemuppc',=
 'qemux86', 'qemux86-64',
+                         'beaglebone', 'genericx86', 'genericx86-64',=20
+ 'mpc8315e-rdb', 'edgerouter']
         super(oeSelfTest, self).__init__(methodName)
=20
     def setUp(self):
@@ -47,11 +51,25 @@ class oeSelfTest(unittest.TestCase):
             for f in files:
                 if f =3D=3D 'test_recipe.inc':
                     os.remove(os.path.join(root, f))
-        try:
-            os.remove(self.testinc_bblayers_path)
-        except OSError as e:
-            if e.errno !=3D errno.ENOENT:
-                raise
+
+        for incl_file in [self.testinc_bblayers_path, self.archinc_path]:
+            try:
+                os.remove(incl_file)
+            except OSError as e:
+                if e.errno !=3D errno.ENOENT:
+                    raise
+
+        # Get CUSTOMARCH from env (set by --arch argument to oe-selftest)
+        customarch =3D os.getenv('CUSTOMARCH')
+        if customarch:
+            if customarch =3D=3D 'random':
+                machine =3D self.get_random_arch()
+            else:
+                machine =3D customarch
+            arch_conf =3D 'MACHINE ??=3D "%s"\n' % machine
+            self.set_arch_config(arch_conf)
+            print 'Arch: %s' % machine
+
         # tests might need their own setup
         # but if they overwrite this one they have to call
         # super each time, so let's give them an alternative @@ -151,3 +16=
9,12 @@ class oeSelfTest(unittest.TestCase):
     def remove_bblayers_config(self, data):
         self.log.debug("Removing from: %s\n\%s\n" % (self.testinc_bblayers=
_path, data))
         ftools.remove_from_file(self.testinc_bblayers_path, data)
+
+    def get_random_arch(self):
+        # Return a random arch from the arch_list
+        return choice(self.arch_list)
+
+    # write to <builddir>/conf/arch.inc
+    def set_arch_config(self, data):
+        self.log.debug("Writing to: %s\n%s\n" % (self.archinc_path, data))
+        ftools.write_file(self.archinc_path, data)
diff --git a/scripts/oe-selftest b/scripts/oe-selftest index bc50b2a..8a3df=
19 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -78,6 +78,8 @@ def get_args_parser():
                        help=3D'list-tests-by <name|class|module|id|tag> <l=
ist of tests|classes|modules|ids|tags>')
     group.add_argument('--list-tags', required=3DFalse, dest=3D'list_tags'=
, default=3DFalse, action=3D"store_true",
                        help=3D'List all tags that have been set to test ca=
ses.')
+    parser.add_argument('--arch', required=3DFalse, dest=3D'arch', choices=
=3D['random', 'all'], default=3DNone,
+                        help=3D'Run tests on different architecture=20
+ (random/all).')
     return parser
=20
=20
@@ -109,7 +111,7 @@ def add_include():
         not in ftools.read_file(os.path.join(builddir, "conf/local.conf"))=
:
             log.info("Adding: \"include selftest.inc\" in local.conf")
             ftools.append_file(os.path.join(builddir, "conf/local.conf"), =
\
-                    "\n#include added by oe-selftest.py\ninclude selftest.=
inc")
+                    "\n#include added by oe-selftest.py\ninclude=20
+ selftest.inc\ninclude arch.inc")
=20
     if "#include added by oe-selftest.py" \
         not in ftools.read_file(os.path.join(builddir, "conf/bblayers.conf=
")):
@@ -125,7 +127,7 @@ def remove_include():
         in ftools.read_file(os.path.join(builddir, "conf/local.conf")):
             log.info("Removing the include from local.conf")
             ftools.remove_from_file(os.path.join(builddir, "conf/local.con=
f"), \
-                    "#include added by oe-selftest.py\ninclude selftest.in=
c")
+                    "#include added by oe-selftest.py\ninclude=20
+ selftest.inc\ninclude arch.inc")
=20
     if "#include added by oe-selftest.py" \
         in ftools.read_file(os.path.join(builddir, "conf/bblayers.conf")):
@@ -143,10 +145,11 @@ def remove_inc_files():
     except (AttributeError, OSError,) as e:    # AttributeError may happen=
 if BUILDDIR is not set
         pass
=20
-    try:
-        os.remove(os.path.join(os.environ.get("BUILDDIR"), "conf/bblayers.=
inc"))
-    except:
-        pass
+    for incl_file in ['conf/bblayers.inc', 'conf/arch.inc']:
+        try:
+            os.remove(os.path.join(os.environ.get("BUILDDIR"), incl_file))
+        except:
+            pass
=20
 def get_tests(exclusive_modules=3D[], include_hidden=3DFalse):
     testslist =3D []
@@ -466,7 +469,24 @@ def main():
                 log.error(e)
                 return 1
         add_include()
-        result =3D runner.run(suite)
+
+        if args.arch:
+            # Custom arch sets only weak default values (??=3D) for MACHIN=
E in local.conf
+            # This let test cases that require a specific MACHINE to be ab=
le to override it, using (?=3D or =3D)
+            log.info('Custom arch mode enabled. Arch set to %s' % args.arc=
h)
+            if args.arch =3D=3D 'random':
+                os.environ['CUSTOMARCH'] =3D 'random'
+                result =3D runner.run(suite)
+            else:  # all
+                arch_list =3D ['qemuarm', 'qemuarm64', 'qemumips', 'qemupp=
c', 'qemux86', 'qemux86-64',
+                             'beaglebone', 'genericx86', 'genericx86-64', =
'mpc8315e-rdb', 'edgerouter']
+                for arch in arch_list:
+                    log.info('Run tests with custom arch set to: %s' % arc=
h)
+                    os.environ['CUSTOMARCH'] =3D arch
+                    result =3D runner.run(suite)
+        else:
+            result =3D runner.run(suite)
+
         log.info("Finished")
=20
         if args.coverage:
--
2.1.0


