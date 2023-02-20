Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C974FC64ED9
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 22:20:42 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.28058.1676931634468030927
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 14:20:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=dQ9JvydY;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id b14-20020a17090a8c8e00b002349579949aso2732575pjo.5
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 14:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fq1TYzzEYRiFzYU85wzJ8iWsE0HjHYzBy5ZFDmmwbzU=;
        b=dQ9JvydYrpVHV160BTqwtpeBFhOn9YnFcJLxqqTC7tXQDYd3kvIEPmErazEecV28SD
         tJ7ztSvzieBnhhW4W9dPcyjKy3SZwIDHBXHy15fRBDIZQvzlX4WdvH5IJUJgZtKcZ96J
         p3/v3KC+Lwty4VPAYFWmwc541YyeHCYwk441FtMI3I1eETq/SBgXqYR+vK3M15MWLaSW
         NZbHpVZpBL7rR28jwhZ/GGXeC9a37MBzTWszgAJf8h8F7JRbTJah6XDSpLogHIEOSLTd
         /8IetJSEDp3WBTDURcy1I4Nix9wDbaMT4t5uBQKQIMdYjBXLaHxckEzXnFW18XsBggim
         cA6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fq1TYzzEYRiFzYU85wzJ8iWsE0HjHYzBy5ZFDmmwbzU=;
        b=RTJ0I4Lfsgc5lpkFNVp9k2DRRv8GvQG08Kjlmw42tmvRxzkenyhuBydD3n/IIN3YVI
         eyOPT+DQ8xWmPD/13IVfOC5d5ilQbdB7pSBzDUDxKhAbX/HfXQaUsFGcMihjvhdwQDTw
         pfFfoBFNMq2BLBv8x9a6ZOuhvAqyzkHkPHP8it+gbWeqt3s0pFc827+NOrIIU3IeAf7T
         9pZLP900eHWym4pzEMMYgOcdPbnGEoSZwNRuolLdNoUGt1d07mry5PhUd5WxbqhsJPAv
         tCBOmCgQ40mZpXgxN20D3OYrf6OtwK6Bz1Tj0Nk2aYGRTVP/4zo2LVSDWcgQ4IT+Z8ci
         kVpg==
X-Gm-Message-State: AO0yUKXoNaDR6yn4ULd9d9Bgl+a0lg861Q6qJSRKK1R8aqKoEETkHAsR
	6keNGP4Tov2KxKl56EqIRfM1CuPAKEJlOE8NtcY=
X-Google-Smtp-Source: AK7set8IeAVnCS6pxDL9EXeJ+al4Ny3ZacG50wlcutIOL4dcx5JX5Q5s/Wbmbu0k5mZ69QOocXjwfw==
X-Received: by 2002:a17:903:28c6:b0:196:780a:ada8 with SMTP id kv6-20020a17090328c600b00196780aada8mr3132631plb.6.1676931637136;
        Mon, 20 Feb 2023 14:20:37 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id t6-20020a1709027fc600b0019719f752c5sm8401200plb.59.2023.02.20.14.20.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 14:20:36 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/16] git: CVE-2022-23521 gitattributes parsing integer overflow
Date: Mon, 20 Feb 2023 12:20:11 -1000
Message-Id: <4f4baa56656291b259b9474a3637cf31f6569ff3.1676931497.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676931497.git.steve@sakoman.com>
References: <cover.1676931497.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 22:20:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177464

From: Hitendra Prajapati <hprajapati@mvista.com>

Backport from:

https://github.com/git/git/commit/eb22e7dfa23da6bd9aed9bd1dad69e1e8e167d24
https://github.com/git/git/commit/8d0d48cf2157cfb914db1f53b3fe40785b86f3aa
https://github.com/git/git/commit/24557209500e6ed618f04a8795a111a0c491a29c
https://github.com/git/git/commit/34ace8bad02bb14ecc5b631f7e3daaa7a9bba7d9
https://github.com/git/git/commit/447ac906e189535e77dcb1f4bbe3f1bc917d4c12
https://github.com/git/git/commit/e1e12e97ac73ded85f7d000da1063a774b3cc14f
https://github.com/git/git/commit/a60a66e409c265b2944f18bf43581c146812586d
https://github.com/git/git/commit/d74b1fd54fdbc45966d12ea907dece11e072fb2b
https://github.com/git/git/commit/dfa6b32b5e599d97448337ed4fc18dd50c90758f
https://github.com/git/git/commit/3c50032ff5289cc45659f21949c8d09e52164579

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../git/files/CVE-2022-23521.patch            | 367 ++++++++++++++++++
 meta/recipes-devtools/git/git.inc             |   2 +-
 2 files changed, 368 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/git/files/CVE-2022-23521.patch

diff --git a/meta/recipes-devtools/git/files/CVE-2022-23521.patch b/meta/recipes-devtools/git/files/CVE-2022-23521.patch
new file mode 100644
index 0000000000..974546013d
--- /dev/null
+++ b/meta/recipes-devtools/git/files/CVE-2022-23521.patch
@@ -0,0 +1,367 @@
+From eb22e7dfa23da6bd9aed9bd1dad69e1e8e167d24 Mon Sep 17 00:00:00 2001
+From: Patrick Steinhardt <ps@pks.im>
+Date: Thu, 1 Dec 2022 15:45:15 +0100
+Subject: [PATCH] CVE-2022-23521
+
+attr: fix overflow when upserting attribute with overly long name
+
+The function `git_attr_internal()` is called to upsert attributes into
+the global map. And while all callers pass a `size_t`, the function
+itself accepts an `int` as the attribute name's length. This can lead to
+an integer overflow in case the attribute name is longer than `INT_MAX`.
+
+Now this overflow seems harmless as the first thing we do is to call
+`attr_name_valid()`, and that function only succeeds in case all chars
+in the range of `namelen` match a certain small set of chars. We thus
+can't do an out-of-bounds read as NUL is not part of that set and all
+strings passed to this function are NUL-terminated. And furthermore, we
+wouldn't ever read past the current attribute name anyway due to the
+same reason. And if validation fails we will return early.
+
+On the other hand it feels fragile to rely on this behaviour, even more
+so given that we pass `namelen` to `FLEX_ALLOC_MEM()`. So let's instead
+just do the correct thing here and accept a `size_t` as line length.
+
+Upstream-Status: Backport [https://github.com/git/git/commit/eb22e7dfa23da6bd9aed9bd1dad69e1e8e167d24 &https://github.com/git/git/commit/8d0d48cf2157cfb914db1f53b3fe40785b86f3aa & https://github.com/git/git/commit/24557209500e6ed618f04a8795a111a0c491a29c & https://github.com/git/git/commit/34ace8bad02bb14ecc5b631f7e3daaa7a9bba7d9 & https://github.com/git/git/commit/447ac906e189535e77dcb1f4bbe3f1bc917d4c12 & https://github.com/git/git/commit/e1e12e97ac73ded85f7d000da1063a774b3cc14f & https://github.com/git/git/commit/a60a66e409c265b2944f18bf43581c146812586d & https://github.com/git/git/commit/d74b1fd54fdbc45966d12ea907dece11e072fb2b & https://github.com/git/git/commit/dfa6b32b5e599d97448337ed4fc18dd50c90758f & https://github.com/git/git/commit/3c50032ff5289cc45659f21949c8d09e52164579
+
+CVE: CVE-2022-23521
+
+Reviewed-by: Sylvain Beucler <beuc@debian.org>
+Signed-off-by: Patrick Steinhardt <ps@pks.im>
+Signed-off-by: Junio C Hamano <gitster@pobox.com>
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ attr.c                | 97 +++++++++++++++++++++++++++----------------
+ attr.h                | 12 ++++++
+ t/t0003-attributes.sh | 59 ++++++++++++++++++++++++++
+ 3 files changed, 132 insertions(+), 36 deletions(-)
+
+diff --git a/attr.c b/attr.c
+index 11f19b5..63484ab 100644
+--- a/attr.c
++++ b/attr.c
+@@ -29,7 +29,7 @@ static const char git_attr__unknown[] = "(builtin)unknown";
+ #endif
+ 
+ struct git_attr {
+-	int attr_nr; /* unique attribute number */
++	unsigned int attr_nr; /* unique attribute number */
+ 	char name[FLEX_ARRAY]; /* attribute name */
+ };
+ 
+@@ -221,7 +221,7 @@ static void report_invalid_attr(const char *name, size_t len,
+  * dictionary.  If no entry is found, create a new attribute and store it in
+  * the dictionary.
+  */
+-static const struct git_attr *git_attr_internal(const char *name, int namelen)
++static const struct git_attr *git_attr_internal(const char *name, size_t namelen)
+ {
+ 	struct git_attr *a;
+ 
+@@ -237,8 +237,8 @@ static const struct git_attr *git_attr_internal(const char *name, int namelen)
+ 		a->attr_nr = hashmap_get_size(&g_attr_hashmap.map);
+ 
+ 		attr_hashmap_add(&g_attr_hashmap, a->name, namelen, a);
+-		assert(a->attr_nr ==
+-		       (hashmap_get_size(&g_attr_hashmap.map) - 1));
++		if (a->attr_nr != hashmap_get_size(&g_attr_hashmap.map) - 1)
++			die(_("unable to add additional attribute"));
+ 	}
+ 
+ 	hashmap_unlock(&g_attr_hashmap);
+@@ -283,7 +283,7 @@ struct match_attr {
+ 		const struct git_attr *attr;
+ 	} u;
+ 	char is_macro;
+-	unsigned num_attr;
++	size_t num_attr;
+ 	struct attr_state state[FLEX_ARRAY];
+ };
+ 
+@@ -300,7 +300,7 @@ static const char *parse_attr(const char *src, int lineno, const char *cp,
+ 			      struct attr_state *e)
+ {
+ 	const char *ep, *equals;
+-	int len;
++	size_t len;
+ 
+ 	ep = cp + strcspn(cp, blank);
+ 	equals = strchr(cp, '=');
+@@ -344,8 +344,7 @@ static const char *parse_attr(const char *src, int lineno, const char *cp,
+ static struct match_attr *parse_attr_line(const char *line, const char *src,
+ 					  int lineno, int macro_ok)
+ {
+-	int namelen;
+-	int num_attr, i;
++	size_t namelen, num_attr, i;
+ 	const char *cp, *name, *states;
+ 	struct match_attr *res = NULL;
+ 	int is_macro;
+@@ -356,6 +355,11 @@ static struct match_attr *parse_attr_line(const char *line, const char *src,
+ 		return NULL;
+ 	name = cp;
+ 
++	if (strlen(line) >= ATTR_MAX_LINE_LENGTH) {
++		warning(_("ignoring overly long attributes line %d"), lineno);
++		return NULL;
++	}
++
+ 	if (*cp == '"' && !unquote_c_style(&pattern, name, &states)) {
+ 		name = pattern.buf;
+ 		namelen = pattern.len;
+@@ -392,10 +396,9 @@ static struct match_attr *parse_attr_line(const char *line, const char *src,
+ 			goto fail_return;
+ 	}
+ 
+-	res = xcalloc(1,
+-		      sizeof(*res) +
+-		      sizeof(struct attr_state) * num_attr +
+-		      (is_macro ? 0 : namelen + 1));
++	res = xcalloc(1, st_add3(sizeof(*res),
++				 st_mult(sizeof(struct attr_state), num_attr),
++				 is_macro ? 0 : namelen + 1));
+ 	if (is_macro) {
+ 		res->u.attr = git_attr_internal(name, namelen);
+ 	} else {
+@@ -458,11 +461,12 @@ struct attr_stack {
+ 
+ static void attr_stack_free(struct attr_stack *e)
+ {
+-	int i;
++	unsigned i;
+ 	free(e->origin);
+ 	for (i = 0; i < e->num_matches; i++) {
+ 		struct match_attr *a = e->attrs[i];
+-		int j;
++		size_t j;
++
+ 		for (j = 0; j < a->num_attr; j++) {
+ 			const char *setto = a->state[j].setto;
+ 			if (setto == ATTR__TRUE ||
+@@ -671,8 +675,8 @@ static void handle_attr_line(struct attr_stack *res,
+ 	a = parse_attr_line(line, src, lineno, macro_ok);
+ 	if (!a)
+ 		return;
+-	ALLOC_GROW(res->attrs, res->num_matches + 1, res->alloc);
+-	res->attrs[res->num_matches++] = a;
++	ALLOC_GROW_BY(res->attrs, res->num_matches, 1, res->alloc);
++	res->attrs[res->num_matches - 1] = a;
+ }
+ 
+ static struct attr_stack *read_attr_from_array(const char **list)
+@@ -711,21 +715,37 @@ void git_attr_set_direction(enum git_attr_direction new_direction)
+ 
+ static struct attr_stack *read_attr_from_file(const char *path, int macro_ok)
+ {
++	struct strbuf buf = STRBUF_INIT;
+ 	FILE *fp = fopen_or_warn(path, "r");
+ 	struct attr_stack *res;
+-	char buf[2048];
+ 	int lineno = 0;
++	int fd;
++	struct stat st;
+ 
+ 	if (!fp)
+ 		return NULL;
+-	res = xcalloc(1, sizeof(*res));
+-	while (fgets(buf, sizeof(buf), fp)) {
+-		char *bufp = buf;
+-		if (!lineno)
+-			skip_utf8_bom(&bufp, strlen(bufp));
+-		handle_attr_line(res, bufp, path, ++lineno, macro_ok);
++
++	fd = fileno(fp);
++	if (fstat(fd, &st)) {
++		warning_errno(_("cannot fstat gitattributes file '%s'"), path);
++		fclose(fp);
++		return NULL;
+ 	}
++	if (st.st_size >= ATTR_MAX_FILE_SIZE) {
++		warning(_("ignoring overly large gitattributes file '%s'"), path);
++		fclose(fp);
++		return NULL;
++	}
++
++	CALLOC_ARRAY(res, 1);
++	while (strbuf_getline(&buf, fp) != EOF) {
++		if (!lineno && starts_with(buf.buf, utf8_bom))
++			strbuf_remove(&buf, 0, strlen(utf8_bom));
++		handle_attr_line(res, buf.buf, path, ++lineno, macro_ok);
++	}
++
+ 	fclose(fp);
++	strbuf_release(&buf);
+ 	return res;
+ }
+ 
+@@ -736,13 +756,18 @@ static struct attr_stack *read_attr_from_index(const struct index_state *istate,
+ 	struct attr_stack *res;
+ 	char *buf, *sp;
+ 	int lineno = 0;
++	size_t size;
+ 
+ 	if (!istate)
+ 		return NULL;
+ 
+-	buf = read_blob_data_from_index(istate, path, NULL);
++	buf = read_blob_data_from_index(istate, path, &size);
+ 	if (!buf)
+ 		return NULL;
++	if (size >= ATTR_MAX_FILE_SIZE) {
++		warning(_("ignoring overly large gitattributes blob '%s'"), path);
++		return NULL;
++	}
+ 
+ 	res = xcalloc(1, sizeof(*res));
+ 	for (sp = buf; *sp; ) {
+@@ -1012,12 +1037,12 @@ static int macroexpand_one(struct all_attrs_item *all_attrs, int nr, int rem);
+ static int fill_one(const char *what, struct all_attrs_item *all_attrs,
+ 		    const struct match_attr *a, int rem)
+ {
+-	int i;
++	size_t i;
+ 
+-	for (i = a->num_attr - 1; rem > 0 && i >= 0; i--) {
+-		const struct git_attr *attr = a->state[i].attr;
++	for (i = a->num_attr; rem > 0 && i > 0; i--) {
++		const struct git_attr *attr = a->state[i - 1].attr;
+ 		const char **n = &(all_attrs[attr->attr_nr].value);
+-		const char *v = a->state[i].setto;
++		const char *v = a->state[i - 1].setto;
+ 
+ 		if (*n == ATTR__UNKNOWN) {
+ 			debug_set(what,
+@@ -1036,11 +1061,11 @@ static int fill(const char *path, int pathlen, int basename_offset,
+ 		struct all_attrs_item *all_attrs, int rem)
+ {
+ 	for (; rem > 0 && stack; stack = stack->prev) {
+-		int i;
++		unsigned i;
+ 		const char *base = stack->origin ? stack->origin : "";
+ 
+-		for (i = stack->num_matches - 1; 0 < rem && 0 <= i; i--) {
+-			const struct match_attr *a = stack->attrs[i];
++		for (i = stack->num_matches; 0 < rem && 0 < i; i--) {
++			const struct match_attr *a = stack->attrs[i - 1];
+ 			if (a->is_macro)
+ 				continue;
+ 			if (path_matches(path, pathlen, basename_offset,
+@@ -1071,11 +1096,11 @@ static void determine_macros(struct all_attrs_item *all_attrs,
+ 			     const struct attr_stack *stack)
+ {
+ 	for (; stack; stack = stack->prev) {
+-		int i;
+-		for (i = stack->num_matches - 1; i >= 0; i--) {
+-			const struct match_attr *ma = stack->attrs[i];
++		unsigned i;
++		for (i = stack->num_matches; i > 0; i--) {
++			const struct match_attr *ma = stack->attrs[i - 1];
+ 			if (ma->is_macro) {
+-				int n = ma->u.attr->attr_nr;
++				unsigned int n = ma->u.attr->attr_nr;
+ 				if (!all_attrs[n].macro) {
+ 					all_attrs[n].macro = ma;
+ 				}
+@@ -1127,7 +1152,7 @@ void git_check_attr(const struct index_state *istate,
+ 	collect_some_attrs(istate, path, check);
+ 
+ 	for (i = 0; i < check->nr; i++) {
+-		size_t n = check->items[i].attr->attr_nr;
++		unsigned int n = check->items[i].attr->attr_nr;
+ 		const char *value = check->all_attrs[n].value;
+ 		if (value == ATTR__UNKNOWN)
+ 			value = ATTR__UNSET;
+diff --git a/attr.h b/attr.h
+index b0378bf..f424285 100644
+--- a/attr.h
++++ b/attr.h
+@@ -1,6 +1,18 @@
+ #ifndef ATTR_H
+ #define ATTR_H
+ 
++/**
++ * The maximum line length for a gitattributes file. If the line exceeds this
++ * length we will ignore it.
++ */
++#define ATTR_MAX_LINE_LENGTH 2048
++
++ /**
++  * The maximum size of the giattributes file. If the file exceeds this size we
++  * will ignore it.
++  */
++#define ATTR_MAX_FILE_SIZE (100 * 1024 * 1024)
++
+ struct index_state;
+ 
+ /* An attribute is a pointer to this opaque structure */
+diff --git a/t/t0003-attributes.sh b/t/t0003-attributes.sh
+index 71e63d8..556245b 100755
+--- a/t/t0003-attributes.sh
++++ b/t/t0003-attributes.sh
+@@ -342,4 +342,63 @@ test_expect_success 'query binary macro directly' '
+ 	test_cmp expect actual
+ '
+ 
++test_expect_success 'large attributes line ignored in tree' '
++	test_when_finished "rm .gitattributes" &&
++	printf "path %02043d" 1 >.gitattributes &&
++	git check-attr --all path >actual 2>err &&
++	echo "warning: ignoring overly long attributes line 1" >expect &&
++	test_cmp expect err &&
++	test_must_be_empty actual
++'
++
++test_expect_success 'large attributes line ignores trailing content in tree' '
++	test_when_finished "rm .gitattributes" &&
++	# older versions of Git broke lines at 2048 bytes; the 2045 bytes
++	# of 0-padding here is accounting for the three bytes of "a 1", which
++	# would knock "trailing" to the "next" line, where it would be
++	# erroneously parsed.
++	printf "a %02045dtrailing attribute\n" 1 >.gitattributes &&
++	git check-attr --all trailing >actual 2>err &&
++	echo "warning: ignoring overly long attributes line 1" >expect &&
++	test_cmp expect err &&
++	test_must_be_empty actual
++'
++
++test_expect_success EXPENSIVE 'large attributes file ignored in tree' '
++	test_when_finished "rm .gitattributes" &&
++	dd if=/dev/zero of=.gitattributes bs=101M count=1 2>/dev/null &&
++	git check-attr --all path >/dev/null 2>err &&
++	echo "warning: ignoring overly large gitattributes file ${SQ}.gitattributes${SQ}" >expect &&
++	test_cmp expect err
++'
++
++test_expect_success 'large attributes line ignored in index' '
++	test_when_finished "git update-index --remove .gitattributes" &&
++	blob=$(printf "path %02043d" 1 | git hash-object -w --stdin) &&
++	git update-index --add --cacheinfo 100644,$blob,.gitattributes &&
++	git check-attr --cached --all path >actual 2>err &&
++	echo "warning: ignoring overly long attributes line 1" >expect &&
++	test_cmp expect err &&
++	test_must_be_empty actual
++'
++
++test_expect_success 'large attributes line ignores trailing content in index' '
++	test_when_finished "git update-index --remove .gitattributes" &&
++	blob=$(printf "a %02045dtrailing attribute\n" 1 | git hash-object -w --stdin) &&
++	git update-index --add --cacheinfo 100644,$blob,.gitattributes &&
++	git check-attr --cached --all trailing >actual 2>err &&
++	echo "warning: ignoring overly long attributes line 1" >expect &&
++	test_cmp expect err &&
++	test_must_be_empty actual
++'
++
++test_expect_success EXPENSIVE 'large attributes file ignored in index' '
++	test_when_finished "git update-index --remove .gitattributes" &&
++	blob=$(dd if=/dev/zero bs=101M count=1 2>/dev/null | git hash-object -w --stdin) &&
++	git update-index --add --cacheinfo 100644,$blob,.gitattributes &&
++	git check-attr --cached --all path >/dev/null 2>err &&
++	echo "warning: ignoring overly large gitattributes blob ${SQ}.gitattributes${SQ}" >expect &&
++	test_cmp expect err
++'
++
+ test_done
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index b5d0004712..d707f25456 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -11,8 +11,8 @@ SRC_URI = "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.gz;name=tarball \
            ${KERNELORG_MIRROR}/software/scm/git/git-manpages-${PV}.tar.gz;name=manpages \
            file://fixsort.patch \
            file://CVE-2021-40330.patch \
+           file://CVE-2022-23521.patch \
            "
-
 S = "${WORKDIR}/git-${PV}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=7c0d7ef03a7eb04ce795b0f60e68e7e1"
-- 
2.34.1


