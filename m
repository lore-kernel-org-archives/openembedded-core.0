Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A791E69197
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 21:26:58 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.35399.1732310808925753716
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Nov 2024 13:26:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=IKB76fQu;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2126408cf31so19300805ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 13:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732310808; x=1732915608; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jhySlt+IqygYTYOHawRvpCuuXOs4HjJpJFhGLM4ckNQ=;
        b=IKB76fQuOFVTCQxMui7ldQ0+5TMj+UQjXCqNp5HKCdRNFV4eE9Y2fM9Rqb4cs/O29j
         ZVg3eOUCMtxxfqCI826P9O8BCljVYa3o01eqBSmyB6owF0TaCrJxPaedcrFE3yrJQSqE
         zyIqZiy3W4bCV9vsszH3UcEZOdZs4HzlL8vyo1GHKU49yZ4iv78+3Vb55y1IcFpBkLd0
         alHFqv/gA3YCl2lShFSiTsQkbLFyTLxelbS/+gXTXDO4B9qu5MeKKhlCYo1vBpv905Lk
         DrJ5JoOfh08zQ/mT1bHLkN1168jjGOIFHzfrxaZ75twimCLokNNTtvoyrNomCHxMaiT8
         4lFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732310808; x=1732915608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jhySlt+IqygYTYOHawRvpCuuXOs4HjJpJFhGLM4ckNQ=;
        b=tbYlNdPoKt60R0pbnSb23WAmirED+f1s14SLBWqZr7FxabWQm5hjA/sGC1SW3VwNsb
         m59c0OAQrMhsYBRgSJfjdq919TCSYDXqZ3O/khIyIK1NoJ33rDu3vKW4VLFF2vEOy+lE
         QL2Bsadxjtr2v1HjsD39hdkWAUcMlBRKCo7Tw3Ozmh4kjXgkwbhWpUC6y1pEQYoSM089
         /Mn4wN4YX0WwdFKEMaj8WPGvMwVg/hD5mfLL6pwEVXnoSZ8b8dMcB+FXo+ye/GARZi4B
         L3N/jA83aRGptix0pz9cO+1UGgcRgPD6eYIbjtx/n9g/5pZFvinPMsz/h+Odc0Mnft6x
         4VnA==
X-Gm-Message-State: AOJu0Yyo0Oa7KqGNufg5cuGnKGavpIdn5bs2dyhD0qBkqmwUaGhZ4tCW
	XE2YNAFO37Gw/sZKpVeLZAyFZhFrGKumal/c0y/ehZj3wGbPIL2Wyhysr/GqMcmyl3c8TGg6OMs
	o
X-Gm-Gg: ASbGnctjnU7KLrBZlEo1lOCUa1lQFBDwQ6/K0t2hS3yqj85lX+mIyB6SfbtRP5MyJSI
	RPdDLZASnB9aVLhrBCjlVqI6V2lni9bpBkjxKMYmqYzhj95ojkUriB3opkFZeSmzh/cc4REW4HC
	8v3UAggor++soUNiKiKi0XUsHwGLBq/8yeUkJgTbolaLRmDaF62ZxmZj7Pwg8QVNS8hhjHyc6Fh
	hd4c0zIDF+2mW/THdXj7gsxQ1fYHXjEM6WvwME=
X-Google-Smtp-Source: AGHT+IFGvEAqJPz3nI92SKYU373UlkGHgBnwZxnuu0zj8s5O3zQqDIv+O/VJaSH0K4eC337ove0bhA==
X-Received: by 2002:a17:902:e741:b0:212:e29:3b2f with SMTP id d9443c01a7336-2129f5e7405mr56932585ad.44.1732310807940;
        Fri, 22 Nov 2024 13:26:47 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dbfe6fasm20814095ad.160.2024.11.22.13.26.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 13:26:47 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/19] ghostscript: Backport fix for multiple CVE's
Date: Fri, 22 Nov 2024 13:26:20 -0800
Message-Id: <21a81b592a33504d90f8c53842719cb1fcf96271.1732310669.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732310669.git.steve@sakoman.com>
References: <cover.1732310669.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 21:26:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207651

From: Vijay Anusuri <vanusuri@mvista.com>

import patch from ubuntu to fix
 CVE-2024-46951
 CVE-2024-46952
 CVE-2024-46953
 CVE-2024-46955
 CVE-2024-46956

Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/ghostscript/tree/debian/patches?h=ubuntu/jammy-security
Upstream commit
https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=ada21374f0c90cc3acf7ce0e96302394560c7aee
&
https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=1fb76aaddac34530242dfbb9579d9997dae41264
&
https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=294a3755e33f453dd92e2a7c4cfceb087ac09d6a
&
https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=ca1fc2aefe9796e321d0589afe7efb35063c8b2a
&
https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=ea69a1388245ad959d31c272b5ba66d40cebba2c]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ghostscript/CVE-2024-46951.patch          | 31 +++++++++
 .../ghostscript/CVE-2024-46952.patch          | 62 +++++++++++++++++
 .../ghostscript/CVE-2024-46953.patch          | 67 +++++++++++++++++++
 .../ghostscript/CVE-2024-46955.patch          | 60 +++++++++++++++++
 .../ghostscript/CVE-2024-46956.patch          | 30 +++++++++
 .../ghostscript/ghostscript_9.55.0.bb         |  5 ++
 6 files changed, 255 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2024-46951.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2024-46952.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2024-46953.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2024-46955.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2024-46956.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-46951.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-46951.patch
new file mode 100644
index 0000000000..b3481f03a4
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-46951.patch
@@ -0,0 +1,31 @@
+From ada21374f0c90cc3acf7ce0e96302394560c7aee Mon Sep 17 00:00:00 2001
+From: Zdenek Hutyra <zhutyra@centrum.cz>
+Date: Fri, 30 Aug 2024 13:16:39 +0100
+Subject: PS interpreter - check the type of the Pattern Implementation
+
+Bug #707991
+
+See bug report for details.
+
+CVE-2024-46951
+
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/ghostscript/tree/debian/patches/CVE-2024-46951.patch?h=ubuntu/jammy-security
+Upstream commit https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=ada21374f0c90cc3acf7ce0e96302394560c7aee]
+CVE: CVE-2024-46951
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ psi/zcolor.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+--- a/psi/zcolor.c
++++ b/psi/zcolor.c
+@@ -5054,6 +5054,9 @@ static int patterncomponent(i_ctx_t * i_
+             code = array_get(imemory, pImpl, 0, &pPatInst);
+             if (code < 0)
+                 return code;
++
++            if (!r_is_struct(&pPatInst) || (!r_has_stype(&pPatInst, imemory, st_pattern1_instance) && !r_has_stype(&pPatInst, imemory, st_pattern2_instance)))
++                return_error(gs_error_typecheck);
+             cc.pattern = r_ptr(&pPatInst, gs_pattern_instance_t);
+             if (pattern_instance_uses_base_space(cc.pattern))
+                 *n = n_comps;
diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-46952.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-46952.patch
new file mode 100644
index 0000000000..8b495a6f99
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-46952.patch
@@ -0,0 +1,62 @@
+From 1fb76aaddac34530242dfbb9579d9997dae41264 Mon Sep 17 00:00:00 2001
+From: Ken Sharp <Ken.Sharp@artifex.com>
+Date: Mon, 2 Sep 2024 15:14:01 +0100
+Subject: PDF interpreter - sanitise W array values in Xref streams
+
+Bug #708001 "Buffer overflow in PDF XRef stream"
+
+See bug report. I've chosen to fix this by checking the values in the
+W array; these can (currently at least) only have certain relatively
+small values.
+
+As a future proofing fix I've also updated field_size in
+pdf_xref_stream_entries() to be a 64-bit integer. This is far bigger
+than required, but matches the W array values and so prevents the
+mismatch which could lead to a buffer overrun.
+
+CVE-2024-46952
+
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/ghostscript/tree/debian/patches/CVE-2024-46952.patch?h=ubuntu/jammy-security
+Upstream commit https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=1fb76aaddac34530242dfbb9579d9997dae41264]
+CVE: CVE-2024-46952
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ pdf/pdf_xref.c | 20 +++++++++++++++++++-
+ 1 file changed, 19 insertions(+), 1 deletion(-)
+
+--- a/pdf/pdf_xref.c
++++ b/pdf/pdf_xref.c
+@@ -53,7 +53,7 @@ static int resize_xref(pdf_context *ctx,
+ static int read_xref_stream_entries(pdf_context *ctx, pdf_c_stream *s, uint64_t first, uint64_t last, uint64_t *W)
+ {
+     uint i, j;
+-    uint field_width = 0;
++    uint64_t field_width = 0;
+     uint32_t type = 0;
+     uint64_t objnum = 0, gen = 0;
+     byte *Buffer;
+@@ -292,6 +292,24 @@ static int pdfi_process_xref_stream(pdf_
+     }
+     pdfi_countdown(a);
+ 
++    /* W[0] is either:
++     * 0 (no type field) or a single byte with the type.
++     * W[1] is either:
++     * The object number of the next free object, the byte offset of this object in the file or the object5 number of the object stream where this object is stored.
++     * W[2] is either:
++     * The generation number to use if this object is used again, the generation number of the object or the index of this object within the object stream.
++     *
++     * Object and generation numbers are limited to unsigned 64-bit values, as are bytes offsets in the file, indexes of objects within the stream likewise (actually
++     * most of these are generally 32-bit max). So we can limit the field widths to 8 bytes, enough to hold a 64-bit number.
++     * Even if a later version of the spec makes these larger (which seems unlikely!) we still cna't cope with integers > 64-bits.
++     */
++    if (W[0] > 1 || W[1] > 8 || W[2] > 8) {
++        pdfi_close_file(ctx, XRefStrm);
++        pdfi_countdown(ctx->xref_table);
++        ctx->xref_table = NULL;
++        return code;
++    }
++
+     code = pdfi_dict_get_type(ctx, sdict, "Index", PDF_ARRAY, (pdf_obj **)&a);
+     if (code == gs_error_undefined) {
+         code = read_xref_stream_entries(ctx, XRefStrm, 0, size - 1, (uint64_t *)W);
diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-46953.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-46953.patch
new file mode 100644
index 0000000000..0e36838907
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-46953.patch
@@ -0,0 +1,67 @@
+From 294a3755e33f453dd92e2a7c4cfceb087ac09d6a Mon Sep 17 00:00:00 2001
+From: Zdenek Hutyra <zhutyra@centrum.cz>
+Date: Mon, 27 May 2024 13:38:36 +0100
+Subject: Bug 707793: Check for overflow validating format string
+
+for the output file name
+
+CVE-2024-46953
+
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/ghostscript/tree/debian/patches/CVE-2024-46953.patch?h=ubuntu/jammy-security
+Upstream commit https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=294a3755e33f453dd92e2a7c4cfceb087ac09d6a]
+CVE: CVE-2024-46953
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ base/gsdevice.c | 17 +++++++++++++----
+ 1 file changed, 13 insertions(+), 4 deletions(-)
+
+--- a/base/gsdevice.c
++++ b/base/gsdevice.c
+@@ -1069,7 +1069,7 @@ static int
+ gx_parse_output_format(gs_parsed_file_name_t *pfn, const char **pfmt)
+ {
+     bool have_format = false, field;
+-    int width[2], int_width = sizeof(int) * 3, w = 0;
++    uint width[2], int_width = sizeof(int) * 3, w = 0;
+     uint i;
+ 
+     /* Scan the file name for a format string, and validate it if present. */
+@@ -1098,6 +1098,8 @@ gx_parse_output_format(gs_parsed_file_na
+                         default: /* width (field = 0) and precision (field = 1) */
+                             if (strchr("0123456789", pfn->fname[i])) {
+                                 width[field] = width[field] * 10 + pfn->fname[i] - '0';
++                                if (width[field] > max_int)
++	                                return_error(gs_error_undefinedfilename);
+                                 continue;
+                             } else if (0 == field && '.' == pfn->fname[i]) {
+                                 field++;
+@@ -1126,8 +1128,10 @@ gx_parse_output_format(gs_parsed_file_na
+         /* Calculate a conservative maximum width. */
+         w = max(width[0], width[1]);
+         w = max(w, int_width) + 5;
++        if (w > max_int)
++            return_error(gs_error_undefinedfilename);
+     }
+-    return w;
++    return (int)w;
+ }
+ 
+ /*
+@@ -1180,10 +1184,15 @@ gx_parse_output_file_name(gs_parsed_file
+     if (!pfn->fname)
+         return 0;
+     code = gx_parse_output_format(pfn, pfmt);
+-    if (code < 0)
++    if (code < 0) {
+         return code;
+-    if (strlen(pfn->iodev->dname) + pfn->len + code >= gp_file_name_sizeof)
++    }
++
++    if (pfn->len >= gp_file_name_sizeof - strlen(pfn->iodev->dname) ||
++        code >= gp_file_name_sizeof - strlen(pfn->iodev->dname) - pfn->len) {
+         return_error(gs_error_undefinedfilename);
++    }
++
+     return 0;
+ }
+ 
diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-46955.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-46955.patch
new file mode 100644
index 0000000000..9186412a48
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-46955.patch
@@ -0,0 +1,60 @@
+From ca1fc2aefe9796e321d0589afe7efb35063c8b2a Mon Sep 17 00:00:00 2001
+From: Zdenek Hutyra <zhutyra@centrum.cz>
+Date: Fri, 30 Aug 2024 13:11:53 +0100
+Subject: PS interpreter - check Indexed colour space index
+
+Bug #707990 "Out of bounds read when reading color in "Indexed" color space"
+
+Check the 'index' is in the valid range (0 to hival) for the colour
+space.
+
+Also a couple of additional checks on the type of the 'proc' for
+Indexed, DeviceN and Separation spaces. Make sure these really are
+procs in case the user changed the colour space array.
+
+CVE-2024-46955
+
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/ghostscript/tree/debian/patches/CVE-2024-46955.patch?h=ubuntu/jammy-security
+Upstream commit https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=ca1fc2aefe9796e321d0589afe7efb35063c8b2a]
+CVE: CVE-2024-46955
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ psi/zcolor.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+--- a/psi/zcolor.c
++++ b/psi/zcolor.c
+@@ -3628,6 +3628,7 @@ static int septransform(i_ctx_t *i_ctx_p
+         code = array_get(imemory, sepspace, 3, &proc);
+         if (code < 0)
+             return code;
++        check_proc(proc);
+         *esp = proc;
+         return o_push_estack;
+     }
+@@ -4449,6 +4450,7 @@ static int devicentransform(i_ctx_t *i_c
+         code = array_get(imemory, devicenspace, 3, &proc);
+         if (code < 0)
+             return code;
++        check_proc(proc);
+         *esp = proc;
+         return o_push_estack;
+     }
+@@ -4864,6 +4866,7 @@ static int indexedbasecolor(i_ctx_t * i_
+             code = array_get(imemory, space, 3, &proc);
+             if (code < 0)
+                 return code;
++            check_proc(proc);
+             *ep = proc;	/* lookup proc */
+             return o_push_estack;
+         } else {
+@@ -4877,6 +4880,9 @@ static int indexedbasecolor(i_ctx_t * i_
+             if (!r_has_type(op, t_integer))
+                 return_error (gs_error_typecheck);
+             index = op->value.intval;
++            /* Ensure it is in range. See bug #707990 */
++            if (index < 0 || index > pcs->params.indexed.hival)
++                return_error(gs_error_rangecheck);
+             /* And remove it from the stack. */
+             ref_stack_pop(&o_stack, 1);
+             op = osp;
diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-46956.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-46956.patch
new file mode 100644
index 0000000000..77cf8a7da0
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-46956.patch
@@ -0,0 +1,30 @@
+From ea69a1388245ad959d31c272b5ba66d40cebba2c Mon Sep 17 00:00:00 2001
+From: Zdenek Hutyra <zhutyra@centrum.cz>
+Date: Tue, 23 Jul 2024 11:48:39 +0100
+Subject: PostScript interpreter - fix buffer length check
+
+Bug 707895
+
+See bug report for details.
+
+CVE-2024-46956
+
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/ghostscript/tree/debian/patches/CVE-2024-46956.patch?h=ubuntu/jammy-security
+Upstream commit https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=ea69a1388245ad959d31c272b5ba66d40cebba2c]
+CVE: CVE-2024-46956
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ psi/zfile.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/psi/zfile.c
++++ b/psi/zfile.c
+@@ -440,7 +440,7 @@ file_continue(i_ctx_t *i_ctx_p)
+         if (code == ~(uint) 0) {    /* all done */
+             esp -= 5;               /* pop proc, pfen, devlen, iodev , mark */
+             return o_pop_estack;
+-        } else if (code > len) {      /* overran string */
++        } else if (code > len - devlen) {      /* overran string */
+             return_error(gs_error_rangecheck);
+         }
+         else if (iodev != iodev_default(imemory)
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
index 9f368a291f..cd0a7de70e 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
@@ -57,6 +57,11 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://CVE-2024-29508-1.patch \
                 file://CVE-2024-29508-2.patch \
                 file://CVE-2023-46361.patch \
+                file://CVE-2024-46951.patch \
+                file://CVE-2024-46952.patch \
+                file://CVE-2024-46953.patch \
+                file://CVE-2024-46955.patch \
+                file://CVE-2024-46956.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-- 
2.34.1


