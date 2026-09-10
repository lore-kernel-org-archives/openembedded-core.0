Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1C8EC79F9F
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 10:35:00 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10811.1789036491064748623
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2026 03:34:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IJNHO+4w;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso99756545e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 03:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789036489; x=1789641289; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+QLQwhrfdcExeJ1VnHfuGyBKUeazjlMR2QY0xHfGnUw=;
        b=IJNHO+4wN0GjdUupgHuhA/1/crhN3R93IRv8bqkBWeh4piSFi4eg20zXj6DwPKmMEj
         SyECbNLSSrZPInc/XINetZ+COImoFUq0BrT1643VaPnT1/4/KqGgMs163lF4mm2rpfkY
         cqOTjvPHKGfBQvNAajIsQfuE8queH6soC+/H4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789036489; x=1789641289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+QLQwhrfdcExeJ1VnHfuGyBKUeazjlMR2QY0xHfGnUw=;
        b=dNEvJBSyzWIavLbtmkxzp0KATIKIUzmbDxjLM4p5BoNXTD/HJFBb0KAR8EIuvFkVzT
         fs/RmQfD/U5Orah+MwpReisVvegd5HENHXhrb/KJf6SBEDoCdhVGhicm01tmzl9OfllW
         O1S8X4cpfYx1VlHx5yDZzuQ9zENvZLyvzKC4o1I4I5a+ch8r0MsQ1Pddbkf7V6ynFOj+
         qnWE3utpgcNBhiikAolkP5c6m2r7knzlnvj39HMbCfrYBDpEoHX9vC34kPh9yILLUEKl
         YTxoERBkkdqMCvZ7AzCyvw2WD7kDnCOGd0nGwIEwSP2VxxkyTNmV22GnU8DXlsRcx65/
         gnfA==
X-Gm-Message-State: AFuF++mugirfXPXS/WPYpBXebCEZV7u/mojnbOyVNEZVQPjUOwgLRK24
	IhbC3nM1fS3+htD6Ufdt/wcRtuBP+Q9RFtP5yJI08t4je3W6ifjy6m9eFxrc1qoyMGAM2/pxkW6
	KTNDB7IU=
X-Gm-Gg: AYBFou3nYlRkwUIX7yCAZNvLoV9ZVHvI4D1/pGdFV/KqcZJoWsfI5BON8ETg3m1KrKy
	Qiu+pBh8CFyxSOdwgEjCC9sUAcQGmyBVzMD6yKUTQcK+SPJg3SK0CePUBvL3E28Yv/DG65bGAIu
	4xReDEuD8554JmZ6jLks21a1e1cp6X9Jl/v73CLkq9IX+1xDmY5NtNGYt8+T0R9u4S0myPwCPbN
	pQlU4rQ/FtqNf3iqX5j6jORTsWUIKunnjsyMcTjpXbZO8dUn13vnCkD2BJhZ6E4QnrBh0wfEdbI
	d/rfMNXxcwuWl8mGV2KKwz0KpKlrr07fS3Tp5BbSVN2j3cPsbeBE5URfW621H/xyiX+VAItPu3+
	uyJMwaNeioM571DhhfFLycZ9tQqdRUox5BUk2vHAnuQ5bw/xIc1bQr47Odyxsv0Emeyw5aGRPFi
	kWdzJUU21dXG1gABtePE/yfsunjLcIXwkI8tfpJqf2v5NWENuCxWfNnSAlorqfU3jdt2FDHPmtb
	yNKfeaLps6v8o5+mvB8zm0JrSGw
X-Received: by 2002:a05:600c:3b18:b0:49c:fa21:1c8a with SMTP id 5b1f17b1804b1-49cfa211d97mr346634485e9.31.1789036489023;
        Thu, 10 Sep 2026 03:34:49 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:788a:18da:6c2a:9f16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26bf9490sm57395075e9.9.2026.09.10.03.34.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 03:34:48 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] orc: upgrade 0.4.43 -> 0.4.44
Date: Thu, 10 Sep 2026 11:34:42 +0100
Message-ID: <20260910103444.1413539-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260910103444.1413539-1-richard.purdie@linuxfoundation.org>
References: <20260910103444.1413539-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 10:35:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245546

Highlights

    Fix various i386-related regressions
    avx512: Disable target on x86
    avx512: Implement the missing memoff-reg moves
    Fix Debian gcc miscompiling the backup float conversion functions

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/orc/{orc_0.4.43.bb => orc_0.4.44.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/orc/{orc_0.4.43.bb => orc_0.4.44.bb} (95%)

diff --git a/meta/recipes-devtools/orc/orc_0.4.43.bb b/meta/recipes-devtools/orc/orc_0.4.44.bb
similarity index 95%
rename from meta/recipes-devtools/orc/orc_0.4.43.bb
rename to meta/recipes-devtools/orc/orc_0.4.44.bb
index db7f5023b3b..98e2291532c 100644
--- a/meta/recipes-devtools/orc/orc_0.4.43.bb
+++ b/meta/recipes-devtools/orc/orc_0.4.44.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-2-Clause AND BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1400bd9d09e8af56b9ec982b3d85797e"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/orc/orc-${PV}.tar.xz"
-SRC_URI[sha256sum] = "82394e20e5c4dffe8b45ea8525c62dd4e3e8be7f253ac11c19297ba7ea5473e0"
+SRC_URI[sha256sum] = "4aeb97aea2b58224029dc2b23d7d064cfa990cb4fb8c4da440bcbe9c95bc5d2d"
 
 inherit meson pkgconfig
 

