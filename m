Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 682BC745BF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 06:21:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id x9L6LcBn010988
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Oct 2019 23:21:38 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Sun, 20 Oct 2019 23:21:38 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 21 Oct 2019 14:21:36 +0800
Message-ID: <1571638896-67001-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] sudo: fix CVE-2019-14287
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
X-List-Received-Date: Mon, 21 Oct 2019 06:21:37 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../sudo/sudo/CVE-2019-14287.patch                 | 178 +++++++++++++++++++++
 meta/recipes-extended/sudo/sudo_1.8.27.bb          |   1 +
 2 files changed, 179 insertions(+)
 create mode 100644 meta/recipes-extended/sudo/sudo/CVE-2019-14287.patch

diff --git a/meta/recipes-extended/sudo/sudo/CVE-2019-14287.patch b/meta/recipes-extended/sudo/sudo/CVE-2019-14287.patch
new file mode 100644
index 0000000..2a11e3f
--- /dev/null
+++ b/meta/recipes-extended/sudo/sudo/CVE-2019-14287.patch
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
diff --git a/meta/recipes-extended/sudo/sudo_1.8.27.bb b/meta/recipes-extended/sudo/sudo_1.8.27.bb
index 9d2d6bd..5605c0c 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.27.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.27.bb
@@ -3,6 +3,7 @@ require sudo.inc
 SRC_URI = "http://www.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://0001-Include-sys-types.h-for-id_t-definition.patch \
+           file://CVE-2019-14287.patch \
            "
 
 PAM_SRC_URI = "file://sudo.pam"
-- 
2.7.4


