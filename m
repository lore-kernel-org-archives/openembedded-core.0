Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3E81E6B1FF
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Sep 2013 08:49:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8E8nG7q017274
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Sep 2013 01:49:16 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Sat, 14 Sep 2013 01:49:15 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 14 Sep 2013 04:49:11 -0400
Message-ID: <3b4c037e41f6678845fb29d97aae5f48f07a68c7.1379148332.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1379148332.git.liezhi.yang@windriver.com>
References: <cover.1379148332.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] telepathy-mission-control: do_compile failed (race issue)
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
X-List-Received-Date: Sat, 14 Sep 2013 08:49:14 -0000
Content-Type: text/plain

There might be an error when parallel build:

[snip]
Traceback (most recent call last):
  File "/path/to/tools/glib-gtypes-generator.py", line 304, in <module>
    GTypesGenerator(dom, argv[1], argv[2])()
  File "/path/to/tools/glib-gtypes-generator.py", line 295, in __call__
    file_set_contents(self.output + '.h', ''.join(self.header))
  File "/path/to/tools/libtpcodegen.py", line 42, in file_set_contents
    os.rename(filename + '.tmp', filename)
OSError: [Errno 2] No such file or directory
[snip]

This is a race issue, the _gen/gtypes.h and _gen/gtypes-body.h may
write(remove/rename) _gen/gtypes.tmp at the same time, then there would
be the error.

Use ".NOTPARALLEL: _gen/gtypes.h _gen/gtypes-body.h" will fix the
problem.

[YOCTO #5184]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../tmc-Makefile-fix-race.patch                    |   47 ++++++++++++++++++++
 .../telepathy/telepathy-mission-control_5.15.0.bb  |    5 ++-
 2 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/telepathy/telepathy-mission-control/tmc-Makefile-fix-race.patch

diff --git a/meta/recipes-connectivity/telepathy/telepathy-mission-control/tmc-Makefile-fix-race.patch b/meta/recipes-connectivity/telepathy/telepathy-mission-control/tmc-Makefile-fix-race.patch
new file mode 100644
index 0000000..537e1d7
--- /dev/null
+++ b/meta/recipes-connectivity/telepathy/telepathy-mission-control/tmc-Makefile-fix-race.patch
@@ -0,0 +1,47 @@
+From 029fcd600707f25a73b0171497140dab264f56b7 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Sat, 14 Sep 2013 04:26:46 -0400
+Subject: [PATCH] src/Makefile.am: let _gen/gtypes.h and _gen/gtypes-body.h run serially
+
+There might be an error when parallel build:
+
+[snip]
+Traceback (most recent call last):
+  File "/path/to/tools/glib-gtypes-generator.py", line 304, in <module>
+    GTypesGenerator(dom, argv[1], argv[2])()
+  File "/path/to/tools/glib-gtypes-generator.py", line 295, in __call__
+    file_set_contents(self.output + '.h', ''.join(self.header))
+  File "/path/to/tools/libtpcodegen.py", line 42, in file_set_contents
+    os.rename(filename + '.tmp', filename)
+OSError: [Errno 2] No such file or directory
+[snip]
+
+This is a race issue, the _gen/gtypes.h and _gen/gtypes-body.h may
+write(remove/rename) _gen/gtypes.tmp at the same time, then there would
+be the error.
+
+Use ".NOTPARALLEL: _gen/gtypes.h _gen/gtypes-body.h" will fix the
+problem.
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ src/Makefile.am |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -293,7 +293,7 @@ _gen/gtypes.h _gen/gtypes-body.h: _gen/mcd.xml \
+ 	$(AM_V_GEN)$(PYTHON) $(top_srcdir)/tools/glib-gtypes-generator.py \
+ 		$< _gen/gtypes mc
+ 
+-
++.NOTPARALLEL: _gen/gtypes.h _gen/gtypes-body.h
+ 
+ # Generated files which must be generated per "class".
+ # (Currently the only "class" is nmc4, but the new API will need "classes"
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.15.0.bb b/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.15.0.bb
index b2736ca..91159e1 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.15.0.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.15.0.bb
@@ -6,7 +6,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499 \
 SECTION = "libs"
 DEPENDS = "libtelepathy dbus-glib gconf libxslt-native"
 
-SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-mission-control/telepathy-mission-control-${PV}.tar.gz"
+SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-mission-control/telepathy-mission-control-${PV}.tar.gz \
+	   file://tmc-Makefile-fix-race.patch \
+	"
+
 SRC_URI[md5sum] = "0efd7d9043f6e189e8ed8111d043b52c"
 SRC_URI[sha256sum] = "88800d1b5f385e94b34721319ff4fe65c493632954d7229b36e57af5b4a7e1b5"
 
-- 
1.7.10.4


