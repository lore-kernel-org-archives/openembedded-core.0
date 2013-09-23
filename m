Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A3A88610FB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2013 05:54:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8N5ss0m015961
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Sep 2013 22:54:54 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Sun, 22 Sep 2013 22:54:53 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 23 Sep 2013 01:54:47 -0400
Message-ID: <620b9a68452878b620a520e585cf806db5e8d315.1379906677.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1379906677.git.liezhi.yang@windriver.com>
References: <cover.1379906677.git.liezhi.yang@windriver.com>
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
X-List-Received-Date: Mon, 23 Sep 2013 05:54:52 -0000
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

There was a similar bug in telepathy-glib which was already fixed, we use the
similar patch to fix it here.

[YOCTO #5184]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../tmc-Makefile-fix-race.patch                    |   76 ++++++++++++++++++++
 .../telepathy/telepathy-mission-control_5.15.0.bb  |    4 +-
 2 files changed, 79 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/telepathy/telepathy-mission-control/tmc-Makefile-fix-race.patch

diff --git a/meta/recipes-connectivity/telepathy/telepathy-mission-control/tmc-Makefile-fix-race.patch b/meta/recipes-connectivity/telepathy/telepathy-mission-control/tmc-Makefile-fix-race.patch
new file mode 100644
index 0000000..ece1da6
--- /dev/null
+++ b/meta/recipes-connectivity/telepathy/telepathy-mission-control/tmc-Makefile-fix-race.patch
@@ -0,0 +1,76 @@
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Sun, 22 Sep 2013 23:21:01 -0400
+Subject: [PATCH] src/Makefile.am: fix race issue for _gen/gtypes.h and _gen/gtypes-body.h
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
+There was a similar bug in telepathy-glib which was already fixed, we use the
+similar patch to fix it.
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ src/Makefile.am |   18 +++++++++++++++---
+ 1 file changed, 15 insertions(+), 3 deletions(-)
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -288,7 +288,11 @@ _gen/interfaces-body.h: _gen/mcd.xml \
+ 		$(tools_dir)/glib-interfaces-body-generator.xsl \
+ 		$< > $@
+ 
+-_gen/gtypes.h _gen/gtypes-body.h: _gen/mcd.xml \
++# do nothing, output as a side-effect
++_gen/gtypes.h: _gen/gtypes-body.h
++	@:
++
++_gen/gtypes-body.h: _gen/mcd.xml \
+ 	$(top_srcdir)/tools/glib-gtypes-generator.py
+ 	$(AM_V_GEN)$(PYTHON) $(top_srcdir)/tools/glib-gtypes-generator.py \
+ 		$< _gen/gtypes mc
+@@ -309,7 +313,11 @@ _gen/%.xml: %.xml $(wildcard $(top_srcdir)/xml/*.xml) Makefile.am
+ 	$(AM_V_GEN)$(XSLTPROC) $(XSLTPROCFLAGS) --xinclude $(tools_dir)/identity.xsl \
+ 		$< > $@
+ 
+-_gen/cli-%-body.h _gen/cli-%.h: _gen/%.xml \
++# do nothing, output as a side-effect
++_gen/cli-%.h: _gen/cli-%-body.h
++	@:
++
++_gen/cli-%-body.h: _gen/%.xml \
+ 	$(tools_dir)/glib-client-gen.py Makefile.am
+ 	$(AM_V_GEN)$(PYTHON) $(tools_dir)/glib-client-gen.py \
+ 		--group=`echo $* | tr x- x_` \
+@@ -317,7 +325,11 @@ _gen/cli-%-body.h _gen/cli-%.h: _gen/%.xml \
+ 		--tp-proxy-api=0.7.6 \
+ 		$< Mc_Cli _gen/cli-$*
+ 
+-_gen/svc-%.c _gen/svc-%.h: _gen/%.xml \
++# do nothing, output as a side-effect
++_gen/svc-%.h: _gen/svc-%.c
++	@:
++
++_gen/svc-%.c: _gen/%.xml \
+ 	$(tools_dir)/glib-ginterface-gen.py Makefile.am
+ 	$(AM_V_GEN)$(PYTHON) $(tools_dir)/glib-ginterface-gen.py \
+ 		--filename=_gen/svc-$* \
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.15.0.bb b/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.15.0.bb
index b2736ca..aa776a1 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.15.0.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.15.0.bb
@@ -6,7 +6,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499 \
 SECTION = "libs"
 DEPENDS = "libtelepathy dbus-glib gconf libxslt-native"
 
-SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-mission-control/telepathy-mission-control-${PV}.tar.gz"
+SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-mission-control/telepathy-mission-control-${PV}.tar.gz \
+	file://tmc-Makefile-fix-race.patch \
+	"
 SRC_URI[md5sum] = "0efd7d9043f6e189e8ed8111d043b52c"
 SRC_URI[sha256sum] = "88800d1b5f385e94b34721319ff4fe65c493632954d7229b36e57af5b4a7e1b5"
 
-- 
1.7.10.4


