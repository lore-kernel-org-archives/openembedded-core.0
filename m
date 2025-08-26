Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BDE7CA0FE7
	for <webhook@archiver.kernel.org>; Tue, 26 Aug 2025 13:41:26 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.64603.1756215685445534769
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Aug 2025 06:41:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=0eKITbnw;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-771e15ce64eso1691647b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 06:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756215685; x=1756820485; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6sEwHpeuQLaHMLyScggJfxf6rmceQ85dS6jx4mEgkuA=;
        b=0eKITbnwECv9eeQZCBTxVVfiZO0ukgkpP+i7hhsWAE8wJgEsnRXpNLAqY8c624TKCz
         FvT3Jcct8pBznbgcsqfaJsF2xDNJG/tWJRrPKoaox4ZvbtATWDeZ3eXeu6A/iQzqxH/m
         H/K31w9fzLB1MKPnC1qofWcUXj0JhLpa2bnV+/S6O3qv7AhkbFVH/6g5CKelpDS4714s
         i5cSMbj1JjBzygiwR46E+2/jV3Q0bBo4AbAIxrObNqLPSVmWu1ypQRaWNSRXshWaQy9F
         n/LayP7yZeh4YKMBh5AeV7nsKAoBGXru9s+npCdeVwyPz9Z3ZwDv7uvn7u/cFzU/lwTc
         SPXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756215685; x=1756820485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6sEwHpeuQLaHMLyScggJfxf6rmceQ85dS6jx4mEgkuA=;
        b=WC5b2dODebBdGLb4M0dUG2HW+FHJP1k0lk6uIMbt9ReW10R2iwd90YxJT3steiqlnA
         XQTR/+fAsOVQrMteTEJhLnaHQFNpZ+xu2eriypeYO5rUUdYH+/lvyTyg1K6rX3yo5pXq
         B7U5nkwroEFtsJKlsytI82074uiPrGbpNcTq+xBP/S8R6K5TI2xdXlC+xMmtI4DZXpYm
         HO2Rrsq+PqnkNsu3ijt2DgO3nB/m93Iu783V8CnBGrKiNINzvpJLuMWFaRHS6QnYiOeo
         gNDH5SyWG1gixmiH1CsD9shuR0iEjDO+vAV4u/8q3lp8lRwryw+/mUkSTTsvSdlNVQmN
         ARYA==
X-Gm-Message-State: AOJu0Ywsd9/tbvwh3yCDIEYWR8jeagaq1rwNM6X+32PVKkp+HgIASSeI
	Y8ttSM3x/aLLWo9aMEiLmHOfqa14x6H2hfoxlveHfoe1i+gQNSSaccCXj+DydmYDs6dAaeKDNO7
	H2x4s
X-Gm-Gg: ASbGnctebiX45XEadG6OKXI1aVwSknPIH66LSYGfPw4pumxQus4bPPo6crSXy6T4IYm
	m6Aerf0XKHbWuIq8ok1EFRnCBmkvGahMx+flR1EP1+5HroBd+SNGQBz2fhlv8SlfCTeZ+iqePZd
	FF7htKa5rHeRZuYUn24A/7h6WOc6jzAnpiD3qOU1rjGtTKz2Fxx2Ot3hjheae1QT5DtODQ2EnaN
	vy55HYEtBFhUJbk8JFrlQfdbJ2yK/mu1SDdYsHvI1L2iVwH7DKu/xIsvjyfXeEPdkyJrFSUjKLr
	u9vanB25SRw9l8mVAz+e5UiT8a+7XsMtGFhom3MB40oGH2KIJiEEWFUdWFgSuXoPpU/zkuy7Zn7
	1Rpr2tsrzlhJ5BduwVdiCW37W
X-Google-Smtp-Source: AGHT+IF9L5bPfUKBBj6nFGDS6d70zx9jye4y6h9cplhxVXP6ZCQK4mP0wH0a5/JYn925VMxKJsz6mQ==
X-Received: by 2002:a17:903:1988:b0:234:f4da:7eeb with SMTP id d9443c01a7336-2462edd7d61mr217930665ad.7.1756215684578;
        Tue, 26 Aug 2025 06:41:24 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:1687:ddce:d4c7:f578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3274191c389sm1007414a91.4.2025.08.26.06.41.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 06:41:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 10/19] gstreamer1.0-plugins-bad: upgrade 1.24.12 -> 1.24.13
Date: Tue, 26 Aug 2025 06:40:44 -0700
Message-ID: <b819ceba86919df9b99533825dff2efe14164d74.1756215509.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756215509.git.steve@sakoman.com>
References: <cover.1756215509.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 13:41:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222450

From: Archana Polampalli <archana.polampalli@windriver.com>

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ugins-bad_1.24.12.bb => gstreamer1.0-plugins-bad_1.24.13.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.24.12.bb => gstreamer1.0-plugins-bad_1.24.13.bb} (98%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.13.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.12.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.13.bb
index 91d9150359..b66141ca0d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.13.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0002-avoid-including-sys-poll.h-directly.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            "
-SRC_URI[sha256sum] = "3d386af3d1dbd1a06c74a6251250c269b481e703f0e3255ba89ef6c1e063afea"
+SRC_URI[sha256sum] = "3cbe7d7cec5db958781f7ab66caa5afd67b133c223fde71f0403277731f0cc4d"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
-- 
2.43.0


