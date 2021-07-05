Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web09.541.1625524541747729374
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jul 2021 15:35:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=M2kzONUn;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.42, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f42.google.com with SMTP id t24-20020a9d7f980000b029046f4a1a5ec4so19753023otp.1
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Jul 2021 15:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=vTIBK3lCh7EIBTfsEuLSvtEO/JDNfKzVh8TSKqLZExI=;
        b=M2kzONUnNxzcqDa9NU/2n5o/zMZCj5Qh6htHXn/ITWL7ol60Twi5UxlmMcOroLSfD1
         SfyXGc34l3MgMTu2l7JOu3PIw2stHzV5iDpKxKWjlDOBXnq1sT8lhWt7OOtmaTShmIMj
         rnKBGmgZTTdv4Jx1+Hkl2AR76E2o1n2tTFC8HyPgBp4jGaGolzBeU6I8/Ds5eh4GoYRP
         /AvH6+na3Lzrw7+aaE5uVuOncqJnvM4CqM7c2YLQulqxqXi+4m+DHuYDEmQCKZYp41tW
         2L936iTsDXu70FEiZwSMKwZ6zcNrtRg7rjOIJPyMdByFnNhx55YyzYr9a4kwaHHbATj1
         0B3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vTIBK3lCh7EIBTfsEuLSvtEO/JDNfKzVh8TSKqLZExI=;
        b=YAoNan9FpypWYAPVA17dxLpR/L2bIfOX7G1ledIwMY2g5WlSFf+VpY7a9lYi5NTom8
         CKKLVjInoB6cwY+8t4uCjBq6O6OsXZSvcp0ESVR+ZdhJNQZa9pvOfhhMx+eMecGbYsSd
         Nf+qgexl07udLNBGDp2ifCKQ8Vni0oDHkIY9lgSiLkVst0F9dBafy8QKHXqt9kBtK3ox
         16SYoHupInSMc8mC+evuu15a89+DcHKrXCHi5DpISi7IA87FBi9eaGFVr4PabVujRlOD
         8QpPvwQQUJIweVDlIRm11a+MD/OoCpvr1atctkSHLUuhgRLO2rFWzLUGPEDn9NzK3cYY
         l2Fw==
X-Gm-Message-State: AOAM531PA5SJkj0w/ohb+9fvjJ6I2j51Xjiki6swDp2gqbZzc0KJG13+
	hp08hDKnj9b+6Kf120eL/W6tlPNsV9xIo7ec
X-Google-Smtp-Source: ABdhPJwKnipo+EXV8UYleuh7GoxltIFlMKkuEzsOsZVPi2sKJHHieO343y9B+2h/M/f7JXC//W1Iww==
X-Received: by 2002:a9d:39e3:: with SMTP id y90mr12809352otb.257.1625524540663;
        Mon, 05 Jul 2021 15:35:40 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id i16sm2870178otp.7.2021.07.05.15.35.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jul 2021 15:35:40 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/19] rpm: fix CVE-2021-3421
Date: Mon,  5 Jul 2021 12:34:40 -1000
Message-Id: <eb1183cac91a9948ac47acc56454b8841764ba72.1625511812.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1625511812.git.steve@sakoman.com>
References: <cover.1625511812.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Minjae Kim <flowergom@gmail.com>

unsigned signature header leads to string injection into an rpm database

reference:
https://nvd.nist.gov/vuln/detail/CVE-2021-3421
https://github.com/rpm-software-management/rpm/commit/d6a86b5e69e46cc283b1e06c92343319beb42e21
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../rpm/files/CVE-2021-3421.patch             | 197 ++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_4.14.2.1.bb     |   1 +
 2 files changed, 198 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/files/CVE-2021-3421.patch

diff --git a/meta/recipes-devtools/rpm/files/CVE-2021-3421.patch b/meta/recipes-devtools/rpm/files/CVE-2021-3421.patch
new file mode 100644
index 0000000000..b1a05b6863
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/CVE-2021-3421.patch
@@ -0,0 +1,197 @@
+From 1e5b70cab83c95aa138107a38ecda75ff70e8985 Mon Sep 17 00:00:00 2001
+From: Minjae Kim <flowergom@gmail.com>
+Date: Thu, 24 Jun 2021 01:11:26 +0000
+Subject: [PATCH] Be much more careful about copying data from the signature
+ header
+
+Only look for known tags, and ensure correct type and size where known
+before copying over. Bump the old arbitrary 16k count limit to 16M limit
+though, it's not inconceivable that a package could have that many files.
+While at it, ensure none of these tags exist in the main header,
+which would confuse us greatly.
+
+This is optimized for backporting ease, upstream can remove redundancies
+and further improve checking later.
+
+Reported and initial patches by Demi Marie Obenour.
+
+Fixes: RhBug:1935049, RhBug:1933867, RhBug:1935035, RhBug:1934125, ...
+
+Fixes: CVE-2021-3421, CVE-2021-20271
+
+Upstream-Status: Backport [https://github.com/rpm-software-management/rpm/commit/d6a86b5e69e46cc283b1e06c92343319beb42e21]
+CVE: CVE-2021-3421
+Signed-off-by: Minjae Kim <flowergom@gmail.com>
+---
+ lib/package.c | 115 ++++++++++++++++++++++++--------------------------
+ lib/rpmtag.h  |   4 ++
+ 2 files changed, 58 insertions(+), 61 deletions(-)
+
+diff --git a/lib/package.c b/lib/package.c
+index 081123d84e..7c26ea323f 100644
+--- a/lib/package.c
++++ b/lib/package.c
+@@ -20,76 +20,68 @@
+ 
+ #include "debug.h"
+ 
++struct taglate_s {
++    rpmTagVal stag;
++    rpmTagVal xtag;
++    rpm_count_t count;
++} const xlateTags[] = {
++    { RPMSIGTAG_SIZE, RPMTAG_SIGSIZE, 1 },
++    { RPMSIGTAG_PGP, RPMTAG_SIGPGP, 0 },
++    { RPMSIGTAG_MD5, RPMTAG_SIGMD5, 16 },
++    { RPMSIGTAG_GPG, RPMTAG_SIGGPG, 0 },
++    /* { RPMSIGTAG_PGP5, RPMTAG_SIGPGP5, 0 }, */ /* long obsolete, dont use */
++    { RPMSIGTAG_PAYLOADSIZE, RPMTAG_ARCHIVESIZE, 1 },
++    { RPMSIGTAG_FILESIGNATURES, RPMTAG_FILESIGNATURES, 0 },
++    { RPMSIGTAG_FILESIGNATURELENGTH, RPMTAG_FILESIGNATURELENGTH, 1 },
++    { RPMSIGTAG_SHA1, RPMTAG_SHA1HEADER, 1 },
++    { RPMSIGTAG_SHA256, RPMTAG_SHA256HEADER, 1 },
++    { RPMSIGTAG_DSA, RPMTAG_DSAHEADER, 0 },
++    { RPMSIGTAG_RSA, RPMTAG_RSAHEADER, 0 },
++    { RPMSIGTAG_LONGSIZE, RPMTAG_LONGSIGSIZE, 1 },
++    { RPMSIGTAG_LONGARCHIVESIZE, RPMTAG_LONGARCHIVESIZE, 1 },
++    { 0 }
++};
++
+ /** \ingroup header
+  * Translate and merge legacy signature tags into header.
+  * @param h		header (dest)
+  * @param sigh		signature header (src)
+  */
+ static
+-void headerMergeLegacySigs(Header h, Header sigh)
++rpmTagVal headerMergeLegacySigs(Header h, Header sigh, char **msg)
+ {
+-    HeaderIterator hi;
++    const struct taglate_s *xl;
+     struct rpmtd_s td;
+ 
+-    hi = headerInitIterator(sigh);
+-    for (; headerNext(hi, &td); rpmtdFreeData(&td))
+-    {
+-	switch (td.tag) {
+-	/* XXX Translate legacy signature tag values. */
+-	case RPMSIGTAG_SIZE:
+-	    td.tag = RPMTAG_SIGSIZE;
+-	    break;
+-	case RPMSIGTAG_PGP:
+-	    td.tag = RPMTAG_SIGPGP;
+-	    break;
+-	case RPMSIGTAG_MD5:
+-	    td.tag = RPMTAG_SIGMD5;
+-	    break;
+-	case RPMSIGTAG_GPG:
+-	    td.tag = RPMTAG_SIGGPG;
+-	    break;
+-	case RPMSIGTAG_PGP5:
+-	    td.tag = RPMTAG_SIGPGP5;
+-	    break;
+-	case RPMSIGTAG_PAYLOADSIZE:
+-	    td.tag = RPMTAG_ARCHIVESIZE;
+-	    break;
+-	case RPMSIGTAG_SHA1:
+-	case RPMSIGTAG_SHA256:
+-	case RPMSIGTAG_DSA:
+-	case RPMSIGTAG_RSA:
+-	default:
+-	    if (!(td.tag >= HEADER_SIGBASE && td.tag < HEADER_TAGBASE))
+-		continue;
+-	    break;
+-	}
+-	if (!headerIsEntry(h, td.tag)) {
+-	    switch (td.type) {
+-	    case RPM_NULL_TYPE:
+-		continue;
+-		break;
+-	    case RPM_CHAR_TYPE:
+-	    case RPM_INT8_TYPE:
+-	    case RPM_INT16_TYPE:
+-	    case RPM_INT32_TYPE:
+-	    case RPM_INT64_TYPE:
+-		if (td.count != 1)
+-		    continue;
+-		break;
+-	    case RPM_STRING_TYPE:
+-	    case RPM_BIN_TYPE:
+-		if (td.count >= 16*1024)
+-		    continue;
+-		break;
+-	    case RPM_STRING_ARRAY_TYPE:
+-	    case RPM_I18NSTRING_TYPE:
+-		continue;
+-		break;
+-	    }
+-	    (void) headerPut(h, &td, HEADERPUT_DEFAULT);
+-	}
++    rpmtdReset(&td);
++    for (xl = xlateTags; xl->stag; xl++) {
++        /* There mustn't be one in the main header */
++        if (headerIsEntry(h, xl->xtag))
++            break;
++        if (headerGet(sigh, xl->stag, &td, HEADERGET_RAW|HEADERGET_MINMEM)) {
++            /* Translate legacy tags */
++            if (xl->stag != xl->xtag)
++                td.tag = xl->xtag;
++            /* Ensure type and tag size match expectations */
++            if (td.type != rpmTagGetTagType(td.tag))
++                break;
++            if (td.count < 1 || td.count > 16*1024*1024)
++                break;
++            if (xl->count && td.count != xl->count)
++                break;
++            if (!headerPut(h, &td, HEADERPUT_DEFAULT))
++                break;
++            rpmtdFreeData(&td);
++        }
++    }
++    rpmtdFreeData(&td);
++
++    if (xl->stag) {
++        rasprintf(msg, "invalid signature tag %s (%d)",
++                        rpmTagGetName(xl->xtag), xl->xtag);
+     }
+-    headerFreeIterator(hi);
++
++    return xl->stag;
+ }
+ 
+ /**
+@@ -337,7 +329,8 @@ rpmRC rpmReadPackageFile(rpmts ts, FD_t fd, const char * fn, Header * hdrp)
+ 		goto exit;
+ 
+ 	    /* Append (and remap) signature tags to the metadata. */
+-	    headerMergeLegacySigs(h, sigh);
++	    if (headerMergeLegacySigs(h, sigh,&msg))
++		    goto exit;
+ 	    applyRetrofits(h);
+ 
+ 	    /* Bump reference count for return. */
+diff --git a/lib/rpmtag.h b/lib/rpmtag.h
+index 8c718b31b5..d562572c6f 100644
+--- a/lib/rpmtag.h
++++ b/lib/rpmtag.h
+@@ -65,6 +65,8 @@ typedef enum rpmTag_e {
+     RPMTAG_LONGARCHIVESIZE	= RPMTAG_SIG_BASE+15,	/* l */
+     /* RPMTAG_SIG_BASE+16 reserved */
+     RPMTAG_SHA256HEADER		= RPMTAG_SIG_BASE+17,	/* s */
++    /* RPMTAG_SIG_BASE+18 reserved for RPMSIGTAG_FILESIGNATURES */
++    /* RPMTAG_SIG_BASE+19 reserved for RPMSIGTAG_FILESIGNATURELENGTH */
+ 
+     RPMTAG_NAME  		= 1000,	/* s */
+ #define	RPMTAG_N	RPMTAG_NAME	/* s */
+@@ -422,6 +424,8 @@ typedef enum rpmSigTag_e {
+     RPMSIGTAG_LONGSIZE	= RPMTAG_LONGSIGSIZE,	/*!< internal Header+Payload size (64bit) in bytes. */
+     RPMSIGTAG_LONGARCHIVESIZE = RPMTAG_LONGARCHIVESIZE, /*!< internal uncompressed payload size (64bit) in bytes. */
+     RPMSIGTAG_SHA256	= RPMTAG_SHA256HEADER,
++    RPMSIGTAG_FILESIGNATURES            = RPMTAG_SIG_BASE + 18,
++    RPMSIGTAG_FILESIGNATURELENGTH       = RPMTAG_SIG_BASE + 19,
+ } rpmSigTag;
+ 
+ 
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb b/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
index 4029217d08..018b2f8700 100644
--- a/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
@@ -44,6 +44,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.14.x \
            file://0001-mono-find-provides-requires-do-not-use-monodis-from-.patch \
            file://0001-Rip-out-partial-support-for-unused-MD2-and-RIPEMD160.patch \
            file://0001-rpmplugins.c-call-dlerror-prior-to-dlsym.patch \
+           file://CVE-2021-3421.patch \
            "
 
 PE = "1"
-- 
2.25.1

