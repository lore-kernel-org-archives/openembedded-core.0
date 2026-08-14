Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7237C5DF67
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 10:47:25 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10257.1786704442957932023
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Aug 2026 03:47:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=c1mORRRl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47fe89fb333so496464f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 03:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1786704441; x=1787309241; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=p70iHIRYaP3g9TkK4lN3suX9s7RaTvn4qRkLM4pwL3A=;
        b=c1mORRRlwgCc8DsLE2fvwS95qSOAEP7rjqHZnx91LMkb6DZxP0wB7BZwifDNf9Gjlt
         cbxEFcv5tiocEIFQORW0yGqkcMaS3TUQ0QLhRSwpt87XOJX9YoADC0cA0MyQZO4IG3Ks
         0CC8+tGmb/iS9LeLwRcTvuLIJyUE/vRCW6fjs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786704441; x=1787309241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=p70iHIRYaP3g9TkK4lN3suX9s7RaTvn4qRkLM4pwL3A=;
        b=BdYuvC19OAlCCjQIMLtM1Qder9Hy6mkTkCGSyX7RyOVGJLSroGQs2Tvcy5tkn67lf+
         alqB7WGNOAG0kXEwN2iz/sFvP5GCjmxTyIzboUywHBpgtKpC3pbtUjcN+8y9UrrHttya
         sGExSy6b+REkUhnyuOYWRW7Z7lDWErXcqDxicuV0IyaHHScoqArW1V3wTiINT5yTIVxT
         JpAzLGI7VLCUW1eV2lXYwxeWLNwiFn6tqEjY9RQ0IRSEoBdENk26jyCnWZ+MsIDHCMsk
         X4N4VlkQuw2gK/Vmk8mLIOPHCXNjtPujNknfvHi2061hn8TiuOBBeeKT1JIHIvufkBuM
         gInw==
X-Gm-Message-State: AOJu0YxaOL05AuQWEaNkA//fQMlWt09gvpXFUacDcSgG9WkV/JzMOPCP
	6+2toQf+tcQ+SuuKlSa1AvC72m9s5aLPUwTklAvn7QIabTAk5rPDccGjdpKN+5VjS1hdml6f/6w
	4PStIRsk=
X-Gm-Gg: AR+sD12oDejGoRnc0pU59dxnTXJpI4uw4ypQaepxEH2t2tbALTfBf20j3UWVG5gNAoT
	0viAkjChr93t4iwi1fK/axa/KSzboFi1a1oWczK/jB7rrvn4ZtZJ4hU5jvqpLLoa2LGMBKUR5VA
	qA8/Z2qXeJb5jyZG+WZwW2eXtC8x1nFXZltClUUv89p3Y+5wQ0GM7izPCWcussFMbjqBAOhwApN
	9OgoVD4Kmv8sC72YQZjXYG9zoNA1OFnN3/6PEXgS4vcLt6qRvOlTz9wLoPNbVkxPBoNCC5MwQpJ
	HDN3yFWJ/36ayo5Xvbo5oEHoDK2WcCQSxnBuIwpmu5gygqSHyvhaQl3Q2/jsKKDhplVYS7UAjW+
	VRZxB1IYosjeafvwOqidREUDKz5Tzv4EgDKgAYChhCGUQtGADsLKQdxdjT+zbxeX0GFwAe5FE/4
	R0dTajScD1f7NIUuEXFZmV/DAWv4cZ+qX+Kqp/pRSGgz3RcBvon5LEsTL6L8Ym7zd3H2TWCPMXv
	QwSzAYHeiSZG1tb3w==
X-Received: by 2002:a05:600c:4f12:b0:499:491e:4b0d with SMTP id 5b1f17b1804b1-499879c627bmr69243975e9.19.1786704441226;
        Fri, 14 Aug 2026 03:47:21 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9095:412f:3012:ddca])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499877a6e0asm26046965e9.2.2026.08.14.03.47.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 03:47:20 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] harfbuzz: upgrade 14.3.0 -> 14.3.1
Date: Fri, 14 Aug 2026 11:47:12 +0100
Message-ID: <20260814104712.2536471-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260814104712.2536471-1-richard.purdie@linuxfoundation.org>
References: <20260814104712.2536471-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 10:47:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243437

Overview of changes leading to 14.3.1
Thursday, August 13, 2026
=====================================
- Various fuzzing and build fixes.
- Various subsetting fixes.
- Fix AAT insertion at the end of the text.
- Fix various rendering bugs in the experimental GPU library.
- WASM shaper code can now read the user features.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../harfbuzz/{harfbuzz_14.3.0.bb => harfbuzz_14.3.1.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_14.3.0.bb => harfbuzz_14.3.1.bb} (96%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_14.3.0.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_14.3.1.bb
similarity index 96%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_14.3.0.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_14.3.1.bb
index 6e4e9b7b850..4f0d5d3ec21 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_14.3.0.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_14.3.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "16070d77cfc4ba1f1e7327e83bf9b3f55898081cabdb94e56a33e04fc8874eae"
+SRC_URI[sha256sum] = "9dae9538aae2ffdf70cec31f2c27bf68e2aaeeae3112688467697d5faf6194f7"
 
 inherit meson pkgconfig lib_package gtk-doc gobject-introspection github-releases
 

