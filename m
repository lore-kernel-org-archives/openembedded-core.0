Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SOuqM-0002bu-Pt
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Apr 2012 19:57:03 +0200
Received: by mail-pb0-f47.google.com with SMTP id rq2so3372519pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2012 10:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=vXEZ4hLmabQPywzS85NqPkVsHW89tKbRwMRLJLqZEGU=;
	b=VK5cbl9Jk5XKgAwmKCo5MRSb0tvcw6WoAZJ3KslADERo0oWnvUcMSbLsGnC2IUXWsk
	xLI9UwwRIbDp1s2qySHMI/3CwjmhLBDbZIPSmRPLxWpbzdPWugg+K67kGqihdrE8lXwZ
	kfGPvr1TNVExw2yV/a+aLNvWSjv+StLbqq89UbrVMiVurSCjJJWe4MYnwyQGupkRDuBJ
	CGQqw6sMVBay5VJ0Ek8y1+BYiBqzzp3c5rMNwt1QzWvKARob0CdnbaImi3Jh3cH/3/AW
	+qdpCBnx8To4PJvHvMEzMRPmWjVY3+vMGkoZ2QOThp2eZPdDyHIlw9pSAxmqE13qZqS3
	7Lhg==
Received: by 10.68.224.167 with SMTP id rd7mr26267122pbc.129.1335808042611;
	Mon, 30 Apr 2012 10:47:22 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id sx8sm8239860pbc.53.2012.04.30.10.47.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Apr 2012 10:47:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Apr 2012 10:46:19 -0700
Message-Id: <6e5325b1c0b4a3279b65169ed1feee8536e86cd8.1335807802.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <392442de49633f6d0f3146fb5a86ad25e6c91015.1335807802.git.raj.khem@gmail.com>
References: <392442de49633f6d0f3146fb5a86ad25e6c91015.1335807802.git.raj.khem@gmail.com>
In-Reply-To: <cover.1335807802.git.raj.khem@gmail.com>
References: <cover.1335807802.git.raj.khem@gmail.com>
Subject: [PATCH 04/10] gettext, m4: Add -lrt to LDFLAGS for uclibc
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
X-List-Received-Date: Mon, 30 Apr 2012 17:57:03 -0000

uclibc has recently got posix_spawn implementation
and the implementation resided in librt so we link
-lrt to get the configure tests using uclibc provided
definitions and not the gnu-lib wrappers

Let libintl.a live in -staticdev package

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/gettext/gettext_0.18.1.1.bb |    6 +++---
 meta/recipes-devtools/m4/m4-1.4.16.inc        |    2 +-
 meta/recipes-devtools/m4/m4-1.4.9.inc         |    2 +-
 meta/recipes-devtools/m4/m4.inc               |    2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/gettext/gettext_0.18.1.1.bb b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
index 4664751..5685bbe 100644
--- a/meta/recipes-core/gettext/gettext_0.18.1.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
@@ -5,7 +5,7 @@ SECTION = "libs"
 LICENSE = "GPLv3+ & LGPL-2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-PR = "r11"
+PR = "r12"
 DEPENDS = "libxml2-native gettext-native virtual/libiconv ncurses expat"
 DEPENDS_virtclass-native = "libxml2-native gettext-minimal-native"
 PROVIDES = "virtual/libintl virtual/gettext"
@@ -17,6 +17,7 @@ SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
 SRC_URI_append_libc-uclibc = " file://wchar-uclibc.patch \
                                file://gnulib-uclibc-sched_param-def.patch \
                              "
+LDFLAGS_prepend_libc-uclibc = " -lrt -lpthread "
 
 SRC_URI[md5sum] = "3dd55b952826d2b32f51308f2f91aa89"
 SRC_URI[sha256sum] = "93ac71a7afa5b70c1b1032516663658c51e653087f42a3fc8044752c026443e9"
@@ -72,8 +73,7 @@ FILES_gettext-runtime_append_libc-uclibc = " ${libdir}/libintl.so.* \
 FILES_gettext-runtime-dev += "${libdir}/libasprintf.a \
                       ${includedir}/autosprintf.h \
                      "
-FILES_gettext-runtime-dev_append_libc-uclibc = " ${libdir}/libintl.a \
-                                                 ${libdir}/libintl.so \
+FILES_gettext-runtime-dev_append_libc-uclibc = " ${libdir}/libintl.so \
                                                  ${includedir}/libintl.h \
                                                "
 FILES_gettext-runtime-doc = "${mandir}/man1/gettext.* \
diff --git a/meta/recipes-devtools/m4/m4-1.4.16.inc b/meta/recipes-devtools/m4/m4-1.4.16.inc
index 139193c..1669775 100644
--- a/meta/recipes-devtools/m4/m4-1.4.16.inc
+++ b/meta/recipes-devtools/m4/m4-1.4.16.inc
@@ -5,7 +5,7 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504\
 	            file://examples/COPYING;md5=fbc986d45b3dae6725c29870dd6b669d"
 
-PR = "r2"
+PR = "r3"
 SRC_URI += "file://ac_config_links.patch"
 
 SRC_URI[md5sum] = "a5dfb4f2b7370e9d34293d23fd09b280"
diff --git a/meta/recipes-devtools/m4/m4-1.4.9.inc b/meta/recipes-devtools/m4/m4-1.4.9.inc
index a5d243c..aab2c1e 100644
--- a/meta/recipes-devtools/m4/m4-1.4.9.inc
+++ b/meta/recipes-devtools/m4/m4-1.4.9.inc
@@ -5,7 +5,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe\
 	file://examples/COPYING;md5=1d49bd61dc590f014cae7173b43e3e5c"
 
-PR = "r1"
+PR = "r2"
 SRC_URI += "file://fix_for_circular_dependency.patch"
 
 SRC_URI[md5sum] = "1ba8e147aff5e79bd2bfb983d86b53d5"
diff --git a/meta/recipes-devtools/m4/m4.inc b/meta/recipes-devtools/m4/m4.inc
index a130318..ae101c2 100644
--- a/meta/recipes-devtools/m4/m4.inc
+++ b/meta/recipes-devtools/m4/m4.inc
@@ -6,5 +6,5 @@ GNU M4 also has built-in functions for including files, running shell commands,
 inherit autotools
 
 EXTRA_OEMAKE += "'infodir=${infodir}'"
-
+LDFLAGS_prepend_libc-uclibc = " -lrt "
 SRC_URI = "${GNU_MIRROR}/m4/m4-${PV}.tar.gz"
-- 
1.7.5.4



