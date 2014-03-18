Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B9C2B6F8DC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Mar 2014 07:11:57 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2I7BwJX028312
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Mar 2014 00:11:58 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Tue, 18 Mar 2014 00:11:57 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Mar 2014 15:12:08 +0800
Message-ID: <53677fd8cacfc60c12318fc0350603ce25fa9046.1395126624.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1395126624.git.Qi.Chen@windriver.com>
References: <cover.1395126624.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] expect: fix do_install failure on SLED 11.2
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
X-List-Received-Date: Tue, 18 Mar 2014 07:11:57 -0000
Content-Type: text/plain

Previously we were encountering do_install failures on older machines
like SLED 11.2. These machines have relatively lower versions of glibc.

     tclsh8.6: /lib64/libc.so.6: version `GLIBC_2.14' not found

The above failure is due to that fact that we are using the fixline1
tcl script to install commands under the example directory. The purpose
of fixline1 is to ensure that the installed scripts begin with '#!/bin/sh'.
However, the scripts under the example directory have already got
the correct first line. That's why we don't need to modify anything and could
just copy them.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...all-scripts-without-using-the-fixline1-tc.patch |   34 ++++++++++++++++++++
 meta/recipes-devtools/expect/expect_5.45.bb        |    1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-devtools/expect/expect/0001-expect-install-scripts-without-using-the-fixline1-tc.patch

diff --git a/meta/recipes-devtools/expect/expect/0001-expect-install-scripts-without-using-the-fixline1-tc.patch b/meta/recipes-devtools/expect/expect/0001-expect-install-scripts-without-using-the-fixline1-tc.patch
new file mode 100644
index 0000000..274ad86
--- /dev/null
+++ b/meta/recipes-devtools/expect/expect/0001-expect-install-scripts-without-using-the-fixline1-tc.patch
@@ -0,0 +1,34 @@
+Upstream-Status: Inappropriate [wrlinux specific]
+
+Subject: expect: install scripts without using the fixline1 tcl script
+
+On older machines like SLED11.2, we are encountering do_install failures
+complaining that 'GLIBC_2.14' is not found in /lib64/libc.so.6 but is required
+by libtcl8.6.so.0.
+
+This is because that we're executing the fixline1 tcl script which requires
+libtcl8.6.so.0 in sysroot. However, all commands in SCRIPTS already have got
+the correct first line, that is '#!/bin/sh'. We don't need to modify anything.
+That's why we could just copy them.
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ Makefile.in |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index c05c880..f1394ff 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -380,7 +380,7 @@ dist: dist-clean doc
+ 	cp $(DIST_ROOT)/$(PKG_DIR).tar.gz $(top_builddir)
+ 
+ $(SCRIPTS):
+-	$(TCLSH) $(srcdir)/fixline1 $(SHORT_BINDIR) < $(srcdir)/example/$@ > $@
++	cp $(srcdir)/example/$@ $@
+ 
+ ## We cannot use TCL_LIBS below (after TCL_LIB_SPEC) because its
+ ## expansion references the contents of LIBS, which contains linker
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-devtools/expect/expect_5.45.bb b/meta/recipes-devtools/expect/expect_5.45.bb
index 037aaaa..970f4a5 100644
--- a/meta/recipes-devtools/expect/expect_5.45.bb
+++ b/meta/recipes-devtools/expect/expect_5.45.bb
@@ -22,6 +22,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/expect/Expect/${PV}/${BPN}${PV}.tar.gz \
            file://0001-configure.in.patch \
            file://0002-tcl.m4.patch \
            file://01-example-shebang.patch \
+           file://0001-expect-install-scripts-without-using-the-fixline1-tc.patch \
           "
 SRC_URI[md5sum] = "44e1a4f4c877e9ddc5a542dfa7ecc92b"
 SRC_URI[sha256sum] = "b28dca90428a3b30e650525cdc16255d76bb6ccd65d448be53e620d95d5cc040"
-- 
1.7.9.5


