Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T6xUL-0002JM-Qp
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Aug 2012 07:40:22 +0200
Received: by mail-pb0-f47.google.com with SMTP id wy7so2566884pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2012 22:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=/MrdLin9LjIyUpfbn7t2JyRg4GWqolxHigSlzWJ4tPU=;
	b=x9oM2BDCMz0/FGxsvBLQz7YSXxXhLbMmTi4GqSrM0LGdeLm9Hsx6dGnLxsiXiXT5Gi
	4P6WCaWSmyRYfigsbCHh2S+TC6l2TVNlx73OaWVGfpU9ggyywIHz8q96zBYEeyg14WX3
	qQ9DWhUPJJ/czeFgfz4hDYiOPYrL148k/kVBAZfuwvdul3qkWsNegTGnkY8XdNCCEwOk
	BCjCaTUfPKcYkdPWUNpT6Y0hqbAUg7B/7yWTQn1/bGv10HUmQtrPbdCsrDdZKhxQmJlq
	QzuFv4rnrDervJUZ22oxSrX9SxmsO+x8O3Weo6PRm/nbrxl3tlnd0y78i78zKqF2cVCc
	jHHg==
Received: by 10.66.74.100 with SMTP id s4mr7989475pav.27.1346304488854;
	Wed, 29 Aug 2012 22:28:08 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id uy3sm861924pbc.29.2012.08.29.22.28.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 29 Aug 2012 22:28:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Aug 2012 22:27:22 -0700
Message-Id: <dc76f3a290d2ea8cada3bdf448d28b27f0fceb89.1346304324.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <53bbfea3395479cc37ed842b29670758954a64c0.1346304324.git.raj.khem@gmail.com>
References: <53bbfea3395479cc37ed842b29670758954a64c0.1346304324.git.raj.khem@gmail.com>
In-Reply-To: <cover.1346304324.git.raj.khem@gmail.com>
References: <cover.1346304324.git.raj.khem@gmail.com>
Subject: [PATCH 3/3] elfutils: Fix build on uclibc
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
X-List-Received-Date: Thu, 30 Aug 2012 05:40:22 -0000

It depends on libintl so add virtual/libintl to DEPENDS
simplify the overridden statements

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/elfutils/elfutils_0.148.bb |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.148.bb b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
index 90bc308..5d45f3a 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.148.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
@@ -4,9 +4,9 @@ SECTION = "base"
 LICENSE = "(GPL-2+ & Elfutils-Exception)"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3\
                     file://EXCEPTION;md5=570adcb0c1218ab57f2249c67d0ce417"
-DEPENDS = "libtool bzip2 zlib"
+DEPENDS = "libtool bzip2 zlib virtual/libintl"
 
-PR = "r8"
+PR = "r9"
 
 SRC_URI = "https://fedorahosted.org/releases/e/l/elfutils/elfutils-${PV}.tar.bz2"
 
@@ -33,7 +33,7 @@ SRC_URI += "\
 	file://dso-link-change.patch \
 "
 # Only apply when building uclibc based target recipe
-SRC_URI_append_libc-uclibc = " ${@['', 'file://uclibc-support.patch']['${PN}' == '${BPN}']}"
+SRC_URI_append_libc-uclibc = " file://uclibc-support.patch"
 
 # The buildsystem wants to generate 2 .h files from source using a binary it just built,
 # which can not pass the cross compiling, so let's work around it by adding 2 .h files
@@ -47,7 +47,7 @@ inherit autotools gettext
 
 EXTRA_OECONF = "--program-prefix=eu- --without-lzma"
 EXTRA_OECONF_append_virtclass-native = " --without-bzlib"
-EXTRA_OECONF_append_libc-uclibc = " ${@['', '--enable-uclibc']['${PN}' == '${BPN}']}"
+EXTRA_OECONF_append_libc-uclibc = " --enable-uclibc"
 
 do_configure_prepend() {
 	sed -i 's:./i386_gendis:echo\ \#:g' ${S}/libcpu/Makefile.am
-- 
1.7.9.5



