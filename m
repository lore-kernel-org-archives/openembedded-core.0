Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SJmGZ-0005vM-9C
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Apr 2012 15:46:51 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q3GDbPT7022667
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2012 06:37:25 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Mon, 16 Apr 2012 06:37:25 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Apr 2012 21:38:12 +0800
Message-ID: <6d586b1ec34616f2eb4d485c58cf67ad9524d9c7.1334583221.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1334583221.git.liezhi.yang@windriver.com>
References: <cover.1334583221.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] glib-2.0: fix builds on fedora 17
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Apr 2012 13:46:51 -0000
Content-Type: text/plain

Generally distros keep perl at /sur/bin/perl
Fedora 17 also has /bin/perl

this causes glib-2.0 build on such distros to put perl interpreter path in
the perl scripts as /bin/perl

But we set perl location for target as /usr/bin/perl

This mismatch of perl path causes failure of rootfs image creation
like this:

| error: Failed dependencies:
|       /bin/perl is needed by libglib-2.0-utils-2.30.3-r0.ppc603e
NOTE: package meta-toolchain-gmae-1.0-r7: task do_populate_sdk: Failed

[YOCTO #2304]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/glib-2.0/glib-2.0_2.30.3.bb |   12 +++++++++++-
 1 files changed, 11 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.30.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.30.3.bb
index 3b9da89..f1f9217 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.30.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.30.3.bb
@@ -1,6 +1,6 @@
 require glib.inc
 
-PR = "r0"
+PR = "r1"
 PE = "1"
 
 DEPENDS += "libffi python-argparse-native zlib"
@@ -25,6 +25,10 @@ SRC_URI_append_libc-uclibc = " ${@['', 'file://no-iconv.patch']['${PN}' == '${BP
 SRC_URI_append_virtclass-native = " file://glib-gettextize-dir.patch"
 BBCLASSEXTEND = "native nativesdk"
 
+PERLPATH = "${bindir}/env perl"
+PERLPATH_virtclass-native = "/usr/bin/env perl"
+PERLPATH_virtclass-nativesdk = "/usr/bin/env perl"
+
 do_configure_prepend() {
   # missing ${topdir}/gtk-doc.make and --disable-gtk-doc* is not enough, because it calls gtkdocize (not provided by gtk-doc-native)
   sed -i '/^docs/d' ${S}/configure.ac
@@ -39,6 +43,12 @@ do_install_append() {
   # and empty dirs
   rmdir ${D}${libdir}/gio/modules/
   rmdir ${D}${libdir}/gio/
+
+  # Some distros have both /bin/perl and /usr/bin/perl, but we set perl location
+  # for target as /usr/bin/perl, so fix it to /usr/bin/perl.
+  if [ -f ${D}${bindir}/glib-mkenums ]; then
+    sed -i -e '1s,#!.*perl,#! ${PERLPATH},' ${D}${bindir}/glib-mkenums
+  fi
 }
 
 PACKAGES += "${PN}-codegen"
-- 
1.7.1



