Received: from mail-px0-f172.google.com ([209.85.212.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QMnw2-0001nv-UC
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 23:05:40 +0200
Received: by pxi6 with SMTP id 6so1505465pxi.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2011 14:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=2Bwre+JdmqDaHov4Cl3fo9dpXLpXhmeg0QPp65OBg58=;
	b=lbyXoi/N3AafI3798DKIUlL/vzi5MDO9eTdzcZCw8kxWRKT5mCCZHIZxm7zZb7NR+f
	poPzT9YMfyH4510R8b0cxlZMo7gsrvkCHUPFY/vso7XKxh3rleiWFtt9UpuNY6CWSpSJ
	nQuukGp1r5N4uUg8JUsCWQp/Y6Ud1hcNkS+VU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=V1FUMILAv1/uGwOBOBdxPSNaFge59zCVMT6cIsrVCnJno8WCvqSfg2nh1AyDziUBri
	f1Bm/ASpy3TwMUUX03flrPaOXbS++WiwJE1/xpyo+CWkxjmzX5c1QUnKLOKnVs8aGCZg
	WL9a3xUixvfIg9b260XhKeE8PjY0kJotgPpZE=
Received: by 10.142.178.14 with SMTP id a14mr1275550wff.433.1305752561971;
	Wed, 18 May 2011 14:02:41 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-173-232.ph.ph.cox.net
	[24.251.173.232])
	by mx.google.com with ESMTPS id k6sm1690201wfa.5.2011.05.18.14.02.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 May 2011 14:02:41 -0700 (PDT)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 May 2011 14:02:29 -0700
Message-Id: <785364ad1a2e6ce898d2a99e2e1c943d9a40767d.1305752502.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1305752502.git.chris_larson@mentor.com>
References: <cover.1305752502.git.chris_larson@mentor.com>
In-Reply-To: <cover.1305752502.git.chris_larson@mentor.com>
References: <cover.1305752502.git.chris_larson@mentor.com>
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 1/5] Implement variable typing (sync from OE)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 May 2011 21:05:40 -0000

From: Chris Larson <chris_larson@mentor.com>

This implementation consists of two components:

- Type creation python modules, whose job it is to construct objects of the
  defined type for a given variable in the metadata
- typecheck.bbclass, which iterates over all configuration variables with a
  type defined and uses oe.types to check the validity of the values

This gives us a few benefits:

- Automatic sanity checking of all configuration variables with a defined type
- Avoid duplicating the "how do I make use of the value of this variable"
  logic between its users.  For variables like PATH, this is simply a split(),
  for boolean variables, the duplication can result in confusing, or even
  mismatched semantics (is this 0/1, empty/nonempty, what?)
- Make it easier to create a configuration UI, as the type information could
  be used to provide a better interface than a text edit box (e.g checkbox for
  'boolean', dropdown for 'choice')

This functionality is entirely opt-in right now.  To enable the configuration
variable type checking, simply INHERIT += "typecheck".  Example of a failing
type check:

BAZ = "foo"
BAZ[type] = "boolean"

$ bitbake -p
FATAL: BAZ: Invalid boolean value 'foo'
$

Examples of leveraging oe.types in a python snippet:

PACKAGES[type] = "list"

python () {
    import oe.data
    for pkg in oe.data.typed_value("PACKAGES", d):
        bb.note("package: %s" % pkg)
}

LIBTOOL_HAS_SYSROOT = "yes"
LIBTOOL_HAS_SYSROOT[type] = "boolean"

python () {
    import oe.data
    assert(oe.data.typed_value("LIBTOOL_HAS_SYSROOT", d) == True)
}

Signed-off-by: Chris Larson <chris_larson@mentor.com>
---
 meta/classes/base.bbclass      |    1 +
 meta/classes/typecheck.bbclass |   12 +++++
 meta/lib/oe/data.py            |   13 +++++
 meta/lib/oe/maketype.py        |  100 ++++++++++++++++++++++++++++++++++++++
 meta/lib/oe/test_types.py      |   62 ++++++++++++++++++++++++
 meta/lib/oe/types.py           |  104 ++++++++++++++++++++++++++++++++++++++++
 6 files changed, 292 insertions(+), 0 deletions(-)
 create mode 100644 meta/classes/typecheck.bbclass
 create mode 100644 meta/lib/oe/data.py
 create mode 100644 meta/lib/oe/maketype.py
 create mode 100644 meta/lib/oe/test_types.py
 create mode 100644 meta/lib/oe/types.py

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 23095ec..b552de2 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -28,6 +28,7 @@ python sys_path_eh () {
 
         import oe.path
         import oe.utils
+        import oe.data
         inject("bb", bb)
         inject("sys", sys)
         inject("time", time)
diff --git a/meta/classes/typecheck.bbclass b/meta/classes/typecheck.bbclass
new file mode 100644
index 0000000..646cd4e
--- /dev/null
+++ b/meta/classes/typecheck.bbclass
@@ -0,0 +1,12 @@
+# Check types of bitbake configuration variables
+#
+# See oe.types for details.
+
+python check_types() {
+    import oe.types
+    if isinstance(e, bb.event.ConfigParsed):
+        for key in e.data.keys():
+            if e.data.getVarFlag(key, "type"):
+                oe.types.value(key, e.data)
+}
+addhandler check_types
diff --git a/meta/lib/oe/data.py b/meta/lib/oe/data.py
new file mode 100644
index 0000000..8b7c3cd
--- /dev/null
+++ b/meta/lib/oe/data.py
@@ -0,0 +1,13 @@
+import oe.maketype
+import bb.msg
+
+def typed_value(key, d):
+    """Construct a value for the specified metadata variable, using its flags
+    to determine the type and parameters for construction."""
+    var_type = d.getVarFlag(key, 'type')
+    flags = d.getVarFlags(key)
+
+    try:
+        return oe.maketype.create(d.getVar(key, True) or '', var_type, **flags)
+    except (TypeError, ValueError), exc:
+        bb.msg.fatal(bb.msg.domain.Data, "%s: %s" % (key, str(exc)))
diff --git a/meta/lib/oe/maketype.py b/meta/lib/oe/maketype.py
new file mode 100644
index 0000000..0e9dbc6
--- /dev/null
+++ b/meta/lib/oe/maketype.py
@@ -0,0 +1,100 @@
+"""OpenEmbedded variable typing support
+
+Types are defined in the metadata by name, using the 'type' flag on a
+variable.  Other flags may be utilized in the construction of the types.  See
+the arguments of the type's factory for details.
+"""
+
+import bb
+import inspect
+import types
+
+available_types = {}
+
+class MissingFlag(TypeError):
+    """A particular flag is required to construct the type, but has not been
+    provided."""
+    def __init__(self, flag, type):
+        self.flag = flag
+        self.type = type
+        TypeError.__init__(self)
+
+    def __str__(self):
+        return "Type '%s' requires flag '%s'" % (self.type, self.flag)
+
+def factory(var_type):
+    """Return the factory for a specified type."""
+    if var_type is None:
+        raise TypeError("No type specified. Valid types: %s" %
+                        ', '.join(available_types))
+    try:
+        return available_types[var_type]
+    except KeyError:
+        raise TypeError("Invalid type '%s':\n  Valid types: %s" %
+                        (var_type, ', '.join(available_types)))
+
+def create(value, var_type, **flags):
+    """Create an object of the specified type, given the specified flags and
+    string value."""
+    obj = factory(var_type)
+    objflags = {}
+    for flag in obj.flags:
+        if flag not in flags:
+            if flag not in obj.optflags:
+                raise MissingFlag(flag, var_type)
+        else:
+            objflags[flag] = flags[flag]
+
+    return obj(value, **objflags)
+
+def get_callable_args(obj):
+    """Grab all but the first argument of the specified callable, returning
+    the list, as well as a list of which of the arguments have default
+    values."""
+    if type(obj) is type:
+        obj = obj.__init__
+
+    args, varargs, keywords, defaults = inspect.getargspec(obj)
+    flaglist = []
+    if args:
+        if len(args) > 1 and args[0] == 'self':
+            args = args[1:]
+        flaglist.extend(args)
+
+    optional = set()
+    if defaults:
+        optional |= set(flaglist[-len(defaults):])
+    return flaglist, optional
+
+def factory_setup(name, obj):
+    """Prepare a factory for use."""
+    args, optional = get_callable_args(obj)
+    extra_args = args[1:]
+    if extra_args:
+        obj.flags, optional = extra_args, optional
+        obj.optflags = set(optional)
+    else:
+        obj.flags = obj.optflags = ()
+
+    if not hasattr(obj, 'name'):
+        obj.name = name
+
+def register(name, factory):
+    """Register a type, given its name and a factory callable.
+
+    Determines the required and optional flags from the factory's
+    arguments."""
+    factory_setup(name, factory)
+    available_types[factory.name] = factory
+
+
+# Register all our included types
+for name in dir(types):
+    if name.startswith('_'):
+        continue
+
+    obj = getattr(types, name)
+    if not callable(obj):
+        continue
+
+    register(name, obj)
diff --git a/meta/lib/oe/test_types.py b/meta/lib/oe/test_types.py
new file mode 100644
index 0000000..367cc30
--- /dev/null
+++ b/meta/lib/oe/test_types.py
@@ -0,0 +1,62 @@
+import unittest
+from oe.maketype import create, factory
+
+class TestTypes(unittest.TestCase):
+    def assertIsInstance(self, obj, cls):
+        return self.assertTrue(isinstance(obj, cls))
+
+    def assertIsNot(self, obj, other):
+        return self.assertFalse(obj is other)
+
+    def assertFactoryCreated(self, value, type, **flags):
+        cls = factory(type)
+        self.assertIsNot(cls, None)
+        self.assertIsInstance(create(value, type, **flags), cls)
+
+class TestBooleanType(TestTypes):
+    def test_invalid(self):
+        self.assertRaises(ValueError, create, '', 'boolean')
+        self.assertRaises(ValueError, create, 'foo', 'boolean')
+        self.assertRaises(TypeError, create, object(), 'boolean')
+
+    def test_true(self):
+        self.assertTrue(create('y', 'boolean'))
+        self.assertTrue(create('yes', 'boolean'))
+        self.assertTrue(create('1', 'boolean'))
+        self.assertTrue(create('t', 'boolean'))
+        self.assertTrue(create('true', 'boolean'))
+        self.assertTrue(create('TRUE', 'boolean'))
+        self.assertTrue(create('truE', 'boolean'))
+
+    def test_false(self):
+        self.assertFalse(create('n', 'boolean'))
+        self.assertFalse(create('no', 'boolean'))
+        self.assertFalse(create('0', 'boolean'))
+        self.assertFalse(create('f', 'boolean'))
+        self.assertFalse(create('false', 'boolean'))
+        self.assertFalse(create('FALSE', 'boolean'))
+        self.assertFalse(create('faLse', 'boolean'))
+
+    def test_bool_equality(self):
+        self.assertEqual(create('n', 'boolean'), False)
+        self.assertNotEqual(create('n', 'boolean'), True)
+        self.assertEqual(create('y', 'boolean'), True)
+        self.assertNotEqual(create('y', 'boolean'), False)
+
+class TestList(TestTypes):
+    def assertListEqual(self, value, valid, sep=None):
+        obj = create(value, 'list', separator=sep)
+        self.assertEqual(obj, valid)
+        if sep is not None:
+            self.assertEqual(obj.separator, sep)
+        self.assertEqual(str(obj), obj.separator.join(obj))
+
+    def test_list_nosep(self):
+        testlist = ['alpha', 'beta', 'theta']
+        self.assertListEqual('alpha beta theta', testlist)
+        self.assertListEqual('alpha  beta\ttheta', testlist)
+        self.assertListEqual('alpha', ['alpha'])
+
+    def test_list_usersep(self):
+        self.assertListEqual('foo:bar', ['foo', 'bar'], ':')
+        self.assertListEqual('foo:bar:baz', ['foo', 'bar', 'baz'], ':')
diff --git a/meta/lib/oe/types.py b/meta/lib/oe/types.py
new file mode 100644
index 0000000..ea31cf4
--- /dev/null
+++ b/meta/lib/oe/types.py
@@ -0,0 +1,104 @@
+import re
+
+class OEList(list):
+    """OpenEmbedded 'list' type
+
+    Acts as an ordinary list, but is constructed from a string value and a
+    separator (optional), and re-joins itself when converted to a string with
+    str().  Set the variable type flag to 'list' to use this type, and the
+    'separator' flag may be specified (defaulting to whitespace)."""
+
+    name = "list"
+
+    def __init__(self, value, separator = None):
+        if value is not None:
+            list.__init__(self, value.split(separator))
+        else:
+            list.__init__(self)
+
+        if separator is None:
+            self.separator = " "
+        else:
+            self.separator = separator
+
+    def __str__(self):
+        return self.separator.join(self)
+
+def choice(value, choices):
+    """OpenEmbedded 'choice' type
+
+    Acts as a multiple choice for the user.  To use this, set the variable
+    type flag to 'choice', and set the 'choices' flag to a space separated
+    list of valid values."""
+    if not isinstance(value, basestring):
+        raise TypeError("choice accepts a string, not '%s'" % type(value))
+
+    value = value.lower()
+    choices = choices.lower()
+    if value not in choices.split():
+        raise ValueError("Invalid choice '%s'.  Valid choices: %s" %
+                         (value, choices))
+    return value
+
+def regex(value, regexflags=None):
+    """OpenEmbedded 'regex' type
+
+    Acts as a regular expression, returning the pre-compiled regular
+    expression pattern object.  To use this type, set the variable type flag
+    to 'regex', and optionally, set the 'regexflags' type to a space separated
+    list of the flags to control the regular expression matching (e.g.
+    FOO[regexflags] += 'ignorecase').  See the python documentation on the
+    're' module for a list of valid flags."""
+
+    flagval = 0
+    if regexflags:
+        for flag in regexflags.split():
+            flag = flag.upper()
+            try:
+                flagval |= getattr(re, flag)
+            except AttributeError:
+                raise ValueError("Invalid regex flag '%s'" % flag)
+
+    try:
+        return re.compile(value, flagval)
+    except re.error, exc:
+        raise ValueError("Invalid regex value '%s': %s" %
+                         (value, exc.args[0]))
+
+def boolean(value):
+    """OpenEmbedded 'boolean' type
+
+    Valid values for true: 'yes', 'y', 'true', 't', '1'
+    Valid values for false: 'no', 'n', 'false', 'f', '0'
+    """
+
+    if not isinstance(value, basestring):
+        raise TypeError("boolean accepts a string, not '%s'" % type(value))
+
+    value = value.lower()
+    if value in ('yes', 'y', 'true', 't', '1'):
+        return True
+    elif value in ('no', 'n', 'false', 'f', '0'):
+        return False
+    raise ValueError("Invalid boolean value '%s'" % value)
+
+def integer(value, numberbase=10):
+    """OpenEmbedded 'integer' type
+
+    Defaults to base 10, but this can be specified using the optional
+    'numberbase' flag."""
+
+    return int(value, int(numberbase))
+
+_float = float
+def float(value, fromhex='false'):
+    """OpenEmbedded floating point type
+
+    To use this type, set the type flag to 'float', and optionally set the
+    'fromhex' flag to a true value (obeying the same rules as for the
+    'boolean' type) if the value is in base 16 rather than base 10."""
+
+    if boolean(fromhex):
+        return _float.fromhex(value)
+    else:
+        return _float(value)
-- 
1.7.1



