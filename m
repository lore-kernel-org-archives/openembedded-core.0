Return-Path: <sanakazisk19@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD89FC433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 05:13:02 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.7835.1639026781701598264
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 21:13:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=F+HS4JHr;
 spf=pass (domain: gmail.com, ip: 209.85.210.170,
 mailfrom: sanakazisk19@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id u80so4359817pfc.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 21:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=jgKB87vdF3u/5KKq8IEHkWcKtjMsruWga5v42pDPOTk=;
        b=F+HS4JHr12Oq7W01U/DNMksf9tnGbNdBWeO659MHP5oqSS0z+S+Z3aF/zdHWAmJrRQ
         x3GU1OgmT/w5mCwpOMep5mKlWWGhd0V4Byp1pVtosMPwnp3RKfiffH3exy/35zGEYDN/
         AjytdqV/KE3n96slkdBg8la2BANRg6kQ4TiUznEgNtfib7j0x/cTxrWPjlWQlq5BHSwe
         da4Y8g3vayMpSPt7wnQj1gcplDQArT2SdkwYmpyFhnd+efbzZxYgqkgnOWmNopJSALWA
         0TrjqrbiEqgn3pT2TRHUyXD/bHcC+z4OCkSdoXKA2nJe7NAPrxBDCuiRMkyOz2xYTh9e
         dteg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=jgKB87vdF3u/5KKq8IEHkWcKtjMsruWga5v42pDPOTk=;
        b=Vx2GcjYguwsSJSdDztRYEOIhnuPvLPF/Y8cx/tvh7CHTN2cNW+opQohwpzL3KV31S8
         bNsCTsmrKwu3b9/t+zd2tRwwGbHYoNAKU/X98G5Muc21X9P0CgF+yLYNKHA6yCkRT0xR
         sU4+EDVjPuEE4hDbpQuGZlmHNErqLIrogcmKWX7WbdMbLEr7/8o7C4U2YuV8QVmfIXRB
         twrm954FHEseOMAWRokWaLd2FPJNxpabR5o4FvdCURFVnsEEL6Qik3C6V5gAd6ogI0i4
         FJUHRYgA/z7aLCNnS1qwg1fuo3NciqI7z5rgf7xmv0N0JPK50Rt8rkW8w4gufmzGEf1R
         88MA==
X-Gm-Message-State: AOAM532pxPDy0hKkaBvDNtQLA3nYoo7RuMBKI3vkQfD1b1umEWdhpsZ6
	wfjPmgZgwUQU6aHJ8QNcwtAAzoiWswQ=
X-Google-Smtp-Source: 
 ABdhPJz7Z5qfVZ59DIEz7WYZOAzsxpTXSO3/4H3QMoG8fdb8TQQeMPdIBaG9AsqvNxk8o8LWkMEwtA==
X-Received: by 2002:aa7:9acc:0:b0:4a2:b8b5:8813 with SMTP id
 x12-20020aa79acc000000b004a2b8b58813mr9722006pfp.4.1639026780691;
        Wed, 08 Dec 2021 21:13:00 -0800 (PST)
Received: from localhost.localdomain
 ([2401:4900:5027:cb15:8138:486a:edc5:8a05])
        by smtp.gmail.com with ESMTPSA id
 c3sm5687630pfv.67.2021.12.08.21.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 21:13:00 -0800 (PST)
From: Sana Kazi <sanakazisk19@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Sana Kazi <sanakazisk19@gmail.com>
Subject: [poky][dunfell][PATCH] busybox: Fix multiple security issues in awk
Date: Thu,  9 Dec 2021 10:42:13 +0530
Message-Id: <20211209051213.18813-1-sanakazisk19@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Dec 2021 05:13:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159440

CVE-2021-423xx-awk.patch fixes below listed CVEs for busybox:
CVE-2021-42378, CVE-2021-42379, CVE-2021-42380, CVE-2021-42381,
CVE-2021-42382, CVE-2021-42384, CVE-2021-42385, CVE-2021-42386

Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
Signed-off-by: Sana Kazi <sanakazisk19@gmail.com>
---
 meta/recipes-core/busybox/busybox_1.31.1.bb   |   1 +
 .../busybox/files/CVE-2021-423xx-awk.patch    | 203 ++++++++++++++++++
 2 files changed, 204 insertions(+)
 create mode 100644 meta/recipes-core/busybox/files/CVE-2021-423xx-awk.patch

diff --git a/meta/recipes-core/busybox/busybox_1.31.1.bb b/meta/recipes-core/busybox/busybox_1.31.1.bb
index d9d5f4f96b..1bb0c028ac 100644
--- a/meta/recipes-core/busybox/busybox_1.31.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.31.1.bb
@@ -52,6 +52,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-hwclock-make-glibc-2.31-compatible.patch \
            file://0001-decompress_gunzip-Fix-DoS-if-gzip-is-corrupt.patch \
            file://0001-mktemp-add-tmpdir-option.patch \
+           file://CVE-2021-423xx-awk.patch \
            "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
diff --git a/meta/recipes-core/busybox/files/CVE-2021-423xx-awk.patch b/meta/recipes-core/busybox/files/CVE-2021-423xx-awk.patch
new file mode 100644
index 0000000000..49296354cb
--- /dev/null
+++ b/meta/recipes-core/busybox/files/CVE-2021-423xx-awk.patch
@@ -0,0 +1,203 @@
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
+
+--- a/editors/awk.c
++++ b/editors/awk.c
+@@ -272,7 +272,8 @@
+ /* if previous token class is CONCAT1 and next is CONCAT2, concatenation */
+ /* operator is inserted between them */
+ #define	TC_CONCAT1 (TC_VARIABLE | TC_ARRTERM | TC_SEQTERM \
+-                   | TC_STRING | TC_NUMBER | TC_UOPPOST)
++                   | TC_STRING | TC_NUMBER | TC_UOPPOST \
++                   | TC_LENGTH)
+ #define	TC_CONCAT2 (TC_OPERAND | TC_UOPPRE)
+ 
+ #define	OF_RES1     0x010000
+@@ -401,7 +405,7 @@ static const char tokenlist[] ALIGN1 =
+ 
+ #define OC_B  OC_BUILTINCVE-2021-423xx-awk.patch
+ 
+-static const uint32_t tokeninfo[] = {
++static const uint32_t tokeninfo[] ALIGN4 = {
+ 	0,
+ 	0,
+ 	OC_REGEXP
+@@ -1067,8 +1071,10 @@ static uint32_t next_token(uint32_t expe
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
+@@ -1197,7 +1203,11 @@ static uint32_t next_token(uint32_t expe
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
+@@ -1205,6 +1215,7 @@ static uint32_t next_token(uint32_t expe
+ 			t_info = OC_CONCAT | SS | P(35);
+ 		}
+ 
++		debug_printf_parse("%s: t_tclass=tc=%x\n", __func__, t_tclass);
+ 		t_tclass = tc;
+ 	}
+ 	ltclass = t_tclass;
+@@ -1215,6 +1226,7 @@ static uint32_t next_token(uint32_t expe
+ 				EMSG_UNEXP_EOS : EMSG_UNEXP_TOKEN);
+ 	}
+ 
++	debug_printf_parse("%s: returning, ltclass:%x t_double:%f\n", __func__, ltclass, t_double);
+ 	return ltclass;
+ #undef concat_inserted
+ #undef save_tclass
+@@ -1279,7 +1291,7 @@ static node *parse_expr(uint32_t iexp)
+ 			glptr = NULL;
+ 
+ 		} else if (tc & (TC_BINOP | TC_UOPPOST)) {
+-			debug_printf_parse("%s: TC_BINOP | TC_UOPPOST\n", __func__);
++			debug_printf_parse("%s: TC_BINOP | TC_UOPPOST tc:%x\n", __func__, tc);
+ 			/* for binary and postfix-unary operators, jump back over
+ 			 * previous operators with higher priority */
+ 			vn = cn;
+@@ -1346,8 +1359,10 @@ static node *parse_expr(uint32_t iexp)
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
+@@ -1383,7 +1398,12 @@ static node *parse_expr(uint32_t iexp)
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
+@@ -1726,12 +1763,34 @@ static void fsrealloc(int size)
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
+@@ -1748,29 +1807,31 @@ static int awk_split(const char *s, node
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
+@@ -1974,7 +2035,7 @@ static int ptest(node *pattern)
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


