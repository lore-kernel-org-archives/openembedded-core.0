Return-Path: <akuster808@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id BBFEC7FB11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 09:47:56 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id v9so12862340wrq.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 02:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=vrigxfSAYOGDh2CKv4URFP79St1Q7gQR1EJF2sixJ6w=;
	b=Rr6NUpJK5zZikWL5ezrtlQz2ppgDkX9jDVxaBbO/JSIy6aF2F4ULpwR01awzSZuF2X
	XZWqUVTn0W0P/oTvgjFTN4Xqd4/LIy8I4lC+37Eh4xeDmB9rfC2xVb82VTGdaRvE0qqY
	zSx2kq/2bxGv7iAET+zETgwU33fY8ShZZ3NfH2FPowLya4MsjAa0QkPSF1YDvr0V1dS4
	CA8X94pKzTyRdfe1S7/fXQ5iJao/VijLAg5NdvNNJhi1xG2S7ZW1MOLT6yGqkcLuPDc6
	PBZJ1CqmWZOhDurNbllrjS1NPLBVGMLddBENn9FM9kM4LpWP/frSV64p2fVGJgnQGaDW
	c/xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=vrigxfSAYOGDh2CKv4URFP79St1Q7gQR1EJF2sixJ6w=;
	b=Q7cO+XCfFP4MwjNwK+Qv+Topvgwk6i88jfcUiJ02tADM9LLLb4hzq+51RxXnhA/9M4
	PuUYx3zu8Jl2qAGl29ybxYZDIM6fMm8qsWHGFYUGvME38M7eYk/J5fy+Zl97y8hqf8CO
	Xd80IiGlfvAdTgCEihLG7Z+IjKeGajSGG5woi/fqJl1hCgWAVifji6/g0EP+oLIIVkCi
	LZ4planl+hszY+a2LasaB+lbEqN0vGSuV2D192vE6HZCeNlu8MP3t1R7y2kN2snCPs4u
	DzNpoOOmCdUqo7g26mGNtfYNoMBZWbYUiGG+EqFTOBo+aHgqvU/T+Owra1FK3XkoFz75
	xRDw==
X-Gm-Message-State: APjAAAVh/Rk2ESe+S+Vb/tERf1FXHn6SUgWDEZ9Fh2zfdKPP81WK/AEb
	gpFUeFrwRys7BHCuhXvhtJZN9ZmUYjs=
X-Google-Smtp-Source: APXvYqzI/pNxeurvwbJDEM/0sHFYtsnne8AL8HK7BGHHyqO7JcMhIrHc/trYGCciE0+Ut34tdM2ZbQ==
X-Received: by 2002:adf:f087:: with SMTP id n7mr18543341wro.1.1572342477035;
	Tue, 29 Oct 2019 02:47:57 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com ([91.217.168.176])
	by smtp.gmail.com with ESMTPSA id
	36sm29150537wrj.42.2019.10.29.02.47.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 29 Oct 2019 02:47:56 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Oct 2019 10:47:30 +0100
Message-Id: <dfa456ca5ed879794cff7822a0e64955995e0b85.1572341125.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1572341125.git.akuster808@gmail.com>
References: <cover.1572341125.git.akuster808@gmail.com>
Subject: [warrior 17/19] sudo: fix CVE-2019-14287
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
X-List-Received-Date: Tue, 29 Oct 2019 09:47:58 -0000

From: Changqing Li <changqing.li@windriver.com>

In Sudo before 1.8.28, an attacker with access to a Runas ALL sudoer
account can bypass certain policy blacklists and session PAM modules,
and can cause incorrect logging, by invoking sudo with a crafted user
ID. For example, this allows bypass of !root configuration, and USER=
logging, for a "sudo -u \#$((0xffffffff))" command.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4e11cd561f2bdaa6807cf02ee7c9870881826308)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit b1e0149c41e3c344a0496e64ab3b0c9dd4685ea4)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../sudo/sudo/CVE-2019-14287-1.patch               | 178 +++++++++++++++++++++
 .../sudo/sudo/CVE-2019-14287-2.patch               | 112 +++++++++++++
 meta/recipes-extended/sudo/sudo_1.8.27.bb          |   2 +
 3 files changed, 292 insertions(+)
 create mode 100644 meta/recipes-extended/sudo/sudo/CVE-2019-14287-1.patch
 create mode 100644 meta/recipes-extended/sudo/sudo/CVE-2019-14287-2.patch

diff --git a/meta/recipes-extended/sudo/sudo/CVE-2019-14287-1.patch b/meta/recipes-extended/sudo/sudo/CVE-2019-14287-1.patch
new file mode 100644
index 0000000..2a11e3f
--- /dev/null
+++ b/meta/recipes-extended/sudo/sudo/CVE-2019-14287-1.patch
@@ -0,0 +1,178 @@
+From f752ae5cee163253730ff7cdf293e34a91aa5520 Mon Sep 17 00:00:00 2001
+From: "Todd C. Miller" <Todd.Miller@sudo.ws>
+Date: Thu, 10 Oct 2019 10:04:13 -0600
+Subject: [PATCH] Treat an ID of -1 as invalid since that means "no change".
+ Fixes CVE-2019-14287. Found by Joe Vennix from Apple Information Security.
+
+Upstream-Status: Backport [https://github.com/sudo-project/sudo/commit/f752ae5cee163253730ff7cdf293e34a91aa5520]
+CVE: CVE-2019-14287
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
+---
+ lib/util/strtoid.c | 100 ++++++++++++++++++++++++++++-------------------------
+ 1 files changed, 53 insertions(+), 46 deletions(-)
+
+diff --git a/lib/util/strtoid.c b/lib/util/strtoid.c
+index 2dfce75..6b3916b 100644
+--- a/lib/util/strtoid.c
++++ b/lib/util/strtoid.c
+@@ -49,6 +49,27 @@
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
+@@ -62,36 +83,33 @@ sudo_strtoid_v1(const char *p, const char *sep, char **endp, const char **errstr
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
+@@ -108,30 +126,15 @@ sudo_strtoid_v1(const char *p, const char *sep, char **endp, const char **errstr
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
+@@ -144,28 +147,31 @@ sudo_strtoid_v1(const char *p, const char *sep, char **endp, const char **errstr
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
+-- 
+2.7.4
+
diff --git a/meta/recipes-extended/sudo/sudo/CVE-2019-14287-2.patch b/meta/recipes-extended/sudo/sudo/CVE-2019-14287-2.patch
new file mode 100644
index 0000000..453a8b0
--- /dev/null
+++ b/meta/recipes-extended/sudo/sudo/CVE-2019-14287-2.patch
@@ -0,0 +1,112 @@
+From 396bc57feff3e360007634f62448b64e0626390c Mon Sep 17 00:00:00 2001
+From: "Todd C. Miller" <Todd.Miller@sudo.ws>
+Date: Thu, 10 Oct 2019 10:04:13 -0600
+Subject: [PATCH] Add sudo_strtoid() tests for -1 and range errors. Also adjust
+ testsudoers/test5 which relied upon gid -1 parsing.
+
+Upstream-Status: Backport [https://github.com/sudo-project/sudo/commit/396bc57]
+CVE: CVE-2019-14287
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
+---
+ lib/util/regress/atofoo/atofoo_test.c            | 36 ++++++++++++++++------
+ plugins/sudoers/regress/testsudoers/test5.out.ok |  2 +-
+ plugins/sudoers/regress/testsudoers/test5.sh     |  2 +-
+ 3 files changed, 29 insertions(+), 11 deletions(-)
+
+diff --git a/lib/util/regress/atofoo/atofoo_test.c b/lib/util/regress/atofoo/atofoo_test.c
+index 031a7ed..fb41c1a 100644
+--- a/lib/util/regress/atofoo/atofoo_test.c
++++ b/lib/util/regress/atofoo/atofoo_test.c
+@@ -26,6 +26,7 @@
+ #else
+ # include "compat/stdbool.h"
+ #endif
++#include <errno.h>
+ 
+ #include "sudo_compat.h"
+ #include "sudo_util.h"
+@@ -80,15 +81,20 @@ static struct strtoid_data {
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
+-    { "-2", (id_t)4294967294U, NULL, NULL },
++    { "-2", (id_t)4294967294U, NULL, NULL, 0 },
+ #endif
+-    { "4294967294", (id_t)4294967294U, NULL, NULL },
+-    { NULL, 0, NULL, NULL }
++    { "4294967294", (id_t)4294967294U, NULL, NULL, 0 },
++    { NULL, 0, NULL, NULL, 0 }
+ };
+ 
+ static int
+@@ -104,11 +110,23 @@ test_strtoid(int *ntests)
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
+diff --git a/plugins/sudoers/regress/testsudoers/test5.out.ok b/plugins/sudoers/regress/testsudoers/test5.out.ok
+index 5e319c9..cecf700 100644
+--- a/plugins/sudoers/regress/testsudoers/test5.out.ok
++++ b/plugins/sudoers/regress/testsudoers/test5.out.ok
+@@ -4,7 +4,7 @@ Parse error in sudoers near line 1.
+ Entries for user root:
+ 
+ Command unmatched
+-testsudoers: test5.inc should be owned by gid 4294967295
++testsudoers: test5.inc should be owned by gid 4294967294
+ Parse error in sudoers near line 1.
+ 
+ Entries for user root:
+diff --git a/plugins/sudoers/regress/testsudoers/test5.sh b/plugins/sudoers/regress/testsudoers/test5.sh
+index 9e690a6..94d585c 100755
+--- a/plugins/sudoers/regress/testsudoers/test5.sh
++++ b/plugins/sudoers/regress/testsudoers/test5.sh
+@@ -24,7 +24,7 @@ EOF
+ 
+ # Test group writable
+ chmod 664 $TESTFILE
+-./testsudoers -U $MYUID -G -1 root id <<EOF
++./testsudoers -U $MYUID -G -2 root id <<EOF
+ #include $TESTFILE
+ EOF
+ 
+-- 
+2.7.4
+
diff --git a/meta/recipes-extended/sudo/sudo_1.8.27.bb b/meta/recipes-extended/sudo/sudo_1.8.27.bb
index 4a34393..7460a5b 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.27.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.27.bb
@@ -3,6 +3,8 @@ require sudo.inc
 SRC_URI = "http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://0001-Include-sys-types.h-for-id_t-definition.patch \
+           file://CVE-2019-14287-1.patch \
+           file://CVE-2019-14287-2.patch \
            "
 
 PAM_SRC_URI = "file://sudo.pam"
-- 
2.7.4


