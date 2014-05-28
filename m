Return-Path: <paul.betafive@gmail.com>
Received: from mail-wg0-f50.google.com (unknown [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 443FD66007
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 15:26:56 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id x12so11614201wgg.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 08:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vL1JJNrWqGsi6CVCiUxuDdanoegc342qiQYPbImt3Zs=;
	b=YXpX9ILVMJ2byfUhfhoc+X6zuzfITP+bk2XqxVC+kRTIOFMKEZvZC0L7rUQVeG3VCi
	FfrNjGg3slf6s1etyADI5avcSh0KRrZcIaVLXrWYC+9o3lsVKJ+BPPMB5icOp/Ewivl8
	3foMwegGeATSOnocmWSD4nKsLuKZbMU2W7FnFbUT0JneH+UcBphIzpA9V2RpE4iBUrGD
	0KjMcaZqbqAp6kPBAZTWt2otSnC41IsyN3OgMncxerc1daduPlhNgd1yq+QEqkawPvtF
	0rUuiWKqrlh4Kvj/qq7j7vp8oO4tEptZ3BgzbbHNCj7bHJ5/1IbPuey+7Glf7vurJ8x3
	lmbQ==
X-Received: by 10.194.174.168 with SMTP id bt8mr351389wjc.72.1401290405052;
	Wed, 28 May 2014 08:20:05 -0700 (PDT)
Received: from localhost.localdomain (ygg.betafive.co.uk. [5.9.90.21])
	by mx.google.com with ESMTPSA id
	r15sm17617729wiw.17.2014.05.28.08.20.03 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 28 May 2014 08:20:04 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 May 2014 15:19:50 +0000
Message-Id: <1401290390-5959-3-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1401290390-5959-1-git-send-email-paul@paulbarker.me.uk>
References: <1401290390-5959-1-git-send-email-paul@paulbarker.me.uk>
Subject: [PATCH 2/2] package_ipk.bbclass: Support hierarchical feed
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
X-List-Received-Date: Wed, 28 May 2014 15:26:59 -0000

This patch allows for an optional new layout for ipk feed directories which I've
called a 'hierarchical feed' and is based on how Debian pools package files. It
is disabled by default and is enabled by setting IPK_HIERARCHICAL_FEED to "1".

In the traditional feed layout, package files are placed in <outdir>/<arch>/.
This can lead to several thousand files existing in a single directory which is
often a problem if developers want to upload a package feed to a shared web
hosting provider. For example, in my case, listing files via FTP only shows the
first 2000 files, breaking my scripts which attempt to upload only new and
changed files via FTP.

In the hierarchical feed, package files are written to
<outdir>/<arch>/<pkg_prefix>/<pkg_subdir>, where pkg_prefix is the first letter
of the package file name for non-lib packages or "lib" plus the 4th letter of
the package file name for lib packages (eg, 'l' for less, 'libc' for libc6).
pkg_subdir is the root of the package file name, discarding the version and
architecture parts and the common suffixes '-dbg', '-dev', '-doc', '-staticdev',
'-locale' and '-locale-*' which are listed in meta/conf/bitbake.conf.

This change relies on recent patches to opkg-utils which support hierarchical
package feeds.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta/classes/package_ipk.bbclass     | 27 ++++++++++++++++++++++++++-
 meta/conf/local.conf.sample.extended | 23 +++++++++++++++++++++++
 2 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index 2949d1d..9586e06 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -63,7 +63,32 @@ python do_package_ipk () {
         bb.data.update_data(localdata)
         basedir = os.path.join(os.path.dirname(root))
         arch = localdata.getVar('PACKAGE_ARCH', True)
-        pkgoutdir = "%s/%s" % (outdir, arch)
+
+        if localdata.getVar('IPK_HIERARCHICAL_FEED') == "1":
+            # Spread packages across subdirectories so each isn't too crowded
+            if pkgname.startswith('lib'):
+                pkg_prefix = 'lib' + pkgname[3]
+            else:
+                pkg_prefix = pkgname[0]
+
+            # Keep -dbg, -dev, -doc, -staticdev, -locale and -locale-* packages
+            # together. These package suffixes are taken from the definitions of
+            # PACKAGES and PACKAGES_DYNAMIC in meta/conf/bitbake.conf
+            if pkgname[-4:] in ('-dbg', '-dev', '-doc'):
+                pkg_subdir = pkgname[:-4]
+            elif pkgname.endswith('-staticdev'):
+                pkg_subdir = pkgname[:-10]
+            elif pkgname.endswith('-locale'):
+                pkg_subdir = pkgname[:-7]
+            elif '-locale-' in pkgname:
+                pkg_subdir = pkgname[:pkgname.find('-locale-')]
+            else:
+                pkg_subdir = pkgname
+
+            pkgoutdir = "%s/%s/%s/%s" % (outdir, arch, pkg_prefix, pkg_subdir)
+        else:
+            pkgoutdir = "%s/%s" % (outdir, arch)
+
         bb.utils.mkdirhier(pkgoutdir)
         os.chdir(root)
         cleanupcontrol(root)
diff --git a/meta/conf/local.conf.sample.extended b/meta/conf/local.conf.sample.extended
index a1f2464..e4f596a 100644
--- a/meta/conf/local.conf.sample.extended
+++ b/meta/conf/local.conf.sample.extended
@@ -310,3 +310,26 @@
 #INITRAMFS_IMAGE = "core-image-minimal-initramfs"
 #INITRAMFS_IMAGE_BUNDLE = "1"
 
+#
+# IPK Hierarchical feed
+#
+# In some cases it may be desirable not to have all package files in the same
+# directory. An example would be when package feeds are to be uploaded to a
+# shared webhosting service or transferred to a Windows machine which may have
+# problems with directories containing multiple thousands of files.
+#
+# If the IPK_HIERARCHICAL_FEED variable is set to "1", packages will be split
+# between subdirectories in a similar way to how Debian package feeds are
+# organised. In the hierarchical feed, package files are written to
+# <outdir>/<arch>/<pkg_prefix>/<pkg_subdir>, where pkg_prefix is the first
+# letter of the package file name for non-lib packages or "lib" plus the 4th
+# letter of the package file name for lib packages (eg, 'l' for less, 'libc' for
+# libc6).  pkg_subdir is the root of the package file name, discarding the
+# version and architecture parts and the common suffixes '-dbg', '-dev', '-doc',
+# '-staticdev', '-locale' and '-locale-*' which are listed in
+# meta/conf/bitbake.conf.
+#
+# If IPK_HIERARCHICAL_FEED is unset or set to any other value, the traditional
+# feed layout is used where package files are placed in <outdir>/<arch>/.
+#
+#IPK_HIERARCHICAL_FEED = "1"
-- 
1.9.3


