Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 165C4D1F9C2
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 18:55:51 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web10.4865.1729018547985564084
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 11:55:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=m8rNPsup;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.173, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e28fe07e97dso5558091276.3
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 11:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729018547; x=1729623347; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iPVIHFSbhN9/7wfWyjVgJa4sa/mEwEygqTUH5ELbRm0=;
        b=m8rNPsup0MwfZSEg9+km1hUGWMCQDVlFD7H16z5/Y63hIjhz+6kyneY4fcZzs1nk2i
         KbPUsRUKorQmKAlYpm8QLC6hKoblAwcjiMUl1XZ+s8csnZNxiFQkp3C6P5bLP7tyqJtu
         +m6yGvmNpAg96SzYJjfG1LMSY4E4cH9mqMuAX2kNZ1sVdGG+dKNo+izR39tnDlKAew+K
         oo8ZvHzcZonkwfpxUaOHtueftTHaS+aNxU2Ypjk+Jn6erpF/jlKfMV1o/xFNkNNtuz97
         5uMGoNPi1ZMlGWrQ8cD4b3h1k5FOG07grUYA50WGrMlTXltfEhzP9Mvq1usR3b8GvYNt
         mMuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729018547; x=1729623347;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iPVIHFSbhN9/7wfWyjVgJa4sa/mEwEygqTUH5ELbRm0=;
        b=YXwBGCCzAnvAHoz5OGu67G9y2pBHJYIPtZL6H3HZOmK7xd6HTQ06GyXq6kQtYiEpwa
         3t/AdLuMw45UUGb8LZ+8rxqmx4FJHGpiK/QQ5zPQo0w/gaO1EW07fWcMEIs6VT9s9uuR
         o66UcefCGrkijzOVk6+e3lH2mXeDKu/3kc7LCOhzreXntg8FQeh4keu0m0t/VW4P77Hd
         xrRdVMRJ7+aIQ+wLw01/dU7o577OEaQU+p90nAaxcvGPOpj2BPDTPYU/FLexLtHF4rGj
         4pRMvlcvUvWu7wxuc66vShiXwczk0w2x8lgatp8s35ANNiHLhBx4pOOWYC8B9HXGYsmW
         lMUg==
X-Gm-Message-State: AOJu0YyED1gwizxHGNzlpwlvcg52YxYkb73n3ur8xtAsgSGte8EzPEFA
	SB/ltxw1G5ozsiqGkzXuzgaH3w/jzxwxp2sEiixJewYOg4GFT/XTxC0/JVTw0EvVHJ4zpz8ABUi
	XOlOS3xSgCHfqsHedlcqKGWbwEa9OzO2qzMGvSZ5jA5L32CHr
X-Google-Smtp-Source: AGHT+IEkJkaB5L5kBqIFD1gTbQk0vITmBynPCdTD0Vdt/gUlkR4tBkcRO1gG5CaUPcDT9FelsAOWrKun97RoeS/rIXI=
X-Received: by 2002:a05:6902:178c:b0:e13:d0af:b1f8 with SMTP id
 3f1490d57ef6-e29315abe9bmr9395305276.0.1729018547056; Tue, 15 Oct 2024
 11:55:47 -0700 (PDT)
MIME-Version: 1.0
References: <20241009114609.25716-1-asharma@mvista.com>
In-Reply-To: <20241009114609.25716-1-asharma@mvista.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 15 Oct 2024 11:55:36 -0700
Message-ID: <CAOSpxdaZvBhqra2OuyrLjNjA7+Tr4EJStit+mFhJnw_+9GiLcQ@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] ghostscript: backport fix for CVE-2024-29508
To: asharma@mvista.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 18:55:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205943

On Wed, Oct 9, 2024 at 4:48=E2=80=AFAM Ashish Sharma via
lists.openembedded.org <asharma=3Dmvista.com@lists.openembedded.org>
wrote:
>
> Upstream-Status: Backport [https://launchpad.net/ubuntu/+source/ghostscri=
pt/9.55.0~dfsg1-0ubuntu5.9]

Launchpad isn't the upstream for ghostscript.  Could you please send a
v2 that references the upstream commit?

Steve

>
> Signed-off-by: Ashish Sharma <asharma@mvista.com>
> ---
>  .../ghostscript/CVE-2024-29508-2.patch        |  28 ++
>  .../ghostscript/CVE-2024-29508.patch          | 307 ++++++++++++++++++
>  .../ghostscript/ghostscript_9.55.0.bb         |   2 +
>  3 files changed, 337 insertions(+)
>  create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-202=
4-29508-2.patch
>  create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-202=
4-29508.patch
>
> diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-29508=
-2.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-29508-2.p=
atch
> new file mode 100644
> index 0000000000..14e440517d
> --- /dev/null
> +++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-29508-2.patc=
h
> @@ -0,0 +1,28 @@
> +From d084021e06ba1caa1373fbbcf24a8510f43830ab Mon Sep 17 00:00:00 2001
> +From: Ken Sharp <Ken.Sharp@artifex.com>
> +Date: Sat, 27 Jan 2024 09:30:30 +0000
> +Subject: [PATCH] Coverity IDs 414141 & 414145
> +
> +These are the same problem reported two different ways. I forgot to
> +remove the arguments to errprintf when I removed the format specifiers
> +from the string as part of reviewing the pointer printing.
> +
> +CVE: CVE-2024-29508
> +Upstream-Status: Backport [https://launchpad.net/ubuntu/+source/ghostscr=
ipt/9.55.0~dfsg1-0ubuntu5.9]
> +Signed-off-by: Ashish Sharma <asharma@mvista.com>
> +
> + devices/gdevupd.c | 3 +--
> + 1 file changed, 1 insertion(+), 2 deletions(-)
> +
> +--- a/devices/gdevupd.c
> ++++ b/devices/gdevupd.c
> +@@ -1043,8 +1043,7 @@ upd_print_page(gx_device_printer *pdev,
> +          errprintf(pdev->memory, "CALL-REJECTED upd_print_page(" PRI_IN=
TPTR "," PRI_INTPTR ")\n",
> +              (intptr_t)udev,(intptr_t) out);
> + #else
> +-         errprintf(pdev->memory, "CALL-REJECTED upd_print_page\n",
> +-             (intptr_t)udev,(intptr_t) out);
> ++         errprintf(pdev->memory, "CALL-REJECTED upd_print_page\n");
> + #endif
> + #endif
> +        return_error(gs_error_undefined);
> diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-29508=
.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-29508.patch
> new file mode 100644
> index 0000000000..87fd653675
> --- /dev/null
> +++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2024-29508.patch
> @@ -0,0 +1,307 @@
> +Backport of:
> +Note: updated to fix compiler warning.
> +
> +From ff1013a0ab485b66783b70145e342a82c670906a Mon Sep 17 00:00:00 2001
> +From: Ken Sharp <Ken.Sharp@artifex.com>
> +Date: Thu, 25 Jan 2024 11:53:44 +0000
> +Subject: Bug 707510 - review printing of pointers
> +
> +This is for item 4 of the report, which is addressed by the change in
> +gdevpdtb.c. That change uses a fixed name for fonts which have no name
> +instead of using the pointer to the address of the font.
> +
> +The remaining changes are all due to reviewing the use of PRI_INTPTR.
> +In general we only use that for debugging purposes but there were a few
> +places which were printing pointers arbitrarily, even in a release build=
.
> +
> +We really don't want to do that so I've modified the places which were
> +printing pointer unconditionally so that they only do so if DEBUG is
> +set at compile time, or a specific debug flag is set.
> +
> +CVE: CVE-2024-29508
> +Upstream-Status: Backport [https://launchpad.net/ubuntu/+source/ghostscr=
ipt/9.55.0~dfsg1-0ubuntu5.9]
> +Signed-off-by: Ashish Sharma <asharma@mvista.com>
> +
> + base/gsfont.c             | 4 ++--
> + base/gsicc_cache.c        | 8 ++++----
> + base/gsmalloc.c           | 4 ++--
> + base/gxclmem.c            | 5 ++---
> + base/gxcpath.c            | 6 +++++-
> + base/gxpath.c             | 8 +++++++-
> + base/szlibc.c             | 4 +++-
> + devices/gdevupd.c         | 7 ++++++-
> + devices/vector/gdevpdtb.c | 4 ++--
> + psi/ialloc.c              | 4 ++--
> + psi/igc.c                 | 6 +++---
> + psi/igcstr.c              | 6 +++---
> + psi/iinit.c               | 6 +++++-
> + psi/imainarg.c            | 5 +++--
> + psi/isave.c               | 4 ++--
> + psi/iutil.c               | 6 +++++-
> + 16 files changed, 56 insertions(+), 31 deletions(-)
> +
> +--- a/base/gsfont.c
> ++++ b/base/gsfont.c
> +@@ -778,7 +778,7 @@ gs_purge_font(gs_font * pfont)
> +     else if (pdir->scaled_fonts =3D=3D pfont)
> +         pdir->scaled_fonts =3D next;
> +     else {                    /* Shouldn't happen! */
> +-        lprintf1("purged font "PRI_INTPTR" not found\n", (intptr_t)pfon=
t);
> ++        if_debug1m('u', pfont->memory, "purged font "PRI_INTPTR" not fo=
und\n", (intptr_t)pfont);
> +     }
> +
> +     /* Purge the font from the scaled font cache. */
> +--- a/base/gsicc_cache.c
> ++++ b/base/gsicc_cache.c
> +@@ -149,7 +149,7 @@ icc_linkcache_finalize(const gs_memory_t
> +
> +     while (link_cache->head !=3D NULL) {
> +         if (link_cache->head->ref_count !=3D 0) {
> +-            emprintf2(mem, "link at "PRI_INTPTR" being removed, but has=
 ref_count =3D %d\n",
> ++            if_debug2m(gs_debug_flag_icc, mem, "link at "PRI_INTPTR" be=
ing removed, but has ref_count =3D %d\n",
> +                       (intptr_t)link_cache->head, link_cache->head->ref=
_count);
> +             link_cache->head->ref_count =3D 0;  /* force removal */
> +         }
> +@@ -560,7 +560,7 @@ gsicc_findcachelink(gsicc_hashlink_t has
> +                 /* that was building it failed to be able to complete b=
uilding it             */
> +                 /* this is probably a fatal error. MV ???              =
                       */
> +                 if (curr->valid =3D=3D false) {
> +-                emprintf1(curr->memory, "link "PRI_INTPTR" lock release=
d, but still not valid.\n", (intptr_t)curr);   /* Breakpoint here */
> ++                if_debug1m(gs_debug_flag_icc, curr->memory, "link "PRI_=
INTPTR" lock released, but still not valid.\n", (intptr_t)curr);       /* B=
reakpoint here */
> +                 }
> +                 gx_monitor_enter(icc_link_cache->lock);       /* re-ent=
er to loop and check */
> +             }
> +@@ -587,7 +587,7 @@ gsicc_remove_link(gsicc_link_t *link, co
> +     /* NOTE: link->ref_count must be 0: assert ? */
> +     gx_monitor_enter(icc_link_cache->lock);
> +     if (link->ref_count !=3D 0) {
> +-      emprintf2(memory, "link at "PRI_INTPTR" being removed, but has re=
f_count =3D %d\n", (intptr_t)link, link->ref_count);
> ++      if_debug2m(gs_debug_flag_icc, memory, "link at "PRI_INTPTR" being=
 removed, but has ref_count =3D %d\n", (intptr_t)link, link->ref_count);
> +     }
> +     curr =3D icc_link_cache->head;
> +     prev =3D NULL;
> +--- a/base/gsmalloc.c
> ++++ b/base/gsmalloc.c
> +@@ -419,7 +419,7 @@ gs_heap_resize_string(gs_memory_t * mem,
> +                       client_name_t cname)
> + {
> +     if (gs_heap_object_type(mem, data) !=3D &st_bytes)
> +-        lprintf2("%s: resizing non-string "PRI_INTPTR"!\n",
> ++        if_debug2m('a', mem, "%s: resizing non-string "PRI_INTPTR"!\n",
> +                  client_name_string(cname), (intptr_t)data);
> +     return gs_heap_resize_object(mem, data, new_num, cname);
> + }
> +--- a/base/gxclmem.c
> ++++ b/base/gxclmem.c
> +@@ -490,8 +490,7 @@ memfile_fclose(clist_file_ptr cf, const
> +     /* leaks if other users of the memfile don't 'fclose with delete=3D=
true */
> +     if (f->openlist !=3D NULL || ((f->base_memfile !=3D NULL) && f->bas=
e_memfile->is_open)) {
> +         /* TODO: do the cleanup rather than just giving an error */
> +-        emprintf1(f->memory,
> +-                  "Attempt to delete a memfile still open for read: "PR=
I_INTPTR"\n",
> ++        if_debug1(':', "Attempt to delete a memfile still open for read=
: "PRI_INTPTR"\n",
> +                   (intptr_t)f);
> +         return_error(gs_error_invalidfileaccess);
> +     } else {
> +--- a/base/gxcpath.c
> ++++ b/base/gxcpath.c
> +@@ -172,8 +172,10 @@ gx_cpath_init_contained_shared(gx_clip_p
> + {
> +     if (shared) {
> +         if (shared->path.segments =3D=3D &shared->path.local_segments) =
{
> ++#ifdef DEBUG
> +             lprintf1("Attempt to share (local) segments of clip path "P=
RI_INTPTR"!\n",
> +                      (intptr_t)shared);
> ++#endif
> +             return_error(gs_error_Fatal);
> +         }
> +         *pcpath =3D *shared;
> +@@ -230,8 +232,10 @@ gx_cpath_init_local_shared_nested(gx_cli
> +     if (shared) {
> +         if ((shared->path.segments =3D=3D &shared->path.local_segments)=
 &&
> +             !safely_nested) {
> ++#ifdef DEBUG
> +             lprintf1("Attempt to share (local) segments of clip path "P=
RI_INTPTR"!\n",
> +                      (intptr_t)shared);
> ++#endif
> +             return_error(gs_error_Fatal);
> +         }
> +         pcpath->path =3D shared->path;
> +--- a/base/gxpath.c
> ++++ b/base/gxpath.c
> +@@ -137,8 +137,10 @@ gx_path_init_contained_shared(gx_path *
> + {
> +     if (shared) {
> +         if (shared->segments =3D=3D &shared->local_segments) {
> ++#ifdef DEBUG
> +             lprintf1("Attempt to share (local) segments of path "PRI_IN=
TPTR"!\n",
> +                      (intptr_t)shared);
> ++#endif
> +             return_error(gs_error_Fatal);
> +         }
> +         *ppath =3D *shared;
> +@@ -172,8 +174,10 @@ gx_path_alloc_shared(const gx_path * sha
> +     ppath->procs =3D &default_path_procs;
> +     if (shared) {
> +         if (shared->segments =3D=3D &shared->local_segments) {
> ++#ifdef DEBUG
> +             lprintf1("Attempt to share (local) segments of path "PRI_IN=
TPTR"!\n",
> +                      (intptr_t)shared);
> ++#endif
> +             gs_free_object(mem, ppath, cname);
> +             return 0;
> +         }
> +@@ -203,8 +207,10 @@ gx_path_init_local_shared(gx_path * ppat
> + {
> +     if (shared) {
> +         if (shared->segments =3D=3D &shared->local_segments) {
> ++#ifdef DEBUG
> +             lprintf1("Attempt to share (local) segments of path "PRI_IN=
TPTR"!\n",
> +                      (intptr_t)shared);
> ++#endif
> +             return_error(gs_error_Fatal);
> +         }
> +         *ppath =3D *shared;
> +--- a/base/szlibc.c
> ++++ b/base/szlibc.c
> +@@ -110,7 +110,9 @@ s_zlib_free(void *zmem, void *data)
> +     gs_free_object(mem, data, "s_zlib_free(data)");
> +     for (; ; block =3D block->next) {
> +         if (block =3D=3D 0) {
> ++#ifdef DEBUG
> +             lprintf1("Freeing unrecorded data "PRI_INTPTR"!\n", (intptr=
_t)data);
> ++#endif
> +             return;
> +         }
> +         if (block->data =3D=3D data)
> +--- a/devices/gdevupd.c
> ++++ b/devices/gdevupd.c
> +@@ -1039,8 +1039,13 @@ upd_print_page(gx_device_printer *pdev,
> +  */
> +    if(!upd || B_OK4GO !=3D (upd->flags & (B_OK4GO | B_ERROR))) {
> + #if UPD_MESSAGES & (UPD_M_ERROR | UPD_M_TOPCALLS)
> ++#ifdef DEBUG
> +          errprintf(pdev->memory, "CALL-REJECTED upd_print_page(" PRI_IN=
TPTR "," PRI_INTPTR ")\n",
> +              (intptr_t)udev,(intptr_t) out);
> ++#else
> ++         errprintf(pdev->memory, "CALL-REJECTED upd_print_page\n",
> ++             (intptr_t)udev,(intptr_t) out);
> ++#endif
> + #endif
> +        return_error(gs_error_undefined);
> +    }
> +--- a/devices/vector/gdevpdtb.c
> ++++ b/devices/vector/gdevpdtb.c
> +@@ -371,7 +371,7 @@ pdf_base_font_alloc(gx_device_pdf *pdev,
> +             font_name.size -=3D SUBSET_PREFIX_SIZE;
> +         }
> +     } else {
> +-        gs_sprintf(fnbuf, ".F" PRI_INTPTR, (intptr_t)copied);
> ++        gs_snprintf(fnbuf, sizeof(fnbuf), "Anonymous");
> +         font_name.data =3D (byte *)fnbuf;
> +         font_name.size =3D strlen(fnbuf);
> +     }
> +--- a/psi/ialloc.c
> ++++ b/psi/ialloc.c
> +@@ -386,7 +386,7 @@ gs_free_ref_array(gs_ref_memory_t * mem,
> +                 size =3D num_refs * sizeof(ref);
> +                 break;
> +             default:
> +-                lprintf3("Unknown type 0x%x in free_ref_array(%u,"PRI_I=
NTPTR")!",
> ++                if_debug3('A', "Unknown type 0x%x in free_ref_array(%u,=
"PRI_INTPTR")!",
> +                          r_type(parr), num_refs, (intptr_t)obj);
> +                 return;
> +         }
> +--- a/psi/igc.c
> ++++ b/psi/igc.c
> +@@ -1061,7 +1061,7 @@ gc_extend_stack(gc_mark_stack * pms, gc_
> +
> +             if (cp =3D=3D 0) {    /* We were tracing outside collectibl=
e */
> +                 /* storage.  This can't happen. */
> +-                lprintf1("mark stack overflowed while outside collectib=
le space at "PRI_INTPTR"!\n",
> ++                if_debug1('6', "mark stack overflowed while outside col=
lectible space at "PRI_INTPTR"!\n",
> +                          (intptr_t)cptr);
> +                 gs_abort(pstate->heap);
> +             }
> +@@ -1290,7 +1290,7 @@ igc_reloc_struct_ptr(const void /*obj_he
> +
> +             if (cp !=3D 0 && cp->cbase <=3D (byte *)obj && (byte *)obj =
<cp->ctop) {
> +                 if (back > (cp->ctop - cp->cbase) >> obj_back_shift) {
> +-                    lprintf2("Invalid back pointer %u at "PRI_INTPTR"!\=
n",
> ++                    if_debug2('6', "Invalid back pointer %u at "PRI_INT=
PTR"!\n",
> +                              back, (intptr_t)obj);
> +                     gs_abort(NULL);
> +                 }
> +--- a/psi/igcstr.c
> ++++ b/psi/igcstr.c
> +@@ -152,7 +152,7 @@ gc_string_mark(const byte * ptr, uint si
> +         return false;
> + #ifdef DEBUG
> +     if (ptr - HDR_ID_OFFSET < cp->ctop) {
> +-        lprintf4("String pointer "PRI_INTPTR"[%u] outside ["PRI_INTPTR"=
.."PRI_INTPTR")\n",
> ++        if_debug4('6', "String pointer "PRI_INTPTR"[%u] outside ["PRI_I=
NTPTR".."PRI_INTPTR")\n",
> +                  (intptr_t)ptr - HDR_ID_OFFSET, size, (intptr_t)cp->cto=
p, (intptr_t)cp->climit);
> +         return false;
> +     } else if (ptr + size > cp->climit) {     /*
> +@@ -171,7 +171,7 @@ gc_string_mark(const byte * ptr, uint si
> +         while (ptr - HDR_ID_OFFSET =3D=3D scp->climit && scp->outer !=
=3D 0)
> +             scp =3D scp->outer;
> +         if (ptr - HDR_ID_OFFSET + size > scp->climit) {
> +-            lprintf4("String pointer "PRI_INTPTR"[%u] outside ["PRI_INT=
PTR".."PRI_INTPTR")\n",
> ++            if_debug4('6', "String pointer "PRI_INTPTR"[%u] outside ["P=
RI_INTPTR".."PRI_INTPTR")\n",
> +                      (intptr_t)ptr - HDR_ID_OFFSET, size,
> +                      (intptr_t)scp->ctop, (intptr_t)scp->climit);
> +             return false;
> +--- a/psi/iinit.c
> ++++ b/psi/iinit.c
> +@@ -395,8 +395,12 @@ zop_init(i_ctx_t *i_ctx_p)
> +         if (def->proc !=3D 0) {
> +             code =3D def->proc(i_ctx_p);
> +             if (code < 0) {
> ++#ifdef DEBUG
> +                 lprintf2("op_init proc "PRI_INTPTR" returned error %d!\=
n",
> +                          (intptr_t)def->proc, code);
> ++#else
> ++                lprintf("op_init proc returned error !\n");
> ++#endif
> +                 return code;
> +             }
> +         }
> +--- a/psi/imainarg.c
> ++++ b/psi/imainarg.c
> +@@ -229,7 +229,8 @@ gs_main_init_with_args01(gs_main_instanc
> +                 if (gs_debug[':'] && !have_dumped_args) {
> +                     int i;
> +
> +-                    dmprintf1(minst->heap, "%% Args passed to instance =
"PRI_INTPTR": ",
> ++                    if (gs_debug_c(gs_debug_flag_init_details))
> ++                        dmprintf1(minst->heap, "%% Args passed to insta=
nce "PRI_INTPTR": ",
> +                               (intptr_t)minst);
> +                     for (i=3D1; i<argc; i++)
> +                         dmprintf1(minst->heap, "%s ", argv[i]);
> +--- a/psi/isave.c
> ++++ b/psi/isave.c
> +@@ -487,7 +487,7 @@ alloc_save_change_in(gs_ref_memory_t *me
> +     else if (r_is_struct(pcont))
> +         cp->offset =3D (byte *) where - (byte *) pcont->value.pstruct;
> +     else {
> +-        lprintf3("Bad type %u for save!  pcont =3D "PRI_INTPTR", where =
=3D "PRI_INTPTR"\n",
> ++        if_debug3('u', "Bad type %u for save!  pcont =3D "PRI_INTPTR", =
where =3D "PRI_INTPTR"\n",
> +                  r_type(pcont), (intptr_t) pcont, (intptr_t) where);
> +         gs_abort((const gs_memory_t *)mem);
> +     }
> +--- a/psi/iutil.c
> ++++ b/psi/iutil.c
> +@@ -537,7 +537,11 @@ other:
> +             break;
> +         }
> +         /* Internal operator, no name. */
> +-        gs_sprintf(buf, "@"PRI_INTPTR, (intptr_t) op->value.opproc);
> ++#ifdef DEBUG
> ++        gs_snprintf(buf, sizeof(buf), "@"PRI_INTPTR, (intptr_t) op->val=
ue.opproc);
> ++#else
> ++        gs_snprintf(buf, sizeof(buf), "@anonymous_operator", (intptr_t)=
 op->value.opproc);
> ++#endif
> +         break;
> +     }
> +     case t_real:
> diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb b/me=
ta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
> index 525086e2af..54f0f23da2 100644
> --- a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
> +++ b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
> @@ -54,6 +54,8 @@ SRC_URI_BASE =3D "https://github.com/ArtifexSoftware/gh=
ostpdl-downloads/releases/d
>                  file://CVE-2024-29511-0002.patch \
>                  file://CVE-2024-29509.patch \
>                  file://CVE-2024-29506.patch \
> +                file://CVE-2024-29508.patch \
> +                file://CVE-2024-29508-2.patch \
>  "
>
>  SRC_URI =3D "${SRC_URI_BASE} \
> --
> 2.35.7
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#205358): https://lists.openembedded.org/g/openembedde=
d-core/message/205358
> Mute This Topic: https://lists.openembedded.org/mt/108907157/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

