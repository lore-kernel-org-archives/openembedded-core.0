Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46BF8CA0EFF
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 22:43:25 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.2518.1755816204424327200
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 15:43:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A+Eg/OwB;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-afcb79f659aso250085766b.2
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 15:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755816203; x=1756421003; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e1M3xzNLpp0sRdcJZuK1cL6IVLp4qBmm/yp3bru09ck=;
        b=A+Eg/OwBj+BZhU00VMcbRedwiZl7JpGYu8QWXEls3BVHz2garGiNkD5TJ9J/89nzIW
         gdpzLiwVzF9AC9EymO0Ieqm1XcmcLf3VO5tevrFVQ3YvEUkdy3CWZCB84IpAO+ziuCq0
         n4vey0Kqf2ExmNGyWWshmPAxGAZcp8MvWyCzYzl10wdQjKftoZCY/Oi2MvU5apDevLvv
         wIOCuGsec6YnSfvxXZC1tpXkSDsCKLtcijKMzAhD8jyPuqcaQhMUihDdB5LAloox3H36
         likzQKXGpwW7Efced3+k2KvtG5e1naTjXedaHCoTWOPAL6Wgw9V/tdyra+ufLSsVh9zC
         pSXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755816203; x=1756421003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e1M3xzNLpp0sRdcJZuK1cL6IVLp4qBmm/yp3bru09ck=;
        b=HB2nXWZLrIhSZ1EyBfiGGXic5non1ya7FIUwY03yIX9CtuhxWeHPHCVIsQQmVCjoGo
         8C5EI/zmXJ/lzms2jSHlLfn7yKrMEtz4KzAt6Zj6yBchxPQkNjs71AEKccUr4Eci4N7X
         UfrUSrCAf9JZ/x09eWcjLUn0drjObrciVojvjk/wctGIWf86b2PTcSxY7GnUFZx62Hn7
         4vK13i/ejZ41rfPoK1cLZiqb5pJuFWkWzzT68FEqa/ZylRxsx0P0AHCFkQSfJVLPnXiN
         NfAd53ZlNpePGl0UTF9KDjFxJU92VizxBapO6g6CZPZMAZqIs/XMBQRh9kr4Z8xMUnMp
         ktLg==
X-Gm-Message-State: AOJu0YwJRSxm/JlIapi+FIAbQp0sJ3+XU+WDY3iBOe/Ka9CFaWdZXViJ
	sPU0LJ48NAi5Cn/NbIcejknOFPAviPmG+BPe5ed2lnxXSAUEgpTCskz5qN/n6w==
X-Gm-Gg: ASbGnctrpSoc3DiTWYKrV2C7vcqwa0d0rh/am1YuoQTLTqEW6IIc9fyA9xN5e81YRnT
	E54brMxgxQKDz39otNnjXlA/rrwfOu5OLzR35w162PK9+6grdDiDgMUwTjkMKsEKdTbT3lJGHWB
	kpFXQjdKX0HqlaouWYNLJ0Q2RK06H7fj4mpFj6ugcCPIFMWdr3sIwTfutgRtjgoEgyFWL2qS2ye
	JvSbTRqAHYYnOvNwVLms67Cf8AbDPrtfvE+jt9AnJklSuwbgRO5n0EwK8uqUglf3MBy2L8y5F/a
	fRYb5BjeiNVsNbmBTSKvs6GmFXHZZXXBeAv7lUiCqo/DzxVbUpf7r4Rt29RJrF81QhiJC3mBNS6
	eL9k2SBuQ2w4U1j1aJznVtQAPvLMz0rUa4IDTy8mmLABsReKr9KbnQp+f
X-Google-Smtp-Source: AGHT+IEG4yhSLyTNdBxKiuvtBwE4rZQlQ/DimrA2w/hkEM8k51lT3L3JRuagbIWAiSUPxOTzdrULBA==
X-Received: by 2002:a17:907:7ba1:b0:ad8:9645:798c with SMTP id a640c23a62f3a-afe29600173mr61408766b.51.1755816202700;
        Thu, 21 Aug 2025 15:43:22 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-afded47933dsm475202366b.65.2025.08.21.15.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 15:43:22 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH 02/15] m4: Stick to C17 standard
Date: Fri, 22 Aug 2025 00:42:56 +0200
Message-ID: <20250821224314.1690103-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250821224314.1690103-1-martin.jansa@gmail.com>
References: <20250821224314.1690103-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 22:43:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222287

From: Khem Raj <raj.khem@gmail.com>

GCC15 imposes C23 by default and 1.4.19 release has gnulib version which
can not be compiled without errors, while new release of m4 is in progress
we might use C17 until then and use GCC15 to compile it

For scarthgap also add it in BUILD_CFLAGS.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/m4/m4-1.4.19.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/m4/m4-1.4.19.inc b/meta/recipes-devtools/m4/m4-1.4.19.inc
index fcc9e58270..4b1f847664 100644
--- a/meta/recipes-devtools/m4/m4-1.4.19.inc
+++ b/meta/recipes-devtools/m4/m4-1.4.19.inc
@@ -30,6 +30,9 @@ EXTRA_OECONF += "--without-libsigsegv-prefix"
 
 EXTRA_OEMAKE += "'infodir=${infodir}'"
 
+CFLAGS += "-std=gnu17"
+BUILD_CFLAGS += "-std=gnu17"
+
 do_compile_ptest() {
 	cd ${B}/tests
 	sed -i '/^buildtest-TESTS: /c buildtest-TESTS: $(TESTS) $(check_LIBRARIES) $(check_PROGRAMS)' Makefile

