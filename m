Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.7439.1618717391870936673
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Apr 2021 20:43:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: redrectangle.org, ip: 217.70.183.195, mailfrom: robert.joslyn@redrectangle.org)
X-Originating-IP: 173.197.191.182
Received: from localhost.localdomain (rrcs-173-197-191-182.west.biz.rr.com [173.197.191.182])
	(Authenticated sender: robert.joslyn@redrectangle.org)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id B696460002;
	Sun, 18 Apr 2021 03:43:09 +0000 (UTC)
From: "Robert Joslyn" <robert.joslyn@redrectangle.org>
To: openembedded-core@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [PATCH v2 2/3] btrfs-tools: Add PACKAGECONFIG options
Date: Sat, 17 Apr 2021 20:40:40 -0700
Message-Id: <20210418034041.108754-2-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210418034041.108754-1-robert.joslyn@redrectangle.org>
References: <20210418034041.108754-1-robert.joslyn@redrectangle.org>
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
 .../btrfs-tools/btrfs-tools_5.11.1.bb          | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb
index 2ab476a88e..73d0237635 100644
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
 
@@ -22,16 +22,30 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
 
-PACKAGECONFIG ??= "python"
+PACKAGECONFIG ??= " \
+    programs \
+    convert \
+    python \
+    crypto-builtin \
+"
 PACKAGECONFIG[manpages] = "--enable-documentation, --disable-documentation, asciidoc-native xmlto-native"
+PACKAGECONFIG[programs] = "--enable-programs,--disable-programs"
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
 
+EXTRA_OECONF = "--enable-largefile"
 EXTRA_OECONF_append_libc-musl = " --disable-backtrace "
 EXTRA_PYTHON_CFLAGS = "${DEBUG_PREFIX_MAP}"
 EXTRA_PYTHON_CFLAGS_class-native = ""
-- 
2.26.3

