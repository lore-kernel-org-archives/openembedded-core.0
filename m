Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@bigsur.com>) id 1TOX35-0001M4-FW
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Oct 2012 19:05:01 +0200
Received: by mail-pa0-f47.google.com with SMTP id fa11so6442438pad.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2012 09:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bigsur.com; s=bigsur.com;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=drh5N4YAdLOaoZ0d3cUwKQhCLYqWDEDbOq7UqmdOoGs=;
	b=TO1X64kqqCICInQq3UCSoAKvpdwm01ksfg0tGSzNgjQx045LXwK1xu2KGSFPWXo9Zl
	/1mG3qgF7WiZFv3BozwjKrNFjoJj04BVnneyKx6uQUxdQ4WeS5btaW4Z3plRefHNKnsB
	CZoghaYkADS4yiiIr5qiJRUEW9KuuucJ5fh54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=drh5N4YAdLOaoZ0d3cUwKQhCLYqWDEDbOq7UqmdOoGs=;
	b=MdjjgbcJXT+Uc0KrXwRSVvPR11WR0Y+OfF+QHDywWjwaf0h6oO3oRA4sQPuRbvaTz0
	I4IqxSPfg/VQ7uMBLYgEfRCRDwz1bRNGbccsh5724tIEJUYhCh+EOkq37OpzcUFHbP4o
	qVWET7iv9ZKr/JYJx53/AXdj3eQ/OiEY95RAmYBHaboo4UBtijvFdatuW9HAXUgZWzZk
	r69w2WqNPA8+zKelqvrZunXrM6xETdaJq5E4ewP6qFnxgSqZOGsWljf39uYoZeV6Thiy
	Q1ms4CACBYtfDVzWpGUYeVK1fJlzEdhNArcfo6tvXWwoQ2gaPZVMI5LkPvCtnabpPkWX
	JaWw==
Received: by 10.66.79.166 with SMTP id k6mr52125609pax.25.1350492692188;
	Wed, 17 Oct 2012 09:51:32 -0700 (PDT)
Received: from localhost (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id o5sm12846452paz.32.2012.10.17.09.51.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 17 Oct 2012 09:51:31 -0700 (PDT)
Sender: Saul Wold <sgw@bigsur.com>
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Oct 2012 09:51:15 -0700
Message-Id: <1350492675-29611-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQn1jY81/f5xnxOk1Q3udFEAGUfAviR6TAxD0uo1VdjYjiFS+RYPIA1pl+8tSSK7PqCBo4fM
Subject: [PATCH] qemu: don't ignore libexecdir in configure
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Oct 2012 17:05:02 -0000

This allow the relocation of libexecdir to be done correctly
for the qemu-brigde-helper.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../qemu/qemu-1.2.0/remove-hardcoded-libexec.patch |   41 ++++++++++++++++++++
 .../qemu/qemu-git/remove-hardcoded-libexec.patch   |   41 ++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_1.2.0.bb           |    3 +-
 3 files changed, 84 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu-1.2.0/remove-hardcoded-libexec.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu-git/remove-hardcoded-libexec.patch

diff --git a/meta/recipes-devtools/qemu/qemu-1.2.0/remove-hardcoded-libexec.patch b/meta/recipes-devtools/qemu/qemu-1.2.0/remove-hardcoded-libexec.patch
new file mode 100644
index 0000000..8db460a
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu-1.2.0/remove-hardcoded-libexec.patch
@@ -0,0 +1,41 @@
+This will allow the libexecdir to be set on the command line
+and have the files installed and used from the correct location
+
+Upstream-Status: Inappropriate [oe-core specific]
+
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
+Index: qemu-1.2.0/configure
+===================================================================
+--- qemu-1.2.0.orig/configure
++++ qemu-1.2.0/configure
+@@ -183,6 +183,7 @@ datadir="\${prefix}/share"
+ qemu_docdir="\${prefix}/share/doc/qemu"
+ bindir="\${prefix}/bin"
+ libdir="\${prefix}/lib"
++libexecdir="\${prefix}/libexec"
+ includedir="\${prefix}/include"
+ sysconfdir="\${prefix}/etc"
+ confsuffix="/qemu"
+@@ -644,7 +645,9 @@ for opt do
+   ;;
+   --sysconfdir=*) sysconfdir="$optarg"
+   ;;
+-  --sbindir=*|--libexecdir=*|--sharedstatedir=*|--localstatedir=*|\
++  --libexecdir=*) libexecdir="$optarg"
++  ;;
++  --sbindir=*|--sharedstatedir=*|--localstatedir=*|\
+   --oldincludedir=*|--datarootdir=*|--infodir=*|--localedir=*|\
+   --htmldir=*|--dvidir=*|--pdfdir=*|--psdir=*)
+     # These switches are silently ignored, for compatibility with
+@@ -3190,8 +3193,8 @@ echo "sysconfdir=$sysconfdir" >> $config
+ echo "qemu_confdir=$qemu_confdir" >> $config_host_mak
+ echo "qemu_datadir=$qemu_datadir" >> $config_host_mak
+ echo "qemu_docdir=$qemu_docdir" >> $config_host_mak
+-echo "libexecdir=\${prefix}/libexec" >> $config_host_mak
+-echo "CONFIG_QEMU_HELPERDIR=\"$prefix/libexec\"" >> $config_host_mak
++echo "libexecdir=$libexecdir" >> $config_host_mak
++echo "CONFIG_QEMU_HELPERDIR=\"$libexecdir\"" >> $config_host_mak
+ 
+ echo "ARCH=$ARCH" >> $config_host_mak
+ if test "$debug_tcg" = "yes" ; then
diff --git a/meta/recipes-devtools/qemu/qemu-git/remove-hardcoded-libexec.patch b/meta/recipes-devtools/qemu/qemu-git/remove-hardcoded-libexec.patch
new file mode 100644
index 0000000..83f5463
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu-git/remove-hardcoded-libexec.patch
@@ -0,0 +1,41 @@
+This will allow the libexecdir to be set on the command line
+and have the files installed and used from the correct location
+
+Upstream-Status: Inappropriate [oe-core specific]
+
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
+Index: qemu-1.2.0/configure
+===================================================================
+--- qemu-1.2.0.orig/configure
++++ qemu-1.2.0/configure
+@@ -183,6 +183,7 @@ datadir="\${prefix}/share"
+ qemu_docdir="\${prefix}/share/doc/qemu"
+ bindir="\${prefix}/bin"
+ libdir="\${prefix}/lib"
++libexecdir="\${prefix}/libexec"
+ includedir="\${prefix}/include"
+ sysconfdir="\${prefix}/etc"
+ confsuffix="/qemu"
+@@ -644,7 +645,9 @@ for opt do
+   ;;
+   --sysconfdir=*) sysconfdir="$optarg"
+   ;;
+-  --sbindir=*|--libexecdir=*|--sharedstatedir=*|--localstatedir=*|\
++  --libexecdir=*) libexecdir="$optarg"
++  ;;
++  --sbindir=*|--sharedstatedir=*|--localstatedir=*|\
+   --oldincludedir=*|--datarootdir=*|--infodir=*|--localedir=*|\
+   --htmldir=*|--dvidir=*|--pdfdir=*|--psdir=*)
+     # These switches are silently ignored, for compatibility with
+@@ -3190,8 +3193,8 @@ echo "sysconfdir=$sysconfdir" >> $config
+ echo "qemu_confdir=$qemu_confdir" >> $config_host_mak
+ echo "qemu_datadir=$qemu_datadir" >> $config_host_mak
+ echo "qemu_docdir=$qemu_docdir" >> $config_host_mak
+-echo "libexecdir=\${prefix}/libexec" >> $config_host_mak
+-echo "CONFIG_QEMU_HELPERDIR=\"$prefix/libexec\"" >> $config_host_mak
++echo "libexecdir=$libexecdir" >> $config_host_mak
++echo "CONFIG_QEMU_HELPERDIR=$libexecdir" >> $config_host_mak
+ 
+ echo "ARCH=$ARCH" >> $config_host_mak
+ if test "$debug_tcg" = "yes" ; then
diff --git a/meta/recipes-devtools/qemu/qemu_1.2.0.bb b/meta/recipes-devtools/qemu/qemu_1.2.0.bb
index 517a74b..5cc142a 100644
--- a/meta/recipes-devtools/qemu/qemu_1.2.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_1.2.0.bb
@@ -13,11 +13,12 @@ SRC_URI = "\
     file://fallback-to-safe-mmap_min_addr.patch \
     file://larger_default_ram_size.patch \
     file://arm-bgr.patch \
+    file://remove-hardcoded-libexec.patch \
     "
 SRC_URI[md5sum] = "78eb1e984f4532aa9f2bdd3c127b5b61"
 SRC_URI[sha256sum] = "c8b84420d9f4869397f84cad2dabd9a475b7723d619a924a873740353e9df936"
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI_append_virtclass-nativesdk = "\
     file://relocatable_sdk.patch \
-- 
1.7.9.5



