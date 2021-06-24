Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web09.7537.1624541355816621181
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jun 2021 06:29:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ums6Myn7;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: flowergom@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id x16so5137100pfa.13
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Jun 2021 06:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=emP3CNy5EcIsh+7bwUhAqyQLwUdYJsPntamhoyx5ZOo=;
        b=Ums6Myn7QnirQ+NUYGFxAsGZ0svU+g1TnUwM3VYPbhlqVr2n6TNFbr/a765qXPs9QA
         8P9fMqY65lda5POHIcBLOrHW/nVzrtai94O1xsvHEBBiuhHME7DGA+s9q6cUXAGialdp
         kyLm7OfPiyTfsys94KpA9fKqTYC26jmf9ChI9xTBaXVEdsiP2rI6Qbz5AOuqEIKEgk47
         Tj0x8p2h/j9izytFUTgwVRk1O+F4UUDp6B7iDgBA/pIiIJx8KLhbAK62TCu1sMDfS+Xp
         p2yzEGtfQZnFXyMl71Cd5xFVrmwMjlnvlVYFfYpAuzJiErGlSKmrwMEbrPHvMh5XhsnH
         MWwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=emP3CNy5EcIsh+7bwUhAqyQLwUdYJsPntamhoyx5ZOo=;
        b=UMXGWZ9jaAAB2mR1pKZ9fTPbUuJFIZyE/jrNVYrsrNX4yxoEwNbtcygK66SywuMBAc
         yo5IxF/SAMsn+cTBlBwfzUKV6tYhkwHYX93aefNIdIDgoKo5RB6u13+zTHFy59fcBHBN
         GoQLvPVMLlNtLbJAi+SVwmKJZlS2Qn1wJsN/Q+RINlLrSH7jEFkkgy5Wtv0kk9Rq4s5w
         sa1AIXXQ821JAgsJY6pO3XSTwZwjgxum14ZQ9Mz1qqkQZckVb5y+a3XqWIEVFsFZoQQd
         dlM4ykoxdQ95OL2eStki4hvVWTyYHYjrW91Wmt53zxLL6K8VRjepncl01nKvPE39Bwrk
         cvpg==
X-Gm-Message-State: AOAM532iR3AWfT9mUNnEcnu4hBjXGmpF8HUwJrVOcMV8pon+Gezu8xcD
	oxBG77d/uCxSKsZNsvAsfxpGz8pBBVbAaes+
X-Google-Smtp-Source: ABdhPJydh9Ou7/M+2YtN+wb0kzV0Ra4N1zy/PXX9BYMakGz2wmfBMZ+/pyYl3EWBdbtZQvwVqVkJmA==
X-Received: by 2002:a63:e507:: with SMTP id r7mr4747708pgh.435.1624541354833;
        Thu, 24 Jun 2021 06:29:14 -0700 (PDT)
Return-Path: <flowergom@gmail.com>
Received: from localhost.localdomain ([59.6.144.168])
        by smtp.gmail.com with ESMTPSA id k13sm3171347pfu.57.2021.06.24.06.29.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 Jun 2021 06:29:14 -0700 (PDT)
From: "Minjae Kim" <flowergom@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Minjae Kim <flowergom@gmail.com>
Subject: [dunfell][PATCH] rpm: fix CVE-2021-3421
Date: Thu, 24 Jun 2021 22:29:04 +0900
Message-Id: <20210624132904.873-1-flowergom@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

unsigned signature header leads to string injection into an rpm database

reference:
https://nvd.nist.gov/vuln/detail/CVE-2021-3421
https://github.com/rpm-software-management/rpm/commit/d6a86b5e69e46cc283b1e06c92343319beb42e21
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
2.24.3 (Apple Git-128)

