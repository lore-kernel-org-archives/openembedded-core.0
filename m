Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C124FD30000
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 12:20:08 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.20845.1729254001810708449
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Oct 2024 05:20:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=GOmAmPGk;
 spf=pass (domain: mvista.com, ip: 209.85.214.173, mailfrom: asharma@mvista.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-20c767a9c50so19588395ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Oct 2024 05:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1729254001; x=1729858801; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TBuvH/+4AL1JCYWBIU8pF34EOk5FJNQFvmx8yrEOJe4=;
        b=GOmAmPGkL1aRl+NIwXvUQA1aknQ+HqMRnXPlF6bNRMIaeA3owAiASsLYc68BcKnwqR
         ffJUIK9mBsowd3o9xLcZlJ4xRSigjj06hmpXXP02ihdKTT08Fjf0fHzfvLxRr/6RRSXb
         PNIYr9HjrD7a+mvMm0SDKVsFGj5MHUD/y1hKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729254001; x=1729858801;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TBuvH/+4AL1JCYWBIU8pF34EOk5FJNQFvmx8yrEOJe4=;
        b=jdv5UDAZa/4LYFHC9ESpTOSkHD3VncaDiaquhKpMucQbTD9/W3O3mDn6RSQ2zO9fW/
         AJ+HzP6y2dSe1DqkF9xBGJb1eemGaqdEP39ih8AvwfudtUB/OVb1T7YzcmNB9kZQ3Gji
         FHBQ3N5Vh/z9IN6i7BoQX2P2KpZ1NVESsEd+zKnHmNIiDv/0haJitfmNiOaK2BQE7/in
         dyCBHx4fvKMhWYVDasvMc+f6uNWeodmegIXbARALjkw63LRG/H78+uOlUZYpYWRcPmgg
         ARx7AsO/df2DMhTAt3TUy/UblbsTGLedOZ+Ogmwp8iuuNX/+h5CciqE3/qYNrNENU5UR
         fdbA==
X-Gm-Message-State: AOJu0YwCYN1VqhubmL/AyAzyZfX7sDZhzuS+5gKx+ANLbCUleh/IH6QD
	y/WpnGwe0/ZL4HGcMVv7wd5JtaDTS7jYMplRminwrvE2RGx2ZBXfhTc/aoZ3K8SKwJUAscrYPAf
	OwoU=
X-Google-Smtp-Source: AGHT+IGmtN0cjc0YE4J4aE0JmKS0BaiPRpMKSGs4omcpAf8G+qcT7UF5wxUzVuIDyDiTDxAlW8bQDA==
X-Received: by 2002:a17:903:1c4:b0:20c:dee0:7256 with SMTP id d9443c01a7336-20e5a9553f4mr27296995ad.58.1729254000604;
        Fri, 18 Oct 2024 05:20:00 -0700 (PDT)
Received: from asharma-Latitude-3400 ([2401:4900:1c68:cd17:18ef:2439:b0b7:c46c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e5a8f08a2sm11416635ad.182.2024.10.18.05.19.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2024 05:20:00 -0700 (PDT)
Received: by asharma-Latitude-3400 (sSMTP sendmail emulation); Fri, 18 Oct 2024 17:49:54 +0530
From: Ashish Sharma <asharma@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [OE-core][kirkstone][PATCH v2] ghostscript: Backport CVE-2024-29508
Date: Fri, 18 Oct 2024 17:49:52 +0530
Message-Id: <20241018121952.1947-1-asharma@mvista.com>
X-Mailer: git-send-email 2.35.7
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Oct 2024 12:20:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206060

Import patch from ubuntu to fix
CVE-2024-29508

Upstream-Status: Backport [https://git.launchpad.net/ubuntu/+source/ghostscript/commit/?h=ubuntu/focal-security&id=22b23aa6de7613a4d9c1da9c84d72427c9d0cf1a]
Upstream commit: https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=ff1013a0ab485b66783b70145e342a82c670906a

Signed-off-by: Ashish Sharma <asharma@mvista.com>
---
 .../ghostscript/CVE-2024-29508-1.patch        | 308 ++++++++++++++++++
 .../ghostscript/CVE-2024-29508-2.patch        |  29 ++
 .../ghostscript/ghostscript_9.55.0.bb         |   2 +
 3 files changed, 339 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2024-29508-1.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2024-29508-2.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-29508-1.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-29508-1.patch
new file mode 100644
index 0000000000..cb3b736289
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-29508-1.patch
@@ -0,0 +1,308 @@
+Backport of:
+Note: updated to fix compiler warning.
+
+From ff1013a0ab485b66783b70145e342a82c670906a Mon Sep 17 00:00:00 2001
+From: Ken Sharp <Ken.Sharp@artifex.com>
+Date: Thu, 25 Jan 2024 11:53:44 +0000
+Subject: Bug 707510 - review printing of pointers
+
+This is for item 4 of the report, which is addressed by the change in
+gdevpdtb.c. That change uses a fixed name for fonts which have no name
+instead of using the pointer to the address of the font.
+
+The remaining changes are all due to reviewing the use of PRI_INTPTR.
+In general we only use that for debugging purposes but there were a few
+places which were printing pointers arbitrarily, even in a release build.
+
+We really don't want to do that so I've modified the places which were
+printing pointer unconditionally so that they only do so if DEBUG is
+set at compile time, or a specific debug flag is set.
+
+CVE: CVE-2024-29508
+Upstream-Status: Backport [https://git.launchpad.net/ubuntu/+source/ghostscript/commit/?h=ubuntu/focal-security&id=22b23aa6de7613a4d9c1da9c84d72427c9d0cf1a]
+Upstream commit: https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=ff1013a0ab485b66783b70145e342a82c670906a
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
+
+ base/gsfont.c             | 4 ++--
+ base/gsicc_cache.c        | 8 ++++----
+ base/gsmalloc.c           | 4 ++--
+ base/gxclmem.c            | 5 ++---
+ base/gxcpath.c            | 6 +++++-
+ base/gxpath.c             | 8 +++++++-
+ base/szlibc.c             | 4 +++-
+ devices/gdevupd.c         | 7 ++++++-
+ devices/vector/gdevpdtb.c | 4 ++--
+ psi/ialloc.c              | 4 ++--
+ psi/igc.c                 | 6 +++---
+ psi/igcstr.c              | 6 +++---
+ psi/iinit.c               | 6 +++++-
+ psi/imainarg.c            | 5 +++--
+ psi/isave.c               | 4 ++--
+ psi/iutil.c               | 6 +++++-
+ 16 files changed, 56 insertions(+), 31 deletions(-)
+
+--- a/base/gsfont.c
++++ b/base/gsfont.c
+@@ -778,7 +778,7 @@ gs_purge_font(gs_font * pfont)
+     else if (pdir->scaled_fonts == pfont)
+         pdir->scaled_fonts = next;
+     else {			/* Shouldn't happen! */
+-        lprintf1("purged font "PRI_INTPTR" not found\n", (intptr_t)pfont);
++        if_debug1m('u', pfont->memory, "purged font "PRI_INTPTR" not found\n", (intptr_t)pfont);
+     }
+ 
+     /* Purge the font from the scaled font cache. */
+--- a/base/gsicc_cache.c
++++ b/base/gsicc_cache.c
+@@ -149,7 +149,7 @@ icc_linkcache_finalize(const gs_memory_t
+ 
+     while (link_cache->head != NULL) {
+         if (link_cache->head->ref_count != 0) {
+-            emprintf2(mem, "link at "PRI_INTPTR" being removed, but has ref_count = %d\n",
++            if_debug2m(gs_debug_flag_icc, mem, "link at "PRI_INTPTR" being removed, but has ref_count = %d\n",
+                       (intptr_t)link_cache->head, link_cache->head->ref_count);
+             link_cache->head->ref_count = 0;	/* force removal */
+         }
+@@ -560,7 +560,7 @@ gsicc_findcachelink(gsicc_hashlink_t has
+                 /* that was building it failed to be able to complete building it		*/
+                 /* this is probably a fatal error. MV ???					*/
+                 if (curr->valid == false) {
+-		  emprintf1(curr->memory, "link "PRI_INTPTR" lock released, but still not valid.\n", (intptr_t)curr);	/* Breakpoint here */
++		  if_debug1m(gs_debug_flag_icc, curr->memory, "link "PRI_INTPTR" lock released, but still not valid.\n", (intptr_t)curr);	/* Breakpoint here */
+                 }
+                 gx_monitor_enter(icc_link_cache->lock);	/* re-enter to loop and check */
+             }
+@@ -587,7 +587,7 @@ gsicc_remove_link(gsicc_link_t *link, co
+     /* NOTE: link->ref_count must be 0: assert ? */
+     gx_monitor_enter(icc_link_cache->lock);
+     if (link->ref_count != 0) {
+-      emprintf2(memory, "link at "PRI_INTPTR" being removed, but has ref_count = %d\n", (intptr_t)link, link->ref_count);
++      if_debug2m(gs_debug_flag_icc, memory, "link at "PRI_INTPTR" being removed, but has ref_count = %d\n", (intptr_t)link, link->ref_count);
+     }
+     curr = icc_link_cache->head;
+     prev = NULL;
+--- a/base/gsmalloc.c
++++ b/base/gsmalloc.c
+@@ -419,7 +419,7 @@ gs_heap_resize_string(gs_memory_t * mem,
+                       client_name_t cname)
+ {
+     if (gs_heap_object_type(mem, data) != &st_bytes)
+-        lprintf2("%s: resizing non-string "PRI_INTPTR"!\n",
++        if_debug2m('a', mem, "%s: resizing non-string "PRI_INTPTR"!\n",
+                  client_name_string(cname), (intptr_t)data);
+     return gs_heap_resize_object(mem, data, new_num, cname);
+ }
+--- a/base/gxclmem.c
++++ b/base/gxclmem.c
+@@ -490,8 +490,7 @@ memfile_fclose(clist_file_ptr cf, const
+     /* leaks if other users of the memfile don't 'fclose with delete=true */
+     if (f->openlist != NULL || ((f->base_memfile != NULL) && f->base_memfile->is_open)) {
+         /* TODO: do the cleanup rather than just giving an error */
+-        emprintf1(f->memory,
+-                  "Attempt to delete a memfile still open for read: "PRI_INTPTR"\n",
++        if_debug1(':', "Attempt to delete a memfile still open for read: "PRI_INTPTR"\n",
+                   (intptr_t)f);
+         return_error(gs_error_invalidfileaccess);
+     } else {
+--- a/base/gxcpath.c
++++ b/base/gxcpath.c
+@@ -172,8 +172,10 @@ gx_cpath_init_contained_shared(gx_clip_p
+ {
+     if (shared) {
+         if (shared->path.segments == &shared->path.local_segments) {
++#ifdef DEBUG
+             lprintf1("Attempt to share (local) segments of clip path "PRI_INTPTR"!\n",
+                      (intptr_t)shared);
++#endif
+             return_error(gs_error_Fatal);
+         }
+         *pcpath = *shared;
+@@ -230,8 +232,10 @@ gx_cpath_init_local_shared_nested(gx_cli
+     if (shared) {
+         if ((shared->path.segments == &shared->path.local_segments) &&
+             !safely_nested) {
++#ifdef DEBUG
+             lprintf1("Attempt to share (local) segments of clip path "PRI_INTPTR"!\n",
+                      (intptr_t)shared);
++#endif
+             return_error(gs_error_Fatal);
+         }
+         pcpath->path = shared->path;
+--- a/base/gxpath.c
++++ b/base/gxpath.c
+@@ -137,8 +137,10 @@ gx_path_init_contained_shared(gx_path *
+ {
+     if (shared) {
+         if (shared->segments == &shared->local_segments) {
++#ifdef DEBUG
+             lprintf1("Attempt to share (local) segments of path "PRI_INTPTR"!\n",
+                      (intptr_t)shared);
++#endif
+             return_error(gs_error_Fatal);
+         }
+         *ppath = *shared;
+@@ -172,8 +174,10 @@ gx_path_alloc_shared(const gx_path * sha
+     ppath->procs = &default_path_procs;
+     if (shared) {
+         if (shared->segments == &shared->local_segments) {
++#ifdef DEBUG
+             lprintf1("Attempt to share (local) segments of path "PRI_INTPTR"!\n",
+                      (intptr_t)shared);
++#endif
+             gs_free_object(mem, ppath, cname);
+             return 0;
+         }
+@@ -203,8 +207,10 @@ gx_path_init_local_shared(gx_path * ppat
+ {
+     if (shared) {
+         if (shared->segments == &shared->local_segments) {
++#ifdef DEBUG
+             lprintf1("Attempt to share (local) segments of path "PRI_INTPTR"!\n",
+                      (intptr_t)shared);
++#endif
+             return_error(gs_error_Fatal);
+         }
+         *ppath = *shared;
+--- a/base/szlibc.c
++++ b/base/szlibc.c
+@@ -110,7 +110,9 @@ s_zlib_free(void *zmem, void *data)
+     gs_free_object(mem, data, "s_zlib_free(data)");
+     for (; ; block = block->next) {
+         if (block == 0) {
++#ifdef DEBUG
+             lprintf1("Freeing unrecorded data "PRI_INTPTR"!\n", (intptr_t)data);
++#endif
+             return;
+         }
+         if (block->data == data)
+--- a/devices/gdevupd.c
++++ b/devices/gdevupd.c
+@@ -1039,8 +1039,13 @@ upd_print_page(gx_device_printer *pdev,
+  */
+    if(!upd || B_OK4GO != (upd->flags & (B_OK4GO | B_ERROR))) {
+ #if UPD_MESSAGES & (UPD_M_ERROR | UPD_M_TOPCALLS)
++#ifdef DEBUG
+          errprintf(pdev->memory, "CALL-REJECTED upd_print_page(" PRI_INTPTR "," PRI_INTPTR ")\n",
+              (intptr_t)udev,(intptr_t) out);
++#else
++         errprintf(pdev->memory, "CALL-REJECTED upd_print_page\n",
++             (intptr_t)udev,(intptr_t) out);
++#endif
+ #endif
+ 	 return_error(gs_error_undefined);
+    }
+--- a/devices/vector/gdevpdtb.c
++++ b/devices/vector/gdevpdtb.c
+@@ -371,7 +371,7 @@ pdf_base_font_alloc(gx_device_pdf *pdev,
+             font_name.size -= SUBSET_PREFIX_SIZE;
+         }
+     } else {
+-        gs_sprintf(fnbuf, ".F" PRI_INTPTR, (intptr_t)copied);
++        gs_snprintf(fnbuf, sizeof(fnbuf), "Anonymous");
+         font_name.data = (byte *)fnbuf;
+         font_name.size = strlen(fnbuf);
+     }
+--- a/psi/ialloc.c
++++ b/psi/ialloc.c
+@@ -386,7 +386,7 @@ gs_free_ref_array(gs_ref_memory_t * mem,
+                 size = num_refs * sizeof(ref);
+                 break;
+             default:
+-                lprintf3("Unknown type 0x%x in free_ref_array(%u,"PRI_INTPTR")!",
++                if_debug3('A', "Unknown type 0x%x in free_ref_array(%u,"PRI_INTPTR")!",
+                          r_type(parr), num_refs, (intptr_t)obj);
+                 return;
+         }
+--- a/psi/igc.c
++++ b/psi/igc.c
+@@ -1061,7 +1061,7 @@ gc_extend_stack(gc_mark_stack * pms, gc_
+ 
+             if (cp == 0) {	/* We were tracing outside collectible */
+                 /* storage.  This can't happen. */
+-                lprintf1("mark stack overflowed while outside collectible space at "PRI_INTPTR"!\n",
++                if_debug1('6', "mark stack overflowed while outside collectible space at "PRI_INTPTR"!\n",
+                          (intptr_t)cptr);
+                 gs_abort(pstate->heap);
+             }
+@@ -1290,7 +1290,7 @@ igc_reloc_struct_ptr(const void /*obj_he
+ 
+             if (cp != 0 && cp->cbase <= (byte *)obj && (byte *)obj <cp->ctop) {
+                 if (back > (cp->ctop - cp->cbase) >> obj_back_shift) {
+-                    lprintf2("Invalid back pointer %u at "PRI_INTPTR"!\n",
++                    if_debug2('6', "Invalid back pointer %u at "PRI_INTPTR"!\n",
+                              back, (intptr_t)obj);
+                     gs_abort(NULL);
+                 }
+--- a/psi/igcstr.c
++++ b/psi/igcstr.c
+@@ -152,7 +152,7 @@ gc_string_mark(const byte * ptr, uint si
+         return false;
+ #ifdef DEBUG
+     if (ptr - HDR_ID_OFFSET < cp->ctop) {
+-        lprintf4("String pointer "PRI_INTPTR"[%u] outside ["PRI_INTPTR".."PRI_INTPTR")\n",
++        if_debug4('6', "String pointer "PRI_INTPTR"[%u] outside ["PRI_INTPTR".."PRI_INTPTR")\n",
+                  (intptr_t)ptr - HDR_ID_OFFSET, size, (intptr_t)cp->ctop, (intptr_t)cp->climit);
+         return false;
+     } else if (ptr + size > cp->climit) {	/*
+@@ -171,7 +171,7 @@ gc_string_mark(const byte * ptr, uint si
+         while (ptr - HDR_ID_OFFSET == scp->climit && scp->outer != 0)
+             scp = scp->outer;
+         if (ptr - HDR_ID_OFFSET + size > scp->climit) {
+-            lprintf4("String pointer "PRI_INTPTR"[%u] outside ["PRI_INTPTR".."PRI_INTPTR")\n",
++            if_debug4('6', "String pointer "PRI_INTPTR"[%u] outside ["PRI_INTPTR".."PRI_INTPTR")\n",
+                      (intptr_t)ptr - HDR_ID_OFFSET, size,
+                      (intptr_t)scp->ctop, (intptr_t)scp->climit);
+             return false;
+--- a/psi/iinit.c
++++ b/psi/iinit.c
+@@ -395,8 +395,12 @@ zop_init(i_ctx_t *i_ctx_p)
+         if (def->proc != 0) {
+             code = def->proc(i_ctx_p);
+             if (code < 0) {
++#ifdef DEBUG
+                 lprintf2("op_init proc "PRI_INTPTR" returned error %d!\n",
+                          (intptr_t)def->proc, code);
++#else
++                lprintf("op_init proc returned error !\n");
++#endif
+                 return code;
+             }
+         }
+--- a/psi/imainarg.c
++++ b/psi/imainarg.c
+@@ -229,7 +229,8 @@ gs_main_init_with_args01(gs_main_instanc
+                 if (gs_debug[':'] && !have_dumped_args) {
+                     int i;
+ 
+-                    dmprintf1(minst->heap, "%% Args passed to instance "PRI_INTPTR": ",
++                    if (gs_debug_c(gs_debug_flag_init_details))
++                        dmprintf1(minst->heap, "%% Args passed to instance "PRI_INTPTR": ",
+                               (intptr_t)minst);
+                     for (i=1; i<argc; i++)
+                         dmprintf1(minst->heap, "%s ", argv[i]);
+--- a/psi/isave.c
++++ b/psi/isave.c
+@@ -487,7 +487,7 @@ alloc_save_change_in(gs_ref_memory_t *me
+     else if (r_is_struct(pcont))
+         cp->offset = (byte *) where - (byte *) pcont->value.pstruct;
+     else {
+-        lprintf3("Bad type %u for save!  pcont = "PRI_INTPTR", where = "PRI_INTPTR"\n",
++        if_debug3('u', "Bad type %u for save!  pcont = "PRI_INTPTR", where = "PRI_INTPTR"\n",
+                  r_type(pcont), (intptr_t) pcont, (intptr_t) where);
+         gs_abort((const gs_memory_t *)mem);
+     }
+--- a/psi/iutil.c
++++ b/psi/iutil.c
+@@ -537,7 +537,11 @@ other:
+             break;
+         }
+         /* Internal operator, no name. */
+-        gs_sprintf(buf, "@"PRI_INTPTR, (intptr_t) op->value.opproc);
++#ifdef DEBUG
++        gs_snprintf(buf, sizeof(buf), "@"PRI_INTPTR, (intptr_t) op->value.opproc);
++#else
++        gs_snprintf(buf, sizeof(buf), "@anonymous_operator", (intptr_t) op->value.opproc);
++#endif
+         break;
+     }
+     case t_real:
diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-29508-2.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-29508-2.patch
new file mode 100644
index 0000000000..11f89e0882
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-29508-2.patch
@@ -0,0 +1,29 @@
+From d084021e06ba1caa1373fbbcf24a8510f43830ab Mon Sep 17 00:00:00 2001
+From: Ken Sharp <Ken.Sharp@artifex.com>
+Date: Sat, 27 Jan 2024 09:30:30 +0000
+Subject: [PATCH] Coverity IDs 414141 & 414145
+
+These are the same problem reported two different ways. I forgot to
+remove the arguments to errprintf when I removed the format specifiers
+from the string as part of reviewing the pointer printing.
+
+CVE: CVE-2024-29508
+Upstream-Status: Backport [https://git.launchpad.net/ubuntu/+source/ghostscript/commit/?h=ubuntu/focal-security&id=22b23aa6de7613a4d9c1da9c84d72427c9d0cf1a]
+Upstream commit: https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/?id=ff1013a0ab485b66783b70145e342a82c670906a
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
+
+ devices/gdevupd.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+--- a/devices/gdevupd.c
++++ b/devices/gdevupd.c
+@@ -1043,8 +1043,7 @@ upd_print_page(gx_device_printer *pdev,
+          errprintf(pdev->memory, "CALL-REJECTED upd_print_page(" PRI_INTPTR "," PRI_INTPTR ")\n",
+              (intptr_t)udev,(intptr_t) out);
+ #else
+-         errprintf(pdev->memory, "CALL-REJECTED upd_print_page\n",
+-             (intptr_t)udev,(intptr_t) out);
++         errprintf(pdev->memory, "CALL-REJECTED upd_print_page\n");
+ #endif
+ #endif
+ 	 return_error(gs_error_undefined);
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
index 525086e2af..969e637f5e 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
@@ -54,6 +54,8 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://CVE-2024-29511-0002.patch \
                 file://CVE-2024-29509.patch \
                 file://CVE-2024-29506.patch \
+                file://CVE-2024-29508-1.patch \
+                file://CVE-2024-29508-2.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-- 
2.35.7


