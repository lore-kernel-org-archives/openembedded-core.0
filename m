Return-Path: <ranjitsinhrathod1991@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21FEFC433EF
	for <webhook@archiver.kernel.org>; Sat, 11 Dec 2021 11:14:28 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.20527.1639221261783078127
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Dec 2021 03:14:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iMu40k27;
 spf=pass (domain: gmail.com, ip: 209.85.214.178,
 mailfrom: ranjitsinhrathod1991@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id k4so7936912plx.8
        for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Dec 2021 03:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=Os7+GFuxO9DgL8LkoMMMbjgXIgBoBTJ/7dDUHXBeY8Q=;
        b=iMu40k273eA88jWBTYNOMf5w2ldnYQeICoE8WOtv12RSWPw+nexvULom8hvvuQofAN
         ENPVmkv+2/GUy20OqajfO8biBYtocmv2TRDlOjQJQmnSUmXJCQ9SB1SK6emtVDthNvLG
         A/QIqmLKuffcpkr/gV/HRd7xpC+ud/s1M/KDuqw1/DQzxDBkfHX0hyR+79XELnw362Cl
         UiAUiYXTBXJMLotFnpth5KhY5metHN2HDZVGyq6UnYTs1sQCZzLYR+UvXfAapvez/zRd
         KAbKmEYaRpq2yv6CfhhrYmSAvW7KK29mI7k9Yvke+cr+79/lfaqRQMrfF2Wy7xLXqtYq
         zayg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Os7+GFuxO9DgL8LkoMMMbjgXIgBoBTJ/7dDUHXBeY8Q=;
        b=Jq7XaM+QUbWyYoHLoDf+8HyfNS8Vw5wfwjQwGRWLq1mbWZdJOYUgOvImzGikYvWmZ1
         /hrD4SQYl/AI4SLEaE658KU2wKCvMrDU9FBPwzxvB8IfPMN4uedNzr44rmR2D+gVnTpm
         zO9v9+9ivF+AcgpW5ZDMWw+H4TT38Sfz9YyaIzTX0cDKsdA6w+YS2DPp7Q+M99EfeLvS
         Q0aMFw4s6IWtmuM9W2zy74SpDGtO/eFci8Vwj9g1dDgoqcmLZQqnEgOEneydcYSWDYBx
         Lx7WvI+rgonXnBf4VplN3PocE5mXDp6KvKfOFUijdgP7If/ySr06nfZmB9bPKMbE8JX7
         rxKA==
X-Gm-Message-State: AOAM533B1aHzllxJ2Q+LxRFUKJ3C2ZCLhXtw+VT77W3xpZiiZg4C+2C8
	+KB38whOf+IsHc+eqdFmN0YnhhiTb3Y=
X-Google-Smtp-Source: 
 ABdhPJx1ALyzhPtXulRGUeYf3YdRhnt1WAd+HEQ/5/n1ftWEsume7llafWIYjnpE8ztrad9kz3oLtA==
X-Received: by 2002:a17:902:9684:b0:143:cc70:6472 with SMTP id
 n4-20020a170902968400b00143cc706472mr82248282plp.70.1639221260638;
        Sat, 11 Dec 2021 03:14:20 -0800 (PST)
Received: from localhost.localdomain ([110.5.74.184])
        by smtp.gmail.com with ESMTPSA id
 145sm1744555pgd.0.2021.12.11.03.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Dec 2021 03:14:20 -0800 (PST)
From: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Sana Kazi <Sana.Kazi@partner.bmw.de>,
	Sana Kazi <Sana.Kazi@kpit.com>,
	Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Subject: [meta][dunfell][PATCH v2] busybox: Fix multiple security issues in
 awk
Date: Sat, 11 Dec 2021 16:43:29 +0530
Message-Id: <20211211111329.11582-1-ranjitsinhrathod1991@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Dec 2021 11:14:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159563

From: Sana Kazi <Sana.Kazi@partner.bmw.de>

CVE-2021-423xx-awk.patch fixes below listed CVEs for busybox:
CVE-2021-42378, CVE-2021-42379, CVE-2021-42380, CVE-2021-42381,
CVE-2021-42382, CVE-2021-42384, CVE-2021-42385, CVE-2021-42386

Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
---
 meta/recipes-core/busybox/busybox_1.31.1.bb   |   1 +
 .../busybox/files/CVE-2021-423xx-awk.patch    | 215 ++++++++++++++++++
 2 files changed, 216 insertions(+)
 create mode 100644 meta/recipes-core/busybox/files/CVE-2021-423xx-awk.patch

diff --git a/meta/recipes-core/busybox/busybox_1.31.1.bb b/meta/recipes-core/busybox/busybox_1.31.1.bb
index 14ac710f3b..38b448b3e1 100644
--- a/meta/recipes-core/busybox/busybox_1.31.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.31.1.bb
@@ -54,6 +54,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-mktemp-add-tmpdir-option.patch \
            file://CVE-2021-42374.patch \
            file://CVE-2021-42376.patch \
+           file://CVE-2021-423xx-awk.patch \
            "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
diff --git a/meta/recipes-core/busybox/files/CVE-2021-423xx-awk.patch b/meta/recipes-core/busybox/files/CVE-2021-423xx-awk.patch
new file mode 100644
index 0000000000..7e3d47b88c
--- /dev/null
+++ b/meta/recipes-core/busybox/files/CVE-2021-423xx-awk.patch
@@ -0,0 +1,215 @@
+From a21708eb8d07b4a6dbc1d3e4ace4c5721515a84c Mon Sep 17 00:00:00 2001
+From: Sana Kazi <Sana.Kazi@kpit.com>
+Date: Wed, 8 Dec 2021 12:25:34 +0530
+Subject: [PATCH] busybox: Fix multiple security issues in awk
+
+Description: fix multiple security issues in awk
+Origin: backported awk.c from busybox 1.34.1
+
+CVE: CVE-2021-42378
+CVE: CVE-2021-42379
+CVE: CVE-2021-42380
+CVE: CVE-2021-42381
+CVE: CVE-2021-42382
+CVE: CVE-2021-42384
+CVE: CVE-2021-42385
+CVE: CVE-2021-42386
+
+Upstream-Status: Backport [https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/busybox/1:1.30.1-6ubuntu3.1/busybox_1.30.1-6ubuntu3.1.debian.tar.xz]
+
+Comment: Refreshed first hunk and removed few hunks as they are already present in source.
+
+Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
+Signed-off-by: Ranjitsinh Rathod <Ranjitsinh.Rathod@kpit.com>
+
+---
+ editors/awk.c | 80 ++++++++++++++++++++++++++++++++++++++-------------
+ 1 file changed, 60 insertions(+), 20 deletions(-)
+
+diff --git a/editors/awk.c b/editors/awk.c
+index d25508e..4e4f282 100644
+--- a/editors/awk.c
++++ b/editors/awk.c
+@@ -272,7 +272,8 @@ typedef struct tsplitter_s {
+ /* if previous token class is CONCAT1 and next is CONCAT2, concatenation */
+ /* operator is inserted between them */
+ #define	TC_CONCAT1 (TC_VARIABLE | TC_ARRTERM | TC_SEQTERM \
+-                   | TC_STRING | TC_NUMBER | TC_UOPPOST)
++                   | TC_STRING | TC_NUMBER | TC_UOPPOST \
++                   | TC_LENGTH)
+ #define	TC_CONCAT2 (TC_OPERAND | TC_UOPPRE)
+ 
+ #define	OF_RES1     0x010000
+@@ -404,7 +405,7 @@ static const char tokenlist[] ALIGN1 =
+ 
+ #define OC_B  OC_BUILTIN
+ 
+-static const uint32_t tokeninfo[] = {
++static const uint32_t tokeninfo[] ALIGN4 = {
+ 	0,
+ 	0,
+ 	OC_REGEXP,
+@@ -1070,8 +1071,10 @@ static uint32_t next_token(uint32_t expected)
+ 	const uint32_t *ti;
+ 
+ 	if (t_rollback) {
++		debug_printf_parse("%s: using rolled-back token\n", __func__);
+ 		t_rollback = FALSE;
+ 	} else if (concat_inserted) {
++		debug_printf_parse("%s: using concat-inserted token\n", __func__);
+ 		concat_inserted = FALSE;
+ 		t_tclass = save_tclass;
+ 		t_info = save_info;
+@@ -1200,7 +1203,11 @@ static uint32_t next_token(uint32_t expected)
+ 			goto readnext;
+ 
+ 		/* insert concatenation operator when needed */
+-		if ((ltclass & TC_CONCAT1) && (tc & TC_CONCAT2) && (expected & TC_BINOP)) {
++		debug_printf_parse("%s: %x %x %x concat_inserted?\n", __func__,
++			(ltclass & TC_CONCAT1), (tc & TC_CONCAT2), (expected & TC_BINOP));
++		if ((ltclass & TC_CONCAT1) && (tc & TC_CONCAT2) && (expected & TC_BINOP)
++		 && !(ltclass == TC_LENGTH && tc == TC_SEQSTART) /* but not for "length(..." */
++		) {
+ 			concat_inserted = TRUE;
+ 			save_tclass = tc;
+ 			save_info = t_info;
+@@ -1208,6 +1215,7 @@ static uint32_t next_token(uint32_t expected)
+ 			t_info = OC_CONCAT | SS | P(35);
+ 		}
+ 
++		debug_printf_parse("%s: t_tclass=tc=%x\n", __func__, t_tclass);
+ 		t_tclass = tc;
+ 	}
+ 	ltclass = t_tclass;
+@@ -1218,6 +1226,7 @@ static uint32_t next_token(uint32_t expected)
+ 				EMSG_UNEXP_EOS : EMSG_UNEXP_TOKEN);
+ 	}
+ 
++	debug_printf_parse("%s: returning, ltclass:%x t_double:%f\n", __func__, ltclass, t_double);
+ 	return ltclass;
+ #undef concat_inserted
+ #undef save_tclass
+@@ -1282,7 +1291,7 @@ static node *parse_expr(uint32_t iexp)
+ 			glptr = NULL;
+ 
+ 		} else if (tc & (TC_BINOP | TC_UOPPOST)) {
+-			debug_printf_parse("%s: TC_BINOP | TC_UOPPOST\n", __func__);
++			debug_printf_parse("%s: TC_BINOP | TC_UOPPOST tc:%x\n", __func__, tc);
+ 			/* for binary and postfix-unary operators, jump back over
+ 			 * previous operators with higher priority */
+ 			vn = cn;
+@@ -1350,8 +1359,10 @@ static node *parse_expr(uint32_t iexp)
+ 					v = cn->l.v = xzalloc(sizeof(var));
+ 					if (tc & TC_NUMBER)
+ 						setvar_i(v, t_double);
+-					else
++					else {
+ 						setvar_s(v, t_string);
++						xtc &= ~TC_UOPPOST; /* "str"++ is not allowed */
++					}
+ 					break;
+ 
+ 				case TC_REGEXP:
+@@ -1387,7 +1398,12 @@ static node *parse_expr(uint32_t iexp)
+ 
+ 				case TC_LENGTH:
+ 					debug_printf_parse("%s: TC_LENGTH\n", __func__);
+-					next_token(TC_SEQSTART | TC_OPTERM | TC_GRPTERM);
++					next_token(TC_SEQSTART /* length(...) */
++						| TC_OPTERM    /* length; (or newline)*/
++						| TC_GRPTERM   /* length } */
++						| TC_BINOPX    /* length <op> NUM */
++						| TC_COMMA     /* print length, 1 */
++					);
+ 					rollback_token();
+ 					if (t_tclass & TC_SEQSTART) {
+ 						/* It was a "(" token. Handle just like TC_BUILTIN */
+@@ -1747,12 +1763,34 @@ static void fsrealloc(int size)
+ 	nfields = size;
+ }
+ 
++static int regexec1_nonempty(const regex_t *preg, const char *s, regmatch_t pmatch[])
++{
++	int r = regexec(preg, s, 1, pmatch, 0);
++	if (r == 0 && pmatch[0].rm_eo == 0) {
++		/* For example, happens when FS can match
++		 * an empty string (awk -F ' *'). Logically,
++		 * this should split into one-char fields.
++		 * However, gawk 5.0.1 searches for first
++		 * _non-empty_ separator string match:
++		 */
++		size_t ofs = 0;
++		do {
++			ofs++;
++			if (!s[ofs])
++				return REG_NOMATCH;
++			regexec(preg, s + ofs, 1, pmatch, 0);
++		} while (pmatch[0].rm_eo == 0);
++		pmatch[0].rm_so += ofs;
++		pmatch[0].rm_eo += ofs;
++	}
++	return r;
++}
++
+ static int awk_split(const char *s, node *spl, char **slist)
+ {
+-	int l, n;
++	int n;
+ 	char c[4];
+ 	char *s1;
+-	regmatch_t pmatch[2]; // TODO: why [2]? [1] is enough...
+ 
+ 	/* in worst case, each char would be a separate field */
+ 	*slist = s1 = xzalloc(strlen(s) * 2 + 3);
+@@ -1769,29 +1807,31 @@ static int awk_split(const char *s, node *spl, char **slist)
+ 			return n; /* "": zero fields */
+ 		n++; /* at least one field will be there */
+ 		do {
++			int l;
++			regmatch_t pmatch[2]; // TODO: why [2]? [1] is enough...
++
+ 			l = strcspn(s, c+2); /* len till next NUL or \n */
+-			if (regexec(icase ? spl->r.ire : spl->l.re, s, 1, pmatch, 0) == 0
++			if (regexec1_nonempty(icase ? spl->r.ire : spl->l.re, s, pmatch) == 0
+ 			 && pmatch[0].rm_so <= l
+ 			) {
++				/* if (pmatch[0].rm_eo == 0) ... - impossible */
+ 				l = pmatch[0].rm_so;
+-				if (pmatch[0].rm_eo == 0) {
+-					l++;
+-					pmatch[0].rm_eo++;
+-				}
+ 				n++; /* we saw yet another delimiter */
+ 			} else {
+ 				pmatch[0].rm_eo = l;
+ 				if (s[l])
+ 					pmatch[0].rm_eo++;
+ 			}
+-			memcpy(s1, s, l);
+-			/* make sure we remove *all* of the separator chars */
+-			do {
+-				s1[l] = '\0';
+-			} while (++l < pmatch[0].rm_eo);
+-			nextword(&s1);
++			s1 = mempcpy(s1, s, l);
++			*s1++ = '\0';
+ 			s += pmatch[0].rm_eo;
+ 		} while (*s);
++
++		/* echo a-- | awk -F-- '{ print NF, length($NF), $NF }'
++		 * should print "2 0 ":
++		 */
++		*s1 = '\0';
++
+ 		return n;
+ 	}
+ 	if (c[0] == '\0') {  /* null split */
+@@ -1995,7 +2035,7 @@ static int ptest(node *pattern)
+ static int awk_getline(rstream *rsm, var *v)
+ {
+ 	char *b;
+-	regmatch_t pmatch[2];
++	regmatch_t pmatch[2]; // TODO: why [2]? [1] is enough...
+ 	int size, a, p, pp = 0;
+ 	int fd, so, eo, r, rp;
+ 	char c, *m, *s;
-- 
2.17.1


