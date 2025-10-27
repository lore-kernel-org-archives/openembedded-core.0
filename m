Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2249ACCF9E5
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 20:02:54 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web10.1035.1761595366110360664
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Oct 2025 13:02:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=K4ouPFA1;
 spf=pass (domain: baylibre.com, ip: 209.85.160.169, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4e896e91368so58167471cf.0
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 13:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1761595364; x=1762200164; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y2l5UJSlqLpNizToXXyseT0MVGZ2A85E19VShjR1M4k=;
        b=K4ouPFA1cu6C5tSY35C60cAC0CCJiI5Xc72xc8zaJ9NERetE9lIsCQr2L4+U1bwEHq
         qfx9BaE+Gb2H76I9J5pnSLKd5u3Keu0dbuOPaXQCbhdRJW5607cWiVBFmSZI87HebgB2
         r8W0mtshHQiLRJAq1xhBFW7ciMxsh8RI4Uaq824FD/s4RJadP/NKadsjLstAvjCWt3m5
         0Z/S8+aL2b5D7Dpaed2dh7rdYamP+vtR/ESoAn4g6tcpNwHWOc97clnEK3CKb7vn77+r
         RyNTaLXXZX+g8TT0HqysmN4X0RrPcvjKkDM2kPA1d85rZ1yaxdjZ7FSoDi9rXTlkyyLj
         hTIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761595364; x=1762200164;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y2l5UJSlqLpNizToXXyseT0MVGZ2A85E19VShjR1M4k=;
        b=asu06RR8Q8i1Rib+dta8Jagzr7izdizZaXlDj9DLgDhanykY+56duqhXcXdqH+IQuf
         JC2G9sNEllphhRp6mwmrKhOktigeBhbapF2uELjYBgQf4+Ks5fOIaJZhGFnId8q7pPeB
         40G+W+HUWnhkODgOdJPDVa5MKkGJAwbOoNkvyjU1npQD5wJsSbLXSn4UN8j/DPtlKui8
         RfKBJK6wZQnJZGvoMo+6YaisKUiIM6Q8ovnr5kxwZs2GoOlFq8OwzUiHWy4wQKjsZDag
         c0mpNRut/aC3bh4VsektOjhTmr4E6yod3cG8uKl4BrQrWmN14bbEygE/doGmI38hRZnI
         vkhw==
X-Gm-Message-State: AOJu0YycCC78IWbnoKis0KIJZUUWtJSoVYgOrrUF/KJNcAjzq+N3gi9j
	QxOvB625Vx7AbAq731VcnukVn8PN/fwFEZiXIHbVSbgRO0l1tHXxFaGKYlwyoknm47g/Ld8lqrm
	8hECXOOA=
X-Gm-Gg: ASbGncsg9ujb7LP4eYwxpxnwtm8ZWOyMzK4niN6D6Rye71hlbIFvb1AgIkSTKj1yoi9
	dVfBUu/FiIlTsP8mAUiTQtH2dJkc3m4BfsSSW0NQOAxSZvR6rEM/HqdU0mSyVN8cYOtXlO6QoeP
	yrH6kfxoeQ5GgLdYYlyVyY1ktNY86gs93KI9KXvd3CqZbz5FtJWVXX3xyViPDQgiRvwqhfsyhpd
	wm2pKqhEx7jEwUKaGDywwx1wBsvPkjlTzwQewcS0mcacVczn3yppz+Iym1s3437Dh4OBqkUxxHJ
	2i1Hx1sX4wzhg3JezQOiP9cFrJla0LVS8Qb115r6HkXCfpLRdrKs+hBlY9to1jl+k+3uKKwshPN
	Q2yUpJu1OUqKa4CPSaGPDF2tJqCO7i6nd4HMQYMUYS0TcQGBEXz9jRWQmTNI2U2wxkK1IAQDJyC
	df272EIF/qdts3HLw=
X-Google-Smtp-Source: AGHT+IGeE1/Xrnb/8ffe3zQebUQEGCTmgMnFbx/NR4A9wSN3fZ/Ic0Qy3JJHvvMH5K8NaV9AZmzhjA==
X-Received: by 2002:a05:622a:a6d9:b0:4eb:9c80:f6a0 with SMTP id d75a77b69052e-4ed075ae5c9mr16046931cf.52.1761595362368;
        Mon, 27 Oct 2025 13:02:42 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:8598:5636:16ad:2a8f])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4eba37b42c9sm57281051cf.1.2025.10.27.13.02.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 13:02:41 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/2] python3-hypothesis: upgrade 6.139.2 -> 6.142.2
Date: Mon, 27 Oct 2025 16:02:37 -0400
Message-ID: <20251027200238.751241-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 20:02:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225354

Changelog: https://hypothesis.readthedocs.io/en/latest/changelog.html

Reproducibility OK.

ptests OK:

|============================================================================
|Testsuite summary
|# TOTAL: 5
|# PASS: 5
|# SKIP: 0
|# XFAIL: 0
|# FAIL: 0
|# XPASS: 0
|# ERROR: 0
|DURATION: 0
|END: /usr/lib/python3-hypothesis/ptest
|2025-10-21T17:36
|STOP: ptest-runner
|TOTAL: 1 FAIL: 0

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...hon3-hypothesis_6.139.2.bb => python3-hypothesis_6.142.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.139.2.bb => python3-hypothesis_6.142.2.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.139.2.bb b/meta/recipes-devtools/python/python3-hypothesis_6.142.2.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.139.2.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.142.2.bb
index b03cc22fac..5ba7c66577 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.139.2.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.142.2.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "2dc2ff36ea977a9cb7fb68f24a5dbf5d673b88a2e502212676eafe09b699f511"
+SRC_URI[sha256sum] = "c4204a2ce327e45fbaf83a2b58142a285135698dc1d08e368ae9901f06b49e64"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.51.0


