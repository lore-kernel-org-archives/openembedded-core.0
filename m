Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lf0-f46.google.com (mail-lf0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id 2A47A780BD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jul 2017 11:45:37 +0000 (UTC)
Received: by mail-lf0-f46.google.com with SMTP id l13so101187566lfl.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jul 2017 04:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=MXqqhJXEXHgOd0wicb4Dv7BrWYKpsinpAZH5f5Q+B8k=;
	b=C8DYC6eTpQPSYScQdKx8EeZkFtaV8mzrIuaDd1RjhbeNHDG82f6o4PMrAhZZpsEObT
	YrZfxiNA9YTWh/pQ0tiObw3M/pZGOojKEHPpJXVCghdj0CG2+IdqLx3YofO+ll9MPQ8h
	iQyD77lDi30IBkUPegTNDCp1fVqQfdmIj/ESU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=MXqqhJXEXHgOd0wicb4Dv7BrWYKpsinpAZH5f5Q+B8k=;
	b=b2wYgWBZyv9Xr+kv1o5ucvnw7Zv3lxs4nSI+UCKU7kXwNWztqitpoTDW/k4Tiq4hYT
	mRBYHWZBxQSXQaSwEZsxc7oF8YAOLX2yXyfBnGyDGb6MDLRjxCdJjoG78jOUpjkutQug
	WhbNR8AAPtso0RVwuXMS6S8QyyxBi6Y75inBXXb2N9lvuhyCPU5w29ik4QPYkVseDWP5
	9hVrqOH0/DuOyRz8jzOMgYn1U+APA8O+9DIYX+/KalVvLtgQ+40LqjGlsu5hPJNl4JSE
	yvzZqyDGk9A1mi0B90MLA3ffn9tipfnnIck/3359TVT64ba4Zk+0IZWLpG8tjDsHbpm/
	unHg==
X-Gm-Message-State: AIVw111DE4K6zxhLMVVjqAA+M4isfUtmT8eYcvqSDX1nQPoV8D2k/sWY
	T3jj4+vvxVTM4I7HBtTCPg==
X-Received: by 10.46.15.25 with SMTP id 25mr895432ljp.90.1499082338092;
	Mon, 03 Jul 2017 04:45:38 -0700 (PDT)
Received: from localhost.localdomain (a91-156-68-101.elisa-laajakaista.fi.
	[91.156.68.101])
	by smtp.gmail.com with ESMTPSA id 8sm3191545ljw.61.2017.07.03.04.45.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 03 Jul 2017 04:45:36 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Jul 2017 14:45:34 +0300
Message-Id: <20170703114534.27853-1-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.13.0
Cc: Milosz Wasilewski <milosz.wasilewski@linaro.org>
Subject: [PATCH] ltp: syscalls/add_key02: fix for nonempty NULL payload
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
X-List-Received-Date: Mon, 03 Jul 2017 11:45:38 -0000

Add upstream patch to fix syscalls/add_key02 test for nonempty
NULL payload:
https://github.com/linux-test-project/ltp/commit/25045624e941ee76a13febd36187e23c6c435507

Signed-off-by: Milosz Wasilewski <milosz.wasilewski@linaro.org>
Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 ...d_key02-update-to-test-fix-for-nonempty-N.patch | 136 +++++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20170516.bb          |   1 +
 2 files changed, 137 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/ltp/0038-syscalls-add_key02-update-to-test-fix-for-nonempty-N.patch

diff --git a/meta/recipes-extended/ltp/ltp/0038-syscalls-add_key02-update-to-test-fix-for-nonempty-N.patch b/meta/recipes-extended/ltp/ltp/0038-syscalls-add_key02-update-to-test-fix-for-nonempty-N.patch
new file mode 100644
index 0000000000..3759e1fa9f
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0038-syscalls-add_key02-update-to-test-fix-for-nonempty-N.patch
@@ -0,0 +1,136 @@
+From 25045624e941ee76a13febd36187e23c6c435507 Mon Sep 17 00:00:00 2001
+From: Eric Biggers <ebiggers@google.com>
+Date: Mon, 12 Jun 2017 11:55:21 -0700
+Subject: [PATCH 01/39] syscalls/add_key02: update to test fix for nonempty
+ NULL payload
+
+add_key02 was supposed to be a "Basic test for the add_key() syscall",
+but it actually happened to test the obscure case of passing a NULL
+payload with nonzero length.  This case was mishandled by the kernel,
+which either returned EINVAL or crashed with a NULL pointer dereference,
+depending on the key type.  (The former applied to the test, as it used
+the "user" key type.)  The expected behavior in this case is that the
+syscall fail with EFAULT.
+
+Update the test to expect the fixed behavior from v4.12-rc5, and make
+the test more thorough by testing additional key types, including ones
+that caused a NULL pointer dereference in unfixed kernels.
+
+Signed-off-by: Eric Biggers <ebiggers@google.com>
+Upstream-Status: Accepted [https://github.com/linux-test-project/ltp/commit/25045624e941ee76a13febd36187e23c6c435507]
+---
+ testcases/kernel/syscalls/add_key/add_key02.c | 69 ++++++++++++++++++++-------
+ 1 file changed, 51 insertions(+), 18 deletions(-)
+
+diff --git a/testcases/kernel/syscalls/add_key/add_key02.c b/testcases/kernel/syscalls/add_key/add_key02.c
+index 866800d6f..2e3308dcd 100644
+--- a/testcases/kernel/syscalls/add_key/add_key02.c
++++ b/testcases/kernel/syscalls/add_key/add_key02.c
+@@ -1,5 +1,6 @@
+ /******************************************************************************
+  * Copyright (c) Crackerjack Project., 2007				      *
++ * Copyright (c) 2017 Google, Inc.                                            *
+  *									      *
+  * This program is free software;  you can redistribute it and/or modify      *
+  * it under the terms of the GNU General Public License as published by       *
+@@ -18,10 +19,17 @@
+  ******************************************************************************/
+ 
+ /*
+- * Basic test for the add_key() syscall.
++ * Test that the add_key() syscall correctly handles a NULL payload with nonzero
++ * length.  Specifically, it should fail with EFAULT rather than oopsing the
++ * kernel with a NULL pointer dereference or failing with EINVAL, as it did
++ * before (depending on the key type).  This is a regression test for commit
++ * 5649645d725c ("KEYS: fix dereferencing NULL payload with nonzero length").
+  *
+- * History:   Porting from Crackerjack to LTP is done by
+- *	      Manas Kumar Nayak maknayak@in.ibm.com>
++ * Note that none of the key types that exhibited the NULL pointer dereference
++ * are guaranteed to be built into the kernel, so we just test as many as we
++ * can, in the hope of catching one.  We also test with the "user" key type for
++ * good measure, although it was one of the types that failed with EINVAL rather
++ * than dereferencing NULL.
+  */
+ 
+ #include "config.h"
+@@ -33,36 +41,61 @@
+ 
+ #ifdef HAVE_LINUX_KEYCTL_H
+ struct tcase {
+-	char *type;
+-	char *desc;
+-	void *payload;
+-	int plen;
+-	int exp_errno;
++	const char *type;
++	size_t plen;
+ } tcases[] = {
+-	{"user", "firstkey", NULL, 1, EINVAL}
++	/*
++	 * The payload length we test for each key type needs to pass initial
++	 * validation but is otherwise arbitrary.  Note: the "rxrpc_s" key type
++	 * requires a payload of exactly 8 bytes.
++	 */
++	{ "asymmetric",		64 },
++	{ "cifs.idmap",		64 },
++	{ "cifs.spnego",	64 },
++	{ "pkcs7_test",		64 },
++	{ "rxrpc",		64 },
++	{ "rxrpc_s",		 8 },
++	{ "user",		64 },
+ };
+ #endif /* HAVE_LINUX_KEYCTL_H */
+ 
+ static void verify_add_key(unsigned int i)
+ {
+ #ifdef HAVE_LINUX_KEYCTL_H
+-	TEST(tst_syscall(__NR_add_key, tcases[i].type, tcases[i].desc,
+-	                 tcases[i].payload, tcases[i].plen,
+-	                 KEY_SPEC_USER_KEYRING));
++	TEST(tst_syscall(__NR_add_key, tcases[i].type, "abc:def",
++			 NULL, tcases[i].plen, KEY_SPEC_PROCESS_KEYRING));
+ 
+ 	if (TEST_RETURN != -1) {
+-		tst_res(TFAIL, "add_key() passed unexpectedly");
++		tst_res(TFAIL,
++			"add_key() with key type '%s' unexpectedly succeeded",
++			tcases[i].type);
+ 		return;
+ 	}
+ 
+-	if (TEST_ERRNO == tcases[i].exp_errno) {
+-		tst_res(TPASS | TTERRNO, "add_key() failed expectedly");
++	if (TEST_ERRNO == EFAULT) {
++		tst_res(TPASS, "received expected EFAULT with key type '%s'",
++			tcases[i].type);
+ 		return;
+ 	}
+ 
+-	tst_res(TFAIL | TTERRNO,
+-	        "add_key() failed unexpectedly, expected %s",
+-	        tst_strerrno(tcases[i].exp_errno));
++	if (TEST_ERRNO == ENODEV) {
++		tst_res(TCONF, "kernel doesn't support key type '%s'",
++			tcases[i].type);
++		return;
++	}
++
++	/*
++	 * It's possible for the "asymmetric" key type to be supported, but with
++	 * no asymmetric key parsers registered.  In that case, attempting to
++	 * add a key of type asymmetric will fail with EBADMSG.
++	 */
++	if (TEST_ERRNO == EBADMSG && !strcmp(tcases[i].type, "asymmetric")) {
++		tst_res(TCONF, "no asymmetric key parsers are registered");
++		return;
++	}
++
++	tst_res(TFAIL | TTERRNO, "unexpected error with key type '%s'",
++		tcases[i].type);
+ #else
+ 	tst_brk(TCONF, "linux/keyctl.h was missing upon compilation.");
+ #endif /* HAVE_LINUX_KEYCTL_H */
+-- 
+2.13.0
+
diff --git a/meta/recipes-extended/ltp/ltp_20170516.bb b/meta/recipes-extended/ltp/ltp_20170516.bb
index f537d60c15..ac66b09569 100644
--- a/meta/recipes-extended/ltp/ltp_20170516.bb
+++ b/meta/recipes-extended/ltp/ltp_20170516.bb
@@ -51,6 +51,7 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0036-testcases-network-nfsv4-acl-acl1.c-Security-fix-on-s.patch \
            file://0001-dirtyc0w-Include-stdint.h.patch \
            file://0037-faccessat-and-fchmodat-Fix-build-warnings.patch \
+           file://0038-syscalls-add_key02-update-to-test-fix-for-nonempty-N.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.13.0


