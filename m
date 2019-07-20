Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id E5E817F0AF
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Jul 2019 18:14:57 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id h21so34345846qtn.13
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Jul 2019 11:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=w/HuzvZI+1VBNWQG1vKaR7tUPKQHY0Dpcdqd+rQ0nys=;
	b=LBgRk7tH923EXwWuFl8FXt1iwhAEBNIXWoemInzujhXnJ1ZQRZuWQyYYp/UdrFAnaZ
	JRq59KOBAJJUpMup6HvwJFoyaoCL91D6T921aGSPU4zqUOfatBw89ESBRlzP05N66DRy
	tT3YgLAaKP1ACbkMqYuXAdwxl/wUytQTywLfQi6blKRCeb3zHk1T1gerDSmuEvdG1UnN
	wUITflCPdfl/vEJmiFA5cqxXTdOaTnGGQzffaYgXIzKdfgdPqkU0eADuewqFhbwDtR0q
	dkpOJSsJxhsi8rxgFCavIYvNFGPqiGz2gNpAX6nN5oG8RPWu9L8++pf3H5vlJNarWH0F
	1Kbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=w/HuzvZI+1VBNWQG1vKaR7tUPKQHY0Dpcdqd+rQ0nys=;
	b=gYTPN/6wqE/tg8Ju49lKCBip+1pedlsGYWQ2CzwL05yS/vsbPShUh8eOhAwyg7iS3C
	574DNz6fkqbTlKUiD+Ab6QsxOvzUpT+Ej9YXGhOHg1OgM7IS/whR1s9kcWfiWguLRAvJ
	C/ed5FB7vp2EsT57lOTwI3PUOpWWAmtCxhkAel6lQZTCK925uZdTrqCdZ4itsqqvt81l
	R58k8sc5DXPvkpC6wExariuySBDzxh6kFTal4PqbZsBzgaJpIn+nw17/edk+yAPY3S5x
	xYb+vH2lXgnbVwnMnnmoLG+yK0QvTsfd28Ly8eUbUP/ZTNL9pM4ykxFLMClFuYOFe5lO
	8BOA==
X-Gm-Message-State: APjAAAUqVVXcBP+F+NAobIe+AogQYs6dlpbkdBcVwjIZ+NMuE5pDSYfF
	Cr5nYLZvlRiB8ylVQhrG5oLkF9W3T42Gr3o0GLw=
X-Google-Smtp-Source: APXvYqyeYoED4RibPA6QMI3B5yhwTIuwVcwUFaG7pDGYWSgQalCg5nf+vPLC9I3ZjtfaNZ6cKDGjX+K2zc397VOh3TA=
X-Received: by 2002:aed:3644:: with SMTP id e62mr41415568qtb.80.1563646498476; 
	Sat, 20 Jul 2019 11:14:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190719013108.5712-1-anuj.mittal@intel.com>
	<20190719013108.5712-3-anuj.mittal@intel.com>
In-Reply-To: <20190719013108.5712-3-anuj.mittal@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 20 Jul 2019 11:14:32 -0700
Message-ID: <CAMKF1sqEEnqGqiz4Rby2Vpm1FUX294zQUX+E5Ym8vUAKiu+1Hg@mail.gmail.com>
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] unzip: fix CVE-2019-13232
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
X-List-Received-Date: Sat, 20 Jul 2019 18:14:58 -0000
Content-Type: text/plain; charset="UTF-8"

This is causing issues in OE world build, unpacking zip SRC_URIs which
have been working well see


https://errors.yoctoproject.org/Errors/Build/84471/
https://errors.yoctoproject.org/Errors/Build/84470/
https://errors.yoctoproject.org/Errors/Build/84467/

Debian has the patch proposed here along with another patch but is
holding on to this since its causing regressions there as well.

https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=932318

We should not apply this patch yet or revert it if its applied already

On Thu, Jul 18, 2019 at 6:32 PM Anuj Mittal <anuj.mittal@intel.com> wrote:
>
> Include the fix by Mark Adler which has also been adopted by Debian.
>
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ---
>  .../unzip/unzip/CVE-2019-13232.patch          | 339 ++++++++++++++++++
>  meta/recipes-extended/unzip/unzip_6.0.bb      |   1 +
>  2 files changed, 340 insertions(+)
>  create mode 100644 meta/recipes-extended/unzip/unzip/CVE-2019-13232.patch
>
> diff --git a/meta/recipes-extended/unzip/unzip/CVE-2019-13232.patch b/meta/recipes-extended/unzip/unzip/CVE-2019-13232.patch
> new file mode 100644
> index 0000000000..c808f3d36a
> --- /dev/null
> +++ b/meta/recipes-extended/unzip/unzip/CVE-2019-13232.patch
> @@ -0,0 +1,339 @@
> +From: Mark Adler <madler@alumni.caltech.edu>
> +Subject: Detect and reject a zip bomb using overlapped entries.
> +Origin: https://github.com/madler/unzip/commit/47b3ceae397d21bf822bc2ac73052a4b1daf8e1c
> +Bug-Debian: https://bugs.debian.org/931433
> +X-Debian-version: 6.0-24
> +
> +    Detect and reject a zip bomb using overlapped entries.
> +
> +    This detects an invalid zip file that has at least one entry that
> +    overlaps with another entry or with the central directory to the
> +    end of the file. A Fifield zip bomb uses overlapped local entries
> +    to vastly increase the potential inflation ratio. Such an invalid
> +    zip file is rejected.
> +
> +    See https://www.bamsoftware.com/hacks/zipbomb/ for David Fifield's
> +    analysis, construction, and examples of such zip bombs.
> +
> +    The detection maintains a list of covered spans of the zip files
> +    so far, where the central directory to the end of the file and any
> +    bytes preceding the first entry at zip file offset zero are
> +    considered covered initially. Then as each entry is decompressed
> +    or tested, it is considered covered. When a new entry is about to
> +    be processed, its initial offset is checked to see if it is
> +    contained by a covered span. If so, the zip file is rejected as
> +    invalid.
> +
> +    This commit depends on a preceding commit: "Fix bug in
> +    undefer_input() that misplaced the input state."
> +
> +Upstream-Status: Pending [Patch taken from debian]
> +CVE: CVE-2019-13232
> +Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> +
> +--- a/extract.c
> ++++ b/extract.c
> +@@ -321,6 +321,125 @@
> +   "\nerror:  unsupported extra-field compression type (%u)--skipping\n";
> + static ZCONST char Far BadExtraFieldCRC[] =
> +   "error [%s]:  bad extra-field CRC %08lx (should be %08lx)\n";
> ++static ZCONST char Far NotEnoughMemCover[] =
> ++  "error: not enough memory for bomb detection\n";
> ++static ZCONST char Far OverlappedComponents[] =
> ++  "error: invalid zip file with overlapped components (possible zip bomb)\n";
> ++
> ++
> ++
> ++
> ++
> ++/* A growable list of spans. */
> ++typedef zoff_t bound_t;
> ++typedef struct {
> ++    bound_t beg;        /* start of the span */
> ++    bound_t end;        /* one past the end of the span */
> ++} span_t;
> ++typedef struct {
> ++    span_t *span;       /* allocated, distinct, and sorted list of spans */
> ++    size_t num;         /* number of spans in the list */
> ++    size_t max;         /* allocated number of spans (num <= max) */
> ++} cover_t;
> ++
> ++/*
> ++ * Return the index of the first span in cover whose beg is greater than val.
> ++ * If there is no such span, then cover->num is returned.
> ++ */
> ++static size_t cover_find(cover, val)
> ++    cover_t *cover;
> ++    bound_t val;
> ++{
> ++    size_t lo = 0, hi = cover->num;
> ++    while (lo < hi) {
> ++        size_t mid = (lo + hi) >> 1;
> ++        if (val < cover->span[mid].beg)
> ++            hi = mid;
> ++        else
> ++            lo = mid + 1;
> ++    }
> ++    return hi;
> ++}
> ++
> ++/* Return true if val lies within any one of the spans in cover. */
> ++static int cover_within(cover, val)
> ++    cover_t *cover;
> ++    bound_t val;
> ++{
> ++    size_t pos = cover_find(cover, val);
> ++    return pos > 0 && val < cover->span[pos - 1].end;
> ++}
> ++
> ++/*
> ++ * Add a new span to the list, but only if the new span does not overlap any
> ++ * spans already in the list. The new span covers the values beg..end-1. beg
> ++ * must be less than end.
> ++ *
> ++ * Keep the list sorted and merge adjacent spans. Grow the allocated space for
> ++ * the list as needed. On success, 0 is returned. If the new span overlaps any
> ++ * existing spans, then 1 is returned and the new span is not added to the
> ++ * list. If the new span is invalid because beg is greater than or equal to
> ++ * end, then -1 is returned. If the list needs to be grown but the memory
> ++ * allocation fails, then -2 is returned.
> ++ */
> ++static int cover_add(cover, beg, end)
> ++    cover_t *cover;
> ++    bound_t beg;
> ++    bound_t end;
> ++{
> ++    size_t pos;
> ++    int prec, foll;
> ++
> ++    if (beg >= end)
> ++    /* The new span is invalid. */
> ++        return -1;
> ++
> ++    /* Find where the new span should go, and make sure that it does not
> ++       overlap with any existing spans. */
> ++    pos = cover_find(cover, beg);
> ++    if ((pos > 0 && beg < cover->span[pos - 1].end) ||
> ++        (pos < cover->num && end > cover->span[pos].beg))
> ++        return 1;
> ++
> ++    /* Check for adjacencies. */
> ++    prec = pos > 0 && beg == cover->span[pos - 1].end;
> ++    foll = pos < cover->num && end == cover->span[pos].beg;
> ++    if (prec && foll) {
> ++        /* The new span connects the preceding and following spans. Merge the
> ++           following span into the preceding span, and delete the following
> ++           span. */
> ++        cover->span[pos - 1].end = cover->span[pos].end;
> ++        cover->num--;
> ++        memmove(cover->span + pos, cover->span + pos + 1,
> ++                (cover->num - pos) * sizeof(span_t));
> ++    }
> ++    else if (prec)
> ++        /* The new span is adjacent only to the preceding span. Extend the end
> ++           of the preceding span. */
> ++        cover->span[pos - 1].end = end;
> ++    else if (foll)
> ++        /* The new span is adjacent only to the following span. Extend the
> ++           beginning of the following span. */
> ++        cover->span[pos].beg = beg;
> ++    else {
> ++        /* The new span has gaps between both the preceding and the following
> ++           spans. Assure that there is room and insert the span.  */
> ++        if (cover->num == cover->max) {
> ++            size_t max = cover->max == 0 ? 16 : cover->max << 1;
> ++            span_t *span = realloc(cover->span, max * sizeof(span_t));
> ++            if (span == NULL)
> ++                return -2;
> ++            cover->span = span;
> ++            cover->max = max;
> ++        }
> ++        memmove(cover->span + pos + 1, cover->span + pos,
> ++                (cover->num - pos) * sizeof(span_t));
> ++        cover->num++;
> ++        cover->span[pos].beg = beg;
> ++        cover->span[pos].end = end;
> ++    }
> ++    return 0;
> ++}
> +
> +
> +
> +@@ -376,6 +495,29 @@
> +     }
> + #endif /* !SFX || SFX_EXDIR */
> +
> ++    /* One more: initialize cover structure for bomb detection. Start with a
> ++       span that covers the central directory though the end of the file. */
> ++    if (G.cover == NULL) {
> ++        G.cover = malloc(sizeof(cover_t));
> ++        if (G.cover == NULL) {
> ++            Info(slide, 0x401, ((char *)slide,
> ++              LoadFarString(NotEnoughMemCover)));
> ++            return PK_MEM;
> ++        }
> ++        ((cover_t *)G.cover)->span = NULL;
> ++        ((cover_t *)G.cover)->max = 0;
> ++    }
> ++    ((cover_t *)G.cover)->num = 0;
> ++    if ((G.extra_bytes != 0 &&
> ++         cover_add((cover_t *)G.cover, 0, G.extra_bytes) != 0) ||
> ++        cover_add((cover_t *)G.cover,
> ++                  G.extra_bytes + G.ecrec.offset_start_central_directory,
> ++                  G.ziplen) != 0) {
> ++        Info(slide, 0x401, ((char *)slide,
> ++          LoadFarString(NotEnoughMemCover)));
> ++        return PK_MEM;
> ++    }
> ++
> + /*---------------------------------------------------------------------------
> +     The basic idea of this function is as follows.  Since the central di-
> +     rectory lies at the end of the zipfile and the member files lie at the
> +@@ -593,7 +735,8 @@
> +             if (error > error_in_archive)
> +                 error_in_archive = error;
> +             /* ...and keep going (unless disk full or user break) */
> +-            if (G.disk_full > 1 || error_in_archive == IZ_CTRLC) {
> ++            if (G.disk_full > 1 || error_in_archive == IZ_CTRLC ||
> ++                error == PK_BOMB) {
> +                 /* clear reached_end to signal premature stop ... */
> +                 reached_end = FALSE;
> +                 /* ... and cancel scanning the central directory */
> +@@ -1062,6 +1205,11 @@
> +
> +         /* seek_zipf(__G__ pInfo->offset);  */
> +         request = G.pInfo->offset + G.extra_bytes;
> ++        if (cover_within((cover_t *)G.cover, request)) {
> ++            Info(slide, 0x401, ((char *)slide,
> ++              LoadFarString(OverlappedComponents)));
> ++            return PK_BOMB;
> ++        }
> +         inbuf_offset = request % INBUFSIZ;
> +         bufstart = request - inbuf_offset;
> +
> +@@ -1602,6 +1750,18 @@
> +             return IZ_CTRLC;        /* cancel operation by user request */
> +         }
> + #endif
> ++        error = cover_add((cover_t *)G.cover, request,
> ++                          G.cur_zipfile_bufstart + (G.inptr - G.inbuf));
> ++        if (error < 0) {
> ++            Info(slide, 0x401, ((char *)slide,
> ++              LoadFarString(NotEnoughMemCover)));
> ++            return PK_MEM;
> ++        }
> ++        if (error != 0) {
> ++            Info(slide, 0x401, ((char *)slide,
> ++              LoadFarString(OverlappedComponents)));
> ++            return PK_BOMB;
> ++        }
> + #ifdef MACOS  /* MacOS is no preemptive OS, thus call event-handling by hand */
> +         UserStop();
> + #endif
> +@@ -2003,6 +2163,34 @@
> +     }
> +
> +     undefer_input(__G);
> ++
> ++    if ((G.lrec.general_purpose_bit_flag & 8) != 0) {
> ++        /* skip over data descriptor (harder than it sounds, due to signature
> ++         * ambiguity)
> ++         */
> ++#       define SIG 0x08074b50
> ++#       define LOW 0xffffffff
> ++        uch buf[12];
> ++        unsigned shy = 12 - readbuf((char *)buf, 12);
> ++        ulg crc = shy ? 0 : makelong(buf);
> ++        ulg clen = shy ? 0 : makelong(buf + 4);
> ++        ulg ulen = shy ? 0 : makelong(buf + 8); /* or high clen if ZIP64 */
> ++        if (crc == SIG &&                       /* if not SIG, no signature */
> ++            (G.lrec.crc32 != SIG ||             /* if not SIG, have signature */
> ++             (clen == SIG &&                    /* if not SIG, no signature */
> ++              ((G.lrec.csize & LOW) != SIG ||   /* if not SIG, have signature */
> ++               (ulen == SIG &&                  /* if not SIG, no signature */
> ++                (G.zip64 ? G.lrec.csize >> 32 : G.lrec.ucsize) != SIG
> ++                                                /* if not SIG, have signature */
> ++                )))))
> ++                   /* skip four more bytes to account for signature */
> ++                   shy += 4 - readbuf((char *)buf, 4);
> ++        if (G.zip64)
> ++            shy += 8 - readbuf((char *)buf, 8); /* skip eight more for ZIP64 */
> ++        if (shy)
> ++            error = PK_ERR;
> ++    }
> ++
> +     return error;
> +
> + } /* end function extract_or_test_member() */
> +--- a/globals.c
> ++++ b/globals.c
> +@@ -181,6 +181,7 @@
> + # if (!defined(NO_TIMESTAMPS))
> +     uO.D_flag=1;    /* default to '-D', no restoration of dir timestamps */
> + # endif
> ++    G.cover = NULL;     /* not allocated yet */
> + #endif
> +
> +     uO.lflag=(-1);
> +--- a/globals.h
> ++++ b/globals.h
> +@@ -260,12 +260,15 @@
> +     ecdir_rec       ecrec;         /* used in unzip.c, extract.c */
> +     z_stat   statbuf;              /* used by main, mapname, check_for_newer */
> +
> ++    int zip64;                     /* true if Zip64 info in extra field */
> ++
> +     int      mem_mode;
> +     uch      *outbufptr;           /* extract.c static */
> +     ulg      outsize;              /* extract.c static */
> +     int      reported_backslash;   /* extract.c static */
> +     int      disk_full;
> +     int      newfile;
> ++    void     **cover;              /* used in extract.c for bomb detection */
> +
> +     int      didCRlast;            /* fileio static */
> +     ulg      numlines;             /* fileio static: number of lines printed */
> +--- a/process.c
> ++++ b/process.c
> +@@ -637,6 +637,13 @@
> +     }
> + #endif
> +
> ++    /* Free the cover span list and the cover structure. */
> ++    if (G.cover != NULL) {
> ++        free(*(G.cover));
> ++        free(G.cover);
> ++        G.cover = NULL;
> ++    }
> ++
> + } /* end function free_G_buffers() */
> +
> +
> +@@ -1913,6 +1920,8 @@
> + #define Z64FLGS 0xffff
> + #define Z64FLGL 0xffffffff
> +
> ++    G.zip64 = FALSE;
> ++
> +     if (ef_len == 0 || ef_buf == NULL)
> +         return PK_COOL;
> +
> +@@ -2084,6 +2093,8 @@
> +                     (ZCONST char *)(offset + ef_buf), ULen);
> +             G.unipath_filename[ULen] = '\0';
> +           }
> ++
> ++          G.zip64 = TRUE;
> +         }
> +
> +         /* Skip this extra field block */
> +--- a/unzip.h
> ++++ b/unzip.h
> +@@ -645,6 +645,7 @@
> + #define PK_NOZIP           9   /* zipfile not found */
> + #define PK_PARAM          10   /* bad or illegal parameters specified */
> + #define PK_FIND           11   /* no files found */
> ++#define PK_BOMB           12   /* likely zip bomb */
> + #define PK_DISK           50   /* disk full */
> + #define PK_EOF            51   /* unexpected EOF */
> +
> diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_6.0.bb
> index daba722722..1d18526ce2 100644
> --- a/meta/recipes-extended/unzip/unzip_6.0.bb
> +++ b/meta/recipes-extended/unzip/unzip_6.0.bb
> @@ -22,6 +22,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/UnZip%206.x%20%28latest%29/UnZip%206.0/
>         file://symlink.patch \
>         file://0001-unzip-fix-CVE-2018-1000035.patch \
>         file://CVE-2018-18384.patch \
> +        file://CVE-2019-13232.patch \
>  "
>  UPSTREAM_VERSION_UNKNOWN = "1"
>
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

