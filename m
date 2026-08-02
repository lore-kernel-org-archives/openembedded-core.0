Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75936C55162
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 10:29:17 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21187.1785666556760681093
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2026 03:29:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Z5BCWJh0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4955158f26aso7836665e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 03:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785666555; x=1786271355; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QgZXB1fRUqPmXITCeZfJhaPeovk24c+NBPJrbuQ2Rx4=;
        b=Z5BCWJh0VO//kO3Ee57XKyhdZuDSPqZTIEJyt/ff5/IksHOc8xm4xtZxt0KpjbRtoo
         uefUFYElmEufw2Evnr5Rlo4f5WdgIIS48VIlX6PfGDU4ee9sJpLkKYatUHI0wdud9CQ0
         wq5ZL2qpH1rEVlSwpPPc4dKW5a1IM6I9ms9QE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785666555; x=1786271355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QgZXB1fRUqPmXITCeZfJhaPeovk24c+NBPJrbuQ2Rx4=;
        b=hMDhDBjrwiesecm9Zkwtd0yeEdd+mWfvASHmb6iBgeEkMnikDxWuLJ7xMw4bhhHipL
         l92VUucMnz2AGhF41oTtzON6WOJRg4UgBAXLIrbzhgi+9ncAQjHH7cPbLlbePt9DzR7M
         Yn9eIHDN8oTZIduJmrM5XR9P7W+omLRJ+ZuB9IMWvccaVsMWwAO3ioLh4NKMZ4CKB4G2
         I7Yi7tjO1XQ01dL3mdAATUOVrU1VMWtl/MRsg7qahTBrwFFpkd5B7oSP+z4dprXvR1ti
         xnSKmbZYOoAU26RcTEAmu6sWxbn8hh6Y5zeiE7DtAokORcLUNjQB2UyjGifhgh8QK528
         SgQw==
X-Gm-Message-State: AOJu0YzOkmkdloG6e/zgzbPtDrmqSIa/IO+MEwPe4dMy47RKVnOhSelA
	mn+ZNuPz3ConAHkyjVXtz8nkDX5PrgLK+VPZqoJa+4dR81blXpFLgpOEW9feDf5sODjeFAlgczC
	Ev542WsI=
X-Gm-Gg: AR+sD10zzmCLytb4B3ZipBcunFEYiLcHwll+j55jpW0a/yJev/TeDurQaWzoZZBZlKj
	fSFiPeGmLRgFZ09K7WW63mJ1NJHbWNL1sPAQLu7vSC4o2GMWYz80bmsuLx1hJwvTcNZS2/WDz/l
	A3EbVs6WohPUcfpRdmYnLBPI+EYH4o3CJO2IegG7BNBi/R52nx9ul+4DblFHZUs85WSoIV8Wqba
	Wfq/vXn+3aWX7rW7gb9WhlVSa78oJZ6QaZYDqd9JCGAAAnFHHyw4LZ6upKsJazdkjx4oHaci400
	e/M3sfjE06XzpcY1sqvAx9ffjl6Kodd4iupU2iUDQdAaev+tL/4yVlQ593Xl8sFpyYgPsIqQyE2
	sy5zsR0F+27VRgTZkYAeRTWB3oLUGKfswN0d80ep74K5cxEU2dDnWTfEcX4XjQ8UVDmWx7Uoxgm
	zA9A/a7s4F/pKmZa/27UB2qU6QNgQfimcqAI1z8WjhoNMWSUJZHLuCAo/lFbuC6nc9A9EXlSD+o
	p/3SOdlGqjiRXS7pQ==
X-Received: by 2002:a05:600c:840f:b0:496:c379:b2a1 with SMTP id 5b1f17b1804b1-4980c66d7bbmr103918545e9.2.1785666554921;
        Sun, 02 Aug 2026 03:29:14 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:11e3:e7fc:e526:8a64])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b8d04fsm167140375e9.3.2026.08.02.03.29.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 03:29:14 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 15/25] linux-libc-headers: Drop kernel-arch and set ARCH directly
Date: Sun,  2 Aug 2026 11:28:44 +0100
Message-ID: <20260802102854.3952760-16-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260802102854.3952760-1-richard.purdie@linuxfoundation.org>
References: <20260802102854.3952760-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 10:29:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242540

In the interests of teasing apart the kernel classes, set ARCH directly in
the make commands and drop the then uneeded use of kernel-arch.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
index 1f5c47f4533..c93966e3709 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
@@ -53,7 +53,7 @@ python __anonymous () {
 MAJ_VER = "${@oe.utils.trim_version("${PV}", 2).split('.')[0]}"
 MIN_VER = "${@oe.utils.trim_version("${PV}", 2).split('.')[1]}"
 
-inherit kernel-arch pkgconfig multilib_header
+inherit pkgconfig multilib_header
 
 KORG_ARCHIVE_COMPRESSION ?= "xz"
 
@@ -62,7 +62,7 @@ UPSTREAM_CHECK_URI = "https://www.kernel.org/"
 
 S = "${UNPACKDIR}/linux-${PV}"
 
-EXTRA_OEMAKE = " HOSTCC="${BUILD_CC}" HOSTCPP="${BUILD_CPP}""
+EXTRA_OEMAKE = " ARCH="${@oe.kernel.map_kernel_arch(d)}" HOSTCC="${BUILD_CC}" HOSTCPP="${BUILD_CPP}""
 
 do_configure[noexec] = "1"
 

