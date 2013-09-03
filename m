Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 33EE26BE4C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2013 12:41:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r83CfwKY018938
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 3 Sep 2013 05:41:58 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Tue, 3 Sep 2013 05:41:58 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 3 Sep 2013 20:37:01 +0800
Message-ID: <728fb0caa9ac238fc47ab26fde47dee491e32ce9.1378207842.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1378207842.git.liezhi.yang@windriver.com>
References: <cover.1378207842.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] glib-2.0: fix a host contamination issue
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
X-List-Received-Date: Tue, 03 Sep 2013 12:41:58 -0000
Content-Type: text/plain

We will see the following warning by accident:

$ bitbake nativesdk-glib-2.0

WARNING: QA Issue: nativesdk-glib-2.0-dbg: found library in wrong location:
/opt/poky/0.5.5/sysroots/x86_64-pokysdk-linux/usr/share/gdb/auto-load/opt/
poky/0.5.5/sysroots/x86_64-pokysdk-linux/usr/lib/libglib-2.0.so.0.3600.4-gdb.py

There are two '/opt/poky/0.5.5/sysroots' in the path when the warning
comes, this is what we need since glib-2.0 has done this intentionally
in its configure and Makefile.

This is because the configure script uses the:
ABS_GLIB_RUNTIME_LIBDIR = "readlink -f $libdir/$with_runtime_libdir`"
to figure out the abs dir, so if
/opt/poky/0.5.5/sysroots/x86_64-pokysdk-linux/usr/lib/ exists , there
would be warning, otherwise no warning.

We can change the "readlink -f" to "readlink -m" to fix the host
contamination issue.

Another fix could be:
ABS_GLIB_RUNTIME_LIBDIR =""

But this is much more like a workaround.

[YOCTO #5099]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../glib-2.0/glib-2.0-configure-readlink.patch     | 29 ++++++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.36.4.bb      |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/glib-2.0-configure-readlink.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/glib-2.0-configure-readlink.patch b/meta/recipes-core/glib-2.0/glib-2.0/glib-2.0-configure-readlink.patch
new file mode 100644
index 0000000..9759d11
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/glib-2.0-configure-readlink.patch
@@ -0,0 +1,29 @@
+configure.ac: change readlink -f to -m
+
+Change "readlink -f" to "readlink -m" since $libdir/$with_runtime_libdir
+may not exist.
+
+This patch should go to the upstream, I will send it sooner.
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+--- a/configure.ac
++++ b/configure.ac
+@@ -271,7 +271,7 @@ AC_ARG_WITH(runtime-libdir,
+            [],
+ 	   [with_runtime_libdir=""])
+ GLIB_RUNTIME_LIBDIR="$with_runtime_libdir"
+-ABS_GLIB_RUNTIME_LIBDIR="`readlink -f $libdir/$with_runtime_libdir`"
++ABS_GLIB_RUNTIME_LIBDIR="`readlink -m $libdir/$with_runtime_libdir`"
+ AC_SUBST(GLIB_RUNTIME_LIBDIR)
+ AC_SUBST(ABS_GLIB_RUNTIME_LIBDIR)
+ AM_CONDITIONAL(HAVE_GLIB_RUNTIME_LIBDIR, [test "x$with_runtime_libdir" != "x"])
+-- 
+1.8.1.2
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.36.4.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.36.4.bb
index 0918bf5..d62c1fd 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.36.4.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.36.4.bb
@@ -15,6 +15,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://Makefile-ptest.patch \
            file://add-march-i486-into-CFLAGS-automatically.patch \
            file://run-ptest \
+           file://glib-2.0-configure-readlink.patch \
           "
 
 SRC_URI_append_class-native = " file://glib-gettextize-dir.patch"
-- 
1.8.1.2


