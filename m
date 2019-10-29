Return-Path: <msft.dantran@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 776657FA35
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 21:23:47 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id 71so463991qkl.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 14:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=HD8ykm7SMvGkYGaC4LU57lPuTJmnqwvpGt/mMdZga7Q=;
	b=ml+iPLm6LeVoTZn2FiMVSJW336656yfOTK/JTv5hrEJApJMh7MRsBP7/qzleUeA90y
	kGKJ6jxj++fkBYvAI04ppSUl+Lqv4JUf9tADU1pzH1a5h1aotufztA7il3yNsj+M3kKL
	1qUJEMO7U9PD166aib11SF4zLTzqxOmqE1j4M1i5hgkmq/mKGDB6w3hkPX36YdbDSfjm
	jXZmUhUEd+9lpJ3xqfRDduhIKcw9A7+HgsMHjkWKBTbmzeKVIZmilU4PWzxsJt+1PqM/
	Jt1+H/qtq9tDxjNexr9Ia6qzPUNAEvmx6AfH/0QrJgwJ+DLiFxa6TarNFNZ8Db5qnNuM
	GBcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=HD8ykm7SMvGkYGaC4LU57lPuTJmnqwvpGt/mMdZga7Q=;
	b=XOz63qF9x38565pTRKjDrVpAULrd1SvV+hJbCwACrJ/6/Uu4mz+z1Sjum7WLLtTzFN
	MhrqlYQfmpCaQHl1RY4lgENEcPO5PoXh506PirNpR1X4AGnZk4B09FY+hGIt6c20LxzW
	xXvSRQePMg5PyIAOhVM4GXca6pAPZ4sh9Nt1hACMfQLvUmc60ACUsnL6a7A8eUQ1LwVN
	HjNQZ1yJR/sSVnhqE01WSPHqOdXNX3EvK6GmpEHn2oUmXz+YSjQ+Slftx2MhMVuste3d
	2YCXSmfoi0VghN9Zx0OsnuyH5WSlCog/DLMYE9DqDE/aGPt8EaR54s2T7IzKUl0Hs/tb
	mzcg==
X-Gm-Message-State: APjAAAU+bH9ehdQtV+nNqCoy1YGwjJPOsAncAcV5yaNbvMHXEhrW7+gG
	Qc3Ff3l2pg19hNI3l59qfxNRrUZx
X-Google-Smtp-Source: APXvYqxmSqY9qWroyH4vX4M+ADobOBQahvy6v6tTNSHvCnwAejYpI1owBIy3sD1K8Yfud1m3hBVASw==
X-Received: by 2002:a37:2795:: with SMTP id n143mr1814623qkn.328.1572384227944;
	Tue, 29 Oct 2019 14:23:47 -0700 (PDT)
Received: from
	dantran-yocto-ubuntu18.4z1s34kka3euddhhn33gkqkz1e.cx.internal.cloudapp.net
	([52.167.220.70]) by smtp.gmail.com with ESMTPSA id
	b54sm7667624qta.38.2019.10.29.14.23.47
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 29 Oct 2019 14:23:47 -0700 (PDT)
From: msft.dantran@gmail.com
X-Google-Original-From: dantran@microsoft.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Oct 2019 21:23:41 +0000
Message-Id: <20191029212341.111467-1-dantran@microsoft.com>
X-Mailer: git-send-email 2.17.1
Subject: [thud][PATCH] sudo: Fix CVE-2019-14287
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
X-List-Received-Date: Tue, 29 Oct 2019 21:23:47 -0000

From: Dan Tran <dantran@microsoft.com>

Signed-off-by: Dan Tran <dantran@microsoft.com>
---
 .../sudo/sudo/CVE-2019-14287_p1.patch         | 168 ++++++++++++++++++
 .../sudo/sudo/CVE-2019-14287_p2.patch         |  96 ++++++++++
 meta/recipes-extended/sudo/sudo_1.8.23.bb     |   2 +
 3 files changed, 266 insertions(+)
 create mode 100644 meta/recipes-extended/sudo/sudo/CVE-2019-14287_p1.patch
 create mode 100644 meta/recipes-extended/sudo/sudo/CVE-2019-14287_p2.patch

diff --git a/meta/recipes-extended/sudo/sudo/CVE-2019-14287_p1.patch b/meta/recipes-extended/sudo/sudo/CVE-2019-14287_p1.patch
new file mode 100644
index 0000000000..edcbf7bd88
--- /dev/null
+++ b/meta/recipes-extended/sudo/sudo/CVE-2019-14287_p1.patch
@@ -0,0 +1,168 @@
+Treat an ID of -1 as invalid since that means "no change".
+Fixes CVE-2019-14287.
+Found by Joe Vennix from Apple Information Security.
+
+CVE: CVE-2019-14287
+Upstream-Status: Backport
+[https://www.sudo.ws/repos/sudo/rev/83db8dba09e7]
+
+Index: sudo-1.8.21p2/lib/util/strtoid.c
+===================================================================
+--- sudo-1.8.21p2.orig/lib/util/strtoid.c	2019-10-10 14:31:08.338476078 -0400
++++ sudo-1.8.21p2/lib/util/strtoid.c	2019-10-10 14:31:08.338476078 -0400
+@@ -42,6 +42,27 @@
+ #include "sudo_util.h"
+ 
+ /*
++ * Make sure that the ID ends with a valid separator char.
++ */
++static bool
++valid_separator(const char *p, const char *ep, const char *sep)
++{
++    bool valid = false;
++    debug_decl(valid_separator, SUDO_DEBUG_UTIL)
++
++    if (ep != p) {
++	/* check for valid separator (including '\0') */
++	if (sep == NULL)
++	    sep = "";
++	do {
++	    if (*ep == *sep)
++		valid = true;
++	} while (*sep++ != '\0');
++    }
++    debug_return_bool(valid);
++}
++
++/*
+  * Parse a uid/gid in string form.
+  * If sep is non-NULL, it contains valid separator characters (e.g. comma, space)
+  * If endp is non-NULL it is set to the next char after the ID.
+@@ -55,36 +76,33 @@ sudo_strtoid_v1(const char *p, const cha
+     char *ep;
+     id_t ret = 0;
+     long long llval;
+-    bool valid = false;
+     debug_decl(sudo_strtoid, SUDO_DEBUG_UTIL)
+ 
+     /* skip leading space so we can pick up the sign, if any */
+     while (isspace((unsigned char)*p))
+ 	p++;
+-    if (sep == NULL)
+-	sep = "";
++
++    /* While id_t may be 64-bit signed, uid_t and gid_t are 32-bit unsigned. */
+     errno = 0;
+     llval = strtoll(p, &ep, 10);
+-    if (ep != p) {
+-	/* check for valid separator (including '\0') */
+-	do {
+-	    if (*ep == *sep)
+-		valid = true;
+-	} while (*sep++ != '\0');
++    if ((errno == ERANGE && llval == LLONG_MAX) || llval > (id_t)UINT_MAX) {
++	errno = ERANGE;
++	if (errstr != NULL)
++	    *errstr = N_("value too large");
++	goto done;
+     }
+-    if (!valid) {
++    if ((errno == ERANGE && llval == LLONG_MIN) || llval < INT_MIN) {
++	errno = ERANGE;
+ 	if (errstr != NULL)
+-	    *errstr = N_("invalid value");
+-	errno = EINVAL;
++	    *errstr = N_("value too small");
+ 	goto done;
+     }
+-    if (errno == ERANGE) {
+-	if (errstr != NULL) {
+-	    if (llval == LLONG_MAX)
+-		*errstr = N_("value too large");
+-	    else
+-		*errstr = N_("value too small");
+-	}
++
++    /* Disallow id -1, which means "no change". */
++    if (!valid_separator(p, ep, sep) || llval == -1 || llval == (id_t)UINT_MAX) {
++	if (errstr != NULL)
++	    *errstr = N_("invalid value");
++	errno = EINVAL;
+ 	goto done;
+     }
+     ret = (id_t)llval;
+@@ -101,30 +119,15 @@ sudo_strtoid_v1(const char *p, const cha
+ {
+     char *ep;
+     id_t ret = 0;
+-    bool valid = false;
+     debug_decl(sudo_strtoid, SUDO_DEBUG_UTIL)
+ 
+     /* skip leading space so we can pick up the sign, if any */
+     while (isspace((unsigned char)*p))
+ 	p++;
+-    if (sep == NULL)
+-	sep = "";
++
+     errno = 0;
+     if (*p == '-') {
+ 	long lval = strtol(p, &ep, 10);
+-	if (ep != p) {
+-	    /* check for valid separator (including '\0') */
+-	    do {
+-		if (*ep == *sep)
+-		    valid = true;
+-	    } while (*sep++ != '\0');
+-	}
+-	if (!valid) {
+-	    if (errstr != NULL)
+-		*errstr = N_("invalid value");
+-	    errno = EINVAL;
+-	    goto done;
+-	}
+ 	if ((errno == ERANGE && lval == LONG_MAX) || lval > INT_MAX) {
+ 	    errno = ERANGE;
+ 	    if (errstr != NULL)
+@@ -137,28 +140,31 @@ sudo_strtoid_v1(const char *p, const cha
+ 		*errstr = N_("value too small");
+ 	    goto done;
+ 	}
+-	ret = (id_t)lval;
+-    } else {
+-	unsigned long ulval = strtoul(p, &ep, 10);
+-	if (ep != p) {
+-	    /* check for valid separator (including '\0') */
+-	    do {
+-		if (*ep == *sep)
+-		    valid = true;
+-	    } while (*sep++ != '\0');
+-	}
+-	if (!valid) {
++
++	/* Disallow id -1, which means "no change". */
++	if (!valid_separator(p, ep, sep) || lval == -1) {
+ 	    if (errstr != NULL)
+ 		*errstr = N_("invalid value");
+ 	    errno = EINVAL;
+ 	    goto done;
+ 	}
++	ret = (id_t)lval;
++    } else {
++	unsigned long ulval = strtoul(p, &ep, 10);
+ 	if ((errno == ERANGE && ulval == ULONG_MAX) || ulval > UINT_MAX) {
+ 	    errno = ERANGE;
+ 	    if (errstr != NULL)
+ 		*errstr = N_("value too large");
+ 	    goto done;
+ 	}
++
++	/* Disallow id -1, which means "no change". */
++	if (!valid_separator(p, ep, sep) || ulval == UINT_MAX) {
++	    if (errstr != NULL)
++		*errstr = N_("invalid value");
++	    errno = EINVAL;
++	    goto done;
++	}
+ 	ret = (id_t)ulval;
+     }
+     if (errstr != NULL)
diff --git a/meta/recipes-extended/sudo/sudo/CVE-2019-14287_p2.patch b/meta/recipes-extended/sudo/sudo/CVE-2019-14287_p2.patch
new file mode 100644
index 0000000000..b63a0a4831
--- /dev/null
+++ b/meta/recipes-extended/sudo/sudo/CVE-2019-14287_p2.patch
@@ -0,0 +1,96 @@
+CVE: CVE-2019-14287
+Upstream-Status: Backport
+[https://www.sudo.ws/repos/sudo/rev/db06a8336c09]
+
+Index: sudo-1.8.21p2/lib/util/regress/atofoo/atofoo_test.c
+===================================================================
+--- sudo-1.8.21p2.orig/lib/util/regress/atofoo/atofoo_test.c	2019-10-11 07:11:49.874655384 -0400
++++ sudo-1.8.21p2/lib/util/regress/atofoo/atofoo_test.c	2019-10-11 07:13:07.471005893 -0400
+@@ -24,6 +24,7 @@
+ #else
+ # include "compat/stdbool.h"
+ #endif
++#include <errno.h>
+ 
+ #include "sudo_compat.h"
+ #include "sudo_util.h"
+@@ -78,15 +79,20 @@ static struct strtoid_data {
+     id_t id;
+     const char *sep;
+     const char *ep;
++    int errnum;
+ } strtoid_data[] = {
+-    { "0,1", 0, ",", "," },
+-    { "10", 10, NULL, NULL },
+-    { "-2", -2, NULL, NULL },
++    { "0,1", 0, ",", ",", 0 },
++    { "10", 10, NULL, NULL, 0 },
++    { "-1", 0, NULL, NULL, EINVAL },
++    { "4294967295", 0, NULL, NULL, EINVAL },
++    { "4294967296", 0, NULL, NULL, ERANGE },
++    { "-2147483649", 0, NULL, NULL, ERANGE },
++    { "-2", -2, NULL, NULL, 0 },
+ #if SIZEOF_ID_T != SIZEOF_LONG_LONG
+-    { "-2", 4294967294U, NULL, NULL },
++    { "-2", (id_t)4294967294U, NULL, NULL, 0 },
+ #endif
+-    { "4294967294", 4294967294U, NULL, NULL },
+-    { NULL, 0, NULL, NULL }
++    { "4294967294", (id_t)4294967294U, NULL, NULL, 0 },
++    { NULL, 0, NULL, NULL, 0 }
+ };
+ 
+ static int
+@@ -102,11 +108,23 @@ test_strtoid(int *ntests)
+ 	(*ntests)++;
+ 	errstr = "some error";
+ 	value = sudo_strtoid(d->idstr, d->sep, &ep, &errstr);
+-	if (errstr != NULL) {
+-	    if (d->id != (id_t)-1) {
+-		sudo_warnx_nodebug("FAIL: %s: %s", d->idstr, errstr);
++	if (d->errnum != 0) {
++	    if (errstr == NULL) {
++		sudo_warnx_nodebug("FAIL: %s: missing errstr for errno %d",
++		    d->idstr, d->errnum);
++		errors++;
++	    } else if (value != 0) {
++		sudo_warnx_nodebug("FAIL: %s should return 0 on error",
++		    d->idstr);
++		errors++;
++	    } else if (errno != d->errnum) {
++		sudo_warnx_nodebug("FAIL: %s: errno mismatch, %d != %d",
++		    d->idstr, errno, d->errnum);
+ 		errors++;
+ 	    }
++	} else if (errstr != NULL) {
++	    sudo_warnx_nodebug("FAIL: %s: %s", d->idstr, errstr);
++	    errors++;
+ 	} else if (value != d->id) {
+ 	    sudo_warnx_nodebug("FAIL: %s != %u", d->idstr, (unsigned int)d->id);
+ 	    errors++;
+Index: sudo-1.8.21p2/plugins/sudoers/regress/testsudoers/test5.out.ok
+===================================================================
+--- sudo-1.8.21p2.orig/plugins/sudoers/regress/testsudoers/test5.out.ok	2019-10-11 07:11:49.874655384 -0400
++++ sudo-1.8.21p2/plugins/sudoers/regress/testsudoers/test5.out.ok	2019-10-11 07:11:49.870655365 -0400
+@@ -4,7 +4,7 @@ Parse error in sudoers near line 1.
+ Entries for user root:
+ 
+ Command unmatched
+-testsudoers: test5.inc should be owned by gid 4294967295
++testsudoers: test5.inc should be owned by gid 4294967294
+ Parse error in sudoers near line 1.
+ 
+ Entries for user root:
+Index: sudo-1.8.21p2/plugins/sudoers/regress/testsudoers/test5.sh
+===================================================================
+--- sudo-1.8.21p2.orig/plugins/sudoers/regress/testsudoers/test5.sh	2019-10-11 07:11:49.874655384 -0400
++++ sudo-1.8.21p2/plugins/sudoers/regress/testsudoers/test5.sh	2019-10-11 07:11:49.870655365 -0400
+@@ -24,7 +24,7 @@ EOF
+ 
+ # Test group writable
+ chmod 664 $TESTFILE
+-./testsudoers -U $MYUID -G -1 root id <<EOF
++./testsudoers -U $MYUID -G -2 root id <<EOF
+ #include $TESTFILE
+ EOF
+ 
\ No newline at end of file
diff --git a/meta/recipes-extended/sudo/sudo_1.8.23.bb b/meta/recipes-extended/sudo/sudo_1.8.23.bb
index ce32bd187e..d12cf2d549 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.23.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.23.bb
@@ -3,6 +3,8 @@ require sudo.inc
 SRC_URI = "http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://0001-Include-sys-types.h-for-id_t-definition.patch \
+           file://CVE-2019-14287_p1.patch \
+           file://CVE-2019-14287_p2.patch \
            "
 
 PAM_SRC_URI = "file://sudo.pam"
-- 
2.17.1


