Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id 776D07325A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 10:19:49 +0000 (UTC)
Received: by mail-qg0-f52.google.com with SMTP id 6so270215500qgy.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 02:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=LWaPBuNeEosDD0oEPfqUUM/9u5ACm3DB4hyWfC0dtRY=;
	b=PQkIERfUCe2fPUP7kYi+drbAKKf+ipS/wF1spLZ9fCQCOPNMZDWsKLPPg4uM72BdKA
	PwJ5yxNOjE1mwRTome8i8aJS3WzWRiBJZgPp90zV+ppsEEkaa0rpyuPcjyPtrQiAci5K
	zj1TCpP95yPOTlczcQ7EgJd8mbQTXXHDuhZNUH+MqJzX+9xGwm2sCNsgAiINIlE6s96h
	XRHFIyNN9WWqt+Yz0VHZtir1uCBMoRS/QOPNh0OicU/VoY3xfyXvu79bVNVFz10TshDo
	y3699nml2PoL9gVrPKzw3p7E2ViUnVaeL5huNENHC+GV6v44ZMBg5DMVPB8Eq2rpUTmg
	9njw==
X-Received: by 10.140.102.14 with SMTP id v14mr77482154qge.48.1452248390060;
	Fri, 08 Jan 2016 02:19:50 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	d129sm48549987qka.31.2016.01.08.02.19.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Jan 2016 02:19:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jan 2016 10:19:02 +0000
Message-Id: <0e17eca4782d600742d8dc041570e81213451a8a.1452248145.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
References: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
In-Reply-To: <cover.1452248145.git.raj.khem@gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
Subject: [PATCH 34/53] elfutils: Fix build with musl
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
X-List-Received-Date: Fri, 08 Jan 2016 10:19:49 -0000

Just compile libelf on musl similar to uclibc
Provide alternatives to glibc assumptions

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...de-alternatives-for-glibc-assumptions-hel.patch | 132 +++++++++++++++++++++
 meta/recipes-devtools/elfutils/elfutils_0.163.bb   |   3 +
 2 files changed, 135 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.163/0001-build-Provide-alternatives-for-glibc-assumptions-hel.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils-0.163/0001-build-Provide-alternatives-for-glibc-assumptions-hel.patch b/meta/recipes-devtools/elfutils/elfutils-0.163/0001-build-Provide-alternatives-for-glibc-assumptions-hel.patch
new file mode 100644
index 0000000..29d9c84
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils-0.163/0001-build-Provide-alternatives-for-glibc-assumptions-hel.patch
@@ -0,0 +1,132 @@
+From 43c2c618d205f4fdffbc8d75217c127c824cdb67 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 31 Dec 2015 06:35:34 +0000
+Subject: [PATCH] build: Provide alternatives for glibc assumptions helps
+ compiling it on musl
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ lib/fixedsizehash.h              | 4 ++--
+ lib/system.h                     | 4 ++++
+ libdwfl/dwfl_build_id_find_elf.c | 2 +-
+ libdwfl/find-debuginfo.c         | 2 +-
+ libelf/elf.h                     | 9 ++++++---
+ libelf/libelf.h                  | 1 +
+ libelf/libelfP.h                 | 1 +
+ 7 files changed, 16 insertions(+), 7 deletions(-)
+
+diff --git a/lib/fixedsizehash.h b/lib/fixedsizehash.h
+index 06ce6a2..566def2 100644
+--- a/lib/fixedsizehash.h
++++ b/lib/fixedsizehash.h
+@@ -30,12 +30,12 @@
+ #include <errno.h>
+ #include <stdlib.h>
+ #include <string.h>
+-#include <sys/cdefs.h>
+ #include <sys/param.h>
+ 
+ #include <system.h>
+ 
+-#define CONCAT(t1,t2) __CONCAT (t1,t2)
++#define CONCAT1(x,y) x##y
++#define CONCAT(x,y) CONCAT1(x,y)
+ 
+ /* Before including this file the following macros must be defined:
+ 
+diff --git a/lib/system.h b/lib/system.h
+index f31cfd0..78b629a 100644
+--- a/lib/system.h
++++ b/lib/system.h
+@@ -49,6 +49,10 @@
+ #else
+ # error "Unknown byte order"
+ #endif
++#ifndef TEMP_FAILURE_RETRY
++#define TEMP_FAILURE_RETRY(x) x
++#define rawmemchr(s,c) memchr((s),(size_t)-1,(c))
++#endif
+ 
+ extern void *xmalloc (size_t) __attribute__ ((__malloc__));
+ extern void *xcalloc (size_t, size_t) __attribute__ ((__malloc__));
+diff --git a/libdwfl/dwfl_build_id_find_elf.c b/libdwfl/dwfl_build_id_find_elf.c
+index 99a5059..a796ef9 100644
+--- a/libdwfl/dwfl_build_id_find_elf.c
++++ b/libdwfl/dwfl_build_id_find_elf.c
+@@ -94,7 +94,7 @@ __libdwfl_open_by_build_id (Dwfl_Module *mod, bool debug, char **file_name,
+ 	{
+ 	  if (*file_name != NULL)
+ 	    free (*file_name);
+-	  *file_name = canonicalize_file_name (name);
++	  *file_name = realpath (name, NULL);
+ 	  if (*file_name == NULL)
+ 	    {
+ 	      *file_name = name;
+diff --git a/libdwfl/find-debuginfo.c b/libdwfl/find-debuginfo.c
+index 1faa494..6932402 100644
+--- a/libdwfl/find-debuginfo.c
++++ b/libdwfl/find-debuginfo.c
+@@ -361,7 +361,7 @@ dwfl_standard_find_debuginfo (Dwfl_Module *mod,
+       /* If FILE_NAME is a symlink, the debug file might be associated
+ 	 with the symlink target name instead.  */
+ 
+-      char *canon = canonicalize_file_name (file_name);
++      char *canon = realpath (file_name, NULL);
+       if (canon != NULL && strcmp (file_name, canon))
+ 	fd = find_debuginfo_in_path (mod, canon,
+ 				     debuglink_file, debuglink_crc,
+diff --git a/libelf/elf.h b/libelf/elf.h
+index aff6edc..0bd4f55 100644
+--- a/libelf/elf.h
++++ b/libelf/elf.h
+@@ -21,7 +21,9 @@
+ 
+ #include <features.h>
+ 
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ 
+ /* Standard ELF types.  */
+ 
+@@ -3552,7 +3554,8 @@ enum
+ 
+ #define R_TILEGX_NUM		130
+ 
+-
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ #endif	/* elf.h */
+diff --git a/libelf/libelf.h b/libelf/libelf.h
+index 5a2b3af..5705e9c 100644
+--- a/libelf/libelf.h
++++ b/libelf/libelf.h
+@@ -29,6 +29,7 @@
+ #ifndef _LIBELF_H
+ #define _LIBELF_H 1
+ 
++#include <fcntl.h>
+ #include <sys/types.h>
+ 
+ /* Get the ELF types.  */
+diff --git a/libelf/libelfP.h b/libelf/libelfP.h
+index 3f4d654..5c811ec 100644
+--- a/libelf/libelfP.h
++++ b/libelf/libelfP.h
+@@ -36,6 +36,7 @@
+ 
+ #include <ar.h>
+ #include <gelf.h>
++#include <libelf.h>
+ 
+ #include <errno.h>
+ #include <stdint.h>
+-- 
+2.6.4
+
diff --git a/meta/recipes-devtools/elfutils/elfutils_0.163.bb b/meta/recipes-devtools/elfutils/elfutils_0.163.bb
index 41bfbdc..0a7dd88 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.163.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.163.bb
@@ -4,6 +4,7 @@ SECTION = "base"
 LICENSE = "(GPLv3 & Elfutils-Exception)"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 DEPENDS = "libtool bzip2 zlib virtual/libintl"
+DEPENDS_append_libc-musl = " argp-standalone "
 
 SRC_URI = "https://fedorahosted.org/releases/e/l/elfutils/${PV}/${BP}.tar.bz2"
 
@@ -37,6 +38,7 @@ SRC_URI += "\
 
 # Only apply when building uclibc based target recipe
 SRC_URI_append_libc-uclibc = " file://uclibc-support-for-elfutils-0.161.patch"
+SRC_URI_append_libc-musl = " file://0001-build-Provide-alternatives-for-glibc-assumptions-hel.patch "
 
 # The buildsystem wants to generate 2 .h files from source using a binary it just built,
 # which can not pass the cross compiling, so let's work around it by adding 2 .h files
@@ -59,6 +61,7 @@ do_install_append() {
 # build only libelf for uclibc case
 
 EXTRA_OEMAKE_libc-uclibc = "-C libelf"
+EXTRA_OEMAKE_libc-musl = "-C libelf"
 EXTRA_OEMAKE_class-native = ""
 EXTRA_OEMAKE_class-nativesdk = ""
 
-- 
2.7.0


