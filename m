Return-Path: <sanakazisk19@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D35FC433F5
	for <webhook@archiver.kernel.org>; Thu,  7 Oct 2021 13:40:03 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web09.11807.1633614002969903035
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Oct 2021 06:40:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=j/dwqolL;
 spf=pass (domain: gmail.com, ip: 209.85.216.47,
 mailfrom: sanakazisk19@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id
 d13-20020a17090ad3cd00b0019e746f7bd4so6975868pjw.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Oct 2021 06:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=oU1wbxmKabejCisd/V2aB8k3hgI9y1igCHqPjSuBrx8=;
        b=j/dwqolLSzpqhh4vg7hTlvePmesCALfoU/jblfLaLVTIAdFkutBJoAawqG3oMm2jZ3
         Pbi7+C78iTayPDGpJosyWHasalH9mhyHwVA8bEqzLJ+xQfhT47WVGVPltQ1El7584SQb
         U99ebMDVvY3n81140yjrdaqLyBbz6ZCKR+vRgs+bMHmOZzNa0+spUFJJLJkiXbcKCrzJ
         WPNbw3RM7Lj/oaIF0wUvZA4G4tNd5rvNRkDOqXL4EZG7zoBYqHhvVZ18DC76ke+Z6SIZ
         mnelZW7S1RtRMtnkGLYF+MWUUvZGfcd9KlD+ANC32xpBHOyzl9ovfKsbKjpRsdhpn06Z
         9R3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=oU1wbxmKabejCisd/V2aB8k3hgI9y1igCHqPjSuBrx8=;
        b=Bgbu6f3e4H4tZfBDx8+bWvPzpjPelNViVm8aydFoGheBlcVgP7iMjpHbUzGcOzfDdu
         YVhNk795jHklErp70T1UI++U2u9lHYVjialvSWvhn7xZTGpwaBpNTBCyPMmmw8X9s149
         Xr/21Ag+Uh7mAd3kEDqPsCZi1yOGZ8UhOss32Qz1FVWUKPKt1oRDM7fEqYsaulUH702L
         y3fdpvOZcpl6bZr1oohmsSzceox4fjxvHxp8hVkcThobVbjGf1P9g+FUZQKRY14jbnmy
         1Va+y3SgvwqDsyvQoDO3JIDUtFVCKIjTVJINxs+/PIjSTqhmtn6hI3ue7CmntzoqvJFv
         vPkw==
X-Gm-Message-State: AOAM531gQ0QjO1Oc+D14Qb5LXCJrso0P4juJGPmS+bHnp3sqRlis6h1j
	HESIoxmcT2fxo2zS3s4SPoJzU3NIfPo=
X-Google-Smtp-Source: 
 ABdhPJya9lKf0k6FjgLafrP1gKVW/JtG4urWyH/uC4RU5y6S2GavfCufJIV3/A6ifJbVN2mtOZgOxg==
X-Received: by 2002:a17:902:708b:b0:13e:1a20:f1b0 with SMTP id
 z11-20020a170902708b00b0013e1a20f1b0mr3906749plk.51.1633614000851;
        Thu, 07 Oct 2021 06:40:00 -0700 (PDT)
Received: from localhost.localdomain
 ([2401:4900:502d:3224:84af:26a8:4c79:8890])
        by smtp.gmail.com with ESMTPSA id
 r7sm24087062pff.112.2021.10.07.06.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 06:40:00 -0700 (PDT)
From: Sana Kazi <sanakazisk19@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Sana Kazi <sanakazisk19@gmail.com>
Subject: [meta-oe][dunfell][PATCH 1/3] dovecot: Fix CVE-2020-12100
Date: Thu,  7 Oct 2021 19:09:19 +0530
Message-Id: <20211007133921.3753-1-sanakazisk19@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Oct 2021 13:40:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156722

Added patches to fix CVE-2020-12100

Link: http://archive.ubuntu.com/ubuntu/pool/main/d/dovecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz

Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
Signed-off-by: Sana Kazi <sanakazisk19@gmail.com>
---
 ...-parser-Add-a-message_part_finish-he.patch |  76 +++++++
 ...-parser-Change-message_part_append-t.patch |  71 +++++++
 ...-parser-Optimize-updating-children_c.patch |  49 +++++
 ...-parser-Optimize-appending-new-part-.patch |  88 ++++++++
 ...-parser-Minor-code-cleanup-to-findin.patch |  45 +++++
 ...-parser-Truncate-excessively-long-MI.patch | 163 +++++++++++++++
 ...-parser-Optimize-boundary-lookups-wh.patch |  72 +++++++
 ...-parser-Add-boundary_remove_until-he.patch |  50 +++++
 ...-parser-Don-t-use-memory-pool-for-pa.patch | 169 ++++++++++++++++
 ...-parser-Support-limiting-max-number-.patch | 188 ++++++++++++++++++
 ...-parser-Support-limiting-max-number-.patch |  87 ++++++++
 ...handling-trailing-in-MIME-boundaries.patch | 133 +++++++++++++
 ...Fix-parse_too_many_nested_mime_parts.patch |  32 +++
 .../dovecot/dovecot/buffer_free_fix.patch     |  27 +++
 .../dovecot/dovecot_2.2.36.4.bb               |  14 ++
 15 files changed, 1264 insertions(+)
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/0001-lib-mail-message-parser-Add-a-message_part_finish-he.patch
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/0002-lib-mail-message-parser-Change-message_part_append-t.patch
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/0003-lib-mail-message-parser-Optimize-updating-children_c.patch
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/0004-lib-mail-message-parser-Optimize-appending-new-part-.patch
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/0005-lib-mail-message-parser-Minor-code-cleanup-to-findin.patch
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/0006-lib-mail-message-parser-Truncate-excessively-long-MI.patch
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/0007-lib-mail-message-parser-Optimize-boundary-lookups-wh.patch
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/0008-lib-mail-message-parser-Add-boundary_remove_until-he.patch
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/0009-lib-mail-message-parser-Don-t-use-memory-pool-for-pa.patch
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/0010-lib-mail-message-parser-Support-limiting-max-number-.patch
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/0011-lib-mail-message-parser-Support-limiting-max-number-.patch
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/0012-lib-mail-Fix-handling-trailing-in-MIME-boundaries.patch
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/0013-lib-mail-Fix-parse_too_many_nested_mime_parts.patch
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/buffer_free_fix.patch

diff --git a/meta-networking/recipes-support/dovecot/dovecot/0001-lib-mail-message-parser-Add-a-message_part_finish-he.patch b/meta-networking/recipes-support/dovecot/dovecot/0001-lib-mail-message-parser-Add-a-message_part_finish-he.patch
new file mode 100644
index 000000000..583f71ca5
--- /dev/null
+++ b/meta-networking/recipes-support/dovecot/dovecot/0001-lib-mail-message-parser-Add-a-message_part_finish-he.patch
@@ -0,0 +1,76 @@
+From 667d353b0f217372e8cc43ea4fe13466689c7ed0 Mon Sep 17 00:00:00 2001
+From: Timo Sirainen <timo.sirainen@open-xchange.com>
+Date: Thu, 23 Apr 2020 11:33:31 +0300
+Subject: [PATCH 01/13] lib-mail: message-parser - Add a message_part_finish()
+ helper function
+
+---
+ src/lib-mail/message-parser.c | 25 ++++++++++++-------------
+ 1 file changed, 12 insertions(+), 13 deletions(-)
+
+Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
+
+CVE: CVE-2020-12100
+Upstream-Status: Backport [http://archive.ubuntu.com/ubuntu/pool/main/d/dovecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz]
+Comment: No change in any hunk
+
+diff --git a/src/lib-mail/message-parser.c b/src/lib-mail/message-parser.c
+index b1de1950a..aaa8dd8b7 100644
+--- a/src/lib-mail/message-parser.c
++++ b/src/lib-mail/message-parser.c
+@@ -195,6 +195,13 @@ message_part_append(pool_t pool, struct message_part *parent)
+ 	return part;
+ }
+ 
++static void message_part_finish(struct message_parser_ctx *ctx)
++{
++	message_size_add(&ctx->part->parent->body_size, &ctx->part->body_size);
++	message_size_add(&ctx->part->parent->body_size, &ctx->part->header_size);
++	ctx->part = ctx->part->parent;
++}
++
+ static void parse_next_body_multipart_init(struct message_parser_ctx *ctx)
+ {
+ 	struct message_boundary *b;
+@@ -312,19 +319,16 @@ static int parse_part_finish(struct message_parser_ctx *ctx,
+ 			     struct message_boundary *boundary,
+ 			     struct message_block *block_r, bool first_line)
+ {
+-	struct message_part *part;
+ 	size_t line_size;
+ 
+ 	i_assert(ctx->last_boundary == NULL);
+ 
+ 	/* get back to parent MIME part, summing the child MIME part sizes
+ 	   into parent's body sizes */
+-	for (part = ctx->part; part != boundary->part; part = part->parent) {
+-		message_size_add(&part->parent->body_size, &part->body_size);
+-		message_size_add(&part->parent->body_size, &part->header_size);
++	while (ctx->part != boundary->part) {
++		message_part_finish(ctx);
++		i_assert(ctx->part != NULL);
+ 	}
+-	i_assert(part != NULL);
+-	ctx->part = part;
+ 
+ 	if (boundary->epilogue_found) {
+ 		/* this boundary isn't needed anymore */
+@@ -1132,13 +1136,8 @@ int message_parser_parse_next_block(struct message_parser_ctx *ctx,
+ 		i_assert(ctx->input->eof || ctx->input->closed ||
+ 			 ctx->input->stream_errno != 0 ||
+ 			 ctx->broken_reason != NULL);
+-		while (ctx->part->parent != NULL) {
+-			message_size_add(&ctx->part->parent->body_size,
+-					 &ctx->part->body_size);
+-			message_size_add(&ctx->part->parent->body_size,
+-					 &ctx->part->header_size);
+-			ctx->part = ctx->part->parent;
+-		}
++		while (ctx->part->parent != NULL)
++			message_part_finish(ctx);
+ 	}
+ 
+ 	if (block_r->size == 0) {
+-- 
+2.11.0
+
diff --git a/meta-networking/recipes-support/dovecot/dovecot/0002-lib-mail-message-parser-Change-message_part_append-t.patch b/meta-networking/recipes-support/dovecot/dovecot/0002-lib-mail-message-parser-Change-message_part_append-t.patch
new file mode 100644
index 000000000..9f24320eb
--- /dev/null
+++ b/meta-networking/recipes-support/dovecot/dovecot/0002-lib-mail-message-parser-Change-message_part_append-t.patch
@@ -0,0 +1,71 @@
+From de0da7bc8df55521db8fa787f88e293618c96386 Mon Sep 17 00:00:00 2001
+From: Timo Sirainen <timo.sirainen@open-xchange.com>
+Date: Thu, 23 Apr 2020 11:34:22 +0300
+Subject: [PATCH 02/13] lib-mail: message-parser - Change message_part_append()
+ to do all work internally
+
+---
+ src/lib-mail/message-parser.c | 13 +++++++------
+ 1 file changed, 7 insertions(+), 6 deletions(-)
+
+Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
+
+CVE: CVE-2020-12100
+Upstream-Status: Backport [http://archive.ubuntu.com/ubuntu/pool/main/d/dovecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz]
+Comment: No change in any hunk
+
+diff --git a/src/lib-mail/message-parser.c b/src/lib-mail/message-parser.c
+index aaa8dd8b7..2edf3e7a6 100644
+--- a/src/lib-mail/message-parser.c
++++ b/src/lib-mail/message-parser.c
+@@ -167,16 +167,17 @@ static int message_parser_read_more(struct message_parser_ctx *ctx,
+ 	return 1;
+ }
+ 
+-static struct message_part *
+-message_part_append(pool_t pool, struct message_part *parent)
++static void
++message_part_append(struct message_parser_ctx *ctx)
+ {
++	struct message_part *parent = ctx->part;
+ 	struct message_part *p, *part, **list;
+ 
+ 	i_assert(parent != NULL);
+ 	i_assert((parent->flags & (MESSAGE_PART_FLAG_MULTIPART |
+ 				   MESSAGE_PART_FLAG_MESSAGE_RFC822)) != 0);
+ 
+-	part = p_new(pool, struct message_part, 1);
++	part = p_new(ctx->part_pool, struct message_part, 1);
+ 	part->parent = parent;
+ 	for (p = parent; p != NULL; p = p->parent)
+ 		p->children_count++;
+@@ -192,7 +193,7 @@ message_part_append(pool_t pool, struct message_part *parent)
+ 		list = &(*list)->next;
+ 
+ 	*list = part;
+-	return part;
++	ctx->part = part;
+ }
+ 
+ static void message_part_finish(struct message_parser_ctx *ctx)
+@@ -220,7 +221,7 @@ static void parse_next_body_multipart_init(struct message_parser_ctx *ctx)
+ static int parse_next_body_message_rfc822_init(struct message_parser_ctx *ctx,
+ 					       struct message_block *block_r)
+ {
+-	ctx->part = message_part_append(ctx->part_pool, ctx->part);
++	message_part_append(ctx);
+ 	return parse_next_header_init(ctx, block_r);
+ }
+ 
+@@ -270,7 +271,7 @@ boundary_line_find(struct message_parser_ctx *ctx,
+ static int parse_next_mime_header_init(struct message_parser_ctx *ctx,
+ 				       struct message_block *block_r)
+ {
+-	ctx->part = message_part_append(ctx->part_pool, ctx->part);
++	message_part_append(ctx);
+ 	ctx->part->flags |= MESSAGE_PART_FLAG_IS_MIME;
+ 
+ 	return parse_next_header_init(ctx, block_r);
+-- 
+2.11.0
+
diff --git a/meta-networking/recipes-support/dovecot/dovecot/0003-lib-mail-message-parser-Optimize-updating-children_c.patch b/meta-networking/recipes-support/dovecot/dovecot/0003-lib-mail-message-parser-Optimize-updating-children_c.patch
new file mode 100644
index 000000000..e53090235
--- /dev/null
+++ b/meta-networking/recipes-support/dovecot/dovecot/0003-lib-mail-message-parser-Optimize-updating-children_c.patch
@@ -0,0 +1,49 @@
+From a9800b436fcf1f9633c2b136a9c5cb7a486a8a52 Mon Sep 17 00:00:00 2001
+From: Timo Sirainen <timo.sirainen@open-xchange.com>
+Date: Thu, 23 Apr 2020 11:36:48 +0300
+Subject: [PATCH 03/13] lib-mail: message-parser - Optimize updating
+ children_count
+
+---
+ src/lib-mail/message-parser.c | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
+
+CVE: CVE-2020-12100
+Upstream-Status: Backport [http://archive.ubuntu.com/ubuntu/pool/main/d/dovecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz]
+Comment: No change in any hunk
+
+diff --git a/src/lib-mail/message-parser.c b/src/lib-mail/message-parser.c
+index 2edf3e7a6..05768a058 100644
+--- a/src/lib-mail/message-parser.c
++++ b/src/lib-mail/message-parser.c
+@@ -171,7 +171,7 @@ static void
+ message_part_append(struct message_parser_ctx *ctx)
+ {
+ 	struct message_part *parent = ctx->part;
+-	struct message_part *p, *part, **list;
++	struct message_part *part, **list;
+ 
+ 	i_assert(parent != NULL);
+ 	i_assert((parent->flags & (MESSAGE_PART_FLAG_MULTIPART |
+@@ -179,8 +179,6 @@ message_part_append(struct message_parser_ctx *ctx)
+ 
+ 	part = p_new(ctx->part_pool, struct message_part, 1);
+ 	part->parent = parent;
+-	for (p = parent; p != NULL; p = p->parent)
+-		p->children_count++;
+ 
+ 	/* set child position */
+ 	part->physical_pos =
+@@ -200,6 +198,7 @@ static void message_part_finish(struct message_parser_ctx *ctx)
+ {
+ 	message_size_add(&ctx->part->parent->body_size, &ctx->part->body_size);
+ 	message_size_add(&ctx->part->parent->body_size, &ctx->part->header_size);
++	ctx->part->parent->children_count += 1 + ctx->part->children_count;
+ 	ctx->part = ctx->part->parent;
+ }
+ 
+-- 
+2.11.0
+
diff --git a/meta-networking/recipes-support/dovecot/dovecot/0004-lib-mail-message-parser-Optimize-appending-new-part-.patch b/meta-networking/recipes-support/dovecot/dovecot/0004-lib-mail-message-parser-Optimize-appending-new-part-.patch
new file mode 100644
index 000000000..c35bf883e
--- /dev/null
+++ b/meta-networking/recipes-support/dovecot/dovecot/0004-lib-mail-message-parser-Optimize-appending-new-part-.patch
@@ -0,0 +1,88 @@
+From 99ee7596712cf0ea0a288b712bc898ecb2b35f9b Mon Sep 17 00:00:00 2001
+From: Timo Sirainen <timo.sirainen@open-xchange.com>
+Date: Thu, 23 Apr 2020 12:00:38 +0300
+Subject: [PATCH 04/13] lib-mail: message-parser - Optimize appending new part
+ to linked list
+
+---
+ src/lib-mail/message-parser.c | 28 ++++++++++++++++++++++------
+ 1 file changed, 22 insertions(+), 6 deletions(-)
+
+Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
+
+CVE: CVE-2020-12100
+Upstream-Status: Backport [http://archive.ubuntu.com/ubuntu/pool/main/d/dovecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz]
+Comment: No change in any hunk
+
+--- a/src/lib-mail/message-parser.c
++++ b/src/lib-mail/message-parser.c
+@@ -1,7 +1,7 @@
+ /* Copyright (c) 2002-2017 Dovecot authors, see the included COPYING file */
+ 
+ #include "lib.h"
+-#include "buffer.h"
++#include "array.h"
+ #include "str.h"
+ #include "istream.h"
+ #include "rfc822-parser.h"
+@@ -34,6 +34,9 @@ struct message_parser_ctx {
+ 	const char *last_boundary;
+ 	struct message_boundary *boundaries;
+ 
++	struct message_part **next_part;
++	ARRAY(struct message_part **) next_part_stack;
++
+ 	size_t skip;
+ 	char last_chr;
+ 	unsigned int want_count;
+@@ -171,7 +174,7 @@ static void
+ message_part_append(struct message_parser_ctx *ctx)
+ {
+ 	struct message_part *parent = ctx->part;
+-	struct message_part *part, **list;
++	struct message_part *part;
+ 
+ 	i_assert(parent != NULL);
+ 	i_assert((parent->flags & (MESSAGE_PART_FLAG_MULTIPART |
+@@ -186,16 +189,27 @@ message_part_append(struct message_parse
+ 		parent->body_size.physical_size +
+ 		parent->header_size.physical_size;
+ 
+-	list = &part->parent->children;
+-	while (*list != NULL)
+-		list = &(*list)->next;
++	/* add to parent's linked list */
++	*ctx->next_part = part;
++	/* update the parent's end-of-linked-list pointer */
++	struct message_part **next_part = &part->next;
++	array_append(&ctx->next_part_stack, &next_part, 1);
++	/* This part is now the new parent for the next message_part_append()
++	   call. Its linked list begins with the children pointer. */
++	ctx->next_part = &part->children;
+ 
+-	*list = part;
+ 	ctx->part = part;
+ }
+ 
+ static void message_part_finish(struct message_parser_ctx *ctx)
+ {
++	struct message_part **const *parent_next_partp;
++	unsigned int count = array_count(&ctx->next_part_stack);
++	
++	parent_next_partp = array_idx(&ctx->next_part_stack, count-1);
++	array_delete(&ctx->next_part_stack, count-1, 1);
++	ctx->next_part = *parent_next_partp;
++
+ 	message_size_add(&ctx->part->parent->body_size, &ctx->part->body_size);
+ 	message_size_add(&ctx->part->parent->body_size, &ctx->part->header_size);
+ 	ctx->part->parent->children_count += 1 + ctx->part->children_count;
+@@ -1062,7 +1076,9 @@ message_parser_init(pool_t part_pool, st
+ 	ctx = message_parser_init_int(input, hdr_flags, flags);
+ 	ctx->part_pool = part_pool;
+ 	ctx->parts = ctx->part = p_new(part_pool, struct message_part, 1);
++	ctx->next_part = &ctx->part->children;
+ 	ctx->parse_next_block = parse_next_header_init;
++	p_array_init(&ctx->next_part_stack, ctx->parser_pool, 4);
+ 	return ctx;
+ }
+ 
diff --git a/meta-networking/recipes-support/dovecot/dovecot/0005-lib-mail-message-parser-Minor-code-cleanup-to-findin.patch b/meta-networking/recipes-support/dovecot/dovecot/0005-lib-mail-message-parser-Minor-code-cleanup-to-findin.patch
new file mode 100644
index 000000000..4e63509b4
--- /dev/null
+++ b/meta-networking/recipes-support/dovecot/dovecot/0005-lib-mail-message-parser-Minor-code-cleanup-to-findin.patch
@@ -0,0 +1,45 @@
+From e39c95b248917eb2b596ca55a957f3cbc7fd406f Mon Sep 17 00:00:00 2001
+From: Timo Sirainen <timo.sirainen@open-xchange.com>
+Date: Thu, 23 Apr 2020 12:10:07 +0300
+Subject: [PATCH 05/13] lib-mail: message-parser - Minor code cleanup to
+ finding the end of boundary line
+
+---
+ src/lib-mail/message-parser.c | 9 ++++-----
+ 1 file changed, 4 insertions(+), 5 deletions(-)
+
+Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
+
+CVE: CVE-2020-12100
+Upstream-Status: Backport [http://archive.ubuntu.com/ubuntu/pool/main/d/dovecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz]
+Comment: No change in any hunk
+
+diff --git a/src/lib-mail/message-parser.c b/src/lib-mail/message-parser.c
+index ff4e09e5a..6c6a680b5 100644
+--- a/src/lib-mail/message-parser.c
++++ b/src/lib-mail/message-parser.c
+@@ -260,17 +260,16 @@ boundary_line_find(struct message_parser_ctx *ctx,
+ 	}
+ 
+ 	/* need to find the end of line */
+-	if (memchr(data + 2, '\n', size - 2) == NULL &&
+-	    size < BOUNDARY_END_MAX_LEN &&
++	data += 2;
++	size -= 2;
++	if (memchr(data, '\n', size) == NULL &&
++	    size+2 < BOUNDARY_END_MAX_LEN &&
+ 	    !ctx->input->eof && !full) {
+ 		/* no LF found */
+ 		ctx->want_count = BOUNDARY_END_MAX_LEN;
+ 		return 0;
+ 	}
+ 
+-	data += 2;
+-	size -= 2;
+-
+ 	*boundary_r = boundary_find(ctx->boundaries, data, size);
+ 	if (*boundary_r == NULL)
+ 		return -1;
+-- 
+2.11.0
+
diff --git a/meta-networking/recipes-support/dovecot/dovecot/0006-lib-mail-message-parser-Truncate-excessively-long-MI.patch b/meta-networking/recipes-support/dovecot/dovecot/0006-lib-mail-message-parser-Truncate-excessively-long-MI.patch
new file mode 100644
index 000000000..1012d7983
--- /dev/null
+++ b/meta-networking/recipes-support/dovecot/dovecot/0006-lib-mail-message-parser-Truncate-excessively-long-MI.patch
@@ -0,0 +1,163 @@
+From aed125484a346b4893c1a169088c39fe7ced01f3 Mon Sep 17 00:00:00 2001
+From: Timo Sirainen <timo.sirainen@open-xchange.com>
+Date: Thu, 23 Apr 2020 12:53:12 +0300
+Subject: [PATCH 06/13] lib-mail: message-parser - Truncate excessively long
+ MIME boundaries
+
+RFC 2046 requires that the boundaries are a maximum of 70 characters
+(excluding the "--" prefix and suffix). We allow 80 characters for a bit of
+extra safety. Anything longer than that is truncated and treated the same
+as if it was just 80 characters.
+---
+ src/lib-mail/message-parser.c      |  7 ++-
+ src/lib-mail/test-message-parser.c | 95 ++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 100 insertions(+), 2 deletions(-)
+
+Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
+
+CVE: CVE-2020-12100
+Upstream-Status: Backport [http://archive.ubuntu.com/ubuntu/pool/main/d/dovecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz]
+Comment: No change in any hunk
+
+diff --git a/src/lib-mail/message-parser.c b/src/lib-mail/message-parser.c
+index 6c6a680b5..92f541b02 100644
+--- a/src/lib-mail/message-parser.c
++++ b/src/lib-mail/message-parser.c
+@@ -10,7 +10,8 @@
+ 
+ /* RFC-2046 requires boundaries are max. 70 chars + "--" prefix + "--" suffix.
+    We'll add a bit more just in case. */
+-#define BOUNDARY_END_MAX_LEN (70 + 2 + 2 + 10)
++#define BOUNDARY_STRING_MAX_LEN (70 + 10)
++#define BOUNDARY_END_MAX_LEN (BOUNDARY_STRING_MAX_LEN + 2 + 2)
+ 
+ struct message_boundary {
+ 	struct message_boundary *next;
+@@ -526,8 +527,10 @@ static void parse_content_type(struct message_parser_ctx *ctx,
+ 	rfc2231_parse(&parser, &results);
+ 	for (; *results != NULL; results += 2) {
+ 		if (strcasecmp(results[0], "boundary") == 0) {
++			/* truncate excessively long boundaries */
+ 			ctx->last_boundary =
+-				p_strdup(ctx->parser_pool, results[1]);
++				p_strndup(ctx->parser_pool, results[1],
++					  BOUNDARY_STRING_MAX_LEN);
+ 			break;
+ 		}
+ 	}
+diff --git a/src/lib-mail/test-message-parser.c b/src/lib-mail/test-message-parser.c
+index 1f1aa1437..94aa3eb7c 100644
+--- a/src/lib-mail/test-message-parser.c
++++ b/src/lib-mail/test-message-parser.c
+@@ -642,6 +642,100 @@ static void test_message_parser_no_eoh(void)
+ 	test_end();
+ }
+ 
++static void test_message_parser_long_mime_boundary(void)
++{
++	/* Close the boundaries in wrong reverse order. But because all
++	   boundaries are actually truncated to the same size (..890) it
++	   works the same as if all of them were duplicate boundaries. */
++static const char input_msg[] =
++"Content-Type: multipart/mixed; boundary=\"1234567890123456789012345678901234567890123456789012345678901234567890123456789012\"\n"
++"\n"
++"--1234567890123456789012345678901234567890123456789012345678901234567890123456789012\n"
++"Content-Type: multipart/mixed; boundary=\"123456789012345678901234567890123456789012345678901234567890123456789012345678901\"\n"
++"\n"
++"--123456789012345678901234567890123456789012345678901234567890123456789012345678901\n"
++"Content-Type: multipart/mixed; boundary=\"12345678901234567890123456789012345678901234567890123456789012345678901234567890\"\n"
++"\n"
++"--12345678901234567890123456789012345678901234567890123456789012345678901234567890\n"
++"Content-Type: text/plain\n"
++"\n"
++"1\n"
++"--1234567890123456789012345678901234567890123456789012345678901234567890123456789012\n"
++"Content-Type: text/plain\n"
++"\n"
++"22\n"
++"--123456789012345678901234567890123456789012345678901234567890123456789012345678901\n"
++"Content-Type: text/plain\n"
++"\n"
++"333\n"
++"--12345678901234567890123456789012345678901234567890123456789012345678901234567890\n"
++"Content-Type: text/plain\n"
++"\n"
++"4444\n";
++	struct message_parser_ctx *parser;
++	struct istream *input;
++	struct message_part *parts, *part;
++	struct message_block block;
++	pool_t pool;
++	int ret;
++
++	test_begin("message parser long mime boundary");
++	pool = pool_alloconly_create("message parser", 10240);
++	input = test_istream_create(input_msg);
++
++	parser = message_parser_init(pool, input, 0, 0);
++	while ((ret = message_parser_parse_next_block(parser, &block)) > 0) ;
++	test_assert(ret < 0);
++	message_parser_deinit(&parser, &parts);
++
++	part = parts;
++	test_assert(part->children_count == 6);
++	test_assert(part->flags == (MESSAGE_PART_FLAG_MULTIPART | MESSAGE_PART_FLAG_IS_MIME));
++	test_assert(part->header_size.lines == 2);
++	test_assert(part->header_size.physical_size == 126);
++	test_assert(part->header_size.virtual_size == 126+2);
++	test_assert(part->body_size.lines == 22);
++	test_assert(part->body_size.physical_size == 871);
++	test_assert(part->body_size.virtual_size == 871+22);
++
++	part = parts->children;
++	test_assert(part->children_count == 5);
++	test_assert(part->flags == (MESSAGE_PART_FLAG_MULTIPART | MESSAGE_PART_FLAG_IS_MIME));
++	test_assert(part->header_size.lines == 2);
++	test_assert(part->header_size.physical_size == 125);
++	test_assert(part->header_size.virtual_size == 125+2);
++	test_assert(part->body_size.lines == 19);
++	test_assert(part->body_size.physical_size == 661);
++	test_assert(part->body_size.virtual_size == 661+19);
++
++	part = parts->children->children;
++	test_assert(part->children_count == 4);
++	test_assert(part->flags == (MESSAGE_PART_FLAG_MULTIPART | MESSAGE_PART_FLAG_IS_MIME));
++	test_assert(part->header_size.lines == 2);
++	test_assert(part->header_size.physical_size == 124);
++	test_assert(part->header_size.virtual_size == 124+2);
++	test_assert(part->body_size.lines == 16);
++	test_assert(part->body_size.physical_size == 453);
++	test_assert(part->body_size.virtual_size == 453+16);
++
++	part = parts->children->children->children;
++	for (unsigned int i = 1; i <= 3; i++, part = part->next) {
++		test_assert(part->children_count == 0);
++		test_assert(part->flags == (MESSAGE_PART_FLAG_TEXT | MESSAGE_PART_FLAG_IS_MIME));
++		test_assert(part->header_size.lines == 2);
++		test_assert(part->header_size.physical_size == 26);
++		test_assert(part->header_size.virtual_size == 26+2);
++		test_assert(part->body_size.lines == 0);
++		test_assert(part->body_size.physical_size == i);
++		test_assert(part->body_size.virtual_size == i);
++	}
++
++	test_parsed_parts(input, parts);
++	i_stream_unref(&input);
++	pool_unref(&pool);
++	test_end();
++}
++
+ int main(void)
+ {
+ 	static void (*test_functions[])(void) = {
+@@ -654,6 +748,7 @@ int main(void)
+ 		test_message_parser_garbage_suffix_mime_boundary,
+ 		test_message_parser_continuing_mime_boundary,
+ 		test_message_parser_continuing_truncated_mime_boundary,
++		test_message_parser_long_mime_boundary,
+ 		test_message_parser_no_eoh,
+ 		NULL
+ 	};
+-- 
+2.11.0
+
diff --git a/meta-networking/recipes-support/dovecot/dovecot/0007-lib-mail-message-parser-Optimize-boundary-lookups-wh.patch b/meta-networking/recipes-support/dovecot/dovecot/0007-lib-mail-message-parser-Optimize-boundary-lookups-wh.patch
new file mode 100644
index 000000000..eeb6c96f1
--- /dev/null
+++ b/meta-networking/recipes-support/dovecot/dovecot/0007-lib-mail-message-parser-Optimize-boundary-lookups-wh.patch
@@ -0,0 +1,72 @@
+From 5f8de52fec3191a1aa68a399ee2068485737dc4f Mon Sep 17 00:00:00 2001
+From: Timo Sirainen <timo.sirainen@open-xchange.com>
+Date: Thu, 23 Apr 2020 13:06:02 +0300
+Subject: [PATCH 07/13] lib-mail: message-parser - Optimize boundary lookups
+ when exact boundary is found
+
+When an exact boundary is found, there's no need to continue looking for
+more boundaries.
+---
+ src/lib-mail/message-parser.c | 26 ++++++++++++++++++++++----
+ 1 file changed, 22 insertions(+), 4 deletions(-)
+
+Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
+
+CVE: CVE-2020-12100
+Upstream-Status: Backport [http://archive.ubuntu.com/ubuntu/pool/main/d/dovecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz]
+Comment: No change in any hunk
+
+diff --git a/src/lib-mail/message-parser.c b/src/lib-mail/message-parser.c
+index 92f541b02..c2934c761 100644
+--- a/src/lib-mail/message-parser.c
++++ b/src/lib-mail/message-parser.c
+@@ -80,8 +80,14 @@ boundary_find(struct message_boundary *boundaries,
+ 	while (boundaries != NULL) {
+ 		if (boundaries->len <= len &&
+ 		    memcmp(boundaries->boundary, data, boundaries->len) == 0 &&
+-		    (best == NULL || best->len < boundaries->len))
++		    (best == NULL || best->len < boundaries->len)) {
+ 			best = boundaries;
++			if (best->len == len) {
++				/* This is exactly the wanted boundary. There
++				   can't be a better one. */
++				break;
++			}
++		}
+ 
+ 		boundaries = boundaries->next;
+ 	}
+@@ -263,15 +269,27 @@ boundary_line_find(struct message_parser_ctx *ctx,
+ 	/* need to find the end of line */
+ 	data += 2;
+ 	size -= 2;
+-	if (memchr(data, '\n', size) == NULL &&
++	const unsigned char *lf_pos = memchr(data, '\n', size);
++	if (lf_pos == NULL &&
+ 	    size+2 < BOUNDARY_END_MAX_LEN &&
+ 	    !ctx->input->eof && !full) {
+ 		/* no LF found */
+ 		ctx->want_count = BOUNDARY_END_MAX_LEN;
+ 		return 0;
+ 	}
+-
+-	*boundary_r = boundary_find(ctx->boundaries, data, size);
++	size_t find_size = size;
++
++	if (lf_pos != NULL) {
++		find_size = lf_pos - data;
++		if (find_size > 0 && data[find_size-1] == '\r')
++			find_size--;
++		if (find_size > 2 && data[find_size-1] == '-' &&
++		    data[find_size-2] == '-')
++			find_size -= 2;
++	} else if (find_size > BOUNDARY_END_MAX_LEN)
++		find_size = BOUNDARY_END_MAX_LEN;
++
++	*boundary_r = boundary_find(ctx->boundaries, data, find_size);
+ 	if (*boundary_r == NULL)
+ 		return -1;
+ 
+-- 
+2.11.0
+
diff --git a/meta-networking/recipes-support/dovecot/dovecot/0008-lib-mail-message-parser-Add-boundary_remove_until-he.patch b/meta-networking/recipes-support/dovecot/dovecot/0008-lib-mail-message-parser-Add-boundary_remove_until-he.patch
new file mode 100644
index 000000000..4af070a87
--- /dev/null
+++ b/meta-networking/recipes-support/dovecot/dovecot/0008-lib-mail-message-parser-Add-boundary_remove_until-he.patch
@@ -0,0 +1,50 @@
+From 929396767d831bedbdec6392aaa835b045332fd3 Mon Sep 17 00:00:00 2001
+From: Timo Sirainen <timo.sirainen@open-xchange.com>
+Date: Thu, 23 Apr 2020 14:53:27 +0300
+Subject: [PATCH 08/13] lib-mail: message-parser - Add boundary_remove_until()
+ helper function
+
+---
+ src/lib-mail/message-parser.c | 11 +++++++++--
+ 1 file changed, 9 insertions(+), 2 deletions(-)
+
+Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
+
+CVE: CVE-2020-12100
+Upstream-Status: Backport [http://archive.ubuntu.com/ubuntu/pool/main/d/dovecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz]
+Comment: No change in any hunk
+
+diff --git a/src/lib-mail/message-parser.c b/src/lib-mail/message-parser.c
+index c2934c761..028f74159 100644
+--- a/src/lib-mail/message-parser.c
++++ b/src/lib-mail/message-parser.c
+@@ -223,6 +223,13 @@ static void message_part_finish(struct message_parser_ctx *ctx)
+ 	ctx->part = ctx->part->parent;
+ }
+ 
++static void
++boundary_remove_until(struct message_parser_ctx *ctx,
++		      struct message_boundary *boundary)
++{
++	ctx->boundaries = boundary;
++}
++
+ static void parse_next_body_multipart_init(struct message_parser_ctx *ctx)
+ {
+ 	struct message_boundary *b;
+@@ -364,10 +371,10 @@ static int parse_part_finish(struct message_parser_ctx *ctx,
+ 
+ 	if (boundary->epilogue_found) {
+ 		/* this boundary isn't needed anymore */
+-		ctx->boundaries = boundary->next;
++		boundary_remove_until(ctx, boundary->next);
+ 	} else {
+ 		/* forget about the boundaries we possibly skipped */
+-		ctx->boundaries = boundary;
++		boundary_remove_until(ctx, boundary);
+ 	}
+ 
+ 	/* the boundary itself should already be in buffer. add that. */
+-- 
+2.11.0
+
diff --git a/meta-networking/recipes-support/dovecot/dovecot/0009-lib-mail-message-parser-Don-t-use-memory-pool-for-pa.patch b/meta-networking/recipes-support/dovecot/dovecot/0009-lib-mail-message-parser-Don-t-use-memory-pool-for-pa.patch
new file mode 100644
index 000000000..aade7dc2b
--- /dev/null
+++ b/meta-networking/recipes-support/dovecot/dovecot/0009-lib-mail-message-parser-Don-t-use-memory-pool-for-pa.patch
@@ -0,0 +1,169 @@
+From d53d83214b1d635446a8cf8ff9438cc530133d62 Mon Sep 17 00:00:00 2001
+From: Timo Sirainen <timo.sirainen@open-xchange.com>
+Date: Thu, 23 Apr 2020 15:00:57 +0300
+Subject: [PATCH 09/13] lib-mail: message-parser - Don't use memory pool for
+ parser
+
+This reduces memory usage when parsing many MIME parts where boundaries are
+being added and removed constantly.
+---
+ src/lib-mail/message-parser.c | 48 ++++++++++++++++++++++++++++---------------
+ 1 file changed, 32 insertions(+), 16 deletions(-)
+
+Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
+
+CVE: CVE-2020-12100
+Upstream-Status: Backport [http://archive.ubuntu.com/ubuntu/pool/main/d/dovecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz]
+Comment: No change in any hunk
+
+diff --git a/src/lib-mail/message-parser.c b/src/lib-mail/message-parser.c
+index 028f74159..8970d8e0e 100644
+--- a/src/lib-mail/message-parser.c
++++ b/src/lib-mail/message-parser.c
+@@ -17,14 +17,14 @@ struct message_boundary {
+ 	struct message_boundary *next;
+ 
+ 	struct message_part *part;
+-	const char *boundary;
++	char *boundary;
+ 	size_t len;
+ 
+ 	unsigned int epilogue_found:1;
+ };
+ 
+ struct message_parser_ctx {
+-	pool_t parser_pool, part_pool;
++	pool_t part_pool;
+ 	struct istream *input;
+ 	struct message_part *parts, *part;
+ 	const char *broken_reason;
+@@ -32,7 +32,7 @@ struct message_parser_ctx {
+ 	enum message_header_parser_flags hdr_flags;
+ 	enum message_parser_flags flags;
+ 
+-	const char *last_boundary;
++	char *last_boundary;
+ 	struct message_boundary *boundaries;
+ 
+ 	struct message_part **next_part;
+@@ -223,10 +223,24 @@ static void message_part_finish(struct message_parser_ctx *ctx)
+ 	ctx->part = ctx->part->parent;
+ }
+ 
++static void message_boundary_free(struct message_boundary *b)
++{
++	i_free(b->boundary);
++	i_free(b);
++}
++
+ static void
+ boundary_remove_until(struct message_parser_ctx *ctx,
+ 		      struct message_boundary *boundary)
+ {
++	while (ctx->boundaries != boundary) {
++		struct message_boundary *cur = ctx->boundaries;
++
++		i_assert(cur != NULL);
++		ctx->boundaries = cur->next;
++		message_boundary_free(cur);
++
++	}
+ 	ctx->boundaries = boundary;
+ }
+ 
+@@ -234,15 +248,14 @@ static void parse_next_body_multipart_init(struct message_parser_ctx *ctx)
+ {
+ 	struct message_boundary *b;
+ 
+-	b = p_new(ctx->parser_pool, struct message_boundary, 1);
++	b = i_new(struct message_boundary, 1);
+ 	b->part = ctx->part;
+ 	b->boundary = ctx->last_boundary;
++	ctx->last_boundary = NULL;
+ 	b->len = strlen(b->boundary);
+ 
+ 	b->next = ctx->boundaries;
+ 	ctx->boundaries = b;
+-
+-	ctx->last_boundary = NULL;
+ }
+ 
+ static int parse_next_body_message_rfc822_init(struct message_parser_ctx *ctx,
+@@ -359,6 +372,8 @@ static int parse_part_finish(struct message_parser_ctx *ctx,
+ 			     struct message_block *block_r, bool first_line)
+ {
+ 	size_t line_size;
++	size_t boundary_len = boundary->len;
++	bool boundary_epilogue_found = boundary->epilogue_found;
+ 
+ 	i_assert(ctx->last_boundary == NULL);
+ 
+@@ -391,7 +406,7 @@ static int parse_part_finish(struct message_parser_ctx *ctx,
+ 		i_assert(block_r->data[0] == '\n');
+ 		line_size = 1;
+ 	}
+-	line_size += 2 + boundary->len + (boundary->epilogue_found ? 2 : 0);
++	line_size += 2 + boundary_len + (boundary_epilogue_found ? 2 : 0);
+ 	i_assert(block_r->size >= ctx->skip + line_size);
+ 	block_r->size = line_size;
+ 	parse_body_add_block(ctx, block_r);
+@@ -553,9 +568,9 @@ static void parse_content_type(struct message_parser_ctx *ctx,
+ 	for (; *results != NULL; results += 2) {
+ 		if (strcasecmp(results[0], "boundary") == 0) {
+ 			/* truncate excessively long boundaries */
++			i_free(ctx->last_boundary);
+ 			ctx->last_boundary =
+-				p_strndup(ctx->parser_pool, results[1],
+-					  BOUNDARY_STRING_MAX_LEN);
++				i_strndup(results[1], BOUNDARY_STRING_MAX_LEN);
+ 			break;
+ 		}
+ 	}
+@@ -678,7 +693,7 @@ static int parse_next_header(struct message_parser_ctx *ctx,
+ 		i_assert(!ctx->multipart);
+ 		part->flags = 0;
+ 	}
+-	ctx->last_boundary = NULL;
++	i_free(ctx->last_boundary);
+ 
+ 	if (!ctx->part_seen_content_type ||
+ 	    (part->flags & MESSAGE_PART_FLAG_IS_MIME) == 0) {
+@@ -1081,11 +1096,8 @@ message_parser_init_int(struct istream *input,
+ 			enum message_parser_flags flags)
+ {
+ 	struct message_parser_ctx *ctx;
+-	pool_t pool;
+ 
+-	pool = pool_alloconly_create("Message Parser", 1024);
+-	ctx = p_new(pool, struct message_parser_ctx, 1);
+-	ctx->parser_pool = pool;
++	ctx = i_new(struct message_parser_ctx, 1);
+ 	ctx->hdr_flags = hdr_flags;
+ 	ctx->flags = flags;
+ 	ctx->input = input;
+@@ -1105,7 +1117,7 @@ message_parser_init(pool_t part_pool, struct istream *input,
+ 	ctx->parts = ctx->part = p_new(part_pool, struct message_part, 1);
+ 	ctx->next_part = &ctx->part->children;
+ 	ctx->parse_next_block = parse_next_header_init;
+-	p_array_init(&ctx->next_part_stack, ctx->parser_pool, 4);
++	i_array_init(&ctx->next_part_stack, 4);
+ 	return ctx;
+ }
+ 
+@@ -1146,8 +1158,12 @@ int message_parser_deinit_from_parts(struct message_parser_ctx **_ctx,
+ 
+ 	if (ctx->hdr_parser_ctx != NULL)
+ 		message_parse_header_deinit(&ctx->hdr_parser_ctx);
++	boundary_remove_until(ctx, NULL);
+ 	i_stream_unref(&ctx->input);
+-	pool_unref(&ctx->parser_pool);
++	if (array_is_created(&ctx->next_part_stack))
++		array_free(&ctx->next_part_stack);
++	i_free(ctx->last_boundary);
++	i_free(ctx);
+ 	i_assert(ret < 0 || *parts_r != NULL);
+ 	return ret;
+ }
+-- 
+2.11.0
+
diff --git a/meta-networking/recipes-support/dovecot/dovecot/0010-lib-mail-message-parser-Support-limiting-max-number-.patch b/meta-networking/recipes-support/dovecot/dovecot/0010-lib-mail-message-parser-Support-limiting-max-number-.patch
new file mode 100644
index 000000000..ae5254466
--- /dev/null
+++ b/meta-networking/recipes-support/dovecot/dovecot/0010-lib-mail-message-parser-Support-limiting-max-number-.patch
@@ -0,0 +1,188 @@
+From df9e0d358ef86e3342525dcdefcf79dc2d749a30 Mon Sep 17 00:00:00 2001
+From: Timo Sirainen <timo.sirainen@open-xchange.com>
+Date: Thu, 23 Apr 2020 16:59:40 +0300
+Subject: [PATCH 10/13] lib-mail: message-parser - Support limiting max number
+ of nested MIME parts
+
+The default is to allow 100 nested MIME parts. When the limit is reached,
+the innermost MIME part's body contains all the rest of the inner bodies
+until a parent MIME part is reached.
+---
+ src/lib-mail/message-parser.c      | 43 +++++++++++++++++++++++++++++++-------
+ src/lib-mail/test-message-parser.c | 31 +++++++++++++++++++++++++++
+ 2 files changed, 67 insertions(+), 7 deletions(-)
+
+Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
+
+CVE: CVE-2020-12100
+Upstream-Status: Backport [http://archive.ubuntu.com/ubuntu/pool/main/d/dovecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz]
+Comment: No change in any hunk
+
+diff --git a/src/lib-mail/message-parser.c b/src/lib-mail/message-parser.c
+index 8970d8e0e..721615f76 100644
+--- a/src/lib-mail/message-parser.c
++++ b/src/lib-mail/message-parser.c
+@@ -13,6 +13,8 @@
+ #define BOUNDARY_STRING_MAX_LEN (70 + 10)
+ #define BOUNDARY_END_MAX_LEN (BOUNDARY_STRING_MAX_LEN + 2 + 2)
+ 
++#define MESSAGE_PARSER_DEFAULT_MAX_NESTED_MIME_PARTS 100
++
+ struct message_boundary {
+ 	struct message_boundary *next;
+ 
+@@ -28,9 +30,11 @@ struct message_parser_ctx {
+ 	struct istream *input;
+ 	struct message_part *parts, *part;
+ 	const char *broken_reason;
++	unsigned int nested_parts_count;
+ 
+ 	enum message_header_parser_flags hdr_flags;
+ 	enum message_parser_flags flags;
++	unsigned int max_nested_mime_parts;
+ 
+ 	char *last_boundary;
+ 	struct message_boundary *boundaries;
+@@ -206,6 +210,8 @@ message_part_append(struct message_parser_ctx *ctx)
+ 	ctx->next_part = &part->children;
+ 
+ 	ctx->part = part;
++	ctx->nested_parts_count++;
++	i_assert(ctx->nested_parts_count < ctx->max_nested_mime_parts);
+ }
+ 
+ static void message_part_finish(struct message_parser_ctx *ctx)
+@@ -213,8 +219,12 @@ static void message_part_finish(struct message_parser_ctx *ctx)
+ 	struct message_part **const *parent_next_partp;
+ 	unsigned int count = array_count(&ctx->next_part_stack);
+ 	
++	i_assert(ctx->nested_parts_count > 0);
++	ctx->nested_parts_count--;
++
+ 	parent_next_partp = array_idx(&ctx->next_part_stack, count-1);
+ 	array_delete(&ctx->next_part_stack, count-1, 1);
++
+ 	ctx->next_part = *parent_next_partp;
+ 
+ 	message_size_add(&ctx->part->parent->body_size, &ctx->part->body_size);
+@@ -592,6 +602,11 @@ static bool block_is_at_eoh(const struct message_block *block)
+ 	return FALSE;
+ }
+ 
++static bool parse_too_many_nested_mime_parts(struct message_parser_ctx *ctx)
++{
++	return ctx->nested_parts_count > ctx->max_nested_mime_parts;
++}
++
+ #define MUTEX_FLAGS \
+ 	(MESSAGE_PART_FLAG_MESSAGE_RFC822 | MESSAGE_PART_FLAG_MULTIPART)
+ 
+@@ -616,8 +631,12 @@ static int parse_next_header(struct message_parser_ctx *ctx,
+ 		   "\n--boundary" belongs to us or to a previous boundary.
+ 		   this is a problem if the boundary prefixes are identical,
+ 		   because MIME requires only the prefix to match. */
+-		parse_next_body_multipart_init(ctx);
+-		ctx->multipart = TRUE;
++		if (!parse_too_many_nested_mime_parts(ctx)) {
++			parse_next_body_multipart_init(ctx);
++			ctx->multipart = TRUE;
++		} else {
++			part->flags &= ~MESSAGE_PART_FLAG_MULTIPART;
++		}
+ 	}
+ 
+ 	/* before parsing the header see if we can find a --boundary from here.
+@@ -721,12 +740,16 @@ static int parse_next_header(struct message_parser_ctx *ctx,
+ 		i_assert(ctx->last_boundary == NULL);
+ 		ctx->multipart = FALSE;
+ 		ctx->parse_next_block = parse_next_body_to_boundary;
+-	} else if (part->flags & MESSAGE_PART_FLAG_MESSAGE_RFC822)
++	} else if ((part->flags & MESSAGE_PART_FLAG_MESSAGE_RFC822) != 0 &&
++		   !parse_too_many_nested_mime_parts(ctx)) {
+ 		ctx->parse_next_block = parse_next_body_message_rfc822_init;
+-	else if (ctx->boundaries != NULL)
+-		ctx->parse_next_block = parse_next_body_to_boundary;
+-	else
+-		ctx->parse_next_block = parse_next_body_to_eof;
++	} else {
++		part->flags &= ~MESSAGE_PART_FLAG_MESSAGE_RFC822;
++		if (ctx->boundaries != NULL)
++			ctx->parse_next_block = parse_next_body_to_boundary;
++		else
++			ctx->parse_next_block = parse_next_body_to_eof;
++	}
+ 
+ 	ctx->want_count = 1;
+ 
+@@ -1100,6 +1123,8 @@ message_parser_init_int(struct istream *input,
+ 	ctx = i_new(struct message_parser_ctx, 1);
+ 	ctx->hdr_flags = hdr_flags;
+ 	ctx->flags = flags;
++	ctx->max_nested_mime_parts =
++		MESSAGE_PARSER_DEFAULT_MAX_NESTED_MIME_PARTS;
+ 	ctx->input = input;
+ 	i_stream_ref(input);
+ 	return ctx;
+@@ -1159,6 +1184,10 @@ int message_parser_deinit_from_parts(struct message_parser_ctx **_ctx,
+ 	if (ctx->hdr_parser_ctx != NULL)
+ 		message_parse_header_deinit(&ctx->hdr_parser_ctx);
+ 	boundary_remove_until(ctx, NULL);
++	/* caller might have stopped the parsing early */
++	i_assert(ctx->nested_parts_count == 0 ||
++		 i_stream_have_bytes_left(ctx->input));
++
+ 	i_stream_unref(&ctx->input);
+ 	if (array_is_created(&ctx->next_part_stack))
+ 		array_free(&ctx->next_part_stack);
+diff --git a/src/lib-mail/test-message-parser.c b/src/lib-mail/test-message-parser.c
+index 94aa3eb7c..481d05942 100644
+--- a/src/lib-mail/test-message-parser.c
++++ b/src/lib-mail/test-message-parser.c
+@@ -166,6 +166,36 @@ static void test_message_parser_small_blocks(void)
+ 	test_end();
+ }
+ 
++static void test_message_parser_stop_early(void)
++{
++	struct message_parser_ctx *parser;
++	struct istream *input;
++	struct message_part *parts;
++	struct message_block block;
++	unsigned int i;
++	pool_t pool;
++	int ret;
++
++	test_begin("message parser stop early");
++	pool = pool_alloconly_create("message parser", 10240);
++	input = test_istream_create(test_msg);
++
++	test_istream_set_allow_eof(input, FALSE);
++	for (i = 1; i <= TEST_MSG_LEN+1; i++) {
++		i_stream_seek(input, 0);
++		test_istream_set_size(input, i);
++		parser = message_parser_init(pool, input, 0, 0);
++		while ((ret = message_parser_parse_next_block(parser,
++							      &block)) > 0) ;
++		test_assert(ret == 0);
++		message_parser_deinit(&parser, &parts);
++	}
++
++	i_stream_unref(&input);
++	pool_unref(&pool);
++	test_end();
++}
++
+ static void test_message_parser_truncated_mime_headers(void)
+ {
+ static const char input_msg[] =
+@@ -740,6 +770,7 @@ int main(void)
+ {
+ 	static void (*test_functions[])(void) = {
+ 		test_message_parser_small_blocks,
++		test_message_parser_stop_early,
+ 		test_message_parser_truncated_mime_headers,
+ 		test_message_parser_truncated_mime_headers2,
+ 		test_message_parser_truncated_mime_headers3,
+-- 
+2.11.0
+
diff --git a/meta-networking/recipes-support/dovecot/dovecot/0011-lib-mail-message-parser-Support-limiting-max-number-.patch b/meta-networking/recipes-support/dovecot/dovecot/0011-lib-mail-message-parser-Support-limiting-max-number-.patch
new file mode 100644
index 000000000..52848bf3a
--- /dev/null
+++ b/meta-networking/recipes-support/dovecot/dovecot/0011-lib-mail-message-parser-Support-limiting-max-number-.patch
@@ -0,0 +1,87 @@
+From d7bba401dd234802bcdb55ff27dfb99bffdab804 Mon Sep 17 00:00:00 2001
+From: Timo Sirainen <timo.sirainen@open-xchange.com>
+Date: Thu, 23 Apr 2020 17:09:33 +0300
+Subject: [PATCH 11/13] lib-mail: message-parser - Support limiting max number
+ of MIME parts
+
+The default is to allow 10000 MIME parts. When it's reached, no more
+MIME boundary lines will be recognized, so the rest of the mail belongs
+to the last added MIME part.
+---
+ src/lib-mail/message-parser.c | 14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
+
+Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
+
+CVE: CVE-2020-12100
+Upstream-Status: Backport [http://archive.ubuntu.com/ubuntu/pool/main/d/dovecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz]
+Comment: No change in any hunk
+
+diff --git a/src/lib-mail/message-parser.c b/src/lib-mail/message-parser.c
+index 721615f76..646307802 100644
+--- a/src/lib-mail/message-parser.c
++++ b/src/lib-mail/message-parser.c
+@@ -14,6 +14,7 @@
+ #define BOUNDARY_END_MAX_LEN (BOUNDARY_STRING_MAX_LEN + 2 + 2)
+ 
+ #define MESSAGE_PARSER_DEFAULT_MAX_NESTED_MIME_PARTS 100
++#define MESSAGE_PARSER_DEFAULT_MAX_TOTAL_MIME_PARTS 10000
+ 
+ struct message_boundary {
+ 	struct message_boundary *next;
+@@ -31,10 +32,12 @@ struct message_parser_ctx {
+ 	struct message_part *parts, *part;
+ 	const char *broken_reason;
+ 	unsigned int nested_parts_count;
++	unsigned int total_parts_count;
+ 
+ 	enum message_header_parser_flags hdr_flags;
+ 	enum message_parser_flags flags;
+ 	unsigned int max_nested_mime_parts;
++	unsigned int max_total_mime_parts;
+ 
+ 	char *last_boundary;
+ 	struct message_boundary *boundaries;
+@@ -211,7 +214,9 @@ message_part_append(struct message_parser_ctx *ctx)
+ 
+ 	ctx->part = part;
+ 	ctx->nested_parts_count++;
++	ctx->total_parts_count++;
+ 	i_assert(ctx->nested_parts_count < ctx->max_nested_mime_parts);
++	i_assert(ctx->total_parts_count <= ctx->max_total_mime_parts);
+ }
+ 
+ static void message_part_finish(struct message_parser_ctx *ctx)
+@@ -296,6 +301,12 @@ boundary_line_find(struct message_parser_ctx *ctx,
+ 		return -1;
+ 	}
+ 
++	if (ctx->total_parts_count >= ctx->max_total_mime_parts) {
++		/* can't add any more MIME parts. just stop trying to find
++		   more boundaries. */
++		return -1;
++	}
++
+ 	/* need to find the end of line */
+ 	data += 2;
+ 	size -= 2;
+@@ -1125,6 +1136,8 @@ message_parser_init_int(struct istream *input,
+ 	ctx->flags = flags;
+ 	ctx->max_nested_mime_parts =
+ 		MESSAGE_PARSER_DEFAULT_MAX_NESTED_MIME_PARTS;
++	ctx->max_total_mime_parts =
++		MESSAGE_PARSER_DEFAULT_MAX_TOTAL_MIME_PARTS;
+ 	ctx->input = input;
+ 	i_stream_ref(input);
+ 	return ctx;
+@@ -1142,6 +1155,7 @@ message_parser_init(pool_t part_pool, struct istream *input,
+ 	ctx->parts = ctx->part = p_new(part_pool, struct message_part, 1);
+ 	ctx->next_part = &ctx->part->children;
+ 	ctx->parse_next_block = parse_next_header_init;
++	ctx->total_parts_count = 1;
+ 	i_array_init(&ctx->next_part_stack, 4);
+ 	return ctx;
+ }
+-- 
+2.11.0
+
diff --git a/meta-networking/recipes-support/dovecot/dovecot/0012-lib-mail-Fix-handling-trailing-in-MIME-boundaries.patch b/meta-networking/recipes-support/dovecot/dovecot/0012-lib-mail-Fix-handling-trailing-in-MIME-boundaries.patch
new file mode 100644
index 000000000..a81177d2b
--- /dev/null
+++ b/meta-networking/recipes-support/dovecot/dovecot/0012-lib-mail-Fix-handling-trailing-in-MIME-boundaries.patch
@@ -0,0 +1,133 @@
+From 0c9d56b41b992a868f299e05677a67c4d0495523 Mon Sep 17 00:00:00 2001
+From: Timo Sirainen <timo.sirainen@open-xchange.com>
+Date: Thu, 2 Jul 2020 17:31:19 +0300
+Subject: [PATCH 12/13] lib-mail: Fix handling trailing "--" in MIME boundaries
+
+Broken by 5b8ec27fae941d06516c30476dcf4820c6d200ab
+---
+ src/lib-mail/message-parser.c      | 14 ++++++++----
+ src/lib-mail/test-message-parser.c | 46 ++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 56 insertions(+), 4 deletions(-)
+
+Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
+
+CVE: CVE-2020-12100
+Upstream-Status: Backport [http://archive.ubuntu.com/ubuntu/pool/main/d/dovecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz]
+Comment: No change in any hunk
+
+diff --git a/src/lib-mail/message-parser.c b/src/lib-mail/message-parser.c
+index 646307802..175d4b488 100644
+--- a/src/lib-mail/message-parser.c
++++ b/src/lib-mail/message-parser.c
+@@ -75,7 +75,7 @@ static int preparsed_parse_next_header_init(struct message_parser_ctx *ctx,
+ 
+ static struct message_boundary *
+ boundary_find(struct message_boundary *boundaries,
+-	      const unsigned char *data, size_t len)
++	      const unsigned char *data, size_t len, bool trailing_dashes)
+ {
+ 	struct message_boundary *best = NULL;
+ 
+@@ -89,7 +89,11 @@ boundary_find(struct message_boundary *boundaries,
+ 		    memcmp(boundaries->boundary, data, boundaries->len) == 0 &&
+ 		    (best == NULL || best->len < boundaries->len)) {
+ 			best = boundaries;
+-			if (best->len == len) {
++			/* If we see "foo--", it could either mean that there
++			   is a boundary named "foo" that ends now or there's
++			   a boundary "foo--" which continues. */
++			if (best->len == len ||
++			    (best->len == len-2 && trailing_dashes)) {
+ 				/* This is exactly the wanted boundary. There
+ 				   can't be a better one. */
+ 				break;
+@@ -319,6 +323,7 @@ boundary_line_find(struct message_parser_ctx *ctx,
+ 		return 0;
+ 	}
+ 	size_t find_size = size;
++	bool trailing_dashes = FALSE;
+ 
+ 	if (lf_pos != NULL) {
+ 		find_size = lf_pos - data;
+@@ -326,11 +331,12 @@ boundary_line_find(struct message_parser_ctx *ctx,
+ 			find_size--;
+ 		if (find_size > 2 && data[find_size-1] == '-' &&
+ 		    data[find_size-2] == '-')
+-			find_size -= 2;
++			trailing_dashes = TRUE;
+ 	} else if (find_size > BOUNDARY_END_MAX_LEN)
+ 		find_size = BOUNDARY_END_MAX_LEN;
+ 
+-	*boundary_r = boundary_find(ctx->boundaries, data, find_size);
++	*boundary_r = boundary_find(ctx->boundaries, data, find_size,
++				    trailing_dashes);
+ 	if (*boundary_r == NULL)
+ 		return -1;
+ 
+diff --git a/src/lib-mail/test-message-parser.c b/src/lib-mail/test-message-parser.c
+index 481d05942..113454ea0 100644
+--- a/src/lib-mail/test-message-parser.c
++++ b/src/lib-mail/test-message-parser.c
+@@ -510,6 +510,51 @@ static const char input_msg[] =
+ 	test_end();
+ }
+ 
++static void test_message_parser_trailing_dashes(void)
++{
++static const char input_msg[] =
++"Content-Type: multipart/mixed; boundary=\"a--\"\n"
++"\n"
++"--a--\n"
++"Content-Type: multipart/mixed; boundary=\"a----\"\n"
++"\n"
++"--a----\n"
++"Content-Type: text/plain\n"
++"\n"
++"body\n"
++"--a------\n"
++"Content-Type: text/html\n"
++"\n"
++"body2\n"
++"--a----";
++	struct message_parser_ctx *parser;
++	struct istream *input;
++	struct message_part *parts;
++	struct message_block block;
++	pool_t pool;
++	int ret;
++
++	test_begin("message parser trailing dashes");
++	pool = pool_alloconly_create("message parser", 10240);
++	input = test_istream_create(input_msg);
++
++	parser = message_parser_init(pool, input, 0, 0);
++	while ((ret = message_parser_parse_next_block(parser, &block)) > 0) ;
++	test_assert(ret < 0);
++	message_parser_deinit(&parser, &parts);
++
++	test_assert(parts->children_count == 2);
++	test_assert(parts->children->next == NULL);
++	test_assert(parts->children->children_count == 1);
++	test_assert(parts->children->children->next == NULL);
++	test_assert(parts->children->children->children_count == 0);
++
++	test_parsed_parts(input, parts);
++	i_stream_unref(&input);
++	pool_unref(&pool);
++	test_end();
++}
++
+ static void test_message_parser_continuing_mime_boundary(void)
+ {
+ static const char input_msg[] =
+@@ -777,6 +822,7 @@ int main(void)
+ 		test_message_parser_empty_multipart,
+ 		test_message_parser_duplicate_mime_boundary,
+ 		test_message_parser_garbage_suffix_mime_boundary,
++		test_message_parser_trailing_dashes,
+ 		test_message_parser_continuing_mime_boundary,
+ 		test_message_parser_continuing_truncated_mime_boundary,
+ 		test_message_parser_long_mime_boundary,
+-- 
+2.11.0
+
diff --git a/meta-networking/recipes-support/dovecot/dovecot/0013-lib-mail-Fix-parse_too_many_nested_mime_parts.patch b/meta-networking/recipes-support/dovecot/dovecot/0013-lib-mail-Fix-parse_too_many_nested_mime_parts.patch
new file mode 100644
index 000000000..97068345f
--- /dev/null
+++ b/meta-networking/recipes-support/dovecot/dovecot/0013-lib-mail-Fix-parse_too_many_nested_mime_parts.patch
@@ -0,0 +1,32 @@
+From f77a2b6c3ffe2ea96f4a4b05ec38dc9d53266ecb Mon Sep 17 00:00:00 2001
+From: Timo Sirainen <timo.sirainen@open-xchange.com>
+Date: Wed, 27 May 2020 11:35:55 +0300
+Subject: [PATCH 13/13] lib-mail: Fix parse_too_many_nested_mime_parts()
+
+This was originally correct, until it was "optimized" wrong and got merged.
+---
+ src/lib-mail/message-parser.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
+
+CVE: CVE-2020-12100
+Upstream-Status: Backport [http://archive.ubuntu.com/ubuntu/pool/main/d/dovecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz]
+Comment: No change in any hunk
+
+diff --git a/src/lib-mail/message-parser.c b/src/lib-mail/message-parser.c
+index 175d4b488..5b11772ff 100644
+--- a/src/lib-mail/message-parser.c
++++ b/src/lib-mail/message-parser.c
+@@ -621,7 +621,7 @@ static bool block_is_at_eoh(const struct message_block *block)
+ 
+ static bool parse_too_many_nested_mime_parts(struct message_parser_ctx *ctx)
+ {
+-	return ctx->nested_parts_count > ctx->max_nested_mime_parts;
++	return ctx->nested_parts_count+1 >= ctx->max_nested_mime_parts;
+ }
+ 
+ #define MUTEX_FLAGS \
+-- 
+2.11.0
+
diff --git a/meta-networking/recipes-support/dovecot/dovecot/buffer_free_fix.patch b/meta-networking/recipes-support/dovecot/dovecot/buffer_free_fix.patch
new file mode 100644
index 000000000..44f6564f8
--- /dev/null
+++ b/meta-networking/recipes-support/dovecot/dovecot/buffer_free_fix.patch
@@ -0,0 +1,27 @@
+From 1a6ff0beebf0ab0c71081eaff1d5d7fd26015a94 Mon Sep 17 00:00:00 2001
+From: Josef 'Jeff' Sipek <jeff.sipek@dovecot.fi>
+Date: Tue, 19 Sep 2017 13:26:57 +0300
+Subject: [PATCH] lib: buffer_free(NULL) should be a no-op
+
+---
+ src/lib/buffer.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
+
+CVE: CVE-2020-12100
+Upstream-Status: Backport [http://archive.ubuntu.com/ubuntu/pool/main/d/dovecot/dovecot_2.2.33.2-1ubuntu4.7.debian.tar.xz]
+Comment: No change in any hunk
+
+--- a/src/lib/buffer.c
++++ b/src/lib/buffer.c
+@@ -148,6 +148,9 @@ void buffer_free(buffer_t **_buf)
+ {
+ 	struct real_buffer *buf = (struct real_buffer *)*_buf;
+ 
++	if (buf == NULL)
++		return;
++
+ 	*_buf = NULL;
+ 	if (buf->alloced)
+ 		p_free(buf->pool, buf->w_buffer);
diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.2.36.4.bb b/meta-networking/recipes-support/dovecot/dovecot_2.2.36.4.bb
index e21a94ad6..407604c81 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.2.36.4.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.2.36.4.bb
@@ -10,6 +10,20 @@ SRC_URI = "http://dovecot.org/releases/2.2/dovecot-${PV}.tar.gz \
            file://dovecot.service \
            file://dovecot.socket \
            file://0001-doveadm-Fix-parallel-build.patch \
+           file://0001-lib-mail-message-parser-Add-a-message_part_finish-he.patch \
+           file://0002-lib-mail-message-parser-Change-message_part_append-t.patch \
+           file://0003-lib-mail-message-parser-Optimize-updating-children_c.patch \
+           file://0004-lib-mail-message-parser-Optimize-appending-new-part-.patch \
+           file://0005-lib-mail-message-parser-Minor-code-cleanup-to-findin.patch \
+           file://0006-lib-mail-message-parser-Truncate-excessively-long-MI.patch \
+           file://0007-lib-mail-message-parser-Optimize-boundary-lookups-wh.patch \
+           file://0008-lib-mail-message-parser-Add-boundary_remove_until-he.patch \
+           file://0009-lib-mail-message-parser-Don-t-use-memory-pool-for-pa.patch \
+           file://0010-lib-mail-message-parser-Support-limiting-max-number-.patch \
+           file://0011-lib-mail-message-parser-Support-limiting-max-number-.patch \
+           file://0012-lib-mail-Fix-handling-trailing-in-MIME-boundaries.patch \
+           file://0013-lib-mail-Fix-parse_too_many_nested_mime_parts.patch \
+           file://buffer_free_fix.patch \
            "
 
 SRC_URI[md5sum] = "66c4d71858b214afee5b390ee602dee2"
-- 
2.17.1


