Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id 370C67FEE0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2020 17:19:39 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id m24so3341863wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jan 2020 09:19:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qvbTfZAOewJwa71bvZfhbbwDQ73gGR9b3rx7ZEWkQhU=;
	b=zZqEoJQ7hY65rBrGgGtUG62ytVRVjA4l2ILP84mq1y/9K952HMucUTQZt4BKz5v0Bj
	uF1R5pgWZuT8PvwYlcFVhg9h/R6wCHo5R90fPy/3JYr8rRsIjmm/PkA+KsM3WihwiiyZ
	b/QAiul4MiyqUu/hdBa6QZLQ9K36AalG+MCUS+BeL4HyOkJrqlCzltE9WbP2QaIeVK4M
	6FSehAOy82OgWI4eqINj4dbDolEjflgmo3XDIfCNqPZT4U9S6qeoGZvzb2vh/AVPnviU
	9f/J4SWNurEwcpXdjBKu+whR17VXtDPQ60YiPXO65S9JiSvf6MIBNEuy94CgnwKAcQap
	i/Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=qvbTfZAOewJwa71bvZfhbbwDQ73gGR9b3rx7ZEWkQhU=;
	b=QZeEv9NeKoc46UJm7Mzg50zUGvgQFbDfBCseKUIebBESBaxSC+zUqNZ/4rGDqSizCy
	p0DidbVfbR7eikhICqpZ8Ni8osxAGb7qm3sxCKKZKvijEPwVA1twI6MwAtzvqPXZaYXm
	SZLimWnqygvTOx2dFYb14VZgCLPKPRCX/J+fVyY9PfBZM3dfHzfp8XylH23vUkTKc5J3
	NhUo8rNVUd4TMrHYQVYiuUFDvn//D4Nc86Km9zfwlNrpecTpgjdZPoG3pyRQYXJPtd2h
	7NJdF4N3DjyGVRnAHeDwudO7j9SbPOj5iE6P248xiYtb0i+KzKHEc/Uaj7JqQFlx3xPQ
	e/+w==
X-Gm-Message-State: APjAAAUiG0HTtD2DBg6nTNmTdiohsgWAlNksrqCC7v5rNpK+Ix1ODitz
	SePi9U3aP8R4hBJfyZy5iHbfVjz1hPs=
X-Google-Smtp-Source: APXvYqyfRqoVJrxDXO+xqZJDP4wkk9qEZcoU54ucGRx1YuRvivyKeSz0Ok+MBTVMTvrfsEjL8ED81Q==
X-Received: by 2002:a05:600c:214f:: with SMTP id
	v15mr5164477wml.110.1578503980389; 
	Wed, 08 Jan 2020 09:19:40 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id x6sm4398685wmi.44.2020.01.08.09.19.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 08 Jan 2020 09:19:38 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jan 2020 17:19:36 +0000
Message-Id: <20200108171936.14052-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] glib: support target/os/libc-specific Meson cross files
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
X-List-Received-Date: Wed, 08 Jan 2020 17:19:40 -0000
Content-Transfer-Encoding: 8bit

Build systems have a common problem that some tests can only be done by
executing a piece of test code (compared to just compiling or linking test
code).  In a cross-compilation the execution of this code isn't possible and the
Meson solution to this is to allow 'cross properties' to be specified in the
cross files.

GLib has a number of these, for example determining the direction the stack
grows, whether /proc/self/cmdline exists, or the behaviour of snprintf().
Previously we'd passed values for these to the Glib build for target builds, but
this misses out nativesdk builds (which are also cross-compiled) and the fact
that some of these values are specific to the platform, some are specific to the
host OS, and some are specific to the libc implementation.

This problem has already been solved for autotools with the siteinfo class,
which turns the target platform/OS/libc variables into filenames (such as common
common-linux common-glibc).  We can look for these in FILESDIR and use them as
cross files.

Assuming that there are no problems with this appoach it can be moved into
meson.bbclass so that all Meson recipes can use it for their cross files.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../glib-2.0/glib-2.0/meson.cross.d/common    |  3 +++
 .../common-glibc}                             |  5 ----
 .../glib-2.0/meson.cross.d/common-linux       |  5 ++++
 .../glib-2.0/meson.cross.d/common-mingw       |  6 +++++
 .../glib-2.0/meson.cross.d/common-musl        |  6 +++++
 meta/recipes-core/glib-2.0/glib-2.0_2.62.4.bb | 26 ++++++++++++++++++-
 meta/recipes-core/glib-2.0/glib.inc           |  1 -
 7 files changed, 45 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common
 rename meta/recipes-core/glib-2.0/glib-2.0/{glib-meson.cross => meson.cross.d/common-glibc} (56%)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common-linux
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common-mingw
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common-musl

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common b/meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common
new file mode 100644
index 00000000000..0d7c5fa3f8c
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common
@@ -0,0 +1,3 @@
+[properties]
+# On all known supported architectures the stack grows down
+growing_stack = false
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/glib-meson.cross b/meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common-glibc
similarity index 56%
rename from meta/recipes-core/glib-2.0/glib-2.0/glib-meson.cross
rename to meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common-glibc
index 5246c776014..c4648f58c78 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/glib-meson.cross
+++ b/meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common-glibc
@@ -3,8 +3,3 @@ have_c99_vsnprintf = true
 have_c99_snprintf = true
 have_unix98_printf = true
 va_val_copy = true
-growing_stack = false
-have_proc_self_cmdline = true
-
-[binaries]
-env = "/usr/bin/env"
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common-linux b/meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common-linux
new file mode 100644
index 00000000000..83596e0efbb
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common-linux
@@ -0,0 +1,5 @@
+[properties]
+have_proc_self_cmdline = true
+
+[binaries]
+env = "/usr/bin/env"
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common-mingw b/meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common-mingw
new file mode 100644
index 00000000000..75f911ba1ed
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common-mingw
@@ -0,0 +1,6 @@
+[properties]
+have_c99_vsnprintf = false
+have_c99_snprintf = false
+have_unix98_printf = false
+va_val_copy = true
+have_proc_self_cmdline = false
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common-musl b/meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common-musl
new file mode 100644
index 00000000000..3049e5116ec
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/meson.cross.d/common-musl
@@ -0,0 +1,6 @@
+[properties]
+have_c99_vsnprintf = true
+have_c99_snprintf = true
+have_unix98_printf = true
+va_val_copy = true
+have_strlcpy = true
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.62.4.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.62.4.bb
index 7bf8648cade..953fba501a7 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.62.4.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.62.4.bb
@@ -18,7 +18,31 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            "
 
 SRC_URI_append_class-native = " file://relocate-modules.patch"
-SRC_URI_append_class-target = " file://glib-meson.cross"
 
 SRC_URI[md5sum] = "d52234ecba128932bed90bbc3553bfe5"
 SRC_URI[sha256sum] = "4c84030d77fa9712135dfa8036ad663925655ae95b1d19399b6200e869925bbc"
+
+# Find any meson cross files in FILESPATH that are relevant for the current
+# build (using siteinfo) and add them to EXTRA_OEMESON.
+inherit siteinfo
+def find_meson_cross_files(d):
+    if bb.data.inherits_class('native', d):
+        return ""
+
+    import collections
+    sitedata = siteinfo_data(d)
+    # filename -> found
+    files = collections.OrderedDict()
+    for path in d.getVar("FILESPATH").split(":"):
+        for element in sitedata:
+            filename = os.path.join(path, "meson.cross.d", element)
+            files[filename] = os.path.exists(filename)
+
+    items = ["--cross-file=" + k for k,v in files.items() if v]
+    d.appendVar("EXTRA_OEMESON", " " + " ".join(items))
+    items = ["%s:%s" % (k, "True" if v else "False") for k,v in files.items()]
+    d.appendVarFlag("do_configure", "file-checksums", " " + " ".join(items))
+
+python () {
+    find_meson_cross_files(d)
+}
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index e811b42d773..f4aff297e57 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -49,7 +49,6 @@ PACKAGECONFIG[libelf] = ",,elfutils"
 PACKAGECONFIG[tests] = "-Dinstalled_tests=true,-Dinstalled_tests=false,dbus"
 
 EXTRA_OEMESON = "-Ddtrace=false -Dfam=false -Dsystemtap=false -Dselinux=disabled"
-EXTRA_OEMESON_append_class-target = " --cross-file ${WORKDIR}/glib-meson.cross"
 
 do_configure_prepend() {
 	sed -i -e '1s,#!.*,#!${USRBINPATH}/env python3,' ${S}/gio/gdbus-2.0/codegen/gdbus-codegen.in
-- 
2.20.1


