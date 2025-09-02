Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E899CA1007
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 02:21:44 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.68338.1756779690963983008
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Sep 2025 19:21:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bJdKugEg;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2445826fd9dso58131675ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 19:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756779690; x=1757384490; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tDQG1e6Q3ktm3as9cK2isrWiFPeocLyLl/WFe0b2Rcc=;
        b=bJdKugEg5XjH+OcSOBvGLtsJA+jyRPYYY6WvtTR4AFTdCK/hw5zZ23rmfYBR9ehH0e
         kMjJtcKFUDF4KIqD3EwGtlM68QgWVWn8iZJgbQu4oQXitkdAoFYWKWmnpJgQvolhskKo
         OBPNYWNyG56Uo5AWBHb8HeIp5MQV5Ylfm6RTKdRGL4tsynJN7vNnM/HRLvkzfgvT3Y6n
         0ics1/2OKAKYbdRqY/+2jmjXFwY8YMT1HpgIfJDeX9jWzofEPqFN5zF1wO7nrIhATmWq
         z9s8t3lHDeSXSa5f+5k6pw8wab3KggMKeaga4YLpog36KMejaVOm3+2nlvp2ehvwllRw
         fI9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756779690; x=1757384490;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tDQG1e6Q3ktm3as9cK2isrWiFPeocLyLl/WFe0b2Rcc=;
        b=MtssdN/F8Qa97ZPG1kdetIOxmjMfZ2CrSTO3soK+kDOzTGjS8TzFO3FXCHA8jVnl8V
         l7pTEPQb4BtnQtMaW7iEnlzulCGpFKeij4hhtyDBZhgKZ4aSnqwqpOna84vAVgHmo9fF
         sgonXa+2Qt7WZzb0uFEpUUZlebbQzQN063TYZ55p5hADridRD6hmfirBMvpixvI+JzrG
         i6xRZFnFmrOJX/ON5hothI/m53haSx9sC+h90190JmAgtngihPHLqIpGqHksJ5t/MKtf
         E4cKsVMukBVXtpnclRg+tiaBg1pAmNL+RSKnh3qhmUNx7224hET21B0yGbo+RA9g8CHm
         6niw==
X-Gm-Message-State: AOJu0Yy0OsJ7/yhk/rKxRjWqfgcNs1KWHrbNXCMJuOt7l0J7t8NT163U
	DHmmi0A6S8jxUKZnmE+GwbUG5xOF65VsaREOlprmky5es7l3rKkeFaeCVzwkrv2J
X-Gm-Gg: ASbGncum3BUY1cUlzvwcIrAepaTpL8D1nb8AdZbWDWjotDjVrbrdOLa/qCAU0/oMknQ
	jnAI8qRNYf9xQR1XEljOKg+NrOW5A6qryqKWmUcE2jRuzozyja9Thw8QzROsC73X8fvqq+n6Opl
	oGJPX8iJGcQkyjU/LcB2gn2nctgwusf0yTseX4TsZkg3xeaeXwIQJL5jJoMkwy0xlD8FoU5m6T6
	e2R+7ZZ1D1yz5CkvZ+5PkZkOeRHp6kSpa4/MTpD4SpeaIAGIZObQxaBejrMk9l5wBX9b5KSrOnp
	qR/7KAc4vP3g/1sFs3EVxaKqeYqbqIbTSnLtAXiPHf02hGu1/hJdbKspO7lDFlysZGDNE2RKOdi
	AxeYsY80zKub1UIfLT9iPip0gRULXy1qdugRV+Eg0zmJ6TnMuAJbRo3xstYhSijeIg51pBpyhLI
	GqwU4IYeP4U1fyLXrKguUYKn9gYp0QS6Gyb1UzeHcQRY0NuEaX3uY=
X-Google-Smtp-Source: AGHT+IHlTPfIg/UMAvWfavAi2pPLYpQhMr2NE0mAa/z1Xk3CCzBvj8Pi8bZiyvTTqjXc0FItIiXevA==
X-Received: by 2002:a17:902:e551:b0:240:671c:6341 with SMTP id d9443c01a7336-24944906d9fmr134617555ad.26.1756779690043;
        Mon, 01 Sep 2025 19:21:30 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::c2de])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4f8fa2bbcesm2167160a12.4.2025.09.01.19.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 19:21:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] python: Correct the upstream status in NODEV patch
Date: Mon,  1 Sep 2025 19:21:19 -0700
Message-ID: <20250902022119.3497724-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 02:21:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222699

Ensure it is reflecting correct information and status of patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3/test_posix_nodev_disable.patch           | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3/test_posix_nodev_disable.patch b/meta/recipes-devtools/python/python3/test_posix_nodev_disable.patch
index 85767e1e898..df60302520e 100644
--- a/meta/recipes-devtools/python/python3/test_posix_nodev_disable.patch
+++ b/meta/recipes-devtools/python/python3/test_posix_nodev_disable.patch
@@ -1,7 +1,11 @@
 Disable part of test_posix.test_makedev that depends on the NODEV
 macro being defined (missing on musl).
 
-Upstream-Status: Submitted [https://github.com/python/cpython/pull/31794]
+See https://github.com/python/cpython/pull/31794 where NODEV
+handling is introduced.
+
+Upstream-Status: Inappropriate [Musl-Specific]
+
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 --- a/Lib/test/test_posix.py
 +++ b/Lib/test/test_posix.py

