Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web08.500.1623703899728591776
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jun 2021 13:51:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FxuPY8vz;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id nd37so11047701ejc.3
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Jun 2021 13:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=NIercNvm0UuT+ZKUAUUWsgViAIX0/NdZ9YBuc65zYTA=;
        b=FxuPY8vznF62atTGo0lX36ldveHxVFoJHe9aG2gLVUZMdKoN+EMAp/mwkTtZ+Rfnmr
         MAC3+g/U6t2A9FgzE3LtVxRUcVjNH5cdYksZgUODFZagtu56QrgoD3JllSnUoxKW/5WA
         K4M/2DWOvPN5L+gCBODZAj0KkFMlDGIHoiHPVZjtM1EOllzSZC74rxRx+wAxlrFPX4TA
         aCfj2cTeKMcaRXmUxEO2xwV7dMORDozWF7ajTzLME1Paa0Oiyo5TDdETIYjqBnCfdMNi
         xJttwwH3HFGYayZGbjTetSSBHVYbP+VppP2sqPVDemwCdHOI7Edu1KWGM5pxrxHJj+S1
         wIBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NIercNvm0UuT+ZKUAUUWsgViAIX0/NdZ9YBuc65zYTA=;
        b=FgIYeu2HAZ26UxRuyH/IJfm8Y2qf8f0v5SrD7CcrtnjoMbbDRHGqGxjcoIKMgcO+/2
         7G9Cs914tuAu+VpFQkxP7DYAwvlKogry5cX1yFkfDig9nqoa84/RG2cTDC8lfhRTYJmZ
         kQsNuf46xWQIrXTyo1KOz+bwBBlKrdH0o1w3afxEm2fc3tfvy6OS16zz7nS27YBhMCjV
         /m8wrE63MwFlu6Wzq+IXfvUNpvknHgEFJ2BZW61OwzCt0SGpmMyl6Vfq/kTadP5NcqtJ
         cCTt2Iqa77XbN4CUNyKRJWBIwr3qEyRbnY3Z2FQCXn1M+RopXF3Bft4hSZ6JN5LbrICX
         7KSg==
X-Gm-Message-State: AOAM533KojvF+ePvaSax4VPiv/XHwuMhY48uJjfVKoPUz3Dj49XF1y97
	kOXbSUMSdf+ial7pf9i/0jXULiDgqoeNVw==
X-Google-Smtp-Source: ABdhPJz1HhxJdp0306+IjSFiS33ZnX6qfskJnEarT7tDjiHk8t/UAZ3yBHHe+A8WplCL7QFtaRF+4g==
X-Received: by 2002:a17:906:b55:: with SMTP id v21mr16961631ejg.88.1623703897953;
        Mon, 14 Jun 2021 13:51:37 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f10ae4125962954aa99f170.dip0.t-ipconnect.de. [2003:f0:7f10:ae41:2596:2954:aa99:f170])
        by smtp.gmail.com with ESMTPSA id s10sm8074357ejf.54.2021.06.14.13.51.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 13:51:37 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] mpg123: 1.27.2 -> 1.28.0
Date: Mon, 14 Jun 2021 22:51:26 +0200
Message-Id: <20210614205126.1680546-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210614205126.1680546-1-schnitzeltony@gmail.com>
References: <20210614205126.1680546-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Changes:
build:
  * Fix up the build to actually build all library objects with libtool
    consistently, also ensuring no pointless static archives for output modules.
  * Adapted things to autoconf 2.71, requiring 2.69 now (the latter tested on
    Debian, with their patches).
  * Improved configure to be more useful --with-default-audio to define the
    search order, fix static build for --with-audio being a list (just choosing
    the first one).
  * Ensure consistent use of LINK_MPG123_DLL in headers.
build (ports/cmake):
  * Thanks to Evgeni Poberezhnikov for working with us on that.
  * Fix up ports/cmake to really work in MSVC also for users of the lib (tested
    in vcpkg, bug 310).
  * Hardcode ports/cmake CPU detection for x64 and ARM as CMAKE_SYSTEM_PROCESSOR
    is useless crap (bug 298 for real).
  * Add missing io.h for _setmode() MSVC warned about (bug 311).
  * Added BUILD_NO_LARGENAME define to be used by MSVC builds. Note that an
    MSVC build of libmpg123 does not support 64 bit file offsets. That would
    need more morting to the explicit API. Thanks to MS for making off_t even
    more messy and less useful.
  * Added JACK output, fixed handling of compat_str there and in win32_wasapi.
libsyn123:
* Fix syn123_mix() to actually do intermediate conversion when input
  and output encoding are the same but non-float. This makes out123 --mix work
  with s16 input and output, which is not that special!
libmpg123:
* Fix misguided handling of part2_3_length checks in III_get_scale_factors_1()
  and III_get_scale_factors_2() which invalidated decoding of a mono source
  encoded as ms+i-stereo (bug 312). This was a regression introduced with
  version 1.25.7.
libout123:
  * Print basic module loading errors only for last one in list. This enables
    use of an output module search list that anticipates module files not
    installed with the main package.
  * Fixes for win32_wasapi build with MSVC.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../mpg123/{mpg123_1.27.2.bb => mpg123_1.28.0.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.27.2.bb => mpg123_1.28.0.bb} (96%)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb b/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb
similarity index 96%
rename from meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb
rename to meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb
index 9a91cc89d6..143a59ba63 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.27.2.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.28.0.bb
@@ -10,7 +10,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e7b9c15fcfb986abb4cc5e8400a24169"
 
 SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "52f6ceb962c05db0c043bb27acf5a721381f5f356ac4610e5221f50293891b04"
+SRC_URI[sha256sum] = "e49466853685026da5d113dc7ff026b1b2ad0b57d78df693a446add9db88a7d5"
 
 UPSTREAM_CHECK_REGEX = "mpg123-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.31.1

