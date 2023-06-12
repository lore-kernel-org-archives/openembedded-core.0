Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38A4DC77B7A
	for <webhook@archiver.kernel.org>; Mon, 12 Jun 2023 01:41:40 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.49372.1686534099252726914
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Jun 2023 18:41:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=jCkf0gzv;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-544c0d768b9so2546311a12.0
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Jun 2023 18:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686534098; x=1689126098;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fOgVByJWv0I4u5YaXySRrzbru6MaBYJurp7LZcitqNc=;
        b=jCkf0gzvrk9cURjBPDNUE/4h/jgpVxEd/1IBOxK+VSeC+PRMRs2mCOn2Ibxx8BUwlm
         MFY2Ne7GKD69kk4+R555zKdS9AWgZAs4q3Ixi6cjqJneGTAL1tpjB9gdEcC1KoNtadzr
         EbAm/ml89Rtq+68bKvIiPYC+cKiGtpH1Z1NX4iZd/WmgTVwQFUjPoXIOnSzHLTCCexkQ
         wf4x+fT88rv6Qge4chDRXgQhsWoLqdncZCBFOZlYAQfBHyp1G8vpUHpZs0zwfNMZStnF
         mwnIheQbG9cPnJsTiWUNzDEV2YlaXfeRIs/NQVyjQnZyx2lMrlJjDGvr5sct7o8/VFzp
         vQpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686534098; x=1689126098;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fOgVByJWv0I4u5YaXySRrzbru6MaBYJurp7LZcitqNc=;
        b=cSHIEPRQ9ojNFhAhsi2Xmy/NmKiOkC8fGuMGH1fNHGnqHr4dQXODRTrJEX4/xGa7cU
         nrJSU+kSGpyY481ghk9+0TUODfPF/xKfpqvo/DIkXuBWnJJE6uLLYdYFwNcrK7hH4LKY
         RaEeTY46MCIBbn02hU3JMRYTO/Dfoz2XtuURaePHYslh3tx5RJg3yz3uXB2xfl4lrMK9
         +Fi95vdLa2R6N5vujJCwRwPeR12vZWmiBeoENjUACqvIW025PocPiTbgONHybaNV/xOm
         Znsa7UqTRgoQmBwGEd/9gSNjy5x6SWRx7CI85Uten+78qRCkcQ+yT0OTZf9A/cbzJ3yn
         WCCw==
X-Gm-Message-State: AC+VfDzgyDoM8sW35Bbcb/qWsW68DlHFJxemeC+iLfKvbD7Dk428v7Iw
	UCFnK4FdY0I+DTtkPGA/50tygyckRQ8=
X-Google-Smtp-Source: ACHHUZ4lhRN4F44SlhokOuT4oZ+oSQu6AK6iNDz4jZ3u7N3ctv4bYTk7nLOphpBOffQ7LomXYWcTPQ==
X-Received: by 2002:a17:903:456:b0:1b0:43fb:407f with SMTP id iw22-20020a170903045600b001b043fb407fmr5453463plb.10.1686534098151;
        Sun, 11 Jun 2023 18:41:38 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::eb87])
        by smtp.gmail.com with ESMTPSA id b19-20020a170902ed1300b001b03b1bcf6bsm1482783pld.252.2023.06.11.18.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jun 2023 18:41:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] efivar: Upgrade to tip of trunk
Date: Sun, 11 Jun 2023 18:41:35 -0700
Message-ID: <20230612014135.4149961-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jun 2023 01:41:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182646

Drop all the patches accepted upstream
Additional important changes it fixes build with lld linker

Following changes are brought over from trunk

* 90e88b2 Allow -a to create a non-existent variable
* 9306e0b Allow passing of hex values to -A
* 328f584 Allow overriding PKG_CONFIG
* cfd686d Revamp efi_well_known_* variable handling
* 914c686 Use off_t instead of off64_t
* dd901c1 Fix IPv4 and IPv6 Device Path printing
* c4138d0 efidp_ipv6_addr: fix gateway size
* bfe9a6b format_ipv6_addr_helper(): fix bad port-printing conditional
* 7c39722 format_ipv6_addr_helper: fix dp_type usage
* 9a5e710 File device paths: don't print "File(" or ")"
* bc65d63 Fix glibc 2.36 build (mount.h conflicts)
* 1f24726 LLD: fix detection and remove not needed workarounds
* 01de743 Set LC_ALL=C to force English output from ld
* 26ad685 Adjust dependency for libefivar and libefiboot objects
* ca48d39 src/Makefile: build util.c separately for makeguids
* b23aba1 Remove deprecated --add-needed linker flag
* 6be2cb1 Fix invalid free in main()
* df09b47 efisecdb: do not free optarg
* cece3ff efisecdb: fix build with musl libc
* aab4e9b Fix the -march issue for riscv64
* 15622b7 Avoid format error on i686
* 28789d1 Add `extern "C"` to headers for easier use by C++
* 197a087 Add -T workaround for GNU ld 2.36

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...x-glibc-2.36-build-mount.h-conflicts.patch |  60 ------
 .../0001-Fix-invalid-free-in-main.patch       |  30 ---
 .../0001-Use-off_t-instead-of-off64_t.patch   |  39 ----
 ...uild-util.c-separately-for-makeguids.patch |  38 ----
 .../efisecdb-fix-build-with-musl-libc.patch   | 184 ------------------
 meta/recipes-bsp/efivar/efivar_38.bb          |   8 +-
 6 files changed, 2 insertions(+), 357 deletions(-)
 delete mode 100644 meta/recipes-bsp/efivar/efivar/0001-Fix-glibc-2.36-build-mount.h-conflicts.patch
 delete mode 100644 meta/recipes-bsp/efivar/efivar/0001-Fix-invalid-free-in-main.patch
 delete mode 100644 meta/recipes-bsp/efivar/efivar/0001-Use-off_t-instead-of-off64_t.patch
 delete mode 100644 meta/recipes-bsp/efivar/efivar/0001-src-Makefile-build-util.c-separately-for-makeguids.patch
 delete mode 100644 meta/recipes-bsp/efivar/efivar/efisecdb-fix-build-with-musl-libc.patch

diff --git a/meta/recipes-bsp/efivar/efivar/0001-Fix-glibc-2.36-build-mount.h-conflicts.patch b/meta/recipes-bsp/efivar/efivar/0001-Fix-glibc-2.36-build-mount.h-conflicts.patch
deleted file mode 100644
index 28dadabe6b3..00000000000
--- a/meta/recipes-bsp/efivar/efivar/0001-Fix-glibc-2.36-build-mount.h-conflicts.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 7b0e7ba674321ec1ddd6b9cbb419e5fb44f88bb3 Mon Sep 17 00:00:00 2001
-From: Robbie Harwood <rharwood@redhat.com>
-Date: Thu, 28 Jul 2022 16:11:24 -0400
-Subject: [PATCH] Fix glibc 2.36 build (mount.h conflicts)
-
-glibc has decided that sys/mount.h and linux/mount.h are no longer
-usable at the same time.  This broke the build, since linux/fs.h itself
-includes linux/mount.h.  For now, fix the build by only including
-sys/mount.h where we need it.
-
-See-also: https://sourceware.org/glibc/wiki/Release/2.36#Usage_of_.3Clinux.2Fmount.h.3E_and_.3Csys.2Fmount.h.3E
-Resolves: #227
-
-Upstream-Status: Backport [https://github.com/rhboot/efivar/commit/bc65d63ebf8fe6ac8a099ff15ca200986dba1565]
-Signed-off-by: Robbie Harwood <rharwood@redhat.com>
----
- src/gpt.c   | 1 +
- src/linux.c | 1 +
- src/util.h  | 1 -
- 3 files changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/gpt.c b/src/gpt.c
-index 1eda049..21413c3 100644
---- a/src/gpt.c
-+++ b/src/gpt.c
-@@ -17,6 +17,7 @@
- #include <stdio.h>
- #include <stdlib.h>
- #include <string.h>
-+#include <sys/mount.h>
- #include <sys/param.h>
- #include <sys/stat.h>
- #include <sys/utsname.h>
-diff --git a/src/linux.c b/src/linux.c
-index 47e45ae..1780816 100644
---- a/src/linux.c
-+++ b/src/linux.c
-@@ -20,6 +20,7 @@
- #include <stdbool.h>
- #include <stdio.h>
- #include <sys/ioctl.h>
-+#include <sys/mount.h>
- #include <sys/socket.h>
- #include <sys/sysmacros.h>
- #include <sys/types.h>
-diff --git a/src/util.h b/src/util.h
-index 3300666..1e67e44 100644
---- a/src/util.h
-+++ b/src/util.h
-@@ -23,7 +23,6 @@
- #include <stdio.h>
- #include <string.h>
- #include <sys/ioctl.h>
--#include <sys/mount.h>
- #include <sys/stat.h>
- #include <sys/types.h>
- #include <tgmath.h>
--- 
-2.37.1
-
diff --git a/meta/recipes-bsp/efivar/efivar/0001-Fix-invalid-free-in-main.patch b/meta/recipes-bsp/efivar/efivar/0001-Fix-invalid-free-in-main.patch
deleted file mode 100644
index 7e63df578e2..00000000000
--- a/meta/recipes-bsp/efivar/efivar/0001-Fix-invalid-free-in-main.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 085f027e9e9f1478f68ddda705f83b244ee3bd88 Mon Sep 17 00:00:00 2001
-From: Robbie Harwood <rharwood@redhat.com>
-Date: Mon, 18 Apr 2022 13:08:18 -0400
-Subject: [PATCH] Fix invalid free in main()
-
-data is allocated by mmap() in prepare_data().
-
-Resolves: #173
-Signed-off-by: Robbie Harwood <rharwood@redhat.com>
-Upstream-Status: Backport
-Link: https://github.com/rhboot/efivar/commit/6be2cb1c0139ac177e754b0767abf1ca1533847f
-Signed-off-by: Grygorii Tertychnyi <grygorii.tertychnyi@leica-geosystems.com>
-
----
- src/efivar.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/efivar.c b/src/efivar.c
-index 5cd1eb2bc73c..09f85edd0a38 100644
---- a/src/efivar.c
-+++ b/src/efivar.c
-@@ -633,7 +633,7 @@ int main(int argc, char *argv[])
- 				if (sz < 0)
- 					err(1, "Could not import data from \"%s\"", infile);
- 
--				free(data);
-+				munmap(data, data_size);
- 				data = NULL;
- 				data_size = 0;
- 
diff --git a/meta/recipes-bsp/efivar/efivar/0001-Use-off_t-instead-of-off64_t.patch b/meta/recipes-bsp/efivar/efivar/0001-Use-off_t-instead-of-off64_t.patch
deleted file mode 100644
index f47a4573869..00000000000
--- a/meta/recipes-bsp/efivar/efivar/0001-Use-off_t-instead-of-off64_t.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 1eb0fa531301a5045af1b020fc093c4fcfd38680 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 14 Dec 2022 16:55:51 -0800
-Subject: [PATCH] Use off_t instead of off64_t
-
-Pass _FILE_OFFSET_BITS=64 to ensure 64bit off_t
-
-Upstream-Status: Submitted [https://github.com/rhboot/efivar/pull/237]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/error.c             | 2 +-
- src/include/defaults.mk | 1 +
- 2 files changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/error.c b/src/error.c
-index fcbba0d..9530e22 100644
---- a/src/error.c
-+++ b/src/error.c
-@@ -191,7 +191,7 @@ dbglog_write(void *cookie, const char *buf, size_t size)
- }
- 
- static int
--dbglog_seek(void *cookie UNUSED, off64_t *offset, int whence)
-+dbglog_seek(void *cookie UNUSED, off_t *offset, int whence)
- {
- 	FILE *log = efi_errlog ? efi_errlog : stderr;
- 	int rc;
-diff --git a/src/include/defaults.mk b/src/include/defaults.mk
-index 632b155..95be8be 100644
---- a/src/include/defaults.mk
-+++ b/src/include/defaults.mk
-@@ -34,6 +34,7 @@ CPPFLAGS ?=
- override _CPPFLAGS := $(CPPFLAGS)
- override CPPFLAGS = $(_CPPFLAGS) -DLIBEFIVAR_VERSION=$(VERSION) \
- 	    -D_GNU_SOURCE \
-+	    -D_FILE_OFFSET_BITS=64 \
- 	    -I$(TOPDIR)/src/include/
- CFLAGS ?= $(OPTIMIZE) $(DEBUGINFO) $(WARNINGS) $(ERRORS)
- CFLAGS_GCC ?= -specs=$(TOPDIR)/src/include/gcc.specs \
diff --git a/meta/recipes-bsp/efivar/efivar/0001-src-Makefile-build-util.c-separately-for-makeguids.patch b/meta/recipes-bsp/efivar/efivar/0001-src-Makefile-build-util.c-separately-for-makeguids.patch
deleted file mode 100644
index 02781eb67db..00000000000
--- a/meta/recipes-bsp/efivar/efivar/0001-src-Makefile-build-util.c-separately-for-makeguids.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 80f11fcb46f6b52e13501cb323ca1a849c3f6e88 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Tue, 18 Jan 2022 11:53:41 +0100
-Subject: [PATCH] src/Makefile: build util.c separately for makeguids
-
-util.c needs to be built twice when cross-compiling:
-for the build machine to be able to link with
-makeguids which then runs during the same build,
-and then for the actual target.
-
-Upstream-Status: Submitted [https://github.com/rhboot/efivar/pull/203]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- src/Makefile | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/src/Makefile b/src/Makefile
-index 0e423c4..b10051b 100644
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -28,10 +28,13 @@ EFIVAR_OBJECTS = $(patsubst %.S,%.o,$(patsubst %.c,%.o,$(EFIVAR_SOURCES)))
- EFISECDB_SOURCES = efisecdb.c guid-symbols.c secdb-dump.c util.c
- EFISECDB_OBJECTS = $(patsubst %.S,%.o,$(patsubst %.c,%.o,$(EFISECDB_SOURCES)))
- GENERATED_SOURCES = include/efivar/efivar-guids.h guid-symbols.c
--MAKEGUIDS_SOURCES = makeguids.c util.c
-+MAKEGUIDS_SOURCES = makeguids.c util-makeguids.c
- MAKEGUIDS_OBJECTS = $(patsubst %.S,%.o,$(patsubst %.c,%.o,$(MAKEGUIDS_SOURCES)))
- MAKEGUIDS_OUTPUT = $(GENERATED_SOURCES) guids.lds
- 
-+util-makeguids.c :
-+	cp util.c util-makeguids.c
-+
- ALL_SOURCES=$(LIBEFISEC_SOURCES) $(LIBEFIBOOT_SOURCES) $(LIBEFIVAR_SOURCES) \
- 	    $(MAKEGUIDS_SOURCES) $(GENERATED_SOURCES) $(EFIVAR_SOURCES) \
- 	    $(sort $(wildcard include/efivar/*.h))
--- 
-2.20.1
-
diff --git a/meta/recipes-bsp/efivar/efivar/efisecdb-fix-build-with-musl-libc.patch b/meta/recipes-bsp/efivar/efivar/efisecdb-fix-build-with-musl-libc.patch
deleted file mode 100644
index ec5b285a06c..00000000000
--- a/meta/recipes-bsp/efivar/efivar/efisecdb-fix-build-with-musl-libc.patch
+++ /dev/null
@@ -1,184 +0,0 @@
-From cece3ffd5be2f8641eb694513f2b73e5eb97ffd3 Mon Sep 17 00:00:00 2001
-From: Natanael Copa <ncopa@alpinelinux.org>
-Date: Fri, 28 Jan 2022 12:13:30 +0100
-Subject: [PATCH] efisecdb: fix build with musl libc
-
-Refactor code to use POSIX atexit(3) instead of the GNU specific
-on_exit(3).
-
-Resolves: #197
-Resolves: #202
-Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
-
-Upstream-Status: Backport
-https://github.com/rhboot/efivar/commit/cece3ffd5be2f8641eb694513f2b73e5eb97ffd3
-
-Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
----
- src/compiler.h |  2 --
- src/efisecdb.c | 68 +++++++++++++++++++-------------------------------
- 2 files changed, 26 insertions(+), 44 deletions(-)
-
-diff --git a/src/compiler.h b/src/compiler.h
-index e2f18f0b..d95fb014 100644
---- a/src/compiler.h
-+++ b/src/compiler.h
-@@ -7,8 +7,6 @@
- #ifndef COMPILER_H_
- #define COMPILER_H_
- 
--#include <sys/cdefs.h>
--
- /* GCC version checking borrowed from glibc. */
- #if defined(__GNUC__) && defined(__GNUC_MINOR__)
- #  define GNUC_PREREQ(maj,min) \
-diff --git a/src/efisecdb.c b/src/efisecdb.c
-index f8823737..6bd5ad90 100644
---- a/src/efisecdb.c
-+++ b/src/efisecdb.c
-@@ -25,6 +25,10 @@
- extern char *optarg;
- extern int optind, opterr, optopt;
- 
-+static efi_secdb_t *secdb = NULL;
-+static list_t infiles;
-+static list_t actions;
-+
- struct hash_param {
- 	char *name;
- 	efi_secdb_type_t algorithm;
-@@ -187,12 +191,11 @@ add_action(list_t *list, action_type_t action_type, const efi_guid_t *owner,
- }
- 
- static void
--free_actions(int status UNUSED, void *actionsp)
-+free_actions(void)
- {
--	list_t *actions = (list_t *)actionsp;
- 	list_t *pos, *tmp;
- 
--	for_each_action_safe(pos, tmp, actions) {
-+	for_each_action_safe(pos, tmp, &actions) {
- 		action_t *action = list_entry(pos, action_t, list);
- 
- 		list_del(&action->list);
-@@ -202,12 +205,11 @@ free_actions(int status UNUSED, void *actionsp)
- }
- 
- static void
--free_infiles(int status UNUSED, void *infilesp)
-+free_infiles(void)
- {
--	list_t *infiles = (list_t *)infilesp;
- 	list_t *pos, *tmp;
- 
--	for_each_ptr_safe(pos, tmp, infiles) {
-+	for_each_ptr_safe(pos, tmp, &infiles) {
- 		ptrlist_t *entry = list_entry(pos, ptrlist_t, list);
- 
- 		list_del(&entry->list);
-@@ -216,27 +218,12 @@ free_infiles(int status UNUSED, void *infilesp)
- }
- 
- static void
--maybe_free_secdb(int status UNUSED, void *voidp)
-+maybe_free_secdb(void)
- {
--	efi_secdb_t **secdbp = (efi_secdb_t **)voidp;
--
--	if (secdbp == NULL || *secdbp == NULL)
-+	if (secdb == NULL)
- 		return;
- 
--	efi_secdb_free(*secdbp);
--}
--
--static void
--maybe_do_unlink(int status, void *filep)
--{
--	char **file = (char **)filep;
--
--	if (status == 0)
--		return;
--	if (file == NULL || *file == NULL)
--		return;
--
--	unlink(*file);
-+	efi_secdb_free(secdb);
- }
- 
- static void
-@@ -323,15 +310,6 @@ parse_input_files(list_t *infiles, char **outfile, efi_secdb_t **secdb,
- 	return status;
- }
- 
--/*
-- * These need to be static globals so that they're not on main's stack when
-- * on_exit() fires.
-- */
--static efi_secdb_t *secdb = NULL;
--static list_t infiles;
--static list_t actions;
--static char *outfile = NULL;
--
- int
- main(int argc, char *argv[])
- {
-@@ -351,6 +329,7 @@ main(int argc, char *argv[])
- 	bool do_sort_data = false;
- 	bool sort_descending = false;
- 	int status = 0;
-+	char *outfile = NULL;
- 
- 	const char sopts[] = ":aAc:dfg:h:i:Lo:rs:t:v?";
- 	const struct option lopts[] = {
-@@ -376,10 +355,9 @@ main(int argc, char *argv[])
- 	INIT_LIST_HEAD(&infiles);
- 	INIT_LIST_HEAD(&actions);
- 
--	on_exit(free_actions, &actions);
--	on_exit(free_infiles, &infiles);
--	on_exit(maybe_free_secdb, &secdb);
--	on_exit(maybe_do_unlink, &outfile);
-+	atexit(free_actions);
-+	atexit(free_infiles);
-+	atexit(maybe_free_secdb);
- 
- 	/*
- 	 * parse the command line.
-@@ -587,24 +565,30 @@ main(int argc, char *argv[])
- 	outfd = open(outfile, flags, 0600);
- 	if (outfd < 0) {
- 		char *tmpoutfile = outfile;
--		if (errno == EEXIST)
--			outfile = NULL;
-+		if (errno != EEXIST)
-+			unlink(outfile);
- 		err(1, "could not open \"%s\"", tmpoutfile);
- 	}
- 
- 	rc = ftruncate(outfd, 0);
--	if (rc < 0)
-+	if (rc < 0) {
-+		unlink(outfile);
- 		err(1, "could not truncate output file \"%s\"", outfile);
-+	}
- 
- 	void *output;
- 	size_t size = 0;
- 	rc = efi_secdb_realize(secdb, &output, &size);
--	if (rc < 0)
-+	if (rc < 0) {
-+		unlink(outfile);
- 		secdb_err(1, "could not realize signature list");
-+	}
- 
- 	rc = write(outfd, output, size);
--	if (rc < 0)
-+	if (rc < 0) {
-+		unlink(outfile);
- 		err(1, "could not write signature list");
-+	}
- 
- 	close(outfd);
- 	xfree(output);
diff --git a/meta/recipes-bsp/efivar/efivar_38.bb b/meta/recipes-bsp/efivar/efivar_38.bb
index 55233296995..87a1e665ca6 100644
--- a/meta/recipes-bsp/efivar/efivar_38.bb
+++ b/meta/recipes-bsp/efivar/efivar_38.bb
@@ -9,13 +9,9 @@ COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 
 SRC_URI = "git://github.com/rhinstaller/efivar.git;branch=main;protocol=https \
            file://0001-docs-do-not-build-efisecdb-manpage.patch \
-           file://0001-src-Makefile-build-util.c-separately-for-makeguids.patch \
-           file://efisecdb-fix-build-with-musl-libc.patch \
-           file://0001-Fix-invalid-free-in-main.patch \
-           file://0001-Fix-glibc-2.36-build-mount.h-conflicts.patch \
-           file://0001-Use-off_t-instead-of-off64_t.patch \
            "
-SRCREV = "1753149d4176ebfb2b135ac0aaf79340bf0e7a93"
+SRCREV = "90e88b221e8bc60dc50f3246051369b8f580c0d0"
+PV .= "+39+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-- 
2.41.0


