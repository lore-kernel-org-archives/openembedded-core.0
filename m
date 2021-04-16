Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.5234.1618551518431258885
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 22:38:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: redrectangle.org, ip: 217.70.183.197, mailfrom: robert.joslyn@redrectangle.org)
X-Originating-IP: 173.197.191.182
Received: from localhost.localdomain (rrcs-173-197-191-182.west.biz.rr.com [173.197.191.182])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 4CDF91C0003;
	Fri, 16 Apr 2021 05:38:35 +0000 (UTC)
From: "Robert Joslyn" <robert.joslyn@redrectangle.org>
To: openembedded-core@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [PATCH 2/3] btrfs-tools: Add PACKAGECONFIG options
Date: Thu, 15 Apr 2021 22:37:28 -0700
Message-Id: <20210416053729.1021506-2-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210416053729.1021506-1-robert.joslyn@redrectangle.org>
References: <20210416053729.1021506-1-robert.joslyn@redrectangle.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add options to make it easier to control which features are enabled. All
of these default to enabled by upstream, so keep them enabled to
maintain previous behavior.

The convert option also supports reiserfs, but no recipes exist in the
layer index. Limit the option to ext filesystems until someone cares
enough to make reiserfs recipes.

Remove acl and attr from DEPENDS, as they do not apper to be needed. Add
zlib since it is required.

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 .../btrfs-tools/btrfs-tools_5.11.1.bb         | 26 ++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb
index 2ab476a88e..b875ea1aa1 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = " \
     file://libbtrfsutil/COPYING.LESSER;md5=3000208d539ec061b899bce1d9ce9404 \
 "
 SECTION = "base"
-DEPENDS = "util-linux attr e2fsprogs lzo acl"
+DEPENDS = "lzo util-linux zlib"
 DEPENDS_append_class-target = " udev"
 RDEPENDS_${PN} = "libgcc"
 
@@ -22,17 +22,37 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
 
-PACKAGECONFIG ??= "python"
+PACKAGECONFIG ??= " \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'largefile', d)} \
+    backtrace \
+    programs \
+    shared \
+    convert \
+    python \
+    crypto-builtin \
+"
+PACKAGECONFIG[largefile] = "--enable-largefile,--disable-largefile"
+PACKAGECONFIG[backtrace] = "--enable-backtrace,--disable-backtrace"
 PACKAGECONFIG[manpages] = "--enable-documentation, --disable-documentation, asciidoc-native xmlto-native"
+PACKAGECONFIG[programs] = "--enable-programs,--disable-programs"
+PACKAGECONFIG[shared] = "--enable-shared,--disable-shared"
+PACKAGECONFIG[static] = "--enable-static,--disable-static"
+PACKAGECONFIG[convert] = "--enable-convert --with-convert=ext2,--disable-convert --without-convert,e2fsprogs"
 PACKAGECONFIG[python] = "--enable-python,--disable-python,python3-setuptools-native"
 PACKAGECONFIG[zstd] = "--enable-zstd,--disable-zstd,zstd"
 
+# Pick only one crypto provider
+PACKAGECONFIG[crypto-builtin] = "--with-crypto=builtin"
+PACKAGECONFIG[crypto-libgcrypt] = "--with-crypto=libgcrypt,,libgcrypt"
+PACKAGECONFIG[crypto-libsodium] = "--with-crypto=libsodium,,libsodium"
+PACKAGECONFIG[crypto-libkcapi] = "--with-crypto=libkcapi,,libkcapi"
+
 inherit autotools-brokensep pkgconfig manpages
 inherit ${@bb.utils.contains('PACKAGECONFIG', 'python', 'distutils3-base', '', d)}
 
 CLEANBROKEN = "1"
 
-EXTRA_OECONF_append_libc-musl = " --disable-backtrace "
+PACKAGECONFIG_remove_libc-musl = "backtrace"
 EXTRA_PYTHON_CFLAGS = "${DEBUG_PREFIX_MAP}"
 EXTRA_PYTHON_CFLAGS_class-native = ""
 EXTRA_PYTHON_LDFLAGS = "${LDFLAGS}"
-- 
2.26.3

