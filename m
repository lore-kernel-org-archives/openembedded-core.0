Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25AFAC36004
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 08:16:39 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.2958.1742372195376509211
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 01:16:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j0KaXmXr;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-223594b3c6dso141398825ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 01:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742372195; x=1742976995; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qc6/+KXa5zJlOJ1+/3NMnaKQLW7j5GiiXOdzk+yFN/I=;
        b=j0KaXmXrl0XO0CpHbFAqDm3jOJY6wCBxRKObZMXEe4ky8VP90f3uq8BL7RlU23Nl0R
         52d6SL89hyaVJujl737+MNg37epA8tntJ1NvrFFDY8Q8aDY1SWlt4kH3i8jxw28mzAM+
         jDkVKzkYbbmAdJE9z8QupYQaMM8Kj6wsDwq3Sd+ycz/1XcvuZakDtlkPwaaUYefP9tIX
         TlVC7R6gJpSjgA2IHsluWF+WOjrh2nY2gbbOJvQbLgOJLhNzrBYC+uld+Cq2O2sucE1l
         5wwui2y2nouMma1qlvLtgS5txjqNQ4SkATKVfgUNgaAwrFhWH7yuS3wMhxRZjM7IR0QV
         X3HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742372195; x=1742976995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qc6/+KXa5zJlOJ1+/3NMnaKQLW7j5GiiXOdzk+yFN/I=;
        b=vaCoHA+Zt52hsoCXxstx7J9pbsESl0TDqDIGn7Gd8vr0QHtNqS5yim8h/XqMAIsmI1
         K8Tgn3bFScWGaUrsTkuctSayXaH1y4JfpD7JbOZpOx32kxIZMNlK/3Y7l6J+FM24IGPb
         muFWmQuFcaJW2A+JKQFdlDtToOMh8TDpg8uV+fF47U1a5r6Qm+iyqk3WUZ4JppQ1giNt
         59knJ2rQeIkXhM0TltwNz906dziHAhZecSx/HkrR8r0lsnS1QPpg76sg+euuhAJxsDCq
         1JUI8GqGAYlpTM1LbiCaNX0Pj7PSo8T5WHtV9ZFnDg8Oag1yzBCNJf0hymp1tZLl+Vxf
         hBRg==
X-Gm-Message-State: AOJu0Yymdp5KJ1zn9507aUqYPehk6TyCCEOC45Ce5De/c1NDeD7JwQyk
	9lLN0LFeTySb7vpcDx3cW3XA5UD1n4UmB91PTIG2yC4SD1GiYI4aLzHRKe+s
X-Gm-Gg: ASbGncvoHFr0uFS8gqb6V7p38AYvOdXu3nbiHmaz2inJeI7FrIzdz2ik2gFa4Rm5UYL
	Vakn/3Pn4MH9rWrFryPAO+18wydBY/CoCYtWo4Df0SZTk/NAA87wYpNBF8PGZSG2HnLCQnymiSK
	dQ8t20N2GOlA6mUNXkUlo0fkHj+VXCcfpo61GDihpZ9MLlTWqst/jUzivdjtXMRdGXnukUqYX8H
	Swlv8w5sSOUXAXt6c2t1gmZ0gRpugnRvNeWZn6DhQ/KNCmD3zS82PR5aiB+V+xuNNuWkDgdeomg
	l3nZwap2J619DE39hakkWPr3Kng/2e9HsrF9
X-Google-Smtp-Source: AGHT+IEBkN/CGKtrotJ9OShQ3OOGlnB1ghZ9tofyWtxR3eYqpz2L+gQiDCWQ7+v7dsE+8ojjFEstfQ==
X-Received: by 2002:a05:6a00:c8b:b0:736:491b:536d with SMTP id d2e1a72fcca58-7376d6fa36bmr3114065b3a.20.1742372194546;
        Wed, 19 Mar 2025 01:16:34 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56e9c95c5sm8704323a12.4.2025.03.19.01.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 01:16:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 18/27] expect: Fix build with GCC 15
Date: Wed, 19 Mar 2025 01:15:53 -0700
Message-ID: <20250319081610.3536475-25-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319081610.3536475-1-raj.khem@gmail.com>
References: <20250319081610.3536475-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 08:16:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213291

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

