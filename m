Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBBFCD6DDCB
	for <webhook@archiver.kernel.org>; Fri, 15 Nov 2024 03:27:19 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web10.12410.1731641230770016497
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Nov 2024 19:27:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=iULb/WeO;
 spf=pass (domain: mvista.com, ip: 209.85.167.181, mailfrom: vanusuri@mvista.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3e5f86e59f1so192296b6e.1
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Nov 2024 19:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1731641229; x=1732246029; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VDuJ33x9C57go2Krzo29vTNW6X60CQl0heN6DWNy6N4=;
        b=iULb/WeOHwgMZK8JGSdadnEA1Gfw8MK1JfWJ3WreDAnq+DxbWkdh/fU1HhBHAtiJW4
         hNCuZM0J9OvBGEwngLvIqBlxQMBaSgIlsKSQYFZdZ+L7r9lnBuwsufFh/e6XO/ZEPeej
         yQfcTiKj6U6ROl0B781DnJuEjeCDhplG8mtrg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731641229; x=1732246029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VDuJ33x9C57go2Krzo29vTNW6X60CQl0heN6DWNy6N4=;
        b=hvS96IDrEcbDbTJYi2FBYSmZucA8wwv1PE048rO4W0soEyH4DQlrNrvDnP8UywgG2u
         ac8zOISBfR6q8por7qeE2VMMlrSY1jupJUdWpqK/wASL4T97Bb2mi1QWU1w9s37Rpe7k
         j+5w6lHdChdN+neK5Yb9TZdvgzx8YqGymMzDh9Oy5FgK5tNqrIxPqbGIcPJ48pFXtm6Z
         /QiVoKW0pdE3fNciWSlAU4StPfisXPuxJfBmRxn4e20dxWLUnxTB0nBJTe6d9wgO7d2r
         5mdcSQNy+o4mfrvF7gicwWPQeTooT7sGi3itV56ann8p3rOaLh3fVqPHxdcSzIkAvKxP
         fa5Q==
X-Gm-Message-State: AOJu0YwJTZBKuui8Am0Ersl4GLpW7fta1YkWlJjzm9lnnno/uyzw1yd/
	703nQa3yS9sRYJBjclyPVCbj4kSarEOI/HB46HTwvv0jYaXfTtpLkHy0Aq7cygc0Pcr2ImRrLhh
	mrqA=
X-Google-Smtp-Source: AGHT+IHJyoSlhQYVFpjTqcupQNwDLciVSFBHO+JlDbhDScDZH1/N46C+FqjjZ5fgzjtZucGIwxor+g==
X-Received: by 2002:a05:6871:7408:b0:288:4313:a3f8 with SMTP id 586e51a60fabf-2962df98890mr905557fac.13.1731641229367;
        Thu, 14 Nov 2024 19:27:09 -0800 (PST)
Received: from MVIN00020.mvista.com ([2401:4900:882f:d550:8251:9610:243:c4c6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f8c1dcd2d7sm356491a12.81.2024.11.14.19.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 19:27:08 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH] ghostscript: Backport fix for multiple CVE's
Date: Fri, 15 Nov 2024 08:56:59 +0530
Message-Id: <20241115032659.63207-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Nov 2024 03:27:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207181

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
index 969e637f5e..b6dc08aa25 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
@@ -56,6 +56,11 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://CVE-2024-29506.patch \
                 file://CVE-2024-29508-1.patch \
                 file://CVE-2024-29508-2.patch \
+                file://CVE-2024-46951.patch \
+                file://CVE-2024-46952.patch \
+                file://CVE-2024-46953.patch \
+                file://CVE-2024-46955.patch \
+                file://CVE-2024-46956.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-- 
2.25.1


