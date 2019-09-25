Return-Path: <msft.dantran@gmail.com>
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
	[209.85.160.175])
	by mail.openembedded.org (Postfix) with ESMTP id 5BC2E7E963
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2019 22:41:45 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id m15so507146qtq.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2019 15:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=y8G+zTBubE9t4kbMVAWZTqjcPQUPDSEVg52J/Z8KpAU=;
	b=ReOP4t37PkIOiC+DUx186PGjJaBnZhZwiI5vVznWN5mleQ19dtWH+wUBFGcEzJwsU/
	F+s9vfJQV95BbJuCnkQ0mx+rB4PPJYv4kdzZK1pNZUY9scqoqvuY5YKUpe/tZMkZT8qR
	0ei/pcBjFPDLzL/hW3syr5ggklvt5B+6DU8yypdQzvUdbFUdlRuwH16TFMNUr1wG7H6z
	RrokXQ3TIl6oLyVh9qA6MmEy9aCuCfLJwiEYQ6Zcl3ngxCrIBGQ3DPeIkrUQl3cLuEUy
	Z343jBq05rq/OjbIpifin1IHhNALjpuL7DXK2jQyz+/6gdxqz+3HO/r8WSrkOI+0e5ct
	VoTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=y8G+zTBubE9t4kbMVAWZTqjcPQUPDSEVg52J/Z8KpAU=;
	b=HVK4QLcWl8BB3HN/kNdh6Bh9FQjTN7X8onQb+UA3NEmqY7ILdu131EBkfNH3INyz9A
	eykZKrwyKSILKILqGu+lqMGkFhhXAX+u7Se5ziRxH8OnwoOu8lqxlyV/JChNJtKvUh8+
	agSqA5j4ijjZSBXUZkpatRd0u/rp1B7RtMQSsuMK+aA6dd2u8xuWULNeJMylvTMIeSTs
	DYEtdwJ+hf3XvdSxWaGJfE74KUOyWi5NnQ+TntpfmxGMvt1VnYBYhf5/mtG/QJY0jtjM
	dor+FsKYHEKfvHTjk3VaQwAFiPC2aj1bs26jBB3DYsMkbCLSQgz2AoGjoFk17J5KL7Ce
	h2OQ==
X-Gm-Message-State: APjAAAVDnLm2w1EOqINpFEHDPpeOmh5wlTtG1LEpOo1uOKMcOCh/Il3o
	qMMnsRz8alg0NdhIFvG3onSeZIIQ
X-Google-Smtp-Source: APXvYqy87vH/0oJTzMTjHzk8/Qeo/5UxJMfQI5Q+SPkxE8gTlJRPf2ZSgfKuWH6mH3ejRazbiH8JQw==
X-Received: by 2002:ac8:611a:: with SMTP id a26mr955776qtm.68.1569451305812;
	Wed, 25 Sep 2019 15:41:45 -0700 (PDT)
Received: from
	dantran-yocto-ubuntu18.4z1s34kka3euddhhn33gkqkz1e.cx.internal.cloudapp.net
	([40.70.73.119])
	by smtp.gmail.com with ESMTPSA id j5sm101346qkd.56.2019.09.25.15.41.44
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 25 Sep 2019 15:41:44 -0700 (PDT)
From: msft.dantran@gmail.com
X-Google-Original-From: dantran@microsoft.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Sep 2019 22:41:38 +0000
Message-Id: <20190925224138.16794-1-dantran@microsoft.com>
X-Mailer: git-send-email 2.17.1
Subject: [thud][PATCH v2] unzip: fix CVE-2019-13232
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
X-List-Received-Date: Wed, 25 Sep 2019 22:41:46 -0000

From: Dan Tran <dantran@microsoft.com>

Signed-off-by: Dan Tran <dantran@microsoft.com>
---
 .../unzip/unzip/CVE-2019-13232.patch          | 388 ++++++++++++++++++
 meta/recipes-extended/unzip/unzip_6.0.bb      |   1 +
 2 files changed, 389 insertions(+)
 create mode 100644 meta/recipes-extended/unzip/unzip/CVE-2019-13232.patch

diff --git a/meta/recipes-extended/unzip/unzip/CVE-2019-13232.patch b/meta/recipes-extended/unzip/unzip/CVE-2019-13232.patch
new file mode 100644
index 0000000000..08512bb0b1
--- /dev/null
+++ b/meta/recipes-extended/unzip/unzip/CVE-2019-13232.patch
@@ -0,0 +1,388 @@
+From 080d52c3c9416c731f637f9c6e003961ef43f079 Mon Sep 17 00:00:00 2001
+From: Mark Adler <madler@alumni.caltech.edu>
+Date: Mon, 27 May 2019 08:20:32 -0700
+Subject: [PATCH 1/2] Fix bug in undefer_input() that misplaced the input
+ state.
+
+Signed-off-by: Dan Tran <dantran@microsoft.com>
+---
+ fileio.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/fileio.c b/fileio.c
+index 7605a29..14460f3 100644
+--- a/fileio.c
++++ b/fileio.c
+@@ -532,8 +532,10 @@ void undefer_input(__G)
+          * This condition was checked when G.incnt_leftover was set > 0 in
+          * defer_leftover_input(), and it is NOT allowed to touch G.csize
+          * before calling undefer_input() when (G.incnt_leftover > 0)
+-         * (single exception: see read_byte()'s  "G.csize <= 0" handling) !!
++         * (single exception: see readbyte()'s  "G.csize <= 0" handling) !!
+          */
++        if (G.csize < 0L)
++            G.csize = 0L;
+         G.incnt = G.incnt_leftover + (int)G.csize;
+         G.inptr = G.inptr_leftover - (int)G.csize;
+         G.incnt_leftover = 0;
+-- 
+2.22.0.vfs.1.1.57.gbaf16c8
+
+
+From 1aae47fa8935654a84403768f32c03ecbb1be470 Mon Sep 17 00:00:00 2001
+From: Mark Adler <madler@alumni.caltech.edu>
+Date: Tue, 11 Jun 2019 22:01:18 -0700
+Subject: [PATCH 2/2] Detect and reject a zip bomb using overlapped entries.
+
+This detects an invalid zip file that has at least one entry that
+overlaps with another entry or with the central directory to the
+end of the file. A Fifield zip bomb uses overlapped local entries
+to vastly increase the potential inflation ratio. Such an invalid
+zip file is rejected.
+
+See https://www.bamsoftware.com/hacks/zipbomb/ for David Fifield's
+analysis, construction, and examples of such zip bombs.
+
+The detection maintains a list of covered spans of the zip files
+so far, where the central directory to the end of the file and any
+bytes preceding the first entry at zip file offset zero are
+considered covered initially. Then as each entry is decompressed
+or tested, it is considered covered. When a new entry is about to
+be processed, its initial offset is checked to see if it is
+contained by a covered span. If so, the zip file is rejected as
+invalid.
+
+This commit depends on a preceding commit: "Fix bug in
+undefer_input() that misplaced the input state."
+
+CVE: CVE-2019-13232
+Upstream-Status: Backport
+[https://github.com/madler/unzip/commit/47b3ceae397d21bf822bc2ac73052a4b1daf8e1c]
+
+Signed-off-by: Dan Tran <dantran@microsoft.com>
+---
+ extract.c | 190 +++++++++++++++++++++++++++++++++++++++++++++++++++++-
+ globals.c |   1 +
+ globals.h |   3 +
+ process.c |  10 +++
+ unzip.h   |   1 +
+ 5 files changed, 204 insertions(+), 1 deletion(-)
+
+diff --git a/extract.c b/extract.c
+index 24db2a8..2bb72ba 100644
+--- a/extract.c
++++ b/extract.c
+@@ -321,6 +321,125 @@ static ZCONST char Far UnsupportedExtraField[] =
+   "\nerror:  unsupported extra-field compression type (%u)--skipping\n";
+ static ZCONST char Far BadExtraFieldCRC[] =
+   "error [%s]:  bad extra-field CRC %08lx (should be %08lx)\n";
++static ZCONST char Far NotEnoughMemCover[] =
++  "error: not enough memory for bomb detection\n";
++static ZCONST char Far OverlappedComponents[] =
++  "error: invalid zip file with overlapped components (possible zip bomb)\n";
++
++
++
++
++
++/* A growable list of spans. */
++typedef zoff_t bound_t;
++typedef struct {
++    bound_t beg;        /* start of the span */
++    bound_t end;        /* one past the end of the span */
++} span_t;
++typedef struct {
++    span_t *span;       /* allocated, distinct, and sorted list of spans */
++    size_t num;         /* number of spans in the list */
++    size_t max;         /* allocated number of spans (num <= max) */
++} cover_t;
++
++/*
++ * Return the index of the first span in cover whose beg is greater than val.
++ * If there is no such span, then cover->num is returned.
++ */
++static size_t cover_find(cover, val)
++    cover_t *cover;
++    bound_t val;
++{
++    size_t lo = 0, hi = cover->num;
++    while (lo < hi) {
++        size_t mid = (lo + hi) >> 1;
++        if (val < cover->span[mid].beg)
++            hi = mid;
++        else
++            lo = mid + 1;
++    }
++    return hi;
++}
++
++/* Return true if val lies within any one of the spans in cover. */
++static int cover_within(cover, val)
++    cover_t *cover;
++    bound_t val;
++{
++    size_t pos = cover_find(cover, val);
++    return pos > 0 && val < cover->span[pos - 1].end;
++}
++
++/*
++ * Add a new span to the list, but only if the new span does not overlap any
++ * spans already in the list. The new span covers the values beg..end-1. beg
++ * must be less than end.
++ *
++ * Keep the list sorted and merge adjacent spans. Grow the allocated space for
++ * the list as needed. On success, 0 is returned. If the new span overlaps any
++ * existing spans, then 1 is returned and the new span is not added to the
++ * list. If the new span is invalid because beg is greater than or equal to
++ * end, then -1 is returned. If the list needs to be grown but the memory
++ * allocation fails, then -2 is returned.
++ */
++static int cover_add(cover, beg, end)
++    cover_t *cover;
++    bound_t beg;
++    bound_t end;
++{
++    size_t pos;
++    int prec, foll;
++
++    if (beg >= end)
++    /* The new span is invalid. */
++        return -1;
++
++    /* Find where the new span should go, and make sure that it does not
++       overlap with any existing spans. */
++    pos = cover_find(cover, beg);
++    if ((pos > 0 && beg < cover->span[pos - 1].end) ||
++        (pos < cover->num && end > cover->span[pos].beg))
++        return 1;
++
++    /* Check for adjacencies. */
++    prec = pos > 0 && beg == cover->span[pos - 1].end;
++    foll = pos < cover->num && end == cover->span[pos].beg;
++    if (prec && foll) {
++        /* The new span connects the preceding and following spans. Merge the
++           following span into the preceding span, and delete the following
++           span. */
++        cover->span[pos - 1].end = cover->span[pos].end;
++        cover->num--;
++        memmove(cover->span + pos, cover->span + pos + 1,
++                (cover->num - pos) * sizeof(span_t));
++    }
++    else if (prec)
++        /* The new span is adjacent only to the preceding span. Extend the end
++           of the preceding span. */
++        cover->span[pos - 1].end = end;
++    else if (foll)
++        /* The new span is adjacent only to the following span. Extend the
++           beginning of the following span. */
++        cover->span[pos].beg = beg;
++    else {
++        /* The new span has gaps between both the preceding and the following
++           spans. Assure that there is room and insert the span.  */
++        if (cover->num == cover->max) {
++            size_t max = cover->max == 0 ? 16 : cover->max << 1;
++            span_t *span = realloc(cover->span, max * sizeof(span_t));
++            if (span == NULL)
++                return -2;
++            cover->span = span;
++            cover->max = max;
++        }
++        memmove(cover->span + pos + 1, cover->span + pos,
++                (cover->num - pos) * sizeof(span_t));
++        cover->num++;
++        cover->span[pos].beg = beg;
++        cover->span[pos].end = end;
++    }
++    return 0;
++}
+ 
+ 
+ 
+@@ -376,6 +495,29 @@ int extract_or_test_files(__G)    /* return PK-type error code */
+     }
+ #endif /* !SFX || SFX_EXDIR */
+ 
++    /* One more: initialize cover structure for bomb detection. Start with a
++       span that covers the central directory though the end of the file. */
++    if (G.cover == NULL) {
++        G.cover = malloc(sizeof(cover_t));
++        if (G.cover == NULL) {
++            Info(slide, 0x401, ((char *)slide,
++              LoadFarString(NotEnoughMemCover)));
++            return PK_MEM;
++        }
++        ((cover_t *)G.cover)->span = NULL;
++        ((cover_t *)G.cover)->max = 0;
++    }
++    ((cover_t *)G.cover)->num = 0;
++    if ((G.extra_bytes != 0 &&
++         cover_add((cover_t *)G.cover, 0, G.extra_bytes) != 0) ||
++        cover_add((cover_t *)G.cover,
++                  G.extra_bytes + G.ecrec.offset_start_central_directory,
++                  G.ziplen) != 0) {
++        Info(slide, 0x401, ((char *)slide,
++          LoadFarString(NotEnoughMemCover)));
++        return PK_MEM;
++    }
++
+ /*---------------------------------------------------------------------------
+     The basic idea of this function is as follows.  Since the central di-
+     rectory lies at the end of the zipfile and the member files lie at the
+@@ -593,7 +735,8 @@ int extract_or_test_files(__G)    /* return PK-type error code */
+             if (error > error_in_archive)
+                 error_in_archive = error;
+             /* ...and keep going (unless disk full or user break) */
+-            if (G.disk_full > 1 || error_in_archive == IZ_CTRLC) {
++            if (G.disk_full > 1 || error_in_archive == IZ_CTRLC ||
++                error == PK_BOMB) {
+                 /* clear reached_end to signal premature stop ... */
+                 reached_end = FALSE;
+                 /* ... and cancel scanning the central directory */
+@@ -1062,6 +1205,11 @@ static int extract_or_test_entrylist(__G__ numchunk,
+ 
+         /* seek_zipf(__G__ pInfo->offset);  */
+         request = G.pInfo->offset + G.extra_bytes;
++        if (cover_within((cover_t *)G.cover, request)) {
++            Info(slide, 0x401, ((char *)slide,
++              LoadFarString(OverlappedComponents)));
++            return PK_BOMB;
++        }
+         inbuf_offset = request % INBUFSIZ;
+         bufstart = request - inbuf_offset;
+ 
+@@ -1593,6 +1741,18 @@ reprompt:
+             return IZ_CTRLC;        /* cancel operation by user request */
+         }
+ #endif
++        error = cover_add((cover_t *)G.cover, request,
++                          G.cur_zipfile_bufstart + (G.inptr - G.inbuf));
++        if (error < 0) {
++            Info(slide, 0x401, ((char *)slide,
++              LoadFarString(NotEnoughMemCover)));
++            return PK_MEM;
++        }
++        if (error != 0) {
++            Info(slide, 0x401, ((char *)slide,
++              LoadFarString(OverlappedComponents)));
++            return PK_BOMB;
++        }
+ #ifdef MACOS  /* MacOS is no preemptive OS, thus call event-handling by hand */
+         UserStop();
+ #endif
+@@ -1994,6 +2154,34 @@ static int extract_or_test_member(__G)    /* return PK-type error code */
+     }
+ 
+     undefer_input(__G);
++
++    if ((G.lrec.general_purpose_bit_flag & 8) != 0) {
++        /* skip over data descriptor (harder than it sounds, due to signature
++         * ambiguity)
++         */
++#       define SIG 0x08074b50
++#       define LOW 0xffffffff
++        uch buf[12];
++        unsigned shy = 12 - readbuf((char *)buf, 12);
++        ulg crc = shy ? 0 : makelong(buf);
++        ulg clen = shy ? 0 : makelong(buf + 4);
++        ulg ulen = shy ? 0 : makelong(buf + 8); /* or high clen if ZIP64 */
++        if (crc == SIG &&                       /* if not SIG, no signature */
++            (G.lrec.crc32 != SIG ||             /* if not SIG, have signature */
++             (clen == SIG &&                    /* if not SIG, no signature */
++              ((G.lrec.csize & LOW) != SIG ||   /* if not SIG, have signature */
++               (ulen == SIG &&                  /* if not SIG, no signature */
++                (G.zip64 ? G.lrec.csize >> 32 : G.lrec.ucsize) != SIG
++                                                /* if not SIG, have signature */
++                )))))
++                   /* skip four more bytes to account for signature */
++                   shy += 4 - readbuf((char *)buf, 4);
++        if (G.zip64)
++            shy += 8 - readbuf((char *)buf, 8); /* skip eight more for ZIP64 */
++        if (shy)
++            error = PK_ERR;
++    }
++
+     return error;
+ 
+ } /* end function extract_or_test_member() */
+diff --git a/globals.c b/globals.c
+index fa8cca5..1e0f608 100644
+--- a/globals.c
++++ b/globals.c
+@@ -181,6 +181,7 @@ Uz_Globs *globalsCtor()
+ # if (!defined(NO_TIMESTAMPS))
+     uO.D_flag=1;    /* default to '-D', no restoration of dir timestamps */
+ # endif
++    G.cover = NULL;     /* not allocated yet */
+ #endif
+ 
+     uO.lflag=(-1);
+diff --git a/globals.h b/globals.h
+index 11b7215..2bdcdeb 100644
+--- a/globals.h
++++ b/globals.h
+@@ -260,12 +260,15 @@ typedef struct Globals {
+     ecdir_rec       ecrec;         /* used in unzip.c, extract.c */
+     z_stat   statbuf;              /* used by main, mapname, check_for_newer */
+ 
++    int zip64;                     /* true if Zip64 info in extra field */
++
+     int      mem_mode;
+     uch      *outbufptr;           /* extract.c static */
+     ulg      outsize;              /* extract.c static */
+     int      reported_backslash;   /* extract.c static */
+     int      disk_full;
+     int      newfile;
++    void     **cover;              /* used in extract.c for bomb detection */
+ 
+     int      didCRlast;            /* fileio static */
+     ulg      numlines;             /* fileio static: number of lines printed */
+diff --git a/process.c b/process.c
+index a3c1a4d..208619c 100644
+--- a/process.c
++++ b/process.c
+@@ -637,6 +637,13 @@ void free_G_buffers(__G)     /* releases all memory allocated in global vars */
+     }
+ #endif
+ 
++    /* Free the cover span list and the cover structure. */
++    if (G.cover != NULL) {
++        free(*(G.cover));
++        free(G.cover);
++        G.cover = NULL;
++    }
++
+ } /* end function free_G_buffers() */
+ 
+ 
+@@ -1905,6 +1912,7 @@ int getZip64Data(__G__ ef_buf, ef_len)
+ 
+ #define Z64FLGS 0xffff
+ #define Z64FLGL 0xffffffff
++    G.zip64 = FALSE;
+ 
+     if (ef_len == 0 || ef_buf == NULL)
+         return PK_COOL;
+@@ -1964,6 +1972,8 @@ int getZip64Data(__G__ ef_buf, ef_len)
+             G.crec.disk_number_start = (zuvl_t)makelong(offset + ef_buf);
+             offset += 4;
+           }
++
++          G.zip64 = TRUE;
+ #if 0
+           break;                /* Expect only one EF_PKSZ64 block. */
+ #endif /* 0 */
+diff --git a/unzip.h b/unzip.h
+index 5b2a326..ed24a5b 100644
+--- a/unzip.h
++++ b/unzip.h
+@@ -645,6 +645,7 @@ typedef struct _Uzp_cdir_Rec {
+ #define PK_NOZIP           9   /* zipfile not found */
+ #define PK_PARAM          10   /* bad or illegal parameters specified */
+ #define PK_FIND           11   /* no files found */
++#define PK_BOMB           12   /* likely zip bomb */
+ #define PK_DISK           50   /* disk full */
+ #define PK_EOF            51   /* unexpected EOF */
+ 
+-- 
+2.22.0.vfs.1.1.57.gbaf16c8
+
diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_6.0.bb
index daba722722..0a2ac533e9 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -22,6 +22,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/UnZip%206.x%20%28latest%29/UnZip%206.0/
 	file://symlink.patch \
 	file://0001-unzip-fix-CVE-2018-1000035.patch \
 	file://CVE-2018-18384.patch \
+	file://CVE-2019-13232.patch \
 "
 UPSTREAM_VERSION_UNKNOWN = "1"
 
-- 
2.17.1


