Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5139778200
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jul 2017 14:01:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v6EE1Fkw018085
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jul 2017 07:01:15 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 14 Jul 2017 07:01:14 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Jul 2017 10:01:09 -0400
Message-ID: <1500040869-23765-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH v2] python3: fix weakref spewing exceptions during interp finalization
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
X-List-Received-Date: Fri, 14 Jul 2017 14:01:16 -0000
Content-Type: text/plain

When py3 applications are exiting we often see errors similar to the
following:

Exception ignored in: <function WeakValueDictionary.__init__.<locals>.remove at 0x7fcb56b09400>
Traceback (most recent call last):
  File "/usr/lib64/python3.5/weakref.py", line 117, in remove
  TypeError: 'NoneType' object is not callable

After a quick search this was found to be a well reported issue
upstream and had an appropriate fix which is backported here.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
v2: Add patch author SOB to embedded patch after
    failing Patchwork's patchtest.

 ...eakref-spewing-exceptions-during-interp-f.patch | 56 ++++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.5.3.bb      |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/Fix-29519-weakref-spewing-exceptions-during-interp-f.patch

diff --git a/meta/recipes-devtools/python/python3/Fix-29519-weakref-spewing-exceptions-during-interp-f.patch b/meta/recipes-devtools/python/python3/Fix-29519-weakref-spewing-exceptions-during-interp-f.patch
new file mode 100644
index 0000000..7217c6e
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/Fix-29519-weakref-spewing-exceptions-during-interp-f.patch
@@ -0,0 +1,56 @@
+From 62dcf34987b680e95873eb947b3f4d802199c667 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?=C5=81ukasz=20Langa?= <lukasz@langa.pl>
+Date: Fri, 10 Feb 2017 00:14:55 -0800
+Subject: [PATCH] Fix #29519: weakref spewing exceptions during interp
+ finalization
+
+commit 9cd7e17640a49635d1c1f8c2989578a8fc2c1de6
+from https://github.com/python/cpython
+
+Upstream-Status: Backport
+
+Signed-off-by: Lukasz Langa <lukasz@langa.pl>
+---
+ Lib/weakref.py | 4 ++--
+ Misc/NEWS      | 3 +++
+ 2 files changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/Lib/weakref.py b/Lib/weakref.py
+index aaebd0c..787e33a 100644
+--- a/Lib/weakref.py
++++ b/Lib/weakref.py
+@@ -106,7 +106,7 @@ class WeakValueDictionary(collections.MutableMapping):
+         self, *args = args
+         if len(args) > 1:
+             raise TypeError('expected at most 1 arguments, got %d' % len(args))
+-        def remove(wr, selfref=ref(self)):
++        def remove(wr, selfref=ref(self), _atomic_removal=_remove_dead_weakref):
+             self = selfref()
+             if self is not None:
+                 if self._iterating:
+@@ -114,7 +114,7 @@ class WeakValueDictionary(collections.MutableMapping):
+                 else:
+                     # Atomic removal is necessary since this function
+                     # can be called asynchronously by the GC
+-                    _remove_dead_weakref(d, wr.key)
++                    _atomic_removal(d, wr.key)
+         self._remove = remove
+         # A list of keys to be removed
+         self._pending_removals = []
+diff --git a/Misc/NEWS b/Misc/NEWS
+index 41cfdba..6d89f52 100644
+--- a/Misc/NEWS
++++ b/Misc/NEWS
+@@ -5719,6 +5719,9 @@ Core and Builtins
+ Library
+ -------
+ 
++- Issue #29519: Fix weakref spewing exceptions during interpreter shutdown
++  when used with a rare combination of multiprocessing and custom codecs.
++
+ - Issue #20154: Deadlock in asyncio.StreamReader.readexactly().
+ 
+ - Issue #16113: Remove sha3 module again.
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/python/python3_3.5.3.bb b/meta/recipes-devtools/python/python3_3.5.3.bb
index d7c29f2..7419c71 100644
--- a/meta/recipes-devtools/python/python3_3.5.3.bb
+++ b/meta/recipes-devtools/python/python3_3.5.3.bb
@@ -37,6 +37,7 @@ SRC_URI += "\
             file://configure.ac-fix-LIBPL.patch \
             file://upstream-random-fixes.patch \
             file://0001-Issue-21272-Use-_sysconfigdata.py-to-initialize-dist.patch \
+            file://Fix-29519-weakref-spewing-exceptions-during-interp-f.patch \
            "
 SRC_URI[md5sum] = "57d1f8bfbabf4f2500273fb0706e6f21"
 SRC_URI[sha256sum] = "eefe2ad6575855423ab630f5b51a8ef6e5556f774584c06beab4926f930ddbb0"
-- 
2.7.4


