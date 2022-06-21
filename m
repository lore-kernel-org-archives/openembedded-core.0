Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65C73CCA473
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 23:28:38 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web09.1306.1655854112728814108
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 16:28:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=0b3D8v2h;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id
 w19-20020a17090a8a1300b001ec79064d8dso11770436pjn.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 16:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=mtDnVDwHNSdjB+XDKHdbttBKdux61mziK/znkv4UmUE=;
        b=0b3D8v2h3ziWTmDjaf6Da8nKlNTGPswDdcyytS61P0hJrJVrfoZD6HzRgQ8oAdiuO9
         DKxNzoXuPnGOnBXQPA3HWdO6eegFwPGCI2t1S2EEEMBHfMQvoUqp3K0a4DfKIIsg6XJU
         SkUkNqK9t9FbflPcIaoJBAdMtu877RZRW72TAYR4Y5POenBYQHHCrj4ly/fYy9K+7HGB
         58L8PJ+l48wcRMOTA4lBfWGEomJyLouKxgELIKyz7I/ELpBYwoCRZznVoBNWCmW+CxLy
         ZqTkrI5u9C/kPpcYvAYH/FaKkAVtRun/4xmQB3MwC8vk05YDH2yVykuFBKD5PW49unao
         XiaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mtDnVDwHNSdjB+XDKHdbttBKdux61mziK/znkv4UmUE=;
        b=JGhuMAM0YDAXm3uxj9mPIFac+M7aNyFtEWf/ioix64yd4KjO8OUulMZ5+TuA6s9vBL
         Ljlq1NvX6xTMXVG6Vl+nS4nhyAUZSjHaZCEWlO+LRuCfCRQUwyV+MS4L277XoTHw9cBx
         lKMHWZcBBGeVTXoBG5WbKbDZTYCC6YknakzoJaw/1p4TZub5x5PGpaA559D3MOyun4AW
         SxN/igKOKULbyIhrAQQmz3yfiCz9WcqTwIqW0IOTWCJI+5ffK5VPgZ2Bq7SXevoFGaNZ
         035jlaO320u5GiPdvm9sECroJYYWvzxwtpPc6aassMgltJ5VDFNUySHlAezarvF4D1O2
         nqMg==
X-Gm-Message-State: AJIora9aNKM7CPD+K0J2hlz6ER3W5vwoO3+SQ3am2fP6ySX0NapEGfk8
	M8Fn1SwxNr0oHtRoPLEzd4Ho4DoEnHB16EMk
X-Google-Smtp-Source: 
 AGRyM1sJxBneMfLLKXQZx6UmtgYyTqHdxLgcSYv1a55NZOjS0GWj1nODn7bSaYTAvPDYCGTgzfGuig==
X-Received: by 2002:a17:902:bf04:b0:168:f244:1f37 with SMTP id
 bi4-20020a170902bf0400b00168f2441f37mr31716282plb.106.1655854116068;
        Tue, 21 Jun 2022 16:28:36 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 z9-20020a1709027e8900b0015e8d4eb209sm11323565pla.83.2022.06.21.16.28.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 16:28:35 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/13] efivar: add musl libc compatibility
Date: Tue, 21 Jun 2022 13:27:55 -1000
Message-Id: 
 <a121d2dd5d1e47072cb1419c9cbe9ef345de8e02.1655848177.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655848177.git.steve@sakoman.com>
References: <cover.1655848177.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 23:28:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167199

From: Davide Gardenal <davidegarde2000@gmail.com>

Backport patch to get efivar working with musl.

Upstream issue:
https://github.com/rhboot/efivar/issues/202

After commit meta-oe/1582f81805ee3114bc1a44bd5cf52d21f96702ca
fwupd gives an error when trying to build with musl because
efivar is not compatible. This fixes the issue.

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 005b6aba89eaf1b79fdd7565dd028fdd9bbfcc7d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../efisecdb-fix-build-with-musl-libc.patch   | 184 ++++++++++++++++++
 meta/recipes-bsp/efivar/efivar_38.bb          |   3 +-
 2 files changed, 185 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-bsp/efivar/efivar/efisecdb-fix-build-with-musl-libc.patch

diff --git a/meta/recipes-bsp/efivar/efivar/efisecdb-fix-build-with-musl-libc.patch b/meta/recipes-bsp/efivar/efivar/efisecdb-fix-build-with-musl-libc.patch
new file mode 100644
index 0000000000..ec5b285a06
--- /dev/null
+++ b/meta/recipes-bsp/efivar/efivar/efisecdb-fix-build-with-musl-libc.patch
@@ -0,0 +1,184 @@
+From cece3ffd5be2f8641eb694513f2b73e5eb97ffd3 Mon Sep 17 00:00:00 2001
+From: Natanael Copa <ncopa@alpinelinux.org>
+Date: Fri, 28 Jan 2022 12:13:30 +0100
+Subject: [PATCH] efisecdb: fix build with musl libc
+
+Refactor code to use POSIX atexit(3) instead of the GNU specific
+on_exit(3).
+
+Resolves: #197
+Resolves: #202
+Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
+
+Upstream-Status: Backport
+https://github.com/rhboot/efivar/commit/cece3ffd5be2f8641eb694513f2b73e5eb97ffd3
+
+Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
+---
+ src/compiler.h |  2 --
+ src/efisecdb.c | 68 +++++++++++++++++++-------------------------------
+ 2 files changed, 26 insertions(+), 44 deletions(-)
+
+diff --git a/src/compiler.h b/src/compiler.h
+index e2f18f0b..d95fb014 100644
+--- a/src/compiler.h
++++ b/src/compiler.h
+@@ -7,8 +7,6 @@
+ #ifndef COMPILER_H_
+ #define COMPILER_H_
+ 
+-#include <sys/cdefs.h>
+-
+ /* GCC version checking borrowed from glibc. */
+ #if defined(__GNUC__) && defined(__GNUC_MINOR__)
+ #  define GNUC_PREREQ(maj,min) \
+diff --git a/src/efisecdb.c b/src/efisecdb.c
+index f8823737..6bd5ad90 100644
+--- a/src/efisecdb.c
++++ b/src/efisecdb.c
+@@ -25,6 +25,10 @@
+ extern char *optarg;
+ extern int optind, opterr, optopt;
+ 
++static efi_secdb_t *secdb = NULL;
++static list_t infiles;
++static list_t actions;
++
+ struct hash_param {
+ 	char *name;
+ 	efi_secdb_type_t algorithm;
+@@ -187,12 +191,11 @@ add_action(list_t *list, action_type_t action_type, const efi_guid_t *owner,
+ }
+ 
+ static void
+-free_actions(int status UNUSED, void *actionsp)
++free_actions(void)
+ {
+-	list_t *actions = (list_t *)actionsp;
+ 	list_t *pos, *tmp;
+ 
+-	for_each_action_safe(pos, tmp, actions) {
++	for_each_action_safe(pos, tmp, &actions) {
+ 		action_t *action = list_entry(pos, action_t, list);
+ 
+ 		list_del(&action->list);
+@@ -202,12 +205,11 @@ free_actions(int status UNUSED, void *actionsp)
+ }
+ 
+ static void
+-free_infiles(int status UNUSED, void *infilesp)
++free_infiles(void)
+ {
+-	list_t *infiles = (list_t *)infilesp;
+ 	list_t *pos, *tmp;
+ 
+-	for_each_ptr_safe(pos, tmp, infiles) {
++	for_each_ptr_safe(pos, tmp, &infiles) {
+ 		ptrlist_t *entry = list_entry(pos, ptrlist_t, list);
+ 
+ 		list_del(&entry->list);
+@@ -216,27 +218,12 @@ free_infiles(int status UNUSED, void *infilesp)
+ }
+ 
+ static void
+-maybe_free_secdb(int status UNUSED, void *voidp)
++maybe_free_secdb(void)
+ {
+-	efi_secdb_t **secdbp = (efi_secdb_t **)voidp;
+-
+-	if (secdbp == NULL || *secdbp == NULL)
++	if (secdb == NULL)
+ 		return;
+ 
+-	efi_secdb_free(*secdbp);
+-}
+-
+-static void
+-maybe_do_unlink(int status, void *filep)
+-{
+-	char **file = (char **)filep;
+-
+-	if (status == 0)
+-		return;
+-	if (file == NULL || *file == NULL)
+-		return;
+-
+-	unlink(*file);
++	efi_secdb_free(secdb);
+ }
+ 
+ static void
+@@ -323,15 +310,6 @@ parse_input_files(list_t *infiles, char **outfile, efi_secdb_t **secdb,
+ 	return status;
+ }
+ 
+-/*
+- * These need to be static globals so that they're not on main's stack when
+- * on_exit() fires.
+- */
+-static efi_secdb_t *secdb = NULL;
+-static list_t infiles;
+-static list_t actions;
+-static char *outfile = NULL;
+-
+ int
+ main(int argc, char *argv[])
+ {
+@@ -351,6 +329,7 @@ main(int argc, char *argv[])
+ 	bool do_sort_data = false;
+ 	bool sort_descending = false;
+ 	int status = 0;
++	char *outfile = NULL;
+ 
+ 	const char sopts[] = ":aAc:dfg:h:i:Lo:rs:t:v?";
+ 	const struct option lopts[] = {
+@@ -376,10 +355,9 @@ main(int argc, char *argv[])
+ 	INIT_LIST_HEAD(&infiles);
+ 	INIT_LIST_HEAD(&actions);
+ 
+-	on_exit(free_actions, &actions);
+-	on_exit(free_infiles, &infiles);
+-	on_exit(maybe_free_secdb, &secdb);
+-	on_exit(maybe_do_unlink, &outfile);
++	atexit(free_actions);
++	atexit(free_infiles);
++	atexit(maybe_free_secdb);
+ 
+ 	/*
+ 	 * parse the command line.
+@@ -587,24 +565,30 @@ main(int argc, char *argv[])
+ 	outfd = open(outfile, flags, 0600);
+ 	if (outfd < 0) {
+ 		char *tmpoutfile = outfile;
+-		if (errno == EEXIST)
+-			outfile = NULL;
++		if (errno != EEXIST)
++			unlink(outfile);
+ 		err(1, "could not open \"%s\"", tmpoutfile);
+ 	}
+ 
+ 	rc = ftruncate(outfd, 0);
+-	if (rc < 0)
++	if (rc < 0) {
++		unlink(outfile);
+ 		err(1, "could not truncate output file \"%s\"", outfile);
++	}
+ 
+ 	void *output;
+ 	size_t size = 0;
+ 	rc = efi_secdb_realize(secdb, &output, &size);
+-	if (rc < 0)
++	if (rc < 0) {
++		unlink(outfile);
+ 		secdb_err(1, "could not realize signature list");
++	}
+ 
+ 	rc = write(outfd, output, size);
+-	if (rc < 0)
++	if (rc < 0) {
++		unlink(outfile);
+ 		err(1, "could not write signature list");
++	}
+ 
+ 	close(outfd);
+ 	xfree(output);
diff --git a/meta/recipes-bsp/efivar/efivar_38.bb b/meta/recipes-bsp/efivar/efivar_38.bb
index 68c4b4b914..53fe20a95b 100644
--- a/meta/recipes-bsp/efivar/efivar_38.bb
+++ b/meta/recipes-bsp/efivar/efivar_38.bb
@@ -10,6 +10,7 @@ COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 SRC_URI = "git://github.com/rhinstaller/efivar.git;branch=main;protocol=https \
            file://0001-docs-do-not-build-efisecdb-manpage.patch \
            file://0001-src-Makefile-build-util.c-separately-for-makeguids.patch \
+           file://efisecdb-fix-build-with-musl-libc.patch \
            "
 SRCREV = "1753149d4176ebfb2b135ac0aaf79340bf0e7a93"
 
@@ -36,5 +37,3 @@ BBCLASSEXTEND = "native"
 RRECOMMENDS:${PN}:class-target = "kernel-module-efivarfs"
 
 CLEANBROKEN = "1"
-# https://github.com/rhboot/efivar/issues/202
-COMPATIBLE_HOST:libc-musl = 'null'
-- 
2.25.1


