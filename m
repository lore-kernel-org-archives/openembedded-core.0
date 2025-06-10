Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8547CC71133
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 16:09:48 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.90709.1749571781166554395
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 09:09:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=VQoW+j0f;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b2f11866376so3751264a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 09:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749571780; x=1750176580; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jquuMMcHjzH2VcaYOVUSl3t+iwkojFPjUbIr89Y8qZ8=;
        b=VQoW+j0fqQS/no0ttRR4nbP53ev40qblovUFJuLvR7gPbGSjpSiHuLQ9AzpBRcjrSU
         tTA+eCNwAX3ord18jD+NcMpASL4eS/bJloyobQ1SYDtmTherrsGUsxrW850eL/phZc2G
         B0ovkJw6/z/dNkhwIvwabcuE4i693qVRaalaBPT94tYxw6q/+/l0mSSlgSKhNahzpV9R
         vkU7oQksCnW04+fYGDMukQna4RmK8UlqbnBWp55Ppd1vAED7hPJ0xQ6ngeKTN5pRJOUX
         jlsToYLG9yfDpN6r96YRsZP+NOEXEWKI6CDoTrOajrHEB/x5O870g188huI8gLenKssR
         8X0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749571780; x=1750176580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jquuMMcHjzH2VcaYOVUSl3t+iwkojFPjUbIr89Y8qZ8=;
        b=R/OMAHb4FMFVOlL0MoNlPfQ/YJx2FDmNZDiJX8iitduhksanMAELeUOQ/NWr5rblDB
         7V3ohRCIZSA3aEhJ/BE5wfReLqxPS4yhwqGWhQnPCPK0QNePmVBuELp/GU0ztEZW2lMi
         5/wq3dYVh1xmoJk6BDpJhZLoAGNhkwES86/d0/P5hWFWyTCait1bTNU6IsGmS49DPqAm
         hQpy2xake3QTwInZKf/up10qYYp9fRP3JxblYpJeZ7jFBzvupldOrHVYV5Rgb6Na/mmq
         5Iva5So5WZyQe0bPH2YzE2WiBk+aez9V7bDiV98gSo9PqFIAks0eJo9rF7pKIeP092Pm
         lgmA==
X-Gm-Message-State: AOJu0YxLT1Z9bdEohIsPsl8qNAKSJX3tUo+I2VXkfKYV1CLpXFDGZKnr
	lcJ8erlZ3/npwMGfXtOhqT77ah9chGBB/xLyY7l/nw0id2ae1ex7Ryk1PED9BhyRZHAG3yY4Trg
	o5TrP
X-Gm-Gg: ASbGncuuvKGI5xwgs0zOd9SwXKRDRQuEw81vVGeeJCvYGE5TNjPf5rKN6cxYzt2dBGF
	XRozd1yYJhCtJba2TIaw6al04qt2FabftqtJHyl3nNewsfhKdRtPbRgRMyAiepRCFkUxDIqXFsN
	aa50GekQBc4nKQfMZ2Jj8Clz6zpKiBclSKUB3viOB/GNptoH4+CIRYRqU8SV3JEfki5lVohq2rI
	rIKg6Nqpl4XyTwx37CzaQwV4fwsyBPLAXr5RWLu60u2sBxHnktjsjYX7rREFqbka5vMOTen/a05
	+pYHYzZCY5rEkmOM4rObJtM0YqvFGGB6ykxtQsPoMbJR/ZwM/KnZ0g==
X-Google-Smtp-Source: AGHT+IHgaOIoC825nd0PmWDobevfin54PqoA9si9CS1ZfGFTADLRg+KGkvmSkZ5POqfJmBIS+iwiJA==
X-Received: by 2002:a17:90b:2252:b0:313:2e69:8002 with SMTP id 98e67ed59e1d1-313af23d6d3mr158415a91.20.1749571780237;
        Tue, 10 Jun 2025 09:09:40 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7bc4:2c75:fa51:ff16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236034056e7sm72597295ad.166.2025.06.10.09.09.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 09:09:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 30/32] python3: backport the full fix for importlib scanning invalid distributions
Date: Tue, 10 Jun 2025 09:08:43 -0700
Message-ID: <1c1b651038e15445c495d87c38beeb92f00d9919.1749571556.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749571556.git.steve@sakoman.com>
References: <cover.1749571556.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 16:09:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218399

From: Ross Burton <ross.burton@arm.com>

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

[1] oe-core 4f94d929639 ("sstate/staging: Handle directory creation race issue")

(From OE-Core rev: 73de8daa6293403f5b92d313af32882c47bce396)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../python3/deterministic_imports.patch       |  39 -----
 .../python/python3/valid-dists.patch          | 160 ++++++++++++++++++
 .../recipes-devtools/python/python3_3.13.2.bb |   2 +-
 3 files changed, 161 insertions(+), 40 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/deterministic_imports.patch
 create mode 100644 meta/recipes-devtools/python/python3/valid-dists.patch

diff --git a/meta/recipes-devtools/python/python3/deterministic_imports.patch b/meta/recipes-devtools/python/python3/deterministic_imports.patch
deleted file mode 100644
index 61f136ef42..0000000000
--- a/meta/recipes-devtools/python/python3/deterministic_imports.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 0a02e3b85176a5ce4dd98830bb65dac8596142e9 Mon Sep 17 00:00:00 2001
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Fri, 27 May 2022 17:05:44 +0100
-Subject: [PATCH] python3: Ensure stale empty python module directories don't
-
-There are two issues here. Firstly, the modules are accessed in on disk order. This
-means behaviour seen on one system might not reproduce on another and is a real headache.
-
-Secondly, empty directories left behind by previous modules might be looked at. This
-has caused a long string of different issues for us.
-
-As a result, patch this to a behaviour which works for us.
-
-Upstream-Status: Submitted [https://github.com/python/cpython/issues/120492; need to first talk to upstream to see if they'll take one or both fixes]
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
----
- Lib/importlib/metadata/__init__.py | 9 ++++++++-
- 1 file changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/Lib/importlib/metadata/__init__.py b/Lib/importlib/metadata/__init__.py
-index 8ce62dd..a6ea6e9 100644
---- a/Lib/importlib/metadata/__init__.py
-+++ b/Lib/importlib/metadata/__init__.py
-@@ -786,7 +786,14 @@ class Lookup:
-         self.infos = FreezableDefaultDict(list)
-         self.eggs = FreezableDefaultDict(list)
- 
--        for child in path.children():
-+        for child in sorted(path.children()):
-+            childpath = pathlib.Path(path.root, child)
-+            try:
-+                if childpath.is_dir() and not any(childpath.iterdir()):
-+                    # Empty directories aren't interesting
-+                    continue
-+            except PermissionError:
-+                continue
-             low = child.lower()
-             if low.endswith((".dist-info", ".egg-info")):
-                 # rpartition is faster than splitext and suitable for this purpose.
diff --git a/meta/recipes-devtools/python/python3/valid-dists.patch b/meta/recipes-devtools/python/python3/valid-dists.patch
new file mode 100644
index 0000000000..1b2c078c21
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/valid-dists.patch
@@ -0,0 +1,160 @@
+From a65c29adc027b3615154cab73aaedd58a6aa23da Mon Sep 17 00:00:00 2001
+From: "Jason R. Coombs" <jaraco@jaraco.com>
+Date: Tue, 23 Jul 2024 08:36:16 -0400
+Subject: [PATCH] Prioritize valid dists to invalid dists when retrieving by
+ name.
+
+Closes python/importlib_metadata#489
+
+Upstream-Status: Backport [https://github.com/python/importlib_metadata/commit/a65c29adc027b3615154cab73aaedd58a6aa23da]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git i/Lib/importlib/metadata/__init__.py w/Lib/importlib/metadata/__init__.py
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
+ 
+ from contextlib import suppress
+@@ -404,7 +404,7 @@ def from_name(cls, name: str) -> Distribution:
+         if not name:
+             raise ValueError("A distribution name is required.")
+         try:
+-            return next(iter(cls.discover(name=name)))
++            return next(iter(cls._prefer_valid(cls.discover(name=name))))
+         except StopIteration:
+             raise PackageNotFoundError(name)
+ 
+@@ -428,6 +428,16 @@ def discover(
+             resolver(context) for resolver in cls._discover_resolvers()
+         )
+ 
++    @staticmethod
++    def _prefer_valid(dists: Iterable[Distribution]) -> Iterable[Distribution]:
++        """
++        Prefer (move to the front) distributions that have metadata.
++
++        Ref python/importlib_resources#489.
++        """
++        buckets = bucket(dists, lambda dist: bool(dist.metadata))
++        return itertools.chain(buckets[True], buckets[False])
++
+     @staticmethod
+     def at(path: str | os.PathLike[str]) -> Distribution:
+         """Return a Distribution for the indicated metadata path.
+diff --git i/Lib/importlib/metadata/_itertools.py w/Lib/importlib/metadata/_itertools.py
+index d4ca9b9140e..79d37198ce7 100644
+--- i/Lib/importlib/metadata/_itertools.py
++++ w/Lib/importlib/metadata/_itertools.py
+@@ -1,3 +1,4 @@
++from collections import defaultdict, deque
+ from itertools import filterfalse
+ 
+ 
+@@ -71,3 +72,100 @@ def always_iterable(obj, base_type=(str, bytes)):
+         return iter(obj)
+     except TypeError:
+         return iter((obj,))
++
++
++# Copied from more_itertools 10.3
++class bucket:
++    """Wrap *iterable* and return an object that buckets the iterable into
++    child iterables based on a *key* function.
++
++        >>> iterable = ['a1', 'b1', 'c1', 'a2', 'b2', 'c2', 'b3']
++        >>> s = bucket(iterable, key=lambda x: x[0])  # Bucket by 1st character
++        >>> sorted(list(s))  # Get the keys
++        ['a', 'b', 'c']
++        >>> a_iterable = s['a']
++        >>> next(a_iterable)
++        'a1'
++        >>> next(a_iterable)
++        'a2'
++        >>> list(s['b'])
++        ['b1', 'b2', 'b3']
++
++    The original iterable will be advanced and its items will be cached until
++    they are used by the child iterables. This may require significant storage.
++
++    By default, attempting to select a bucket to which no items belong  will
++    exhaust the iterable and cache all values.
++    If you specify a *validator* function, selected buckets will instead be
++    checked against it.
++
++        >>> from itertools import count
++        >>> it = count(1, 2)  # Infinite sequence of odd numbers
++        >>> key = lambda x: x % 10  # Bucket by last digit
++        >>> validator = lambda x: x in {1, 3, 5, 7, 9}  # Odd digits only
++        >>> s = bucket(it, key=key, validator=validator)
++        >>> 2 in s
++        False
++        >>> list(s[2])
++        []
++
++    """
++
++    def __init__(self, iterable, key, validator=None):
++        self._it = iter(iterable)
++        self._key = key
++        self._cache = defaultdict(deque)
++        self._validator = validator or (lambda x: True)
++
++    def __contains__(self, value):
++        if not self._validator(value):
++            return False
++
++        try:
++            item = next(self[value])
++        except StopIteration:
++            return False
++        else:
++            self._cache[value].appendleft(item)
++
++        return True
++
++    def _get_values(self, value):
++        """
++        Helper to yield items from the parent iterator that match *value*.
++        Items that don't match are stored in the local cache as they
++        are encountered.
++        """
++        while True:
++            # If we've cached some items that match the target value, emit
++            # the first one and evict it from the cache.
++            if self._cache[value]:
++                yield self._cache[value].popleft()
++            # Otherwise we need to advance the parent iterator to search for
++            # a matching item, caching the rest.
++            else:
++                while True:
++                    try:
++                        item = next(self._it)
++                    except StopIteration:
++                        return
++                    item_value = self._key(item)
++                    if item_value == value:
++                        yield item
++                        break
++                    elif self._validator(item_value):
++                        self._cache[item_value].append(item)
++
++    def __iter__(self):
++        for item in self._it:
++            item_value = self._key(item)
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
diff --git a/meta/recipes-devtools/python/python3_3.13.2.bb b/meta/recipes-devtools/python/python3_3.13.2.bb
index 0f0505c66c..8e16ce90dc 100644
--- a/meta/recipes-devtools/python/python3_3.13.2.bb
+++ b/meta/recipes-devtools/python/python3_3.13.2.bb
@@ -20,7 +20,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://makerace.patch \
            file://0001-sysconfig.py-use-platlibdir-also-for-purelib.patch \
            file://0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch \
-           file://deterministic_imports.patch \
+           file://valid-dists.patch \
            file://0001-Avoid-shebang-overflow-on-python-config.py.patch \
            file://0001-Update-test_sysconfig-for-posix_user-purelib.patch \
            file://0001-skip-no_stdout_fileno-test-due-to-load-variability.patch \
-- 
2.43.0


