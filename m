Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.web10.856.1589820579663590736
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2020 09:49:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=dH37Piom;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.65, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f65.google.com with SMTP id k7so82575pjs.5
        for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2020 09:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Dx5yT+5f3bnc/HR1C1JyBM6upkcAmDvLBwk9l8NlFnk=;
        b=dH37PiomM2k9KJ0qdkRSBG4xw3gYdOfpaUFMKOkyFlO/HaE20rZCJ8AOJV6RRGpUNz
         pNp4NqwsjgDSWfYXp4W2g0IjC9seoUn6ZihOkriaK3DfJ58aS7vviCb7M95Z8dbi7a6l
         2LHAujfr6eE+fjqlcjbzmvfoL1QCrYctHk9CFysJIEgX0gMVYkgPw+xi9tIPakyz2LXf
         g1jG0KlPAzcbErqiyCl93x1sAihLJC+kMESGalF0d1Zwx347et6rpZFiP2/SXYwAPfn/
         CVpPaVBvwuEsV+Oh0Ir0AUnWMpmLNYatENYhWYjjT3t7cKZDXFGe268GbLD3fyDL1okp
         qzSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Dx5yT+5f3bnc/HR1C1JyBM6upkcAmDvLBwk9l8NlFnk=;
        b=GYQ98OhxnBye3GcQkZmPaSXx8rJmux5B/Y0pDZooj/40MVWVUnwPkKM2GpjHV5BSgt
         Mw9GvAmuPZd1IJo77vFXhvSOAbM16NvPpba7N6rdQzceHiXDTDU9vruAFT8arhhlLR4n
         CUNEggGaUGPiXZOT44N6sIGkwkLkizBX1ZHADQNBE4eWM+pQr3A1cMSoiZU1MYfurGDN
         8SR36J7/XCUvdYknlizKq23L/E4/BEZD2Adkt/IXvyZXMFnWI92IEdW9/fhPHtPyQ08Y
         bsUnt3zxqq6KYTXRULlmCI8PweOfm/XuKUvysQsuSTEFN917CdHcIqIwKCaLs4V6ud8Y
         l9+Q==
X-Gm-Message-State: AOAM532RZKMVqpJpTIDoOq3vJ5BHGumjl6ARuhzNYtYigss6XhHYkk/4
	A4cm0o00tAk6AFnUkYaBs8n2Jz0o9c7czQ==
X-Google-Smtp-Source: ABdhPJzL33PZscw540QC9tZnjtgTm3qR1mRXAL7PaLGupKA41tXs8eUQecrPB56//BJigeoSRjGmTw==
X-Received: by 2002:a17:90a:f994:: with SMTP id cq20mr344847pjb.52.1589820578711;
        Mon, 18 May 2020 09:49:38 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id g6sm62869pjx.48.2020.05.18.09.49.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 09:49:38 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/19] pypi.bbclass: mind package suffix on version check
Date: Mon, 18 May 2020 06:48:33 -1000
Message-Id: <0603f6d9f2abfa67b99b1bc39228f6aa16a0370d.1589820011.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589820010.git.steve@sakoman.com>
References: <cover.1589820010.git.steve@sakoman.com>

From: Konrad Weihmann <kweihmann@outlook.com>

Some pypi packages do have suffixes like dev, or a0 or b1.
When doing a version check on these, the version will get falsely
identified as major release versions.
Add a terminating slash to rule out those false positives

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/pypi.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/pypi.bbclass b/meta/classes/pypi.bbclass
index e5d7ab3ce1..ffa8aa3ff4 100644
--- a/meta/classes/pypi.bbclass
+++ b/meta/classes/pypi.bbclass
@@ -23,4 +23,4 @@ SRC_URI += "${PYPI_SRC_URI}"
 S = "${WORKDIR}/${PYPI_PACKAGE}-${PV}"
 
 UPSTREAM_CHECK_URI ?= "https://pypi.python.org/pypi/${PYPI_PACKAGE}/"
-UPSTREAM_CHECK_REGEX ?= "/${PYPI_PACKAGE}/(?P<pver>(\d+[\.\-_]*)+)"
+UPSTREAM_CHECK_REGEX ?= "/${PYPI_PACKAGE}/(?P<pver>(\d+[\.\-_]*)+)/"
-- 
2.17.1

