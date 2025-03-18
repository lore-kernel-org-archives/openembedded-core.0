Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64A6BC35FFC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 04:39:11 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.4283.1742272748317369346
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 21:39:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=erqyA6u6;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-226185948ffso32298585ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 21:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742272747; x=1742877547; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qc6/+KXa5zJlOJ1+/3NMnaKQLW7j5GiiXOdzk+yFN/I=;
        b=erqyA6u6HETLEquMBu0YEDY8fPgtNzM1eHMerqdazh28kRiLqffmIlrPnw2KjHhl5z
         WSPYq38RLabsHr5DhI9GI/7HTbNfMhzTaUfJFLXfNb1YS39JxKDn/0MB3Cj6254DQaBb
         nEVUY7Q1RC2b269QisTjunjT3AQRPVbc2Veml3desOHnEoryDEKrG/lqZ5ik/wNwkcGU
         dzIXgo3pVVMvObTjswzXk1FizQDxPajx6a7n2E9ASx3Vxo73v1pdrc3TAp2AM+lARJ3H
         gjWFAy5CSLBXXfWH1ES3MJ8KfWBs3OP99bVeSzDQRNSoZYg8jHKn49iRNJR4h+aeIxkg
         g0zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742272747; x=1742877547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qc6/+KXa5zJlOJ1+/3NMnaKQLW7j5GiiXOdzk+yFN/I=;
        b=JzjwwKYpjZh8phL1VT32wXICcEaj/60EuJ73TCN5xzR0JjVp428GrjQc0F3WIY/tr8
         OHJduZAJH4V5NjZc1kpqunBtmkELM4BFxYW+ljgE5o93p9CTt8SGox/qmQ9zY9nQcbnS
         urTYPD1lFDQuyfSMgfOJV2R2TUbGJrTWEtu4W2jJb4cgkHf8/oL2yrQs1NrgjolGo0gN
         se3tLVi6mIi6/qe+DtfYgzvyao/TEtuP/YQJOOrJaWxX04y6CY2Q4mcl9yFIXxfO5hDC
         bC/X+Lm9w728ORFa+9hsLGoe7AjD4ku0C45EZW7VjdA4QhYqqLHFBbFLaN+NVudd7eLx
         vxFQ==
X-Gm-Message-State: AOJu0YxzbMAwWqD45BkqFuBkWFKM1Uq5IwgJPQTh1k2o9rYfmQjGZa2m
	N1sdonOEDwCg4+BHgTEIaCodtNox9TwtMlH7T9fIQEShteykRHSLgtlGMsXA
X-Gm-Gg: ASbGncu1wYaji13cu20rB0QETxn+KvMU6ae9KvbDQS+rPyVyX+uCUtNpu4YvORlRtyM
	okUa0TqpEFcLfrgyuhyO22XGIV61OwF5nOLfp1S3uYT+8BlqnbodrOPFA1oEi6spIiwPMvNCwiQ
	F/gccu8JJbGzg7k3vqOIQWWFUPIPY9Xt/bmuisD4ZV0eHjTWvzdm7vqNdNXA+0dWZ24tyZwQpmM
	90Pac9yS16LV4Iww/BGAfSoYdiqlp13NvL4zuV3v2z5RQv8PbrNQGd/6J+/h5FjOuZYqqiKVOQN
	wEiaHRWp2KxlhBDK7uGZX0LZSyNLsBwVtQ73
X-Google-Smtp-Source: AGHT+IHOmP8n/dLn9VvgkrcjZG5oszNl+HnX3n9QXuIVrfhfvi1n1mb7GtKMean1zb/T38I5+GGNpw==
X-Received: by 2002:a17:903:1664:b0:225:abd2:5e39 with SMTP id d9443c01a7336-2262c583437mr27333575ad.30.1742272747210;
        Mon, 17 Mar 2025 21:39:07 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::6874])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bbc8c6sm84112375ad.160.2025.03.17.21.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 21:39:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 20/24] expect: Fix build with GCC 15
Date: Mon, 17 Mar 2025 21:38:40 -0700
Message-ID: <20250318043846.2422141-20-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250318043846.2422141-1-raj.khem@gmail.com>
References: <20250318043846.2422141-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 04:39:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213154

Stick to C17 standard as GCC 15 switches to C23

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/expect/expect_5.45.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/expect/expect_5.45.4.bb b/meta/recipes-devtools/expect/expect_5.45.4.bb
index 65f717cc5f7..010e18dd24a 100644
--- a/meta/recipes-devtools/expect/expect_5.45.4.bb
+++ b/meta/recipes-devtools/expect/expect_5.45.4.bb
@@ -42,6 +42,8 @@ S = "${WORKDIR}/${BPN}${PV}"
 
 EXTRA_AUTORECONF += "--exclude=aclocal"
 
+CFLAGS += "-std=gnu17"
+
 do_install:append() {
     mv ${D}${libdir}/expect${PV}/libexpect*.so ${D}${libdir}/
     install -m 0755 ${S}/fixline1 ${D}${libdir}/expect${PV}/

