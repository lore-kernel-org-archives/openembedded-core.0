Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CE16C369DC
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 15:29:44 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.1344.1745940580328783638
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Apr 2025 08:29:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 019A71515
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 08:29:33 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 807E23F673
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 08:29:39 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3: backport the full fix for importlib scanning invalid distributions
Date: Tue, 29 Apr 2025 16:29:30 +0100
Message-ID: <20250429152930.2037750-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 15:29:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215681

Even with our fixes in deterministic_imports.patch the
importlib.metadata package scan was still returning Distribution objects
for empty directories.  This interacts badly with rebuilds when recipes
are changing as when a recipe is removed from the sysroot directories
are not removed[1].

In particular this breaks python3-meson-python-native rebuilds when
Meson upgrades from 1.7 to 1.8: the site-packages directory has an empty
meson-1.7.dist-info/ and populated meson-1.8.dist-info/. Whilst it's
deterministic to return the empty 1.7 first, this breaks pypa/build as
it looks through the distributions in order.

We had discussed this with upstream previously and there's a more
comprehensive fix upstream (actually in importlib_metadata, not cpython)
which ensures that valid distribution objects are listed first.  So we
can drop our patch and replace it with a backport to fix these rebuilds.

[1] oe-core 4f94d929639 ("sstate/staging: Handle directory creation race =
issue")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python3/deterministic_imports.patch       |  39 -----
 .../python/python3/valid-dists.patch          | 160 ++++++++++++++++++
 .../recipes-devtools/python/python3_3.13.2.bb |   2 +-
 3 files changed, 161 insertions(+), 40 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/deterministic_im=
ports.patch
 create mode 100644 meta/recipes-devtools/python/python3/valid-dists.patc=
h

diff --git a/meta/recipes-devtools/python/python3/deterministic_imports.p=
atch b/meta/recipes-devtools/python/python3/deterministic_imports.patch
deleted file mode 100644
index 61f136ef42a..00000000000
--- a/meta/recipes-devtools/python/python3/deterministic_imports.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 0a02e3b85176a5ce4dd98830bb65dac8596142e9 Mon Sep 17 00:00:00 2001
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Fri, 27 May 2022 17:05:44 +0100
-Subject: [PATCH] python3: Ensure stale empty python module directories d=
on't
-
-There are two issues here. Firstly, the modules are accessed in on disk =
order. This
-means behaviour seen on one system might not reproduce on another and is=
 a real headache.
-
-Secondly, empty directories left behind by previous modules might be loo=
ked at. This
-has caused a long string of different issues for us.
-
-As a result, patch this to a behaviour which works for us.
-
-Upstream-Status: Submitted [https://github.com/python/cpython/issues/120=
492; need to first talk to upstream to see if they'll take one or both fi=
xes]
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
----
- Lib/importlib/metadata/__init__.py | 9 ++++++++-
- 1 file changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/Lib/importlib/metadata/__init__.py b/Lib/importlib/metadata=
/__init__.py
-index 8ce62dd..a6ea6e9 100644
---- a/Lib/importlib/metadata/__init__.py
-+++ b/Lib/importlib/metadata/__init__.py
-@@ -786,7 +786,14 @@ class Lookup:
-         self.infos =3D FreezableDefaultDict(list)
-         self.eggs =3D FreezableDefaultDict(list)
-=20
--        for child in path.children():
-+        for child in sorted(path.children()):
-+            childpath =3D pathlib.Path(path.root, child)
-+            try:
-+                if childpath.is_dir() and not any(childpath.iterdir()):
-+                    # Empty directories aren't interesting
-+                    continue
-+            except PermissionError:
-+                continue
-             low =3D child.lower()
-             if low.endswith((".dist-info", ".egg-info")):
-                 # rpartition is faster than splitext and suitable for t=
his purpose.
diff --git a/meta/recipes-devtools/python/python3/valid-dists.patch b/met=
a/recipes-devtools/python/python3/valid-dists.patch
new file mode 100644
index 00000000000..1b2c078c21f
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/valid-dists.patch
@@ -0,0 +1,160 @@
+From a65c29adc027b3615154cab73aaedd58a6aa23da Mon Sep 17 00:00:00 2001
+From: "Jason R. Coombs" <jaraco@jaraco.com>
+Date: Tue, 23 Jul 2024 08:36:16 -0400
+Subject: [PATCH] Prioritize valid dists to invalid dists when retrieving=
 by
+ name.
+
+Closes python/importlib_metadata#489
+
+Upstream-Status: Backport [https://github.com/python/importlib_metadata/=
commit/a65c29adc027b3615154cab73aaedd58a6aa23da]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git i/Lib/importlib/metadata/__init__.py w/Lib/importlib/metadata=
/__init__.py
+index 8ce62dd864f..085378caabc 100644
+--- i/Lib/importlib/metadata/__init__.py
++++ w/Lib/importlib/metadata/__init__.py
+@@ -21,7 +21,7 @@
+ from . import _meta
+ from ._collections import FreezableDefaultDict, Pair
+ from ._functools import method_cache, pass_none
+-from ._itertools import always_iterable, unique_everseen
++from ._itertools import always_iterable, bucket, unique_everseen
+ from ._meta import PackageMetadata, SimplePath
+=20
+ from contextlib import suppress
+@@ -404,7 +404,7 @@ def from_name(cls, name: str) -> Distribution:
+         if not name:
+             raise ValueError("A distribution name is required.")
+         try:
+-            return next(iter(cls.discover(name=3Dname)))
++            return next(iter(cls._prefer_valid(cls.discover(name=3Dname=
))))
+         except StopIteration:
+             raise PackageNotFoundError(name)
+=20
+@@ -428,6 +428,16 @@ def discover(
+             resolver(context) for resolver in cls._discover_resolvers()
+         )
+=20
++    @staticmethod
++    def _prefer_valid(dists: Iterable[Distribution]) -> Iterable[Distri=
bution]:
++        """
++        Prefer (move to the front) distributions that have metadata.
++
++        Ref python/importlib_resources#489.
++        """
++        buckets =3D bucket(dists, lambda dist: bool(dist.metadata))
++        return itertools.chain(buckets[True], buckets[False])
++
+     @staticmethod
+     def at(path: str | os.PathLike[str]) -> Distribution:
+         """Return a Distribution for the indicated metadata path.
+diff --git i/Lib/importlib/metadata/_itertools.py w/Lib/importlib/metada=
ta/_itertools.py
+index d4ca9b9140e..79d37198ce7 100644
+--- i/Lib/importlib/metadata/_itertools.py
++++ w/Lib/importlib/metadata/_itertools.py
+@@ -1,3 +1,4 @@
++from collections import defaultdict, deque
+ from itertools import filterfalse
+=20
+=20
+@@ -71,3 +72,100 @@ def always_iterable(obj, base_type=3D(str, bytes)):
+         return iter(obj)
+     except TypeError:
+         return iter((obj,))
++
++
++# Copied from more_itertools 10.3
++class bucket:
++    """Wrap *iterable* and return an object that buckets the iterable i=
nto
++    child iterables based on a *key* function.
++
++        >>> iterable =3D ['a1', 'b1', 'c1', 'a2', 'b2', 'c2', 'b3']
++        >>> s =3D bucket(iterable, key=3Dlambda x: x[0])  # Bucket by 1=
st character
++        >>> sorted(list(s))  # Get the keys
++        ['a', 'b', 'c']
++        >>> a_iterable =3D s['a']
++        >>> next(a_iterable)
++        'a1'
++        >>> next(a_iterable)
++        'a2'
++        >>> list(s['b'])
++        ['b1', 'b2', 'b3']
++
++    The original iterable will be advanced and its items will be cached=
 until
++    they are used by the child iterables. This may require significant =
storage.
++
++    By default, attempting to select a bucket to which no items belong =
 will
++    exhaust the iterable and cache all values.
++    If you specify a *validator* function, selected buckets will instea=
d be
++    checked against it.
++
++        >>> from itertools import count
++        >>> it =3D count(1, 2)  # Infinite sequence of odd numbers
++        >>> key =3D lambda x: x % 10  # Bucket by last digit
++        >>> validator =3D lambda x: x in {1, 3, 5, 7, 9}  # Odd digits =
only
++        >>> s =3D bucket(it, key=3Dkey, validator=3Dvalidator)
++        >>> 2 in s
++        False
++        >>> list(s[2])
++        []
++
++    """
++
++    def __init__(self, iterable, key, validator=3DNone):
++        self._it =3D iter(iterable)
++        self._key =3D key
++        self._cache =3D defaultdict(deque)
++        self._validator =3D validator or (lambda x: True)
++
++    def __contains__(self, value):
++        if not self._validator(value):
++            return False
++
++        try:
++            item =3D next(self[value])
++        except StopIteration:
++            return False
++        else:
++            self._cache[value].appendleft(item)
++
++        return True
++
++    def _get_values(self, value):
++        """
++        Helper to yield items from the parent iterator that match *valu=
e*.
++        Items that don't match are stored in the local cache as they
++        are encountered.
++        """
++        while True:
++            # If we've cached some items that match the target value, e=
mit
++            # the first one and evict it from the cache.
++            if self._cache[value]:
++                yield self._cache[value].popleft()
++            # Otherwise we need to advance the parent iterator to searc=
h for
++            # a matching item, caching the rest.
++            else:
++                while True:
++                    try:
++                        item =3D next(self._it)
++                    except StopIteration:
++                        return
++                    item_value =3D self._key(item)
++                    if item_value =3D=3D value:
++                        yield item
++                        break
++                    elif self._validator(item_value):
++                        self._cache[item_value].append(item)
++
++    def __iter__(self):
++        for item in self._it:
++            item_value =3D self._key(item)
++            if self._validator(item_value):
++                self._cache[item_value].append(item)
++
++        yield from self._cache.keys()
++
++    def __getitem__(self, value):
++        if not self._validator(value):
++            return iter(())
++
++        return self._get_values(value)
diff --git a/meta/recipes-devtools/python/python3_3.13.2.bb b/meta/recipe=
s-devtools/python/python3_3.13.2.bb
index 0f0505c66c7..8e16ce90dc2 100644
--- a/meta/recipes-devtools/python/python3_3.13.2.bb
+++ b/meta/recipes-devtools/python/python3_3.13.2.bb
@@ -20,7 +20,7 @@ SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Pyt=
hon-${PV}.tar.xz \
            file://makerace.patch \
            file://0001-sysconfig.py-use-platlibdir-also-for-purelib.patc=
h \
            file://0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-ma=
ste.patch \
-           file://deterministic_imports.patch \
+           file://valid-dists.patch \
            file://0001-Avoid-shebang-overflow-on-python-config.py.patch =
\
            file://0001-Update-test_sysconfig-for-posix_user-purelib.patc=
h \
            file://0001-skip-no_stdout_fileno-test-due-to-load-variabilit=
y.patch \
--=20
2.43.0


