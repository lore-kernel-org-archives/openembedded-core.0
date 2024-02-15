Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42DEDC4829E
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 16:18:18 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.17930.1708013897085378941
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 08:18:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=b49DkYct;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1d94b222a3aso9578485ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 08:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1708013896; x=1708618696; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cb7BnGxnKp2cid32BcjzlWGoafgsohgT9gPVCZ5iS7Y=;
        b=b49DkYct1pdLQoQ5WDBE+bic6yuV4Ws8hROWAiUYqhIfrR6KAppS152DbKPFiAh2+N
         9WTzlwnGfa1+puxnYiD4XvtQ5bWGM+dhqEmu6/F6PZZJsJx4plpsJlcQojBrAVy6dagI
         hpdPCEC/T2WqZFI4ylGnUziWjb7UC9CrRD82Y+U01VZiq3+3sqAGFhQCyJf9qnoZLCY3
         HnI0Y/tqbmjQKWePO87O1ndnQCdYEQ5vivcx9fuZDF2C9q+JRpNt3nxni4p4R4laZx22
         DkMLPhlSMN9xEWLn35NWEzj63E+OzL3YBaUJwcQQH6qRuvz4EN0vZhPcfAP5cYBdu0AB
         l4VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708013896; x=1708618696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cb7BnGxnKp2cid32BcjzlWGoafgsohgT9gPVCZ5iS7Y=;
        b=QcOFUVLPOHv3ayc+sdUhhManVD2DxSYBq2/GojnLyctnAjgkgeP0m2GgU3HuLVMrz3
         Pmcn8s3WxzUm8VzAdfR6cvKAiSkgUjwiTAoGy1ZaSpqh0lYmTCQq5+BIRhFYRTZbu008
         x2e8iRYLTCBow89lQKb4vdzjC23trYmFeXmd7/TIeqg00yNGHKh1I4SoM9hMADwRQBah
         WV/+jHHTE5qvhKH71BwUKF0bZ9cP5a9T5Y5oE4znOfUKEcc8h/8V0TDVOBiaXpcyr3XX
         uhSH6Sy3VbXKPhJ4NSe8Ou/MsB/yjxgvlkP652N/m6ZSbi2wSVdafOYiIvV/mVBBtHx6
         jb/Q==
X-Gm-Message-State: AOJu0Yxe3K06EIE0CjdrLitWaxoJ6qtJOak6xfrM9gDQmpPFStIxPLy3
	uPiWJbKY0q3bP/fVUY9W6OXzyVQs6gpLW8gBzNhdmx60ueAXoqjij7jvFG9JbUWSD9dGVhrbDdl
	7yYA=
X-Google-Smtp-Source: AGHT+IEJRikCKkV0thpfxNDA/IeWWTo0ajz/ZCc+tGd/u7y8d2+YZ8PRod1EL4c8/kK3fXzMhfLwYw==
X-Received: by 2002:a17:902:8218:b0:1db:5eaa:e9a2 with SMTP id x24-20020a170902821800b001db5eaae9a2mr2048389pln.64.1708013896066;
        Thu, 15 Feb 2024 08:18:16 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id l17-20020a170902d05100b001db66f3748bsm1445683pll.121.2024.02.15.08.18.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 08:18:15 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 02/21] tiff: fix CVE-2023-52355 and CVE-2023-52356
Date: Thu, 15 Feb 2024 06:17:45 -1000
Message-Id: <71348662169be9737b10fbd305646df9295a07f6.1708012696.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708012696.git.steve@sakoman.com>
References: <cover.1708012696.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 16:18:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195522

From: Yogita Urade <yogita.urade@windriver.com>

CVE-2023-52355:
An out-of-memory flaw was found in libtiff that could be
triggered by passing a crafted tiff file to the
TIFFRasterScanlineSize64() API. This flaw allows a remote
attacker to cause a denial of service via a crafted input
with a size smaller than 379 KB.
Issue fixed by providing a documentation update.

CVE-2023-52356:
A segment fault (SEGV) flaw was found in libtiff that could
be triggered by passing a crafted tiff file to the
TIFFReadRGBATileExt() API. This flaw allows a remote attacker
to cause a heap-buffer overflow, leading to a denial of service.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-52355
https://security-tracker.debian.org/tracker/CVE-2023-52355
https://gitlab.com/libtiff/libtiff/-/issues/621
https://gitlab.com/libtiff/libtiff/-/merge_requests/553
https://nvd.nist.gov/vuln/detail/CVE-2023-52356
https://gitlab.com/libtiff/libtiff/-/issues/622
https://gitlab.com/libtiff/libtiff/-/merge_requests/546

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 831d7a2fffb3dec94571289292f0940bc7ecd70a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libtiff/tiff/CVE-2023-52355-0001.patch    | 238 ++++++++++++++++++
 .../libtiff/tiff/CVE-2023-52355-0002.patch    |  28 +++
 .../libtiff/tiff/CVE-2023-52356.patch         |  49 ++++
 meta/recipes-multimedia/libtiff/tiff_4.6.0.bb |   3 +
 4 files changed, 318 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-52355-0001.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-52355-0002.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-52356.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-52355-0001.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-52355-0001.patch
new file mode 100644
index 0000000000..f5520fcafd
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-52355-0001.patch
@@ -0,0 +1,238 @@
+From 335947359ce2dd3862cd9f7c49f92eba065dfed4 Mon Sep 17 00:00:00 2001
+From: Su_Laus <sulau@freenet.de>
+Date: Thu, 1 Feb 2024 13:06:08 +0000
+Subject: [PATCH] manpage: Update TIFF documentation about TIFFOpenOptions.rst
+ and TIFFOpenOptionsSetMaxSingleMemAlloc() usage and some other small fixes.
+
+CVE: CVE-2023-52355
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/335947359ce2dd3862cd9f7c49f92eba065dfed4]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ doc/functions/TIFFDeferStrileArrayWriting.rst |  5 +++
+ doc/functions/TIFFError.rst                   |  3 ++
+ doc/functions/TIFFOpen.rst                    | 13 +++---
+ doc/functions/TIFFOpenOptions.rst             | 44 ++++++++++++++++++-
+ doc/functions/TIFFStrileQuery.rst             |  5 +++
+ doc/libtiff.rst                               | 31 ++++++++++++-
+ 6 files changed, 91 insertions(+), 10 deletions(-)
+
+diff --git a/doc/functions/TIFFDeferStrileArrayWriting.rst b/doc/functions/TIFFDeferStrileArrayWriting.rst
+index 60ee746..705aebc 100644
+--- a/doc/functions/TIFFDeferStrileArrayWriting.rst
++++ b/doc/functions/TIFFDeferStrileArrayWriting.rst
+@@ -61,6 +61,11 @@ Diagnostics
+ All error messages are directed to the :c:func:`TIFFErrorExtR` routine.
+ Likewise, warning messages are directed to the :c:func:`TIFFWarningExtR` routine.
+ 
++Note
++----
++
++This functionality was introduced with libtiff 4.1.
++
+ See also
+ --------
+ 
+diff --git a/doc/functions/TIFFError.rst b/doc/functions/TIFFError.rst
+index 99924ad..cf4b37c 100644
+--- a/doc/functions/TIFFError.rst
++++ b/doc/functions/TIFFError.rst
+@@ -65,6 +65,9 @@ or :c:func:`TIFFClientOpenExt`.
+ Furthermore, a **custom defined data structure** *user_data* for the
+ error handler can be given along.
+ 
++Please refer to :doc:`/functions/TIFFOpenOptions` for how to setup the
++application-specific handler introduced with libtiff 4.5.
++
+ Note
+ ----
+ 
+diff --git a/doc/functions/TIFFOpen.rst b/doc/functions/TIFFOpen.rst
+index db79d7b..adc474f 100644
+--- a/doc/functions/TIFFOpen.rst
++++ b/doc/functions/TIFFOpen.rst
+@@ -94,8 +94,9 @@ TIFF structure without closing the file handle and afterwards the
+ file should be closed using its file descriptor *fd*.
+ 
+ :c:func:`TIFFOpenExt` (added in libtiff 4.5) is like :c:func:`TIFFOpen`,
+-but options, such as re-entrant error and warning handlers may be passed
+-with the *opts* argument. The *opts* argument may be NULL. 
++but options, such as re-entrant error and warning handlers and a limit in byte
++that libtiff internal memory allocation functions are allowed to request per call
++may be passed with the *opts* argument. The *opts* argument may be NULL.
+ Refer to :doc:`TIFFOpenOptions` for allocating and filling the *opts* argument
+ parameters. The allocated memory for :c:type:`TIFFOpenOptions`
+ can be released straight after successful execution of the related
+@@ -105,9 +106,7 @@ can be released straight after successful execution of the related
+ but opens a TIFF file with a Unicode filename.
+ 
+ :c:func:`TIFFFdOpenExt` (added in libtiff 4.5) is like :c:func:`TIFFFdOpen`,
+-but options, such as re-entrant error and warning handlers may be passed
+-with the *opts* argument. The *opts* argument may be NULL. 
+-Refer to :doc:`TIFFOpenOptions` for filling the *opts* argument.
++but options argument *opts* like for :c:func:`TIFFOpenExt` can be passed.
+ 
+ :c:func:`TIFFSetFileName` sets the file name in the tif-structure
+ and returns the old file name.
+@@ -326,5 +325,5 @@ See also
+ 
+ :doc:`libtiff` (3tiff),
+ :doc:`TIFFClose` (3tiff),
+-:doc:`TIFFStrileQuery`,
+-:doc:`TIFFOpenOptions`
+\ No newline at end of file
++:doc:`TIFFStrileQuery` (3tiff),
++:doc:`TIFFOpenOptions`
+diff --git a/doc/functions/TIFFOpenOptions.rst b/doc/functions/TIFFOpenOptions.rst
+index 5c67566..23f2975 100644
+--- a/doc/functions/TIFFOpenOptions.rst
++++ b/doc/functions/TIFFOpenOptions.rst
+@@ -38,12 +38,17 @@ opaque structure and returns a :c:type:`TIFFOpenOptions` pointer.
+ :c:func:`TIFFOpenOptionsFree` releases the allocated memory for
+ :c:type:`TIFFOpenOptions`. The allocated memory for :c:type:`TIFFOpenOptions`
+ can be released straight after successful execution of the related
+-TIFF open"Ext" functions like :c:func:`TIFFOpenExt`.
++TIFFOpen"Ext" functions like :c:func:`TIFFOpenExt`.
+ 
+ :c:func:`TIFFOpenOptionsSetMaxSingleMemAlloc` sets parameter for the
+ maximum single memory limit in byte that ``libtiff`` internal memory allocation
+ functions are allowed to request per call.
+ 
++.. note::
++    However, the ``libtiff`` external functions :c:func:`_TIFFmalloc`
++    and :c:func:`_TIFFrealloc` **do not apply** this internal memory
++    allocation limit set by :c:func:`TIFFOpenOptionsSetMaxSingleMemAlloc`!
++
+ :c:func:`TIFFOpenOptionsSetErrorHandlerExtR` sets the function pointer to
+ an application-specific and per-TIFF handle (re-entrant) error handler.
+ Furthermore, a pointer to a **custom defined data structure** *errorhandler_user_data* 
+@@ -55,6 +60,43 @@ The *errorhandler_user_data* argument may be NULL.
+ :c:func:`TIFFOpenOptionsSetErrorHandlerExtR` but for the warning handler,
+ which is invoked through  :c:func:`TIFFWarningExtR`
+ 
++Example
++-------
++
++::
++
++    #include "tiffio.h"
++
++    typedef struct MyErrorHandlerUserDataStruct
++    {
++        /* ... any user data structure ... */
++    } MyErrorHandlerUserDataStruct;
++
++    static int myErrorHandler(TIFF *tiff, void *user_data, const char *module,
++                          const char *fmt, va_list ap)
++    {
++        MyErrorHandlerUserDataStruct *errorhandler_user_data =
++            (MyErrorHandlerUserDataStruct *)user_data;
++        /*... code of myErrorHandler ...*/
++        return 1;
++    }
++
++
++    main()
++    {
++        tmsize_t limit = (256 * 1024 * 1024);
++        MyErrorHandlerUserDataStruct user_data = { /* ... any data ... */};
++
++        TIFFOpenOptions *opts = TIFFOpenOptionsAlloc();
++        TIFFOpenOptionsSetMaxSingleMemAlloc(opts, limit);
++        TIFFOpenOptionsSetErrorHandlerExtR(opts, myErrorHandler, &user_data);
++        TIFF *tif = TIFFOpenExt("foo.tif", "r", opts);
++        TIFFOpenOptionsFree(opts);
++        /* ... go on here ... */
++
++        TIFFClose(tif);
++    }
++
+ Note
+ ----
+ 
+diff --git a/doc/functions/TIFFStrileQuery.rst b/doc/functions/TIFFStrileQuery.rst
+index f8631af..7931fe4 100644
+--- a/doc/functions/TIFFStrileQuery.rst
++++ b/doc/functions/TIFFStrileQuery.rst
+@@ -66,6 +66,11 @@ Diagnostics
+ All error messages are directed to the :c:func:`TIFFErrorExtR` routine.
+ Likewise, warning messages are directed to the :c:func:`TIFFWarningExtR` routine.
+ 
++Note
++----
++
++This functionality was introduced with libtiff 4.1.
++
+ See also
+ --------
+ 
+diff --git a/doc/libtiff.rst b/doc/libtiff.rst
+index 6a0054c..d96a860 100644
+--- a/doc/libtiff.rst
++++ b/doc/libtiff.rst
+@@ -90,11 +90,15 @@ compatibility on machines with a segmented architecture.
+ :c:func:`realloc`, and :c:func:`free` routines in the C library.)
+ 
+ To deal with segmented pointer issues ``libtiff`` also provides
+-:c:func:`_TIFFmemcpy`, :c:func:`_TIFFmemset`, and :c:func:`_TIFFmemmove`
++:c:func:`_TIFFmemcpy`, :c:func:`_TIFFmemset`, and :c:func:`_TIFFmemcmp`
+ routines that mimic the equivalent ANSI C routines, but that are
+ intended for use with memory allocated through :c:func:`_TIFFmalloc`
+ and :c:func:`_TIFFrealloc`.
+ 
++With ``libtiff`` 4.5 a method was introduced to limit the internal
++memory allocation that functions are allowed to request per call
++(see  :c:func:`TIFFOpenOptionsSetMaxSingleMemAlloc` and :c:func:`TIFFOpenExt`).
++
+ Error Handling
+ --------------
+ 
+@@ -106,6 +110,10 @@ routine that can be specified with a call to :c:func:`TIFFSetErrorHandler`.
+ Likewise warning messages are directed to a single handler routine
+ that can be specified with a call to :c:func:`TIFFSetWarningHandler`
+ 
++Further application-specific and per-TIFF handle (re-entrant) error handler
++and warning handler can be set. Please refer to :doc:`/functions/TIFFError`
++and :doc:`/functions/TIFFOpenOptions`.
++
+ Basic File Handling
+ -------------------
+ 
+@@ -139,7 +147,7 @@ a ``"w"`` argument:
+     main()
+     {
+         TIFF* tif = TIFFOpen("foo.tif", "w");
+-        ... do stuff ...
++        /* ... do stuff ... */
+         TIFFClose(tif);
+     }
+ 
+@@ -157,6 +165,25 @@ to always call :c:func:`TIFFClose` or :c:func:`TIFFFlush` to flush any
+ buffered information to a file.  Note that if you call :c:func:`TIFFClose`
+ you do not need to call :c:func:`TIFFFlush`.
+ 
++.. warning::
++
++    In order to prevent out-of-memory issues when opening a TIFF file
++    :c:func:`TIFFOpenExt` can be used and then the maximum single memory
++    limit in byte that ``libtiff`` internal memory allocation functions
++    are allowed to request per call can be set with
++    :c:func:`TIFFOpenOptionsSetMaxSingleMemAlloc`.
++
++Example
++
++::
++
++    tmsize_t limit = (256 * 1024 * 1024);
++    TIFFOpenOptions *opts = TIFFOpenOptionsAlloc();
++    TIFFOpenOptionsSetMaxSingleMemAlloc(opts, limit);
++    TIFF *tif = TIFFOpenExt("foo.tif", "w", opts);
++    TIFFOpenOptionsFree(opts);
++    /* ... go on here ... */
++
+ TIFF Directories
+ ----------------
+ 
+-- 
+2.40.0
+
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-52355-0002.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-52355-0002.patch
new file mode 100644
index 0000000000..19a1ef727a
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-52355-0002.patch
@@ -0,0 +1,28 @@
+From 16ab4a205cfc938c32686e8d697d048fabf97ed4 Mon Sep 17 00:00:00 2001
+From: Timothy Lyanguzov <theta682@gmail.com>
+Date: Thu, 1 Feb 2024 11:19:06 +0000
+Subject: [PATCH] Fix typo.
+
+CVE: CVE-2023-52355
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/16ab4a205cfc938c32686e8d697d048fabf97ed4]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ doc/libtiff.rst | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/doc/libtiff.rst b/doc/libtiff.rst
+index d96a860..4fedc3e 100644
+--- a/doc/libtiff.rst
++++ b/doc/libtiff.rst
+@@ -169,7 +169,7 @@ you do not need to call :c:func:`TIFFFlush`.
+
+     In order to prevent out-of-memory issues when opening a TIFF file
+     :c:func:`TIFFOpenExt` can be used and then the maximum single memory
+-    limit in byte that ``libtiff`` internal memory allocation functions
++    limit in bytes that ``libtiff`` internal memory allocation functions
+     are allowed to request per call can be set with
+     :c:func:`TIFFOpenOptionsSetMaxSingleMemAlloc`.
+
+--
+2.40.0
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-52356.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-52356.patch
new file mode 100644
index 0000000000..75f5d8946a
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-52356.patch
@@ -0,0 +1,49 @@
+From 51558511bdbbcffdce534db21dbaf5d54b31638a Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Thu, 1 Feb 2024 11:38:14 +0000
+Subject: [PATCH] TIFFReadRGBAStrip/TIFFReadRGBATile: add more validation of
+ col/row (fixes #622)
+
+CVE: CVE-2023-52356
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/51558511bdbbcffdce534db21dbaf5d54b31638a]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ libtiff/tif_getimage.c | 15 +++++++++++++++
+ 1 file changed, 15 insertions(+)
+
+diff --git a/libtiff/tif_getimage.c b/libtiff/tif_getimage.c
+index 41f7dfd..9cd6eee 100644
+--- a/libtiff/tif_getimage.c
++++ b/libtiff/tif_getimage.c
+@@ -3224,6 +3224,13 @@ int TIFFReadRGBAStripExt(TIFF *tif, uint32_t row, uint32_t *raster,
+     if (TIFFRGBAImageOK(tif, emsg) &&
+         TIFFRGBAImageBegin(&img, tif, stop_on_error, emsg))
+     {
++	if (row >= img.height)
++        {
++            TIFFErrorExtR(tif, TIFFFileName(tif),
++                          "Invalid row passed to TIFFReadRGBAStrip().");
++            TIFFRGBAImageEnd(&img);
++            return (0);
++	}
+
+         img.row_offset = row;
+         img.col_offset = 0;
+@@ -3301,6 +3308,14 @@ int TIFFReadRGBATileExt(TIFF *tif, uint32_t col, uint32_t row, uint32_t *raster,
+         return (0);
+     }
+
++    if (col >= img.width || row >= img.height)
++    {
++        TIFFErrorExtR(tif, TIFFFileName(tif),
++                      "Invalid row/col passed to TIFFReadRGBATile().");
++        TIFFRGBAImageEnd(&img);
++        return (0);
++    }
++
+     /*
+      * The TIFFRGBAImageGet() function doesn't allow us to get off the
+      * edge of the image, even to fill an otherwise valid tile.  So we
+--
+2.40.0
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb
index eb8a096f19..a26e4694f6 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb
@@ -13,6 +13,9 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2023-6277-At-image-reading-compare-data-size-of-some-tags-data-2.patch \
            file://CVE-2023-6277-Apply-1-suggestion-s-to-1-file-s.patch \
            file://CVE-2023-6228.patch \
+           file://CVE-2023-52355-0001.patch \
+           file://CVE-2023-52355-0002.patch \
+           file://CVE-2023-52356.patch \
            "
 
 SRC_URI[sha256sum] = "88b3979e6d5c7e32b50d7ec72fb15af724f6ab2cbf7e10880c360a77e4b5d99a"
-- 
2.34.1


