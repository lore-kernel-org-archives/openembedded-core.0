Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8CB037F2B5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2019 16:58:00 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id s12so4150125pfe.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Sep 2019 09:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=a2uTkaOC3MwnKgM+Gij4LUPFDG1bYSSah/e+K9Spm+g=;
	b=bS/cC7AYEHOvyRU3KlJj5/nLvfVi68ZYGNXXBR+SUB8Pethfeg9nF+uFQgbM6IxCGG
	TZupR6qsN0uQJ6iw5FicdDVAgDh031WgVPK/LIjBYIOIct5hBfliSZq1nEbFV7RBWeHS
	phDL+g6nLk87sc8Hhz7aXprEsspuL/WOHI+NWV09XBtaal6z1I5KrT4LWgCrHaPiX03H
	IJ1iFQXn0njyTEKnev0B9ZwGYdil7GMI3GcqkL6YlaWCqqZRyCb1RsDTmzLgx6+Drmis
	TJ5GlvnlygwBSncbW94VoLlDtEHYfV/PCGKgFYbvUHl0/zxAh6IMjz+CRpUJT50m5grU
	j/bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:content-transfer-encoding:mime-version;
	bh=a2uTkaOC3MwnKgM+Gij4LUPFDG1bYSSah/e+K9Spm+g=;
	b=YgKyiazCYQpdjphjPwTiGah//7v2WFfRD3OSnO0htqW8H8fhuVbCBAY55JEszyPS/w
	7ec+rU/cp76CtNiYSgGzaolPCgHH1Xo79Q09QRHeJK9mywm88ZBHNJH170HEn6UEqlyv
	HEaHq9u/GO4kxR1sKPSIJZW6wwSKYzaui+C7XD+kf9kXYCvwSSlY5OX/11P406nloiau
	N+eorPxkI2+f5pENy0S2rzLjEHvNBefPggOU6FZIfHD09ZSEy0/oGIrE49IPb8ZgB8Dz
	bdddB89uflBK64c/og9a06+nrgTg2gHDSk82Hq583yz3kQHMDIHGkjOIPZKxrj4Ax1y2
	e/+g==
X-Gm-Message-State: APjAAAWOE93o+f8Yiy6P2lCE0QnFCRvMkyMSojn4UNXTdGvo8oalV02y
	LWWcGP64WDr5RTeH2Qf42jDAaPRaVKgsaA==
X-Google-Smtp-Source: APXvYqyYom5ZobXdBU2xBpZsfxwYXv9a3TlYmvwwGRbvB2meuWllT8KuDfIAJ5giFvxpqLy9lIQalQ==
X-Received: by 2002:a17:90a:d792:: with SMTP id
	z18mr302184pju.36.1567529881191; 
	Tue, 03 Sep 2019 09:58:01 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.76.229])
	by smtp.gmail.com with UTF8SMTPSA id
	136sm21113430pfz.123.2019.09.03.09.57.58
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 03 Sep 2019 09:58:00 -0700 (PDT)
Date: Tue, 03 Sep 2019 16:56:41 +0000
Message-Id: <20190903165641.16597-8-nathan@nathanrossi.com>
In-Reply-To: <20190903165641.16597-0-nathan@nathanrossi.com>
References: <20190903165641.16597-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH v2 08/12] oeqa/core: Rework OETestTag and remove unused OETestFilter
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
X-List-Received-Date: Tue, 03 Sep 2019 16:58:00 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Rework OETestTag so that it does not rely on the existing decorator code
base and instead inserts the tags into an attribute on the decorated
target (e.g. class/type or method). This allows the use of OETestTag on
classes and method.

In order to filter tagged tests rework the loaders filtering code,
removing the generic-ness (with validation and attributes/etc.) and
replace it with a "tags_filter" parameter which is a function that
filters a test based on the tags it has. This allows the loader user to
filter on tags in more specific ways (e.g. include all untagged tests
and any tests tagged with foo). Plumb all this through the context code
and testing code.

Update the associated tests to pass correctly with the changes.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
Changes in v2:
- New
---
 meta/lib/oeqa/core/context.py               |  4 +-
 meta/lib/oeqa/core/decorator/__init__.py    | 20 +++++---
 meta/lib/oeqa/core/decorator/oetag.py       | 27 ----------
 meta/lib/oeqa/core/loader.py                | 61 +++++++----------------
 meta/lib/oeqa/core/tests/cases/data.py      |  2 +-
 meta/lib/oeqa/core/tests/cases/oetag.py     | 21 +++++++-
 meta/lib/oeqa/core/tests/common.py          |  4 +-
 meta/lib/oeqa/core/tests/test_decorators.py | 77 +++++++++++++++++++----------
 meta/lib/oeqa/core/tests/test_loader.py     | 25 ----------
 9 files changed, 103 insertions(+), 138 deletions(-)
 delete mode 100644 meta/lib/oeqa/core/decorator/oetag.py

diff --git a/meta/lib/oeqa/core/context.py b/meta/lib/oeqa/core/context.py
index 68819cc338..14fc6a54f4 100644
--- a/meta/lib/oeqa/core/context.py
+++ b/meta/lib/oeqa/core/context.py
@@ -64,12 +64,12 @@ class OETestContext(object):
                     setattr(tclass, 'setUpHooker', skipfuncgen('Skip by the command line argument "%s"' % skip))
 
     def loadTests(self, module_paths, modules=[], tests=[],
-            modules_manifest="", modules_required=[], filters={}):
+            modules_manifest="", modules_required=[], **kwargs):
         if modules_manifest:
             modules = self._read_modules_from_manifest(modules_manifest)
 
         self.loader = self.loaderClass(self, module_paths, modules, tests,
-                modules_required, filters)
+                modules_required, **kwargs)
         self.suites = self.loader.discover()
 
     def runTests(self, processes=None, skips=[]):
diff --git a/meta/lib/oeqa/core/decorator/__init__.py b/meta/lib/oeqa/core/decorator/__init__.py
index 923b218266..1a5ac40134 100644
--- a/meta/lib/oeqa/core/decorator/__init__.py
+++ b/meta/lib/oeqa/core/decorator/__init__.py
@@ -6,6 +6,7 @@
 
 from functools import wraps
 from abc import abstractmethod, ABCMeta
+from oeqa.core.utils.misc import strToList
 
 decoratorClasses = set()
 
@@ -63,12 +64,15 @@ class OETestDiscover(OETestDecorator):
     def discover(registry):
         return registry['cases']
 
-class OETestFilter(OETestDecorator):
+def OETestTag(*tags):
+    expandedtags = []
+    for tag in tags:
+        expandedtags += strToList(tag)
+    def decorator(item):
+        if hasattr(item, "__oeqa_testtags"):
+            item.__oeqa_testtags += expandedtags
+        else:
+            item.__oeqa_testtags = expandedtags
+        return item
+    return decorator
 
-    # OETestLoader call it while loading the tests
-    # in loadTestsFromTestCase method, it needs to
-    # return a bool, True if needs to be filtered.
-    # This method must consume the filter used.
-    @abstractmethod
-    def filtrate(self, filters):
-        return False
diff --git a/meta/lib/oeqa/core/decorator/oetag.py b/meta/lib/oeqa/core/decorator/oetag.py
deleted file mode 100644
index 8c31138dac..0000000000
--- a/meta/lib/oeqa/core/decorator/oetag.py
+++ /dev/null
@@ -1,27 +0,0 @@
-#
-# Copyright (C) 2016 Intel Corporation
-#
-# SPDX-License-Identifier: MIT
-#
-
-from . import OETestFilter, registerDecorator
-from oeqa.core.utils.misc import strToList
-
-def _tagFilter(tags, filters):
-    return False if set(tags) & set(filters) else True
-
-@registerDecorator
-class OETestTag(OETestFilter):
-    attrs = ('oetag',)
-
-    def bind(self, registry, case):
-        super(OETestTag, self).bind(registry, case)
-        self.oetag = strToList(self.oetag, 'oetag')
-
-    def filtrate(self, filters):
-        if filters.get('oetag'):
-            filterx = strToList(filters['oetag'], 'oetag')
-            del filters['oetag']
-            if _tagFilter(self.oetag, filterx):
-                return True
-        return False
diff --git a/meta/lib/oeqa/core/loader.py b/meta/lib/oeqa/core/loader.py
index 7fea0585c7..0d7970d49e 100644
--- a/meta/lib/oeqa/core/loader.py
+++ b/meta/lib/oeqa/core/loader.py
@@ -16,7 +16,7 @@ from oeqa.core.utils.test import getSuiteModules, getCaseID
 from oeqa.core.exception import OEQATestNotFound
 from oeqa.core.case import OETestCase
 from oeqa.core.decorator import decoratorClasses, OETestDecorator, \
-        OETestFilter, OETestDiscover
+        OETestDiscover
 
 # When loading tests, the unittest framework stores any exceptions and
 # displays them only when the run method is called.
@@ -68,7 +68,7 @@ class OETestLoader(unittest.TestLoader):
             '_top_level_dir']
 
     def __init__(self, tc, module_paths, modules, tests, modules_required,
-            filters, *args, **kwargs):
+            *args, **kwargs):
         self.tc = tc
 
         self.modules = _built_modules_dict(modules)
@@ -76,13 +76,7 @@ class OETestLoader(unittest.TestLoader):
         self.tests = tests
         self.modules_required = modules_required
 
-        self.filters = filters
-        self.decorator_filters = [d for d in decoratorClasses if \
-                issubclass(d, OETestFilter)]
-        self._validateFilters(self.filters, self.decorator_filters)
-        self.used_filters = [d for d in self.decorator_filters
-                             for f in self.filters
-                             if f in d.attrs]
+        self.tags_filter = kwargs.get("tags_filter", None)
 
         if isinstance(module_paths, str):
             module_paths = [module_paths]
@@ -104,28 +98,6 @@ class OETestLoader(unittest.TestLoader):
         setattr(testCaseClass, 'td', self.tc.td)
         setattr(testCaseClass, 'logger', self.tc.logger)
 
-    def _validateFilters(self, filters, decorator_filters):
-        # Validate if filter isn't empty
-        for key,value in filters.items():
-            if not value:
-                raise TypeError("Filter %s specified is empty" % key)
-
-        # Validate unique attributes
-        attr_filters = [attr for clss in decorator_filters \
-                                for attr in clss.attrs]
-        dup_attr = [attr for attr in attr_filters
-                    if attr_filters.count(attr) > 1]
-        if dup_attr:
-            raise TypeError('Detected duplicated attribute(s) %s in filter'
-                            ' decorators' % ' ,'.join(dup_attr))
-
-        # Validate if filter is supported
-        for f in filters:
-            if f not in attr_filters:
-                classes = ', '.join([d.__name__ for d in decorator_filters])
-                raise TypeError('Found "%s" filter but not declared in any of '
-                                '%s decorators' % (f, classes))
-
     def _registerTestCase(self, case):
         case_id = case.id()
         self.tc._registry['cases'][case_id] = case
@@ -188,19 +160,20 @@ class OETestLoader(unittest.TestLoader):
                         return True
 
         # Decorator filters
-        if self.filters and isinstance(case, OETestCase):
-            filters = self.filters.copy()
-            case_decorators = [cd for cd in case.decorators
-                               if cd.__class__ in self.used_filters]
-
-            # Iterate over case decorators to check if needs to be filtered.
-            for cd in case_decorators:
-                if cd.filtrate(filters):
-                    return True
-
-            # Case is missing one or more decorators for all the filters
-            # being used, so filter test case.
-            if filters:
+        if self.tags_filter is not None and callable(self.tags_filter):
+            alltags = set()
+            # pull tags from the case class
+            if hasattr(case, "__oeqa_testtags"):
+                for t in getattr(case, "__oeqa_testtags"):
+                    alltags.add(t)
+            # pull tags from the method itself
+            if hasattr(case, test_name):
+                method = getattr(case, test_name)
+                if hasattr(method, "__oeqa_testtags"):
+                    for t in getattr(method, "__oeqa_testtags"):
+                        alltags.add(t)
+
+            if self.tags_filter(alltags):
                 return True
 
         return False
diff --git a/meta/lib/oeqa/core/tests/cases/data.py b/meta/lib/oeqa/core/tests/cases/data.py
index 0d8de87ae7..61f88547f7 100644
--- a/meta/lib/oeqa/core/tests/cases/data.py
+++ b/meta/lib/oeqa/core/tests/cases/data.py
@@ -5,7 +5,7 @@
 #
 
 from oeqa.core.case import OETestCase
-from oeqa.core.decorator.oetag import OETestTag
+from oeqa.core.decorator import OETestTag
 from oeqa.core.decorator.data import OETestDataDepends
 
 class DataTest(OETestCase):
diff --git a/meta/lib/oeqa/core/tests/cases/oetag.py b/meta/lib/oeqa/core/tests/cases/oetag.py
index 4e1d080985..52f97dfda6 100644
--- a/meta/lib/oeqa/core/tests/cases/oetag.py
+++ b/meta/lib/oeqa/core/tests/cases/oetag.py
@@ -5,10 +5,9 @@
 #
 
 from oeqa.core.case import OETestCase
-from oeqa.core.decorator.oetag import OETestTag
+from oeqa.core.decorator import OETestTag
 
 class TagTest(OETestCase):
-
     @OETestTag('goodTag')
     def testTagGood(self):
         self.assertTrue(True, msg='How is this possible?')
@@ -17,5 +16,23 @@ class TagTest(OETestCase):
     def testTagOther(self):
         self.assertTrue(True, msg='How is this possible?')
 
+    @OETestTag('otherTag', 'multiTag')
+    def testTagOtherMulti(self):
+        self.assertTrue(True, msg='How is this possible?')
+
     def testTagNone(self):
         self.assertTrue(True, msg='How is this possible?')
+
+@OETestTag('classTag')
+class TagClassTest(OETestCase):
+    @OETestTag('otherTag')
+    def testTagOther(self):
+        self.assertTrue(True, msg='How is this possible?')
+
+    @OETestTag('otherTag', 'multiTag')
+    def testTagOtherMulti(self):
+        self.assertTrue(True, msg='How is this possible?')
+
+    def testTagNone(self):
+        self.assertTrue(True, msg='How is this possible?')
+
diff --git a/meta/lib/oeqa/core/tests/common.py b/meta/lib/oeqa/core/tests/common.py
index 39efd504c0..88cc758ad3 100644
--- a/meta/lib/oeqa/core/tests/common.py
+++ b/meta/lib/oeqa/core/tests/common.py
@@ -30,9 +30,9 @@ class TestBase(unittest.TestCase):
         directory = os.path.dirname(os.path.abspath(__file__))
         self.cases_path = os.path.join(directory, 'cases')
 
-    def _testLoader(self, d={}, modules=[], tests=[], filters={}):
+    def _testLoader(self, d={}, modules=[], tests=[], **kwargs):
         from oeqa.core.context import OETestContext
         tc = OETestContext(d, self.logger)
         tc.loadTests(self.cases_path, modules=modules, tests=tests,
-                     filters=filters)
+                     **kwargs)
         return tc
diff --git a/meta/lib/oeqa/core/tests/test_decorators.py b/meta/lib/oeqa/core/tests/test_decorators.py
index 499cd66ff3..b798bf7d33 100755
--- a/meta/lib/oeqa/core/tests/test_decorators.py
+++ b/meta/lib/oeqa/core/tests/test_decorators.py
@@ -14,35 +14,58 @@ setup_sys_path()
 from oeqa.core.exception import OEQADependency
 from oeqa.core.utils.test import getCaseMethod, getSuiteCasesNames, getSuiteCasesIDs
 
-class TestFilterDecorator(TestBase):
-
-    def _runFilterTest(self, modules, filters, expect, msg):
-        tc = self._testLoader(modules=modules, filters=filters)
-        test_loaded = set(getSuiteCasesNames(tc.suites))
-        self.assertEqual(expect, test_loaded, msg=msg)
+class TestTagDecorator(TestBase):
+    def _runTest(self, modules, filterfn, expect):
+        tc = self._testLoader(modules = modules, tags_filter = filterfn)
+        test_loaded = set(getSuiteCasesIDs(tc.suites))
+        self.assertEqual(expect, test_loaded)
 
     def test_oetag(self):
-        # Get all cases without filtering.
-        filter_all = {}
-        test_all = {'testTagGood', 'testTagOther', 'testTagNone'}
-        msg_all = 'Failed to get all oetag cases without filtering.'
-
-        # Get cases with 'goodTag'.
-        filter_good = {'oetag':'goodTag'}
-        test_good = {'testTagGood'}
-        msg_good = 'Failed to get just one test filtering with "goodTag" oetag.'
-
-        # Get cases with an invalid tag.
-        filter_invalid = {'oetag':'invalidTag'}
-        test_invalid = set()
-        msg_invalid = 'Failed to filter all test using an invalid oetag.'
-
-        tests = ((filter_all, test_all, msg_all),
-                 (filter_good, test_good, msg_good),
-                 (filter_invalid, test_invalid, msg_invalid))
-
-        for test in tests:
-            self._runFilterTest(['oetag'], test[0], test[1], test[2])
+        # get all cases without any filtering
+        self._runTest(['oetag'], None, {
+                'oetag.TagTest.testTagGood',
+                'oetag.TagTest.testTagOther',
+                'oetag.TagTest.testTagOtherMulti',
+                'oetag.TagTest.testTagNone',
+                'oetag.TagClassTest.testTagOther',
+                'oetag.TagClassTest.testTagOtherMulti',
+                'oetag.TagClassTest.testTagNone',
+                })
+
+        # exclude any case with tags
+        self._runTest(['oetag'], lambda tags: tags, {
+                'oetag.TagTest.testTagNone',
+                })
+
+        # exclude any case with otherTag
+        self._runTest(['oetag'], lambda tags: "otherTag" in tags, {
+                'oetag.TagTest.testTagGood',
+                'oetag.TagTest.testTagNone',
+                'oetag.TagClassTest.testTagNone',
+                })
+
+        # exclude any case with classTag
+        self._runTest(['oetag'], lambda tags: "classTag" in tags, {
+                'oetag.TagTest.testTagGood',
+                'oetag.TagTest.testTagOther',
+                'oetag.TagTest.testTagOtherMulti',
+                'oetag.TagTest.testTagNone',
+                })
+
+        # include any case with classTag
+        self._runTest(['oetag'], lambda tags: "classTag" not in tags, {
+                'oetag.TagClassTest.testTagOther',
+                'oetag.TagClassTest.testTagOtherMulti',
+                'oetag.TagClassTest.testTagNone',
+                })
+
+        # include any case with classTag or no tags
+        self._runTest(['oetag'], lambda tags: tags and "classTag" not in tags, {
+                'oetag.TagTest.testTagNone',
+                'oetag.TagClassTest.testTagOther',
+                'oetag.TagClassTest.testTagOtherMulti',
+                'oetag.TagClassTest.testTagNone',
+                })
 
 class TestDependsDecorator(TestBase):
     modules = ['depends']
diff --git a/meta/lib/oeqa/core/tests/test_loader.py b/meta/lib/oeqa/core/tests/test_loader.py
index e73c91b141..cb38ac845e 100755
--- a/meta/lib/oeqa/core/tests/test_loader.py
+++ b/meta/lib/oeqa/core/tests/test_loader.py
@@ -15,31 +15,6 @@ from oeqa.core.exception import OEQADependency
 from oeqa.core.utils.test import getSuiteModules, getSuiteCasesIDs
 
 class TestLoader(TestBase):
-
-    def test_fail_empty_filter(self):
-        filters = {'oetag' : ''}
-        expect = 'Filter oetag specified is empty'
-        msg = 'Expected TypeError exception for having invalid filter'
-        try:
-            # Must throw TypeError because empty filter
-            tc = self._testLoader(filters=filters)
-            self.fail(msg)
-        except TypeError as e:
-            result = True if expect in str(e) else False
-            self.assertTrue(result, msg=msg)
-
-    def test_fail_invalid_filter(self):
-        filters = {'invalid' : 'good'}
-        expect = 'filter but not declared in any of'
-        msg = 'Expected TypeError exception for having invalid filter'
-        try:
-            # Must throw TypeError because invalid filter
-            tc = self._testLoader(filters=filters)
-            self.fail(msg)
-        except TypeError as e:
-            result = True if expect in str(e) else False
-            self.assertTrue(result, msg=msg)
-
     @unittest.skip("invalid directory is missing oetag.py")
     def test_fail_duplicated_module(self):
         cases_path = self.cases_path
---
2.23.0.rc1

