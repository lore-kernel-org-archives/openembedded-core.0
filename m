Return-Path: <benjamin.esquivel@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 7E141719CD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Nov 2016 23:12:07 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga105.jf.intel.com with ESMTP; 03 Nov 2016 16:12:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,440,1473145200"; d="scan'208";a="1080320486"
Received: from besquive-mobl2.amr.corp.intel.com ([10.219.5.39])
	by fmsmga002.fm.intel.com with ESMTP; 03 Nov 2016 16:12:08 -0700
Message-ID: <1478214729.21683.4.camel@linux.intel.com>
From: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
Reply-To: benjamin.esquivel@linux.intel.com
To: jose.perez.carranza@linux.intel.com, 
	openembedded-core@lists.openembedded.org
In-Reply-To: <1478213194-16951-1-git-send-email-jose.perez.carranza@linux.intel.com>
References: <1478213194-16951-1-git-send-email-jose.perez.carranza@linux.intel.com>
Organization: Intel Corporation
Date: Thu, 03 Nov 2016 17:12:09 -0600
Mime-Version: 1.0
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Cc: paul.eggleton@intel.com
Subject: Re: [PATCH] oe-tests: Migrate tests from /oe/test to /oeqa/selftest/oe-tests
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
X-List-Received-Date: Thu, 03 Nov 2016 23:12:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hello José, a couple of comments below.

On Thu, 2016-11-03 at 17:46 -0500, jose.perez.carranza@linux.intel.com
wrote:
> From: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>
> 
> Currently the unittests for scripts on meta/lib/oe are not being
> executed by any suite hence the best option is migrate them to
> meta/lib/oeqa/selftest to be executed along with the selftest suite.
> 
How much more time do these tests add to a selftest execution?
> [YOCTO #7376]
> 
> Signed-off-by: Jose Perez Carranza <jose.perez.carranza@linux.intel.c
> om>
> ---
>  meta/lib/oe/tests/__init__.py               |  0
>  meta/lib/oe/tests/test_elf.py               | 21 -------
>  meta/lib/oe/tests/test_license.py           | 68 -----------------
> -----
>  meta/lib/oe/tests/test_path.py              | 89 -----------------
> -----------
>  meta/lib/oe/tests/test_types.py             | 62 -----------------
> ---
>  meta/lib/oe/tests/test_utils.py             | 51 ----------------
>  meta/lib/oeqa/selftest/oe_tests/__init__.py |  0
>  meta/lib/oeqa/selftest/oe_tests/elf.py      | 22 +++++++
>  meta/lib/oeqa/selftest/oe_tests/license.py  | 69
> ++++++++++++++++++++++
>  meta/lib/oeqa/selftest/oe_tests/path.py     | 90
> +++++++++++++++++++++++++++++
>  meta/lib/oeqa/selftest/oe_tests/types.py    | 61 +++++++++++++++++++
>  meta/lib/oeqa/selftest/oe_tests/utils.py    | 52 +++++++++++++++++
>  12 files changed, 294 insertions(+), 291 deletions(-)
>  delete mode 100644 meta/lib/oe/tests/__init__.py
>  delete mode 100644 meta/lib/oe/tests/test_elf.py
>  delete mode 100644 meta/lib/oe/tests/test_license.py
>  delete mode 100644 meta/lib/oe/tests/test_path.py
>  delete mode 100644 meta/lib/oe/tests/test_types.py
>  delete mode 100644 meta/lib/oe/tests/test_utils.py
>  create mode 100644 meta/lib/oeqa/selftest/oe_tests/__init__.py
selftest has no other dir in it and this dir name of oe_test makes
little sense if you see it in the context of oeqa/selftest/oe_test. I
suggest using a dir name that brings some additional info as to what is
inside of it or try and see how to integrate these tests into the
selftest/ plain structure. 
>  create mode 100644 meta/lib/oeqa/selftest/oe_tests/elf.py
>  create mode 100644 meta/lib/oeqa/selftest/oe_tests/license.py
>  create mode 100644 meta/lib/oeqa/selftest/oe_tests/path.py
>  create mode 100644 meta/lib/oeqa/selftest/oe_tests/types.py
>  create mode 100644 meta/lib/oeqa/selftest/oe_tests/utils.py
> 
> diff --git a/meta/lib/oe/tests/__init__.py
> b/meta/lib/oe/tests/__init__.py
> deleted file mode 100644
> index e69de29..0000000
> diff --git a/meta/lib/oe/tests/test_elf.py
> b/meta/lib/oe/tests/test_elf.py
> deleted file mode 100644
> index 1f59037..0000000
> --- a/meta/lib/oe/tests/test_elf.py
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -import unittest
> -import oe.qa
> -
> -class TestElf(unittest.TestCase):
> -    def test_machine_name(self):
> -        """
> -        Test elf_machine_to_string()
> -        """
> -        self.assertEqual(oe.qa.elf_machine_to_string(0x02), "SPARC")
> -        self.assertEqual(oe.qa.elf_machine_to_string(0x03), "x86")
> -        self.assertEqual(oe.qa.elf_machine_to_string(0x08), "MIPS")
> -        self.assertEqual(oe.qa.elf_machine_to_string(0x14),
> "PowerPC")
> -        self.assertEqual(oe.qa.elf_machine_to_string(0x28), "ARM")
> -        self.assertEqual(oe.qa.elf_machine_to_string(0x2A),
> "SuperH")
> -        self.assertEqual(oe.qa.elf_machine_to_string(0x32), "IA-64")
> -        self.assertEqual(oe.qa.elf_machine_to_string(0x3E), "x86-
> 64")
> -        self.assertEqual(oe.qa.elf_machine_to_string(0xB7),
> "AArch64")
> -
> -        self.assertEqual(oe.qa.elf_machine_to_string(0x00), "Unknown
> (0)")
> -        self.assertEqual(oe.qa.elf_machine_to_string(0xDEADBEEF),
> "Unknown (3735928559)")
> -        self.assertEqual(oe.qa.elf_machine_to_string("foobar"),
> "Unknown ('foobar')")
> diff --git a/meta/lib/oe/tests/test_license.py
> b/meta/lib/oe/tests/test_license.py
> deleted file mode 100644
> index c388886..0000000
> --- a/meta/lib/oe/tests/test_license.py
> +++ /dev/null
> @@ -1,68 +0,0 @@
> -import unittest
> -import oe.license
> -
> -class SeenVisitor(oe.license.LicenseVisitor):
> -    def __init__(self):
> -        self.seen = []
> -        oe.license.LicenseVisitor.__init__(self)
> -
> -    def visit_Str(self, node):
> -        self.seen.append(node.s)
> -
> -class TestSingleLicense(unittest.TestCase):
> -    licenses = [
> -        "GPLv2",
> -        "LGPL-2.0",
> -        "Artistic",
> -        "MIT",
> -        "GPLv3+",
> -        "FOO_BAR",
> -    ]
> -    invalid_licenses = ["GPL/BSD"]
> -
> -    @staticmethod
> -    def parse(licensestr):
> -        visitor = SeenVisitor()
> -        visitor.visit_string(licensestr)
> -        return visitor.seen
> -
> -    def test_single_licenses(self):
> -        for license in self.licenses:
> -            licenses = self.parse(license)
> -            self.assertListEqual(licenses, [license])
> -
> -    def test_invalid_licenses(self):
> -        for license in self.invalid_licenses:
> -            with self.assertRaises(oe.license.InvalidLicense) as cm:
> -                self.parse(license)
> -            self.assertEqual(cm.exception.license, license)
> -
> -class TestSimpleCombinations(unittest.TestCase):
> -    tests = {
> -        "FOO&BAR": ["FOO", "BAR"],
> -        "BAZ & MOO": ["BAZ", "MOO"],
> -        "ALPHA|BETA": ["ALPHA"],
> -        "BAZ&MOO|FOO": ["FOO"],
> -        "FOO&BAR|BAZ": ["FOO", "BAR"],
> -    }
> -    preferred = ["ALPHA", "FOO", "BAR"]
> -
> -    def test_tests(self):
> -        def choose(a, b):
> -            if all(lic in self.preferred for lic in b):
> -                return b
> -            else:
> -                return a
> -
> -        for license, expected in self.tests.items():
> -            licenses = oe.license.flattened_licenses(license,
> choose)
> -            self.assertListEqual(licenses, expected)
> -
> -class TestComplexCombinations(TestSimpleCombinations):
> -    tests = {
> -        "FOO & (BAR | BAZ)&MOO": ["FOO", "BAR", "MOO"],
> -        "(ALPHA|(BETA&THETA)|OMEGA)&DELTA": ["OMEGA", "DELTA"],
> -        "((ALPHA|BETA)&FOO)|BAZ": ["BETA", "FOO"],
> -        "(GPL-2.0|Proprietary)&BSD-4-clause&MIT": ["GPL-2.0", "BSD-
> 4-clause", "MIT"],
> -    }
> -    preferred = ["BAR", "OMEGA", "BETA", "GPL-2.0"]
> diff --git a/meta/lib/oe/tests/test_path.py
> b/meta/lib/oe/tests/test_path.py
> deleted file mode 100644
> index 44d0681..0000000
> --- a/meta/lib/oe/tests/test_path.py
> +++ /dev/null
> @@ -1,89 +0,0 @@
> -import unittest
> -import oe, oe.path
> -import tempfile
> -import os
> -import errno
> -import shutil
> -
> -class TestRealPath(unittest.TestCase):
> -    DIRS = [ "a", "b", "etc", "sbin", "usr", "usr/bin", "usr/binX",
> "usr/sbin", "usr/include", "usr/include/gdbm" ]
> -    FILES = [ "etc/passwd", "b/file" ]
> -    LINKS = [
> -        ( "bin",             "/usr/bin",             "/usr/bin" ),
> -        ( "binX",            "usr/binX",             "/usr/binX" ),
> -        ( "c",               "broken",               "/broken" ),
> -        ( "etc/passwd-1",    "passwd",               "/etc/passwd"
> ),
> -        ( "etc/passwd-2",    "passwd-1",             "/etc/passwd"
> ),
> -        ( "etc/passwd-3",    "/etc/passwd-1",        "/etc/passwd"
> ),
> -        ( "etc/shadow-1",    "/etc/shadow",          "/etc/shadow"
> ),
> -        ( "etc/shadow-2",    "/etc/shadow-1",        "/etc/shadow"
> ),
> -        ( "prog-A",          "bin/prog-A",           "/usr/bin/prog-
> A" ),
> -        ( "prog-B",          "/bin/prog-B",          "/usr/bin/prog-
> B" ),
> -        ( "usr/bin/prog-C",  "../../sbin/prog-C",    "/sbin/prog-C"
> ),
> -        ( "usr/bin/prog-D",  "/sbin/prog-D",         "/sbin/prog-D"
> ),
> -        ( "usr/binX/prog-E", "../sbin/prog-E",       None ),
> -        ( "usr/bin/prog-F",  "../../../sbin/prog-F", "/sbin/prog-F"
> ),
> -        ( "loop",            "a/loop",               None ),
> -        ( "a/loop",          "../loop",              None ),
> -        ( "b/test",          "file/foo",             "/b/file/foo"
> ),
> -    ]
> -
> -    LINKS_PHYS = [
> -        ( "./",          "/",                "" ),
> -        ( "binX/prog-E", "/usr/sbin/prog-E", "/sbin/prog-E" ),
> -    ]
> -
> -    EXCEPTIONS = [
> -        ( "loop",   errno.ELOOP ),
> -        ( "b/test", errno.ENOENT ),
> -    ]
> -
> -    def __del__(self):
> -        try:
> -            #os.system("tree -F %s" % self.tmpdir)
> -            shutil.rmtree(self.tmpdir)
> -        except:
> -            pass
> -
> -    def setUp(self):
> -        self.tmpdir = tempfile.mkdtemp(prefix = "oe-test_path")
> -        self.root = os.path.join(self.tmpdir, "R")
> -
> -        os.mkdir(os.path.join(self.tmpdir, "_real"))
> -        os.symlink("_real", self.root)
> -
> -        for d in self.DIRS:
> -            os.mkdir(os.path.join(self.root, d))
> -        for f in self.FILES:
> -            open(os.path.join(self.root, f), "w")
> -        for l in self.LINKS:
> -            os.symlink(l[1], os.path.join(self.root, l[0]))
> -
> -    def __realpath(self, file, use_physdir, assume_dir = True):
> -        return oe.path.realpath(os.path.join(self.root, file),
> self.root,
> -                                use_physdir, assume_dir =
> assume_dir)
> -
> -    def test_norm(self):
> -        for l in self.LINKS:
> -            if l[2] == None:
> -                continue
> -
> -            target_p = self.__realpath(l[0], True)
> -            target_l = self.__realpath(l[0], False)
> -
> -            if l[2] != False:
> -                self.assertEqual(target_p, target_l)
> -                self.assertEqual(l[2], target_p[len(self.root):])
> -
> -    def test_phys(self):
> -        for l in self.LINKS_PHYS:
> -            target_p = self.__realpath(l[0], True)
> -            target_l = self.__realpath(l[0], False)
> -
> -            self.assertEqual(l[1], target_p[len(self.root):])
> -            self.assertEqual(l[2], target_l[len(self.root):])
> -
> -    def test_loop(self):
> -        for e in self.EXCEPTIONS:
> -            self.assertRaisesRegex(OSError, r'\[Errno %u\]' % e[1],
> -                                    self.__realpath, e[0], False,
> False)
> diff --git a/meta/lib/oe/tests/test_types.py
> b/meta/lib/oe/tests/test_types.py
> deleted file mode 100644
> index 367cc30..0000000
> --- a/meta/lib/oe/tests/test_types.py
> +++ /dev/null
> @@ -1,62 +0,0 @@
> -import unittest
> -from oe.maketype import create, factory
> -
> -class TestTypes(unittest.TestCase):
> -    def assertIsInstance(self, obj, cls):
> -        return self.assertTrue(isinstance(obj, cls))
> -
> -    def assertIsNot(self, obj, other):
> -        return self.assertFalse(obj is other)
> -
> -    def assertFactoryCreated(self, value, type, **flags):
> -        cls = factory(type)
> -        self.assertIsNot(cls, None)
> -        self.assertIsInstance(create(value, type, **flags), cls)
> -
> -class TestBooleanType(TestTypes):
> -    def test_invalid(self):
> -        self.assertRaises(ValueError, create, '', 'boolean')
> -        self.assertRaises(ValueError, create, 'foo', 'boolean')
> -        self.assertRaises(TypeError, create, object(), 'boolean')
> -
> -    def test_true(self):
> -        self.assertTrue(create('y', 'boolean'))
> -        self.assertTrue(create('yes', 'boolean'))
> -        self.assertTrue(create('1', 'boolean'))
> -        self.assertTrue(create('t', 'boolean'))
> -        self.assertTrue(create('true', 'boolean'))
> -        self.assertTrue(create('TRUE', 'boolean'))
> -        self.assertTrue(create('truE', 'boolean'))
> -
> -    def test_false(self):
> -        self.assertFalse(create('n', 'boolean'))
> -        self.assertFalse(create('no', 'boolean'))
> -        self.assertFalse(create('0', 'boolean'))
> -        self.assertFalse(create('f', 'boolean'))
> -        self.assertFalse(create('false', 'boolean'))
> -        self.assertFalse(create('FALSE', 'boolean'))
> -        self.assertFalse(create('faLse', 'boolean'))
> -
> -    def test_bool_equality(self):
> -        self.assertEqual(create('n', 'boolean'), False)
> -        self.assertNotEqual(create('n', 'boolean'), True)
> -        self.assertEqual(create('y', 'boolean'), True)
> -        self.assertNotEqual(create('y', 'boolean'), False)
> -
> -class TestList(TestTypes):
> -    def assertListEqual(self, value, valid, sep=None):
> -        obj = create(value, 'list', separator=sep)
> -        self.assertEqual(obj, valid)
> -        if sep is not None:
> -            self.assertEqual(obj.separator, sep)
> -        self.assertEqual(str(obj), obj.separator.join(obj))
> -
> -    def test_list_nosep(self):
> -        testlist = ['alpha', 'beta', 'theta']
> -        self.assertListEqual('alpha beta theta', testlist)
> -        self.assertListEqual('alpha  beta\ttheta', testlist)
> -        self.assertListEqual('alpha', ['alpha'])
> -
> -    def test_list_usersep(self):
> -        self.assertListEqual('foo:bar', ['foo', 'bar'], ':')
> -        self.assertListEqual('foo:bar:baz', ['foo', 'bar', 'baz'],
> ':')
> diff --git a/meta/lib/oe/tests/test_utils.py
> b/meta/lib/oe/tests/test_utils.py
> deleted file mode 100644
> index 5d9ac52..0000000
> --- a/meta/lib/oe/tests/test_utils.py
> +++ /dev/null
> @@ -1,51 +0,0 @@
> -import unittest
> -from oe.utils import packages_filter_out_system
> -
> -class TestPackagesFilterOutSystem(unittest.TestCase):
> -    def test_filter(self):
> -        """
> -        Test that oe.utils.packages_filter_out_system works.
> -        """
> -        try:
> -            import bb
> -        except ImportError:
> -            self.skipTest("Cannot import bb")
> -
> -        d = bb.data_smart.DataSmart()
> -        d.setVar("PN", "foo")
> -
> -        d.setVar("PACKAGES", "foo foo-doc foo-dev")
> -        pkgs = packages_filter_out_system(d)
> -        self.assertEqual(pkgs, [])
> -
> -        d.setVar("PACKAGES", "foo foo-doc foo-data foo-dev")
> -        pkgs = packages_filter_out_system(d)
> -        self.assertEqual(pkgs, ["foo-data"])
> -
> -        d.setVar("PACKAGES", "foo foo-locale-en-gb")
> -        pkgs = packages_filter_out_system(d)
> -        self.assertEqual(pkgs, [])
> -
> -        d.setVar("PACKAGES", "foo foo-data foo-locale-en-gb")
> -        pkgs = packages_filter_out_system(d)
> -        self.assertEqual(pkgs, ["foo-data"])
> -
> -
> -class TestTrimVersion(unittest.TestCase):
> -    def test_version_exception(self):
> -        with self.assertRaises(TypeError):
> -            trim_version(None, 2)
> -        with self.assertRaises(TypeError):
> -            trim_version((1, 2, 3), 2)
> -
> -    def test_num_exception(self):
> -        with self.assertRaises(ValueError):
> -            trim_version("1.2.3", 0)
> -        with self.assertRaises(ValueError):
> -            trim_version("1.2.3", -1)
> -
> -    def test_valid(self):
> -        self.assertEqual(trim_version("1.2.3", 1), "1")
> -        self.assertEqual(trim_version("1.2.3", 2), "1.2")
> -        self.assertEqual(trim_version("1.2.3", 3), "1.2.3")
> -        self.assertEqual(trim_version("1.2.3", 4), "1.2.3")
> diff --git a/meta/lib/oeqa/selftest/oe_tests/__init__.py
> b/meta/lib/oeqa/selftest/oe_tests/__init__.py
> new file mode 100644
> index 0000000..e69de29
> diff --git a/meta/lib/oeqa/selftest/oe_tests/elf.py
> b/meta/lib/oeqa/selftest/oe_tests/elf.py
> new file mode 100644
> index 0000000..582d772
> --- /dev/null
> +++ b/meta/lib/oeqa/selftest/oe_tests/elf.py
> @@ -0,0 +1,22 @@
> +from oeqa.selftest.base import oeSelfTest
> +from oeqa.utils.decorators import testcase
> +import oe.qa
> +
> +class TestElf(oeSelfTest):
> +    def test_machine_name(self):
> +        """
> +        Test elf_machine_to_string()
> +        """
> +        self.assertEqual(oe.qa.elf_machine_to_string(0x02), "SPARC")
> +        self.assertEqual(oe.qa.elf_machine_to_string(0x03), "x86")
> +        self.assertEqual(oe.qa.elf_machine_to_string(0x08), "MIPS")
> +        self.assertEqual(oe.qa.elf_machine_to_string(0x14),
> "PowerPC")
> +        self.assertEqual(oe.qa.elf_machine_to_string(0x28), "ARM")
> +        self.assertEqual(oe.qa.elf_machine_to_string(0x2A),
> "SuperH")
> +        self.assertEqual(oe.qa.elf_machine_to_string(0x32), "IA-64")
> +        self.assertEqual(oe.qa.elf_machine_to_string(0x3E), "x86-
> 64")
> +        self.assertEqual(oe.qa.elf_machine_to_string(0xB7),
> "AArch64")
> +
> +        self.assertEqual(oe.qa.elf_machine_to_string(0x00), "Unknown
> (0)")
> +        self.assertEqual(oe.qa.elf_machine_to_string(0xDEADBEEF),
> "Unknown (3735928559)")
> +        self.assertEqual(oe.qa.elf_machine_to_string("foobar"),
> "Unknown ('foobar')")
> diff --git a/meta/lib/oeqa/selftest/oe_tests/license.py
> b/meta/lib/oeqa/selftest/oe_tests/license.py
> new file mode 100644
> index 0000000..90bdf51
> --- /dev/null
> +++ b/meta/lib/oeqa/selftest/oe_tests/license.py
> @@ -0,0 +1,69 @@
> +import oe.license
> +from oeqa.selftest.base import oeSelfTest
> +from oeqa.utils.decorators import testcase
> +
> +class SeenVisitor(oe.license.LicenseVisitor):
> +    def __init__(self):
> +        self.seen = []
> +        oe.license.LicenseVisitor.__init__(self)
> +
> +    def visit_Str(self, node):
> +        self.seen.append(node.s)
> +
> +class TestSingleLicense(oeSelfTest):
> +    licenses = [
> +        "GPLv2",
> +        "LGPL-2.0",
> +        "Artistic",
> +        "MIT",
> +        "GPLv3+",
> +        "FOO_BAR",
> +    ]
> +    invalid_licenses = ["GPL/BSD"]
> +
> +    @staticmethod
> +    def parse(licensestr):
> +        visitor = SeenVisitor()
> +        visitor.visit_string(licensestr)
> +        return visitor.seen
> +
> +    def test_single_licenses(self):
> +        for license in self.licenses:
> +            licenses = self.parse(license)
> +            self.assertListEqual(licenses, [license])
> +
> +    def test_invalid_licenses(self):
> +        for license in self.invalid_licenses:
> +            with self.assertRaises(oe.license.InvalidLicense) as cm:
> +                self.parse(license)
> +            self.assertEqual(cm.exception.license, license)
> +
> +class TestSimpleCombinations(oeSelfTest):
> +    tests = {
> +        "FOO&BAR": ["FOO", "BAR"],
> +        "BAZ & MOO": ["BAZ", "MOO"],
> +        "ALPHA|BETA": ["ALPHA"],
> +        "BAZ&MOO|FOO": ["FOO"],
> +        "FOO&BAR|BAZ": ["FOO", "BAR"],
> +    }
> +    preferred = ["ALPHA", "FOO", "BAR"]
> +
> +    def test_tests(self):
> +        def choose(a, b):
> +            if all(lic in self.preferred for lic in b):
> +                return b
> +            else:
> +                return a
> +
> +        for license, expected in self.tests.items():
> +            licenses = oe.license.flattened_licenses(license,
> choose)
> +            self.assertListEqual(licenses, expected)
> +
> +class TestComplexCombinations(TestSimpleCombinations):
> +    tests = {
> +        "FOO & (BAR | BAZ)&MOO": ["FOO", "BAR", "MOO"],
> +        "(ALPHA|(BETA&THETA)|OMEGA)&DELTA": ["OMEGA", "DELTA"],
> +        "((ALPHA|BETA)&FOO)|BAZ": ["BETA", "FOO"],
> +        "(GPL-2.0|Proprietary)&BSD-4-clause&MIT": ["GPL-2.0", "BSD-
> 4-clause", "MIT"],
> +    }
> +    preferred = ["BAR", "OMEGA", "BETA", "GPL-2.0"]
> diff --git a/meta/lib/oeqa/selftest/oe_tests/path.py
> b/meta/lib/oeqa/selftest/oe_tests/path.py
> new file mode 100644
> index 0000000..09b56cb
> --- /dev/null
> +++ b/meta/lib/oeqa/selftest/oe_tests/path.py
> @@ -0,0 +1,90 @@
> +from oeqa.selftest.base import oeSelfTest
> +from oeqa.utils.decorators import testcase
> +import oe, oe.path
> +import tempfile
> +import os
> +import errno
> +import shutil
> +
> +class TestRealPath(oeSelfTest):
> +    DIRS = [ "a", "b", "etc", "sbin", "usr", "usr/bin", "usr/binX",
> "usr/sbin", "usr/include", "usr/include/gdbm" ]
> +    FILES = [ "etc/passwd", "b/file" ]
> +    LINKS = [
> +        ( "bin",             "/usr/bin",             "/usr/bin" ),
> +        ( "binX",            "usr/binX",             "/usr/binX" ),
> +        ( "c",               "broken",               "/broken" ),
> +        ( "etc/passwd-1",    "passwd",               "/etc/passwd"
> ),
> +        ( "etc/passwd-2",    "passwd-1",             "/etc/passwd"
> ),
> +        ( "etc/passwd-3",    "/etc/passwd-1",        "/etc/passwd"
> ),
> +        ( "etc/shadow-1",    "/etc/shadow",          "/etc/shadow"
> ),
> +        ( "etc/shadow-2",    "/etc/shadow-1",        "/etc/shadow"
> ),
> +        ( "prog-A",          "bin/prog-A",           "/usr/bin/prog-
> A" ),
> +        ( "prog-B",          "/bin/prog-B",          "/usr/bin/prog-
> B" ),
> +        ( "usr/bin/prog-C",  "../../sbin/prog-C",    "/sbin/prog-C"
> ),
> +        ( "usr/bin/prog-D",  "/sbin/prog-D",         "/sbin/prog-D"
> ),
> +        ( "usr/binX/prog-E", "../sbin/prog-E",       None ),
> +        ( "usr/bin/prog-F",  "../../../sbin/prog-F", "/sbin/prog-F"
> ),
> +        ( "loop",            "a/loop",               None ),
> +        ( "a/loop",          "../loop",              None ),
> +        ( "b/test",          "file/foo",             "/b/file/foo"
> ),
> +    ]
> +
> +    LINKS_PHYS = [
> +        ( "./",          "/",                "" ),
> +        ( "binX/prog-E", "/usr/sbin/prog-E", "/sbin/prog-E" ),
> +    ]
> +
> +    EXCEPTIONS = [
> +        ( "loop",   errno.ELOOP ),
> +        ( "b/test", errno.ENOENT ),
> +    ]
> +
> +    def __del__(self):
> +        try:
> +            #os.system("tree -F %s" % self.tmpdir)
> +            shutil.rmtree(self.tmpdir)
> +        except:
> +            pass
> +
> +    def setUp(self):
> +        self.tmpdir = tempfile.mkdtemp(prefix = "oe-test_path")
> +        self.root = os.path.join(self.tmpdir, "R")
> +
> +        os.mkdir(os.path.join(self.tmpdir, "_real"))
> +        os.symlink("_real", self.root)
> +
> +        for d in self.DIRS:
> +            os.mkdir(os.path.join(self.root, d))
> +        for f in self.FILES:
> +            open(os.path.join(self.root, f), "w")
> +        for l in self.LINKS:
> +            os.symlink(l[1], os.path.join(self.root, l[0]))
> +
> +    def __realpath(self, file, use_physdir, assume_dir = True):
> +        return oe.path.realpath(os.path.join(self.root, file),
> self.root,
> +                                use_physdir, assume_dir =
> assume_dir)
> +
> +    def test_norm(self):
> +        for l in self.LINKS:
> +            if l[2] == None:
> +                continue
> +
> +            target_p = self.__realpath(l[0], True)
> +            target_l = self.__realpath(l[0], False)
> +
> +            if l[2] != False:
> +                self.assertEqual(target_p, target_l)
> +                self.assertEqual(l[2], target_p[len(self.root):])
> +
> +    def test_phys(self):
> +        for l in self.LINKS_PHYS:
> +            target_p = self.__realpath(l[0], True)
> +            target_l = self.__realpath(l[0], False)
> +
> +            self.assertEqual(l[1], target_p[len(self.root):])
> +            self.assertEqual(l[2], target_l[len(self.root):])
> +
> +    def test_loop(self):
> +        for e in self.EXCEPTIONS:
> +            self.assertRaisesRegex(OSError, r'\[Errno %u\]' % e[1],
> +                                    self.__realpath, e[0], False,
> False)
> diff --git a/meta/lib/oeqa/selftest/oe_tests/types.py
> b/meta/lib/oeqa/selftest/oe_tests/types.py
> new file mode 100644
> index 0000000..2613da9
> --- /dev/null
> +++ b/meta/lib/oeqa/selftest/oe_tests/types.py
> @@ -0,0 +1,61 @@
> +from oeqa.selftest.base import oeSelfTest
> +from oeqa.utils.decorators import testcase
> +from oe.maketype import create, factory
> +
> +class TestTypes(oeSelfTest):
> +    def assertIsInstance(self, obj, cls):
> +        return self.assertTrue(isinstance(obj, cls))
> +
> +    def assertIsNot(self, obj, other):
> +        return self.assertFalse(obj is other)
> +
> +    def assertFactoryCreated(self, value, type, **flags):
> +        cls = factory(type)
> +        self.assertIsNot(cls, None)
> +        self.assertIsInstance(create(value, type, **flags), cls)
> +
> +    def assertListIsEqual(self, value, valid, sep=None):
> +        obj = create(value, 'list', separator=sep)
> +        self.assertListEqual(obj, valid)
> +
> +class TestBooleanType(TestTypes):
> +    def test_invalid(self):
> +        self.assertRaises(ValueError, create, '', 'boolean')
> +        self.assertRaises(ValueError, create, 'foo', 'boolean')
> +        self.assertRaises(TypeError, create, object(), 'boolean')
> +
> +    def test_true(self):
> +        self.assertTrue(create('y', 'boolean'))
> +        self.assertTrue(create('yes', 'boolean'))
> +        self.assertTrue(create('1', 'boolean'))
> +        self.assertTrue(create('t', 'boolean'))
> +        self.assertTrue(create('true', 'boolean'))
> +        self.assertTrue(create('TRUE', 'boolean'))
> +        self.assertTrue(create('truE', 'boolean'))
> +
> +    def test_false(self):
> +        self.assertFalse(create('n', 'boolean'))
> +        self.assertFalse(create('no', 'boolean'))
> +        self.assertFalse(create('0', 'boolean'))
> +        self.assertFalse(create('f', 'boolean'))
> +        self.assertFalse(create('false', 'boolean'))
> +        self.assertFalse(create('FALSE', 'boolean'))
> +        self.assertFalse(create('faLse', 'boolean'))
> +
> +    def test_bool_equality(self):
> +        self.assertEqual(create('n', 'boolean'), False)
> +        self.assertNotEqual(create('n', 'boolean'), True)
> +        self.assertEqual(create('y', 'boolean'), True)
> +        self.assertNotEqual(create('y', 'boolean'), False)
> +
> +class TestList(TestTypes):
> +
> +    def test_list_nosep(self):
> +        testlist = ['alpha', 'beta', 'theta']
> +        self.assertListIsEqual('alpha beta theta', testlist)
> +        self.assertListIsEqual('alpha  beta\ttheta', testlist)
> +        self.assertListIsEqual('alpha', ['alpha'])
> +
> +    def test_list_usersep(self):
> +        self.assertListIsEqual('foo:bar', ['foo', 'bar'], ':')
> +        self.assertListIsEqual('foo:bar:baz', ['foo', 'bar', 'baz'],
> ':')
> diff --git a/meta/lib/oeqa/selftest/oe_tests/utils.py
> b/meta/lib/oeqa/selftest/oe_tests/utils.py
> new file mode 100644
> index 0000000..25c60e1
> --- /dev/null
> +++ b/meta/lib/oeqa/selftest/oe_tests/utils.py
> @@ -0,0 +1,52 @@
> +from oeqa.selftest.base import oeSelfTest
> +from oeqa.utils.decorators import testcase
> +from oe.utils import packages_filter_out_system, trim_version
> +
> +class TestPackagesFilterOutSystem(oeSelfTest):
> +    def test_filter(self):
> +        """
> +        Test that oe.utils.packages_filter_out_system works.
> +        """
> +        try:
> +            import bb
> +        except ImportError:
> +            self.skipTest("Cannot import bb")
> +
> +        d = bb.data_smart.DataSmart()
> +        d.setVar("PN", "foo")
> +
> +        d.setVar("PACKAGES", "foo foo-doc foo-dev")
> +        pkgs = packages_filter_out_system(d)
> +        self.assertEqual(pkgs, [])
> +
> +        d.setVar("PACKAGES", "foo foo-doc foo-data foo-dev")
> +        pkgs = packages_filter_out_system(d)
> +        self.assertEqual(pkgs, ["foo-data"])
> +
> +        d.setVar("PACKAGES", "foo foo-locale-en-gb")
> +        pkgs = packages_filter_out_system(d)
> +        self.assertEqual(pkgs, [])
> +
> +        d.setVar("PACKAGES", "foo foo-data foo-locale-en-gb")
> +        pkgs = packages_filter_out_system(d)
> +        self.assertEqual(pkgs, ["foo-data"])
> +
> +
> +class TestTrimVersion(oeSelfTest):
> +    def test_version_exception(self):
> +        with self.assertRaises(TypeError):
> +            trim_version(None, 2)
> +        with self.assertRaises(TypeError):
> +            trim_version((1, 2, 3), 2)
> +
> +    def test_num_exception(self):
> +        with self.assertRaises(ValueError):
> +            trim_version("1.2.3", 0)
> +        with self.assertRaises(ValueError):
> +            trim_version("1.2.3", -1)
> +
> +    def test_valid(self):
> +        self.assertEqual(trim_version("1.2.3", 1), "1")
> +        self.assertEqual(trim_version("1.2.3", 2), "1.2")
> +        self.assertEqual(trim_version("1.2.3", 3), "1.2.3")
> +        self.assertEqual(trim_version("1.2.3", 4), "1.2.3")
> -- 
> 2.1.4
> 

