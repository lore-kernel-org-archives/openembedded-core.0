Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BF0FC433EF
	for <webhook@archiver.kernel.org>; Mon, 20 Jun 2022 09:08:46 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.27897.1655716116422391056
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jun 2022 02:08:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pG9uWJCc;
 spf=pass (domain: gmail.com, ip: 209.85.218.51,
 mailfrom: davidegarde2000@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id kq6so19739368ejb.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jun 2022 02:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rXE/8lVkldHHLy/I/I30saoFH8RUyrMIF8QYul6JX+o=;
        b=pG9uWJCc4RQA54QOieLvzrN70Bn+tiG/xJysGy0vnU0euxS5vUiHvM2kzEjjx9AX5c
         +vTe/LlKDo81zCrpYSjuD/VTIwjfQmf9o1sSPmw/A8rMGnC6CsUqBZY99HnfMpI9w3FK
         DHVA1ffA6XmxntFmTDIDQ2i2oHrAnxRgQzFY7e9krRUXKfAzA6Ncuz7jBNtia+nqznWy
         Dl4pIaHvZZjnC/NbZr2wUn6pnlpjpGPh8liBFM5Lll4bKSjwNyjljv2vxW46AIY6k/G+
         /sXtuFpPviNQ8on+8UNqWl6D7wjD3Vloss5LED9da12p58sOSqrCZ1pop5hCp4LB9QuG
         fgvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rXE/8lVkldHHLy/I/I30saoFH8RUyrMIF8QYul6JX+o=;
        b=1XL9ZTU0swC+lSfrHjxE6OSG6HWp43TVPGXRB1QllHl7fBfNWMZKBoYUNO2EZsWyoI
         mTMBMbJqK18wFxLU8JeZA1HbH3DQ8iS3ElIBARaeyh1cFdBTBil3YKTjXHVjuYLXbKny
         DJx7b0z2Y7L5uZSy7FlCsddD/yPrB8BVse2PklGKQTZDhgA6VQul+rq74pogjOthmpOb
         KAkBYdD3hF2kYOyQRE9kpZNi+NsPr1kl4T32YXsVyoMw1izGnWiiJRzvdXAS0lfLtduZ
         +iVDQhOBOp9L3pE9f/+3xKYjue31NLfCZmNsEMULBQEtaD725nvwGnqSLXumrQTVrh8L
         Ab+A==
X-Gm-Message-State: AJIora+jFNBGGT2Geg0Fotd5HX0OzNfOcRhzTZmrpW3WuWMqzC4tcgpl
	nnY7SOUBj3Zc1oL7deSgSIAVKNf/2pg=
X-Google-Smtp-Source: 
 AGRyM1tmUaLO+1VRZVTLCDw9u89rjWaeruBax+M5dNz3kBC7M/o5nO0UpBp6xnAO3C92+RQtfaUWZQ==
X-Received: by 2002:a17:906:bc81:b0:711:c627:7fc with SMTP id
 lv1-20020a170906bc8100b00711c62707fcmr18725302ejb.608.1655716114263;
        Mon, 20 Jun 2022 02:08:34 -0700 (PDT)
Received: from tony3oo3-XPS-13-9370.home
 (host-82-60-178-162.retail.telecomitalia.it. [82.60.178.162])
        by smtp.gmail.com with ESMTPSA id
 l16-20020aa7cad0000000b0043585bb803fsm1336913edt.25.2022.06.20.02.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 02:08:33 -0700 (PDT)
From: Davide Gardenal <davidegarde2000@gmail.com>
X-Google-Original-From: Davide Gardenal <davide.gardenal@huawei.com>
To: openembedded-core@lists.openembedded.org
Cc: Davide Gardenal <davide.gardenal@huawei.com>
Subject: [kirkstone][PATCH][RESEND] efivar: add musl libc compatibility
Date: Mon, 20 Jun 2022 11:08:19 +0200
Message-Id: <20220620090819.84400-1-davide.gardenal@huawei.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jun 2022 09:08:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167088

Backport patch to get efivar working with musl.

Upstream issue:
https://github.com/rhboot/efivar/issues/202

After commit meta-oe/1582f81805ee3114bc1a44bd5cf52d21f96702ca
fwupd gives an error when trying to build with musl because
efivar is not compatible. This fixes the issue.

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
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
2.32.0


