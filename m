Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFB0FE77175
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 06:50:01 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.8167.1733294997212213628
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Dec 2024 22:49:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bUjYv4PC;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-434aa222d96so78337455e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 22:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733294996; x=1733899796; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DUL/QqL2mLyg5x+TeYXveBB1YRtOIkIpW97Q5XSFXu8=;
        b=bUjYv4PCJwArGQR7Cy6i1ScAQrSrAqP/pbZxFaH+7vyR8/rUa4RyKnspcW3R048jsw
         T2S2cJ4zhw9aVLmTMrheRf/y3OFfctmD5R1+fV1r97sQwILkZhZ3cI4xwSiZcThVH+6X
         l7a6ExXeypWmNQDP+GMdOED6Q0BPQ3MMDvInoCX2VucJgMp1uyHCR/jjabPKhxBMo/nP
         evoKrUtspxVmqo7+cez9PndM4xP9LcDe+FEWQWTK9yTY3IDrMaso5qtE4kL2EwyUYBgS
         XmFfB3cUvDFDSmiKms8SyFWLTvLSEtGU3fDFTsOteEvOlWvvI/iEpPfwxsINh0FT4OZd
         fSyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733294996; x=1733899796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DUL/QqL2mLyg5x+TeYXveBB1YRtOIkIpW97Q5XSFXu8=;
        b=u2Viu1lnR5V8tIJSzs6LLRfdJA1Yry2D72xSfccxwEHB8PwkTXWCQ2mPGmPoyIb+XJ
         HIC9YeMgqL0IkGoCToeyONU5eqHdNtIvXr3nTmhoqPmoBlHlLbczWl7fhR5ANG+SdQ0L
         6NU2z8BJpDSI1apKT488I5436V4EwsiXW55nFVWAZ8U9/fvqnzq4NJxFFG22V2Ywf45b
         18VOnURHEGst6F/0lnqxofK1YimmEnWcGR54ZmLssoH67TrMF0UMXa/1jJ+qk2QHW2HG
         tHZryLQyEooxzevUMLL+I4ol3D9YALET47W7oiEk4HMDhI4gYJSkHLLyUMzABgsFbsv+
         bYgQ==
X-Gm-Message-State: AOJu0YxhH6ikcXdTL7s36vb7FES4A5GvqObuzJzITcW7GwJSOLCzXI0x
	RoP5PXf9iw7BQreKCEA9YML9oANlc/e3iDL9K31qM44+QQ9glkcNxkvMFw==
X-Gm-Gg: ASbGncscg7zYaQ0ZNWGlSd6s5PQbubswpascptaiVLAAymjWAex8qXU9+kliVWKWKN1
	bYyKklr2bl3VbObJQt4LIXBdac6ZgwpaoTe/0l47ESyrXHTYTASFdI1ze0LMDWG3y33XRuqISng
	Hm3n4jOZU5mxu2fsCnoIIxwK1d/F3QwyYpeyqFyun1qRU26VDaizbj+v5lQhMUu/YjrHmfq7ntv
	eqcwtM1RSgooOUwFHRmaGvYA+2m97sUqxsJ3ezuXDs/Z1icjziDykVEbv816sbum1xnkbEgf3af
	LIMIK2YrQRI=
X-Google-Smtp-Source: AGHT+IHhIalGxVB2hz0yHapPrtIKHYafB/HrCfWuG1Rfb1139tnV8U2z90siOiBlcFmv/BbKWsc1mg==
X-Received: by 2002:a05:6000:1543:b0:385:e4a7:df09 with SMTP id ffacd0b85a97d-385fd43567bmr4723028f8f.44.1733294995247;
        Tue, 03 Dec 2024 22:49:55 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385f343f293sm7435757f8f.36.2024.12.03.22.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 22:49:54 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 26/37] tiff: update 4.6.0 -> 4.7.0
Date: Wed,  4 Dec 2024 07:49:09 +0100
Message-Id: <20241204064920.817016-26-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241204064920.817016-1-alex.kanavin@gmail.com>
References: <20241204064920.817016-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 06:50:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208255

From: Alexander Kanavin <alex@linutronix.de>

Drop all CVE backports.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libtiff/tiff/CVE-2023-52355-0001.patch    | 238 ------------------
 .../libtiff/tiff/CVE-2023-52355-0002.patch    |  28 ---
 .../libtiff/tiff/CVE-2023-52356.patch         |  49 ----
 .../libtiff/tiff/CVE-2023-6228.patch          |  31 ---
 ...277-Apply-1-suggestion-s-to-1-file-s.patch |  27 --
 ...ompare-data-size-of-some-tags-data-2.patch |  36 ---
 ...-compare-data-size-of-some-tags-data.patch | 162 ------------
 .../libtiff/tiff/CVE-2024-7006.patch          |  65 -----
 .../libtiff/{tiff_4.6.0.bb => tiff_4.7.0.bb}  |  15 +-
 9 files changed, 3 insertions(+), 648 deletions(-)
 delete mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-52355-0001.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-52355-0002.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-52356.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-6228.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-Apply-1-suggestion-s-to-1-file-s.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-At-image-reading-compare-data-size-of-some-tags-data-2.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-At-image-reading-compare-data-size-of-some-tags-data.patch
 delete mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2024-7006.patch
 rename meta/recipes-multimedia/libtiff/{tiff_4.6.0.bb => tiff_4.7.0.bb} (79%)

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-52355-0001.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-52355-0001.patch
deleted file mode 100644
index f5520fcafd4..00000000000
--- a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-52355-0001.patch
+++ /dev/null
@@ -1,238 +0,0 @@
-From 335947359ce2dd3862cd9f7c49f92eba065dfed4 Mon Sep 17 00:00:00 2001
-From: Su_Laus <sulau@freenet.de>
-Date: Thu, 1 Feb 2024 13:06:08 +0000
-Subject: [PATCH] manpage: Update TIFF documentation about TIFFOpenOptions.rst
- and TIFFOpenOptionsSetMaxSingleMemAlloc() usage and some other small fixes.
-
-CVE: CVE-2023-52355
-Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/335947359ce2dd3862cd9f7c49f92eba065dfed4]
-
-Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
----
- doc/functions/TIFFDeferStrileArrayWriting.rst |  5 +++
- doc/functions/TIFFError.rst                   |  3 ++
- doc/functions/TIFFOpen.rst                    | 13 +++---
- doc/functions/TIFFOpenOptions.rst             | 44 ++++++++++++++++++-
- doc/functions/TIFFStrileQuery.rst             |  5 +++
- doc/libtiff.rst                               | 31 ++++++++++++-
- 6 files changed, 91 insertions(+), 10 deletions(-)
-
-diff --git a/doc/functions/TIFFDeferStrileArrayWriting.rst b/doc/functions/TIFFDeferStrileArrayWriting.rst
-index 60ee746..705aebc 100644
---- a/doc/functions/TIFFDeferStrileArrayWriting.rst
-+++ b/doc/functions/TIFFDeferStrileArrayWriting.rst
-@@ -61,6 +61,11 @@ Diagnostics
- All error messages are directed to the :c:func:`TIFFErrorExtR` routine.
- Likewise, warning messages are directed to the :c:func:`TIFFWarningExtR` routine.
- 
-+Note
-+----
-+
-+This functionality was introduced with libtiff 4.1.
-+
- See also
- --------
- 
-diff --git a/doc/functions/TIFFError.rst b/doc/functions/TIFFError.rst
-index 99924ad..cf4b37c 100644
---- a/doc/functions/TIFFError.rst
-+++ b/doc/functions/TIFFError.rst
-@@ -65,6 +65,9 @@ or :c:func:`TIFFClientOpenExt`.
- Furthermore, a **custom defined data structure** *user_data* for the
- error handler can be given along.
- 
-+Please refer to :doc:`/functions/TIFFOpenOptions` for how to setup the
-+application-specific handler introduced with libtiff 4.5.
-+
- Note
- ----
- 
-diff --git a/doc/functions/TIFFOpen.rst b/doc/functions/TIFFOpen.rst
-index db79d7b..adc474f 100644
---- a/doc/functions/TIFFOpen.rst
-+++ b/doc/functions/TIFFOpen.rst
-@@ -94,8 +94,9 @@ TIFF structure without closing the file handle and afterwards the
- file should be closed using its file descriptor *fd*.
- 
- :c:func:`TIFFOpenExt` (added in libtiff 4.5) is like :c:func:`TIFFOpen`,
--but options, such as re-entrant error and warning handlers may be passed
--with the *opts* argument. The *opts* argument may be NULL. 
-+but options, such as re-entrant error and warning handlers and a limit in byte
-+that libtiff internal memory allocation functions are allowed to request per call
-+may be passed with the *opts* argument. The *opts* argument may be NULL.
- Refer to :doc:`TIFFOpenOptions` for allocating and filling the *opts* argument
- parameters. The allocated memory for :c:type:`TIFFOpenOptions`
- can be released straight after successful execution of the related
-@@ -105,9 +106,7 @@ can be released straight after successful execution of the related
- but opens a TIFF file with a Unicode filename.
- 
- :c:func:`TIFFFdOpenExt` (added in libtiff 4.5) is like :c:func:`TIFFFdOpen`,
--but options, such as re-entrant error and warning handlers may be passed
--with the *opts* argument. The *opts* argument may be NULL. 
--Refer to :doc:`TIFFOpenOptions` for filling the *opts* argument.
-+but options argument *opts* like for :c:func:`TIFFOpenExt` can be passed.
- 
- :c:func:`TIFFSetFileName` sets the file name in the tif-structure
- and returns the old file name.
-@@ -326,5 +325,5 @@ See also
- 
- :doc:`libtiff` (3tiff),
- :doc:`TIFFClose` (3tiff),
--:doc:`TIFFStrileQuery`,
--:doc:`TIFFOpenOptions`
-\ No newline at end of file
-+:doc:`TIFFStrileQuery` (3tiff),
-+:doc:`TIFFOpenOptions`
-diff --git a/doc/functions/TIFFOpenOptions.rst b/doc/functions/TIFFOpenOptions.rst
-index 5c67566..23f2975 100644
---- a/doc/functions/TIFFOpenOptions.rst
-+++ b/doc/functions/TIFFOpenOptions.rst
-@@ -38,12 +38,17 @@ opaque structure and returns a :c:type:`TIFFOpenOptions` pointer.
- :c:func:`TIFFOpenOptionsFree` releases the allocated memory for
- :c:type:`TIFFOpenOptions`. The allocated memory for :c:type:`TIFFOpenOptions`
- can be released straight after successful execution of the related
--TIFF open"Ext" functions like :c:func:`TIFFOpenExt`.
-+TIFFOpen"Ext" functions like :c:func:`TIFFOpenExt`.
- 
- :c:func:`TIFFOpenOptionsSetMaxSingleMemAlloc` sets parameter for the
- maximum single memory limit in byte that ``libtiff`` internal memory allocation
- functions are allowed to request per call.
- 
-+.. note::
-+    However, the ``libtiff`` external functions :c:func:`_TIFFmalloc`
-+    and :c:func:`_TIFFrealloc` **do not apply** this internal memory
-+    allocation limit set by :c:func:`TIFFOpenOptionsSetMaxSingleMemAlloc`!
-+
- :c:func:`TIFFOpenOptionsSetErrorHandlerExtR` sets the function pointer to
- an application-specific and per-TIFF handle (re-entrant) error handler.
- Furthermore, a pointer to a **custom defined data structure** *errorhandler_user_data* 
-@@ -55,6 +60,43 @@ The *errorhandler_user_data* argument may be NULL.
- :c:func:`TIFFOpenOptionsSetErrorHandlerExtR` but for the warning handler,
- which is invoked through  :c:func:`TIFFWarningExtR`
- 
-+Example
-+-------
-+
-+::
-+
-+    #include "tiffio.h"
-+
-+    typedef struct MyErrorHandlerUserDataStruct
-+    {
-+        /* ... any user data structure ... */
-+    } MyErrorHandlerUserDataStruct;
-+
-+    static int myErrorHandler(TIFF *tiff, void *user_data, const char *module,
-+                          const char *fmt, va_list ap)
-+    {
-+        MyErrorHandlerUserDataStruct *errorhandler_user_data =
-+            (MyErrorHandlerUserDataStruct *)user_data;
-+        /*... code of myErrorHandler ...*/
-+        return 1;
-+    }
-+
-+
-+    main()
-+    {
-+        tmsize_t limit = (256 * 1024 * 1024);
-+        MyErrorHandlerUserDataStruct user_data = { /* ... any data ... */};
-+
-+        TIFFOpenOptions *opts = TIFFOpenOptionsAlloc();
-+        TIFFOpenOptionsSetMaxSingleMemAlloc(opts, limit);
-+        TIFFOpenOptionsSetErrorHandlerExtR(opts, myErrorHandler, &user_data);
-+        TIFF *tif = TIFFOpenExt("foo.tif", "r", opts);
-+        TIFFOpenOptionsFree(opts);
-+        /* ... go on here ... */
-+
-+        TIFFClose(tif);
-+    }
-+
- Note
- ----
- 
-diff --git a/doc/functions/TIFFStrileQuery.rst b/doc/functions/TIFFStrileQuery.rst
-index f8631af..7931fe4 100644
---- a/doc/functions/TIFFStrileQuery.rst
-+++ b/doc/functions/TIFFStrileQuery.rst
-@@ -66,6 +66,11 @@ Diagnostics
- All error messages are directed to the :c:func:`TIFFErrorExtR` routine.
- Likewise, warning messages are directed to the :c:func:`TIFFWarningExtR` routine.
- 
-+Note
-+----
-+
-+This functionality was introduced with libtiff 4.1.
-+
- See also
- --------
- 
-diff --git a/doc/libtiff.rst b/doc/libtiff.rst
-index 6a0054c..d96a860 100644
---- a/doc/libtiff.rst
-+++ b/doc/libtiff.rst
-@@ -90,11 +90,15 @@ compatibility on machines with a segmented architecture.
- :c:func:`realloc`, and :c:func:`free` routines in the C library.)
- 
- To deal with segmented pointer issues ``libtiff`` also provides
--:c:func:`_TIFFmemcpy`, :c:func:`_TIFFmemset`, and :c:func:`_TIFFmemmove`
-+:c:func:`_TIFFmemcpy`, :c:func:`_TIFFmemset`, and :c:func:`_TIFFmemcmp`
- routines that mimic the equivalent ANSI C routines, but that are
- intended for use with memory allocated through :c:func:`_TIFFmalloc`
- and :c:func:`_TIFFrealloc`.
- 
-+With ``libtiff`` 4.5 a method was introduced to limit the internal
-+memory allocation that functions are allowed to request per call
-+(see  :c:func:`TIFFOpenOptionsSetMaxSingleMemAlloc` and :c:func:`TIFFOpenExt`).
-+
- Error Handling
- --------------
- 
-@@ -106,6 +110,10 @@ routine that can be specified with a call to :c:func:`TIFFSetErrorHandler`.
- Likewise warning messages are directed to a single handler routine
- that can be specified with a call to :c:func:`TIFFSetWarningHandler`
- 
-+Further application-specific and per-TIFF handle (re-entrant) error handler
-+and warning handler can be set. Please refer to :doc:`/functions/TIFFError`
-+and :doc:`/functions/TIFFOpenOptions`.
-+
- Basic File Handling
- -------------------
- 
-@@ -139,7 +147,7 @@ a ``"w"`` argument:
-     main()
-     {
-         TIFF* tif = TIFFOpen("foo.tif", "w");
--        ... do stuff ...
-+        /* ... do stuff ... */
-         TIFFClose(tif);
-     }
- 
-@@ -157,6 +165,25 @@ to always call :c:func:`TIFFClose` or :c:func:`TIFFFlush` to flush any
- buffered information to a file.  Note that if you call :c:func:`TIFFClose`
- you do not need to call :c:func:`TIFFFlush`.
- 
-+.. warning::
-+
-+    In order to prevent out-of-memory issues when opening a TIFF file
-+    :c:func:`TIFFOpenExt` can be used and then the maximum single memory
-+    limit in byte that ``libtiff`` internal memory allocation functions
-+    are allowed to request per call can be set with
-+    :c:func:`TIFFOpenOptionsSetMaxSingleMemAlloc`.
-+
-+Example
-+
-+::
-+
-+    tmsize_t limit = (256 * 1024 * 1024);
-+    TIFFOpenOptions *opts = TIFFOpenOptionsAlloc();
-+    TIFFOpenOptionsSetMaxSingleMemAlloc(opts, limit);
-+    TIFF *tif = TIFFOpenExt("foo.tif", "w", opts);
-+    TIFFOpenOptionsFree(opts);
-+    /* ... go on here ... */
-+
- TIFF Directories
- ----------------
- 
--- 
-2.40.0
-
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-52355-0002.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-52355-0002.patch
deleted file mode 100644
index 19a1ef727ac..00000000000
--- a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-52355-0002.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 16ab4a205cfc938c32686e8d697d048fabf97ed4 Mon Sep 17 00:00:00 2001
-From: Timothy Lyanguzov <theta682@gmail.com>
-Date: Thu, 1 Feb 2024 11:19:06 +0000
-Subject: [PATCH] Fix typo.
-
-CVE: CVE-2023-52355
-Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/16ab4a205cfc938c32686e8d697d048fabf97ed4]
-
-Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
----
- doc/libtiff.rst | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/doc/libtiff.rst b/doc/libtiff.rst
-index d96a860..4fedc3e 100644
---- a/doc/libtiff.rst
-+++ b/doc/libtiff.rst
-@@ -169,7 +169,7 @@ you do not need to call :c:func:`TIFFFlush`.
-
-     In order to prevent out-of-memory issues when opening a TIFF file
-     :c:func:`TIFFOpenExt` can be used and then the maximum single memory
--    limit in byte that ``libtiff`` internal memory allocation functions
-+    limit in bytes that ``libtiff`` internal memory allocation functions
-     are allowed to request per call can be set with
-     :c:func:`TIFFOpenOptionsSetMaxSingleMemAlloc`.
-
---
-2.40.0
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-52356.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-52356.patch
deleted file mode 100644
index 75f5d8946ad..00000000000
--- a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-52356.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 51558511bdbbcffdce534db21dbaf5d54b31638a Mon Sep 17 00:00:00 2001
-From: Even Rouault <even.rouault@spatialys.com>
-Date: Thu, 1 Feb 2024 11:38:14 +0000
-Subject: [PATCH] TIFFReadRGBAStrip/TIFFReadRGBATile: add more validation of
- col/row (fixes #622)
-
-CVE: CVE-2023-52356
-Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/51558511bdbbcffdce534db21dbaf5d54b31638a]
-
-Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
----
- libtiff/tif_getimage.c | 15 +++++++++++++++
- 1 file changed, 15 insertions(+)
-
-diff --git a/libtiff/tif_getimage.c b/libtiff/tif_getimage.c
-index 41f7dfd..9cd6eee 100644
---- a/libtiff/tif_getimage.c
-+++ b/libtiff/tif_getimage.c
-@@ -3224,6 +3224,13 @@ int TIFFReadRGBAStripExt(TIFF *tif, uint32_t row, uint32_t *raster,
-     if (TIFFRGBAImageOK(tif, emsg) &&
-         TIFFRGBAImageBegin(&img, tif, stop_on_error, emsg))
-     {
-+	if (row >= img.height)
-+        {
-+            TIFFErrorExtR(tif, TIFFFileName(tif),
-+                          "Invalid row passed to TIFFReadRGBAStrip().");
-+            TIFFRGBAImageEnd(&img);
-+            return (0);
-+	}
-
-         img.row_offset = row;
-         img.col_offset = 0;
-@@ -3301,6 +3308,14 @@ int TIFFReadRGBATileExt(TIFF *tif, uint32_t col, uint32_t row, uint32_t *raster,
-         return (0);
-     }
-
-+    if (col >= img.width || row >= img.height)
-+    {
-+        TIFFErrorExtR(tif, TIFFFileName(tif),
-+                      "Invalid row/col passed to TIFFReadRGBATile().");
-+        TIFFRGBAImageEnd(&img);
-+        return (0);
-+    }
-+
-     /*
-      * The TIFFRGBAImageGet() function doesn't allow us to get off the
-      * edge of the image, even to fill an otherwise valid tile.  So we
---
-2.40.0
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-6228.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-6228.patch
deleted file mode 100644
index 2020508fdf5..00000000000
--- a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-6228.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 1e7d217a323eac701b134afc4ae39b6bdfdbc96a Mon Sep 17 00:00:00 2001
-From: Su_Laus <sulau@freenet.de>
-Date: Wed, 17 Jan 2024 06:57:08 +0000
-Subject: [PATCH] codec of input image is available, independently from codec
- check of output image and return with error if not.
-
-Fixes #606.
-
-CVE: CVE-2023-6228
-Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/1e7d217a323eac701b134afc4ae39b6bdfdbc96a]
-
-Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
----
- tools/tiffcp.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/tools/tiffcp.c b/tools/tiffcp.c
-index aff0626..a4f7f6b 100644
---- a/tools/tiffcp.c
-+++ b/tools/tiffcp.c
-@@ -846,6 +846,8 @@ static int tiffcp(TIFF *in, TIFF *out)
-     if (!TIFFIsCODECConfigured(compression))
-         return FALSE;
-     TIFFGetFieldDefaulted(in, TIFFTAG_COMPRESSION, &input_compression);
-+    if (!TIFFIsCODECConfigured(input_compression))
-+	    return FALSE;
-     TIFFGetFieldDefaulted(in, TIFFTAG_PHOTOMETRIC, &input_photometric);
-     if (input_compression == COMPRESSION_JPEG)
-     {
---
-2.40.0
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-Apply-1-suggestion-s-to-1-file-s.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-Apply-1-suggestion-s-to-1-file-s.patch
deleted file mode 100644
index 5d15dff1d9b..00000000000
--- a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-Apply-1-suggestion-s-to-1-file-s.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From e1640519208121f916da1772a5efb6ca28971b86 Mon Sep 17 00:00:00 2001
-From: Even Rouault <even.rouault@spatialys.com>
-Date: Tue, 31 Oct 2023 15:04:37 +0000
-Subject: [PATCH 3/3] Apply 1 suggestion(s) to 1 file(s)
-
-CVE: CVE-2023-6277
-Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/merge_requests/545]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libtiff/tif_dirread.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/libtiff/tif_dirread.c b/libtiff/tif_dirread.c
-index fe8d6f8..58a4276 100644
---- a/libtiff/tif_dirread.c
-+++ b/libtiff/tif_dirread.c
-@@ -5306,7 +5306,6 @@ static int EstimateStripByteCounts(TIFF *tif, TIFFDirEntry *dir,
-     {
-         uint64_t space;
-         uint16_t n;
--        filesize = TIFFGetFileSize(tif);
-         if (!(tif->tif_flags & TIFF_BIGTIFF))
-             space = sizeof(TIFFHeaderClassic) + 2 + dircount * 12 + 4;
-         else
--- 
-2.43.0
-
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-At-image-reading-compare-data-size-of-some-tags-data-2.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-At-image-reading-compare-data-size-of-some-tags-data-2.patch
deleted file mode 100644
index 9fc8182fef3..00000000000
--- a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-At-image-reading-compare-data-size-of-some-tags-data-2.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From f500facf7723f1cae725dd288b2daad15e45131c Mon Sep 17 00:00:00 2001
-From: Su_Laus <sulau@freenet.de>
-Date: Mon, 30 Oct 2023 21:21:57 +0100
-Subject: [PATCH 2/3] At image reading, compare data size of some tags / data
- structures (StripByteCounts, StripOffsets, StripArray, TIFF directory) with
- file size to prevent provoked out-of-memory attacks.
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-See issue #614.
-
-Correct declaration of ‘filesize’ shadows a previous local.
-
-CVE: CVE-2023-6277
-Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/merge_requests/545]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libtiff/tif_dirread.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/libtiff/tif_dirread.c b/libtiff/tif_dirread.c
-index c52d41f..fe8d6f8 100644
---- a/libtiff/tif_dirread.c
-+++ b/libtiff/tif_dirread.c
-@@ -5305,7 +5305,6 @@ static int EstimateStripByteCounts(TIFF *tif, TIFFDirEntry *dir,
-     if (td->td_compression != COMPRESSION_NONE)
-     {
-         uint64_t space;
--        uint64_t filesize;
-         uint16_t n;
-         filesize = TIFFGetFileSize(tif);
-         if (!(tif->tif_flags & TIFF_BIGTIFF))
--- 
-2.43.0
-
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-At-image-reading-compare-data-size-of-some-tags-data.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-At-image-reading-compare-data-size-of-some-tags-data.patch
deleted file mode 100644
index d5854a9059b..00000000000
--- a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-6277-At-image-reading-compare-data-size-of-some-tags-data.patch
+++ /dev/null
@@ -1,162 +0,0 @@
-From b33baa5d9c6aac8ce49b5180dd48e39697ab7a11 Mon Sep 17 00:00:00 2001
-From: Su_Laus <sulau@freenet.de>
-Date: Fri, 27 Oct 2023 22:11:10 +0200
-Subject: [PATCH 1/3] At image reading, compare data size of some tags / data
- structures (StripByteCounts, StripOffsets, StripArray, TIFF directory) with
- file size to prevent provoked out-of-memory attacks.
-
-See issue #614.
-
-CVE: CVE-2023-6277
-Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/merge_requests/545]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libtiff/tif_dirread.c | 90 +++++++++++++++++++++++++++++++++++++++++++
- 1 file changed, 90 insertions(+)
-
-diff --git a/libtiff/tif_dirread.c b/libtiff/tif_dirread.c
-index 2c49dc6..c52d41f 100644
---- a/libtiff/tif_dirread.c
-+++ b/libtiff/tif_dirread.c
-@@ -1308,6 +1308,21 @@ TIFFReadDirEntryArrayWithLimit(TIFF *tif, TIFFDirEntry *direntry,
-     datasize = (*count) * typesize;
-     assert((tmsize_t)datasize > 0);
- 
-+    /* Before allocating a huge amount of memory for corrupted files, check if
-+     * size of requested memory is not greater than file size.
-+     */
-+    uint64_t filesize = TIFFGetFileSize(tif);
-+    if (datasize > filesize)
-+    {
-+        TIFFWarningExtR(tif, "ReadDirEntryArray",
-+                        "Requested memory size for tag %d (0x%x) %" PRIu32
-+                        " is greather than filesize %" PRIu64
-+                        ". Memory not allocated, tag not read",
-+                        direntry->tdir_tag, direntry->tdir_tag, datasize,
-+                        filesize);
-+        return (TIFFReadDirEntryErrAlloc);
-+    }
-+
-     if (isMapped(tif) && datasize > (uint64_t)tif->tif_size)
-         return TIFFReadDirEntryErrIo;
- 
-@@ -5266,6 +5281,20 @@ static int EstimateStripByteCounts(TIFF *tif, TIFFDirEntry *dir,
-     if (!_TIFFFillStrilesInternal(tif, 0))
-         return -1;
- 
-+    /* Before allocating a huge amount of memory for corrupted files, check if
-+     * size of requested memory is not greater than file size. */
-+    uint64_t filesize = TIFFGetFileSize(tif);
-+    uint64_t allocsize = (uint64_t)td->td_nstrips * sizeof(uint64_t);
-+    if (allocsize > filesize)
-+    {
-+        TIFFWarningExtR(tif, module,
-+                        "Requested memory size for StripByteCounts of %" PRIu64
-+                        " is greather than filesize %" PRIu64
-+                        ". Memory not allocated",
-+                        allocsize, filesize);
-+        return -1;
-+    }
-+
-     if (td->td_stripbytecount_p)
-         _TIFFfreeExt(tif, td->td_stripbytecount_p);
-     td->td_stripbytecount_p = (uint64_t *)_TIFFCheckMalloc(
-@@ -5807,6 +5836,20 @@ static uint16_t TIFFFetchDirectory(TIFF *tif, uint64_t diroff,
-             dircount16 = (uint16_t)dircount64;
-             dirsize = 20;
-         }
-+        /* Before allocating a huge amount of memory for corrupted files, check
-+         * if size of requested memory is not greater than file size. */
-+        uint64_t filesize = TIFFGetFileSize(tif);
-+        uint64_t allocsize = (uint64_t)dircount16 * dirsize;
-+        if (allocsize > filesize)
-+        {
-+            TIFFWarningExtR(
-+                tif, module,
-+                "Requested memory size for TIFF directory of %" PRIu64
-+                " is greather than filesize %" PRIu64
-+                ". Memory not allocated, TIFF directory not read",
-+                allocsize, filesize);
-+            return 0;
-+        }
-         origdir = _TIFFCheckMalloc(tif, dircount16, dirsize,
-                                    "to read TIFF directory");
-         if (origdir == NULL)
-@@ -5921,6 +5964,20 @@ static uint16_t TIFFFetchDirectory(TIFF *tif, uint64_t diroff,
-                           "directories not supported");
-             return 0;
-         }
-+        /* Before allocating a huge amount of memory for corrupted files, check
-+         * if size of requested memory is not greater than file size. */
-+        uint64_t filesize = TIFFGetFileSize(tif);
-+        uint64_t allocsize = (uint64_t)dircount16 * dirsize;
-+        if (allocsize > filesize)
-+        {
-+            TIFFWarningExtR(
-+                tif, module,
-+                "Requested memory size for TIFF directory of %" PRIu64
-+                " is greather than filesize %" PRIu64
-+                ". Memory not allocated, TIFF directory not read",
-+                allocsize, filesize);
-+            return 0;
-+        }
-         origdir = _TIFFCheckMalloc(tif, dircount16, dirsize,
-                                    "to read TIFF directory");
-         if (origdir == NULL)
-@@ -5968,6 +6025,8 @@ static uint16_t TIFFFetchDirectory(TIFF *tif, uint64_t diroff,
-             }
-         }
-     }
-+    /* No check against filesize needed here because "dir" should have same size
-+     * than "origdir" checked above. */
-     dir = (TIFFDirEntry *)_TIFFCheckMalloc(
-         tif, dircount16, sizeof(TIFFDirEntry), "to read TIFF directory");
-     if (dir == 0)
-@@ -7164,6 +7223,20 @@ static int TIFFFetchStripThing(TIFF *tif, TIFFDirEntry *dir, uint32_t nstrips,
-             return (0);
-         }
- 
-+        /* Before allocating a huge amount of memory for corrupted files, check
-+         * if size of requested memory is not greater than file size. */
-+        uint64_t filesize = TIFFGetFileSize(tif);
-+        uint64_t allocsize = (uint64_t)nstrips * sizeof(uint64_t);
-+        if (allocsize > filesize)
-+        {
-+            TIFFWarningExtR(tif, module,
-+                            "Requested memory size for StripArray of %" PRIu64
-+                            " is greather than filesize %" PRIu64
-+                            ". Memory not allocated",
-+                            allocsize, filesize);
-+            _TIFFfreeExt(tif, data);
-+            return (0);
-+        }
-         resizeddata = (uint64_t *)_TIFFCheckMalloc(
-             tif, nstrips, sizeof(uint64_t), "for strip array");
-         if (resizeddata == 0)
-@@ -7263,6 +7336,23 @@ static void allocChoppedUpStripArrays(TIFF *tif, uint32_t nstrips,
-     }
-     bytecount = last_offset + last_bytecount - offset;
- 
-+    /* Before allocating a huge amount of memory for corrupted files, check if
-+     * size of StripByteCount and StripOffset tags is not greater than
-+     * file size.
-+     */
-+    uint64_t allocsize = (uint64_t)nstrips * sizeof(uint64_t) * 2;
-+    uint64_t filesize = TIFFGetFileSize(tif);
-+    if (allocsize > filesize)
-+    {
-+        TIFFWarningExtR(tif, "allocChoppedUpStripArrays",
-+                        "Requested memory size for StripByteCount and "
-+                        "StripOffsets %" PRIu64
-+                        " is greather than filesize %" PRIu64
-+                        ". Memory not allocated",
-+                        allocsize, filesize);
-+        return;
-+    }
-+
-     newcounts =
-         (uint64_t *)_TIFFCheckMalloc(tif, nstrips, sizeof(uint64_t),
-                                      "for chopped \"StripByteCounts\" array");
--- 
-2.43.0
-
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2024-7006.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2024-7006.patch
deleted file mode 100644
index 785244bdea3..00000000000
--- a/meta/recipes-multimedia/libtiff/tiff/CVE-2024-7006.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From 8ee0e7d2bdcc1a5a5a3241904b243964ab947b7b Mon Sep 17 00:00:00 2001
-From: Su_Laus <sulau@freenet.de>
-Date: Fri, 1 Dec 2023 20:12:25 +0100
-Subject: [PATCH] Check return value of _TIFFCreateAnonField().
-
-Fixes #624
-
-Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/818fb8ce881cf839fbc710f6690aadb992aa0f9e]
-CVE: CVE-2024-7006
-Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
----
- libtiff/tif_dirinfo.c |  2 +-
- libtiff/tif_dirread.c | 16 ++++++----------
- 2 files changed, 7 insertions(+), 11 deletions(-)
-
-diff --git a/libtiff/tif_dirinfo.c b/libtiff/tif_dirinfo.c
-index 0e705e8..4cfdaad 100644
---- a/libtiff/tif_dirinfo.c
-+++ b/libtiff/tif_dirinfo.c
-@@ -887,7 +887,7 @@ const TIFFField *_TIFFFindOrRegisterField(TIFF *tif, uint32_t tag,
-     if (fld == NULL)
-     {
-         fld = _TIFFCreateAnonField(tif, tag, dt);
--        if (!_TIFFMergeFields(tif, fld, 1))
-+        if (fld == NULL || !_TIFFMergeFields(tif, fld, 1))
-             return NULL;
-     }
- 
-diff --git a/libtiff/tif_dirread.c b/libtiff/tif_dirread.c
-index 58a4276..738df9f 100644
---- a/libtiff/tif_dirread.c
-+++ b/libtiff/tif_dirread.c
-@@ -4275,11 +4275,9 @@ int TIFFReadDirectory(TIFF *tif)
-                                 dp->tdir_tag, dp->tdir_tag);
-                 /* the following knowingly leaks the
-                    anonymous field structure */
--                if (!_TIFFMergeFields(
--                        tif,
--                        _TIFFCreateAnonField(tif, dp->tdir_tag,
--                                             (TIFFDataType)dp->tdir_type),
--                        1))
-+                const TIFFField *fld = _TIFFCreateAnonField(
-+                    tif, dp->tdir_tag, (TIFFDataType)dp->tdir_type);
-+                if (fld == NULL || !_TIFFMergeFields(tif, fld, 1))
-                 {
-                     TIFFWarningExtR(
-                         tif, module,
-@@ -5153,11 +5151,9 @@ int TIFFReadCustomDirectory(TIFF *tif, toff_t diroff,
-                             "Unknown field with tag %" PRIu16 " (0x%" PRIx16
-                             ") encountered",
-                             dp->tdir_tag, dp->tdir_tag);
--            if (!_TIFFMergeFields(
--                    tif,
--                    _TIFFCreateAnonField(tif, dp->tdir_tag,
--                                         (TIFFDataType)dp->tdir_type),
--                    1))
-+            const TIFFField *fld = _TIFFCreateAnonField(
-+                tif, dp->tdir_tag, (TIFFDataType)dp->tdir_type);
-+            if (fld == NULL || !_TIFFMergeFields(tif, fld, 1))
-             {
-                 TIFFWarningExtR(tif, module,
-                                 "Registering anonymous field with tag %" PRIu16
--- 
-2.44.1
-
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb
similarity index 79%
rename from meta/recipes-multimedia/libtiff/tiff_4.6.0.bb
rename to meta/recipes-multimedia/libtiff/tiff_4.7.0.bb
index 6bf7010ba28..474fe1e8fd9 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.7.0.bb
@@ -8,18 +8,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=a3e32d664d6db1386b4689c8121531c3"
 
 CVE_PRODUCT = "libtiff"
 
-SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
-           file://CVE-2023-6277-At-image-reading-compare-data-size-of-some-tags-data.patch \
-           file://CVE-2023-6277-At-image-reading-compare-data-size-of-some-tags-data-2.patch \
-           file://CVE-2023-6277-Apply-1-suggestion-s-to-1-file-s.patch \
-           file://CVE-2023-6228.patch \
-           file://CVE-2023-52355-0001.patch \
-           file://CVE-2023-52355-0002.patch \
-           file://CVE-2023-52356.patch \
-           file://CVE-2024-7006.patch \
-           "
-
-SRC_URI[sha256sum] = "88b3979e6d5c7e32b50d7ec72fb15af724f6ab2cbf7e10880c360a77e4b5d99a"
+SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz"
+
+SRC_URI[sha256sum] = "67160e3457365ab96c5b3286a0903aa6e78bdc44c4bc737d2e486bcecb6ba976"
 
 # exclude betas
 UPSTREAM_CHECK_REGEX = "tiff-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.39.5


