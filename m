Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A0C1C433EF
	for <webhook@archiver.kernel.org>; Tue, 24 May 2022 08:04:25 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web09.6754.1653379462013250145
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 May 2022 01:04:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HKlwkPG5;
 spf=pass (domain: gmail.com, ip: 209.85.218.49,
 mailfrom: davidegarde2000@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id rq11so11547234ejc.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 24 May 2022 01:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rXE/8lVkldHHLy/I/I30saoFH8RUyrMIF8QYul6JX+o=;
        b=HKlwkPG5WYYxzuias75n540j7ZPhzrEHJo/0IUdU5DzXLp7t7Mr6T1iFWMQlq1xgjw
         HzwKYfiSeBDLNowpq2c8Vb4I0x6naPUAE6tc1HyW8LDFneXqM77Lrl5hmbJthMWXQ3gP
         t3byyFPOyHh+y3hhQySsJ3EYtbNodRs7Ng4qWOp4/ZJZQ+35jCeawzYu2JphNAJYeo2x
         Ub0REkuJOH5QlHqrCnLCofbesl/5ThgGcj1rqSDAskK3yy5c9J55yZs6oQYY/YuPEKNX
         H2azorntFTmUQPtXmxwZSNJbEk321yilGfpHbegFC8F8ywLZAqEd1cG1sWl59ezpCEYw
         HpWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rXE/8lVkldHHLy/I/I30saoFH8RUyrMIF8QYul6JX+o=;
        b=zf8ivJ4odulUnnYEahPsNenygDWZBdlkHxcP2dSbssINeJQXLybPvRp3ioVXDnZg0M
         DFYWnUN3l1WK6+wTntr41E9nyho8c6vEijx0Jj4SepiPIG/8RNB1nMGmzGUEnJr65fMH
         hrj7Yw2vOkZ/WjBAnnig2zgf+BAJeYK+iy9YVuutJturFzRMbFhhWNE/EvM4hD1fVD2D
         FgoDVBvmnistsozs7Y/58eorLRxo4vooFFNA9p5Blr4NqHY6UewqwdCGtETsmBIJFdOY
         Ihl+qyiQiQ2gf3nHrrcvDxQQJVVL86tNEGYcbxNIfu1e+Df68OvikFzYvXLE2gG5v02Y
         AXrg==
X-Gm-Message-State: AOAM533clEp4HvDYO9zURbXLl4ZVROev4CkwIHXC55Pp/F2LuqmFsDzH
	nUbHzSQFECD4vXSbb+0nz5dc04xMnwQ=
X-Google-Smtp-Source: 
 ABdhPJzCfzv6kJQqMOtoPajfZczbJYbCPwQJAcpEs5c7t+980HLVog55piuuEOCNzUhUGZkmuNk1Tg==
X-Received: by 2002:a17:907:3f16:b0:6fe:d885:181f with SMTP id
 hq22-20020a1709073f1600b006fed885181fmr8912184ejc.26.1653379459815;
        Tue, 24 May 2022 01:04:19 -0700 (PDT)
Received: from tony3oo3-XPS-13-9370.home
 (host-82-60-178-153.retail.telecomitalia.it. [82.60.178.153])
        by smtp.gmail.com with ESMTPSA id
 fj11-20020a1709069c8b00b006ff05d4726esm332213ejc.50.2022.05.24.01.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 May 2022 01:04:19 -0700 (PDT)
From: Davide Gardenal <davidegarde2000@gmail.com>
X-Google-Original-From: Davide Gardenal <davide.gardenal@huawei.com>
To: openembedded-core@lists.openembedded.org
Cc: Davide Gardenal <davide.gardenal@huawei.com>
Subject: [master][kirkstone][PATCH] efivar: add musl libc compatibility
Date: Tue, 24 May 2022 10:04:00 +0200
Message-Id: <20220524080400.293037-1-davide.gardenal@huawei.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 May 2022 08:04:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166048

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


